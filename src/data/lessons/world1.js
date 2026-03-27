const world1 = `
# World 1：問題拆解基礎

> **目標：** 學完後你能在面試中把模糊的商業問題拆解成有結構的分析框架，有條理地回答任何 Case Study
> **適用角色：** Business Analyst、Product Analyst、Data Analyst、Strategy Analyst
> **預估學習時間：** 3-4 小時

---

## 1-1：問題分類 — Business / Product / System

### 為什麼第一步是分類？

面試官丟給你一個問題時，你的腦子裡應該先亮起一盞燈：**這是什麼類型的問題？**

不同類型的問題，需要不同的分析框架、不同的數據、不同的利害關係人。如果你一開始就分錯類，後面的分析方向會完全偏掉。

### 三種問題類型

| 類型 | 核心關注 | 常見關鍵詞 | 典型例子 |
|------|----------|------------|----------|
| **Business Problem** | 營收、成本、市場策略 | revenue、growth、market share、pricing | 「我們的營收成長放緩了」 |
| **Product Problem** | 使用者體驗、功能、adoption | conversion、engagement、retention、NPS | 「用戶不用我們的新功能」 |
| **System / Process Problem** | 效率、流程、系統穩定性 | SLA、throughput、latency、error rate | 「客服處理時間變長了」 |

### 怎麼判斷？看「痛點在哪裡」

問自己三個問題：

1. **是賺錢的方式出問題了嗎？** → Business Problem
2. **是使用者用產品的體驗出問題了嗎？** → Product Problem
3. **是做事的方法或系統效率出問題了嗎？** → System Problem

### 實際案例練習

**案例：「客服 ticket 處理時間從 2 小時變 8 小時」**

- 表面上看起來像客服問題，但本質是什麼？
- 商業模式有變嗎？沒有。產品功能壞了嗎？不一定。做事的流程變慢了？是的。
- → **System / Process Problem**

**案例：「我們的 app 日活躍用戶掉了 30%」**

- 這個問題可能有多種原因，但核心痛點在使用者跟產品的互動
- → 先歸類為 **Product Problem**，再進一步拆解

**案例：「競爭對手推出免費版，我們的新客戶數下降」**

- 痛點在市場競爭和定價策略
- → **Business Problem**

### 注意：問題會交叉

一個問題可能同時涉及多個類型。例如「客戶流失率上升」，可能是 Product（產品沒有價值）、Business（定價太高）、或 System（服務品質太差）。

**面試中的做法：** 先選一個最可能的類型開始分析，然後告訴面試官你的判斷依據。如果分析後發現不對，再調整。面試官看的是你的思考過程，不是一開始就猜對。

> 💡 **Framework Tip:** 問題分類第一步 — 先判斷 Business / Product / System，再選對應的分析框架。

---

## 1-2：拆解問題的步驟

### 結構化拆解的四步驟

拿到一個問題後，不要急著想答案。照著這四步走：

#### Step 1：確認指標（Identify the Metric）

把模糊的問題轉成一個具體的數字。

- ❌ 「業績不好」 → 太模糊
- ✅ 「月營收從 $500K 下降到 $420K，下降了 16%」 → 可分析

#### Step 2：拆解 Funnel（Break Down the Funnel）

幾乎所有商業問題都可以拆成一個 funnel。

**營收 Funnel：**
\`\`\`
Revenue = Traffic × Conversion Rate × Average Order Value × Repeat Rate
營收 = 流量 × 轉化率 × 客單價 × 回購率
\`\`\`

**SaaS 用戶 Funnel：**
\`\`\`
Awareness → Acquisition → Activation → Retention → Revenue → Referral (AAARRR)
\`\`\`

**客服效率 Funnel：**
\`\`\`
Ticket 進來 → 分派 → 接手 → 調查 → 回覆 → 結案
\`\`\`

拆成 funnel 之後，找到**掉最多的那一步**（最大 drop-off）。

#### Step 3：提出假設（Generate Hypotheses）

基於 funnel 數據，對「為什麼掉」提出假設。

好的假設有三個特點：
1. **時間點吻合** — 問題出現的時間跟某個變化吻合
2. **邏輯合理** — 因果關係說得通
3. **可驗證** — 你知道用什麼數據或方法來確認

#### Step 4：排優先級 & 驗證（Prioritize & Validate）

假設可能有好幾個，先驗證最可能的那個。

### 實際案例：SaaS Activation Rate 下降

**問題：** 新用戶 7-day activation rate 從 45% 掉到 32%

**Step 1：** 指標 = 7-day activation rate，定義 = 註冊後 7 天內建立第一個 project

**Step 2：** Funnel 拆解

| 步驟 | 上月 | 本月 | Drop |
|------|------|------|------|
| 註冊完成 | 100% | 100% | — |
| 完成 onboarding | 78% | 61% | -17pp |
| 建立第一個 project | 45% | 32% | -13pp |

最大 drop-off 在 onboarding 步驟（-17pp）。

**Step 3：** 假設
- 假設 A：3 週前 onboarding 從 3 步改成 5 步，新增步驟造成 friction ✅ 時間吻合、邏輯合理
- 假設 B：新 Google Ads 帶來低品質流量 ⚠️ 可能，但時間點稍晚
- 假設 C：伺服器 outage ❌ 只有 2 小時，影響有限

**Step 4：** 先驗證假設 A → 比較改版前後每一步的 completion rate

> 💡 **Framework Tip:** 拆解四步驟：指標 → Funnel → 假設 → 驗證。面試中把這個流程講出來，面試官就知道你有結構。

---

## 1-3：資訊不足時怎麼辦

### 面試中最常見的陷阱

面試官問你：「我們的 app 使用者活躍度不夠好，你會怎麼分析？」

**新手的反應：** 直接開始分析，講一堆可能的原因。

**高手的反應：** 先問問題，把模糊的問題變清楚。

### 三個必問的問題

無論遇到什麼模糊問題，先問這三個：

#### 1. Definition — 定義是什麼？

「活躍度不夠好——這裡的『活躍度』具體是指哪個指標？DAU？WAU？Session duration？」

#### 2. Baseline — 跟什麼比？

「不夠好是跟上個月比？跟去年同期比？跟競爭對手比？跟你們的目標比？」

#### 3. Scope — 影響範圍多大？

「是所有用戶都下降，還是某個 segment 特別嚴重？是所有平台都下降，還是只有 mobile？」

### 為什麼問問題是加分的？

面試官故意給模糊問題，就是要看你會不會主動釐清。

- 直接回答 → 面試官覺得你不夠嚴謹
- 問對問題 → 面試官覺得你有經驗、有結構

### 沒有數據怎麼辦？

面試官可能會追問：「假設你沒有任何 analytics dashboard，明天就要給老闆一個初步判斷，你會怎麼做？」

**Qualitative Data Sources（質性資料來源）：**

| 來源 | 適合回答什麼 | 取得難度 |
|------|-------------|----------|
| 客服 ticket / 抱怨紀錄 | 使用者遇到什麼問題 | 低 |
| App Store / Google Play reviews | 使用者最在意什麼 | 低 |
| Sales team 回饋 | 客戶為什麼不買 / 不續約 | 中 |
| 社群媒體提及 | 品牌認知和情緒 | 低 |
| 自己使用產品（dogfooding） | 體驗流程的問題 | 低 |
| 訪談 3-5 個用戶 | 深入理解行為和動機 | 中 |

**關鍵心法：** 沒有 quantitative data 的時候，用 qualitative signals 來形成假設，再想辦法用數據驗證。

### 實際示範

**面試官：** 「我們的用戶留存率不好。」

**你：** 「想先釐清幾個問題——
1. 留存率的定義是？D7、D30、還是月活躍？
2. 是跟前幾個月比下降了，還是一直都在這個水準？
3. 是所有用戶都低，還是特定 cohort？

如果目前沒有詳細數據，我會先從客服 ticket 和 app reviews 找 qualitative signals。如果大量回饋集中在『不知道怎麼開始用』，我會假設問題在 onboarding；如果是『用了幾週覺得沒用』，那問題在 product value。」

> 💡 **Framework Tip:** 模糊問題三板斧 — Definition（定義）→ Baseline（基準）→ Scope（範圍）。問完再分析。

---

## 1-4：問題的影響分析

### 嚴重性評估：三維框架

當同時面對多個問題時（面試中很常見），你需要一個排優先級的方法。

\`\`\`
Priority Score = Impact × Urgency × Irreversibility
優先級 = 影響大小 × 緊急程度 × 不可逆性
\`\`\`

| 維度 | 高 | 低 |
|------|----|----|
| **Impact** | 影響大量用戶或大額營收 | 影響少數人或小金額 |
| **Urgency** | 每多拖一小時問題就更嚴重 | 問題不會隨時間惡化 |
| **Irreversibility** | 造成的損害無法挽回 | 可以輕易修復或補償 |

### 實際案例：三個同時出現的問題

一家 fintech 公司，週一早上三個問題同時到你面前：

1. **Landing page conversion 下降** — 從 5% 掉到 4.2%
2. **12 筆交易被重複扣款** — 客戶在 Twitter 抱怨
3. **新功能 adoption 只有 8%** — 低於預期的 20%

分析：

| 問題 | Impact | Urgency | Irreversibility | 優先級 |
|------|--------|---------|-----------------|--------|
| Landing page | 潛在營收下降 (中) | 不會惡化 (低) | 可調整 (低) | **第三** |
| 重複扣款 | 客戶信任 + 合規 (高) | 持續曝光 (高) | 已扣款 (高) | **第一** |
| 新功能 adoption | 資源浪費 (中) | 穩定 (低) | 可調整 (低) | **第二** |

重複扣款在三個維度都是最高的，必須優先處理。

### 利害關係人分析（Stakeholder Analysis）

確定問題嚴重性後，想清楚：**誰被影響了？**

以重複扣款為例：
- **直接影響：** 12 位被重複扣款的客戶
- **間接影響：** 看到 Twitter 抱怨的潛在客戶
- **內部影響：** 工程團隊（要修 bug）、客服團隊（要處理抱怨）、法務團隊（合規風險）、PR 團隊（公關危機）
- **決策者：** CEO / CFO 需要知道財務影響和應對方案

### Incident Report 結構

向管理層報告問題時，用這個結構：

\`\`\`
1. What    — 發生了什麼事？
2. Scale   — 影響多大？（多少人、多少錢、持續多久）
3. Why     — 根因是什麼？
4. Done    — 已經採取了什麼行動？
5. Need    — 還需要什麼資源或決策？
6. Prevent — 怎麼防止再發生？
\`\`\`

這個結構在面試中也非常好用。當面試官問「你會怎麼向老闆報告這個問題？」，你用這六點回答，會顯得非常專業。

> 💡 **Framework Tip:** 優先級 = Impact × Urgency × Irreversibility。先處理不可逆且影響大的。

---

## 1-5：結構化思考練習

### Adoption 分析三層模型

當產品 / 工具 / 功能的使用率不如預期，用這三層來拆解：

\`\`\`
Awareness → Trial → Value
知道嗎？ → 試了嗎？ → 有價值嗎？
\`\`\`

每一層的問題和解法都不同：

| 層級 | 問題 | 解法方向 |
|------|------|----------|
| **Awareness** | 不知道有這個東西 | 推廣、公告、培訓 |
| **Trial** | 知道但不想試 / 試了體驗很差 | 降低門檻、改善 onboarding |
| **Value** | 試了但沒感受到價值 | 改善核心功能、找到 aha moment |

### 實際案例：沒人用的 Expense Report 系統

**情境：** 公司 500 人需要報銷，新系統上線 1 個月後只有 24% 的人用過。

| Segment | 人數 | 比例 |
|---------|------|------|
| 持續使用 | 75 | 15% |
| 用過一次就放棄 | 45 | 9% |
| 從未使用 | 380 | 76% |

**用三層模型拆解：**

- **Awareness：** 調查發現 85% 知道有新系統 → 不是主因
- **Trial：** 45 人放棄的主因是「上傳收據流程太多步」→ **主要問題**
- **Value：** 持續使用者反映「報銷從 2 週縮到 3 天」→ 價值已被驗證

### 從分析到建議

分析做完後，面試官會問：「所以你的建議是什麼？」

很多人在這一步卡住——分析得很好，但給不出具體行動。

**好的建議公式：**

\`\`\`
1. 對應 Root Cause — 你的建議要直接解決發現的問題
2. 最小可行改動 — 不要提「全面重新設計」，提最小的改動
3. 明確驗證方式 — 說清楚怎麼知道有沒有效
4. 風險和限制 — 主動提出可能的風險
\`\`\`

**以 Expense Report 系統為例：**

「根據分析，問題集中在 Trial Experience 層——收據上傳流程太複雜。我的建議是：

1. **改動：** 簡化收據上傳流程（例如支援拍照直接上傳，減少手動填寫欄位）
2. **驗證：** 改善後邀請之前放棄的 45 人重新試用，追蹤他們的完成率
3. **推廣：** 用持續使用者的正面回饋（報銷從 2 週變 3 天）做 social proof
4. **風險：** 需要工程資源，預估 2 週開發時間。如果流程簡化後仍然低 adoption，需要重新檢視是否有其他阻力。」

> 💡 **Framework Tip:** Adoption 三層拆解 — Awareness → Trial → Value → 對症下藥。

---

## 1-6（Boss）：完整 Case 拆解

### Case Answer Framework

面試中回答一個完整的 Case，用這六步框架：

\`\`\`
Goal → Metrics → Flow → Segment → Recommend → Validate
目標 → 指標 → 流程 → 切分 → 建議 → 驗證
\`\`\`

#### Step 1: Goal — 確認目標

「讓我先確認一下——這個問題的核心目標是什麼？我們希望達到什麼結果？」

#### Step 2: Metrics — 定義指標

「要衡量這個目標，最關鍵的指標是什麼？目前的數值是多少？目標是多少？」

#### Step 3: Flow — 拆解流程

「這個指標的背後是一個什麼樣的流程？讓我拆成幾個步驟來看。」

#### Step 4: Segment — 切分族群

「讓我按 [user type / plan / region / channel] 切分看看，問題是全面的還是集中在某個 segment？」

#### Step 5: Recommend — 提出建議

「根據分析，主要問題在 [specific segment] 的 [specific step]。我的建議是...」

#### Step 6: Validate — 說明驗證

「我會用 [method] 來驗證這個建議是否有效，成功的指標是 [target metric]。」

### 完整 Case 示範：續約率下降

**問題：** B2B SaaS 年度續約率從 85% 掉到 72%

**Step 1: Goal**
「目標是找出續約率下降的根因，並提出能讓續約率回升到至少 80% 的方案。」

**Step 2: Metrics**
「主要指標是年度續約率，從 85% 掉到 72%，下降了 13pp。次要指標我會看各 plan 的續約率、usage patterns、NPS。」

**Step 3: Flow**
「續約的流程大概是：使用產品 → 感受到價值 → 收到續約提醒 → 決定續約。每一步都可能流失。」

**Step 4: Segment**
切分後發現：

| Plan | 客戶數 | 續約率變化 |
|------|--------|-----------|
| Starter ($99/yr) | 2,000 | 78% → 61% (-17pp) |
| Professional ($499/yr) | 800 | 88% → 82% (-6pp) |
| Enterprise ($2,999/yr) | 150 | 95% → 93% (-2pp) |

問題集中在 Starter plan。進一步調查發現：
- Starter 用戶平均只用 3 / 15 個功能
- 未續約者在到期前 60 天就停止使用了
- 6 個月前 Gantt Chart 功能從 Starter 移到 Professional
- 客服紀錄最常見問題：「Gantt Chart 去哪了？」

**Root Cause：** Starter plan 的核心功能被移走了，使用者失去了留下來的理由。

**Step 5: Recommend**
「我有兩個建議，短期和長期各一個：

短期（1-2 週）：把 Gantt Chart 以精簡版還給 Starter（保留進階功能在 Professional 做 upsell 誘因）。同時主動聯繫即將到期的 Starter 客戶，告知功能回歸。

長期（1-3 個月）：建立 Health Score 預警系統——當用戶 30 天沒登入時自動觸發 CSM outreach，而不是等到續約前才介入。」

**Step 6: Validate**
「我會追蹤：
- Starter 續約率是否在下一季回到 70%+
- Gantt Chart 精簡版的 usage rate
- 因 outreach 而回流的用戶比例
如果 Starter 續約率沒有改善，需要重新檢視是否有其他因素（例如競爭對手的免費替代品）。」

---

## 附錄：必背框架速查表

### 🔹 問題分類

\`\`\`
Business Problem → 影響營收、策略、市場定位
Product Problem  → 影響使用者體驗、功能、adoption
System Problem   → 影響效率、成本、穩定性
\`\`\`

### 🔹 問題拆解四步驟

\`\`\`
1. Metric   — 把問題變成一個數字
2. Funnel   — 拆成步驟，找最大 drop-off
3. Hypotheses — 基於時間點和邏輯提出假設
4. Validate — 驗證最可能的假設
\`\`\`

### 🔹 模糊問題三板斧

\`\`\`
1. Definition — 這個指標的定義是什麼？
2. Baseline   — 跟什麼比？（時間 / 競品 / 目標）
3. Scope      — 影響範圍多大？（全體 / 特定 segment）
\`\`\`

### 🔹 優先級評估

\`\`\`
Priority = Impact × Urgency × Irreversibility
先處理：影響大、拖不得、不可逆的問題
\`\`\`

### 🔹 Incident 報告結構

\`\`\`
What → Scale → Why → Done → Need → Prevent
\`\`\`

### 🔹 Adoption 三層分析

\`\`\`
Awareness — 知道嗎？ → 推廣
Trial     — 試了嗎？ → 降低門檻
Value     — 有用嗎？ → 改善功能
\`\`\`

### 🔹 建議公式

\`\`\`
1. 對應 Root Cause
2. 最小可行改動
3. 明確驗證方式
4. 風險和限制
\`\`\`

### 🔹 Case Answer Framework（Boss 必背）

\`\`\`
Goal      — 確認目標和成功定義
Metrics   — 定義關鍵指標和差距
Flow      — 拆解流程找 drop-off
Segment   — 切分族群找最大問題
Recommend — 提出對應 root cause 的建議
Validate  — 說明驗證方法和成功標準
\`\`\`

**口訣：G-M-F-S-R-V（Goal Metrics Flow Segment Recommend Validate）**

記住：面試官看的不是你的答案對不對，而是你**思考的過程有沒有結構**。用框架展示你的思路，即使結論不完美，也會拿到高分。
`;

export default world1;
