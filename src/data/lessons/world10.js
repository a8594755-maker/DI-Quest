const world10 = `
# World 10：系統架構拓撲

> **目標：** 理解 DI 系統的四層架構、為什麼要分層、一個請求從頭到尾怎麼走
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 10-1：從一個動作開始理解架構

### 當你按下「預測 Q2 需求」，背後發生了什麼？

先別想架構圖。想像你是使用者，在 DI 系統的聊天框輸入：「幫我預測 Q2 的需求。」

從你按下 Enter 到看到預測結果，背後經過了**四個地方**。用餐廳來比喻：

1. **前端（React）= 餐廳的座位和菜單**
   你坐在座位上（瀏覽器），看著菜單（UI 介面），跟服務生點菜（輸入指令）。

2. **Supabase = 廚房的冰箱和帳本**
   冰箱裡放著所有食材（數據庫裡的資料）。帳本記錄了所有訂單（使用者認證、任務紀錄）。

3. **Edge Functions = 服務生**
   你不會自己跑去廚房拿菜。服務生幫你把點的菜傳到廚房，把做好的菜端回來。Edge Function 也是一樣 — 它是前端和後端之間的中間人，幫你轉達請求。

4. **ML API（FastAPI）= 主廚**
   真正做菜的人。需要用到 Python 的預測模型（Prophet、LightGBM）和最佳化求解器（OR-Tools），這些工具只能在「廚房」（Python 環境）裡使用，不能搬到座位上（瀏覽器）。

### 實際的請求流

回到剛才的例子，你按下 Enter 後：

\`\`\`
你的瀏覽器（前端）
  → chatIntentService.js 解析你的話：「這個人要做預測」
  → 組好請求，送到 ML API
  → ML API 收到後，叫 Prophet 模型做預測
  → 預測結果回傳到前端
  → Canvas 自動跳出 ForecastWidget，顯示預測圖表
\`\`\`

但如果你問的是需要 AI 幫忙思考的問題（比如「分析一下為什麼上個月銷量掉了」），路線會不一樣：

\`\`\`
你的瀏覽器（前端）
  → chatIntentService.js 解析：「這個人要 AI 分析」
  → 請求送到 Supabase Edge Function 的 ai-proxy
  → ai-proxy 幫你呼叫 Gemini/DeepSeek（因為 API key 不能放在瀏覽器）
  → AI 回覆送回前端
  → 顯示在聊天面板
\`\`\`

### 為什麼不能用一個 server 搞定？

你可能會問：為什麼要分四層？不能一個程式搞定嗎？

可以，但會出幾個問題：

1. **安全問題：** AI 的 API key（像 GEMINI_API_KEY）是要付費的。如果放在前端的 JavaScript 裡，任何人打開瀏覽器的 DevTools 就能看到。等於你把信用卡號碼印在菜單上。

2. **技術限制：** Prophet、OR-Tools 這些預測和最佳化的工具是 Python 寫的，瀏覽器跑不了 Python。就像你不能用微波爐烤蛋糕 — 不同工作需要不同工具。

3. **資源分配：** ML 預測和求解會吃大量 CPU 和記憶體。如果跟前端擠在一起，一個人跑預測，其他使用者的頁面就會卡住。分開來，前端和 ML API 可以各自擴展。

4. **部署彈性：** 前端改了一個按鈕顏色，不需要重新部署整個 ML API。分開部署，改哪裡部署哪裡。

> 💡 **面試官可能會追問：**
> 「那 Supabase 和 Edge Function 為什麼不合併？」
> → Supabase 本身是一個託管服務，你不用管它的伺服器。Edge Function 是 Supabase 提供的 serverless 函數，跑在它的基礎設施上。它們天然就是分開的。Edge Function 的好處是你不需要自己維護一個 Node.js server，寫個函數上傳就能用。

---

## 10-2：前端服務層 — 翻譯官的角色

### 為什麼前端需要 Service 層？

前端的 component（你看到的按鈕、表格、圖表）不應該知道 API 的細節。就像顧客不需要知道廚房怎麼切菜 — 你只需要點菜，服務生會處理剩下的。

DI 前端的 \`src/services/\` 資料夾底下有 31 個子目錄。但你不需要全部記住。重要的是理解 Service 層在做什麼：**它是前端 component 和後端 API 之間的翻譯官。**

### 五個最重要的 Service

**1. chat/ — 聽你說話的翻譯官**

當你在聊天框輸入任何東西，\`chatIntentService.js\` 會先分析你的意圖：

- 你說「預測 Q2 需求」 → 它翻譯成 \`{ intent: 'RUN_FORECAST' }\`
- 你說「做一份採購計畫」 → 翻譯成 \`{ intent: 'RUN_PLAN' }\`
- 你說「早安」 → 翻譯成 \`{ intent: 'GREETING' }\`（這個不需要叫 AI 模型，直接回覆就好，省錢）

它還有一個信心分數（confidence）。如果分數低於 0.7，代表它不太確定你要做什麼，會再問你一次。

**2. planning/ — 做計畫的引擎**

\`chatPlanningService.js\` 是做採購計畫的核心。它會：
- 讀取你上傳的數據
- 套用限制條件（預算上限、最低訂購量）
- 呼叫 ML API 的 solver 做最佳化
- 產出計畫表格、庫存預測、成本分析

**3. aiEmployee/ — Worker 的大腦**

\`orchestrator.js\` 是 Worker 的指揮中心。它管理任務的生命週期：
- 拆解任務成步驟（profile → forecast → optimize → risk → report）
- 一步一步執行
- 每一步完成後檢查品質
- 產出 artifact（交付物）推送到 Canvas

**4. data-prep/ — 數據管家**

\`chatDatasetProfilingService.js\` 負責「看懂」你上傳的數據：
- 自動偵測欄位類型（數字、日期、文字）
- 找出缺失值和異常值
- 建議欄位對應（「Column_A 看起來是產品編號」）

**5. risk/ — 風險守門員**

\`riskAdjustmentsService.js\` 負責在計畫上加入風險考量：
- 供應商可靠度評分
- 安全庫存調整
- 缺貨損失估算

### Service 層的設計哲學

好的 Service 層讓 component 可以很簡單地呼叫功能，不需要知道背後的複雜邏輯。比如 component 只需要呼叫 \`runForecast(datasetId)\`，不需要知道它背後要先做數據驗證、再呼叫 ML API、再處理回傳格式。

> 💡 **面試官可能會追問：**
> 「31 個 service 不會太多嗎？怎麼決定什麼時候拆成新的 service？」
> → 這是「內聚力 vs 耦合度」的取捨。每個 service 負責一個明確的領域（forecast、risk、planning），內部高度內聚。service 之間盡量不互相依賴。如果一個 service 做了太多不相關的事（例如 forecast service 裡面有 risk 的邏輯），就該拆出來。

---

## 10-3：Supabase 層 — 冰箱和帳本

### Supabase 在 DI 系統裡做什麼？

Supabase 是一個 Backend-as-a-Service 平台。白話講：它幫你搞定後端的基礎設施，你不用自己架 server。DI 用它做五件事：

| 功能 | 白話解釋 | 類比 |
|------|---------|------|
| **Auth** | 管理使用者登入登出 | 大樓的門禁卡系統 |
| **PostgreSQL** | 存所有數據（銷售紀錄、任務紀錄、Worker 設定） | 冰箱 + 檔案櫃 |
| **Storage** | 存使用者上傳的檔案（Excel、CSV） | 物品儲藏室 |
| **Edge Functions** | 跑在 Supabase 伺服器上的小程式 | 服務生（下面詳細講） |
| **RPC** | 遠端程序呼叫，執行資料庫裡的函數 | 按一個按鈕讓倉庫自動出貨 |

### Edge Functions — 為什麼需要「中間人」？

Edge Function 是跑在 Supabase 伺服器上的 TypeScript 程式。它最重要的角色是**當中間人**。

**ai-proxy — 最關鍵的 Edge Function**

你的瀏覽器要呼叫 Gemini（Google 的 AI 模型），但呼叫 Gemini 需要 API key。問題是：

- 前端的 JavaScript 程式碼是完全公開的
- 如果 API key 寫在前端，任何人打開瀏覽器 DevTools → Sources → 就能看到
- 別人拿到你的 API key，就能用你的錢去呼叫 Gemini

所以 DI 的做法是：前端不直接呼叫 Gemini，而是呼叫 \`ai-proxy\` Edge Function。ai-proxy 跑在 Supabase 的伺服器上，它有 API key（透過 \`supabase secrets set\` 安全地存放），它幫你轉呼叫 Gemini，再把結果傳回前端。

ai-proxy 支援多家 AI 模型：
- **Gemini** — Google 的模型（預設的進階模型用 gemini-3.1-pro-preview，快速模型用 gemini-2.5-flash）
- **DeepSeek** — 開源大模型（包含 deepseek-reasoner 用於推理）
- **Anthropic (Claude)** — Anthropic 的模型
- **OpenAI (GPT)** — OpenAI 的模型
- **Kimi** — 月之暗面的模型

**其他 Edge Functions**

| 函數 | 做什麼 | 白話 |
|------|--------|------|
| \`bom-explosion\` | BOM（物料清單）展開計算 | 「做一張椅子需要 4 個腳 + 1 個座板 + 8 個螺絲」— 把成品拆解成所有零件的需求量 |
| \`sync-materials-from-sap\` | 從 SAP 同步物料數據 | 從 ERP 系統把最新的物料資料搬過來 |
| \`sync-demand-fg-from-sap\` | 從 SAP 同步需求數據 | 把成品的銷售需求拉過來 |
| \`sync-inventory-from-sap\` | 從 SAP 同步庫存數據 | 把目前的庫存量拉過來 |
| \`ai-employee-scheduler\` | Worker 任務排程 | 定時派任務給 Worker |
| \`etl-scheduler\` | 數據管線排程 | 定時跑數據同步和轉換 |

### 資料庫 Migration — 按順序搬家

DI 的 PostgreSQL 資料庫有 72+ 個 migration 檔案。Migration 是什麼？

想像你搬新家。你不會一次把所有傢俱都搬進去，而是按順序：
1. 先搬沙發（基礎 schema）
2. 再搬餐桌（供應商 KPI 表）
3. 再裝書架（匯入追蹤表）
4. ...

每個 migration 就是一個搬家步驟。它們有嚴格的順序，因為後面的可能依賴前面的。比如「匯入追蹤表」需要先有「基礎 schema」裡的使用者表才能設定外鍵。

如果順序搞錯了（先裝書架再搬沙發），資料庫就會報錯（就像書架沒有牆壁可以靠）。

> 💡 **面試官可能會追問：**
> 「為什麼不用自己的 Node.js server，而是用 Supabase Edge Function？」
> → 省掉維運成本。自己架 server 要處理擴展、負載平衡、SSL 憑證、監控。Edge Function 是 serverless 的，你只管寫程式，Supabase 管基礎設施。對一個早期產品（v1），這是正確的取捨 — 把時間花在產品邏輯上，不要花在 DevOps 上。

---

## 10-4：ML API — 主廚的廚房

### 為什麼需要獨立的 ML API？

ML API 是一個用 Python 寫的 FastAPI 應用程式，跑在 Docker 容器裡。它的入口檔案是 \`src/ml/api/main.py\`。

為什麼不把 ML 的邏輯放在前端或 Supabase？三個原因：

1. **語言限制：** Prophet、LightGBM、OR-Tools 都是 Python 的套件。瀏覽器跑 JavaScript，Edge Function 跑 TypeScript/Deno。你不能在微波爐裡烤蛋糕 — Python 的工具就是得在 Python 環境裡跑。

2. **運算需求：** ML 預測和求解器計算會吃大量 CPU 和記憶體。一個求解任務可能跑 90 秒。如果這個計算跑在你的瀏覽器裡，你的電腦風扇會狂轉，其他分頁都會卡住。

3. **部署彈性：** ML 模型更新了，只需要重新部署 ML API 的 Docker 容器，不用動前端和 Supabase。

### ML API 裡面有什麼？

**預測模型 — 不只一種**

DI 不是只用一個模型做預測。它有一個「模型工廠」（ForecasterFactory），支援多種模型：

| 模型 | 適合場景 | 白話 |
|------|---------|------|
| **Prophet** | 有明顯季節性的時間序列 | Facebook 開發的，擅長抓週期性（每年聖誕節銷量爆增） |
| **LightGBM** | 有很多外部因素影響的預測 | 梯度提升模型，能考慮很多變數（天氣、促銷、競品價格） |
| **ETS** | 簡單穩定的時間序列 | 指數平滑法，像是算移動平均但更聰明 |
| **XGBoost** | 跟 LightGBM 類似但更穩定 | 另一種梯度提升模型 |
| **Chronos** | 零樣本預測（不需要訓練） | Hugging Face 的模型，但因為需要 PyTorch 太重了，預設關閉 |

**求解器引擎 — 算出最佳方案**

預測完需求後，要算出「最佳的採購計畫」。這就是最佳化求解器做的事：在滿足所有限制條件（預算、最低訂購量、交期）的情況下，找到成本最低的方案。

| 引擎 | 白話 | 可用性 |
|------|------|--------|
| **heuristic** | 快速估算，不一定最佳 | 永遠可用（兜底方案） |
| **ortools** | Google 的最佳化工具，品質好速度快 | 預設使用 |
| **gurobi** | 業界最頂級的求解器 | 需要商業授權（要付錢） |
| **cplex** | IBM 的求解器，跟 Gurobi 一個等級 | 需要商業授權 |

正式環境預設用 \`ortools\`（免費且品質夠好），如果客戶有 Gurobi 授權可以切換。

**中介層 — 進廚房前的安檢**

每個請求進到 ML API 之前，會經過四道中介層（Middleware）：

1. **JWT Auth** — 確認你是合法使用者（演唱會手環：進場時發給你，每次進出都掃一下）
2. **Rate Limiting** — 限制呼叫頻率（遊樂園排隊：不讓太多人同時坐雲霄飛車）
3. **Tenant ID** — 確認你是哪個公司的（公寓大樓：確認你只能進自己的房間）
4. **CORS** — 確認請求來自合法的網站（門衛：只讓住戶和已登記的訪客進門）

> 💡 **面試官可能會追問：**
> 「為什麼預設用 ortools 而不是 heuristic？」
> → heuristic 很快但不一定找到最佳解。ortools 用 constraint programming（約束規劃），能保證在限制條件下找到最佳或接近最佳的方案。對供應鏈計畫來說，差 5% 的最佳化可能就是幾萬塊的差距。

---

## 10-5：三條請求流 — 完整走一遍

### Flow 1：AI 輔助分析（「分析一下為什麼銷量掉了」）

**使用者故事：** 小美在聊天框打：「分析一下為什麼 3 月銷量下降了 15%。」

\`\`\`
1. 瀏覽器 → chatIntentService 解析意圖
2. 意圖是「分析」→ 需要 AI 思考 → 呼叫 ai-proxy Edge Function
3. ai-proxy 帶著 API key 呼叫 Gemini
4. Gemini 分析數據後回覆
5. 回覆經過 ai-proxy 回到瀏覽器
6. 聊天面板顯示分析結果
\`\`\`

**關鍵：** 瀏覽器永遠不知道 Gemini 的 API key 是什麼。ai-proxy 是安全的中間人。

### Flow 2：數據上傳與寫入（上傳 Excel 報表）

**使用者故事：** 小美把這個月的銷售報表拖進 workspace。

\`\`\`
1. 瀏覽器 → 檔案上傳到 Supabase Storage
2. chatDatasetProfilingService 讀取檔案，偵測欄位
3. 結果存入 Supabase PostgreSQL（dataset_profiles 表）
4. 匯入歷史記錄寫入 import_batches 表（審計追蹤）
5. 前端顯示「上傳完成，偵測到 12 個欄位、3,500 筆資料」
\`\`\`

**關鍵：** 數據寫入需要交易性（全部成功或全部失敗）和審計追蹤，所以走 Supabase。

### Flow 3：預測與最佳化（「幫我做採購計畫」）

**使用者故事：** 小美在聊天框打：「用這份數據做 Q2 的採購計畫，預算上限 100 萬。」

\`\`\`
1. 瀏覽器 → chatIntentService 解析：RUN_PLAN
2. chatPlanningService 從 Supabase 讀取數據
3. 請求送到 ML API
4. ML API 的 orchestrator 開始執行步驟：
   a. 數據驗證（確認格式正確）
   b. 需求預測（Prophet 跑時間序列）
   c. 最佳化求解（ortools 算採購計畫）
   d. 風險評估（供應商評分、缺貨風險）
   e. 產出報告（Decision Brief + Evidence Pack）
5. 每步結果回傳前端 → Canvas 自動開啟對應的 Widget
6. 任務進入「等待審核」狀態
\`\`\`

**關鍵：** 這是最複雜的一條流，涉及所有四層架構。ML 計算不能在瀏覽器做，所以要送到 ML API。

### 為什麼要區分三條流？

不同操作有不同的需求：

| 需求 | Flow 1 (AI 分析) | Flow 2 (數據寫入) | Flow 3 (預測求解) |
|------|-----------------|-----------------|-----------------|
| 需要 API key？ | 是（AI 模型） | 否 | 否（ML API 自己有） |
| 需要 Python？ | 否 | 否 | 是（Prophet、ortools） |
| 需要交易性？ | 否 | 是（全成功或全失敗） | 是 |
| 耗時？ | 幾秒 | 幾秒 | 可能幾十秒到幾分鐘 |

> 💡 **面試官可能會追問：**
> 「如果 ML API 掛了，其他功能還能用嗎？」
> → 可以。聊天和 AI 分析走 Flow 1（不經過 ML API），數據上傳走 Flow 2（也不經過 ML API）。只有預測和計畫功能會受影響。這就是分層架構的好處 — 一層掛了不會拖垮整個系統。

---

## 10-6（Boss）：畫出架構

### 情境

面試官問你：

> 「你能畫出 Decision Intelligence 的系統架構嗎？不用很精美，白板等級就好。然後跟我解釋每一層的職責。」

### 你的任務

1. 描述整體架構拓撲（可以用文字描述，假設在白板上畫）
2. 說明每一層的職責
3. 每層舉出 2 個具體的檔案或模組，解釋它們的作用
4. 說明三條主要請求流向中的至少一條

### 評估標準

- 是否正確描述四層架構
- 是否能說出具體的模組名稱（不只是抽象概念）
- 是否理解為什麼要分層（能講出 trade-off）
- 是否能追蹤至少一條完整的請求流向

### 一個好的白板回答長這樣

「我先畫四個框。最上面是 React 前端，使用者在這裡操作。它有兩個重要的部分：一個是 chatIntentService，負責把使用者的自然語言翻譯成系統指令；另一個是 Canvas，負責即時展示 Worker 的產出。

中間有兩個框。一個是 Supabase，管資料庫、使用者認證和檔案儲存。另一個是 Edge Functions，最重要的是 ai-proxy — 它是前端呼叫 AI 模型的安全中間人，API key 只存在這裡，瀏覽器永遠碰不到。

最下面是 FastAPI ML API，跑在 Docker 容器裡。它做需求預測（用 Prophet）和採購計畫最佳化（用 ortools）。這些是 Python 的工具，只能在 Python 環境裡跑。

為什麼要分這四層？三個原因：安全性 — API key 不能暴露在前端；技術限制 — Python 工具不能在瀏覽器跑；可擴展性 — ML 計算很吃資源，要能獨立擴展。

請求流的話，以做預測為例：使用者在聊天框打字 → chatIntentService 解析意圖 → 呼叫 ML API → Prophet 跑預測 → 結果回傳 → Canvas 自動開啟圖表。如果是 AI 分析，就走 ai-proxy → Gemini 這條路。兩條路是分開的，ML API 掛了不影響 AI 分析。」
`

export default world10
