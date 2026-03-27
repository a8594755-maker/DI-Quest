const world2 = `
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

\`\`\`
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
\`\`\`

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

\`\`\`
DAU/MAU = 50%  → 平均每個月活躍用戶有一半的天數在用
DAU/MAU = 10%  → 每月大約用 3 天
DAU/MAU = 3%   → 每月大約用 1 天
\`\`\`

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

\`\`\`
例子：整體 Day 7 Retention 是 20%

但按 cohort 拆：
├── 1 月加入的 cohort：Day 7 = 25%
├── 2 月加入的 cohort：Day 7 = 22%
├── 3 月加入的 cohort：Day 7 = 18%
└── 4 月加入的 cohort：Day 7 = 12%

趨勢在惡化！如果只看整體 20%，你會以為很穩定。
\`\`\`

**經典 Retention Curve 形狀：**

\`\`\`
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
\`\`\`

---

### Feature Adoption Metrics

衡量一個新功能有沒有被成功採用，用 **Adoption Funnel**：

\`\`\`
Exposed（看到入口）
  ↓ Discovery Rate
Clicked（點擊進入）
  ↓ Activation Rate
Completed（完成首次使用）
  ↓ Retention Rate
Retained（持續回來使用）
\`\`\`

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

\`\`\`
訂單處理流程 cycle time 分析：

步驟              平均時間    目標    差距
下單→付款確認      0.5 hr     1 hr    -
付款→撿貨          4 hr       2 hr    +2 hr
撿貨→品質檢查      1 hr       1 hr    -
品質檢查→包裝      6 hr       1 hr    +5 hr  ← bottleneck！
包裝→出貨          1.5 hr     2 hr    -

總計               13 hr      7 hr    +6 hr
\`\`\`

**找到 bottleneck 後，下一步是問 why：**
- 是人手不夠？（capacity issue）
- 是排隊等待？（queue issue）
- 是重工太多？（quality issue）
- 是流程設計不合理？（process issue）

---

### Throughput（吞吐量）與 Completion Rate（完成率）

**Throughput** = 單位時間內完成的數量

\`\`\`
例：倉庫每天處理 500 筆訂單
例：客服團隊每小時回覆 30 張 ticket
例：工程團隊每個 sprint 完成 45 個 story points
\`\`\`

**Completion Rate** = 成功完成的比例

\`\`\`
例：訂單完成率 = 成功送達的訂單 / 總訂單 = 94%
例：表單提交完成率 = 送出表單的人 / 開始填寫的人 = 68%
\`\`\`

**Throughput 和 Cycle Time 的關係（Little's Law）：**

> **WIP = Throughput × Cycle Time**
>
> WIP（Work in Progress）= 同時進行中的工作量

如果 cycle time 變長但 throughput 不變，代表 WIP 在增加（積壓變多）。

---

### SLA（Service Level Agreement）與 Error Rate

**SLA** 是你對客戶/內部的服務承諾。

\`\`\`
SLA 範例（IT Support）：
├── P1（系統故障）：1 小時內回應，4 小時內解決
├── P2（功能異常）：4 小時內回應，24 小時內解決
└── P3（一般問題）：24 小時內回應，72 小時內解決
\`\`\`

**SLA 分析的關鍵思維：Priority × 達成率**

不是所有 SLA miss 都一樣嚴重：
- P3 miss 10% → 45 張 ticket 晚了，影響有限
- P1 miss 27% → 4 張系統故障超時未解決，可能全公司停擺

**Error Rate（錯誤率）**

\`\`\`
Error Rate = 有錯誤的交易 / 總交易

常見 benchmark：
├── 金融交易：< 0.01%（非常嚴格）
├── 電商訂單：< 2%
├── 外送訂單：< 3%
└── 客服回覆：< 5%
\`\`\`

---

### Cost Per Transaction（單筆交易成本）

每完成一筆交易要花多少成本。

\`\`\`
Cost Per Transaction = 總營運成本 / 總交易數

例：
客服中心月成本 $50,000，處理 10,000 張 ticket
→ Cost per ticket = $5

如果導入 chatbot 後：
月成本 $55,000（多了 chatbot 費用），但處理 18,000 張 ticket
→ Cost per ticket = $3.06（下降 39%）
\`\`\`

**Cost per transaction 是 Ops 團隊的核心 KPI 之一**，直接影響 unit economics 和可擴展性。

---

## 2-4：Success Metrics 怎麼定

### 為一個專案/功能定 Success Metric

面試常見問法：「如果你是這個專案的 PM/PA，你怎麼定義成功？」

**三步驟框架：**

\`\`\`
Step 1：回到目標
  → 這個專案/功能要解決什麼問題？

Step 2：找到最直接的衡量方式
  → 「問題被解決」用什麼數字來表達？

Step 3：加上 guardrail
  → 達成目標的同時，什麼不能惡化？
\`\`\`

**實戰案例：Sales Dashboard 專案**

\`\`\`
目標：讓業務團隊自助查報表，不再需要每週找 data team

Step 1：問題是「data team 被太多 ad-hoc 請求佔據時間」
Step 2：Success metric = ad-hoc 報表請求數量下降
Step 3：Guardrail = 業務團隊的報表品質不能下降（避免看錯數據）

不好的 success metric：
├── DAU → 衡量「有人用」，不是「解決問題」
├── 業績提升 → 太間接，受太多因素影響
└── 滿意度問卷 → 主觀，不直接
\`\`\`

---

### Primary Metric vs Proxy Metric

**Primary Metric** = 直接衡量目標是否達成
**Proxy Metric** = 間接相關的替代指標

\`\`\`
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
\`\`\`

**什麼時候用 proxy？**
- Primary metric 太慢（如 LTV 要等 12 個月才能算）
- Primary metric 不好量測（如「使用者信任度」）
- Primary metric 受太多外部因素干擾

**面試技巧：** 如果你用 proxy metric，要能解釋「為什麼這個 proxy 跟 primary 有高相關性」。不要理所當然地假設。

---

### 指標衝突時怎麼辦？

當兩個指標互相矛盾，用 **Primary + Guardrail 框架**：

\`\`\`
情境：外送平台

指標 A：訂單完成時間（越快越好）
指標 B：訂單正確率（越高越好）

為了搶快送餐 → 送錯餐
為了確保正確 → 要更多時間

解法：
Primary = 訂單完成時間（優化方向）
Guardrail = 訂單正確率 ≥ 98%（不能低於這個底線）
\`\`\`

**面試中的萬用回答：**

> 「這兩個指標衝突的時候，我會選 [更難恢復的那個] 作為 guardrail，[更容易優化的那個] 作為 primary。因為一旦 [guardrail] 惡化，修復成本很高。」

---

## 2-5：不同角色看不同指標

### 每個角色的「指標世界觀」

不同角色因為負責不同的事，看重完全不同的指標。

**CEO / CFO（管營收與策略）**

\`\`\`
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
\`\`\`

**Product Manager（管產品與使用者）**

\`\`\`
核心指標：
├── DAU / MAU / Stickiness（使用者活躍嗎？）
├── Retention（使用者留下來嗎？）
├── Feature Adoption（新功能有人用嗎？）
├── Activation Rate（新用戶有成功啟用嗎？）
└── NPS / CSAT（使用者滿意嗎？）

決策場景：
「這個功能要不要做？」→ 看 user research + 預期對 retention 的影響
「功能做完了，成功嗎？」→ 看 adoption funnel + retention impact
\`\`\`

**Customer Success Manager（管客戶關係與續約）**

\`\`\`
核心指標：
├── Customer Health Score（哪個客戶有風險？）
├── NPS / CSAT（客戶感受如何？）
├── Churn Rate / Renewal Rate（客戶有在續約嗎？）
├── Expansion Revenue（既有客戶有在加購嗎？）
└── Time to Value（客戶多快開始得到價值？）

決策場景：
「這週要主動聯繫哪些客戶？」→ 看 health score 最低的
「這個客戶會不會續約？」→ 看 usage trend + NPS + support tickets
\`\`\`

**Operations Manager（管營運效率）**

\`\`\`
核心指標：
├── Cycle Time（流程要多久？）
├── Throughput（每天處理多少？）
├── SLA 達成率（有沒有達到服務承諾？）
├── Error Rate（錯誤率多少？）
└── Cost per Transaction（每筆交易成本？）

決策場景：
「要不要加人？」→ 看 throughput 是否能跟上需求成長
「流程要不要改？」→ 看 cycle time 和 bottleneck 分析
\`\`\`

---

### Dashboard 設計原則

設計 dashboard 的核心問題不是「放什麼指標」，而是：

\`\`\`
1. Audience → 誰在看？
2. Decision → 他需要做什麼決策？
3. Metrics  → 他需要什麼資訊來做這個決策？
\`\`\`

**常見錯誤：**

| 錯誤 | 為什麼不好 |
|------|-----------|
| 一個 dashboard 給所有人看 | 不同人需要不同層級的資訊，CEO 不需要看每個 feature 的 adoption |
| 放太多指標（>10 個）| 資訊過載，反而什麼都看不出來 |
| 只放 lagging metrics | 看到問題的時候已經太晚了 |
| 沒有 benchmark / 目標線 | 一個數字沒有比較對象就沒有意義 |

**好的 dashboard 結構：**

\`\`\`
├── 1-2 個 headline metrics（一眼看到整體狀況）
├── 3-5 個 supporting metrics（解釋 headline 為什麼好/壞）
├── 趨勢圖（看方向，不只看數字）
├── 目標線（跟 target 比較）
└── 可以 drill down（點進去看細節）
\`\`\`

---

## 2-6（Boss）：綜合指標分析

### Marketplace 健康度分析

Marketplace 是面試高頻場景（Uber、Airbnb、Shopee、外送平台...）。

**Marketplace 的三個面向：**

\`\`\`
Supply Side（供給端）     Demand Side（需求端）     Platform（平台自身）
├── 供應商數量             ├── 買家數量              ├── GMV
├── 供應商 NPS             ├── 買家活躍度            ├── Take Rate
├── 新供應商加入率         ├── 訂單頻率              ├── 訂單完成率
├── 供應商流失率           ├── 搜尋轉換率            ├── 平均配對時間
└── 供應品質/評分          └── 客戶 NPS              └── 毛利率
\`\`\`

**三個面向要一起看！** 只看 GMV 可能被誤導：

\`\`\`
場景：GMV 季增 15%，CEO 覺得不太對

深入分析：
├── Supply：供應商 -12.5%，NPS -14pts，新加入 -60% → 惡化
├── Demand：採購商 +12.5% → 還行
├── Platform：Take rate 8% → 12%，完成率 94% → 88% → 惡化

結論：GMV 成長是靠 AOV 暴漲（少數大單），但供應端在崩解。
根因：Take rate 漲太多，供應商不滿 → 流失 → 長期不可持續。
\`\`\`

---

### 如何診斷「Headline Metric 好看但底層不健康」

這是 PA/BA 面試的經典題型。面試官給你一個「看起來很好」的數據，考你能不能看出背後的問題。

**診斷步驟：**

\`\`\`
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
\`\`\`

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
`;

export default world2;
