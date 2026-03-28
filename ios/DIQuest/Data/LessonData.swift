import Foundation

enum LessonData {
    static func lesson(for worldId: Int, language: LanguageManager.Language = .zhTW) -> String? {
        switch (worldId, language) {
        case (1, .zhTW): return zhWorld1
        case (1, .en): return enWorld1
        case (2, .zhTW): return zhWorld2
        case (2, .en): return enWorld2
        case (3, .zhTW): return zhWorld3
        case (3, .en): return enWorld3
        case (5, .zhTW): return zhWorld5
        case (5, .en): return enWorld5
        case (6, .zhTW): return zhWorld6
        case (6, .en): return enWorld6
        case (7, .zhTW): return zhWorld7
        case (7, .en): return enWorld7
        case (8, .zhTW): return zhWorld8
        case (8, .en): return enWorld8
        case (27, .zhTW): return zhWorld27
        case (27, .en): return enWorld27
        case (28, .zhTW): return zhWorld28
        case (28, .en): return enWorld28
        case (29, .zhTW): return zhWorld29
        case (29, .en): return enWorld29
        case (30, .zhTW): return zhWorld30
        case (30, .en): return enWorld30
        case (31, .zhTW): return zhWorld31
        case (31, .en): return enWorld31
        case (32, .zhTW): return zhWorld32
        case (32, .en): return enWorld32
        case (33, .zhTW): return zhWorld33
        case (33, .en): return enWorld33
        case (34, .zhTW): return zhWorld34
        case (34, .en): return enWorld34
        case (35, .zhTW): return zhWorld35
        case (35, .en): return enWorld35
        case (36, .zhTW): return zhWorld36
        case (36, .en): return enWorld36
        case (37, .zhTW): return zhWorld37
        case (37, .en): return enWorld37
        case (38, .zhTW): return zhWorld38
        case (38, .en): return enWorld38
        case (42, .zhTW): return zhWorld42
        case (42, .en): return enWorld42
        // Worlds from LessonDataExtra
        case (4, .zhTW): return zhWorld4
        case (4, .en): return enWorld4
        case (9, .zhTW): return zhWorld9
        case (9, .en): return enWorld9
        case (10, .zhTW): return zhWorld10
        case (10, .en): return enWorld10
        case (11, .zhTW): return zhWorld11
        case (11, .en): return enWorld11
        case (12, .zhTW): return zhWorld12
        case (12, .en): return enWorld12
        case (13, .zhTW): return zhWorld13
        case (13, .en): return enWorld13
        case (14, .zhTW): return zhWorld14
        case (14, .en): return enWorld14
        case (15, .zhTW): return zhWorld15
        case (15, .en): return enWorld15
        case (16, .zhTW): return zhWorld16
        case (16, .en): return enWorld16
        case (17, .zhTW): return zhWorld17
        case (17, .en): return enWorld17
        case (18, .zhTW): return zhWorld18
        case (18, .en): return enWorld18
        case (19, .zhTW): return zhWorld19
        case (19, .en): return enWorld19
        case (20, .zhTW): return zhWorld20
        case (20, .en): return enWorld20
        case (21, .zhTW): return zhWorld21
        case (21, .en): return enWorld21
        case (22, .zhTW): return zhWorld22
        case (22, .en): return enWorld22
        case (23, .zhTW): return zhWorld23
        case (23, .en): return enWorld23
        case (24, .zhTW): return zhWorld24
        case (24, .en): return enWorld24
        case (25, .zhTW): return zhWorld25
        case (25, .en): return enWorld25
        case (26, .zhTW): return zhWorld26
        case (26, .en): return enWorld26
        case (39, .zhTW): return zhWorld39
        case (39, .en): return enWorld39
        case (40, .zhTW): return zhWorld40
        case (40, .en): return enWorld40
        case (41, .zhTW): return zhWorld41
        case (41, .en): return enWorld41
        case (48, .zhTW): return zhWorld48
        case (48, .en): return enWorld48
        case (49, .zhTW): return zhWorld49
        case (49, .en): return enWorld49
        case (50, .zhTW): return zhWorld50
        case (50, .en): return enWorld50
        case (51, .zhTW): return zhWorld51
        case (51, .en): return enWorld51
        case (52, .zhTW): return zhWorld52
        case (52, .en): return enWorld52
        case (53, .zhTW): return zhWorld53
        case (53, .en): return enWorld53
        case (54, .zhTW): return zhWorld54
        case (54, .en): return enWorld54
        case (55, .zhTW): return zhWorld55
        case (55, .en): return enWorld55
        case (56, .zhTW): return zhWorld56
        case (56, .en): return enWorld56
        case (57, .zhTW): return zhWorld57
        case (57, .en): return enWorld57
        case (58, .zhTW): return zhWorld58
        case (58, .en): return enWorld58
        case (59, .zhTW): return zhWorld59
        case (59, .en): return enWorld59
        case (60, .zhTW): return zhWorld60
        case (60, .en): return enWorld60
        case (61, .zhTW): return zhWorld61
        case (61, .en): return enWorld61
        default:
            // Fallback: try Chinese if English not available
            if language == .en {
                return lesson(for: worldId, language: .zhTW)
            }
            return nil
        }
    }

    // MARK: - World 1 (zh)
    private static let zhWorld1 = """

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
```
Revenue = Traffic × Conversion Rate × Average Order Value × Repeat Rate
營收 = 流量 × 轉化率 × 客單價 × 回購率
```

**SaaS 用戶 Funnel：**
```
Awareness → Acquisition → Activation → Retention → Revenue → Referral (AAARRR)
```

**客服效率 Funnel：**
```
Ticket 進來 → 分派 → 接手 → 調查 → 回覆 → 結案
```

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

```
Priority Score = Impact × Urgency × Irreversibility
優先級 = 影響大小 × 緊急程度 × 不可逆性
```

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

```
1. What    — 發生了什麼事？
2. Scale   — 影響多大？（多少人、多少錢、持續多久）
3. Why     — 根因是什麼？
4. Done    — 已經採取了什麼行動？
5. Need    — 還需要什麼資源或決策？
6. Prevent — 怎麼防止再發生？
```

這個結構在面試中也非常好用。當面試官問「你會怎麼向老闆報告這個問題？」，你用這六點回答，會顯得非常專業。

> 💡 **Framework Tip:** 優先級 = Impact × Urgency × Irreversibility。先處理不可逆且影響大的。

---

## 1-5：結構化思考練習

### Adoption 分析三層模型

當產品 / 工具 / 功能的使用率不如預期，用這三層來拆解：

```
Awareness → Trial → Value
知道嗎？ → 試了嗎？ → 有價值嗎？
```

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

```
1. 對應 Root Cause — 你的建議要直接解決發現的問題
2. 最小可行改動 — 不要提「全面重新設計」，提最小的改動
3. 明確驗證方式 — 說清楚怎麼知道有沒有效
4. 風險和限制 — 主動提出可能的風險
```

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

```
Goal → Metrics → Flow → Segment → Recommend → Validate
目標 → 指標 → 流程 → 切分 → 建議 → 驗證
```

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

```
Business Problem → 影響營收、策略、市場定位
Product Problem  → 影響使用者體驗、功能、adoption
System Problem   → 影響效率、成本、穩定性
```

### 🔹 問題拆解四步驟

```
1. Metric   — 把問題變成一個數字
2. Funnel   — 拆成步驟，找最大 drop-off
3. Hypotheses — 基於時間點和邏輯提出假設
4. Validate — 驗證最可能的假設
```

### 🔹 模糊問題三板斧

```
1. Definition — 這個指標的定義是什麼？
2. Baseline   — 跟什麼比？（時間 / 競品 / 目標）
3. Scope      — 影響範圍多大？（全體 / 特定 segment）
```

### 🔹 優先級評估

```
Priority = Impact × Urgency × Irreversibility
先處理：影響大、拖不得、不可逆的問題
```

### 🔹 Incident 報告結構

```
What → Scale → Why → Done → Need → Prevent
```

### 🔹 Adoption 三層分析

```
Awareness — 知道嗎？ → 推廣
Trial     — 試了嗎？ → 降低門檻
Value     — 有用嗎？ → 改善功能
```

### 🔹 建議公式

```
1. 對應 Root Cause
2. 最小可行改動
3. 明確驗證方式
4. 風險和限制
```

### 🔹 Case Answer Framework（Boss 必背）

```
Goal      — 確認目標和成功定義
Metrics   — 定義關鍵指標和差距
Flow      — 拆解流程找 drop-off
Segment   — 切分族群找最大問題
Recommend — 提出對應 root cause 的建議
Validate  — 說明驗證方法和成功標準
```

**口訣：G-M-F-S-R-V（Goal Metrics Flow Segment Recommend Validate）**

記住：面試官看的不是你的答案對不對，而是你**思考的過程有沒有結構**。用框架展示你的思路，即使結論不完美，也會拿到高分。

"""

    // MARK: - World 1 (en)
    private static let enWorld1 = """

# World 1: Problem Decomposition Fundamentals

> **Goal:** After completing this world, you will be able to decompose vague business problems into structured analytical frameworks and answer any Case Study question with clear reasoning.
> **Target Roles:** Business Analyst, Product Analyst, Data Analyst, Strategy Analyst
> **Estimated Study Time:** 3-4 hours

---

## 1-1: Problem Classification — Business / Product / System

### Why Is Classification the First Step?

When an interviewer throws a problem at you, the first thing that should light up in your mind is: **What type of problem is this?**

Different types of problems require different analytical frameworks, different data, and different stakeholders. If you misclassify from the start, your entire analysis will go off track.

### Three Problem Types

| Type | Core Focus | Common Keywords | Typical Example |
|------|-----------|-----------------|-----------------|
| **Business Problem** | Revenue, cost, market strategy | revenue, growth, market share, pricing | "Our revenue growth is slowing down" |
| **Product Problem** | User experience, features, adoption | conversion, engagement, retention, NPS | "Users aren't using our new feature" |
| **System / Process Problem** | Efficiency, workflow, system stability | SLA, throughput, latency, error rate | "Customer service handling time has increased" |

### How to Judge? Look at "Where the Pain Point Is"

Ask yourself three questions:

1. **Is the way we make money broken?** → Business Problem
2. **Is the user's experience with the product broken?** → Product Problem
3. **Is the way we do things or our system efficiency broken?** → System Problem

### Practical Case Exercises

**Case: "Customer service ticket handling time went from 2 hours to 8 hours"**

- On the surface it looks like a customer service issue, but what is the essence?
- Has the business model changed? No. Is the product broken? Not necessarily. Has the workflow slowed down? Yes.
- → **System / Process Problem**

**Case: "Our app's daily active users dropped by 30%"**

- This problem could have multiple causes, but the core pain point is the interaction between users and the product
- → First classify as **Product Problem**, then decompose further

**Case: "A competitor launched a free version, and our new customer numbers are declining"**

- The pain point is in market competition and pricing strategy
- → **Business Problem**

### Note: Problems Overlap

A single problem may involve multiple types. For example, "customer churn rate is increasing" could be Product (product lacks value), Business (pricing too high), or System (service quality too poor).

**Interview approach:** Start analyzing with the most likely type, then tell the interviewer your reasoning. If you discover it's wrong during analysis, adjust. Interviewers evaluate your thinking process, not whether you guessed correctly from the start.

> 💡 **Framework Tip:** First step in problem classification — determine Business / Product / System, then select the corresponding analytical framework.

---

## 1-2: Steps for Decomposing Problems

### Four Steps for Structured Decomposition

When you receive a problem, don't rush to find answers. Follow these four steps:

#### Step 1: Identify the Metric

Convert the vague problem into a specific number.

- ❌ "Business is bad" → Too vague
- ✅ "Monthly revenue dropped from $500K to $420K, a 16% decline" → Analyzable

#### Step 2: Break Down the Funnel

Almost every business problem can be broken into a funnel.

**Revenue Funnel:**
```
Revenue = Traffic × Conversion Rate × Average Order Value × Repeat Rate
```

**SaaS User Funnel:**
```
Awareness → Acquisition → Activation → Retention → Revenue → Referral (AAARRR)
```

**Customer Service Efficiency Funnel:**
```
Ticket received → Assignment → Pickup → Investigation → Reply → Closure
```

After breaking it into a funnel, find **the step with the biggest drop-off**.

#### Step 3: Generate Hypotheses

Based on funnel data, hypothesize "why there's a drop."

Good hypotheses have three characteristics:
1. **Timing alignment** — The timing of the problem matches a certain change
2. **Logical reasoning** — The cause-and-effect relationship makes sense
3. **Verifiable** — You know what data or method to use for confirmation

#### Step 4: Prioritize & Validate

You may have several hypotheses — validate the most likely one first.

### Practical Case: SaaS Activation Rate Decline

**Problem:** New user 7-day activation rate dropped from 45% to 32%

**Step 1:** Metric = 7-day activation rate, defined as creating the first project within 7 days of registration

**Step 2:** Funnel Decomposition

| Step | Last Month | This Month | Drop |
|------|-----------|------------|------|
| Registration completed | 100% | 100% | — |
| Onboarding completed | 78% | 61% | -17pp |
| First project created | 45% | 32% | -13pp |

The biggest drop-off is at the onboarding step (-17pp).

**Step 3:** Hypotheses
- Hypothesis A: Onboarding was changed from 3 steps to 5 steps 3 weeks ago; the new steps created friction ✅ Timing aligns, logic is sound
- Hypothesis B: New Google Ads brought low-quality traffic ⚠️ Possible, but timing is slightly later
- Hypothesis C: Server outage ❌ Only 2 hours, limited impact

**Step 4:** Validate Hypothesis A first → Compare the completion rate of each step before and after the redesign

> 💡 **Framework Tip:** Four decomposition steps: Metric → Funnel → Hypotheses → Validate. Walk through this process in an interview, and the interviewer will see you have structure.

---

## 1-3: What to Do When Information Is Insufficient

### The Most Common Trap in Interviews

The interviewer asks you: "Our app's user engagement isn't good enough. How would you analyze it?"

**Beginner's reaction:** Jump straight into analysis, listing a bunch of possible causes.

**Expert's reaction:** Ask questions first to turn the vague problem into a clear one.

### Three Must-Ask Questions

No matter what vague problem you encounter, ask these three first:

#### 1. Definition — What is the definition?

"Engagement isn't good enough — what specifically does 'engagement' refer to here? DAU? WAU? Session duration?"

#### 2. Baseline — Compared to what?

"Not good enough compared to last month? Compared to the same period last year? Compared to competitors? Compared to your target?"

#### 3. Scope — How wide is the impact?

"Is it declining across all users, or is a specific segment particularly affected? Is it declining on all platforms, or just mobile?"

### Why Asking Questions Earns You Points

Interviewers deliberately give vague problems to see if you will proactively seek clarity.

- Answering directly → Interviewer thinks you lack rigor
- Asking the right questions → Interviewer thinks you have experience and structure

### What If There's No Data?

The interviewer might follow up: "Assume you don't have any analytics dashboard. You need to give your boss a preliminary assessment tomorrow. What would you do?"

**Qualitative Data Sources:**

| Source | Useful For | Difficulty to Obtain |
|--------|-----------|---------------------|
| Customer service tickets / complaint logs | What problems users are facing | Low |
| App Store / Google Play reviews | What users care about most | Low |
| Sales team feedback | Why customers aren't buying / renewing | Medium |
| Social media mentions | Brand perception and sentiment | Low |
| Using the product yourself (dogfooding) | Experiencing workflow issues | Low |
| Interviewing 3-5 users | Deep understanding of behavior and motivation | Medium |

**Key Principle:** When you don't have quantitative data, use qualitative signals to form hypotheses, then find a way to validate with data.

### Practical Demonstration

**Interviewer:** "Our user retention rate isn't good."

**You:** "I'd like to clarify a few things first —
1. What's the definition of retention? D7, D30, or monthly active?
2. Is it declining compared to previous months, or has it always been at this level?
3. Is it low across all users, or specific to certain cohorts?

If there's no detailed data available right now, I'd start by looking for qualitative signals from customer service tickets and app reviews. If a lot of feedback centers on 'not knowing how to get started,' I'd hypothesize the problem is in onboarding; if it's 'used it for a few weeks and didn't find it useful,' then the problem is in product value."

> 💡 **Framework Tip:** Three tools for vague problems — Definition → Baseline → Scope. Clarify first, then analyze.

---

## 1-4: Impact Analysis of Problems

### Severity Assessment: Three-Dimensional Framework

When facing multiple problems simultaneously (common in interviews), you need a method to prioritize.

```
Priority Score = Impact × Urgency × Irreversibility
```

| Dimension | High | Low |
|-----------|------|-----|
| **Impact** | Affects a large number of users or significant revenue | Affects few people or small amounts |
| **Urgency** | Problem worsens with every hour of delay | Problem doesn't worsen over time |
| **Irreversibility** | Damage cannot be undone | Can be easily fixed or compensated |

### Practical Case: Three Simultaneous Problems

A fintech company, Monday morning — three problems hit your desk at once:

1. **Landing page conversion dropped** — From 5% to 4.2%
2. **12 transactions were double-charged** — Customers are complaining on Twitter
3. **New feature adoption is only 8%** — Below the expected 20%

Analysis:

| Problem | Impact | Urgency | Irreversibility | Priority |
|---------|--------|---------|-----------------|----------|
| Landing page | Potential revenue decline (Med) | Won't worsen (Low) | Adjustable (Low) | **Third** |
| Double charges | Customer trust + compliance (High) | Ongoing exposure (High) | Already charged (High) | **First** |
| New feature adoption | Wasted resources (Med) | Stable (Low) | Adjustable (Low) | **Second** |

Double charges score highest across all three dimensions and must be addressed first.

### Stakeholder Analysis

After determining problem severity, think clearly: **Who is affected?**

Using the double-charge example:
- **Directly affected:** 12 customers who were double-charged
- **Indirectly affected:** Potential customers who see the Twitter complaints
- **Internally affected:** Engineering team (needs to fix the bug), customer service team (needs to handle complaints), legal team (compliance risk), PR team (public relations crisis)
- **Decision-makers:** CEO / CFO need to know the financial impact and response plan

### Incident Report Structure

When reporting a problem to management, use this structure:

```
1. What    — What happened?
2. Scale   — How big is the impact? (How many people, how much money, how long)
3. Why     — What is the root cause?
4. Done    — What actions have already been taken?
5. Need    — What additional resources or decisions are needed?
6. Prevent — How do we prevent it from happening again?
```

This structure is also very effective in interviews. When the interviewer asks "How would you report this problem to your boss?", answering with these six points will make you look very professional.

> 💡 **Framework Tip:** Priority = Impact × Urgency × Irreversibility. Handle the irreversible and high-impact issues first.

---

## 1-5: Structured Thinking Exercise

### Adoption Analysis: Three-Layer Model

When a product / tool / feature's usage rate falls below expectations, use these three layers to decompose:

```
Awareness → Trial → Value
Do they know about it? → Did they try it? → Is it valuable?
```

Each layer has different problems and solutions:

| Layer | Problem | Solution Direction |
|-------|---------|-------------------|
| **Awareness** | Don't know it exists | Promotion, announcements, training |
| **Trial** | Know about it but don't want to try / tried but had a bad experience | Lower barriers, improve onboarding |
| **Value** | Tried it but didn't feel the value | Improve core functionality, find the aha moment |

### Practical Case: The Unused Expense Report System

**Scenario:** A company of 500 people needs expense reimbursement. One month after the new system launched, only 24% have used it.

| Segment | Count | Percentage |
|---------|-------|-----------|
| Continued usage | 75 | 15% |
| Used once then abandoned | 45 | 9% |
| Never used | 380 | 76% |

**Decomposition using the three-layer model:**

- **Awareness:** Survey found 85% know about the new system → Not the main issue
- **Trial:** The main reason 45 people abandoned was "too many steps to upload receipts" → **Primary problem**
- **Value:** Continuing users report "reimbursement went from 2 weeks to 3 days" → Value has been validated

### From Analysis to Recommendations

After completing the analysis, the interviewer will ask: "So what's your recommendation?"

Many people get stuck at this step — they analyze well but can't provide concrete actions.

**Good Recommendation Formula:**

```
1. Address the Root Cause — Your recommendation should directly solve the discovered problem
2. Minimum Viable Change — Don't suggest "complete redesign"; propose the smallest change
3. Clear Validation Method — Explain how you'll know if it worked
4. Risks and Limitations — Proactively mention potential risks
```

**Using the Expense Report System as an example:**

"Based on the analysis, the problem is concentrated at the Trial Experience layer — the receipt upload process is too complex. My recommendation is:

1. **Change:** Simplify the receipt upload process (e.g., support direct photo upload, reduce manual entry fields)
2. **Validation:** After improvement, invite the 45 people who previously abandoned to retry, and track their completion rate
3. **Promotion:** Use the positive feedback from continuing users (reimbursement went from 2 weeks to 3 days) as social proof
4. **Risk:** Requires engineering resources, estimated 2 weeks of development time. If adoption remains low after simplification, we need to re-examine whether there are other barriers."

> 💡 **Framework Tip:** Adoption three-layer decomposition — Awareness → Trial → Value → then prescribe the right remedy.

---

## 1-6 (Boss): Complete Case Decomposition

### Case Answer Framework

When answering a complete Case in an interview, use this six-step framework:

```
Goal → Metrics → Flow → Segment → Recommend → Validate
```

#### Step 1: Goal — Confirm the Objective

"Let me first confirm — what is the core objective of this problem? What outcome are we hoping to achieve?"

#### Step 2: Metrics — Define the Metrics

"To measure this objective, what are the most critical metrics? What are the current values? What's the target?"

#### Step 3: Flow — Decompose the Process

"Behind this metric, what does the process look like? Let me break it into several steps to examine."

#### Step 4: Segment — Slice by Groups

"Let me segment by [user type / plan / region / channel] to see whether the problem is widespread or concentrated in a specific segment."

#### Step 5: Recommend — Provide Recommendations

"Based on the analysis, the main problem is in [specific segment] at [specific step]. My recommendation is..."

#### Step 6: Validate — Explain Validation

"I would use [method] to validate whether this recommendation is effective, with the success metric being [target metric]."

### Complete Case Demonstration: Declining Renewal Rate

**Problem:** B2B SaaS annual renewal rate dropped from 85% to 72%

**Step 1: Goal**
"The objective is to identify the root cause of the renewal rate decline and propose a plan to bring the renewal rate back to at least 80%."

**Step 2: Metrics**
"The primary metric is the annual renewal rate, which dropped from 85% to 72% — a 13pp decline. As secondary metrics, I would look at renewal rates by plan, usage patterns, and NPS."

**Step 3: Flow**
"The renewal process is roughly: Use the product → Experience value → Receive renewal reminder → Decide to renew. Each step could lead to churn."

**Step 4: Segment**
After segmentation:

| Plan | Customers | Renewal Rate Change |
|------|-----------|-------------------|
| Starter ($99/yr) | 2,000 | 78% → 61% (-17pp) |
| Professional ($499/yr) | 800 | 88% → 82% (-6pp) |
| Enterprise ($2,999/yr) | 150 | 95% → 93% (-2pp) |

The problem is concentrated in the Starter plan. Further investigation reveals:
- Starter users use only 3 out of 15 features on average
- Non-renewers stopped using the product 60 days before expiration
- 6 months ago, the Gantt Chart feature was moved from Starter to Professional
- Most common customer service inquiry: "Where did the Gantt Chart go?"

**Root Cause:** A core feature was removed from the Starter plan, causing users to lose their reason to stay.

**Step 5: Recommend**
"I have two recommendations, one short-term and one long-term:

Short-term (1-2 weeks): Restore a simplified version of the Gantt Chart to Starter (keep advanced features in Professional as an upsell incentive). Simultaneously, proactively contact Starter customers approaching expiration to inform them of the feature restoration.

Long-term (1-3 months): Build a Health Score early warning system — when a user hasn't logged in for 30 days, automatically trigger CSM outreach instead of waiting until renewal time."

**Step 6: Validate**
"I would track:
- Whether the Starter renewal rate returns to 70%+ in the next quarter
- The usage rate of the simplified Gantt Chart
- The percentage of users who return due to outreach
If the Starter renewal rate doesn't improve, we need to re-examine whether other factors are at play (e.g., competitors' free alternatives)."

---

## Appendix: Essential Framework Quick Reference

### 🔹 Problem Classification

```
Business Problem → Affects revenue, strategy, market positioning
Product Problem  → Affects user experience, features, adoption
System Problem   → Affects efficiency, cost, stability
```

### 🔹 Four Steps for Problem Decomposition

```
1. Metric     — Turn the problem into a number
2. Funnel     — Break into steps, find the biggest drop-off
3. Hypotheses — Generate hypotheses based on timing and logic
4. Validate   — Validate the most likely hypothesis
```

### 🔹 Three Tools for Vague Problems

```
1. Definition — What is the definition of this metric?
2. Baseline   — Compared to what? (Time / Competitors / Target)
3. Scope      — How wide is the impact? (All users / Specific segment)
```

### 🔹 Priority Assessment

```
Priority = Impact × Urgency × Irreversibility
Handle first: High-impact, time-sensitive, irreversible problems
```

### 🔹 Incident Report Structure

```
What → Scale → Why → Done → Need → Prevent
```

### 🔹 Adoption Three-Layer Analysis

```
Awareness — Do they know? → Promote
Trial     — Did they try?  → Lower barriers
Value     — Is it useful?  → Improve functionality
```

### 🔹 Recommendation Formula

```
1. Address the Root Cause
2. Minimum Viable Change
3. Clear Validation Method
4. Risks and Limitations
```

### 🔹 Case Answer Framework (Boss Must-Know)

```
Goal      — Confirm the objective and definition of success
Metrics   — Define key metrics and gaps
Flow      — Decompose the process to find drop-offs
Segment   — Slice by groups to find the biggest problem
Recommend — Propose recommendations addressing the root cause
Validate  — Explain the validation method and success criteria
```

**Mnemonic: G-M-F-S-R-V (Goal Metrics Flow Segment Recommend Validate)**

Remember: Interviewers don't evaluate whether your answer is correct — they evaluate whether your **thinking process has structure**. Use frameworks to demonstrate your reasoning, and even if the conclusion isn't perfect, you'll score highly.

"""

    // MARK: - World 2 (zh)
    private static let zhWorld2 = """

# World 2：KPI 與商業指標

> **目標：** 學完後你能在面試中正確選擇指標、解讀數據、辨別指標之間的關係，並針對不同角色設計 dashboard
> **適用角色：** Product Analyst、Business Analyst、Data Analyst、Product Manager
> **預計學習時間：** 約 3-4 天

---

## 2-1：KPI 基礎概念

### 什麼是 KPI？

KPI（Key Performance Indicator）是「關鍵績效指標」——用一個數字來回答「我們做得好不好？」

但注意重點在 **Key**。一家公司有幾百個可以追蹤的指標，但 KPI 通常只有 3-5 個。如果什麼都是 KPI，那就什麼都不是 KPI。

**KPI 的三個條件：**

| 條件 | 說明 | 反例 |
|------|------|------|
| Measurable（可量化）| 能用數字表達 | 「使用者體驗好」不算，「NPS > 50」才算 |
| Actionable（可行動）| 團隊能影響它 | 「GDP 成長率」PM 無法控制 |
| Aligned（對齊目標）| 跟公司/團隊目標直接相關 | 追蹤 page views 但目標是轉換率 |

---

### Leading vs Lagging Metrics

這是面試高頻考點。兩者的差別：

**Lagging Metrics（滯後指標）**
- 反映「已經發生的結果」
- 確認你做得好不好
- 例子：營收、客戶流失率、NPS、季度成交額

**Leading Metrics（領先指標）**
- 預測「未來可能的結果」
- 讓你在問題發生前採取行動
- 例子：Sales pipeline 數量、Activation rate、Feature adoption、Trial-to-paid conversion

**用一個比喻理解：**

> Lagging metric 像是「體重計上的數字」——你已經胖了才看到。
> Leading metric 像是「每天攝取的卡路里」——你可以在體重增加之前就調整。

**實戰案例：SaaS 公司**

```
目標：降低客戶流失率（Churn Rate）← 這是 lagging metric

Leading metrics 可以用：
├── 產品使用頻率（usage frequency）
│   → 用越少的客戶越可能流失
├── Support ticket 數量
│   → 問題多的客戶容易不滿
├── Feature adoption rate
│   → 只用基本功能的客戶替代性高
└── 合約到期前 90 天的 NPS
    → 低 NPS 預示不續約
```

**面試技巧：** 當面試官問你「怎麼衡量 X 的成功？」，如果你能同時給出 leading 和 lagging metrics，會比只給一個指標更有深度。

---

### Guardrail Metrics（護欄指標）

Guardrail 是「不能惡化的底線」。你追求 primary metric 的改善，但不能以犧牲 guardrail 為代價。

**為什麼需要 guardrail？**

因為幾乎任何指標都可以被「作弊」：
- 想提升 DAU？→ 狂發 push notification → 使用者體驗變差
- 想提升轉換率？→ 免運費 + 大折扣 → 吸引薅羊毛的人，AOV 暴跌
- 想降低 cycle time？→ 跳過品質檢查 → 錯誤率飆升

**Guardrail 的設定原則：**

1. **跟 primary metric 可能衝突的指標**：速度 vs 品質、成長 vs 單位經濟
2. **使用者體驗指標**：NPS、投訴率、退貨率
3. **長期健康指標**：Retention、LTV、品牌信任度

**面試中的標準回答格式：**

> 「我會把 [X] 作為 primary metric，同時設 [Y] 和 [Z] 作為 guardrail，確保我們不會為了短期 [X] 的提升而傷害 [Y] 和 [Z]。」

---

## 2-2：Product & User Metrics

### DAU / MAU / WAU 與 Stickiness Ratio

**基本定義：**

| 指標 | 全名 | 定義 |
|------|------|------|
| DAU | Daily Active Users | 一天內有活躍行為的不重複使用者數 |
| WAU | Weekly Active Users | 一週內有活躍行為的不重複使用者數 |
| MAU | Monthly Active Users | 一個月內有活躍行為的不重複使用者數 |

**關鍵問題：「Active」怎麼定義？**

這是面試中常被追問的細節。「Active」不一定是「打開 app」：

- 社交 app：發送或接收訊息（不只是打開）
- 電商：瀏覽商品或下單（不只是登入）
- SaaS 工具：執行核心操作（如建立報表、編輯文件）

**Stickiness Ratio = DAU / MAU**

衡量「使用者有多常回來用」。

```
DAU/MAU = 50%  → 平均每個月活躍用戶有一半的天數在用
DAU/MAU = 10%  → 每月大約用 3 天
DAU/MAU = 3%   → 每月大約用 1 天
```

**不同品類的 benchmark 完全不同：**

| 品類 | 典型 DAU/MAU | 原因 |
|------|-------------|------|
| 社交/通訊 | 50-65% | 天天聊天是正常的 |
| 工作工具（Slack、Notion）| 25-40% | 工作日才用 |
| 電商 | 5-15% | 不會天天買東西 |
| 理財/銀行 | 3-10% | 偶爾查餘額 |
| 旅遊 | 1-5% | 出發前才密集使用 |

**面試陷阱：** 面試官可能給你一個 DAU/MAU = 8% 的理財 app，然後問「這個指標好不好？」答案不是「不好」，而是「要看 category benchmark」。

---

### Retention 與 Cohort Analysis

**Retention（留存率）** 回答的問題是：「新來的使用者，過一段時間後還有多少人在用？」

**常見的 retention 指標：**

- **Day 1 Retention**：第一天來的人，第二天還有多少回來？（通常 30-50% 算好）
- **Day 7 Retention**：一週後還有多少人？（通常 15-25%）
- **Day 30 Retention**：一個月後？（通常 5-15%）

**Cohort Analysis（同期群分析）**

Cohort 就是「同一時期加入的一群人」。為什麼要分 cohort？因為整體 retention 可能被混淆。

```
例子：整體 Day 7 Retention 是 20%

但按 cohort 拆：
├── 1 月加入的 cohort：Day 7 = 25%
├── 2 月加入的 cohort：Day 7 = 22%
├── 3 月加入的 cohort：Day 7 = 18%
└── 4 月加入的 cohort：Day 7 = 12%

趨勢在惡化！如果只看整體 20%，你會以為很穩定。
```

**經典 Retention Curve 形狀：**

```
好的 retention curve：
100% ──╲
        ╲
         ╲___________  ← 趨於平穩（找到了核心使用者）
              ↑
         inflection point

壞的 retention curve：
100% ──╲
        ╲
         ╲
          ╲
           ╲________  → 0%  ← 所有人最終都離開了
```

---

### Feature Adoption Metrics

衡量一個新功能有沒有被成功採用，用 **Adoption Funnel**：

```
Exposed（看到入口）
  ↓ Discovery Rate
Clicked（點擊進入）
  ↓ Activation Rate
Completed（完成首次使用）
  ↓ Retention Rate
Retained（持續回來使用）
```

**分析重點：找最大的 drop-off**

如果 Exposed → Clicked 很低：功能太隱蔽，使用者找不到
如果 Clicked → Completed 很低：首次使用體驗有 friction，流程太複雜
如果 Completed → Retained 很低：功能沒有持續價值，用一次就夠了

**面試中常見的問法：**
- 「你怎麼評估一個功能是否成功？」
- 「這個功能上線兩週，你會看什麼數據？」

標準答案就是畫出 adoption funnel，找 bottleneck。

---

### Correlation vs Causation（相關性 vs 因果關係）

這是 PA/DA 面試最重要的概念之一。

**經典陷阱：**

> 「使用 Feature X 的用戶，retention 比沒使用的高 30%。」
> → 結論：Feature X 提升了 retention？

**不一定！** 有三種可能：

1. **X 導致 Y**：Feature X 真的讓人留下來
2. **Y 導致 X**：本來就會留下來的 power user 更願意嘗試新功能
3. **Z 同時導致 X 和 Y**：例如某個行銷活動同時帶來了高品質用戶（留存高）和功能曝光（adoption 高）

**怎麼驗證因果？**

| 方法 | 說明 | 適用場景 |
|------|------|---------|
| A/B Test（隨機分配）| 隨機讓一部分人看到功能、一部分不看到 | 最可靠，但需要足夠流量 |
| PSM（Propensity Score Matching）| 找特徵相似但行為不同的使用者比較 | 無法做 A/B test 時 |
| Natural Experiment | 利用自然發生的隨機事件 | 事後分析 |
| Diff-in-Diff | 比較實驗組和對照組在介入前後的差異 | 政策或功能的大規模上線 |

**面試技巧：** 每次看到 observational data（非實驗數據）的「A 比 B 好」，第一反應要問「有沒有 selection bias？」

---

## 2-3：Business & Operations Metrics

### Cycle Time（週期時間）

從流程開始到完成所花的時間。

**為什麼 cycle time 重要？**
- 客戶等待時間 → 滿意度
- 資金週轉速度 → 現金流
- 發現問題到修復的速度 → 風險控制

**分析方法：分解每一步**

```
訂單處理流程 cycle time 分析：

步驟              平均時間    目標    差距
下單→付款確認      0.5 hr     1 hr    -
付款→撿貨          4 hr       2 hr    +2 hr
撿貨→品質檢查      1 hr       1 hr    -
品質檢查→包裝      6 hr       1 hr    +5 hr  ← bottleneck！
包裝→出貨          1.5 hr     2 hr    -

總計               13 hr      7 hr    +6 hr
```

**找到 bottleneck 後，下一步是問 why：**
- 是人手不夠？（capacity issue）
- 是排隊等待？（queue issue）
- 是重工太多？（quality issue）
- 是流程設計不合理？（process issue）

---

### Throughput（吞吐量）與 Completion Rate（完成率）

**Throughput** = 單位時間內完成的數量

```
例：倉庫每天處理 500 筆訂單
例：客服團隊每小時回覆 30 張 ticket
例：工程團隊每個 sprint 完成 45 個 story points
```

**Completion Rate** = 成功完成的比例

```
例：訂單完成率 = 成功送達的訂單 / 總訂單 = 94%
例：表單提交完成率 = 送出表單的人 / 開始填寫的人 = 68%
```

**Throughput 和 Cycle Time 的關係（Little's Law）：**

> **WIP = Throughput × Cycle Time**
>
> WIP（Work in Progress）= 同時進行中的工作量

如果 cycle time 變長但 throughput 不變，代表 WIP 在增加（積壓變多）。

---

### SLA（Service Level Agreement）與 Error Rate

**SLA** 是你對客戶/內部的服務承諾。

```
SLA 範例（IT Support）：
├── P1（系統故障）：1 小時內回應，4 小時內解決
├── P2（功能異常）：4 小時內回應，24 小時內解決
└── P3（一般問題）：24 小時內回應，72 小時內解決
```

**SLA 分析的關鍵思維：Priority × 達成率**

不是所有 SLA miss 都一樣嚴重：
- P3 miss 10% → 45 張 ticket 晚了，影響有限
- P1 miss 27% → 4 張系統故障超時未解決，可能全公司停擺

**Error Rate（錯誤率）**

```
Error Rate = 有錯誤的交易 / 總交易

常見 benchmark：
├── 金融交易：< 0.01%（非常嚴格）
├── 電商訂單：< 2%
├── 外送訂單：< 3%
└── 客服回覆：< 5%
```

---

### Cost Per Transaction（單筆交易成本）

每完成一筆交易要花多少成本。

```
Cost Per Transaction = 總營運成本 / 總交易數

例：
客服中心月成本 $50,000，處理 10,000 張 ticket
→ Cost per ticket = $5

如果導入 chatbot 後：
月成本 $55,000（多了 chatbot 費用），但處理 18,000 張 ticket
→ Cost per ticket = $3.06（下降 39%）
```

**Cost per transaction 是 Ops 團隊的核心 KPI 之一**，直接影響 unit economics 和可擴展性。

---

## 2-4：Success Metrics 怎麼定

### 為一個專案/功能定 Success Metric

面試常見問法：「如果你是這個專案的 PM/PA，你怎麼定義成功？」

**三步驟框架：**

```
Step 1：回到目標
  → 這個專案/功能要解決什麼問題？

Step 2：找到最直接的衡量方式
  → 「問題被解決」用什麼數字來表達？

Step 3：加上 guardrail
  → 達成目標的同時，什麼不能惡化？
```

**實戰案例：Sales Dashboard 專案**

```
目標：讓業務團隊自助查報表，不再需要每週找 data team

Step 1：問題是「data team 被太多 ad-hoc 請求佔據時間」
Step 2：Success metric = ad-hoc 報表請求數量下降
Step 3：Guardrail = 業務團隊的報表品質不能下降（避免看錯數據）

不好的 success metric：
├── DAU → 衡量「有人用」，不是「解決問題」
├── 業績提升 → 太間接，受太多因素影響
└── 滿意度問卷 → 主觀，不直接
```

---

### Primary Metric vs Proxy Metric

**Primary Metric** = 直接衡量目標是否達成
**Proxy Metric** = 間接相關的替代指標

```
例子 1：
目標：提升客戶忠誠度
Primary：Retention Rate / Repeat Purchase Rate
Proxy：NPS、CSAT

例子 2：
目標：提升產品使用者的工作效率
Primary：完成核心任務的時間（task completion time）
Proxy：DAU、session 時長

例子 3：
目標：降低客服成本
Primary：Cost per ticket
Proxy：Chatbot 解決率、First contact resolution rate
```

**什麼時候用 proxy？**
- Primary metric 太慢（如 LTV 要等 12 個月才能算）
- Primary metric 不好量測（如「使用者信任度」）
- Primary metric 受太多外部因素干擾

**面試技巧：** 如果你用 proxy metric，要能解釋「為什麼這個 proxy 跟 primary 有高相關性」。不要理所當然地假設。

---

### 指標衝突時怎麼辦？

當兩個指標互相矛盾，用 **Primary + Guardrail 框架**：

```
情境：外送平台

指標 A：訂單完成時間（越快越好）
指標 B：訂單正確率（越高越好）

為了搶快送餐 → 送錯餐
為了確保正確 → 要更多時間

解法：
Primary = 訂單完成時間（優化方向）
Guardrail = 訂單正確率 ≥ 98%（不能低於這個底線）
```

**面試中的萬用回答：**

> 「這兩個指標衝突的時候，我會選 [更難恢復的那個] 作為 guardrail，[更容易優化的那個] 作為 primary。因為一旦 [guardrail] 惡化，修復成本很高。」

---

## 2-5：不同角色看不同指標

### 每個角色的「指標世界觀」

不同角色因為負責不同的事，看重完全不同的指標。

**CEO / CFO（管營收與策略）**

```
核心指標：
├── Revenue / MRR / ARR（我們賺多少？）
├── Growth Rate（成長多快？）
├── CAC / LTV / LTV:CAC ratio（單位經濟健不健康？）
├── Gross Margin（毛利率多少？）
└── Burn Rate / Runway（錢還能燒多久？）

決策場景：
「要不要進入新市場？」→ 看 TAM、CAC、LTV
「要不要漲價？」→ 看 price elasticity、churn rate
「要不要融資？」→ 看 burn rate、runway
```

**Product Manager（管產品與使用者）**

```
核心指標：
├── DAU / MAU / Stickiness（使用者活躍嗎？）
├── Retention（使用者留下來嗎？）
├── Feature Adoption（新功能有人用嗎？）
├── Activation Rate（新用戶有成功啟用嗎？）
└── NPS / CSAT（使用者滿意嗎？）

決策場景：
「這個功能要不要做？」→ 看 user research + 預期對 retention 的影響
「功能做完了，成功嗎？」→ 看 adoption funnel + retention impact
```

**Customer Success Manager（管客戶關係與續約）**

```
核心指標：
├── Customer Health Score（哪個客戶有風險？）
├── NPS / CSAT（客戶感受如何？）
├── Churn Rate / Renewal Rate（客戶有在續約嗎？）
├── Expansion Revenue（既有客戶有在加購嗎？）
└── Time to Value（客戶多快開始得到價值？）

決策場景：
「這週要主動聯繫哪些客戶？」→ 看 health score 最低的
「這個客戶會不會續約？」→ 看 usage trend + NPS + support tickets
```

**Operations Manager（管營運效率）**

```
核心指標：
├── Cycle Time（流程要多久？）
├── Throughput（每天處理多少？）
├── SLA 達成率（有沒有達到服務承諾？）
├── Error Rate（錯誤率多少？）
└── Cost per Transaction（每筆交易成本？）

決策場景：
「要不要加人？」→ 看 throughput 是否能跟上需求成長
「流程要不要改？」→ 看 cycle time 和 bottleneck 分析
```

---

### Dashboard 設計原則

設計 dashboard 的核心問題不是「放什麼指標」，而是：

```
1. Audience → 誰在看？
2. Decision → 他需要做什麼決策？
3. Metrics  → 他需要什麼資訊來做這個決策？
```

**常見錯誤：**

| 錯誤 | 為什麼不好 |
|------|-----------|
| 一個 dashboard 給所有人看 | 不同人需要不同層級的資訊，CEO 不需要看每個 feature 的 adoption |
| 放太多指標（>10 個）| 資訊過載，反而什麼都看不出來 |
| 只放 lagging metrics | 看到問題的時候已經太晚了 |
| 沒有 benchmark / 目標線 | 一個數字沒有比較對象就沒有意義 |

**好的 dashboard 結構：**

```
├── 1-2 個 headline metrics（一眼看到整體狀況）
├── 3-5 個 supporting metrics（解釋 headline 為什麼好/壞）
├── 趨勢圖（看方向，不只看數字）
├── 目標線（跟 target 比較）
└── 可以 drill down（點進去看細節）
```

---

## 2-6（Boss）：綜合指標分析

### Marketplace 健康度分析

Marketplace 是面試高頻場景（Uber、Airbnb、Shopee、外送平台...）。

**Marketplace 的三個面向：**

```
Supply Side（供給端）     Demand Side（需求端）     Platform（平台自身）
├── 供應商數量             ├── 買家數量              ├── GMV
├── 供應商 NPS             ├── 買家活躍度            ├── Take Rate
├── 新供應商加入率         ├── 訂單頻率              ├── 訂單完成率
├── 供應商流失率           ├── 搜尋轉換率            ├── 平均配對時間
└── 供應品質/評分          └── 客戶 NPS              └── 毛利率
```

**三個面向要一起看！** 只看 GMV 可能被誤導：

```
場景：GMV 季增 15%，CEO 覺得不太對

深入分析：
├── Supply：供應商 -12.5%，NPS -14pts，新加入 -60% → 惡化
├── Demand：採購商 +12.5% → 還行
├── Platform：Take rate 8% → 12%，完成率 94% → 88% → 惡化

結論：GMV 成長是靠 AOV 暴漲（少數大單），但供應端在崩解。
根因：Take rate 漲太多，供應商不滿 → 流失 → 長期不可持續。
```

---

### 如何診斷「Headline Metric 好看但底層不健康」

這是 PA/BA 面試的經典題型。面試官給你一個「看起來很好」的數據，考你能不能看出背後的問題。

**診斷步驟：**

```
Step 1：拆解 headline metric
  → Revenue = Users × Orders per User × AOV
  → GMV = Buyers × Orders × AOV
  → 哪個部分在驅動成長？是健康的驅動因子嗎？

Step 2：看 composition（組成）
  → 成長是來自所有客戶，還是集中在少數大客戶？
  → 新客戶 vs 舊客戶的貢獻比例？
  → 如果拿掉 Top 5 客戶，數字還好看嗎？

Step 3：看 leading indicators
  → 雖然 lagging metric 好看，leading metrics 有沒有惡化的跡象？
  → pipeline、activation、retention 趨勢如何？

Step 4：看 guardrail metrics
  → 有沒有「為了好看的 headline 犧牲了什麼」？
  → Unit economics、satisfaction、quality 有沒有變差？
```

**常見的「好看但不健康」模式：**

| 模式 | Headline 看起來好 | 底層問題 |
|------|------------------|---------|
| 大客戶集中 | Revenue +20% | 前 3 大客戶貢獻 70% 營收，一個流失就崩盤 |
| 促銷驅動 | 訂單量 +50% | AOV 暴跌、退貨率暴增、回購率極低 |
| 新客掩蓋流失 | MAU 持平 | 新客不斷進來，但舊客不斷流失（leaky bucket） |
| 犧牲供給端 | GMV +15% | Take rate 暴漲、供應商流失、平台長期不可持續 |
| 短期行為 | Activation rate +30% | 降低 activation 標準、品質下降，後續 retention 很差 |

---

## Cheat Sheet：常見指標速查表

### Growth & Revenue Metrics

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| MRR / ARR | Monthly / Annual Recurring Revenue | SaaS |
| Revenue Growth Rate | (本期 - 上期) / 上期 | 所有公司 |
| GMV | Gross Merchandise Value（平台總交易額）| Marketplace |
| Take Rate | 平台抽成 / GMV | Marketplace |
| ARPU | Revenue / Active Users | 所有產品 |

### User & Product Metrics

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| DAU / MAU | Daily / Monthly Active Users | 所有產品 |
| Stickiness | DAU / MAU | 產品黏性 |
| Retention Rate | Day N 回來的人 / Day 0 的人 | 所有產品 |
| Activation Rate | 完成核心動作的新用戶 / 總新用戶 | Onboarding |
| Feature Adoption | 使用功能的人 / 有機會看到功能的人 | 功能評估 |
| NPS | Promoters% - Detractors%（-100 到 +100）| 滿意度 |
| CSAT | 滿意回覆數 / 總回覆數 | 單次互動滿意度 |

### Unit Economics

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| CAC | Customer Acquisition Cost（獲客成本）| 成長策略 |
| LTV | Lifetime Value（客戶終身價值）| 客戶策略 |
| LTV:CAC Ratio | LTV / CAC（>3 通常算健康）| 商業模式驗證 |
| Payback Period | CAC / Monthly Revenue per Customer | 現金流規劃 |
| Gross Margin | (Revenue - COGS) / Revenue | 定價策略 |

### Retention & Churn

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| Churn Rate | 流失客戶 / 期初客戶 | SaaS、訂閱制 |
| Revenue Churn | 流失的 MRR / 期初 MRR | SaaS |
| Net Revenue Retention | (期初 MRR + Expansion - Churn) / 期初 MRR | SaaS（>100% 代表舊客在加購）|
| Cohort Retention | 特定 cohort 在 Day N 的留存 | 趨勢分析 |

### Operations Metrics

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| Cycle Time | 流程開始到完成的時間 | 效率分析 |
| Throughput | 單位時間完成的數量 | 產能分析 |
| SLA 達成率 | 達標的 ticket / 總 ticket | IT、客服 |
| Error Rate | 有錯誤的交易 / 總交易 | 品質控制 |
| Cost per Transaction | 總成本 / 總交易數 | 營運效率 |
| First Contact Resolution | 第一次接觸就解決的比例 | 客服 |

### Marketplace Metrics

| 指標 | 公式 / 定義 | 適用場景 |
|------|------------|---------|
| Liquidity | 成功配對 / 總需求 | 供需匹配效率 |
| Time to Match | 從發需求到成功配對的時間 | 使用者體驗 |
| Supply/Demand Ratio | 供給量 / 需求量 | 供需平衡 |
| Repeat Rate | 回來再次交易的比例（供給端 + 需求端分開看）| 平台黏性 |

---

## 面試常見問題與回答框架

**Q：你怎麼為 X 定 success metric？**
> 1. 確認目標是什麼
> 2. 找直接衡量目標的 primary metric
> 3. 加上 guardrail metrics
> 4. 區分 leading vs lagging

**Q：這個指標好不好？**
> 1. 跟什麼比？（benchmark、historical、target）
> 2. 什麼 context？（品類、市場、季節）
> 3. 趨勢是什麼？（改善中 vs 惡化中）

**Q：如果兩個指標衝突怎麼辦？**
> 1. 選一個做 primary（優化方向）
> 2. 另一個做 guardrail（底線不能破）
> 3. 解釋為什麼這樣選（通常更難修復的做 guardrail）

**Q：你會設計什麼 dashboard？**
> 1. 先問「給誰看？」
> 2. 再問「他要做什麼決策？」
> 3. 最後才選指標

"""

    // MARK: - World 2 (en)
    private static let enWorld2 = """

# World 2: KPIs and Business Metrics

> **Goal:** After completing this world, you will be able to correctly select metrics, interpret data, identify relationships between metrics, and design dashboards for different roles in an interview setting.
> **Target Roles:** Product Analyst, Business Analyst, Data Analyst, Product Manager
> **Estimated Study Time:** 3-4 days

---

## 2-1: KPI Fundamentals

### What Is a KPI?

KPI (Key Performance Indicator) is a number that answers the question "How are we doing?"

But the emphasis is on **Key**. A company has hundreds of trackable metrics, but KPIs typically number only 3-5. If everything is a KPI, then nothing is a KPI.

**Three Conditions for a KPI:**

| Condition | Description | Counter-example |
|-----------|-------------|-----------------|
| Measurable | Can be expressed as a number | "Good user experience" doesn't count; "NPS > 50" does |
| Actionable | The team can influence it | "GDP growth rate" is beyond a PM's control |
| Aligned | Directly related to company/team goals | Tracking page views when the goal is conversion rate |

---

### Leading vs Lagging Metrics

This is a high-frequency interview topic. The difference:

**Lagging Metrics**
- Reflect "results that have already happened"
- Confirm whether you did well or not
- Examples: Revenue, churn rate, NPS, quarterly sales

**Leading Metrics**
- Predict "likely future outcomes"
- Allow you to act before problems occur
- Examples: Sales pipeline count, activation rate, feature adoption, trial-to-paid conversion

**An analogy to understand:**

> A lagging metric is like "the number on a scale" — you only see it after you've gained weight.
> A leading metric is like "daily calorie intake" — you can adjust before weight increases.

**Practical Case: SaaS Company**

```
Goal: Reduce churn rate ← This is a lagging metric

Leading metrics to use:
├── Product usage frequency
│   → Customers who use less are more likely to churn
├── Support ticket volume
│   → Customers with many issues are more likely to be dissatisfied
├── Feature adoption rate
│   → Customers using only basic features are easily replaceable
└── NPS 90 days before contract expiration
    → Low NPS signals non-renewal
```

**Interview Tip:** When the interviewer asks "How would you measure the success of X?", providing both leading and lagging metrics shows more depth than giving just one metric.

---

### Guardrail Metrics

A guardrail is "the baseline that must not deteriorate." You pursue improvement in your primary metric, but not at the expense of your guardrail.

**Why Are Guardrails Needed?**

Because almost any metric can be "gamed":
- Want to boost DAU? → Spam push notifications → User experience degrades
- Want to boost conversion rate? → Free shipping + heavy discounts → Attracts deal-seekers, AOV plummets
- Want to reduce cycle time? → Skip quality checks → Error rate spikes

**Principles for Setting Guardrails:**

1. **Metrics that may conflict with the primary metric**: Speed vs quality, growth vs unit economics
2. **User experience metrics**: NPS, complaint rate, return rate
3. **Long-term health metrics**: Retention, LTV, brand trust

**Standard Interview Answer Format:**

> "I would set [X] as the primary metric, with [Y] and [Z] as guardrails, ensuring we don't sacrifice [Y] and [Z] for short-term gains in [X]."

---

## 2-2: Product & User Metrics

### DAU / MAU / WAU and Stickiness Ratio

**Basic Definitions:**

| Metric | Full Name | Definition |
|--------|-----------|-----------|
| DAU | Daily Active Users | Number of unique users with active behavior in one day |
| WAU | Weekly Active Users | Number of unique users with active behavior in one week |
| MAU | Monthly Active Users | Number of unique users with active behavior in one month |

**Key Question: How is "Active" Defined?**

This is a detail commonly probed in interviews. "Active" doesn't necessarily mean "opened the app":

- Social app: Sent or received a message (not just opened)
- E-commerce: Browsed products or placed an order (not just logged in)
- SaaS tool: Performed a core action (e.g., created a report, edited a document)

**Stickiness Ratio = DAU / MAU**

Measures "how often users come back."

```
DAU/MAU = 50%  → On average, a monthly active user is active half the days
DAU/MAU = 10%  → Active about 3 days per month
DAU/MAU = 3%   → Active about 1 day per month
```

**Benchmarks vary dramatically by category:**

| Category | Typical DAU/MAU | Reason |
|----------|----------------|--------|
| Social/Messaging | 50-65% | Daily chatting is normal |
| Work tools (Slack, Notion) | 25-40% | Used only on workdays |
| E-commerce | 5-15% | People don't buy things every day |
| Finance/Banking | 3-10% | Occasional balance checks |
| Travel | 1-5% | Intensive use only before trips |

**Interview Trap:** The interviewer might give you a finance app with DAU/MAU = 8% and ask "Is this metric good or bad?" The answer isn't "bad" — it's "you need to look at the category benchmark."

---

### Retention and Cohort Analysis

**Retention** answers the question: "Of the new users who came, how many are still using the product after some time?"

**Common retention metrics:**

- **Day 1 Retention**: Of those who came on day 1, how many returned on day 2? (typically 30-50% is good)
- **Day 7 Retention**: How many after one week? (typically 15-25%)
- **Day 30 Retention**: After one month? (typically 5-15%)

**Cohort Analysis**

A cohort is "a group of people who joined during the same time period." Why segment by cohort? Because overall retention can be misleading.

```
Example: Overall Day 7 Retention is 20%

But broken down by cohort:
├── January cohort: Day 7 = 25%
├── February cohort: Day 7 = 22%
├── March cohort: Day 7 = 18%
└── April cohort: Day 7 = 12%

The trend is worsening! Looking only at the overall 20%, you'd think it's stable.
```

**Classic Retention Curve Shapes:**

```
Good retention curve:
100% ──╲
        ╲
         ╲___________  ← Flattens out (found core users)
              ↑
         inflection point

Bad retention curve:
100% ──╲
        ╲
         ╲
          ╲
           ╲________  → 0%  ← Everyone eventually leaves
```

---

### Feature Adoption Metrics

To measure whether a new feature has been successfully adopted, use the **Adoption Funnel**:

```
Exposed (saw the entry point)
  ↓ Discovery Rate
Clicked (clicked to enter)
  ↓ Activation Rate
Completed (completed first use)
  ↓ Retention Rate
Retained (continued returning to use)
```

**Analysis Focus: Find the Biggest Drop-off**

If Exposed → Clicked is low: Feature is too hidden; users can't find it
If Clicked → Completed is low: First-time experience has friction; process is too complex
If Completed → Retained is low: Feature lacks ongoing value; one-time use is enough

**Common interview questions:**
- "How would you evaluate whether a feature is successful?"
- "This feature launched two weeks ago. What data would you look at?"

The standard answer is to draw the adoption funnel and find the bottleneck.

---

### Correlation vs Causation

This is one of the most important concepts in PA/DA interviews.

**Classic Trap:**

> "Users who use Feature X have 30% higher retention than those who don't."
> → Conclusion: Feature X improves retention?

**Not necessarily!** Three possibilities:

1. **X causes Y**: Feature X truly keeps people around
2. **Y causes X**: Power users who would stay anyway are more willing to try new features
3. **Z causes both X and Y**: For example, a marketing campaign simultaneously brought high-quality users (high retention) and feature exposure (high adoption)

**How to Verify Causation?**

| Method | Description | Use Case |
|--------|-------------|----------|
| A/B Test (random assignment) | Randomly show the feature to some users and not others | Most reliable, but requires sufficient traffic |
| PSM (Propensity Score Matching) | Compare users with similar characteristics but different behaviors | When A/B testing isn't possible |
| Natural Experiment | Leverage naturally occurring random events | Post-hoc analysis |
| Diff-in-Diff | Compare differences between treatment and control groups before and after intervention | Large-scale policy or feature rollouts |

**Interview Tip:** Every time you see observational data (non-experimental) claiming "A is better than B," your first instinct should be to ask "Is there selection bias?"

---

## 2-3: Business & Operations Metrics

### Cycle Time

The time from the start of a process to its completion.

**Why Is Cycle Time Important?**
- Customer wait time → Satisfaction
- Capital turnover speed → Cash flow
- Time from problem discovery to fix → Risk management

**Analysis Method: Decompose Each Step**

```
Order processing cycle time analysis:

Step                  Avg Time    Target    Gap
Order → Payment       0.5 hr      1 hr      -
Payment → Picking     4 hr        2 hr      +2 hr
Picking → QC          1 hr        1 hr      -
QC → Packaging        6 hr        1 hr      +5 hr  ← bottleneck!
Packaging → Shipping  1.5 hr      2 hr      -

Total                 13 hr       7 hr      +6 hr
```

**After finding the bottleneck, the next step is to ask why:**
- Not enough staff? (capacity issue)
- Queue waiting? (queue issue)
- Too much rework? (quality issue)
- Poorly designed process? (process issue)

---

### Throughput and Completion Rate

**Throughput** = Number of items completed per unit of time

```
Example: Warehouse processes 500 orders per day
Example: Customer service team replies to 30 tickets per hour
Example: Engineering team completes 45 story points per sprint
```

**Completion Rate** = Proportion successfully completed

```
Example: Order completion rate = Successfully delivered orders / Total orders = 94%
Example: Form submission rate = People who submitted / People who started filling = 68%
```

**Relationship Between Throughput and Cycle Time (Little's Law):**

> **WIP = Throughput × Cycle Time**
>
> WIP (Work in Progress) = Amount of work currently in progress

If cycle time increases but throughput stays the same, WIP is growing (backlog is accumulating).

---

### SLA (Service Level Agreement) and Error Rate

**SLA** is your service commitment to customers or internal stakeholders.

```
SLA Example (IT Support):
├── P1 (System outage): Respond within 1 hour, resolve within 4 hours
├── P2 (Feature malfunction): Respond within 4 hours, resolve within 24 hours
└── P3 (General inquiry): Respond within 24 hours, resolve within 72 hours
```

**Key SLA Analysis Thinking: Priority × Achievement Rate**

Not all SLA misses are equally severe:
- P3 miss 10% → 45 tickets delayed, limited impact
- P1 miss 27% → 4 system outages unresolved in time, could halt the entire company

**Error Rate**

```
Error Rate = Transactions with errors / Total transactions

Common benchmarks:
├── Financial transactions: < 0.01% (very strict)
├── E-commerce orders: < 2%
├── Food delivery orders: < 3%
└── Customer service replies: < 5%
```

---

### Cost Per Transaction

How much it costs to complete one transaction.

```
Cost Per Transaction = Total operating cost / Total transactions

Example:
Customer service center monthly cost $50,000, handles 10,000 tickets
→ Cost per ticket = $5

After introducing a chatbot:
Monthly cost $55,000 (chatbot costs added), but handles 18,000 tickets
→ Cost per ticket = $3.06 (down 39%)
```

**Cost per transaction is one of the core KPIs for Ops teams**, directly impacting unit economics and scalability.

---

## 2-4: How to Define Success Metrics

### Defining Success Metrics for a Project/Feature

Common interview question: "If you were the PM/PA of this project, how would you define success?"

**Three-Step Framework:**

```
Step 1: Return to the objective
  → What problem is this project/feature solving?

Step 2: Find the most direct measurement
  → What number represents "the problem is solved"?

Step 3: Add guardrails
  → While achieving the goal, what must not deteriorate?
```

**Practical Case: Sales Dashboard Project**

```
Goal: Enable the sales team to self-serve reports, eliminating weekly requests to the data team

Step 1: The problem is "the data team is consumed by too many ad-hoc requests"
Step 2: Success metric = Decline in ad-hoc report requests
Step 3: Guardrail = Report quality for the sales team must not decline (avoid incorrect data)

Bad success metrics:
├── DAU → Measures "someone used it," not "problem solved"
├── Revenue increase → Too indirect, influenced by too many factors
└── Satisfaction survey → Subjective, not direct
```

---

### Primary Metric vs Proxy Metric

**Primary Metric** = Directly measures whether the goal is achieved
**Proxy Metric** = Indirectly related substitute indicator

```
Example 1:
Goal: Improve customer loyalty
Primary: Retention Rate / Repeat Purchase Rate
Proxy: NPS, CSAT

Example 2:
Goal: Improve product users' work efficiency
Primary: Task completion time
Proxy: DAU, session duration

Example 3:
Goal: Reduce customer service costs
Primary: Cost per ticket
Proxy: Chatbot resolution rate, First contact resolution rate
```

**When to use a proxy?**
- The primary metric is too slow (e.g., LTV takes 12 months to calculate)
- The primary metric is hard to measure (e.g., "user trust")
- The primary metric is heavily influenced by external factors

**Interview Tip:** If you use a proxy metric, be prepared to explain "why this proxy has a high correlation with the primary metric." Don't take it for granted.

---

### What to Do When Metrics Conflict

When two metrics contradict each other, use the **Primary + Guardrail Framework**:

```
Scenario: Food delivery platform

Metric A: Order completion time (faster is better)
Metric B: Order accuracy rate (higher is better)

Rushing delivery → Wrong orders
Ensuring accuracy → Takes more time

Solution:
Primary = Order completion time (optimization direction)
Guardrail = Order accuracy rate ≥ 98% (must not drop below this threshold)
```

**Universal interview answer:**

> "When these two metrics conflict, I would set [the harder one to recover] as the guardrail and [the easier one to optimize] as the primary. Because once [the guardrail] deteriorates, the recovery cost is very high."

---

## 2-5: Different Roles Look at Different Metrics

### Each Role's "Metric Worldview"

Different roles focus on completely different metrics because they're responsible for different things.

**CEO / CFO (Revenue & Strategy)**

```
Core Metrics:
├── Revenue / MRR / ARR (How much are we earning?)
├── Growth Rate (How fast are we growing?)
├── CAC / LTV / LTV:CAC ratio (Are unit economics healthy?)
├── Gross Margin (What's the gross margin?)
└── Burn Rate / Runway (How long can we keep spending?)

Decision Scenarios:
"Should we enter a new market?" → Look at TAM, CAC, LTV
"Should we raise prices?" → Look at price elasticity, churn rate
"Should we raise funding?" → Look at burn rate, runway
```

**Product Manager (Product & Users)**

```
Core Metrics:
├── DAU / MAU / Stickiness (Are users active?)
├── Retention (Are users staying?)
├── Feature Adoption (Are people using new features?)
├── Activation Rate (Are new users successfully activating?)
└── NPS / CSAT (Are users satisfied?)

Decision Scenarios:
"Should we build this feature?" → Look at user research + expected retention impact
"Feature is done — was it successful?" → Look at adoption funnel + retention impact
```

**Customer Success Manager (Customer Relationships & Renewal)**

```
Core Metrics:
├── Customer Health Score (Which customers are at risk?)
├── NPS / CSAT (How do customers feel?)
├── Churn Rate / Renewal Rate (Are customers renewing?)
├── Expansion Revenue (Are existing customers purchasing more?)
└── Time to Value (How quickly do customers start getting value?)

Decision Scenarios:
"Which customers should I proactively contact this week?" → Look at lowest health scores
"Will this customer renew?" → Look at usage trend + NPS + support tickets
```

**Operations Manager (Operational Efficiency)**

```
Core Metrics:
├── Cycle Time (How long does the process take?)
├── Throughput (How many per day?)
├── SLA Achievement Rate (Are we meeting service commitments?)
├── Error Rate (What's the error rate?)
└── Cost per Transaction (What's the cost per transaction?)

Decision Scenarios:
"Should we hire more people?" → Check if throughput can keep up with demand growth
"Should we change the process?" → Look at cycle time and bottleneck analysis
```

---

### Dashboard Design Principles

The core question in dashboard design isn't "what metrics to include" but:

```
1. Audience → Who's looking at it?
2. Decision → What decisions do they need to make?
3. Metrics  → What information do they need to make those decisions?
```

**Common Mistakes:**

| Mistake | Why It's Bad |
|---------|-------------|
| One dashboard for everyone | Different people need different levels of information; the CEO doesn't need to see every feature's adoption |
| Too many metrics (>10) | Information overload; can't see anything useful |
| Only lagging metrics | By the time you see the problem, it's too late |
| No benchmark / target line | A number without a comparison point is meaningless |

**Good Dashboard Structure:**

```
├── 1-2 headline metrics (instant overview of overall status)
├── 3-5 supporting metrics (explain why the headline is good/bad)
├── Trend charts (see direction, not just numbers)
├── Target lines (compare against targets)
└── Drill-down capability (click to see details)
```

---

## 2-6 (Boss): Comprehensive Metric Analysis

### Marketplace Health Assessment

Marketplaces are a high-frequency interview scenario (Uber, Airbnb, Shopee, food delivery platforms...).

**Three Facets of a Marketplace:**

```
Supply Side                  Demand Side                  Platform
├── Number of suppliers      ├── Number of buyers         ├── GMV
├── Supplier NPS             ├── Buyer activity           ├── Take Rate
├── New supplier onboard     ├── Order frequency          ├── Order completion rate
│   rate                     ├── Search conversion rate   ├── Average match time
└── Supply quality/rating    └── Customer NPS             └── Gross margin
```

**All three facets must be viewed together!** Looking only at GMV can be misleading:

```
Scenario: GMV grew 15% QoQ, but the CEO feels something is off

Deep analysis:
├── Supply: Suppliers -12.5%, NPS -14pts, new signups -60% → Deteriorating
├── Demand: Buyers +12.5% → Okay
├── Platform: Take rate 8% → 12%, completion rate 94% → 88% → Deteriorating

Conclusion: GMV growth was driven by AOV spikes (a few large orders),
but the supply side is collapsing.
Root cause: Take rate increased too much, suppliers are unhappy → Churn →
Long-term unsustainable.
```

---

### How to Diagnose "Headline Metric Looks Good but Fundamentals Are Unhealthy"

This is a classic PA/BA interview question type. The interviewer gives you data that "looks great" and tests whether you can identify the underlying problems.

**Diagnostic Steps:**

```
Step 1: Decompose the headline metric
  → Revenue = Users × Orders per User × AOV
  → GMV = Buyers × Orders × AOV
  → Which component is driving growth? Is it a healthy driver?

Step 2: Examine composition
  → Is growth coming from all customers, or concentrated in a few large ones?
  → What's the contribution ratio of new vs existing customers?
  → If you remove the Top 5 customers, does the number still look good?

Step 3: Check leading indicators
  → Even though the lagging metric looks good, are leading metrics showing signs of deterioration?
  → What are the trends in pipeline, activation, retention?

Step 4: Check guardrail metrics
  → Has anything been "sacrificed for a good-looking headline"?
  → Have unit economics, satisfaction, or quality worsened?
```

**Common "Looks Good but Unhealthy" Patterns:**

| Pattern | Headline Looks Good | Underlying Problem |
|---------|--------------------|--------------------|
| Client concentration | Revenue +20% | Top 3 clients contribute 70% of revenue; losing one would be devastating |
| Promotion-driven | Order volume +50% | AOV plunges, return rate spikes, repeat purchase rate is very low |
| New users mask churn | MAU flat | New users keep coming in, but old users keep leaving (leaky bucket) |
| Sacrificing supply | GMV +15% | Take rate spikes, supplier churn, platform is long-term unsustainable |
| Short-term behavior | Activation rate +30% | Lowered activation standards, quality drops, subsequent retention is poor |

---

## Cheat Sheet: Common Metrics Quick Reference

### Growth & Revenue Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| MRR / ARR | Monthly / Annual Recurring Revenue | SaaS |
| Revenue Growth Rate | (Current period - Previous period) / Previous period | All companies |
| GMV | Gross Merchandise Value (total platform transaction value) | Marketplace |
| Take Rate | Platform commission / GMV | Marketplace |
| ARPU | Revenue / Active Users | All products |

### User & Product Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| DAU / MAU | Daily / Monthly Active Users | All products |
| Stickiness | DAU / MAU | Product engagement |
| Retention Rate | Users returning on Day N / Users on Day 0 | All products |
| Activation Rate | New users completing core action / Total new users | Onboarding |
| Feature Adoption | Users using the feature / Users exposed to the feature | Feature evaluation |
| NPS | Promoters% - Detractors% (-100 to +100) | Satisfaction |
| CSAT | Satisfied responses / Total responses | Single-interaction satisfaction |

### Unit Economics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| CAC | Customer Acquisition Cost | Growth strategy |
| LTV | Lifetime Value | Customer strategy |
| LTV:CAC Ratio | LTV / CAC (>3 is typically healthy) | Business model validation |
| Payback Period | CAC / Monthly Revenue per Customer | Cash flow planning |
| Gross Margin | (Revenue - COGS) / Revenue | Pricing strategy |

### Retention & Churn

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Churn Rate | Churned customers / Customers at period start | SaaS, subscription |
| Revenue Churn | Churned MRR / Starting MRR | SaaS |
| Net Revenue Retention | (Starting MRR + Expansion - Churn) / Starting MRR | SaaS (>100% means existing customers are expanding) |
| Cohort Retention | Retention of a specific cohort at Day N | Trend analysis |

### Operations Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Cycle Time | Time from process start to completion | Efficiency analysis |
| Throughput | Number completed per unit of time | Capacity analysis |
| SLA Achievement Rate | Tickets meeting SLA / Total tickets | IT, customer service |
| Error Rate | Transactions with errors / Total transactions | Quality control |
| Cost per Transaction | Total cost / Total transactions | Operational efficiency |
| First Contact Resolution | Proportion resolved on first contact | Customer service |

### Marketplace Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Liquidity | Successful matches / Total demand | Supply-demand matching efficiency |
| Time to Match | Time from request to successful match | User experience |
| Supply/Demand Ratio | Supply volume / Demand volume | Supply-demand balance |
| Repeat Rate | Proportion returning for another transaction (view supply and demand sides separately) | Platform stickiness |

---

## Common Interview Questions and Answer Frameworks

**Q: How would you define success metrics for X?**
> 1. Confirm what the objective is
> 2. Find the primary metric that directly measures the objective
> 3. Add guardrail metrics
> 4. Distinguish leading vs lagging

**Q: Is this metric good or bad?**
> 1. Compared to what? (benchmark, historical, target)
> 2. What's the context? (category, market, seasonality)
> 3. What's the trend? (improving vs deteriorating)

**Q: What if two metrics conflict?**
> 1. Choose one as the primary (optimization direction)
> 2. Make the other the guardrail (baseline that cannot be breached)
> 3. Explain why (typically the harder-to-repair metric becomes the guardrail)

**Q: What dashboard would you design?**
> 1. First ask "Who's the audience?"
> 2. Then ask "What decisions do they need to make?"
> 3. Only then select the metrics

"""

    // MARK: - World 3 (zh)
    private static let zhWorld3 = """

# World 3：數據分析思維

> 學會用結構化的方法分析數據，從表象挖到根因。這是 Case Study 面試的核心能力。

在面試中，面試官最想看到的不是你知道多少工具，而是你的**分析思路是否清晰**。
World 3 會教你五個最重要的分析方法，它們幾乎可以覆蓋 80% 的面試情境。

---

## 3-1：Trend Analysis（趨勢分析）

### 什麼是 Trend Analysis？

Trend Analysis 是觀察一個指標隨時間變化的模式，判斷它是**真正的問題**還是**正常波動**。

### 為什麼重要？

面試中常見的開頭是：「某個指標掉了 X%，你怎麼看？」
你的第一反應不應該是馬上找原因，而是先確認：**這個下降是真的嗎？**

### 判斷趨勢的關鍵問題

1. **時間範圍**：看 1 天 vs 看 30 天 vs 看 1 年，結論可能完全不同
2. **季節性（Seasonality）**：週末、月底、節假日都會影響數據
3. **基數效應（Base Effect）**：去年基數特別高或低，會讓 YoY 比較失真
4. **一次性事件**：促銷、系統故障、媒體曝光等
5. **統計顯著性**：小樣本的波動不等於趨勢

### 面試中怎麼回答

> 「在分析原因之前，我會先看這個指標的歷史趨勢。是突然下降還是逐漸下降？有沒有季節性因素？跟去年同期比怎麼樣？這樣我才能確認這是一個需要調查的真實問題。」

### 常見陷阱

- 看到數字下降就緊張，沒有先看上下文
- 只看絕對值，不看比率（例：訂單數下降 10%，但流量也下降了 12%）
- 忽略外部因素（競爭對手活動、市場環境、政策變化）

---

## 3-2：Funnel Analysis（漏斗分析）

### 什麼是 Funnel？

Funnel 是把使用者從頭到尾的旅程拆成一連串步驟，看每一步有多少人流失。

### 經典漏斗範例

**電商購物漏斗：**
- 瀏覽商品頁 → 100%
- 加入購物車 → 30%
- 開始結帳 → 15%
- 完成付款 → 8%

**SaaS 註冊漏斗：**
- 造訪Landing Page → 100%
- 點擊「免費試用」→ 12%
- 完成註冊 → 8%
- 完成 Onboarding → 5%
- 成為付費用戶 → 1.5%

### 分析 Funnel 的步驟

1. **畫出完整的 funnel**：從使用者第一個接觸點到最終目標
2. **計算每一步的轉換率**：哪一步流失最多？
3. **找到最大的 drop-off**：這就是最值得改善的地方
4. **按 segment 切開看**：不同用戶群的 funnel 長什麼樣？
5. **看時間趨勢**：最近的 drop-off 比之前更嚴重嗎？

### 面試技巧

當面試官問「為什麼 conversion 下降了」，你的第一步永遠是：
> 「我會先把 conversion 拆成 funnel 的每一步，看哪一步的 drop-off 最大。」

### 進階概念

- **Micro-conversion**：大目標之間的小轉換步驟
- **Time-to-convert**：用戶花多久才走完 funnel
- **Repeat funnel**：回購、續訂的 funnel 跟首購不一樣

---

## 3-3：Segmentation（使用者分群）

### 為什麼要做 Segmentation？

因為**平均值會說謊**。

舉例：整體 retention 是 40%，看起來還行。但切開看：
- 透過 organic search 來的用戶：retention 55%
- 透過 paid ads 來的用戶：retention 20%

整體 40% 只是兩個群體的混合結果。真正的問題是 paid ads 帶來的用戶品質差。

### 常見的分群維度

| 維度 | 範例 |
|------|------|
| 行為 | 高頻 vs 低頻使用者、功能 A 用戶 vs 功能 B 用戶 |
| 來源 | Organic vs Paid、Referral vs Direct |
| 人口統計 | 地區、語言、公司規模（B2B）|
| 時間 | 新用戶 vs 老用戶、不同註冊月份 |
| 方案 | Free vs Paid、Basic vs Pro |

### 分群分析的步驟

1. 先看整體數據，確認有問題
2. 選一個假設最可能相關的維度切開
3. 比較各 segment 的表現差異
4. 如果差異大 → 深入調查該 segment
5. 如果差異不大 → 換一個維度再切

### 面試中的黃金句型

> 「這個問題是 across the board 還是集中在某個 segment？我會先按 [維度] 切開看。」

### Simpson's Paradox

一個反直覺的統計現象：每個子群體都在改善，但整體卻在惡化。
原因：子群體的比例改變了。

例：A 校和 B 校各科的錄取率 A 都比 B 高，但 A 的整體錄取率反而比 B 低。
因為 A 校有更多人申請錄取率低的科系。

面試中提到這個概念會加分。

---

## 3-4：Cohort Analysis（世代分析）

### 什麼是 Cohort？

Cohort 是把用戶按「加入時間」分組，追蹤每一組隨時間的行為變化。

### 為什麼不直接看整體？

因為整體數據混合了不同階段的用戶：
- 3 個月前加入的老用戶（已經很熟悉產品）
- 上週剛加入的新用戶（還在摸索）

把他們混在一起看 retention、usage 等指標，會掩蓋真實趨勢。

### Cohort 表格怎麼讀

|  | Week 0 | Week 1 | Week 2 | Week 3 | Week 4 |
|--|--------|--------|--------|--------|--------|
| Jan cohort | 100% | 45% | 38% | 35% | 34% |
| Feb cohort | 100% | 42% | 33% | 30% | 28% |
| Mar cohort | 100% | 38% | 28% | 24% | — |

從這張表可以看出：新 cohort 的 retention 逐月下降，代表最近的用戶體驗在惡化。

### Cohort 分析的應用場景

1. **Retention 追蹤**：每個月新用戶的留存是否在改善？
2. **Revenue per cohort**：不同時期加入的用戶，LTV 有什麼差異？
3. **Feature impact**：某個功能上線前後的 cohort 表現有無差異？
4. **Marketing 效果**：不同 campaign 帶來的用戶品質比較

### 面試技巧

> 「直接看整體 retention 可能會被用戶基數增長稀釋。我建議用 cohort analysis，按註冊月份分組，看每個 cohort 的 retention curve 是在改善還是惡化。」

---

## 3-5：Root Cause Thinking（根因思維）

### 什麼是 Root Cause？

Root Cause 是造成問題的最底層原因。表面看到的「症狀」往往不是真正的問題。

### 5 Whys 方法

連問 5 次「為什麼」：

1. 為什麼 conversion 下降？→ 結帳頁面的 bounce rate 上升
2. 為什麼 bounce rate 上升？→ 頁面載入速度變慢
3. 為什麼載入變慢？→ 新加了一個第三方 payment SDK
4. 為什麼 SDK 會拖慢速度？→ 它會同步載入 3MB 的 JavaScript
5. 為什麼用同步載入？→ 沒有做 lazy loading

→ Root cause：新的 payment SDK 沒有做 lazy loading

### MECE 原則

在列舉可能原因時，要做到 MECE（Mutually Exclusive, Collectively Exhaustive）：
- **互斥**：每個原因之間不重疊
- **窮盡**：所有可能的原因都被列出

### Issue Tree

把問題像樹一樣展開：

指標下降 →
- 分子問題（目標行為減少）
  - 新用戶的目標行為減少
  - 老用戶的目標行為減少
- 分母問題（基數變化）
  - 流量來源變化
  - 用戶組成變化

### 面試中的應用

面試官問「指標掉了怎麼查」時，展示你的 root cause thinking：

1. **確認問題**：掉了多少？什麼時候開始？
2. **拆解結構**：用 issue tree 或 MECE 列出可能原因
3. **排除假設**：用數據一一驗證或排除
4. **找到根因**：最底層的、可 actionable 的原因
5. **提出建議**：針對根因的解決方案

> 「我不會直接猜原因。我會先把可能的原因用 MECE 的方式列出來，然後用數據逐一排除，找到真正的 root cause。」

---

## 3-6：Boss — 完整數據調查

Boss 關卡會把前面五個技能串在一起：

1. 先用 **Trend Analysis** 確認問題是否真實
2. 用 **Funnel Analysis** 找到問題發生在哪一步
3. 用 **Segmentation** 切開看是否集中在某個群體
4. 用 **Cohort Analysis** 追蹤時間趨勢
5. 用 **Root Cause Thinking** 挖到最底層的原因

這就是面試中「指標掉了怎麼查」的完整回答架構。練習到能自然串起這五步，面試就穩了。

---

## 本章重點回顧

| 技能 | 核心問題 | 面試黃金句型 |
|------|----------|-------------|
| Trend Analysis | 這是真的問題嗎？ | 「我會先看歷史趨勢和季節性」|
| Funnel Analysis | 問題在哪一步？ | 「我會拆成 funnel 看最大 drop-off」|
| Segmentation | 誰受影響最大？ | 「我會按 segment 切開看」|
| Cohort Analysis | 問題在惡化嗎？ | 「我會用 cohort 追蹤趨勢」|
| Root Cause | 最底層的原因是什麼？ | 「我會用 MECE 列出假設逐一排除」|

"""

    // MARK: - World 3 (en)
    private static let enWorld3 = """

# World 3: Data Analysis Thinking

> Learn to analyze data using structured methods, digging from surface-level observations down to root causes. This is the core competency tested in Case Study interviews.

In interviews, what interviewers most want to see isn't how many tools you know, but whether your **analytical thinking is clear and structured**.
World 3 teaches you the five most important analytical methods, which can cover approximately 80% of interview scenarios.

---

## 3-1: Trend Analysis

### What Is Trend Analysis?

Trend Analysis is observing how a metric changes over time to determine whether it represents a **real problem** or **normal fluctuation**.

### Why Is It Important?

A common interview opener is: "A certain metric dropped by X%. What do you think?"
Your first reaction should NOT be to immediately search for causes — instead, first confirm: **Is this decline real?**

### Key Questions for Evaluating Trends

1. **Time Range**: Looking at 1 day vs 30 days vs 1 year can lead to completely different conclusions
2. **Seasonality**: Weekends, month-end, holidays all affect data
3. **Base Effect**: An unusually high or low baseline last year can distort YoY comparisons
4. **One-time Events**: Promotions, system outages, media coverage, etc.
5. **Statistical Significance**: Small sample fluctuations do not equal trends

### How to Answer in Interviews

> "Before analyzing causes, I would first look at the historical trend of this metric. Was the decline sudden or gradual? Are there seasonal factors? How does it compare to the same period last year? This helps me confirm whether this is a real problem worth investigating."

### Common Traps

- Panicking at a number decline without first examining context
- Looking only at absolute values, not ratios (e.g., orders down 10%, but traffic also down 12%)
- Ignoring external factors (competitor activity, market conditions, policy changes)

---

## 3-2: Funnel Analysis

### What Is a Funnel?

A funnel breaks the user's end-to-end journey into a series of steps, showing how many people drop off at each step.

### Classic Funnel Examples

**E-commerce Shopping Funnel:**
- Browse product page → 100%
- Add to cart → 30%
- Begin checkout → 15%
- Complete payment → 8%

**SaaS Registration Funnel:**
- Visit Landing Page → 100%
- Click "Free Trial" → 12%
- Complete registration → 8%
- Complete Onboarding → 5%
- Become a paying user → 1.5%

### Steps for Analyzing a Funnel

1. **Draw the complete funnel**: From the user's first touchpoint to the final goal
2. **Calculate the conversion rate at each step**: Which step has the most drop-off?
3. **Find the biggest drop-off**: This is the most worthwhile area to improve
4. **Segment the funnel**: What does the funnel look like for different user groups?
5. **Check time trends**: Has the recent drop-off become worse than before?

### Interview Tips

When the interviewer asks "Why did conversion decline?", your first step is always:
> "I would first break conversion into each step of the funnel and identify which step has the biggest drop-off."

### Advanced Concepts

- **Micro-conversion**: Small conversion steps between major milestones
- **Time-to-convert**: How long it takes users to complete the funnel
- **Repeat funnel**: The funnel for repeat purchases and renewals differs from the first purchase

---

## 3-3: Segmentation

### Why Segment?

Because **averages lie**.

Example: Overall retention is 40%, which looks okay. But when you slice it:
- Users from organic search: retention 55%
- Users from paid ads: retention 20%

The overall 40% is just a blended result of two groups. The real problem is the poor quality of users from paid ads.

### Common Segmentation Dimensions

| Dimension | Examples |
|-----------|---------|
| Behavior | High-frequency vs low-frequency users, Feature A users vs Feature B users |
| Source | Organic vs Paid, Referral vs Direct |
| Demographics | Region, language, company size (B2B) |
| Time | New users vs veteran users, different registration months |
| Plan | Free vs Paid, Basic vs Pro |

### Steps for Segmentation Analysis

1. First examine overall data to confirm there's a problem
2. Choose a dimension you hypothesize is most likely relevant and slice the data
3. Compare performance differences across segments
4. If differences are large → Investigate that segment deeper
5. If differences are small → Try a different dimension

### Golden Interview Phrase

> "Is this problem across the board, or concentrated in a specific segment? I would first slice by [dimension] to find out."

### Simpson's Paradox

A counterintuitive statistical phenomenon: Every subgroup is improving, yet the overall metric is deteriorating.
The reason: The proportion of subgroups has changed.

Example: School A has a higher acceptance rate than School B in every department, but School A's overall acceptance rate is lower than School B's.
This is because more students at School A applied to departments with lower acceptance rates.

Mentioning this concept in an interview earns bonus points.

---

## 3-4: Cohort Analysis

### What Is a Cohort?

A cohort groups users by "time of joining" and tracks how each group's behavior changes over time.

### Why Not Just Look at the Overall?

Because overall data blends users at different stages:
- Veteran users who joined 3 months ago (already very familiar with the product)
- New users who joined last week (still exploring)

Mixing them together when looking at retention, usage, and other metrics masks the true trend.

### How to Read a Cohort Table

|  | Week 0 | Week 1 | Week 2 | Week 3 | Week 4 |
|--|--------|--------|--------|--------|--------|
| Jan cohort | 100% | 45% | 38% | 35% | 34% |
| Feb cohort | 100% | 42% | 33% | 30% | 28% |
| Mar cohort | 100% | 38% | 28% | 24% | — |

From this table, you can see: retention for newer cohorts is declining month over month, indicating the recent user experience is deteriorating.

### Applications of Cohort Analysis

1. **Retention Tracking**: Is retention for each month's new users improving?
2. **Revenue per Cohort**: How does LTV differ for users who joined at different times?
3. **Feature Impact**: Is there a difference in cohort performance before and after a feature launch?
4. **Marketing Effectiveness**: Comparing the quality of users brought by different campaigns

### Interview Tip

> "Looking at overall retention directly can be diluted by user base growth. I recommend using cohort analysis, grouping by registration month, to see whether each cohort's retention curve is improving or deteriorating."

---

## 3-5: Root Cause Thinking

### What Is a Root Cause?

A root cause is the deepest underlying reason for a problem. The "symptoms" you see on the surface are often not the real problem.

### The 5 Whys Method

Ask "Why" five times in succession:

1. Why did conversion decline? → Checkout page bounce rate increased
2. Why did bounce rate increase? → Page load speed slowed down
3. Why did loading slow down? → A new third-party payment SDK was added
4. Why does the SDK slow things down? → It synchronously loads 3MB of JavaScript
5. Why is it loaded synchronously? → Lazy loading wasn't implemented

→ Root cause: The new payment SDK wasn't configured with lazy loading

### The MECE Principle

When listing possible causes, ensure they are MECE (Mutually Exclusive, Collectively Exhaustive):
- **Mutually Exclusive**: No overlap between causes
- **Collectively Exhaustive**: All possible causes are listed

### Issue Tree

Expand the problem like a tree:

Metric decline →
- Numerator issue (target behavior decreased)
  - New users' target behavior decreased
  - Existing users' target behavior decreased
- Denominator issue (base changed)
  - Traffic source changed
  - User composition changed

### Application in Interviews

When the interviewer asks "A metric dropped — how would you investigate?", demonstrate your root cause thinking:

1. **Confirm the problem**: How much did it drop? When did it start?
2. **Decompose the structure**: Use an issue tree or MECE to list possible causes
3. **Eliminate hypotheses**: Use data to verify or rule out each one
4. **Find the root cause**: The deepest, actionable cause
5. **Provide recommendations**: Solutions targeting the root cause

> "I wouldn't guess causes directly. I would first list possible causes in a MECE manner, then use data to eliminate them one by one to find the true root cause."

---

## 3-6: Boss — Complete Data Investigation

The Boss challenge strings together all five skills:

1. First use **Trend Analysis** to confirm the problem is real
2. Use **Funnel Analysis** to find which step the problem occurs at
3. Use **Segmentation** to see if it's concentrated in a specific group
4. Use **Cohort Analysis** to track time trends
5. Use **Root Cause Thinking** to dig down to the deepest reason

This is the complete answer framework for "A metric dropped — how would you investigate?" in interviews. Practice until you can naturally string these five steps together, and you'll be well-prepared for interviews.

---

## Chapter Summary

| Skill | Core Question | Golden Interview Phrase |
|-------|--------------|------------------------|
| Trend Analysis | Is this a real problem? | "I would first look at the historical trend and seasonality" |
| Funnel Analysis | Which step has the problem? | "I would break it into a funnel and find the biggest drop-off" |
| Segmentation | Who is most affected? | "I would slice by segment to investigate" |
| Cohort Analysis | Is the problem worsening? | "I would use cohort analysis to track trends" |
| Root Cause | What is the deepest cause? | "I would list hypotheses using MECE and eliminate them one by one" |

"""

    // MARK: - World 5 (zh)
    private static let zhWorld5 = """

# World 5：Product Thinking

> 學會用產品經理的視角思考問題。面試中最常考的不是技術，而是你能不能站在使用者和商業的角度分析。

Product Thinking 是把「使用者需求」和「商業目標」連接起來的能力。
不管你面試的是 Product Analyst、Business Analyst 還是 PM，這些概念都是必備的。

---

## 5-1：User Journey Mapping（使用者旅程圖）

### 什麼是 User Journey？

User Journey 是使用者從「第一次接觸產品」到「達成目標」的完整路徑。

### 為什麼面試要考這個？

因為很多問題的根因藏在使用者旅程的某一步裡。
畫出 journey，你才知道問題出在哪。

### 怎麼畫 User Journey

一個好的 User Journey 包含：

1. **Stages（階段）**：使用者經歷的主要階段
2. **Actions（行為）**：每個階段使用者做了什麼
3. **Touchpoints（接觸點）**：使用者在哪裡跟產品互動
4. **Pain Points（痛點）**：使用者在哪裡感到挫折
5. **Emotions（情緒）**：使用者的情緒起伏

### 範例：SaaS 產品的 User Journey

| 階段 | 行為 | 接觸點 | 痛點 |
|------|------|--------|------|
| Awareness | Google 搜尋解決方案 | 搜尋結果、Blog | 不知道有這個產品 |
| Consideration | 比較不同產品 | Landing page、Reviews | 不確定是否適合 |
| Trial | 註冊免費試用 | 註冊頁、Onboarding | 設定太複雜 |
| Activation | 完成第一個核心動作 | 產品內引導 | 不知道下一步做什麼 |
| Retention | 持續使用 | Email、通知 | 找不到進階功能 |
| Expansion | 升級付費方案 | Pricing page | 價格不透明 |

### 面試中怎麼用

面試官問：「用戶 activation 率下降了，你怎麼分析？」

> 「我會先畫出從註冊到 activation 的 user journey，列出每一步的行為和可能的痛點。然後用 funnel 數據看哪一步的 drop-off 最大，再按 user segment 切開看是哪群用戶卡住了。」

### 常見錯誤

- 只看「開心路徑」（happy path），忽略了使用者卡住的情境
- 假設所有用戶的 journey 一樣（不同 segment 的旅程可能很不同）
- 只看產品內的旅程，忽略產品外的體驗（客服、email、口碑）

---

## 5-2：Feature 成功評估

### 新功能上線後怎麼判斷成不成功？

這是面試超高頻題型。面試官想看你能不能**事前定義成功**，而不是事後找數字合理化。

### 評估框架：Before → During → After

**Before（上線前）**：
- 這個功能要解決什麼問題？
- 成功的定義是什麼？（具體指標 + 目標值）
- Guardrail metrics 是什麼？（不能變差的指標）

**During（上線中）**：
- 功能的 adoption rate 如何？
- 有沒有技術問題（crash、loading time）？
- 用戶回饋如何？

**After（上線後）**：
- Primary metric 有達標嗎？
- Guardrail metrics 有沒有受影響？
- 不同 segment 的反應有差異嗎？

### 常見的 Feature Metrics

| 指標 | 衡量什麼 | 範例 |
|------|----------|------|
| Adoption Rate | 多少人用了 | 30% 的 DAU 用了新搜尋 |
| Usage Frequency | 用的人多常用 | 平均每週用 3 次 |
| Task Completion Rate | 能不能完成任務 | 85% 的搜尋有點擊結果 |
| Time-to-value | 多快得到價值 | 平均 2 分鐘完成搜尋 |
| Retention Impact | 對留存的影響 | 使用者 D7 retention +5pp |

### 面試黃金句型

> 「在評估之前，我會先回到這個功能的初衷 — 它要解決什麼問題？然後定義 primary metric 和 guardrail，再看數據。」

---

## 5-3：Adoption 問題診斷

### 為什麼沒人用你的功能？

一個功能 adoption 低，原因通常在三個層面之一。

### Discoverability → Usability → Value 三層模型

1. **Discoverability（發現性）**：用戶知道這個功能存在嗎？
   - 入口在哪？容易找到嗎？
   - 有沒有引導或通知告訴用戶？
   - 分析方法：看功能入口的曝光次數和點擊率

2. **Usability（易用性）**：用戶嘗試了，但能順利用完嗎？
   - 操作流程順暢嗎？有沒有卡住？
   - 錯誤訊息清楚嗎？
   - 分析方法：看 funnel completion rate 和 error rate

3. **Value（價值）**：用完了，但覺得沒有用？
   - 功能解決了用戶的問題嗎？
   - 用戶用完後有得到他想要的結果嗎？
   - 分析方法：看 repeat usage（會再用第二次嗎？）

### 怎麼判斷問題在哪一層

| 現象 | 最可能的問題層 |
|------|---------------|
| 很少人點進功能 | Discoverability |
| 很多人點了但沒完成 | Usability |
| 完成了但沒有再用 | Value |
| 用了一次就離開產品 | 可能是 Value，也可能傷害了整體體驗 |

### 面試中怎麼回答

面試官問：「我們新做了一個推薦功能，但只有 5% 的用戶在用，你怎麼分析？」

> 「5% 的 adoption 可能是三個層面的問題。我會先看 discoverability — 推薦功能的入口有被多少人看到？點擊率是多少？如果曝光很高但點擊很低，可能是入口設計的問題。如果點擊了但沒完成操作，是 usability 問題。如果完成了但沒再用，是 value 問題。」

---

## 5-4：Usage vs Value

### 使用率高不等於有價值

這是很多人的盲點。

範例：
- 一個「搜尋」功能被大量使用，但用戶平均要搜 5 次才能找到想要的結果 → 高 usage，低 value
- 一個「自動備份」功能很少被主動使用，但有它用戶就不會因為資料遺失而離開 → 低 usage，高 value

### 怎麼衡量 Value？

| 方法 | 適用場景 | 範例 |
|------|----------|------|
| Outcome-based | 功能是否達成目標 | 搜尋後有點擊結果嗎？ |
| Comparative | 有用 vs 沒用的差異 | 用了功能的用戶 retention 更高嗎？ |
| Counterfactual | 沒有這個功能會怎樣 | 移除功能後指標有變嗎？ |
| Survey | 直接問用戶 | NPS、CSAT 分數 |

### 面試技巧

當面試官用「使用率」來衡量功能成功時，你可以補充：

> 「使用率是一個起點，但我更關注的是 value — 使用了這個功能的用戶，他們的目標行為有改善嗎？比如說，用了搜尋的人有沒有更容易找到商品並完成購買？」

### 常見的 Usage 陷阱

- **Forced usage**：功能在主流程上，不得不用（usage 高但可能 value 低）
- **Novelty effect**：剛上線大家好奇用，兩週後就不用了
- **Power user bias**：少數重度用戶貢獻大部分 usage，整體用戶並不在乎

---

## 5-5：Discoverability vs Usability vs Value

### 三層模型的完整應用

這個模型不只適用於單一功能，也適用於整個產品的分析。

### 每一層的分析工具

**Discoverability 分析：**
- 曝光率（impression）和點擊率（CTR）
- 用戶訪談：「你知道有這個功能嗎？」
- Heatmap：用戶在頁面上看了哪裡
- A/B test：不同入口位置的比較

**Usability 分析：**
- Task completion rate
- Error rate 和 error types
- Time-on-task（完成一個任務要花多久）
- Funnel drop-off（每一步的流失）
- 用戶測試（看用戶操作的錄影）

**Value 分析：**
- Repeat usage rate（會再用第二次嗎？）
- Impact on downstream metrics（對後續行為的影響）
- User satisfaction（NPS、CSAT）
- Churn correlation（不用這個功能的人比較容易流失嗎？）

### 面試完整回答範例

問題：「我們的報表功能上線三個月了，但大部分用戶還是在用 Excel。你怎麼分析？」

> 「我會用三層模型來分析：
>
> 首先 Discoverability：用戶知道報表功能存在嗎？我會看功能入口的曝光數和點擊率。如果很多人看到但沒點，可能是入口的 messaging 不清楚。
>
> 其次 Usability：點進來的人能順利做出報表嗎？我會看 funnel — 從開始建立到完成輸出每一步的 drop-off。
>
> 最後 Value：做出來的報表有滿足需求嗎？我會比較用報表功能的人和用 Excel 的人，前者的工作效率有更好嗎？也可以做 user interview 了解他們為什麼還是選 Excel。
>
> 根據問題在哪一層，解法會完全不同。」

---

## 5-6：Boss — 產品分析 Case

Boss 關卡會給你一個完整的產品分析情境：

1. 用 **User Journey** 畫出使用者旅程
2. 定義功能的 **Success Metrics**
3. 用 **Discoverability / Usability / Value** 診斷問題
4. 區分 **Usage vs Value**
5. 提出 **改善建議** 並排優先級

這就是面試中 Product Analyst 的核心考題。能流暢回答這類問題，面試就成功一半了。

---

## 本章重點回顧

| 技能 | 核心概念 | 面試黃金句型 |
|------|----------|-------------|
| User Journey | 畫出完整旅程找痛點 | 「我會先畫出 user journey 找痛點」|
| Feature 評估 | Before / During / After | 「先定義成功再看數據」|
| Adoption 診斷 | 三層問題模型 | 「是 discoverability、usability 還是 value 的問題？」|
| Usage vs Value | 使用率不等於價值 | 「我更關注 outcome 而不只是 usage」|
| 完整分析 | 三層模型串接 | 「根據問題在哪一層，解法完全不同」|

"""

    // MARK: - World 5 (en)
    private static let enWorld5 = """

# World 5: Product Thinking

> Learn to think about problems from a product manager's perspective. The most common interview questions aren't about technical skills — they test whether you can analyze from both the user and business angles.

Product Thinking is the ability to connect "user needs" with "business objectives."
Whether you're interviewing for Product Analyst, Business Analyst, or PM, these concepts are essential.

---

## 5-1: User Journey Mapping

### What Is a User Journey?

A User Journey is the complete path a user takes from "first contact with the product" to "achieving their goal."

### Why Do Interviews Test This?

Because the root cause of many problems is hidden in a specific step of the user journey.
Drawing out the journey is how you identify where the problem lies.

### How to Draw a User Journey

A good User Journey includes:

1. **Stages**: The major phases the user goes through
2. **Actions**: What the user does at each stage
3. **Touchpoints**: Where the user interacts with the product
4. **Pain Points**: Where the user feels frustrated
5. **Emotions**: The user's emotional highs and lows

### Example: SaaS Product User Journey

| Stage | Action | Touchpoint | Pain Point |
|-------|--------|-----------|-----------|
| Awareness | Google search for a solution | Search results, Blog | Doesn't know the product exists |
| Consideration | Compare different products | Landing page, Reviews | Not sure if it's the right fit |
| Trial | Sign up for free trial | Registration page, Onboarding | Setup is too complex |
| Activation | Complete first core action | In-product guidance | Doesn't know what to do next |
| Retention | Continue using | Email, Notifications | Can't find advanced features |
| Expansion | Upgrade to a paid plan | Pricing page | Pricing isn't transparent |

### How to Use It in Interviews

Interviewer asks: "User activation rate has dropped. How would you analyze it?"

> "I would first draw the user journey from registration to activation, listing the actions and possible pain points at each step. Then I'd use funnel data to identify which step has the biggest drop-off, and segment by user group to see which users are getting stuck."

### Common Mistakes

- Looking only at the "happy path" and ignoring scenarios where users get stuck
- Assuming all users have the same journey (different segments may have very different journeys)
- Looking only at in-product experiences and ignoring out-of-product experiences (customer service, email, word of mouth)

---

## 5-2: Feature Success Evaluation

### How Do You Judge Whether a New Feature Is Successful After Launch?

This is an extremely high-frequency interview question. Interviewers want to see if you can **define success upfront**, rather than rationalizing with data after the fact.

### Evaluation Framework: Before → During → After

**Before (Pre-launch)**:
- What problem is this feature solving?
- What is the definition of success? (Specific metric + target value)
- What are the guardrail metrics? (Metrics that must not deteriorate)

**During (At launch)**:
- What is the feature's adoption rate?
- Are there any technical issues (crashes, loading time)?
- What is user feedback like?

**After (Post-launch)**:
- Did the primary metric meet the target?
- Were guardrail metrics affected?
- Are there differences in response across segments?

### Common Feature Metrics

| Metric | What It Measures | Example |
|--------|-----------------|---------|
| Adoption Rate | How many people used it | 30% of DAU used the new search |
| Usage Frequency | How often users use it | Average 3 times per week |
| Task Completion Rate | Whether users can complete the task | 85% of searches resulted in a click |
| Time-to-value | How quickly users get value | Average 2 minutes to complete a search |
| Retention Impact | Impact on retention | Users' D7 retention +5pp |

### Golden Interview Phrase

> "Before evaluating, I would first return to the feature's original intent — what problem was it solving? Then I'd define the primary metric and guardrails before looking at data."

---

## 5-3: Adoption Problem Diagnosis

### Why Is Nobody Using Your Feature?

When a feature has low adoption, the reason usually lies at one of three levels.

### Discoverability → Usability → Value: Three-Layer Model

1. **Discoverability**: Does the user know this feature exists?
   - Where is the entry point? Is it easy to find?
   - Is there any guidance or notification telling users about it?
   - Analysis method: Look at the feature entry point's impressions and click-through rate

2. **Usability**: The user tried it — but can they complete it smoothly?
   - Is the workflow smooth? Do they get stuck?
   - Are error messages clear?
   - Analysis method: Look at funnel completion rate and error rate

3. **Value**: They completed it — but didn't find it useful?
   - Does the feature solve the user's problem?
   - Did the user get the result they wanted?
   - Analysis method: Look at repeat usage (will they use it a second time?)

### How to Identify Which Layer Has the Problem

| Observation | Most Likely Problem Layer |
|------------|--------------------------|
| Very few people click into the feature | Discoverability |
| Many click but don't complete | Usability |
| Complete but don't use again | Value |
| Used once then left the product | Could be Value, or it may have harmed the overall experience |

### How to Answer in Interviews

Interviewer asks: "We built a new recommendation feature, but only 5% of users are using it. How would you analyze this?"

> "5% adoption could be a problem at three levels. I would first check discoverability — how many people saw the recommendation feature's entry point? What's the click-through rate? If impressions are high but clicks are low, it may be a design issue with the entry point. If they clicked but didn't complete the action, it's a usability problem. If they completed it but didn't use it again, it's a value problem."

---

## 5-4: Usage vs Value

### High Usage Does Not Equal High Value

This is a blind spot for many people.

Examples:
- A "search" feature is heavily used, but users average 5 searches before finding what they want → High usage, low value
- An "auto-backup" feature is rarely actively used, but with it, users don't leave because of data loss → Low usage, high value

### How to Measure Value?

| Method | Use Case | Example |
|--------|----------|---------|
| Outcome-based | Whether the feature achieves the goal | Did users click a result after searching? |
| Comparative | Difference between users vs non-users | Do users who used the feature have higher retention? |
| Counterfactual | What happens without the feature | Did metrics change when the feature was removed? |
| Survey | Ask users directly | NPS, CSAT scores |

### Interview Tip

When the interviewer uses "usage rate" to measure feature success, you can add:

> "Usage rate is a starting point, but I'm more focused on value — did users who used this feature see improvement in their target behavior? For example, did users who searched actually find products and complete purchases more easily?"

### Common Usage Traps

- **Forced usage**: The feature is in the main flow, so users have no choice (high usage but potentially low value)
- **Novelty effect**: Everyone is curious when it first launches, but stops using it after two weeks
- **Power user bias**: A small number of heavy users contribute most of the usage, while most users don't care

---

## 5-5: Discoverability vs Usability vs Value

### Complete Application of the Three-Layer Model

This model applies not only to individual features but also to analysis of the entire product.

### Analysis Tools for Each Layer

**Discoverability Analysis:**
- Impressions and click-through rate (CTR)
- User interviews: "Did you know this feature existed?"
- Heatmaps: Where users are looking on the page
- A/B testing: Comparing different entry point positions

**Usability Analysis:**
- Task completion rate
- Error rate and error types
- Time-on-task (how long it takes to complete a task)
- Funnel drop-off (attrition at each step)
- User testing (watching recordings of user interactions)

**Value Analysis:**
- Repeat usage rate (will they use it a second time?)
- Impact on downstream metrics (effect on subsequent behavior)
- User satisfaction (NPS, CSAT)
- Churn correlation (are users who don't use this feature more likely to churn?)

### Complete Interview Answer Example

Question: "Our reporting feature has been live for three months, but most users are still using Excel. How would you analyze this?"

> "I would analyze using the three-layer model:
>
> First, Discoverability: Do users know the reporting feature exists? I'd look at the feature entry point's impression count and click-through rate. If many people see it but don't click, the messaging may be unclear.
>
> Second, Usability: Can users who click in successfully create a report? I'd look at the funnel — the drop-off at each step from starting to creating to exporting a report.
>
> Finally, Value: Does the completed report meet their needs? I'd compare users who use the reporting feature with those who use Excel — is the former group more efficient? I could also conduct user interviews to understand why they still choose Excel.
>
> The solution will be completely different depending on which layer the problem is at."

---

## 5-6: Boss — Product Analysis Case

The Boss challenge gives you a complete product analysis scenario:

1. Use **User Journey** to map the user's experience
2. Define the feature's **Success Metrics**
3. Use **Discoverability / Usability / Value** to diagnose the problem
4. Distinguish **Usage vs Value**
5. Provide **improvement recommendations** and prioritize them

This is the core question type for Product Analyst interviews. Answering this type of question fluently puts you halfway to interview success.

---

## Chapter Summary

| Skill | Core Concept | Golden Interview Phrase |
|-------|-------------|------------------------|
| User Journey | Map the complete journey to find pain points | "I would first draw the user journey to find pain points" |
| Feature Evaluation | Before / During / After | "Define success first, then look at data" |
| Adoption Diagnosis | Three-layer problem model | "Is it a discoverability, usability, or value problem?" |
| Usage vs Value | Usage rate does not equal value | "I focus more on outcomes, not just usage" |
| Complete Analysis | Connecting the three-layer model | "The solution differs entirely depending on which layer the problem is at" |

"""

    // MARK: - World 6 (zh)
    private static let zhWorld6 = """

# World 6：Business Process

> 學會分析和改善商業流程。很多面試 case 不是數據問題，而是流程問題。

Business Process 分析在面試中越來越常見，特別是 Business Analyst、Operations Analyst、Business Systems 相關職位。
核心能力是：**畫出流程 → 找到瓶頸 → 提出改善方案**。

---

## 6-1：Process Mapping（流程圖）

### 什麼是 Process Mapping？

Process Mapping 是把一個商業流程的每一步驟視覺化，包含：
- 誰負責（角色）
- 做什麼（動作）
- 花多久（時間）
- 接下來什麼（流向）

### 為什麼要畫流程圖？

1. **讓隱藏的步驟浮現** — 很多流程有「大家都知道但沒人寫下來」的隱藏步驟
2. **找到重複和浪費** — 同樣的資訊被輸入了三次？
3. **對齊團隊理解** — 每個人對流程的認知可能不同
4. **作為改善的基礎** — 你必須先知道現在怎麼做，才能改善

### Process Map 的要素

| 要素 | 說明 | 範例 |
|------|------|------|
| 觸發事件 | 流程從什麼開始 | 客戶提交訂單 |
| 步驟 | 每一個動作 | 審核訂單、安排出貨 |
| 決策點 | 有條件分支的地方 | 訂單金額 > $1000 需要主管核准？ |
| 等待 | 需要等人或等系統的時間 | 等待信用審核結果（2 天） |
| 結束 | 流程的終點 | 貨物送達客戶 |
| 負責人 | 誰執行這一步 | 業務、倉管、物流 |

### 面試中怎麼畫

面試官不會要你用專業軟體。用嘴巴或白板描述就行：

> 「這個流程從客戶下訂單開始。第一步是系統自動檢查庫存。如果有庫存，進入揀貨流程；如果沒有，觸發採購需求。揀貨完成後進入包裝，然後通知物流取貨。整個流程大概需要 3 個工作天。」

### 常見的流程類型

- **訂單到交付**（Order to Fulfillment）
- **客訴處理**（Customer Complaint Resolution）
- **員工 Onboarding**
- **採購審批**（Purchase Approval）
- **Bug 回報到修復**（Incident Management）

---

## 6-2：找 Bottleneck（找瓶頸）

### 什麼是 Bottleneck？

Bottleneck 是流程中**最慢**或**容量最小**的那一步，它限制了整個流程的速度。

就像馬路上最窄的那一段 — 就算其他路段很寬，整體車流量還是被最窄的地方限制。

### 怎麼找 Bottleneck？

1. **量化每一步的時間**：
   - Processing time（實際做事的時間）
   - Wait time（等待的時間）
   - Total lead time = Processing + Wait

2. **找到 Wait time 最長的那一步** — 大部分 bottleneck 不在「做事」而在「等待」

3. **看堆積**：哪一步前面排隊最長？那就是 bottleneck

### 常見的 Bottleneck 類型

| 類型 | 範例 | 解法方向 |
|------|------|----------|
| 人力瓶頸 | 只有一個人能核准 | 增加核准人、提高授權額度 |
| 系統瓶頸 | 系統處理速度慢 | 升級系統、優化效能 |
| 資訊瓶頸 | 等待客戶提供資料 | 簡化需求、提供預設值 |
| 政策瓶頸 | 公司規定必須三層審核 | 檢視是否每層都必要 |
| 依賴瓶頸 | 等另一個部門完成 | 平行處理、減少依賴 |

### 面試範例

面試官問：「客服 ticket 的處理時間從 2 小時變成 8 小時，你怎麼分析？」

> 「我會先畫出 ticket 處理流程的每一步：收到 ticket → 分類 → 指派 → 調查 → 回覆 → 確認關閉。然後量化每一步的 processing time 和 wait time。找到 wait time 增加最多的那一步，那就是 bottleneck。比如可能是『指派』這步 — 因為最近客服人手不足，ticket 在等待被指派時堆積了。」

### Bottleneck 分析的陷阱

- 不要假設 bottleneck 在你覺得最複雜的步驟 — 往往在最無聊的「等待」步驟
- Bottleneck 可能會移動 — 解決了一個，下一個最慢的步驟就變成新的 bottleneck
- 局部優化不等於全局優化 — 加快 bottleneck 以外的步驟不會讓流程更快

---

## 6-3：Automation 決策

### 哪些步驟該自動化？

不是所有步驟都適合自動化。判斷標準：

| 適合自動化 | 不適合自動化 |
|-----------|-------------|
| 重複性高 | 需要判斷力和創意 |
| 規則明確 | 規則模糊或例外多 |
| 量大 | 量很小（一個月才幾次） |
| 錯誤成本低 | 錯誤成本極高 |
| 目前是 bottleneck | 不是 bottleneck（自動化也不會加速流程） |

### Automation 的層次

1. **通知自動化**：自動發提醒、寄 email（最簡單）
2. **資料搬運自動化**：自動把 A 系統的資料同步到 B 系統
3. **規則判斷自動化**：如果 X 條件成立，自動執行 Y 動作
4. **審批流程自動化**：低風險的自動核准，高風險的才人工
5. **端到端自動化**：整個流程不需要人工介入

### 面試中的判斷框架

面試官問：「這個流程有 10 個步驟，你覺得哪些該自動化？」

> 「我會用三個維度來評估：
> 1. 這個步驟是不是 bottleneck？如果是，自動化的效益最大
> 2. 規則是否明確？如果判斷邏輯可以寫成 if-then，就適合自動化
> 3. 錯誤的成本有多高？如果出錯的影響很大，可能需要保留人工審核
>
> 我會先從『量大 + 規則明確 + 錯誤成本低』的步驟開始自動化。」

### ROI 評估

自動化不是免費的。面試中可以展示你會想到 ROI：

| 成本 | 效益 |
|------|------|
| 開發和維護成本 | 節省的人力時間 |
| 訓練和轉換成本 | 減少的錯誤率 |
| 出錯時的風險 | 更快的處理速度 |

---

## 6-4：Permissions & Audit（權限與稽核）

### 為什麼面試要考這個？

因為真實的商業流程不只是「做完事」，還要確保：
- **對的人做對的事**（權限控制）
- **做了什麼有記錄**（稽核追蹤）

### 權限設計的基本概念

**Principle of Least Privilege（最小權限原則）**：
每個人只給他做這件事需要的最小權限。

常見的權限模型：
- **Role-based**：依角色給權限（Manager、Editor、Viewer）
- **Level-based**：依金額或風險等級分層（< $1000 自己核准，> $1000 主管核准）
- **Separation of Duties**：同一個人不能既申請又核准

### Audit Trail（稽核追蹤）

記錄誰在什麼時間做了什麼操作：
- 誰修改了這筆訂單？
- 這個折扣是誰核准的？
- 客戶資料是什麼時候被刪除的？

### 面試中怎麼考

面試官問：「我們要設計一個採購審批流程，你怎麼想？」

> 「除了流程步驟，我會考慮權限和稽核：
> 1. 誰可以發起採購申請？
> 2. 核准權限怎麼分層？（例如 $5K 以下部門主管，$5K 以上 VP）
> 3. 同一個人不能同時發起和核准（separation of duties）
> 4. 每一步都要有 audit trail — 誰核准了、什麼時候、核准金額是多少
> 5. 例外處理 — 緊急採購可以先執行後補核准嗎？」

---

## 6-5：Exception Handling（例外處理）

### 流程設計不只是 Happy Path

大部分流程設計只考慮了「一切順利」的情況。
但真實世界充滿例外：

- 客戶取消訂單（在不同階段取消的處理方式不同）
- 供應商延遲交貨
- 系統當機
- 審批人休假
- 客戶提供的資料不完整

### 怎麼設計 Exception Handling

1. **列出可能的例外情況**（用 brainstorming 或看歷史資料）
2. **評估每個例外的頻率和影響**
3. **設計處理流程**：
   - 高頻 + 低影響 → 自動處理（系統規則）
   - 低頻 + 高影響 → 人工處理 + escalation 路徑
   - 高頻 + 高影響 → 可能要改核心流程

### Escalation 路徑

當第一線處理不了時，怎麼往上升級：

| 層級 | 什麼情況 | 誰處理 | 時限 |
|------|----------|--------|------|
| L1 | 一般問題 | 第一線客服 | 2 小時 |
| L2 | 技術問題 | 技術支援 | 4 小時 |
| L3 | 跨部門問題 | 部門主管 | 1 工作天 |
| L4 | 緊急/影響營收 | VP 或 C-level | 立即 |

### 面試中怎麼展示

面試官問：「你設計了一個退貨流程，還有什麼要考慮的？」

> 「除了正常退貨流程，我會考慮幾個例外情況：
> 1. 超過退貨期限但客戶有合理理由 → 需要主管裁量權
> 2. 商品已損壞無法再銷售 → 需要報廢流程
> 3. 客戶要求退款但已過信用卡退款期限 → 需要替代方案（store credit）
> 4. 大量退貨（可能是品質問題或詐欺）→ 觸發調查流程
>
> 每個例外都需要有明確的處理路徑和升級機制。」

---

## 6-6：Boss — 流程改善 Case

Boss 關卡會給你一個完整的流程改善情境：

1. 用 **Process Mapping** 畫出現有流程
2. 用 **Bottleneck 分析** 找到最慢的環節
3. 評估哪些步驟適合 **Automation**
4. 考慮 **Permissions & Audit** 的需求
5. 設計 **Exception Handling** 路徑
6. 提出改善建議並預估 **ROI**

這就是面試中 Business Process 改善題的完整回答架構。

---

## 本章重點回顧

| 技能 | 核心問題 | 面試黃金句型 |
|------|----------|-------------|
| Process Mapping | 流程長什麼樣？ | 「我會先畫出端到端的流程圖」|
| Bottleneck | 哪裡最慢？ | 「找到 wait time 最長的那一步」|
| Automation | 該不該自動化？ | 「量大 + 規則明確 + 錯誤成本低就適合」|
| Permissions | 誰能做什麼？ | 「最小權限原則 + separation of duties」|
| Exception | 出錯了怎麼辦？ | 「不只設計 happy path，也要設計例外處理」|

"""

    // MARK: - World 6 (en)
    private static let enWorld6 = """

# World 6: Business Process

> Learn to analyze and improve business processes. Many interview cases aren't about data problems — they're about process problems.

Business Process analysis is increasingly common in interviews, especially for Business Analyst, Operations Analyst, and Business Systems roles.
The core competency is: **Map the process → Find the bottleneck → Propose improvements**.

---

## 6-1: Process Mapping

### What Is Process Mapping?

Process Mapping is visualizing every step of a business process, including:
- Who is responsible (role)
- What they do (action)
- How long it takes (time)
- What comes next (flow)

### Why Draw a Process Map?

1. **Surface hidden steps** — Many processes have steps "everyone knows about but nobody documented"
2. **Find duplication and waste** — Is the same information being entered three times?
3. **Align team understanding** — Different people may have different perceptions of the process
4. **Serve as the basis for improvement** — You must know how things work now before you can improve them

### Elements of a Process Map

| Element | Description | Example |
|---------|-------------|---------|
| Trigger Event | What starts the process | Customer submits an order |
| Steps | Each action | Review the order, arrange shipping |
| Decision Points | Conditional branches | Order amount > $1000 requires manager approval? |
| Waits | Time waiting for people or systems | Waiting for credit check results (2 days) |
| End | The process endpoint | Goods delivered to customer |
| Owner | Who executes this step | Sales, warehouse, logistics |

### How to Draw It in Interviews

The interviewer won't ask you to use professional software. Describing it verbally or on a whiteboard is fine:

> "This process starts when a customer places an order. The first step is an automated inventory check. If stock is available, it enters the picking process; if not, it triggers a procurement request. After picking is complete, it goes to packaging, then logistics is notified for pickup. The entire process takes about 3 business days."

### Common Process Types

- **Order to Fulfillment**
- **Customer Complaint Resolution**
- **Employee Onboarding**
- **Purchase Approval**
- **Bug Report to Fix (Incident Management)**

---

## 6-2: Finding Bottlenecks

### What Is a Bottleneck?

A bottleneck is the **slowest** or **lowest-capacity** step in a process — it limits the speed of the entire workflow.

It's like the narrowest stretch of a road — no matter how wide the other sections are, overall traffic flow is limited by the narrowest point.

### How to Find a Bottleneck

1. **Quantify the time for each step**:
   - Processing time (actual work time)
   - Wait time (idle waiting time)
   - Total lead time = Processing + Wait

2. **Find the step with the longest wait time** — Most bottlenecks aren't in "doing work" but in "waiting"

3. **Look for accumulation**: Which step has the longest queue in front of it? That's the bottleneck

### Common Bottleneck Types

| Type | Example | Solution Direction |
|------|---------|-------------------|
| Human resource bottleneck | Only one person can approve | Add approvers, increase authorization limits |
| System bottleneck | System processing is slow | Upgrade systems, optimize performance |
| Information bottleneck | Waiting for client to provide documents | Simplify requirements, provide default values |
| Policy bottleneck | Company requires three levels of approval | Review whether each level is necessary |
| Dependency bottleneck | Waiting for another department to finish | Parallelize processing, reduce dependencies |

### Interview Example

Interviewer asks: "Customer service ticket handling time went from 2 hours to 8 hours. How would you analyze this?"

> "I would first map out each step of the ticket handling process: Receive ticket → Classify → Assign → Investigate → Reply → Confirm closure. Then I'd quantify the processing time and wait time for each step. The step with the biggest increase in wait time is the bottleneck. For example, it might be the 'assignment' step — because the support team is recently short-staffed, tickets are piling up while waiting to be assigned."

### Bottleneck Analysis Pitfalls

- Don't assume the bottleneck is the most complex step — it's often the most mundane "waiting" step
- Bottlenecks can shift — after resolving one, the next slowest step becomes the new bottleneck
- Local optimization doesn't equal global optimization — speeding up steps other than the bottleneck won't make the overall process faster

---

## 6-3: Automation Decisions

### Which Steps Should Be Automated?

Not all steps are suitable for automation. Decision criteria:

| Suitable for Automation | Not Suitable for Automation |
|------------------------|-----------------------------|
| Highly repetitive | Requires judgment and creativity |
| Clear rules | Vague rules or many exceptions |
| High volume | Very low volume (only a few times per month) |
| Low error cost | Extremely high error cost |
| Currently a bottleneck | Not a bottleneck (automation won't speed up the process) |

### Levels of Automation

1. **Notification automation**: Automatic reminders, sending emails (simplest)
2. **Data transfer automation**: Automatically syncing data from System A to System B
3. **Rule-based automation**: If condition X is met, automatically execute action Y
4. **Approval workflow automation**: Auto-approve low-risk items, route high-risk items to humans
5. **End-to-end automation**: Entire process requires no human intervention

### Interview Decision Framework

Interviewer asks: "This process has 10 steps. Which ones would you automate?"

> "I would evaluate using three dimensions:
> 1. Is this step a bottleneck? If so, the benefit of automation is greatest
> 2. Are the rules clear? If the logic can be written as if-then, it's suitable for automation
> 3. How high is the error cost? If the impact of mistakes is significant, human review may need to be retained
>
> I would start with steps that are 'high volume + clear rules + low error cost.'"

### ROI Assessment

Automation isn't free. In interviews, you can demonstrate that you consider ROI:

| Cost | Benefit |
|------|---------|
| Development and maintenance costs | Time savings on manual labor |
| Training and transition costs | Reduced error rates |
| Risk when errors occur | Faster processing speed |

---

## 6-4: Permissions & Audit

### Why Do Interviews Test This?

Because real business processes aren't just about "getting things done" — they also need to ensure:
- **The right people do the right things** (access control)
- **What was done is recorded** (audit trail)

### Basic Concepts in Permission Design

**Principle of Least Privilege**:
Each person is given only the minimum permissions needed to do their job.

Common permission models:
- **Role-based**: Permissions by role (Manager, Editor, Viewer)
- **Level-based**: Tiered by amount or risk level (< $1000 self-approve, > $1000 requires manager)
- **Separation of Duties**: The same person cannot both request and approve

### Audit Trail

Records of who performed what action at what time:
- Who modified this order?
- Who approved this discount?
- When was the customer data deleted?

### How This Appears in Interviews

Interviewer asks: "We need to design a procurement approval process. How would you think about it?"

> "Beyond the process steps, I would consider permissions and audit:
> 1. Who can initiate a procurement request?
> 2. How should approval authority be tiered? (e.g., under $5K by department head, over $5K by VP)
> 3. The same person cannot both initiate and approve (separation of duties)
> 4. Every step must have an audit trail — who approved it, when, and for what amount
> 5. Exception handling — can emergency purchases be executed first and approved retroactively?"

---

## 6-5: Exception Handling

### Process Design Is More Than the Happy Path

Most process designs only consider the scenario where "everything goes smoothly."
But the real world is full of exceptions:

- Customer cancels an order (handling differs depending on the stage of cancellation)
- Supplier delays delivery
- System crashes
- Approver is on vacation
- Customer provides incomplete information

### How to Design Exception Handling

1. **List possible exceptions** (through brainstorming or reviewing historical data)
2. **Assess the frequency and impact of each exception**
3. **Design handling workflows**:
   - High frequency + Low impact → Automate (system rules)
   - Low frequency + High impact → Manual handling + escalation path
   - High frequency + High impact → May need to redesign the core process

### Escalation Path

When frontline staff can't resolve an issue, how to escalate:

| Level | Situation | Handler | Time Limit |
|-------|-----------|---------|-----------|
| L1 | General issues | Frontline support | 2 hours |
| L2 | Technical issues | Technical support | 4 hours |
| L3 | Cross-department issues | Department head | 1 business day |
| L4 | Urgent / Revenue-impacting | VP or C-level | Immediate |

### How to Demonstrate This in Interviews

Interviewer asks: "You've designed a return process. What else should you consider?"

> "Beyond the normal return process, I would consider several exception scenarios:
> 1. Past the return deadline but the customer has a reasonable justification → Requires manager discretion
> 2. Product is damaged and cannot be resold → Requires a write-off process
> 3. Customer requests a refund but the credit card refund window has passed → Need an alternative (store credit)
> 4. Mass returns (possible quality issue or fraud) → Trigger an investigation process
>
> Each exception needs a clear handling path and escalation mechanism."

---

## 6-6: Boss — Process Improvement Case

The Boss challenge gives you a complete process improvement scenario:

1. Use **Process Mapping** to draw the current process
2. Use **Bottleneck Analysis** to find the slowest step
3. Evaluate which steps are suitable for **Automation**
4. Consider **Permissions & Audit** requirements
5. Design **Exception Handling** paths
6. Propose improvement recommendations and estimate **ROI**

This is the complete answer framework for Business Process improvement questions in interviews.

---

## Chapter Summary

| Skill | Core Question | Golden Interview Phrase |
|-------|--------------|------------------------|
| Process Mapping | What does the process look like? | "I would first draw the end-to-end process map" |
| Bottleneck | Where is it slowest? | "Find the step with the longest wait time" |
| Automation | Should it be automated? | "High volume + clear rules + low error cost makes it suitable" |
| Permissions | Who can do what? | "Principle of least privilege + separation of duties" |
| Exception | What happens when things go wrong? | "Design not just the happy path, but exception handling too" |

"""

    // MARK: - World 7 (zh)
    private static let zhWorld7 = """

# World 7：Experiment & Validation

> 學會用科學方法驗證你的分析結論。面試中展示「我不只猜，我還知道怎麼驗證」，是從 junior 到 senior 的分水嶺。

在商業分析中，提出假設只是第一步。真正有價值的是：你能不能設計一個方法來驗證假設是對的？
本章教你 A/B test、假設設計、和避免常見的分析陷阱。

---

## 7-1：Hypothesis 設計

### 什麼是好的假設？

好的假設有三個要素：

1. **Intervention（做什麼改變）**：具體、可執行
2. **Expected Outcome（預期結果）**：可衡量、有指標
3. **Rationale（為什麼這樣認為）**：有邏輯或數據支撐

### 假設公式

> If we [做什麼改變], then [會發生什麼結果], because [為什麼這樣認為]

### 好假設 vs 壞假設

| 壞假設 | 好假設 |
|--------|--------|
| 「搜尋不好用」 | 「如果在搜尋結果加入評分，點擊率會提升 15%，因為用戶可以更快判斷商品品質」 |
| 「用戶不喜歡我們的 app」 | 「如果簡化 onboarding 從 5 步到 2 步，Day 1 retention 會提升 10%，因為目前 60% 的用戶卡在第 3 步」 |
| 「應該多做行銷」 | 「如果把 paid ads 預算從 Google 轉 30% 到 TikTok，25 歲以下新用戶獲取成本會降低 20%，因為我們的目標族群更常用 TikTok」 |

### 假設的排序原則

面試中你會列出多個假設。排優先級的標準：

1. **可驗證性**：能用現有數據快速驗證的先做
2. **影響力**：如果是真的，impact 有多大
3. **成本**：驗證需要多少資源

---

## 7-2：A/B Test 基礎

### 什麼是 A/B Test？

把用戶隨機分成兩組：
- **Control（對照組）**：看原版
- **Treatment（實驗組）**：看新版

比較兩組的表現差異，判斷新版是否真的比較好。

### 為什麼要隨機？

因為隨機分流可以消除 **selection bias**。如果讓用戶自己選，喜歡嘗新的人會選新版，結果就不可信。

### A/B Test 設計清單

1. **定義假設**：If / Then / Because
2. **選擇 Metric**：Primary + Guardrail
3. **決定分流比例**：通常 50/50
4. **計算 Sample Size**：需要多少用戶才能偵測到效果
5. **設定實驗時間**：至少覆蓋一個完整的 business cycle（通常 1-2 週）
6. **排除干擾**：同時間有沒有其他變動？

### 常見的錯誤

- **過早停止**：結果看起來不錯就提前結束 → 可能是隨機波動
- **多重比較**：同時看 20 個指標，總有一個「顯著」 → 需要做校正
- **汙染**：Control 和 Treatment 的用戶互相影響
- **Novelty Effect**：新東西剛出來大家都好奇用 → 等效應穩定再判斷

---

## 7-3：Metric 選擇與 Guardrail

### Primary Metric

直接衡量你的假設的指標。

選擇標準：
- 跟假設的 outcome 直接相關
- 可以在實驗期間被觀察到（不要選要等半年才看得出來的指標）
- 變動量可以被偵測到

### Guardrail Metrics

「不能變差」的指標。確保改善不會有副作用。

| 實驗 | Primary | Guardrail |
|------|---------|-----------|
| 推薦更多高價商品 | Revenue per user | CTR、退貨率 |
| 簡化註冊流程 | 註冊完成率 | 帳號品質（bot 註冊率） |
| 減少 email 通知 | Unsubscribe rate | DAU、購買率 |

### 面試技巧

永遠同時提 primary 和 guardrail：
> 「我會用 X 衡量改善效果，同時監控 Y 確保沒有負面影響。」

---

## 7-4：Sample Bias

### 什麼是 Sample Bias？

當你的樣本不能代表整體母體時，結論就不可靠。

### 常見的 Bias 類型

| 類型 | 說明 | 範例 |
|------|------|------|
| Selection Bias | 樣本不是隨機選的 | 只調查「還在用的用戶」，忽略流失的 |
| Survivorship Bias | 只看「存活」的案例 | 分析成功的 startup 特徵，忽略失敗的 |
| Response Bias | 回答者不具代表性 | 滿意度調查只有很滿意和很不滿意的人回覆 |
| Time Bias | 時間點不具代表性 | 在促銷期間做的調查不代表平時 |

### 面試中怎麼展示

面試官說「數據顯示 X 比 Y 好」時，你應該問：
> 「這個比較是隨機分流的嗎？還是 self-selected？如果是後者，可能有 selection bias。」

---

## 7-5：Correlation vs Causation

### 相關不等於因果

A 和 B 一起出現，有三種可能：

1. **A 導致 B**
2. **B 導致 A**（反向因果）
3. **C 同時導致 A 和 B**（混淆因子）

### 經典範例

- 冰淇淋銷量 ↑ 和 溺水事件 ↑ 相關 → 不是冰淇淋導致溺水，是夏天（混淆因子）
- 使用某功能的用戶 retention 高 → 可能不是功能讓人留下來，是活躍用戶本來就會用功能

### 怎麼建立因果關係？

1. **A/B Test**（最強）：隨機分流排除所有混淆因子
2. **自然實驗**：找到一個自然發生的「分流」事件
3. **控制變量**：統計上控制已知的混淆因子
4. **Difference-in-Differences**：比較「有介入」和「沒介入」群體的前後變化

### 面試黃金句型

> 「這個數據顯示的是相關性。要確認因果關係，我會建議做 A/B test。如果無法做實驗，可以用控制變量的方式做回歸分析。」

---

## 7-6：Boss — 實驗設計 Case

Boss 關卡會考你設計一個完整的驗證計畫：

1. 把商業問題轉成可驗證的 **假設**
2. 選擇正確的 **Primary 和 Guardrail metrics**
3. 設計 **A/B test**（分流、sample size、時間）
4. 預判可能的 **bias** 和風險
5. 解讀實驗結果（包含不顯著的情況）

能做到這些，你就具備了 senior analyst 的實驗思維。

---

## 本章重點回顧

| 技能 | 核心概念 | 面試黃金句型 |
|------|----------|-------------|
| Hypothesis | If/Then/Because | 「我的假設是...，我會用 X 來驗證」|
| A/B Test | 隨機分流 + 控制組 | 「我會做 A/B test，50/50 分流，跑 2 週」|
| Metrics | Primary + Guardrail | 「用 X 衡量改善，用 Y 確保沒副作用」|
| Sample Bias | 樣本不代表整體 | 「這個比較有 selection bias 的風險」|
| Correlation | 相關 ≠ 因果 | 「需要 A/B test 才能確認因果關係」|

"""

    // MARK: - World 7 (en)
    private static let enWorld7 = """

# World 7: Experiment & Validation

> Learn to validate your analytical conclusions using scientific methods. Demonstrating in interviews that "I don't just guess — I know how to validate" is what separates junior from senior analysts.

In business analysis, generating hypotheses is only the first step. The real value is: can you design a method to verify whether your hypothesis is correct?
This chapter teaches you A/B testing, hypothesis design, and how to avoid common analytical pitfalls.

---

## 7-1: Hypothesis Design

### What Makes a Good Hypothesis?

A good hypothesis has three components:

1. **Intervention (what change to make)**: Specific and actionable
2. **Expected Outcome (predicted result)**: Measurable with a metric
3. **Rationale (why you believe this)**: Supported by logic or data

### Hypothesis Formula

> If we [make what change], then [what result will occur], because [why we believe this]

### Good Hypotheses vs Bad Hypotheses

| Bad Hypothesis | Good Hypothesis |
|---------------|----------------|
| "Search isn't working well" | "If we add ratings to search results, CTR will increase by 15%, because users can more quickly judge product quality" |
| "Users don't like our app" | "If we simplify onboarding from 5 steps to 2, Day 1 retention will increase by 10%, because currently 60% of users get stuck at step 3" |
| "We should do more marketing" | "If we shift 30% of paid ads budget from Google to TikTok, acquisition cost for users under 25 will decrease by 20%, because our target demographic uses TikTok more frequently" |

### Prioritization Principles for Hypotheses

In interviews, you'll list multiple hypotheses. Criteria for prioritization:

1. **Verifiability**: Hypotheses that can be quickly verified with existing data go first
2. **Impact**: If true, how large is the impact?
3. **Cost**: How many resources are needed for validation?

---

## 7-2: A/B Test Fundamentals

### What Is an A/B Test?

Randomly split users into two groups:
- **Control**: Sees the original version
- **Treatment**: Sees the new version

Compare the performance difference between the two groups to determine whether the new version is truly better.

### Why Randomize?

Because random assignment eliminates **selection bias**. If users self-select, those who like trying new things would choose the new version, making results unreliable.

### A/B Test Design Checklist

1. **Define the hypothesis**: If / Then / Because
2. **Choose metrics**: Primary + Guardrail
3. **Determine split ratio**: Typically 50/50
4. **Calculate sample size**: How many users are needed to detect the effect
5. **Set experiment duration**: At least one full business cycle (typically 1-2 weeks)
6. **Exclude interference**: Are there other changes happening simultaneously?

### Common Mistakes

- **Stopping too early**: Results look good so you end early → Could be random fluctuation
- **Multiple comparisons**: Looking at 20 metrics simultaneously — one will be "significant" by chance → Correction needed
- **Contamination**: Control and Treatment users influence each other
- **Novelty Effect**: Everything new attracts curiosity at first → Wait for the effect to stabilize before judging

---

## 7-3: Metric Selection and Guardrails

### Primary Metric

The metric that directly measures your hypothesis.

Selection criteria:
- Directly related to the hypothesis outcome
- Observable during the experiment period (don't choose a metric that takes 6 months to show results)
- The magnitude of change can be detected

### Guardrail Metrics

Metrics that "must not deteriorate." Ensures improvements don't have side effects.

| Experiment | Primary | Guardrail |
|-----------|---------|-----------|
| Recommend more premium products | Revenue per user | CTR, return rate |
| Simplify registration flow | Registration completion rate | Account quality (bot registration rate) |
| Reduce email notifications | Unsubscribe rate | DAU, purchase rate |

### Interview Tip

Always mention both primary and guardrail together:
> "I would use X to measure the improvement, while monitoring Y to ensure there are no negative impacts."

---

## 7-4: Sample Bias

### What Is Sample Bias?

When your sample doesn't represent the overall population, your conclusions become unreliable.

### Common Types of Bias

| Type | Description | Example |
|------|-------------|---------|
| Selection Bias | Sample isn't randomly selected | Only surveying "current users," ignoring those who churned |
| Survivorship Bias | Only looking at "surviving" cases | Analyzing traits of successful startups while ignoring failures |
| Response Bias | Respondents aren't representative | Satisfaction surveys only get responses from the very satisfied and very dissatisfied |
| Time Bias | Timing isn't representative | A survey conducted during a promotion doesn't represent normal conditions |

### How to Demonstrate This in Interviews

When the interviewer says "data shows X is better than Y," you should ask:
> "Was this comparison based on random assignment or self-selected? If the latter, there may be selection bias."

---

## 7-5: Correlation vs Causation

### Correlation Does Not Equal Causation

When A and B appear together, there are three possibilities:

1. **A causes B**
2. **B causes A** (reverse causation)
3. **C causes both A and B** (confounding variable)

### Classic Examples

- Ice cream sales ↑ and drowning incidents ↑ are correlated → Ice cream doesn't cause drowning; summer is the confounding variable
- Users of a feature have higher retention → It may not be the feature keeping them; active users are inherently more likely to use features

### How to Establish Causation

1. **A/B Test** (strongest): Random assignment eliminates all confounding variables
2. **Natural Experiment**: Find a naturally occurring "split" event
3. **Control Variables**: Statistically control for known confounding variables
4. **Difference-in-Differences**: Compare changes before and after intervention between treatment and control groups

### Golden Interview Phrase

> "This data shows correlation. To confirm causation, I would recommend running an A/B test. If experimentation isn't feasible, we could use regression analysis with control variables."

---

## 7-6: Boss — Experiment Design Case

The Boss challenge tests you on designing a complete validation plan:

1. Convert a business problem into a testable **hypothesis**
2. Select the correct **Primary and Guardrail metrics**
3. Design an **A/B test** (split, sample size, duration)
4. Anticipate potential **biases** and risks
5. Interpret experiment results (including non-significant outcomes)

If you can do all of this, you've achieved the experimental thinking of a senior analyst.

---

## Chapter Summary

| Skill | Core Concept | Golden Interview Phrase |
|-------|-------------|------------------------|
| Hypothesis | If / Then / Because | "My hypothesis is..., and I would use X to validate it" |
| A/B Test | Random split + control group | "I would run an A/B test, 50/50 split, for 2 weeks" |
| Metrics | Primary + Guardrail | "Use X to measure improvement, use Y to ensure no side effects" |
| Sample Bias | Sample doesn't represent the whole | "This comparison has a risk of selection bias" |
| Correlation | Correlation ≠ Causation | "We need an A/B test to confirm causation" |

"""

    // MARK: - World 8 (zh)
    private static let zhWorld8 = """

# World 8：Recommendation & Mock Interview

> 把前面學到的所有技能串在一起，用完整的框架回答面試 Case Study。這是你的畢業考。

面試 Case Study 最大的挑戰不是「你不會」，而是「你不知道從哪裡開始」。
本章給你一個萬用框架和六種經典題型，練到能自然流暢地回答。

---

## Case Answer Framework

面試 Case Study 的萬用回答框架：

### Goal → Metrics → Flow → Segment → Recommend → Validate

| 步驟 | 做什麼 | 範例 |
|------|--------|------|
| **Goal** | 確認問題和目標 | 「讓我確認一下，我們的目標是找出 GMV 下降的原因？」 |
| **Metrics** | 定義和拆解指標 | 「GMV = Orders × AOV，我會先看哪個因素影響更大」 |
| **Flow** | 畫出流程/漏斗 | 「我會看從流量 → 瀏覽 → 加購 → 結帳每一步的轉換率」 |
| **Segment** | 按維度切分看 | 「我會按通路、用戶群、品類分別看，找到問題集中在哪裡」 |
| **Recommend** | 提出建議 | 「基於分析，我建議優先改善 X，預期可以提升 Y%」 |
| **Validate** | 說明驗證方式 | 「我會用 A/B test 驗證這個建議的效果」 |

---

## 8-1：KPI 掉了怎麼查

這是面試最高頻的題型。面試官會說：「某指標掉了 X%，你怎麼查？」

### 回答結構

1. **確認問題**：掉了多少？什麼時候開始？跟歷史比怎樣？
2. **拆解指標**：把大指標拆成子指標（如 Revenue = Users × ARPU）
3. **Trend 分析**：是突然還是逐漸？有沒有季節性？
4. **Segmentation**：按不同維度切開看，問題集中在哪裡？
5. **Root Cause**：列假設，用數據逐一排除
6. **建議行動**：針對根因提出改善方案

### 面試技巧

- 不要一開始就猜原因。先用數據縮小範圍。
- 先排除外部因素（季節性、市場變化、競爭對手）
- 用 MECE 列假設：分子問題 vs 分母問題

---

## 8-2：Feature 成功嗎

面試官會問：「這個功能上線了，怎麼判斷成功？」

### 回答結構

1. **回到目標**：這個功能要解決什麼問題？
2. **定義成功**：Primary metric 是什麼？Guardrail 是什麼？
3. **Adoption 分析**：多少人用了？（Discoverability → Usability → Value）
4. **Impact 分析**：對核心指標的影響？
5. **Trade-offs**：有沒有副作用？有沒有 cannibalization？
6. **建議**：繼續投資 / 調整方向 / 停止

### 面試技巧

- 不要只看 usage。Usage ≠ Value。
- 注意 selection bias：用了功能的人表現好，可能不是功能的功勞。
- 考慮 short-term vs long-term 的 trade-off。

---

## 8-3：流程怎麼改

面試官會給你一個效率低下的流程，問你怎麼改善。

### 回答結構

1. **Process Mapping**：畫出現有流程的每一步
2. **量化時間**：每一步的 processing time 和 wait time
3. **找 Bottleneck**：wait time 最長的那一步
4. **改善方案**：
   - 移除不必要的步驟
   - 序列化 → 平行化
   - 手動 → 自動化
   - 集中 → 分散
5. **權限和 Audit**：改善後的安全性考量
6. **例外處理**：非 happy path 的處理方式

### 面試技巧

- 不要急著建議「全部自動化」。先分析哪些適合。
- 記得量化改善預期（從 X 天縮短到 Y 天）
- 考慮改變的成本和風險

---

## 8-4：Dashboard 設計

面試官會問：「幫我設計一個 dashboard。」

### 回答結構

1. **確認 Audience**：誰要看？CEO vs PM vs Ops？
2. **確認 Key Questions**：他們看 dashboard 要回答什麼問題？
3. **選指標**：覆蓋 Revenue / Growth / Retention / Efficiency
4. **設計層次**：
   - 第一層：3-5 個核心數字 + 趨勢
   - 第二層：趨勢圖
   - 第三層：可下鑽到 segment
5. **Action Triggers**：什麼數字代表要採取行動？

### 面試技巧

- 不要堆太多指標。Less is more。
- 根據 audience 選指標（CEO 看戰略，PM 看產品，Ops 看效率）
- 每個指標都要有「所以呢？」的 actionability

---

## 8-5：User Segmentation

面試官會問：「怎麼做用戶分群？」

### 回答結構

1. **確認目的**：分群是為了做什麼？（個人化推薦？行銷？定價？）
2. **選維度**：
   - 行為維度（使用頻率、深度、feature 偏好）
   - 價值維度（LTV、付費狀態）
   - 來源維度（acquisition channel）
3. **描述每個群體**：用 persona 描述（名字 + 行為特徵 + 需求）
4. **設計策略**：每個群體的差異化策略
5. **驗證效果**：分群策略是否比統一策略好？

### 面試技巧

- 行為分群 > 人口統計分群（年齡性別不一定有區分度）
- 每個群體要有 actionable 的策略，不是分完就結束
- 分群數量不要太多（3-5 個最實用）

---

## 8-6：Boss — 完整模擬面試

最終 Boss 是一個完整的模擬面試 Case Study，需要你把前面所有技能串在一起：

1. **問題拆解**（World 1）— 搞清楚問題是什麼
2. **指標定義**（World 2）— 用什麼衡量
3. **數據分析**（World 3）— 用什麼方法分析
4. **資料素養**（World 4）— 需要什麼數據、怎麼查
5. **產品思維**（World 5）— 從用戶和產品角度看
6. **流程分析**（World 6）— 流程的瓶頸和改善
7. **實驗驗證**（World 7）— 怎麼驗證你的建議

能流暢地走完這個框架，你的面試就準備好了。

---

## 面試最後的提醒

### Do's ✓

- 先確認問題再分析（不要急著答）
- 用結構化的框架回答（Goal → Metrics → Flow → Segment → Recommend → Validate）
- 主動說出你的假設和驗證方式
- 考慮多方利益相關者（不只看一個角度）
- 誠實說「這個我不確定，但我會這樣查」

### Don'ts ✗

- 不要一開始就猜原因
- 不要只看單一指標
- 不要忽略 guardrail metrics
- 不要把 correlation 當 causation
- 不要提改善方案卻不說怎麼驗證

---

## 本章重點回顧

| 題型 | 框架 | 面試黃金句型 |
|------|------|-------------|
| KPI 掉了 | 確認 → 拆解 → Trend → Segment → Root Cause | 「我會先拆解指標，再按 segment 找出問題集中在哪裡」|
| Feature 評估 | 目標 → Metrics → Adoption → Impact → Trade-offs | 「先定義成功再看數據，同時注意 guardrail」|
| 流程改善 | Map → Quantify → Bottleneck → Automate → Exception | 「先量化每步時間，找到 wait time 最長的環節」|
| Dashboard | Audience → Questions → Metrics → Layers → Actions | 「根據 audience 的核心問題選指標，不超過 5 個」|
| 分群 | 目的 → 維度 → Persona → 策略 → 驗證 | 「行為分群比人口統計更有區分度」|
| 模擬面試 | Goal → Metrics → Flow → Segment → Recommend → Validate | 「讓我用 Case Answer Framework 來回答」|

"""

    // MARK: - World 8 (en)
    private static let enWorld8 = """

# World 8: Recommendation & Mock Interview

> Combine all the skills you've learned into a complete framework for answering interview Case Studies. This is your final exam.

The biggest challenge in Case Study interviews isn't "you don't know" — it's "you don't know where to start."
This chapter gives you a universal framework and six classic question types. Practice until you can answer naturally and fluently.

---

## Case Answer Framework

The universal answer framework for Case Study interviews:

### Goal → Metrics → Flow → Segment → Recommend → Validate

| Step | What to Do | Example |
|------|-----------|---------|
| **Goal** | Confirm the problem and objective | "Let me confirm — our objective is to identify the cause of the GMV decline?" |
| **Metrics** | Define and decompose metrics | "GMV = Orders × AOV. I'll first check which factor has a greater impact" |
| **Flow** | Map the process/funnel | "I'll look at conversion rates from Traffic → Browse → Add to Cart → Checkout" |
| **Segment** | Slice by dimensions | "I'll break it down by channel, user group, and category to find where the problem is concentrated" |
| **Recommend** | Propose recommendations | "Based on the analysis, I recommend prioritizing improvement of X, which should lift Y%" |
| **Validate** | Explain validation method | "I would use an A/B test to validate this recommendation" |

---

## 8-1: What to Do When a KPI Drops

This is the highest-frequency interview question type. The interviewer will say: "A certain metric dropped by X%. How would you investigate?"

### Answer Structure

1. **Confirm the problem**: How much did it drop? When did it start? How does it compare to historical data?
2. **Decompose the metric**: Break the large metric into sub-metrics (e.g., Revenue = Users × ARPU)
3. **Trend analysis**: Was it sudden or gradual? Is there seasonality?
4. **Segmentation**: Slice by different dimensions — where is the problem concentrated?
5. **Root cause**: List hypotheses and use data to eliminate them one by one
6. **Recommended actions**: Propose improvement plans targeting the root cause

### Interview Tips

- Don't guess causes from the start. Use data to narrow the scope first.
- First rule out external factors (seasonality, market changes, competitors)
- Use MECE to list hypotheses: numerator issue vs denominator issue

---

## 8-2: Is the Feature Successful?

The interviewer will ask: "This feature has launched. How do you determine whether it's successful?"

### Answer Structure

1. **Return to the goal**: What problem was this feature solving?
2. **Define success**: What is the primary metric? What are the guardrails?
3. **Adoption analysis**: How many people used it? (Discoverability → Usability → Value)
4. **Impact analysis**: What is the effect on core metrics?
5. **Trade-offs**: Are there side effects? Is there cannibalization?
6. **Recommendation**: Continue investing / Adjust direction / Discontinue

### Interview Tips

- Don't just look at usage. Usage ≠ Value.
- Watch for selection bias: users who adopted the feature performing better may not be because of the feature.
- Consider short-term vs long-term trade-offs.

---

## 8-3: How to Improve a Process

The interviewer will give you an inefficient process and ask how to improve it.

### Answer Structure

1. **Process Mapping**: Draw each step of the current process
2. **Quantify time**: Processing time and wait time for each step
3. **Find the Bottleneck**: The step with the longest wait time
4. **Improvement Plan**:
   - Remove unnecessary steps
   - Convert sequential to parallel
   - Convert manual to automated
   - Convert centralized to distributed
5. **Permissions and Audit**: Security considerations after improvements
6. **Exception Handling**: How to handle non-happy-path scenarios

### Interview Tips

- Don't rush to suggest "automate everything." First analyze which steps are suitable.
- Remember to quantify expected improvements (from X days down to Y days)
- Consider the cost and risk of changes

---

## 8-4: Dashboard Design

The interviewer will ask: "Design a dashboard for me."

### Answer Structure

1. **Confirm the Audience**: Who will view it? CEO vs PM vs Ops?
2. **Confirm Key Questions**: What questions should the dashboard answer?
3. **Select Metrics**: Cover Revenue / Growth / Retention / Efficiency
4. **Design Layers**:
   - Layer 1: 3-5 core numbers + trends
   - Layer 2: Trend charts
   - Layer 3: Drill-down by segment
5. **Action Triggers**: What numbers indicate that action should be taken?

### Interview Tips

- Don't pile on too many metrics. Less is more.
- Select metrics based on the audience (CEO sees strategy, PM sees product, Ops sees efficiency)
- Every metric should have "so what?" actionability

---

## 8-5: User Segmentation

The interviewer will ask: "How would you do user segmentation?"

### Answer Structure

1. **Confirm the purpose**: What is segmentation for? (Personalized recommendations? Marketing? Pricing?)
2. **Choose dimensions**:
   - Behavioral dimensions (usage frequency, depth, feature preferences)
   - Value dimensions (LTV, payment status)
   - Source dimensions (acquisition channel)
3. **Describe each group**: Use personas (name + behavioral traits + needs)
4. **Design strategies**: Differentiated strategies for each group
5. **Validate effectiveness**: Is the segmentation strategy better than a one-size-fits-all approach?

### Interview Tips

- Behavioral segmentation > Demographic segmentation (age and gender don't always provide differentiation)
- Each group should have an actionable strategy — don't just segment and stop
- Don't create too many segments (3-5 is most practical)

---

## 8-6: Boss — Full Mock Interview

The final Boss is a complete mock interview Case Study that requires you to combine all previous skills:

1. **Problem Decomposition** (World 1) — Understand what the problem is
2. **Metric Definition** (World 2) — Determine what to measure
3. **Data Analysis** (World 3) — Determine what methods to use for analysis
4. **Data Literacy** (World 4) — Determine what data is needed and how to find it
5. **Product Thinking** (World 5) — View from the user and product perspective
6. **Process Analysis** (World 6) — Identify process bottlenecks and improvements
7. **Experiment Validation** (World 7) — Determine how to validate your recommendations

When you can fluently walk through this framework, your interview preparation is complete.

---

## Final Interview Reminders

### Do's ✓

- Confirm the problem before analyzing (don't rush to answer)
- Use a structured framework to answer (Goal → Metrics → Flow → Segment → Recommend → Validate)
- Proactively state your hypotheses and validation methods
- Consider multiple stakeholders (don't look at just one angle)
- Be honest: "I'm not sure about this, but here's how I would investigate"

### Don'ts ✗

- Don't guess causes from the start
- Don't look at only a single metric
- Don't ignore guardrail metrics
- Don't treat correlation as causation
- Don't propose improvements without explaining how to validate them

---

## Chapter Summary

| Question Type | Framework | Golden Interview Phrase |
|--------------|-----------|------------------------|
| KPI dropped | Confirm → Decompose → Trend → Segment → Root Cause | "I would first decompose the metric, then segment to find where the problem is concentrated" |
| Feature evaluation | Goal → Metrics → Adoption → Impact → Trade-offs | "Define success first, then look at data while monitoring guardrails" |
| Process improvement | Map → Quantify → Bottleneck → Automate → Exception | "First quantify time per step, find the step with the longest wait time" |
| Dashboard | Audience → Questions → Metrics → Layers → Actions | "Select metrics based on the audience's core questions, no more than 5" |
| Segmentation | Purpose → Dimensions → Persona → Strategy → Validate | "Behavioral segmentation provides more differentiation than demographics" |
| Mock interview | Goal → Metrics → Flow → Segment → Recommend → Validate | "Let me use the Case Answer Framework to respond" |

"""

    // MARK: - World 27 (zh)
    private static let zhWorld27 = """

# World 27：需求分析

> 需求分析是 Business Analyst 最核心的技能。搞清楚「到底要做什麼」比「怎麼做」更重要。
> 這一章教你如何從模糊的業務需求中，提煉出清晰、可執行的需求文件。

面試中最常見的問題：「你怎麼確認需求？」「遇到需求衝突怎麼辦？」
這一章讓你有系統地回答這些問題。

---

## 27-1：Business Requirements vs User Requirements

### 兩種需求的本質差異

| 面向 | Business Requirements | User Requirements |
|------|----------------------|-------------------|
| 視角 | 企業 / 管理層 | 終端用戶 |
| 關注點 | ROI、市場份額、效率 | 易用性、功能、體驗 |
| 表達方式 | 目標導向（提升 20% 轉換率） | 行為導向（我想要一鍵結帳） |
| 決定者 | C-level、Product Owner | 用戶研究、UX 團隊 |
| 優先級 | 策略層面 | 執行層面 |

### Business Requirements 範例

```
目標：降低客服成本 30%
背景：目前每月處理 10,000 通客服電話，平均處理時間 8 分鐘
期望：透過自助服務系統，將 40% 的常見問題自動化解決
衡量指標：客服電話數量、平均處理時間、客戶滿意度
時程：Q3 完成 MVP，Q4 全面上線
```

### User Requirements 範例

```
作為一名線上購物的客戶，
我希望能在網站上查詢訂單配送狀態，
這樣我就不需要打電話給客服詢問。

驗收標準：
- 輸入訂單號碼即可查詢
- 顯示預計到達時間
- 配送異常時主動發通知
- 頁面載入時間 < 2 秒
```

### 兩者的關係：從上到下的分解

```
Business Goal（商業目標）
  ↓ Why?
Business Requirement（商業需求）
  ↓ What?
User Requirement（用戶需求）
  ↓ How?
Functional Requirement（功能需求）
  ↓ Spec
Technical Specification（技術規格）
```

### 面試考點

> 「請描述一個你如何將商業目標轉化為具體需求的經驗。」

回答框架：
1. 商業背景與目標（Business Context）
2. 你做了什麼分析（Gap Analysis）
3. 如何拆解成用戶需求（Decomposition）
4. 最終產出與成果（Deliverable & Impact）

---

## 27-2：Functional vs Non-Functional Requirements

### Functional Requirements（功能需求）

系統「必須做到」的行為和功能。

| 類別 | 範例 |
|------|------|
| 用戶管理 | 用戶可以用 Email 註冊帳號 |
| 搜尋功能 | 支援關鍵字搜尋、篩選、排序 |
| 交易處理 | 支援信用卡、行動支付結帳 |
| 通知系統 | 訂單狀態變更時發送 Email 通知 |
| 報表功能 | 管理員可匯出月度銷售報表（CSV） |

### Non-Functional Requirements（非功能需求）

系統的品質屬性（Quality Attributes）。

| NFR 類別 | 定義 | 衡量方式 | 範例 |
|----------|------|---------|------|
| Performance | 回應速度 | Response Time | 頁面載入 < 2 秒 |
| Scalability | 擴展能力 | Concurrent Users | 支援 10,000 同時在線 |
| Availability | 可用性 | Uptime % | 99.9% uptime (SLA) |
| Security | 安全性 | Compliance | 符合 PCI DSS 標準 |
| Usability | 易用性 | Task Completion Rate | 新用戶 5 分鐘內完成註冊 |
| Maintainability | 可維護性 | MTTR | 平均修復時間 < 4 小時 |
| Compatibility | 相容性 | Browser/OS Support | 支援 Chrome、Safari、Edge |

### FURPS+ 框架

```
F — Functionality（功能）
U — Usability（易用性）
R — Reliability（可靠性）
P — Performance（效能）
S — Supportability（可支援性）
+ — Design constraints, Implementation, Interface, Physical
```

### 常犯錯誤

- ❌ 只寫功能需求，忽略非功能需求
- ❌ NFR 太模糊：「系統要快」→ ✅「API 回應時間 p95 < 500ms」
- ❌ 沒有定義衡量標準
- ❌ 把解決方案寫成需求：「用 Redis 做快取」→ ✅「重複查詢回應時間 < 100ms」

### 面試題練習

> 「設計一個電商平台的購物車功能，列出 FR 和 NFR。」

功能需求：
- 加入 / 移除商品
- 修改數量
- 顯示小計與總計
- 保存購物車（登入用戶跨裝置同步）
- 套用優惠券

非功能需求：
- 購物車操作回應 < 500ms
- 支援 5,000 同時操作
- 購物車資料保留 30 天
- 行動端與桌面端 RWD 相容

---

## 27-3：需求蒐集技巧

### 常用需求蒐集方法

| 方法 | 適用場景 | 優點 | 缺點 |
|------|---------|------|------|
| Interview（訪談） | 深度理解需求 | 靈活、深入 | 耗時、主觀偏差 |
| Workshop（工作坊） | 多方共識 | 效率高、互動性強 | 需要 Facilitation 技巧 |
| Survey（問卷） | 大量用戶意見 | 規模化、量化 | 回覆率低、深度不足 |
| Observation（觀察） | 了解實際使用行為 | 真實、客觀 | 受觀察效應影響 |
| Document Analysis | 了解現有流程 | 不打擾用戶 | 可能過時 |
| Prototyping（原型） | 驗證需求理解 | 直觀、快速回饋 | 可能被誤認為成品 |

### 訪談技巧 — SPIN 框架

```
S — Situation（現況）：目前的流程是什麼？
P — Problem（問題）：最大的痛點是什麼？
I — Implication（影響）：這個問題造成什麼影響？
N — Need-payoff（需求回報）：如果解決了，會帶來什麼好處？
```

### 訪談提問範例

```
Situation:
「能描述一下你目前處理退貨的流程嗎？」
「一天大約處理多少筆退貨？」

Problem:
「這個流程中最花時間的步驟是哪個？」
「哪個環節最容易出錯？」

Implication:
「這些錯誤導致什麼結果？客戶投訴？退款延遲？」
「這個問題每月造成多少成本？」

Need-payoff:
「如果退貨流程可以自動化，你覺得能節省多少時間？」
「什麼樣的解決方案對你最有幫助？」
```

### Workshop 引導技巧

```
1. 設定目標與議程（Agenda Setting）
2. 破冰活動（Ice Breaker）
3. 現況分析（As-Is Process）
4. 痛點收集（Pain Point Brainstorming）
5. 需求排序（MoSCoW Prioritization）
6. 共識確認（Consensus Building）
7. 行動項目（Action Items）
```

### 需求蒐集的 Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| 開放式提問 | 引導式提問 |
| 記錄原始用詞 | 自行翻譯意思 |
| 確認理解（Paraphrase） | 假設你理解了 |
| 問「為什麼」追根究柢 | 只記錄表面需求 |
| 區分需求 vs 解決方案 | 混淆兩者 |

---

## 27-4：User Stories 撰寫

### User Story 標準格式

```
As a [角色],
I want to [行動],
So that [價值/目的].
```

### INVEST 原則

| 原則 | 說明 | 反例 |
|------|------|------|
| **I**ndependent | 故事之間互不依賴 | 「做完 A 才能做 B」 |
| **N**egotiable | 細節可協商 | 規定太細的技術方案 |
| **V**aluable | 對用戶有價值 | 「建立 Database Schema」 |
| **E**stimable | 可估算工作量 | 「改善系統效能」 |
| **S**mall | 一個 Sprint 內完成 | 「重新設計整個系統」 |
| **T**estable | 可驗證完成 | 「讓用戶更開心」 |

### User Story 範例（電商退貨）

```
Epic: 退貨管理系統

Story 1:
As a 客戶,
I want to 在線上提交退貨申請,
So that 我不需要打電話給客服.

Story 2:
As a 客服人員,
I want to 看到退貨申請的完整歷史記錄,
So that 我可以快速處理客戶問題.

Story 3:
As a 營運主管,
I want to 看到退貨率的趨勢報表,
So that 我可以找出問題產品並採取行動.
```

### User Story Mapping

```
         活動（Activity）
    ┌────────┬────────┬────────┐
    │ 瀏覽商品 │ 下單結帳 │ 售後服務 │   ← Backbone
    ├────────┼────────┼────────┤
    │ 搜尋    │ 加入購物車│ 查詢訂單 │   ← MVP (Release 1)
    │ 篩選    │ 填寫地址  │ 申請退貨 │
    ├────────┼────────┼────────┤
    │ 推薦    │ 優惠券   │ 退款追蹤 │   ← Release 2
    │ 收藏    │ 分期付款  │ 換貨    │
    ├────────┼────────┼────────┤
    │ 比較    │ 訂閱    │ 評價    │   ← Release 3
    │ 社群分享  │ 禮物卡   │ 客服聊天 │
    └────────┴────────┴────────┘
```

### 拆分 User Story 的技巧

```
拆分維度：
1. 按工作流步驟拆分
2. 按業務規則拆分
3. 按資料類型拆分
4. 按操作（CRUD）拆分
5. 按用戶角色拆分
6. 按平台拆分（Web / Mobile / API）
```

---

## 27-5：Acceptance Criteria 撰寫

### 什麼是 Acceptance Criteria？

User Story 的「完成定義」。當這些條件都滿足時，Story 才算完成。

### 格式一：Given-When-Then（BDD 風格）

```
Given [前提條件],
When [用戶操作],
Then [預期結果].
```

### 範例：線上退貨申請

```
AC 1: 成功提交退貨
Given 客戶已登入且有一筆已完成的訂單,
When 客戶選擇該訂單並點擊「申請退貨」,
Then 系統顯示退貨表單，包含退貨原因選項.

AC 2: 退貨時限驗證
Given 訂單完成已超過 7 天,
When 客戶嘗試申請退貨,
Then 系統顯示「已超過退貨期限」的提示訊息.

AC 3: 退貨狀態通知
Given 客戶已提交退貨申請,
When 退貨狀態從「處理中」變更為「已核准」,
Then 系統發送 Email 通知客戶退貨已核准.

AC 4: 部分退貨
Given 訂單包含多個商品,
When 客戶只選擇部分商品申請退貨,
Then 系統只針對選取的商品計算退款金額.
```

### 格式二：Checklist 風格

```
Story: 客戶可以搜尋商品

Acceptance Criteria:
☐ 搜尋框出現在頁面頂部
☐ 輸入關鍵字後按 Enter 或點擊搜尋按鈕觸發搜尋
☐ 搜尋結果在 2 秒內顯示
☐ 沒有結果時顯示「找不到相關商品」提示
☐ 搜尋結果可按價格、評分、上架日期排序
☐ 搜尋關鍵字高亮顯示在結果中
☐ 支援中文與英文搜尋
```

### AC 撰寫的常見錯誤

| 錯誤 | 修正 |
|------|------|
| 太模糊：「系統正常運作」 | 具體描述預期行為 |
| 太技術：「POST /api/returns 回傳 201」 | 用業務語言描述 |
| 遺漏邊界條件 | 考慮錯誤、空值、極端情況 |
| 遺漏非功能需求 | 加入效能、安全性條件 |
| 只寫 Happy Path | 加入異常處理場景 |

### Definition of Done (DoD) vs Acceptance Criteria

| 面向 | Acceptance Criteria | Definition of Done |
|------|--------------------|--------------------|
| 適用範圍 | 特定 Story | 所有 Story |
| 內容 | 業務條件 | 品質標準 |
| 範例 | 退貨 7 天內可申請 | Code Review 通過 |
| 誰定義 | PO + BA | 團隊共識 |

---

## 27-6：完整需求文件實作

### 案例：線上叫車平台需求分析

#### 1. Business Requirements

```
專案名稱：GoRide 線上叫車平台
商業目標：
- 在 6 個月內達到每日 5,000 單
- 司機平均接單時間 < 3 分鐘
- 乘客滿意度 > 4.5 / 5.0
- 首年營收目標 NT$ 50M
```

#### 2. Stakeholder Map

```
高權力 / 高利益 → 密切合作：CEO、Product Owner、投資人
高權力 / 低利益 → 保持滿意：法規單位、合作車隊
低權力 / 高利益 → 保持知情：司機、乘客、客服
低權力 / 低利益 → 基本監控：媒體、競爭對手
```

#### 3. User Stories（核心 Epic）

```
Epic 1: 乘客叫車
- US-001: 乘客可以輸入目的地並查看預估費用
- US-002: 乘客可以選擇車型（經濟 / 舒適 / 商務）
- US-003: 乘客可以即時追蹤司機位置
- US-004: 乘客可以在行程結束後評分

Epic 2: 司機接單
- US-010: 司機可以上線/下線切換接單狀態
- US-011: 司機收到叫車通知後 30 秒內決定接受或拒絕
- US-012: 司機可以查看當日收入統計

Epic 3: 計費與支付
- US-020: 系統根據距離 + 時間自動計算費用
- US-021: 支援信用卡、行動支付
- US-022: 行程結束自動扣款並發送收據
```

#### 4. 關鍵 Acceptance Criteria

```
US-001 Acceptance Criteria:

Given 乘客已輸入上車地點和目的地,
When 系統計算完路線,
Then 顯示預估費用範圍（±15%）和預估時間.

Given 尖峰時段（動態定價生效）,
When 乘客查看預估費用,
Then 顯示加成倍率和原始價格的比較.

Given 輸入的地址無法辨識,
When 乘客提交目的地,
Then 顯示建議地址列表供選擇.
```

#### 5. Non-Functional Requirements

```
NFR-001: 叫車請求回應時間 < 2 秒（p95）
NFR-002: 系統可用性 99.95%（每月停機 < 22 分鐘）
NFR-003: 支援 50,000 同時在線用戶
NFR-004: 位置更新頻率每 3 秒一次
NFR-005: 支付資料加密（AES-256）
NFR-006: 符合個資法（GDPR / 台灣個資法）
```

#### 6. 需求追蹤矩陣（Requirements Traceability Matrix）

| 需求 ID | 需求描述 | 來源 | 優先級 | 狀態 | 測試案例 |
|---------|---------|------|--------|------|---------|
| US-001 | 乘客查看預估費用 | Stakeholder Workshop | Must | In Progress | TC-001, TC-002 |
| US-002 | 選擇車型 | User Research | Must | Backlog | TC-003 |
| US-003 | 即時追蹤司機位置 | User Research | Must | Backlog | TC-004, TC-005 |
| NFR-001 | 回應時間 < 2 秒 | SLA Agreement | Must | Backlog | TC-P01 |

---

## Cheat Sheet：需求分析速查表

### 需求分析流程

```
1. 理解商業背景 → Business Requirements
2. 識別利害關係人 → Stakeholder Analysis
3. 蒐集需求 → Interviews, Workshops, Surveys
4. 撰寫 User Stories → As a / I want / So that
5. 定義 Acceptance Criteria → Given / When / Then
6. 區分 FR vs NFR → FURPS+ 框架
7. 建立追蹤矩陣 → Traceability Matrix
8. 確認與簽核 → Review & Sign-off
```

### 面試高頻問題速答

| 問題 | 關鍵回答要素 |
|------|------------|
| 如何蒐集需求？ | SPIN 訪談、Workshop、文件分析 |
| FR vs NFR 差異？ | FR = 系統做什麼；NFR = 系統品質屬性 |
| User Story 格式？ | As a / I want / So that + INVEST |
| 需求衝突怎麼辦？ | MoSCoW 排序 + Stakeholder 協商 |
| 如何確保需求完整？ | Traceability Matrix + Review Session |

### MoSCoW 優先級

```
Must have    — 沒有就不能上線（60% 工作量）
Should have  — 重要但非必須（20%）
Could have   — 有最好（15%）
Won't have   — 這次不做（5%，記錄在 Backlog）
```

"""

    // MARK: - World 27 (en)
    private static let enWorld27 = """

# World 27: Requirements Analysis

> Requirements analysis is the most essential skill for a Business Analyst. Figuring out "what exactly needs to be done" matters more than "how to do it."
> This chapter teaches you how to extract clear, actionable requirements from ambiguous business needs.

The most common interview questions: "How do you confirm requirements?" "How do you handle requirement conflicts?"
This chapter gives you a systematic approach to answering these questions.

---

## 27-1: Business Requirements vs User Requirements

### Fundamental Differences Between the Two

| Aspect | Business Requirements | User Requirements |
|--------|----------------------|-------------------|
| Perspective | Enterprise / Management | End Users |
| Focus | ROI, Market Share, Efficiency | Usability, Features, Experience |
| Expression | Goal-oriented (Increase conversion rate by 20%) | Behavior-oriented (I want one-click checkout) |
| Decision Maker | C-level, Product Owner | User Research, UX Team |
| Priority | Strategic Level | Execution Level |

### Business Requirements Example

```
Objective: Reduce customer service costs by 30%
Background: Currently handling 10,000 customer service calls per month, average handling time 8 minutes
Expectation: Automate 40% of common issues through a self-service system
KPIs: Number of service calls, average handling time, customer satisfaction
Timeline: MVP by Q3, full launch by Q4
```

### User Requirements Example

```
As an online shopping customer,
I want to check my order delivery status on the website,
So that I don't need to call customer service to ask.

Acceptance Criteria:
- Can look up by entering the order number
- Shows estimated delivery time
- Proactive notification for delivery exceptions
- Page load time < 2 seconds
```

### The Relationship: Top-Down Decomposition

```
Business Goal
  ↓ Why?
Business Requirement
  ↓ What?
User Requirement
  ↓ How?
Functional Requirement
  ↓ Spec
Technical Specification
```

### Interview Focus

> "Describe an experience where you translated a business objective into specific requirements."

Answer Framework:
1. Business Context and Objectives
2. Analysis You Performed (Gap Analysis)
3. How You Decomposed into User Requirements (Decomposition)
4. Final Deliverables and Impact

---

## 27-2: Functional vs Non-Functional Requirements

### Functional Requirements (FR)

Behaviors and features the system "must perform."

| Category | Example |
|----------|---------|
| User Management | Users can register an account using email |
| Search | Supports keyword search, filtering, and sorting |
| Transaction Processing | Supports credit card and mobile payment checkout |
| Notification System | Sends email notification when order status changes |
| Reporting | Admins can export monthly sales reports (CSV) |

### Non-Functional Requirements (NFR)

Quality Attributes of the system.

| NFR Category | Definition | Measurement | Example |
|-------------|-----------|-------------|---------|
| Performance | Response speed | Response Time | Page load < 2 seconds |
| Scalability | Expansion capability | Concurrent Users | Support 10,000 simultaneous users |
| Availability | Uptime | Uptime % | 99.9% uptime (SLA) |
| Security | Protection | Compliance | PCI DSS compliant |
| Usability | Ease of use | Task Completion Rate | New users complete registration within 5 minutes |
| Maintainability | Ease of maintenance | MTTR | Average repair time < 4 hours |
| Compatibility | Cross-platform support | Browser/OS Support | Support Chrome, Safari, Edge |

### FURPS+ Framework

```
F — Functionality
U — Usability
R — Reliability
P — Performance
S — Supportability
+ — Design constraints, Implementation, Interface, Physical
```

### Common Mistakes

- ❌ Only writing functional requirements, ignoring non-functional ones
- ❌ NFR too vague: "System should be fast" → ✅ "API response time p95 < 500ms"
- ❌ Not defining measurement criteria
- ❌ Writing solutions as requirements: "Use Redis for caching" → ✅ "Repeated query response time < 100ms"

### Practice Question

> "Design a shopping cart feature for an e-commerce platform. List the FR and NFR."

Functional Requirements:
- Add / Remove items
- Modify quantity
- Display subtotal and grand total
- Save cart (cross-device sync for logged-in users)
- Apply coupons

Non-Functional Requirements:
- Cart operation response < 500ms
- Support 5,000 concurrent operations
- Cart data retained for 30 days
- Responsive design for mobile and desktop

---

## 27-3: Requirements Elicitation Techniques

### Common Elicitation Methods

| Method | Best For | Pros | Cons |
|--------|----------|------|------|
| Interview | Deep requirement understanding | Flexible, in-depth | Time-consuming, subjective bias |
| Workshop | Multi-party consensus | Efficient, interactive | Requires facilitation skills |
| Survey | Large-scale user feedback | Scalable, quantifiable | Low response rate, lacks depth |
| Observation | Understanding actual usage behavior | Authentic, objective | Hawthorne effect |
| Document Analysis | Understanding existing processes | Non-intrusive | May be outdated |
| Prototyping | Validating requirement understanding | Intuitive, fast feedback | May be mistaken for final product |

### Interview Technique — SPIN Framework

```
S — Situation: What is the current process?
P — Problem: What is the biggest pain point?
I — Implication: What impact does this problem cause?
N — Need-payoff: If resolved, what benefits would it bring?
```

### Interview Question Examples

```
Situation:
"Can you describe your current process for handling returns?"
"How many returns do you process per day?"

Problem:
"Which step in this process takes the most time?"
"Where do errors occur most frequently?"

Implication:
"What consequences do these errors lead to? Customer complaints? Refund delays?"
"How much does this problem cost per month?"

Need-payoff:
"If the return process could be automated, how much time do you think it would save?"
"What kind of solution would be most helpful to you?"
```

### Workshop Facilitation Techniques

```
1. Agenda Setting
2. Ice Breaker
3. As-Is Process Analysis
4. Pain Point Brainstorming
5. MoSCoW Prioritization
6. Consensus Building
7. Action Items
```

### Requirements Elicitation Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Ask open-ended questions | Ask leading questions |
| Record original wording | Interpret meaning yourself |
| Confirm understanding (Paraphrase) | Assume you understand |
| Ask "Why" to get to root cause | Only capture surface requirements |
| Distinguish requirements vs solutions | Confuse the two |

---

## 27-4: Writing User Stories

### Standard User Story Format

```
As a [role],
I want to [action],
So that [value/purpose].
```

### INVEST Principles

| Principle | Description | Counter-Example |
|-----------|-------------|-----------------|
| **I**ndependent | Stories don't depend on each other | "Must complete A before doing B" |
| **N**egotiable | Details are negotiable | Over-specified technical solution |
| **V**aluable | Valuable to the user | "Create Database Schema" |
| **E**stimable | Effort can be estimated | "Improve system performance" |
| **S**mall | Completable within one Sprint | "Redesign the entire system" |
| **T**estable | Completion is verifiable | "Make users happier" |

### User Story Example (E-Commerce Returns)

```
Epic: Return Management System

Story 1:
As a customer,
I want to submit a return request online,
So that I don't need to call customer service.

Story 2:
As a customer service agent,
I want to see the complete history of return requests,
So that I can quickly resolve customer issues.

Story 3:
As an operations manager,
I want to see trend reports on return rates,
So that I can identify problematic products and take action.
```

### User Story Mapping

```
         Activity
    ┌────────────┬────────────┬──────────────┐
    │ Browse     │ Place      │ After-sales  │   ← Backbone
    │ Products   │ Order      │ Service      │
    ├────────────┼────────────┼──────────────┤
    │ Search     │ Add to Cart│ Track Order  │   ← MVP (Release 1)
    │ Filter     │ Enter      │ Request      │
    │            │ Address    │ Return       │
    ├────────────┼────────────┼──────────────┤
    │ Recommend  │ Coupons    │ Refund       │   ← Release 2
    │ Favorites  │ Installment│ Tracking     │
    │            │ Payment    │ Exchange     │
    ├────────────┼────────────┼──────────────┤
    │ Compare    │ Subscribe  │ Reviews      │   ← Release 3
    │ Social     │ Gift Cards │ Live Chat    │
    │ Share      │            │ Support      │
    └────────────┴────────────┴──────────────┘
```

### Techniques for Splitting User Stories

```
Splitting Dimensions:
1. By workflow steps
2. By business rules
3. By data types
4. By operations (CRUD)
5. By user roles
6. By platform (Web / Mobile / API)
```

---

## 27-5: Writing Acceptance Criteria

### What Are Acceptance Criteria?

The "definition of done" for a User Story. The Story is only complete when all these conditions are met.

### Format 1: Given-When-Then (BDD Style)

```
Given [precondition],
When [user action],
Then [expected result].
```

### Example: Online Return Request

```
AC 1: Successful Return Submission
Given the customer is logged in and has a completed order,
When the customer selects that order and clicks "Request Return",
Then the system displays a return form with return reason options.

AC 2: Return Deadline Validation
Given the order was completed more than 7 days ago,
When the customer attempts to request a return,
Then the system displays a "Return period has expired" message.

AC 3: Return Status Notification
Given the customer has submitted a return request,
When the return status changes from "Processing" to "Approved",
Then the system sends an email notification informing the customer that the return is approved.

AC 4: Partial Return
Given the order contains multiple items,
When the customer selects only some items for return,
Then the system calculates the refund amount only for the selected items.
```

### Format 2: Checklist Style

```
Story: Customer can search for products

Acceptance Criteria:
☐ Search box appears at the top of the page
☐ Entering keywords and pressing Enter or clicking the search button triggers the search
☐ Search results display within 2 seconds
☐ Shows "No matching products found" message when there are no results
☐ Search results can be sorted by price, rating, listing date
☐ Search keywords are highlighted in the results
☐ Supports both Chinese and English search
```

### Common Mistakes in Writing AC

| Mistake | Correction |
|---------|-----------|
| Too vague: "System works properly" | Describe expected behavior specifically |
| Too technical: "POST /api/returns returns 201" | Use business language |
| Missing edge cases | Consider errors, null values, extreme cases |
| Missing non-functional requirements | Include performance and security conditions |
| Only writing the Happy Path | Include exception handling scenarios |

### Definition of Done (DoD) vs Acceptance Criteria

| Aspect | Acceptance Criteria | Definition of Done |
|--------|--------------------|--------------------|
| Scope | Specific Story | All Stories |
| Content | Business conditions | Quality standards |
| Example | Returns allowed within 7 days | Code Review passed |
| Defined By | PO + BA | Team consensus |

---

## 27-6: Complete Requirements Document in Practice

### Case Study: Ride-Hailing Platform Requirements Analysis

#### 1. Business Requirements

```
Project Name: GoRide Ride-Hailing Platform
Business Objectives:
- Reach 5,000 rides per day within 6 months
- Average driver pickup time < 3 minutes
- Rider satisfaction > 4.5 / 5.0
- First-year revenue target: $1.6M
```

#### 2. Stakeholder Map

```
High Power / High Interest → Manage Closely: CEO, Product Owner, Investors
High Power / Low Interest → Keep Satisfied: Regulatory bodies, Partner fleets
Low Power / High Interest → Keep Informed: Drivers, Riders, Customer service
Low Power / Low Interest → Monitor: Media, Competitors
```

#### 3. User Stories (Core Epics)

```
Epic 1: Rider Booking
- US-001: Rider can enter a destination and view estimated fare
- US-002: Rider can choose a vehicle type (Economy / Comfort / Business)
- US-003: Rider can track the driver's location in real time
- US-004: Rider can rate the ride after completion

Epic 2: Driver Acceptance
- US-010: Driver can toggle online/offline status for accepting rides
- US-011: Driver must accept or decline a ride request within 30 seconds
- US-012: Driver can view daily earnings summary

Epic 3: Fare Calculation and Payment
- US-020: System automatically calculates fare based on distance + time
- US-021: Supports credit card and mobile payment
- US-022: Automatic charge upon trip completion with receipt sent
```

#### 4. Key Acceptance Criteria

```
US-001 Acceptance Criteria:

Given the rider has entered a pickup location and destination,
When the system finishes calculating the route,
Then it displays the estimated fare range (±15%) and estimated time.

Given surge pricing is active (dynamic pricing in effect),
When the rider views the estimated fare,
Then it displays the surge multiplier and a comparison with the base price.

Given the entered address cannot be recognized,
When the rider submits the destination,
Then it displays a list of suggested addresses to choose from.
```

#### 5. Non-Functional Requirements

```
NFR-001: Ride request response time < 2 seconds (p95)
NFR-002: System availability 99.95% (monthly downtime < 22 minutes)
NFR-003: Support 50,000 concurrent online users
NFR-004: Location update frequency every 3 seconds
NFR-005: Payment data encryption (AES-256)
NFR-006: Compliant with data protection regulations (GDPR / local privacy laws)
```

#### 6. Requirements Traceability Matrix

| Req ID | Description | Source | Priority | Status | Test Cases |
|--------|------------|--------|----------|--------|-----------|
| US-001 | Rider views estimated fare | Stakeholder Workshop | Must | In Progress | TC-001, TC-002 |
| US-002 | Choose vehicle type | User Research | Must | Backlog | TC-003 |
| US-003 | Real-time driver tracking | User Research | Must | Backlog | TC-004, TC-005 |
| NFR-001 | Response time < 2 seconds | SLA Agreement | Must | Backlog | TC-P01 |

---

## Cheat Sheet: Requirements Analysis Quick Reference

### Requirements Analysis Process

```
1. Understand business context → Business Requirements
2. Identify stakeholders → Stakeholder Analysis
3. Elicit requirements → Interviews, Workshops, Surveys
4. Write User Stories → As a / I want / So that
5. Define Acceptance Criteria → Given / When / Then
6. Distinguish FR vs NFR → FURPS+ Framework
7. Build traceability matrix → Traceability Matrix
8. Confirm and sign off → Review & Sign-off
```

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| How do you elicit requirements? | SPIN interviews, Workshops, Document analysis |
| FR vs NFR difference? | FR = what the system does; NFR = system quality attributes |
| User Story format? | As a / I want / So that + INVEST |
| How to handle requirement conflicts? | MoSCoW prioritization + Stakeholder negotiation |
| How to ensure requirement completeness? | Traceability Matrix + Review Sessions |

### MoSCoW Prioritization

```
Must have    — Cannot go live without it (60% of effort)
Should have  — Important but not essential (20%)
Could have   — Nice to have (15%)
Won't have   — Not doing this time (5%, recorded in Backlog)
```

"""

    // MARK: - World 28 (zh)
    private static let zhWorld28 = """

# World 28：利害關係人管理

> 專案成敗往往不是技術問題，而是「人」的問題。學會識別、分析、管理利害關係人，是 BA 的必修課。

面試常問：「你如何處理需求衝突？」「如何跟不同層級的人溝通？」
這一章給你系統化的框架來回答。

---

## 28-1：利害關係人識別

### 什麼是 Stakeholder？

任何會被專案影響、或能影響專案的個人或群體。

### 識別的四個來源

```
1. 組織架構圖（Org Chart）
   → 誰是專案 Sponsor？誰是決策者？

2. 流程圖（Process Map）
   → 誰在用這個系統？誰提供資料？誰接收輸出？

3. 合約與法規
   → 外部供應商、監管單位、合規部門

4. 歷史記錄
   → 上一個類似專案涉及哪些人？
```

### Stakeholder 分類

| 分類 | 說明 | 範例 |
|------|------|------|
| Primary | 直接使用系統 | 終端用戶、操作人員 |
| Secondary | 間接受影響 | 管理層、報表閱讀者 |
| Key | 有決策權 | Sponsor、VP、PO |
| External | 組織外部 | 客戶、供應商、監管單位 |

### Stakeholder Register（登記表）

| 姓名 | 職稱 | 部門 | 角色 | 影響力 | 利益程度 | 態度 | 溝通頻率 |
|------|------|------|------|--------|---------|------|---------|
| 王總 | VP Sales | 業務部 | Sponsor | 高 | 高 | 支持 | 每週 |
| 李經理 | IT Manager | IT | Technical Lead | 中 | 中 | 中立 | 每週 |
| 張主任 | CS Manager | 客服 | End User Rep | 低 | 高 | 擔憂 | 每日 |
| 陳律師 | Legal Counsel | 法務 | Advisor | 高 | 低 | 中立 | 按需 |

### RACI 矩陣

| 任務 | Product Owner | BA | Dev Lead | QA | 法務 |
|------|--------------|-----|---------|-----|------|
| 需求確認 | A | R | C | I | I |
| 架構設計 | I | C | R/A | C | I |
| 測試計畫 | I | C | C | R/A | I |
| 上線審核 | A | R | R | R | C |
| 合規審查 | I | C | I | I | R/A |

```
R = Responsible（負責執行）
A = Accountable（最終負責，只能一人）
C = Consulted（諮詢，雙向溝通）
I = Informed（通知，單向溝通）
```

---

## 28-2：Power/Interest Grid 分析

### 四象限模型

```
             高權力
              │
   Keep       │      Manage
   Satisfied  │      Closely
   （保持滿意） │   （密切管理）
              │
──────────────┼──────────────
              │
   Monitor    │      Keep
   （基本監控） │     Informed
              │   （保持知情）
              │
             低權力
    低利益 ←──────→ 高利益
```

### 各象限策略

| 象限 | 特徵 | 策略 | 溝通方式 |
|------|------|------|---------|
| 高權力 / 高利益 | 核心決策者 | 密切合作、定期 1:1 | 每週面對面會議 |
| 高權力 / 低利益 | 有權但不太關注 | 定期更新、不打擾 | 月度摘要報告 |
| 低權力 / 高利益 | 關心但影響力有限 | 讓他們感覺被聽到 | 每週 Newsletter |
| 低權力 / 低利益 | 邊緣相關人 | 最低限度溝通 | 按需更新 |

### 實作範例：CRM 系統導入專案

```
Manage Closely（高權力 / 高利益）:
- 業務副總（Sponsor，預算決策者）
- Product Owner（需求決策者）
→ 策略：每週進度會議、關鍵決策前先 1:1 對齊

Keep Satisfied（高權力 / 低利益）:
- CTO（技術審核權）
- 財務長（預算審核）
→ 策略：月度報告、里程碑達成時主動通知

Keep Informed（低權力 / 高利益）:
- 業務團隊（每天使用 CRM）
- 客服團隊（間接受影響）
→ 策略：Demo Session、意見回饋管道

Monitor（低權力 / 低利益）:
- 行政部門
- 外部顧問
→ 策略：專案公告、需要時再聯繫
```

### Salience Model（進階分析）

三個維度：Power（權力）、Legitimacy（合法性）、Urgency（急迫性）

```
擁有維度數量 → 分類：
3 個維度 → Definitive Stakeholder（最高優先）
2 個維度 → Expectant Stakeholder（高度關注）
1 個維度 → Latent Stakeholder（監控即可）
0 個維度 → Non-Stakeholder
```

---

## 28-3：溝通計畫制定

### 溝通計畫模板

| 利害關係人 | 資訊需求 | 頻率 | 管道 | 負責人 | 格式 |
|-----------|---------|------|------|--------|------|
| Sponsor | 進度、風險、預算 | 每週 | 1:1 會議 | PM | 摘要簡報 |
| Dev Team | 需求細節、變更 | 每日 | Stand-up | BA | Jira 更新 |
| End Users | 功能介紹、培訓 | 按里程碑 | Workshop | BA | Demo + 文件 |
| 管理層 | 里程碑、ROI | 每月 | Email | PM | Dashboard |
| 法務 | 合規需求 | 按需 | Email | BA | 文件 |

### 溝通管道選擇

| 管道 | 適用場景 | 優點 | 缺點 |
|------|---------|------|------|
| 面對面會議 | 重要決策、衝突解決 | 最高帶寬、即時回饋 | 排程困難 |
| 視訊會議 | 遠端團隊、定期更新 | 方便、可錄製 | 容易分心 |
| Email | 正式記錄、知會通知 | 留下紀錄 | 延遲回覆 |
| Slack/Teams | 快速問題、日常協作 | 即時、低門檻 | 資訊碎片化 |
| Confluence/Wiki | 文件、知識庫 | 結構化、可搜尋 | 更新不及時 |
| Dashboard | 進度追蹤、KPI | 自助式、即時 | 需要建置 |

### 向上溝通（Upward Communication）技巧

```
原則：
1. 先說結論（Bottom Line Up Front, BLUF）
2. 用數字說話
3. 提供選項而非問題
4. 控制在 5 分鐘內

範例（跟 VP 彙報）：

❌ 差的版本：
「我們在做 CRM 專案，目前遇到一些問題，
API 那邊整合有困難，團隊也缺人，
所以時程可能要延後...」

✅ 好的版本：
「CRM 專案進度：整體完成 65%，比計畫落後 1 週。
主要風險：第三方 API 整合延遲。
建議方案：
A) 增加 1 名工程師（成本 +$5K，時程不變）
B) 縮減 Scope（Phase 2 報表延後，節省 2 週）
需要您決定方向。」
```

### 溝通矩陣範例

```
        │ 技術細節 │ 業務影響 │ 時程預算 │ 風險
────────┼─────────┼────────┼────────┼──────
Sponsor │   低    │   高    │   高   │  高
Dev     │   高    │   低    │   中   │  中
User    │   低    │   高    │   低   │  低
QA      │   高    │   低    │   中   │  高
```

---

## 28-4：期望管理

### 期望管理的核心原則

```
1. Under-promise, Over-deliver
   → 承諾 80%，交付 110%

2. 透明溝通
   → 壞消息越早說越好

3. 管理範圍蔓延（Scope Creep）
   → 每個新需求都評估影響

4. 設定清楚的邊界
   → What's in / What's out
```

### Scope Creep 管理流程

```
新需求提出
    ↓
影響分析（Impact Assessment）
    ↓
┌─────────────────────────────────┐
│ 評估項目：                        │
│ • 時程影響：延後幾天/幾週？        │
│ • 成本影響：需要額外資源？          │
│ • 風險影響：是否增加技術風險？      │
│ • 品質影響：會不會犧牲其他功能？    │
└─────────────────────────────────┘
    ↓
提交 Change Request
    ↓
CCB（Change Control Board）審核
    ↓
批准 / 拒絕 / 延後
    ↓
更新計畫 & 通知相關人
```

### 管理不同層級的期望

| 層級 | 典型期望 | 管理策略 |
|------|---------|---------|
| C-level | 按時上線、在預算內 | 定期進度報告、提前預警 |
| 中階主管 | 不要影響日常營運 | 部署計畫、過渡期支援 |
| 終端用戶 | 新系統要比舊的好用 | 早期參與、培訓計畫 |
| IT 團隊 | 需求不要一直改 | 明確的變更流程 |

### 面試題：「如何處理不合理的 Deadline？」

```
回答框架：

1. 確認理解（Clarify）
   「讓我確認一下，您希望在 X 日期前完成這些功能？」

2. 分析影響（Analyze）
   「根據我的評估，這個時程需要 Y 個工作天，
    但我們只有 Z 天。差距是 N 天。」

3. 提供選項（Options）
   A) 減少範圍（推薦）：只做 Must-have，其餘放 Phase 2
   B) 增加資源：多 2 名工程師，但需要 1 週 ramp-up
   C) 降低品質：跳過部分測試（不推薦，說明風險）

4. 建議方案（Recommend）
   「我建議方案 A，這樣核心功能可以如期上線，
    Phase 2 在下個 Sprint 完成。」

5. 記錄共識（Document）
   會議紀錄 + Email 確認
```

---

## 28-5：衝突解決

### 常見衝突類型

| 類型 | 範例 | 根本原因 |
|------|------|---------|
| 需求衝突 | 業務要快上線 vs QA 要充分測試 | 優先級不同 |
| 資源衝突 | 兩個專案搶同一個工程師 | 資源有限 |
| 認知衝突 | 對問題的理解不一致 | 資訊不對等 |
| 價值衝突 | 短期收益 vs 長期架構 | 目標不一致 |
| 人際衝突 | 個人風格差異 | 溝通問題 |

### Thomas-Kilmann 衝突模型

```
                高
                │
    Competing   │   Collaborating
    （競爭）     │   （合作）
    Win-Lose    │   Win-Win
    果斷性       │
                │   Compromising
                │   （妥協）
                │   Give & Take
                │
    Avoiding    │   Accommodating
    （迴避）     │   （遷就）
    Lose-Lose   │   Lose-Win
                │
                低──────────────────高
                    合作性
```

### 各策略適用場景

| 策略 | 適用場景 | 範例 |
|------|---------|------|
| Collaborating | 雙方利益都重要 | 跨部門需求整合 |
| Competing | 緊急且你確定是對的 | 安全漏洞必須立即修復 |
| Compromising | 時間有限、需要快速解決 | Scope 協商 |
| Accommodating | 對方的議題更重要 | 讓步非核心需求 |
| Avoiding | 議題不重要或需要冷靜 | 情緒化的爭論 |

### 衝突解決的 STAR 框架

```
Situation: 描述衝突背景
Task: 你的角色和責任
Action: 你採取的具體步驟
Result: 最終結果和學到的教訓
```

### 實戰範例：業務部 vs 工程部 需求衝突

```
Situation:
業務部要求在 2 週內上線新的折扣計算功能，
工程部評估至少需要 6 週（含測試）。

Task:
作為 BA，我需要找到雙方都能接受的方案。

Action:
1. 分別跟雙方 1:1 了解真實需求
   - 業務：月底有促銷活動，需要折扣功能
   - 工程：核心是計算邏輯複雜，需要充分測試

2. 分析核心需求
   - 業務真正需要的是「能在月底做促銷」
   - 工程擔心的是「計算錯誤導致虧損」

3. 提出折衷方案
   - Phase 1（2 週）：固定折扣（全館 85 折），規則簡單
   - Phase 2（4 週後）：彈性折扣（分層、組合、滿額）
   - 額外：Phase 1 加入管理員手動確認步驟降低風險

4. 召開三方會議達成共識

Result:
- Phase 1 如期上線，促銷活動成功
- Phase 2 完整功能上線，零計算錯誤
- 雙方對結果滿意
```

### 衝突解決 Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| 聚焦問題，不攻擊個人 | 在公開場合批評 |
| 用數據支持論點 | 只靠感覺或經驗 |
| 尋找共同利益 | 堅持零和思維 |
| 主動提出替代方案 | 只提問題不給方案 |
| 記錄共識與決定 | 口頭承諾沒有記錄 |

---

## 28-6：利害關係人管理策略案例

### 案例：企業 ERP 系統升級

#### 背景

```
公司：中型製造業（員工 500 人）
專案：從舊版 ERP 升級到雲端 ERP
預算：NT$ 15M
時程：12 個月
影響範圍：全公司所有部門
```

#### Stakeholder Map

```
Manage Closely（密切管理）:
┌─────────────────────────────────────┐
│ CEO — 最終決策者                      │
│ 擔心：投資報酬、營運中斷               │
│ 策略：月度 Executive Review           │
│                                      │
│ CFO — 預算控制者                      │
│ 擔心：成本超支、ROI 不明確             │
│ 策略：每月預算報告 + ROI 追蹤          │
│                                      │
│ 營運副總 — 最大受影響部門               │
│ 擔心：生產線停擺                       │
│ 策略：每週進度同步、提前部署計畫        │
└─────────────────────────────────────┘

Keep Satisfied（保持滿意）:
┌─────────────────────────────────────┐
│ CTO — 技術決策                       │
│ 策略：架構審查會議（按里程碑）         │
│                                      │
│ 外部顧問公司                          │
│ 策略：合約管理、定期 Review            │
└─────────────────────────────────────┘

Keep Informed（保持知情）:
┌─────────────────────────────────────┐
│ 各部門主管 — 日常使用影響              │
│ 策略：月度 Newsletter + Q&A Session   │
│                                      │
│ 終端用戶（全公司）                     │
│ 策略：培訓計畫 + 支援熱線              │
└─────────────────────────────────────┘

Monitor（基本監控）:
┌─────────────────────────────────────┐
│ 外部稽核                              │
│ 策略：合規文件備查                     │
└─────────────────────────────────────┘
```

#### 溝通計畫

| 階段 | 對象 | 訊息重點 | 管道 | 頻率 |
|------|------|---------|------|------|
| 啟動 | 全公司 | Why change、願景、時程 | 全員大會 | 一次 |
| 分析 | 部門主管 | 需求確認、流程調整 | Workshop | 每部門 2 次 |
| 開發 | Sponsor | 進度、風險、決策需求 | 1:1 | 每週 |
| 測試 | End Users | UAT 參與、回饋收集 | 培訓 Session | 密集 |
| 上線 | 全公司 | 操作指南、支援管道 | Email + 影片 | 上線前後 |

#### 風險與應對

| 風險 | 影響 | 機率 | 應對策略 |
|------|------|------|---------|
| 用戶抗拒改變 | 高 | 高 | 變革管理、早期參與、Champions 制度 |
| Scope Creep | 高 | 中 | 嚴格 Change Control Process |
| 關鍵人員離職 | 高 | 低 | 知識轉移、文件化、備援人力 |
| 資料遷移失敗 | 極高 | 中 | 多輪測試、回退計畫、平行運行 |

#### 變革管理（ADKAR Model）

```
A — Awareness（認知）：為什麼要改？
    → 現有系統維護成本年增 20%，無法支援新業務
D — Desire（意願）：為什麼我要配合？
    → 新系統讓你的工作更輕鬆，不再手動對帳
K — Knowledge（知識）：我要學什麼？
    → 提供完整培訓課程和操作手冊
A — Ability（能力）：我做得到嗎？
    → 1 個月的平行運行期，有專人在旁協助
R — Reinforcement（強化）：改變會持續嗎？
    → KPI 調整、激勵措施、持續改善機制
```

---

## Cheat Sheet：利害關係人管理速查表

### 核心工具

```
1. Stakeholder Register → 誰是利害關係人？
2. Power/Interest Grid → 怎麼分類？
3. RACI Matrix → 誰負責什麼？
4. Communication Plan → 怎麼溝通？
5. ADKAR Model → 怎麼推動變革？
6. Thomas-Kilmann Model → 怎麼處理衝突？
```

### 面試高頻問題速答

| 問題 | 關鍵回答要素 |
|------|------------|
| 如何識別 Stakeholder？ | 組織圖 + 流程圖 + 合約 + 歷史 |
| Power/Interest Grid 怎麼用？ | 四象限分類，差異化溝通策略 |
| RACI 是什麼？ | Responsible / Accountable / Consulted / Informed |
| 需求衝突怎麼辦？ | 找共同利益 + 提供選項 + 數據支持 |
| 用戶抗拒改變？ | ADKAR + 早期參與 + 培訓 + Champions |
| Scope Creep 怎麼管？ | Change Request + Impact Assessment + CCB |

### 溝通黃金法則

```
對上：先結論、用數字、給選項
對下：先 Why、多聆聽、勤回饋
對外：專業、簡潔、留紀錄
衝突：對事不對人、找共識、記錄決定
```

"""

    // MARK: - World 28 (en)
    private static let enWorld28 = """

# World 28: Stakeholder Management

> Project success or failure often comes down to "people" issues, not technical problems. Learning to identify, analyze, and manage stakeholders is an essential course for every BA.

Common interview questions: "How do you handle requirement conflicts?" "How do you communicate with people at different levels?"
This chapter provides you with systematic frameworks to answer these questions.

---

## 28-1: Stakeholder Identification

### What Is a Stakeholder?

Any individual or group that is affected by or can influence the project.

### Four Sources for Identification

```
1. Organization Chart (Org Chart)
   → Who is the project Sponsor? Who are the decision makers?

2. Process Map
   → Who uses this system? Who provides data? Who receives output?

3. Contracts and Regulations
   → External vendors, regulatory bodies, compliance departments

4. Historical Records
   → Who was involved in the last similar project?
```

### Stakeholder Classification

| Category | Description | Examples |
|----------|-------------|----------|
| Primary | Directly uses the system | End users, operators |
| Secondary | Indirectly affected | Management, report readers |
| Key | Has decision-making authority | Sponsor, VP, PO |
| External | Outside the organization | Customers, vendors, regulators |

### Stakeholder Register

| Name | Title | Department | Role | Influence | Interest | Attitude | Communication Frequency |
|------|-------|-----------|------|-----------|----------|----------|------------------------|
| VP Wang | VP Sales | Sales | Sponsor | High | High | Supportive | Weekly |
| Mgr. Li | IT Manager | IT | Technical Lead | Medium | Medium | Neutral | Weekly |
| Sup. Zhang | CS Manager | Customer Service | End User Rep | Low | High | Concerned | Daily |
| Atty. Chen | Legal Counsel | Legal | Advisor | High | Low | Neutral | As needed |

### RACI Matrix

| Task | Product Owner | BA | Dev Lead | QA | Legal |
|------|--------------|-----|---------|-----|-------|
| Requirements Confirmation | A | R | C | I | I |
| Architecture Design | I | C | R/A | C | I |
| Test Plan | I | C | C | R/A | I |
| Go-Live Approval | A | R | R | R | C |
| Compliance Review | I | C | I | I | R/A |

```
R = Responsible (performs the work)
A = Accountable (ultimately answerable, only one person)
C = Consulted (two-way communication)
I = Informed (one-way communication)
```

---

## 28-2: Power/Interest Grid Analysis

### Four-Quadrant Model

```
             High Power
              │
   Keep       │      Manage
   Satisfied  │      Closely
              │
──────────────┼──────────────
              │
   Monitor    │      Keep
              │     Informed
              │
             Low Power
    Low Interest ←──────→ High Interest
```

### Strategies for Each Quadrant

| Quadrant | Characteristics | Strategy | Communication Method |
|----------|----------------|----------|---------------------|
| High Power / High Interest | Core decision makers | Close collaboration, regular 1:1 | Weekly face-to-face meetings |
| High Power / Low Interest | Influential but not very engaged | Regular updates, don't disturb | Monthly summary reports |
| Low Power / High Interest | Interested but limited influence | Make them feel heard | Weekly newsletter |
| Low Power / Low Interest | Peripherally related | Minimum communication | As-needed updates |

### Practical Example: CRM System Implementation

```
Manage Closely (High Power / High Interest):
- VP of Sales (Sponsor, budget decision maker)
- Product Owner (requirements decision maker)
→ Strategy: Weekly progress meetings, 1:1 alignment before key decisions

Keep Satisfied (High Power / Low Interest):
- CTO (technical review authority)
- CFO (budget approval)
→ Strategy: Monthly reports, proactive notification upon milestone completion

Keep Informed (Low Power / High Interest):
- Sales team (daily CRM users)
- Customer service team (indirectly affected)
→ Strategy: Demo sessions, feedback channels

Monitor (Low Power / Low Interest):
- Administrative department
- External consultants
→ Strategy: Project announcements, contact when needed
```

### Salience Model (Advanced Analysis)

Three dimensions: Power, Legitimacy, Urgency

```
Number of dimensions held → Classification:
3 dimensions → Definitive Stakeholder (highest priority)
2 dimensions → Expectant Stakeholder (high attention)
1 dimension  → Latent Stakeholder (monitor only)
0 dimensions → Non-Stakeholder
```

---

## 28-3: Communication Plan Development

### Communication Plan Template

| Stakeholder | Information Needs | Frequency | Channel | Owner | Format |
|-------------|------------------|-----------|---------|-------|--------|
| Sponsor | Progress, risks, budget | Weekly | 1:1 meeting | PM | Summary slides |
| Dev Team | Requirement details, changes | Daily | Stand-up | BA | Jira updates |
| End Users | Feature introduction, training | By milestone | Workshop | BA | Demo + documentation |
| Management | Milestones, ROI | Monthly | Email | PM | Dashboard |
| Legal | Compliance requirements | As needed | Email | BA | Documentation |

### Communication Channel Selection

| Channel | Best For | Pros | Cons |
|---------|----------|------|------|
| Face-to-face meeting | Important decisions, conflict resolution | Highest bandwidth, immediate feedback | Scheduling difficulty |
| Video conference | Remote teams, regular updates | Convenient, recordable | Easy to lose attention |
| Email | Formal records, notifications | Creates paper trail | Delayed responses |
| Slack/Teams | Quick questions, daily collaboration | Real-time, low barrier | Information fragmentation |
| Confluence/Wiki | Documentation, knowledge base | Structured, searchable | May not stay current |
| Dashboard | Progress tracking, KPIs | Self-service, real-time | Requires setup |

### Upward Communication Techniques

```
Principles:
1. Bottom Line Up Front (BLUF)
2. Use data and numbers
3. Present options, not problems
4. Keep it within 5 minutes

Example (reporting to VP):

❌ Poor version:
"We're working on the CRM project and have run into some issues.
The API integration is difficult, the team is short-staffed,
so the timeline might need to be delayed..."

✅ Good version:
"CRM project status: 65% complete, 1 week behind schedule.
Key risk: Third-party API integration delayed.
Recommended options:
A) Add 1 engineer (cost +$5K, timeline unchanged)
B) Reduce scope (Phase 2 reports deferred, saving 2 weeks)
Need your decision on the direction."
```

### Communication Matrix Example

```
        │ Technical  │ Business  │ Timeline  │ Risk
        │ Details    │ Impact    │ & Budget  │
────────┼────────────┼───────────┼───────────┼──────
Sponsor │   Low      │   High    │   High    │  High
Dev     │   High     │   Low     │   Medium  │  Medium
User    │   Low      │   High    │   Low     │  Low
QA      │   High     │   Low     │   Medium  │  High
```

---

## 28-4: Expectation Management

### Core Principles of Expectation Management

```
1. Under-promise, Over-deliver
   → Promise 80%, deliver 110%

2. Transparent Communication
   → Bad news should be shared as early as possible

3. Manage Scope Creep
   → Assess the impact of every new requirement

4. Set Clear Boundaries
   → What's in / What's out
```

### Scope Creep Management Process

```
New requirement raised
    ↓
Impact Assessment
    ↓
┌─────────────────────────────────┐
│ Assessment items:               │
│ • Timeline impact: How many     │
│   days/weeks of delay?          │
│ • Cost impact: Additional       │
│   resources needed?             │
│ • Risk impact: Does it increase │
│   technical risk?               │
│ • Quality impact: Will it       │
│   compromise other features?    │
└─────────────────────────────────┘
    ↓
Submit Change Request
    ↓
CCB (Change Control Board) Review
    ↓
Approve / Reject / Defer
    ↓
Update plan & notify stakeholders
```

### Managing Expectations at Different Levels

| Level | Typical Expectations | Management Strategy |
|-------|---------------------|-------------------|
| C-level | On-time delivery, within budget | Regular progress reports, early warnings |
| Mid-level managers | Don't disrupt daily operations | Deployment plan, transition support |
| End users | New system should be better than the old one | Early involvement, training plan |
| IT team | Requirements shouldn't keep changing | Clear change management process |

### Interview Question: "How Do You Handle an Unreasonable Deadline?"

```
Answer Framework:

1. Clarify
   "Let me confirm — you need these features completed by X date?"

2. Analyze
   "Based on my assessment, this scope requires Y working days,
    but we only have Z days. The gap is N days."

3. Provide Options
   A) Reduce scope (recommended): Only deliver Must-haves, rest in Phase 2
   B) Add resources: 2 more engineers, but 1-week ramp-up needed
   C) Reduce quality: Skip some testing (not recommended, explain the risks)

4. Recommend
   "I recommend Option A. This way core features can launch on schedule,
    and Phase 2 can be completed in the next Sprint."

5. Document
   Meeting minutes + email confirmation
```

---

## 28-5: Conflict Resolution

### Common Conflict Types

| Type | Example | Root Cause |
|------|---------|-----------|
| Requirements conflict | Business wants quick launch vs QA wants thorough testing | Different priorities |
| Resource conflict | Two projects competing for the same engineer | Limited resources |
| Perception conflict | Different understanding of the problem | Information asymmetry |
| Value conflict | Short-term gains vs long-term architecture | Misaligned goals |
| Interpersonal conflict | Personal style differences | Communication issues |

### Thomas-Kilmann Conflict Model

```
                High
                │
    Competing   │   Collaborating
    Win-Lose    │   Win-Win
    Assertiveness│
                │   Compromising
                │   Give & Take
                │
    Avoiding    │   Accommodating
    Lose-Lose   │   Lose-Win
                │
                Low──────────────────High
                    Cooperativeness
```

### Appropriate Scenarios for Each Strategy

| Strategy | Best For | Example |
|----------|----------|---------|
| Collaborating | Both parties' interests are important | Cross-department requirements integration |
| Competing | Urgent and you're certain you're right | Security vulnerability must be fixed immediately |
| Compromising | Time is limited, need a quick solution | Scope negotiation |
| Accommodating | The other party's issue is more important | Conceding on non-core requirements |
| Avoiding | Issue is unimportant or cool-down needed | Emotionally charged arguments |

### STAR Framework for Conflict Resolution

```
Situation: Describe the conflict background
Task: Your role and responsibilities
Action: Specific steps you took
Result: Final outcome and lessons learned
```

### Real-World Example: Sales vs Engineering Requirement Conflict

```
Situation:
Sales demanded a new discount calculation feature go live within 2 weeks.
Engineering estimated at least 6 weeks (including testing).

Task:
As the BA, I needed to find a solution acceptable to both sides.

Action:
1. Met 1:1 with both sides to understand their real needs
   - Sales: A promotion event at month-end required the discount feature
   - Engineering: The core concern was complex calculation logic requiring thorough testing

2. Analyzed core needs
   - Sales actually needed "the ability to run a promotion at month-end"
   - Engineering was worried about "calculation errors causing financial losses"

3. Proposed a compromise
   - Phase 1 (2 weeks): Fixed discount (15% off sitewide), simple rules
   - Phase 2 (4 weeks later): Flexible discounts (tiered, combo, threshold-based)
   - Extra: Phase 1 includes an admin manual confirmation step to reduce risk

4. Held a three-party meeting to reach consensus

Result:
- Phase 1 launched on schedule, promotion was successful
- Phase 2 full feature launched with zero calculation errors
- Both sides were satisfied with the outcome
```

### Conflict Resolution Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Focus on the issue, not the person | Criticize in public settings |
| Support arguments with data | Rely only on feelings or experience |
| Look for common interests | Insist on zero-sum thinking |
| Proactively propose alternatives | Only raise problems without solutions |
| Document consensus and decisions | Make verbal promises without records |

---

## 28-6: Stakeholder Management Strategy Case Study

### Case: Enterprise ERP System Upgrade

#### Background

```
Company: Mid-sized manufacturer (500 employees)
Project: Upgrade from legacy ERP to cloud ERP
Budget: $500K
Timeline: 12 months
Impact scope: All departments across the company
```

#### Stakeholder Map

```
Manage Closely:
┌─────────────────────────────────────┐
│ CEO — Ultimate decision maker       │
│ Concern: ROI, operational disruption│
│ Strategy: Monthly Executive Review  │
│                                     │
│ CFO — Budget controller             │
│ Concern: Cost overrun, unclear ROI  │
│ Strategy: Monthly budget report +   │
│ ROI tracking                        │
│                                     │
│ VP Operations — Most affected dept  │
│ Concern: Production line disruption │
│ Strategy: Weekly progress sync,     │
│ deployment plan in advance          │
└─────────────────────────────────────┘

Keep Satisfied:
┌─────────────────────────────────────┐
│ CTO — Technical decisions           │
│ Strategy: Architecture review       │
│ meetings (by milestone)             │
│                                     │
│ External consulting firm            │
│ Strategy: Contract management,      │
│ periodic reviews                    │
└─────────────────────────────────────┘

Keep Informed:
┌─────────────────────────────────────┐
│ Department heads — Daily usage      │
│ impact                              │
│ Strategy: Monthly Newsletter +      │
│ Q&A Session                         │
│                                     │
│ End users (company-wide)            │
│ Strategy: Training plan + support   │
│ hotline                             │
└─────────────────────────────────────┘

Monitor:
┌─────────────────────────────────────┐
│ External auditors                   │
│ Strategy: Compliance documentation  │
│ on file                             │
└─────────────────────────────────────┘
```

#### Communication Plan

| Phase | Audience | Key Message | Channel | Frequency |
|-------|----------|-------------|---------|-----------|
| Initiation | Company-wide | Why change, vision, timeline | All-hands meeting | Once |
| Analysis | Department heads | Requirements confirmation, process changes | Workshop | 2x per department |
| Development | Sponsor | Progress, risks, decisions needed | 1:1 | Weekly |
| Testing | End Users | UAT participation, feedback collection | Training session | Intensive |
| Go-Live | Company-wide | User guide, support channels | Email + video | Before and after launch |

#### Risks and Mitigation

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|------------|-------------------|
| User resistance to change | High | High | Change management, early involvement, Champions program |
| Scope Creep | High | Medium | Strict Change Control Process |
| Key personnel departure | High | Low | Knowledge transfer, documentation, backup staffing |
| Data migration failure | Critical | Medium | Multiple test rounds, rollback plan, parallel operation |

#### Change Management (ADKAR Model)

```
A — Awareness: Why do we need to change?
    → Current system maintenance costs increasing 20% annually, cannot support new business
D — Desire: Why should I cooperate?
    → New system makes your work easier, no more manual reconciliation
K — Knowledge: What do I need to learn?
    → Comprehensive training courses and operation manuals provided
A — Ability: Can I do it?
    → 1-month parallel operation period with dedicated support staff
R — Reinforcement: Will the change stick?
    → KPI adjustments, incentive measures, continuous improvement mechanisms
```

---

## Cheat Sheet: Stakeholder Management Quick Reference

### Core Tools

```
1. Stakeholder Register → Who are the stakeholders?
2. Power/Interest Grid → How to classify them?
3. RACI Matrix → Who is responsible for what?
4. Communication Plan → How to communicate?
5. ADKAR Model → How to drive change?
6. Thomas-Kilmann Model → How to handle conflicts?
```

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| How to identify stakeholders? | Org chart + Process map + Contracts + History |
| How to use Power/Interest Grid? | Four-quadrant classification, differentiated communication strategies |
| What is RACI? | Responsible / Accountable / Consulted / Informed |
| How to handle requirement conflicts? | Find common interests + Provide options + Support with data |
| Users resisting change? | ADKAR + Early involvement + Training + Champions |
| How to manage Scope Creep? | Change Request + Impact Assessment + CCB |

### Golden Rules of Communication

```
Upward: Lead with conclusions, use numbers, give options
Downward: Start with "Why", listen more, give frequent feedback
External: Professional, concise, keep records
Conflict: Focus on issues not people, find consensus, document decisions
```

"""

    // MARK: - World 29 (zh)
    private static let zhWorld29 = """

# World 29：商業文件撰寫

> 好的 BA 不只會分析，還要會「寫」。你的文件就是你的交付物，也是你專業度的展現。

面試中常被問到：「你寫過 BRD 嗎？」「你的需求文件長什麼樣？」
這一章教你寫出專業、清晰、有影響力的商業文件。

---

## 29-1：BRD 結構與撰寫

### BRD（Business Requirements Document）是什麼？

BRD 是從商業角度描述專案需求的文件，回答「What」和「Why」，而非「How」。

### BRD 標準結構

```
1. Document Control（文件控管）
   - 版本歷史、作者、審核者、狀態

2. Executive Summary（摘要）
   - 一頁內說完整個專案

3. Business Objectives（商業目標）
   - SMART 目標、KPI、成功指標

4. Current State Analysis（現況分析）
   - 現有流程、痛點、Gap

5. Scope（範圍）
   - In Scope / Out of Scope

6. Business Requirements（商業需求）
   - 需求清單、優先級、來源

7. Stakeholders（利害關係人）
   - Stakeholder Map、RACI

8. Assumptions & Constraints（假設與限制）
   - 假設條件、技術限制、法規限制

9. Dependencies（相依性）
   - 外部系統、第三方、其他專案

10. Risks（風險）
    - 風險評估、應對策略

11. Timeline（時程）
    - 里程碑、階段規劃

12. Appendix（附錄）
    - 詞彙表、參考資料、流程圖
```

### BRD 撰寫原則

| 原則 | 說明 | 範例 |
|------|------|------|
| Clear（清晰） | 避免模糊用詞 | ❌「盡快」→ ✅「2 週內」 |
| Complete（完整） | 涵蓋所有面向 | 包含 Happy Path + Edge Case |
| Consistent（一致） | 用詞統一 | 全文統一用「客戶」而非混用「用戶/顧客」 |
| Concise（簡潔） | 不囉嗦 | 每個需求一句話，細節用子項目 |
| Correct（正確） | 經過驗證 | 數字來源標註、Stakeholder 確認 |
| Traceable（可追溯） | 每個需求有 ID | BR-001, BR-002... |

### BRD vs PRD vs FRD

| 面向 | BRD | PRD | FRD |
|------|-----|-----|-----|
| 作者 | BA | PM / PO | BA / SA |
| 讀者 | 管理層、Sponsor | 開發團隊、設計師 | 開發、QA |
| 內容 | Why + What（商業） | What（產品） | How（功能細節） |
| 抽象度 | 高 | 中 | 低 |
| 包含技術？ | 否 | 部分 | 是 |

---

## 29-2：FRD 撰寫

### FRD（Functional Requirements Document）結構

```
1. Introduction（簡介）
   - 目的、範圍、讀者

2. System Overview（系統概觀）
   - 系統架構、上下文圖

3. Functional Requirements（功能需求）
   - 模組化列出每個功能

4. User Interface Requirements（UI 需求）
   - 畫面規格、Wireframe 參考

5. Data Requirements（資料需求）
   - 資料欄位、格式、驗證規則

6. Integration Requirements（整合需求）
   - API 規格、資料流

7. Non-Functional Requirements（非功能需求）
   - 效能、安全、可用性

8. Business Rules（商業規則）
   - 計算邏輯、條件判斷

9. Glossary（詞彙表）
   - 專業術語定義
```

### 功能需求撰寫範例

```
FR-001: 用戶註冊

描述：系統應允許新用戶透過 Email 註冊帳號。

前提條件：
- 用戶尚未擁有帳號

輸入欄位：
| 欄位 | 類型 | 必填 | 驗證規則 |
|------|------|------|---------|
| Email | String | 是 | 有效 Email 格式 |
| 密碼 | String | 是 | 最少 8 字元，含大小寫+數字 |
| 姓名 | String | 是 | 2-50 字元 |
| 手機 | String | 否 | 台灣手機格式 09xx-xxx-xxx |

處理邏輯：
1. 驗證 Email 是否已存在
2. 如果已存在，顯示錯誤訊息 ERR-001
3. 密碼加密存儲（bcrypt, cost factor 12）
4. 發送驗證信至用戶 Email
5. 用戶點擊驗證連結後啟用帳號

輸出：
- 成功：導向歡迎頁面，顯示「註冊成功，請查收驗證信」
- 失敗：顯示對應錯誤訊息

錯誤代碼：
| 代碼 | 訊息 | 觸發條件 |
|------|------|---------|
| ERR-001 | 此 Email 已被註冊 | Email 重複 |
| ERR-002 | 密碼強度不足 | 不符合規則 |
| ERR-003 | 驗證信發送失敗 | Email 服務異常 |
```

### Business Rules 撰寫範例

```
BR-001: 訂單折扣計算

規則：
IF 訂單金額 >= 3,000 AND 會員等級 = 'Gold'
THEN 折扣 = 15%
ELSE IF 訂單金額 >= 3,000 AND 會員等級 = 'Silver'
THEN 折扣 = 10%
ELSE IF 訂單金額 >= 1,000
THEN 折扣 = 5%
ELSE
THEN 折扣 = 0%

注意事項：
- 折扣不可與其他優惠券疊加
- 折扣後金額四捨五入至整數
- 折扣上限為 NT$ 500
```

### Decision Table（決策表）

| 條件 | Rule 1 | Rule 2 | Rule 3 | Rule 4 |
|------|--------|--------|--------|--------|
| 金額 >= 3,000 | Y | Y | N | N |
| 金額 >= 1,000 | Y | Y | Y | N |
| Gold 會員 | Y | N | - | - |
| **折扣** | **15%** | **10%** | **5%** | **0%** |

---

## 29-3：會議紀錄撰寫

### 會議紀錄模板

```
會議紀錄

日期：2026-03-15
時間：14:00 - 15:30
地點：線上（Google Meet）
主持人：王小明（BA）
記錄者：王小明（BA）

出席者：
- 李副總（Sponsor）
- 陳經理（業務部）
- 張工程師（Tech Lead）

缺席者：
- 林主任（客服部）— 已事前告知

議題一：CRM 專案 Phase 2 需求確認
討論內容：
- 業務部提出需要客戶分群報表功能
- 工程評估需要 3 週開發時間
- 決定將報表功能列為 Phase 2 Must-have

議題二：API 整合進度
討論內容：
- 第三方支付 API 文件已取得
- 測試環境預計下週建置完成
- 風險：對方回應速度慢，可能影響時程

Action Items：
| # | 項目 | 負責人 | 期限 | 狀態 |
|---|------|--------|------|------|
| 1 | 完成客戶分群報表 PRD | 王小明 | 03/22 | 新建 |
| 2 | 建置 API 測試環境 | 張工程師 | 03/20 | 進行中 |
| 3 | 跟進客服部需求 | 王小明 | 03/18 | 新建 |

下次會議：2026-03-22 14:00
```

### 會議紀錄的 5C 原則

```
C — Clear（清楚）：誰說了什麼，決定了什麼
C — Concise（簡潔）：記重點不記過程
C — Complete（完整）：所有 Action Items 都有負責人和期限
C — Correct（正確）：事後發送確認，24 小時內
C — Consistent（一致）：固定格式，方便搜尋和回溯
```

### 高效記錄技巧

```
會前：
- 準備議程（Agenda）並事前發送
- 確認出席者
- 準備需要討論的資料

會中：
- 記錄「決定」而非「討論過程」
- 立即確認 Action Item 的負責人和期限
- 有爭議的點用「[待確認]」標記

會後：
- 24 小時內發送紀錄
- 標題格式：[會議紀錄] 專案名 - 日期 - 主題
- 請與會者確認是否有遺漏
```

---

## 29-4：Status Update 撰寫

### 週報模板（RAG Status）

```
專案週報 — CRM Phase 2
日期：2026-03-15 ~ 03-21
報告人：王小明

整體狀態：🟡 Yellow（有風險但可控）

┌──────────────────────────────────────┐
│ 本週完成                              │
│ ✅ 完成客戶分群報表需求規格             │
│ ✅ 完成 API 測試環境建置               │
│ ✅ 進行 UAT Round 1（通過 15/20 案例） │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ 下週計畫                              │
│ 📋 修復 UAT 5 個失敗案例               │
│ 📋 開始 Phase 2 UI 設計                │
│ 📋 第三方支付 API 整合測試              │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ 風險與議題                            │
│ 🔴 支付 API 對方回應延遲 3 天          │
│    → 影響：整合時程可能延後 1 週        │
│    → 應對：已升級聯絡窗口至主管層級     │
│                                      │
│ 🟡 UAT 發現報表計算邏輯問題            │
│    → 影響：需額外 2 天修復              │
│    → 應對：已安排工程師優先處理         │
└──────────────────────────────────────┘

進度追蹤：
| 模組 | 計畫完成 | 實際完成 | 狀態 |
|------|---------|---------|------|
| 需求分析 | 100% | 100% | 🟢 |
| UI 設計 | 60% | 55% | 🟡 |
| 後端開發 | 80% | 75% | 🟡 |
| API 整合 | 50% | 30% | 🔴 |
| 測試 | 40% | 35% | 🟡 |

需要決策：
1. 支付 API 延遲是否啟動備選方案（改用 B 供應商）？
```

### RAG Status 定義

| 顏色 | 狀態 | 意義 | 行動 |
|------|------|------|------|
| 🟢 Green | On Track | 按計畫進行 | 持續監控 |
| 🟡 Yellow | At Risk | 有風險但有應對方案 | 關注並執行應對 |
| 🔴 Red | Off Track | 需要介入或決策 | 升級處理 |

### 好的 Status Update 的特徵

```
1. 先說結論（Green / Yellow / Red）
2. 用事實和數字（完成 15/20 案例，不是「大部分完成」）
3. 風險要有應對方案（不只提問題）
4. 需要決策的事項要明確標出
5. 格式一致，方便快速掃描
```

---

## 29-5：Executive Summary 撰寫

### Executive Summary 的目的

讓高階主管在 2 分鐘內理解整個文件的核心內容。

### 結構：SCQA 框架

```
S — Situation（背景）：目前的狀況
C — Complication（問題）：遇到什麼挑戰
Q — Question（問題）：需要回答什麼問題
A — Answer（答案）：建議的解決方案
```

### 範例一：專案提案

```
Executive Summary

背景（Situation）：
公司客服部門目前每月處理 12,000 通電話，
平均處理時間 8.5 分鐘，客服人力成本年度 NT$ 18M。
其中 45% 的來電為重複性問題（訂單查詢、退貨流程）。

問題（Complication）：
隨著業務成長 30%，客服量預計增至 15,600 通/月，
但人力預算僅增加 10%，客服等候時間已從 2 分鐘
增加至 5 分鐘，客戶滿意度下降 15%。

建議（Answer）：
導入智慧客服系統（Chatbot + 自助服務入口），
預計可自動處理 40% 的重複性問題。

預期效益：
- 客服成本降低 NT$ 5.4M/年（30%）
- 平均等候時間降至 2 分鐘以內
- 客戶滿意度提升至 4.5/5.0
- 投資回收期：8 個月

投資需求：
- 系統建置：NT$ 3.5M
- 年度維運：NT$ 800K
- 實施期間：6 個月
```

### 範例二：分析報告摘要

```
Executive Summary

本報告分析了 2025 Q4 的用戶流失數據。

關鍵發現：
1. 月流失率從 3.2% 升至 4.8%（季增 50%）
2. 流失集中在註冊 30-60 天的新用戶（佔流失總量 62%）
3. 主要原因：Onboarding 體驗不佳（調查中 78% 用戶提及）

建議行動：
1. 重新設計 Onboarding 流程（預計影響：降低新用戶流失 30%）
2. 新增第 7 天和第 14 天的自動跟進 Email
3. 建立「新手任務」遊戲化機制

預估 ROI：
- 每月挽回 350 名流失用戶
- 年增收 NT$ 12.6M（以 ARPU NT$ 3,000 計算）
```

### Executive Summary 撰寫原則

```
1. 長度：不超過 1 頁（250-400 字）
2. 獨立性：不看正文也能理解
3. 結論先行：第一段就說結論
4. 數字說話：避免模糊描述
5. 行動導向：明確告訴讀者「So What」
6. 無術語：避免技術名詞
```

### 常見錯誤

| ❌ 錯誤 | ✅ 修正 |
|---------|---------|
| 把 Introduction 當 Executive Summary | Summary 是結論，Introduction 是背景 |
| 太多技術細節 | 只留商業影響 |
| 沒有數字 | 加入量化數據 |
| 沒有行動建議 | 明確列出 Next Steps |
| 太長（超過 2 頁） | 精簡至 1 頁 |

---

## 29-6：完整 BRD 案例

### 案例：電商平台會員忠誠計畫

```
╔══════════════════════════════════════╗
║   Business Requirements Document    ║
║   電商平台會員忠誠計畫                ║
║   Version: 1.0                      ║
║   Author: 王小明（Business Analyst） ║
║   Date: 2026-03-15                  ║
║   Status: Draft                     ║
╚══════════════════════════════════════╝
```

#### 1. Executive Summary

公司面臨客戶流失率攀升（季度流失率 4.8%）和客單價停滯的挑戰。
建議導入會員忠誠計畫（點數制），目標在 6 個月內降低流失率 25%、
提升回購率 15%，預計年增收 NT$ 24M。

#### 2. Business Objectives

| 目標 | 衡量指標 | 目標值 | 時程 |
|------|---------|--------|------|
| 降低流失率 | Monthly Churn Rate | 從 4.8% 降至 3.6% | 6 個月 |
| 提升回購率 | Repeat Purchase Rate | 從 35% 升至 50% | 6 個月 |
| 提升客單價 | AOV | 從 NT$850 升至 NT$1,000 | 12 個月 |
| 會員成長 | Active Members | 達到 50,000 人 | 12 個月 |

#### 3. Current State Analysis

```
現況：
- 無會員分級制度，所有客戶享受相同優惠
- 促銷依賴全館折扣，利潤壓縮
- 客戶資料分散在 3 個系統（EC 平台、CRM、客服系統）
- 缺乏客戶生命週期管理

痛點：
- 無法辨識高價值客戶（Top 20% 客戶貢獻 65% 營收）
- 新客獲取成本（CAC）年增 25%
- 客戶無忠誠度，價格敏感度高
```

#### 4. Scope

```
In Scope:
✅ 會員等級制度（銅、銀、金、鑽石）
✅ 點數累積與兌換機制
✅ 會員專屬優惠
✅ 會員 Dashboard
✅ 點數查詢與歷史記錄
✅ 與現有 EC 平台整合

Out of Scope:
❌ 實體門市 POS 整合（Phase 2）
❌ 跨品牌聯名點數（Phase 3）
❌ 社群分享獎勵（Phase 2）
❌ 遊戲化機制（Phase 2）
```

#### 5. Business Requirements

| ID | 需求描述 | 優先級 | 來源 |
|----|---------|--------|------|
| BR-001 | 系統根據消費金額自動升降會員等級 | Must | Sponsor |
| BR-002 | 消費 NT$1 = 1 點，點數可折抵消費 | Must | 業務部 |
| BR-003 | 不同等級享有不同折扣比例 | Must | 業務部 |
| BR-004 | 點數有效期為 12 個月（滾動） | Should | 財務部 |
| BR-005 | 會員生日當月享雙倍點數 | Should | 行銷部 |
| BR-006 | 提供會員專屬早鳥購買權 | Could | 行銷部 |
| BR-007 | 推薦好友註冊獎勵 300 點 | Could | 成長團隊 |

#### 6. 會員等級規則

| 等級 | 年消費門檻 | 折扣 | 點數倍率 | 專屬權益 |
|------|-----------|------|---------|---------|
| 銅 | NT$ 0+ | 0% | 1x | 基本會員價 |
| 銀 | NT$ 10,000+ | 3% | 1.5x | 免運費、生日禮 |
| 金 | NT$ 30,000+ | 5% | 2x | 優先客服、早鳥 |
| 鑽石 | NT$ 80,000+ | 8% | 3x | 專屬顧問、VIP 活動 |

#### 7. Assumptions & Constraints

```
Assumptions:
- 現有 EC 平台支援 API 整合
- 財務系統可處理點數負債
- 客戶願意提供個人資料換取優惠

Constraints:
- 預算上限 NT$ 5M（含第一年維運）
- 必須在 2026 Q3 前上線
- 須符合個資法規範
- 點數兌換比例需經財務部核准
```

#### 8. Risk Assessment

| 風險 | 影響 | 機率 | 嚴重度 | 應對策略 |
|------|------|------|--------|---------|
| 點數成本過高 | 利潤下降 | 中 | 高 | 設定兌換上限、監控點數發行量 |
| 系統整合延遲 | 上線延後 | 中 | 中 | 提前做 POC、設定里程碑 |
| 用戶參與度低 | ROI 不達標 | 低 | 高 | Onboarding 引導、推廣活動 |
| 競爭對手跟進 | 差異化消失 | 中 | 中 | 持續迭代、強化體驗 |

#### 9. Success Metrics

```
上線後追蹤指標：
- 會員註冊率（目標：首月 10,000 人）
- 點數使用率（目標：> 60%）
- 會員貢獻營收佔比（目標：> 70%）
- 等級升級率（目標：20% 會員在 6 個月內升級）
- NPS 分數（目標：> 40）
```

---

## Cheat Sheet：商業文件撰寫速查表

### 文件類型速查

```
BRD → 「為什麼做」「做什麼」（商業層面）
PRD → 「做什麼」「怎麼做」（產品層面）
FRD → 「怎麼做」（功能細節）
SRS → 「怎麼做」（技術規格）
```

### 撰寫黃金法則

```
1. 知道你的讀者（Write for your audience）
2. 結論先行（Bottom Line Up Front）
3. 用數字說話（Quantify everything）
4. 一個段落一個概念（One idea per paragraph）
5. 主動語態（Active voice）
6. 避免模糊詞（快、很多、盡量 → 具體數字）
```

### 面試高頻問題

| 問題 | 回答要素 |
|------|---------|
| BRD 包含什麼？ | 目標、現況、範圍、需求、風險、時程 |
| BRD vs PRD？ | BRD 偏商業 Why/What；PRD 偏產品 What/How |
| 如何確保文件品質？ | Peer Review + Stakeholder Sign-off |
| 需求變更怎麼處理？ | Change Request + Impact Analysis + CCB |
| 怎麼寫 Executive Summary？ | SCQA 框架，一頁以內，數字支持 |

"""

    // MARK: - World 29 (en)
    private static let enWorld29 = """

# World 29: Business Document Writing

> A good BA doesn't just analyze — they must also know how to "write." Your documents are your deliverables and a reflection of your professionalism.

Common interview questions: "Have you written a BRD?" "What do your requirements documents look like?"
This chapter teaches you how to write professional, clear, and impactful business documents.

---

## 29-1: BRD Structure and Writing

### What Is a BRD (Business Requirements Document)?

A BRD describes project requirements from a business perspective, answering "What" and "Why," not "How."

### Standard BRD Structure

```
1. Document Control
   - Version history, author, reviewers, status

2. Executive Summary
   - Entire project summarized in one page

3. Business Objectives
   - SMART goals, KPIs, success metrics

4. Current State Analysis
   - Existing processes, pain points, gaps

5. Scope
   - In Scope / Out of Scope

6. Business Requirements
   - Requirements list, priorities, sources

7. Stakeholders
   - Stakeholder Map, RACI

8. Assumptions & Constraints
   - Assumptions, technical limitations, regulatory constraints

9. Dependencies
   - External systems, third parties, other projects

10. Risks
    - Risk assessment, mitigation strategies

11. Timeline
    - Milestones, phase planning

12. Appendix
    - Glossary, references, process diagrams
```

### BRD Writing Principles

| Principle | Description | Example |
|-----------|-------------|---------|
| Clear | Avoid ambiguous language | ❌ "ASAP" → ✅ "Within 2 weeks" |
| Complete | Cover all aspects | Include Happy Path + Edge Cases |
| Consistent | Uniform terminology | Use "customer" throughout, don't mix with "user/client" |
| Concise | Don't be verbose | One sentence per requirement, details in sub-items |
| Correct | Verified information | Cite data sources, stakeholder confirmation |
| Traceable | Every requirement has an ID | BR-001, BR-002... |

### BRD vs PRD vs FRD

| Aspect | BRD | PRD | FRD |
|--------|-----|-----|-----|
| Author | BA | PM / PO | BA / SA |
| Audience | Management, Sponsor | Dev team, Designers | Dev, QA |
| Content | Why + What (business) | What (product) | How (functional details) |
| Abstraction | High | Medium | Low |
| Includes technical detail? | No | Partial | Yes |

---

## 29-2: FRD Writing

### FRD (Functional Requirements Document) Structure

```
1. Introduction
   - Purpose, scope, audience

2. System Overview
   - System architecture, context diagram

3. Functional Requirements
   - Modular listing of each feature

4. User Interface Requirements
   - Screen specifications, wireframe references

5. Data Requirements
   - Data fields, formats, validation rules

6. Integration Requirements
   - API specifications, data flows

7. Non-Functional Requirements
   - Performance, security, availability

8. Business Rules
   - Calculation logic, conditional logic

9. Glossary
   - Technical term definitions
```

### Functional Requirement Writing Example

```
FR-001: User Registration

Description: The system shall allow new users to register an account via email.

Preconditions:
- User does not already have an account

Input Fields:
| Field | Type | Required | Validation Rules |
|-------|------|----------|-----------------|
| Email | String | Yes | Valid email format |
| Password | String | Yes | Minimum 8 characters, uppercase + lowercase + number |
| Name | String | Yes | 2-50 characters |
| Phone | String | No | Local mobile format (e.g., +1-xxx-xxx-xxxx) |

Processing Logic:
1. Verify if the email already exists
2. If exists, display error message ERR-001
3. Encrypt and store the password (bcrypt, cost factor 12)
4. Send a verification email to the user
5. Account is activated after the user clicks the verification link

Output:
- Success: Redirect to welcome page, display "Registration successful, please check your email for verification"
- Failure: Display corresponding error message

Error Codes:
| Code | Message | Trigger Condition |
|------|---------|------------------|
| ERR-001 | This email is already registered | Duplicate email |
| ERR-002 | Password strength insufficient | Does not meet rules |
| ERR-003 | Verification email failed to send | Email service error |
```

### Business Rules Writing Example

```
BR-001: Order Discount Calculation

Rules:
IF order amount >= 3,000 AND membership level = 'Gold'
THEN discount = 15%
ELSE IF order amount >= 3,000 AND membership level = 'Silver'
THEN discount = 10%
ELSE IF order amount >= 1,000
THEN discount = 5%
ELSE
THEN discount = 0%

Notes:
- Discount cannot be combined with other coupons
- Post-discount amount rounded to nearest whole number
- Maximum discount capped at $15
```

### Decision Table

| Condition | Rule 1 | Rule 2 | Rule 3 | Rule 4 |
|-----------|--------|--------|--------|--------|
| Amount >= 3,000 | Y | Y | N | N |
| Amount >= 1,000 | Y | Y | Y | N |
| Gold Member | Y | N | - | - |
| **Discount** | **15%** | **10%** | **5%** | **0%** |

---

## 29-3: Meeting Minutes Writing

### Meeting Minutes Template

```
Meeting Minutes

Date: 2026-03-15
Time: 14:00 - 15:30
Location: Online (Google Meet)
Facilitator: Alex Wang (BA)
Note-taker: Alex Wang (BA)

Attendees:
- VP Lee (Sponsor)
- Manager Chen (Sales Dept.)
- Engineer Zhang (Tech Lead)

Absent:
- Supervisor Lin (Customer Service) — Notified in advance

Topic 1: CRM Project Phase 2 Requirements Confirmation
Discussion:
- Sales department raised the need for a customer segmentation report feature
- Engineering estimated 3 weeks of development time
- Decided to classify the report feature as Phase 2 Must-have

Topic 2: API Integration Progress
Discussion:
- Third-party payment API documentation has been obtained
- Test environment expected to be set up next week
- Risk: Slow response from the vendor may affect timeline

Action Items:
| # | Item | Owner | Deadline | Status |
|---|------|-------|----------|--------|
| 1 | Complete customer segmentation report PRD | Alex Wang | 03/22 | New |
| 2 | Set up API test environment | Engineer Zhang | 03/20 | In Progress |
| 3 | Follow up on customer service dept requirements | Alex Wang | 03/18 | New |

Next Meeting: 2026-03-22 14:00
```

### The 5C Principles for Meeting Minutes

```
C — Clear: Who said what, what was decided
C — Concise: Record key points, not the process
C — Complete: All Action Items have owners and deadlines
C — Correct: Send for confirmation afterwards, within 24 hours
C — Consistent: Fixed format for easy search and retrieval
```

### Efficient Note-Taking Tips

```
Before the meeting:
- Prepare and distribute the agenda in advance
- Confirm attendees
- Prepare materials for discussion

During the meeting:
- Record "decisions" rather than "discussion process"
- Immediately confirm Action Item owners and deadlines
- Mark disputed points with "[To Be Confirmed]"

After the meeting:
- Distribute minutes within 24 hours
- Subject format: [Meeting Minutes] Project Name - Date - Topic
- Ask attendees to confirm if anything was missed
```

---

## 29-4: Status Update Writing

### Weekly Report Template (RAG Status)

```
Project Weekly Report — CRM Phase 2
Date: 2026-03-15 ~ 03-21
Author: Alex Wang

Overall Status: Yellow (at risk but manageable)

┌──────────────────────────────────────┐
│ Completed This Week                  │
│ ✅ Completed customer segmentation   │
│    report requirements spec          │
│ ✅ Completed API test environment    │
│    setup                             │
│ ✅ Conducted UAT Round 1             │
│    (passed 15/20 test cases)         │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ Next Week Plan                       │
│ - Fix 5 failed UAT test cases        │
│ - Begin Phase 2 UI design            │
│ - Third-party payment API            │
│   integration testing                │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ Risks & Issues                       │
│ RED: Payment API vendor response     │
│   delayed by 3 days                  │
│   → Impact: Integration timeline     │
│     may slip 1 week                  │
│   → Mitigation: Escalated contact to │
│     vendor management level          │
│                                      │
│ YELLOW: UAT found report calculation │
│   logic issue                        │
│   → Impact: Needs extra 2 days to fix│
│   → Mitigation: Assigned engineer    │
│     for priority resolution          │
└──────────────────────────────────────┘

Progress Tracking:
| Module | Planned | Actual | Status |
|--------|---------|--------|--------|
| Requirements Analysis | 100% | 100% | Green |
| UI Design | 60% | 55% | Yellow |
| Backend Development | 80% | 75% | Yellow |
| API Integration | 50% | 30% | Red |
| Testing | 40% | 35% | Yellow |

Decision Needed:
1. Should we activate the backup plan for the payment API delay (switch to Vendor B)?
```

### RAG Status Definitions

| Color | Status | Meaning | Action |
|-------|--------|---------|--------|
| Green | On Track | Proceeding as planned | Continue monitoring |
| Yellow | At Risk | There are risks but mitigation plans exist | Monitor and execute mitigation |
| Red | Off Track | Intervention or decisions needed | Escalate |

### Characteristics of a Good Status Update

```
1. Lead with the conclusion (Green / Yellow / Red)
2. Use facts and numbers (passed 15/20 cases, not "mostly done")
3. Risks should include mitigation plans (don't just raise problems)
4. Items needing decisions should be clearly flagged
5. Consistent format for quick scanning
```

---

## 29-5: Executive Summary Writing

### Purpose of an Executive Summary

Enable senior executives to understand the core content of the entire document within 2 minutes.

### Structure: SCQA Framework

```
S — Situation: Current state of affairs
C — Complication: Challenges encountered
Q — Question: What question needs to be answered
A — Answer: Recommended solution
```

### Example 1: Project Proposal

```
Executive Summary

Situation:
The customer service department currently handles 12,000 calls per month,
with an average handling time of 8.5 minutes and annual staff costs of $600K.
45% of incoming calls are repetitive issues (order inquiries, return processes).

Complication:
With 30% business growth, call volume is expected to increase to 15,600/month,
but the staffing budget is only increasing by 10%. Customer wait time has risen
from 2 minutes to 5 minutes, and customer satisfaction has dropped 15%.

Answer:
Implement an intelligent customer service system (Chatbot + self-service portal),
expected to automatically handle 40% of repetitive issues.

Expected Benefits:
- Customer service costs reduced by $180K/year (30%)
- Average wait time reduced to under 2 minutes
- Customer satisfaction improved to 4.5/5.0
- Payback period: 8 months

Investment Required:
- System development: $120K
- Annual operations: $25K
- Implementation period: 6 months
```

### Example 2: Analysis Report Summary

```
Executive Summary

This report analyzes user churn data for 2025 Q4.

Key Findings:
1. Monthly churn rate increased from 3.2% to 4.8% (50% quarter-over-quarter increase)
2. Churn concentrated among new users registered 30-60 days (62% of total churn)
3. Primary cause: Poor onboarding experience (cited by 78% of users in survey)

Recommended Actions:
1. Redesign onboarding flow (estimated impact: reduce new user churn by 30%)
2. Add automated follow-up emails at Day 7 and Day 14
3. Build a gamified "new user quest" mechanism

Estimated ROI:
- Recover 350 churned users per month
- Annual revenue increase of $1.26M (based on ARPU of $300)
```

### Executive Summary Writing Principles

```
1. Length: No more than 1 page (250-400 words)
2. Standalone: Understandable without reading the full document
3. Conclusion first: State the conclusion in the first paragraph
4. Data-driven: Avoid vague descriptions
5. Action-oriented: Clearly tell the reader "So What"
6. Jargon-free: Avoid technical terminology
```

### Common Mistakes

| ❌ Mistake | ✅ Correction |
|-----------|-------------|
| Treating Introduction as Executive Summary | Summary is the conclusion; Introduction is the background |
| Too many technical details | Only keep business impact |
| No numbers | Include quantitative data |
| No action recommendations | Clearly list Next Steps |
| Too long (over 2 pages) | Trim to 1 page |

---

## 29-6: Complete BRD Case Study

### Case: E-Commerce Platform Loyalty Program

```
╔══════════════════════════════════════╗
║   Business Requirements Document    ║
║   E-Commerce Loyalty Program        ║
║   Version: 1.0                      ║
║   Author: Alex Wang (Business       ║
║           Analyst)                  ║
║   Date: 2026-03-15                  ║
║   Status: Draft                     ║
╚══════════════════════════════════════╝
```

#### 1. Executive Summary

The company faces rising customer churn (quarterly churn rate 4.8%) and stagnant average order value.
The recommendation is to introduce a loyalty program (points-based), targeting a 25% reduction in churn
within 6 months and a 15% increase in repeat purchase rate, with an estimated annual revenue increase of $800K.

#### 2. Business Objectives

| Objective | KPI | Target | Timeline |
|-----------|-----|--------|----------|
| Reduce churn | Monthly Churn Rate | From 4.8% to 3.6% | 6 months |
| Increase repeat purchases | Repeat Purchase Rate | From 35% to 50% | 6 months |
| Increase average order value | AOV | From $28 to $33 | 12 months |
| Grow membership | Active Members | Reach 50,000 | 12 months |

#### 3. Current State Analysis

```
Current State:
- No membership tier system; all customers receive the same promotions
- Promotions rely on sitewide discounts, compressing margins
- Customer data scattered across 3 systems (EC platform, CRM, CS system)
- Lack of customer lifecycle management

Pain Points:
- Cannot identify high-value customers (Top 20% contribute 65% of revenue)
- Customer acquisition cost (CAC) increasing 25% year-over-year
- Customers have no loyalty, high price sensitivity
```

#### 4. Scope

```
In Scope:
✅ Membership tier system (Bronze, Silver, Gold, Diamond)
✅ Points accumulation and redemption mechanism
✅ Member-exclusive offers
✅ Member Dashboard
✅ Points inquiry and transaction history
✅ Integration with existing EC platform

Out of Scope:
❌ Physical store POS integration (Phase 2)
❌ Cross-brand co-branded points (Phase 3)
❌ Social sharing rewards (Phase 2)
❌ Gamification features (Phase 2)
```

#### 5. Business Requirements

| ID | Description | Priority | Source |
|----|-------------|----------|--------|
| BR-001 | System auto-upgrades/downgrades membership tier based on spending | Must | Sponsor |
| BR-002 | $1 spent = 1 point; points redeemable toward purchases | Must | Sales |
| BR-003 | Different tiers receive different discount rates | Must | Sales |
| BR-004 | Points expire after 12 months (rolling) | Should | Finance |
| BR-005 | Members receive double points during their birthday month | Should | Marketing |
| BR-006 | Provide members with exclusive early access to purchases | Could | Marketing |
| BR-007 | Referral reward of 300 points for friend signup | Could | Growth Team |

#### 6. Membership Tier Rules

| Tier | Annual Spending Threshold | Discount | Points Multiplier | Exclusive Benefits |
|------|--------------------------|----------|-------------------|-------------------|
| Bronze | $0+ | 0% | 1x | Basic member pricing |
| Silver | $330+ | 3% | 1.5x | Free shipping, birthday gift |
| Gold | $1,000+ | 5% | 2x | Priority CS, early access |
| Diamond | $2,600+ | 8% | 3x | Personal advisor, VIP events |

#### 7. Assumptions & Constraints

```
Assumptions:
- Existing EC platform supports API integration
- Finance system can handle points liability accounting
- Customers are willing to provide personal data in exchange for benefits

Constraints:
- Budget cap of $160K (including first-year operations)
- Must launch before 2026 Q3
- Must comply with data privacy regulations
- Points redemption rate requires Finance department approval
```

#### 8. Risk Assessment

| Risk | Impact | Probability | Severity | Mitigation Strategy |
|------|--------|------------|----------|-------------------|
| Points cost too high | Profit decline | Medium | High | Set redemption caps, monitor points issuance volume |
| System integration delay | Launch postponement | Medium | Medium | Conduct POC early, set milestones |
| Low user engagement | ROI below target | Low | High | Onboarding guidance, promotional campaigns |
| Competitor follow-up | Differentiation lost | Medium | Medium | Continuous iteration, enhance experience |

#### 9. Success Metrics

```
Post-launch tracking metrics:
- Member registration rate (Target: 10,000 in first month)
- Points utilization rate (Target: > 60%)
- Member revenue contribution share (Target: > 70%)
- Tier upgrade rate (Target: 20% of members upgrade within 6 months)
- NPS score (Target: > 40)
```

---

## Cheat Sheet: Business Document Writing Quick Reference

### Document Type Quick Reference

```
BRD → "Why to do it" and "What to do" (business level)
PRD → "What to do" and "How to do it" (product level)
FRD → "How to do it" (functional details)
SRS → "How to do it" (technical specifications)
```

### Golden Rules of Writing

```
1. Know your audience (Write for your audience)
2. Lead with the conclusion (Bottom Line Up Front)
3. Use numbers (Quantify everything)
4. One concept per paragraph (One idea per paragraph)
5. Use active voice
6. Avoid vague terms ("fast," "many," "as much as possible" → specific numbers)
```

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| What does a BRD include? | Objectives, current state, scope, requirements, risks, timeline |
| BRD vs PRD? | BRD focuses on business Why/What; PRD focuses on product What/How |
| How to ensure document quality? | Peer Review + Stakeholder Sign-off |
| How to handle requirement changes? | Change Request + Impact Analysis + CCB |
| How to write an Executive Summary? | SCQA framework, within one page, supported by numbers |

"""

    // MARK: - World 30 (zh)
    private static let zhWorld30 = """

# World 30：Excel 數據分析

> Excel 是 BA 最常用的工具，面試也常考。不需要精通 VBA，但要能快速做出有 insight 的分析。

這一章聚焦在面試和工作中最實用的 Excel 技能，從公式到 Pivot Table 到 Scenario Analysis。

---

## 30-1：VLOOKUP / INDEX-MATCH

### VLOOKUP 基礎

```
=VLOOKUP(查找值, 查找範圍, 返回欄位, 精確匹配)
=VLOOKUP(A2, Sheet2!A:D, 3, FALSE)
```

| 參數 | 說明 | 常見值 |
|------|------|--------|
| lookup_value | 要查找的值 | A2（產品 ID） |
| table_array | 查找的範圍 | Sheet2!A:D |
| col_index_num | 返回第幾欄 | 3（第三欄） |
| range_lookup | 精確 or 模糊 | FALSE（精確匹配） |

### VLOOKUP 範例：合併銷售與產品資料

```
銷售表（Sheet1）：
| 訂單ID | 產品ID | 數量 | 產品名稱（VLOOKUP） |
|--------|--------|------|-------------------|
| 001    | P-101  | 5    | =VLOOKUP(B2, Products!A:C, 2, FALSE) |
| 002    | P-203  | 3    | =VLOOKUP(B3, Products!A:C, 2, FALSE) |

產品表（Products Sheet）：
| 產品ID | 產品名稱 | 單價 |
|--------|---------|------|
| P-101  | 滑鼠    | 350  |
| P-203  | 鍵盤    | 890  |
```

### VLOOKUP 的限制

```
❌ 只能向右查找（lookup 值必須在最左欄）
❌ 插入/刪除欄位時 col_index_num 會出錯
❌ 大量資料時效能差
❌ 多條件查找困難
```

### INDEX-MATCH：更強大的替代方案

```
=INDEX(返回範圍, MATCH(查找值, 查找範圍, 0))
=INDEX(C:C, MATCH(A2, B:B, 0))
```

### INDEX-MATCH 優勢

| 功能 | VLOOKUP | INDEX-MATCH |
|------|---------|-------------|
| 向左查找 | ❌ | ✅ |
| 欄位插入不受影響 | ❌ | ✅ |
| 大數據效能 | 慢 | 快 |
| 多條件查找 | 困難 | 容易（搭配陣列） |
| 水平查找 | 需改用 HLOOKUP | 同一組公式 |

### 多條件查找

```
情境：根據「部門」+「職級」查找薪資

方法一：輔助欄
在薪資表新增一欄 = 部門 & 職級
=VLOOKUP(A2&B2, Helper!A:C, 3, FALSE)

方法二：INDEX-MATCH 陣列公式（Ctrl+Shift+Enter）
=INDEX(薪資範圍, MATCH(1, (部門範圍=A2)*(職級範圍=B2), 0))

方法三：XLOOKUP（Excel 365+）
=XLOOKUP(A2, 查找範圍, 返回範圍, "Not Found")
```

### XLOOKUP（新版 Excel）

```
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])

優勢：
- 可以向左查找
- 內建找不到時的預設值
- 支援萬用字元搜尋
- 語法更直覺

範例：
=XLOOKUP(A2, Products!A:A, Products!C:C, "未找到")
```

---

## 30-2：Pivot Table 樞紐分析

### 什麼時候用 Pivot Table？

```
當你需要：
- 快速彙總大量資料
- 多維度交叉分析
- 動態切換分析角度
- 製作管理報表
```

### 建立 Pivot Table 的步驟

```
1. 選取資料範圍（確保有標題列）
2. Insert → PivotTable
3. 選擇放置位置（新工作表 / 現有位置）
4. 拖曳欄位到四個區域：
   - Rows（列）：分析維度
   - Columns（欄）：交叉維度
   - Values（值）：計算的數字
   - Filters（篩選）：全域篩選
```

### 範例：銷售資料分析

```
原始資料：
| 日期 | 地區 | 產品類別 | 業務員 | 金額 | 數量 |
|------|------|---------|--------|------|------|
| 1/1  | 北區 | 電腦    | Alice  | 35000| 2    |
| 1/1  | 南區 | 手機    | Bob    | 28000| 4    |
| 1/2  | 北區 | 手機    | Alice  | 14000| 2    |
| ...  | ...  | ...     | ...    | ...  | ...  |

Pivot Table 設定 1：各地區各類別銷售額
Rows: 地區
Columns: 產品類別
Values: Sum of 金額

結果：
| 地區 | 電腦 | 手機 | 配件 | 總計 |
|------|------|------|------|------|
| 北區 | 850K | 620K | 180K | 1.65M |
| 中區 | 520K | 480K | 150K | 1.15M |
| 南區 | 680K | 590K | 210K | 1.48M |
| 總計 | 2.05M | 1.69M | 540K | 4.28M |
```

### Pivot Table 進階技巧

```
1. 值欄位設定：
   - Sum（加總）、Count（計數）、Average（平均）
   - Show Values As → % of Grand Total（佔比）
   - Show Values As → % of Column Total（欄佔比）
   - Show Values As → Running Total（累計）

2. Group 功能：
   - 日期群組：按月/季/年
   - 數值群組：金額分級（0-1000, 1001-5000...）

3. Calculated Field（計算欄位）：
   - 客單價 = 金額 / 數量
   - 利潤率 = (金額 - 成本) / 金額

4. Slicer（交叉篩選器）：
   - 視覺化的篩選按鈕
   - 可連動多個 Pivot Table
```

### 面試常見 Pivot Table 問題

```
Q: 給你一份訂單資料，如何找出 Top 5 客戶？
A: Pivot Table → Rows: 客戶 → Values: Sum of 金額
   → Sort Descending → 取前 5 筆

Q: 如何分析月度趨勢？
A: Pivot Table → Rows: 日期（Group by Month）
   → Values: Sum of 金額
   → 插入折線圖

Q: 如何做 RFM 分析？
A: Recency: MAX(日期) per 客戶
   Frequency: COUNT(訂單) per 客戶
   Monetary: SUM(金額) per 客戶
   → 各維度分 5 級 → 交叉分群
```

---

## 30-3：常用公式與函數

### 條件統計函數

```
COUNTIF — 條件計數
=COUNTIF(A:A, "北區")                    → 北區有幾筆
=COUNTIFS(A:A, "北區", B:B, ">10000")    → 北區且金額>10000

SUMIF — 條件加總
=SUMIF(A:A, "北區", C:C)                 → 北區的金額總和
=SUMIFS(C:C, A:A, "北區", B:B, "電腦")   → 北區+電腦的金額

AVERAGEIF — 條件平均
=AVERAGEIF(A:A, "北區", C:C)             → 北區的平均金額
```

### 文字處理函數

```
LEFT / RIGHT / MID — 擷取字串
=LEFT(A2, 3)                → 前 3 個字元
=RIGHT(A2, 4)               → 後 4 個字元
=MID(A2, 3, 5)              → 從第 3 個字元取 5 個

CONCATENATE / TEXTJOIN — 合併字串
=A2 & " - " & B2            → 合併兩欄
=TEXTJOIN(", ", TRUE, A2:A10)  → 用逗號合併範圍

TRIM / CLEAN — 清除空白與特殊字元
=TRIM(A2)                   → 去除首尾空白
=CLEAN(A2)                  → 去除非印刷字元

TEXT — 格式化
=TEXT(A2, "YYYY-MM-DD")     → 日期格式化
=TEXT(A2, "#,##0")           → 數字加千分位
```

### 邏輯函數

```
IF — 條件判斷
=IF(A2>=60, "Pass", "Fail")

巢狀 IF（不建議超過 3 層）
=IF(A2>=90, "A", IF(A2>=80, "B", IF(A2>=60, "C", "F")))

IFS（Excel 2019+，更易讀）
=IFS(A2>=90, "A", A2>=80, "B", A2>=60, "C", TRUE, "F")

IFERROR — 錯誤處理
=IFERROR(VLOOKUP(...), "Not Found")

AND / OR
=IF(AND(A2>0, B2>0), "Both Positive", "Not Both")
=IF(OR(A2="VIP", B2>10000), "Priority", "Normal")
```

### 日期函數

```
TODAY() / NOW() — 當前日期/時間
DATEDIF — 日期差
=DATEDIF(A2, B2, "D")    → 相差天數
=DATEDIF(A2, B2, "M")    → 相差月數
=DATEDIF(A2, B2, "Y")    → 相差年數

EOMONTH — 月底日期
=EOMONTH(A2, 0)          → 當月最後一天
=EOMONTH(A2, -1)         → 上月最後一天

WEEKDAY — 星期幾
=WEEKDAY(A2, 2)          → 1=Mon, 7=Sun

NETWORKDAYS — 工作天數
=NETWORKDAYS(A2, B2)     → 兩日期間的工作天數
```

### 統計函數

```
RANK — 排名
=RANK(A2, A:A, 0)        → 由大到小排名

PERCENTILE — 百分位數
=PERCENTILE(A:A, 0.9)    → P90

STDEV — 標準差
=STDEV(A:A)              → 樣本標準差

LARGE / SMALL — 第 N 大/小
=LARGE(A:A, 3)           → 第 3 大的值
```

---

## 30-4：資料清理技巧

### 常見髒資料問題

| 問題 | 範例 | 解決方式 |
|------|------|---------|
| 多餘空白 | " 台北 " | TRIM() |
| 大小寫不一致 | "taipei" vs "Taipei" | UPPER/LOWER/PROPER |
| 日期格式不一 | "2026/3/1" vs "03-01-2026" | TEXT() 或格式設定 |
| 重複資料 | 同一筆訂單出現兩次 | Remove Duplicates |
| 空值 | 缺少地區欄位 | Filter → Blanks → 補值 |
| 異常值 | 金額 = -999 | 條件格式 + Filter |
| 合併儲存格 | 地區跨三列合併 | 取消合併 + 填充 |

### 資料清理流程

```
Step 1: 備份原始資料（永遠先備份！）

Step 2: 檢查資料品質
- 總筆數：COUNTA()
- 空值數：COUNTBLANK()
- 重複數：COUNTIF() > 1
- 最大最小值：MAX(), MIN()

Step 3: 標準化
- 去空白：TRIM()
- 統一大小寫：PROPER()
- 統一日期格式：TEXT()

Step 4: 處理缺失值
- 刪除（資料充足時）
- 補中位數（數值型）
- 補眾數（類別型）
- 標記為 Unknown

Step 5: 去重
- Data → Remove Duplicates
- 或用 COUNTIF 標記後手動處理

Step 6: 驗證
- 抽樣檢查
- 交叉比對原始資料
- 彙總數字是否合理
```

### 實用清理公式

```
去除所有空白（包含全形空白）:
=SUBSTITUTE(SUBSTITUTE(TRIM(A2), CHAR(160), ""), "　", "")

提取數字:
=SUMPRODUCT(MID(0&A2, LARGE(INDEX(ISNUMBER(--MID(A2,
ROW($1:$99), 1))*ROW($1:$99), 0), ROW($1:$99))+1, 1)*10^
ROW($1:$99)/10)

簡單版（只取前面的數字）:
=LEFT(A2, MIN(FIND({0,1,2,3,4,5,6,7,8,9}, A2&"0123456789"))-1+
LEN(A2)-LEN(SUBSTITUTE(A2, " ", "")))

統一電話格式:
=TEXT(SUBSTITUTE(SUBSTITUTE(A2, "-", ""), " ", ""), "0000-000-000")
```

### 條件格式標記異常

```
1. 選取資料範圍
2. Home → Conditional Formatting → New Rule
3. 常用規則：
   - 空值標黃色
   - 負數標紅色
   - 重複值標橘色
   - 超過 3 個標準差標紅色（異常值）
```

---

## 30-5：Scenario Analysis 情境分析

### 什麼是 Scenario Analysis？

```
用 Excel 建立模型，測試不同假設下的結果。
BA 常用於：
- 專案投資評估
- 價格策略分析
- 風險評估
- 預算規劃
```

### 方法一：Data Table（模擬分析表）

```
情境：分析不同定價和銷量組合下的營收

基礎模型：
單價 = $100（Cell B1）
銷量 = 1,000（Cell B2）
營收 = 單價 × 銷量 = $100,000（Cell B3, =B1*B2）

Data Table 設定：
     |  $80   | $100  | $120  | $150
-----+--------+-------+-------+------
 800 | 64,000 |80,000 |96,000 |120,000
1000 | 80,000 |100,000|120,000|150,000
1200 | 96,000 |120,000|144,000|180,000
1500 |120,000 |150,000|180,000|225,000

操作：Data → What-If Analysis → Data Table
Row Input = B1（單價）
Column Input = B2（銷量）
```

### 方法二：Scenario Manager

```
情境設定：

Best Case（樂觀）:
- 成長率 = 20%
- 客戶流失率 = 2%
- 客單價 = $1,200

Base Case（基準）:
- 成長率 = 10%
- 客戶流失率 = 5%
- 客單價 = $1,000

Worst Case（悲觀）:
- 成長率 = 3%
- 客戶流失率 = 10%
- 客單價 = $800

操作：Data → What-If Analysis → Scenario Manager → Add
```

### 方法三：Goal Seek（目標搜尋）

```
問題：需要多少銷量才能達到 $500K 營收？

設定：
Set Cell = 營收（B3）
To Value = 500,000
By Changing Cell = 銷量（B2）

操作：Data → What-If Analysis → Goal Seek
結果：銷量需要 5,000 單
```

### 敏感度分析（Sensitivity Analysis）

```
測試每個變數變化 ±10%、±20% 對結果的影響：

| 變數 | -20% | -10% | Base | +10% | +20% | 敏感度 |
|------|------|------|------|------|------|--------|
| 單價 | $80K | $90K |$100K |$110K |$120K | 高 |
| 銷量 | $80K | $90K |$100K |$110K |$120K | 高 |
| 成本 | $120K| $110K|$100K | $90K | $80K | 中 |
| 折扣率| $105K| $102K|$100K | $98K | $95K | 低 |

→ 單價和銷量對營收的敏感度最高
→ 折扣率影響較小
```

### 面試實戰：ROI 計算

```
專案投資評估模型：

投入成本：
- 系統開發：$500K
- 年度維運：$100K
- 培訓：$50K
- 總投入（3年）：$500K + $100K × 3 + $50K = $850K

預期效益：
- 年省人力成本：$200K
- 年增營收貢獻：$150K
- 年度總效益：$350K

ROI 計算：
=（3年總效益 - 3年總成本）/ 3年總成本
= ($350K × 3 - $850K) / $850K
= $200K / $850K
= 23.5%

回收期：
= 總投入 / 年度效益
= $850K / $350K
= 2.43 年
```

---

## 30-6：完整分析案例

### 案例：電商月度業績分析

#### 任務描述

```
你收到一份電商平台的月度銷售資料（5,000 筆訂單），
需要在明天的管理會議上報告以下分析結果：
1. 各品類營收與佔比
2. Top 10 暢銷商品
3. 各通路轉換率比較
4. 客戶 RFM 分群
5. 下月營收預測
```

#### Step 1：資料清理

```
檢查項目：
☐ 總筆數是否正確（5,000）
☐ 是否有重複訂單（用訂單 ID 的 COUNTIF > 1 檢查）
☐ 日期範圍是否正確（當月 1 日 ~ 月底）
☐ 金額是否有負值或異常值
☐ 地區/品類欄位是否有空值
☐ 資料類型是否正確（金額是數字非文字）
```

#### Step 2：Pivot Table 分析

```
分析一：各品類營收
Rows: 品類
Values: Sum of 金額, Count of 訂單ID
Show Values As: % of Grand Total

結果：
| 品類 | 營收 | 佔比 | 訂單數 | 客單價 |
|------|------|------|--------|--------|
| 3C 電子 | $2.1M | 35% | 800 | $2,625 |
| 服飾 | $1.5M | 25% | 1,500 | $1,000 |
| 食品 | $1.2M | 20% | 1,800 | $667 |
| 家居 | $0.8M | 13% | 600 | $1,333 |
| 其他 | $0.4M | 7% | 300 | $1,333 |
```

#### Step 3：RFM 分析

```
計算 RFM 分數：

R（Recency）= TODAY() - 最後購買日期
  → 分 5 級：1-7天=5, 8-14=4, 15-30=3, 31-60=2, >60=1

F（Frequency）= 購買次數
  → 分 5 級：>10=5, 7-10=4, 4-6=3, 2-3=2, 1=1

M（Monetary）= 消費金額
  → 分 5 級：用 PERCENTILE 分 5 等份

RFM 分群：
| RFM 分數 | 客群名稱 | 人數 | 策略 |
|----------|---------|------|------|
| 5-5-5 | Champions | 120 | 獨家優惠、VIP 待遇 |
| 4-4-4 ~ 5-5-4 | Loyal | 350 | 升等獎勵、早鳥 |
| 3-3-3 ~ 4-4-3 | Potential | 580 | 促銷推播、交叉銷售 |
| 2-2-2 ~ 3-3-2 | At Risk | 420 | 挽回優惠、問卷調查 |
| 1-1-1 ~ 2-2-1 | Lost | 280 | 大額折扣或放棄 |
```

#### Step 4：Dashboard 呈現

```
頁面一：Overview
- 本月營收 vs 上月（Card + 趨勢箭頭）
- 訂單數 vs 上月
- 客單價 vs 上月
- 日營收趨勢圖（Line Chart）

頁面二：品類分析
- 品類營收佔比（Pie Chart）
- 品類月度趨勢（Stacked Bar）
- Top 10 商品（Horizontal Bar）

頁面三：客戶分析
- RFM 分群佔比（Donut Chart）
- 新客 vs 舊客營收佔比
- 客戶地區分佈（Map/Bar）
```

---

## Cheat Sheet：Excel 分析速查表

### 必背快捷鍵

| 快捷鍵 | 功能 |
|--------|------|
| Ctrl+T | 建立表格（Table） |
| Alt+N+V | 插入 Pivot Table |
| Ctrl+Shift+L | 加入篩選 |
| F4 | 切換絕對/相對參照 |
| Ctrl+; | 插入今天日期 |
| Ctrl+Shift+1 | 數字格式（千分位） |
| Alt+= | 自動 SUM |
| Ctrl+D | 向下填充 |

### 公式速查

```
查找：VLOOKUP → INDEX-MATCH → XLOOKUP
條件統計：COUNTIFS, SUMIFS, AVERAGEIFS
文字：LEFT, RIGHT, MID, TRIM, TEXT
邏輯：IF, IFS, IFERROR, AND, OR
日期：TODAY, DATEDIF, EOMONTH, NETWORKDAYS
統計：RANK, PERCENTILE, STDEV
```

### 面試常見 Excel 問題

| 問題 | 回答重點 |
|------|---------|
| VLOOKUP vs INDEX-MATCH？ | INDEX-MATCH 更靈活，可向左查找 |
| 如何處理大量資料？ | Pivot Table + Filter + 結構化表格 |
| 如何做 Scenario Analysis？ | Data Table / Scenario Manager / Goal Seek |
| 如何清理資料？ | TRIM + 去重 + 條件格式標記 + 驗證 |
| 如何呈現分析結果？ | Pivot Chart + Dashboard + Executive Summary |

"""

    // MARK: - World 30 (en)
    private static let enWorld30 = """

# World 30: Excel Data Analysis

> Excel is the most commonly used tool for BAs, and it is frequently tested in interviews. You don't need to master VBA, but you should be able to quickly produce insightful analyses.

This chapter focuses on the most practical Excel skills for interviews and daily work, from formulas to Pivot Tables to Scenario Analysis.

---

## 30-1: VLOOKUP / INDEX-MATCH

### VLOOKUP Basics

```
=VLOOKUP(lookup_value, table_array, col_index_num, range_lookup)
=VLOOKUP(A2, Sheet2!A:D, 3, FALSE)
```

| Parameter | Description | Common Values |
|-----------|-------------|---------------|
| lookup_value | The value to look up | A2 (Product ID) |
| table_array | The range to search in | Sheet2!A:D |
| col_index_num | Which column to return | 3 (third column) |
| range_lookup | Exact or approximate | FALSE (exact match) |

### VLOOKUP Example: Merging Sales and Product Data

```
Sales Table (Sheet1):
| OrderID | ProductID | Qty | Product Name (VLOOKUP) |
|---------|-----------|-----|------------------------|
| 001     | P-101     | 5   | =VLOOKUP(B2, Products!A:C, 2, FALSE) |
| 002     | P-203     | 3   | =VLOOKUP(B3, Products!A:C, 2, FALSE) |

Products Sheet:
| ProductID | Product Name | Unit Price |
|-----------|-------------|-----------|
| P-101     | Mouse       | 12        |
| P-203     | Keyboard    | 30        |
```

### VLOOKUP Limitations

```
❌ Can only look up to the right (lookup value must be in the leftmost column)
❌ col_index_num breaks when columns are inserted/deleted
❌ Poor performance with large datasets
❌ Multi-criteria lookup is difficult
```

### INDEX-MATCH: A More Powerful Alternative

```
=INDEX(return_range, MATCH(lookup_value, lookup_range, 0))
=INDEX(C:C, MATCH(A2, B:B, 0))
```

### INDEX-MATCH Advantages

| Feature | VLOOKUP | INDEX-MATCH |
|---------|---------|-------------|
| Look up to the left | ❌ | ✅ |
| Unaffected by column insertion | ❌ | ✅ |
| Performance with large data | Slow | Fast |
| Multi-criteria lookup | Difficult | Easy (with arrays) |
| Horizontal lookup | Needs HLOOKUP | Same formula set |

### Multi-Criteria Lookup

```
Scenario: Look up salary based on "Department" + "Job Level"

Method 1: Helper Column
Add a column in the salary table = Department & Job Level
=VLOOKUP(A2&B2, Helper!A:C, 3, FALSE)

Method 2: INDEX-MATCH Array Formula (Ctrl+Shift+Enter)
=INDEX(SalaryRange, MATCH(1, (DeptRange=A2)*(LevelRange=B2), 0))

Method 3: XLOOKUP (Excel 365+)
=XLOOKUP(A2, LookupRange, ReturnRange, "Not Found")
```

### XLOOKUP (Newer Excel)

```
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])

Advantages:
- Can look up to the left
- Built-in default value when not found
- Supports wildcard search
- More intuitive syntax

Example:
=XLOOKUP(A2, Products!A:A, Products!C:C, "Not Found")
```

---

## 30-2: Pivot Table Analysis

### When to Use a Pivot Table?

```
When you need to:
- Quickly summarize large datasets
- Multi-dimensional cross-analysis
- Dynamically switch analysis perspectives
- Create management reports
```

### Steps to Create a Pivot Table

```
1. Select the data range (ensure it has a header row)
2. Insert → PivotTable
3. Choose placement (new worksheet / existing location)
4. Drag fields into four areas:
   - Rows: Analysis dimension
   - Columns: Cross-dimension
   - Values: Numbers to calculate
   - Filters: Global filter
```

### Example: Sales Data Analysis

```
Raw Data:
| Date | Region | Category | Sales Rep | Amount | Quantity |
|------|--------|----------|-----------|--------|----------|
| 1/1  | North  | Computer | Alice     | 35000  | 2        |
| 1/1  | South  | Phone    | Bob       | 28000  | 4        |
| 1/2  | North  | Phone    | Alice     | 14000  | 2        |
| ...  | ...    | ...      | ...       | ...    | ...      |

Pivot Table Setup 1: Sales by Region and Category
Rows: Region
Columns: Category
Values: Sum of Amount

Result:
| Region | Computer | Phone | Accessories | Total |
|--------|----------|-------|-------------|-------|
| North  | 850K     | 620K  | 180K        | 1.65M |
| Central| 520K     | 480K  | 150K        | 1.15M |
| South  | 680K     | 590K  | 210K        | 1.48M |
| Total  | 2.05M    | 1.69M | 540K        | 4.28M |
```

### Advanced Pivot Table Techniques

```
1. Value Field Settings:
   - Sum, Count, Average
   - Show Values As → % of Grand Total
   - Show Values As → % of Column Total
   - Show Values As → Running Total

2. Group Feature:
   - Date grouping: By month/quarter/year
   - Numeric grouping: Amount tiers (0-1000, 1001-5000...)

3. Calculated Field:
   - Average order value = Amount / Quantity
   - Profit margin = (Amount - Cost) / Amount

4. Slicer:
   - Visual filter buttons
   - Can link multiple Pivot Tables
```

### Common Pivot Table Interview Questions

```
Q: Given order data, how do you find the Top 5 customers?
A: Pivot Table → Rows: Customer → Values: Sum of Amount
   → Sort Descending → Take top 5

Q: How do you analyze monthly trends?
A: Pivot Table → Rows: Date (Group by Month)
   → Values: Sum of Amount
   → Insert Line Chart

Q: How do you do RFM analysis?
A: Recency: MAX(Date) per Customer
   Frequency: COUNT(Orders) per Customer
   Monetary: SUM(Amount) per Customer
   → Score each dimension on a 1-5 scale → Cross-segment
```

---

## 30-3: Commonly Used Formulas and Functions

### Conditional Statistical Functions

```
COUNTIF — Conditional Count
=COUNTIF(A:A, "North")                    → Count of North region entries
=COUNTIFS(A:A, "North", B:B, ">10000")    → North region AND amount > 10000

SUMIF — Conditional Sum
=SUMIF(A:A, "North", C:C)                 → Total amount for North
=SUMIFS(C:C, A:A, "North", B:B, "Computer") → North + Computer amount

AVERAGEIF — Conditional Average
=AVERAGEIF(A:A, "North", C:C)             → Average amount for North
```

### Text Functions

```
LEFT / RIGHT / MID — Extract Substrings
=LEFT(A2, 3)                → First 3 characters
=RIGHT(A2, 4)               → Last 4 characters
=MID(A2, 3, 5)              → 5 characters starting from position 3

CONCATENATE / TEXTJOIN — Combine Strings
=A2 & " - " & B2            → Combine two columns
=TEXTJOIN(", ", TRUE, A2:A10)  → Join range with commas

TRIM / CLEAN — Remove Whitespace and Special Characters
=TRIM(A2)                   → Remove leading/trailing spaces
=CLEAN(A2)                  → Remove non-printable characters

TEXT — Formatting
=TEXT(A2, "YYYY-MM-DD")     → Format date
=TEXT(A2, "#,##0")           → Add thousands separator
```

### Logical Functions

```
IF — Conditional Logic
=IF(A2>=60, "Pass", "Fail")

Nested IF (not recommended beyond 3 levels)
=IF(A2>=90, "A", IF(A2>=80, "B", IF(A2>=60, "C", "F")))

IFS (Excel 2019+, more readable)
=IFS(A2>=90, "A", A2>=80, "B", A2>=60, "C", TRUE, "F")

IFERROR — Error Handling
=IFERROR(VLOOKUP(...), "Not Found")

AND / OR
=IF(AND(A2>0, B2>0), "Both Positive", "Not Both")
=IF(OR(A2="VIP", B2>10000), "Priority", "Normal")
```

### Date Functions

```
TODAY() / NOW() — Current date/time
DATEDIF — Date difference
=DATEDIF(A2, B2, "D")    → Difference in days
=DATEDIF(A2, B2, "M")    → Difference in months
=DATEDIF(A2, B2, "Y")    → Difference in years

EOMONTH — End of month date
=EOMONTH(A2, 0)          → Last day of current month
=EOMONTH(A2, -1)         → Last day of previous month

WEEKDAY — Day of the week
=WEEKDAY(A2, 2)          → 1=Mon, 7=Sun

NETWORKDAYS — Working days count
=NETWORKDAYS(A2, B2)     → Working days between two dates
```

### Statistical Functions

```
RANK — Ranking
=RANK(A2, A:A, 0)        → Rank from largest to smallest

PERCENTILE — Percentile value
=PERCENTILE(A:A, 0.9)    → P90

STDEV — Standard deviation
=STDEV(A:A)              → Sample standard deviation

LARGE / SMALL — Nth largest/smallest
=LARGE(A:A, 3)           → 3rd largest value
```

---

## 30-4: Data Cleaning Techniques

### Common Dirty Data Issues

| Issue | Example | Solution |
|-------|---------|---------|
| Extra whitespace | " New York " | TRIM() |
| Inconsistent casing | "new york" vs "New York" | UPPER/LOWER/PROPER |
| Inconsistent date formats | "2026/3/1" vs "03-01-2026" | TEXT() or format settings |
| Duplicate data | Same order appearing twice | Remove Duplicates |
| Null values | Missing region field | Filter → Blanks → Fill |
| Outliers | Amount = -999 | Conditional Formatting + Filter |
| Merged cells | Region spanning three rows | Unmerge + Fill Down |

### Data Cleaning Workflow

```
Step 1: Back up the original data (always back up first!)

Step 2: Assess data quality
- Total records: COUNTA()
- Null count: COUNTBLANK()
- Duplicate count: COUNTIF() > 1
- Max/Min values: MAX(), MIN()

Step 3: Standardize
- Remove whitespace: TRIM()
- Standardize casing: PROPER()
- Standardize date format: TEXT()

Step 4: Handle missing values
- Delete (when data is sufficient)
- Impute median (numeric)
- Impute mode (categorical)
- Mark as Unknown

Step 5: Deduplicate
- Data → Remove Duplicates
- Or use COUNTIF to flag, then handle manually

Step 6: Validate
- Spot-check samples
- Cross-reference with original data
- Check if summary numbers are reasonable
```

### Useful Cleaning Formulas

```
Remove all whitespace (including non-breaking spaces):
=SUBSTITUTE(SUBSTITUTE(TRIM(A2), CHAR(160), ""), " ", "")

Extract numbers:
=SUMPRODUCT(MID(0&A2, LARGE(INDEX(ISNUMBER(--MID(A2,
ROW($1:$99), 1))*ROW($1:$99), 0), ROW($1:$99))+1, 1)*10^
ROW($1:$99)/10)

Standardize phone format:
=TEXT(SUBSTITUTE(SUBSTITUTE(A2, "-", ""), " ", ""), "0000-000-000")
```

### Conditional Formatting for Anomaly Detection

```
1. Select the data range
2. Home → Conditional Formatting → New Rule
3. Common rules:
   - Highlight blanks in yellow
   - Highlight negatives in red
   - Highlight duplicates in orange
   - Highlight values beyond 3 standard deviations in red (outliers)
```

---

## 30-5: Scenario Analysis

### What Is Scenario Analysis?

```
Building models in Excel to test outcomes under different assumptions.
Commonly used by BAs for:
- Project investment evaluation
- Pricing strategy analysis
- Risk assessment
- Budget planning
```

### Method 1: Data Table

```
Scenario: Analyze revenue under different price and volume combinations

Base Model:
Unit Price = $100 (Cell B1)
Volume = 1,000 (Cell B2)
Revenue = Price x Volume = $100,000 (Cell B3, =B1*B2)

Data Table Setup:
     |  $80   | $100  | $120  | $150
-----+--------+-------+-------+------
 800 | 64,000 |80,000 |96,000 |120,000
1000 | 80,000 |100,000|120,000|150,000
1200 | 96,000 |120,000|144,000|180,000
1500 |120,000 |150,000|180,000|225,000

Steps: Data → What-If Analysis → Data Table
Row Input = B1 (Price)
Column Input = B2 (Volume)
```

### Method 2: Scenario Manager

```
Scenario Settings:

Best Case (Optimistic):
- Growth rate = 20%
- Customer churn rate = 2%
- Average order value = $1,200

Base Case:
- Growth rate = 10%
- Customer churn rate = 5%
- Average order value = $1,000

Worst Case (Pessimistic):
- Growth rate = 3%
- Customer churn rate = 10%
- Average order value = $800

Steps: Data → What-If Analysis → Scenario Manager → Add
```

### Method 3: Goal Seek

```
Question: How much volume is needed to reach $500K revenue?

Setup:
Set Cell = Revenue (B3)
To Value = 500,000
By Changing Cell = Volume (B2)

Steps: Data → What-If Analysis → Goal Seek
Result: Volume needs to be 5,000 units
```

### Sensitivity Analysis

```
Test the impact of each variable changing ±10%, ±20% on the result:

| Variable | -20% | -10% | Base | +10% | +20% | Sensitivity |
|----------|------|------|------|------|------|-------------|
| Price    | $80K | $90K |$100K |$110K |$120K | High        |
| Volume   | $80K | $90K |$100K |$110K |$120K | High        |
| Cost     | $120K| $110K|$100K | $90K | $80K | Medium      |
| Discount | $105K| $102K|$100K | $98K | $95K | Low         |

→ Price and volume have the highest sensitivity on revenue
→ Discount rate has relatively low impact
```

### Interview Practice: ROI Calculation

```
Project Investment Evaluation Model:

Investment Costs:
- System development: $500K
- Annual operations: $100K
- Training: $50K
- Total investment (3 years): $500K + $100K x 3 + $50K = $850K

Expected Benefits:
- Annual labor cost savings: $200K
- Annual revenue contribution: $150K
- Annual total benefit: $350K

ROI Calculation:
= (3-year total benefits - 3-year total costs) / 3-year total costs
= ($350K x 3 - $850K) / $850K
= $200K / $850K
= 23.5%

Payback Period:
= Total investment / Annual benefit
= $850K / $350K
= 2.43 years
```

---

## 30-6: Complete Analysis Case Study

### Case: E-Commerce Monthly Performance Analysis

#### Task Description

```
You receive monthly sales data from an e-commerce platform (5,000 orders).
You need to present the following analysis results at tomorrow's management meeting:
1. Revenue and share by category
2. Top 10 best-selling products
3. Conversion rate comparison by channel
4. Customer RFM segmentation
5. Next month revenue forecast
```

#### Step 1: Data Cleaning

```
Checklist:
☐ Total record count is correct (5,000)
☐ Check for duplicate orders (COUNTIF on Order ID > 1)
☐ Date range is correct (1st to last day of month)
☐ No negative or abnormal values in amount
☐ No null values in region/category fields
☐ Data types are correct (amount is numeric, not text)
```

#### Step 2: Pivot Table Analysis

```
Analysis 1: Revenue by Category
Rows: Category
Values: Sum of Amount, Count of OrderID
Show Values As: % of Grand Total

Result:
| Category    | Revenue | Share | Orders | AOV    |
|-------------|---------|-------|--------|--------|
| Electronics | $2.1M   | 35%   | 800    | $2,625 |
| Apparel     | $1.5M   | 25%   | 1,500  | $1,000 |
| Food        | $1.2M   | 20%   | 1,800  | $667   |
| Home        | $0.8M   | 13%   | 600    | $1,333 |
| Other       | $0.4M   | 7%    | 300    | $1,333 |
```

#### Step 3: RFM Analysis

```
Calculate RFM Scores:

R (Recency) = TODAY() - Last Purchase Date
  → Score 1-5: 1-7 days=5, 8-14=4, 15-30=3, 31-60=2, >60=1

F (Frequency) = Purchase Count
  → Score 1-5: >10=5, 7-10=4, 4-6=3, 2-3=2, 1=1

M (Monetary) = Total Spending
  → Score 1-5: Use PERCENTILE to divide into 5 equal parts

RFM Segmentation:
| RFM Score | Segment Name | Count | Strategy |
|-----------|-------------|-------|----------|
| 5-5-5 | Champions | 120 | Exclusive offers, VIP treatment |
| 4-4-4 ~ 5-5-4 | Loyal | 350 | Tier upgrade rewards, early access |
| 3-3-3 ~ 4-4-3 | Potential | 580 | Promotional push, cross-selling |
| 2-2-2 ~ 3-3-2 | At Risk | 420 | Win-back offers, surveys |
| 1-1-1 ~ 2-2-1 | Lost | 280 | Deep discounts or deprioritize |
```

#### Step 4: Dashboard Presentation

```
Page 1: Overview
- This month's revenue vs last month (Card + trend arrow)
- Order count vs last month
- Average order value vs last month
- Daily revenue trend (Line Chart)

Page 2: Category Analysis
- Category revenue share (Pie Chart)
- Category monthly trend (Stacked Bar)
- Top 10 products (Horizontal Bar)

Page 3: Customer Analysis
- RFM segment distribution (Donut Chart)
- New vs returning customer revenue share
- Customer geographic distribution (Map/Bar)
```

---

## Cheat Sheet: Excel Analysis Quick Reference

### Must-Know Keyboard Shortcuts

| Shortcut | Function |
|----------|----------|
| Ctrl+T | Create Table |
| Alt+N+V | Insert Pivot Table |
| Ctrl+Shift+L | Add Filter |
| F4 | Toggle Absolute/Relative Reference |
| Ctrl+; | Insert Today's Date |
| Ctrl+Shift+1 | Number Format (thousands separator) |
| Alt+= | AutoSUM |
| Ctrl+D | Fill Down |

### Formula Quick Reference

```
Lookup: VLOOKUP → INDEX-MATCH → XLOOKUP
Conditional Stats: COUNTIFS, SUMIFS, AVERAGEIFS
Text: LEFT, RIGHT, MID, TRIM, TEXT
Logic: IF, IFS, IFERROR, AND, OR
Date: TODAY, DATEDIF, EOMONTH, NETWORKDAYS
Statistics: RANK, PERCENTILE, STDEV
```

### Common Excel Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| VLOOKUP vs INDEX-MATCH? | INDEX-MATCH is more flexible, supports left lookup |
| How to handle large datasets? | Pivot Table + Filter + Structured Tables |
| How to do Scenario Analysis? | Data Table / Scenario Manager / Goal Seek |
| How to clean data? | TRIM + Dedup + Conditional Formatting + Validation |
| How to present analysis results? | Pivot Chart + Dashboard + Executive Summary |

"""

    // MARK: - World 31 (zh)
    private static let zhWorld31 = """

# World 31：BI 工具與 Dashboard

> 資料本身沒有價值，能「說故事」的資料才有價值。Dashboard 是 BA 向 Stakeholder 展示 Insight 的核心媒介。

這一章教你如何設計有影響力的 Dashboard，而不只是把圖表堆在一起。

---

## 31-1：Dashboard 設計原則

### Dashboard 的目的

```
Dashboard ≠ 報表

報表（Report）：回答「發生了什麼」→ 回顧型
Dashboard：回答「現在狀況如何？該採取什麼行動？」→ 行動導向
```

### Dashboard 分類

| 類型 | 目的 | 更新頻率 | 受眾 | 範例 |
|------|------|---------|------|------|
| Strategic | 長期趨勢、目標追蹤 | 月/季 | C-level | 年度 KPI Dashboard |
| Operational | 日常監控、即時狀態 | 即時/每日 | 營運團隊 | 訂單處理 Dashboard |
| Analytical | 深度分析、探索洞察 | 按需 | 分析師 | 用戶行為分析 |
| Tactical | 中期追蹤、專案進度 | 每週 | 中階主管 | Sprint Dashboard |

### 設計五大原則

```
1. 一個 Dashboard 一個目的
   ❌ 把所有 KPI 塞在一頁
   ✅ 「這個 Dashboard 幫助 X 角色做 Y 決策」

2. 5 秒法則
   → 看到 Dashboard 的前 5 秒就知道狀況好不好
   → 用顏色、大字體突顯關鍵數字

3. 資訊層次（Information Hierarchy）
   → Level 1：最重要的 KPI（最大、最上方）
   → Level 2：支撐 KPI 的分維度
   → Level 3：細節資料（可互動鑽取）

4. 減少認知負擔
   → 最多 7±2 個圖表
   → 統一配色和字體
   → 避免 3D 圖表和過多裝飾

5. 設計為行動導向
   → 每個指標都有對應的行動意涵
   → 加入目標線 / 警示線
   → 異常狀態一目了然
```

### Layout 常見模式

```
模式一：Z 字型（最常用）
┌────────────┬────────────┬────────────┐
│   KPI 1    │   KPI 2    │   KPI 3    │  ← 核心數字
├────────────┴────────────┴────────────┤
│          主要趨勢圖表                  │  ← 主圖
├──────────────────┬───────────────────┤
│    分維度圖表 1    │    分維度圖表 2    │  ← 支撐
├──────────────────┴───────────────────┤
│              明細表格                  │  ← 細節
└──────────────────────────────────────┘

模式二：焦點型
┌──────────────────────────────────────┐
│              核心大數字                │
├──────────────────────────────────────┤
│              趨勢圖                   │
├────────────┬─────────┬───────────────┤
│   維度 1    │ 維度 2  │    維度 3      │
└────────────┴─────────┴───────────────┘

模式三：左篩右圖
┌─────────┬────────────────────────────┐
│ 篩選器   │                            │
│ ──────  │        主要圖表區            │
│ 時間     │                            │
│ 地區     ├──────────┬─────────────────┤
│ 品類     │  圖表 2   │     圖表 3      │
│ ...     │          │                 │
└─────────┴──────────┴─────────────────┘
```

### 配色原則

```
1. 語義色彩（Semantic Colors）
   - 綠色 = 正面 / 達標
   - 紅色 = 負面 / 警告
   - 黃色 = 注意 / 接近閾值
   - 灰色 = 中性 / 背景

2. 品牌色系
   - 主色 1-2 個，輔色 2-3 個
   - 避免超過 5 個顏色

3. 數據色階
   - 漸層色：表示數值大小（淺→深）
   - 分類色：表示不同類別（互相區分）

4. 無障礙設計
   - 不要只靠顏色傳達資訊
   - 加入文字標籤或圖案
   - 考慮色盲友善配色
```

---

## 31-2：KPI 視覺化

### KPI Card 設計

```
好的 KPI Card 包含：
┌─────────────────────────┐
│ 📈 Monthly Revenue       │  ← 標題
│                          │
│     $2.4M                │  ← 當前值（大字體）
│     ▲ 12% vs 上月        │  ← 變化率（帶方向）
│     目標：$2.5M          │  ← 目標值
│     ━━━━━━━━━━━━━▓░░     │  ← 進度條（96%）
└─────────────────────────┘

要素：
1. 指標名稱（清楚、無歧義）
2. 當前值（最大字體）
3. 比較基準（vs 上期、vs 目標、vs 預算）
4. 趨勢方向（↑↓ 或箭頭）
5. 視覺提示（進度條、Sparkline、RAG 顏色）
```

### 常見 KPI 與視覺化方式

| KPI | 最佳視覺化 | 說明 |
|-----|-----------|------|
| 營收 / GMV | KPI Card + Line Chart | 大數字 + 趨勢 |
| 轉換率 | Funnel Chart | 各步驟轉換 |
| 客戶滿意度 | Gauge Chart | 儀表板式 |
| 市場佔有率 | Pie / Donut Chart | 佔比 |
| 目標達成率 | Bullet Chart | 實際 vs 目標 |
| 各部門業績 | Horizontal Bar | 排名比較 |
| 月度趨勢 | Line Chart | 時間序列 |
| 品類分佈 | Treemap | 層級佔比 |

### Bullet Chart（子彈圖）

```
業績目標追蹤最佳視覺化方式：

Revenue  ████████████████████▓░░░░░  $2.4M / $2.5M (96%)
Orders   ████████████████████████▓░  4,800 / 5,000 (96%)
NPS      ██████████████████████████  45 / 40 (113%) ✓
Churn    ████████████▓░░░░░░░░░░░░░  4.8% / 3.5% (Warning!)

組成要素：
- 黑色條 = 實際值
- 灰色區域 = 範圍（差 / 中 / 好）
- 標記線 = 目標值
```

### Sparkline（迷你趨勢圖）

```
在 KPI Card 或表格中嵌入的小型趨勢圖。

Revenue: $2.4M  ╱╲╱──╱╲╱╱╲──╱  ▲12%
Orders:  4,800  ──╱╲──╱╲╱──╱╲  ▲8%
AOV:     $500   ╲──╱──╱──╱╲╲─  ▼3%

用途：在有限空間內同時顯示當前值和趨勢
```

---

## 31-3：圖表選擇指南

### 根據「你想表達什麼」選圖表

| 目的 | 推薦圖表 | 說明 |
|------|---------|------|
| 比較大小 | Bar Chart | 不同類別的數值比較 |
| 時間趨勢 | Line Chart | 隨時間的變化 |
| 佔比構成 | Pie / Donut / Stacked Bar | 整體的組成部分 |
| 相關性 | Scatter Plot | 兩個變數的關係 |
| 分佈 | Histogram / Box Plot | 資料的分散程度 |
| 地理分佈 | Map / Choropleth | 地理位置的差異 |
| 流程轉換 | Funnel / Sankey | 各步驟的流轉 |
| 排名 | Horizontal Bar | 從高到低排序 |
| 目標追蹤 | Bullet / Gauge | 實際 vs 目標 |
| 層級佔比 | Treemap / Sunburst | 多層級的大小比較 |

### 圖表的 Do's & Don'ts

```
✅ Do:
- Y 軸從 0 開始（Bar Chart）
- 使用一致的時間區間
- 標註資料來源和更新時間
- 直接在圖上標註數字（減少 Legend 依賴）
- 排序（Bar Chart 由大到小）

❌ Don't:
- 使用 3D 圖表（扭曲比例）
- Pie Chart 超過 5 個分類
- 雙 Y 軸（容易誤導）
- 過多格線和邊框
- 使用面積表示長度（面積感知不準確）
- 截斷 Y 軸來誇大差異
```

### 常見錯誤範例

```
錯誤 1：Pie Chart 有 12 個分類
→ 修正：只顯示 Top 5，其餘合併為「其他」

錯誤 2：Bar Chart Y 軸從 95% 開始
→ 修正：從 0% 開始，或改用 Line Chart 強調變化

錯誤 3：Line Chart 用於非時間序列的類別資料
→ 修正：改用 Bar Chart

錯誤 4：面積圖比較絕對值
→ 修正：改用 Bar Chart 或堆疊圖

錯誤 5：彩虹配色
→ 修正：使用單色漸層或品牌色系
```

### 圖表選擇決策樹

```
你想表達什麼？
├── 比較
│   ├── 不同類別 → Bar Chart
│   ├── 時間變化 → Line Chart
│   └── 排名 → Horizontal Bar（已排序）
├── 構成
│   ├── 簡單佔比（≤5 類）→ Donut Chart
│   ├── 隨時間的構成變化 → Stacked Bar / 100% Stacked Bar
│   └── 多層級 → Treemap
├── 趨勢
│   ├── 單一指標 → Line Chart
│   ├── 多指標比較 → Multi-line Chart
│   └── 帶範圍 → Area Chart
├── 關聯
│   ├── 兩變數 → Scatter Plot
│   └── 三變數 → Bubble Chart
└── 分佈
    ├── 單一變數 → Histogram
    └── 多組比較 → Box Plot
```

---

## 31-4：Data Storytelling 數據敘事

### 數據敘事三要素

```
        Data
       ╱    ╲
      ╱      ╲
 Narrative ── Visuals

Data：正確的資料和分析
Narrative：清楚的故事線和 Insight
Visuals：適當的視覺化呈現

三者缺一不可。
```

### 故事結構：SBI 框架

```
S — Situation（情境）：設定背景
B — Behavior（行為/發現）：呈現數據
I — Impact（影響/行動）：說明含義和建議

範例：
S：「上個月我們的營收目標是 $3M。」
B：「實際達成 $2.4M，缺口 20%。
    進一步分析發現，3C 品類下降 35%，
    主要因為旗艦機種缺貨。」
I：「建議提前 2 週備貨，並在缺貨時
    推送替代機種推薦，預計可挽回 $300K。」
```

### Pyramid Principle（金字塔原理）

```
         核心觀點
        ╱    │    ╲
   論點 1   論點 2   論點 3
   ╱  ╲    ╱  ╲    ╱  ╲
 數據 數據 數據 數據 數據 數據

由上而下的邏輯結構：
1. 先說結論（So What）
2. 再給 3 個支撐論點
3. 每個論點都有數據佐證

範例：
結論：建議投資 $500K 建立智慧推薦系統
├── 論點 1：可增加 15% 轉換率（A/B Test 數據）
├── 論點 2：預計年增收 $2M（Model 預估）
└── 論點 3：8 個月回收投資（ROI 分析）
```

### 用 Annotation 強調重點

```
在圖表上直接加入文字標註：

營收趨勢圖：
$3M ┤
    │                        ╱── 「新品上市
    │                    ╱──╱     帶動 30% 成長」
$2M ┤              ╱────╱
    │         ╱───╱
    │    ╱───╱
$1M ┤───╱── 「競品促銷
    │        導致 Q2 下滑」
    ├────┬────┬────┬────┬────
    Q1   Q2   Q3   Q4   Q1

重點：
- 直接標註重要轉折點
- 說明「為什麼」而非只是「是什麼」
- 引導讀者的注意力
```

### Presentation 技巧

```
1. 開場用一個數字
   「上個月我們流失了 350 個客戶。」

2. 漸進式揭露
   先空白圖 → 加入基準線 → 加入實際值 → 加入趨勢

3. 對比法
   「競爭對手轉換率 5%，我們只有 2.8%。」

4. 具象化
   「$500K 的損失，等於每天扔掉 $1,370。」

5. 收尾呼籲行動
   「如果我們現在行動，可以在 Q3 挽回 $300K。」
```

---

## 31-5：針對不同受眾的 Dashboard

### 受眾分析框架

| 面向 | CEO | VP/Director | Manager | Analyst |
|------|-----|------------|---------|---------|
| 關注點 | 整體業績、策略 | 部門績效、趨勢 | 日常營運、異常 | 細節、根因 |
| 時間範圍 | 年/季 | 月/季 | 週/日 | 即時 |
| 互動性 | 低（一頁摘要） | 中（可篩選） | 高（可鑽取） | 最高（探索） |
| 圖表複雜度 | 簡單 | 中等 | 中等 | 進階 |
| 更新頻率 | 月/季 | 週/月 | 日/週 | 即時 |

### CEO Dashboard 範例

```
一頁即可，最多 4-6 個指標：

┌────────┬────────┬────────┬────────┐
│Revenue │ Profit │ Growth │  NPS   │
│ $12M   │ $2.4M  │ +15%   │  42    │
│ ▲8%    │ ▲5%    │ Target │ ▲3 pts │
│        │        │ +20%   │        │
├────────┴────────┴────────┴────────┤
│       Revenue vs Target（月度）     │
│       ━━━━━━━━━━━━━━━━━━━━━━━━    │
├───────────────────┬────────────────┤
│  Revenue by BU    │  Top Risks     │
│  ████ Product A   │  🔴 Supply     │
│  ███  Product B   │  🟡 Talent     │
│  ██   Product C   │  🟢 Market     │
└───────────────────┴────────────────┘

設計重點：
- 不需要互動（Screenshot 也能看懂）
- 重點突出（大數字 + 顏色）
- 有目標對照
- 有風險提示
```

### Operations Dashboard 範例

```
即時監控，高度互動：

篩選器：日期範圍 | 地區 | 品類 | 通路

┌─────────────────────────────────────┐
│ 今日即時：                            │
│ 訂單數 1,247  │  GMV $1.2M  │  退貨 23│
├─────────────────────────────────────┤
│ 訂單處理狀態                          │
│ ■■■■■■■■■■□□  處理中: 85%             │
│ 待處理: 52   處理中: 180   已完成: 1015│
├──────────────────┬──────────────────┤
│ 各地區訂單量      │   異常警報         │
│ （Bar Chart）     │   🔴 倉庫 A 延遲   │
│                  │   🔴 支付失敗率↑    │
│                  │   🟡 庫存 P-301 低  │
├──────────────────┴──────────────────┤
│ 最近 24 小時訂單趨勢（Line Chart）     │
└─────────────────────────────────────┘

設計重點：
- 自動更新（即時或每 5 分鐘）
- 異常警報醒目
- 可鑽取細節（點擊看個別訂單）
- 有操作建議（不只是數字）
```

### Product Manager Dashboard 範例

```
功能使用分析：

┌────────┬────────┬────────┬────────┐
│ DAU    │ WAU    │Retention│Feature │
│ 12,000 │ 35,000 │ 42%    │Adoption│
│ ▲5%    │ ▲3%    │ ▼2%    │ 68%    │
├────────┴────────┴────────┴────────┤
│ User Funnel                        │
│ Visit → Sign Up → Activate → Pay  │
│ 100%    25%       15%        8%    │
├───────────────────┬────────────────┤
│ Feature Usage     │ Cohort         │
│ (Heatmap)        │ Retention      │
│                  │ (Color Matrix) │
└───────────────────┴────────────────┘
```

---

## 31-6：Executive Dashboard 完整案例

### 案例：SaaS 公司月度 Executive Dashboard

#### 設計過程

```
Step 1: 確認受眾和目的
- 受眾：CEO、CFO、VP Sales、VP Product
- 頻率：每月 Board Meeting
- 目的：追蹤公司整體健康度，識別需要介入的領域

Step 2: 選擇 KPI
- North Star Metric: MRR（Monthly Recurring Revenue）
- 財務：MRR, ARR, Burn Rate, Runway
- 成長：New MRR, Expansion MRR, Churn MRR
- 客戶：Customer Count, CAC, LTV, Churn Rate
- 產品：DAU, Feature Adoption, NPS
- 團隊：Headcount, Hiring Pipeline

Step 3: 設計 Layout
Step 4: 選擇工具（Tableau / Power BI / Looker）
Step 5: 建立資料連線
Step 6: Review & 迭代
```

#### Dashboard 設計

```
╔══════════════════════════════════════════════╗
║  SaaS Monthly Dashboard — March 2026        ║
╠══════════════════════════════════════════════╣
║                                              ║
║  MRR         ARR          Net Revenue        ║
║  $450K       $5.4M        Retention          ║
║  ▲ 8%        ▲ 8%         108%  ✅           ║
║                                              ║
║  ─── MRR Bridge ────────────────────────     ║
║  Starting MRR:     $417K                     ║
║  + New:            $28K   ████                ║
║  + Expansion:      $15K   ██                  ║
║  - Contraction:    -$5K   █                   ║
║  - Churn:          -$5K   █                   ║
║  = Ending MRR:     $450K                     ║
║                                              ║
║  ─── Customer Metrics ──────────────────     ║
║  Total Customers: 380  │  CAC: $2,500        ║
║  New This Month: 25    │  LTV: $18,000       ║
║  Churned: 8            │  LTV/CAC: 7.2x ✅   ║
║                                              ║
║  ─── Cohort Retention ──────────────────     ║
║       M1    M2    M3    M6    M12            ║
║  Jan  95%   88%   82%   70%   58%            ║
║  Feb  93%   85%   80%   ...                  ║
║  Mar  94%   87%   ...                        ║
║                                              ║
║  ─── Key Actions Needed ────────────────     ║
║  🔴 Churn rate ↑ from 1.8% to 2.1%          ║
║     → Root cause: Enterprise segment         ║
║     → Action: Schedule QBR with top 20       ║
║  🟡 CAC ↑ 15% due to paid channel cost      ║
║     → Action: Optimize ad spend              ║
║  🟢 NPS improved from 38 to 42              ║
║     → Continue current CS initiatives        ║
╚══════════════════════════════════════════════╝
```

#### 關鍵設計決策說明

```
1. MRR Bridge（瀑布圖）
   為什麼：CEO 最關心「MRR 從哪裡來、到哪裡去」
   比簡單的 MRR 數字更有 insight

2. LTV/CAC Ratio
   為什麼：SaaS 最重要的健康指標
   >3x = 健康，>5x = 優秀

3. Cohort Retention
   為什麼：比整體 Churn Rate 更能看出趨勢
   每個月入的客群是否越來越好或越來越差？

4. Key Actions
   為什麼：Dashboard 不只是數字，要告訴受眾「So What」
   每個紅燈都有對應的建議行動
```

#### 常用 BI 工具比較

| 工具 | 適合場景 | 學習曲線 | 成本 |
|------|---------|---------|------|
| Tableau | 企業級分析、探索型 | 中 | 高（$70/user/mo） |
| Power BI | 微軟生態系、報表 | 中低 | 低（$10/user/mo） |
| Looker | 資料驅動文化、大數據 | 高 | 高（企業定價） |
| Metabase | 小團隊、快速上手 | 低 | 免費（開源）/ 低 |
| Google Data Studio | 行銷分析、免費 | 低 | 免費 |
| Excel / Google Sheets | 臨時分析、小型報表 | 低 | 低 |

---

## Cheat Sheet：BI 與 Dashboard 速查表

### Dashboard 設計清單

```
☐ 確認受眾和目的
☐ 選擇 5-7 個核心 KPI
☐ 每個 KPI 有目標/基準對照
☐ 適當的圖表類型
☐ 一致的配色和字體
☐ 異常狀態醒目標示
☐ 資料來源和更新時間
☐ 行動建議（So What）
☐ Mobile Responsive（如適用）
☐ Stakeholder Review & Feedback
```

### 圖表選擇速查

```
比較 → Bar Chart
趨勢 → Line Chart
佔比 → Donut（≤5 類）
排名 → Horizontal Bar
目標 → Bullet Chart
轉換 → Funnel
相關 → Scatter
分佈 → Histogram
```

### 面試高頻問題

| 問題 | 回答重點 |
|------|---------|
| 如何設計 Dashboard？ | 受眾→目的→KPI→Layout→圖表→迭代 |
| Tableau vs Power BI？ | Tableau 探索力強；Power BI 與 MS 生態整合 |
| 什麼是 Data Storytelling？ | Data + Narrative + Visuals，三者缺一不可 |
| Dashboard 最多放幾個圖？ | 7±2，過多會分散注意力 |
| 如何選擇圖表？ | 根據你要表達的訊息（比較/趨勢/佔比/分佈） |
| 什麼是好的 KPI？ | SMART + 可行動 + 有目標對照 |

"""

    // MARK: - World 31 (en)
    private static let enWorld31 = """

# World 31: BI Tools and Dashboards

> Data by itself has no value. Data that can "tell a story" does. Dashboards are the core medium through which BAs present insights to stakeholders.

This chapter teaches you how to design impactful dashboards, rather than simply stacking charts together.

---

## 31-1: Dashboard Design Principles

### The Purpose of a Dashboard

```
Dashboard ≠ Report

Report: Answers "What happened?" → Retrospective
Dashboard: Answers "How are things right now? What action should be taken?" → Action-oriented
```

### Dashboard Classification

| Type | Purpose | Update Frequency | Audience | Example |
|------|---------|-----------------|----------|---------|
| Strategic | Long-term trends, goal tracking | Monthly/Quarterly | C-level | Annual KPI Dashboard |
| Operational | Daily monitoring, real-time status | Real-time/Daily | Operations team | Order Processing Dashboard |
| Analytical | Deep analysis, insight exploration | On demand | Analysts | User Behavior Analysis |
| Tactical | Mid-term tracking, project progress | Weekly | Mid-level managers | Sprint Dashboard |

### Five Core Design Principles

```
1. One Dashboard, One Purpose
   ❌ Cramming all KPIs onto one page
   ✅ "This dashboard helps role X make decision Y"

2. The 5-Second Rule
   → Within 5 seconds of seeing the dashboard, you know if things are good or bad
   → Use color and large fonts to highlight key numbers

3. Information Hierarchy
   → Level 1: Most important KPIs (largest, top position)
   → Level 2: Supporting sub-dimensions
   → Level 3: Detail data (interactive drill-down)

4. Reduce Cognitive Load
   → Maximum 7±2 charts
   → Consistent colors and fonts
   → Avoid 3D charts and excessive decoration

5. Design for Action
   → Every metric has a corresponding action implication
   → Include target lines / alert thresholds
   → Anomalies should be obvious at a glance
```

### Common Layout Patterns

```
Pattern 1: Z-Pattern (Most Common)
┌────────────┬────────────┬────────────┐
│   KPI 1    │   KPI 2    │   KPI 3    │  ← Core numbers
├────────────┴────────────┴────────────┤
│          Main Trend Chart             │  ← Primary chart
├──────────────────┬───────────────────┤
│  Sub-dimension 1  │  Sub-dimension 2  │  ← Supporting
├──────────────────┴───────────────────┤
│              Detail Table             │  ← Details
└──────────────────────────────────────┘

Pattern 2: Focal Point
┌──────────────────────────────────────┐
│           Core Large Number           │
├──────────────────────────────────────┤
│             Trend Chart               │
├────────────┬─────────┬───────────────┤
│ Dimension 1│ Dim. 2  │  Dimension 3  │
└────────────┴─────────┴───────────────┘

Pattern 3: Left Filter, Right Chart
┌─────────┬────────────────────────────┐
│ Filters  │                            │
│ ──────  │       Main Chart Area       │
│ Time     │                            │
│ Region   ├──────────┬─────────────────┤
│ Category │  Chart 2  │     Chart 3     │
│ ...     │          │                 │
└─────────┴──────────┴─────────────────┘
```

### Color Principles

```
1. Semantic Colors
   - Green = Positive / On target
   - Red = Negative / Warning
   - Yellow = Caution / Approaching threshold
   - Gray = Neutral / Background

2. Brand Color Palette
   - 1-2 primary colors, 2-3 secondary colors
   - Avoid more than 5 colors

3. Data Color Scales
   - Gradient: Represents magnitude (light → dark)
   - Categorical: Represents different categories (distinct from each other)

4. Accessibility Design
   - Don't rely solely on color to convey information
   - Add text labels or patterns
   - Consider colorblind-friendly palettes
```

---

## 31-2: KPI Visualization

### KPI Card Design

```
A Good KPI Card Contains:
┌─────────────────────────┐
│ Monthly Revenue          │  ← Title
│                          │
│     $2.4M                │  ← Current value (large font)
│     ▲ 12% vs last month  │  ← Change rate (with direction)
│     Target: $2.5M        │  ← Target value
│     ━━━━━━━━━━━━━▓░░     │  ← Progress bar (96%)
└─────────────────────────┘

Elements:
1. Metric name (clear, unambiguous)
2. Current value (largest font)
3. Comparison baseline (vs prior period, vs target, vs budget)
4. Trend direction (up/down arrows)
5. Visual cue (progress bar, Sparkline, RAG color)
```

### Common KPIs and Visualization Methods

| KPI | Best Visualization | Description |
|-----|-------------------|-------------|
| Revenue / GMV | KPI Card + Line Chart | Big number + trend |
| Conversion Rate | Funnel Chart | Step-by-step conversion |
| Customer Satisfaction | Gauge Chart | Dashboard-style |
| Market Share | Pie / Donut Chart | Proportion |
| Goal Achievement Rate | Bullet Chart | Actual vs target |
| Department Performance | Horizontal Bar | Ranking comparison |
| Monthly Trend | Line Chart | Time series |
| Category Distribution | Treemap | Hierarchical proportion |

### Bullet Chart

```
Best visualization for performance target tracking:

Revenue  ████████████████████▓░░░░░  $2.4M / $2.5M (96%)
Orders   ████████████████████████▓░  4,800 / 5,000 (96%)
NPS      ██████████████████████████  45 / 40 (113%) ✓
Churn    ████████████▓░░░░░░░░░░░░░  4.8% / 3.5% (Warning!)

Components:
- Black bar = Actual value
- Gray zones = Ranges (Poor / Fair / Good)
- Marker line = Target value
```

### Sparkline (Mini Trend Chart)

```
Small trend charts embedded in KPI Cards or tables.

Revenue: $2.4M  ╱╲╱──╱╲╱╱╲──╱  ▲12%
Orders:  4,800  ──╱╲──╱╲╱──╱╲  ▲8%
AOV:     $500   ╲──╱──╱──╱╲╲─  ▼3%

Use case: Display both current value and trend in limited space
```

---

## 31-3: Chart Selection Guide

### Choose Charts Based on "What You Want to Express"

| Purpose | Recommended Chart | Description |
|---------|------------------|-------------|
| Compare values | Bar Chart | Compare values across categories |
| Time trend | Line Chart | Changes over time |
| Composition | Pie / Donut / Stacked Bar | Parts of a whole |
| Correlation | Scatter Plot | Relationship between two variables |
| Distribution | Histogram / Box Plot | Data spread |
| Geographic distribution | Map / Choropleth | Geographic differences |
| Process conversion | Funnel / Sankey | Flow between steps |
| Ranking | Horizontal Bar | Sorted high to low |
| Target tracking | Bullet / Gauge | Actual vs target |
| Hierarchical proportion | Treemap / Sunburst | Multi-level size comparison |

### Chart Do's & Don'ts

```
✅ Do:
- Start Y-axis from 0 (Bar Chart)
- Use consistent time intervals
- Label data source and last updated time
- Add data labels directly on the chart (reduce Legend dependency)
- Sort (Bar Chart from largest to smallest)

❌ Don't:
- Use 3D charts (distorts proportions)
- Pie Chart with more than 5 categories
- Dual Y-axis (easily misleading)
- Excessive gridlines and borders
- Use area to represent length (area perception is inaccurate)
- Truncate Y-axis to exaggerate differences
```

### Common Mistakes with Examples

```
Mistake 1: Pie Chart with 12 categories
→ Fix: Show only Top 5, combine the rest into "Other"

Mistake 2: Bar Chart Y-axis starting at 95%
→ Fix: Start from 0%, or use a Line Chart to emphasize change

Mistake 3: Line Chart used for non-time-series categorical data
→ Fix: Use a Bar Chart instead

Mistake 4: Area chart comparing absolute values
→ Fix: Use a Bar Chart or Stacked Chart

Mistake 5: Rainbow color scheme
→ Fix: Use monochrome gradient or brand colors
```

### Chart Selection Decision Tree

```
What do you want to express?
├── Comparison
│   ├── Different categories → Bar Chart
│   ├── Over time → Line Chart
│   └── Ranking → Horizontal Bar (sorted)
├── Composition
│   ├── Simple proportion (≤5 categories) → Donut Chart
│   ├── Composition change over time → Stacked Bar / 100% Stacked Bar
│   └── Multi-level → Treemap
├── Trend
│   ├── Single metric → Line Chart
│   ├── Multiple metric comparison → Multi-line Chart
│   └── With range → Area Chart
├── Correlation
│   ├── Two variables → Scatter Plot
│   └── Three variables → Bubble Chart
└── Distribution
    ├── Single variable → Histogram
    └── Multiple group comparison → Box Plot
```

---

## 31-4: Data Storytelling

### Three Elements of Data Storytelling

```
        Data
       ╱    ╲
      ╱      ╲
 Narrative ── Visuals

Data: Accurate data and analysis
Narrative: Clear storyline and insights
Visuals: Appropriate visualization

All three are indispensable.
```

### Story Structure: SBI Framework

```
S — Situation: Set the context
B — Behavior/Finding: Present the data
I — Impact/Action: Explain the implications and recommendations

Example:
S: "Last month, our revenue target was $3M."
B: "We achieved $2.4M, a 20% shortfall.
    Further analysis reveals a 35% decline in the electronics category,
    primarily due to flagship product stockout."
I: "Recommend pre-stocking 2 weeks earlier and pushing
    alternative product recommendations during stockouts.
    Estimated recovery: $300K."
```

### Pyramid Principle

```
         Core Argument
        ╱    │    ╲
  Point 1   Point 2   Point 3
   ╱  ╲    ╱  ╲    ╱  ╲
 Data Data Data Data Data Data

Top-down logical structure:
1. State the conclusion first (So What)
2. Provide 3 supporting points
3. Each point backed by data

Example:
Conclusion: Recommend investing $500K in a smart recommendation system
├── Point 1: Can increase conversion rate by 15% (A/B Test data)
├── Point 2: Projected annual revenue increase of $2M (Model estimate)
└── Point 3: 8-month payback period (ROI analysis)
```

### Using Annotations to Highlight Key Points

```
Add text annotations directly on the chart:

Revenue Trend Chart:
$3M ┤
    │                        ╱── "New product launch
    │                    ╱──╱     drove 30% growth"
$2M ┤              ╱────╱
    │         ╱───╱
    │    ╱───╱
$1M ┤───╱── "Competitor promotion
    │        caused Q2 decline"
    ├────┬────┬────┬────┬────
    Q1   Q2   Q3   Q4   Q1

Key points:
- Annotate important turning points directly
- Explain "why" not just "what"
- Guide the reader's attention
```

### Presentation Techniques

```
1. Open with a number
   "Last month we lost 350 customers."

2. Progressive reveal
   Start with blank chart → Add baseline → Add actual values → Add trend

3. Contrast method
   "Our competitor's conversion rate is 5%, ours is only 2.8%."

4. Make it tangible
   "$500K in losses equals throwing away $1,370 every day."

5. Close with a call to action
   "If we act now, we can recover $300K by Q3."
```

---

## 31-5: Dashboards for Different Audiences

### Audience Analysis Framework

| Aspect | CEO | VP/Director | Manager | Analyst |
|--------|-----|------------|---------|---------|
| Focus | Overall performance, strategy | Department performance, trends | Daily operations, anomalies | Details, root cause |
| Time Range | Year/Quarter | Month/Quarter | Week/Day | Real-time |
| Interactivity | Low (one-page summary) | Medium (filterable) | High (drill-down) | Highest (exploratory) |
| Chart Complexity | Simple | Medium | Medium | Advanced |
| Update Frequency | Monthly/Quarterly | Weekly/Monthly | Daily/Weekly | Real-time |

### CEO Dashboard Example

```
One page is sufficient, maximum 4-6 metrics:

┌────────┬────────┬────────┬────────┐
│Revenue │ Profit │ Growth │  NPS   │
│ $12M   │ $2.4M  │ +15%   │  42    │
│ ▲8%    │ ▲5%    │ Target │ ▲3 pts │
│        │        │ +20%   │        │
├────────┴────────┴────────┴────────┤
│       Revenue vs Target (Monthly)  │
│       ━━━━━━━━━━━━━━━━━━━━━━━━    │
├───────────────────┬────────────────┤
│  Revenue by BU    │  Top Risks     │
│  ████ Product A   │  RED: Supply   │
│  ███  Product B   │  YELLOW: Talent│
│  ██   Product C   │  GREEN: Market │
└───────────────────┴────────────────┘

Design highlights:
- No interaction needed (readable even as a screenshot)
- Key numbers prominent (large font + color)
- Target comparison included
- Risk alerts visible
```

### Operations Dashboard Example

```
Real-time monitoring, highly interactive:

Filters: Date Range | Region | Category | Channel

┌─────────────────────────────────────┐
│ Today Real-time:                     │
│ Orders 1,247  │  GMV $1.2M │Returns 23│
├─────────────────────────────────────┤
│ Order Processing Status              │
│ ■■■■■■■■■■□□  Processing: 85%        │
│ Pending: 52  Processing: 180         │
│ Completed: 1015                      │
├──────────────────┬──────────────────┤
│ Orders by Region  │   Alerts         │
│ (Bar Chart)      │   RED: Warehouse  │
│                  │     A delayed     │
│                  │   RED: Payment    │
│                  │     failure rate↑ │
│                  │   YELLOW: Low     │
│                  │     stock P-301   │
├──────────────────┴──────────────────┤
│ Last 24-Hour Order Trend (Line)      │
└─────────────────────────────────────┘

Design highlights:
- Auto-refreshing (real-time or every 5 minutes)
- Alerts are prominent
- Drill-down to details (click to see individual orders)
- Includes operational recommendations (not just numbers)
```

### Product Manager Dashboard Example

```
Feature Usage Analysis:

┌────────┬────────┬────────┬────────┐
│ DAU    │ WAU    │Retention│Feature │
│ 12,000 │ 35,000 │ 42%    │Adoption│
│ ▲5%    │ ▲3%    │ ▼2%    │ 68%    │
├────────┴────────┴────────┴────────┤
│ User Funnel                        │
│ Visit → Sign Up → Activate → Pay  │
│ 100%    25%       15%        8%    │
├───────────────────┬────────────────┤
│ Feature Usage     │ Cohort         │
│ (Heatmap)        │ Retention      │
│                  │ (Color Matrix) │
└───────────────────┴────────────────┘
```

---

## 31-6: Executive Dashboard Complete Case Study

### Case: SaaS Company Monthly Executive Dashboard

#### Design Process

```
Step 1: Confirm audience and purpose
- Audience: CEO, CFO, VP Sales, VP Product
- Frequency: Monthly Board Meeting
- Purpose: Track overall company health, identify areas needing intervention

Step 2: Select KPIs
- North Star Metric: MRR (Monthly Recurring Revenue)
- Financial: MRR, ARR, Burn Rate, Runway
- Growth: New MRR, Expansion MRR, Churn MRR
- Customer: Customer Count, CAC, LTV, Churn Rate
- Product: DAU, Feature Adoption, NPS
- Team: Headcount, Hiring Pipeline

Step 3: Design Layout
Step 4: Select tool (Tableau / Power BI / Looker)
Step 5: Set up data connections
Step 6: Review & Iterate
```

#### Dashboard Design

```
╔══════════════════════════════════════════════╗
║  SaaS Monthly Dashboard — March 2026        ║
╠══════════════════════════════════════════════╣
║                                              ║
║  MRR         ARR          Net Revenue        ║
║  $450K       $5.4M        Retention          ║
║  ▲ 8%        ▲ 8%         108%  ✅           ║
║                                              ║
║  ─── MRR Bridge ────────────────────────     ║
║  Starting MRR:     $417K                     ║
║  + New:            $28K   ████                ║
║  + Expansion:      $15K   ██                  ║
║  - Contraction:    -$5K   █                   ║
║  - Churn:          -$5K   █                   ║
║  = Ending MRR:     $450K                     ║
║                                              ║
║  ─── Customer Metrics ──────────────────     ║
║  Total Customers: 380  │  CAC: $2,500        ║
║  New This Month: 25    │  LTV: $18,000       ║
║  Churned: 8            │  LTV/CAC: 7.2x ✅   ║
║                                              ║
║  ─── Cohort Retention ──────────────────     ║
║       M1    M2    M3    M6    M12            ║
║  Jan  95%   88%   82%   70%   58%            ║
║  Feb  93%   85%   80%   ...                  ║
║  Mar  94%   87%   ...                        ║
║                                              ║
║  ─── Key Actions Needed ────────────────     ║
║  RED: Churn rate increased from 1.8% to 2.1% ║
║     → Root cause: Enterprise segment         ║
║     → Action: Schedule QBR with top 20       ║
║  YELLOW: CAC up 15% due to paid channel cost ║
║     → Action: Optimize ad spend              ║
║  GREEN: NPS improved from 38 to 42           ║
║     → Continue current CS initiatives        ║
╚══════════════════════════════════════════════╝
```

#### Key Design Decision Rationale

```
1. MRR Bridge (Waterfall Chart)
   Why: CEO cares most about "where MRR comes from and where it goes"
   More insightful than a simple MRR number

2. LTV/CAC Ratio
   Why: The most important health metric for SaaS
   >3x = Healthy, >5x = Excellent

3. Cohort Retention
   Why: More revealing than overall Churn Rate
   Are newer cohorts performing better or worse?

4. Key Actions
   Why: A dashboard isn't just numbers; it tells the audience "So What"
   Every red flag has a corresponding recommended action
```

#### Common BI Tool Comparison

| Tool | Best For | Learning Curve | Cost |
|------|----------|---------------|------|
| Tableau | Enterprise analytics, exploratory | Medium | High ($70/user/mo) |
| Power BI | Microsoft ecosystem, reporting | Medium-Low | Low ($10/user/mo) |
| Looker | Data-driven culture, big data | High | High (enterprise pricing) |
| Metabase | Small teams, quick setup | Low | Free (open source) / Low |
| Google Data Studio | Marketing analytics, free | Low | Free |
| Excel / Google Sheets | Ad-hoc analysis, small reports | Low | Low |

---

## Cheat Sheet: BI and Dashboard Quick Reference

### Dashboard Design Checklist

```
☐ Confirm audience and purpose
☐ Select 5-7 core KPIs
☐ Each KPI has a target/benchmark comparison
☐ Appropriate chart types
☐ Consistent colors and fonts
☐ Anomalies prominently highlighted
☐ Data source and last updated time
☐ Action recommendations (So What)
☐ Mobile Responsive (if applicable)
☐ Stakeholder Review & Feedback
```

### Chart Selection Quick Reference

```
Comparison → Bar Chart
Trend → Line Chart
Proportion → Donut (≤5 categories)
Ranking → Horizontal Bar
Target → Bullet Chart
Conversion → Funnel
Correlation → Scatter
Distribution → Histogram
```

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| How to design a Dashboard? | Audience → Purpose → KPIs → Layout → Charts → Iterate |
| Tableau vs Power BI? | Tableau: stronger exploration; Power BI: MS ecosystem integration |
| What is Data Storytelling? | Data + Narrative + Visuals, all three are indispensable |
| Maximum charts on a Dashboard? | 7±2; too many dilutes attention |
| How to choose a chart? | Based on what you want to express (comparison/trend/proportion/distribution) |
| What makes a good KPI? | SMART + Actionable + Has target comparison |

"""

    // MARK: - World 32 (zh)
    private static let zhWorld32 = """

# World 32：系統分析基礎

> BA 不需要會寫 Code，但必須理解系統是怎麼運作的。這樣才能跟工程師有效溝通，寫出可實作的需求。

這一章教你「剛好夠用」的技術知識，讓你在面試和工作中都能跟工程團隊對話。

---

## 32-1：系統工作流程分析

### 系統是怎麼運作的？

```
用戶操作
  ↓
前端（Frontend）
  ↓ HTTP Request
後端（Backend / Server）
  ↓ SQL Query
資料庫（Database）
  ↓ Data
後端（處理邏輯）
  ↓ HTTP Response
前端（呈現結果）
  ↓
用戶看到結果
```

### 三層架構（Three-Tier Architecture）

| 層級 | 名稱 | 負責 | 技術範例 |
|------|------|------|---------|
| Presentation | 前端 / UI | 用戶介面、互動 | React, Vue, HTML/CSS |
| Business Logic | 後端 / Server | 商業邏輯、驗證 | Node.js, Python, Java |
| Data | 資料庫 | 資料存儲、查詢 | MySQL, PostgreSQL, MongoDB |

### 流程圖（Process Flow）範例：電商下單

```
用戶瀏覽商品
    ↓
加入購物車
    ↓
點擊結帳
    ↓
┌─ 已登入？──→ 否 ──→ 登入/註冊 ──┐
│     是                            │
│     ↓                             │
│  選擇配送方式                      │
│     ↓                             │
│  填寫收件資訊                      │
│     ↓                             │
│  選擇付款方式                      │
│     ↓                             │
│  確認訂單                          │
│     ↓                             │
│  ┌─ 付款成功？                     │
│  │   是 → 建立訂單 → 發確認信      │
│  │   否 → 顯示錯誤 → 重試          │
│  └──────────────────────────────  │
└──────────────────────────────────┘
```

### Sequence Diagram（時序圖）

```
用戶          前端          後端          資料庫        支付 API
 │             │             │             │             │
 │──點擊結帳──→│             │             │             │
 │             │──POST /order→│             │             │
 │             │             │──查庫存──────→│             │
 │             │             │←──庫存資料───│             │
 │             │             │                           │
 │             │             │──建立訂單───→│             │
 │             │             │←──訂單 ID───│             │
 │             │             │                           │
 │             │             │──請求扣款────────────────→│
 │             │             │←──扣款結果───────────────│
 │             │             │                           │
 │             │←─訂單成功───│             │             │
 │←─顯示結果──│             │             │             │
```

### BA 需要關注的系統面向

```
1. Happy Path：正常流程
2. Exception Path：異常處理（付款失敗、庫存不足）
3. Edge Cases：邊界情況（同時下單、超大訂單）
4. Error Messages：錯誤訊息（對用戶友善）
5. Audit Trail：操作記錄（誰在什麼時間做了什麼）
6. Data Validation：資料驗證（前端 + 後端雙重驗證）
```

---

## 32-2：資料庫基礎（給 BA 的版本）

### 為什麼 BA 需要懂資料庫？

```
1. 寫需求時需要定義資料欄位
2. 做分析需要理解資料結構
3. 跟工程師溝通 Data Model
4. 設計報表時需要知道資料從哪來
```

### 關聯式資料庫基本概念

| 概念 | 說明 | 類比 |
|------|------|------|
| Table | 資料表 | Excel 工作表 |
| Row / Record | 一筆資料 | Excel 一列 |
| Column / Field | 一個欄位 | Excel 一欄 |
| Primary Key (PK) | 唯一識別碼 | 身分證字號 |
| Foreign Key (FK) | 關聯其他表的 Key | 引用其他表的 ID |
| Schema | 資料庫結構 | 表格的設計圖 |

### Entity-Relationship Diagram（ERD）

```
┌──────────┐     1:N     ┌──────────┐
│ Customer │─────────────│  Order   │
├──────────┤             ├──────────┤
│ *id (PK) │             │ *id (PK) │
│ name     │             │ customer_│
│ email    │             │   id (FK)│
│ phone    │             │ date     │
│ city     │             │ total    │
│ created  │             │ status   │
└──────────┘             └──────────┘
                              │ 1:N
                              │
                         ┌──────────┐     N:1     ┌──────────┐
                         │OrderItem │─────────────│ Product  │
                         ├──────────┤             ├──────────┤
                         │ *id (PK) │             │ *id (PK) │
                         │ order_id │             │ name     │
                         │   (FK)   │             │ price    │
                         │ product_ │             │ category │
                         │   id(FK) │             │ stock    │
                         │ quantity │             └──────────┘
                         │ price    │
                         └──────────┘

關係類型：
1:1 — 一對一（User ↔ Profile）
1:N — 一對多（Customer → Orders）
N:N — 多對多（Student ↔ Course，需中間表）
```

### 正規化（Normalization）簡要概念

```
為什麼要正規化？避免資料重複和更新異常。

❌ 未正規化：
| 訂單ID | 客戶名 | 客戶電話 | 商品1 | 商品2 | 商品3 |
|--------|--------|---------|-------|-------|-------|
| 001    | Alice  | 0912... | 滑鼠  | 鍵盤  |       |
| 002    | Alice  | 0912... | 螢幕  |       |       |

問題：Alice 改電話要改很多筆、商品數量不固定

✅ 正規化後：
Customer 表、Order 表、OrderItem 表各自獨立
→ Alice 資料只存一處
→ 商品數量不受限制
```

### SQL vs NoSQL

| 面向 | SQL（關聯式） | NoSQL（非關聯式） |
|------|-------------|-----------------|
| 結構 | 固定 Schema | 彈性 Schema |
| 資料格式 | 表格 | JSON / Key-Value / Graph |
| 關聯 | JOIN 查詢 | 嵌套文件或引用 |
| 擴展 | 垂直擴展為主 | 水平擴展為主 |
| 適用場景 | 交易型、報表 | 大數據、即時、彈性 |
| 代表 | MySQL, PostgreSQL | MongoDB, Redis, DynamoDB |

### BA 在資料建模中的角色

```
1. 定義 Entity（實體）：有哪些主要資料物件？
2. 定義 Attributes（屬性）：每個物件有哪些欄位？
3. 定義 Relationships（關係）：物件之間怎麼關聯？
4. 定義 Business Rules（規則）：什麼約束？什麼驗證？
5. 與工程師一起 Review Data Model
```

---

## 32-3：API 基礎概念

### 什麼是 API？

```
API（Application Programming Interface）
= 系統之間溝通的「規格」

類比：餐廳點餐
- 你（前端）看菜單（API 文件）
- 跟服務生（API）點餐（Request）
- 廚房（後端）做菜
- 服務生送餐（Response）給你
```

### RESTful API 基礎

```
REST = Representational State Transfer
HTTP Method + URL + Body

常用 HTTP Methods：
| Method | 用途 | 範例 |
|--------|------|------|
| GET    | 讀取 | GET /api/orders → 取得所有訂單 |
| POST   | 新增 | POST /api/orders → 建立新訂單 |
| PUT    | 更新（全部） | PUT /api/orders/123 → 更新訂單 |
| PATCH  | 更新（部分） | PATCH /api/orders/123 → 修改部分欄位 |
| DELETE | 刪除 | DELETE /api/orders/123 → 刪除訂單 |
```

### API Request / Response 範例

```
Request（請求）:
POST /api/orders
Headers:
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJI...
Body:
{
  "customer_id": 42,
  "items": [
    { "product_id": 101, "quantity": 2 },
    { "product_id": 203, "quantity": 1 }
  ],
  "shipping_address": "台北市信義區信義路五段7號"
}

Response（回應）— 成功:
Status: 201 Created
{
  "order_id": 10567,
  "status": "pending",
  "total": 1590,
  "created_at": "2026-03-15T14:30:00Z"
}

Response（回應）— 失敗:
Status: 400 Bad Request
{
  "error": "INSUFFICIENT_STOCK",
  "message": "Product 101 only has 1 in stock",
  "details": { "product_id": 101, "available": 1, "requested": 2 }
}
```

### HTTP Status Codes（BA 必知）

| Code | 意義 | BA 關注點 |
|------|------|----------|
| 200 | OK | 成功 |
| 201 | Created | 新增成功 |
| 400 | Bad Request | 請求格式錯誤（前端驗證問題） |
| 401 | Unauthorized | 未登入 |
| 403 | Forbidden | 沒有權限 |
| 404 | Not Found | 資源不存在 |
| 409 | Conflict | 衝突（如重複建立） |
| 422 | Unprocessable | 驗證失敗（商業規則） |
| 500 | Server Error | 後端出錯（需通知工程師） |
| 503 | Service Unavailable | 服務暫停 |

### BA 如何使用 API 知識？

```
1. 撰寫 FRD 時定義 API 的輸入/輸出
2. 與工程師討論系統整合方案
3. 理解第三方 API 的限制（Rate Limit、費用）
4. 測試 API 時使用 Postman 等工具
5. 設計錯誤處理的用戶體驗
```

---

## 32-4：系統整合點分析

### 什麼是系統整合？

```
將兩個或多個獨立系統連接起來，讓資料可以流通。

電商系統的整合點：
┌─────────┐     ┌──────────┐     ┌─────────┐
│ EC 平台  │────→│ 支付閘道  │────→│ 銀行系統 │
└─────────┘     └──────────┘     └─────────┘
     │               │
     ↓               ↓
┌─────────┐     ┌──────────┐
│ 物流系統  │     │ 會計系統  │
└─────────┘     └──────────┘
     │
     ↓
┌─────────┐
│ 通知系統  │（Email / SMS / Push）
└─────────┘
```

### 整合模式

| 模式 | 說明 | 適用場景 | 範例 |
|------|------|---------|------|
| Point-to-Point | 直接對接 | 系統少、簡單 | 前端直接呼叫 API |
| Hub-and-Spoke | 中央樞紐 | 多系統整合 | ESB（Enterprise Service Bus） |
| Pub/Sub | 發布/訂閱 | 事件驅動 | 訂單建立 → 通知多個系統 |
| Batch | 批次處理 | 非即時需求 | 每晚同步銷售資料到會計系統 |
| API Gateway | 統一入口 | 微服務架構 | 所有 API 透過 Gateway 路由 |

### 整合分析清單

```
對每個整合點，BA 需要確認：

1. 資料流向
   → 單向或雙向？
   → 誰是來源（Source）、誰是目的（Target）？

2. 頻率
   → 即時（Real-time）還是批次（Batch）？
   → 批次的話，多久一次？

3. 資料格式
   → JSON、XML、CSV？
   → 編碼（UTF-8）？

4. 資料量
   → 預期每天/每小時多少筆？
   → 高峰期的量是平常的幾倍？

5. 錯誤處理
   → 對方系統掛掉怎麼辦？
   → 資料傳送失敗要重試幾次？
   → 需要人工介入的情境？

6. 安全性
   → 認證方式（API Key、OAuth）？
   → 資料加密（HTTPS、TLS）？
   → 敏感資料遮罩？

7. SLA
   → 回應時間要求？
   → 可用性要求？
   → 有無 Rate Limit？
```

### 整合需求文件範例

```
Integration: EC 平台 → 物流系統

方向：單向（EC → 物流）
觸發：訂單狀態變為「已付款」時
頻率：即時
格式：JSON via REST API

資料欄位映射：
| EC 平台欄位 | 物流系統欄位 | 轉換規則 |
|------------|------------|---------|
| order_id | shipment_ref | 加前綴 "EC-" |
| customer.name | recipient_name | 直接對應 |
| customer.phone | recipient_phone | 去除 +886 |
| customer.address | delivery_address | 直接對應 |
| items[].name | package_items | 合併為字串 |
| total_weight | package_weight | 公克→公斤 |

錯誤處理：
| 錯誤碼 | 處理方式 |
|--------|---------|
| 連線逾時 | 重試 3 次，間隔 5 秒 |
| 400 格式錯誤 | 記錄 Log，通知 BA 檢查 |
| 500 物流端錯誤 | 重試 3 次，失敗後進入人工處理佇列 |
| 地址無法辨識 | 標記訂單「待確認地址」，通知客服 |
```

---

## 32-5：認證、角色與權限

### 認證（Authentication）vs 授權（Authorization）

| 面向 | Authentication（認證） | Authorization（授權） |
|------|----------------------|---------------------|
| 問題 | 你是誰？ | 你能做什麼？ |
| 驗證 | 帳號密碼、SSO、MFA | 角色權限、ACL |
| 時機 | 登入時 | 每次操作時 |
| 範例 | 輸入帳密登入 | 主管可以審核，員工只能提交 |

### 常見認證方式

| 方式 | 說明 | 適用場景 |
|------|------|---------|
| Username + Password | 傳統帳密 | 一般 Web 應用 |
| SSO（Single Sign-On） | 一組帳號登入多系統 | 企業內部系統 |
| OAuth 2.0 | 第三方授權登入 | 「用 Google 帳號登入」 |
| MFA（Multi-Factor） | 多因子驗證 | 高安全性需求 |
| JWT（JSON Web Token） | Token 驗證 | Stateless API |

### RBAC（Role-Based Access Control）

```
角色定義範例（電商後台）：

角色結構：
Super Admin
  ├── Admin
  │     ├── Product Manager
  │     ├── Order Manager
  │     └── Customer Service
  ├── Finance
  └── Marketing
```

### 權限矩陣

| 功能 | Super Admin | Admin | Product Mgr | Order Mgr | CS | Finance |
|------|------------|-------|------------|-----------|-----|---------|
| 用戶管理 | CRUD | CRU | - | - | R | - |
| 商品管理 | CRUD | CRUD | CRUD | R | R | R |
| 訂單管理 | CRUD | CRUD | R | CRUD | RU | R |
| 退款審核 | CRUD | CRU | - | R | CR | RU |
| 報表查看 | R | R | R（商品） | R（訂單） | R（客服） | R（全部） |
| 系統設定 | CRUD | R | - | - | - | - |

```
C = Create, R = Read, U = Update, D = Delete
- = 無權限
```

### 權限需求撰寫範例

```
FR-AUTH-001: 角色管理

描述：Super Admin 可以建立、修改、刪除角色，
並為每個角色指定功能權限。

規則：
1. 預設角色（Super Admin, Admin）不可刪除
2. 自訂角色名稱不可重複
3. 角色權限變更即時生效（不需重新登入）
4. 刪除角色前需確認無用戶綁定

FR-AUTH-002: 資料層級權限

描述：用戶只能看到所屬部門的資料。

範例：
- 北區業務只能看北區的訂單和客戶
- 總部可以看所有地區
- 主管可以看下屬的資料

實作方式（Row-Level Security）：
每筆資料標記 department_id，
查詢時自動加入 WHERE department_id = user.department_id
```

### 安全性需求清單

```
BA 在寫需求時需考慮的安全項目：

☐ 密碼規則（最少長度、複雜度、過期策略）
☐ 登入失敗鎖定（5 次失敗鎖定 30 分鐘）
☐ Session 過期（閒置 30 分鐘自動登出）
☐ 敏感操作需二次驗證（如退款、刪除）
☐ 操作日誌（Audit Log）
☐ 個資保護（手機/Email 部分遮罩）
☐ 資料加密（傳輸中 HTTPS、儲存時加密）
☐ GDPR / 個資法合規（資料刪除權）
```

---

## 32-6：系統分析綜合案例

### 案例：設計線上預約系統

#### 需求背景

```
情境：一家連鎖診所要建立線上預約系統
用戶：病患、醫師、櫃台人員、系統管理員
功能：線上預約、管理看診時段、通知提醒
```

#### 1. System Context Diagram

```
                ┌──────────┐
    病患 ──────→│          │──────→ Email/SMS
                │ 預約系統  │
    醫師 ──────→│          │──────→ 行事曆
                │          │
    櫃台 ──────→│          │←─────→ 健保系統
                └──────────┘
                     ↕
                ┌──────────┐
                │ 病歷系統  │
                └──────────┘
```

#### 2. Entity Relationship Diagram

```
┌──────────┐  1:N  ┌──────────┐  N:1  ┌──────────┐
│ Patient  │──────→│Appointment│←──────│ Doctor   │
├──────────┤       ├──────────┤       ├──────────┤
│ *id      │       │ *id      │       │ *id      │
│ name     │       │ patient_ │       │ name     │
│ phone    │       │   id(FK) │       │ specialty│
│ email    │       │ doctor_  │       │ clinic_id│
│ birth    │       │   id(FK) │       │ bio      │
│ ID_number│       │ slot_id  │       └──────────┘
└──────────┘       │   (FK)   │
                   │ status   │  N:1  ┌──────────┐
                   │ notes    │──────→│ TimeSlot │
                   └──────────┘       ├──────────┤
                                      │ *id      │
                                      │ doctor_id│
                                      │ date     │
                                      │ start    │
                                      │ end      │
                                      │ available│
                                      └──────────┘
```

#### 3. 核心 API 設計

```
病患端：
GET  /api/doctors?specialty=家醫科     → 搜尋醫師
GET  /api/doctors/{id}/slots?date=...  → 查可預約時段
POST /api/appointments                 → 建立預約
DELETE /api/appointments/{id}          → 取消（需提前 2 小時）

醫師端：
GET   /api/doctors/me/appointments     → 今日看診清單
PATCH /api/appointments/{id}           → 更新看診紀錄
POST  /api/doctors/me/slots            → 設定可看診時段
```

#### 4. 角色權限

| 功能 | 病患 | 醫師 | 櫃台 | 管理員 |
|------|------|------|------|--------|
| 搜尋醫師 | R | - | R | R |
| 預約掛號 | CR | - | CRD | CRUD |
| 取消預約 | 自己的 | - | 全部 | 全部 |
| 查看看診清單 | 自己的 | 自己的 | 全部 | 全部 |
| 設定時段 | - | 自己的 | RU | CRUD |
| 管理醫師 | - | - | R | CRUD |
| 系統設定 | - | - | - | CRUD |

#### 5. 整合點

| 系統 | 用途 | 方式 | 注意 |
|------|------|------|------|
| Email/SMS | 預約通知、提醒 | Pub/Sub（事件驅動） | SendGrid / Twilio |
| 健保系統 | 身分驗證、就醫紀錄 | REST API（即時） | 維護時段處理 |
| 病歷系統 | 看診時調閱 | FHIR 標準 API | 嚴格存取控制 |
| Google Calendar | 醫師行事曆同步 | OAuth 2.0 | 時區處理 |

#### 6. 非功能需求

```
效能：
- 搜尋醫師回應時間 < 1 秒
- 預約操作回應時間 < 2 秒
- 支援 1,000 同時在線用戶

可用性：
- 99.9% Uptime
- 維護時段：週日凌晨 2-4 點

安全：
- 個資加密存儲
- 操作日誌保留 3 年
- 符合醫療個資規範

相容性：
- 支援 Chrome、Safari、Edge（最近兩個版本）
- 行動端 RWD（iOS Safari、Android Chrome）
```

---

## Cheat Sheet：系統分析速查表

### BA 必懂的技術詞彙

| 術語 | 白話解釋 |
|------|---------|
| API | 系統之間溝通的規格 |
| REST | 一種 API 設計風格 |
| JSON | 資料傳輸格式（像結構化的文字） |
| Database | 存資料的地方 |
| Schema | 資料庫的結構設計 |
| ERD | 畫出資料之間關係的圖 |
| Authentication | 驗證你是誰 |
| Authorization | 驗證你能做什麼 |
| RBAC | 用角色控制權限 |
| SLA | 服務品質的合約承諾 |
| Webhook | 事件發生時自動通知 |
| Microservices | 把大系統拆成小服務 |
| CI/CD | 自動化測試和部署 |
| Rate Limit | API 呼叫次數限制 |

### 系統分析流程

```
1. 理解業務流程 → Process Flow
2. 識別資料實體 → ERD
3. 定義 API 介面 → API Spec
4. 分析整合點 → Integration Map
5. 設計權限模型 → RBAC Matrix
6. 定義 NFR → Performance, Security, Scalability
7. 與工程 Review → Technical Feasibility
```

### 面試高頻問題

| 問題 | 回答重點 |
|------|---------|
| 系統架構怎麼理解？ | 三層架構：前端→後端→資料庫 |
| 什麼是 API？ | 系統之間的溝通介面，用 HTTP 方法操作資源 |
| ERD 怎麼畫？ | Entity + Attributes + Relationships |
| 認證 vs 授權？ | 認證=你是誰；授權=你能做什麼 |
| 系統整合要注意什麼？ | 資料流向、頻率、格式、錯誤處理、安全性 |
| 如何跟工程師溝通？ | 用流程圖、ERD、API 規格，說業務語言 |

"""

    // MARK: - World 32 (en)
    private static let enWorld32 = """

# World 32: System Analysis Fundamentals

> A BA doesn't need to write code, but must understand how systems work. This enables effective communication with engineers and writing implementable requirements.

This chapter teaches you "just enough" technical knowledge to hold conversations with engineering teams in both interviews and on the job.

---

## 32-1: System Workflow Analysis

### How Does a System Work?

```
User Action
  ↓
Frontend
  ↓ HTTP Request
Backend / Server
  ↓ SQL Query
Database
  ↓ Data
Backend (Processing Logic)
  ↓ HTTP Response
Frontend (Render Result)
  ↓
User Sees Result
```

### Three-Tier Architecture

| Layer | Name | Responsibility | Technology Examples |
|-------|------|---------------|-------------------|
| Presentation | Frontend / UI | User interface, interaction | React, Vue, HTML/CSS |
| Business Logic | Backend / Server | Business logic, validation | Node.js, Python, Java |
| Data | Database | Data storage, querying | MySQL, PostgreSQL, MongoDB |

### Process Flow Example: E-Commerce Order Placement

```
User browses products
    ↓
Add to cart
    ↓
Click checkout
    ↓
┌─ Logged in? ──→ No ──→ Login/Register ──┐
│     Yes                                  │
│     ↓                                    │
│  Select shipping method                  │
│     ↓                                    │
│  Enter delivery information              │
│     ↓                                    │
│  Select payment method                   │
│     ↓                                    │
│  Confirm order                           │
│     ↓                                    │
│  ┌─ Payment successful?                  │
│  │   Yes → Create order → Send           │
│  │         confirmation email             │
│  │   No  → Show error → Retry            │
│  └───────────────────────────────────── │
└──────────────────────────────────────────┘
```

### Sequence Diagram

```
User          Frontend      Backend       Database      Payment API
 │             │             │             │             │
 │──Click      │             │             │             │
 │  Checkout──→│             │             │             │
 │             │──POST /order→│             │             │
 │             │             │──Check       │             │
 │             │             │  inventory──→│             │
 │             │             │←──Inventory  │             │
 │             │             │   data──────│             │
 │             │             │                           │
 │             │             │──Create      │             │
 │             │             │  order──────→│             │
 │             │             │←──Order ID──│             │
 │             │             │                           │
 │             │             │──Request charge──────────→│
 │             │             │←──Charge result──────────│
 │             │             │                           │
 │             │←─Order      │             │             │
 │             │  success───│             │             │
 │←─Display   │             │             │             │
 │  result────│             │             │             │
```

### System Aspects BAs Should Focus On

```
1. Happy Path: Normal flow
2. Exception Path: Error handling (payment failure, out of stock)
3. Edge Cases: Boundary situations (simultaneous orders, oversized orders)
4. Error Messages: User-friendly error messages
5. Audit Trail: Operation logs (who did what and when)
6. Data Validation: Dual validation (frontend + backend)
```

---

## 32-2: Database Fundamentals (BA Edition)

### Why Does a BA Need to Understand Databases?

```
1. Writing requirements requires defining data fields
2. Analysis requires understanding data structures
3. Communicating Data Models with engineers
4. Designing reports requires knowing where data comes from
```

### Relational Database Core Concepts

| Concept | Description | Analogy |
|---------|-------------|---------|
| Table | Data table | Excel worksheet |
| Row / Record | One data entry | Excel row |
| Column / Field | One attribute | Excel column |
| Primary Key (PK) | Unique identifier | Social Security Number |
| Foreign Key (FK) | Key referencing another table | Referencing another table's ID |
| Schema | Database structure | Table blueprint |

### Entity-Relationship Diagram (ERD)

```
┌──────────┐     1:N     ┌──────────┐
│ Customer │─────────────│  Order   │
├──────────┤             ├──────────┤
│ *id (PK) │             │ *id (PK) │
│ name     │             │ customer_│
│ email    │             │   id (FK)│
│ phone    │             │ date     │
│ city     │             │ total    │
│ created  │             │ status   │
└──────────┘             └──────────┘
                              │ 1:N
                              │
                         ┌──────────┐     N:1     ┌──────────┐
                         │OrderItem │─────────────│ Product  │
                         ├──────────┤             ├──────────┤
                         │ *id (PK) │             │ *id (PK) │
                         │ order_id │             │ name     │
                         │   (FK)   │             │ price    │
                         │ product_ │             │ category │
                         │   id(FK) │             │ stock    │
                         │ quantity │             └──────────┘
                         │ price    │
                         └──────────┘

Relationship Types:
1:1 — One-to-One (User ↔ Profile)
1:N — One-to-Many (Customer → Orders)
N:N — Many-to-Many (Student ↔ Course, requires junction table)
```

### Normalization (Brief Overview)

```
Why normalize? To avoid data redundancy and update anomalies.

❌ Unnormalized:
| OrderID | CustName | CustPhone | Item1    | Item2    | Item3 |
|---------|----------|-----------|----------|----------|-------|
| 001     | Alice    | 555-1234  | Mouse    | Keyboard |       |
| 002     | Alice    | 555-1234  | Monitor  |          |       |

Problems: Changing Alice's phone requires updating many rows; item count is not flexible

✅ After Normalization:
Customer table, Order table, OrderItem table each stand independently
→ Alice's data stored in one place only
→ No limit on number of items
```

### SQL vs NoSQL

| Aspect | SQL (Relational) | NoSQL (Non-Relational) |
|--------|-----------------|----------------------|
| Structure | Fixed Schema | Flexible Schema |
| Data Format | Tables | JSON / Key-Value / Graph |
| Relationships | JOIN queries | Nested documents or references |
| Scaling | Primarily vertical | Primarily horizontal |
| Best For | Transactional, reporting | Big data, real-time, flexible |
| Examples | MySQL, PostgreSQL | MongoDB, Redis, DynamoDB |

### BA's Role in Data Modeling

```
1. Define Entities: What are the main data objects?
2. Define Attributes: What fields does each object have?
3. Define Relationships: How are objects related?
4. Define Business Rules: What constraints? What validations?
5. Review Data Model together with engineers
```

---

## 32-3: API Fundamentals

### What Is an API?

```
API (Application Programming Interface)
= The "specification" for how systems communicate

Analogy: Ordering at a restaurant
- You (frontend) read the menu (API documentation)
- Tell the waiter (API) your order (Request)
- The kitchen (backend) prepares the food
- The waiter delivers the food (Response) to you
```

### RESTful API Basics

```
REST = Representational State Transfer
HTTP Method + URL + Body

Common HTTP Methods:
| Method | Purpose | Example |
|--------|---------|---------|
| GET    | Read    | GET /api/orders → Get all orders |
| POST   | Create  | POST /api/orders → Create new order |
| PUT    | Update (full) | PUT /api/orders/123 → Update order |
| PATCH  | Update (partial) | PATCH /api/orders/123 → Modify partial fields |
| DELETE | Delete  | DELETE /api/orders/123 → Delete order |
```

### API Request / Response Example

```
Request:
POST /api/orders
Headers:
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJI...
Body:
{
  "customer_id": 42,
  "items": [
    { "product_id": 101, "quantity": 2 },
    { "product_id": 203, "quantity": 1 }
  ],
  "shipping_address": "123 Main Street, New York, NY 10001"
}

Response — Success:
Status: 201 Created
{
  "order_id": 10567,
  "status": "pending",
  "total": 1590,
  "created_at": "2026-03-15T14:30:00Z"
}

Response — Failure:
Status: 400 Bad Request
{
  "error": "INSUFFICIENT_STOCK",
  "message": "Product 101 only has 1 in stock",
  "details": { "product_id": 101, "available": 1, "requested": 2 }
}
```

### HTTP Status Codes (Must-Know for BAs)

| Code | Meaning | BA Focus |
|------|---------|----------|
| 200 | OK | Success |
| 201 | Created | Successfully created |
| 400 | Bad Request | Request format error (frontend validation issue) |
| 401 | Unauthorized | Not logged in |
| 403 | Forbidden | No permission |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Conflict (e.g., duplicate creation) |
| 422 | Unprocessable | Validation failed (business rule) |
| 500 | Server Error | Backend error (notify engineering) |
| 503 | Service Unavailable | Service temporarily down |

### How BAs Use API Knowledge

```
1. Define API input/output when writing FRDs
2. Discuss system integration approaches with engineers
3. Understand third-party API limitations (Rate Limit, costs)
4. Test APIs using tools like Postman
5. Design error handling user experience
```

---

## 32-4: System Integration Point Analysis

### What Is System Integration?

```
Connecting two or more independent systems so data can flow between them.

E-commerce system integration points:
┌─────────┐     ┌──────────┐     ┌─────────┐
│   EC    │────→│ Payment  │────→│ Banking  │
│ Platform │     │ Gateway  │     │ System   │
└─────────┘     └──────────┘     └─────────┘
     │               │
     ↓               ↓
┌─────────┐     ┌──────────┐
│ Logistics│     │Accounting│
│ System   │     │ System   │
└─────────┘     └──────────┘
     │
     ↓
┌─────────┐
│Notification│ (Email / SMS / Push)
│ System   │
└─────────┘
```

### Integration Patterns

| Pattern | Description | Best For | Example |
|---------|-------------|----------|---------|
| Point-to-Point | Direct connection | Few systems, simple | Frontend directly calling API |
| Hub-and-Spoke | Central hub | Multiple system integration | ESB (Enterprise Service Bus) |
| Pub/Sub | Publish/Subscribe | Event-driven | Order created → notify multiple systems |
| Batch | Batch processing | Non-real-time needs | Nightly sync of sales data to accounting |
| API Gateway | Unified entry point | Microservices architecture | All APIs routed through Gateway |

### Integration Analysis Checklist

```
For each integration point, the BA needs to confirm:

1. Data Flow Direction
   → One-way or two-way?
   → Who is the Source? Who is the Target?

2. Frequency
   → Real-time or Batch?
   → If batch, how often?

3. Data Format
   → JSON, XML, CSV?
   → Encoding (UTF-8)?

4. Data Volume
   → Expected records per day/hour?
   → Peak volume as a multiple of normal?

5. Error Handling
   → What happens if the other system is down?
   → How many retries for failed transmissions?
   → Scenarios requiring manual intervention?

6. Security
   → Authentication method (API Key, OAuth)?
   → Data encryption (HTTPS, TLS)?
   → Sensitive data masking?

7. SLA
   → Response time requirements?
   → Availability requirements?
   → Rate limits?
```

### Integration Requirements Document Example

```
Integration: EC Platform → Logistics System

Direction: One-way (EC → Logistics)
Trigger: When order status changes to "Paid"
Frequency: Real-time
Format: JSON via REST API

Data Field Mapping:
| EC Platform Field | Logistics Field | Transformation Rule |
|-------------------|----------------|-------------------|
| order_id | shipment_ref | Add prefix "EC-" |
| customer.name | recipient_name | Direct mapping |
| customer.phone | recipient_phone | Remove country code |
| customer.address | delivery_address | Direct mapping |
| items[].name | package_items | Concatenate into string |
| total_weight | package_weight | Grams → Kilograms |

Error Handling:
| Error Code | Handling |
|-----------|---------|
| Connection timeout | Retry 3 times, 5-second interval |
| 400 Format error | Log, notify BA for review |
| 500 Logistics error | Retry 3 times, then route to manual processing queue |
| Unrecognized address | Flag order as "Address Pending Confirmation", notify CS |
```

---

## 32-5: Authentication, Roles, and Permissions

### Authentication vs Authorization

| Aspect | Authentication | Authorization |
|--------|---------------|--------------|
| Question | Who are you? | What can you do? |
| Verification | Username/password, SSO, MFA | Role-based permissions, ACL |
| When | At login | On every operation |
| Example | Enter credentials to log in | Manager can approve; employee can only submit |

### Common Authentication Methods

| Method | Description | Best For |
|--------|-------------|----------|
| Username + Password | Traditional credentials | General web applications |
| SSO (Single Sign-On) | One account for multiple systems | Enterprise internal systems |
| OAuth 2.0 | Third-party authorization login | "Sign in with Google" |
| MFA (Multi-Factor) | Multi-factor verification | High-security requirements |
| JWT (JSON Web Token) | Token-based verification | Stateless APIs |

### RBAC (Role-Based Access Control)

```
Role Definition Example (E-Commerce Back Office):

Role Structure:
Super Admin
  ├── Admin
  │     ├── Product Manager
  │     ├── Order Manager
  │     └── Customer Service
  ├── Finance
  └── Marketing
```

### Permission Matrix

| Feature | Super Admin | Admin | Product Mgr | Order Mgr | CS | Finance |
|---------|------------|-------|------------|-----------|-----|---------|
| User Management | CRUD | CRU | - | - | R | - |
| Product Management | CRUD | CRUD | CRUD | R | R | R |
| Order Management | CRUD | CRUD | R | CRUD | RU | R |
| Refund Approval | CRUD | CRU | - | R | CR | RU |
| Report Access | R | R | R (Products) | R (Orders) | R (CS) | R (All) |
| System Settings | CRUD | R | - | - | - | - |

```
C = Create, R = Read, U = Update, D = Delete
- = No access
```

### Permission Requirements Writing Example

```
FR-AUTH-001: Role Management

Description: Super Admin can create, modify, and delete roles,
and assign feature-level permissions to each role.

Rules:
1. Default roles (Super Admin, Admin) cannot be deleted
2. Custom role names must be unique
3. Role permission changes take effect immediately (no re-login required)
4. Confirm no users are assigned before deleting a role

FR-AUTH-002: Data-Level Permissions

Description: Users can only see data belonging to their department.

Examples:
- North region sales staff can only see North region orders and customers
- Headquarters can view all regions
- Managers can see their subordinates' data

Implementation (Row-Level Security):
Each record is tagged with department_id,
queries automatically include WHERE department_id = user.department_id
```

### Security Requirements Checklist

```
Security items BAs should consider when writing requirements:

☐ Password policy (minimum length, complexity, expiration policy)
☐ Login failure lockout (lock after 5 failures for 30 minutes)
☐ Session timeout (auto-logout after 30 minutes of inactivity)
☐ Secondary verification for sensitive operations (e.g., refund, delete)
☐ Audit Log (operation logging)
☐ PII protection (partial masking of phone/email)
☐ Data encryption (HTTPS in transit, encrypted at rest)
☐ GDPR / Privacy law compliance (right to data deletion)
```

---

## 32-6: System Analysis Comprehensive Case Study

### Case: Designing an Online Appointment System

#### Requirements Background

```
Scenario: A chain of clinics wants to build an online appointment system
Users: Patients, Doctors, Front desk staff, System administrators
Features: Online booking, appointment slot management, notification reminders
```

#### 1. System Context Diagram

```
                ┌──────────┐
   Patient ────→│          │──────→ Email/SMS
                │Appointment│
   Doctor  ────→│  System  │──────→ Calendar
                │          │
   Front   ────→│          │←─────→ Insurance
   Desk         └──────────┘        System
                     ↕
                ┌──────────┐
                │  Medical │
                │ Records  │
                │  System  │
                └──────────┘
```

#### 2. Entity Relationship Diagram

```
┌──────────┐  1:N  ┌──────────┐  N:1  ┌──────────┐
│ Patient  │──────→│Appointment│←──────│ Doctor   │
├──────────┤       ├──────────┤       ├──────────┤
│ *id      │       │ *id      │       │ *id      │
│ name     │       │ patient_ │       │ name     │
│ phone    │       │   id(FK) │       │ specialty│
│ email    │       │ doctor_  │       │ clinic_id│
│ birth    │       │   id(FK) │       │ bio      │
│ ID_number│       │ slot_id  │       └──────────┘
└──────────┘       │   (FK)   │
                   │ status   │  N:1  ┌──────────┐
                   │ notes    │──────→│ TimeSlot │
                   └──────────┘       ├──────────┤
                                      │ *id      │
                                      │ doctor_id│
                                      │ date     │
                                      │ start    │
                                      │ end      │
                                      │ available│
                                      └──────────┘
```

#### 3. Core API Design

```
Patient-facing:
GET  /api/doctors?specialty=family-medicine  → Search doctors
GET  /api/doctors/{id}/slots?date=...       → View available slots
POST /api/appointments                      → Create appointment
DELETE /api/appointments/{id}               → Cancel (must be 2+ hours in advance)

Doctor-facing:
GET   /api/doctors/me/appointments          → Today's appointment list
PATCH /api/appointments/{id}                → Update consultation notes
POST  /api/doctors/me/slots                 → Set available time slots
```

#### 4. Role Permissions

| Feature | Patient | Doctor | Front Desk | Admin |
|---------|---------|--------|-----------|-------|
| Search doctors | R | - | R | R |
| Book appointment | CR | - | CRD | CRUD |
| Cancel appointment | Own only | - | All | All |
| View appointment list | Own only | Own only | All | All |
| Set time slots | - | Own only | RU | CRUD |
| Manage doctors | - | - | R | CRUD |
| System settings | - | - | - | CRUD |

#### 5. Integration Points

| System | Purpose | Method | Notes |
|--------|---------|--------|-------|
| Email/SMS | Appointment notifications, reminders | Pub/Sub (event-driven) | SendGrid / Twilio |
| Insurance System | Identity verification, visit records | REST API (real-time) | Handle maintenance windows |
| Medical Records | Chart retrieval during visits | FHIR Standard API | Strict access control |
| Google Calendar | Doctor calendar sync | OAuth 2.0 | Timezone handling |

#### 6. Non-Functional Requirements

```
Performance:
- Doctor search response time < 1 second
- Appointment operation response time < 2 seconds
- Support 1,000 concurrent online users

Availability:
- 99.9% Uptime
- Maintenance window: Sunday 2-4 AM

Security:
- PII encrypted at rest
- Audit logs retained for 3 years
- Compliant with healthcare data privacy regulations

Compatibility:
- Support Chrome, Safari, Edge (last two versions)
- Mobile responsive (iOS Safari, Android Chrome)
```

---

## Cheat Sheet: System Analysis Quick Reference

### Must-Know Technical Terms for BAs

| Term | Plain Language Explanation |
|------|--------------------------|
| API | Specification for how systems communicate |
| REST | A style of API design |
| JSON | Data transfer format (like structured text) |
| Database | Where data is stored |
| Schema | The structural design of a database |
| ERD | Diagram showing relationships between data entities |
| Authentication | Verifying who you are |
| Authorization | Verifying what you can do |
| RBAC | Controlling permissions through roles |
| SLA | Contractual commitment for service quality |
| Webhook | Automatic notification when an event occurs |
| Microservices | Breaking a large system into small services |
| CI/CD | Automated testing and deployment |
| Rate Limit | Limit on the number of API calls |

### System Analysis Process

```
1. Understand business processes → Process Flow
2. Identify data entities → ERD
3. Define API interfaces → API Spec
4. Analyze integration points → Integration Map
5. Design permission model → RBAC Matrix
6. Define NFR → Performance, Security, Scalability
7. Review with engineering → Technical Feasibility
```

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| How do you understand system architecture? | Three-tier: Frontend → Backend → Database |
| What is an API? | Communication interface between systems, using HTTP methods to operate resources |
| How to draw an ERD? | Entities + Attributes + Relationships |
| Authentication vs Authorization? | Authentication = Who you are; Authorization = What you can do |
| What to watch out for in system integration? | Data flow, frequency, format, error handling, security |
| How to communicate with engineers? | Use process diagrams, ERDs, API specs; speak in business language |

"""

    // MARK: - World 33 (zh)
    private static let zhWorld33 = """

# World 33：測試與驗證 (Testing & Validation)

> 產品做出來不等於做對了。UAT（User Acceptance Testing）是確保交付成果符合需求的最後一道防線。
> Business Engineer 和 Product Analyst 都需要懂得如何設計測試、追蹤缺陷、驗收需求。

系統上線前，測試是降低風險最有效的手段。
這一章教你從 UAT 概念到完整測試計畫的全流程。

---

## 33-1：UAT 概念與流程

### 什麼是 UAT？

UAT（User Acceptance Testing）= 使用者驗收測試

- **目的**：確認系統功能符合業務需求
- **執行者**：業務端使用者（非工程師）
- **時機**：開發完成、內部測試通過後
- **結果**：通過 → 上線；不通過 → 修正後重測

### UAT vs 其他測試類型

| 測試類型 | 執行者 | 測試重點 | 時機 |
|---------|--------|---------|------|
| Unit Test | 工程師 | 單一函數 / 元件 | 開發中 |
| Integration Test | 工程師 | 模組間整合 | 開發中後期 |
| System Test (SIT) | QA 團隊 | 端到端系統功能 | 開發完成後 |
| UAT | 業務使用者 | 業務場景符合度 | SIT 通過後 |
| Regression Test | QA / 自動化 | 確認舊功能沒壞 | 每次修改後 |

### UAT 標準流程

```
1. UAT 計畫制定
   ↓
2. 測試案例設計（基於需求文件）
   ↓
3. 測試環境準備（接近正式環境）
   ↓
4. UAT 執行（業務人員操作）
   ↓
5. 缺陷記錄與追蹤
   ↓
6. 缺陷修復與回歸測試
   ↓
7. 簽核驗收（Sign-off）
   ↓
8. 上線部署
```

### UAT Entry Criteria（進入條件）

- [ ] 所有 SIT 測試案例通過
- [ ] 測試環境已部署最新版本
- [ ] 測試資料已準備完成
- [ ] UAT 計畫已獲核准
- [ ] 參與人員已完成教育訓練

### UAT Exit Criteria（退出條件）

- [ ] 所有 Critical / High 缺陷已修復
- [ ] 測試案例通過率 ≥ 95%
- [ ] 業務負責人簽核通過
- [ ] 殘留缺陷有明確處理計畫

### 面試常見問題

**Q：為什麼 UAT 不能被其他測試取代？**

A：因為其他測試驗證的是「系統是否正確運作」，UAT 驗證的是「系統是否符合業務期望」。
工程師可能把功能做對了，但不是使用者要的。

---

## 33-2：Test Case 撰寫

### Test Case 基本結構

| 欄位 | 說明 | 範例 |
|------|------|------|
| Test Case ID | 唯一識別碼 | TC-033-001 |
| 測試項目 | 測試的功能模組 | 訂單管理 |
| 前置條件 | 執行前需滿足的狀態 | 已登入管理者帳號 |
| 測試步驟 | 具體操作步驟 | 1. 點擊「新增訂單」... |
| 預期結果 | 正確行為的描述 | 訂單建立成功，顯示訂單號 |
| 實際結果 | 測試時的真實結果 | （測試時填寫） |
| 狀態 | Pass / Fail / Blocked | （測試時填寫） |
| 嚴重度 | Critical / High / Medium / Low | Medium |
| 備註 | 補充說明 | 需搭配特定資料 |

### 撰寫原則

1. **一個 Test Case 只測一件事**
2. **步驟要具體到任何人都能執行**
3. **預期結果要可驗證**（不要寫「正常」，要寫「顯示成功訊息 XXX」）
4. **覆蓋正向與負向場景**

### 範例：電商訂單功能

```
Test Case ID: TC-ORDER-001
測試項目：建立訂單
前置條件：已登入一般會員帳號，購物車有至少 1 項商品
測試步驟：
  1. 進入購物車頁面
  2. 確認商品數量為 2
  3. 點擊「結帳」
  4. 選擇付款方式「信用卡」
  5. 輸入信用卡資訊（測試卡號）
  6. 點擊「確認付款」
預期結果：
  - 顯示「訂單建立成功」訊息
  - 產生訂單編號（格式：ORD-YYYYMMDD-XXXX）
  - 購物車清空
  - 收到訂單確認 Email
嚴重度：Critical
```

### 負向測試案例（Negative Test Case）

```
Test Case ID: TC-ORDER-002
測試項目：空購物車結帳
前置條件：已登入，購物車無商品
測試步驟：
  1. 進入購物車頁面
  2. 點擊「結帳」
預期結果：
  - 顯示「購物車為空，無法結帳」提示
  - 不進入付款流程
嚴重度：Medium
```

### 邊界值測試（Boundary Test）

```
Test Case ID: TC-ORDER-003
測試項目：訂單金額上限
前置條件：已登入，購物車商品總金額 = $999,999
測試步驟：
  1. 新增一項 $1 商品（總金額達 $1,000,000）
  2. 點擊「結帳」
預期結果：
  - 顯示「單筆訂單金額超過上限」警告
  - 或正常處理（依業務規則）
嚴重度：High
```

### Test Case 覆蓋率矩陣

| 需求編號 | 需求描述 | 對應 Test Case | 覆蓋狀態 |
|---------|---------|--------------|---------|
| REQ-001 | 會員可建立訂單 | TC-001, TC-002 | ✅ 已覆蓋 |
| REQ-002 | 支援三種付款方式 | TC-003, TC-004, TC-005 | ✅ 已覆蓋 |
| REQ-003 | 庫存不足時提示 | （缺少） | ❌ 待補 |

---

## 33-3：缺陷追蹤 (Defect Tracking)

### Bug Report 標準格式

| 欄位 | 說明 |
|------|------|
| Bug ID | 唯一編號 |
| 標題 | 簡短描述問題 |
| 嚴重度 (Severity) | Critical / High / Medium / Low |
| 優先順序 (Priority) | P0 / P1 / P2 / P3 |
| 重現步驟 | 如何觸發此 Bug |
| 預期行為 | 正確應該是什麼 |
| 實際行為 | 目前的錯誤表現 |
| 環境資訊 | 瀏覽器、OS、版本 |
| 截圖 / 影片 | 輔助說明 |
| 指派對象 | 負責修復的人 |

### Severity vs Priority

| | 高 Priority | 低 Priority |
|---|---|---|
| **高 Severity** | 首頁無法載入（立即修） | 資料匯出格式錯誤（排入下個 Sprint） |
| **低 Severity** | CEO 要求改的字型（政治優先） | 罕見情境下的 UI 偏移（排隊處理） |

- **Severity**：技術影響程度（系統壞多嚴重）
- **Priority**：業務處理順序（要多快修好）

### 缺陷生命週期

```
New（新建）
  ↓
Open（已確認）
  ↓
Assigned（已指派）
  ↓
In Progress（修復中）
  ↓
Fixed（已修復）
  ↓
Verified（已驗證） ←→ Reopened（重新開啟）
  ↓
Closed（已關閉）
```

### 缺陷分類統計

```
缺陷分佈看板：
┌──────────────┬────────┬────────┬────────┬────────┐
│ 模組         │ Critical│ High   │ Medium │ Low    │
├──────────────┼────────┼────────┼────────┼────────┤
│ 訂單管理     │ 1      │ 3      │ 5      │ 2      │
│ 會員系統     │ 0      │ 1      │ 3      │ 4      │
│ 報表功能     │ 0      │ 2      │ 1      │ 1      │
│ 權限控制     │ 2      │ 1      │ 0      │ 0      │
└──────────────┴────────┴────────┴────────┴────────┘
```

### 常用缺陷追蹤工具

| 工具 | 特色 | 適用場景 |
|------|------|---------|
| Jira | 功能最完整 | 大型團隊、企業 |
| Azure DevOps | 微軟生態系整合 | .NET / Azure 專案 |
| Linear | 現代 UI、快速 | 新創團隊 |
| GitHub Issues | 與程式碼整合 | 開源 / 小型專案 |
| Trello | 看板直覺 | 非技術團隊 |

### 面試情境題

**Q：UAT 測試發現 20 個 Bug，但專案下週要上線，你怎麼處理？**

A：
1. 依 Severity 和 Priority 分類
2. Critical / P0：必須修完才能上線
3. High / P1：盡量在上線前修復
4. Medium / Low：記錄為 Known Issues，排入後續版本
5. 與業務方溝通殘留風險，取得共識
6. 制定上線後的監控計畫

---

## 33-4：需求驗證 (Requirement Validation)

### 需求追溯矩陣 (Requirements Traceability Matrix, RTM)

| 需求 ID | 需求描述 | 設計文件 | 開發模組 | Test Case | UAT 結果 |
|--------|---------|---------|---------|----------|---------|
| REQ-001 | 會員註冊 | SD-001 | Auth Module | TC-001~003 | Pass |
| REQ-002 | 商品搜尋 | SD-002 | Search Module | TC-010~015 | Pass |
| REQ-003 | 購物車 | SD-003 | Cart Module | TC-020~028 | Fail (2 bugs) |
| REQ-004 | 付款整合 | SD-004 | Payment Module | TC-030~035 | Blocked |

### 驗證 vs 確認

| | Verification（驗證） | Validation（確認） |
|---|---|---|
| 問題 | Are we building it right? | Are we building the right thing? |
| 時機 | 開發過程中 | 開發完成後 |
| 方法 | Code Review、SIT | UAT、Prototype 測試 |
| 執行者 | 開發 / QA 團隊 | 業務使用者 / 客戶 |

### 需求變更控制

```
需求變更流程：
1. 提出變更請求（Change Request）
   ↓
2. 影響評估（Impact Analysis）
   - 對時程的影響？
   - 對成本的影響？
   - 對其他功能的影響？
   ↓
3. 變更審核委員會（CCB）審議
   ↓
4. 核准 → 更新需求文件 → 調整測試案例
   拒絕 → 記錄原因 → 通知申請人
```

### Gap Analysis（差距分析）

```
需求 vs 現狀差距：
┌─────────────┬──────────────┬──────────────┬──────────┐
│ 功能         │ 需求         │ 現狀         │ Gap      │
├─────────────┼──────────────┼──────────────┼──────────┤
│ 報表匯出     │ PDF + Excel  │ 僅 Excel     │ 缺 PDF   │
│ 多語系支援   │ 中英日       │ 中英         │ 缺日文   │
│ 行動裝置     │ RWD 支援     │ 僅桌面版     │ 需開發   │
│ 批次匯入     │ 1000 筆/次   │ 500 筆/次    │ 效能優化 │
└─────────────┴──────────────┴──────────────┴──────────┘
```

---

## 33-5：驗收測試策略 (Acceptance Testing Strategy)

### 測試策略文件大綱

```
1. 測試目標與範圍
2. 測試方法
3. 測試環境需求
4. 人力與時程安排
5. Entry / Exit Criteria
6. 風險與應變計畫
7. 交付物清單
```

### 測試分層策略

```
            ┌───────────┐
            │  E2E Test │  ← 少量，驗證核心流程
            ├───────────┤
          ┌─┤ UAT Test  ├─┐  ← 業務場景覆蓋
          │ ├───────────┤ │
        ┌─┤ │ Integration│ ├─┐  ← 模組間整合
        │ │ ├───────────┤ │ │
      ┌─┤ │ │ Unit Test │ │ ├─┐  ← 大量，自動化
      │ │ │ └───────────┘ │ │ │
      └─┘ └───────────────┘ └─┘
             測試金字塔
```

### 測試環境對照

| 環境 | 用途 | 資料 | 穩定性 |
|------|------|------|--------|
| DEV | 開發測試 | 假資料 | 低 |
| SIT | 整合測試 | 測試資料 | 中 |
| UAT | 驗收測試 | 接近真實資料 | 高 |
| Staging | 上線前演練 | 脫敏真實資料 | 很高 |
| Production | 正式環境 | 真實資料 | 最高 |

### 回歸測試策略

- **Full Regression**：完整跑一遍所有測試（耗時但最安全）
- **Risk-based Regression**：只測受影響的模組
- **Smoke Test**：只測核心流程是否正常（快速檢查）

### 測試資料準備

```
資料準備清單：
✅ 正常資料（Happy Path）
✅ 邊界值（最大值、最小值、空值）
✅ 異常資料（特殊字元、超長字串、SQL Injection 測試）
✅ 歷史資料（跨年度、舊格式）
✅ 大量資料（效能測試用）
✅ 權限資料（不同角色的帳號）
```

---

## 33-6：完整 UAT 計畫

### 情境：電商平台改版 UAT

```
專案名稱：電商平台 v2.0 改版
UAT 期間：2026/04/01 - 2026/04/14（兩週）
參與人員：
  - 業務代表：3 人（客服、行銷、營運）
  - BA / PM：1 人（協調與支援）
  - 開發支援：2 人（On-call 修復）
```

### 測試範圍

| 模組 | 功能項目 | Test Case 數 | 負責人 |
|------|---------|-------------|--------|
| 會員系統 | 註冊、登入、個人資料 | 15 | Alice |
| 商品管理 | 搜尋、分類、商品頁 | 20 | Bob |
| 購物流程 | 購物車、結帳、付款 | 25 | Alice |
| 訂單管理 | 訂單查詢、退貨、退款 | 18 | Carol |
| 報表系統 | 銷售報表、會員報表 | 12 | Bob |
| **合計** | | **90** | |

### 時程安排

```
Week 1（4/1 - 4/7）：
  Day 1-2：測試環境確認、教育訓練
  Day 3-5：第一輪測試執行
  Day 6-7：缺陷彙整、開發修復

Week 2（4/8 - 4/14）：
  Day 8-10：回歸測試 + 第二輪測試
  Day 11-12：殘留缺陷評估
  Day 13：最終確認
  Day 14：Sign-off 簽核
```

### UAT 每日站會模板

```
1. 昨天完成了哪些測試？
2. 今天計畫測試什麼？
3. 遇到什麼阻礙（Blocker）？
4. 新發現的缺陷統計
```

### UAT 結案報告模板

```
UAT 結案報告
============
專案：電商平台 v2.0
測試期間：2026/04/01 - 2026/04/14

測試結果摘要：
- 總測試案例：90
- 通過：85（94.4%）
- 失敗：3（已修復並驗證通過）
- 未執行：2（因環境問題）

缺陷統計：
- 總缺陷數：18
- Critical：2（已修復）
- High：5（已修復）
- Medium：7（5 已修復，2 列為 Known Issue）
- Low：4（列為下一版本處理）

殘留風險：
1. 報表匯出 PDF 格式偶有跑版（Medium）
   → 暫時方案：改用 Excel 匯出
2. 大量資料搜尋速度較慢（Medium）
   → 計畫在 v2.1 優化

結論：建議上線 ✅
簽核：[業務負責人] [PM] [IT 負責人]
```

### 面試完整案例

**Q：請設計一個 CRM 系統的 UAT 測試計畫。**

```
回答框架：
1. 範圍：客戶管理、商機追蹤、活動管理、報表
2. 人員：業務部 5 人、行銷部 2 人、BA 1 人
3. 時程：3 週（教育訓練 + 兩輪測試 + 簽核）
4. 關鍵 Test Case：
   - 新增客戶 → 建立商機 → 追蹤進度 → 成交（核心流程）
   - 資料匯入 5000 筆客戶資料（效能）
   - 不同角色權限檢查（安全）
5. Exit Criteria：Critical 缺陷清零、通過率 > 95%
6. 風險：業務人員時間有限 → 準備操作手冊降低學習成本
```

---

## 🔑 World 33 Cheat Sheet

### UAT 核心觀念

```
UAT = 使用者驗收測試
  目的：確認系統符合「業務需求」（不只是「技術正確」）
  時機：SIT 之後、上線之前
  執行者：業務端使用者

Test Case 三要素：
  1. 明確步驟（任何人都能重現）
  2. 預期結果（可驗證）
  3. 覆蓋正向 + 負向場景

Bug Report 核心：
  Severity ≠ Priority
  Severity = 技術影響
  Priority = 業務急迫性

RTM（需求追溯矩陣）：
  需求 → 設計 → 開發 → 測試 → 驗收
  確保每個需求都有對應的測試案例

UAT 成功關鍵：
  ✅ 明確的 Entry / Exit Criteria
  ✅ 接近真實的測試環境
  ✅ 業務人員充分參與
  ✅ 高效的缺陷追蹤流程
```

### 面試萬用回答模板

```
被問到測試相關問題時：
1. 先釐清測試目標（驗什麼？）
2. 定義測試範圍與方法
3. 說明人員、時程、環境
4. 提出 Entry / Exit Criteria
5. 說明風險與應變措施
```

"""

    // MARK: - World 33 (en)
    private static let enWorld33 = """

# World 33: Testing & Validation

> Building a product doesn't mean building it right. UAT (User Acceptance Testing) is the last line of defense to ensure deliverables meet requirements.
> Business Engineers and Product Analysts both need to know how to design tests, track defects, and validate requirements.

Before a system goes live, testing is the most effective way to reduce risk.
This chapter teaches you the complete process from UAT concepts to a full test plan.

---

## 33-1: UAT Concepts & Process

### What is UAT?

UAT (User Acceptance Testing) = User Acceptance Testing

- **Purpose**: Confirm that system functionality meets business requirements
- **Performed by**: Business-side users (not engineers)
- **Timing**: After development is complete and internal testing has passed
- **Outcome**: Pass → Go live; Fail → Fix and retest

### UAT vs Other Testing Types

| Test Type | Performed By | Focus | Timing |
|-----------|-------------|-------|--------|
| Unit Test | Engineers | Individual functions / components | During development |
| Integration Test | Engineers | Inter-module integration | Mid-to-late development |
| System Test (SIT) | QA Team | End-to-end system functionality | After development |
| UAT | Business Users | Business scenario compliance | After SIT passes |
| Regression Test | QA / Automation | Confirm existing features are intact | After every change |

### Standard UAT Process

```
1. UAT Plan Development
   ↓
2. Test Case Design (based on requirements documents)
   ↓
3. Test Environment Setup (close to production)
   ↓
4. UAT Execution (business users perform testing)
   ↓
5. Defect Logging & Tracking
   ↓
6. Defect Fixing & Regression Testing
   ↓
7. Sign-off Approval
   ↓
8. Go-Live Deployment
```

### UAT Entry Criteria

- [ ] All SIT test cases passed
- [ ] Test environment deployed with latest version
- [ ] Test data preparation complete
- [ ] UAT plan approved
- [ ] Participants have completed training

### UAT Exit Criteria

- [ ] All Critical / High defects resolved
- [ ] Test case pass rate ≥ 95%
- [ ] Business owner sign-off obtained
- [ ] Remaining defects have a clear resolution plan

### Common Interview Questions

**Q: Why can't UAT be replaced by other types of testing?**

A: Because other tests verify whether "the system works correctly," while UAT verifies whether "the system meets business expectations."
Engineers may build the feature correctly, but it may not be what the users actually need.

---

## 33-2: Writing Test Cases

### Test Case Structure

| Field | Description | Example |
|-------|-------------|---------|
| Test Case ID | Unique identifier | TC-033-001 |
| Test Item | Feature module being tested | Order Management |
| Preconditions | Required state before execution | Logged in as admin |
| Test Steps | Specific action steps | 1. Click "New Order"... |
| Expected Result | Description of correct behavior | Order created successfully, order number displayed |
| Actual Result | Real result during testing | (Filled during testing) |
| Status | Pass / Fail / Blocked | (Filled during testing) |
| Severity | Critical / High / Medium / Low | Medium |
| Notes | Additional remarks | Requires specific test data |

### Writing Principles

1. **One test case tests one thing**
2. **Steps should be specific enough for anyone to execute**
3. **Expected results must be verifiable** (don't write "normal" — write "displays success message XXX")
4. **Cover both positive and negative scenarios**

### Example: E-commerce Order Feature

```
Test Case ID: TC-ORDER-001
Test Item: Create Order
Preconditions: Logged in as regular member, at least 1 item in cart
Test Steps:
  1. Navigate to shopping cart page
  2. Confirm item quantity is 2
  3. Click "Checkout"
  4. Select payment method "Credit Card"
  5. Enter credit card information (test card number)
  6. Click "Confirm Payment"
Expected Result:
  - Displays "Order Created Successfully" message
  - Generates order number (format: ORD-YYYYMMDD-XXXX)
  - Shopping cart is cleared
  - Order confirmation email received
Severity: Critical
```

### Negative Test Case

```
Test Case ID: TC-ORDER-002
Test Item: Checkout with Empty Cart
Preconditions: Logged in, no items in cart
Test Steps:
  1. Navigate to shopping cart page
  2. Click "Checkout"
Expected Result:
  - Displays "Cart is empty, cannot proceed to checkout" prompt
  - Does not proceed to payment flow
Severity: Medium
```

### Boundary Test

```
Test Case ID: TC-ORDER-003
Test Item: Order Amount Limit
Preconditions: Logged in, cart total = $999,999
Test Steps:
  1. Add a $1 item (total reaches $1,000,000)
  2. Click "Checkout"
Expected Result:
  - Displays "Single order amount exceeds limit" warning
  - Or processes normally (per business rules)
Severity: High
```

### Test Case Coverage Matrix

| Requirement ID | Requirement Description | Corresponding Test Cases | Coverage Status |
|---------------|------------------------|------------------------|----------------|
| REQ-001 | Members can create orders | TC-001, TC-002 | ✅ Covered |
| REQ-002 | Support three payment methods | TC-003, TC-004, TC-005 | ✅ Covered |
| REQ-003 | Alert when out of stock | (Missing) | ❌ Pending |

---

## 33-3: Defect Tracking

### Bug Report Standard Format

| Field | Description |
|-------|-------------|
| Bug ID | Unique identifier |
| Title | Brief description of the issue |
| Severity | Critical / High / Medium / Low |
| Priority | P0 / P1 / P2 / P3 |
| Steps to Reproduce | How to trigger the bug |
| Expected Behavior | What should happen correctly |
| Actual Behavior | Current incorrect behavior |
| Environment Info | Browser, OS, version |
| Screenshots / Videos | Supporting materials |
| Assignee | Person responsible for the fix |

### Severity vs Priority

| | High Priority | Low Priority |
|---|---|---|
| **High Severity** | Homepage won't load (fix immediately) | Data export format error (schedule for next Sprint) |
| **Low Severity** | Font change requested by CEO (political priority) | UI misalignment in rare scenario (queue for processing) |

- **Severity**: Technical impact level (how badly the system is broken)
- **Priority**: Business processing order (how quickly it needs to be fixed)

### Defect Lifecycle

```
New
  ↓
Open (Confirmed)
  ↓
Assigned
  ↓
In Progress (Being Fixed)
  ↓
Fixed
  ↓
Verified ←→ Reopened
  ↓
Closed
```

### Defect Classification Summary

```
Defect Distribution Board:
┌──────────────┬──────────┬────────┬────────┬────────┐
│ Module       │ Critical │ High   │ Medium │ Low    │
├──────────────┼──────────┼────────┼────────┼────────┤
│ Order Mgmt   │ 1        │ 3      │ 5      │ 2      │
│ Member System│ 0        │ 1      │ 3      │ 4      │
│ Reports      │ 0        │ 2      │ 1      │ 1      │
│ Access Control│ 2       │ 1      │ 0      │ 0      │
└──────────────┴──────────┴────────┴────────┴────────┘
```

### Common Defect Tracking Tools

| Tool | Strengths | Best For |
|------|-----------|----------|
| Jira | Most comprehensive features | Large teams, enterprises |
| Azure DevOps | Microsoft ecosystem integration | .NET / Azure projects |
| Linear | Modern UI, fast | Startups |
| GitHub Issues | Integrated with code | Open source / small projects |
| Trello | Intuitive Kanban boards | Non-technical teams |

### Interview Scenario Question

**Q: UAT testing found 20 bugs, but the project is due to go live next week. How do you handle this?**

A:
1. Classify by Severity and Priority
2. Critical / P0: Must be fixed before go-live
3. High / P1: Try to fix before go-live
4. Medium / Low: Document as Known Issues, schedule for subsequent releases
5. Communicate residual risks with business stakeholders and reach consensus
6. Develop a post-launch monitoring plan

---

## 33-4: Requirement Validation

### Requirements Traceability Matrix (RTM)

| Req ID | Requirement Description | Design Doc | Dev Module | Test Case | UAT Result |
|--------|------------------------|-----------|-----------|----------|-----------|
| REQ-001 | Member Registration | SD-001 | Auth Module | TC-001~003 | Pass |
| REQ-002 | Product Search | SD-002 | Search Module | TC-010~015 | Pass |
| REQ-003 | Shopping Cart | SD-003 | Cart Module | TC-020~028 | Fail (2 bugs) |
| REQ-004 | Payment Integration | SD-004 | Payment Module | TC-030~035 | Blocked |

### Verification vs Validation

| | Verification | Validation |
|---|---|---|
| Question | Are we building it right? | Are we building the right thing? |
| Timing | During development | After development |
| Methods | Code Review, SIT | UAT, Prototype Testing |
| Performed By | Dev / QA Team | Business Users / Clients |

### Requirement Change Control

```
Requirement Change Process:
1. Submit Change Request (CR)
   ↓
2. Impact Analysis
   - Impact on timeline?
   - Impact on cost?
   - Impact on other features?
   ↓
3. Change Control Board (CCB) Review
   ↓
4. Approved → Update requirements docs → Adjust test cases
   Rejected → Document reasons → Notify requester
```

### Gap Analysis

```
Requirements vs Current State Gap:
┌─────────────────┬──────────────┬──────────────┬────────────┐
│ Feature         │ Requirement  │ Current State│ Gap        │
├─────────────────┼──────────────┼──────────────┼────────────┤
│ Report Export   │ PDF + Excel  │ Excel only   │ Missing PDF│
│ Multi-language  │ EN/CN/JP     │ EN/CN        │ Missing JP │
│ Mobile Support  │ RWD Support  │ Desktop only │ Need to dev│
│ Batch Import    │ 1000 rows/tx │ 500 rows/tx  │ Perf optim │
└─────────────────┴──────────────┴──────────────┴────────────┘
```

---

## 33-5: Acceptance Testing Strategy

### Test Strategy Document Outline

```
1. Test Objectives & Scope
2. Test Approach
3. Test Environment Requirements
4. Staffing & Schedule
5. Entry / Exit Criteria
6. Risks & Contingency Plans
7. Deliverables Checklist
```

### Test Layering Strategy

```
            ┌───────────┐
            │  E2E Test │  ← Few, verify core flows
            ├───────────┤
          ┌─┤ UAT Test  ├─┐  ← Business scenario coverage
          │ ├───────────┤ │
        ┌─┤ │ Integration│ ├─┐  ← Inter-module integration
        │ │ ├───────────┤ │ │
      ┌─┤ │ │ Unit Test │ │ ├─┐  ← Many, automated
      │ │ │ └───────────┘ │ │ │
      └─┘ └───────────────┘ └─┘
             Test Pyramid
```

### Test Environment Comparison

| Environment | Purpose | Data | Stability |
|-------------|---------|------|-----------|
| DEV | Development testing | Mock data | Low |
| SIT | Integration testing | Test data | Medium |
| UAT | Acceptance testing | Near-real data | High |
| Staging | Pre-launch rehearsal | Anonymized real data | Very High |
| Production | Live environment | Real data | Highest |

### Regression Testing Strategy

- **Full Regression**: Run all tests completely (time-consuming but safest)
- **Risk-based Regression**: Test only affected modules
- **Smoke Test**: Test only core flows (quick check)

### Test Data Preparation

```
Data Preparation Checklist:
✅ Normal data (Happy Path)
✅ Boundary values (max, min, null)
✅ Abnormal data (special characters, very long strings, SQL injection tests)
✅ Historical data (cross-year, legacy formats)
✅ Large datasets (for performance testing)
✅ Permission data (accounts with different roles)
```

---

## 33-6: Complete UAT Plan

### Scenario: E-commerce Platform Revamp UAT

```
Project Name: E-commerce Platform v2.0 Revamp
UAT Period: 2026/04/01 - 2026/04/14 (two weeks)
Participants:
  - Business Representatives: 3 (Customer Service, Marketing, Operations)
  - BA / PM: 1 (Coordination & Support)
  - Dev Support: 2 (On-call fixes)
```

### Test Scope

| Module | Feature Items | # Test Cases | Owner |
|--------|--------------|-------------|-------|
| Member System | Registration, Login, Profile | 15 | Alice |
| Product Management | Search, Categories, Product Page | 20 | Bob |
| Shopping Flow | Cart, Checkout, Payment | 25 | Alice |
| Order Management | Order Inquiry, Returns, Refunds | 18 | Carol |
| Reporting System | Sales Reports, Member Reports | 12 | Bob |
| **Total** | | **90** | |

### Schedule

```
Week 1 (4/1 - 4/7):
  Day 1-2: Test environment validation, training
  Day 3-5: First round of test execution
  Day 6-7: Defect consolidation, dev fixes

Week 2 (4/8 - 4/14):
  Day 8-10: Regression testing + second round
  Day 11-12: Residual defect assessment
  Day 13: Final confirmation
  Day 14: Sign-off approval
```

### UAT Daily Standup Template

```
1. What tests were completed yesterday?
2. What tests are planned for today?
3. Are there any blockers?
4. New defect statistics
```

### UAT Closure Report Template

```
UAT Closure Report
==================
Project: E-commerce Platform v2.0
Test Period: 2026/04/01 - 2026/04/14

Test Results Summary:
- Total Test Cases: 90
- Passed: 85 (94.4%)
- Failed: 3 (fixed and verified)
- Not Executed: 2 (due to environment issues)

Defect Statistics:
- Total Defects: 18
- Critical: 2 (fixed)
- High: 5 (fixed)
- Medium: 7 (5 fixed, 2 listed as Known Issues)
- Low: 4 (deferred to next release)

Residual Risks:
1. Report PDF export occasionally has formatting issues (Medium)
   → Workaround: Use Excel export instead
2. Search performance slow with large datasets (Medium)
   → Planned optimization in v2.1

Conclusion: Recommend go-live ✅
Sign-off: [Business Owner] [PM] [IT Lead]
```

### Complete Interview Case

**Q: Design a UAT test plan for a CRM system.**

```
Answer Framework:
1. Scope: Customer Management, Opportunity Tracking, Campaign Management, Reports
2. Personnel: Sales Dept 5 people, Marketing 2 people, BA 1 person
3. Timeline: 3 weeks (training + two rounds of testing + sign-off)
4. Key Test Cases:
   - Create Customer → Create Opportunity → Track Progress → Close Deal (core flow)
   - Import 5,000 customer records (performance)
   - Role-based permission checks (security)
5. Exit Criteria: Zero Critical defects, pass rate > 95%
6. Risk: Limited business user availability → Prepare user manuals to reduce learning curve
```

---

## Key Takeaways - World 33 Cheat Sheet

### UAT Core Concepts

```
UAT = User Acceptance Testing
  Purpose: Confirm system meets "business requirements" (not just "technically correct")
  Timing: After SIT, before go-live
  Performed by: Business-side users

Test Case Three Essentials:
  1. Clear steps (anyone can reproduce)
  2. Expected results (verifiable)
  3. Cover positive + negative scenarios

Bug Report Key Point:
  Severity ≠ Priority
  Severity = Technical impact
  Priority = Business urgency

RTM (Requirements Traceability Matrix):
  Requirement → Design → Development → Testing → Acceptance
  Ensure every requirement has corresponding test cases

UAT Success Factors:
  ✅ Clear Entry / Exit Criteria
  ✅ Near-production test environment
  ✅ Sufficient business user participation
  ✅ Efficient defect tracking process
```

### Universal Interview Answer Template

```
When asked testing-related questions:
1. First clarify the test objective (what are we validating?)
2. Define test scope and approach
3. Explain personnel, timeline, and environment
4. Propose Entry / Exit Criteria
5. Address risks and contingency measures
```

"""

    // MARK: - World 34 (zh)
    private static let zhWorld34 = """

# World 34：專案管理基礎 (Project Management Basics)

> 不管是 Business Engineer 還是 Product Analyst，你都會參與專案。
> 理解專案管理的基本框架，能讓你在面試中展現「能落地執行」的能力。

好的分析和規劃如果無法管理執行，就只是紙上談兵。
這一章教你從範圍定義到 Sprint Planning 的完整專案管理基礎。

---

## 34-1：範圍定義 (Scope Definition)

### 專案三角 (Iron Triangle)

```
        範圍 (Scope)
         /      \\
        /   品質  \\
       /  (Quality) \\
      /              \\
  時間 ————————————— 成本
 (Time)            (Cost)
```

**核心觀念**：三者不可能同時最佳化，改變一個必然影響其他兩個。

### Scope 定義工具：WBS（Work Breakdown Structure）

```
電商平台改版
├── 1. 前端改版
│   ├── 1.1 首頁 Redesign
│   ├── 1.2 商品頁改版
│   └── 1.3 購物車 UX 優化
├── 2. 後端開發
│   ├── 2.1 搜尋引擎升級
│   ├── 2.2 付款模組整合
│   └── 2.3 API 效能優化
├── 3. 測試
│   ├── 3.1 SIT
│   └── 3.2 UAT
└── 4. 上線
    ├── 4.1 資料遷移
    └── 4.2 正式部署
```

### In Scope vs Out of Scope

| In Scope（範圍內） | Out of Scope（範圍外） |
|-------------------|---------------------|
| 前端 UI 改版 | App 開發 |
| 現有付款方式整合 | 新增虛擬貨幣付款 |
| 繁中介面 | 多語系支援 |
| 現有會員遷移 | 社群登入整合 |

### Scope Creep（範圍蔓延）

```
常見情境：
客戶：「既然都改了，能不能順便加一個 XXX 功能？」
主管：「這個很簡單吧，加一下就好。」

應對方式：
1. 評估影響（時間、成本、風險）
2. 走正式的變更流程（Change Request）
3. 用數據說話：「增加這個功能需要多 2 週和 $50K」
4. 提供替代方案：「可以先做簡化版，後續版本再完善」
```

### SMART 目標

| 要素 | 說明 | 好的範例 | 壞的範例 |
|------|------|---------|---------|
| Specific | 具體 | 將結帳流程從 5 步減為 3 步 | 改善用戶體驗 |
| Measurable | 可衡量 | 購物車轉換率提升 15% | 提升轉換率 |
| Achievable | 可達成 | 基於歷史數據推算可行 | 月營收翻 10 倍 |
| Relevant | 相關 | 與公司 Q2 目標一致 | 跟業務方向無關 |
| Time-bound | 有期限 | 2026/Q2 前完成 | 有空再做 |

---

## 34-2：時程與里程碑 (Timeline & Milestones)

### 甘特圖 (Gantt Chart) 基本概念

```
任務             | W1 | W2 | W3 | W4 | W5 | W6 | W7 | W8 |
─────────────────┼────┼────┼────┼────┼────┼────┼────┼────┤
需求確認          |████|    |    |    |    |    |    |    |
UI 設計           |    |████|████|    |    |    |    |    |
前端開發          |    |    |████|████|████|    |    |    |
後端開發          |    |    |████|████|████|    |    |    |
SIT 測試          |    |    |    |    |    |████|    |    |
UAT 測試          |    |    |    |    |    |    |████|    |
上線部署          |    |    |    |    |    |    |    |████|
                  M1                  M2        M3   M4
M1: 需求凍結  M2: 開發完成  M3: UAT 通過  M4: 正式上線
```

### 里程碑 (Milestone) 設定原則

- 里程碑是**可驗證的完成點**，不是進行中的活動
- 每 2-4 週應有一個里程碑（太長會失去控制感）
- 里程碑要有明確的 Deliverable（交付物）

### 關鍵路徑法 (Critical Path Method)

```
A(3天) → C(5天) → E(2天)
                           ↘
                             G(3天) → 完成
                           ↗
B(2天) → D(4天) → F(3天)

關鍵路徑：A → C → E → G = 13 天
非關鍵路徑：B → D → F → G = 12 天

→ 專案最短完成時間 = 13 天
→ 路徑 B-D-F 有 1 天的 Buffer（浮動時間）
```

### 估時方法

| 方法 | 做法 | 適用場景 |
|------|------|---------|
| Expert Judgment | 請有經驗的人估 | 類似專案做過 |
| Analogous | 參考類似專案 | 有歷史資料 |
| Three-point | (樂觀 + 4×最可能 + 悲觀) / 6 | 不確定性高 |
| Planning Poker | 團隊成員各自估，討論差異 | Agile 團隊 |
| T-shirt Sizing | S / M / L / XL 快速分類 | 早期粗略估計 |

### 估時範例：Three-point Estimation

```
任務：付款模組整合
  樂觀 (O)：5 天
  最可能 (M)：8 天
  悲觀 (P)：15 天

  預期時間 = (5 + 4×8 + 15) / 6 = 8.7 天
  標準差 = (15 - 5) / 6 = 1.67 天

  → 預估 8-10 天完成（含 buffer）
```

### Buffer 管理

```
總時程 = 實際估計 + Buffer
Buffer 建議：
  - 低風險任務：+10-15%
  - 中風險任務：+20-30%
  - 高風險 / 從未做過：+50%

注意：不要在每個任務都加 Buffer（會膨脹）
建議：在專案層級加一個統一的 Buffer
```

---

## 34-3：風險管理 (Risk Management)

### 風險矩陣

```
影響程度 ↑
  高 │ 中風險  │ 高風險   │ 極高風險 │
     │ 監控    │ 準備方案 │ 立即處理 │
  中 │ 低風險  │ 中風險   │ 高風險   │
     │ 接受    │ 監控     │ 準備方案 │
  低 │ 極低風險│ 低風險   │ 中風險   │
     │ 忽略    │ 接受     │ 監控     │
     └────────┴─────────┴─────────┘
      低        中        高     → 發生機率
```

### 風險登記表 (Risk Register)

| 風險 ID | 風險描述 | 機率 | 影響 | 等級 | 應對策略 | 負責人 |
|--------|---------|------|------|------|---------|--------|
| R-001 | 關鍵工程師離職 | 中 | 高 | 高 | 文件化 + 備援人力 | PM |
| R-002 | 第三方 API 不穩定 | 高 | 中 | 高 | 準備降級方案 | Tech Lead |
| R-003 | 需求變更頻繁 | 高 | 高 | 極高 | 凍結需求 + CR 流程 | PM |
| R-004 | 測試環境延遲 | 中 | 中 | 中 | 提早申請環境 | DevOps |
| R-005 | 使用者抗拒新系統 | 中 | 高 | 高 | 教育訓練 + 漸進上線 | BA |

### 四種風險應對策略

| 策略 | 說明 | 範例 |
|------|------|------|
| Avoid（迴避） | 改變計畫消除風險 | 不用不穩定的技術 |
| Mitigate（降低） | 降低機率或影響 | 增加 Code Review 降低 Bug |
| Transfer（轉移） | 把風險轉給別人 | 外包、買保險 |
| Accept（接受） | 承認風險，準備應變 | 低影響的風險直接接受 |

### RAID Log

```
R - Risks（風險）：可能發生的壞事
A - Assumptions（假設）：我們假設為真的事
I - Issues（問題）：已經發生的壞事
D - Dependencies（依賴）：仰賴外部的事

範例：
Risk: 第三方付款 API 可能在雙 11 當機
Assumption: 業務方會在 3/15 前完成需求確認
Issue: 測試環境昨天掛了，今天 UAT 暫停
Dependency: 資料庫遷移需要 DBA 團隊支援
```

---

## 34-4：優先順序與取捨 (Priority & Trade-offs)

### MoSCoW Method

| 等級 | 說明 | 比例建議 |
|------|------|---------|
| **Must Have** | 沒有就不能上線 | 60% |
| **Should Have** | 重要但非必須 | 20% |
| **Could Have** | 有更好，沒有也行 | 15% |
| **Won't Have** | 這次不做 | 5% |

### 範例：電商改版 MoSCoW

```
Must Have：
  ✅ 商品瀏覽與搜尋
  ✅ 購物車與結帳
  ✅ 會員登入
  ✅ 訂單管理

Should Have：
  📌 商品推薦
  📌 願望清單
  📌 訂單追蹤

Could Have：
  💡 社群分享
  💡 商品比較
  💡 個人化首頁

Won't Have（this time）：
  ❌ 直播購物
  ❌ AR 試穿
  ❌ 跨境物流
```

### Eisenhower Matrix（緊急重要矩陣）

```
             緊急              不緊急
        ┌─────────────┬─────────────┐
  重要  │ DO           │ SCHEDULE     │
        │ 立即處理     │ 排入計畫     │
        │ 系統當機     │ 架構優化     │
        ├─────────────┼─────────────┤
不重要  │ DELEGATE     │ ELIMINATE    │
        │ 委託別人做   │ 不要做       │
        │ 日常報表     │ 過多的會議   │
        └─────────────┴─────────────┘
```

### Trade-off 對話範例

```
情境：客戶要求增加功能但不延後上線日期

錯誤回答：「好的，我們會想辦法。」（加班到死）

正確回答：
「我理解這個功能的重要性。讓我說明目前的狀況：
  - 增加此功能需要額外 3 週開發 + 1 週測試
  - 如果維持原訂上線日期，我們有三個選項：
    1. 移除 [其他 Should Have 功能] 來騰出時間
    2. 先上線核心功能，此功能排入第二階段（上線後 1 個月）
    3. 增加 2 位開發人員（需額外預算 $XXK）
  - 我的建議是選項 2，因為...」
```

---

## 34-5：Agile / Scrum 基礎

### Waterfall vs Agile

| 面向 | Waterfall | Agile |
|------|-----------|-------|
| 流程 | 線性、依序執行 | 迭代、循環進行 |
| 需求 | 一開始就確定 | 持續調整 |
| 交付 | 最後一次交付 | 每個 Sprint 交付 |
| 變更 | 成本高、抗拒變更 | 擁抱變更 |
| 文件 | 完整文件 | 夠用就好 |
| 適用 | 需求明確的專案 | 需求模糊、快速變化 |

### Scrum 框架

```
Product Backlog
      ↓
Sprint Planning → Sprint Backlog
      ↓
Sprint（2-4 週）
  ├── Daily Standup（每天 15 分鐘）
  ├── 開發 & 測試
  └── Sprint Review（展示成果）
      ↓
Sprint Retrospective（回顧改善）
      ↓
下一個 Sprint...
```

### Scrum 角色

| 角色 | 職責 | 類比 |
|------|------|------|
| Product Owner (PO) | 決定做什麼、排優先順序 | 老闆 / 業務代表 |
| Scrum Master (SM) | 確保流程順暢、移除障礙 | 教練 / 引導者 |
| Development Team | 實際執行開發 | 球員 |

### Scrum Artifacts

| Artifact | 說明 |
|----------|------|
| Product Backlog | 所有待辦事項的清單（PO 管理） |
| Sprint Backlog | 這個 Sprint 要做的事（Team 承諾） |
| Increment | Sprint 結束時的可交付成果 |

### User Story 格式

```
As a [角色],
I want to [做什麼],
So that [為什麼 / 價值].

範例：
As a 電商會員,
I want to 用信用卡結帳,
So that 我可以快速完成購買.

Acceptance Criteria（驗收標準）：
  - 支援 Visa、Mastercard、JCB
  - 付款成功後顯示訂單確認頁
  - 付款失敗顯示錯誤訊息並可重試
  - 交易紀錄保存於訂單系統
```

### Story Point 估算

```
Fibonacci 數列：1, 2, 3, 5, 8, 13, 21

1 point = 非常簡單，幾小時搞定
3 points = 一般任務，1-2 天
5 points = 有些複雜，2-3 天
8 points = 複雜，需要一週
13 points = 很複雜，可能要拆分
21 points = 太大了，一定要拆分

Team Velocity（團隊速度）：
  Sprint 1：完成 30 points
  Sprint 2：完成 35 points
  Sprint 3：完成 28 points
  平均 Velocity = 31 points / Sprint
```

---

## 34-6：Sprint Planning 實戰

### Sprint Planning 流程

```
1. PO 說明 Sprint Goal（5 分鐘）
   ↓
2. PO 介紹優先項目（20 分鐘）
   ↓
3. Team 估算 Story Points（30 分鐘）
   ↓
4. Team 承諾 Sprint Backlog（15 分鐘）
   ↓
5. 拆分為具體 Tasks（20 分鐘）
```

### Sprint Planning 範例

```
Sprint #5 Planning
Sprint Goal：完成結帳流程改版
Sprint Duration：2 週（10 個工作天）
Team Velocity：~30 points

Sprint Backlog：
┌────────────────────────────┬────────┬────────┐
│ User Story                 │ Points │ 負責人  │
├────────────────────────────┼────────┼────────┤
│ 信用卡付款流程              │ 8      │ Alice  │
│ 結帳頁 UI 改版              │ 5      │ Bob    │
│ 訂單確認 Email              │ 3      │ Carol  │
│ 付款失敗處理                │ 5      │ Alice  │
│ 結帳頁 RWD                  │ 5      │ Bob    │
│ 付款安全性檢查              │ 3      │ Dave   │
├────────────────────────────┼────────┼────────┤
│ 總計                       │ 29     │        │
└────────────────────────────┴────────┴────────┘
```

### Daily Standup 模板

```
每人 2 分鐘，回答三個問題：
1. 昨天完成了什麼？
2. 今天計畫做什麼？
3. 有什麼 Blocker？

範例：
「昨天我完成了信用卡付款的前端表單，
 今天要串接付款 API，
 目前被第三方 API 文件不完整卡住，
 需要 PM 協助聯繫對方技術窗口。」
```

### Sprint Retrospective 框架

```
三個問題：
1. What went well?（做得好的）
   - Daily standup 有效率
   - 提早發現 API 整合問題

2. What didn't go well?（需改善的）
   - 需求中途變更導致重工
   - 測試環境不穩定

3. Action items（具體改善行動）
   - 需求確認後發正式 Email 記錄 → Owner: PM
   - 建立自動化環境健康檢查 → Owner: DevOps
```

### Kanban 看板

```
┌──────────┬──────────┬──────────┬──────────┐
│ To Do    │ In Prog  │ Review   │ Done     │
├──────────┼──────────┼──────────┼──────────┤
│ 📋 Story5│ 🔧 Story1│ 👀 Story3│ ✅ Story4│
│ 📋 Story6│ 🔧 Story2│          │ ✅ Story7│
│          │          │          │          │
└──────────┴──────────┴──────────┴──────────┘
WIP Limit:      3         2
```

### 面試實戰題

**Q：你的專案延遲了，你會怎麼做？**

```
回答框架：
1. 分析原因
   - 哪些任務延遲了？為什麼？
   - 是估計不準？還是遇到意外風險？

2. 評估影響
   - 延遲多少？對後續里程碑的影響？
   - 是否影響其他團隊？

3. 提出方案（Trade-off 思維）
   - 選項 A：減少 Scope（移除 Should Have 功能）
   - 選項 B：延後上線日期（如果可接受）
   - 選項 C：增加資源（但要考慮 Ramp-up Time）
   - 選項 D：並行處理（調整任務依賴關係）

4. 溝通
   - 主動、透明、提供數據
   - 帶著方案去溝通，不是帶著問題去
```

---

## 🔑 World 34 Cheat Sheet

### 專案管理核心觀念

```
Iron Triangle：Scope / Time / Cost（三者互相牽制）

WBS：把大任務拆成小任務的樹狀結構
MoSCoW：Must / Should / Could / Won't（需求排優先）
Critical Path：決定專案最短完成時間的路徑

風險管理四策略：Avoid / Mitigate / Transfer / Accept

Scrum 三個角色：PO / SM / Team
Scrum 三個 Artifact：Product Backlog / Sprint Backlog / Increment
Scrum 四個會議：Planning / Daily / Review / Retro

User Story：As a [誰], I want [什麼], So that [為什麼]
Story Point：用 Fibonacci 數列估算相對複雜度
Velocity：團隊每個 Sprint 能完成的 Points 數

Scope Creep 防範：
  走正式 CR 流程 → 評估影響 → 用數據溝通

專案延遲處理：
  分析原因 → 評估影響 → 提出方案 → 主動溝通
```

### 面試萬用框架

```
任何專案管理問題：
1. 明確目標（SMART）
2. 拆解任務（WBS）
3. 排優先順序（MoSCoW）
4. 估時程（Three-point / Planning Poker）
5. 識別風險（Risk Matrix）
6. 持續溝通（Daily / Weekly）
7. 持續改善（Retro）
```

"""

    // MARK: - World 34 (en)
    private static let enWorld34 = """

# World 34: Project Management Basics

> Whether you're a Business Engineer or a Product Analyst, you will be involved in projects.
> Understanding the fundamentals of project management demonstrates your ability to "execute and deliver" in interviews.

Great analysis and planning are meaningless without the ability to manage execution.
This chapter teaches you the complete project management fundamentals from scope definition to Sprint Planning.

---

## 34-1: Scope Definition

### The Iron Triangle

```
        Scope
         /      \\
        /  Quality \\
       /            \\
      /              \\
  Time ————————————— Cost
```

**Core Concept**: All three cannot be optimized simultaneously — changing one inevitably impacts the other two.

### Scope Definition Tool: WBS (Work Breakdown Structure)

```
E-commerce Platform Revamp
├── 1. Frontend Revamp
│   ├── 1.1 Homepage Redesign
│   ├── 1.2 Product Page Revamp
│   └── 1.3 Shopping Cart UX Optimization
├── 2. Backend Development
│   ├── 2.1 Search Engine Upgrade
│   ├── 2.2 Payment Module Integration
│   └── 2.3 API Performance Optimization
├── 3. Testing
│   ├── 3.1 SIT
│   └── 3.2 UAT
└── 4. Go-Live
    ├── 4.1 Data Migration
    └── 4.2 Production Deployment
```

### In Scope vs Out of Scope

| In Scope | Out of Scope |
|----------|-------------|
| Frontend UI revamp | Mobile app development |
| Existing payment method integration | Cryptocurrency payment support |
| Primary language interface | Multi-language support |
| Existing member migration | Social login integration |

### Scope Creep

```
Common Scenarios:
Client: "Since we're already making changes, can you add feature XXX?"
Manager: "This should be simple, just add it real quick."

How to Handle:
1. Assess impact (time, cost, risk)
2. Follow the formal change process (Change Request)
3. Use data to communicate: "Adding this feature requires 2 extra weeks and $50K"
4. Offer alternatives: "We can build a simplified version first and enhance it in a later release"
```

### SMART Goals

| Element | Description | Good Example | Bad Example |
|---------|-------------|-------------|-------------|
| Specific | Well-defined | Reduce checkout steps from 5 to 3 | Improve user experience |
| Measurable | Quantifiable | Increase cart conversion rate by 15% | Increase conversion rate |
| Achievable | Realistic | Feasible based on historical data | 10x monthly revenue |
| Relevant | Aligned | Consistent with company Q2 goals | Unrelated to business direction |
| Time-bound | Has a deadline | Complete by 2026/Q2 | Do it when we have time |

---

## 34-2: Timeline & Milestones

### Gantt Chart Basics

```
Task              | W1 | W2 | W3 | W4 | W5 | W6 | W7 | W8 |
──────────────────┼────┼────┼────┼────┼────┼────┼────┼────┤
Requirements      |████|    |    |    |    |    |    |    |
UI Design         |    |████|████|    |    |    |    |    |
Frontend Dev      |    |    |████|████|████|    |    |    |
Backend Dev       |    |    |████|████|████|    |    |    |
SIT Testing       |    |    |    |    |    |████|    |    |
UAT Testing       |    |    |    |    |    |    |████|    |
Go-Live Deploy    |    |    |    |    |    |    |    |████|
                  M1                  M2        M3   M4
M1: Requirements Freeze  M2: Dev Complete  M3: UAT Passed  M4: Go-Live
```

### Milestone Setting Principles

- A milestone is a **verifiable completion point**, not an ongoing activity
- There should be a milestone every 2-4 weeks (too long loses control)
- Each milestone must have a clear Deliverable

### Critical Path Method

```
A(3 days) → C(5 days) → E(2 days)
                                    ↘
                                      G(3 days) → Complete
                                    ↗
B(2 days) → D(4 days) → F(3 days)

Critical Path: A → C → E → G = 13 days
Non-critical Path: B → D → F → G = 12 days

→ Minimum project completion time = 13 days
→ Path B-D-F has 1 day of Buffer (float)
```

### Estimation Methods

| Method | Approach | Best For |
|--------|----------|----------|
| Expert Judgment | Ask experienced people | Similar past projects |
| Analogous | Reference similar projects | When historical data exists |
| Three-point | (Optimistic + 4×Most Likely + Pessimistic) / 6 | High uncertainty |
| Planning Poker | Team members estimate independently, discuss differences | Agile teams |
| T-shirt Sizing | S / M / L / XL quick classification | Early rough estimates |

### Estimation Example: Three-point

```
Task: Payment Module Integration
  Optimistic (O): 5 days
  Most Likely (M): 8 days
  Pessimistic (P): 15 days

  Expected Time = (5 + 4×8 + 15) / 6 = 8.7 days
  Standard Deviation = (15 - 5) / 6 = 1.67 days

  → Estimated 8-10 days to complete (including buffer)
```

### Buffer Management

```
Total Timeline = Actual Estimate + Buffer
Buffer Guidelines:
  - Low-risk tasks: +10-15%
  - Medium-risk tasks: +20-30%
  - High-risk / Never done before: +50%

Note: Don't add buffer to every individual task (it inflates)
Recommendation: Add a single unified buffer at the project level
```

---

## 34-3: Risk Management

### Risk Matrix

```
Impact ↑
  High │ Medium   │ High     │ Very High│
       │ Monitor  │ Plan     │ Act Now  │
  Med  │ Low      │ Medium   │ High     │
       │ Accept   │ Monitor  │ Plan     │
  Low  │ Very Low │ Low      │ Medium   │
       │ Ignore   │ Accept   │ Monitor  │
       └──────────┴──────────┴──────────┘
        Low        Med        High    → Probability
```

### Risk Register

| Risk ID | Risk Description | Probability | Impact | Level | Mitigation Strategy | Owner |
|---------|-----------------|-------------|--------|-------|-------------------|-------|
| R-001 | Key engineer leaves | Med | High | High | Documentation + backup staffing | PM |
| R-002 | Third-party API instability | High | Med | High | Prepare fallback plan | Tech Lead |
| R-003 | Frequent requirement changes | High | High | Very High | Requirements freeze + CR process | PM |
| R-004 | Test environment delay | Med | Med | Med | Request environment early | DevOps |
| R-005 | User resistance to new system | Med | High | High | Training + phased rollout | BA |

### Four Risk Response Strategies

| Strategy | Description | Example |
|----------|-------------|---------|
| Avoid | Change plans to eliminate risk | Don't use unstable technology |
| Mitigate | Reduce probability or impact | Add code review to reduce bugs |
| Transfer | Shift risk to someone else | Outsource, buy insurance |
| Accept | Acknowledge risk, prepare response | Accept low-impact risks directly |

### RAID Log

```
R - Risks: Bad things that might happen
A - Assumptions: Things we assume to be true
I - Issues: Bad things that have already happened
D - Dependencies: Things we rely on externally

Examples:
Risk: Third-party payment API may go down during major sales events
Assumption: Business will finalize requirements by 3/15
Issue: Test environment went down yesterday, UAT paused today
Dependency: Database migration requires DBA team support
```

---

## 34-4: Priority & Trade-offs

### MoSCoW Method

| Level | Description | Suggested Ratio |
|-------|-------------|----------------|
| **Must Have** | Cannot go live without it | 60% |
| **Should Have** | Important but not essential | 20% |
| **Could Have** | Nice to have, okay without | 15% |
| **Won't Have** | Not doing this time | 5% |

### Example: E-commerce Revamp MoSCoW

```
Must Have:
  ✅ Product browsing and search
  ✅ Shopping cart and checkout
  ✅ Member login
  ✅ Order management

Should Have:
  📌 Product recommendations
  📌 Wishlist
  📌 Order tracking

Could Have:
  💡 Social sharing
  💡 Product comparison
  💡 Personalized homepage

Won't Have (this time):
  ❌ Live shopping
  ❌ AR try-on
  ❌ Cross-border logistics
```

### Eisenhower Matrix (Urgent-Important Matrix)

```
             Urgent            Not Urgent
        ┌─────────────┬─────────────┐
Import- │ DO           │ SCHEDULE     │
ant     │ Handle now   │ Plan it      │
        │ System crash │ Architecture │
        ├─────────────┼─────────────┤
Not     │ DELEGATE     │ ELIMINATE    │
Import- │ Delegate     │ Don't do it  │
ant     │ Routine rpts │ Too many mtgs│
        └─────────────┴─────────────┘
```

### Trade-off Conversation Example

```
Scenario: Client requests additional features but won't delay the launch date

Wrong Answer: "Okay, we'll figure it out." (work overtime to death)

Correct Answer:
"I understand the importance of this feature. Let me explain the current situation:
  - Adding this feature requires an additional 3 weeks of development + 1 week of testing
  - If we keep the original launch date, we have three options:
    1. Remove [other Should Have features] to free up time
    2. Launch core features first, schedule this feature for Phase 2 (1 month post-launch)
    3. Add 2 more developers (requires additional budget of $XXK)
  - I recommend Option 2, because..."
```

---

## 34-5: Agile / Scrum Fundamentals

### Waterfall vs Agile

| Aspect | Waterfall | Agile |
|--------|-----------|-------|
| Process | Linear, sequential | Iterative, cyclical |
| Requirements | Fixed upfront | Continuously adjusted |
| Delivery | Single final delivery | Delivered each Sprint |
| Changes | High cost, resistant to change | Embraces change |
| Documentation | Comprehensive docs | Just enough |
| Best For | Well-defined requirements | Ambiguous, rapidly changing needs |

### Scrum Framework

```
Product Backlog
      ↓
Sprint Planning → Sprint Backlog
      ↓
Sprint (2-4 weeks)
  ├── Daily Standup (15 minutes daily)
  ├── Development & Testing
  └── Sprint Review (demo results)
      ↓
Sprint Retrospective (reflect & improve)
      ↓
Next Sprint...
```

### Scrum Roles

| Role | Responsibility | Analogy |
|------|---------------|---------|
| Product Owner (PO) | Decides what to build, prioritizes | Boss / Business representative |
| Scrum Master (SM) | Ensures smooth process, removes blockers | Coach / Facilitator |
| Development Team | Actually builds the product | Players |

### Scrum Artifacts

| Artifact | Description |
|----------|-------------|
| Product Backlog | List of all pending items (managed by PO) |
| Sprint Backlog | Items committed for this Sprint (Team commitment) |
| Increment | Deliverable output at Sprint end |

### User Story Format

```
As a [role],
I want to [do something],
So that [why / value].

Example:
As an e-commerce member,
I want to pay by credit card,
So that I can quickly complete my purchase.

Acceptance Criteria:
  - Supports Visa, Mastercard, JCB
  - Displays order confirmation page after successful payment
  - Displays error message with retry option on payment failure
  - Transaction records saved in the order system
```

### Story Point Estimation

```
Fibonacci Sequence: 1, 2, 3, 5, 8, 13, 21

1 point = Very simple, a few hours
3 points = Regular task, 1-2 days
5 points = Somewhat complex, 2-3 days
8 points = Complex, about a week
13 points = Very complex, may need to be split
21 points = Too large, must be split

Team Velocity:
  Sprint 1: Completed 30 points
  Sprint 2: Completed 35 points
  Sprint 3: Completed 28 points
  Average Velocity = 31 points / Sprint
```

---

## 34-6: Sprint Planning in Practice

### Sprint Planning Process

```
1. PO explains Sprint Goal (5 minutes)
   ↓
2. PO presents priority items (20 minutes)
   ↓
3. Team estimates Story Points (30 minutes)
   ↓
4. Team commits to Sprint Backlog (15 minutes)
   ↓
5. Break down into specific Tasks (20 minutes)
```

### Sprint Planning Example

```
Sprint #5 Planning
Sprint Goal: Complete checkout flow revamp
Sprint Duration: 2 weeks (10 working days)
Team Velocity: ~30 points

Sprint Backlog:
┌────────────────────────────┬────────┬────────┐
│ User Story                 │ Points │ Owner  │
├────────────────────────────┼────────┼────────┤
│ Credit card payment flow   │ 8      │ Alice  │
│ Checkout page UI revamp    │ 5      │ Bob    │
│ Order confirmation email   │ 3      │ Carol  │
│ Payment failure handling   │ 5      │ Alice  │
│ Checkout page RWD          │ 5      │ Bob    │
│ Payment security check     │ 3      │ Dave   │
├────────────────────────────┼────────┼────────┤
│ Total                      │ 29     │        │
└────────────────────────────┴────────┴────────┘
```

### Daily Standup Template

```
Each person 2 minutes, answer three questions:
1. What did you complete yesterday?
2. What do you plan to do today?
3. Are there any blockers?

Example:
"Yesterday I completed the credit card payment frontend form.
 Today I plan to integrate the payment API.
 I'm currently blocked by incomplete third-party API documentation.
 I need the PM to help contact their technical team."
```

### Sprint Retrospective Framework

```
Three Questions:
1. What went well?
   - Daily standup was efficient
   - Discovered API integration issue early

2. What didn't go well?
   - Mid-sprint requirement changes caused rework
   - Unstable test environment

3. Action items (specific improvement actions)
   - Send formal email to confirm requirements after sign-off → Owner: PM
   - Set up automated environment health checks → Owner: DevOps
```

### Kanban Board

```
┌──────────┬──────────┬──────────┬──────────┐
│ To Do    │ In Prog  │ Review   │ Done     │
├──────────┼──────────┼──────────┼──────────┤
│ 📋 Story5│ 🔧 Story1│ 👀 Story3│ ✅ Story4│
│ 📋 Story6│ 🔧 Story2│          │ ✅ Story7│
│          │          │          │          │
└──────────┴──────────┴──────────┴──────────┘
WIP Limit:      3         2
```

### Interview Practice Question

**Q: Your project is behind schedule. What do you do?**

```
Answer Framework:
1. Analyze the Cause
   - Which tasks are delayed? Why?
   - Was it inaccurate estimation? Or unexpected risks?

2. Assess the Impact
   - How much delay? Impact on subsequent milestones?
   - Does it affect other teams?

3. Propose Solutions (Trade-off Thinking)
   - Option A: Reduce Scope (remove Should Have features)
   - Option B: Delay the launch date (if acceptable)
   - Option C: Add resources (but consider ramp-up time)
   - Option D: Parallelize work (adjust task dependencies)

4. Communicate
   - Proactively, transparently, with data
   - Come with solutions, not just problems
```

---

## Key Takeaways - World 34 Cheat Sheet

### Project Management Core Concepts

```
Iron Triangle: Scope / Time / Cost (all three are interdependent)

WBS: Tree structure that breaks large tasks into smaller ones
MoSCoW: Must / Should / Could / Won't (requirement prioritization)
Critical Path: The path that determines the minimum project completion time

Risk Management Four Strategies: Avoid / Mitigate / Transfer / Accept

Scrum Three Roles: PO / SM / Team
Scrum Three Artifacts: Product Backlog / Sprint Backlog / Increment
Scrum Four Ceremonies: Planning / Daily / Review / Retro

User Story: As a [who], I want [what], So that [why]
Story Point: Relative complexity estimated using Fibonacci sequence
Velocity: Number of points a team can complete per Sprint

Scope Creep Prevention:
  Follow formal CR process → Assess impact → Communicate with data

Handling Project Delays:
  Analyze cause → Assess impact → Propose solutions → Communicate proactively
```

### Universal Interview Framework

```
For any project management question:
1. Define goals (SMART)
2. Break down tasks (WBS)
3. Prioritize (MoSCoW)
4. Estimate timeline (Three-point / Planning Poker)
5. Identify risks (Risk Matrix)
6. Communicate continuously (Daily / Weekly)
7. Continuously improve (Retro)
```

"""

    // MARK: - World 35 (zh)
    private static let zhWorld35 = """

# World 35：問題解決框架 (Problem-Solving Frameworks)

> 面試中最常被考的不是技術細節，而是「你怎麼思考問題」。
> 學會結構化的問題解決方法，讓你在 Case Interview 和工作中都能從容應對。

顧問公司面試的核心就是問題解決能力。
但這個能力在任何商業角色都至關重要。

---

## 35-1：MECE 問題拆解

### MECE 原則

**MECE = Mutually Exclusive, Collectively Exhaustive**
（互相獨立，完全窮盡）

```
✅ MECE 拆法：
營收下滑原因
├── 銷量下降
│   ├── 新客減少
│   └── 舊客流失
└── 客單價下降
    ├── 折扣增加
    └── 產品組合改變

❌ 非 MECE 拆法：
營收下滑原因
├── 客人變少（跟下面重疊）
├── 行銷效果不好（跟上面重疊）
├── 競爭對手搶客（只是原因之一）
└── 景氣不好（太籠統）
```

### 常用 MECE 拆解維度

| 拆解方式 | 範例 |
|---------|------|
| 營收公式 | 營收 = 客戶數 × 客單價 × 購買頻率 |
| 漏斗拆解 | 曝光 → 點擊 → 註冊 → 付費 → 留存 |
| 供需拆解 | 供給面 vs 需求面 |
| 內外拆解 | 內部因素 vs 外部因素 |
| 3C 分析 | Company / Customer / Competitor |
| 4P 分析 | Product / Price / Place / Promotion |
| Value Chain | 採購 → 生產 → 物流 → 銷售 → 售後 |

### Issue Tree 建構步驟

```
Step 1：定義核心問題
  「為什麼 Q1 營收比去年同期下降 15%？」

Step 2：第一層拆解（MECE）
  ├── 銷量問題？
  └── 價格問題？

Step 3：第二層拆解
  ├── 銷量問題
  │   ├── 新客獲取下降？
  │   │   ├── 行銷觸及人數減少？
  │   │   └── 轉換率下降？
  │   └── 舊客回購下降？
  │       ├── 客戶流失增加？
  │       └── 購買頻率下降？
  └── 價格問題
      ├── 產品定價調降？
      └── 折扣/促銷增加？

Step 4：針對每個末端節點，找數據驗證
```

### 面試實戰練習

```
Q：一間連鎖咖啡店的利潤下降了，請分析原因。

MECE 拆解：
利潤 = 營收 - 成本

營收面：
├── 來客數下降？
│   ├── 商圈人流減少？
│   ├── 品牌吸引力下降？
│   └── 競爭對手搶客？
└── 客單價下降？
    ├── 消費降級（買便宜品項）？
    └── 促銷活動過多？

成本面：
├── 原物料成本上升？
│   ├── 咖啡豆漲價？
│   └── 牛奶/包材漲價？
├── 人事成本增加？
│   ├── 基本工資調漲？
│   └── 人力配置不當？
└── 租金/營運成本上升？
```

---

## 35-2：假說思維 (Hypothesis Thinking)

### 什麼是假說思維？

```
傳統思維：收集所有資料 → 分析 → 結論
假說思維：先提假說 → 用資料驗證 → 修正或確認

優勢：
  ✅ 節省時間（不用大海撈針）
  ✅ 方向明確（知道要找什麼資料）
  ✅ 可快速迭代（錯了就換假說）
```

### 假說建立流程

```
1. 問題定義
   「為什麼 App 日活用戶（DAU）下降 20%？」

2. 初步假說（基於經驗和直覺）
   H1：最近改版導致使用體驗變差
   H2：競爭對手推出新產品搶走用戶
   H3：季節性因素（寒假結束）

3. 設計驗證方式
   H1 → 檢查改版前後的留存率和 Session 時長
   H2 → 調查競品近期動態、比較下載量
   H3 → 對比去年同期數據

4. 收集資料驗證
   H1 → 留存率從 45% 降到 30%，Session 時長減少 40%
   → H1 成立！進一步深挖：是哪個頁面流失最多？

5. 深化假說
   H1a：新版首頁改版導致用戶找不到核心功能
   H1b：新版載入速度變慢
   → 繼續用數據驗證
```

### Hypothesis Tree

```
核心假說：改版導致 DAU 下降
├── H1：UI 改版影響使用體驗
│   ├── H1a：首頁改版 → 核心功能點擊率下降 ✅ 數據支持
│   ├── H1b：載入速度變慢 → 跳出率上升 ❌ 數據不支持
│   └── H1c：導航結構改變 → 用戶迷路 ✅ 數據支持
├── H2：競品搶走用戶
│   └── H2a：競品同期下載量 → ❌ 無明顯增長
└── H3：季節性因素
    └── H3a：去年同期比較 → ❌ 去年同期是成長的
```

### 好假說 vs 壞假說

| 好假說 | 壞假說 |
|--------|--------|
| 具體、可驗證 | 模糊、無法驗證 |
| 「轉換率下降是因為結帳流程多了一步」 | 「可能是 UX 不好」 |
| 有明確的驗證方式 | 沒辦法找到支持或反對的數據 |
| 可以指導行動 | 知道了也不知道怎麼做 |

---

## 35-3：優先排序框架 (ICE / RICE)

### ICE Score

```
ICE = Impact × Confidence × Ease
（影響力 × 信心度 × 容易度）

每項 1-10 分
```

| 方案 | Impact | Confidence | Ease | ICE Score |
|------|--------|-----------|------|-----------|
| 簡化結帳流程 | 9 | 8 | 6 | 432 |
| 新增推薦引擎 | 8 | 5 | 3 | 120 |
| 改善搜尋功能 | 7 | 7 | 7 | 343 |
| 社群分享功能 | 5 | 4 | 8 | 160 |

→ 優先做：簡化結帳流程（ICE = 432）

### RICE Score

```
RICE = (Reach × Impact × Confidence) / Effort

Reach：影響多少用戶（每季）
Impact：對每個用戶的影響程度（0.25 / 0.5 / 1 / 2 / 3）
Confidence：信心百分比（100% / 80% / 50%）
Effort：需要多少人月
```

| 方案 | Reach | Impact | Confidence | Effort | RICE |
|------|-------|--------|-----------|--------|------|
| 結帳優化 | 10,000 | 3 | 80% | 2 | 12,000 |
| 推薦引擎 | 50,000 | 1 | 50% | 6 | 4,167 |
| App 推播 | 30,000 | 0.5 | 80% | 1 | 12,000 |
| 忠誠計畫 | 5,000 | 2 | 50% | 4 | 1,250 |

### 2x2 Matrix 優先排序

```
          高影響
            │
    Quick   │   Big Bets
    Wins    │   重點投入
            │
  ──────────┼──────────
            │
    Don't   │   Money
    Bother  │   Pits
    不做     │   避免
            │
          低影響
    低努力 ←───→ 高努力
```

### 選擇排序框架的時機

| 情境 | 建議框架 |
|------|---------|
| 快速篩選想法 | ICE（簡單快速） |
| 產品功能排序 | RICE（考量用戶規模） |
| 策略決策 | 2x2 Matrix（直覺但有效） |
| 多準則決策 | Weighted Scoring（加權評分） |

---

## 35-4：Trade-off 分析

### Trade-off 思維

```
商業決策很少有「最佳」答案，
幾乎都是在多個選項中做取捨。

面試官想看的不是你選了什麼，
而是你「怎麼思考取捨」。
```

### Trade-off 分析框架

```
Step 1：列出選項
Step 2：定義評估準則
Step 3：評估每個選項
Step 4：權衡取捨
Step 5：做出建議並說明理由
```

### 範例：選擇 CRM 系統

| 評估準則 | 權重 | Salesforce | HubSpot | 自建系統 |
|---------|------|-----------|---------|---------|
| 功能完整度 | 30% | 9 (2.7) | 7 (2.1) | 8 (2.4) |
| 導入成本 | 25% | 4 (1.0) | 8 (2.0) | 3 (0.75) |
| 維護成本 | 20% | 6 (1.2) | 8 (1.6) | 4 (0.8) |
| 客製化能力 | 15% | 7 (1.05) | 5 (0.75) | 10 (1.5) |
| 導入速度 | 10% | 6 (0.6) | 9 (0.9) | 2 (0.2) |
| **加權總分** | | **6.55** | **7.35** | **5.65** |

→ 建議：HubSpot（綜合最優，特別在成本和導入速度有優勢）

### 常見 Trade-off 類型

```
速度 vs 品質
  快速上線 vs 完善測試

成本 vs 功能
  便宜方案（功能少） vs 昂貴方案（功能多）

標準化 vs 客製化
  套裝軟體 vs 自建系統

短期 vs 長期
  Quick fix vs 根本解決

集中 vs 分散
  統一系統 vs 各部門自選
```

### 面試回答模板

```
「這是一個典型的 [A] vs [B] 的 trade-off。

  選 [A] 的好處是...，代價是...
  選 [B] 的好處是...，代價是...

  考量到 [公司現狀/目標/限制]，
  我建議選 [A/B]，因為...

  同時，為了降低代價，我們可以...」
```

---

## 35-5：建構建議 (Recommendation Building)

### Pyramid Principle（金字塔原理）

```
          ┌─────────────┐
          │  結論/建議    │  ← 先說結論
          └──────┬──────┘
        ┌────────┼────────┐
   ┌────┴───┐┌───┴────┐┌──┴─────┐
   │ 論點 1  ││ 論點 2  ││ 論點 3  │  ← 支持的理由
   └────┬───┘└───┬────┘└──┬─────┘
     證據1.1  證據2.1   證據3.1     ← 數據/事實
     證據1.2  證據2.2   證據3.2
```

### 建議的 SCQA 結構

```
S - Situation（情境）：
  「我們的電商平台轉換率持續下降，從 3.2% 降到 2.1%。」

C - Complication（衝突）：
  「如果不改善，預估 Q3 營收將短少 $2M。」

Q - Question（問題）：
  「如何在不增加行銷預算的前提下提升轉換率？」

A - Answer（答案）：
  「建議從三個方向著手：
   1. 簡化結帳流程（預估 +0.5% 轉換率）
   2. 加入商品推薦（預估 +0.3% 轉換率）
   3. 優化行動版體驗（預估 +0.3% 轉換率）」
```

### 建議強度層級

| 層級 | 用語 | 適用場景 |
|------|------|---------|
| 強烈建議 | 「我建議...」「應該...」 | 數據充分、風險低 |
| 中度建議 | 「值得考慮...」「建議評估...」 | 有支持但不確定 |
| 參考建議 | 「可以探索...」「作為選項之一...」 | 需要更多資料 |

### Action Plan 模板

```
建議：簡化結帳流程
預期效果：轉換率提升 0.5%

實施計畫：
┌──────┬─────────────────┬───────┬──────┐
│ 階段 │ 任務              │ 時程  │ 負責人│
├──────┼─────────────────┼───────┼──────┤
│ Phase 1 │ 用戶研究 + 數據分析 │ W1-2  │ PA   │
│ Phase 2 │ UI 原型設計       │ W3    │ UX   │
│ Phase 3 │ A/B Test 開發     │ W4-5  │ Dev  │
│ Phase 4 │ 測試 + 上線       │ W6    │ PM   │
│ Phase 5 │ 效果追蹤          │ W7-10 │ PA   │
└──────┴─────────────────┴───────┴──────┘

成功指標：
  - 結帳轉換率 ≥ 2.6%（目前 2.1%）
  - 結帳步驟從 5 步減為 3 步
  - 結帳平均耗時 < 2 分鐘

風險與應變：
  - 簡化流程可能遺漏必要欄位 → 做用戶測試確認
  - A/B Test 結果不顯著 → 延長測試期或調整方案
```

---

## 35-6：完整 Case 練習

### Case：線上教育平台的成長策略

```
背景：
一間線上教育平台（類似 Hahow）近半年成長停滯。
月活用戶（MAU）停在 50,000，付費轉換率 5%。
CEO 希望在 6 個月內將 MAU 提升到 80,000。
```

### Step 1：問題釐清

```
釐清問題：
- 目標：MAU 50K → 80K（+60%），6 個月
- 限制：預算 $500K，團隊 15 人
- 目前 Channel：自然流量 60%、社群 25%、付費廣告 15%
- 用戶輪廓：25-35 歲上班族，學習技能為主
```

### Step 2：MECE 拆解

```
MAU = 新用戶獲取 + 舊用戶回訪 - 流失用戶

新用戶獲取：
├── 付費渠道
│   ├── Google Ads
│   ├── Facebook / IG Ads
│   └── KOL 合作
├── 自然渠道
│   ├── SEO（內容行銷）
│   ├── 口碑推薦
│   └── App Store 排名
└── 合作渠道
    ├── 企業培訓合作
    └── 學校 / 機構合作

舊用戶回訪：
├── 推播通知
├── Email 行銷
└── 新課程上架

流失控制：
├── 改善課程品質
├── 社群經營
└── 個人化推薦
```

### Step 3：假說與驗證

```
H1：SEO 流量有大量成長空間（目前 SEO 佔比低）
  → 驗證：分析關鍵字競爭度和搜尋量
  → 結果：每月有 200K 相關搜尋量，目前只吃到 5%
  → ✅ 成立

H2：舊用戶回訪率低（只來一次就走）
  → 驗證：分析 30 天回訪率
  → 結果：30 天回訪率只有 15%（業界平均 30%）
  → ✅ 成立

H3：付費廣告 ROI 不佳
  → 驗證：分析 CAC 和 LTV
  → 結果：CAC $50，LTV $80，ROI 還行
  → ❌ 不是主要問題
```

### Step 4：排序（RICE）

| 方案 | Reach | Impact | Confidence | Effort | RICE |
|------|-------|--------|-----------|--------|------|
| SEO 內容策略 | 10,000 | 2 | 80% | 3 | 5,333 |
| Email 回訪活動 | 30,000 | 1 | 80% | 1 | 24,000 |
| 推薦獎勵計畫 | 5,000 | 3 | 50% | 2 | 3,750 |
| 企業合作方案 | 2,000 | 3 | 50% | 4 | 750 |

→ 優先級：Email 回訪 > SEO > 推薦獎勵 > 企業合作

### Step 5：建議

```
建議：聚焦兩個策略，6 個月內達成 MAU 80K

策略一：Email + 推播回訪活動（Quick Win）
  - 對 35K 未回訪用戶發送個人化課程推薦
  - 預估回訪率提升至 25% → +5,250 MAU
  - 投入：$50K，1 個月內上線

策略二：SEO 內容行銷（中長期）
  - 每月產出 30 篇高品質技能文章
  - 6 個月後預估自然流量翻倍 → +15,000 MAU
  - 投入：$200K（含內容團隊）

策略三：推薦獎勵計畫（輔助）
  - 現有用戶推薦朋友，雙方獲得免費課程
  - 預估每月 +2,000 MAU
  - 投入：$100K（獎勵成本）

預估總增長：5,250 + 15,000 + 12,000 = 32,250
目標 80K = 50K + 30K → 可達成 ✅
```

### Step 6：風險與追蹤

```
風險：
1. SEO 效果需要 3-6 個月才會顯現
   → 先做 Email 回訪作為短期補充
2. 推薦獎勵可能吸引非目標用戶
   → 設定推薦條件（需完成一堂課才能推薦）
3. 內容品質不穩定
   → 建立內容審核流程

追蹤指標：
  - 每週：MAU、新用戶、回訪率
  - 每月：各渠道 CAC、SEO 排名、推薦轉換率
  - 每季：LTV、付費轉換率、NPS
```

---

## 🔑 World 35 Cheat Sheet

### 問題解決五步驟

```
1. 定義問題（80% 的人在這步就走偏了）
2. MECE 拆解（結構化、不遺漏）
3. 假說驗證（大膽假設、小心求證）
4. 排序取捨（ICE / RICE / 2x2）
5. 建議行動（Pyramid / SCQA）

MECE 常用拆法：
  營收 = 客數 × 客單價 × 頻率
  利潤 = 營收 - 成本
  漏斗 = 曝光 → 點擊 → 轉換 → 留存
  內外 = 內部因素 vs 外部因素

假說思維：
  先有方向 → 找數據驗證 → 修正方向
  不是收集所有資料再分析

優先排序：
  ICE = Impact × Confidence × Ease
  RICE = (Reach × Impact × Confidence) / Effort
  2x2 = 影響 vs 努力

建議結構：
  SCQA = Situation → Complication → Question → Answer
  金字塔 = 結論 → 論點 → 證據
```

### 面試核心提醒

```
✅ 先釐清問題再作答（不要急著跳到解法）
✅ 用 MECE 展現結構化思維
✅ 每個論點都要有數據支持
✅ 明確說出 Trade-off
✅ 給出可執行的建議（不要只說方向）
❌ 不要列太多選項（3-4 個就好）
❌ 不要跳過假說直接給結論
❌ 不要忽略風險和限制
```

"""

    // MARK: - World 35 (en)
    private static let enWorld35 = """

# World 35: Problem-Solving Frameworks

> What interviewers test most often isn't technical detail — it's "how you think about problems."
> Learning structured problem-solving methods will help you handle case interviews and real work situations with confidence.

Problem-solving ability is the core of consulting firm interviews.
But this skill is critical in any business role.

---

## 35-1: MECE Problem Decomposition

### The MECE Principle

**MECE = Mutually Exclusive, Collectively Exhaustive**

```
✅ MECE Decomposition:
Revenue Decline Causes
├── Volume Decline
│   ├── New customer decrease
│   └── Existing customer churn
└── Average Order Value Decline
    ├── Increased discounts
    └── Product mix shift

❌ Non-MECE Decomposition:
Revenue Decline Causes
├── Fewer customers (overlaps with below)
├── Marketing not effective (overlaps with above)
├── Competitors stealing customers (only one factor)
└── Bad economy (too vague)
```

### Common MECE Decomposition Dimensions

| Decomposition Method | Example |
|---------------------|---------|
| Revenue Formula | Revenue = Customers × Avg Order Value × Purchase Frequency |
| Funnel Decomposition | Impression → Click → Sign-up → Payment → Retention |
| Supply/Demand | Supply side vs Demand side |
| Internal/External | Internal factors vs External factors |
| 3C Analysis | Company / Customer / Competitor |
| 4P Analysis | Product / Price / Place / Promotion |
| Value Chain | Procurement → Production → Logistics → Sales → After-sales |

### Issue Tree Construction Steps

```
Step 1: Define the core problem
  "Why did Q1 revenue decline 15% year-over-year?"

Step 2: First-level decomposition (MECE)
  ├── Volume problem?
  └── Price problem?

Step 3: Second-level decomposition
  ├── Volume Problem
  │   ├── New customer acquisition declining?
  │   │   ├── Marketing reach decreasing?
  │   │   └── Conversion rate declining?
  │   └── Existing customer repeat purchases declining?
  │       ├── Customer churn increasing?
  │       └── Purchase frequency declining?
  └── Price Problem
      ├── Product pricing reduced?
      └── Discounts/promotions increased?

Step 4: For each leaf node, find data to validate
```

### Interview Practice

```
Q: A chain coffee shop's profit has declined. Analyze the causes.

MECE Decomposition:
Profit = Revenue - Cost

Revenue Side:
├── Customer traffic declining?
│   ├── Foot traffic in the area decreasing?
│   ├── Brand attractiveness declining?
│   └── Competitors stealing customers?
└── Average ticket size declining?
    ├── Consumers trading down (buying cheaper items)?
    └── Too many promotions?

Cost Side:
├── Raw material costs rising?
│   ├── Coffee bean prices increasing?
│   └── Milk/packaging costs increasing?
├── Labor costs increasing?
│   ├── Minimum wage increase?
│   └── Improper staffing levels?
└── Rent/operating costs increasing?
```

---

## 35-2: Hypothesis Thinking

### What is Hypothesis Thinking?

```
Traditional Thinking: Collect all data → Analyze → Conclude
Hypothesis Thinking: Form hypothesis first → Validate with data → Revise or confirm

Advantages:
  ✅ Saves time (no needle-in-a-haystack searching)
  ✅ Clear direction (know what data to look for)
  ✅ Can iterate quickly (wrong? switch hypotheses)
```

### Hypothesis Building Process

```
1. Problem Definition
   "Why did App DAU (Daily Active Users) drop 20%?"

2. Initial Hypotheses (based on experience and intuition)
   H1: Recent redesign degraded user experience
   H2: Competitor launched new product stealing users
   H3: Seasonal factor (holiday season ended)

3. Design Validation Methods
   H1 → Check retention rate and session duration before/after redesign
   H2 → Investigate recent competitor activity, compare download numbers
   H3 → Compare with same period last year

4. Collect Data to Validate
   H1 → Retention dropped from 45% to 30%, session duration decreased 40%
   → H1 confirmed! Dig deeper: which page has the most drop-off?

5. Refine Hypothesis
   H1a: New homepage design makes core features hard to find
   H1b: New version has slower load times
   → Continue validating with data
```

### Hypothesis Tree

```
Core Hypothesis: Redesign caused DAU decline
├── H1: UI redesign impacted user experience
│   ├── H1a: Homepage redesign → core feature click rate dropped ✅ Data supports
│   ├── H1b: Load speed slowed → bounce rate increased ❌ Data doesn't support
│   └── H1c: Navigation structure changed → users got lost ✅ Data supports
├── H2: Competitor stole users
│   └── H2a: Competitor download volume during same period → ❌ No significant growth
└── H3: Seasonal factor
    └── H3a: Year-over-year comparison → ❌ Same period last year showed growth
```

### Good Hypothesis vs Bad Hypothesis

| Good Hypothesis | Bad Hypothesis |
|----------------|----------------|
| Specific, verifiable | Vague, unverifiable |
| "Conversion dropped because checkout added a step" | "Maybe the UX is bad" |
| Has a clear validation method | No way to find supporting or opposing data |
| Can guide action | Knowing it doesn't tell you what to do |

---

## 35-3: Prioritization Frameworks (ICE / RICE)

### ICE Score

```
ICE = Impact × Confidence × Ease

Each rated 1-10
```

| Initiative | Impact | Confidence | Ease | ICE Score |
|-----------|--------|-----------|------|-----------|
| Simplify checkout flow | 9 | 8 | 6 | 432 |
| Add recommendation engine | 8 | 5 | 3 | 120 |
| Improve search functionality | 7 | 7 | 7 | 343 |
| Social sharing feature | 5 | 4 | 8 | 160 |

→ Priority: Simplify checkout flow (ICE = 432)

### RICE Score

```
RICE = (Reach × Impact × Confidence) / Effort

Reach: How many users affected (per quarter)
Impact: Impact on each user (0.25 / 0.5 / 1 / 2 / 3)
Confidence: Confidence percentage (100% / 80% / 50%)
Effort: Person-months required
```

| Initiative | Reach | Impact | Confidence | Effort | RICE |
|-----------|-------|--------|-----------|--------|------|
| Checkout optimization | 10,000 | 3 | 80% | 2 | 12,000 |
| Recommendation engine | 50,000 | 1 | 50% | 6 | 4,167 |
| App push notifications | 30,000 | 0.5 | 80% | 1 | 12,000 |
| Loyalty program | 5,000 | 2 | 50% | 4 | 1,250 |

### 2x2 Matrix Prioritization

```
          High Impact
            │
    Quick   │   Big Bets
    Wins    │   Major investment
            │
  ──────────┼──────────
            │
    Don't   │   Money
    Bother  │   Pits
            │   Avoid
            │
          Low Impact
    Low Effort ←───→ High Effort
```

### When to Use Which Framework

| Scenario | Recommended Framework |
|----------|---------------------|
| Quick idea screening | ICE (simple, fast) |
| Product feature prioritization | RICE (accounts for user scale) |
| Strategic decisions | 2x2 Matrix (intuitive yet effective) |
| Multi-criteria decisions | Weighted Scoring |

---

## 35-4: Trade-off Analysis

### Trade-off Thinking

```
Business decisions rarely have a "best" answer.
Almost all of them involve making trade-offs between options.

Interviewers don't want to see what you chose;
they want to see "how you think about trade-offs."
```

### Trade-off Analysis Framework

```
Step 1: List options
Step 2: Define evaluation criteria
Step 3: Evaluate each option
Step 4: Weigh trade-offs
Step 5: Make a recommendation with rationale
```

### Example: Choosing a CRM System

| Evaluation Criteria | Weight | Salesforce | HubSpot | Custom-built |
|-------------------|--------|-----------|---------|-------------|
| Feature completeness | 30% | 9 (2.7) | 7 (2.1) | 8 (2.4) |
| Implementation cost | 25% | 4 (1.0) | 8 (2.0) | 3 (0.75) |
| Maintenance cost | 20% | 6 (1.2) | 8 (1.6) | 4 (0.8) |
| Customizability | 15% | 7 (1.05) | 5 (0.75) | 10 (1.5) |
| Implementation speed | 10% | 6 (0.6) | 9 (0.9) | 2 (0.2) |
| **Weighted Total** | | **6.55** | **7.35** | **5.65** |

→ Recommendation: HubSpot (best overall, particularly strong in cost and implementation speed)

### Common Trade-off Types

```
Speed vs Quality
  Fast launch vs Thorough testing

Cost vs Features
  Cheaper option (fewer features) vs Expensive option (more features)

Standardization vs Customization
  Off-the-shelf software vs Custom-built system

Short-term vs Long-term
  Quick fix vs Root cause resolution

Centralized vs Decentralized
  Unified system vs Department-specific tools
```

### Interview Answer Template

```
"This is a classic [A] vs [B] trade-off.

  Choosing [A] offers... at the cost of...
  Choosing [B] offers... at the cost of...

  Given [company situation/goals/constraints],
  I would recommend [A/B], because...

  At the same time, to mitigate the downsides, we could..."
```

---

## 35-5: Building Recommendations

### Pyramid Principle

```
          ┌─────────────┐
          │ Conclusion/  │  ← Lead with conclusion
          │ Recommendation│
          └──────┬──────┘
        ┌────────┼────────┐
   ┌────┴───┐┌───┴────┐┌──┴─────┐
   │ Point 1 ││ Point 2 ││ Point 3 │  ← Supporting arguments
   └────┬───┘└───┬────┘└──┬─────┘
     Evidence  Evidence  Evidence     ← Data/facts
     1.1       2.1       3.1
     Evidence  Evidence  Evidence
     1.2       2.2       3.2
```

### SCQA Structure for Recommendations

```
S - Situation:
  "Our e-commerce conversion rate has been declining, from 3.2% to 2.1%."

C - Complication:
  "If unchanged, projected Q3 revenue will fall short by $2M."

Q - Question:
  "How can we improve conversion rate without increasing the marketing budget?"

A - Answer:
  "I recommend three approaches:
   1. Simplify checkout flow (estimated +0.5% conversion rate)
   2. Add product recommendations (estimated +0.3% conversion rate)
   3. Optimize mobile experience (estimated +0.3% conversion rate)"
```

### Recommendation Strength Levels

| Level | Phrasing | When to Use |
|-------|----------|------------|
| Strong recommendation | "I recommend..." "We should..." | Data is sufficient, risk is low |
| Moderate recommendation | "Worth considering..." "I suggest evaluating..." | Some support but uncertain |
| Advisory recommendation | "Could explore..." "As one option..." | More data needed |

### Action Plan Template

```
Recommendation: Simplify checkout flow
Expected Impact: Conversion rate increase of 0.5%

Implementation Plan:
┌──────────┬─────────────────────┬───────┬───────┐
│ Phase    │ Task                │ Timeline│ Owner │
├──────────┼─────────────────────┼───────┼───────┤
│ Phase 1  │ User research + data│ W1-2  │ PA    │
│ Phase 2  │ UI prototype design │ W3    │ UX    │
│ Phase 3  │ A/B Test development│ W4-5  │ Dev   │
│ Phase 4  │ Testing + launch    │ W6    │ PM    │
│ Phase 5  │ Impact tracking     │ W7-10 │ PA    │
└──────────┴─────────────────────┴───────┴───────┘

Success Metrics:
  - Checkout conversion rate ≥ 2.6% (currently 2.1%)
  - Checkout steps reduced from 5 to 3
  - Average checkout time < 2 minutes

Risks & Mitigation:
  - Simplified flow may miss required fields → Conduct user testing to confirm
  - A/B Test results not significant → Extend test period or adjust approach
```

---

## 35-6: Complete Case Practice

### Case: Growth Strategy for an Online Education Platform

```
Background:
An online education platform (similar to Coursera/Udemy) has stagnated in growth.
MAU has plateaued at 50,000, with a 5% paid conversion rate.
The CEO wants to increase MAU to 80,000 within 6 months.
```

### Step 1: Problem Clarification

```
Clarifying the Problem:
- Target: MAU 50K → 80K (+60%), 6 months
- Constraints: $500K budget, 15-person team
- Current Channels: Organic traffic 60%, Social 25%, Paid ads 15%
- User Profile: Working professionals aged 25-35, learning new skills
```

### Step 2: MECE Decomposition

```
MAU = New User Acquisition + Returning Users - Churned Users

New User Acquisition:
├── Paid Channels
│   ├── Google Ads
│   ├── Facebook / IG Ads
│   └── KOL Partnerships
├── Organic Channels
│   ├── SEO (Content Marketing)
│   ├── Word of Mouth
│   └── App Store Ranking
└── Partnership Channels
    ├── Corporate Training Partnerships
    └── School / Institution Partnerships

Returning Users:
├── Push Notifications
├── Email Marketing
└── New Course Launches

Churn Control:
├── Improve Course Quality
├── Community Building
└── Personalized Recommendations
```

### Step 3: Hypothesis & Validation

```
H1: SEO traffic has significant growth potential (currently low share)
  → Validate: Analyze keyword competition and search volume
  → Result: 200K monthly relevant searches, currently capturing only 5%
  → ✅ Confirmed

H2: Return visit rate is low (users come once and leave)
  → Validate: Analyze 30-day return rate
  → Result: 30-day return rate only 15% (industry average 30%)
  → ✅ Confirmed

H3: Paid advertising ROI is poor
  → Validate: Analyze CAC and LTV
  → Result: CAC $50, LTV $80, ROI is acceptable
  → ❌ Not the main issue
```

### Step 4: Prioritization (RICE)

| Initiative | Reach | Impact | Confidence | Effort | RICE |
|-----------|-------|--------|-----------|--------|------|
| SEO content strategy | 10,000 | 2 | 80% | 3 | 5,333 |
| Email return visit campaign | 30,000 | 1 | 80% | 1 | 24,000 |
| Referral reward program | 5,000 | 3 | 50% | 2 | 3,750 |
| Corporate partnership program | 2,000 | 3 | 50% | 4 | 750 |

→ Priority: Email return visits > SEO > Referral rewards > Corporate partnerships

### Step 5: Recommendations

```
Recommendation: Focus on two strategies to achieve MAU 80K in 6 months

Strategy 1: Email + Push Return Visit Campaign (Quick Win)
  - Send personalized course recommendations to 35K inactive users
  - Estimated return rate increase to 25% → +5,250 MAU
  - Investment: $50K, launch within 1 month

Strategy 2: SEO Content Marketing (Mid-to-Long Term)
  - Produce 30 high-quality skill articles per month
  - After 6 months, estimated organic traffic doubles → +15,000 MAU
  - Investment: $200K (including content team)

Strategy 3: Referral Reward Program (Supporting)
  - Existing users refer friends, both receive free courses
  - Estimated +2,000 MAU per month
  - Investment: $100K (reward costs)

Estimated Total Growth: 5,250 + 15,000 + 12,000 = 32,250
Target 80K = 50K + 30K → Achievable ✅
```

### Step 6: Risks & Tracking

```
Risks:
1. SEO results take 3-6 months to materialize
   → Use email return visits as short-term supplement
2. Referral rewards may attract non-target users
   → Set referral conditions (must complete one course to refer)
3. Content quality inconsistency
   → Establish content review process

Tracking Metrics:
  - Weekly: MAU, New Users, Return Rate
  - Monthly: CAC by Channel, SEO Rankings, Referral Conversion Rate
  - Quarterly: LTV, Paid Conversion Rate, NPS
```

---

## Key Takeaways - World 35 Cheat Sheet

### Five Steps to Problem Solving

```
1. Define the Problem (80% of people go astray at this step)
2. MECE Decomposition (structured, no gaps)
3. Hypothesis Validation (be bold in hypothesizing, careful in verifying)
4. Prioritize (ICE / RICE / 2x2)
5. Recommend Actions (Pyramid / SCQA)

Common MECE Decompositions:
  Revenue = Customers × Avg Order Value × Frequency
  Profit = Revenue - Cost
  Funnel = Impression → Click → Conversion → Retention
  Internal/External = Internal factors vs External factors

Hypothesis Thinking:
  Have a direction first → Find data to validate → Adjust direction
  Don't collect all data before analyzing

Prioritization:
  ICE = Impact × Confidence × Ease
  RICE = (Reach × Impact × Confidence) / Effort
  2x2 = Impact vs Effort

Recommendation Structure:
  SCQA = Situation → Complication → Question → Answer
  Pyramid = Conclusion → Arguments → Evidence
```

### Core Interview Reminders

```
✅ Clarify the problem before answering (don't jump to solutions)
✅ Use MECE to demonstrate structured thinking
✅ Every argument needs data support
✅ Explicitly state the trade-offs
✅ Give actionable recommendations (not just directions)
❌ Don't list too many options (3-4 is enough)
❌ Don't skip hypotheses and jump to conclusions
❌ Don't ignore risks and constraints
```

"""

    // MARK: - World 36 (zh)
    private static let zhWorld36 = """

# World 36：簡報與商業溝通 (Presentation & Business Communication)

> 分析做得再好，不會表達就等於沒做。
> 商業溝通能力是面試和工作中最被低估卻最重要的技能之一。

你可能有最棒的數據分析，但如果無法清楚傳達給決策者，那些分析就毫無價值。
這一章教你如何把複雜的分析變成有說服力的商業簡報。

---

## 36-1：簡報結構 (Pyramid Principle)

### 金字塔原理

```
核心精神：先說結論，再說原因

          ┌──────────────┐
          │   主要結論     │
          └──────┬───────┘
         ┌───────┼───────┐
    ┌────┴──┐┌───┴───┐┌──┴────┐
    │ 論點 1 ││ 論點 2 ││ 論點 3 │
    └───┬───┘└───┬───┘└───┬───┘
     數據   數據   數據   數據   數據
```

### 為什麼要先說結論？

```
❌ 報告者思維（Bottom-up）：
  「我分析了數據，發現 A，然後看了 B，接著研究了 C...
   所以我的結論是 D。」
  → 聽眾已經失去耐心了

✅ 聽眾思維（Top-down）：
  「我建議做 D。原因有三：A、B、C。」
  → 聽眾立刻知道重點，想深入再往下問
```

### 簡報架構模板

```
1. 封面（1 頁）
   - 標題、日期、報告人

2. Executive Summary（1 頁）
   - 一句話結論 + 3 個關鍵發現

3. 背景與問題（1-2 頁）
   - Situation + Complication

4. 分析過程（3-5 頁）
   - 數據、圖表、關鍵發現

5. 建議方案（2-3 頁）
   - 具體建議 + 預期效果

6. 實施計畫（1-2 頁）
   - 時程、資源、里程碑

7. 附錄（依需要）
   - 詳細數據、假設說明
```

### 每頁投影片的原則

```
✅ 一頁一個重點（One Slide, One Message）
✅ 標題就是結論（不是描述）
   ❌ 「營收趨勢圖」
   ✅ 「營收連續三季下滑，Q3 降幅擴大至 15%」
✅ 圖表要有標註（Callout）指出重點
✅ 文字控制在 5-7 行以內
```

### Slide Title 對照

| 壞標題（描述型） | 好標題（結論型） |
|----------------|----------------|
| 用戶數據分析 | 25-34 歲用戶佔營收 65%，應為核心目標客群 |
| 競爭對手比較 | 我們在價格上有 20% 優勢，但功能落後競品 2 個季度 |
| Q1 財務表現 | Q1 營收達標 105%，但利潤率較去年同期下降 3% |
| 市場趨勢 | 訂閱制市場年成長 25%，預計 2027 年達 $5B |

---

## 36-2：Executive Summary 撰寫

### Executive Summary 的目的

```
讓決策者在 1 分鐘內理解：
1. 問題是什麼
2. 分析發現什麼
3. 建議做什麼
4. 預期什麼效果
```

### Executive Summary 模板

```
【情境】
本報告分析了 [問題/機會]，基於 [資料範圍/方法]。

【關鍵發現】
1. [最重要的發現]（附關鍵數據）
2. [第二重要的發現]
3. [第三重要的發現]

【建議】
建議 [具體行動]，預估 [量化效果]。
所需資源：[時間/預算/人力]。

【下一步】
1. [立即行動]（本週）
2. [短期行動]（本月）
3. [中期行動]（本季）
```

### 範例

```
Executive Summary：電商結帳流程優化

【情境】
分析 2025 年 Q4 結帳漏斗數據（50 萬筆交易），
評估結帳流程對轉換率的影響。

【關鍵發現】
1. 結帳放棄率高達 72%，高於業界平均 60%
2. 行動裝置放棄率（78%）遠高於桌面版（58%）
3. 付款資訊填寫步驟流失最嚴重（佔總流失的 40%）

【建議】
將結帳流程從 5 步簡化為 3 步，並優先改善行動版體驗。
預估可將轉換率從 2.1% 提升至 2.8%（+33%），
年增營收約 $3.5M。

【下一步】
1. 啟動結帳 UX 改版專案（本週）
2. 完成 A/B Test 設計（兩週內）
3. 上線測試版（下月）
```

### 常見錯誤

```
❌ 太長（超過一頁）
❌ 只有結論沒有數據
❌ 只有數據沒有建議
❌ 用專業術語（讀者不一定懂）
❌ 建議太模糊（「應該改善用戶體驗」）
✅ 控制在一頁以內
✅ 數據 + 結論 + 建議 三位一體
✅ 用白話文
✅ 建議要具體到可以執行
```

---

## 36-3：數據敘事 (Data Storytelling)

### Data Storytelling 三要素

```
┌─────────┐
│  Data   │ ← 數據基礎（正確、相關）
├─────────┤
│ Narrative│ ← 故事線（邏輯、因果）
├─────────┤
│ Visuals │ ← 視覺化（圖表、設計）
└─────────┘
三者缺一不可
```

### 選擇正確的圖表

| 目的 | 圖表類型 | 範例 |
|------|---------|------|
| 比較大小 | Bar Chart | 各部門營收比較 |
| 趨勢變化 | Line Chart | 月營收趨勢 |
| 組成佔比 | Pie / Stacked Bar | 營收來源佔比 |
| 關聯性 | Scatter Plot | 廣告支出 vs 營收 |
| 分佈情況 | Histogram | 用戶年齡分佈 |
| 流程轉換 | Funnel Chart | 購買漏斗 |
| 地理分佈 | Map | 各區域銷售額 |

### 圖表設計原則

```
✅ 標題說結論（不是描述）
   ❌ 「月營收趨勢」
   ✅ 「營收從 1 月起連續下滑，3 月降至年度最低」

✅ 標注重點（Callout）
   在關鍵數據點加上標註和說明

✅ 減少視覺雜訊
   - 移除不必要的格線
   - 淡化次要數據
   - 用顏色突出重點

✅ 一張圖表一個訊息
   如果要說兩件事，用兩張圖

✅ Y 軸從 0 開始（避免誤導）
```

### 敘事結構

```
1. Hook（吸引注意）
   「你知道我們每天有 3,000 個用戶在結帳頁離開嗎？」

2. Build（建構脈絡）
   「過去三個月，結帳放棄率從 65% 升到 72%」
   （搭配趨勢圖）

3. Reveal（揭示關鍵發現）
   「深入分析發現，78% 的行動用戶在付款資訊頁面放棄」
   （搭配漏斗圖）

4. Insight（提煉洞察）
   「行動版付款表單太複雜是主因——用戶平均要輸入 12 個欄位」

5. Action（呼籲行動）
   「建議簡化為 3 個欄位 + Apple Pay，預估可挽回 $3.5M 營收」
```

### Before vs After 範例

```
Before（資料堆砌）：
  「Q1 營收 $10M，Q2 $9.2M，Q3 $8.5M，Q4 $7.8M。
   客戶流失率 Q1 5%，Q2 7%，Q3 8%，Q4 10%。」

After（數據敘事）：
  「過去一年營收持續下滑 22%，與客戶流失率翻倍（5% → 10%）
   高度相關。深入分析發現，流失集中在中型客戶（$50K-$200K），
   主因是缺乏專屬客戶成功經理。」
```

---

## 36-4：商業英文常用語 (Business English Phrases)

### 會議常用語

| 場景 | 英文 | 中文 |
|------|------|------|
| 開場 | Let's kick off / get started | 我們開始吧 |
| 背景說明 | To provide some context... | 提供一些背景... |
| 表達觀點 | From my perspective... | 從我的角度來看... |
| 補充說明 | To piggyback on that... | 補充一下... |
| 提出異議 | I see your point, but... | 我理解你的觀點，但... |
| 回到正題 | Let's circle back to... | 讓我們回到... |
| 確認理解 | Just to clarify... | 確認一下... |
| 結論 | To wrap up / In summary | 總結來說 |
| 下一步 | Action items / Next steps | 待辦事項 / 下一步 |
| 跟進 | I'll follow up on this | 我會跟進這件事 |

### Email 常用語

```
開頭：
  I hope this email finds you well.
  Following up on our meeting yesterday...
  I wanted to share an update on...
  Per our discussion...

請求：
  Could you please provide...
  I'd appreciate it if you could...
  Would it be possible to...

分享分析結果：
  Based on our analysis...
  The data suggests that...
  Key findings include...

結尾：
  Please let me know if you have any questions.
  Looking forward to your feedback.
  Happy to discuss further.
```

### 簡報常用語

```
開場：
  Today I'd like to walk you through...
  The purpose of this presentation is to...

轉場：
  Moving on to...
  Now let's look at...
  This brings us to...

強調數據：
  As you can see from the chart...
  The key takeaway here is...
  What's particularly noteworthy is...

提出建議：
  Based on our findings, we recommend...
  Our proposal is to...
  The suggested approach would be to...

處理問題：
  That's a great question. Let me address that.
  I'll need to look into that and get back to you.
  Could we take that offline?
```

### 面試常用語

```
釐清問題：
  Could you clarify what you mean by...?
  Just to make sure I understand the question...
  Are we looking at this from [A] or [B] perspective?

展示思路：
  Let me structure my thinking...
  I'd like to break this down into...
  Let me walk you through my approach...

提出假設：
  I'd hypothesize that...
  My initial assumption would be...
  Let me assume that... Is that reasonable?

給出結論：
  Based on this analysis, I would recommend...
  My recommendation would be to...
  In summary, the key action items are...
```

---

## 36-5：建議傳達 (Recommendation Delivery)

### 建議傳達的 3C 框架

```
Clear（清楚）：一句話說完建議
Credible（可信）：有數據和邏輯支撐
Compelling（有說服力）：讓人想行動
```

### 建議傳達模板

```
1. 結論先行（10 秒）
   「我建議投資 $200K 優化結帳流程，預估年增營收 $3.5M。」

2. 關鍵理由（30 秒）
   「三個原因：
    第一，結帳放棄率 72% 遠高於業界平均；
    第二，行動端體驗是最大痛點；
    第三，同業實施類似優化後轉換率平均提升 30%。」

3. 方案概述（1 分鐘）
   「具體方案分三步走：
    第一階段：簡化表單（2 週）
    第二階段：A/B Test（4 週）
    第三階段：全面上線（2 週）」

4. 預期效果與風險（30 秒）
   「預估 3 個月內轉換率提升至 2.8%，
    主要風險是用戶對新流程的適應期，
    計畫透過漸進式上線來降低影響。」
```

### 處理反對意見

| 反對類型 | 應對方式 | 範例 |
|---------|---------|------|
| 質疑數據 | 說明數據來源和方法 | 「這是基於過去 6 個月 50 萬筆交易的分析」 |
| 擔心風險 | 提出風險控制措施 | 「我們會先做 A/B Test，確認效果再全面上線」 |
| 預算疑慮 | 計算 ROI | 「投入 $200K，預估年增 $3.5M，ROI 1650%」 |
| 優先順序 | 說明機會成本 | 「每延遲一個月，損失約 $290K 營收」 |
| 替代方案 | 比較優劣 | 「我評估了三個方案，這個在 ROI 和風險上最優」 |

### Stakeholder 溝通策略

```
不同對象，不同說法：

CEO / 高管：
  → 說結論和商業影響（$$$）
  → 「這個方案可以年增 $3.5M 營收」

VP of Engineering：
  → 說技術方案和資源需求
  → 「需要 2 位前端工程師投入 6 週」

Marketing：
  → 說用戶影響和轉換率
  → 「預估轉換率提升 33%，影響 50 萬月活用戶」

Finance：
  → 說 ROI 和成本結構
  → 「投入 $200K，6 個月回本，年 ROI 1650%」
```

---

## 36-6：C-Level 簡報實戰

### C-Level 簡報原則

```
1. 時間永遠不夠（準備 30 分鐘的內容，可能只有 10 分鐘講）
2. 先說最重要的（萬一被打斷，至少結論已經傳達）
3. 備好詳細資料但不主動展示（被問到再拿出來）
4. 用商業語言，不用技術語言
5. 準備好被挑戰（數據、假設、替代方案）
```

### C-Level 簡報結構（10 分鐘版）

```
Slide 1：封面（15 秒）
Slide 2：Executive Summary — 一句話結論（1 分鐘）
Slide 3：問題現狀 — 為什麼重要（2 分鐘）
Slide 4：關鍵數據 — 支持結論的證據（2 分鐘）
Slide 5：建議方案 — 怎麼做（2 分鐘）
Slide 6：實施計畫 — 時程和資源（1.5 分鐘）
Slide 7：下一步 — 需要什麼決策（1 分鐘）

Backup Slides（不主動講，被問到才翻）：
B1-B3：詳細數據分析
B4：替代方案比較
B5：風險分析
B6：假設與限制
```

### 模擬：向 CEO 報告客戶流失問題

```
Slide 2 - Executive Summary：
「過去兩季客戶流失率翻倍（5% → 10%），
 造成年化營收損失 $5M。
 建議投入 $300K 建立客戶成功團隊，
 預估可將流失率降回 6%，挽回 $3.2M。」

Slide 3 - 問題現狀：
• 流失集中在中型客戶（$50K-$200K 年營收貢獻）
• 中型客戶佔客戶數 30%，但貢獻 50% 營收
• 競爭對手已開始挖角我們的中型客戶

Slide 4 - 關鍵數據：
• 流失客戶的 NPS 平均僅 5 分（留存客戶 35 分）
• 流失前 3 個月的 Support Ticket 數量平均增加 200%
• 有專屬 CSM 的客戶流失率僅 3%

Slide 5 - 建議方案：
• 招聘 3 位 CSM，每人負責 20 個中型客戶
• 建立客戶健康分數（Health Score）預警系統
• 設計 Quarterly Business Review 流程

Slide 7 - 需要的決策：
• 核准 $300K 年度預算（人事 + 工具）
• 指定 VP of Sales 為 Sponsor
• 授權在下季前完成招聘
```

### 處理 Q&A 的技巧

```
1. 聽完問題再回答（不要急著搶答）
2. 確認理解：「您是問 [重述問題] 嗎？」
3. 簡潔回答（30 秒以內）
4. 不知道就說不知道：「這個我需要確認後回覆您」
5. 記下所有問題，會後 Follow up

常見 CEO 會問的問題：
  「ROI 是多少？」 → 準備好數字
  「風險是什麼？」 → 準備好應對方案
  「競爭對手怎麼做？」 → 做好競品研究
  「為什麼現在要做？」 → 準備好機會成本分析
  「有其他選項嗎？」 → 準備好替代方案比較
```

---

## 🔑 World 36 Cheat Sheet

### 商業溝通核心

```
金字塔原理：先說結論，再說原因
SCQA：Situation → Complication → Question → Answer
一頁一訊息：Slide Title = 結論（不是描述）

Executive Summary 四要素：
  情境 → 發現 → 建議 → 下一步

Data Storytelling：
  Data（正確）+ Narrative（故事）+ Visuals（圖表）
  Hook → Build → Reveal → Insight → Action

圖表選擇：
  比較 → Bar Chart
  趨勢 → Line Chart
  佔比 → Pie Chart
  關聯 → Scatter Plot

建議傳達 3C：
  Clear（清楚）+ Credible（可信）+ Compelling（有說服力）

C-Level 簡報：
  ✅ 結論先行
  ✅ 用商業語言
  ✅ 準備被挑戰
  ✅ 帶著 Backup Slides
  ❌ 不要從頭講分析過程
  ❌ 不要用技術術語
```

### 面試溝通技巧

```
表達思路：Let me structure my thinking...
釐清問題：Could you clarify...?
提出假設：I'd hypothesize that...
給出結論：Based on this analysis, I recommend...
處理不確定：That's a great question. Let me think about it.
```

"""

    // MARK: - World 36 (en)
    private static let enWorld36 = """

# World 36: Presentation & Business Communication

> No matter how great your analysis is, it's worthless if you can't communicate it.
> Business communication is one of the most underrated yet essential skills in both interviews and work.

You may have the best data analysis, but if you can't convey it clearly to decision-makers, that analysis has no value.
This chapter teaches you how to turn complex analysis into persuasive business presentations.

---

## 36-1: Presentation Structure (Pyramid Principle)

### The Pyramid Principle

```
Core Idea: Lead with the conclusion, then explain the reasons

          ┌──────────────┐
          │ Main Conclusion│
          └──────┬───────┘
         ┌───────┼───────┐
    ┌────┴──┐┌───┴───┐┌──┴────┐
    │Point 1││Point 2││Point 3│
    └───┬───┘└───┬───┘└───┬───┘
     Data    Data    Data    Data    Data
```

### Why Lead with the Conclusion?

```
❌ Presenter's Mindset (Bottom-up):
  "I analyzed the data, found A, then looked at B, then studied C...
   So my conclusion is D."
  → The audience has already lost patience

✅ Audience's Mindset (Top-down):
  "I recommend D. Three reasons: A, B, C."
  → The audience immediately knows the key point, and can dig deeper if interested
```

### Presentation Structure Template

```
1. Cover Page (1 slide)
   - Title, date, presenter

2. Executive Summary (1 slide)
   - One-sentence conclusion + 3 key findings

3. Background & Problem (1-2 slides)
   - Situation + Complication

4. Analysis (3-5 slides)
   - Data, charts, key findings

5. Recommendations (2-3 slides)
   - Specific recommendations + expected outcomes

6. Implementation Plan (1-2 slides)
   - Timeline, resources, milestones

7. Appendix (as needed)
   - Detailed data, assumptions
```

### Slide Design Principles

```
✅ One message per slide (One Slide, One Message)
✅ The title IS the conclusion (not a description)
   ❌ "Revenue Trend Chart"
   ✅ "Revenue has declined for three consecutive quarters, Q3 drop widened to 15%"
✅ Charts should have callouts highlighting key points
✅ Keep text to 5-7 lines or fewer
```

### Slide Title Comparison

| Bad Title (Descriptive) | Good Title (Conclusive) |
|------------------------|------------------------|
| User Data Analysis | Users aged 25-34 account for 65% of revenue — they should be our core target segment |
| Competitor Comparison | We have a 20% price advantage, but lag 2 quarters behind competitors in features |
| Q1 Financial Performance | Q1 revenue hit 105% of target, but profit margin declined 3% year-over-year |
| Market Trends | Subscription market growing 25% annually, projected to reach $5B by 2027 |

---

## 36-2: Writing an Executive Summary

### Purpose of an Executive Summary

```
Enable decision-makers to understand in 1 minute:
1. What is the problem
2. What did the analysis find
3. What is recommended
4. What is the expected outcome
```

### Executive Summary Template

```
[Context]
This report analyzes [problem/opportunity], based on [data scope/methodology].

[Key Findings]
1. [Most important finding] (with key data)
2. [Second most important finding]
3. [Third most important finding]

[Recommendation]
Recommend [specific action], estimated [quantified impact].
Required resources: [time/budget/personnel].

[Next Steps]
1. [Immediate action] (this week)
2. [Short-term action] (this month)
3. [Medium-term action] (this quarter)
```

### Example

```
Executive Summary: E-commerce Checkout Flow Optimization

[Context]
Analyzed 2025 Q4 checkout funnel data (500,000 transactions),
evaluating the impact of checkout flow on conversion rate.

[Key Findings]
1. Checkout abandonment rate is 72%, above the industry average of 60%
2. Mobile abandonment rate (78%) is much higher than desktop (58%)
3. The payment information step has the most drop-off (40% of total loss)

[Recommendation]
Simplify the checkout flow from 5 steps to 3, prioritizing mobile experience.
Estimated conversion rate improvement from 2.1% to 2.8% (+33%),
annual revenue increase of approximately $3.5M.

[Next Steps]
1. Launch checkout UX redesign project (this week)
2. Complete A/B Test design (within two weeks)
3. Deploy test version (next month)
```

### Common Mistakes

```
❌ Too long (more than one page)
❌ Conclusions without data
❌ Data without recommendations
❌ Using jargon (readers may not understand)
❌ Vague recommendations ("should improve user experience")
✅ Keep it to one page
✅ Data + Conclusion + Recommendation — all three together
✅ Use plain language
✅ Recommendations must be specific enough to act on
```

---

## 36-3: Data Storytelling

### Three Elements of Data Storytelling

```
┌─────────┐
│  Data   │ ← Data foundation (accurate, relevant)
├─────────┤
│Narrative│ ← Story line (logic, causation)
├─────────┤
│ Visuals │ ← Visualization (charts, design)
└─────────┘
All three are essential
```

### Choosing the Right Chart

| Purpose | Chart Type | Example |
|---------|-----------|---------|
| Compare values | Bar Chart | Revenue comparison across departments |
| Show trends | Line Chart | Monthly revenue trend |
| Show composition | Pie / Stacked Bar | Revenue source breakdown |
| Show correlation | Scatter Plot | Ad spend vs Revenue |
| Show distribution | Histogram | User age distribution |
| Show conversion | Funnel Chart | Purchase funnel |
| Show geography | Map | Sales by region |

### Chart Design Principles

```
✅ Title states the conclusion (not a description)
   ❌ "Monthly Revenue Trend"
   ✅ "Revenue has declined continuously since January, hitting the annual low in March"

✅ Annotate key points (Callouts)
   Add labels and notes at critical data points

✅ Reduce visual clutter
   - Remove unnecessary gridlines
   - Fade out secondary data
   - Use color to highlight key points

✅ One message per chart
   If you need to convey two things, use two charts

✅ Y-axis starts at 0 (to avoid misleading)
```

### Narrative Structure

```
1. Hook (Capture attention)
   "Did you know we lose 3,000 users on the checkout page every day?"

2. Build (Establish context)
   "Over the past three months, checkout abandonment rose from 65% to 72%"
   (paired with trend chart)

3. Reveal (Key finding)
   "Deep analysis shows 78% of mobile users abandon at the payment info page"
   (paired with funnel chart)

4. Insight (Distill the insight)
   "The mobile payment form is too complex — users must fill in 12 fields on average"

5. Action (Call to action)
   "Recommend simplifying to 3 fields + Apple Pay, estimated to recover $3.5M in revenue"
```

### Before vs After Example

```
Before (Data dump):
  "Q1 revenue $10M, Q2 $9.2M, Q3 $8.5M, Q4 $7.8M.
   Customer churn rate Q1 5%, Q2 7%, Q3 8%, Q4 10%."

After (Data storytelling):
  "Revenue has declined 22% over the past year, highly correlated with
   churn rate doubling (5% → 10%). Deep analysis shows churn is concentrated
   among mid-size customers ($50K-$200K), primarily due to the lack of
   a dedicated Customer Success Manager."
```

---

## 36-4: Common Business English Phrases

### Meeting Phrases

| Scenario | English | Usage |
|----------|---------|-------|
| Opening | Let's kick off / get started | Begin the meeting |
| Context | To provide some context... | Give background |
| Expressing views | From my perspective... | Share your opinion |
| Adding on | To piggyback on that... | Build on a point |
| Disagreeing | I see your point, but... | Respectful pushback |
| Refocusing | Let's circle back to... | Return to the topic |
| Clarifying | Just to clarify... | Confirm understanding |
| Closing | To wrap up / In summary | Summarize |
| Follow-up | Action items / Next steps | Define next actions |
| Commitment | I'll follow up on this | Take ownership |

### Email Phrases

```
Opening:
  I hope this email finds you well.
  Following up on our meeting yesterday...
  I wanted to share an update on...
  Per our discussion...

Requesting:
  Could you please provide...
  I'd appreciate it if you could...
  Would it be possible to...

Sharing Analysis Results:
  Based on our analysis...
  The data suggests that...
  Key findings include...

Closing:
  Please let me know if you have any questions.
  Looking forward to your feedback.
  Happy to discuss further.
```

### Presentation Phrases

```
Opening:
  Today I'd like to walk you through...
  The purpose of this presentation is to...

Transitions:
  Moving on to...
  Now let's look at...
  This brings us to...

Highlighting Data:
  As you can see from the chart...
  The key takeaway here is...
  What's particularly noteworthy is...

Making Recommendations:
  Based on our findings, we recommend...
  Our proposal is to...
  The suggested approach would be to...

Handling Questions:
  That's a great question. Let me address that.
  I'll need to look into that and get back to you.
  Could we take that offline?
```

### Interview Phrases

```
Clarifying the Question:
  Could you clarify what you mean by...?
  Just to make sure I understand the question...
  Are we looking at this from [A] or [B] perspective?

Demonstrating Your Approach:
  Let me structure my thinking...
  I'd like to break this down into...
  Let me walk you through my approach...

Proposing Hypotheses:
  I'd hypothesize that...
  My initial assumption would be...
  Let me assume that... Is that reasonable?

Giving Conclusions:
  Based on this analysis, I would recommend...
  My recommendation would be to...
  In summary, the key action items are...
```

---

## 36-5: Recommendation Delivery

### The 3C Framework for Delivering Recommendations

```
Clear: State the recommendation in one sentence
Credible: Backed by data and logic
Compelling: Makes people want to act
```

### Recommendation Delivery Template

```
1. Lead with the Conclusion (10 seconds)
   "I recommend investing $200K to optimize the checkout flow, with an estimated annual revenue increase of $3.5M."

2. Key Reasons (30 seconds)
   "Three reasons:
    First, our checkout abandonment rate of 72% is well above the industry average;
    Second, mobile experience is the biggest pain point;
    Third, competitors who implemented similar optimizations saw an average 30% conversion lift."

3. Solution Overview (1 minute)
   "The plan has three phases:
    Phase 1: Simplify the form (2 weeks)
    Phase 2: A/B Test (4 weeks)
    Phase 3: Full rollout (2 weeks)"

4. Expected Results & Risks (30 seconds)
   "Estimated conversion rate increase to 2.8% within 3 months.
    Main risk is user adaptation to the new flow —
    we plan to mitigate this through gradual rollout."
```

### Handling Objections

| Objection Type | Response Approach | Example |
|---------------|-------------------|---------|
| Questioning data | Explain data source and methodology | "This is based on analysis of 500K transactions over 6 months" |
| Risk concerns | Present risk mitigation measures | "We'll run an A/B Test first, confirm results before full rollout" |
| Budget concerns | Calculate ROI | "Investment of $200K, estimated annual increase of $3.5M, ROI 1650%" |
| Priority concerns | Explain opportunity cost | "Every month of delay costs approximately $290K in revenue" |
| Alternative solutions | Compare pros and cons | "I evaluated three options — this one is optimal for ROI and risk" |

### Stakeholder Communication Strategy

```
Different audiences require different messaging:

CEO / Executives:
  → Business impact and dollars
  → "This initiative can add $3.5M in annual revenue"

VP of Engineering:
  → Technical approach and resource requirements
  → "Requires 2 frontend engineers for 6 weeks"

Marketing:
  → User impact and conversion rates
  → "Estimated 33% conversion rate improvement, affecting 500K MAU"

Finance:
  → ROI and cost structure
  → "Investment of $200K, 6-month payback, annual ROI 1650%"
```

---

## 36-6: C-Level Presentation in Practice

### C-Level Presentation Principles

```
1. Time is always short (prepare 30 minutes of content, you may only get 10)
2. Say the most important thing first (if interrupted, at least the conclusion was delivered)
3. Have detailed backup materials but don't proactively show them (pull them out when asked)
4. Use business language, not technical jargon
5. Be prepared to be challenged (on data, assumptions, alternatives)
```

### C-Level Presentation Structure (10-minute version)

```
Slide 1: Cover (15 seconds)
Slide 2: Executive Summary — one-sentence conclusion (1 minute)
Slide 3: Current Problem — why it matters (2 minutes)
Slide 4: Key Data — evidence supporting the conclusion (2 minutes)
Slide 5: Recommended Solution — what to do (2 minutes)
Slide 6: Implementation Plan — timeline and resources (1.5 minutes)
Slide 7: Next Steps — what decisions are needed (1 minute)

Backup Slides (don't present unless asked):
B1-B3: Detailed data analysis
B4: Alternative solution comparison
B5: Risk analysis
B6: Assumptions and limitations
```

### Simulation: Reporting Customer Churn to the CEO

```
Slide 2 - Executive Summary:
"Customer churn rate has doubled over the past two quarters (5% → 10%),
 resulting in annualized revenue loss of $5M.
 Recommend investing $300K to establish a Customer Success team,
 estimated to reduce churn rate back to 6%, recovering $3.2M."

Slide 3 - Current Problem:
• Churn concentrated among mid-size customers ($50K-$200K annual revenue)
• Mid-size customers are 30% of customer base but contribute 50% of revenue
• Competitors have begun poaching our mid-size customers

Slide 4 - Key Data:
• Churned customers had an average NPS of 5 (retained customers: 35)
• Support tickets increased 200% on average in the 3 months before churn
• Customers with a dedicated CSM have only a 3% churn rate

Slide 5 - Recommended Solution:
• Hire 3 CSMs, each responsible for 20 mid-size accounts
• Build a Customer Health Score early warning system
• Design a Quarterly Business Review process

Slide 7 - Decisions Needed:
• Approve $300K annual budget (personnel + tools)
• Designate VP of Sales as Sponsor
• Authorize hiring completion by next quarter
```

### Q&A Handling Tips

```
1. Listen to the full question before answering (don't rush to respond)
2. Confirm understanding: "Are you asking about [restate question]?"
3. Answer concisely (under 30 seconds)
4. If you don't know, say so: "I need to verify that and follow up with you"
5. Record all questions and follow up after the meeting

Common Questions CEOs Ask:
  "What's the ROI?" → Have the numbers ready
  "What are the risks?" → Have mitigation plans ready
  "What are competitors doing?" → Do competitive research
  "Why do this now?" → Prepare opportunity cost analysis
  "Are there other options?" → Prepare alternative comparison
```

---

## Key Takeaways - World 36 Cheat Sheet

### Business Communication Essentials

```
Pyramid Principle: Lead with conclusion, then explain reasons
SCQA: Situation → Complication → Question → Answer
One Message Per Slide: Slide Title = Conclusion (not description)

Executive Summary Four Elements:
  Context → Findings → Recommendation → Next Steps

Data Storytelling:
  Data (accurate) + Narrative (story) + Visuals (charts)
  Hook → Build → Reveal → Insight → Action

Chart Selection:
  Comparison → Bar Chart
  Trends → Line Chart
  Composition → Pie Chart
  Correlation → Scatter Plot

Recommendation Delivery 3C:
  Clear + Credible + Compelling

C-Level Presentations:
  ✅ Lead with conclusion
  ✅ Use business language
  ✅ Be prepared to be challenged
  ✅ Bring backup slides
  ❌ Don't narrate the entire analysis process
  ❌ Don't use technical jargon
```

### Interview Communication Tips

```
Articulating your thinking: Let me structure my thinking...
Clarifying the question: Could you clarify...?
Proposing a hypothesis: I'd hypothesize that...
Giving a conclusion: Based on this analysis, I recommend...
Handling uncertainty: That's a great question. Let me think about it.
```

"""

    // MARK: - World 37 (zh)
    private static let zhWorld37 = """

# World 37：領域知識 (Domain Knowledge)

> 技術能力決定你能不能做分析，領域知識決定你能不能做出有價值的分析。
> Business Engineer 需要理解不同業務領域，才能設計出真正有用的系統。

面試官常說：「技術可以學，但 Business Sense 很難教。」
這一章幫你建立常見商業領域的基本認知。

---

## 37-1：營運與供應鏈 (Operations & Supply Chain)

### 供應鏈基本概念

```
原物料 → 生產製造 → 倉儲 → 物流配送 → 終端銷售 → 消費者
  ↑                                                    │
  └──────────────── 逆向物流（退貨） ←─────────────────┘
```

### 供應鏈關鍵指標

| 指標 | 公式 / 說明 | 目標 |
|------|------------|------|
| Inventory Turnover | 銷貨成本 / 平均庫存 | 越高越好 |
| Days of Inventory | 365 / Inventory Turnover | 越低越好 |
| Fill Rate | 完成訂單數 / 總訂單數 | > 95% |
| On-time Delivery | 準時送達數 / 總出貨數 | > 98% |
| Order Cycle Time | 從下單到交貨的時間 | 越短越好 |
| Perfect Order Rate | 完美訂單數 / 總訂單數 | > 90% |

### 庫存管理模型

```
EOQ（Economic Order Quantity）= 經濟訂購量
  Q* = √(2DS / H)
  D = 年需求量
  S = 每次訂購成本
  H = 每單位持有成本

安全庫存 = Z × σ × √L
  Z = 服務水準對應的 Z 值（95% → 1.65）
  σ = 需求標準差
  L = 前置時間（Lead Time）
```

### 常見營運策略

| 策略 | 說明 | 適用場景 |
|------|------|---------|
| MTS (Make-to-Stock) | 預測生產、備庫存 | 標準品、需求穩定 |
| MTO (Make-to-Order) | 接單才生產 | 客製品、高單價 |
| JIT (Just-in-Time) | 需要時才進貨 | 空間有限、零件多 |
| Drop Shipping | 不持有庫存、供應商直送 | 電商、長尾商品 |

### 供應鏈數位化趨勢

```
傳統：Excel 管庫存 → 人工叫貨 → 紙本對帳
數位化：
  ✅ ERP 系統自動管理庫存水位
  ✅ AI 需求預測（減少牛鞭效應）
  ✅ IoT 追蹤物流即時位置
  ✅ 區塊鏈確保供應鏈透明度
  ✅ RPA 自動化採購流程
```

---

## 37-2：財務基礎 (Finance Basics)

### 三大財務報表

| 報表 | 回答的問題 | 關鍵項目 |
|------|----------|---------|
| Income Statement（損益表） | 賺多少錢？ | 營收、成本、利潤 |
| Balance Sheet（資產負債表） | 有多少家當？ | 資產、負債、股東權益 |
| Cash Flow Statement（現金流量表） | 錢從哪來往哪去？ | 營運 / 投資 / 籌資現金流 |

### 損益表結構

```
營收 (Revenue)                    $10,000,000
- 銷貨成本 (COGS)                 - $4,000,000
= 毛利 (Gross Profit)              $6,000,000   (毛利率 60%)
- 營業費用 (Operating Expenses)
  - 行銷費用                       - $1,500,000
  - 研發費用                       - $2,000,000
  - 管理費用                       - $1,000,000
= 營業利益 (Operating Income)      $1,500,000   (營業利益率 15%)
- 利息 / 稅                        - $500,000
= 淨利 (Net Income)                $1,000,000   (淨利率 10%)
```

### 常用財務指標

| 指標 | 公式 | 意義 |
|------|------|------|
| 毛利率 | (營收-COGS) / 營收 | 產品本身的獲利能力 |
| 營業利益率 | 營業利益 / 營收 | 本業的獲利能力 |
| 淨利率 | 淨利 / 營收 | 整體獲利能力 |
| ROI | (收益-成本) / 成本 | 投資報酬率 |
| ROE | 淨利 / 股東權益 | 股東投資報酬率 |
| Burn Rate | 每月消耗的現金 | 新創存活指標 |
| Runway | 現金 / Burn Rate | 還能撐幾個月 |

### 部門預算結構

```
年度預算
├── 營收預算（Top-line）
│   ├── 產品 A：$5M（成長 10%）
│   ├── 產品 B：$3M（成長 5%）
│   └── 新產品 C：$2M
├── 成本預算
│   ├── 人事成本：$4.5M（60%）
│   ├── 行銷費用：$1.5M（20%）
│   ├── IT 基礎設施：$0.75M（10%）
│   └── 其他：$0.75M（10%）
└── 資本支出（CapEx）
    ├── 新辦公室：$500K
    └── 設備採購：$300K
```

### 面試常見財務題

```
Q：一個新功能需要 $500K 投資，預估年增營收 $200K，你會建議做嗎？

A：需要更多資訊判斷：
1. 回收期：$500K / $200K = 2.5 年
   → 如果產品生命週期 > 3 年，可接受
2. 機會成本：這 $500K 投入其他地方能產生多少回報？
3. 是否有非財務效益：品牌價值、客戶滿意度？
4. 風險：$200K 的信心度有多高？
5. 現金流：公司目前 Runway 是否充裕？
```

---

## 37-3：CRM 與客戶管理 (CRM & Customer Management)

### CRM 核心概念

```
CRM = Customer Relationship Management
     客戶關係管理

目的：管理客戶從「認識你」到「忠誠客戶」的全生命週期

客戶生命週期：
Awareness → Acquisition → Activation → Revenue → Retention → Referral
 認知        獲取         啟用        營收       留存       推薦
```

### CRM 系統核心模組

| 模組 | 功能 | 使用者 |
|------|------|--------|
| 聯絡人管理 | 客戶基本資料、互動記錄 | 業務、客服 |
| 商機管理 (Pipeline) | 銷售階段追蹤 | 業務團隊 |
| 活動管理 | 行銷活動追蹤 | 行銷團隊 |
| 客服管理 | 工單、SLA 追蹤 | 客服團隊 |
| 報表分析 | 銷售預測、績效分析 | 管理層 |

### 銷售漏斗 (Sales Pipeline)

```
階段            數量    金額        轉換率
────────────────────────────────────────
Lead（潛在客戶）  100    $5,000,000   100%
  ↓
Qualified（合格）  40    $2,000,000    40%
  ↓
Proposal（提案）   20    $1,000,000    50%
  ↓
Negotiation（談判） 10     $500,000    50%
  ↓
Closed Won（成交）   5     $250,000    50%

整體轉換率：5%
平均客單價：$50,000
```

### 客戶分群方法

```
RFM 分析：
  R (Recency)：最近一次消費時間
  F (Frequency)：消費頻率
  M (Monetary)：消費金額

客戶分群：
┌──────────────┬──────┬──────┬──────┐
│ 客群         │ R    │ F    │ M    │
├──────────────┼──────┼──────┼──────┤
│ VIP 客戶     │ 高   │ 高   │ 高   │
│ 忠誠客戶     │ 高   │ 高   │ 低   │
│ 沉睡客戶     │ 低   │ 高   │ 高   │
│ 流失風險     │ 低   │ 低   │ 高   │
│ 新客戶       │ 高   │ 低   │ 低   │
└──────────────┴──────┴──────┴──────┘
```

### 客戶成功指標

| 指標 | 說明 | 好的基準 |
|------|------|---------|
| NPS | 淨推薦分數 (-100 ~ 100) | > 30 |
| CSAT | 客戶滿意度 | > 80% |
| CES | 客戶費力度（越低越好） | < 3 |
| Churn Rate | 月流失率 | < 5% |
| LTV | 客戶終身價值 | > 3× CAC |
| Time to Value | 從註冊到感受價值的時間 | < 7 天 |

---

## 37-4：ERP 與企業流程 (ERP & Business Processes)

### ERP 基本概念

```
ERP = Enterprise Resource Planning
     企業資源規劃

核心理念：一個系統管理所有企業核心流程
         打破部門間的資訊孤島
```

### ERP 核心模組

```
┌────────────────────────────────┐
│            ERP 系統             │
├────────┬────────┬──────────────┤
│ 財務模組│ 人資模組│  製造模組     │
│ GL/AP/AR│ 薪資   │  BOM/MRP     │
│ 成本中心│ 出勤   │  工單管理     │
├────────┼────────┼──────────────┤
│ 採購模組│ 銷售模組│  庫存模組     │
│ 請購/PO │ SO/報價│  進出庫管理   │
│ 供應商  │ 客戶   │  盤點         │
└────────┴────────┴──────────────┘
```

### 常見 ERP 系統比較

| 系統 | 特色 | 適用 | 價位 |
|------|------|------|------|
| SAP S/4HANA | 功能最全、全球標準 | 大型企業 | $$$$ |
| Oracle ERP Cloud | 雲端原生、AI 驅動 | 中大型企業 | $$$ |
| Microsoft Dynamics 365 | 微軟生態系整合 | 中型企業 | $$ |
| NetSuite | 雲端 ERP 先驅 | 中小企業 | $$ |
| Odoo | 開源、模組化 | 小型企業 | $ |
| 鼎新 COSMOS | 台灣本土、在地化 | 台灣中小企業 | $$ |

### 核心企業流程

```
Order-to-Cash (O2C)：從接單到收款
  客戶下單 → 確認庫存 → 出貨 → 開發票 → 收款

Procure-to-Pay (P2P)：從採購到付款
  請購 → 核准 → 採購單 → 收貨 → 驗收 → 付款

Record-to-Report (R2R)：從記帳到報告
  日記帳 → 過帳 → 調整 → 結帳 → 出報表

Plan-to-Produce (P2P)：從計畫到生產
  需求預測 → MRP 計算 → 生產排程 → 製造 → 品檢
```

### ERP 導入挑戰

```
常見挑戰：
1. 資料遷移：舊系統資料格式不一致
2. 流程標準化：各部門作法不同，誰來讓步？
3. 用戶抗拒：「以前那樣做就好了」
4. 客製化 vs 標準化：客製太多 → 升級困難
5. 成本超支：通常超出預算 50-100%
6. 時程延誤：平均延遲 6-12 個月

成功要素：
✅ 高層支持（Executive Sponsor）
✅ 專業的導入顧問
✅ 充足的教育訓練
✅ 階段性上線（不要大爆炸式）
✅ 明確的 Change Management 計畫
```

---

## 37-5：跨領域整合 (Cross-Domain Integration)

### 系統整合架構

```
┌──────┐   ┌──────┐   ┌──────┐
│ CRM  │   │ ERP  │   │ BI   │
└──┬───┘   └──┬───┘   └──┬───┘
   │          │          │
   └──────────┼──────────┘
              │
        ┌─────┴─────┐
        │ 整合平台   │ （API Gateway / ESB / iPaaS）
        └─────┬─────┘
              │
   ┌──────────┼──────────┐
   │          │          │
┌──┴───┐ ┌───┴──┐ ┌────┴──┐
│ 電商  │ │ POS  │ │ 物流  │
└──────┘ └──────┘ └──────┘
```

### 常見跨領域整合場景

| 整合場景 | 涉及系統 | 商業價值 |
|---------|---------|---------|
| 客戶 360 度視圖 | CRM + ERP + 客服 | 全方位了解客戶 |
| 即時庫存查詢 | ERP + 電商 + POS | 避免超賣 |
| 自動化報表 | ERP + BI + Data Warehouse | 決策支援 |
| 行銷自動化 | CRM + Email + 社群 | 精準行銷 |
| 供應鏈可視化 | ERP + 物流 + IoT | 即時追蹤 |

### 資料整合方法

```
1. 批次整合（Batch）
   - 定時同步（每天、每小時）
   - 適合報表、不需即時的場景
   - ETL: Extract → Transform → Load

2. 即時整合（Real-time）
   - API 即時呼叫
   - 適合交易、庫存等即時場景
   - REST API / GraphQL

3. 事件驅動（Event-driven）
   - 發生事件時觸發
   - 適合通知、工作流程
   - Message Queue / Webhook
```

### 跨部門溝通的語言翻譯

```
同一件事，不同部門的說法：

業務部：「客戶」
IT 部：「User」
行銷部：「受眾」
客服部：「Case」

業務部：「我要看報表」
IT 部：「需要一個 Dashboard」
財務部：「月結報告」

→ Business Engineer 的價值：
   當不同部門的「翻譯官」
   用每個部門聽得懂的語言溝通
```

---

## 37-6：領域分析練習

### Case：零售業數位轉型分析

```
背景：
一間傳統連鎖超市（50 間門市）想要進行數位轉型。
目前全部用 Excel 管理，沒有任何系統。
年營收 $50M，利潤率 5%（$2.5M）。
CEO 希望用數位化提升 2% 利潤率。
```

### 分析框架

```
Step 1：了解業務流程
  採購 → 進貨 → 上架 → 銷售 → 結帳 → 庫存管理

Step 2：找出痛點
  ┌──────────────┬──────────────┬──────────┐
  │ 流程          │ 痛點          │ 影響      │
  ├──────────────┼──────────────┼──────────┤
  │ 採購          │ 憑經驗叫貨    │ 庫存過多/缺貨│
  │ 庫存管理      │ 手動盤點      │ 資料不準   │
  │ 銷售分析      │ 無 POS 數據   │ 不知暢銷品 │
  │ 會員管理      │ 紙本會員卡    │ 無法精準行銷│
  │ 多店管理      │ 各店獨立報表  │ 無法比較   │
  └──────────────┴──────────────┴──────────┘

Step 3：建議方案
  Phase 1（0-6 月）：POS + 基礎 ERP
    - 導入 POS 系統 → 建立銷售數據基礎
    - 導入基礎 ERP → 統一庫存管理
    - 投資：$500K，預估效益：減少 30% 庫存損耗

  Phase 2（6-12 月）：CRM + 會員系統
    - 數位會員卡 + 行銷自動化
    - 投資：$300K，預估效益：會員消費頻率提升 15%

  Phase 3（12-18 月）：BI + 進階分析
    - 銷售預測 + 自動補貨建議
    - 投資：$200K，預估效益：缺貨率降低 50%

Step 4：效益試算
  庫存損耗減少：$50M × 2% × 30% = $300K
  會員營收增長：$50M × 20%（會員佔比）× 15% = $1.5M
  營運效率提升：50 店 × $10K/年 = $500K
  總效益：$2.3M / 年
  投資：$1M
  ROI：130%
```

### 面試口頭回答範例

```
「這間超市的核心問題是缺乏數據基礎。
 我會建議分三階段推動：

 第一，先導入 POS 和 ERP 建立數據基礎，
 這是所有後續分析的前提。

 第二，用 CRM 做會員經營，
 因為零售業 20% 的忠誠客戶通常貢獻 80% 營收。

 第三，再用 BI 做進階分析，
 例如銷售預測和自動補貨。

 整體投資約 $1M，預估年效益 $2.3M，
 第一年就可以回本。」
```

---

## 🔑 World 37 Cheat Sheet

### 領域知識快速對照

```
供應鏈：
  原物料 → 生產 → 倉儲 → 物流 → 銷售
  關鍵指標：Inventory Turnover、Fill Rate、On-time Delivery
  策略：MTS / MTO / JIT / Drop Shipping

財務三表：
  損益表 → 賺多少
  資產負債表 → 有多少
  現金流量表 → 錢的流向
  關鍵指標：毛利率、營業利益率、ROI、Burn Rate

CRM：
  客戶生命週期管理
  銷售漏斗（Lead → Qualified → Proposal → Close）
  客戶分群：RFM 分析
  指標：NPS、CSAT、LTV、Churn Rate

ERP：
  一個系統管所有流程
  核心流程：O2C、P2P、R2R
  導入挑戰：資料遷移、流程標準化、用戶抗拒
  常見系統：SAP、Oracle、Dynamics 365

跨領域整合：
  API / ESB / iPaaS
  整合方式：批次 / 即時 / 事件驅動
  Business Engineer = 部門間的翻譯官
```

### 面試領域題回答框架

```
1. 了解業務流程（畫流程）
2. 找出痛點（對照效率/成本/品質）
3. 建議方案（分階段、量化效益）
4. 計算 ROI（投資 vs 回報）
```

"""

    // MARK: - World 37 (en)
    private static let enWorld37 = """

# World 37: Domain Knowledge

> Technical skills determine whether you can do analysis; domain knowledge determines whether you can produce valuable analysis.
> Business Engineers need to understand different business domains to design truly useful systems.

Interviewers often say: "Technical skills can be learned, but Business Sense is hard to teach."
This chapter helps you build foundational knowledge across common business domains.

---

## 37-1: Operations & Supply Chain

### Supply Chain Basics

```
Raw Materials → Manufacturing → Warehousing → Logistics → Retail → Consumer
  ↑                                                              │
  └────────────────── Reverse Logistics (Returns) ←──────────────┘
```

### Key Supply Chain Metrics

| Metric | Formula / Description | Target |
|--------|----------------------|--------|
| Inventory Turnover | COGS / Average Inventory | Higher is better |
| Days of Inventory | 365 / Inventory Turnover | Lower is better |
| Fill Rate | Fulfilled Orders / Total Orders | > 95% |
| On-time Delivery | On-time Shipments / Total Shipments | > 98% |
| Order Cycle Time | Time from order placement to delivery | Shorter is better |
| Perfect Order Rate | Perfect Orders / Total Orders | > 90% |

### Inventory Management Models

```
EOQ (Economic Order Quantity)
  Q* = √(2DS / H)
  D = Annual demand
  S = Ordering cost per order
  H = Holding cost per unit

Safety Stock = Z × σ × √L
  Z = Z-value for service level (95% → 1.65)
  σ = Demand standard deviation
  L = Lead Time
```

### Common Operations Strategies

| Strategy | Description | Best For |
|----------|-------------|----------|
| MTS (Make-to-Stock) | Forecast-based production, maintain inventory | Standard products, stable demand |
| MTO (Make-to-Order) | Produce only when orders are received | Custom products, high-value items |
| JIT (Just-in-Time) | Procure only when needed | Limited space, many components |
| Drop Shipping | Hold no inventory, supplier ships directly | E-commerce, long-tail products |

### Supply Chain Digitization Trends

```
Traditional: Excel for inventory → Manual ordering → Paper-based reconciliation
Digital:
  ✅ ERP systems for automatic inventory level management
  ✅ AI-driven demand forecasting (reducing bullwhip effect)
  ✅ IoT for real-time logistics tracking
  ✅ Blockchain for supply chain transparency
  ✅ RPA for automated procurement processes
```

---

## 37-2: Finance Basics

### Three Major Financial Statements

| Statement | Question It Answers | Key Items |
|-----------|-------------------|-----------|
| Income Statement | How much did we earn? | Revenue, Costs, Profit |
| Balance Sheet | What do we own? | Assets, Liabilities, Equity |
| Cash Flow Statement | Where does money come from and go? | Operating / Investing / Financing Cash Flows |

### Income Statement Structure

```
Revenue                               $10,000,000
- Cost of Goods Sold (COGS)           - $4,000,000
= Gross Profit                         $6,000,000   (Gross Margin 60%)
- Operating Expenses
  - Marketing                         - $1,500,000
  - R&D                               - $2,000,000
  - G&A                               - $1,000,000
= Operating Income                     $1,500,000   (Operating Margin 15%)
- Interest / Taxes                     - $500,000
= Net Income                           $1,000,000   (Net Margin 10%)
```

### Common Financial Metrics

| Metric | Formula | Meaning |
|--------|---------|---------|
| Gross Margin | (Revenue - COGS) / Revenue | Product-level profitability |
| Operating Margin | Operating Income / Revenue | Core business profitability |
| Net Margin | Net Income / Revenue | Overall profitability |
| ROI | (Gain - Cost) / Cost | Return on Investment |
| ROE | Net Income / Shareholders' Equity | Return on Equity |
| Burn Rate | Monthly cash consumption | Startup survival metric |
| Runway | Cash / Burn Rate | Months of cash remaining |

### Departmental Budget Structure

```
Annual Budget
├── Revenue Budget (Top-line)
│   ├── Product A: $5M (10% growth)
│   ├── Product B: $3M (5% growth)
│   └── New Product C: $2M
├── Cost Budget
│   ├── Personnel: $4.5M (60%)
│   ├── Marketing: $1.5M (20%)
│   ├── IT Infrastructure: $0.75M (10%)
│   └── Other: $0.75M (10%)
└── Capital Expenditure (CapEx)
    ├── New Office: $500K
    └── Equipment: $300K
```

### Common Finance Interview Questions

```
Q: A new feature requires $500K investment and is projected to add $200K annual revenue. Would you recommend it?

A: More information is needed to decide:
1. Payback period: $500K / $200K = 2.5 years
   → If product lifecycle > 3 years, it's acceptable
2. Opportunity cost: What return could this $500K generate elsewhere?
3. Are there non-financial benefits: Brand value, customer satisfaction?
4. Risk: How confident is the $200K projection?
5. Cash flow: Does the company have sufficient runway?
```

---

## 37-3: CRM & Customer Management

### CRM Core Concepts

```
CRM = Customer Relationship Management

Purpose: Manage customers through their full lifecycle from "awareness" to "loyalty"

Customer Lifecycle:
Awareness → Acquisition → Activation → Revenue → Retention → Referral
```

### CRM System Core Modules

| Module | Function | Users |
|--------|----------|-------|
| Contact Management | Customer profiles, interaction records | Sales, Support |
| Pipeline Management | Sales stage tracking | Sales Team |
| Campaign Management | Marketing campaign tracking | Marketing Team |
| Service Management | Tickets, SLA tracking | Support Team |
| Reporting & Analytics | Sales forecasts, performance analysis | Management |

### Sales Pipeline

```
Stage               Count   Value        Conversion
────────────────────────────────────────────────────
Lead (Prospect)      100    $5,000,000   100%
  ↓
Qualified             40    $2,000,000    40%
  ↓
Proposal              20    $1,000,000    50%
  ↓
Negotiation           10      $500,000    50%
  ↓
Closed Won             5      $250,000    50%

Overall Conversion: 5%
Average Deal Size: $50,000
```

### Customer Segmentation Methods

```
RFM Analysis:
  R (Recency): Time since last purchase
  F (Frequency): Purchase frequency
  M (Monetary): Purchase amount

Customer Segments:
┌──────────────┬──────┬──────┬──────┐
│ Segment      │ R    │ F    │ M    │
├──────────────┼──────┼──────┼──────┤
│ VIP          │ High │ High │ High │
│ Loyal        │ High │ High │ Low  │
│ Dormant      │ Low  │ High │ High │
│ At Risk      │ Low  │ Low  │ High │
│ New          │ High │ Low  │ Low  │
└──────────────┴──────┴──────┴──────┘
```

### Customer Success Metrics

| Metric | Description | Good Benchmark |
|--------|-------------|---------------|
| NPS | Net Promoter Score (-100 to 100) | > 30 |
| CSAT | Customer Satisfaction Score | > 80% |
| CES | Customer Effort Score (lower is better) | < 3 |
| Churn Rate | Monthly churn rate | < 5% |
| LTV | Customer Lifetime Value | > 3x CAC |
| Time to Value | Time from sign-up to experiencing value | < 7 days |

---

## 37-4: ERP & Business Processes

### ERP Core Concepts

```
ERP = Enterprise Resource Planning

Core Idea: One system to manage all core business processes
           Breaking down information silos between departments
```

### ERP Core Modules

```
┌────────────────────────────────┐
│           ERP System           │
├────────┬────────┬──────────────┤
│ Finance│   HR   │ Manufacturing│
│ GL/AP/AR│ Payroll│  BOM/MRP    │
│Cost Ctr│ Attend │ Work Orders  │
├────────┼────────┼──────────────┤
│Procure-│ Sales  │  Inventory   │
│  ment  │ SO/Quot│  In/Out Mgmt │
│Supplier│Customer│  Stocktaking │
└────────┴────────┴──────────────┘
```

### Common ERP Systems Comparison

| System | Strengths | Best For | Price |
|--------|-----------|----------|-------|
| SAP S/4HANA | Most comprehensive, global standard | Large enterprises | $$$$ |
| Oracle ERP Cloud | Cloud-native, AI-driven | Mid-to-large enterprises | $$$ |
| Microsoft Dynamics 365 | Microsoft ecosystem integration | Mid-size enterprises | $$ |
| NetSuite | Cloud ERP pioneer | SMBs | $$ |
| Odoo | Open source, modular | Small businesses | $ |

### Core Business Processes

```
Order-to-Cash (O2C): From order to payment receipt
  Customer Order → Check Inventory → Ship → Invoice → Collect Payment

Procure-to-Pay (P2P): From procurement to payment
  Requisition → Approval → Purchase Order → Receive → Inspect → Pay

Record-to-Report (R2R): From bookkeeping to reporting
  Journal Entry → Post → Adjust → Close → Generate Reports

Plan-to-Produce: From planning to production
  Demand Forecast → MRP Calculation → Production Scheduling → Manufacturing → QC
```

### ERP Implementation Challenges

```
Common Challenges:
1. Data migration: Inconsistent data formats from legacy systems
2. Process standardization: Different departments do things differently — who compromises?
3. User resistance: "We've always done it this way"
4. Customization vs Standardization: Too much customization → upgrade difficulties
5. Cost overruns: Typically exceeds budget by 50-100%
6. Schedule delays: Average 6-12 months late

Success Factors:
✅ Executive sponsorship
✅ Experienced implementation consultants
✅ Comprehensive training
✅ Phased rollout (avoid big bang approach)
✅ Clear Change Management plan
```

---

## 37-5: Cross-Domain Integration

### System Integration Architecture

```
┌──────┐   ┌──────┐   ┌──────┐
│ CRM  │   │ ERP  │   │  BI  │
└──┬───┘   └──┬───┘   └──┬───┘
   │          │          │
   └──────────┼──────────┘
              │
        ┌─────┴─────┐
        │Integration│ (API Gateway / ESB / iPaaS)
        │ Platform  │
        └─────┬─────┘
              │
   ┌──────────┼──────────┐
   │          │          │
┌──┴───┐ ┌───┴──┐ ┌────┴──┐
│E-comm│ │ POS  │ │Logist.│
└──────┘ └──────┘ └──────┘
```

### Common Cross-Domain Integration Scenarios

| Integration Scenario | Systems Involved | Business Value |
|---------------------|-----------------|---------------|
| Customer 360-degree View | CRM + ERP + Support | Holistic customer understanding |
| Real-time Inventory Query | ERP + E-commerce + POS | Prevent overselling |
| Automated Reporting | ERP + BI + Data Warehouse | Decision support |
| Marketing Automation | CRM + Email + Social | Precision marketing |
| Supply Chain Visibility | ERP + Logistics + IoT | Real-time tracking |

### Data Integration Methods

```
1. Batch Integration
   - Scheduled syncs (daily, hourly)
   - Suitable for reporting, non-real-time scenarios
   - ETL: Extract → Transform → Load

2. Real-time Integration
   - API real-time calls
   - Suitable for transactions, inventory, and other real-time scenarios
   - REST API / GraphQL

3. Event-driven Integration
   - Triggered when events occur
   - Suitable for notifications, workflows
   - Message Queue / Webhook
```

### Cross-Department Communication Translation

```
The same thing, different department terminology:

Sales: "Customer"
IT: "User"
Marketing: "Audience"
Support: "Case"

Sales: "I need to see a report"
IT: "Need a Dashboard"
Finance: "Month-end report"

→ The Business Engineer's value:
   Being the "translator" between different departments
   Communicating in language each department understands
```

---

## 37-6: Domain Analysis Practice

### Case: Digital Transformation for a Retail Business

```
Background:
A traditional supermarket chain (50 stores) wants to undergo digital transformation.
Currently everything is managed with Excel, no systems in place.
Annual revenue $50M, profit margin 5% ($2.5M).
The CEO wants digital transformation to improve profit margin by 2%.
```

### Analysis Framework

```
Step 1: Understand Business Processes
  Procurement → Receiving → Shelving → Sales → Checkout → Inventory Management

Step 2: Identify Pain Points
  ┌──────────────┬──────────────────┬──────────────────┐
  │ Process      │ Pain Point       │ Impact           │
  ├──────────────┼──────────────────┼──────────────────┤
  │ Procurement  │ Orders by instinct│ Over/under stock │
  │ Inventory    │ Manual counting  │ Inaccurate data  │
  │ Sales Anlys  │ No POS data      │ Don't know bestsellers│
  │ Membership   │ Paper cards      │ No precision mktg│
  │ Multi-store  │ Separate reports │ Can't compare    │
  └──────────────┴──────────────────┴──────────────────┘

Step 3: Recommended Plan
  Phase 1 (0-6 months): POS + Basic ERP
    - Deploy POS system → Establish sales data foundation
    - Deploy basic ERP → Unified inventory management
    - Investment: $500K, Expected benefit: 30% reduction in inventory waste

  Phase 2 (6-12 months): CRM + Membership System
    - Digital membership + Marketing automation
    - Investment: $300K, Expected benefit: 15% increase in member purchase frequency

  Phase 3 (12-18 months): BI + Advanced Analytics
    - Sales forecasting + Automated replenishment recommendations
    - Investment: $200K, Expected benefit: 50% reduction in stockout rate

Step 4: ROI Calculation
  Inventory waste reduction: $50M × 2% × 30% = $300K
  Member revenue growth: $50M × 20% (member share) × 15% = $1.5M
  Operational efficiency: 50 stores × $10K/year = $500K
  Total benefit: $2.3M / year
  Investment: $1M
  ROI: 130%
```

### Interview Verbal Response Example

```
"The core problem for this supermarket is the lack of a data foundation.
 I would recommend a three-phase digital transformation:

 First, deploy POS and ERP to establish the data foundation —
 this is a prerequisite for all subsequent analysis.

 Second, implement CRM for membership management,
 because in retail, 20% of loyal customers typically contribute 80% of revenue.

 Third, add BI for advanced analytics,
 such as sales forecasting and automated replenishment.

 Total investment is approximately $1M, with estimated annual benefits of $2.3M,
 achieving payback within the first year."
```

---

## Key Takeaways - World 37 Cheat Sheet

### Domain Knowledge Quick Reference

```
Supply Chain:
  Raw Materials → Manufacturing → Warehousing → Logistics → Sales
  Key Metrics: Inventory Turnover, Fill Rate, On-time Delivery
  Strategies: MTS / MTO / JIT / Drop Shipping

Three Financial Statements:
  Income Statement → How much we earned
  Balance Sheet → What we own
  Cash Flow Statement → Where money flows
  Key Metrics: Gross Margin, Operating Margin, ROI, Burn Rate

CRM:
  Customer lifecycle management
  Sales Pipeline (Lead → Qualified → Proposal → Close)
  Customer Segmentation: RFM Analysis
  Metrics: NPS, CSAT, LTV, Churn Rate

ERP:
  One system managing all processes
  Core Processes: O2C, P2P, R2R
  Implementation Challenges: Data migration, Process standardization, User resistance
  Common Systems: SAP, Oracle, Dynamics 365

Cross-Domain Integration:
  API / ESB / iPaaS
  Integration Methods: Batch / Real-time / Event-driven
  Business Engineer = Translator between departments
```

### Interview Domain Question Framework

```
1. Understand business processes (map the flow)
2. Identify pain points (compare efficiency/cost/quality)
3. Recommend solutions (phased approach, quantify benefits)
4. Calculate ROI (investment vs return)
```

"""

    // MARK: - World 38 (zh)
    private static let zhWorld38 = """

# World 38：Product Metrics (產品指標)

> Product Analyst 的核心工作就是用指標衡量產品表現。
> 選對指標，才能做出正確的產品決策。

產品團隊每天都在問：「這個功能有效嗎？」「我們應該優先做什麼？」
回答這些問題的基礎就是產品指標。

---

## 38-1：Activation / Onboarding 指標

### Activation 的定義

```
Activation = 用戶第一次感受到產品核心價值的時刻

不同產品的 Activation Moment：
  Slack：發送第一則訊息
  Dropbox：上傳第一個檔案
  Spotify：建立第一個播放清單
  電商：完成第一筆購買
  SaaS：完成初始設定並使用核心功能
```

### Activation 指標

| 指標 | 定義 | 計算方式 |
|------|------|---------|
| Activation Rate | 完成 Activation 的用戶比例 | Activated Users / Total Sign-ups |
| Time to Value (TTV) | 從註冊到 Activation 的時間 | 中位數或平均值 |
| Setup Completion Rate | 完成初始設定的比例 | Completed Setup / Total Sign-ups |
| Onboarding Drop-off | 各步驟的流失率 | 每步完成人數 / 上一步完成人數 |

### Onboarding Funnel 分析

```
Step 1: 註冊             10,000 (100%)
  ↓
Step 2: Email 驗證         7,500 (75%)  ← 25% 流失
  ↓
Step 3: 個人資料填寫       6,000 (60%)  ← 20% 流失
  ↓
Step 4: 功能教學           4,500 (45%)  ← 25% 流失
  ↓
Step 5: 核心功能使用       3,000 (30%)  ← 33% 流失
  ↓
Activated!                2,000 (20%)  ← 33% 流失

Activation Rate = 20%
最大流失點：Step 4 → Step 5（核心功能使用）
→ 優先改善核心功能的引導體驗
```

### 改善 Activation 的策略

```
1. 減少摩擦（Remove Friction）
   - 簡化註冊流程（社群登入）
   - 延後非必要欄位的填寫
   - Progressive Profiling

2. 引導式體驗（Guided Experience）
   - 互動式教學（Interactive Tour）
   - Checklist（完成進度條）
   - 範例資料（讓用戶立即看到價值）

3. 個人化（Personalization）
   - 根據用戶角色客製化 Onboarding
   - 推薦最相關的功能

4. 快速價值展示（Quick Win）
   - 讓用戶在 5 分鐘內看到成果
   - 提供 Template / 預設模板
```

### 面試題

```
Q：一個 SaaS 工具的 Activation Rate 只有 15%，你會怎麼改善？

A：
1. 先定義 Activation：用戶首次完成哪個動作代表「被激活」？
2. 分析 Onboarding Funnel：看每一步的流失率
3. 找出最大 Drop-off 點
4. 根據原因設計改善方案
5. A/B Test 驗證效果

假設最大流失在「功能教學」步驟：
→ 可能教學太長、太無聊
→ 嘗試：縮短為 3 步、加入互動元素、提供跳過選項
→ 目標：Activation Rate 從 15% → 25%
```

---

## 38-2：Engagement Metrics (互動指標)

### 核心 Engagement 指標

| 指標 | 定義 | 公式 |
|------|------|------|
| DAU | 日活躍用戶 | 當天登入/使用的唯一用戶數 |
| WAU | 週活躍用戶 | 7 天內登入/使用的唯一用戶數 |
| MAU | 月活躍用戶 | 30 天內登入/使用的唯一用戶數 |
| DAU/MAU | 黏著度 (Stickiness) | DAU / MAU |
| Session Duration | 每次使用時長 | 平均每次 Session 的時間 |
| Sessions per User | 使用頻率 | 每個用戶每天/週的 Session 數 |

### DAU/MAU 解讀

```
DAU/MAU = Stickiness（黏著度）

DAU/MAU = 50% → 用戶平均每月使用 15 天（非常好）
DAU/MAU = 30% → 每月使用 9 天（不錯）
DAU/MAU = 10% → 每月使用 3 天（需要改善）

業界基準：
  社群媒體：> 50%（Facebook ~65%）
  通訊軟體：> 60%（LINE ~70%）
  電商：10-20%
  SaaS 工具：15-25%
  媒體/新聞：10-15%
```

### Feature Adoption 指標

```
Feature Adoption Rate = 使用該功能的用戶 / 總活躍用戶

功能使用矩陣：
┌──────────────┬───────────┬───────────┐
│ 功能          │ Adoption  │ 頻率       │
├──────────────┼───────────┼───────────┤
│ 核心搜尋      │ 85%       │ 每日       │  ← 核心功能
│ 篩選條件      │ 45%       │ 每週       │  ← 重要輔助
│ 收藏功能      │ 25%       │ 每週       │  ← 可加強推廣
│ 分享功能      │ 8%        │ 每月       │  ← 需要評估存廢
│ 進階報表      │ 3%        │ 很少       │  ← 考慮移除
└──────────────┴───────────┴───────────┘
```

### Power User 分析

```
用戶分群（依使用頻率）：
  Power Users：每天使用，佔 10%，貢獻 60% 的互動
  Regular Users：每週使用 3-4 次，佔 25%
  Casual Users：每週使用 1-2 次，佔 30%
  Dormant Users：偶爾使用，佔 35%

分析重點：
  1. Power Users 在用什麼功能？→ 這是產品核心價值
  2. Regular → Power 的轉換因素是什麼？→ 成長槓桿
  3. Casual → Dormant 的流失原因是什麼？→ 留存機會
```

### L7 / L28 分析

```
L7 = 過去 7 天內使用了幾天
L28 = 過去 28 天內使用了幾天

L7 分佈：
  7天（每天用）：15% ← 高黏著
  5-6天：        12%
  3-4天：        20%
  1-2天：        28%
  0天：          25% ← 流失風險

健康的 L7 分佈：U 型（兩端高）
  → 用戶不是每天用就是不用
  → 中間的「偶爾用」最不穩定
```

---

## 38-3：Retention / Churn (留存 / 流失)

### Retention 的類型

| 類型 | 定義 | 適用 |
|------|------|------|
| Day N Retention | 第 N 天回來的用戶比例 | App、遊戲 |
| Week N Retention | 第 N 週回來的用戶比例 | 社群、SaaS |
| Bracket Retention | 在某個時間區間回來的比例 | 低頻產品 |
| Rolling Retention | 第 N 天之後任一天回來 | 整體留存趨勢 |

### Retention Curve

```
100%
 │╲
 │ ╲
 │  ╲
 │   ╲_______________  ← 好的留存（曲線趨平）
 │    ╲
 │     ╲
 │      ╲
 │       ╲____________  ← 普通留存
 │        ╲
 │         ╲
 │          ╲
 │           ╲  ← 差的留存（持續下降）
 │            ╲
 0──────────────────→ 時間
   D1  D7  D14  D30

業界基準（App）：
  D1：40-50%
  D7：20-30%
  D30：10-15%
  D90：5-10%（如果能穩定在此 = 找到 PMF）
```

### Cohort Analysis（世代分析）

```
以註冊月份分群，追蹤各群留存率：

         Month 0  Month 1  Month 2  Month 3  Month 4
Jan 群   100%     45%      30%      25%      22%
Feb 群   100%     48%      33%      28%      25%
Mar 群   100%     52%      38%      32%       -
Apr 群   100%     55%      40%       -        -
May 群   100%     58%       -        -        -

觀察：
✅ Month 1 留存率逐月提升（45% → 58%）
→ 說明 Onboarding 改善有效！
```

### Churn 分析

```
Churn Rate = 流失用戶數 / 期初用戶數

月流失率 5% 的真實影響：
  1 月：1000 用戶
  6 月：1000 × (0.95)^5 = 774 用戶（-23%）
  12 月：1000 × (0.95)^11 = 569 用戶（-43%）
  → 5% 月流失看起來不嚴重，但一年後少了近一半！

Revenue Churn vs Logo Churn：
  Logo Churn：流失的客戶數（用戶維度）
  Revenue Churn：流失的營收金額（金額維度）

  如果流失的都是小客戶 → Logo Churn 高但 Revenue Churn 低
  如果流失的是大客戶 → Logo Churn 低但 Revenue Churn 高（更危險！）
```

### 流失預測模型

```
流失前的行為信號：
┌──────────────────────┬───────────┐
│ 信號                  │ 風險等級   │
├──────────────────────┼───────────┤
│ 登入頻率下降 50%      │ ⚠️ 中     │
│ 核心功能使用量歸零    │ 🔴 高     │
│ 客服投訴增加          │ 🔴 高     │
│ 合約到期前未續約意願  │ 🔴 高     │
│ NPS 分數 < 0          │ ⚠️ 中     │
│ 競品功能使用（如適用）│ 🔴 極高   │
└──────────────────────┴───────────┘

Health Score = Σ(信號 × 權重)
  < 40 分 → Red（高流失風險）
  40-70 分 → Yellow（需關注）
  > 70 分 → Green（健康）
```

---

## 38-4：Conversion / Monetization (轉換 / 變現)

### Conversion Funnel

```
Visit → Sign-up → Activation → Trial → Paid
 100K    10K       5K          2K     500

轉換率：
  Visit → Sign-up: 10%
  Sign-up → Activation: 50%
  Activation → Trial: 40%
  Trial → Paid: 25%
  Overall: 0.5%
```

### 關鍵轉換指標

| 指標 | 定義 | 業界基準 |
|------|------|---------|
| Free-to-Paid Conversion | 免費用戶轉付費 | SaaS: 2-5% |
| Trial-to-Paid | 試用轉付費 | 15-30% |
| Cart Conversion | 加購物車到付款 | 電商: 30-40% |
| Upsell Rate | 升級到更高方案 | 5-10% / year |
| Cross-sell Rate | 購買其他產品 | 10-20% |

### ARPU / ARPPU

```
ARPU = Average Revenue Per User
     = 總營收 / 總用戶數
     （含免費用戶）

ARPPU = Average Revenue Per Paying User
      = 總營收 / 付費用戶數
      （只算付費用戶）

範例：
  總用戶：100,000
  付費用戶：5,000（5%）
  月營收：$250,000

  ARPU = $250,000 / 100,000 = $2.5
  ARPPU = $250,000 / 5,000 = $50
```

### LTV（Customer Lifetime Value）

```
簡易 LTV 計算：
  LTV = ARPU × 平均客戶生命週期
  LTV = ARPU / Churn Rate

範例：
  ARPU = $50/月
  月流失率 = 5%
  LTV = $50 / 0.05 = $1,000

進階 LTV 計算：
  LTV = (ARPU × Gross Margin) / Churn Rate
  LTV = ($50 × 70%) / 5% = $700

LTV / CAC 比率：
  > 3：健康（有利可圖）
  1-3：可接受（需優化）
  < 1：危險（在燒錢）
```

### Pricing 策略指標

```
常見 SaaS 定價模型：
┌──────────────┬──────────────┬──────────────┐
│ 定價模型      │ 範例          │ 適用場景      │
├──────────────┼──────────────┼──────────────┤
│ Flat Rate    │ $29/月        │ 簡單產品      │
│ Tiered       │ 基本/進階/企業 │ 不同需求      │
│ Per Seat     │ $10/人/月     │ 協作工具      │
│ Usage-based  │ $0.01/API call│ 開發者工具    │
│ Freemium     │ 免費 + 付費版  │ 大眾市場      │
└──────────────┴──────────────┴──────────────┘
```

---

## 38-5：指標框架 (AARRR, North Star)

### AARRR (Pirate Metrics)

```
A - Acquisition（獲取）
    用戶從哪裡來？
    指標：新用戶數、CAC、Channel 轉換率

A - Activation（啟用）
    用戶有沒有感受到價值？
    指標：Activation Rate、Time to Value

R - Retention（留存）
    用戶有沒有回來？
    指標：D1/D7/D30 Retention、DAU/MAU

R - Revenue（營收）
    用戶有沒有付錢？
    指標：ARPU、LTV、Conversion Rate

R - Referral（推薦）
    用戶有沒有推薦別人？
    指標：NPS、Viral Coefficient、Referral Rate
```

### AARRR 指標看板範例

```
┌─────────────┬──────────┬──────────┬──────────┐
│ Stage       │ 本月      │ 上月      │ 變化     │
├─────────────┼──────────┼──────────┼──────────┤
│ Acquisition │ 15,000   │ 12,000   │ +25% ✅  │
│ Activation  │ 4,500    │ 3,000    │ +50% ✅  │
│ Retention   │ 2,250    │ 1,800    │ +25% ✅  │
│ Revenue     │ $112,500 │ $81,000  │ +39% ✅  │
│ Referral    │ 675      │ 450      │ +50% ✅  │
└─────────────┴──────────┴──────────┴──────────┘
```

### North Star Metric

```
North Star Metric = 最能反映產品核心價值的單一指標

特點：
1. 代表用戶獲得的核心價值
2. 與長期營收高度相關
3. 全公司可以圍繞它對齊

各產品的 North Star：
┌──────────────┬──────────────────────────┐
│ 產品          │ North Star Metric        │
├──────────────┼──────────────────────────┤
│ Airbnb       │ 完成的住宿夜數            │
│ Spotify      │ 花在聆聽的時間            │
│ Slack        │ 每日發送的訊息數          │
│ Shopify      │ 商家的 GMV               │
│ Netflix      │ 每月觀看時數              │
│ Facebook     │ DAU                      │
│ Uber         │ 每週完成的乘車次數        │
└──────────────┴──────────────────────────┘
```

### 建立 Metric Tree

```
North Star: 每月完成的訂單數

每月訂單數
├── 活躍買家數
│   ├── 新買家（Acquisition）
│   │   ├── 廣告流量
│   │   ├── 自然流量
│   │   └── 推薦流量
│   └── 回訪買家（Retention）
│       ├── 推播通知觸達率
│       └── Email 開信率
├── 每人訂單數（Frequency）
│   ├── 商品豐富度
│   ├── 推薦準確度
│   └── 促銷活動
└── 訂單完成率（Conversion）
    ├── 搜尋成功率
    ├── 結帳轉換率
    └── 付款成功率
```

### Input Metrics vs Output Metrics

```
Output Metrics（結果指標）：
  營收、DAU、Retention Rate
  → 告訴你「結果怎樣」，但無法直接改善

Input Metrics（驅動指標）：
  Onboarding 完成率、功能使用頻率、通知觸達率
  → 告訴你「該改善什麼」，可以直接行動

好的指標體系 = Output + Input
  Output：月營收增長 10%
  Input：Activation Rate 從 20% → 35%
         結帳轉換率從 25% → 35%
         推薦率從 5% → 10%
```

---

## 38-6：Product Metrics Case 實戰

### Case：音樂串流 App 的指標體系設計

```
背景：
你是一個音樂串流 App（類似 Spotify）的 Product Analyst。
產品有免費版（有廣告）和付費版（$9.99/月）。
MAU 500 萬，付費用戶比例 8%。
```

### Step 1：定義 North Star

```
North Star Metric：每月聆聽時數
  為什麼？
  - 反映用戶從產品獲得的核心價值
  - 聆聽時數越高 → 留存越好 → 付費轉換越高
  - 可以驅動廣告收入（免費版）和訂閱收入（付費版）
```

### Step 2：建立 AARRR 指標

```
Acquisition：
  - 新用戶註冊數：50K/月
  - CAC：$5（付費廣告）、$0（自然流量）
  - Channel 分佈：自然 60%、付費 25%、推薦 15%

Activation：
  - Activation 定義：7 天內聆聽 ≥ 3 首歌
  - Activation Rate：55%
  - Time to Value：2 天（中位數）

Retention：
  - D1 Retention：60%
  - D7 Retention：40%
  - D30 Retention：25%
  - DAU/MAU：35%

Revenue：
  - Free-to-Paid Conversion：8%
  - ARPU：$2.5/月（含免費用戶）
  - ARPPU：$9.99/月
  - LTV：$120（付費用戶平均留存 12 個月）
  - Ad Revenue per Free User：$0.8/月

Referral：
  - NPS：35
  - Viral Coefficient：0.3（每個用戶帶來 0.3 個新用戶）
  - Referral Rate：5%
```

### Step 3：找出最大槓桿

```
分析各環節的改善空間：

                現狀    業界基準   Gap     潛在影響
Activation     55%     65%       10%     +25K MAU
D30 Retention  25%     30%       5%      +125K MAU
Free-to-Paid   8%      12%       4%      +$800K 年營收
DAU/MAU        35%     40%       5%      +50K 聆聽時數/天

結論：
1. 最大槓桿 = Activation（影響下游所有指標）
2. 次要槓桿 = Free-to-Paid（直接影響營收）
```

### Step 4：設計改善方案

```
方案 1：改善 Activation（目標 55% → 65%）
  - 新用戶首次登入時，用 AI 推薦 10 首歌（基於口味選擇）
  - 自動建立「每日推薦」播放清單
  - 3 天內未回訪 → 推送通知「你可能喜歡的新歌」
  預估效果：Activation +10% → 下游 Retention 和 Revenue 連帶提升

方案 2：提升 Free-to-Paid（目標 8% → 12%）
  - 免費試用 Premium 7 天（目前只有 3 天）
  - 在高頻使用者中推送升級提示
  - 年繳方案（$7.99/月 vs $9.99/月）
  預估效果：每年增加 100K 付費用戶，年增營收 $3.6M

方案 3：提升 DAU/MAU（目標 35% → 40%）
  - 每日推播個人化推薦
  - 加入 Podcast 內容（增加使用場景）
  - 社群功能（好友在聽什麼）
```

### Step 5：追蹤與迭代

```
Weekly Metrics Dashboard：
┌──────────────────┬──────┬──────┬──────┐
│ 指標              │ 目標  │ 實際  │ 狀態 │
├──────────────────┼──────┼──────┼──────┤
│ 月聆聽時數（NSM） │ 8M hrs│ 7.5M │ ⚠️  │
│ 新用戶註冊        │ 55K  │ 52K  │ ⚠️  │
│ Activation Rate  │ 65%  │ 60%  │ 📈   │
│ D30 Retention    │ 30%  │ 27%  │ 📈   │
│ Free-to-Paid     │ 12%  │ 9.5% │ 📈   │
│ ARPU             │ $3.0 │ $2.7 │ ⚠️  │
│ NPS              │ 40   │ 37   │ 📈   │
└──────────────────┴──────┴──────┴──────┘
```

### 面試口頭回答

```
「我會選『每月聆聽時數』作為 North Star Metric，
 因為它直接反映用戶從產品獲得的核心價值。

 分析 AARRR 漏斗後，我認為最大的改善槓桿是 Activation。
 目前 Activation Rate 只有 55%，低於業界基準 65%。
 如果能提升到 65%，下游的 Retention 和 Revenue 都會連帶改善。

 具體方案是利用 AI 在新用戶首次登入時推薦個人化歌單，
 讓用戶更快感受到產品價值。
 同時搭配 3 天內的推播通知，拉回未回訪的用戶。

 我會設計 A/B Test 來驗證效果，
 用 Activation Rate 作為主要指標，
 D7 Retention 作為次要指標，確保改善不是短期的。」
```

---

## 🔑 World 38 Cheat Sheet

### 產品指標速查

```
Activation：
  Activation Rate、Time to Value、Setup Completion
  關鍵：讓用戶盡快感受到核心價值

Engagement：
  DAU / MAU / DAU÷MAU（Stickiness）
  Feature Adoption、Session Duration
  L7 / L28 分佈

Retention：
  Day N Retention、Cohort Analysis
  Retention Curve 要看「是否趨平」
  5% 月流失 → 一年少 43% 用戶

Conversion / Monetization：
  Free-to-Paid、ARPU / ARPPU、LTV
  LTV / CAC > 3 = 健康

AARRR：
  Acquisition → Activation → Retention → Revenue → Referral
  找出最大 Drop-off → 最大改善槓桿

North Star Metric：
  反映核心價值的單一指標
  Spotify = 聆聽時數
  電商 = 訂單數
  SaaS = 活躍使用量

Input vs Output：
  Output = 結果（營收、DAU）→ 看表現
  Input = 驅動（Activation Rate）→ 可行動
```

### 面試回答框架

```
1. 定義 North Star（為什麼選這個指標？）
2. 用 AARRR 拆解漏斗
3. 找出最大 Gap（跟業界比）
4. 提出改善方案（具體、可量化）
5. 說明如何驗證（A/B Test、追蹤指標）
```

"""

    // MARK: - World 38 (en)
    private static let enWorld38 = """

# World 38: Product Metrics

> The core job of a Product Analyst is measuring product performance with metrics.
> Choosing the right metrics enables correct product decisions.

Product teams ask every day: "Is this feature working?" "What should we prioritize?"
The foundation for answering these questions is product metrics.

---

## 38-1: Activation / Onboarding Metrics

### Defining Activation

```
Activation = The moment a user first experiences the product's core value

Activation Moments for different products:
  Slack: Sending the first message
  Dropbox: Uploading the first file
  Spotify: Creating the first playlist
  E-commerce: Completing the first purchase
  SaaS: Completing initial setup and using a core feature
```

### Activation Metrics

| Metric | Definition | Calculation |
|--------|-----------|-------------|
| Activation Rate | Percentage of users who complete Activation | Activated Users / Total Sign-ups |
| Time to Value (TTV) | Time from sign-up to Activation | Median or average |
| Setup Completion Rate | Percentage who complete initial setup | Completed Setup / Total Sign-ups |
| Onboarding Drop-off | Drop-off rate at each step | Step completions / Previous step completions |

### Onboarding Funnel Analysis

```
Step 1: Sign-up            10,000 (100%)
  ↓
Step 2: Email Verification    7,500 (75%)  ← 25% drop-off
  ↓
Step 3: Profile Setup         6,000 (60%)  ← 20% drop-off
  ↓
Step 4: Feature Tutorial      4,500 (45%)  ← 25% drop-off
  ↓
Step 5: Core Feature Usage    3,000 (30%)  ← 33% drop-off
  ↓
Activated!                    2,000 (20%)  ← 33% drop-off

Activation Rate = 20%
Biggest Drop-off Point: Step 4 → Step 5 (core feature usage)
→ Prioritize improving the core feature onboarding experience
```

### Strategies to Improve Activation

```
1. Remove Friction
   - Simplify sign-up flow (social login)
   - Defer non-essential field entry
   - Progressive Profiling

2. Guided Experience
   - Interactive Tour
   - Checklist (progress bar)
   - Sample data (let users see value immediately)

3. Personalization
   - Customize onboarding based on user role
   - Recommend the most relevant features

4. Quick Win
   - Let users see results within 5 minutes
   - Provide Templates / Prebuilt setups
```

### Interview Question

```
Q: A SaaS tool has an Activation Rate of only 15%. How would you improve it?

A:
1. First define Activation: What action represents a user being "activated"?
2. Analyze the Onboarding Funnel: Examine drop-off rates at each step
3. Identify the biggest drop-off point
4. Design improvement plans based on the root cause
5. A/B Test to validate effectiveness

Assuming the biggest drop-off is at the "Feature Tutorial" step:
→ Tutorial may be too long or boring
→ Try: Shorten to 3 steps, add interactive elements, provide skip option
→ Goal: Activation Rate from 15% → 25%
```

---

## 38-2: Engagement Metrics

### Core Engagement Metrics

| Metric | Definition | Formula |
|--------|-----------|---------|
| DAU | Daily Active Users | Unique users who logged in/used the product that day |
| WAU | Weekly Active Users | Unique users within 7 days |
| MAU | Monthly Active Users | Unique users within 30 days |
| DAU/MAU | Stickiness | DAU / MAU |
| Session Duration | Time per session | Average time per session |
| Sessions per User | Usage frequency | Sessions per user per day/week |

### DAU/MAU Interpretation

```
DAU/MAU = Stickiness

DAU/MAU = 50% → Users use the product 15 days per month on average (excellent)
DAU/MAU = 30% → 9 days per month (good)
DAU/MAU = 10% → 3 days per month (needs improvement)

Industry Benchmarks:
  Social Media: > 50% (Facebook ~65%)
  Messaging Apps: > 60% (LINE ~70%)
  E-commerce: 10-20%
  SaaS Tools: 15-25%
  Media/News: 10-15%
```

### Feature Adoption Metrics

```
Feature Adoption Rate = Users of the feature / Total active users

Feature Usage Matrix:
┌──────────────┬───────────┬───────────┐
│ Feature      │ Adoption  │ Frequency │
├──────────────┼───────────┼───────────┤
│ Core Search  │ 85%       │ Daily     │  ← Core feature
│ Filters      │ 45%       │ Weekly    │  ← Important support
│ Favorites    │ 25%       │ Weekly    │  ← Can increase promotion
│ Sharing      │ 8%        │ Monthly   │  ← Evaluate keeping/removing
│ Advanced Rpts│ 3%        │ Rarely    │  ← Consider removing
└──────────────┴───────────┴───────────┘
```

### Power User Analysis

```
User Segmentation (by usage frequency):
  Power Users: Use daily, 10% of users, contribute 60% of engagement
  Regular Users: Use 3-4 times/week, 25% of users
  Casual Users: Use 1-2 times/week, 30% of users
  Dormant Users: Use occasionally, 35% of users

Analysis Focus:
  1. What features do Power Users use? → This is the product's core value
  2. What drives Regular → Power conversion? → Growth lever
  3. Why do Casual → Dormant users churn? → Retention opportunity
```

### L7 / L28 Analysis

```
L7 = Number of days used in the past 7 days
L28 = Number of days used in the past 28 days

L7 Distribution:
  7 days (daily):   15% ← High stickiness
  5-6 days:         12%
  3-4 days:         20%
  1-2 days:         28%
  0 days:           25% ← Churn risk

Healthy L7 Distribution: U-shaped (both ends high)
  → Users either use it every day or not at all
  → The "occasional use" middle segment is the most unstable
```

---

## 38-3: Retention / Churn

### Types of Retention

| Type | Definition | Best For |
|------|-----------|----------|
| Day N Retention | % of users who return on Day N | Apps, Games |
| Week N Retention | % of users who return in Week N | Social, SaaS |
| Bracket Retention | % who return within a time bracket | Low-frequency products |
| Rolling Retention | % who return on any day after Day N | Overall retention trends |

### Retention Curve

```
100%
 │╲
 │ ╲
 │  ╲
 │   ╲_______________  ← Good retention (curve flattens)
 │    ╲
 │     ╲
 │      ╲
 │       ╲____________  ← Average retention
 │        ╲
 │         ╲
 │          ╲
 │           ╲  ← Poor retention (continues declining)
 │            ╲
 0──────────────────→ Time
   D1  D7  D14  D30

Industry Benchmarks (Apps):
  D1: 40-50%
  D7: 20-30%
  D30: 10-15%
  D90: 5-10% (if stable here = found PMF)
```

### Cohort Analysis

```
Group users by sign-up month, track retention per cohort:

         Month 0  Month 1  Month 2  Month 3  Month 4
Jan      100%     45%      30%      25%      22%
Feb      100%     48%      33%      28%      25%
Mar      100%     52%      38%      32%       -
Apr      100%     55%      40%       -        -
May      100%     58%       -        -        -

Observation:
✅ Month 1 retention improving month-over-month (45% → 58%)
→ Indicates onboarding improvements are working!
```

### Churn Analysis

```
Churn Rate = Churned Users / Users at Start of Period

Real impact of 5% monthly churn:
  Month 1: 1,000 users
  Month 6: 1,000 × (0.95)^5 = 774 users (-23%)
  Month 12: 1,000 × (0.95)^11 = 569 users (-43%)
  → 5% monthly churn looks small, but after a year nearly half are gone!

Revenue Churn vs Logo Churn:
  Logo Churn: Number of customers lost (customer dimension)
  Revenue Churn: Revenue lost (monetary dimension)

  If only small customers churn → High Logo Churn, Low Revenue Churn
  If large customers churn → Low Logo Churn, High Revenue Churn (more dangerous!)
```

### Churn Prediction Model

```
Pre-churn Behavioral Signals:
┌──────────────────────────┬───────────┐
│ Signal                   │ Risk Level│
├──────────────────────────┼───────────┤
│ Login frequency drops 50%│ Medium    │
│ Core feature usage drops │ High      │
│   to zero                │           │
│ Support complaints       │ High      │
│   increase               │           │
│ No renewal intent before │ High      │
│   contract expiry        │           │
│ NPS score < 0            │ Medium    │
│ Using competitor features│ Very High │
│   (if applicable)        │           │
└──────────────────────────┴───────────┘

Health Score = Σ(Signal × Weight)
  < 40 → Red (High churn risk)
  40-70 → Yellow (Needs attention)
  > 70 → Green (Healthy)
```

---

## 38-4: Conversion / Monetization

### Conversion Funnel

```
Visit → Sign-up → Activation → Trial → Paid
 100K    10K       5K          2K     500

Conversion Rates:
  Visit → Sign-up: 10%
  Sign-up → Activation: 50%
  Activation → Trial: 40%
  Trial → Paid: 25%
  Overall: 0.5%
```

### Key Conversion Metrics

| Metric | Definition | Industry Benchmark |
|--------|-----------|-------------------|
| Free-to-Paid Conversion | Free users converting to paid | SaaS: 2-5% |
| Trial-to-Paid | Trial users converting to paid | 15-30% |
| Cart Conversion | Add-to-cart to payment | E-commerce: 30-40% |
| Upsell Rate | Upgrading to higher plan | 5-10% / year |
| Cross-sell Rate | Purchasing other products | 10-20% |

### ARPU / ARPPU

```
ARPU = Average Revenue Per User
     = Total Revenue / Total Users
     (includes free users)

ARPPU = Average Revenue Per Paying User
      = Total Revenue / Paying Users
      (paying users only)

Example:
  Total Users: 100,000
  Paying Users: 5,000 (5%)
  Monthly Revenue: $250,000

  ARPU = $250,000 / 100,000 = $2.5
  ARPPU = $250,000 / 5,000 = $50
```

### LTV (Customer Lifetime Value)

```
Simple LTV Calculation:
  LTV = ARPU × Average Customer Lifespan
  LTV = ARPU / Churn Rate

Example:
  ARPU = $50/month
  Monthly Churn Rate = 5%
  LTV = $50 / 0.05 = $1,000

Advanced LTV Calculation:
  LTV = (ARPU × Gross Margin) / Churn Rate
  LTV = ($50 × 70%) / 5% = $700

LTV / CAC Ratio:
  > 3: Healthy (profitable)
  1-3: Acceptable (needs optimization)
  < 1: Dangerous (burning money)
```

### Pricing Strategy Metrics

```
Common SaaS Pricing Models:
┌──────────────┬──────────────┬──────────────┐
│ Pricing Model│ Example      │ Best For     │
├──────────────┼──────────────┼──────────────┤
│ Flat Rate    │ $29/month    │ Simple prods │
│ Tiered       │ Basic/Pro/Ent│ Varied needs │
│ Per Seat     │ $10/user/mo  │ Collab tools │
│ Usage-based  │ $0.01/API cal│ Dev tools    │
│ Freemium     │ Free + Paid  │ Mass market  │
└──────────────┴──────────────┴──────────────┘
```

---

## 38-5: Metric Frameworks (AARRR, North Star)

### AARRR (Pirate Metrics)

```
A - Acquisition
    Where do users come from?
    Metrics: New Users, CAC, Channel Conversion Rate

A - Activation
    Do users experience the product's value?
    Metrics: Activation Rate, Time to Value

R - Retention
    Do users come back?
    Metrics: D1/D7/D30 Retention, DAU/MAU

R - Revenue
    Do users pay?
    Metrics: ARPU, LTV, Conversion Rate

R - Referral
    Do users recommend others?
    Metrics: NPS, Viral Coefficient, Referral Rate
```

### AARRR Dashboard Example

```
┌─────────────┬──────────┬──────────┬──────────┐
│ Stage       │ This Mo  │ Last Mo  │ Change   │
├─────────────┼──────────┼──────────┼──────────┤
│ Acquisition │ 15,000   │ 12,000   │ +25% ✅  │
│ Activation  │ 4,500    │ 3,000    │ +50% ✅  │
│ Retention   │ 2,250    │ 1,800    │ +25% ✅  │
│ Revenue     │ $112,500 │ $81,000  │ +39% ✅  │
│ Referral    │ 675      │ 450      │ +50% ✅  │
└─────────────┴──────────┴──────────┴──────────┘
```

### North Star Metric

```
North Star Metric = The single metric that best reflects the product's core value

Characteristics:
1. Represents the core value users receive
2. Highly correlated with long-term revenue
3. The entire company can align around it

North Star by Product:
┌──────────────┬──────────────────────────┐
│ Product      │ North Star Metric        │
├──────────────┼──────────────────────────┤
│ Airbnb       │ Nights booked            │
│ Spotify      │ Time spent listening     │
│ Slack        │ Daily messages sent      │
│ Shopify      │ Merchant GMV             │
│ Netflix      │ Monthly viewing hours    │
│ Facebook     │ DAU                      │
│ Uber         │ Weekly rides completed   │
└──────────────┴──────────────────────────┘
```

### Building a Metric Tree

```
North Star: Monthly Completed Orders

Monthly Orders
├── Active Buyers
│   ├── New Buyers (Acquisition)
│   │   ├── Paid traffic
│   │   ├── Organic traffic
│   │   └── Referral traffic
│   └── Returning Buyers (Retention)
│       ├── Push notification reach rate
│       └── Email open rate
├── Orders per Buyer (Frequency)
│   ├── Product catalog breadth
│   ├── Recommendation accuracy
│   └── Promotions
└── Order Completion Rate (Conversion)
    ├── Search success rate
    ├── Checkout conversion rate
    └── Payment success rate
```

### Input Metrics vs Output Metrics

```
Output Metrics (Result metrics):
  Revenue, DAU, Retention Rate
  → Tell you "how things turned out" but can't be directly improved

Input Metrics (Driver metrics):
  Onboarding completion rate, Feature usage frequency, Notification reach rate
  → Tell you "what to improve" and are directly actionable

A good metric system = Output + Input
  Output: Monthly revenue growth 10%
  Input: Activation Rate from 20% → 35%
         Checkout conversion from 25% → 35%
         Referral rate from 5% → 10%
```

---

## 38-6: Product Metrics Case Study

### Case: Designing a Metric System for a Music Streaming App

```
Background:
You are a Product Analyst for a music streaming app (similar to Spotify).
The product has a free tier (with ads) and a paid tier ($9.99/month).
MAU: 5 million, paid user ratio: 8%.
```

### Step 1: Define the North Star

```
North Star Metric: Monthly Listening Hours
  Why?
  - Reflects the core value users get from the product
  - More listening hours → Better retention → Higher paid conversion
  - Drives both ad revenue (free tier) and subscription revenue (paid tier)
```

### Step 2: Establish AARRR Metrics

```
Acquisition:
  - New user sign-ups: 50K/month
  - CAC: $5 (paid ads), $0 (organic)
  - Channel distribution: Organic 60%, Paid 25%, Referral 15%

Activation:
  - Activation definition: Listen to ≥ 3 songs within 7 days
  - Activation Rate: 55%
  - Time to Value: 2 days (median)

Retention:
  - D1 Retention: 60%
  - D7 Retention: 40%
  - D30 Retention: 25%
  - DAU/MAU: 35%

Revenue:
  - Free-to-Paid Conversion: 8%
  - ARPU: $2.5/month (including free users)
  - ARPPU: $9.99/month
  - LTV: $120 (paid users average 12 months retention)
  - Ad Revenue per Free User: $0.8/month

Referral:
  - NPS: 35
  - Viral Coefficient: 0.3 (each user brings 0.3 new users)
  - Referral Rate: 5%
```

### Step 3: Identify the Biggest Lever

```
Analyzing improvement potential at each stage:

                 Current  Benchmark  Gap     Potential Impact
Activation       55%      65%        10%     +25K MAU
D30 Retention    25%      30%        5%      +125K MAU
Free-to-Paid     8%       12%        4%      +$800K annual revenue
DAU/MAU          35%      40%        5%      +50K listening hrs/day

Conclusion:
1. Biggest lever = Activation (impacts all downstream metrics)
2. Secondary lever = Free-to-Paid (directly impacts revenue)
```

### Step 4: Design Improvement Plans

```
Plan 1: Improve Activation (Target 55% → 65%)
  - On first login, use AI to recommend 10 songs (based on taste preferences)
  - Auto-create a "Daily Mix" playlist
  - 3 days without return → Push notification "New songs you might like"
  Expected Impact: Activation +10% → Downstream Retention and Revenue improve accordingly

Plan 2: Increase Free-to-Paid (Target 8% → 12%)
  - Free Premium trial for 7 days (currently only 3 days)
  - Push upgrade prompts to high-frequency users
  - Annual plan ($7.99/month vs $9.99/month)
  Expected Impact: 100K additional paid users per year, +$3.6M annual revenue

Plan 3: Improve DAU/MAU (Target 35% → 40%)
  - Daily personalized recommendation push
  - Add Podcast content (expand use cases)
  - Social features (see what friends are listening to)
```

### Step 5: Track & Iterate

```
Weekly Metrics Dashboard:
┌──────────────────┬──────┬──────┬──────┐
│ Metric           │Target│Actual│Status│
├──────────────────┼──────┼──────┼──────┤
│ Monthly Listening │ 8M hr│ 7.5M │ ⚠️  │
│   Hours (NSM)    │      │      │      │
│ New User Sign-ups│ 55K  │ 52K  │ ⚠️  │
│ Activation Rate  │ 65%  │ 60%  │ 📈   │
│ D30 Retention    │ 30%  │ 27%  │ 📈   │
│ Free-to-Paid     │ 12%  │ 9.5% │ 📈   │
│ ARPU             │ $3.0 │ $2.7 │ ⚠️  │
│ NPS              │ 40   │ 37   │ 📈   │
└──────────────────┴──────┴──────┴──────┘
```

### Interview Verbal Response

```
"I would choose 'Monthly Listening Hours' as the North Star Metric,
 because it directly reflects the core value users get from the product.

 After analyzing the AARRR funnel, I believe the biggest improvement lever is Activation.
 The current Activation Rate is only 55%, below the industry benchmark of 65%.
 If we can raise it to 65%, downstream Retention and Revenue will both improve.

 The specific plan is to use AI to recommend personalized playlists
 upon a new user's first login, helping users experience the product's value faster.
 Additionally, push notifications within 3 days would re-engage users who haven't returned.

 I would design an A/B Test to validate the effect,
 using Activation Rate as the primary metric
 and D7 Retention as the secondary metric, ensuring the improvement is not just short-term."
```

---

## Key Takeaways - World 38 Cheat Sheet

### Product Metrics Quick Reference

```
Activation:
  Activation Rate, Time to Value, Setup Completion
  Key: Help users experience core value as quickly as possible

Engagement:
  DAU / MAU / DAU÷MAU (Stickiness)
  Feature Adoption, Session Duration
  L7 / L28 Distribution

Retention:
  Day N Retention, Cohort Analysis
  Retention Curve: Look for "does it flatten"
  5% monthly churn → 43% user loss in one year

Conversion / Monetization:
  Free-to-Paid, ARPU / ARPPU, LTV
  LTV / CAC > 3 = Healthy

AARRR:
  Acquisition → Activation → Retention → Revenue → Referral
  Find the biggest drop-off → Biggest improvement lever

North Star Metric:
  Single metric reflecting core value
  Spotify = Listening hours
  E-commerce = Order count
  SaaS = Active usage volume

Input vs Output:
  Output = Results (Revenue, DAU) → Shows performance
  Input = Drivers (Activation Rate) → Actionable
```

### Interview Answer Framework

```
1. Define North Star (Why this metric?)
2. Decompose with AARRR funnel
3. Find the biggest gap (vs industry benchmarks)
4. Propose improvement plan (specific, quantifiable)
5. Explain validation approach (A/B Test, tracking metrics)
```

"""

    // MARK: - World 42 (zh)
    private static let zhWorld42 = """

# World 42：Business Systems

> 企業系統是組織運作的骨幹。ERP、CRM、Workflow 系統決定了公司如何管理資源、服務客戶、自動化流程。
> 作為 BA，你需要理解這些系統的架構、選型邏輯，以及如何推動組織成功導入。

面試常見問題：「你用過什麼企業系統？」「如何評估系統選型？」「導入新系統時最大的挑戰是什麼？」
這一章讓你系統性地掌握企業系統的核心知識。

---

## 42-1：ERP 概念與模組

### 什麼是 ERP？

ERP（Enterprise Resource Planning）是整合企業核心業務流程的系統平台。

```
ERP 核心概念：
Single Source of Truth — 統一資料來源
Cross-functional Integration — 跨部門整合
Real-time Visibility — 即時可視化
Process Standardization — 流程標準化
```

### ERP 核心模組

| 模組 | 功能 | 關鍵指標 |
|------|------|---------|
| Finance (FI) | 總帳、應收帳款、應付帳款 | DSO、DPO、Cash Cycle |
| Controlling (CO) | 成本中心、利潤中心分析 | Cost Variance、Margin |
| Sales & Distribution (SD) | 訂單管理、定價、出貨 | Order-to-Cash Cycle |
| Materials Management (MM) | 採購、庫存、MRP | Inventory Turnover |
| Production Planning (PP) | 生產排程、BOM、產能 | OEE、Throughput |
| Human Capital (HCM) | 薪資、考勤、績效 | Headcount、Turnover Rate |

### 常見 ERP 平台比較

| 平台 | 適用規模 | 部署模式 | 特色 |
|------|---------|---------|------|
| SAP S/4HANA | 大型企業 | Cloud / On-Premise | 模組最完整、產業方案豐富 |
| Oracle Fusion | 大型企業 | Cloud | 強資料庫整合、AI 內建 |
| Microsoft Dynamics 365 | 中大型 | Cloud | 與 Office 365 深度整合 |
| NetSuite | 中小型 | Cloud-native | 快速導入、SaaS 訂閱制 |
| Odoo | 小型 / 新創 | Cloud / Self-hosted | 開源、模組化、成本低 |

### ERP 導入方法論

```
Big Bang — 一次性全面上線
  優點：一步到位、資料一致
  風險：高風險、全公司受影響

Phased Rollout — 分階段上線
  優點：風險分散、逐步學習
  缺點：過渡期需維護兩套系統

Parallel Run — 新舊系統並行
  優點：有 fallback、可驗證
  缺點：雙倍工作量、成本高
```

### 面試考點

> 「你如何決定 ERP 的導入策略？」

回答框架：
1. 評估企業規模和風險承受度
2. 考慮資料遷移複雜度
3. 分析使用者準備度（Change Readiness）
4. 建議策略 + 理由

---

## 42-2：CRM 系統設計

### CRM 的三大類型

```
Operational CRM — 自動化銷售、行銷、客服流程
  → Salesforce Sales Cloud、HubSpot

Analytical CRM — 分析客戶資料、行為洞察
  → Salesforce Einstein、Power BI 整合

Collaborative CRM — 跨部門共享客戶資訊
  → Slack + CRM 整合、共享客戶 360 視圖
```

### CRM 核心功能模組

| 模組 | 功能 | BA 關注點 |
|------|------|----------|
| Lead Management | 潛在客戶追蹤、評分 | Lead Scoring Model 設計 |
| Opportunity Management | 銷售管線、成交預測 | Pipeline Stages 定義 |
| Contact Management | 客戶 360 度視圖 | 資料整合、去重邏輯 |
| Campaign Management | 行銷活動管理 | ROI 追蹤、A/B 測試 |
| Service Management | 客服工單、SLA | Escalation Rules 設計 |
| Analytics & Reporting | 儀表板、預測分析 | KPI 定義、Dashboard 設計 |

### CRM Pipeline 設計

```
B2B 銷售 Pipeline 範例：

Stage 1: Lead（潛在客戶）
  → 進入條件：填寫表單 / 參加活動
  → 轉換率基準：30%

Stage 2: Qualified（合格商機）
  → 進入條件：BANT 確認（Budget/Authority/Need/Timeline）
  → 轉換率基準：50%

Stage 3: Proposal（提案中）
  → 進入條件：已提交報價 / 方案
  → 轉換率基準：60%

Stage 4: Negotiation（談判中）
  → 進入條件：客戶有回覆 / 議價
  → 轉換率基準：70%

Stage 5: Closed Won / Closed Lost
  → Win Rate 目標：20-30%
```

### Salesforce 物件模型（BA 必知）

```
Account（公司）
  └── Contact（聯絡人）
  └── Opportunity（商機）
        └── Quote（報價）
        └── Product（產品）
  └── Case（客服工單）
  └── Activity（活動紀錄）
```

### 面試題練習

> 「你如何設計一個 B2B SaaS 公司的 CRM 系統？」

思考框架：
1. 銷售流程分析（Pipeline Stages）
2. 客戶分級（Customer Segmentation）
3. 資料整合需求（Marketing + Sales + CS）
4. 自動化規則（Lead Assignment、Alert）
5. 成功指標（Win Rate、CAC、LTV）

---

## 42-3：Workflow & Approval Systems

### Workflow 系統的核心概念

```
Workflow Engine 四要素：

1. Trigger（觸發條件）
   → 事件驅動：表單提交、狀態變更
   → 時間驅動：每日排程、到期提醒

2. Condition（判斷邏輯）
   → IF-THEN 規則、Business Rules
   → 金額門檻、角色權限

3. Action（執行動作）
   → 通知、指派、更新欄位
   → 呼叫 API、觸發子流程

4. Routing（流程路由）
   → Sequential（依序）
   → Parallel（同時）
   → Conditional（條件分支）
```

### 常見 Approval Flow 設計

| 類型 | 說明 | 適用場景 |
|------|------|---------|
| Linear | A → B → C 依序簽核 | 簡單報銷、請假 |
| Parallel | A + B 同時簽核 | 跨部門預算審批 |
| Conditional | 依金額/類別走不同路線 | 採購：< $5K 主管簽 / > $5K VP 簽 |
| Hierarchical | 依組織層級逐層上報 | 大型企業的多層審批 |
| Round-Robin | 輪流指派 | 客服工單分配 |

### 採購審批流程設計範例

```
Purchase Request Approval Flow:

[申請人提交]
    ↓
[系統檢查金額]
    ├── < $1,000 → [直屬主管審批] → [自動核准 PO]
    ├── $1,000 - $10,000 → [直屬主管] → [部門主管] → [採購部]
    └── > $10,000 → [直屬主管] → [部門主管] → [CFO] → [採購部]

每層審批：
- 48 小時未處理 → 自動 escalation
- 退回 → 回到申請人修改
- 核准 → 進入下一層 / 產生 PO
```

### Workflow 平台比較

| 平台 | 類型 | 適用場景 |
|------|------|---------|
| ServiceNow | Enterprise ITSM | IT 服務管理、大型企業流程 |
| Jira + Automation | 開發團隊 | Agile workflow、DevOps |
| Power Automate | 微軟生態系 | Office 365 自動化 |
| Zapier / Make | No-code | 跨 SaaS 整合、小團隊 |
| Camunda / Temporal | Developer Platform | 複雜業務流程、微服務編排 |

### 面試考點

> 「設計一個請假審批流程，考慮各種邊界情況。」

要考慮的邊界條件：
- 主管不在（代理人機制）
- 跨年假期（額度計算）
- 緊急請假（事後補簽）
- 連續假期 > 5 天（需更高主管審批）

---

## 42-4：Internal Tools Design

### 內部工具的設計原則

```
Internal Tools 設計思維：

1. Efficiency First（效率優先）
   → 減少 click 數、自動填充
   → Keyboard shortcuts、Batch operations

2. Context-Rich（資訊豐富）
   → 把相關資訊放在同一畫面
   → 減少頁面跳轉

3. Error-Proof（防呆設計）
   → 輸入驗證、確認對話框
   → Undo / Rollback 機制

4. Role-Based（角色區分）
   → 不同角色看到不同功能
   → 權限控制 + Audit Trail
```

### Admin Panel 功能規劃

| 功能區塊 | 核心功能 | BA 關注點 |
|----------|---------|----------|
| User Management | CRUD、角色指派、權限 | RBAC vs ABAC 模型 |
| Content Management | 商品/文章 CRUD、排程發布 | Workflow（草稿→審核→發布） |
| Order Management | 搜尋、篩選、狀態更新、退款 | 狀態機設計、操作日誌 |
| Analytics Dashboard | 即時指標、趨勢圖、Alert | KPI 定義、刷新頻率 |
| Configuration | Feature Flags、系統參數 | 變更管理、影響範圍 |
| Audit & Compliance | 操作日誌、資料匯出 | 保留期限、隱私合規 |

### 內部工具 Build vs Buy 決策框架

```
Build vs Buy 評估矩陣：

                    低差異化          高差異化
                ┌──────────────┬──────────────┐
  高複雜度     │   Buy + 客製   │   Build      │
                │  （ERP、CRM）  │ （核心競爭力）  │
                ├──────────────┼──────────────┤
  低複雜度     │   Buy (SaaS)  │ Low-code/    │
                │  （HR、會計）   │  No-code     │
                └──────────────┴──────────────┘

決策問題：
1. 是否為核心競爭力？→ Yes = Build
2. 市場有成熟方案嗎？→ Yes = Buy
3. 客製化需求 > 30%？→ Yes = Build
4. 團隊有能力維護嗎？→ No = Buy
```

### 內部工具技術趨勢

| 趨勢 | 說明 | 代表工具 |
|------|------|---------|
| Low-code / No-code | 非工程師也能建 App | Retool、Appsmith、Budibase |
| API-first | 前後端分離、可整合 | Headless CMS、Microservices |
| AI-assisted | 自然語言查詢、自動分類 | Copilot、ChatGPT 整合 |
| Composable | 模組化組合、可替換 | 微前端、Plugin 架構 |

### 面試題練習

> 「客服團隊需要一個內部工具來處理退款，你會怎麼設計？」

回答框架：
1. 使用者角色和流程（客服→主管→財務）
2. 核心功能（搜尋訂單、申請退款、審批、執行）
3. 資料整合（訂單系統、支付系統、CRM）
4. 防呆機制（金額上限、重複退款檢查）
5. 報表（退款趨勢、處理時效）

---

## 42-5：System Adoption & Change Management

### 為什麼系統導入常失敗？

```
系統導入失敗原因統計：

#1 用戶抗拒改變（Resistance to Change）    — 39%
#2 管理層支持不足（Lack of Executive Support）— 33%
#3 需求不明確（Unclear Requirements）        — 31%
#4 培訓不足（Insufficient Training）         — 29%
#5 資料遷移問題（Data Migration Issues）     — 25%
#6 低估複雜度（Underestimated Complexity）   — 23%
```

### ADKAR 變革管理模型

```
A — Awareness（認知）
  → 為什麼要改？目前的問題是什麼？
  → 方法：Town Hall、Email 公告、FAQ

D — Desire（意願）
  → 我為什麼要支持這個改變？WIIFM?
  → 方法：Champion Network、激勵機制

K — Knowledge（知識）
  → 我怎麼用新系統？
  → 方法：培訓課程、操作手冊、影片教學

A — Ability（能力）
  → 我能在實際工作中用嗎？
  → 方法：Sandbox 練習、Buddy System、Office Hours

R — Reinforcement（強化）
  → 如何確保不會退回舊方式？
  → 方法：KPI 追蹤、Success Stories、舊系統下線
```

### 系統導入 Rollout 策略

| 策略 | 做法 | 適用場景 |
|------|------|---------|
| Pilot | 先在一個部門/據點試用 | 高風險、大規模導入 |
| Phased | 按模組/區域分批上線 | 多模組 ERP、全球部署 |
| Big Bang | 全面同時切換 | 小團隊、緊急需求 |
| Feature Flag | 逐步開放功能 | SaaS、線上產品 |

### 培訓計畫設計

```
Training Plan Framework:

1. 分級培訓（Tiered Training）
   ├── Level 1: 基礎操作（全員）— 2 小時
   ├── Level 2: 進階功能（Power Users）— 4 小時
   └── Level 3: 管理者報表（Managers）— 2 小時

2. 多元管道
   ├── 現場培訓（Instructor-led）
   ├── 線上影片（Self-paced）
   ├── Quick Reference Card（隨身卡片）
   └── Sandbox 環境（自由練習）

3. 支援機制
   ├── Super Users / Champions（各部門 1-2 人）
   ├── Help Desk（前 3 個月加強）
   └── Office Hours（每週固定答疑時間）
```

### Adoption 衡量指標

| 指標 | 定義 | 目標值 |
|------|------|--------|
| Login Rate | 有帳號的人中，實際登入比例 | > 90% (Month 3) |
| Feature Usage | 核心功能的使用率 | > 70% |
| Process Compliance | 按新流程操作的比例 | > 85% |
| Support Tickets | 系統相關求助單 | 逐月下降 |
| User Satisfaction | 滿意度調查 | > 4.0/5.0 |

### 面試考點

> 「導入新系統時，你如何處理用戶抗拒？」

回答框架（ADKAR）：
1. **Awareness** — 讓用戶理解改變的原因
2. **Desire** — 找到 WIIFM，建立 Champion
3. **Knowledge** — 提供充足培訓
4. **Ability** — 給予練習和支援
5. **Reinforcement** — 追蹤、獎勵、強化

---

## 42-6：System Selection Case（Boss）

### 系統選型完整流程

```
System Selection Lifecycle:

Phase 1: Define Requirements
  → Business Requirements Document
  → Functional / Non-Functional Requirements
  → Must-have vs Nice-to-have

Phase 2: Market Research
  → Gartner Magic Quadrant / G2 Reviews
  → Vendor Shortlist (3-5 candidates)
  → Initial Screening

Phase 3: RFP / RFI
  → Request for Information（初步了解）
  → Request for Proposal（正式邀標）
  → 評分標準（Scoring Criteria）

Phase 4: Vendor Evaluation
  → Product Demo（實際操作展示）
  → Proof of Concept（小範圍試用）
  → Reference Check（訪問現有客戶）

Phase 5: Decision & Negotiation
  → Total Cost of Ownership (TCO) 分析
  → Contract Negotiation
  → Implementation Plan
```

### 系統選型評分矩陣

```
Vendor Scoring Matrix:

評估維度         權重    Vendor A  Vendor B  Vendor C
────────────────────────────────────────────────────
功能完整度        30%      8         7         9
易用性           15%      9         6         7
整合能力         15%      7         9         8
擴展性           10%      6         8         9
供應商穩定性      10%      9         7         8
TCO (3年)        15%      7         8         6
實施時程          5%       8         7         7
────────────────────────────────────────────────────
加權總分         100%     7.8       7.4       7.8
```

### TCO（Total Cost of Ownership）分析

| 成本項目 | 一次性成本 | 年度成本 | 3 年 TCO |
|----------|----------|---------|---------|
| 授權費 | $50K | $20K/yr | $110K |
| 實施顧問 | $80K | — | $80K |
| 客製開發 | $30K | $10K/yr | $60K |
| 資料遷移 | $20K | — | $20K |
| 培訓 | $15K | $5K/yr | $30K |
| 維運人力 | — | $40K/yr | $120K |
| **合計** | **$195K** | **$75K/yr** | **$420K** |

### RFP 核心章節

```
RFP 結構：

1. Company Overview（公司簡介）
2. Project Background（專案背景）
3. Scope of Work（工作範圍）
4. Functional Requirements（功能需求表）
5. Non-Functional Requirements（技術需求）
6. Integration Requirements（整合需求）
7. Data Migration Requirements（資料遷移）
8. Timeline（時程要求）
9. Pricing Structure（報價格式）
10. Evaluation Criteria（評分標準）
11. Terms & Conditions（合約條款）
```

### 面試終極挑戰

> 「你的公司要從 Excel 管理切換到一套正式系統，從頭到尾你會怎麼做？」

端到端回答框架：
1. 現況分析（Pain Points、量化問題）
2. 需求定義（Stakeholder 訪談、FR/NFR）
3. Build vs Buy 決策
4. Vendor 評估（Scoring Matrix）
5. TCO 分析
6. 導入策略（Pilot → Rollout）
7. Change Management（ADKAR）
8. Success Metrics

---

## Cheat Sheet：Business Systems 速查表

### 系統類型速查

| 系統 | 核心目的 | 主要使用者 | 代表產品 |
|------|---------|----------|---------|
| ERP | 整合內部營運 | 財務、供應鏈、HR | SAP、Oracle、Dynamics |
| CRM | 管理客戶關係 | 銷售、行銷、客服 | Salesforce、HubSpot |
| WMS | 倉儲管理 | 倉管、物流 | Manhattan、Blue Yonder |
| ITSM | IT 服務管理 | IT 團隊 | ServiceNow、Jira SM |
| HRM | 人力資源管理 | HR、員工 | Workday、BambooHR |

### 面試高頻問題速答

| 問題 | 關鍵回答要素 |
|------|------------|
| ERP 是什麼？ | 整合企業核心流程的單一平台、Single Source of Truth |
| CRM 設計重點？ | Pipeline Design、Customer 360、Automation Rules |
| Workflow 設計？ | Trigger-Condition-Action-Routing 四要素 |
| Build vs Buy？ | 核心競爭力 → Build / 通用需求 → Buy / 客製 < 30% → Buy |
| 用戶抗拒怎麼辦？ | ADKAR：Awareness → Desire → Knowledge → Ability → Reinforcement |
| 系統選型？ | 需求定義 → RFP → Vendor Evaluation → TCO → Decision |

### 關鍵框架速記

```
ERP 導入：Big Bang / Phased / Parallel
CRM Pipeline：Lead → Qualified → Proposal → Negotiation → Closed
Workflow：Trigger → Condition → Action → Routing
Build vs Buy：差異化 × 複雜度矩陣
Change Management：ADKAR（Awareness-Desire-Knowledge-Ability-Reinforcement）
System Selection：Requirements → RFP → Evaluation → TCO → Decision
```

"""

    // MARK: - World 42 (en)
    private static let enWorld42 = """

# World 42: Business Systems

> Business systems are the backbone of organizational operations. ERP, CRM, and Workflow systems determine how companies manage resources, serve customers, and automate processes.
> As a BA, you need to understand these systems' architecture, selection logic, and how to drive successful adoption.

Common interview questions: "What enterprise systems have you worked with?" "How do you evaluate system selection?" "What's the biggest challenge when implementing a new system?"
This chapter gives you systematic mastery of core business systems knowledge.

---

## 42-1: ERP Concepts and Modules

### What is ERP?

ERP (Enterprise Resource Planning) is a platform that integrates core business processes across the enterprise.

```
ERP Core Concepts:
Single Source of Truth -- Unified data source
Cross-functional Integration -- Cross-department integration
Real-time Visibility -- Instant operational visibility
Process Standardization -- Standardized workflows
```

### Core ERP Modules

| Module | Function | Key Metrics |
|--------|----------|-------------|
| Finance (FI) | General ledger, accounts receivable/payable | DSO, DPO, Cash Cycle |
| Controlling (CO) | Cost center, profit center analysis | Cost Variance, Margin |
| Sales & Distribution (SD) | Order management, pricing, shipping | Order-to-Cash Cycle |
| Materials Management (MM) | Procurement, inventory, MRP | Inventory Turnover |
| Production Planning (PP) | Production scheduling, BOM, capacity | OEE, Throughput |
| Human Capital (HCM) | Payroll, attendance, performance | Headcount, Turnover Rate |

### Common ERP Platform Comparison

| Platform | Target Size | Deployment | Strengths |
|----------|-------------|-----------|-----------|
| SAP S/4HANA | Enterprise | Cloud / On-Premise | Most complete modules, rich industry solutions |
| Oracle Fusion | Enterprise | Cloud | Strong database integration, built-in AI |
| Microsoft Dynamics 365 | Mid-Large | Cloud | Deep Office 365 integration |
| NetSuite | SMB | Cloud-native | Fast implementation, SaaS subscription |
| Odoo | Small / Startup | Cloud / Self-hosted | Open source, modular, low cost |

### ERP Implementation Methodologies

```
Big Bang -- Full go-live at once
  Pros: One-step completion, data consistency
  Risks: High risk, entire company affected

Phased Rollout -- Go-live in stages
  Pros: Distributed risk, gradual learning
  Cons: Transition period requires maintaining two systems

Parallel Run -- Run old and new systems simultaneously
  Pros: Fallback available, verifiable
  Cons: Double workload, high cost
```

### Interview Focus

> "How would you decide on an ERP implementation strategy?"

Answer Framework:
1. Assess company size and risk tolerance
2. Consider data migration complexity
3. Analyze user readiness (Change Readiness)
4. Recommend strategy with justification

---

## 42-2: CRM System Design

### Three Types of CRM

```
Operational CRM -- Automates sales, marketing, and service processes
  -> Salesforce Sales Cloud, HubSpot

Analytical CRM -- Analyzes customer data for behavioral insights
  -> Salesforce Einstein, Power BI integration

Collaborative CRM -- Cross-department customer information sharing
  -> Slack + CRM integration, shared Customer 360 view
```

### Core CRM Modules

| Module | Function | BA Focus |
|--------|----------|----------|
| Lead Management | Lead tracking and scoring | Lead Scoring Model design |
| Opportunity Management | Sales pipeline, forecasting | Pipeline Stages definition |
| Contact Management | Customer 360 view | Data integration, dedup logic |
| Campaign Management | Marketing campaign management | ROI tracking, A/B testing |
| Service Management | Service tickets, SLA | Escalation Rules design |
| Analytics & Reporting | Dashboards, predictive analytics | KPI definition, Dashboard design |

### CRM Pipeline Design

```
B2B Sales Pipeline Example:

Stage 1: Lead
  -> Entry criteria: Form submission / Event attendance
  -> Conversion benchmark: 30%

Stage 2: Qualified
  -> Entry criteria: BANT confirmed (Budget/Authority/Need/Timeline)
  -> Conversion benchmark: 50%

Stage 3: Proposal
  -> Entry criteria: Quote/proposal submitted
  -> Conversion benchmark: 60%

Stage 4: Negotiation
  -> Entry criteria: Customer response / pricing discussion
  -> Conversion benchmark: 70%

Stage 5: Closed Won / Closed Lost
  -> Win Rate target: 20-30%
```

### Salesforce Object Model (BA Must-Know)

```
Account (Company)
  +-- Contact (Person)
  +-- Opportunity (Deal)
        +-- Quote
        +-- Product
  +-- Case (Service Ticket)
  +-- Activity (Activity Log)
```

### Practice Question

> "How would you design a CRM system for a B2B SaaS company?"

Thinking Framework:
1. Sales process analysis (Pipeline Stages)
2. Customer segmentation (Customer Segmentation)
3. Data integration needs (Marketing + Sales + CS)
4. Automation rules (Lead Assignment, Alerts)
5. Success metrics (Win Rate, CAC, LTV)

---

## 42-3: Workflow & Approval Systems

### Core Workflow Concepts

```
Workflow Engine -- Four Elements:

1. Trigger (Activation Condition)
   -> Event-driven: Form submission, status change
   -> Time-driven: Daily schedule, deadline reminder

2. Condition (Decision Logic)
   -> IF-THEN rules, Business Rules
   -> Amount thresholds, role permissions

3. Action (Execution)
   -> Notification, assignment, field update
   -> API call, trigger sub-process

4. Routing (Flow Path)
   -> Sequential (one after another)
   -> Parallel (simultaneous)
   -> Conditional (branching)
```

### Common Approval Flow Designs

| Type | Description | Use Case |
|------|------------|----------|
| Linear | A -> B -> C sequential | Simple expense claims, leave requests |
| Parallel | A + B approve simultaneously | Cross-department budget approval |
| Conditional | Different routes by amount/category | Procurement: <$5K manager / >$5K VP |
| Hierarchical | Escalation through org levels | Large enterprise multi-tier approval |
| Round-Robin | Rotating assignment | Support ticket distribution |

### Purchase Approval Flow Design Example

```
Purchase Request Approval Flow:

[Requester Submits]
    |
[System Checks Amount]
    +-- < $1,000 -> [Direct Manager] -> [Auto-approve PO]
    +-- $1,000 - $10,000 -> [Direct Manager] -> [Dept Head] -> [Procurement]
    +-- > $10,000 -> [Direct Manager] -> [Dept Head] -> [CFO] -> [Procurement]

Each approval level:
- 48 hours no action -> Auto escalation
- Rejected -> Return to requester for revision
- Approved -> Next level / Generate PO
```

### Workflow Platform Comparison

| Platform | Type | Use Case |
|----------|------|----------|
| ServiceNow | Enterprise ITSM | IT service management, enterprise processes |
| Jira + Automation | Dev Teams | Agile workflow, DevOps |
| Power Automate | Microsoft Ecosystem | Office 365 automation |
| Zapier / Make | No-code | Cross-SaaS integration, small teams |
| Camunda / Temporal | Developer Platform | Complex business processes, microservice orchestration |

### Interview Focus

> "Design a leave request approval workflow, considering various edge cases."

Edge cases to consider:
- Manager unavailable (delegate mechanism)
- Cross-year holidays (quota calculation)
- Emergency leave (retroactive approval)
- Consecutive leave > 5 days (requires higher-level approval)

---

## 42-4: Internal Tools Design

### Design Principles for Internal Tools

```
Internal Tools Design Thinking:

1. Efficiency First
   -> Minimize clicks, auto-fill fields
   -> Keyboard shortcuts, Batch operations

2. Context-Rich
   -> Show related information on the same screen
   -> Minimize page navigation

3. Error-Proof
   -> Input validation, confirmation dialogs
   -> Undo / Rollback mechanisms

4. Role-Based
   -> Different roles see different features
   -> Permission control + Audit Trail
```

### Admin Panel Feature Planning

| Feature Area | Core Functions | BA Focus |
|-------------|---------------|----------|
| User Management | CRUD, role assignment, permissions | RBAC vs ABAC model |
| Content Management | Product/article CRUD, scheduled publishing | Workflow (Draft -> Review -> Publish) |
| Order Management | Search, filter, status update, refunds | State machine design, operation logs |
| Analytics Dashboard | Real-time metrics, trend charts, Alerts | KPI definition, refresh frequency |
| Configuration | Feature Flags, system parameters | Change management, impact scope |
| Audit & Compliance | Operation logs, data export | Retention policy, privacy compliance |

### Build vs Buy Decision Framework

```
Build vs Buy Evaluation Matrix:

                    Low Differentiation   High Differentiation
                +---------------------+---------------------+
  High          |   Buy + Customize   |      Build          |
  Complexity    |   (ERP, CRM)        | (Core Competency)   |
                +---------------------+---------------------+
  Low           |   Buy (SaaS)        |   Low-code /        |
  Complexity    |   (HR, Accounting)  |   No-code           |
                +---------------------+---------------------+

Decision Questions:
1. Is it a core competency? -> Yes = Build
2. Are there mature market solutions? -> Yes = Buy
3. Customization needs > 30%? -> Yes = Build
4. Does the team have capacity to maintain? -> No = Buy
```

### Internal Tools Technology Trends

| Trend | Description | Representative Tools |
|-------|-------------|---------------------|
| Low-code / No-code | Non-engineers can build apps | Retool, Appsmith, Budibase |
| API-first | Frontend-backend separation, integrable | Headless CMS, Microservices |
| AI-assisted | Natural language queries, auto-classification | Copilot, ChatGPT integration |
| Composable | Modular composition, replaceable | Micro-frontends, Plugin architecture |

### Practice Question

> "The customer service team needs an internal tool for handling refunds. How would you design it?"

Answer Framework:
1. User roles and workflow (CS Agent -> Manager -> Finance)
2. Core features (Search order, request refund, approval, execution)
3. Data integration (Order system, payment system, CRM)
4. Error-proofing (Amount limits, duplicate refund checks)
5. Reporting (Refund trends, processing time)

---

## 42-5: System Adoption & Change Management

### Why Do System Implementations Often Fail?

```
System Implementation Failure Reasons:

#1 User Resistance to Change              -- 39%
#2 Lack of Executive Support              -- 33%
#3 Unclear Requirements                   -- 31%
#4 Insufficient Training                  -- 29%
#5 Data Migration Issues                  -- 25%
#6 Underestimated Complexity              -- 23%
```

### ADKAR Change Management Model

```
A -- Awareness
  -> Why change? What is the current problem?
  -> Methods: Town Hall, Email announcements, FAQ

D -- Desire
  -> Why should I support this change? WIIFM?
  -> Methods: Champion Network, incentive programs

K -- Knowledge
  -> How do I use the new system?
  -> Methods: Training courses, user manuals, video tutorials

A -- Ability
  -> Can I use it in my actual work?
  -> Methods: Sandbox practice, Buddy System, Office Hours

R -- Reinforcement
  -> How do we ensure people don't revert to old ways?
  -> Methods: KPI tracking, Success Stories, decommission old system
```

### System Rollout Strategies

| Strategy | Approach | Best For |
|----------|----------|----------|
| Pilot | Trial in one department/location first | High-risk, large-scale implementations |
| Phased | Go-live by module/region in batches | Multi-module ERP, global deployments |
| Big Bang | Full simultaneous switch | Small teams, urgent needs |
| Feature Flag | Gradually enable features | SaaS, online products |

### Training Plan Design

```
Training Plan Framework:

1. Tiered Training
   +-- Level 1: Basic operations (All users) -- 2 hours
   +-- Level 2: Advanced features (Power Users) -- 4 hours
   +-- Level 3: Manager reporting (Managers) -- 2 hours

2. Multiple Channels
   +-- Instructor-led training
   +-- Self-paced online videos
   +-- Quick Reference Cards
   +-- Sandbox environment (free practice)

3. Support Mechanisms
   +-- Super Users / Champions (1-2 per department)
   +-- Help Desk (enhanced for first 3 months)
   +-- Office Hours (weekly Q&A sessions)
```

### Adoption Measurement Metrics

| Metric | Definition | Target |
|--------|-----------|--------|
| Login Rate | Percentage of account holders who actually log in | > 90% (Month 3) |
| Feature Usage | Usage rate of core features | > 70% |
| Process Compliance | Percentage following the new process | > 85% |
| Support Tickets | System-related support requests | Decreasing monthly |
| User Satisfaction | Satisfaction survey score | > 4.0/5.0 |

### Interview Focus

> "How do you handle user resistance when implementing a new system?"

Answer Framework (ADKAR):
1. **Awareness** -- Help users understand the reason for change
2. **Desire** -- Find WIIFM, establish Champions
3. **Knowledge** -- Provide sufficient training
4. **Ability** -- Offer practice and support
5. **Reinforcement** -- Track, reward, reinforce

---

## 42-6: System Selection Case (Boss)

### Complete System Selection Process

```
System Selection Lifecycle:

Phase 1: Define Requirements
  -> Business Requirements Document
  -> Functional / Non-Functional Requirements
  -> Must-have vs Nice-to-have

Phase 2: Market Research
  -> Gartner Magic Quadrant / G2 Reviews
  -> Vendor Shortlist (3-5 candidates)
  -> Initial Screening

Phase 3: RFP / RFI
  -> Request for Information (initial understanding)
  -> Request for Proposal (formal bid invitation)
  -> Scoring Criteria

Phase 4: Vendor Evaluation
  -> Product Demo (live demonstration)
  -> Proof of Concept (small-scale trial)
  -> Reference Check (interview existing customers)

Phase 5: Decision & Negotiation
  -> Total Cost of Ownership (TCO) Analysis
  -> Contract Negotiation
  -> Implementation Plan
```

### System Selection Scoring Matrix

```
Vendor Scoring Matrix:

Evaluation Dimension  Weight  Vendor A  Vendor B  Vendor C
------------------------------------------------------------
Feature Completeness   30%      8         7         9
Usability              15%      9         6         7
Integration Capability 15%      7         9         8
Scalability            10%      6         8         9
Vendor Stability       10%      9         7         8
TCO (3 years)          15%      7         8         6
Implementation Time     5%      8         7         7
------------------------------------------------------------
Weighted Total        100%     7.8       7.4       7.8
```

### TCO (Total Cost of Ownership) Analysis

| Cost Item | One-time Cost | Annual Cost | 3-Year TCO |
|-----------|--------------|-------------|-----------|
| License Fees | $50K | $20K/yr | $110K |
| Implementation Consulting | $80K | -- | $80K |
| Custom Development | $30K | $10K/yr | $60K |
| Data Migration | $20K | -- | $20K |
| Training | $15K | $5K/yr | $30K |
| Operations Staff | -- | $40K/yr | $120K |
| **Total** | **$195K** | **$75K/yr** | **$420K** |

### RFP Core Sections

```
RFP Structure:

1. Company Overview
2. Project Background
3. Scope of Work
4. Functional Requirements
5. Non-Functional Requirements
6. Integration Requirements
7. Data Migration Requirements
8. Timeline
9. Pricing Structure
10. Evaluation Criteria
11. Terms & Conditions
```

### Ultimate Interview Challenge

> "Your company wants to switch from managing everything in Excel to a proper system. Walk through your end-to-end approach."

End-to-End Answer Framework:
1. Current state analysis (Pain Points, quantify problems)
2. Requirements definition (Stakeholder interviews, FR/NFR)
3. Build vs Buy decision
4. Vendor evaluation (Scoring Matrix)
5. TCO analysis
6. Implementation strategy (Pilot -> Rollout)
7. Change Management (ADKAR)
8. Success Metrics

---

## Cheat Sheet: Business Systems Quick Reference

### System Type Quick Reference

| System | Core Purpose | Primary Users | Key Products |
|--------|-------------|--------------|-------------|
| ERP | Integrate internal operations | Finance, Supply Chain, HR | SAP, Oracle, Dynamics |
| CRM | Manage customer relationships | Sales, Marketing, Service | Salesforce, HubSpot |
| WMS | Warehouse management | Warehouse, Logistics | Manhattan, Blue Yonder |
| ITSM | IT service management | IT Teams | ServiceNow, Jira SM |
| HRM | Human resource management | HR, Employees | Workday, BambooHR |

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| What is ERP? | Single platform integrating core processes, Single Source of Truth |
| CRM design focus? | Pipeline Design, Customer 360, Automation Rules |
| Workflow design? | Trigger-Condition-Action-Routing four elements |
| Build vs Buy? | Core competency -> Build / Common needs -> Buy / Customization < 30% -> Buy |
| User resistance? | ADKAR: Awareness -> Desire -> Knowledge -> Ability -> Reinforcement |
| System selection? | Requirements -> RFP -> Vendor Evaluation -> TCO -> Decision |

### Key Framework Quick Reference

```
ERP Implementation: Big Bang / Phased / Parallel
CRM Pipeline: Lead -> Qualified -> Proposal -> Negotiation -> Closed
Workflow: Trigger -> Condition -> Action -> Routing
Build vs Buy: Differentiation x Complexity Matrix
Change Management: ADKAR (Awareness-Desire-Knowledge-Ability-Reinforcement)
System Selection: Requirements -> RFP -> Evaluation -> TCO -> Decision
```

"""

}
