const world41 = `
# World 41：進階執行與智慧路由

> **目標：** 理解 Worker 怎麼自我修正、系統怎麼選 AI 模型、怎麼零成本偵測異常、瀏覽器和伺服器的執行差異
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 41-1：Ralph Loop — 會自我修正的 AI 員工

### 一般的 AI 呼叫 vs Ralph Loop

**一般的 AI 呼叫**就像你叫外送：你下單、等餐點到、吃。如果菜做錯了，你只能重新下單。AI 也一樣 — 你呼叫一次 API，它給你一個結果，好不好你都得接受。

**Ralph Loop** 不一樣。它像一個真的在辦公室裡的員工：做完一步 → 看看結果 → 覺得不夠好就自己調整再做一次 → 直到滿意為止。

在程式碼裡（\`ralphLoopAdapter.js\`），Ralph Loop 的流程是：

\`\`\`
1. 初始化 → 為任務建立一個自主代理
2. 代理開始循環：
   a. executeTick(taskId) → 推進任務一步
   b. getTaskStatus(taskId) → 看看做到哪了
   c. 結果 OK？→ markComplete() → 停止
   d. 結果不 OK？→ 分析為什麼，調整策略，再跑一次
3. 直到任務完成、或碰到安全限制
\`\`\`

### 三道安全繩

如果 AI 一直覺得「不夠好」而無限循環呢？有三道安全繩：

**1. 迭代次數上限**
\`\`\`
VITE_RALPH_MAX_ITERATIONS = 30（預設）
\`\`\`
跑 30 次還沒完成就強制停止。防止無限循環。

**2. 成本上限**
\`\`\`
VITE_RALPH_MAX_COST = 5.00（美元）
\`\`\`
一個任務最多花 $5 的 AI 呼叫費用。超過就停。防止帳單爆炸。

**3. 中止控制（AbortController）**
\`\`\`
abortRalphLoop(taskId)    → 停止特定任務
abortAllRalphLoops()      → 停止所有任務
\`\`\`
使用者或系統隨時可以拉停。

### 什麼時候用 Ralph Loop？

不是所有任務都需要 Ralph Loop。簡單的查詢（「上個月營收多少？」）呼叫一次 AI 就夠了。

Ralph Loop 適合**複雜的多步驟任務**：
- 「分析這份數據，找出問題，提出建議，並寫一份報告」
- 這種任務可能需要：先讀數據 → 發現異常 → 深入分析 → 寫報告 → 檢查報告品質 → 修改格式
- 每一步都可能需要根據前一步的結果調整

Ralph Loop 預設是關閉的（\`VITE_RALPH_LOOP_ENABLED=false\`），因為它比單次呼叫消耗更多資源。

> 💡 **面試官可能會追問：**
> 「跟 AutoGPT 有什麼不同？」
> → 概念類似但 DI 的 Ralph Loop 有明確的安全限制（成本上限、迭代上限、可中止），而且是在一個受控的任務框架內執行（有狀態機管理任務狀態），不是讓 AI 隨意上網做事。

---

## 41-2：Model Routing — 用對的 AI 做對的事

### 為什麼不能所有任務都用最好的模型？

最強的 AI 模型（像 Gemini Pro、Claude Opus）很聰明，但也很貴。如果每個任務都用最強的，帳單會爆。

就像餐廳不會讓主廚去切蔬菜 — 切蔬菜讓學徒做就好，主廚專心做牛排。

DI 把 AI 模型分成三個等級（tier）：

### 三個 Tier

| Tier | 白話 | 典型模型 | 成本 | 適合場景 |
|------|------|---------|------|---------|
| **Tier A** | 主廚 | Gemini Pro、Claude Opus、GPT-5.4 | $$$ | 任務分解、風險評估、最終審查 |
| **Tier B** | 副主廚 | Gemini Flash、Claude Sonnet、DeepSeek Reasoner | $$ | 複雜分析、代碼生成、推理 |
| **Tier C** | 學徒 | DeepSeek Chat、Gemini Flash Lite | $ | 摘要、格式化、數據清理 |

### 系統怎麼決定用哪個？

每種任務類型有預設的 tier 配置：

\`\`\`
規劃任務（planner）→ preferred: tier_a, fallback: tier_b
  → 做採購計畫需要最強的推理能力

報告生成（report）→ preferred: tier_c, fallback: tier_b
  → 寫報告不需要太聰明，便宜就好

風險評估（risk）→ preferred: tier_a, fallback: tier_b
  → 風險判斷很重要，不能用便宜的

數據清理（cleaning）→ preferred: tier_c, fallback: tier_c
  → 簡單的格式轉換，最便宜的就夠
\`\`\`

### 降級和升級

**降級（Downgrade）：** 如果 tier_a 模型太忙或超過預算，系統會自動降級到 tier_b。
**升級（Escalation）：** 如果任務失敗了或風險等級高，系統會升級到更高的 tier 重試。

\`\`\`
正常流程：tier_c 做報告 → 成功 → 結束
失敗流程：tier_c 做報告 → 失敗 → 升級到 tier_b → 成功 → 結束
高風險流程：偵測到高風險 → 直接用 tier_a → 成功 → 結束
\`\`\`

### 多模型供應商 — 不把雞蛋放在一個籃子裡

DI 支援五家 AI 供應商：Gemini（Google）、DeepSeek、Anthropic（Claude）、OpenAI（GPT）、Kimi（月之暗面）。

為什麼不只用一家？
- **供應商可能當機** — Google 的服務掛了，還有 DeepSeek 可以用
- **不同模型擅長不同事** — DeepSeek Reasoner 擅長推理，Gemini Flash 擅長速度
- **成本最佳化** — 便宜的任務用便宜的供應商

> 💡 **面試官可能會追問：**
> 「你們怎麼追蹤每個模型的成本？」
> → 在 model_registry 資料表裡，每個模型都有 cost_per_1k_input 和 cost_per_1k_output 的定價。系統會記錄每次呼叫的 token 數，算出實際成本。Ralph Loop 的 maxCost 上限也是基於這個計算。

---

## 41-3：Signal Radar — 零成本的異常偵測

### 什麼是 Signal Radar？

系統每天自動掃描你的數據，找出異常和問題。**完全不呼叫 AI 模型（零成本）**，純粹用統計規則。

在 \`signalRadarEngine.js\` 裡，系統偵測四種異常：

### 四種異常偵測

**1. 統計離群（Metric Anomalies）**

\`\`\`
看每個指標的歷史變化率
計算平均值 μ 和標準差 σ
如果最新的變化率偏離平均超過 2σ → 告警

例如：
  過去 6 個月的營收月增率：+3%, +5%, +2%, +4%, +3%, +6%
  平均 = 3.8%, 標準差 = 1.3%
  這個月：-15%（偏離 14.4 個標準差）→ 嚴重異常！
\`\`\`

**2. 指標矛盾（Contradictions）**

某些指標應該同向或反向移動。如果它們的方向不對，就有問題：

\`\`\`
營收 ↑ 但毛利 ↓ → 矛盾！（可能是靠降價衝量）
庫存 ↑ 但缺貨也 ↑ → 矛盾！（庫存擺錯地方了？）
成本 ↑ 但品質 ↓ → 矛盾！（錢花到哪去了？）
\`\`\`

**3. 集中度風險（Concentration Risk）**

從數據和圖表中找出過度集中的情況：

\`\`\`
「前 5 大客戶佔營收 85%」→ 嚴重集中風險
  → 如果其中一個大客戶跑了，營收直接腰斬

圓餅圖最大一塊佔 70%+ → 告警
\`\`\`

**4. 過期洞察（Stale Insights）**

\`\`\`
這份分析是 30 天前做的 → 告警：數據可能已經過時
同一個問題的新舊分析，結論差異 > 20% → 告警：結論已經變了
\`\`\`

### 為什麼是零成本？

因為所有偵測都是本地計算：比較數字大小、算標準差、正則匹配文字。不需要呼叫任何 AI API。每次執行毫秒級完成。

**Signal Radar 跟 Drift Detection 的差異：**
- Drift Detection（World 40）監控的是 **ML 模型** 的健康（模型準不準）
- Signal Radar 監控的是 **業務數據** 的健康（營收正不正常、庫存合不合理）

> 💡 **面試官可能會追問：**
> 「純規則不會有很多假陽性嗎？」
> → 會。所以 Signal Radar 有 confidence 分數。同時滿足統計條件（> 2σ）和絕對條件（> 30% 變化）的信心最高（0.9）。只滿足一個的信心較低（0.6-0.75）。前端會把低信心的信號排在後面。

---

## 41-4：瀏覽器 vs 伺服器執行

### 預設模式：瀏覽器執行

預設情況下，Worker 的任務是在你的瀏覽器裡跑的。\`orchestrator.js\` 的 tick loop 就在前端的 JavaScript 裡執行。

**好處：** 簡單，不需要額外的伺服器。
**壞處：** 你關掉瀏覽器，任務就停了。

### 正式環境：伺服器執行

正式環境有一個獨立的 **Node.js Task Worker**（\`worker/taskWorker.js\`），在伺服器背景持續運行：

\`\`\`
每 2 秒：去資料庫查「有沒有沒人認領的任務？」
有的話：認領（compare-and-swap，確保不會兩個 worker 搶同一個）
最多同時跑 3 個任務
每個任務跑 tick loop 直到完成

你關掉瀏覽器 → 任務繼續跑
你重新打開瀏覽器 → 用 run_id 查到最新狀態
\`\`\`

**Worker 的安全機制：**
- **心跳**：每 5 秒發一次，讓系統知道它還活著
- **殭屍偵測**：如果 worker 超過 2 分鐘沒發心跳 → 它的任務被釋放給其他 worker
- **優雅關機**：收到 SIGTERM 時，等最多 30 秒讓正在跑的任務完成

**健康檢查：** Worker 自帶一個 HTTP server（port 9100），方便監控系統檢查它是否活著。

### 兩種模式的比較

| | 瀏覽器執行 | 伺服器執行 |
|---|----------|----------|
| 關瀏覽器 | 任務停止 | 任務繼續 |
| 適合場景 | Demo、開發 | 正式環境 |
| 同時任務數 | 1（你的瀏覽器） | 3（可配置） |
| 需要額外部署 | 不需要 | 需要跑 taskWorker.js |

> 💡 **面試官可能會追問：**
> 「為什麼同時最多 3 個任務？」
> → 因為每個任務可能呼叫 ML API 做預測和求解，這很吃 CPU 和記憶體。3 個是經過測試的安全值。跟 ML API 的 DI_SOLVER_MAX_CONCURRENT=3 是同一個道理。

---

## 41-5：資料庫 Schema 與 RLS

### 關鍵資料表

DI 的 Supabase 資料庫有 27+ 個 migration 檔案。你不需要記住全部，但要知道幾張最重要的表：

**Worker 相關：**
| 表 | 存什麼 | 白話 |
|---|--------|------|
| \`ai_employees\` | Worker 的身份：名字、角色、狀態、管理者 | Worker 的「員工檔案」 |
| \`ai_employee_tasks\` | 任務：狀態（todo → in_progress → done）、結果 | Worker 的「工作紀錄」 |
| \`ai_employee_task_memory\` | 跨對話記憶：用 dataset_fingerprint 當 key | Worker 的「筆記本」 |

**模型相關：**
| 表 | 存什麼 | 白話 |
|---|--------|------|
| \`model_registry\` | AI 模型登記：供應商、tier、成本、上下文長度 | AI 模型的「通訊錄」 |
| \`solver_telemetry_events\` | 每次求解的遙測：引擎、耗時、結果 | 求解器的「體檢報告」 |

**審計相關：**
| 表 | 存什麼 | 白話 |
|---|--------|------|
| \`di_plan_audit_log\` | 計畫的審計紀錄：誰批准的、什麼時候、理由 | 決策的「法院紀錄」 |
| \`analysis_snapshots\` | 分析快照：時序數據的歷史快照 | 數據的「定期照片」 |

### RLS — 資料庫層面的隔離

**Row-Level Security（行級安全）** 確保每個使用者只能看到自己公司的資料。

白話：就算程式碼有 bug 忘了加 \`WHERE tenant_id = ?\`，資料庫本身也會擋住你看別人的數據。

\`\`\`
-- 例如 ai_employees 表的 RLS 政策：
CREATE POLICY "Users can only see their own workers"
  ON ai_employees
  FOR SELECT
  USING (manager_user_id = auth.uid());

-- 就算你寫 SELECT * FROM ai_employees（沒加任何條件），
-- 資料庫只會回傳你管理的 Worker，看不到別人的。
\`\`\`

### 為什麼 RLS 這麼重要？

在多租戶系統裡，一個 bug 可能導致 A 公司看到 B 公司的數據。這是**資安事故**。

RLS 是**最後一道防線**：
- 第一道：前端呼叫 API 時帶 tenant_id
- 第二道：API middleware 提取 tenant_id 過濾查詢
- 第三道：**RLS — 就算前兩道都失敗，資料庫自己也不會洩露**

> 💡 **面試官可能會追問：**
> 「RLS 會影響效能嗎？」
> → 會，但影響很小。PostgreSQL 的 RLS 在查詢規劃階段就套用過濾條件，跟你自己寫 WHERE 差不多。重要的是在 tenant_id 上建索引。

---

## 41-6（Boss）：整合情境題

### 情境

Worker 接到一個任務：「分析上個月的銷售數據並預測下季需求」。

執行過程中發生了以下事情：
1. Ralph Loop 在第 3 次迭代時，發現預測的 MAPE = 0.28（門檻 0.15）
2. Signal Radar 偵測到「營收 ↑ 但毛利 ↓」的矛盾
3. Model Router 因為預算快用完，從 tier_a 降級到 tier_b
4. Drift Monitor 顯示 PSI = 0.31（門檻 0.2）

### 你的任務

1. 這四個信號各代表什麼問題？
2. 它們之間有沒有因果關係？（提示：PSI 高可能解釋 MAPE 高）
3. 你會建議怎麼處理？按什麼順序？
4. 降級到 tier_b 會不會影響結果品質？怎麼判斷？

### 評估標準

- 能串連四個系統的信號（不是各自獨立地分析）
- 找到因果：PSI 高 → 數據分佈變了 → 模型預測變差 → MAPE 高
- 處理順序：先止血（rollback 模型或調高 tier）→ 再查因（為什麼 PSI 變高）→ 最後修復（重訓模型）
- 對降級的判斷：tier_b 對分析任務可能夠用，但對預測任務品質可能不足
- 能解釋 Signal Radar 的矛盾（營收↑毛利↓）可能是降價促銷導致，跟模型退化是獨立的問題
`

export default world41
