const world11 = `
# World 11：部署與執行環境

> **目標：** 理解 Decision Intelligence 的部署拓撲、Docker、環境變數、健康檢查
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 2-3 小時

---

## 11-1：部署拓撲

### 三層部署架構

| 層 | 技術 | 部署方式 |
|---|---|---|
| Frontend | React + Vite | 靜態檔案 hosting（Netlify、Vercel、S3 + CloudFront） |
| Backend | Supabase | 託管服務（Auth、Postgres、Storage、Edge Functions） |
| ML API | FastAPI + Python 3.12 | 容器化部署（Docker → Railway 或其他容器平台） |

### 為什麼要分開部署？

1. **前端**是靜態檔案，只需要 CDN，不需要 server
2. **Supabase** 是託管服務，由 Supabase 維護基礎設施
3. **ML API** 需要 Python runtime、大量記憶體（Prophet、OR-Tools），需要獨立的容器

### 部署步驟概覽

1. 建立 Supabase 專案 → 套用 SQL migrations
2. 部署 Edge Functions → 設定 server-side secrets
3. Build 前端 → 部署靜態檔案
4. Build ML API Docker image → 部署容器
5. 驗證所有服務連通

> 💡 **Framework Tip：** 部署順序很重要。後端和資料庫要先就位，前端才能連上。

---

## 11-2：Dockerfile 解析

### Multi-Stage Build

Decision Intelligence 的 Dockerfile 使用 **multi-stage build**，分為兩個階段：

**Stage 1 — Builder（建構階段）**
\`\`\`dockerfile
FROM python:3.12-slim AS builder
# 安裝系統依賴：gcc, g++, libgomp1（Prophet/OR-Tools 需要）
# 複製 requirements-ml.txt 和 constraints-deploy.txt
# 過濾掉 torch/transformers/accelerate（減少 image 大小）
# pip install 安裝依賴
\`\`\`

**Stage 2 — Runtime（執行階段）**
\`\`\`dockerfile
FROM python:3.12-slim
# 只安裝 libgomp1（最小執行依賴）
# 從 builder 複製已安裝的 packages
# 複製 src/ 和 run_ml_api.py
\`\`\`

### 為什麼用 Multi-Stage？

- Builder 階段有 gcc 等編譯工具，但最終 image 不需要
- 最終 image 更小、更安全（攻擊面更小）
- 依賴安裝和程式碼複製分開，利用 Docker layer caching

### Chronos 排除

Dockerfile 刻意過濾掉 \`torch\`、\`transformers\`、\`accelerate\`：
- Chronos 是重量級時序預測模型，需要 PyTorch
- 預設部署選擇 **lean runtime**（精簡執行環境）
- 透過 \`DI_CHRONOS_ENABLED=false\` 明確關閉

### 啟動命令

\`\`\`bash
gunicorn ml.api.main:app \\
  --worker-class uvicorn.workers.UvicornWorker \\
  --bind 0.0.0.0:\${PORT:-8000} \\
  --workers \${WEB_CONCURRENCY:-2} \\
  --timeout 120 \\
  --keep-alive 30
\`\`\`

- **gunicorn** 是 production-grade 的 ASGI server
- **uvicorn worker** 處理非同步請求
- 預設 2 個 worker，timeout 120 秒（ML 計算需要較長時間）

> 💡 **Framework Tip：** 看 Dockerfile 注意三件事：(1) base image 是什麼 (2) 哪些東西被刻意排除 (3) 啟動命令用了什麼 server。

---

## 11-3：環境變數與 Secrets

### 三類環境變數

**1. 前端環境變數（\`.env.local\`）**
\`\`\`
VITE_SUPABASE_URL=https://xxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGci...
VITE_ML_API_URL=http://127.0.0.1:8000
\`\`\`
- 以 \`VITE_\` 開頭，會被打包進前端 bundle
- 只能放 **公開** 的資訊
- **絕對不能放 secret keys！**

**2. Edge Function Secrets（\`supabase secrets set\`）**
\`\`\`
GEMINI_API_KEY=...
DEEPSEEK_API_KEY=...
FRONTEND_ORIGIN=https://your-domain.com
\`\`\`
- 透過 \`supabase secrets set\` 設定，不在 .env.local 裡
- 這些是 AI provider 的 API keys，必須在 server-side

**3. ML API 環境變數**
\`\`\`
DI_DATABASE_URL=postgresql://...
ALLOWED_ORIGINS=http://localhost:5173
DI_SOLVER_ENGINE=ortools
DI_CHRONOS_ENABLED=false
\`\`\`

### 為什麼 secrets 不能放 browser？

- 前端 JavaScript 是完全公開的
- \`VITE_\` 前綴的變數會被字面上替換進打包後的 JS 檔案
- 任何人打開瀏覽器 DevTools 就能看到
- 這就是為什麼需要 \`ai-proxy\` Edge Function 做中間層

### Execution Guardrails

\`\`\`
DI_MAX_ROWS_PER_SHEET=2000000
DI_MAX_SKUS=5000
DI_SOLVER_MAX_SECONDS=90
DI_BOM_MAX_EDGES=200000
DI_FORECAST_MAX_SERIES=5000
\`\`\`

這些控制系統的操作邊界。沒有這些限制，一個巨大的上傳可能讓系統當機。

> 💡 **Framework Tip：** 環境變數管理核心：(1) Secrets 只放 server-side (2) 公開配置用 VITE_ 前綴 (3) 操作限制用環境變數而非 hard-code。

---

## 11-4：健康檢查機制

### 四層健康檢查

**1. Shell Script — \`scripts/healthcheck.sh\`**
- 人工或 CI 用的快速檢查
- 支援 \`--json\` 輸出（給 CI 用）

**2. ML API — \`/healthz\` 和 \`/readyz\`**
- \`/healthz\` — Liveness probe：「程式還活著嗎？」
- \`/readyz\` — Readiness probe：「準備好接受流量了嗎？」
- 這是 Kubernetes 標準的健康檢查 endpoints

**3. Docker HEALTHCHECK**
\`\`\`dockerfile
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3
  CMD curl -f http://localhost:8000/health/live || exit 1
\`\`\`
- 每 30 秒檢查一次
- 給 60 秒啟動寬限期（ML 模型載入需要時間）
- 連續失敗 3 次才判定不健康

**4. Frontend — \`systemHealthService.js\`**
- 檢查 Supabase、ML API、AI Proxy、DB 連通性
- 追蹤延遲
- 在 Settings 頁面顯示健康狀態

### Liveness vs Readiness

| 探針 | 失敗時的動作 | 用途 |
|------|-------------|------|
| Liveness | 重啟容器 | 偵測死鎖或完全崩潰 |
| Readiness | 暫時不接流量但不重啟 | 偵測暫時無法服務（如正在載入模型） |

> 💡 **Framework Tip：** Liveness 失敗 = 重啟；Readiness 失敗 = 暫停流量。這是 Kubernetes 的標準模式。

---

## 11-5：啟動與驗證流程

### 單一命令啟動

\`\`\`bash
./scripts/start.sh          # 完整啟動
./scripts/start.sh --check  # 只做 preflight 檢查
./scripts/start.sh --backend # 只啟動後端
\`\`\`

### Preflight 檢查

啟動前會檢查：
- 環境變數是否都設定了
- 資料庫連線是否正常
- Migration 是否已套用
- 各服務的 port 是否可用

### Migration 順序

\`\`\`
1. supabase-setup.sql          ← 基礎 schema
2. supplier_kpi_schema.sql     ← 供應商 KPI
3. import_batches_schema.sql   ← 匯入追蹤
4. upload_mappings_schema.sql  ← 數據映射
5. step1_supply_inventory_financials_schema.sql
6. bom_forecast_schema.sql
7. ingest_rpc.sql              ← RPC 函數
8. release_ingest_rpc_permissions.sql ← 權限
\`\`\`

### 驗證清單

- 前端能載入並登入
- ML API 的 \`/health/live\` 回傳 200
- Settings 頁面沒有 missing secret 警告
- 用 sample data 做一次完整上傳測試
- \`npm run build\` 和 \`npm run test:regression\` 通過

> 💡 **Framework Tip：** 成熟系統有三個啟動階段：(1) Preflight check (2) Startup (3) Verification。跳過任何一個都可能出問題。

---

## 11-6（Boss）：部署計畫

### 情境

你的團隊要建立一個新的 staging 環境來做 QA 測試。你被要求寫一份 deployment runbook。

### 你的任務

寫一份逐步的部署計畫，包含：
1. **Supabase 設定**（建專案、跑 migration、順序）
2. **Edge Function 部署**（哪些要部署、secrets 怎麼設定）
3. **前端部署**（build、env vars、hosting）
4. **ML API 部署**（Docker build、env vars、health probe）
5. **驗證步驟**（怎麼確認一切正常）

### 評估標準

- 是否有正確的 migration 順序
- 是否知道 secrets 要用 \`supabase secrets set\`
- 是否有健康檢查的驗證步驟
- 是否考慮了部署順序（先後端再前端）
`

export default world11
