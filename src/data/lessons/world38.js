const world38 = `
# World 38：Product Metrics (產品指標)

> Product Analyst 的核心工作就是用指標衡量產品表現。
> 選對指標，才能做出正確的產品決策。

產品團隊每天都在問：「這個功能有效嗎？」「我們應該優先做什麼？」
回答這些問題的基礎就是產品指標。

---

## 38-1：Activation / Onboarding 指標

### Activation 的定義

\`\`\`
Activation = 用戶第一次感受到產品核心價值的時刻

不同產品的 Activation Moment：
  Slack：發送第一則訊息
  Dropbox：上傳第一個檔案
  Spotify：建立第一個播放清單
  電商：完成第一筆購買
  SaaS：完成初始設定並使用核心功能
\`\`\`

### Activation 指標

| 指標 | 定義 | 計算方式 |
|------|------|---------|
| Activation Rate | 完成 Activation 的用戶比例 | Activated Users / Total Sign-ups |
| Time to Value (TTV) | 從註冊到 Activation 的時間 | 中位數或平均值 |
| Setup Completion Rate | 完成初始設定的比例 | Completed Setup / Total Sign-ups |
| Onboarding Drop-off | 各步驟的流失率 | 每步完成人數 / 上一步完成人數 |

### Onboarding Funnel 分析

\`\`\`
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
\`\`\`

### 改善 Activation 的策略

\`\`\`
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
\`\`\`

### 面試題

\`\`\`
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
\`\`\`

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

\`\`\`
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
\`\`\`

### Feature Adoption 指標

\`\`\`
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
\`\`\`

### Power User 分析

\`\`\`
用戶分群（依使用頻率）：
  Power Users：每天使用，佔 10%，貢獻 60% 的互動
  Regular Users：每週使用 3-4 次，佔 25%
  Casual Users：每週使用 1-2 次，佔 30%
  Dormant Users：偶爾使用，佔 35%

分析重點：
  1. Power Users 在用什麼功能？→ 這是產品核心價值
  2. Regular → Power 的轉換因素是什麼？→ 成長槓桿
  3. Casual → Dormant 的流失原因是什麼？→ 留存機會
\`\`\`

### L7 / L28 分析

\`\`\`
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
\`\`\`

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

\`\`\`
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
\`\`\`

### Cohort Analysis（世代分析）

\`\`\`
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
\`\`\`

### Churn 分析

\`\`\`
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
\`\`\`

### 流失預測模型

\`\`\`
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
\`\`\`

---

## 38-4：Conversion / Monetization (轉換 / 變現)

### Conversion Funnel

\`\`\`
Visit → Sign-up → Activation → Trial → Paid
 100K    10K       5K          2K     500

轉換率：
  Visit → Sign-up: 10%
  Sign-up → Activation: 50%
  Activation → Trial: 40%
  Trial → Paid: 25%
  Overall: 0.5%
\`\`\`

### 關鍵轉換指標

| 指標 | 定義 | 業界基準 |
|------|------|---------|
| Free-to-Paid Conversion | 免費用戶轉付費 | SaaS: 2-5% |
| Trial-to-Paid | 試用轉付費 | 15-30% |
| Cart Conversion | 加購物車到付款 | 電商: 30-40% |
| Upsell Rate | 升級到更高方案 | 5-10% / year |
| Cross-sell Rate | 購買其他產品 | 10-20% |

### ARPU / ARPPU

\`\`\`
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
\`\`\`

### LTV（Customer Lifetime Value）

\`\`\`
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
\`\`\`

### Pricing 策略指標

\`\`\`
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
\`\`\`

---

## 38-5：指標框架 (AARRR, North Star)

### AARRR (Pirate Metrics)

\`\`\`
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
\`\`\`

### AARRR 指標看板範例

\`\`\`
┌─────────────┬──────────┬──────────┬──────────┐
│ Stage       │ 本月      │ 上月      │ 變化     │
├─────────────┼──────────┼──────────┼──────────┤
│ Acquisition │ 15,000   │ 12,000   │ +25% ✅  │
│ Activation  │ 4,500    │ 3,000    │ +50% ✅  │
│ Retention   │ 2,250    │ 1,800    │ +25% ✅  │
│ Revenue     │ $112,500 │ $81,000  │ +39% ✅  │
│ Referral    │ 675      │ 450      │ +50% ✅  │
└─────────────┴──────────┴──────────┴──────────┘
\`\`\`

### North Star Metric

\`\`\`
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
\`\`\`

### 建立 Metric Tree

\`\`\`
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
\`\`\`

### Input Metrics vs Output Metrics

\`\`\`
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
\`\`\`

---

## 38-6：Product Metrics Case 實戰

### Case：音樂串流 App 的指標體系設計

\`\`\`
背景：
你是一個音樂串流 App（類似 Spotify）的 Product Analyst。
產品有免費版（有廣告）和付費版（$9.99/月）。
MAU 500 萬，付費用戶比例 8%。
\`\`\`

### Step 1：定義 North Star

\`\`\`
North Star Metric：每月聆聽時數
  為什麼？
  - 反映用戶從產品獲得的核心價值
  - 聆聽時數越高 → 留存越好 → 付費轉換越高
  - 可以驅動廣告收入（免費版）和訂閱收入（付費版）
\`\`\`

### Step 2：建立 AARRR 指標

\`\`\`
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
\`\`\`

### Step 3：找出最大槓桿

\`\`\`
分析各環節的改善空間：

                現狀    業界基準   Gap     潛在影響
Activation     55%     65%       10%     +25K MAU
D30 Retention  25%     30%       5%      +125K MAU
Free-to-Paid   8%      12%       4%      +$800K 年營收
DAU/MAU        35%     40%       5%      +50K 聆聽時數/天

結論：
1. 最大槓桿 = Activation（影響下游所有指標）
2. 次要槓桿 = Free-to-Paid（直接影響營收）
\`\`\`

### Step 4：設計改善方案

\`\`\`
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
\`\`\`

### Step 5：追蹤與迭代

\`\`\`
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
\`\`\`

### 面試口頭回答

\`\`\`
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
\`\`\`

---

## 🔑 World 38 Cheat Sheet

### 產品指標速查

\`\`\`
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
\`\`\`

### 面試回答框架

\`\`\`
1. 定義 North Star（為什麼選這個指標？）
2. 用 AARRR 拆解漏斗
3. 找出最大 Gap（跟業界比）
4. 提出改善方案（具體、可量化）
5. 說明如何驗證（A/B Test、追蹤指標）
\`\`\`
`;

export default world38;
