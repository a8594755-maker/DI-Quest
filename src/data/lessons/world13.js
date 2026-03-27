const world13 = `
# World 13：ML API 後端深度

> **目標：** 理解 ML API 怎麼保護自己不被亂用、怎麼處理要跑很久的任務、怎麼監控系統健康
> **對應專案：** Decision-Intelligence-（\`src/ml/api/\`）
> **預估學習時間：** 3-4 小時

---

## 13-1：JWT 認證 — 演唱會手環

### 先想一個場景

你去看演唱會。進場的時候，工作人員核對你的票，然後給你套上一個**防水手環**。之後你要去廁所、去買飲料、回座位，每次經過入口都掃一下手環就好，不用再拿票出來。

JWT（JSON Web Token）就是這個手環。

### DI 系統的 JWT 怎麼運作？

1. **你登入** → Supabase Auth 核對你的帳號密碼
2. **登入成功** → Supabase 發給你一個 JWT（手環）
3. **你的瀏覽器之後每次呼叫 ML API** → 自動帶上這個 JWT
4. **ML API 收到請求** → 先看 JWT 是不是真的（用 Supabase 的 secret 驗證簽名），是真的就放行

JWT 裡面藏了什麼資訊？
- \`sub\` — 你是誰（使用者 ID）
- \`role\` — 你的角色（管理員、分析師、檢視者）
- \`email\` — 你的信箱

### 為什麼不用 session？

傳統做法是「session」：你登入後，server 記住你的身份，存在記憶體或資料庫裡。問題是：

- **ML API 是獨立的服務**，它跟 Supabase 是分開的。如果用 session，ML API 每次收到請求都要去問 Supabase「這個人是誰？」，多一次網路請求。
- **JWT 是 stateless 的**：ML API 自己就能驗證 JWT 的真偽，不用問任何人。快，而且不依賴外部服務。

### 有些路是不用手環的

健康檢查的 endpoint（\`/healthz\`、\`/readyz\`）不需要 JWT。為什麼？因為這些是給監控系統用的，不是給使用者用的。如果健康檢查也要 JWT，那監控系統還要先登入，太麻煩了。

開發的時候，可以透過 \`DI_JWT_REQUIRED=false\` 暫時關掉 JWT 驗證。但正式環境**絕對不能關**。

> 💡 **面試官可能會追問：**
> 「JWT 有什麼缺點？」
> → JWT 一旦發出去就無法撤銷（除非等它過期）。如果一個使用者被停權了，他手上的 JWT 在過期之前還是有效的。解法是把 JWT 的有效期設短（比如 1 小時），搭配 refresh token 機制。

---

## 13-2：多租戶 — 公寓大樓

### 什麼是多租戶？

想像一棟公寓大樓。每個住戶有自己的房間、自己的鑰匙。你看不到隔壁的東西，隔壁也看不到你的。但你們共用同一棟建築、同一個電梯、同一個管理委員會。

**多租戶（Multi-Tenant）**就是同一套系統服務多個公司（tenant），但彼此的數據完全隔離。

### DI 怎麼做到隔離？

**第一層：請求層面**

每個 API 請求都帶著一個 \`X-Tenant-ID\` header。ML API 的 middleware 會在最開始就把它抽出來，存在 \`request.state\` 裡。後續所有的資料庫查詢都會自動加上 \`WHERE tenant_id = ?\`。

**第二層：資料庫層面**

Supabase 用 Row-Level Security（RLS）做第二道防線。就算程式碼有 bug 忘了加 tenant_id 過濾，資料庫本身也會擋住跨租戶的查詢。就像公寓大樓除了房門鎖，還有大門門禁 — 兩道關卡。

**第三層：角色控制**

不是同一家公司的人都能做一樣的事。在程式碼裡，\`_require_action_role()\` 會檢查執行者是否有權做某個動作：

- **管理員**：可以修改模型設定、批准計畫
- **分析師**：可以跑預測和計畫，但不能修改模型
- **檢視者**：只能看結果，不能執行任何操作

這個叫做**最小權限原則（Principle of Least Privilege）** — 每個人只能做他被明確允許做的事。

### GovernanceStore — 誰能做什麼的規則書

系統裡有一個「治理倉庫」（GovernanceStore），記錄了所有的權限規則。每個需要權限控制的動作都定義成一個 \`GovernanceAction\`，例如：
- 執行預測
- 修改模型參數
- 批准採購計畫
- 匯出敏感數據

每次有人要做這些事，系統會去 GovernanceStore 查「這個角色可以做嗎？」。

> 💡 **面試官可能會追問：**
> 「如果 RLS 已經能擋住跨租戶查詢，為什麼還需要在 API 層做 tenant_id 過濾？」
> → 深度防禦（Defense in Depth）。如果只靠一層，那一層出問題就全完了。兩層的話，API 層的 bug 不會洩露數據（因為 RLS 兜底），RLS 設定錯誤也不會（因為 API 層先過濾了）。

---

## 13-3：Rate Limiting — 遊樂園排隊

### 為什麼需要限流？

想像遊樂園的雲霄飛車。如果不排隊、不限人數，所有人一起衝上去，不是擠爆就是機器壞掉。

ML API 也一樣。跑一次預測可能需要幾十秒的 CPU 時間。如果有人寫了一個腳本，每秒發 100 個請求，整個 API 就會被拖垮，其他使用者都用不了。

### DI 怎麼做限流？

**只限重的 endpoint：** 不是所有 API 都限。輕量的查詢（取得任務狀態、查看結果）不限。只有重計算的 endpoint 才限：
- \`/demand-forecast\` — 需求預測
- \`/replenishment-plan\` — 採購計畫
- \`/train-model\` — 模型訓練
- \`/backtest\` — 回測

**兩種實作，自動切換：**

| 實作 | 什麼時候用 | 怎麼運作 |
|------|-----------|---------|
| **RedisRateLimiter** | 有 Redis 的時候 | 用 Redis 做分散式計數。多台 ML API 共用同一個計數器，限流是全域的 |
| **InProcessRateLimiter** | 沒有 Redis 的時候 | 用程式記憶體計數。簡單但只能限單台機器 |

系統啟動時會嘗試連 Redis。連得上就用 Redis 版，連不上就自動降級到記憶體版。這叫做 **graceful degradation（優雅降級）** — 依賴不可用時，不是直接崩潰，而是用次佳方案繼續運作。

**Sliding Window 演算法：**

不是「每分鐘重置一次」（那樣在分鐘交界處可以突發 2 倍的請求），而是真的看「過去 60 秒內」發了多少請求。更公平、更不容易被鑽漏洞。

### Solver 併發控制 — 另一種「排隊」

除了 Rate Limiting，ML API 還有一個 **Solver Semaphore**：

\`\`\`
DI_SOLVER_MAX_CONCURRENT = 3（預設）
\`\`\`

同一時間最多只有 3 個求解任務在跑。第 4 個請求來的時候，必須等前面的完成才能開始。

為什麼？因為 OR-Tools 求解器非常吃記憶體。如果 10 個求解任務同時跑，伺服器可能因為記憶體不足而崩潰。3 個是一個經過測試的安全值。

> 💡 **面試官可能會追問：**
> 「Rate Limiting 是按什麼 key 來限？按 IP 還是按使用者？」
> → 優先按 JWT 裡的 user ID 來限（如果有登入的話），沒有 JWT 就退回到按 IP 限。按 user ID 更精確，因為同一個辦公室的人可能共用 IP。

---

## 13-4：非同步作業 — 外送而不是內用

### 為什麼需要非同步？

回到餐廳比喻。如果你點了一道要燉 3 小時的菜，服務生不可能站在你桌邊等 3 小時。正常的做法是：

1. 你點菜 → 服務生記下來，給你一個**號碼牌**
2. 你繼續做自己的事（聊天、喝酒）
3. 菜做好了 → 服務生端上來

ML 計算也是一樣。一次完整的規劃任務（數據分析 → 預測 → 最佳化 → 風險 → 報告）可能要跑幾分鐘。如果用同步 API（你發請求、server 處理、處理完才回覆），HTTP 連線可能 timeout，瀏覽器可能覺得系統掛了。

### DI 的非同步設計

**提交任務 → 拿到號碼牌 → 定期查進度 → 拿結果**

1. 前端提交任務 → ML API 回傳一個 \`run_id\`（號碼牌）
2. 任務進入佇列，Worker 在背景執行
3. 前端定期查 \`run_id\` 的狀態（或透過 SSE 即時推送）
4. 完成後，前端用 \`run_id\` 取得結果

**作業狀態流：**
\`\`\`
queued → running → succeeded
                → failed
                → canceled
\`\`\`

**Step Pipeline — 一個任務分成多步：**

一個完整的規劃任務不是一口氣跑完的，而是按順序執行多個步驟：

\`\`\`
profile → contract → validate → forecast → risk_scan →
bom_explosion → optimize → verify_replay → report
\`\`\`

每一步完成後，結果會作為 artifact 推送到前端。所以你不用等全部跑完才看到東西 — 預測完成的時候，你已經能在 Canvas 上看到預測圖表了，同時系統繼續跑最佳化。

**兩種儲存：**

| 儲存 | 場景 | 特點 |
|------|------|------|
| **PostgresAsyncRunStore** | 正式環境 | 持久化，重啟不遺失 |
| **InMemoryAsyncRunStore** | 開發/測試 | 快但重啟就沒了 |

### Worker 怎麼執行任務？

ML API 啟動時會在背景跑一個 **AsyncRunWorker**（Daemon Thread）：

- 每 2 秒去資料庫查一次「有沒有還沒人認領的任務？」
- 有的話就認領（compare-and-swap，確保不會兩個 worker 搶同一個任務）
- 最多同時跑 3 個任務（\`DI_SOLVER_MAX_CONCURRENT\`）
- 每 5 秒發一次心跳（heartbeat），讓系統知道它還活著

如果 worker 掛了（超過 2 分鐘沒心跳），系統會把它認領的任務釋放出來，讓其他 worker 重新認領。

**防護機制：**
\`\`\`
DI_MAX_ROWS_PER_SHEET = 2,000,000   # 單張表最多 200 萬筆
DI_MAX_SKUS = 5,000                   # 最多 5,000 個品項
DI_SOLVER_MAX_SECONDS = 90            # 求解最多 90 秒
DI_BOM_MAX_EDGES = 200,000            # BOM 最多 20 萬條邊
DI_JOB_MAX_ATTEMPTS = 3               # 最多重試 3 次
\`\`\`

這些上限就像電梯的載重限制 — 不是說電梯不好，是保護它不要超載壞掉。

> 💡 **面試官可能會追問：**
> 「如果使用者關掉瀏覽器，任務還會繼續跑嗎？」
> → 會。因為任務是 ML API 的背景 worker 在跑，不依賴瀏覽器。使用者關掉瀏覽器、重新打開，只要用 run_id 就能查到任務的最新狀態。在正式環境，還有一個獨立的 Node.js task worker 專門處理這個。

---

## 13-5：監控與即時推送

### 遙測（Telemetry）— 系統的體溫計

一個系統跑著跑著，你怎麼知道它「健不健康」？不能等使用者投訴才發現。你需要**遙測**。

DI 的 ML API 會記錄每次求解的遙測事件：
- **用了哪個引擎：** ortools / heuristic
- **跑了多久：** 15.3 秒
- **結果如何：** 成功 / 失敗 / 超時
- **最佳化目標值：** 42,500（成本）

這些事件存在 \`solver_telemetry_events\` 資料表裡。前端有一個 OpsDashboard（\`/ops\`）可以看到：
- 求解器超時率（如果突然飆高，可能有問題）
- 平均求解時間（隨時間的趨勢）
- 失敗原因分佈

### SSE（Server-Sent Events）— 即時推送

前面講的「定期查狀態」其實有點浪費。更好的做法是**讓 server 主動通知你**。

SSE（Server-Sent Events）就是做這件事的：server 跟你的瀏覽器維持一個連線，有新消息就馬上推過來。跟 WebSocket 的差別是：

| | SSE | WebSocket |
|---|-----|-----------|
| 方向 | 單向（server → 瀏覽器） | 雙向 |
| 複雜度 | 簡單 | 複雜 |
| 穿越防火牆 | 容易（就是 HTTP） | 有時會被擋 |
| 適合場景 | server 推更新給你看 | 雙方要來回對話 |

DI 用 SSE 來推送：
- Agent 執行進度（「正在跑預測...」「預測完成，開始最佳化...」）
- 步驟完成通知
- 錯誤和警告

在前端，\`useAgentSSE\` hook 訂閱這些事件，Canvas 自動開啟對應的 widget。

### Prometheus Metrics

如果你的公司有 Grafana 監控系統，ML API 可以暴露 Prometheus 格式的 metrics（透過 \`/metrics\` endpoint）：
- 請求數量和延遲
- 錯誤率
- 目前在跑的任務數

### Sentry — 錯誤追蹤

設定了 \`SENTRY_DSN\` 環境變數後，ML API 會自動把未處理的錯誤送到 Sentry。這樣你不用盯著 log，Sentry 會主動通知你「有個新的錯誤，發生了 5 次」。

> 💡 **面試官可能會追問：**
> 「Observability 的三大支柱是什麼？DI 各用了什麼？」
> → **Logs**（結構化日誌，用 python-json-logger）、**Metrics**（Prometheus，追蹤系統狀態）、**Traces**（Request ID correlation，追蹤一個請求經過了哪些服務）。DI 三個都有覆蓋。

---

## 13-6（Boss）：API 安全架構審查

### 情境

你的主管問你：

> 「Decision Intelligence 的 ML API 是怎麼保護多租戶安全的？從認證到授權到速率限制，幫我做一個快速的安全審查。」

### 你的任務

說明以下安全機制如何**層層把關**（不是各自獨立的）：

1. **JWT 認證** — 你是誰？
2. **角色控制** — 你能做什麼？
3. **Rate Limiting** — 你做的速度有沒有超標？
4. **Tenant 隔離** — 你只能碰自己的數據
5. **Telemetry** — 你做的所有事都被記錄下來

### 評估標準

- 是否能解釋這些機制是**按順序執行**的（middleware 堆疊順序）
- 是否理解每個機制的職責不重疊
- 是否提到 graceful degradation（Redis 不可用時的限流降級）
- 是否提到深度防禦（API 層 + RLS 雙重保護）
- 是否提到公開路徑的例外（health endpoints）

### 參考回答方向

「一個請求進到 ML API 後，會經過四道中介層，像是過四關：

第一關是 **Request ID**：每個請求分配一個唯一 ID，方便之後追蹤。

第二關是 **JWT 認證**：確認你是誰。如果 JWT 無效或過期，直接 401 回絕，不會走到下一關。健康檢查的路徑例外，不需要 JWT。

第三關是 **Rate Limiting**：確認你的呼叫頻率在合理範圍。有 Redis 就用分散式限流（多台機器共享計數器），沒有就降級到單機限流。只限重計算的 endpoint。

第四關是 **Tenant ID 抽取**：從 header 抽出你的公司 ID，後續的資料庫查詢都自動加上這個過濾。資料庫層面還有 RLS 做第二道防線。

過了四關之後，才會進到實際的業務邏輯（預測、規劃等）。而整個過程的遙測數據（誰做了什麼、花了多久、結果如何）都記錄在 solver_telemetry_events 裡。」
`

export default world13
