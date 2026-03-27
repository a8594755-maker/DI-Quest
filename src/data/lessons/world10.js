const world10 = `
# World 10：系統架構拓撲

> **目標：** 理解 Decision Intelligence 的四層架構、各層職責、請求流向
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 2-3 小時

---

## 10-1：四層架構概覽

### Runtime Topology

Decision Intelligence 的系統架構分為四層：

\`\`\`
使用者 → React Frontend → src/router.jsx
                       ↓
                     src/services/*
                       ↓
      ┌────────────────┼────────────────┐
      ↓                ↓                ↓
  Supabase        Supabase Edge     FastAPI ML API
  (Auth/Postgres/ Functions (ai-    (Forecast/Plan/
   Storage)       proxy/bom-        Async Jobs)
                  explosion/             ↓
                  sync-*)         Registry/Governance
                  ↓
              Gemini/DeepSeek
\`\`\`

### 各層職責

| 層 | 職責 | 主要路徑 |
|---|---|---|
| Frontend Shell | 路由、佈局、頁面組合 | \`src/router.jsx\`、\`src/layouts/\`、\`src/pages/\` |
| View Workflows | 計畫、預測、風險、孿生、場景 UX | \`src/views/\`、\`src/components/\` |
| Frontend Services | API 適配器、編排、客戶端合約 | \`src/services/\`（31 個子目錄） |
| Supabase | Auth、Storage、共享營運數據 | \`supabase/\`、\`sql/migrations/\` |
| Edge Functions | AI 代理、BOM 展開、同步作業 | \`supabase/functions/\`（12 個函數） |
| ML API | 預測、規劃、非同步作業、註冊表、guardrails | \`src/ml/api/main.py\`、\`src/ml/\` |
| Quality Gates | 回歸測試、CI、發佈檢查 | \`tests/\`、\`.github/workflows/\` |

### 為什麼要分層？

1. **安全性**：AI provider secrets 絕對不能放在瀏覽器端
2. **運算分離**：ML 訓練和求解需要 Python 環境，不能在瀏覽器跑
3. **可擴展性**：前端、後端、ML API 可以獨立擴展
4. **職責分離**：每一層做自己最擅長的事

> 💡 **Framework Tip：** 評估系統架構時問三個問題：(1) 為什麼不能合在一起？(2) 每層存在理由是什麼？(3) 拿掉某層會怎樣？

---

## 10-2：Frontend 服務層

### 31 個 Service 目錄

前端的 \`src/services/\` 下有 31 個子目錄：

**核心服務**
- \`agent-core/\` — Agent 執行邏輯
- \`aiEmployee/\` — Worker 管理
- \`chat/\` — 聊天操作
- \`canvas/\` — Artifact 管理
- \`tasks/\` — 任務管理

**領域服務**
- \`forecast/\` — 預測操作
- \`planning/\` — 規劃執行
- \`risk/\` — 風險評估
- \`data-prep/\` — 數據匯入與 profiling

**基礎設施服務**
- \`supabase/\` — 資料庫與認證
- \`ai-infra/\` — AI 基礎設施
- \`governance/\` — 治理
- \`sap-erp/\` — ERP 適配器

### Service 層的角色

Service 層是前端和後端之間的橋樑：
- 封裝 API 呼叫細節
- 處理請求/回應轉換
- 管理客戶端狀態
- 提供 type-safe 的介面給 components 使用

> 💡 **Framework Tip：** Service 層的設計品質直接影響可維護性。好的 service 層讓 component 不需要知道 API 細節。

---

## 10-3：Supabase 層

### Supabase 在系統中的角色

| 功能 | 說明 |
|------|------|
| **Auth** | 使用者認證與授權（JWT） |
| **PostgreSQL** | 主資料庫，儲存所有營運數據 |
| **Storage** | 檔案儲存（上傳的工作簿等） |
| **Edge Functions** | 伺服器端函數（12 個） |
| **RPC** | 遠程程序呼叫（如 \`ingest_rpc\`） |

### 12 個 Edge Functions

| 函數 | 用途 |
|------|------|
| \`ai-proxy\` | **核心** — AI 模型閘道，集中管理 Gemini/DeepSeek 呼叫 |
| \`bom-explosion\` | BOM（物料清單）展開計算 |
| \`sync-materials-from-sap\` | SAP 物料同步 |
| \`sync-demand-fg-from-sap\` | SAP 需求同步 |
| \`sync-inventory-from-sap\` | SAP 庫存同步 |
| \`sync-bom-from-sap\` | SAP BOM 同步 |
| \`sync-po-open-lines-from-sap\` | SAP 採購單同步 |
| \`ai-employee-scheduler\` | Worker 任務排程 |
| \`etl-scheduler\` | ETL 編排 |
| \`logic-test-run\` | 測試執行 |
| \`report-api\` | 報告生成 |

### 為什麼 ai-proxy 很重要？

\`ai-proxy\` 是所有 AI 呼叫的中央閘道：
- 瀏覽器永遠不需要原始的 Gemini/DeepSeek API keys
- 所有 AI 呼叫經過伺服器端，可以被記錄和控制
- 可以在一個地方管理模型切換、費率限制、錯誤處理

### 72+ SQL Migrations

資料庫 schema 透過 migration 管理，核心順序：
1. \`supabase-setup.sql\` — 初始 schema
2. \`supplier_kpi_schema.sql\` — 供應商 KPI
3. \`import_batches_schema.sql\` — 匯入追蹤
4. \`upload_mappings_schema.sql\` — 數據映射
5. \`step1_supply_inventory_financials_schema.sql\` — 庫存與財務
6. \`bom_forecast_schema.sql\` — BOM 預測
7. \`ingest_rpc.sql\` — 數據攝取 RPC
8. \`release_ingest_rpc_permissions.sql\` — 權限

> 💡 **Framework Tip：** Migration 順序很重要。每個 migration 可能依賴前一個的 table 或 function。順序錯了，系統就起不來。

---

## 10-4：ML API 入口

### FastAPI 主入口

ML API 的入口是 \`src/ml/api/main.py\`，一個 FastAPI 應用程式。

**主要匯入的模組：**

| 類別 | 模組 |
|------|------|
| ML 訓練 | ProphetTrainer、LightGBMTrainer、ChronosTrainer |
| ML 工廠 | ForecasterFactory、ModelType |
| ERP 連接 | ERPConnector、SupabaseRESTClient |
| 治理 | ActorContext、GovernanceAction、GovernanceStore |
| 非同步 | AsyncRunService、AsyncRunConfig、AsyncRunWorker |
| 遙測 | SolverHealthThresholds、solver telemetry stores |
| 匯出 | excel_export_router、report_generator_router |
| 註冊表 | registry_router |

**中介層（Middleware）：**
- CORS — 跨域請求控制
- JWT Auth — 認證
- Rate Limiting — 速率限制
- Tenant ID — 多租戶

**為什麼 ML 要獨立成 API？**
1. Python 生態系（Prophet、LightGBM、PyTorch、OR-Tools）無法在瀏覽器跑
2. ML 訓練和求解是 CPU/記憶體密集型操作
3. 需要獨立的部署和擴展策略
4. 需要自己的健康檢查和遙測

> 💡 **Framework Tip：** 看到獨立 ML API 通常意味著：(1) 計算需求超過一般 web server (2) 部署週期不同 (3) 可能需要 GPU 或大記憶體。

---

## 10-5：請求流向追蹤

### 三條主要請求流

**Flow 1：AI 輔助規劃**
\`\`\`
Browser → frontend workflow → ai-proxy / ML API
       → Supabase + external model provider
       → artifact + UI cards
\`\`\`
- 瀏覽器不需要原始 AI keys
- AI 呼叫集中在 \`supabase/functions/ai-proxy/\`

**Flow 2：數據攝取與營運寫入**
\`\`\`
Browser → upload/mapping services
       → Supabase RPC 或 tables
       → import history / audit trail
\`\`\`

**Flow 3：預測與最佳化**
\`\`\`
Frontend → ML API → forecasting trainers / solver
                 → registry + telemetry
                 → result cards
\`\`\`
- API 入口：\`src/ml/api/main.py\`
- Docker 化部署：\`Dockerfile\`

### 為什麼要區分三條流？

不同操作有不同的延遲、安全、和可靠性需求：
- AI 呼叫需要 server-side secrets → Flow 1
- 數據寫入需要交易性和審計 → Flow 2
- ML 計算需要 Python runtime → Flow 3

> 💡 **Framework Tip：** 追蹤請求流向是理解系統的最有效方法。從使用者動作開始，追蹤到最終的數據儲存或回應。

---

## 10-6（Boss）：畫出架構

### 情境

面試官問你：

> 「你能畫出 Decision Intelligence 的系統架構嗎？不用很精美，白板等級就好。然後跟我解釋每一層的職責，每層舉 2 個具體的檔案當例子。」

### 你的任務

1. 描述整體架構拓撲（可以用文字描述，假設在白板上畫）
2. 說明每一層的職責
3. 每層舉出 2 個具體的檔案，解釋它們的作用
4. 說明三條主要請求流向中的至少一條

### 評估標準

- 是否正確描述四層架構
- 是否能說出具體檔案（不只是抽象概念）
- 是否理解為什麼要分層
- 是否能追蹤至少一條完整的請求流向
`

export default world10
