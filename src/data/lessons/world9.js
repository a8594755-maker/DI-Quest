const world9 = `
# World 9：Digital Worker 產品理解

> **目標：** 理解 Decision Intelligence 的產品定位、核心工作流程、功能模組
> **對應專案：** Decision-Intelligence-（Digital Worker Platform）
> **預估學習時間：** 2-3 小時

---

## 9-1：產品定位 — 不是 Chatbot

### 什麼是 Digital Worker Platform？

Decision Intelligence 不是一般的 AI Chatbot。它是一個 **Digital Worker Platform**，把可管理、可審計的數位工作者放進企業的營運與分析工作流中。

每個 digital worker 都有：
- **定義的角色**（Role）
- **權限邊界**（Permission Boundaries）
- **可用工具目錄**（Tool Catalog）
- **風格政策**（Style Policies）
- **升級規則**（Escalation Rules）

這跟 ChatGPT 最大的不同是：ChatGPT 回答問題，Digital Worker 執行任務。它更像是一個**新進員工**，會學習你的流程，而不是一個聊天機器人。

### Chatbot vs Digital Worker 比較

| 維度 | Chatbot | Digital Worker |
|------|---------|----------------|
| 互動模式 | 問答 | 任務驅動 |
| 角色定義 | 無 | 有（角色、權限、工具） |
| 審計追蹤 | 無 | 完整執行時間線 |
| 自主等級 | 無分級 | A1-A4 分級 |
| 信任進展 | 無 | 隨時間調整自主度 |
| 輸出形式 | 文字回覆 | 結構化交付物（artifact） |

### 產品版本與定位

- **產品類型：** Digital Worker Platform（任務驅動、可審計、角色制）
- **v1 目標市場：** Analytics Digital Worker（數據分析、預測、報告、風險評估）
- **技術堆疊：** React + Supabase + FastAPI ML API
- **版本：** 0.1.0（2026-03-08 文件化），v1 Digital Worker 於 2026-03-16 收斂

> 💡 **Framework Tip：** 描述一個產品時，先講「它是什麼類型」，再講「它不是什麼」，最後講「它的核心差異」。

---

## 9-2：核心工作流程（Golden Path）

### Golden Path 六步驟

Decision Intelligence 的主要使用流程被稱為 **Golden Path**，共六個步驟：

| 步驟 | 動作 | 路由 | 說明 |
|------|------|------|------|
| 1 | 上傳工作簿 | \`/workspace\` | 使用者上傳 Excel/CSV 數據 |
| 2 | Worker 接收任務 | \`/employees/tasks\` | AI Worker 從任務板接收任務 |
| 3 | 預測 + 計畫 + 風險 | \`/workspace\` | 執行 Workflow A 或 B：profiling → 預測 → 計畫 → 風險 → 驗證 → 拓撲 → 報告 |
| 4 | 修訂 | \`/employees/review\` | 主管檢視 Worker 產出，必要時要求修訂 |
| 5 | 批准 | \`/employees/approvals\` | 批准閘門：主管批准計畫以進行回寫 |
| 6 | 重播 / 審計 | \`/employees/review\` | 用快取的 artifact 重播執行，或審計完整決策軌跡 |

### 為什麼是這六步？

這個流程設計反映了企業級決策的現實：
1. **數據先行**：沒有數據就沒有分析
2. **任務分派**：不是無限制地回答問題，而是接收明確任務
3. **多維度執行**：預測、計畫、風險不是分開做的，而是一條鏈路
4. **人在迴圈中**：AI 執行完要人來檢視
5. **明確批准**：重要決策需要批准閘門
6. **可追溯**：所有步驟都可重播和審計

> 💡 **Framework Tip：** 好的工作流設計不只是「功能列表」，而是有明確的開始、執行、審核、和結束。每一步都要能回答「誰負責？做什麼？怎麼驗證？」

---

## 9-3：功能模組總覽

### 主要頁面（27 個路由）

Decision Intelligence 的前端有 27 個頁面，可以分成幾大類：

**分析與規劃**
- \`/workspace\` — **統一工作區**（Golden Path 的核心，上傳、聊天、計畫、預測都在這）
- \`/\` — 指揮中心（Command Center），KPI 總覽、最近活動
- \`/forecast\` — 預測工作室（Forecast Studio），模型訓練與結果

**風險管理**
- \`/risk\` — 風險中心（Risk Center），風險儀表板、例外、What-if 分析

**模擬與策略**
- \`/digital-twin\` — 數位孿生，系統模擬
- \`/scenarios\` — 場景工作室，多場景比較

**Worker 管理**
- \`/employees\` — Workers Hub（AI 員工管理）
- \`/employees/tasks\` — 任務板
- \`/employees/review\` — 產出審核
- \`/employees/approvals\` — 批准佇列

**設定與工具**
- \`/settings\` — 系統設定
- \`/tool-registry\` — 工具註冊表
- \`/policy-rules\` — 政策規則
- \`/sandbox\` — Synthetic ERP 沙箱

### 路由收斂

一個重要的架構決策是 **路由收斂**：

- \`/plan\` → 重導到 \`/workspace\`（Plan Studio 合併進統一工作區）
- \`/chat\` → 內嵌在 \`/workspace\`（沒有獨立聊天頁）
- \`/ai/decision\` → 重導到 \`/workspace\`（舊路徑）

這代表 \`/workspace\` 是整個產品的 **核心匯聚點**。

> 💡 **Framework Tip：** 理解一個產品的模組結構時，不只看「有多少頁面」，更要看「哪些頁面是核心」和「為什麼某些功能被合併」。

---

## 9-4：Digital Worker 概念

### 自主等級（Autonomy Levels A1-A4）

Digital Worker 不是「全自動」或「全手動」，而是有四個自主等級：

| 等級 | 名稱 | 行為 |
|------|------|------|
| A1 | 完全審核 | 所有動作都需要人工審核 |
| A2 | 例行自動 | 例行任務自動執行，例外需審核 |
| A3 | 記錄自動 | 自動執行並記錄，政策違反時升級 |
| A4 | 角色自主 | 在角色邊界內完全自主 |

### Trust Progression（信任進展）

Worker 不是一開始就有高自主度。系統設計了 **信任進展** 機制：

1. 新 Worker 從 A1 開始
2. 主管審核並批准產出
3. 系統學習主管的風格偏好
4. 隨著信任建立，可以提升自主等級
5. 但隨時可以降級

這跟現實中的新進員工一模一樣：先盯緊，做得好才慢慢放手。

### Capability Policies（能力政策）

每個 Worker 的能力由政策控制：
- **可用工具**：哪些 DI 引擎可以使用（約 19 個）
- **權限邊界**：哪些數據可以存取
- **升級規則**：什麼情況要通知主管
- **風格政策**：輸出格式、語調、詳細程度

> 💡 **Framework Tip：** 設計 AI 系統時，「控制」和「信任」是一體兩面。不是問「要不要讓 AI 自主」，而是問「在什麼條件下可以自主到什麼程度」。

---

## 9-5：使用者旅程與路由收斂

### 三個進入點

使用者可以從三個入口進入系統：

| 入口 | 第一個導航項目 | 目標路由 |
|------|----------------|----------|
| DI Mode | Sidebar → Workspace | \`/workspace\` |
| AI Mode | Task Board | \`/employees/tasks\` |
| Command Center | Plan CTA 按鈕 | \`/workspace\` |

### /workspace 統一 Canvas

\`/workspace\` 是產品的核心頁面，它整合了：
- **聊天面板**：與 AI Worker 對話
- **數據上傳**：上傳工作簿
- **工作流執行**：預測、計畫、風險分析
- **Canvas 檢視**：檢視和修訂 artifact
- **Widget 切換**：透過 query params 切換（\`?widget=forecast\`、\`?widget=risk\`）

### 關鍵不變量

1. \`/workspace\` 是唯一可以上傳工作簿和執行工作流的路由
2. 所有規劃、預測、風險、場景工作都透過 \`/workspace\` + query params
3. Digital Worker 的任務生命週期在 \`/employees/*\` 下
4. 沒有獨立的 \`/chat\` 路由 — 聊天是 \`/workspace\` 內的面板

> 💡 **Framework Tip：** 路由收斂（Route Convergence）是一個重要的產品架構決策。它減少了使用者的認知負擔，但增加了單一頁面的複雜度。好的實作需要在統一和簡潔之間取得平衡。

---

## 9-6（Boss）：產品 Pitch

### 情境

你正在面試一家做企業 SaaS 的公司。面試官問你：

> 「你之前做的 Decision Intelligence 專案，能不能用 1-2 分鐘跟我解釋一下它是什麼？假設我是一個不太懂技術的業務主管。」

### 你的任務

請用清楚、簡潔的語言回答這個問題。你的回答應該包含：

1. **產品是什麼**（一句話定位）
2. **跟一般 AI Chatbot 有什麼不同**（核心差異）
3. **核心工作流程**（Golden Path 的簡化版）
4. **為什麼企業需要它**（價值主張）

### 評估標準

- 是否清楚區分 Digital Worker 和 Chatbot
- 是否提到任務驅動、審計追蹤、信任進展等核心概念
- 是否能用非技術語言解釋
- 是否提到實際的工作流程（不只是抽象概念）

### 參考答案方向

一個好的回答可能是：「Decision Intelligence 是一個 Digital Worker 平台，跟 ChatGPT 不一樣的是，它不只是回答問題，而是真的幫你執行分析任務...」然後具體描述 Golden Path 的幾個步驟，最後收在「企業需要的不是聊天機器人，而是可以被管理、被審計、能隨時間建立信任的數位員工」。
`

export default world9
