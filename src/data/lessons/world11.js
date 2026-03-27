const world11 = `
# World 11：部署與執行環境

> **目標：** 理解 DI 系統怎麼從你的電腦搬到全世界都能用的地方，Docker 在幹嘛，環境變數怎麼管
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 11-1：部署拓撲 — 把軟體搬到線上

### 什麼是「部署」？

你在自己的電腦上寫好了程式，\`npm run dev\` 一跑就能看到畫面。但這只有你自己看得到。**部署就是把你的軟體搬到別人也能用的地方。**

DI 系統有三個部分要搬，每個部分搬法不一樣：

### 三個部分，三種搬法

**1. 前端（React）→ 搬到 CDN**

前端經過 \`npm run build\` 之後，會產出一堆靜態檔案（HTML、CSS、JavaScript）。這些檔案不需要 server 來「跑」，只需要一個地方來「放」。

CDN（Content Delivery Network）就是這個地方。想像你開了一家連鎖便利商店，每個城市都有分店，顧客去最近的分店買東西就好。CDN 就是把你的網站檔案複製到全世界各地的伺服器上，使用者連到最近的那台，所以打開網頁很快。

常見的 CDN：Netlify、Vercel、AWS S3 + CloudFront。

**2. Supabase → 不用自己搬**

Supabase 是託管服務 — 你申請一個帳號，它幫你把資料庫、認證、Storage 都架好。你要做的只是：
- 設定好 Supabase 專案
- 跑 SQL migration（把你的資料表結構建好）
- 部署 Edge Functions
- 設定 secrets（API keys）

**3. ML API → 搬到 Docker 容器**

ML API 是 Python 程式，它需要一個完整的 Python 環境才能跑（Prophet、OR-Tools 等套件）。你不能像前端一樣放到 CDN。

**Docker** 就是解法。想像你要搬家到另一個國家，你不是一件一件行李打包（可能漏東西），而是把整個房間裝進一個**貨櫃**（container）— 傢俱、電器、衣服、鍋碗瓢盆全部裝好。到了新地方，打開貨櫃就能住。

Docker 容器就是軟體的貨櫃：Python 環境、所有套件、你的程式碼，全部打包在一起。不管搬到哪台伺服器上，打開就能跑。

### 部署順序很重要

\`\`\`
1. Supabase → 先建好資料庫和 Auth（地基）
2. Edge Functions → 部署到 Supabase（安裝水電）
3. ML API → 部署 Docker 容器（搬進主廚和廚房設備）
4. 前端 → 部署到 CDN（開門營業）
\`\`\`

為什麼這個順序？因為前端啟動時會去連 Supabase 和 ML API。如果它們還沒準備好，使用者打開網頁就會看到一堆錯誤。**先把後端架好，最後才開放前端**，就像裝修完才邀請客人來。

> 💡 **面試官可能會追問：**
> 「為什麼不用 Kubernetes？」
> → 對 v1 產品來說，K8s 的複雜度太高。Docker + 簡單的容器平台（Railway、Cloud Run）就足夠。等到需要管理多個 ML API 實例、做自動擴展的時候，再考慮 K8s。這是「不要過度工程」的例子。

---

## 11-2：Dockerfile — 打包行李的藝術

### Multi-Stage Build — 先攤開再精簡

DI 的 Dockerfile 用了一個叫 **multi-stage build** 的技巧。用打包行李來比喻：

**階段 1：Builder（攤開所有東西）**

你把所有可能需要的東西全部攤在床上：
- Python 3.12（基本環境）
- gcc、g++（編譯工具 — 有些 Python 套件安裝時需要編譯 C 程式碼）
- libgomp1（Prophet 和 OR-Tools 需要的平行計算函式庫）
- requirements-ml.txt 裡面列的所有 Python 套件

然後安裝所有套件。安裝完之後，gcc 和 g++ 就不需要了 — 它們是「工具」，不是「行李」。

**有一個重要的過濾步驟：**

安裝套件的時候，Dockerfile 會刻意跳過三個很大的套件：\`torch\`、\`transformers\`、\`accelerate\`。這三個是 Chronos（零樣本預測模型）需要的，加起來超過 2 GB。預設不需要它們，所以不打包。

**階段 2：Runtime（只帶必要的）**

從一個乾淨的 Python 3.12 開始，只帶上：
- libgomp1（執行時需要的）
- 階段 1 已經安裝好的 Python 套件（直接複製過來）
- 你的原始碼（\`src/\` 和 \`run_ml_api.py\`）

最終的 Docker image 大約 800 MB，而不是含 Chronos 的 3-4 GB。

### 為什麼要這樣？

| 方面 | 不用 Multi-Stage | 用 Multi-Stage |
|------|-----------------|----------------|
| Image 大小 | ~2 GB（含編譯工具） | ~800 MB（只含執行必要的） |
| 安全性 | 有 gcc 等攻擊面 | 攻擊面最小 |
| 部署速度 | 慢（要傳更大的 image） | 快 |

### 啟動命令

Docker 容器啟動後跑的是：

\`\`\`
gunicorn ml.api.main:app
  --worker-class uvicorn.workers.UvicornWorker
  --bind 0.0.0.0:8000
  --workers 2
  --timeout 120
  --keep-alive 30
\`\`\`

白話解釋：
- **gunicorn** — 一個正式環境用的 Python web server（開發時用 uvicorn 就好，正式環境需要更穩定的）
- **workers 2** — 開兩個工人程序同時處理請求（像餐廳有兩個廚師）
- **timeout 120** — 一個請求最多等 120 秒（ML 計算有時候要跑很久）
- **keep-alive 30** — 連線保持 30 秒（避免每次都重新建立連線）

> 💡 **面試官可能會追問：**
> 「為什麼 timeout 設 120 秒而不是預設的 30 秒？」
> → 因為 ML 計算（尤其是 OR-Tools 求解）可能需要 90 秒。如果 timeout 設 30 秒，求解還沒完成連線就斷了，使用者會看到「504 Gateway Timeout」。120 秒留了 30 秒的餘量。

---

## 11-3：環境變數 — 鑰匙管理

### 三類環境變數，三種安全等級

DI 系統有三種環境變數，安全等級完全不同：

**1. 前端環境變數（門牌號碼 — 大家都看得到）**

以 \`VITE_\` 開頭的變數會被 Vite 打包進前端的 JavaScript 裡。**任何人**打開瀏覽器 DevTools 都看得到。所以只能放**公開資訊**：

\`\`\`
VITE_SUPABASE_URL=https://xxx.supabase.co     # Supabase 的地址（公開的）
VITE_SUPABASE_ANON_KEY=eyJhbGci...             # 匿名 key（搭配 RLS 是安全的）
VITE_ML_API_URL=http://127.0.0.1:8000         # ML API 的地址
\`\`\`

**2. Edge Function Secrets（保險箱密碼 — 只有伺服器知道）**

AI 模型的 API key 透過 \`supabase secrets set\` 存放在 Supabase 的安全存儲裡。只有 Edge Function 在執行時才能讀取，瀏覽器永遠碰不到：

\`\`\`
GEMINI_API_KEY=sk-...
DEEPSEEK_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-...
OPENAI_API_KEY=sk-...
KIMI_API_KEY=sk-...
\`\`\`

為什麼不能放在 \`.env.local\`？因為 \`.env.local\` 裡以 \`VITE_\` 開頭的東西會被打包進前端。就算不以 \`VITE_\` 開頭，\`.env.local\` 也是給前端用的。API key 必須只存在伺服器端。

**3. ML API 環境變數（廚房的設定 — 只有後端知道）**

ML API 的 Docker 容器有自己的環境變數：

\`\`\`
DI_DATABASE_URL=postgresql://...       # 資料庫連線
DI_SOLVER_ENGINE=ortools               # 用哪個求解器
DI_CHRONOS_ENABLED=false               # 關閉重量級模型
ALLOWED_ORIGINS=http://localhost:5173   # 允許的前端地址
\`\`\`

### Execution Guardrails — 安全閥

\`\`\`
DI_MAX_ROWS_PER_SHEET=2000000   # 每張表最多 200 萬筆
DI_MAX_SKUS=5000                 # 最多 5,000 個 SKU
DI_SOLVER_MAX_SECONDS=90         # 求解最多 90 秒
DI_BOM_MAX_EDGES=200000          # BOM 最多 20 萬條邊
DI_FORECAST_MAX_SERIES=5000      # 預測最多 5,000 個序列
\`\`\`

這些是用環境變數控制的**安全閥**。為什麼不寫死在程式碼裡？因為不同的部署環境可能需要不同的上限。開發環境設小一點（跑得快），正式環境可以設大一點。

> 💡 **面試官可能會追問：**
> 「如果有人不小心把 GEMINI_API_KEY 提交到 Git，怎麼辦？」
> → 第一步：立刻在 Google Cloud Console 撤銷這個 key、產生一個新的。第二步：用 \`git filter-branch\` 或 BFG Repo-Cleaner 從 Git 歷史裡刪除它。只是刪掉檔案再 commit 沒用，Git 歷史裡還是有。

---

## 11-4：健康檢查 — 系統的體檢報告

### 為什麼需要健康檢查？

一個服務跑著跑著可能出問題：
- 記憶體用完了
- 資料庫連線斷了
- 被一個 bug 卡死了

你不能等使用者打電話來才發現。**健康檢查就是自動化的體檢**，定期確認系統還活著、還能正常工作。

### DI 的四層健康檢查

**第 1 層：Shell Script（人工體檢）**

\`./scripts/healthcheck.sh\` — 開發者或 CI 用的快速檢查。跑一次會告訴你四個服務的狀態（Supabase、ML API、AI Proxy、Frontend），像是一份體檢報告。

**第 2 層：ML API 的 /healthz 和 /readyz（自動體檢）**

這是 Kubernetes 標準的兩個 endpoint：

- **\`/healthz\`（Liveness Probe）** — 「這個程式還活著嗎？」
  - 如果回不了 200 → 代表程式死了（可能卡死或崩潰）→ **重啟它**
  - 像護士確認病人還有呼吸

- **\`/readyz\`（Readiness Probe）** — 「準備好接客了嗎？」
  - 如果回不了 200 → 代表暫時不能處理請求（可能正在載入模型）→ **暫停送流量，但不重啟**
  - 像確認病人可以出院了

兩者的差別很重要：liveness 失敗 = 重啟（激烈手段），readiness 失敗 = 暫停流量（溫和手段）。

**第 3 層：Docker HEALTHCHECK（容器層體檢）**

\`\`\`
每 30 秒檢查一次
給 60 秒的啟動寬限期（ML 模型載入需要時間）
連續失敗 3 次才判定不健康
\`\`\`

為什麼給 60 秒寬限？因為 ML API 啟動時要載入模型和建立資料庫連線，這需要時間。如果一啟動就開始檢查，會誤判為「不健康」。

**第 4 層：前端的 systemHealthService（使用者看得到的）**

前端也有一個健康檢查服務，會從瀏覽器端 ping 各個服務。結果顯示在 Settings 頁面上，讓使用者（和你 demo 的時候）可以看到所有服務是不是都正常。

> 💡 **面試官可能會追問：**
> 「如果 ML API 的 readiness check 失敗了，使用者會看到什麼？」
> → 前端的 systemHealthService 會偵測到 ML API 不可用，Settings 頁面會顯示紅色警告。聊天功能和 AI 分析還能用（走 ai-proxy），但預測和計畫功能會暫時不可用。這就是分層架構的好處 — 一層有問題不影響其他層。

---

## 11-5：啟動與驗證 — 正確打開方式

### 單一命令啟動

\`\`\`
./scripts/start.sh          # 完整啟動（前端 + 後端）
./scripts/start.sh --check  # 只做 preflight 檢查（不啟動）
./scripts/start.sh --backend # 只啟動後端
\`\`\`

### Preflight 檢查 — 起飛前的安全檢查

飛機起飛前，機長會跑一份 preflight checklist。DI 的 \`start.sh\` 也一樣：

1. ✅ Node.js 有裝嗎？版本對嗎？
2. ✅ Python 有裝嗎？版本對嗎？
3. ✅ npm 套件都裝好了嗎？
4. ✅ .env.local 檔案存在嗎？裡面該有的變數都有嗎？
5. ✅ Supabase 連得上嗎？
6. ✅ ML API 的 port 是空的嗎？（不會跟其他程式衝突）

任何一項失敗，就不會啟動，直接告訴你哪裡有問題。

### 驗證清單 — 怎麼確認一切正常？

啟動完之後，怎麼確認系統真的能用？

1. 瀏覽器打開 → 能看到登入頁面
2. 登入成功 → 能看到首頁
3. ML API 的 \`/health/live\` → 回傳 200
4. Settings 頁面 → 沒有紅色的 missing secret 警告
5. 上傳一個 sample data → 完整走一遍 Golden Path
6. \`npm run build\` → 通過（確認沒有編譯錯誤）
7. \`npm run test:regression\` → 通過（確認沒有改壞東西）

### 三個啟動階段

成熟的系統有三個啟動階段：

1. **Preflight**：檢查所有前置條件
2. **Startup**：啟動各個服務
3. **Verification**：確認所有服務都正常

跳過任何一個都可能出問題。最常見的錯誤是跳過 Preflight 直接啟動，然後 debug 半天才發現是環境變數沒設。

> 💡 **面試官可能會追問：**
> 「如果你要寫一份 deployment runbook 給新同事，最重要的三件事是什麼？」
> → 1. **順序**：先後端再前端。2. **Secrets**：確認所有 API key 都用 \`supabase secrets set\` 設好了，不是放在 .env.local。3. **驗證**：部署完一定要跑 \`healthcheck.sh\`，不能只看「網頁打得開」就覺得成功了。

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

- 是否有正確的部署順序（先後端再前端）
- 是否知道 secrets 要用 \`supabase secrets set\`（不是放 .env）
- 是否有健康檢查的驗證步驟（不只是「網頁打得開」）
- 是否考慮了 migration 的順序性
- 是否提到環境變數的三種安全等級
`

export default world11
