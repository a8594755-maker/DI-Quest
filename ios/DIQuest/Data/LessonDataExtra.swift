import Foundation

extension LessonData {
    static let zhWorld4: String = """

# World 4：SQL 與資料素養

> 面試不一定要寫 SQL，但你必須能用資料的語言思考。學會說「我需要什麼表、怎麼 JOIN、怎麼聚合」。

資料素養不是會寫程式碼，而是理解**資料從哪裡來、長什麼樣、怎麼用它回答問題**。
這一章會教你面試中最常被考的資料概念。

---

## 4-1：SQL 查詢思維

### 面試中的 SQL 不是考程式碼

大部分 Business Analyst / Product Analyst 面試不會要你在白板上寫完美的 SQL。
面試官想聽的是你的**查詢邏輯**：

1. 我需要回答什麼問題？
2. 這個答案需要哪些資料？
3. 資料在哪些 table 裡？
4. 怎麼把不同 table 的資料連起來？
5. 要做什麼計算？

### 基本 SQL 概念速覽

| 概念 | 作用 | 白話解釋 |
|------|------|----------|
| SELECT | 選欄位 | 我要看什麼資料？ |
| FROM | 選表 | 資料在哪張表？ |
| WHERE | 篩選 | 只看符合條件的資料 |
| GROUP BY | 分組 | 按某個維度匯總 |
| ORDER BY | 排序 | 結果怎麼排？ |
| HAVING | 分組後篩選 | 匯總後再篩選 |
| LIMIT | 限制筆數 | 只看前 N 筆 |

### 面試範例

面試官問：「你要怎麼查過去 30 天各 channel 的付費轉換率？」

你的回答：
> 「我需要 users 表和 payments 表。先用 user_id JOIN 起來，WHERE 篩選最近 30 天，然後 GROUP BY channel，計算每個 channel 的付費用戶數除以總用戶數。」

這樣就夠了，不需要寫出完整語法。

### 思考順序口訣

**FROM → WHERE → GROUP BY → SELECT → ORDER BY**

先想「從哪裡取」→ 再想「篩選什麼」→ 然後「怎麼分組」→ 最後「算什麼」

---

## 4-2：Event Data vs Transactional Data

### 兩種常見的資料類型

**Event Data（事件資料）**
- 記錄使用者的每一個行為
- 每一筆都是一個時間點上發生的事
- 範例：page_view、button_click、search_query
- 特性：量大、不可修改、按時間排序

**Transactional Data（交易資料）**
- 記錄業務實體的狀態
- 每一筆代表一個實體的當前狀態
- 範例：orders、subscriptions、invoices
- 特性：會被更新、有 lifecycle（created → paid → shipped）

### 為什麼面試要知道這個？

因為**問不同的問題要查不同類型的資料**：

| 問題 | 用什麼資料 |
|------|-----------|
| 用戶在哪一步流失？ | Event data（看 funnel） |
| 上個月營收多少？ | Transactional data（看 orders） |
| 用戶花多少時間完成 onboarding？ | Event data（看時間差） |
| 哪個方案的續約率最高？ | Transactional data（看 subscriptions） |

### 常見陷阱

- 用 event data 算營收（event 可能重複觸發）
- 用 transactional data 算使用行為（漏掉沒產生交易的用戶）
- 不同 event 的定義不一致（前端 vs 後端的 event 可能重複計算）

---

## 4-3：JOIN 與 Aggregation

### JOIN 的概念

JOIN 是把兩張表的資料根據共同的欄位連接起來。

常見 JOIN 類型：

| 類型 | 說明 | 什麼時候用 |
|------|------|-----------|
| INNER JOIN | 只保留兩邊都有的 | 「有付款紀錄的用戶」 |
| LEFT JOIN | 保留左邊全部 | 「所有用戶，不管有沒有付款」 |
| FULL JOIN | 兩邊全保留 | 比較兩個完整集合 |

### 面試中怎麼說 JOIN

不要說「我會用 LEFT JOIN」。要說：
> 「我需要看所有用戶，包含沒有購買過的，所以我會用 users 表當主表，LEFT JOIN 到 orders 表。沒有購買的用戶 order 欄位會是空值，我就能算出『有購買比例』。」

### Aggregation（聚合）

把多筆資料合併成一筆摘要：

| 函數 | 用途 | 範例 |
|------|------|------|
| COUNT | 計數 | 每個 channel 有多少用戶 |
| SUM | 加總 | 每個地區的總營收 |
| AVG | 平均 | 平均訂單金額 |
| MAX / MIN | 最大最小 | 最高單筆消費 |
| COUNT(DISTINCT) | 不重複計數 | 有多少不同用戶購買過 |

### 面試技巧

當面試官問「A 和 B 哪個比較好」時，你的回答結構是：
1. 定義「好」的指標
2. 說明你會怎麼 GROUP BY（按 A/B 分組）
3. 說明你會算什麼（AVG、COUNT 等）
4. 提醒需要控制的變數（樣本量、時間範圍等）

---

## 4-4：Window Functions（視窗函數）

### 為什麼需要 Window Functions？

有些分析問題用 GROUP BY 做不到：
- 每個用戶的**第幾次**購買？
- 跟**上一筆**比成長了多少？
- 過去 7 天的**移動平均**？
- 在同類中**排名第幾**？

### 核心概念

Window Function 在不合併行的情況下，對一組相關的行做計算。

常見 Window Functions：

| 函數 | 用途 | 面試應用 |
|------|------|----------|
| ROW_NUMBER | 排序編號 | 每個用戶的第 N 次購買 |
| RANK | 排名（可並列） | 銷售額排名 |
| LAG / LEAD | 前後比較 | 這個月 vs 上個月 |
| SUM OVER | 累計加總 | 累計營收走勢 |
| AVG OVER | 移動平均 | 7 天平均訂單量 |

### 面試中怎麼用

面試官問：「你怎麼算每個用戶從註冊到第一次付款的天數？」

你的回答：
> 「我會用 events 表，對每個用戶按時間排序，找到 registration event 和 first payment event 的時間差。可以用 ROW_NUMBER 或 MIN 找到每個用戶的第一筆付款，然後跟註冊時間相減。」

### 進階應用

- **Retention 計算**：每個 cohort 在 Day 1、Day 7、Day 30 的回訪率
- **Growth accounting**：新增、回流、流失用戶的分解
- **Percentile 分析**：P50、P90 的使用時長分佈

---

## 4-5：Source of Truth（資料的可信來源）

### 為什麼同一個問題不同報表數字不一樣？

在真實的公司裡，這是最常見的問題之一：
- Marketing 說「這個月有 10,000 個新用戶」
- Product 說「這個月有 8,500 個新用戶」
- Finance 說「這個月有 7,200 個新用戶」

三個團隊都沒有「錯」，只是定義不同：
- Marketing 算的是「註冊完成」
- Product 算的是「註冊 + 完成 onboarding」
- Finance 算的是「註冊 + 驗證 + 非重複帳號」

### Source of Truth 的概念

Source of Truth 是指對於某個指標，大家同意用哪一個資料來源和定義。

### 面試中會怎麼考

面試官可能會問：
- 「你發現兩份報表的數字不一樣，你怎麼處理？」
- 「PM 和 Finance 對 revenue 的數字有分歧，你怎麼辦？」

你的回答框架：
1. **確認定義**：各方用的指標定義是什麼？
2. **確認來源**：資料從哪裡來？什麼時間點的 snapshot？
3. **確認計算**：過濾條件、去重邏輯是否一致？
4. **對齊標準**：提出一個大家都同意的定義和計算方式

### 常見的資料品質問題

| 問題 | 範例 |
|------|------|
| 重複計算 | 同一個用戶被算了兩次（多裝置） |
| 定義不一致 | 「活躍用戶」每個團隊定義不同 |
| 時區問題 | UTC vs 當地時間導致日報數字不同 |
| 延遲資料 | 資料有 2 小時延遲，短期內看不準 |
| Survivorship bias | 只看留下來的用戶，忽略流失的 |

### 面試黃金句型

> 「在開始分析之前，我會先跟 stakeholder 確認指標的定義和資料來源。確保我們看的是同一份數據，避免後面的分析建立在錯誤的基礎上。」

---

## 4-6：Boss — 資料分析設計

Boss 關卡會考你設計一個完整的資料分析計畫：

1. **釐清問題**：stakeholder 想知道什麼？
2. **定義指標**：用什麼指標回答？確認定義
3. **盤點資料**：需要哪些 table？怎麼 JOIN？
4. **設計分析**：做什麼計算？怎麼分群？
5. **預期產出**：結果會長什麼樣？怎麼呈現？
6. **注意事項**：資料品質、偏差、限制

能完整走過這六步，代表你具備扎實的資料分析素養。

---

## 本章重點回顧

| 技能 | 面試考什麼 | 你要能做到 |
|------|-----------|-----------|
| SQL 思維 | 查詢邏輯 | 說出需要什麼表、怎麼連、怎麼算 |
| Event vs Transaction | 資料選擇 | 判斷用哪種資料回答問題 |
| JOIN & Aggregation | 資料合併 | 解釋為什麼用某種 JOIN |
| Window Functions | 進階分析 | 排名、前後比較、移動平均 |
| Source of Truth | 資料品質 | 識別定義不一致並提出解法 |

"""

    static let enWorld4: String = """

# World 4: SQL & Data Literacy

> You may not always need to write SQL in an interview, but you must be able to think in the language of data. Learn to say "I need this table, JOIN it this way, and aggregate like that."

Data literacy isn't about writing code — it's about understanding **where data comes from, what it looks like, and how to use it to answer questions**.
This chapter covers the most commonly tested data concepts in interviews.

---

## 4-1: SQL Query Thinking

### SQL in Interviews Isn't About Writing Code

Most Business Analyst / Product Analyst interviews won't ask you to write perfect SQL on a whiteboard.
What interviewers want to hear is your **query logic**:

1. What question do I need to answer?
2. What data do I need for that answer?
3. Which tables contain that data?
4. How do I connect data from different tables?
5. What calculations are needed?

### Basic SQL Concepts at a Glance

| Concept | Purpose | Plain English |
|---------|---------|---------------|
| SELECT | Choose columns | What data do I want to see? |
| FROM | Choose table | Which table has the data? |
| WHERE | Filter | Only show data matching conditions |
| GROUP BY | Group | Summarize by a dimension |
| ORDER BY | Sort | How should the results be ordered? |
| HAVING | Filter after grouping | Filter after aggregation |
| LIMIT | Limit rows | Only show the top N rows |

### Interview Example

Interviewer asks: "How would you find the paid conversion rate by channel over the past 30 days?"

Your answer:
> "I'd need the users table and the payments table. I'd JOIN them on user_id, use WHERE to filter for the last 30 days, then GROUP BY channel and calculate the number of paying users divided by total users for each channel."

That's sufficient — no need to write out the full syntax.

### Thinking Order Mnemonic

**FROM → WHERE → GROUP BY → SELECT → ORDER BY**

First think "where to get the data" → then "what to filter" → then "how to group" → finally "what to calculate"

---

## 4-2: Event Data vs Transactional Data

### Two Common Data Types

**Event Data**
- Records every user action
- Each row is something that happened at a point in time
- Examples: page_view, button_click, search_query
- Characteristics: high volume, immutable, ordered by time

**Transactional Data**
- Records the state of business entities
- Each row represents the current state of an entity
- Examples: orders, subscriptions, invoices
- Characteristics: gets updated, has a lifecycle (created → paid → shipped)

### Why Do Interviewers Care About This?

Because **different questions require different types of data**:

| Question | Data to Use |
|----------|-------------|
| At which step are users dropping off? | Event data (funnel analysis) |
| What was last month's revenue? | Transactional data (orders table) |
| How long does it take users to complete onboarding? | Event data (time difference) |
| Which plan has the highest renewal rate? | Transactional data (subscriptions table) |

### Common Pitfalls

- Using event data to calculate revenue (events may fire multiple times)
- Using transactional data to measure user behavior (misses users who never transacted)
- Inconsistent event definitions (frontend vs backend events may double-count)

---

## 4-3: JOIN & Aggregation

### The Concept of JOIN

A JOIN connects data from two tables based on a shared column.

Common JOIN types:

| Type | Description | When to Use |
|------|-------------|-------------|
| INNER JOIN | Keeps only matching rows from both sides | "Users who have payment records" |
| LEFT JOIN | Keeps all rows from the left table | "All users, regardless of whether they've paid" |
| FULL JOIN | Keeps all rows from both sides | Comparing two complete sets |

### How to Talk About JOINs in Interviews

Don't just say "I'd use a LEFT JOIN." Instead, say:
> "I need to see all users, including those who haven't made a purchase, so I'd use the users table as the main table and LEFT JOIN to the orders table. Users without purchases will have NULL in the order columns, which lets me calculate the 'purchase rate.'"

### Aggregation

Combining multiple rows into a single summary:

| Function | Purpose | Example |
|----------|---------|---------|
| COUNT | Count rows | How many users per channel |
| SUM | Sum values | Total revenue per region |
| AVG | Average | Average order value |
| MAX / MIN | Maximum / Minimum | Highest single purchase |
| COUNT(DISTINCT) | Count unique values | How many unique users made a purchase |

### Interview Tips

When an interviewer asks "Which is better, A or B?", structure your answer as:
1. Define the metric for "better"
2. Explain how you'd GROUP BY (by A/B)
3. Explain what you'd calculate (AVG, COUNT, etc.)
4. Mention variables to control for (sample size, time range, etc.)

---

## 4-4: Window Functions

### Why Do We Need Window Functions?

Some analytical questions can't be solved with GROUP BY:
- What is each user's **Nth** purchase?
- How much did it **grow compared to the previous** entry?
- What is the **moving average** over the past 7 days?
- What is the **rank** within a group?

### Core Concept

A Window Function performs calculations across a set of related rows without collapsing them.

Common Window Functions:

| Function | Purpose | Interview Application |
|----------|---------|----------------------|
| ROW_NUMBER | Sequential numbering | Each user's Nth purchase |
| RANK | Ranking (with ties) | Sales ranking |
| LAG / LEAD | Compare with previous/next | This month vs last month |
| SUM OVER | Running total | Cumulative revenue trend |
| AVG OVER | Moving average | 7-day average order volume |

### How to Use in Interviews

Interviewer asks: "How would you calculate the number of days from registration to first payment for each user?"

Your answer:
> "I'd use the events table, sort by time for each user, and find the time difference between the registration event and the first payment event. I could use ROW_NUMBER or MIN to find each user's first payment, then subtract the registration timestamp."

### Advanced Applications

- **Retention calculation**: Return rate for each cohort at Day 1, Day 7, Day 30
- **Growth accounting**: Decomposition into new, resurrected, and churned users
- **Percentile analysis**: P50, P90 distribution of session duration

---

## 4-5: Source of Truth

### Why Do Different Reports Show Different Numbers for the Same Question?

In real companies, this is one of the most common issues:
- Marketing says "We had 10,000 new users this month"
- Product says "We had 8,500 new users this month"
- Finance says "We had 7,200 new users this month"

None of the three teams are "wrong" — they just use different definitions:
- Marketing counts "registration completed"
- Product counts "registration + onboarding completed"
- Finance counts "registration + verification + deduplicated accounts"

### The Concept of Source of Truth

Source of Truth means agreeing on which data source and definition to use for a given metric.

### How This Comes Up in Interviews

Interviewers may ask:
- "You discover two reports show different numbers — how do you handle it?"
- "PM and Finance disagree on the revenue figure — what do you do?"

Your answer framework:
1. **Confirm definitions**: What metric definition is each party using?
2. **Confirm sources**: Where does the data come from? What time snapshot?
3. **Confirm calculations**: Are the filters and deduplication logic consistent?
4. **Align on standards**: Propose a definition and calculation method everyone agrees on

### Common Data Quality Issues

| Issue | Example |
|-------|---------|
| Double counting | Same user counted twice (multiple devices) |
| Inconsistent definitions | "Active user" defined differently by each team |
| Timezone issues | UTC vs local time causing different daily report numbers |
| Data latency | 2-hour data delay making short-term numbers inaccurate |
| Survivorship bias | Only looking at retained users, ignoring churned ones |

### Golden Interview Phrase

> "Before starting any analysis, I'd first confirm the metric definitions and data sources with stakeholders. This ensures we're looking at the same data and prevents building the analysis on an incorrect foundation."

---

## 4-6: Boss — Data Analysis Design

The Boss challenge tests your ability to design a complete data analysis plan:

1. **Clarify the question**: What does the stakeholder want to know?
2. **Define metrics**: Which metrics answer the question? Confirm definitions
3. **Inventory the data**: Which tables are needed? How to JOIN them?
4. **Design the analysis**: What calculations? How to segment?
5. **Expected output**: What will the results look like? How to present them?
6. **Caveats**: Data quality, biases, limitations

Being able to walk through all six steps demonstrates solid data analysis literacy.

---

## Chapter Summary

| Skill | What's Tested | What You Need to Do |
|-------|---------------|---------------------|
| SQL Thinking | Query logic | Explain which tables, how to join, how to calculate |
| Event vs Transaction | Data selection | Determine which data type to use for the question |
| JOIN & Aggregation | Combining data | Explain why you chose a specific JOIN type |
| Window Functions | Advanced analysis | Ranking, comparisons, moving averages |
| Source of Truth | Data quality | Identify definition inconsistencies and propose solutions |

"""

    static let zhWorld9: String = """

# World 9：Digital Worker 產品理解

> **目標：** 學完後你能用自己的話解釋 Decision Intelligence 是什麼、跟 ChatGPT 有什麼不同、核心工作流程長什麼樣
> **對應專案：** Decision-Intelligence-（Digital Worker Platform）
> **預估學習時間：** 3-4 小時

---

## 9-1：產品定位 — 它不是聊天機器人

### 先想一個場景

假設你是一家製造公司的供應鏈主管。每個月底，你要做這些事：

1. 整理這個月的銷售數據
2. 預測下個季度的需求量
3. 根據預測做採購計畫（要買什麼、買多少、跟誰買）
4. 評估風險（供應商會不會延遲？原料會不會漲價？）
5. 寫一份報告給你的主管審核
6. 主管核准後，才能真的下採購單

這整套流程，你可能需要一個分析師花 2-3 天來完成。

現在問你：**如果你要找一個 AI 來幫忙，你會找 ChatGPT 嗎？**

ChatGPT 可以回答你「什麼是安全庫存」，可以幫你寫公式，但它**沒辦法**：
- 自己去讀你的銷售數據
- 跑一個預測模型算出下季需求
- 幫你產出一份完整的採購計畫
- 讓你的主管在系統裡審核和批准

**Decision Intelligence 就是為了解決這個問題而設計的。** 它不是一個你問它問題、它回答你的聊天機器人。它是一個你可以「派任務」給它的**數位員工**。

### Chatbot vs Digital Worker：到底差在哪？

用一個簡單的比喻：

- **ChatGPT** 像是一個很聰明的**顧問**。你問它問題，它給你答案。但做事還是你自己做。
- **Digital Worker** 像是一個**新進員工**。你派任務給它，它做完交報告給你。你審核通過了，它才會真的執行。

具體的差異：

| 你關心的事 | ChatGPT 怎麼做 | Digital Worker 怎麼做 |
|-----------|---------------|---------------------|
| 我想知道下季需求 | 你問它，它給你一個估計值 | 你派任務給它，它讀你的數據、跑預測模型、產出完整報告 |
| 我想做採購計畫 | 你問它怎麼做，它教你步驟 | 它直接幫你算出採購計畫，你審核後一鍵執行 |
| 我怎麼知道它做得對不對？ | 你自己判斷 | 系統會記錄完整的決策軌跡，你可以看到每一步的邏輯 |
| 它會不會亂來？ | 沒有權限控制 | 有自主等級控制（A1-A4），重要操作需要你批准 |
| 它做的事有紀錄嗎？ | 聊天記錄而已 | 完整的審計追蹤（audit trail），誰做了什麼、什麼時候、為什麼 |

### 產品的技術定位

用一句話講：**Decision Intelligence 是一個 Digital Worker Platform，讓企業可以部署可管理、可審計的 AI 數位員工來執行分析和決策工作流。**

更具體一點：
- **產品類型：** Digital Worker Platform（不是 Chatbot、不是 BI 工具、不是 RPA）
- **v1 聚焦：** Analytics Digital Worker — 專門做數據分析、需求預測、採購規劃、風險評估
- **技術堆疊：** React 前端 + Supabase 後端 + FastAPI ML API
- **核心差異：** 任務驅動、角色制、有審核流程、有信任機制

> 💡 **面試官可能會追問：**
> - 「跟 RPA 有什麼不同？」→ RPA 是照腳本重複執行固定步驟，Digital Worker 能理解意圖、做判斷
> - 「跟 BI 工具有什麼不同？」→ BI 工具展示數據讓人做決策，Digital Worker 幫你分析數據並提出建議
> - 「為什麼不直接用 ChatGPT API？」→ 因為企業需要權限控制、審計追蹤、審核流程，這些 ChatGPT API 都沒有

---

## 9-2：核心工作流程（Golden Path）

### 用一個故事走一遍

小美是一家電子零件公司的供應鏈專員。她每個月要做需求預測和採購計畫。以前她用 Excel 花三天，現在她用 DI 系統：

**Step 1：上傳數據**

小美打開 \\`/workspace\\` 頁面（這是整個系統最重要的頁面，後面會詳細講）。她把這個月的銷售報表（Excel）拖進聊天面板。

系統自動開始「看」這份數據：這個欄位是產品編號、這個是銷售量、這個是日期... 就像一個新員工拿到一份報表，先搞清楚每個欄位是什麼意思。

**Step 2：Worker 接收任務**

小美在聊天框打：「幫我預測 Q2 的需求，然後做一份採購計畫。」

系統不是直接把這句話丟給 AI 模型。它會先「理解意圖」— 你說的是要跑預測（forecast）還是要做計畫（plan）？在程式碼裡，\\`chatIntentService.js\\` 會把小美的話解析成結構化的指令：

\\`\\`\\`
小美說的話 → chatIntentService 解析 → { intent: 'RUN_PLAN', confidence: 0.95 }
\\`\\`\\`

然後系統把這個任務拆解成一系列步驟：分析數據 → 預測需求 → 計算採購計畫 → 評估風險 → 產出報告。

**Step 3：執行工作流**

Worker 開始一步一步執行。每完成一步，右邊的 Canvas（畫布）會自動跳出結果：

- 預測完成 → 跳出預測圖表（ForecastWidget）
- 計畫完成 → 跳出採購計畫表格（PlanTableWidget）
- 風險評估完成 → 跳出風險警告（RiskWidget）

小美可以看到 Worker 正在做什麼、做到哪一步了。這不是一個黑箱 — 每一步的邏輯都是透明的。

**Step 4：審核**

Worker 做完後，任務進入「等待審核」狀態。小美的主管會在 \\`/employees/review\\` 頁面看到一份**決策摘要（Decision Brief）**：

- 建議採購 2,150 個零件，分 5 個品項
- 預估節省 $42,500
- 有一個高風險警告：供應商 A 的交期可能超過 30 天

主管可以選擇：✅ 批准、🔄 要求修改、❌ 退回。

**Step 5：批准**

主管審核通過後，在 \\`/employees/approvals\\` 頁面點「批准」。這時候系統才會真的把採購計畫標記為「可執行」。

重要的是：**在批准之前，什麼都不會真的發生。** 這就是「人在迴圈中」（Human-in-the-Loop）的設計。

**Step 6：審計追蹤**

之後任何時候，小美或她的主管都可以回去看這個任務的完整歷程：誰發起的、Worker 怎麼分析的、每一步用了什麼數據、為什麼做出這個建議。這就是審計追蹤（Audit Trail）。

### 六步驟總結

| 步驟 | 做什麼 | 在哪裡做 | 白話解釋 |
|------|--------|---------|---------|
| 1. 上傳 | 上傳數據 | \\`/workspace\\` | 把你的 Excel 丟進系統 |
| 2. 派任務 | Worker 接收任務 | \\`/workspace\\` 聊天框 | 跟 AI 員工說你要做什麼 |
| 3. 執行 | 預測 + 計畫 + 風險 | \\`/workspace\\` Canvas | AI 員工埋頭做事，你看著進度 |
| 4. 審核 | 主管檢視結果 | \\`/employees/review\\` | 主管看報告，確認沒問題 |
| 5. 批准 | 主管批准執行 | \\`/employees/approvals\\` | 主管蓋章，計畫才能執行 |
| 6. 追溯 | 查看歷史紀錄 | \\`/employees/review\\` | 隨時可以回去看完整過程 |

> 💡 **為什麼這個流程很重要？**
> 面試官問你「DI 怎麼用」的時候，不要背六個步驟名稱。用小美的故事講一遍，面試官會覺得你真的懂這個產品。

---

## 9-3：功能模組 — 你在系統裡能做什麼

### 不要記 27 個路由，記住 5 個核心頁面就夠了

DI 系統有很多頁面，但你只需要理解 5 個核心的：

**1. /workspace — 統一工作區（最重要的頁面）**

這是整個系統的「客廳」。吃飯、看電視、聊天都在這裡。具體來說：
- 左邊是**聊天面板**：你跟 AI Worker 對話
- 右邊是**Canvas 畫布**：Worker 的產出（圖表、表格、報告）會自動出現在這裡
- 你在這裡上傳數據、派任務、看結果

有些舊的路由（像 \\`/plan\\`、\\`/chat\\`）都被重新導向到 \\`/workspace\\`。這個設計叫做**路由收斂** — 把分散的功能集中到一個頁面，減少使用者的認知負擔。就像你家如果客廳、餐廳、書房是分開的，你得走來走去；如果是開放式空間，所有事情在同一個地方做，更方便。

**2. / — 首頁（Command Center）**

登入後看到的第一個畫面。像是一個**儀表板**：
- 你的待辦任務
- 最近的 Worker 活動
- 關鍵指標（KPI）

**3. /employees — Workers Hub（AI 員工管理）**

管理你的 AI 員工的地方。下面有幾個分頁：
- **Tasks** — 任務板：所有任務的狀態（待辦、進行中、等待審核、完成）
- **Review** — 審核頁：主管在這裡看 Worker 的產出
- **Workers** — 員工列表：創建新的 AI 員工、設定角色和權限
- **Config** — 設定：Worker 的模板、工具、政策

**4. /forecast — 預測工作室**

專門看預測結果的頁面。模型訓練、預測圖表、歷史比較都在這裡。

**5. /risk — 風險中心**

風險儀表板、例外處理、What-if 分析（「如果供應商延遲 2 週會怎樣？」）。

### 其他頁面（知道就好）

- \\`/digital-twin\\` — 數位孿生（系統模擬）
- \\`/scenarios\\` — 場景比較
- \\`/insights\\` — AI 自動掃描數據找異常和趨勢
- \\`/sandbox\\` — 測試用的模擬 ERP 環境
- \\`/settings\\` — 系統設定

> 💡 **面試官可能會追問：**
> 「為什麼把這麼多功能都塞進 /workspace？不會太複雜嗎？」
> → 好問題。這是一個 trade-off。收斂的好處是使用者不用在頁面間跳來跳去，壞處是單一頁面變得很複雜。DI 用 query params 來切換子功能（\\`?widget=forecast\\`、\\`?widget=risk\\`），讓一個頁面能展示不同的內容，但 URL 結構保持簡單。

---

## 9-4：Digital Worker 的核心概念

### 自主等級 — 像帶新人一樣帶 AI

你剛請了一個新員工。第一天上班，你會讓他自己做決定嗎？不會。你會盯著他的每一步，確認他做對了再讓他繼續。

三個月後呢？如果他表現不錯，你會開始放手讓他處理日常的事情，只有重要的決定才需要你審核。

一年後呢？他已經是老手了，大部分事情他自己搞定，你只需要看看結果就好。

**DI 系統的自主等級就是這個概念的數位版。** 系統定義了五個等級（A0-A4）：

| 等級 | 白話解釋 | 實際行為 |
|------|---------|---------|
| **A0 Manual** | 什麼都不能自己做 | 每個動作都要人批准 |
| **A1 Assisted** | 像實習生 | AI 提出建議，人來決定要不要做 |
| **A2 Supervised** | 像試用期員工 | AI 先做了，人事後審核 |
| **A3 Autonomous** | 像正式員工 | 日常工作自己處理，例外才通知主管 |
| **A4 Trusted** | 像資深員工 | 完全自主，系統只記錄不攔截 |

### 系統怎麼判斷要給幾級？

不是人手動設定的（雖然可以手動調）。系統會根據 Worker 的歷史表現自動建議。在程式碼裡，\\`workerPerformanceService.js\\` 會計算一個叫做 **first_pass_acceptance_rate** 的指標 — 也就是「Worker 第一次交出來的結果，有多少比例被主管直接核准（不需要修改）」。

判斷邏輯是這樣的：
- 做了 **20 個以上** 的任務，而且 **85% 以上** 一次通過 → 建議升到 **A4**
- 做了 **10 個以上** 的任務，而且 **70% 以上** 一次通過 → 建議升到 **A3**
- 做了 **5 個以上** 的任務，而且 **50% 以上** 一次通過 → 建議升到 **A2**
- 不到 50% → 維持 **A1**

而且這個計算是**分任務類型**的。同一個 Worker，做預測可能已經很熟（A4），但做風險評估還不行（A2）。系統會分別追蹤。

### 信任不是只升不降

主管隨時可以降級。如果 Worker 在某個任務類型上開始出錯（比如最近幾次預測都偏差很大），系統會降低它的自主等級。就像現實中，員工表現退步了，主管會重新開始盯得更緊。

### 審批政策 — 什麼動作需要人批准？

不是所有動作都一樣危險的。在 \\`reviewContract.js\\` 裡定義了三種動作的審批政策：

| 動作 | 危險程度 | v1 的政策 |
|------|---------|----------|
| **Export（匯出報表）** | 低 — 只是產出檔案，沒有改變任何系統 | A2 以上可以自動做 |
| **Notify（發通知）** | 中 — 會發 email 給別人 | A3 以上可以自動做 |
| **Writeback（寫回 ERP）** | 高 — 會真的改變生產系統的數據 | **永遠需要人批准**，v1 不允許自動 |

為什麼 Writeback 永遠需要批准？因為這是會影響真實營運的操作。如果 AI 自動下了一筆錯誤的採購單，可能造成幾十萬的損失。所以在 v1 版本，這個閘門是鎖死的。

> 💡 **面試官可能會追問：**
> 「如果 v2 要開放 Writeback 的自動審批，你會怎麼設計？」
> → 可以參考現有的 threshold 機制：設定金額門檻（例如 $10,000 以下自動批准）、影響範圍門檻（例如 50 筆以下自動批准）、風險等級門檻（低風險自動批准）。多個條件同時滿足才自動，任何一個超過就要人審。

---

## 9-5：Worker 產出什麼？三大交付物

Worker 做完一個任務後，不是丟一串文字給你。它會產出三份結構化的交付物：

### 1. Decision Brief（決策摘要）— 給主管看的

這是一份一頁式的摘要，讓主管快速了解：
- **建議是什麼：** 「建議採購 2,150 個零件，分 5 個品項，預估節省 $42,500」
- **商業影響：** 成本變化、服務水準影響、影響的訂單數
- **風險警告：** 「供應商 A 的交期可能超過 30 天」
- **信心程度：** 0.82（82%，意思是系統對這個建議蠻有信心的）
- **前提假設：** 「假設需求保持穩定的季節性、交期維持目前平均值」

### 2. Evidence Pack（證據包）— 給審計用的

這是一份完整的「怎麼算出來的」紀錄：
- **用了哪些數據：** 「用了 ds-001 需求歷史（1,200 筆），數據截止到 3/25」
- **用了什麼模型：** 「Prophet v1.2 做預測、Gurobi 11.0 做最佳化」
- **計算邏輯：** 「用 90 天窗口做 ARIMA 預測，加上 MOQ 限制求解」
- **場景比較：** 「什麼都不做 → 服務水準 89%、缺貨 42 次；按建議做 → 服務水準 92%、缺貨 5 次」

為什麼需要這個？因為企業做決策需要可追溯性。如果三個月後有人問「當初為什麼買了這麼多？」，Evidence Pack 就是答案。

### 3. Writeback Payload（寫回指令）— 給 ERP 用的

如果計畫被批准了，這份文件告訴系統要「寫」什麼到 ERP（企業資源規劃系統）裡：
- **要做什麼操作：** 建立一筆採購需求單
- **具體內容：** 物料 MAT-001、數量 500、交期 4/15、供應商 SUPP-A
- **防重複機制：** 每筆寫回都有 idempotency key，防止重複執行

> 💡 **為什麼要分三份？**
> 因為不同的人看不同的東西。主管看 Decision Brief（做不做的決定）、稽核看 Evidence Pack（怎麼做的紀錄）、系統看 Writeback Payload（要改什麼數據）。這是職責分離的體現。

---

## 9-6（Boss）：產品 Pitch

### 情境

你正在面試一家做企業 SaaS 的公司。面試官問你：

> 「你之前做的 Decision Intelligence 專案，能不能用 1-2 分鐘跟我解釋一下它是什麼？假設我是一個不太懂技術的業務主管。」

### 你的任務

請用清楚、簡潔的語言回答這個問題。你的回答應該包含：

1. **產品是什麼**（一句話定位）
2. **跟一般 AI 工具有什麼不同**（核心差異）
3. **核心工作流程**（Golden Path 的簡化版）
4. **為什麼企業需要它**（價值主張）

### 評估標準

- 是否清楚區分 Digital Worker 和一般 AI 工具
- 是否提到任務驅動、審計追蹤、信任進展等核心概念
- 是否能用非技術語言解釋
- 是否提到實際的工作流程（不只是抽象概念）

### 參考回答（非技術版）

「Decision Intelligence 是一個**數位員工平台**。簡單說，它讓企業可以有一個 AI 員工，幫你做數據分析和決策規劃。

跟 ChatGPT 不一樣的是，它不是你問問題、它回答你。而是你派任務給它 — 比如說『幫我預測下季的需求，做一份採購計畫』。它會自己讀你的數據、跑模型、算出計畫、評估風險，然後交一份報告給你審核。你覺得 OK 就批准，不 OK 就叫它改。

最特別的是它有**信任機制**。一開始它做什麼都要你同意，就像新人一樣。做得好、你慢慢放手，它就能自己處理越來越多的事情。但重要的決定 — 比如真的要下採購單 — 永遠需要你點頭。

企業為什麼需要這個？因為現在很多分析工作是重複性的：每個月跑同樣的報表、做類似的預測。讓 AI 來做這些，人專注在做判斷和決策。而且所有過程都有完整紀錄，稽核的時候不用怕。」

### 參考回答（技術版，如果面試官想深入）

「技術上，系統是一個四層架構：React 前端做 UI、Supabase 做資料庫和認證、Edge Functions 做 AI 模型的代理層（避免 API key 暴露在前端）、FastAPI ML API 跑預測和最佳化求解。

Worker 的任務執行是基於狀態機（state machine）設計的：\\`todo → in_progress → waiting_review → done\\`。每一步都會產出 artifact（交付物），透過 event bus 推送到前端的 Canvas widget。

自主等級（A0-A4）是根據 first_pass_acceptance_rate 自動計算的 — 第一次提交被核准的比例超過 85% 且累計 20 個任務以上，系統就會建議升到 A4。審批政策是按動作類型分的：export 比較寬鬆、writeback 最嚴格，v1 永遠需要人工審批。」

"""

    static let enWorld9: String = """

# World 9: Understanding the Digital Worker Product

> **Objective:** After completing this lesson, you should be able to explain in your own words what Decision Intelligence is, how it differs from ChatGPT, and what the core workflow looks like
> **Related Project:** Decision-Intelligence- (Digital Worker Platform)
> **Estimated Study Time:** 3-4 hours

---

## 9-1: Product Positioning — It's Not a Chatbot

### Start with a Scenario

Imagine you are the supply chain manager at a manufacturing company. At the end of every month, you need to:

1. Compile this month's sales data
2. Forecast demand for the next quarter
3. Create a procurement plan based on the forecast (what to buy, how much, from whom)
4. Assess risks (will a supplier be delayed? will raw material prices increase?)
5. Write a report for your supervisor to review
6. Only after your supervisor approves can you actually place purchase orders

This entire process might take an analyst 2-3 days to complete.

Now ask yourself: **If you wanted an AI to help, would you use ChatGPT?**

ChatGPT can answer "what is safety stock" or help you write formulas, but it **cannot**:
- Read your sales data on its own
- Run a forecasting model to calculate next quarter's demand
- Generate a complete procurement plan for you
- Allow your supervisor to review and approve within the system

**Decision Intelligence was designed to solve exactly this problem.** It's not a chatbot where you ask questions and it gives answers. It's a **digital employee** that you can assign tasks to.

### Chatbot vs Digital Worker: What's the Real Difference?

A simple analogy:

- **ChatGPT** is like a very smart **consultant**. You ask questions, it gives answers. But you still do the work yourself.
- **Digital Worker** is like a **new hire**. You assign tasks to it, it completes the work and submits a report. You review and approve before it actually executes.

Specific differences:

| What You Care About | How ChatGPT Does It | How Digital Worker Does It |
|-----------|---------------|---------------------|
| I want to know next quarter's demand | You ask, it gives you an estimate | You assign a task, it reads your data, runs a forecasting model, and produces a complete report |
| I want to create a procurement plan | You ask how to do it, it teaches you the steps | It directly calculates the procurement plan for you; you review and execute with one click |
| How do I know if it's correct? | You judge for yourself | The system records a complete decision trail — you can see the logic behind every step |
| Will it act recklessly? | No permission controls | Autonomy level control (A1-A4); critical operations require your approval |
| Is there a record of what it does? | Just chat history | Full audit trail — who did what, when, and why |

### Technical Positioning of the Product

In one sentence: **Decision Intelligence is a Digital Worker Platform that enables enterprises to deploy manageable, auditable AI digital employees to execute analytics and decision-making workflows.**

More specifically:
- **Product Type:** Digital Worker Platform (not a Chatbot, not a BI tool, not RPA)
- **v1 Focus:** Analytics Digital Worker — specializing in data analysis, demand forecasting, procurement planning, and risk assessment
- **Tech Stack:** React frontend + Supabase backend + FastAPI ML API
- **Core Differentiators:** Task-driven, role-based, with review processes and trust mechanisms

> **Possible interview follow-ups:**
> - "How is it different from RPA?" — RPA follows fixed scripts to repeat predetermined steps; Digital Worker understands intent and makes judgments
> - "How is it different from BI tools?" — BI tools display data for humans to make decisions; Digital Worker analyzes data and proposes recommendations
> - "Why not just use the ChatGPT API?" — Because enterprises need permission controls, audit trails, and review processes, none of which the ChatGPT API provides

---

## 9-2: Core Workflow (Golden Path)

### Walking Through a Story

Mei is a supply chain specialist at an electronic components company. She needs to do demand forecasting and procurement planning every month. She used to spend three days with Excel; now she uses the DI system:

**Step 1: Upload Data**

Mei opens the \\`/workspace\\` page (this is the single most important page in the entire system — more on this later). She drags this month's sales report (Excel) into the chat panel.

The system automatically begins "reading" the data: this column is the product ID, this one is sales volume, this one is the date... Just like a new employee receiving a report and first figuring out what each column means.

**Step 2: Worker Receives the Task**

Mei types in the chat box: "Forecast Q2 demand and create a procurement plan."

The system doesn't simply pass this sentence to an AI model. It first "understands the intent" — are you asking for a forecast or a plan? In the code, \\`chatIntentService.js\\` parses Mei's message into a structured command:

\\`\\`\\`
What Mei said → chatIntentService parses → { intent: 'RUN_PLAN', confidence: 0.95 }
\\`\\`\\`

Then the system decomposes the task into a series of steps: analyze data → forecast demand → calculate procurement plan → assess risks → generate report.

**Step 3: Execute the Workflow**

The Worker executes step by step. As each step completes, the Canvas on the right automatically displays results:

- Forecast complete → forecast chart appears (ForecastWidget)
- Plan complete → procurement plan table appears (PlanTableWidget)
- Risk assessment complete → risk warnings appear (RiskWidget)

Mei can see what the Worker is doing and which step it's on. This is not a black box — the logic behind every step is transparent.

**Step 4: Review**

After the Worker finishes, the task enters a "waiting for review" state. Mei's supervisor sees a **Decision Brief** on the \\`/employees/review\\` page:

- Recommends purchasing 2,150 components across 5 items
- Estimated savings of $42,500
- One high-risk warning: Supplier A's lead time may exceed 30 days

The supervisor can choose: Approve, Request Revision, or Reject.

**Step 5: Approval**

After the supervisor completes the review, they click "Approve" on the \\`/employees/approvals\\` page. Only then does the system mark the procurement plan as "ready to execute."

Importantly: **Nothing actually happens until approval.** This is the "Human-in-the-Loop" design.

**Step 6: Audit Trail**

At any point afterward, Mei or her supervisor can review the complete history of this task: who initiated it, how the Worker analyzed it, what data was used at each step, and why it made its recommendations. This is the audit trail.

### Six-Step Summary

| Step | What | Where | Plain Explanation |
|------|--------|---------|---------|
| 1. Upload | Upload data | \\`/workspace\\` | Drag your Excel into the system |
| 2. Assign | Worker receives task | \\`/workspace\\` chat box | Tell your AI employee what you need done |
| 3. Execute | Forecast + Plan + Risk | \\`/workspace\\` Canvas | AI employee works away while you watch progress |
| 4. Review | Supervisor examines results | \\`/employees/review\\` | Supervisor reads the report and confirms everything looks good |
| 5. Approve | Supervisor approves execution | \\`/employees/approvals\\` | Supervisor signs off; only then can the plan be executed |
| 6. Trace | View historical records | \\`/employees/review\\` | You can always go back and review the complete process |

> **Why is this workflow so important?**
> When an interviewer asks "how does DI work," don't just recite six step names. Walk through Mei's story, and the interviewer will see that you truly understand the product.

---

## 9-3: Feature Modules — What Can You Do in the System

### Don't Memorize 27 Routes — Just Remember 5 Core Pages

The DI system has many pages, but you only need to understand 5 core ones:

**1. /workspace — Unified Workspace (The Most Important Page)**

This is the system's "living room." Eating, watching TV, chatting — everything happens here. Specifically:
- The left side is the **chat panel**: where you converse with the AI Worker
- The right side is the **Canvas**: Worker outputs (charts, tables, reports) automatically appear here
- You upload data, assign tasks, and view results all in this page

Some legacy routes (like \\`/plan\\`, \\`/chat\\`) all redirect to \\`/workspace\\`. This design is called **route convergence** — consolidating scattered features into a single page to reduce the user's cognitive load. It's like having an open-plan living space instead of separate rooms for the living room, dining room, and study — everything in one place is more convenient.

**2. / — Home Page (Command Center)**

The first screen you see after logging in. It functions as a **dashboard**:
- Your pending tasks
- Recent Worker activity
- Key metrics (KPIs)

**3. /employees — Workers Hub (AI Employee Management)**

Where you manage your AI employees. It has several sub-tabs:
- **Tasks** — Task board: status of all tasks (to-do, in progress, waiting for review, done)
- **Review** — Review page: supervisors view Worker outputs here
- **Workers** — Employee list: create new AI employees, set roles and permissions
- **Config** — Settings: Worker templates, tools, policies

**4. /forecast — Forecast Studio**

A dedicated page for viewing forecast results. Model training, forecast charts, and historical comparisons all live here.

**5. /risk — Risk Center**

Risk dashboard, exception handling, and What-if analysis ("What if the supplier delays by 2 weeks?").

### Other Pages (Good to Know)

- \\`/digital-twin\\` — Digital Twin (system simulation)
- \\`/scenarios\\` — Scenario comparison
- \\`/insights\\` — AI automatically scans data for anomalies and trends
- \\`/sandbox\\` — Simulated ERP environment for testing
- \\`/settings\\` — System settings

> **Possible interview follow-up:**
> "Why cram so many features into /workspace? Won't it be too complex?"
> Good question. It's a trade-off. The benefit of convergence is that users don't have to jump between pages; the downside is that a single page becomes complex. DI uses query params to switch sub-features (\\`?widget=forecast\\`, \\`?widget=risk\\`), allowing one page to display different content while keeping the URL structure simple.

---

## 9-4: Core Concepts of the Digital Worker

### Autonomy Levels — Managing AI Like Onboarding a New Hire

You just hired a new employee. On their first day, would you let them make decisions on their own? No. You'd supervise their every step, confirming they got it right before letting them continue.

After three months? If they're doing well, you start letting them handle routine matters on their own — only important decisions need your review.

After a year? They're experienced. They handle most things independently, and you just need to glance at the results.

**DI's autonomy levels are the digital version of this concept.** The system defines five levels (A0-A4):

| Level | Plain Explanation | Actual Behavior |
|------|---------|---------|
| **A0 Manual** | Can't do anything on its own | Every action requires human approval |
| **A1 Assisted** | Like an intern | AI proposes suggestions; humans decide whether to act |
| **A2 Supervised** | Like a probationary employee | AI acts first; humans review afterward |
| **A3 Autonomous** | Like a full-time employee | Handles routine work independently; only notifies supervisor for exceptions |
| **A4 Trusted** | Like a senior employee | Fully autonomous; system only logs, never blocks |

### How Does the System Determine the Level?

It's not manually set (though you can manually adjust it). The system automatically suggests a level based on the Worker's historical performance. In the code, \\`workerPerformanceService.js\\` calculates a metric called **first_pass_acceptance_rate** — the percentage of times the Worker's initial output was approved by the supervisor without requiring changes.

The logic works like this:
- Completed **20+ tasks** with **85%+** first-pass approval rate → suggest upgrading to **A4**
- Completed **10+ tasks** with **70%+** first-pass approval rate → suggest upgrading to **A3**
- Completed **5+ tasks** with **50%+** first-pass approval rate → suggest upgrading to **A2**
- Below 50% → remain at **A1**

This calculation is also **per task type**. The same Worker might be proficient at forecasting (A4) but still learning risk assessment (A2). The system tracks each type separately.

### Trust Doesn't Only Go Up

Supervisors can downgrade at any time. If a Worker starts making mistakes in a particular task type (e.g., recent forecasts have had large deviations), the system lowers its autonomy level. Just like in real life — if an employee's performance declines, the supervisor tightens oversight.

### Approval Policies — What Actions Require Human Approval?

Not all actions carry the same risk. In \\`reviewContract.js\\`, three types of actions have different approval policies:

| Action | Risk Level | v1 Policy |
|------|---------|----------|
| **Export (export reports)** | Low — only produces a file, doesn't change any system | A2 and above can do it automatically |
| **Notify (send notifications)** | Medium — sends emails to others | A3 and above can do it automatically |
| **Writeback (write to ERP)** | High — actually changes data in the production system | **Always requires human approval**; v1 does not allow auto-execution |

Why does Writeback always require approval? Because it affects real business operations. If the AI automatically placed an incorrect purchase order, it could cause losses of tens of thousands of dollars. So in v1, this gate is locked shut.

> **Possible interview follow-up:**
> "If v2 were to open up automatic approval for Writeback, how would you design it?"
> You could reference the existing threshold mechanism: set monetary thresholds (e.g., auto-approve under $10,000), scope thresholds (e.g., auto-approve under 50 line items), and risk level thresholds (auto-approve low risk). Multiple conditions must be met simultaneously for auto-approval; if any one exceeds the threshold, human approval is required.

---

## 9-5: What Does the Worker Produce? Three Deliverables

When a Worker completes a task, it doesn't just throw a wall of text at you. It produces three structured deliverables:

### 1. Decision Brief — For the Supervisor

This is a one-page summary that lets the supervisor quickly understand:
- **What the recommendation is:** "Recommend purchasing 2,150 components across 5 items, estimated savings of $42,500"
- **Business impact:** Cost changes, service level impact, number of orders affected
- **Risk warnings:** "Supplier A's lead time may exceed 30 days"
- **Confidence level:** 0.82 (82%, meaning the system is fairly confident in this recommendation)
- **Assumptions:** "Assumes demand maintains stable seasonality; lead times remain at current averages"

### 2. Evidence Pack — For Auditing

This is a complete record of "how it was calculated":
- **What data was used:** "Used ds-001 demand history (1,200 records), data cutoff 3/25"
- **What models were used:** "Prophet v1.2 for forecasting, Gurobi 11.0 for optimization"
- **Calculation logic:** "Used a 90-day window for ARIMA forecasting, plus MOQ constraints for solving"
- **Scenario comparison:** "Do nothing → service level 89%, 42 stockouts; follow recommendation → service level 92%, 5 stockouts"

Why is this needed? Because enterprise decisions require traceability. If someone asks three months later "why did we buy so much?", the Evidence Pack is the answer.

### 3. Writeback Payload — For the ERP

If the plan is approved, this document tells the system what to "write" to the ERP (Enterprise Resource Planning system):
- **What operation to perform:** Create a purchase requisition
- **Specific content:** Material MAT-001, quantity 500, delivery date 4/15, Supplier SUPP-A
- **Deduplication mechanism:** Every writeback has an idempotency key to prevent duplicate execution

> **Why three separate deliverables?**
> Because different people look at different things. Supervisors read the Decision Brief (the go/no-go decision), auditors review the Evidence Pack (the record of how it was done), and the system reads the Writeback Payload (what data to change). This is an embodiment of separation of concerns.

---

## 9-6 (Boss): Product Pitch

### Scenario

You're interviewing at a company that builds enterprise SaaS. The interviewer asks:

> "Can you explain in 1-2 minutes what Decision Intelligence is? Assume I'm a non-technical business executive."

### Your Task

Answer this question in clear, concise language. Your answer should include:

1. **What the product is** (one-sentence positioning)
2. **How it differs from typical AI tools** (core differentiator)
3. **Core workflow** (simplified Golden Path)
4. **Why enterprises need it** (value proposition)

### Evaluation Criteria

- Does it clearly distinguish Digital Worker from general AI tools?
- Does it mention task-driven operation, audit trails, trust progression, and other core concepts?
- Can it be explained in non-technical language?
- Does it mention the actual workflow (not just abstract concepts)?

### Reference Answer (Non-Technical Version)

"Decision Intelligence is a **digital employee platform**. In simple terms, it lets an enterprise have an AI employee that handles data analysis and decision planning.

Unlike ChatGPT, it's not about asking questions and getting answers. Instead, you assign tasks — for example, 'forecast next quarter's demand and create a procurement plan.' It reads your data on its own, runs models, calculates the plan, assesses risks, and then submits a report for your review. If you're satisfied, you approve it; if not, you ask it to revise.

What makes it special is the **trust mechanism**. At first, everything it does requires your approval, just like a new hire. As it performs well and you gradually let go, it can handle more and more on its own. But important decisions — like actually placing a purchase order — always require your sign-off.

Why do enterprises need this? Because much of today's analysis work is repetitive: running the same reports every month, making similar forecasts. Let AI handle those so people can focus on judgment and decision-making. And the entire process has complete records, so there's nothing to worry about during an audit."

### Reference Answer (Technical Version, If the Interviewer Wants to Go Deeper)

"Technically, the system uses a four-layer architecture: React frontend for the UI, Supabase for the database and authentication, Edge Functions as the proxy layer for AI models (preventing API key exposure on the frontend), and a FastAPI ML API for forecasting and optimization.

Worker task execution is based on a state machine design: \\`todo → in_progress → waiting_review → done\\`. Each step produces artifacts (deliverables) that are pushed to the frontend's Canvas widgets via an event bus.

Autonomy levels (A0-A4) are automatically calculated based on the first_pass_acceptance_rate — if the first-submission approval rate exceeds 85% with 20+ completed tasks, the system suggests upgrading to A4. Approval policies are separated by action type: export is more lenient, writeback is the strictest — v1 always requires manual approval."

"""

    static let zhWorld10: String = """

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

\\`\\`\\`
你的瀏覽器（前端）
  → chatIntentService.js 解析你的話：「這個人要做預測」
  → 組好請求，送到 ML API
  → ML API 收到後，叫 Prophet 模型做預測
  → 預測結果回傳到前端
  → Canvas 自動跳出 ForecastWidget，顯示預測圖表
\\`\\`\\`

但如果你問的是需要 AI 幫忙思考的問題（比如「分析一下為什麼上個月銷量掉了」），路線會不一樣：

\\`\\`\\`
你的瀏覽器（前端）
  → chatIntentService.js 解析：「這個人要 AI 分析」
  → 請求送到 Supabase Edge Function 的 ai-proxy
  → ai-proxy 幫你呼叫 Gemini/DeepSeek（因為 API key 不能放在瀏覽器）
  → AI 回覆送回前端
  → 顯示在聊天面板
\\`\\`\\`

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

DI 前端的 \\`src/services/\\` 資料夾底下有 31 個子目錄。但你不需要全部記住。重要的是理解 Service 層在做什麼：**它是前端 component 和後端 API 之間的翻譯官。**

### 五個最重要的 Service

**1. chat/ — 聽你說話的翻譯官**

當你在聊天框輸入任何東西，\\`chatIntentService.js\\` 會先分析你的意圖：

- 你說「預測 Q2 需求」 → 它翻譯成 \\`{ intent: 'RUN_FORECAST' }\\`
- 你說「做一份採購計畫」 → 翻譯成 \\`{ intent: 'RUN_PLAN' }\\`
- 你說「早安」 → 翻譯成 \\`{ intent: 'GREETING' }\\`（這個不需要叫 AI 模型，直接回覆就好，省錢）

它還有一個信心分數（confidence）。如果分數低於 0.7，代表它不太確定你要做什麼，會再問你一次。

**2. planning/ — 做計畫的引擎**

\\`chatPlanningService.js\\` 是做採購計畫的核心。它會：
- 讀取你上傳的數據
- 套用限制條件（預算上限、最低訂購量）
- 呼叫 ML API 的 solver 做最佳化
- 產出計畫表格、庫存預測、成本分析

**3. aiEmployee/ — Worker 的大腦**

\\`orchestrator.js\\` 是 Worker 的指揮中心。它管理任務的生命週期：
- 拆解任務成步驟（profile → forecast → optimize → risk → report）
- 一步一步執行
- 每一步完成後檢查品質
- 產出 artifact（交付物）推送到 Canvas

**4. data-prep/ — 數據管家**

\\`chatDatasetProfilingService.js\\` 負責「看懂」你上傳的數據：
- 自動偵測欄位類型（數字、日期、文字）
- 找出缺失值和異常值
- 建議欄位對應（「Column_A 看起來是產品編號」）

**5. risk/ — 風險守門員**

\\`riskAdjustmentsService.js\\` 負責在計畫上加入風險考量：
- 供應商可靠度評分
- 安全庫存調整
- 缺貨損失估算

### Service 層的設計哲學

好的 Service 層讓 component 可以很簡單地呼叫功能，不需要知道背後的複雜邏輯。比如 component 只需要呼叫 \\`runForecast(datasetId)\\`，不需要知道它背後要先做數據驗證、再呼叫 ML API、再處理回傳格式。

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

所以 DI 的做法是：前端不直接呼叫 Gemini，而是呼叫 \\`ai-proxy\\` Edge Function。ai-proxy 跑在 Supabase 的伺服器上，它有 API key（透過 \\`supabase secrets set\\` 安全地存放），它幫你轉呼叫 Gemini，再把結果傳回前端。

ai-proxy 支援多家 AI 模型：
- **Gemini** — Google 的模型（預設的進階模型用 gemini-3.1-pro-preview，快速模型用 gemini-2.5-flash）
- **DeepSeek** — 開源大模型（包含 deepseek-reasoner 用於推理）
- **Anthropic (Claude)** — Anthropic 的模型
- **OpenAI (GPT)** — OpenAI 的模型
- **Kimi** — 月之暗面的模型

**其他 Edge Functions**

| 函數 | 做什麼 | 白話 |
|------|--------|------|
| \\`bom-explosion\\` | BOM（物料清單）展開計算 | 「做一張椅子需要 4 個腳 + 1 個座板 + 8 個螺絲」— 把成品拆解成所有零件的需求量 |
| \\`sync-materials-from-sap\\` | 從 SAP 同步物料數據 | 從 ERP 系統把最新的物料資料搬過來 |
| \\`sync-demand-fg-from-sap\\` | 從 SAP 同步需求數據 | 把成品的銷售需求拉過來 |
| \\`sync-inventory-from-sap\\` | 從 SAP 同步庫存數據 | 把目前的庫存量拉過來 |
| \\`ai-employee-scheduler\\` | Worker 任務排程 | 定時派任務給 Worker |
| \\`etl-scheduler\\` | 數據管線排程 | 定時跑數據同步和轉換 |

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

ML API 是一個用 Python 寫的 FastAPI 應用程式，跑在 Docker 容器裡。它的入口檔案是 \\`src/ml/api/main.py\\`。

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

正式環境預設用 \\`ortools\\`（免費且品質夠好），如果客戶有 Gurobi 授權可以切換。

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

\\`\\`\\`
1. 瀏覽器 → chatIntentService 解析意圖
2. 意圖是「分析」→ 需要 AI 思考 → 呼叫 ai-proxy Edge Function
3. ai-proxy 帶著 API key 呼叫 Gemini
4. Gemini 分析數據後回覆
5. 回覆經過 ai-proxy 回到瀏覽器
6. 聊天面板顯示分析結果
\\`\\`\\`

**關鍵：** 瀏覽器永遠不知道 Gemini 的 API key 是什麼。ai-proxy 是安全的中間人。

### Flow 2：數據上傳與寫入（上傳 Excel 報表）

**使用者故事：** 小美把這個月的銷售報表拖進 workspace。

\\`\\`\\`
1. 瀏覽器 → 檔案上傳到 Supabase Storage
2. chatDatasetProfilingService 讀取檔案，偵測欄位
3. 結果存入 Supabase PostgreSQL（dataset_profiles 表）
4. 匯入歷史記錄寫入 import_batches 表（審計追蹤）
5. 前端顯示「上傳完成，偵測到 12 個欄位、3,500 筆資料」
\\`\\`\\`

**關鍵：** 數據寫入需要交易性（全部成功或全部失敗）和審計追蹤，所以走 Supabase。

### Flow 3：預測與最佳化（「幫我做採購計畫」）

**使用者故事：** 小美在聊天框打：「用這份數據做 Q2 的採購計畫，預算上限 100 萬。」

\\`\\`\\`
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
\\`\\`\\`

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

"""

    static let enWorld10: String = """

# World 10: System Architecture Topology

> **Objective:** Understand the DI system's four-layer architecture, why it's layered, and how a request travels from start to finish
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 10-1: Understanding Architecture Through a Single Action

### What Happens Behind the Scenes When You Click "Forecast Q2 Demand"?

Don't think about architecture diagrams yet. Imagine you're a user typing in the DI system's chat box: "Forecast Q2 demand."

From the moment you press Enter to seeing the forecast results, the request passes through **four places**. Using a restaurant analogy:

1. **Frontend (React) = The restaurant seating and menu**
   You're sitting at a table (browser), looking at the menu (UI), and ordering from the server (entering commands).

2. **Supabase = The kitchen's refrigerator and ledger**
   The fridge stores all the ingredients (data in the database). The ledger records all orders (user authentication, task records).

3. **Edge Functions = The waiter**
   You don't walk into the kitchen yourself. The waiter relays your order to the kitchen and brings the finished dish back. Edge Functions work the same way — they're the middleman between frontend and backend, relaying requests on your behalf.

4. **ML API (FastAPI) = The head chef**
   The person who actually cooks. Python forecasting models (Prophet, LightGBM) and optimization solvers (OR-Tools) can only be used in the "kitchen" (Python environment) — they can't be moved to the dining table (browser).

### The Actual Request Flow

Going back to the example — after you press Enter:

\\`\\`\\`
Your browser (frontend)
  → chatIntentService.js parses your message: "This person wants a forecast"
  → Assembles the request, sends it to ML API
  → ML API receives it, calls the Prophet model to run the forecast
  → Forecast results return to the frontend
  → Canvas automatically opens ForecastWidget, displaying the forecast chart
\\`\\`\\`

But if your question requires AI-assisted thinking (e.g., "analyze why last month's sales dropped"), the route is different:

\\`\\`\\`
Your browser (frontend)
  → chatIntentService.js parses: "This person wants AI analysis"
  → Request goes to the Supabase Edge Function ai-proxy
  → ai-proxy calls Gemini/DeepSeek on your behalf (because the API key can't be in the browser)
  → AI response returns to the frontend
  → Displayed in the chat panel
\\`\\`\\`

### Why Can't You Just Use One Server?

You might ask: why four layers? Can't a single program handle everything?

It could, but several problems would arise:

1. **Security:** AI API keys (like GEMINI_API_KEY) cost money. If placed in frontend JavaScript, anyone can open the browser's DevTools and see them. That's like printing your credit card number on the menu.

2. **Technical limitations:** Prophet, OR-Tools — these forecasting and optimization tools are written in Python. Browsers can't run Python. Just like you can't bake a cake in a microwave — different tasks require different tools.

3. **Resource allocation:** ML prediction and solving consume large amounts of CPU and memory. If they share resources with the frontend, one person running a forecast would cause every other user's page to freeze. Separating them allows the frontend and ML API to scale independently.

4. **Deployment flexibility:** Changing a button color on the frontend doesn't require redeploying the entire ML API. Deploy separately — change one part, deploy that part.

> **Possible interview follow-up:**
> "Why not merge Supabase and Edge Functions?"
> Supabase itself is a managed service — you don't manage its servers. Edge Functions are serverless functions provided by Supabase, running on its infrastructure. They're naturally separate. The benefit of Edge Functions is that you don't need to maintain your own Node.js server — just write a function, upload it, and it works.

---

## 10-2: Frontend Service Layer — The Role of a Translator

### Why Does the Frontend Need a Service Layer?

Frontend components (the buttons, tables, and charts you see) shouldn't know API details. Just like a customer doesn't need to know how the kitchen chops vegetables — you just order, and the waiter handles the rest.

The DI frontend's \\`src/services/\\` directory has 31 subdirectories. You don't need to memorize all of them. What matters is understanding what the Service layer does: **It's the translator between frontend components and backend APIs.**

### Five Most Important Services

**1. chat/ — The translator that listens to you**

When you type anything in the chat box, \\`chatIntentService.js\\` first analyzes your intent:

- You say "forecast Q2 demand" → it translates to \\`{ intent: 'RUN_FORECAST' }\\`
- You say "create a procurement plan" → translated to \\`{ intent: 'RUN_PLAN' }\\`
- You say "good morning" → translated to \\`{ intent: 'GREETING' }\\` (no need to call an AI model — just reply directly, saving money)

It also has a confidence score. If the score is below 0.7, meaning it's not sure what you want, it will ask you again.

**2. planning/ — The planning engine**

\\`chatPlanningService.js\\` is the core of procurement planning. It:
- Reads the data you uploaded
- Applies constraints (budget limits, minimum order quantities)
- Calls the ML API's solver for optimization
- Produces plan tables, inventory projections, and cost analyses

**3. aiEmployee/ — The Worker's brain**

\\`orchestrator.js\\` is the Worker's command center. It manages the task lifecycle:
- Decomposes tasks into steps (profile → forecast → optimize → risk → report)
- Executes step by step
- Checks quality after each step
- Produces artifacts (deliverables) and pushes them to the Canvas

**4. data-prep/ — The data steward**

\\`chatDatasetProfilingService.js\\` is responsible for "reading" the data you upload:
- Auto-detects column types (numeric, date, text)
- Identifies missing values and outliers
- Suggests column mappings ("Column_A appears to be a product ID")

**5. risk/ — The risk gatekeeper**

\\`riskAdjustmentsService.js\\` adds risk considerations to plans:
- Supplier reliability scoring
- Safety stock adjustments
- Stockout cost estimation

### Service Layer Design Philosophy

A well-designed Service layer lets components call functionality simply without knowing the complex logic behind it. For example, a component only needs to call \\`runForecast(datasetId)\\` without knowing that it first validates data, then calls the ML API, then processes the response format.

> **Possible interview follow-up:**
> "Aren't 31 services too many? How do you decide when to split into a new service?"
> This is the "cohesion vs coupling" trade-off. Each service is responsible for a clear domain (forecast, risk, planning), with high internal cohesion. Services minimize dependencies on each other. If a service does too many unrelated things (e.g., forecast service contains risk logic), it should be split out.

---

## 10-3: Supabase Layer — The Refrigerator and Ledger

### What Does Supabase Do in the DI System?

Supabase is a Backend-as-a-Service platform. In plain terms: it handles your backend infrastructure so you don't have to set up your own server. DI uses it for five things:

| Function | Plain Explanation | Analogy |
|------|---------|------|
| **Auth** | Manages user login/logout | Building access card system |
| **PostgreSQL** | Stores all data (sales records, task records, Worker settings) | Refrigerator + filing cabinet |
| **Storage** | Stores user-uploaded files (Excel, CSV) | Storage room |
| **Edge Functions** | Small programs running on Supabase servers | Waiters (detailed below) |
| **RPC** | Remote procedure calls — execute functions in the database | Press a button and the warehouse auto-ships |

### Edge Functions — Why Do We Need a "Middleman"?

Edge Functions are TypeScript programs running on Supabase servers. Their most important role is **acting as a middleman**.

**ai-proxy — The Most Critical Edge Function**

Your browser needs to call Gemini (Google's AI model), but calling Gemini requires an API key. The problem is:

- Frontend JavaScript code is completely public
- If the API key is in the frontend, anyone opening the browser DevTools → Sources can see it
- If someone gets your API key, they can use your money to call Gemini

So DI's approach is: the frontend doesn't call Gemini directly, but instead calls the \\`ai-proxy\\` Edge Function. ai-proxy runs on Supabase's server, it has the API key (securely stored via \\`supabase secrets set\\`), it calls Gemini on your behalf, then returns the results to the frontend.

ai-proxy supports multiple AI model providers:
- **Gemini** — Google's model (default advanced model uses gemini-3.1-pro-preview, fast model uses gemini-2.5-flash)
- **DeepSeek** — Open-source large model (includes deepseek-reasoner for reasoning)
- **Anthropic (Claude)** — Anthropic's model
- **OpenAI (GPT)** — OpenAI's model
- **Kimi** — Moonshot AI's model

**Other Edge Functions**

| Function | What It Does | Plain Explanation |
|------|--------|------|
| \\`bom-explosion\\` | BOM (Bill of Materials) explosion calculation | "Making one chair requires 4 legs + 1 seat + 8 screws" — decomposing a finished product into the quantities of all required parts |
| \\`sync-materials-from-sap\\` | Sync material data from SAP | Pull the latest material master data from the ERP system |
| \\`sync-demand-fg-from-sap\\` | Sync demand data from SAP | Pull finished goods sales demand data |
| \\`sync-inventory-from-sap\\` | Sync inventory data from SAP | Pull current inventory levels |
| \\`ai-employee-scheduler\\` | Worker task scheduling | Schedule tasks for Workers on a timer |
| \\`etl-scheduler\\` | Data pipeline scheduling | Run data sync and transformation on a schedule |

### Database Migrations — Moving House in Order

DI's PostgreSQL database has 72+ migration files. What is a migration?

Imagine you're moving into a new house. You wouldn't move all the furniture in at once — you'd do it in order:
1. Sofa first (base schema)
2. Then the dining table (supplier KPI tables)
3. Then install bookshelves (import tracking tables)
4. ...

Each migration is one moving step. They have strict ordering because later ones may depend on earlier ones. For example, the "import tracking table" needs the user table from the "base schema" to set up foreign keys.

If the order is wrong (installing bookshelves before moving the sofa), the database will throw errors (like a bookshelf with no wall to lean against).

> **Possible interview follow-up:**
> "Why use Supabase Edge Functions instead of your own Node.js server?"
> It saves operational overhead. Running your own server means handling scaling, load balancing, SSL certificates, and monitoring. Edge Functions are serverless — you just write code, and Supabase manages the infrastructure. For an early-stage product (v1), this is the right trade-off: spend time on product logic, not on DevOps.

---

## 10-4: ML API — The Head Chef's Kitchen

### Why Do We Need a Standalone ML API?

The ML API is a Python application built with FastAPI, running in a Docker container. Its entry file is \\`src/ml/api/main.py\\`.

Why not put ML logic in the frontend or Supabase? Three reasons:

1. **Language limitations:** Prophet, LightGBM, OR-Tools are all Python packages. Browsers run JavaScript, Edge Functions run TypeScript/Deno. You can't bake a cake in a microwave — Python tools must run in a Python environment.

2. **Computational demands:** ML prediction and solver computation consume large amounts of CPU and memory. A single solving task might run for 90 seconds. If this computation runs in your browser, your computer's fans will spin wildly and other tabs will freeze.

3. **Deployment flexibility:** When the ML model is updated, you only need to redeploy the ML API Docker container — no need to touch the frontend or Supabase.

### What's Inside the ML API?

**Forecasting Models — More Than One**

DI doesn't rely on a single model for forecasting. It has a "model factory" (ForecasterFactory) supporting multiple models:

| Model | Best For | Plain Explanation |
|------|---------|------|
| **Prophet** | Time series with clear seasonality | Developed by Facebook; excels at capturing cyclical patterns (e.g., Christmas sales spikes) |
| **LightGBM** | Predictions influenced by many external factors | Gradient boosting model that considers many variables (weather, promotions, competitor pricing) |
| **ETS** | Simple, stable time series | Exponential smoothing — like a moving average but smarter |
| **XGBoost** | Similar to LightGBM but more stable | Another gradient boosting model |
| **Chronos** | Zero-shot forecasting (no training needed) | Hugging Face model, but disabled by default because PyTorch is too heavy |

**Solver Engine — Finding the Optimal Solution**

After forecasting demand, you need to calculate the "optimal procurement plan." This is what the optimization solver does: find the lowest-cost plan while satisfying all constraints (budget, minimum order quantities, lead times).

| Engine | Plain Explanation | Availability |
|------|------|--------|
| **heuristic** | Quick estimate, not necessarily optimal | Always available (fallback) |
| **ortools** | Google's optimization toolkit; good quality and fast | Default |
| **gurobi** | Industry's top-tier solver | Requires a commercial license (paid) |
| **cplex** | IBM's solver, on par with Gurobi | Requires a commercial license |

The production environment defaults to \\`ortools\\` (free and good enough); clients with a Gurobi license can switch.

**Middleware — Security Check Before Entering the Kitchen**

Every request goes through four layers of middleware before reaching the ML API:

1. **JWT Auth** — Verify you're a legitimate user (concert wristband: given at entry, scanned each time you pass through)
2. **Rate Limiting** — Limit call frequency (amusement park queue: don't let too many people ride the roller coaster at once)
3. **Tenant ID** — Confirm which company you belong to (apartment building: make sure you can only enter your own unit)
4. **CORS** — Confirm the request comes from a legitimate website (doorman: only lets residents and registered guests in)

> **Possible interview follow-up:**
> "Why default to ortools instead of heuristic?"
> Heuristic is fast but doesn't necessarily find the optimal solution. ortools uses constraint programming, which can guarantee finding the optimal or near-optimal solution under constraints. For supply chain planning, a 5% optimization gap could mean tens of thousands of dollars in difference.

---

## 10-5: Three Request Flows — A Complete Walkthrough

### Flow 1: AI-Assisted Analysis ("Analyze why sales dropped")

**User story:** Mei types in the chat box: "Analyze why March sales dropped by 15%."

\\`\\`\\`
1. Browser → chatIntentService parses intent
2. Intent is "analyze" → needs AI thinking → calls ai-proxy Edge Function
3. ai-proxy calls Gemini with the API key
4. Gemini analyzes the data and responds
5. Response passes through ai-proxy back to the browser
6. Chat panel displays the analysis results
\\`\\`\\`

**Key point:** The browser never knows Gemini's API key. ai-proxy is the secure middleman.

### Flow 2: Data Upload and Write (Uploading an Excel Report)

**User story:** Mei drags this month's sales report into the workspace.

\\`\\`\\`
1. Browser → file uploaded to Supabase Storage
2. chatDatasetProfilingService reads the file, detects columns
3. Results stored in Supabase PostgreSQL (dataset_profiles table)
4. Import history recorded in import_batches table (audit trail)
5. Frontend displays "Upload complete — detected 12 columns, 3,500 records"
\\`\\`\\`

**Key point:** Data writes require transactionality (all succeed or all fail) and an audit trail, so they go through Supabase.

### Flow 3: Forecasting and Optimization ("Create a procurement plan for me")

**User story:** Mei types in the chat box: "Use this data to create a Q2 procurement plan with a budget cap of 1 million."

\\`\\`\\`
1. Browser → chatIntentService parses: RUN_PLAN
2. chatPlanningService reads data from Supabase
3. Request sent to ML API
4. ML API's orchestrator begins executing steps:
   a. Data validation (confirm correct format)
   b. Demand forecasting (Prophet runs time series)
   c. Optimization solving (ortools calculates the procurement plan)
   d. Risk assessment (supplier scoring, stockout risk)
   e. Report generation (Decision Brief + Evidence Pack)
5. Each step's results return to the frontend → Canvas automatically opens the corresponding Widget
6. Task enters "waiting for review" state
\\`\\`\\`

**Key point:** This is the most complex flow, involving all four architecture layers. ML computation can't happen in the browser, so it must go to the ML API.

### Why Distinguish Three Flows?

Different operations have different requirements:

| Requirement | Flow 1 (AI Analysis) | Flow 2 (Data Write) | Flow 3 (Forecast/Solve) |
|------|-----------------|-----------------|-----------------|
| Needs API key? | Yes (AI model) | No | No (ML API has its own) |
| Needs Python? | No | No | Yes (Prophet, ortools) |
| Needs transactionality? | No | Yes (all-or-nothing) | Yes |
| Time required? | A few seconds | A few seconds | Possibly tens of seconds to minutes |

> **Possible interview follow-up:**
> "If the ML API goes down, can other features still work?"
> Yes. Chat and AI analysis use Flow 1 (doesn't go through ML API), data upload uses Flow 2 (also doesn't go through ML API). Only forecasting and planning features are affected. This is the benefit of a layered architecture — one layer going down doesn't take down the entire system.

---

## 10-6 (Boss): Draw the Architecture

### Scenario

The interviewer asks:

> "Can you draw the Decision Intelligence system architecture? It doesn't need to be fancy — whiteboard level is fine. Then explain each layer's responsibilities."

### Your Task

1. Describe the overall architecture topology (you can describe it in words, as if drawing on a whiteboard)
2. Explain each layer's responsibilities
3. Name 2 specific files or modules per layer and explain their roles
4. Explain at least one of the three main request flows

### Evaluation Criteria

- Correctly describes the four-layer architecture
- Can name specific module names (not just abstract concepts)
- Understands why layers are separated (can articulate the trade-offs)
- Can trace at least one complete request flow

### A Good Whiteboard Answer Looks Like This

"I'll draw four boxes. At the top is the React frontend, where users interact. It has two important parts: chatIntentService, which translates natural language into system commands, and Canvas, which displays Worker outputs in real time.

In the middle there are two boxes. One is Supabase, managing the database, user authentication, and file storage. The other is Edge Functions — the most important being ai-proxy, the secure middleman for frontend AI model calls. API keys are stored only here; the browser never touches them.

At the bottom is the FastAPI ML API, running in a Docker container. It handles demand forecasting (using Prophet) and procurement plan optimization (using ortools). These are Python tools that can only run in a Python environment.

Why four layers? Three reasons: Security — API keys can't be exposed in the frontend; Technical limitations — Python tools can't run in the browser; Scalability — ML computation is resource-intensive and needs to scale independently.

For request flow, take forecasting as an example: user types in the chat box → chatIntentService parses the intent → calls ML API → Prophet runs the forecast → results return → Canvas automatically opens the chart. For AI analysis, it goes through ai-proxy → Gemini. The two paths are separate — if the ML API goes down, AI analysis is unaffected."

"""

    static let zhWorld11: String = """

# World 11：部署與執行環境

> **目標：** 理解 DI 系統怎麼從你的電腦搬到全世界都能用的地方，Docker 在幹嘛，環境變數怎麼管
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 11-1：部署拓撲 — 把軟體搬到線上

### 什麼是「部署」？

你在自己的電腦上寫好了程式，\\`npm run dev\\` 一跑就能看到畫面。但這只有你自己看得到。**部署就是把你的軟體搬到別人也能用的地方。**

DI 系統有三個部分要搬，每個部分搬法不一樣：

### 三個部分，三種搬法

**1. 前端（React）→ 搬到 CDN**

前端經過 \\`npm run build\\` 之後，會產出一堆靜態檔案（HTML、CSS、JavaScript）。這些檔案不需要 server 來「跑」，只需要一個地方來「放」。

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

\\`\\`\\`
1. Supabase → 先建好資料庫和 Auth（地基）
2. Edge Functions → 部署到 Supabase（安裝水電）
3. ML API → 部署 Docker 容器（搬進主廚和廚房設備）
4. 前端 → 部署到 CDN（開門營業）
\\`\\`\\`

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

安裝套件的時候，Dockerfile 會刻意跳過三個很大的套件：\\`torch\\`、\\`transformers\\`、\\`accelerate\\`。這三個是 Chronos（零樣本預測模型）需要的，加起來超過 2 GB。預設不需要它們，所以不打包。

**階段 2：Runtime（只帶必要的）**

從一個乾淨的 Python 3.12 開始，只帶上：
- libgomp1（執行時需要的）
- 階段 1 已經安裝好的 Python 套件（直接複製過來）
- 你的原始碼（\\`src/\\` 和 \\`run_ml_api.py\\`）

最終的 Docker image 大約 800 MB，而不是含 Chronos 的 3-4 GB。

### 為什麼要這樣？

| 方面 | 不用 Multi-Stage | 用 Multi-Stage |
|------|-----------------|----------------|
| Image 大小 | ~2 GB（含編譯工具） | ~800 MB（只含執行必要的） |
| 安全性 | 有 gcc 等攻擊面 | 攻擊面最小 |
| 部署速度 | 慢（要傳更大的 image） | 快 |

### 啟動命令

Docker 容器啟動後跑的是：

\\`\\`\\`
gunicorn ml.api.main:app
  --worker-class uvicorn.workers.UvicornWorker
  --bind 0.0.0.0:8000
  --workers 2
  --timeout 120
  --keep-alive 30
\\`\\`\\`

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

以 \\`VITE_\\` 開頭的變數會被 Vite 打包進前端的 JavaScript 裡。**任何人**打開瀏覽器 DevTools 都看得到。所以只能放**公開資訊**：

\\`\\`\\`
VITE_SUPABASE_URL=https://xxx.supabase.co     # Supabase 的地址（公開的）
VITE_SUPABASE_ANON_KEY=eyJhbGci...             # 匿名 key（搭配 RLS 是安全的）
VITE_ML_API_URL=http://127.0.0.1:8000         # ML API 的地址
\\`\\`\\`

**2. Edge Function Secrets（保險箱密碼 — 只有伺服器知道）**

AI 模型的 API key 透過 \\`supabase secrets set\\` 存放在 Supabase 的安全存儲裡。只有 Edge Function 在執行時才能讀取，瀏覽器永遠碰不到：

\\`\\`\\`
GEMINI_API_KEY=sk-...
DEEPSEEK_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-...
OPENAI_API_KEY=sk-...
KIMI_API_KEY=sk-...
\\`\\`\\`

為什麼不能放在 \\`.env.local\\`？因為 \\`.env.local\\` 裡以 \\`VITE_\\` 開頭的東西會被打包進前端。就算不以 \\`VITE_\\` 開頭，\\`.env.local\\` 也是給前端用的。API key 必須只存在伺服器端。

**3. ML API 環境變數（廚房的設定 — 只有後端知道）**

ML API 的 Docker 容器有自己的環境變數：

\\`\\`\\`
DI_DATABASE_URL=postgresql://...       # 資料庫連線
DI_SOLVER_ENGINE=ortools               # 用哪個求解器
DI_CHRONOS_ENABLED=false               # 關閉重量級模型
ALLOWED_ORIGINS=http://localhost:5173   # 允許的前端地址
\\`\\`\\`

### Execution Guardrails — 安全閥

\\`\\`\\`
DI_MAX_ROWS_PER_SHEET=2000000   # 每張表最多 200 萬筆
DI_MAX_SKUS=5000                 # 最多 5,000 個 SKU
DI_SOLVER_MAX_SECONDS=90         # 求解最多 90 秒
DI_BOM_MAX_EDGES=200000          # BOM 最多 20 萬條邊
DI_FORECAST_MAX_SERIES=5000      # 預測最多 5,000 個序列
\\`\\`\\`

這些是用環境變數控制的**安全閥**。為什麼不寫死在程式碼裡？因為不同的部署環境可能需要不同的上限。開發環境設小一點（跑得快），正式環境可以設大一點。

> 💡 **面試官可能會追問：**
> 「如果有人不小心把 GEMINI_API_KEY 提交到 Git，怎麼辦？」
> → 第一步：立刻在 Google Cloud Console 撤銷這個 key、產生一個新的。第二步：用 \\`git filter-branch\\` 或 BFG Repo-Cleaner 從 Git 歷史裡刪除它。只是刪掉檔案再 commit 沒用，Git 歷史裡還是有。

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

\\`./scripts/healthcheck.sh\\` — 開發者或 CI 用的快速檢查。跑一次會告訴你四個服務的狀態（Supabase、ML API、AI Proxy、Frontend），像是一份體檢報告。

**第 2 層：ML API 的 /healthz 和 /readyz（自動體檢）**

這是 Kubernetes 標準的兩個 endpoint：

- **\\`/healthz\\`（Liveness Probe）** — 「這個程式還活著嗎？」
  - 如果回不了 200 → 代表程式死了（可能卡死或崩潰）→ **重啟它**
  - 像護士確認病人還有呼吸

- **\\`/readyz\\`（Readiness Probe）** — 「準備好接客了嗎？」
  - 如果回不了 200 → 代表暫時不能處理請求（可能正在載入模型）→ **暫停送流量，但不重啟**
  - 像確認病人可以出院了

兩者的差別很重要：liveness 失敗 = 重啟（激烈手段），readiness 失敗 = 暫停流量（溫和手段）。

**第 3 層：Docker HEALTHCHECK（容器層體檢）**

\\`\\`\\`
每 30 秒檢查一次
給 60 秒的啟動寬限期（ML 模型載入需要時間）
連續失敗 3 次才判定不健康
\\`\\`\\`

為什麼給 60 秒寬限？因為 ML API 啟動時要載入模型和建立資料庫連線，這需要時間。如果一啟動就開始檢查，會誤判為「不健康」。

**第 4 層：前端的 systemHealthService（使用者看得到的）**

前端也有一個健康檢查服務，會從瀏覽器端 ping 各個服務。結果顯示在 Settings 頁面上，讓使用者（和你 demo 的時候）可以看到所有服務是不是都正常。

> 💡 **面試官可能會追問：**
> 「如果 ML API 的 readiness check 失敗了，使用者會看到什麼？」
> → 前端的 systemHealthService 會偵測到 ML API 不可用，Settings 頁面會顯示紅色警告。聊天功能和 AI 分析還能用（走 ai-proxy），但預測和計畫功能會暫時不可用。這就是分層架構的好處 — 一層有問題不影響其他層。

---

## 11-5：啟動與驗證 — 正確打開方式

### 單一命令啟動

\\`\\`\\`
./scripts/start.sh          # 完整啟動（前端 + 後端）
./scripts/start.sh --check  # 只做 preflight 檢查（不啟動）
./scripts/start.sh --backend # 只啟動後端
\\`\\`\\`

### Preflight 檢查 — 起飛前的安全檢查

飛機起飛前，機長會跑一份 preflight checklist。DI 的 \\`start.sh\\` 也一樣：

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
3. ML API 的 \\`/health/live\\` → 回傳 200
4. Settings 頁面 → 沒有紅色的 missing secret 警告
5. 上傳一個 sample data → 完整走一遍 Golden Path
6. \\`npm run build\\` → 通過（確認沒有編譯錯誤）
7. \\`npm run test:regression\\` → 通過（確認沒有改壞東西）

### 三個啟動階段

成熟的系統有三個啟動階段：

1. **Preflight**：檢查所有前置條件
2. **Startup**：啟動各個服務
3. **Verification**：確認所有服務都正常

跳過任何一個都可能出問題。最常見的錯誤是跳過 Preflight 直接啟動，然後 debug 半天才發現是環境變數沒設。

> 💡 **面試官可能會追問：**
> 「如果你要寫一份 deployment runbook 給新同事，最重要的三件事是什麼？」
> → 1. **順序**：先後端再前端。2. **Secrets**：確認所有 API key 都用 \\`supabase secrets set\\` 設好了，不是放在 .env.local。3. **驗證**：部署完一定要跑 \\`healthcheck.sh\\`，不能只看「網頁打得開」就覺得成功了。

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
- 是否知道 secrets 要用 \\`supabase secrets set\\`（不是放 .env）
- 是否有健康檢查的驗證步驟（不只是「網頁打得開」）
- 是否考慮了 migration 的順序性
- 是否提到環境變數的三種安全等級

"""

    static let enWorld11: String = """

# World 11: Deployment and Runtime Environment

> **Objective:** Understand how the DI system goes from your local machine to being accessible worldwide, what Docker does, and how environment variables are managed
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 11-1: Deployment Topology — Getting Software Online

### What Is "Deployment"?

You've written your code on your own machine, and \\`npm run dev\\` shows you the interface. But only you can see it. **Deployment is moving your software to a place where others can use it.**

The DI system has three parts to deploy, each with a different approach:

### Three Parts, Three Approaches

**1. Frontend (React) → Deploy to CDN**

After running \\`npm run build\\`, the frontend produces a set of static files (HTML, CSS, JavaScript). These files don't need a server to "run" — they just need a place to be "hosted."

CDN (Content Delivery Network) is that place. Imagine you've opened a chain of convenience stores, with a branch in every city — customers just go to the nearest one. A CDN copies your website files to servers all around the world, and users connect to the nearest one, making page loads fast.

Common CDNs: Netlify, Vercel, AWS S3 + CloudFront.

**2. Supabase → No Need to Deploy It Yourself**

Supabase is a managed service — you create an account, and it sets up the database, authentication, and Storage for you. All you need to do is:
- Set up the Supabase project
- Run SQL migrations (create your table structures)
- Deploy Edge Functions
- Set up secrets (API keys)

**3. ML API → Deploy to Docker Container**

The ML API is a Python program that needs a complete Python environment to run (Prophet, OR-Tools, etc.). You can't host it on a CDN like the frontend.

**Docker** is the solution. Imagine you're moving to another country — instead of packing items one by one (risking forgotten things), you pack your entire room into a **shipping container** — furniture, appliances, clothes, pots and pans all included. When you arrive, you open the container and you're ready to live.

A Docker container is the software equivalent: the Python environment, all packages, and your source code, all packaged together. No matter which server it's moved to, it just works.

### Deployment Order Matters

\\`\\`\\`
1. Supabase → Set up database and Auth first (the foundation)
2. Edge Functions → Deploy to Supabase (install plumbing and electricity)
3. ML API → Deploy Docker container (move in the head chef and kitchen equipment)
4. Frontend → Deploy to CDN (open for business)
\\`\\`\\`

Why this order? Because the frontend tries to connect to Supabase and the ML API when it starts up. If they're not ready, users will see a bunch of errors when they open the page. **Set up the backend first, then expose the frontend last** — just like finishing renovations before inviting guests.

> **Possible interview follow-up:**
> "Why not use Kubernetes?"
> For a v1 product, K8s complexity is too high. Docker + a simple container platform (Railway, Cloud Run) is sufficient. Only consider K8s when you need to manage multiple ML API instances and do auto-scaling. This is an example of "don't over-engineer."

---

## 11-2: Dockerfile — The Art of Packing

### Multi-Stage Build — Spread Everything Out, Then Slim Down

DI's Dockerfile uses a technique called **multi-stage build**. Using the packing analogy:

**Stage 1: Builder (Spread Everything Out)**

You lay out everything you might need on the bed:
- Python 3.12 (base environment)
- gcc, g++ (compilation tools — some Python packages need to compile C code during installation)
- libgomp1 (parallel computing library needed by Prophet and OR-Tools)
- All Python packages listed in requirements-ml.txt

Then install all packages. After installation, gcc and g++ are no longer needed — they're "tools," not "luggage."

**An important filtering step:**

During package installation, the Dockerfile deliberately skips three very large packages: \\`torch\\`, \\`transformers\\`, and \\`accelerate\\`. These three are needed by Chronos (the zero-shot forecasting model) and together exceed 2 GB. They're not needed by default, so they're not included.

**Stage 2: Runtime (Only Bring the Essentials)**

Starting from a clean Python 3.12 image, only bring:
- libgomp1 (needed at runtime)
- Python packages already installed in Stage 1 (copied directly)
- Your source code (\\`src/\\` and \\`run_ml_api.py\\`)

The final Docker image is approximately 800 MB, instead of the 3-4 GB it would be with Chronos.

### Why Do This?

| Aspect | Without Multi-Stage | With Multi-Stage |
|------|-----------------|----------------|
| Image size | ~2 GB (includes build tools) | ~800 MB (only runtime essentials) |
| Security | Has gcc and other attack surfaces | Minimal attack surface |
| Deployment speed | Slow (larger image to transfer) | Fast |

### Startup Command

When the Docker container starts, it runs:

\\`\\`\\`
gunicorn ml.api.main:app
  --worker-class uvicorn.workers.UvicornWorker
  --bind 0.0.0.0:8000
  --workers 2
  --timeout 120
  --keep-alive 30
\\`\\`\\`

In plain terms:
- **gunicorn** — A production-grade Python web server (for development you can use uvicorn, but production needs something more robust)
- **workers 2** — Run two worker processes to handle requests concurrently (like a restaurant with two chefs)
- **timeout 120** — A single request can take up to 120 seconds (ML computations can run long)
- **keep-alive 30** — Keep connections alive for 30 seconds (to avoid re-establishing connections every time)

> **Possible interview follow-up:**
> "Why set timeout to 120 seconds instead of the default 30?"
> Because ML computations (especially OR-Tools solving) can take up to 90 seconds. If the timeout is 30 seconds, the connection would drop before solving is complete, and users would see "504 Gateway Timeout." 120 seconds leaves a 30-second buffer.

---

## 11-3: Environment Variables — Key Management

### Three Types of Environment Variables, Three Security Levels

The DI system has three types of environment variables with completely different security levels:

**1. Frontend Environment Variables (Address plaques — everyone can see them)**

Variables prefixed with \\`VITE_\\` get bundled into the frontend's JavaScript by Vite. **Anyone** can see them by opening browser DevTools. So only **public information** can go here:

\\`\\`\\`
VITE_SUPABASE_URL=https://xxx.supabase.co     # Supabase address (public)
VITE_SUPABASE_ANON_KEY=eyJhbGci...             # Anonymous key (safe with RLS)
VITE_ML_API_URL=http://127.0.0.1:8000         # ML API address
\\`\\`\\`

**2. Edge Function Secrets (Safe combination — only the server knows)**

AI model API keys are stored in Supabase's secure storage via \\`supabase secrets set\\`. Only Edge Functions can access them at runtime; the browser can never touch them:

\\`\\`\\`
GEMINI_API_KEY=sk-...
DEEPSEEK_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-...
OPENAI_API_KEY=sk-...
KIMI_API_KEY=sk-...
\\`\\`\\`

Why not put them in \\`.env.local\\`? Because anything in \\`.env.local\\` prefixed with \\`VITE_\\` gets bundled into the frontend. Even without the \\`VITE_\\` prefix, \\`.env.local\\` is for the frontend. API keys must exist only on the server side.

**3. ML API Environment Variables (Kitchen settings — only the backend knows)**

The ML API Docker container has its own environment variables:

\\`\\`\\`
DI_DATABASE_URL=postgresql://...       # Database connection
DI_SOLVER_ENGINE=ortools               # Which solver to use
DI_CHRONOS_ENABLED=false               # Disable the heavyweight model
ALLOWED_ORIGINS=http://localhost:5173   # Allowed frontend addresses
\\`\\`\\`

### Execution Guardrails — Safety Valves

\\`\\`\\`
DI_MAX_ROWS_PER_SHEET=2000000   # Max 2 million rows per sheet
DI_MAX_SKUS=5000                 # Max 5,000 SKUs
DI_SOLVER_MAX_SECONDS=90         # Max 90 seconds for solving
DI_BOM_MAX_EDGES=200000          # Max 200,000 BOM edges
DI_FORECAST_MAX_SERIES=5000      # Max 5,000 forecast series
\\`\\`\\`

These are **safety valves** controlled via environment variables. Why not hardcode them? Because different deployment environments may need different limits. Set them smaller in development (runs faster), and larger in production.

> **Possible interview follow-up:**
> "What if someone accidentally commits GEMINI_API_KEY to Git?"
> Step one: immediately revoke the key in Google Cloud Console and generate a new one. Step two: use \\`git filter-branch\\` or BFG Repo-Cleaner to remove it from Git history. Simply deleting the file and committing again doesn't work — the Git history still contains it.

---

## 11-4: Health Checks — The System's Medical Report

### Why Are Health Checks Needed?

A running service can develop problems:
- Memory runs out
- Database connection breaks
- A bug causes a deadlock

You can't wait for users to call before discovering issues. **Health checks are automated checkups** that regularly confirm the system is alive and functioning normally.

### DI's Four-Layer Health Checks

**Layer 1: Shell Script (Manual Checkup)**

\\`./scripts/healthcheck.sh\\` — A quick check for developers or CI. Running it reports the status of four services (Supabase, ML API, AI Proxy, Frontend), like a medical report.

**Layer 2: ML API's /healthz and /readyz (Automated Checkup)**

These are two standard Kubernetes endpoints:

- **\\`/healthz\\` (Liveness Probe)** — "Is this process still alive?"
  - If it can't return 200 → the process is dead (possibly deadlocked or crashed) → **restart it**
  - Like a nurse checking if the patient is still breathing

- **\\`/readyz\\` (Readiness Probe)** — "Is it ready to serve requests?"
  - If it can't return 200 → it temporarily can't handle requests (possibly still loading models) → **stop sending traffic, but don't restart**
  - Like confirming a patient is ready to be discharged

The difference matters: liveness failure = restart (drastic measure), readiness failure = pause traffic (gentle measure).

**Layer 3: Docker HEALTHCHECK (Container-Level Checkup)**

\\`\\`\\`
Checks every 30 seconds
60-second startup grace period (ML model loading takes time)
3 consecutive failures before marking as unhealthy
\\`\\`\\`

Why the 60-second grace period? Because the ML API needs time to load models and establish database connections at startup. If checking starts immediately, it would falsely be judged as "unhealthy."

**Layer 4: Frontend systemHealthService (User-Visible)**

The frontend also has a health check service that pings each service from the browser side. Results are displayed on the Settings page, letting users (and you during demos) see whether all services are functioning normally.

> **Possible interview follow-up:**
> "If the ML API's readiness check fails, what does the user see?"
> The frontend's systemHealthService detects that the ML API is unavailable, and the Settings page displays a red warning. Chat functionality and AI analysis still work (via ai-proxy), but forecasting and planning features are temporarily unavailable. This is the benefit of a layered architecture — one layer having issues doesn't affect the others.

---

## 11-5: Startup and Verification — The Correct Way to Launch

### Single-Command Startup

\\`\\`\\`
./scripts/start.sh          # Full startup (frontend + backend)
./scripts/start.sh --check  # Preflight checks only (no startup)
./scripts/start.sh --backend # Backend only
\\`\\`\\`

### Preflight Checks — Pre-Flight Safety Inspection

Before takeoff, a pilot runs through a preflight checklist. DI's \\`start.sh\\` does the same:

1. Is Node.js installed? Correct version?
2. Is Python installed? Correct version?
3. Are all npm packages installed?
4. Does the .env.local file exist? Are all required variables present?
5. Can Supabase be reached?
6. Is the ML API port available? (No conflicts with other programs)

If any check fails, the system won't start — it tells you exactly what's wrong.

### Verification Checklist — How to Confirm Everything Works

After startup, how do you confirm the system is actually working?

1. Open browser → login page appears
2. Successful login → home page appears
3. ML API's \\`/health/live\\` → returns 200
4. Settings page → no red "missing secret" warnings
5. Upload sample data → complete the full Golden Path
6. \\`npm run build\\` → passes (confirms no compilation errors)
7. \\`npm run test:regression\\` → passes (confirms nothing is broken)

### Three Startup Phases

A mature system has three startup phases:

1. **Preflight**: Check all prerequisites
2. **Startup**: Start all services
3. **Verification**: Confirm all services are healthy

Skipping any phase can cause problems. The most common mistake is skipping Preflight and starting directly, then spending half a day debugging only to discover a missing environment variable.

> **Possible interview follow-up:**
> "If you were writing a deployment runbook for a new teammate, what are the three most important things?"
> 1. **Order**: Backend first, frontend last. 2. **Secrets**: Ensure all API keys are set via \\`supabase secrets set\\`, not placed in .env.local. 3. **Verification**: Always run \\`healthcheck.sh\\` after deployment — don't assume success just because "the webpage opens."

---

## 11-6 (Boss): Deployment Plan

### Scenario

Your team needs to set up a new staging environment for QA testing. You're asked to write a deployment runbook.

### Your Task

Write a step-by-step deployment plan that includes:
1. **Supabase setup** (create project, run migrations, ordering)
2. **Edge Function deployment** (which ones to deploy, how to set secrets)
3. **Frontend deployment** (build, env vars, hosting)
4. **ML API deployment** (Docker build, env vars, health probes)
5. **Verification steps** (how to confirm everything works)

### Evaluation Criteria

- Correct deployment order (backend first, frontend last)
- Knows that secrets must use \\`supabase secrets set\\` (not .env)
- Includes health check verification steps (not just "the webpage opens")
- Considers migration ordering
- Mentions the three security levels of environment variables

"""

    static let zhWorld12: String = """

# World 12：工程品質信號

> **目標：** 理解 DI 怎麼確保程式碼品質、什麼是回歸測試、什麼是 Release Gate、AI 系統的 Guardrail 為什麼特別重要
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 12-1：測試金字塔 — 從零件到整車

### 用一個比喻理解測試

你買了一台新車。出廠前，車廠做了哪些測試？

1. **零件檢查（Unit Test）** — 每個螺絲、每個燈泡、每個煞車片都個別測過。數量最多、速度最快。
2. **組裝測試（Integration Test）** — 引擎裝上車身後，確認它們合在一起能正常運作。數量中等。
3. **整車試駕（E2E Test）** — 請一個人坐進去，啟動、加速、煞車、轉彎，走一圈完整的路線。數量最少但最接近真實。

這就是「測試金字塔」：底部是大量的 unit test（快、便宜），頂部是少量的 E2E test（慢、貴但全面）。

### DI 的測試層級

DI 有七層測試。聽起來很多，但每一層都有明確的目的：

| 層級 | 工具 | 測什麼 | 類比 |
|------|------|--------|------|
| **Unit Tests** | Vitest | 單一函數正不正確 | 檢查每個螺絲 |
| **Component Tests** | Vitest | React 元件渲染正不正確 | 檢查儀表板組裝 |
| **Regression Tests** | Pytest | ML 模型的結果有沒有變壞 | 確認引擎性能沒退化 |
| **Guardrail Tests** | Vitest/Pytest | AI Worker 有沒有越權 | 確認安全氣囊有效 |
| **DW Gate Tests** | Vitest | Digital Worker 核心流程正不正確 | 確認自動駕駛能用 |
| **E2E Tests** | Playwright | 使用者完整流程跑得通嗎 | 整車試駕 |
| **v1 Gate Tests** | Playwright | v1 發佈標準達到了嗎 | 出廠品管認證 |

### 前端 vs 後端的測試分工

**前端測試（JavaScript/Vitest）：**
- \\`src/domains/\\` 裡的領域邏輯 — 例如「計算採購建議」的邏輯
- \\`src/utils/\\` 裡的工具函數 — 例如日期轉換、數字格式化
- \\`src/services/\\` 裡的 service 邏輯 — 例如意圖解析
- \\`src/components/\\` 裡的 UI 元件 — 例如圖表、表格

**後端測試（Python/Pytest）：**
- ML 模型預測結果 — 確認用相同數據得到相同結果
- 求解器引擎 — 確認最佳化結果品質
- API 安全 — 確認沒有權限的人不能做敏感操作
- 治理規則 — 確認 governance 邏輯正確

> 💡 **面試官可能會追問：**
> 「如果時間不夠，只能選一種測試，你選哪一種？」
> → 看產品階段。如果是 MVP/v1，我會優先選 **E2E smoke test** — 確保核心流程（上傳 → 預測 → 計畫 → 審核）走得通。如果是成熟產品，我會優先選 **regression test** — 確保不會因為改了一行程式碼就讓模型結果變差。

---

## 12-2：回歸測試 — 確認沒有改壞東西

### 什麼是回歸測試？

你修了一個 bug，結果另一個地方壞了。這叫做「回歸」（regression）— 軟體品質倒退了。

**回歸測試就是用來防止這件事的：** 每次改程式碼後，跑一遍固定的測試，確認「原本能跑的東西還是能跑」。

### DI 的回歸測試有什麼特別？

普通軟體的回歸測試很簡單：輸入 A → 預期輸出 B → 實際輸出是 B 嗎？

但 DI 有 **ML 模型**。ML 模型的輸出是浮點數（像 0.15234），不是精確的字串。你不能說「預測值必須等於 42.57」，因為模型每次訓練可能有微小差異。

所以 DI 的回歸測試用的是**品質指標**而不是精確值：

- **MAPE（Mean Absolute Percentage Error）** — 預測誤差百分比。MAPE < 0.15 代表誤差在 15% 以內，合格。
- **Pinball Loss** — 量化區間預測的品質
- **Bias** — 預測是偏高還是偏低

**Deterministic Fixtures：**

為了讓結果可重現，測試用的數據是固定的（不是隨機生成的）。Python 環境甚至設了 \\`PYTHONHASHSEED=0\\` 來消除隨機性。同一組數據 + 同一個模型 → 應該得到一模一樣的結果。

### 回歸結果怎麼看？

\\`\\`\\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    }
  ]
}
\\`\\`\\`

這份報告告訴你：72 個測試跑了 70 個通過，2 個失敗。其中一個是因為預測誤差（MAPE 0.23）超過了門檻（0.15）。

**看到這個你該怎麼想？**
1. 不能部署 — 有 2 個失敗
2. 要調查為什麼 MAPE 變大了 — 是不是數據變了？模型被改了？
3. 如果短期修不好，考慮替代方案 — rollback 到上一版、或暫時關掉那個功能

> 💡 **面試官可能會追問：**
> 「MAPE 0.23 代表什麼？嚴不嚴重？」
> → MAPE 0.23 代表預測平均偏離實際值 23%。嚴不嚴重要看場景。如果是便利商店的飲料預測，23% 可能 OK。如果是精密零件的採購計畫，23% 可能代表幾十萬的庫存成本差異。DI 的門檻設在 15%，所以 23% 被判定為失敗。

---

## 12-3：Release Gate — 出廠前的品管關卡

### 什麼是 Release Gate？

你的車組裝好了，但不能直接開出工廠。要先通過一系列品管檢查。**Release Gate 就是軟體的品管關卡 — 只有全部通過，程式碼才能部署到正式環境。**

### DI 的三道關卡

**第 1 道：Artifact Quality Gate（產出物品質）**

檢查 ML 模型的品質指標：
- MAPE < 門檻 ✅
- 測試覆蓋率 > 門檻 ✅
- Bias 在合理範圍 ✅

只要有一個不合格，就不能過關。

**第 2 道：Regression Suite（回歸測試）**

所有回歸測試都要通過。跟上一版的 baseline 比較，確認沒有退化。

**第 3 道：Canary Check（金絲雀測試）**

部署到正式環境之前，先給一小部分使用者用。如果這些人遇到問題，馬上回滾（rollback）。就像礦坑裡的金絲雀 — 如果金絲雀死了，代表空氣有毒，人不能進去。

### CI Pipeline 的執行順序

\\`\\`\\`
lint → test:run → test:dw-gate → test:v1-gate → build
\\`\\`\\`

每一步失敗都會阻止後續步驟。白話講：
1. **lint** — 程式碼格式有沒有問題？（語法檢查）
2. **test:run** — 基本測試都過了嗎？
3. **test:dw-gate** — Digital Worker 的核心功能正常嗎？
4. **test:v1-gate** — v1 的發佈標準達到了嗎？
5. **build** — 能不能成功打包？

### GitHub Actions 裡長什麼樣？

DI 的 \\`.github/workflows/\\` 有幾個重要的 CI workflow：

**ml-ci.yml** — ML 模型測試
- 每次有人改 \\`src/ml/\\` 底下的程式碼，自動觸發
- 跑 unit test、drift 監控、回歸測試
- timeout 20 分鐘（ML 測試需要時間）
- 用固定的隨機種子：\\`PYTHONHASHSEED=0\\`、\\`OMP_NUM_THREADS=1\\`（確保結果可重現）

**phase4-guardrails.yml** — 治理測試
- 每次有人改 governance 相關程式碼，自動觸發
- 確認權限控制、模型註冊表、升級閘門都正常

**planning-regression.yml** — 求解器回歸測試
- 確認 solver 的結果沒有退化

> 💡 **面試官可能會追問：**
> 「如果 CI 過了，是不是代表可以安心部署了？」
> → CI 通過是**必要條件但不是充分條件**。CI 是在模擬環境裡跑的，可能缺少正式環境才有的數據、流量、或邊界條件。所以除了 CI，還需要 canary 部署和生產監控。

---

## 12-4：E2E 與 Smoke Test — 整車試駕

### Smoke Test — 能不能點燃？

Smoke Test 的名字來自硬體工程：新的電路板通電時，如果冒煙了（smoke），代表有問題。

DI 的 Smoke Test（\\`e2e/smoke.spec.js\\`）做的是最基本的檢查：
- 頁面能載入嗎？
- 主要元素都在嗎？
- 沒有 JavaScript 錯誤嗎？

**如果 smoke test 都過不了，就不用跑更深入的測試了。**

### E2E Flow Tests — 模擬使用者操作

DI 用 Playwright（一個瀏覽器自動化工具）來模擬使用者的完整操作流程：

| 測試 | 做什麼 |
|------|--------|
| upload flow | 模擬上傳 Excel → 確認數據被正確匯入 |
| chat flow | 模擬在聊天框輸入指令 → 確認 AI 有回應 |
| full flow | 從上傳到預測到計畫到審核，跑一遍完整的 Golden Path |
| upload-chat | 上傳後馬上在聊天框下指令 |

### v1 Gate Test — 發佈門檻

\\`npm run test:v1-gate\\` 是最嚴格的測試，驗證三個核心流程：

1. **upload-to-plan** — 從上傳到產出計畫，完整鏈路
2. **revise** — 修訂流程（主管要求修改 → Worker 重新執行）
3. **approve-audit** — 批准 + 審計追蹤（批准後能不能看到完整歷史）

這三個測試代表了 Golden Path 的核心。如果這三個過了，系統的核心功能就是正常的。

### Live Worker Test — 用真的 AI

\\`npm run test:live\\` 會真的呼叫 LLM（Gemini/DeepSeek）。這比 mock 測試更接近真實，但也更慢、更貴。適合在正式發佈前做最後確認。

> 💡 **面試官可能會追問：**
> 「E2E 測試很慢很貴，為什麼還需要？」
> → 因為 unit test 和 integration test 可能各自都通過，但組合在一起卻不 work。比如 chatIntentService 正確解析了意圖，ML API 正確跑了預測，但前端的 Canvas 沒有正確顯示結果 — 這種問題只有 E2E 才能發現。

---

## 12-5：Guardrail 測試 — AI 的安全氣囊

### 為什麼 AI 系統需要特別的測試？

一般軟體的 bug 是「功能壞了」— 按鈕點了沒反應、數字算錯了。使用者會看到，你會收到 bug report。

AI 系統的問題更隱蔽：**AI 可能做了一些「看起來合理但其實不該做」的事。** 比如：
- Worker 明明是 A2 等級（需要人事後審核），但它自動執行了不該自動做的操作
- 模型的精度慢慢退化了，但因為退化是漸進的，沒人注意到
- 自動化流程繞過了人工審核的閘門

**Guardrail 測試就是確保這些事不會發生。** 它測的不是「功能有沒有」，而是「限制有沒有生效」。

### DI 的 Guardrail 測試

| 測試 | 驗什麼 |
|------|--------|
| Action Guardrails | Worker 的每個動作是否在允許範圍內（不能越權） |
| Governance Controls | 治理規則是否被正確執行（批准流程不能被跳過） |
| API Guards | ML API 的安全檢查是否正確（未授權的請求被擋掉） |
| Promotion Gate | 模型升級是否通過品質閘門（不能把壞模型推上線） |
| Registry Guards | 模型註冊表的操作是否合規（不能隨便刪除或修改已發佈的模型） |

### Phase 4 Guardrails — 最嚴格的一關

\\`npm run test:phase4-guardrails\\` 涵蓋整個治理系統：
- 權限控制：沒有權限的人嘗試做敏感操作 → 被拒絕 ✅
- 模型生命週期：模型從訓練 → 驗證 → 上線 → 退役，每一步都有閘門 ✅
- 重新訓練觸發：模型精度下降到門檻以下 → 自動觸發重新訓練 ✅
- 升級閘門：新模型必須比舊模型好才能取代 ✅

### 為什麼 Guardrail 比功能測試更重要？

> **功能壞了，使用者會看到。Guardrail 壞了，可能沒人發現——直到出大事。**

如果預測功能壞了，使用者會說「跑不了」，你會馬上修。但如果自主等級的控制邏輯壞了，Worker 可能在不該自動執行的時候自動執行了，而且「看起來一切正常」— 因為它確實執行了，只是不該那樣做。

> 💡 **面試官可能會追問：**
> 「你們怎麼確保 AI 不會做出超出預期的事？」
> → 三道防線：1. **程式碼層面** — 狀態機確保任務只能按合法的順序轉換。2. **政策層面** — ApprovalPolicy 定義什麼動作需要人批准，writeback 在 v1 永遠需要。3. **測試層面** — Guardrail 測試每次 CI 都跑，確保這些限制沒有被意外移除。

---

## 12-6（Boss）：品質報告

### 情境

你收到一份 regression_result.json：

\\`\\`\\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    },
    {
      "test": "test_inventory_risk_threshold",
      "reason": "Risk score 0.82 exceeds safe threshold 0.75"
    }
  ]
}
\\`\\`\\`

### 你的任務

1. 你會把這個版本推到正式環境嗎？為什麼？
2. 你會怎麼調查這兩個失敗？
3. 如果這兩個問題短期修不好，你有什麼替代方案？

### 評估標準

- 是否明確說**不推**（2 個失敗 = Release Gate 沒過）
- 是否能解讀指標（MAPE 0.23 代表預測偏差 23%；Risk score 0.82 代表風險指標超標）
- 調查步驟是否系統化：
  1. 先看是不是數據問題（測試數據有沒有被改？）
  2. 再看是不是程式碼問題（最近誰改了預測邏輯？用 git blame 查）
  3. 最後看是不是環境問題（Python 版本？套件版本？）
- 替代方案是否務實：
  - **rollback** — 退回上一個通過的版本
  - **feature flag** — 關掉出問題的功能，其他功能繼續部署
  - **hotfix** — 只修這個 bug，做一個最小的修復

"""

    static let enWorld12: String = """

# World 12: Engineering Quality Signals

> **Objective:** Understand how DI ensures code quality, what regression testing is, what Release Gates are, and why Guardrails are especially important for AI systems
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 12-1: The Testing Pyramid — From Parts to the Whole Car

### Understanding Testing Through an Analogy

You bought a new car. What testing did the factory do before shipping it?

1. **Parts inspection (Unit Test)** — Every screw, every light bulb, every brake pad is tested individually. Highest quantity, fastest speed.
2. **Assembly testing (Integration Test)** — After the engine is mounted on the chassis, confirm they work correctly together. Medium quantity.
3. **Full car test drive (E2E Test)** — Someone gets in, starts the car, accelerates, brakes, turns, and drives a complete route. Fewest in number but closest to reality.

This is the "testing pyramid": the base has a large number of unit tests (fast, cheap), and the top has a few E2E tests (slow, expensive, but comprehensive).

### DI's Testing Layers

DI has seven testing layers. Sounds like a lot, but each one has a clear purpose:

| Layer | Tool | What It Tests | Analogy |
|------|------|--------|------|
| **Unit Tests** | Vitest | Individual functions work correctly | Checking every screw |
| **Component Tests** | Vitest | React components render correctly | Checking dashboard assembly |
| **Regression Tests** | Pytest | ML model results haven't degraded | Confirming engine performance hasn't declined |
| **Guardrail Tests** | Vitest/Pytest | AI Worker hasn't exceeded its authority | Confirming airbags work |
| **DW Gate Tests** | Vitest | Digital Worker core flows work correctly | Confirming autopilot is functional |
| **E2E Tests** | Playwright | Can the full user flow be completed? | Full car test drive |
| **v1 Gate Tests** | Playwright | Have v1 release standards been met? | Factory quality certification |

### Frontend vs Backend Test Division

**Frontend tests (JavaScript/Vitest):**
- Domain logic in \\`src/domains/\\` — e.g., "calculate procurement recommendation" logic
- Utility functions in \\`src/utils/\\` — e.g., date conversion, number formatting
- Service logic in \\`src/services/\\` — e.g., intent parsing
- UI components in \\`src/components/\\` — e.g., charts, tables

**Backend tests (Python/Pytest):**
- ML model prediction results — confirm same data yields same results
- Solver engines — confirm optimization result quality
- API security — confirm unauthorized users can't perform sensitive operations
- Governance rules — confirm governance logic is correct

> **Possible interview follow-up:**
> "If time is limited and you can only choose one type of test, which would you pick?"
> It depends on the product stage. For an MVP/v1, I'd prioritize **E2E smoke tests** — ensure the core flow (upload → forecast → plan → review) works end to end. For a mature product, I'd prioritize **regression tests** — ensure a single code change doesn't degrade model results.

---

## 12-2: Regression Testing — Making Sure Nothing Broke

### What Is Regression Testing?

You fix one bug, and something else breaks. This is called "regression" — software quality has regressed.

**Regression testing prevents this:** after every code change, run a fixed set of tests to confirm that "things that used to work still work."

### What's Special About DI's Regression Testing?

Normal software regression testing is straightforward: input A → expected output B → is the actual output B?

But DI has **ML models**. ML model outputs are floating-point numbers (like 0.15234), not exact strings. You can't say "the prediction must equal 42.57," because each training run may have slight variations.

So DI's regression tests use **quality metrics** instead of exact values:

- **MAPE (Mean Absolute Percentage Error)** — Prediction error percentage. MAPE < 0.15 means error is within 15% — pass.
- **Pinball Loss** — Quantifies the quality of interval predictions
- **Bias** — Whether predictions skew high or low

**Deterministic Fixtures:**

To make results reproducible, test data is fixed (not randomly generated). The Python environment even sets \\`PYTHONHASHSEED=0\\` to eliminate randomness. Same data + same model → should produce identical results.

### How to Read Regression Results

\\`\\`\\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    }
  ]
}
\\`\\`\\`

This report tells you: 72 tests ran, 70 passed, 2 failed. One failed because the prediction error (MAPE 0.23) exceeded the threshold (0.15).

**What should you think when you see this?**
1. Cannot deploy — there are 2 failures
2. Investigate why MAPE increased — did the data change? Was the model modified?
3. If it can't be fixed quickly, consider alternatives — rollback to the previous version, or temporarily disable that feature

> **Possible interview follow-up:**
> "What does MAPE 0.23 mean? Is it serious?"
> MAPE 0.23 means predictions deviate from actual values by an average of 23%. Whether it's serious depends on the scenario. For convenience store beverage forecasting, 23% might be OK. For precision parts procurement planning, 23% could mean hundreds of thousands in inventory cost differences. DI's threshold is set at 15%, so 23% is judged as a failure.

---

## 12-3: Release Gate — Quality Control Before Shipping

### What Is a Release Gate?

Your car is assembled, but it can't drive out of the factory yet. It must pass a series of quality checks first. **A Release Gate is software's quality control checkpoint — only when everything passes can code be deployed to production.**

### DI's Three Gates

**Gate 1: Artifact Quality Gate**

Checks ML model quality metrics:
- MAPE < threshold
- Test coverage > threshold
- Bias within acceptable range

If any one fails, it doesn't pass.

**Gate 2: Regression Suite**

All regression tests must pass. Compare against the previous version's baseline to confirm no degradation.

**Gate 3: Canary Check**

Before deploying to production, let a small subset of users try it first. If they encounter problems, immediately rollback. Like the canary in a coal mine — if the canary dies, the air is toxic, and people shouldn't enter.

### CI Pipeline Execution Order

\\`\\`\\`
lint → test:run → test:dw-gate → test:v1-gate → build
\\`\\`\\`

Each step's failure blocks subsequent steps. In plain terms:
1. **lint** — Any code formatting issues? (Syntax check)
2. **test:run** — Do basic tests pass?
3. **test:dw-gate** — Are Digital Worker core functions working?
4. **test:v1-gate** — Are v1 release standards met?
5. **build** — Can it be successfully bundled?

### What Does It Look Like in GitHub Actions?

DI's \\`.github/workflows/\\` has several important CI workflows:

**ml-ci.yml** — ML model tests
- Automatically triggered when anyone modifies code under \\`src/ml/\\`
- Runs unit tests, drift monitoring, and regression tests
- 20-minute timeout (ML tests take time)
- Uses fixed random seeds: \\`PYTHONHASHSEED=0\\`, \\`OMP_NUM_THREADS=1\\` (ensures reproducible results)

**phase4-guardrails.yml** — Governance tests
- Automatically triggered when anyone modifies governance-related code
- Confirms permission controls, model registry, and promotion gates all work correctly

**planning-regression.yml** — Solver regression tests
- Confirms solver results haven't degraded

> **Possible interview follow-up:**
> "If CI passes, does that mean it's safe to deploy?"
> CI passing is a **necessary but not sufficient condition**. CI runs in a simulated environment that may lack production-specific data, traffic, or edge cases. So beyond CI, you also need canary deployments and production monitoring.

---

## 12-4: E2E and Smoke Tests — Full Car Test Drive

### Smoke Test — Can It Start?

The name "Smoke Test" comes from hardware engineering: when a new circuit board is powered on, if it smokes, something's wrong.

DI's Smoke Test (\\`e2e/smoke.spec.js\\`) performs the most basic checks:
- Can the page load?
- Are the main elements present?
- Are there any JavaScript errors?

**If the smoke test doesn't pass, there's no point running deeper tests.**

### E2E Flow Tests — Simulating User Actions

DI uses Playwright (a browser automation tool) to simulate complete user workflows:

| Test | What It Does |
|------|--------|
| upload flow | Simulates uploading Excel → confirms data is correctly imported |
| chat flow | Simulates typing commands in the chat box → confirms AI responds |
| full flow | Runs the complete Golden Path from upload to forecast to plan to review |
| upload-chat | Uploads then immediately issues a command in the chat box |

### v1 Gate Test — Release Threshold

\\`npm run test:v1-gate\\` is the strictest test, verifying three core flows:

1. **upload-to-plan** — From upload to plan output, complete chain
2. **revise** — Revision flow (supervisor requests changes → Worker re-executes)
3. **approve-audit** — Approval + audit trail (after approval, can you see the complete history?)

These three tests represent the Golden Path's core. If all three pass, the system's core functionality is working.

### Live Worker Test — Using Real AI

\\`npm run test:live\\` actually calls LLMs (Gemini/DeepSeek). This is closer to reality than mock tests but also slower and more expensive. Suitable for final confirmation before a production release.

> **Possible interview follow-up:**
> "E2E tests are slow and expensive. Why are they still needed?"
> Because unit tests and integration tests may each pass individually, but fail when combined. For example, chatIntentService correctly parses the intent, ML API correctly runs the forecast, but the frontend Canvas doesn't correctly display the results — this kind of issue can only be caught by E2E tests.

---

## 12-5: Guardrail Tests — AI's Airbag

### Why Do AI Systems Need Special Testing?

Normal software bugs mean "features are broken" — a button doesn't respond, a number is calculated wrong. Users see it, you get a bug report.

AI system problems are more insidious: **AI might do things that "look reasonable but shouldn't have been done."** For example:
- A Worker at A2 level (requires human post-review) auto-executes an operation it shouldn't
- Model accuracy gradually degrades, but because the decline is gradual, nobody notices
- An automation flow bypasses the human review gate

**Guardrail tests ensure these things don't happen.** They don't test "does the feature exist" but "are the limits enforced."

### DI's Guardrail Tests

| Test | What It Verifies |
|------|--------|
| Action Guardrails | Is every Worker action within permitted scope (no exceeding authority)? |
| Governance Controls | Are governance rules correctly enforced (approval flow can't be skipped)? |
| API Guards | Are ML API security checks correct (unauthorized requests blocked)? |
| Promotion Gate | Does model promotion pass quality gates (can't push a bad model to production)? |
| Registry Guards | Are model registry operations compliant (can't arbitrarily delete or modify published models)? |

### Phase 4 Guardrails — The Strictest Gate

\\`npm run test:phase4-guardrails\\` covers the entire governance system:
- Permission control: unauthorized user attempts a sensitive operation → rejected
- Model lifecycle: model goes from training → validation → production → retirement, with gates at every step
- Retrain trigger: model accuracy drops below threshold → automatically triggers retraining
- Promotion gate: new model must be better than the old one to replace it

### Why Are Guardrails More Important Than Feature Tests?

> **If a feature breaks, users notice. If a guardrail breaks, nobody may discover it — until something goes seriously wrong.**

If the forecasting feature breaks, users say "it doesn't work," and you fix it immediately. But if the autonomy level control logic breaks, the Worker might auto-execute when it shouldn't, and "everything looks normal" — because it did execute, it just shouldn't have.

> **Possible interview follow-up:**
> "How do you ensure AI doesn't do things beyond expectations?"
> Three lines of defense: 1. **Code level** — The state machine ensures tasks can only transition in valid sequences. 2. **Policy level** — ApprovalPolicy defines what actions require human approval; writeback in v1 always does. 3. **Testing level** — Guardrail tests run in every CI cycle, ensuring these restrictions aren't accidentally removed.

---

## 12-6 (Boss): Quality Report

### Scenario

You receive a regression_result.json:

\\`\\`\\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    },
    {
      "test": "test_inventory_risk_threshold",
      "reason": "Risk score 0.82 exceeds safe threshold 0.75"
    }
  ]
}
\\`\\`\\`

### Your Task

1. Would you push this version to production? Why or why not?
2. How would you investigate these two failures?
3. If these two issues can't be fixed quickly, what alternatives do you have?

### Evaluation Criteria

- Clearly states **do not push** (2 failures = Release Gate not passed)
- Can interpret the metrics (MAPE 0.23 means 23% prediction deviation; Risk score 0.82 means the risk metric exceeds the threshold)
- Investigation steps are systematic:
  1. First check if it's a data issue (was the test data modified?)
  2. Then check if it's a code issue (who recently changed the prediction logic? Use git blame)
  3. Finally check if it's an environment issue (Python version? Package versions?)
- Alternatives are practical:
  - **Rollback** — revert to the last passing version
  - **Feature flag** — disable the problematic feature; deploy everything else
  - **Hotfix** — fix only this bug with a minimal repair

"""

    static let zhWorld13: String = """

# World 13：ML API 後端深度

> **目標：** 理解 ML API 怎麼保護自己不被亂用、怎麼處理要跑很久的任務、怎麼監控系統健康
> **對應專案：** Decision-Intelligence-（\\`src/ml/api/\\`）
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
- \\`sub\\` — 你是誰（使用者 ID）
- \\`role\\` — 你的角色（管理員、分析師、檢視者）
- \\`email\\` — 你的信箱

### 為什麼不用 session？

傳統做法是「session」：你登入後，server 記住你的身份，存在記憶體或資料庫裡。問題是：

- **ML API 是獨立的服務**，它跟 Supabase 是分開的。如果用 session，ML API 每次收到請求都要去問 Supabase「這個人是誰？」，多一次網路請求。
- **JWT 是 stateless 的**：ML API 自己就能驗證 JWT 的真偽，不用問任何人。快，而且不依賴外部服務。

### 有些路是不用手環的

健康檢查的 endpoint（\\`/healthz\\`、\\`/readyz\\`）不需要 JWT。為什麼？因為這些是給監控系統用的，不是給使用者用的。如果健康檢查也要 JWT，那監控系統還要先登入，太麻煩了。

開發的時候，可以透過 \\`DI_JWT_REQUIRED=false\\` 暫時關掉 JWT 驗證。但正式環境**絕對不能關**。

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

每個 API 請求都帶著一個 \\`X-Tenant-ID\\` header。ML API 的 middleware 會在最開始就把它抽出來，存在 \\`request.state\\` 裡。後續所有的資料庫查詢都會自動加上 \\`WHERE tenant_id = ?\\`。

**第二層：資料庫層面**

Supabase 用 Row-Level Security（RLS）做第二道防線。就算程式碼有 bug 忘了加 tenant_id 過濾，資料庫本身也會擋住跨租戶的查詢。就像公寓大樓除了房門鎖，還有大門門禁 — 兩道關卡。

**第三層：角色控制**

不是同一家公司的人都能做一樣的事。在程式碼裡，\\`_require_action_role()\\` 會檢查執行者是否有權做某個動作：

- **管理員**：可以修改模型設定、批准計畫
- **分析師**：可以跑預測和計畫，但不能修改模型
- **檢視者**：只能看結果，不能執行任何操作

這個叫做**最小權限原則（Principle of Least Privilege）** — 每個人只能做他被明確允許做的事。

### GovernanceStore — 誰能做什麼的規則書

系統裡有一個「治理倉庫」（GovernanceStore），記錄了所有的權限規則。每個需要權限控制的動作都定義成一個 \\`GovernanceAction\\`，例如：
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
- \\`/demand-forecast\\` — 需求預測
- \\`/replenishment-plan\\` — 採購計畫
- \\`/train-model\\` — 模型訓練
- \\`/backtest\\` — 回測

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

\\`\\`\\`
DI_SOLVER_MAX_CONCURRENT = 3（預設）
\\`\\`\\`

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

1. 前端提交任務 → ML API 回傳一個 \\`run_id\\`（號碼牌）
2. 任務進入佇列，Worker 在背景執行
3. 前端定期查 \\`run_id\\` 的狀態（或透過 SSE 即時推送）
4. 完成後，前端用 \\`run_id\\` 取得結果

**作業狀態流：**
\\`\\`\\`
queued → running → succeeded
                → failed
                → canceled
\\`\\`\\`

**Step Pipeline — 一個任務分成多步：**

一個完整的規劃任務不是一口氣跑完的，而是按順序執行多個步驟：

\\`\\`\\`
profile → contract → validate → forecast → risk_scan →
bom_explosion → optimize → verify_replay → report
\\`\\`\\`

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
- 最多同時跑 3 個任務（\\`DI_SOLVER_MAX_CONCURRENT\\`）
- 每 5 秒發一次心跳（heartbeat），讓系統知道它還活著

如果 worker 掛了（超過 2 分鐘沒心跳），系統會把它認領的任務釋放出來，讓其他 worker 重新認領。

**防護機制：**
\\`\\`\\`
DI_MAX_ROWS_PER_SHEET = 2,000,000   # 單張表最多 200 萬筆
DI_MAX_SKUS = 5,000                   # 最多 5,000 個品項
DI_SOLVER_MAX_SECONDS = 90            # 求解最多 90 秒
DI_BOM_MAX_EDGES = 200,000            # BOM 最多 20 萬條邊
DI_JOB_MAX_ATTEMPTS = 3               # 最多重試 3 次
\\`\\`\\`

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

這些事件存在 \\`solver_telemetry_events\\` 資料表裡。前端有一個 OpsDashboard（\\`/ops\\`）可以看到：
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

在前端，\\`useAgentSSE\\` hook 訂閱這些事件，Canvas 自動開啟對應的 widget。

### Prometheus Metrics

如果你的公司有 Grafana 監控系統，ML API 可以暴露 Prometheus 格式的 metrics（透過 \\`/metrics\\` endpoint）：
- 請求數量和延遲
- 錯誤率
- 目前在跑的任務數

### Sentry — 錯誤追蹤

設定了 \\`SENTRY_DSN\\` 環境變數後，ML API 會自動把未處理的錯誤送到 Sentry。這樣你不用盯著 log，Sentry 會主動通知你「有個新的錯誤，發生了 5 次」。

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

"""

    static let enWorld13: String = """

# World 13: ML API Backend Deep Dive

> **Objective:** Understand how the ML API protects itself from misuse, how it handles long-running tasks, and how it monitors system health
> **Related Project:** Decision-Intelligence- (\\`src/ml/api/\\`)
> **Estimated Study Time:** 3-4 hours

---

## 13-1: JWT Authentication — The Concert Wristband

### Start with a Scenario

You go to a concert. At the entrance, staff verify your ticket and give you a **waterproof wristband**. After that, whether you go to the bathroom, buy a drink, or return to your seat, you just scan the wristband each time — no need to pull out your ticket again.

JWT (JSON Web Token) is that wristband.

### How Does JWT Work in the DI System?

1. **You log in** → Supabase Auth verifies your credentials
2. **Login succeeds** → Supabase issues you a JWT (wristband)
3. **Every subsequent ML API call from your browser** → automatically includes this JWT
4. **ML API receives the request** → first checks if the JWT is authentic (verifies the signature using Supabase's secret); if authentic, it grants access

What information is embedded in the JWT?
- \\`sub\\` — Who you are (user ID)
- \\`role\\` — Your role (admin, analyst, viewer)
- \\`email\\` — Your email

### Why Not Use Sessions?

The traditional approach is "sessions": after you log in, the server remembers your identity, stored in memory or a database. The problems are:

- **ML API is a separate service** from Supabase. If using sessions, the ML API would need to ask Supabase "who is this person?" with every request — an extra network call.
- **JWT is stateless**: the ML API can verify the JWT's authenticity on its own, without asking anyone. Fast, and not dependent on external services.

### Some Paths Don't Require a Wristband

Health check endpoints (\\`/healthz\\`, \\`/readyz\\`) don't require JWT. Why? Because they're for monitoring systems, not for users. If health checks also required JWT, the monitoring system would need to log in first — too cumbersome.

During development, you can temporarily disable JWT verification via \\`DI_JWT_REQUIRED=false\\`. But in production, this **must never be disabled**.

> **Possible interview follow-up:**
> "What are JWT's drawbacks?"
> Once a JWT is issued, it can't be revoked (until it expires). If a user gets suspended, their JWT remains valid until expiration. The solution is to set a short JWT lifespan (e.g., 1 hour), combined with a refresh token mechanism.

---

## 13-2: Multi-Tenancy — The Apartment Building

### What Is Multi-Tenancy?

Imagine an apartment building. Each tenant has their own unit and their own keys. You can't see your neighbor's belongings, and they can't see yours. But you share the same building, the same elevator, and the same management committee.

**Multi-tenancy** means a single system serves multiple companies (tenants), with completely isolated data between them.

### How Does DI Achieve Isolation?

**Layer 1: Request Level**

Every API request carries an \\`X-Tenant-ID\\` header. The ML API's middleware extracts it at the very beginning and stores it in \\`request.state\\`. All subsequent database queries automatically include \\`WHERE tenant_id = ?\\`.

**Layer 2: Database Level**

Supabase uses Row-Level Security (RLS) as a second line of defense. Even if the code has a bug and forgets to add a tenant_id filter, the database itself blocks cross-tenant queries. Like an apartment building that has a main entrance access control in addition to individual door locks — two layers of gates.

**Layer 3: Role Control**

Not everyone in the same company can do the same things. In the code, \\`_require_action_role()\\` checks whether the actor has permission for a given action:

- **Admin**: Can modify model settings, approve plans
- **Analyst**: Can run forecasts and plans, but can't modify models
- **Viewer**: Can only view results, can't execute any operations

This is called the **Principle of Least Privilege** — each person can only do what they're explicitly permitted to do.

### GovernanceStore — The Rulebook of Who Can Do What

The system has a "governance store" (GovernanceStore) that records all permission rules. Every action requiring permission control is defined as a \\`GovernanceAction\\`, for example:
- Execute a forecast
- Modify model parameters
- Approve a procurement plan
- Export sensitive data

Every time someone wants to do one of these things, the system checks the GovernanceStore: "Can this role do this?"

> **Possible interview follow-up:**
> "If RLS can already block cross-tenant queries, why also filter by tenant_id at the API layer?"
> Defense in Depth. If you rely on only one layer, a failure in that layer means total exposure. With two layers, an API-layer bug won't leak data (because RLS catches it), and an RLS misconfiguration won't either (because the API layer filters first).

---

## 13-3: Rate Limiting — The Amusement Park Queue

### Why Is Rate Limiting Needed?

Imagine the roller coaster at an amusement park. If there's no queue and no capacity limit, everyone rushes in at once, and either it's overcrowded or the machine breaks.

The ML API is the same. Running a single forecast can take tens of seconds of CPU time. If someone writes a script sending 100 requests per second, the entire API gets overwhelmed and no other users can use it.

### How Does DI Implement Rate Limiting?

**Only limit heavy endpoints:** Not all APIs are rate-limited. Lightweight queries (getting task status, viewing results) aren't limited. Only compute-heavy endpoints are:
- \\`/demand-forecast\\` — Demand forecasting
- \\`/replenishment-plan\\` — Procurement planning
- \\`/train-model\\` — Model training
- \\`/backtest\\` — Backtesting

**Two implementations, auto-switching:**

| Implementation | When Used | How It Works |
|------|-----------|---------|
| **RedisRateLimiter** | When Redis is available | Uses Redis for distributed counting. Multiple ML API instances share the same counter; rate limiting is global |
| **InProcessRateLimiter** | When Redis is unavailable | Uses in-memory counting. Simple but only limits a single machine |

At startup, the system tries to connect to Redis. If it succeeds, it uses the Redis version; if not, it automatically degrades to the in-memory version. This is called **graceful degradation** — when a dependency is unavailable, instead of crashing, the system continues with a suboptimal alternative.

**Sliding Window Algorithm:**

It doesn't "reset every minute" (which would allow burst requests at minute boundaries). Instead, it truly looks at "how many requests in the past 60 seconds." Fairer and harder to exploit.

### Solver Concurrency Control — Another Kind of Queue

Beyond Rate Limiting, the ML API also has a **Solver Semaphore**:

\\`\\`\\`
DI_SOLVER_MAX_CONCURRENT = 3 (default)
\\`\\`\\`

At most 3 solving tasks can run simultaneously. The 4th request must wait for one of the previous ones to complete.

Why? Because the OR-Tools solver is extremely memory-intensive. If 10 solving tasks run simultaneously, the server could crash from memory exhaustion. 3 is a tested safe value.

> **Possible interview follow-up:**
> "What key is Rate Limiting based on? IP or user?"
> Primarily by user ID from the JWT (if logged in); falls back to IP if there's no JWT. User ID is more precise because people in the same office may share an IP.

---

## 13-4: Async Jobs — Delivery Instead of Dine-In

### Why Is Async Needed?

Back to the restaurant analogy. If you order a dish that takes 3 hours to stew, the waiter can't stand by your table for 3 hours. The normal approach is:

1. You order → the waiter writes it down and gives you a **ticket number**
2. You go about your business (chatting, drinking)
3. When it's ready → the waiter brings it to you

ML computation is the same. A complete planning task (data analysis → forecast → optimization → risk → report) might take several minutes. If you use a synchronous API (you send a request, the server processes it, and only responds when done), the HTTP connection could timeout and the browser might think the system is down.

### DI's Async Design

**Submit task → get a ticket number → periodically check progress → get results**

1. Frontend submits a task → ML API returns a \\`run_id\\` (ticket number)
2. Task enters the queue; Worker executes in the background
3. Frontend periodically checks the \\`run_id\\` status (or receives real-time updates via SSE)
4. Once complete, the frontend retrieves results using the \\`run_id\\`

**Job State Flow:**
\\`\\`\\`
queued → running → succeeded
                → failed
                → canceled
\\`\\`\\`

**Step Pipeline — A Single Task Split into Multiple Steps:**

A complete planning task doesn't run in one shot — it executes multiple steps in order:

\\`\\`\\`
profile → contract → validate → forecast → risk_scan →
bom_explosion → optimize → verify_replay → report
\\`\\`\\`

After each step completes, the result is pushed to the frontend as an artifact. So you don't wait for everything to finish before seeing anything — when the forecast is done, you can already see the forecast chart on the Canvas while the system continues running optimization.

**Two Storage Options:**

| Storage | Scenario | Characteristics |
|------|------|------|
| **PostgresAsyncRunStore** | Production | Persistent; survives restarts |
| **InMemoryAsyncRunStore** | Development/Testing | Fast but lost on restart |

### How Does the Worker Execute Tasks?

The ML API starts an **AsyncRunWorker** (Daemon Thread) in the background at startup:

- Every 2 seconds, it checks the database: "Are there any unclaimed tasks?"
- If yes, it claims one (compare-and-swap to prevent two workers from grabbing the same task)
- Runs up to 3 tasks concurrently (\\`DI_SOLVER_MAX_CONCURRENT\\`)
- Sends a heartbeat every 5 seconds so the system knows it's alive

If a worker dies (no heartbeat for over 2 minutes), the system releases its claimed tasks for other workers to pick up.

**Protection Mechanisms:**
\\`\\`\\`
DI_MAX_ROWS_PER_SHEET = 2,000,000   # Max 2 million rows per sheet
DI_MAX_SKUS = 5,000                   # Max 5,000 items
DI_SOLVER_MAX_SECONDS = 90            # Max 90 seconds for solving
DI_BOM_MAX_EDGES = 200,000            # Max 200,000 BOM edges
DI_JOB_MAX_ATTEMPTS = 3               # Max 3 retries
\\`\\`\\`

These limits are like an elevator's weight capacity — it's not that the elevator is bad; it's protecting it from being overloaded.

> **Possible interview follow-up:**
> "If a user closes their browser, does the task keep running?"
> Yes. Because the task is executed by the ML API's background worker, which doesn't depend on the browser. The user can close the browser, reopen it, and use the run_id to check the task's latest status. In production, there's also an independent Node.js task worker dedicated to this.

---

## 13-5: Monitoring and Real-Time Push

### Telemetry — The System's Thermometer

How do you know a running system is "healthy"? You can't wait for user complaints. You need **telemetry**.

DI's ML API records telemetry events for every solving run:
- **Which engine was used:** ortools / heuristic
- **How long it took:** 15.3 seconds
- **Result:** success / failure / timeout
- **Optimization objective value:** 42,500 (cost)

These events are stored in the \\`solver_telemetry_events\\` table. The frontend has an OpsDashboard (\\`/ops\\`) where you can see:
- Solver timeout rate (if it suddenly spikes, there may be a problem)
- Average solving time (trend over time)
- Failure reason distribution

### SSE (Server-Sent Events) — Real-Time Push

The "periodically check status" approach mentioned earlier is somewhat wasteful. A better approach is **letting the server proactively notify you**.

SSE (Server-Sent Events) does exactly this: the server maintains a connection with your browser and pushes new messages immediately. The difference from WebSocket:

| | SSE | WebSocket |
|---|-----|-----------|
| Direction | One-way (server → browser) | Two-way |
| Complexity | Simple | Complex |
| Firewall traversal | Easy (it's just HTTP) | Sometimes blocked |
| Best for | Server pushes updates for you to view | Two-way conversation |

DI uses SSE to push:
- Agent execution progress ("Running forecast..." "Forecast complete, starting optimization...")
- Step completion notifications
- Errors and warnings

On the frontend, the \\`useAgentSSE\\` hook subscribes to these events, and the Canvas automatically opens the corresponding widget.

### Prometheus Metrics

If your company has a Grafana monitoring system, the ML API can expose Prometheus-format metrics (via the \\`/metrics\\` endpoint):
- Request counts and latency
- Error rates
- Currently running tasks

### Sentry — Error Tracking

With the \\`SENTRY_DSN\\` environment variable configured, the ML API automatically sends unhandled errors to Sentry. This way you don't need to watch logs — Sentry proactively notifies you "there's a new error that occurred 5 times."

> **Possible interview follow-up:**
> "What are the three pillars of Observability? What does DI use for each?"
> **Logs** (structured logging via python-json-logger), **Metrics** (Prometheus, tracking system state), **Traces** (Request ID correlation, tracking a request across services). DI covers all three.

---

## 13-6 (Boss): API Security Architecture Review

### Scenario

Your manager asks:

> "How does Decision Intelligence's ML API protect multi-tenant security? From authentication to authorization to rate limiting, give me a quick security review."

### Your Task

Explain how the following security mechanisms work **in layers** (not independently):

1. **JWT Authentication** — Who are you?
2. **Role Control** — What can you do?
3. **Rate Limiting** — Are you making requests too fast?
4. **Tenant Isolation** — You can only touch your own data
5. **Telemetry** — Everything you do is recorded

### Evaluation Criteria

- Can you explain that these mechanisms are **executed in sequence** (middleware stack order)?
- Do you understand that each mechanism's responsibility doesn't overlap?
- Do you mention graceful degradation (rate limiting fallback when Redis is unavailable)?
- Do you mention defense in depth (API layer + RLS dual protection)?
- Do you mention public path exceptions (health endpoints)?

### Reference Answer Direction

"After a request enters the ML API, it passes through four middleware layers, like clearing four gates:

Gate 1 is **Request ID**: every request gets a unique ID for tracing later.

Gate 2 is **JWT Authentication**: verify who you are. If the JWT is invalid or expired, immediate 401 rejection — it never reaches the next gate. Health check paths are exempt and don't require JWT.

Gate 3 is **Rate Limiting**: verify that your call frequency is within reasonable bounds. If Redis is available, it uses distributed rate limiting (multiple machines share a counter); if not, it degrades to single-machine limiting. Only heavy-computation endpoints are rate-limited.

Gate 4 is **Tenant ID Extraction**: extracts your company ID from the header. All subsequent database queries automatically include this filter. At the database level, RLS provides a second line of defense.

Only after passing all four gates does the request reach the actual business logic (forecasting, planning, etc.). And telemetry data for the entire process (who did what, how long it took, what the result was) is recorded in solver_telemetry_events."

"""

    static let zhWorld14: String = """

# World 14：邊界與限制

> **目標：** 理解 DI 系統「不能做什麼」和「刻意不做什麼」，學會成熟地溝通技術限制
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 2-3 小時

---

## 14-1：Frontend-Only 啟動 — 看起來能用 ≠ 真的能用

### 一個常見的錯誤

你 clone 了 DI 的 repo，跑 \\`npm run dev\\`，瀏覽器打開 — 哇，畫面出來了！看起來一切正常。

**但其實你只啟動了前端。** 後端（Supabase、ML API）完全沒跑。

### 能看 vs 能用

| 狀態 | 只有前端 | 完整啟動 |
|------|---------|---------|
| 頁面能打開 | ✅ 可以 | ✅ 可以 |
| 路由能切換 | ✅ 可以 | ✅ 可以 |
| 按鈕能點 | ✅ 可以 | ✅ 可以 |
| 登入 | ❌ 失敗（Supabase 沒連） | ✅ 可以 |
| 上傳數據 | ❌ 失敗（Storage 沒連） | ✅ 可以 |
| 跟 AI 聊天 | ❌ 失敗（ai-proxy 沒連） | ✅ 可以 |
| 跑預測 | ❌ 失敗（ML API 沒連） | ✅ 可以 |

### 為什麼要特別提這個？

三個原因：

1. **Demo 的時候會出糗：** 如果你只跑前端去 demo，客人點任何功能都會看到「載入中」或錯誤。
2. **新人容易被騙：** 新加入的開發者看到畫面就以為「搞定了」，結果 debug 半天。
3. **測試的盲點：** 你跑前端的 unit test 都會過，但不代表整個系統能用。

### 正確的做法

用 \\`./scripts/healthcheck.sh\\` 作為真正的 readiness 信號。它會檢查四個服務（Supabase、ML API、AI Proxy、Frontend）是不是都活著。只有四個都綠燈，才算「系統可用」。

> 💡 **面試官可能會追問：**
> 「你怎麼跟一個非技術的人解釋這個問題？」
> → 「就像一輛車，你坐上去方向盤能轉、按鈕能按，但引擎沒發動。看起來一切正常，但你踩油門不會動。我們的系統也是，畫面能打開，但如果後端沒啟動，所有需要數據的功能都不會 work。所以我們有一個『引擎檢查燈』（healthcheck script）來確認一切真的就緒。」

---

## 14-2：SAP Adapter — 能連 ≠ 隨插即用

### Adapter 不是 Turnkey Connector

DI 有 5 個 SAP 同步 Edge Function：
- \\`sync-materials-from-sap\\` — 同步物料主檔
- \\`sync-demand-fg-from-sap\\` — 同步成品需求
- \\`sync-inventory-from-sap\\` — 同步庫存
- \\`sync-bom-from-sap\\` — 同步物料清單
- \\`sync-po-open-lines-from-sap\\` — 同步採購單

但它們是 **adapter**，不是 **turnkey connector**。差別是什麼？

用插頭來比喻：
- **Turnkey Connector** 就像萬用插頭 — 你插上去就能用，不用想。
- **Adapter** 就像你知道插頭的規格，也準備好了轉接頭的設計圖，但你還要自己把電線接好、測試通不通電。

### 具體來說，已經做好 vs 還需要做的

| 已經做好的 ✅ | 還需要做的 ❌ |
|-------------|-------------|
| 資料格式已定義（contract locked） | 客戶的 SAP endpoint URL |
| Schema 驗證邏輯已寫好 | SAP API 認證設定 |
| 有 25+ 個合約測試 | 網路連通性（VPN / private link） |
| 錯誤處理的基本框架 | 客戶特定的欄位映射 |
| Writeback payload 驗證 | 客戶端的整合測試 |

### 合約已鎖定的意義

雖然不是隨插即用，但介面是**穩定的**：
- \\`ADAPTER_PAYLOAD_CONTRACT\\` 定義了送出去的數據格式
- \\`MUTATION_FIELD_TYPES\\` 定義了每個欄位的型別
- \\`validateWritebackPayload()\\` 會做完整的 schema 驗證

這代表：**整合的風險是在「設定和連通」，不是在「介面會變」。** 你不用擔心介面改版導致整合壞掉。

### 怎麼成熟地溝通這件事？

❌ 不好的說法：「我們不支援 SAP。」
❌ 也不好：「我們完全支援 SAP。」

✅ 好的說法：「我們有穩定的 SAP adapter，資料合約和驗證邏輯都已經完成並測試。生產環境的整合需要一些客戶端設定工作 — 主要是 SAP endpoint、認證、和欄位映射。我們的合約是鎖定的，不會因為版本更新而改變。」

> 💡 **面試官可能會追問：**
> 「如果客戶說『我們需要即時同步』，你怎麼回？」
> → 「目前的 sync adapter 是批次同步（batch sync），適合每天或每幾小時跑一次。即時同步（real-time sync）需要 webhook 或 Change Data Capture（CDC），這在 v1 的範圍之外，但 adapter 的合約設計是可擴展的。」

---

## 14-3：Optional ML 足跡 — 刻意的精簡

### Chronos 為什麼被排除？

DI 的 Dockerfile 預設**不包含** Chronos（一個零樣本時序預測模型）。Chronos 需要 PyTorch、Transformers、Accelerate 這三個大套件。

| | 含 Chronos | 不含 Chronos |
|---|-----------|-------------|
| Docker image 大小 | ~3-4 GB | ~800 MB |
| 啟動時間 | 較長（要載入 PyTorch） | 快 |
| 記憶體需求 | 高（PyTorch 吃記憶體） | 正常 |
| 部署成本 | 高（需要更大的機器） | 低 |
| 可用的預測模型 | Prophet + LightGBM + Chronos | Prophet + LightGBM |

### 這不是「缺少功能」，是「刻意選擇」

\\`DI_CHRONOS_ENABLED=false\\` 是一個**產品決策**，不是一個 bug。

理由是：
1. Prophet 和 LightGBM 已經能覆蓋大多數預測場景
2. Chronos 的優勢是「不需要訓練數據」（零樣本），但企業客戶通常**有**訓練數據
3. 省下的 2+ GB image 大小意味著更快的部署和更低的運營成本

如果客戶真的需要 Chronos（比如做全新品項的預測，沒有歷史數據），可以手動開啟：修改 Dockerfile 移除過濾、設定 \\`DI_CHRONOS_ENABLED=true\\`。

### 預設值的設計哲學

> **好的預設值應該對最多的使用場景有效，而不是把所有東西都塞進去。**

這個原則適用於所有軟體設計：
- 預設 2 個 worker（夠用但不浪費記憶體）
- 預設 ortools solver（免費且品質好）
- 預設不含 Chronos（精簡但足夠）

> 💡 **面試官可能會追問：**
> 「如果你要設計一個新的 optional 功能，你會怎麼決定它是 opt-in 還是 opt-out？」
> → 看三個因素：1. **資源影響** — 如果它顯著增加 image 大小或記憶體，opt-in。2. **使用頻率** — 如果大多數使用者不需要，opt-in。3. **風險** — 如果它可能影響穩定性，opt-in。Chronos 三個都中，所以是 opt-in。

---

## 14-4：Execution Guardrails — 系統的安全閥

### 為什麼要設上限？

想像一個使用者上傳了一個 5 千萬筆的 Excel 檔案，然後要求系統跑預測。沒有上限的話：
- 伺服器記憶體用完 → 整台機器崩潰
- 其他使用者的請求全部卡住
- 求解器跑了一個小時都沒結果

**Execution Guardrails 就像電梯的載重限制** — 不是說電梯不好，是保護它不要超載壞掉。

### DI 的操作上限

\\`\\`\\`
DI_MAX_ROWS_PER_SHEET = 2,000,000    # 每張表最多 200 萬筆
DI_MAX_SKUS = 5,000                    # 最多 5,000 個品項（SKU）
DI_SOLVER_MAX_SECONDS = 90             # 求解器最多跑 90 秒
DI_BOM_MAX_EDGES = 200,000             # BOM 最多 20 萬條邊
DI_BOM_MAX_DEPTH = 12                  # BOM 最多 12 層深
DI_FORECAST_MAX_SERIES = 5,000         # 預測最多 5,000 個時間序列
DI_FORECAST_TIMEOUT_SECONDS = 90       # 預測最多 90 秒
DI_JOB_MAX_ATTEMPTS = 3               # 任務失敗最多重試 3 次
\\`\\`\\`

### 這些數字怎麼來的？

不是隨便設的：
- **200 萬筆** — 大多數企業的月度銷售數據在幾萬到幾十萬筆。200 萬筆覆蓋了 99% 的場景。
- **5,000 SKU** — 一般中型製造業的活躍品項在幾百到幾千個。
- **90 秒求解** — OR-Tools 在大多數場景 30 秒內就能求解。90 秒留了充足餘量。超過 90 秒通常代表問題太大需要分批。
- **3 次重試** — 暫時性錯誤（網路超時、資源忙碌）通常重試 1-2 次就會好。3 次還不行通常是真正的問題，不應該繼續重試。

### 為什麼用環境變數控制？

因為不同客戶、不同環境可能需要不同的上限：
- **開發環境：** 設小一點（1,000 SKU、30 秒 timeout），跑得快
- **正式環境：** 可以設大一點，但不要無限大
- **特殊客戶：** 如果客戶有 10,000 個 SKU，可以調整而不需要改程式碼

> 💡 **面試官可能會追問：**
> 「如果客戶的數據超過上限怎麼辦？」
> → 不是硬拒絕，而是建議分批。比如 10,000 SKU 可以分成 2 批各 5,000 個跑。或者跟客戶討論調高上限，但要評估對記憶體和 CPU 的影響。上限是可配置的，不是寫死的。

---

## 14-5：「什麼不做」的設計哲學

### 環境依賴的誠實清單

DI 系統依賴四個外部服務。沒有它們，對應的功能就不能用：

| 依賴 | 沒有它會怎樣 | 怎麼設定 |
|------|------------|---------|
| **Supabase** | 不能登入、不能存數據、不能上傳檔案 | 設定 SUPABASE_URL 和 ANON_KEY |
| **ML API** | 不能跑預測和規劃 | 啟動 Docker 容器或 \\`python run_ml_api.py\\` |
| **AI Provider Secrets** | 不能用 AI 分析功能 | 用 \\`supabase secrets set\\` 設定 API keys |
| **SQL Migrations** | 資料表不存在，所有數據操作失敗 | 按順序跑所有 migration |

### 已解決 vs 未解決的邊界

**已經解決的（用了就能用）：**
- ✅ 啟動流程 → \\`start.sh\\` 一鍵啟動 + preflight 檢查
- ✅ 健康監控 → \\`healthcheck.sh\\` + API probes + 前端健康面板
- ✅ ERP 合約 → 鎖定的 schema + 驗證 + 25+ 測試

**仍然存在的邊界（要跟客戶/面試官說清楚的）：**
- ⚠️ 部分啟動陷阱 — 前端能跑但功能不完整
- ⚠️ SAP 整合 — adapter 不是 turnkey connector
- ⚠️ Chronos — 預設排除，需要手動開啟
- ⚠️ 即時同步 — 目前只支援批次同步

### 文件 ≠ 功能

DI repo 裡有 50+ 份文件。但要注意：

- **文件可能描述目標狀態**，不是現在的狀態
- **\\`docs/archive/\\`** 裡的文件是歷史記錄，不代表現在的功能
- **KNOWN_LIMITATIONS.md** 通常是最誠實的文件 — 它告訴你「什麼不行」

讀文件的時候，先看日期、看版本號。2 個月前的規格文件可能已經跟程式碼對不上了。

> 💡 **面試官可能會追問：**
> 「你覺得 DI 系統最大的限制是什麼？」
> → 一個成熟的回答不是「沒有限制」，也不是一堆抱怨。而是：「目前最大的限制是 ERP 整合需要客製化工作。合約和驗證都穩定了，但每個客戶的 SAP 環境不同，需要逐一設定。這是 v1 的設計選擇 — 先確保核心流程穩定，ERP 整合在 v2 做成 turnkey。」

---

## 14-6（Boss）：限制溝通

### 情境

一個潛在客戶來信問：

> 「我們公司用 SAP S/4HANA。Decision Intelligence 可以直接連接我們的 SAP 系統嗎？我們希望即時同步庫存和需求數據。」

### 你的任務

寫一封專業的回覆信。你的回覆應該：
1. **誠實說明限制**（不是 turnkey connector、目前是批次同步不是即時）
2. **展示技術成熟度**（合約鎖定、驗證邏輯、25+ 測試）
3. **說明需要的整合工作**（endpoint、credentials、欄位映射）
4. **把限制變成優勢**（穩定的合約 = 可靠的整合基礎）
5. **給出前進路徑**（整合需要什麼步驟、大約什麼規模的工作量）

### 評估標準

- 是否**誠實**（沒有說「可以直接連、可以即時同步」）
- 是否**專業**（不是只說「不行」就結束）
- 是否展示**技術深度**（提到 contract、validation、adapter 這些實際的實作）
- 是否提供了**前進路徑**（不讓客戶覺得「算了，用不了」）
- 語調是否適合**客戶溝通**（不卑不亢、有信心）

### 參考回答方向

「感謝您的詢問。Decision Intelligence 確實支援 SAP 整合 — 我們有 5 個專門的 SAP adapter，涵蓋物料、需求、庫存、BOM 和採購單的同步。

我想先說明兩件事讓您有正確的預期：

第一，目前的整合方式是**批次同步**（可以設定每小時或每天跑一次），而不是即時串流。批次同步對大多數供應鏈規劃場景已經足夠，因為規劃本身是基於累積數據的。

第二，我們的 SAP 整合是**可設定的 adapter**，而不是隨插即用的 connector。這意味著上線前需要設定您的 SAP endpoint、API 認證、和欄位映射。好消息是，我們的資料合約是鎖定且經過測試的（25+ 個自動化測試），所以整合的風險在於設定，不在於介面穩定性。

如果您有興趣，我建議的下一步是安排一次技術對談，了解您的 SAP 環境細節，評估整合的工作量。通常一個熟悉 SAP API 的工程師需要 1-2 週完成設定和測試。」

"""

    static let enWorld14: String = """

# World 14: Boundaries and Limitations

> **Objective:** Understand what the DI system "can't do" and "deliberately doesn't do," and learn to communicate technical limitations maturely
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 2-3 hours

---

## 14-1: Frontend-Only Startup — Looks Like It Works Does Not Mean It Works

### A Common Mistake

You clone the DI repo, run \\`npm run dev\\`, and the browser opens — wow, the UI appears! Everything looks normal.

**But you've only started the frontend.** The backend (Supabase, ML API) isn't running at all.

### Looks OK vs Actually Works

| State | Frontend Only | Full Startup |
|------|---------|---------|
| Pages open | Yes | Yes |
| Routes navigate | Yes | Yes |
| Buttons clickable | Yes | Yes |
| Login | Fails (Supabase not connected) | Works |
| Upload data | Fails (Storage not connected) | Works |
| Chat with AI | Fails (ai-proxy not connected) | Works |
| Run forecasts | Fails (ML API not connected) | Works |

### Why Is This Worth Mentioning?

Three reasons:

1. **Embarrassment during demos:** If you only run the frontend for a demo, any feature the customer clicks will show "loading" or errors.
2. **Misleads newcomers:** New developers see the UI and think "it's working," then spend half a day debugging.
3. **Testing blind spot:** Frontend unit tests all pass, but that doesn't mean the entire system works.

### The Correct Approach

Use \\`./scripts/healthcheck.sh\\` as the true readiness signal. It checks whether all four services (Supabase, ML API, AI Proxy, Frontend) are alive. Only when all four show green is the "system available."

> **Possible interview follow-up:**
> "How would you explain this to a non-technical person?"
> "It's like a car — you sit inside and the steering wheel turns, the buttons press, but the engine isn't running. Everything looks normal, but you step on the gas and nothing happens. Our system is the same: the UI opens, but if the backend isn't started, all data-dependent features won't work. That's why we have an 'engine check light' (healthcheck script) to confirm everything is truly ready."

---

## 14-2: SAP Adapter — Can Connect Does Not Mean Plug-and-Play

### An Adapter Is Not a Turnkey Connector

DI has 5 SAP sync Edge Functions:
- \\`sync-materials-from-sap\\` — Sync material master data
- \\`sync-demand-fg-from-sap\\` — Sync finished goods demand
- \\`sync-inventory-from-sap\\` — Sync inventory
- \\`sync-bom-from-sap\\` — Sync bill of materials
- \\`sync-po-open-lines-from-sap\\` — Sync purchase orders

But they are **adapters**, not **turnkey connectors**. What's the difference?

Using a plug analogy:
- **Turnkey Connector** is like a universal adapter — you plug it in and it works, no thinking required.
- **Adapter** means you know the plug's specifications and have the adapter blueprint ready, but you still need to wire it up yourself and test the connection.

### Specifically: What's Done vs What Still Needs Doing

| Already Done | Still Needs To Be Done |
|-------------|-------------|
| Data formats defined (contract locked) | Customer's SAP endpoint URL |
| Schema validation logic written | SAP API authentication setup |
| 25+ contract tests | Network connectivity (VPN / private link) |
| Basic error handling framework | Customer-specific field mappings |
| Writeback payload validation | Customer-side integration testing |

### What "Contract Locked" Means

While it's not plug-and-play, the interface is **stable**:
- \\`ADAPTER_PAYLOAD_CONTRACT\\` defines the outgoing data format
- \\`MUTATION_FIELD_TYPES\\` defines the type of each field
- \\`validateWritebackPayload()\\` performs full schema validation

This means: **integration risk lies in "configuration and connectivity," not in "the interface changing."** You don't need to worry about interface changes breaking the integration.

### How to Communicate This Maturely

Bad: "We don't support SAP."
Also bad: "We fully support SAP."

Good: "We have stable SAP adapters with data contracts and validation logic that are complete and tested. Production integration requires some customer-side configuration work — primarily SAP endpoint, authentication, and field mappings. Our contracts are locked and won't change with version updates."

> **Possible interview follow-up:**
> "If a customer says 'we need real-time sync,' how do you respond?"
> "The current sync adapters use batch synchronization, suitable for running daily or every few hours. Real-time sync requires webhooks or Change Data Capture (CDC), which is outside v1 scope. However, the adapter's contract design is extensible."

---

## 14-3: Optional ML Footprint — Deliberate Minimalism

### Why Is Chronos Excluded?

DI's Dockerfile does **not include** Chronos (a zero-shot time series forecasting model) by default. Chronos requires PyTorch, Transformers, and Accelerate — three large packages.

| | With Chronos | Without Chronos |
|---|-----------|-------------|
| Docker image size | ~3-4 GB | ~800 MB |
| Startup time | Longer (loading PyTorch) | Fast |
| Memory requirements | High (PyTorch is memory-hungry) | Normal |
| Deployment cost | High (needs a larger machine) | Low |
| Available forecasting models | Prophet + LightGBM + Chronos | Prophet + LightGBM |

### This Isn't a "Missing Feature" — It's a "Deliberate Choice"

\\`DI_CHRONOS_ENABLED=false\\` is a **product decision**, not a bug.

The reasoning:
1. Prophet and LightGBM already cover most forecasting scenarios
2. Chronos's advantage is "no training data needed" (zero-shot), but enterprise customers typically **have** training data
3. The 2+ GB image size savings means faster deployment and lower operational costs

If a customer truly needs Chronos (e.g., forecasting for a brand-new product with no historical data), it can be manually enabled: modify the Dockerfile to remove the filter, set \\`DI_CHRONOS_ENABLED=true\\`.

### Default Value Design Philosophy

> **Good defaults should work for the most common use cases, not cram everything in.**

This principle applies to all software design:
- Default 2 workers (sufficient without wasting memory)
- Default ortools solver (free and good quality)
- Default no Chronos (lean but sufficient)

> **Possible interview follow-up:**
> "If you were designing a new optional feature, how would you decide whether it's opt-in or opt-out?"
> Consider three factors: 1. **Resource impact** — if it significantly increases image size or memory, make it opt-in. 2. **Usage frequency** — if most users don't need it, opt-in. 3. **Risk** — if it could affect stability, opt-in. Chronos checks all three, so it's opt-in.

---

## 14-4: Execution Guardrails — The System's Safety Valves

### Why Set Limits?

Imagine a user uploads a 50-million-row Excel file and asks the system to run a forecast. Without limits:
- Server memory runs out → entire machine crashes
- All other users' requests get stuck
- The solver runs for an hour with no results

**Execution Guardrails are like an elevator's weight limit** — it doesn't mean the elevator is bad; it's protecting it from overload damage.

### DI's Operational Limits

\\`\\`\\`
DI_MAX_ROWS_PER_SHEET = 2,000,000    # Max 2 million rows per sheet
DI_MAX_SKUS = 5,000                    # Max 5,000 SKUs
DI_SOLVER_MAX_SECONDS = 90             # Max 90 seconds for the solver
DI_BOM_MAX_EDGES = 200,000             # Max 200,000 BOM edges
DI_BOM_MAX_DEPTH = 12                  # Max 12 BOM levels deep
DI_FORECAST_MAX_SERIES = 5,000         # Max 5,000 time series for forecasting
DI_FORECAST_TIMEOUT_SECONDS = 90       # Max 90 seconds for forecasting
DI_JOB_MAX_ATTEMPTS = 3               # Max 3 retries for failed tasks
\\`\\`\\`

### Where Do These Numbers Come From?

They're not arbitrary:
- **2 million rows** — Most enterprises' monthly sales data ranges from tens of thousands to hundreds of thousands of rows. 2 million covers 99% of scenarios.
- **5,000 SKUs** — A typical mid-size manufacturer has a few hundred to a few thousand active items.
- **90-second solving** — OR-Tools solves most scenarios within 30 seconds. 90 seconds provides ample buffer. Exceeding 90 seconds usually means the problem is too large and should be split into batches.
- **3 retries** — Transient errors (network timeouts, resource contention) usually resolve with 1-2 retries. If 3 retries fail, it's usually a real problem that shouldn't keep retrying.

### Why Control via Environment Variables?

Because different customers and environments may need different limits:
- **Development environment:** Set smaller (1,000 SKUs, 30-second timeout) — runs faster
- **Production environment:** Can be set larger, but not unlimited
- **Special customers:** If a customer has 10,000 SKUs, you can adjust without changing code

> **Possible interview follow-up:**
> "What if a customer's data exceeds the limits?"
> Don't hard-reject — suggest batching. For example, 10,000 SKUs can be split into 2 batches of 5,000 each. Or discuss raising the limit with the customer, but assess the impact on memory and CPU. The limits are configurable, not hardcoded.

---

## 14-5: The Design Philosophy of "What Not To Do"

### An Honest List of Environment Dependencies

The DI system depends on four external services. Without them, corresponding features won't work:

| Dependency | What Happens Without It | How to Set Up |
|------|------------|---------|
| **Supabase** | Can't log in, can't store data, can't upload files | Set SUPABASE_URL and ANON_KEY |
| **ML API** | Can't run forecasts or plans | Start Docker container or \\`python run_ml_api.py\\` |
| **AI Provider Secrets** | Can't use AI analysis features | Set API keys via \\`supabase secrets set\\` |
| **SQL Migrations** | Tables don't exist; all data operations fail | Run all migrations in order |

### Resolved vs Unresolved Boundaries

**Already resolved (works when set up):**
- Startup process → \\`start.sh\\` one-command startup + preflight checks
- Health monitoring → \\`healthcheck.sh\\` + API probes + frontend health panel
- ERP contracts → Locked schema + validation + 25+ tests

**Boundaries that still exist (be upfront with customers/interviewers):**
- Partial startup trap — frontend runs but features are incomplete
- SAP integration — adapter, not a turnkey connector
- Chronos — excluded by default, requires manual enablement
- Real-time sync — currently only batch sync is supported

### Documentation Does Not Equal Features

The DI repo has 50+ documents. But be aware:

- **Documents may describe the target state**, not the current state
- **\\`docs/archive/\\`** contains historical records, not current features
- **KNOWN_LIMITATIONS.md** is usually the most honest document — it tells you "what doesn't work"

When reading documents, check the date and version number first. A spec document from 2 months ago may no longer match the code.

> **Possible interview follow-up:**
> "What do you think is DI's biggest limitation?"
> A mature answer isn't "no limitations" nor a list of complaints. It's: "Currently the biggest limitation is that ERP integration requires customization work. The contracts and validation are stable, but each customer's SAP environment is different and requires individual configuration. This is a v1 design choice — first ensure the core workflow is stable, then make ERP integration turnkey in v2."

---

## 14-6 (Boss): Communicating Limitations

### Scenario

A prospective customer writes:

> "Our company uses SAP S/4HANA. Can Decision Intelligence connect directly to our SAP system? We'd like real-time sync of inventory and demand data."

### Your Task

Write a professional reply. Your response should:
1. **Honestly state limitations** (not a turnkey connector; currently batch sync, not real-time)
2. **Demonstrate technical maturity** (locked contracts, validation logic, 25+ tests)
3. **Explain the integration work required** (endpoint, credentials, field mappings)
4. **Turn limitations into strengths** (stable contracts = reliable integration foundation)
5. **Provide a path forward** (what integration steps are needed, approximate scope of work)

### Evaluation Criteria

- Is it **honest** (doesn't claim "can connect directly, can sync in real-time")
- Is it **professional** (doesn't just say "no" and stop)
- Does it show **technical depth** (mentions contract, validation, adapter — actual implementation details)
- Does it provide a **path forward** (doesn't leave the customer thinking "forget it, can't use it")
- Is the tone appropriate for **customer communication** (confident but not arrogant)

### Reference Answer Direction

"Thank you for your inquiry. Decision Intelligence does support SAP integration — we have 5 dedicated SAP adapters covering materials, demand, inventory, BOM, and purchase order synchronization.

I'd like to set proper expectations on two points:

First, the current integration method is **batch synchronization** (configurable to run hourly or daily), rather than real-time streaming. Batch sync is sufficient for most supply chain planning scenarios since planning is inherently based on accumulated data.

Second, our SAP integration uses **configurable adapters** rather than plug-and-play connectors. This means some configuration work is needed before going live — primarily your SAP endpoint, API authentication, and field mappings. The good news is that our data contracts are locked and thoroughly tested (25+ automated tests), so integration risk lies in configuration, not in interface stability.

If you're interested, I suggest scheduling a technical discussion to understand your SAP environment details and assess the integration scope. Typically, an engineer familiar with the SAP API needs 1-2 weeks to complete setup and testing."

"""

    static let zhWorld15: String = """

# 🐍 Python 基本語法與條件判斷

歡迎來到 Python 的世界！這個 World 會帶你從零開始，學會 Python 最基礎的語法。

---

## 15-1：變數與資料型態

### 四大基本型態

Python 有四個最常用的基本型態：

| 型態 | 說明 | 範例 |
|------|------|------|
| \\`int\\` | 整數 | \\`42\\`, \\`-7\\`, \\`0\\` |
| \\`float\\` | 浮點數 | \\`3.14\\`, \\`-0.5\\`, \\`1.0\\` |
| \\`str\\` | 字串 | \\`"hello"\\`, \\`'world'\\` |
| \\`bool\\` | 布林 | \\`True\\`, \\`False\\` |

### 變數賦值

Python 不需要宣告型態，直接賦值即可：

\\`\\`\\`python
name = "Alice"      # str
age = 25            # int
height = 1.68       # float
is_student = True   # bool
\\`\\`\\`

### type() 查看型態

\\`\\`\\`python
print(type(42))        # <class 'int'>
print(type("hello"))   # <class 'str'>
print(type(True))      # <class 'bool'>
\\`\\`\\`

### 命名規則

- 只能用字母、數字、底線
- 不能以數字開頭
- 不能是保留字（if, for, class 等）
- **慣例用 snake_case**（小寫加底線）

\\`\\`\\`python
# ✅ 好的命名
total_amount = 100
user_name = "Alice"

# ❌ 不合法
2nd_place = "Bob"   # 數字開頭
my-score = 90       # 連字號
class = "A"         # 保留字
\\`\\`\\`

---

## 15-2：Input/Output 與字串格式化

### print() 輸出

\\`\\`\\`python
print("Hello, World!")
print("Name:", name, "Age:", age)   # 多個值用逗號分隔
\\`\\`\\`

### input() 輸入

**重點：input() 永遠回傳 str！**

\\`\\`\\`python
name = input("你的名字：")           # 回傳 str
age = int(input("你幾歲："))         # 要用 int() 轉型
price = float(input("價格："))       # 或 float()
\\`\\`\\`

### f-string 格式化（Python 3.6+）

\\`\\`\\`python
name = "Alice"
age = 25
print(f"{name} is {age} years old")  # Alice is 25 years old
print(f"明年 {age + 1} 歲")          # 大括號裡可以放運算式
print(f"{'Python':>10}")             # 靠右對齊，佔 10 格
print(f"{3.14159:.2f}")              # 保留兩位小數 → 3.14
\\`\\`\\`

---

## 15-3：運算子與表達式

### 算術運算子

| 運算子 | 說明 | 範例 |
|--------|------|------|
| \\`+\\` | 加 | \\`3 + 2 → 5\\` |
| \\`-\\` | 減 | \\`3 - 2 → 1\\` |
| \\`*\\` | 乘 | \\`3 * 2 → 6\\` |
| \\`/\\` | 除（回傳 float） | \\`7 / 2 → 3.5\\` |
| \\`//\\` | 整數除法 | \\`7 // 2 → 3\\` |
| \\`%\\` | 取餘數 | \\`7 % 2 → 1\\` |
| \\`**\\` | 次方 | \\`2 ** 3 → 8\\` |

### 比較運算子

\\`==\\`, \\`!=\\`, \\`>\\`, \\`<\\`, \\`>=\\`, \\`<=\\`

**注意 == 和 is 的差別：**
- \\`==\\` 比較值（equality）
- \\`is\\` 比較身份/記憶體位置（identity）
- 慣例：跟 None 比較用 \\`is\\`，其他用 \\`==\\`

### 邏輯運算子

\\`and\\`, \\`or\\`, \\`not\\`

\\`\\`\\`python
x = 5
print(x > 0 and x < 10)   # True（兩個都要 True）
print(x > 0 or x > 100)   # True（一個 True 就行）
print(not (x > 0))         # False（反轉）
\\`\\`\\`

---

## 15-4：條件判斷 if/elif/else

### 基本結構

\\`\\`\\`python
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"成績：{grade}")  # 成績：B
\\`\\`\\`

**注意：elif 的順序很重要！** 從最嚴格的條件開始。

### 巢狀 vs Guard Clause

\\`\\`\\`python
# ❌ 巢狀太深
if user:
    if user.is_active:
        if user.has_permission:
            do_action()

# ✅ Guard Clause（提前返回）
if not user: return
if not user.is_active: return
if not user.has_permission: return
do_action()
\\`\\`\\`

---

## 15-5：條件判斷進階

### Truthy 與 Falsy

Python 中這些值在 if 條件中視為 **False**（Falsy）：

\\`None\\`, \\`False\\`, \\`0\\`, \\`0.0\\`, \\`""\\`, \\`[]\\`, \\`{}\\`, \\`set()\\`

所有其他值都是 **Truthy**。

\\`\\`\\`python
# Pythonic 寫法
if my_list:          # 比 if len(my_list) > 0 好
    process(my_list)

if name:             # 比 if name != "" 好
    greet(name)
\\`\\`\\`

### 短路求值（Short-circuit Evaluation）

\\`\\`\\`python
# and：左邊 Falsy → 回傳左邊，不執行右邊
result = None and expensive_function()  # result = None

# or：左邊 Truthy → 回傳左邊，不執行右邊
name = user_input or "Anonymous"  # 如果 user_input 是空的，用預設值
\\`\\`\\`

### 三元運算式

\\`\\`\\`python
status = "成年" if age >= 18 else "未成年"
\\`\\`\\`

---

## 15-6（Boss）：簡易計算器

綜合運用以上所有概念，寫一個四則運算計算器：
- \\`input()\\` 取得輸入
- \\`float()\\` 轉型
- \\`if/elif/else\\` 判斷運算子
- \\`try/except\\` 處理錯誤
- \\`f-string\\` 格式化輸出

"""

    static let enWorld15: String = """

# 🐍 Python Basic Syntax and Conditional Statements

Welcome to the world of Python! This World will take you from zero to mastering Python's most fundamental syntax.

---

## 15-1: Variables and Data Types

### Four Basic Types

Python has four most commonly used basic types:

| Type | Description | Example |
|------|-------------|---------|
| \\`int\\` | Integer | \\`42\\`, \\`-7\\`, \\`0\\` |
| \\`float\\` | Floating-point number | \\`3.14\\`, \\`-0.5\\`, \\`1.0\\` |
| \\`str\\` | String | \\`"hello"\\`, \\`'world'\\` |
| \\`bool\\` | Boolean | \\`True\\`, \\`False\\` |

### Variable Assignment

Python doesn't require type declarations — just assign directly:

\\`\\`\\`python
name = "Alice"      # str
age = 25            # int
height = 1.68       # float
is_student = True   # bool
\\`\\`\\`

### type() — Check the Type

\\`\\`\\`python
print(type(42))        # <class 'int'>
print(type("hello"))   # <class 'str'>
print(type(True))      # <class 'bool'>
\\`\\`\\`

### Naming Rules

- Can only use letters, digits, and underscores
- Cannot start with a digit
- Cannot be a reserved keyword (if, for, class, etc.)
- **Convention: use snake_case** (lowercase with underscores)

\\`\\`\\`python
# ✅ Good naming
total_amount = 100
user_name = "Alice"

# ❌ Invalid
2nd_place = "Bob"   # Starts with a digit
my-score = 90       # Hyphen not allowed
class = "A"         # Reserved keyword
\\`\\`\\`

---

## 15-2: Input/Output and String Formatting

### print() — Output

\\`\\`\\`python
print("Hello, World!")
print("Name:", name, "Age:", age)   # Multiple values separated by commas
\\`\\`\\`

### input() — Input

**Key point: input() always returns a str!**

\\`\\`\\`python
name = input("Your name: ")             # Returns str
age = int(input("Your age: "))          # Use int() to convert
price = float(input("Price: "))         # Or float()
\\`\\`\\`

### f-string Formatting (Python 3.6+)

\\`\\`\\`python
name = "Alice"
age = 25
print(f"{name} is {age} years old")  # Alice is 25 years old
print(f"Next year {age + 1}")        # Expressions allowed inside braces
print(f"{'Python':>10}")             # Right-aligned, 10 characters wide
print(f"{3.14159:.2f}")              # Two decimal places → 3.14
\\`\\`\\`

---

## 15-3: Operators and Expressions

### Arithmetic Operators

| Operator | Description | Example |
|----------|-------------|---------|
| \\`+\\` | Addition | \\`3 + 2 → 5\\` |
| \\`-\\` | Subtraction | \\`3 - 2 → 1\\` |
| \\`*\\` | Multiplication | \\`3 * 2 → 6\\` |
| \\`/\\` | Division (returns float) | \\`7 / 2 → 3.5\\` |
| \\`//\\` | Floor division | \\`7 // 2 → 3\\` |
| \\`%\\` | Modulo | \\`7 % 2 → 1\\` |
| \\`**\\` | Exponentiation | \\`2 ** 3 → 8\\` |

### Comparison Operators

\\`==\\`, \\`!=\\`, \\`>\\`, \\`<\\`, \\`>=\\`, \\`<=\\`

**Note the difference between == and is:**
- \\`==\\` compares values (equality)
- \\`is\\` compares identity / memory address (identity)
- Convention: use \\`is\\` when comparing with None, use \\`==\\` for everything else

### Logical Operators

\\`and\\`, \\`or\\`, \\`not\\`

\\`\\`\\`python
x = 5
print(x > 0 and x < 10)   # True (both must be True)
print(x > 0 or x > 100)   # True (only one needs to be True)
print(not (x > 0))         # False (negation)
\\`\\`\\`

---

## 15-4: Conditional Statements if/elif/else

### Basic Structure

\\`\\`\\`python
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"Grade: {grade}")  # Grade: B
\\`\\`\\`

**Note: The order of elif matters!** Start with the strictest condition.

### Nesting vs Guard Clause

\\`\\`\\`python
# ❌ Too deeply nested
if user:
    if user.is_active:
        if user.has_permission:
            do_action()

# ✅ Guard Clause (early return)
if not user: return
if not user.is_active: return
if not user.has_permission: return
do_action()
\\`\\`\\`

---

## 15-5: Advanced Conditional Statements

### Truthy and Falsy

In Python, these values are considered **False** (Falsy) in if conditions:

\\`None\\`, \\`False\\`, \\`0\\`, \\`0.0\\`, \\`""\\`, \\`[]\\`, \\`{}\\`, \\`set()\\`

All other values are **Truthy**.

\\`\\`\\`python
# Pythonic style
if my_list:          # Better than if len(my_list) > 0
    process(my_list)

if name:             # Better than if name != ""
    greet(name)
\\`\\`\\`

### Short-circuit Evaluation

\\`\\`\\`python
# and: if left is Falsy → returns left, right side not evaluated
result = None and expensive_function()  # result = None

# or: if left is Truthy → returns left, right side not evaluated
name = user_input or "Anonymous"  # If user_input is empty, use default
\\`\\`\\`

### Ternary Expression

\\`\\`\\`python
status = "Adult" if age >= 18 else "Minor"
\\`\\`\\`

---

## 15-6 (Boss): Simple Calculator

Combine all the concepts above to build a four-operation calculator:
- \\`input()\\` to get user input
- \\`float()\\` for type conversion
- \\`if/elif/else\\` to determine the operator
- \\`try/except\\` for error handling
- \\`f-string\\` for formatted output

"""

    static let zhWorld16: String = """

# 🔄 迴圈與資料結構

學會用迴圈重複執行程式，並認識 Python 最重要的五種資料結構。

---

## 16-1：for 迴圈與 range()

### 基本 for 迴圈

\\`\\`\\`python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
\\`\\`\\`

### range() 三參數

\\`range(start, stop, step)\\` — stop 不包含！

\\`\\`\\`python
range(5)        # 0, 1, 2, 3, 4
range(2, 6)     # 2, 3, 4, 5
range(0, 10, 2) # 0, 2, 4, 6, 8
range(10, 0, -1)# 10, 9, 8, ..., 1（倒數）
\\`\\`\\`

### enumerate() — 同時取索引和值

\\`\\`\\`python
# ❌ 不 Pythonic
for i in range(len(fruits)):
    print(i, fruits[i])

# ✅ Pythonic
for i, fruit in enumerate(fruits):
    print(i, fruit)

# 可以指定起始索引
for i, fruit in enumerate(fruits, start=1):
    print(i, fruit)  # 從 1 開始
\\`\\`\\`

---

## 16-2：while 迴圈與流程控制

### while 迴圈

\\`\\`\\`python
count = 0
while count < 5:
    print(count)
    count += 1
\\`\\`\\`

### for vs while 選擇

- **for**：已知次數或已知集合 → \\`for item in collection\\`
- **while**：條件驅動，不知道要跑幾次 → \\`while condition\\`

### break 與 continue

\\`\\`\\`python
# break — 立刻結束迴圈
for i in range(100):
    if i == 5:
        break       # 只跑到 4
    print(i)

# continue — 跳過這次，繼續下一次
for i in range(10):
    if i % 2 == 0:
        continue    # 跳過偶數
    print(i)        # 只印奇數
\\`\\`\\`

### while True + break 模式

\\`\\`\\`python
while True:
    cmd = input("指令（quit 離開）：")
    if cmd == "quit":
        break
    print(f"你輸入了：{cmd}")
\\`\\`\\`

---

## 16-3：字串操作

### 索引與切片

\\`\\`\\`python
s = "Hello, World!"
s[0]      # 'H'（第一個字元）
s[-1]     # '!'（最後一個字元）
s[7:12]   # 'World'（切片）
s[:5]     # 'Hello'（從頭到第 5 個之前）
s[7:]     # 'World!'（從第 7 個到尾）
s[::-1]   # '!dlroW ,olleH'（反轉）
\\`\\`\\`

### 常用字串方法

| 方法 | 說明 | 範例 |
|------|------|------|
| \\`.strip()\\` | 去頭尾空白 | \\`"  hi  ".strip() → "hi"\\` |
| \\`.lower()\\` / \\`.upper()\\` | 大小寫 | \\`"Hi".lower() → "hi"\\` |
| \\`.split()\\` | 切割 | \\`"a,b,c".split(",") → ["a","b","c"]\\` |
| \\`.join()\\` | 合併 | \\`",".join(["a","b"]) → "a,b"\\` |
| \\`.replace()\\` | 取代 | \\`"hi".replace("hi","hello")\\` |
| \\`.startswith()\\` | 開頭判斷 | \\`"hello".startswith("he") → True\\` |
| \\`.find()\\` | 尋找位置 | \\`"hello".find("ll") → 2\\` |

**字串是不可變的（immutable）** — 所有方法都回傳新字串。

---

## 16-4：List 與 Tuple

### List — 可變的有序集合

\\`\\`\\`python
# 建立
nums = [1, 2, 3, 4, 5]

# 新增
nums.append(6)          # 尾部加 → [1,2,3,4,5,6]
nums.insert(0, 0)       # 指定位置插入

# 刪除
nums.pop()              # 移除最後一個
nums.remove(3)          # 移除第一個值為 3 的

# 排序
nums.sort()             # 原地排序（改原 list）
sorted_nums = sorted(nums)  # 回傳新 list（不改原本）

# 切片
nums[1:3]               # 取第 1~2 個
nums[::2]               # 每隔一個取
\\`\\`\\`

### Tuple — 不可變的有序集合

\\`\\`\\`python
point = (3, 4)          # 座標
rgb = (255, 128, 0)     # 顏色

# 解包（Unpacking）
x, y = point            # x=3, y=4
name, age, city = ("Alice", 25, "Taipei")
\\`\\`\\`

### 何時用 Tuple vs List

- **Tuple**：固定結構、不會修改（座標、設定值、函式回傳多值）
- **List**：會增減元素的動態集合（購物車、待辦事項）

---

## 16-5：Dict 與 Set

### Dict — 鍵值對

\\`\\`\\`python
user = {"name": "Alice", "age": 25, "city": "Taipei"}

# 存取
user["name"]               # "Alice"
user.get("email", "N/A")   # 安全存取，key 不存在回傳預設值

# 新增/修改
user["email"] = "alice@example.com"

# 遍歷
for key, value in user.items():
    print(f"{key}: {value}")

# 常用方法
user.keys()     # dict_keys(["name", "age", "city"])
user.values()   # dict_values(["Alice", 25, "Taipei"])
user.items()    # dict_items([("name","Alice"), ...])
\\`\\`\\`

### Set — 不重複的無序集合

\\`\\`\\`python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

a & b    # {3, 4} — 交集
a | b    # {1,2,3,4,5,6} — 聯集
a - b    # {1, 2} — 差集
a ^ b    # {1,2,5,6} — 對稱差集

# 去重
names = ["Alice", "Bob", "Alice", "Charlie", "Bob"]
unique = list(set(names))  # ["Alice", "Bob", "Charlie"]
\\`\\`\\`

---

## 16-6（Boss）：資料清洗小程式

綜合運用：
- \\`for\\` 迴圈遍歷 list of dicts
- 字串方法（\\`.strip()\\`, \\`.lower()\\`）清洗資料
- \\`dict.get()\\` 安全累加統計
- \\`max()\\` 找出最大值
- 條件判斷過濾無效資料

"""

    static let enWorld16: String = """

# 🔄 Loops and Data Structures

Learn to use loops for repeated execution, and get to know Python's five most important data structures.

---

## 16-1: for Loops and range()

### Basic for Loop

\\`\\`\\`python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
\\`\\`\\`

### range() — Three Parameters

\\`range(start, stop, step)\\` — stop is excluded!

\\`\\`\\`python
range(5)        # 0, 1, 2, 3, 4
range(2, 6)     # 2, 3, 4, 5
range(0, 10, 2) # 0, 2, 4, 6, 8
range(10, 0, -1)# 10, 9, 8, ..., 1 (countdown)
\\`\\`\\`

### enumerate() — Get Index and Value Simultaneously

\\`\\`\\`python
# ❌ Not Pythonic
for i in range(len(fruits)):
    print(i, fruits[i])

# ✅ Pythonic
for i, fruit in enumerate(fruits):
    print(i, fruit)

# You can specify a starting index
for i, fruit in enumerate(fruits, start=1):
    print(i, fruit)  # Starts from 1
\\`\\`\\`

---

## 16-2: while Loops and Flow Control

### while Loop

\\`\\`\\`python
count = 0
while count < 5:
    print(count)
    count += 1
\\`\\`\\`

### Choosing for vs while

- **for**: Known number of iterations or known collection → \\`for item in collection\\`
- **while**: Condition-driven, unknown number of iterations → \\`while condition\\`

### break and continue

\\`\\`\\`python
# break — immediately exit the loop
for i in range(100):
    if i == 5:
        break       # Only runs up to 4
    print(i)

# continue — skip this iteration, continue to next
for i in range(10):
    if i % 2 == 0:
        continue    # Skip even numbers
    print(i)        # Only prints odd numbers
\\`\\`\\`

### while True + break Pattern

\\`\\`\\`python
while True:
    cmd = input("Command (quit to exit): ")
    if cmd == "quit":
        break
    print(f"You entered: {cmd}")
\\`\\`\\`

---

## 16-3: String Operations

### Indexing and Slicing

\\`\\`\\`python
s = "Hello, World!"
s[0]      # 'H' (first character)
s[-1]     # '!' (last character)
s[7:12]   # 'World' (slicing)
s[:5]     # 'Hello' (from start to index 5, exclusive)
s[7:]     # 'World!' (from index 7 to end)
s[::-1]   # '!dlroW ,olleH' (reversed)
\\`\\`\\`

### Common String Methods

| Method | Description | Example |
|--------|-------------|---------|
| \\`.strip()\\` | Remove leading/trailing whitespace | \\`"  hi  ".strip() → "hi"\\` |
| \\`.lower()\\` / \\`.upper()\\` | Case conversion | \\`"Hi".lower() → "hi"\\` |
| \\`.split()\\` | Split | \\`"a,b,c".split(",") → ["a","b","c"]\\` |
| \\`.join()\\` | Join | \\`",".join(["a","b"]) → "a,b"\\` |
| \\`.replace()\\` | Replace | \\`"hi".replace("hi","hello")\\` |
| \\`.startswith()\\` | Prefix check | \\`"hello".startswith("he") → True\\` |
| \\`.find()\\` | Find position | \\`"hello".find("ll") → 2\\` |

**Strings are immutable** — all methods return a new string.

---

## 16-4: List and Tuple

### List — Mutable Ordered Collection

\\`\\`\\`python
# Create
nums = [1, 2, 3, 4, 5]

# Add
nums.append(6)          # Append to end → [1,2,3,4,5,6]
nums.insert(0, 0)       # Insert at specific position

# Remove
nums.pop()              # Remove last element
nums.remove(3)          # Remove first occurrence of value 3

# Sort
nums.sort()             # In-place sort (modifies original list)
sorted_nums = sorted(nums)  # Returns new list (original unchanged)

# Slicing
nums[1:3]               # Get elements at index 1 and 2
nums[::2]               # Get every other element
\\`\\`\\`

### Tuple — Immutable Ordered Collection

\\`\\`\\`python
point = (3, 4)          # Coordinates
rgb = (255, 128, 0)     # Color

# Unpacking
x, y = point            # x=3, y=4
name, age, city = ("Alice", 25, "Taipei")
\\`\\`\\`

### When to Use Tuple vs List

- **Tuple**: Fixed structure, won't be modified (coordinates, config values, multiple return values)
- **List**: Dynamic collection where elements are added/removed (shopping cart, to-do list)

---

## 16-5: Dict and Set

### Dict — Key-Value Pairs

\\`\\`\\`python
user = {"name": "Alice", "age": 25, "city": "Taipei"}

# Access
user["name"]               # "Alice"
user.get("email", "N/A")   # Safe access, returns default if key doesn't exist

# Add/Update
user["email"] = "alice@example.com"

# Iterate
for key, value in user.items():
    print(f"{key}: {value}")

# Common methods
user.keys()     # dict_keys(["name", "age", "city"])
user.values()   # dict_values(["Alice", 25, "Taipei"])
user.items()    # dict_items([("name","Alice"), ...])
\\`\\`\\`

### Set — Unordered Collection of Unique Elements

\\`\\`\\`python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

a & b    # {3, 4} — Intersection
a | b    # {1,2,3,4,5,6} — Union
a - b    # {1, 2} — Difference
a ^ b    # {1,2,5,6} — Symmetric difference

# Deduplication
names = ["Alice", "Bob", "Alice", "Charlie", "Bob"]
unique = list(set(names))  # ["Alice", "Bob", "Charlie"]
\\`\\`\\`

---

## 16-6 (Boss): Data Cleaning Script

Combine all concepts:
- \\`for\\` loop to iterate over a list of dicts
- String methods (\\`.strip()\\`, \\`.lower()\\`) for data cleaning
- \\`dict.get()\\` for safe accumulation of statistics
- \\`max()\\` to find the maximum value
- Conditional statements to filter invalid data

"""

    static let zhWorld17: String = """

# ⚙️ 函式與錯誤處理

函式是程式碼重用的基本單位，錯誤處理讓你的程式更健壯。

---

## 17-1：函式基礎 def

### 定義與呼叫

\\`\\`\\`python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")  # "Hello, Alice!"
\\`\\`\\`

### return vs print

- **return**：把值傳回給呼叫者，可以存到變數
- **print**：輸出到螢幕，回傳 None

\\`\\`\\`python
def add_return(a, b):
    return a + b          # 呼叫者拿到 8

def add_print(a, b):
    print(a + b)          # 印出 8，但呼叫者拿到 None
\\`\\`\\`

---

## 17-2：參數進階

### 預設值參數

\\`\\`\\`python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("Alice")          # "Hello, Alice!"
greet("Alice", "Hi")    # "Hi, Alice!"
\\`\\`\\`

### *args 和 **kwargs

\\`\\`\\`python
def log(message, *args, **kwargs):
    print(f"[LOG] {message}")
    print(f"  args: {args}")       # tuple
    print(f"  kwargs: {kwargs}")   # dict

log("error", 1, 2, level="high")
\\`\\`\\`

---

## 17-3：作用域與內建函式

### LEGB 規則

Python 查找變數的順序：Local → Enclosing → Global → Built-in

\\`\\`\\`python
x = 10              # Global
def foo():
    x = 20          # Local
    print(x)        # 20
foo()
print(x)            # 10（Global 不變）
\\`\\`\\`

### 常用內建函式

| 函式 | 說明 | 範例 |
|------|------|------|
| \\`sorted()\\` | 排序（回傳新 list） | \\`sorted([3,1,2]) → [1,2,3]\\` |
| \\`sum()\\` | 加總 | \\`sum([1,2,3]) → 6\\` |
| \\`min()/max()\\` | 最小/最大 | \\`max([3,1,2]) → 3\\` |
| \\`zip()\\` | 配對 | \\`list(zip([1,2], ["a","b"]))\\` |
| \\`map()\\` | 映射 | \\`list(map(str, [1,2]))\\` |
| \\`filter()\\` | 篩選 | \\`list(filter(lambda x: x>2, [1,2,3]))\\` |

---

## 17-4：錯誤類型與除錯

### 常見錯誤

| 錯誤 | 原因 |
|------|------|
| \\`SyntaxError\\` | 語法錯誤（缺冒號、引號） |
| \\`TypeError\\` | 型態不匹配 |
| \\`NameError\\` | 變數未定義 |
| \\`ValueError\\` | 值不合法 |
| \\`KeyError\\` | dict key 不存在 |
| \\`IndexError\\` | 索引超界 |

### 閱讀 Traceback

先看最後一行（錯誤類型），再看最底部的行號（錯誤位置）。

---

## 17-5：try/except 與防禦式程式

\\`\\`\\`python
try:
    num = int(input("數字："))
except ValueError:
    print("請輸入有效的數字")
else:
    print(f"成功：{num}")
finally:
    print("完成")
\\`\\`\\`

### 最佳實踐

1. 只 catch 你知道怎麼處理的 exception
2. 不要用裸 except
3. try 區塊越小越好
4. 用 raise 往上拋

---

## 17-6（Boss）：資料驗證函式組

綜合運用函式設計、參數、回傳值、try/except、raise。

"""

    static let enWorld17: String = """

# ⚙️ Functions and Error Handling

Functions are the basic unit of code reuse, and error handling makes your programs more robust.

---

## 17-1: Function Basics — def

### Defining and Calling

\\`\\`\\`python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")  # "Hello, Alice!"
\\`\\`\\`

### return vs print

- **return**: Passes a value back to the caller, can be stored in a variable
- **print**: Outputs to the screen, returns None

\\`\\`\\`python
def add_return(a, b):
    return a + b          # Caller receives 8

def add_print(a, b):
    print(a + b)          # Prints 8, but caller receives None
\\`\\`\\`

---

## 17-2: Advanced Parameters

### Default Parameter Values

\\`\\`\\`python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("Alice")          # "Hello, Alice!"
greet("Alice", "Hi")    # "Hi, Alice!"
\\`\\`\\`

### *args and **kwargs

\\`\\`\\`python
def log(message, *args, **kwargs):
    print(f"[LOG] {message}")
    print(f"  args: {args}")       # tuple
    print(f"  kwargs: {kwargs}")   # dict

log("error", 1, 2, level="high")
\\`\\`\\`

---

## 17-3: Scope and Built-in Functions

### The LEGB Rule

Python looks up variables in this order: Local → Enclosing → Global → Built-in

\\`\\`\\`python
x = 10              # Global
def foo():
    x = 20          # Local
    print(x)        # 20
foo()
print(x)            # 10 (Global unchanged)
\\`\\`\\`

### Common Built-in Functions

| Function | Description | Example |
|----------|-------------|---------|
| \\`sorted()\\` | Sort (returns new list) | \\`sorted([3,1,2]) → [1,2,3]\\` |
| \\`sum()\\` | Sum | \\`sum([1,2,3]) → 6\\` |
| \\`min()/max()\\` | Minimum/Maximum | \\`max([3,1,2]) → 3\\` |
| \\`zip()\\` | Pair up | \\`list(zip([1,2], ["a","b"]))\\` |
| \\`map()\\` | Map | \\`list(map(str, [1,2]))\\` |
| \\`filter()\\` | Filter | \\`list(filter(lambda x: x>2, [1,2,3]))\\` |

---

## 17-4: Error Types and Debugging

### Common Errors

| Error | Cause |
|-------|-------|
| \\`SyntaxError\\` | Syntax error (missing colon, quotes) |
| \\`TypeError\\` | Type mismatch |
| \\`NameError\\` | Variable not defined |
| \\`ValueError\\` | Invalid value |
| \\`KeyError\\` | Dict key doesn't exist |
| \\`IndexError\\` | Index out of range |

### Reading a Traceback

Look at the last line first (error type), then check the bottom-most line number (error location).

---

## 17-5: try/except and Defensive Programming

\\`\\`\\`python
try:
    num = int(input("Number: "))
except ValueError:
    print("Please enter a valid number")
else:
    print(f"Success: {num}")
finally:
    print("Done")
\\`\\`\\`

### Best Practices

1. Only catch exceptions you know how to handle
2. Never use bare except
3. Keep the try block as small as possible
4. Use raise to re-raise exceptions upward

---

## 17-6 (Boss): Data Validation Function Suite

Combine function design, parameters, return values, try/except, and raise.

"""

    static let zhWorld18: String = """

# 📦 模組、檔案與物件導向

學會組織程式碼（模組）、處理外部資料（檔案）、用 class 建立自己的資料型態。

---

## 18-1：import 與標準函式庫

### import 三種方式

\\`\\`\\`python
import datetime                    # 匯入整個模組
from datetime import datetime      # 只匯入特定名稱
import datetime as dt              # 別名
\\`\\`\\`

### 常用標準庫

| 模組 | 用途 |
|------|------|
| \\`os\\` | 作業系統操作 |
| \\`datetime\\` | 日期時間 |
| \\`json\\` | JSON 處理 |
| \\`csv\\` | CSV 檔案 |
| \\`random\\` | 隨機數 |
| \\`pathlib\\` | 路徑操作 |

---

## 18-2：pip 與第三方套件

\\`\\`\\`bash
pip install requests              # 安裝
pip freeze > requirements.txt     # 匯出依賴
pip install -r requirements.txt   # 從清單安裝
python -m venv .venv              # 建立虛擬環境
\\`\\`\\`

---

## 18-3：檔案讀寫 txt/csv

\\`\\`\\`python
# 讀取文字檔（推薦用 with）
with open("data.txt", "r", encoding="utf-8") as f:
    content = f.read()

# CSV 讀取（每行是 dict）
import csv
with open("data.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"])
\\`\\`\\`

---

## 18-4：JSON 讀寫

四個核心函式：
- \\`json.load(f)\\` — 檔案 → Python
- \\`json.loads(s)\\` — 字串 → Python
- \\`json.dump(obj, f)\\` — Python → 檔案
- \\`json.dumps(obj)\\` — Python → 字串

\\`\\`\\`python
import json

with open("config.json") as f:
    config = json.load(f)

# 巢狀安全存取
host = config.get("database", {}).get("host", "localhost")
\\`\\`\\`

---

## 18-5：OOP 基礎 class

\\`\\`\\`python
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def greet(self):
        return f"Hi, I'm {self.name}"

    def __str__(self):
        return f"User({self.name})"

user = User("Alice", "alice@example.com")
print(user.greet())   # "Hi, I'm Alice"
\\`\\`\\`

### 重點

- \\`__init__\\` 是建構子
- \\`self\\` 是實例自身的參考
- 方法第一個參數永遠是 self
- \\`__str__\\` 定義 print() 的輸出

---

## 18-6（Boss）：Config Reader Class

綜合運用 class、檔案讀寫、JSON、巢狀 dict 操作、錯誤處理。

"""

    static let enWorld18: String = """

# 📦 Modules, Files, and Object-Oriented Programming

Learn to organize code (modules), handle external data (files), and create your own data types with classes.

---

## 18-1: import and the Standard Library

### Three Ways to Import

\\`\\`\\`python
import datetime                    # Import the entire module
from datetime import datetime      # Import a specific name only
import datetime as dt              # Alias
\\`\\`\\`

### Common Standard Library Modules

| Module | Purpose |
|--------|---------|
| \\`os\\` | Operating system operations |
| \\`datetime\\` | Date and time |
| \\`json\\` | JSON processing |
| \\`csv\\` | CSV files |
| \\`random\\` | Random numbers |
| \\`pathlib\\` | Path operations |

---

## 18-2: pip and Third-Party Packages

\\`\\`\\`bash
pip install requests              # Install
pip freeze > requirements.txt     # Export dependencies
pip install -r requirements.txt   # Install from list
python -m venv .venv              # Create virtual environment
\\`\\`\\`

---

## 18-3: File I/O — txt/csv

\\`\\`\\`python
# Read a text file (recommended to use with)
with open("data.txt", "r", encoding="utf-8") as f:
    content = f.read()

# Read CSV (each row is a dict)
import csv
with open("data.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"])
\\`\\`\\`

---

## 18-4: JSON Read/Write

Four core functions:
- \\`json.load(f)\\` — File → Python
- \\`json.loads(s)\\` — String → Python
- \\`json.dump(obj, f)\\` — Python → File
- \\`json.dumps(obj)\\` — Python → String

\\`\\`\\`python
import json

with open("config.json") as f:
    config = json.load(f)

# Safe nested access
host = config.get("database", {}).get("host", "localhost")
\\`\\`\\`

---

## 18-5: OOP Basics — class

\\`\\`\\`python
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def greet(self):
        return f"Hi, I'm {self.name}"

    def __str__(self):
        return f"User({self.name})"

user = User("Alice", "alice@example.com")
print(user.greet())   # "Hi, I'm Alice"
\\`\\`\\`

### Key Points

- \\`__init__\\` is the constructor
- \\`self\\` is a reference to the instance itself
- The first parameter of a method is always self
- \\`__str__\\` defines the output of print()

---

## 18-6 (Boss): Config Reader Class

Combine class, file I/O, JSON, nested dict operations, and error handling.

"""

    static let zhWorld19: String = """

# 🐼 Pythonic 思維與資料處理

寫出「像 Python」的程式碼，並用 pandas 處理真實資料。

---

## 19-1：List Comprehension

\\`\\`\\`python
# 基本語法
squares = [x ** 2 for x in range(10)]

# 帶條件篩選
evens = [x for x in range(20) if x % 2 == 0]

# 帶轉換 + 條件
upper_long = [s.upper() for s in names if len(s) > 3]
\\`\\`\\`

---

## 19-2：可讀性與 PEP 8

- 函式/變數：snake_case
- 類別：PascalCase
- 常數：UPPER_SNAKE_CASE
- 一行不超過 79 字元
- import 順序：標準庫 → 第三方 → 自己的

---

## 19-3：Pandas 入門 DataFrame

\\`\\`\\`python
import pandas as pd

df = pd.read_csv("data.csv")
df.head()        # 前 5 行
df.info()        # 欄位型態
df.describe()    # 統計摘要
df.shape         # (行數, 列數)
\\`\\`\\`

---

## 19-4：資料篩選與排序

\\`\\`\\`python
# 條件篩選（注意括號和 &）
result = df[(df["price"] > 100) & (df["category"] == "Electronics")]

# 排序
df.sort_values("price", ascending=False)

# loc（標籤）vs iloc（位置）
df.loc[0:5, ["name", "price"]]
df.iloc[0:5, 0:2]
\\`\\`\\`

---

## 19-5：GroupBy 與聚合

\\`\\`\\`python
# 基本 groupby
df.groupby("category")["price"].mean()

# 多重聚合
df.groupby("category")["price"].agg(["mean", "max", "count"])

# 不同欄位不同聚合
df.groupby("category").agg({"price": "mean", "qty": "sum"})
\\`\\`\\`

---

## 19-6（Boss）：用 Pandas 分析銷售資料

綜合運用：讀取 → 清洗 → 計算 → 分群 → 輸出。

"""

    static let enWorld19: String = """

# 🐼 Pythonic Thinking and Data Processing

Write code that feels "like Python," and use pandas to process real-world data.

---

## 19-1: List Comprehension

\\`\\`\\`python
# Basic syntax
squares = [x ** 2 for x in range(10)]

# With conditional filtering
evens = [x for x in range(20) if x % 2 == 0]

# With transformation + condition
upper_long = [s.upper() for s in names if len(s) > 3]
\\`\\`\\`

---

## 19-2: Readability and PEP 8

- Functions/variables: snake_case
- Classes: PascalCase
- Constants: UPPER_SNAKE_CASE
- Max 79 characters per line
- Import order: standard library → third-party → your own

---

## 19-3: Pandas Basics — DataFrame

\\`\\`\\`python
import pandas as pd

df = pd.read_csv("data.csv")
df.head()        # First 5 rows
df.info()        # Column types
df.describe()    # Statistical summary
df.shape         # (rows, columns)
\\`\\`\\`

---

## 19-4: Data Filtering and Sorting

\\`\\`\\`python
# Conditional filtering (note the parentheses and &)
result = df[(df["price"] > 100) & (df["category"] == "Electronics")]

# Sorting
df.sort_values("price", ascending=False)

# loc (label-based) vs iloc (position-based)
df.loc[0:5, ["name", "price"]]
df.iloc[0:5, 0:2]
\\`\\`\\`

---

## 19-5: GroupBy and Aggregation

\\`\\`\\`python
# Basic groupby
df.groupby("category")["price"].mean()

# Multiple aggregations
df.groupby("category")["price"].agg(["mean", "max", "count"])

# Different aggregations for different columns
df.groupby("category").agg({"price": "mean", "qty": "sum"})
\\`\\`\\`

---

## 19-6 (Boss): Analyze Sales Data with Pandas

Combine all concepts: Read → Clean → Calculate → Group → Export.

"""

    static let zhWorld20: String = """

# 🤖 API 與自動化腳本

學會用 Python 呼叫 API 和寫自動化腳本。

---

## 20-1：JSON 與 API 概念

- REST API 用 HTTP 方法操作資源
- GET（讀取）、POST（建立）、PUT（更新）、DELETE（刪除）
- 狀態碼：2xx 成功、4xx 客戶端錯誤、5xx 伺服器錯誤

---

## 20-2：requests GET

\\`\\`\\`python
import requests

resp = requests.get("https://api.example.com/data", params={"page": 1})
if resp.status_code == 200:
    data = resp.json()
\\`\\`\\`

---

## 20-3：POST 與認證

\\`\\`\\`python
import os

headers = {"Authorization": f"Bearer {os.environ['API_KEY']}"}
resp = requests.post(url, json={"name": "Alice"}, headers=headers)
\\`\\`\\`

---

## 20-4：批次處理腳本

\\`\\`\\`python
from glob import glob
import pandas as pd

files = glob("data/*.csv")
dfs = [pd.read_csv(f) for f in files]
combined = pd.concat(dfs, ignore_index=True)
\\`\\`\\`

---

## 20-5：自動報表生成

\\`\\`\\`python
with pd.ExcelWriter("report.xlsx") as writer:
    summary.to_excel(writer, sheet_name="Summary")
    details.to_excel(writer, sheet_name="Details")
\\`\\`\\`

---

## 20-6（Boss）：設計 API 資料蒐集腳本

綜合運用：分頁處理、rate limit、錯誤處理、logging。

"""

    static let enWorld20: String = """

# 🤖 APIs and Automation Scripts

Learn to call APIs and write automation scripts with Python.

---

## 20-1: JSON and API Concepts

- REST APIs use HTTP methods to operate on resources
- GET (read), POST (create), PUT (update), DELETE (delete)
- Status codes: 2xx success, 4xx client error, 5xx server error

---

## 20-2: requests GET

\\`\\`\\`python
import requests

resp = requests.get("https://api.example.com/data", params={"page": 1})
if resp.status_code == 200:
    data = resp.json()
\\`\\`\\`

---

## 20-3: POST and Authentication

\\`\\`\\`python
import os

headers = {"Authorization": f"Bearer {os.environ['API_KEY']}"}
resp = requests.post(url, json={"name": "Alice"}, headers=headers)
\\`\\`\\`

---

## 20-4: Batch Processing Scripts

\\`\\`\\`python
from glob import glob
import pandas as pd

files = glob("data/*.csv")
dfs = [pd.read_csv(f) for f in files]
combined = pd.concat(dfs, ignore_index=True)
\\`\\`\\`

---

## 20-5: Automated Report Generation

\\`\\`\\`python
with pd.ExcelWriter("report.xlsx") as writer:
    summary.to_excel(writer, sheet_name="Summary")
    details.to_excel(writer, sheet_name="Details")
\\`\\`\\`

---

## 20-6 (Boss): Design an API Data Collection Script

Combine all concepts: pagination handling, rate limiting, error handling, and logging.

"""

    static let zhWorld21: String = """

# 🗄️ 資料庫與 Backend 基礎

用 Python 連接資料庫、建 API，從腳本升級到服務。

---

## 21-1：Python + SQLite

\\`\\`\\`python
import sqlite3

conn = sqlite3.connect("mydb.db")
cursor = conn.cursor()

# 參數化查詢（防 SQL injection）
cursor.execute("SELECT * FROM users WHERE name = ?", (name,))
rows = cursor.fetchall()

conn.close()
\\`\\`\\`

---

## 21-2：CRUD 操作

| 操作 | SQL | HTTP |
|------|-----|------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT |
| Delete | DELETE | DELETE |

重點：寫入操作後要 \\`conn.commit()\\`。

---

## 21-3：ORM 概念

ORM 把資料表映射成 Python class：
- 程式碼更直覺
- 自動防 SQL injection
- 簡單 CRUD 用 ORM，複雜查詢用原生 SQL

---

## 21-4：Flask/FastAPI 入門

\\`\\`\\`python
from fastapi import FastAPI

app = FastAPI()

@app.get("/users/{user_id}")
def get_user(user_id: int):
    return {"user_id": user_id}

@app.post("/users", status_code=201)
def create_user(user: UserCreate):
    # 建立使用者邏輯
    return {"id": new_id, **user.dict()}
\\`\\`\\`

---

## 21-5：建立 RESTful API

RESTful 原則：
- URL = 名詞（資源）
- HTTP 方法 = 動詞（動作）
- 常用狀態碼：200, 201, 204, 400, 404, 422, 500

---

## 21-6（Boss）：設計待辦事項 CRUD API

綜合運用：Schema 設計 + FastAPI 路由 + SQLite + 錯誤處理。

"""

    static let enWorld21: String = """

# 🗄️ Databases and Backend Basics

Use Python to connect to databases and build APIs — level up from scripts to services.

---

## 21-1: Python + SQLite

\\`\\`\\`python
import sqlite3

conn = sqlite3.connect("mydb.db")
cursor = conn.cursor()

# Parameterized query (prevents SQL injection)
cursor.execute("SELECT * FROM users WHERE name = ?", (name,))
rows = cursor.fetchall()

conn.close()
\\`\\`\\`

---

## 21-2: CRUD Operations

| Operation | SQL | HTTP |
|-----------|-----|------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT |
| Delete | DELETE | DELETE |

Key point: Always call \\`conn.commit()\\` after write operations.

---

## 21-3: ORM Concepts

ORM maps database tables to Python classes:
- More intuitive code
- Automatic SQL injection prevention
- Use ORM for simple CRUD, raw SQL for complex queries

---

## 21-4: Flask/FastAPI Introduction

\\`\\`\\`python
from fastapi import FastAPI

app = FastAPI()

@app.get("/users/{user_id}")
def get_user(user_id: int):
    return {"user_id": user_id}

@app.post("/users", status_code=201)
def create_user(user: UserCreate):
    # User creation logic
    return {"id": new_id, **user.dict()}
\\`\\`\\`

---

## 21-5: Building a RESTful API

RESTful principles:
- URL = noun (resource)
- HTTP method = verb (action)
- Common status codes: 200, 201, 204, 400, 404, 422, 500

---

## 21-6 (Boss): Design a To-Do CRUD API

Combine all concepts: Schema design + FastAPI routing + SQLite + error handling.

"""

    static let zhWorld22: String = """

# 🏗️ 商業流程工具開發

從寫腳本升級到設計完整的商業流程工具。

---

## 22-1：需求分析與規格

User Story 格式：As a [角色], I want to [行動], so that [目的]。

MVP = 最小但完整可用的核心流程。先讓使用者跑通一個循環。

---

## 22-2：表單處理

- 前端驗證 = UX（即時回饋）
- 後端驗證 = Security（不信任前端）
- 用 Pydantic BaseModel 定義資料結構和驗證規則

---

## 22-3：Workflow 自動化

狀態機設計：
- 定義所有合法狀態和轉換
- 每個轉換有明確的觸發條件和執行者
- 狀態變更時觸發自動化動作（通知、更新）

---

## 22-4：內部工具架構

前後端分離：
- Frontend: React / Retool / Streamlit
- Backend: FastAPI / Flask
- Database: SQLite / PostgreSQL
- 透過 REST API 溝通

---

## 22-5：部署與維護概念

- Docker：環境一致性
- .env：環境變數管理
- logging：生產環境用 logging 不用 print
- 基本監控：健康檢查、錯誤追蹤

---

## 22-6（Boss）：設計請假申請系統

綜合運用：
- Schema 設計
- RESTful API
- 狀態機
- 權限控制
- 通知機制
- MVP 規劃

"""

    static let enWorld22: String = """

# 🏗️ Business Process Tool Development

Level up from writing scripts to designing complete business process tools.

---

## 22-1: Requirements Analysis and Specifications

User Story format: As a [role], I want to [action], so that [purpose].

MVP = the smallest yet fully usable core workflow. Let users complete one full cycle first.

---

## 22-2: Form Processing

- Frontend validation = UX (instant feedback)
- Backend validation = Security (never trust the frontend)
- Use Pydantic BaseModel to define data structures and validation rules

---

## 22-3: Workflow Automation

State machine design:
- Define all valid states and transitions
- Each transition has clear trigger conditions and actors
- State changes trigger automated actions (notifications, updates)

---

## 22-4: Internal Tool Architecture

Frontend-backend separation:
- Frontend: React / Retool / Streamlit
- Backend: FastAPI / Flask
- Database: SQLite / PostgreSQL
- Communication via REST API

---

## 22-5: Deployment and Maintenance Concepts

- Docker: Environment consistency
- .env: Environment variable management
- logging: Use logging in production, not print
- Basic monitoring: Health checks, error tracking

---

## 22-6 (Boss): Design a Leave Request System

Combine all concepts:
- Schema design
- RESTful API
- State machine
- Permission control
- Notification mechanism
- MVP planning

"""

    static let zhWorld23: String = """

# World 23：SQL 基礎查詢

> SQL 是資料分析的語言。學會基礎查詢，你就能從資料庫裡直接拿到你需要的答案。

不管你未來走 Product Analyst 還是 Business Engineer，SQL 的基礎查詢是每天都會用到的技能。
這一章從最基本的概念開始，帶你到能獨立寫出完整查詢的程度。

---

## 23-1：資料庫與資料表基本概念

### 什麼是資料庫？

資料庫（Database）就是一個有組織地儲存資料的系統。你可以把它想像成一個 Excel 檔案，但更強大：

| 概念 | Excel 類比 | 說明 |
|------|-----------|------|
| Database | 整個 Excel 檔案 | 一組相關的資料表 |
| Table | 一個工作表（Sheet） | 儲存特定類型的資料 |
| Row（行） | 一列 | 一筆資料記錄 |
| Column（欄位） | 一欄 | 一個資料屬性 |

### Primary Key 與 Foreign Key

**Primary Key（主鍵）**：每一筆資料的唯一識別碼。就像學號、身分證字號。

**Foreign Key（外鍵）**：指向另一張表的 Primary Key，用來建立表與表之間的關聯。

\\`\\`\\`
customers 表：
| id (PK) | name    | email           |
|---------|---------|-----------------|
| 101     | Alice   | alice@mail.com  |
| 102     | Bob     | bob@mail.com    |

orders 表：
| id (PK) | customer_id (FK) | amount | order_date |
|---------|------------------|--------|------------|
| 1       | 101              | 250    | 2024-01-15 |
| 2       | 102              | 180    | 2024-01-20 |
\\`\\`\\`

orders 表的 \\`customer_id\\` 是 Foreign Key，指向 customers 表的 \\`id\\`。

### Schema 是什麼？

Schema 描述資料表的結構：有哪些欄位、每個欄位的資料型態、約束條件。

\\`\\`\\`sql
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  city TEXT
);
\\`\\`\\`

面試中不需要背語法，但你要能看懂 schema 並說出「這張表有什麼欄位、可以回答什麼問題」。

---

## 23-2：SELECT / FROM / WHERE 深入

### SQL 查詢的基本結構

\\`\\`\\`sql
SELECT 欄位1, 欄位2     -- 你要看什麼
FROM 表名               -- 從哪張表
WHERE 條件              -- 篩選什麼
\\`\\`\\`

### 多條件篩選

用 AND、OR、NOT 組合多個條件：

\\`\\`\\`sql
-- 台北的已完成訂單
SELECT * FROM orders
WHERE city = 'Taipei' AND status = 'completed';

-- 台北或高雄的訂單
SELECT * FROM orders
WHERE city = 'Taipei' OR city = 'Kaohsiung';

-- 非取消的訂單
SELECT * FROM orders
WHERE NOT status = 'cancelled';
\\`\\`\\`

### DISTINCT 去重

\\`\\`\\`sql
-- 有多少不同的城市？
SELECT DISTINCT city FROM customers;
\\`\\`\\`

### Column Alias（欄位別名）

\\`\\`\\`sql
SELECT name AS customer_name, email AS contact_email
FROM customers;
\\`\\`\\`

### 面試技巧

面試時先口述你的思路：
> 「我需要從 orders 表取資料，篩選條件是狀態為 completed 且金額大於 100，只需要看 customer_id 和 amount 兩個欄位。」

---

## 23-3：排序與進階篩選

### ORDER BY 排序

\\`\\`\\`sql
-- 按金額由大到小
SELECT * FROM orders ORDER BY amount DESC;

-- 先按城市排，同城市按金額排
SELECT * FROM orders ORDER BY city ASC, amount DESC;
\\`\\`\\`

### IN — 多值匹配

\\`\\`\\`sql
SELECT * FROM customers
WHERE city IN ('Taipei', 'Kaohsiung', 'Taichung');
\\`\\`\\`

### BETWEEN — 範圍篩選

\\`\\`\\`sql
SELECT * FROM orders
WHERE amount BETWEEN 100 AND 500;
\\`\\`\\`

### LIKE — 模糊比對

| 符號 | 意思 | 範例 |
|------|------|------|
| % | 任意多個字元 | 'A%' → Alice, Amy |
| _ | 剛好一個字元 | 'B_b' → Bob |

---

## 23-4：聚合函數深入

### 五大聚合函數

| 函數 | 用途 | 範例 |
|------|------|------|
| COUNT(*) | 計算筆數 | 有幾筆訂單？ |
| COUNT(DISTINCT col) | 不重複計數 | 有幾個不同客戶？ |
| SUM(col) | 加總 | 總營收是多少？ |
| AVG(col) | 平均 | 平均訂單金額？ |
| MIN(col) / MAX(col) | 最小/最大 | 最高單筆消費？ |

### GROUP BY + HAVING

\\`\\`\\`sql
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 5;
\\`\\`\\`

### WHERE vs HAVING

| | WHERE | HAVING |
|---|-------|--------|
| 篩選時機 | 聚合前 | 聚合後 |
| 可以用聚合函數？ | 不行 | 可以 |

### SQL 執行順序

\\`\\`\\`
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
\\`\\`\\`

---

## 23-5：字串與日期處理

### 常用字串函數

| 函數 | 用途 |
|------|------|
| LOWER(s) / UPPER(s) | 大小寫轉換 |
| TRIM(s) | 去除前後空格 |
| REPLACE(s, old, new) | 取代 |
| SUBSTR(s, start, len) | 截取子字串 |
| LENGTH(s) | 字串長度 |

### 日期處理（SQLite）

\\`\\`\\`sql
SUBSTR(order_date, 1, 7)  -- 取年月 '2024-01'
JULIANDAY('2024-02-01') - JULIANDAY('2024-01-15')  -- 天數差
DATE('now', '-7 days')  -- 7 天前
\\`\\`\\`

---

## 23-6：Boss — 基礎查詢綜合挑戰

Boss 關卡會給你一個完整的業務場景和多張資料表，你需要：

1. **理解需求**：PM 或主管要什麼資訊？
2. **選對資料表**：哪些表有你需要的欄位？
3. **寫出查詢**：組合 SELECT / WHERE / GROUP BY / ORDER BY
4. **解讀結果**：查詢結果能回答什麼業務問題？

---

## 本章重點回顧

| 技能 | 你要會的 |
|------|---------|
| 資料表概念 | 看懂 schema、理解 PK/FK 關聯 |
| 基本查詢 | SELECT + WHERE 多條件篩選 |
| 排序篩選 | ORDER BY / IN / BETWEEN / LIKE |
| 聚合分組 | GROUP BY + HAVING + 五大聚合函數 |
| 字串日期 | 基本的資料清理和日期運算 |
| SQL 執行順序 | FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY |

"""

    static let enWorld23: String = """

# World 23: SQL Basic Queries

> SQL is the language of data analysis. Master basic queries and you can pull the answers you need directly from the database.

Whether you're pursuing Product Analyst or Business Engineer roles, basic SQL queries are a skill you'll use every day.
This chapter starts from the most fundamental concepts and takes you to the point where you can independently write complete queries.

---

## 23-1: Database & Table Fundamentals

### What Is a Database?

A database is a system that stores data in an organized way. Think of it as an Excel file, but much more powerful:

| Concept | Excel Analogy | Description |
|---------|--------------|-------------|
| Database | The entire Excel file | A collection of related tables |
| Table | A worksheet (Sheet) | Stores a specific type of data |
| Row | A row | A single data record |
| Column | A column | A data attribute |

### Primary Key & Foreign Key

**Primary Key (PK)**: A unique identifier for each record. Like a student ID or social security number.

**Foreign Key (FK)**: Points to another table's Primary Key, establishing a relationship between tables.

\\`\\`\\`
customers table:
| id (PK) | name    | email           |
|---------|---------|-----------------|
| 101     | Alice   | alice@mail.com  |
| 102     | Bob     | bob@mail.com    |

orders table:
| id (PK) | customer_id (FK) | amount | order_date |
|---------|------------------|--------|------------|
| 1       | 101              | 250    | 2024-01-15 |
| 2       | 102              | 180    | 2024-01-20 |
\\`\\`\\`

The \\`customer_id\\` in the orders table is a Foreign Key pointing to the \\`id\\` in the customers table.

### What Is a Schema?

A schema describes a table's structure: which columns it has, the data type of each column, and constraints.

\\`\\`\\`sql
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  city TEXT
);
\\`\\`\\`

You don't need to memorize syntax for interviews, but you should be able to read a schema and say "this table has these columns and can answer these questions."

---

## 23-2: Deep Dive into SELECT / FROM / WHERE

### Basic SQL Query Structure

\\`\\`\\`sql
SELECT column1, column2     -- What you want to see
FROM table_name              -- Which table
WHERE condition              -- What to filter
\\`\\`\\`

### Multi-Condition Filtering

Use AND, OR, NOT to combine multiple conditions:

\\`\\`\\`sql
-- Completed orders from Taipei
SELECT * FROM orders
WHERE city = 'Taipei' AND status = 'completed';

-- Orders from Taipei or Kaohsiung
SELECT * FROM orders
WHERE city = 'Taipei' OR city = 'Kaohsiung';

-- Non-cancelled orders
SELECT * FROM orders
WHERE NOT status = 'cancelled';
\\`\\`\\`

### DISTINCT for Deduplication

\\`\\`\\`sql
-- How many distinct cities?
SELECT DISTINCT city FROM customers;
\\`\\`\\`

### Column Alias

\\`\\`\\`sql
SELECT name AS customer_name, email AS contact_email
FROM customers;
\\`\\`\\`

### Interview Tips

In interviews, verbalize your thought process first:
> "I need to pull data from the orders table, filter for status = completed and amount > 100, and I only need the customer_id and amount columns."

---

## 23-3: Sorting & Advanced Filtering

### ORDER BY for Sorting

\\`\\`\\`sql
-- Sort by amount descending
SELECT * FROM orders ORDER BY amount DESC;

-- Sort by city first, then by amount within each city
SELECT * FROM orders ORDER BY city ASC, amount DESC;
\\`\\`\\`

### IN — Multi-Value Matching

\\`\\`\\`sql
SELECT * FROM customers
WHERE city IN ('Taipei', 'Kaohsiung', 'Taichung');
\\`\\`\\`

### BETWEEN — Range Filtering

\\`\\`\\`sql
SELECT * FROM orders
WHERE amount BETWEEN 100 AND 500;
\\`\\`\\`

### LIKE — Pattern Matching

| Symbol | Meaning | Example |
|--------|---------|---------|
| % | Any number of characters | 'A%' → Alice, Amy |
| _ | Exactly one character | 'B_b' → Bob |

---

## 23-4: Deep Dive into Aggregate Functions

### The Five Core Aggregate Functions

| Function | Purpose | Example |
|----------|---------|---------|
| COUNT(*) | Count rows | How many orders? |
| COUNT(DISTINCT col) | Count unique values | How many distinct customers? |
| SUM(col) | Sum | What's the total revenue? |
| AVG(col) | Average | Average order amount? |
| MIN(col) / MAX(col) | Minimum / Maximum | Highest single purchase? |

### GROUP BY + HAVING

\\`\\`\\`sql
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 5;
\\`\\`\\`

### WHERE vs HAVING

| | WHERE | HAVING |
|---|-------|--------|
| When it filters | Before aggregation | After aggregation |
| Can use aggregate functions? | No | Yes |

### SQL Execution Order

\\`\\`\\`
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
\\`\\`\\`

---

## 23-5: String & Date Processing

### Common String Functions

| Function | Purpose |
|----------|---------|
| LOWER(s) / UPPER(s) | Case conversion |
| TRIM(s) | Remove leading/trailing whitespace |
| REPLACE(s, old, new) | Replacement |
| SUBSTR(s, start, len) | Extract substring |
| LENGTH(s) | String length |

### Date Processing (SQLite)

\\`\\`\\`sql
SUBSTR(order_date, 1, 7)  -- Extract year-month '2024-01'
JULIANDAY('2024-02-01') - JULIANDAY('2024-01-15')  -- Day difference
DATE('now', '-7 days')  -- 7 days ago
\\`\\`\\`

---

## 23-6: Boss — Basic Query Comprehensive Challenge

The Boss challenge gives you a complete business scenario with multiple tables, and you need to:

1. **Understand the requirements**: What information does the PM or manager need?
2. **Choose the right tables**: Which tables have the columns you need?
3. **Write the query**: Combine SELECT / WHERE / GROUP BY / ORDER BY
4. **Interpret the results**: What business questions does the query output answer?

---

## Chapter Summary

| Skill | What You Should Know |
|-------|---------------------|
| Table concepts | Read a schema, understand PK/FK relationships |
| Basic queries | SELECT + multi-condition WHERE filtering |
| Sorting & filtering | ORDER BY / IN / BETWEEN / LIKE |
| Aggregation & grouping | GROUP BY + HAVING + the five core aggregate functions |
| Strings & dates | Basic data cleaning and date arithmetic |
| SQL execution order | FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY |

"""

    static let zhWorld24: String = """

# World 24：SQL 分析核心

> 真正的分析力從這裡開始。學會把多張表連起來、處理缺失值、用 CTE 拆解複雜問題。

基礎查詢讓你能從一張表拿資料，但真實世界的資料分散在多張表。
這一章教你把資料整合在一起，處理髒資料，並用結構化的方式寫複雜查詢。

---

## 24-1：多表連接進階

### JOIN 的四種類型

| 類型 | 保留什麼 | 常見用途 |
|------|---------|---------|
| INNER JOIN | 兩邊都有的 | 有訂單的客戶 |
| LEFT JOIN | 左邊全部 + 右邊匹配的 | 所有客戶（含沒下單的） |
| RIGHT JOIN | 右邊全部 + 左邊匹配的 | 所有訂單（含客戶已刪除的） |
| FULL JOIN | 兩邊全部 | 完整對照兩個集合 |

### 三表 JOIN

\\`\\`\\`sql
SELECT c.name, o.amount, p.name AS product_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;
\\`\\`\\`

### LEFT JOIN 找「不存在」

\\`\\`\\`sql
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
\\`\\`\\`

---

## 24-2：條件邏輯與 NULL 處理

### CASE WHEN — SQL 的 if-else

\\`\\`\\`sql
SELECT customer_id,
       SUM(amount) AS total,
       CASE
         WHEN SUM(amount) >= 1000 THEN 'VIP'
         WHEN SUM(amount) >= 300 THEN 'Regular'
         ELSE 'Light'
       END AS segment
FROM orders
GROUP BY customer_id;
\\`\\`\\`

### NULL 的陷阱

\\`\\`\\`sql
-- 錯誤：WHERE column = NULL（永遠是 false）
-- 正確：WHERE column IS NULL
\\`\\`\\`

### COALESCE — 處理 NULL 的預設值

\\`\\`\\`sql
SELECT name, COALESCE(phone, email, 'No contact') AS contact
FROM customers;
\\`\\`\\`

---

## 24-3：子查詢

### WHERE 子查詢

\\`\\`\\`sql
SELECT * FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);
\\`\\`\\`

### Correlated Subquery

\\`\\`\\`sql
SELECT * FROM orders o1
WHERE order_date = (
  SELECT MAX(order_date) FROM orders o2
  WHERE o2.customer_id = o1.customer_id
);
\\`\\`\\`

### EXISTS

\\`\\`\\`sql
SELECT * FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);
\\`\\`\\`

---

## 24-4：CTE 與多層查詢

### WITH 語法

\\`\\`\\`sql
WITH monthly_revenue AS (
  SELECT SUBSTR(order_date, 1, 7) AS month, SUM(amount) AS revenue
  FROM orders GROUP BY SUBSTR(order_date, 1, 7)
)
SELECT * FROM monthly_revenue WHERE revenue > 10000;
\\`\\`\\`

### 多層 CTE

\\`\\`\\`sql
WITH
  customer_totals AS (...),
  customer_segments AS (...)
SELECT segment, COUNT(*), AVG(total)
FROM customer_segments GROUP BY segment;
\\`\\`\\`

面試建議：複雜查詢一律用 CTE，展示你的邏輯清晰度。

---

## 24-5：資料清理與品質檢查

### 找重複

\\`\\`\\`sql
SELECT email, COUNT(*) FROM customers GROUP BY email HAVING COUNT(*) > 1;
\\`\\`\\`

### 找缺失值

\\`\\`\\`sql
SELECT
  SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
  ROUND(SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct
FROM customers;
\\`\\`\\`

### 資料品質檢查清單

1. 有沒有重複？（COUNT vs COUNT DISTINCT）
2. 有沒有 NULL？（會影響聚合結果嗎？）
3. 資料範圍合理嗎？（金額、日期）
4. 分類值一致嗎？（'completed' vs 'Completed'）

---

## 24-6：Boss — 資料整合分析

Boss 關卡考你整合本章所有技能：多表 JOIN + CASE WHEN + CTE + 品質檢查。

---

## 本章重點回顧

| 技能 | 你要會的 |
|------|---------|
| JOIN 進階 | 四種 JOIN + 三表 JOIN + 反向查找 |
| CASE WHEN | 分群、標記、轉換 |
| NULL 處理 | IS NULL / COALESCE / COUNT 差異 |
| 子查詢 | WHERE / SELECT / correlated / EXISTS |
| CTE | WITH 語法、多層拆解、提高可讀性 |
| 資料清理 | 重複、缺失、一致性、outlier |

"""

    static let enWorld24: String = """

# World 24: SQL Analytical Core

> Real analytical power starts here. Learn to join multiple tables, handle missing values, and break down complex problems with CTEs.

Basic queries let you pull data from a single table, but real-world data is spread across multiple tables.
This chapter teaches you how to integrate data, handle dirty data, and write complex queries in a structured way.

---

## 24-1: Advanced Multi-Table Joins

### The Four Types of JOINs

| Type | What It Keeps | Common Use Case |
|------|--------------|-----------------|
| INNER JOIN | Rows present in both sides | Customers with orders |
| LEFT JOIN | All left rows + matching right rows | All customers (including those without orders) |
| RIGHT JOIN | All right rows + matching left rows | All orders (including those with deleted customers) |
| FULL JOIN | All rows from both sides | Complete comparison of two sets |

### Three-Table JOIN

\\`\\`\\`sql
SELECT c.name, o.amount, p.name AS product_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;
\\`\\`\\`

### LEFT JOIN to Find "Does Not Exist"

\\`\\`\\`sql
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
\\`\\`\\`

---

## 24-2: Conditional Logic & NULL Handling

### CASE WHEN — SQL's if-else

\\`\\`\\`sql
SELECT customer_id,
       SUM(amount) AS total,
       CASE
         WHEN SUM(amount) >= 1000 THEN 'VIP'
         WHEN SUM(amount) >= 300 THEN 'Regular'
         ELSE 'Light'
       END AS segment
FROM orders
GROUP BY customer_id;
\\`\\`\\`

### The NULL Trap

\\`\\`\\`sql
-- Wrong: WHERE column = NULL (always evaluates to false)
-- Correct: WHERE column IS NULL
\\`\\`\\`

### COALESCE — Default Values for NULLs

\\`\\`\\`sql
SELECT name, COALESCE(phone, email, 'No contact') AS contact
FROM customers;
\\`\\`\\`

---

## 24-3: Subqueries

### WHERE Subquery

\\`\\`\\`sql
SELECT * FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);
\\`\\`\\`

### Correlated Subquery

\\`\\`\\`sql
SELECT * FROM orders o1
WHERE order_date = (
  SELECT MAX(order_date) FROM orders o2
  WHERE o2.customer_id = o1.customer_id
);
\\`\\`\\`

### EXISTS

\\`\\`\\`sql
SELECT * FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);
\\`\\`\\`

---

## 24-4: CTEs & Multi-Layer Queries

### WITH Syntax

\\`\\`\\`sql
WITH monthly_revenue AS (
  SELECT SUBSTR(order_date, 1, 7) AS month, SUM(amount) AS revenue
  FROM orders GROUP BY SUBSTR(order_date, 1, 7)
)
SELECT * FROM monthly_revenue WHERE revenue > 10000;
\\`\\`\\`

### Multi-Layer CTEs

\\`\\`\\`sql
WITH
  customer_totals AS (...),
  customer_segments AS (...)
SELECT segment, COUNT(*), AVG(total)
FROM customer_segments GROUP BY segment;
\\`\\`\\`

Interview tip: Always use CTEs for complex queries — it demonstrates clear logical thinking.

---

## 24-5: Data Cleaning & Quality Checks

### Finding Duplicates

\\`\\`\\`sql
SELECT email, COUNT(*) FROM customers GROUP BY email HAVING COUNT(*) > 1;
\\`\\`\\`

### Finding Missing Values

\\`\\`\\`sql
SELECT
  SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
  ROUND(SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct
FROM customers;
\\`\\`\\`

### Data Quality Checklist

1. Are there duplicates? (COUNT vs COUNT DISTINCT)
2. Are there NULLs? (Will they affect aggregation results?)
3. Are data ranges reasonable? (amounts, dates)
4. Are categorical values consistent? ('completed' vs 'Completed')

---

## 24-6: Boss — Data Integration Analysis

The Boss challenge tests you on combining all skills from this chapter: multi-table JOINs + CASE WHEN + CTEs + quality checks.

---

## Chapter Summary

| Skill | What You Should Know |
|-------|---------------------|
| Advanced JOINs | Four JOIN types + three-table JOINs + reverse lookups |
| CASE WHEN | Segmentation, labeling, transformation |
| NULL handling | IS NULL / COALESCE / COUNT differences |
| Subqueries | WHERE / SELECT / correlated / EXISTS |
| CTEs | WITH syntax, multi-layer decomposition, improved readability |
| Data cleaning | Duplicates, missing values, consistency, outliers |

"""

    static let zhWorld25: String = """

# World 25：SQL 進階分析

> 這是 Product Analyst 的核心技能。學會用 SQL 做 Funnel、Segmentation、Retention 分析。

基礎查詢讓你拿到資料，進階分析讓你從資料中提煉出 insight。
這一章的內容直接對應面試中最常考的分析場景。

---

## 25-1：Window Functions 實戰

### ROW_NUMBER vs RANK vs DENSE_RANK

\\`\\`\\`
成績：100, 90, 90, 80
ROW_NUMBER: 1, 2, 3, 4
RANK:       1, 2, 2, 4
DENSE_RANK: 1, 2, 2, 3
\\`\\`\\`

### 累計加總（Running Total）

\\`\\`\\`sql
SELECT order_date, amount,
       SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
\\`\\`\\`

### 移動平均

\\`\\`\\`sql
AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
\\`\\`\\`

### NTILE — 分位數分群

\\`\\`\\`sql
NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
\\`\\`\\`

---

## 25-2：Funnel Analysis

### SQL Funnel 查詢

\\`\\`\\`sql
WITH funnel AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event = 'visit' THEN user_id END) AS step1,
    COUNT(DISTINCT CASE WHEN event = 'add_to_cart' THEN user_id END) AS step2,
    COUNT(DISTINCT CASE WHEN event = 'payment' THEN user_id END) AS step3
  FROM events
)
SELECT *, ROUND(step3 * 100.0 / step1, 1) AS conversion FROM funnel;
\\`\\`\\`

### 重點：Drop-off、Conversion rate、分群比較

---

## 25-3：Segmentation

### 用 CASE WHEN 建立分群

\\`\\`\\`sql
CASE
  WHEN COUNT(*) >= 10 THEN 'Power'
  WHEN COUNT(*) >= 5 THEN 'Active'
  WHEN COUNT(*) >= 1 THEN 'Casual'
  ELSE 'Dormant'
END AS segment
\\`\\`\\`

### 常見分群維度

用戶類型、地區、渠道、產品層級、行為活躍度

---

## 25-4：Retention / Cohort Analysis

### Cohort 與 Retention

\\`\\`\\`sql
WITH user_cohort AS (
  SELECT user_id, SUBSTR(MIN(event_date), 1, 7) AS cohort_month
  FROM events WHERE event = 'signup' GROUP BY user_id
),
user_activity AS (
  SELECT DISTINCT user_id, SUBSTR(event_date, 1, 7) AS active_month
  FROM events
)
SELECT uc.cohort_month, ua.active_month,
       COUNT(DISTINCT ua.user_id) AS active_users
FROM user_cohort uc
JOIN user_activity ua ON uc.user_id = ua.user_id
GROUP BY uc.cohort_month, ua.active_month;
\\`\\`\\`

---

## 25-5：KPI 與 Dashboard Query Design

### Dashboard 三種表

1. **Summary table**：核心指標的當前值
2. **Trend table**：指標隨時間的變化
3. **Breakdown table**：按維度拆解的數字

### 設計原則

可重複執行、效能考量、輸出乾淨、業務可讀

---

## 25-6：Boss — 產品分析 SQL Case

模擬 Product Analyst 面試：給你表和業務問題，寫完整的分析 SQL。

---

## 本章重點回顧

| 技能 | 面試考什麼 | 你要能做到 |
|------|-----------|-----------|
| Window Functions | 排名、累計、移動平均 | 寫出 OVER + PARTITION BY |
| Funnel Analysis | 每步轉換率、drop-off | 用 CASE WHEN + COUNT DISTINCT |
| Segmentation | 分群比較差異 | 定義分群 → 比較指標 |
| Retention | Cohort 留存率 | 建 cohort → 算回訪率 |
| Dashboard Query | 可重複、可讀的報表查詢 | 設計 summary / trend / breakdown |

"""

    static let enWorld25: String = """

# World 25: SQL Advanced Analytics

> This is the core skill set of a Product Analyst. Learn to use SQL for Funnel, Segmentation, and Retention analysis.

Basic queries let you retrieve data; advanced analytics let you extract insights from it.
The content of this chapter directly maps to the most commonly tested analytical scenarios in interviews.

---

## 25-1: Window Functions in Practice

### ROW_NUMBER vs RANK vs DENSE_RANK

\\`\\`\\`
Scores: 100, 90, 90, 80
ROW_NUMBER: 1, 2, 3, 4
RANK:       1, 2, 2, 4
DENSE_RANK: 1, 2, 2, 3
\\`\\`\\`

### Running Total

\\`\\`\\`sql
SELECT order_date, amount,
       SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
\\`\\`\\`

### Moving Average

\\`\\`\\`sql
AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
\\`\\`\\`

### NTILE — Quantile-Based Segmentation

\\`\\`\\`sql
NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
\\`\\`\\`

---

## 25-2: Funnel Analysis

### SQL Funnel Query

\\`\\`\\`sql
WITH funnel AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event = 'visit' THEN user_id END) AS step1,
    COUNT(DISTINCT CASE WHEN event = 'add_to_cart' THEN user_id END) AS step2,
    COUNT(DISTINCT CASE WHEN event = 'payment' THEN user_id END) AS step3
  FROM events
)
SELECT *, ROUND(step3 * 100.0 / step1, 1) AS conversion FROM funnel;
\\`\\`\\`

### Key Concepts: Drop-off, Conversion Rate, Segment Comparison

---

## 25-3: Segmentation

### Building Segments with CASE WHEN

\\`\\`\\`sql
CASE
  WHEN COUNT(*) >= 10 THEN 'Power'
  WHEN COUNT(*) >= 5 THEN 'Active'
  WHEN COUNT(*) >= 1 THEN 'Casual'
  ELSE 'Dormant'
END AS segment
\\`\\`\\`

### Common Segmentation Dimensions

User type, region, channel, product tier, behavioral activity level

---

## 25-4: Retention / Cohort Analysis

### Cohort & Retention

\\`\\`\\`sql
WITH user_cohort AS (
  SELECT user_id, SUBSTR(MIN(event_date), 1, 7) AS cohort_month
  FROM events WHERE event = 'signup' GROUP BY user_id
),
user_activity AS (
  SELECT DISTINCT user_id, SUBSTR(event_date, 1, 7) AS active_month
  FROM events
)
SELECT uc.cohort_month, ua.active_month,
       COUNT(DISTINCT ua.user_id) AS active_users
FROM user_cohort uc
JOIN user_activity ua ON uc.user_id = ua.user_id
GROUP BY uc.cohort_month, ua.active_month;
\\`\\`\\`

---

## 25-5: KPI & Dashboard Query Design

### Three Types of Dashboard Tables

1. **Summary table**: Current values of core metrics
2. **Trend table**: How metrics change over time
3. **Breakdown table**: Numbers broken down by dimension

### Design Principles

Repeatable execution, performance considerations, clean output, business readability

---

## 25-6: Boss — Product Analytics SQL Case

Simulates a Product Analyst interview: given tables and a business problem, write complete analytical SQL.

---

## Chapter Summary

| Skill | What's Tested | What You Need to Do |
|-------|---------------|---------------------|
| Window Functions | Ranking, running totals, moving averages | Write OVER + PARTITION BY |
| Funnel Analysis | Step-by-step conversion rate, drop-off | Use CASE WHEN + COUNT DISTINCT |
| Segmentation | Compare differences across segments | Define segments → compare metrics |
| Retention | Cohort retention rate | Build cohorts → calculate return rate |
| Dashboard Query | Repeatable, readable report queries | Design summary / trend / breakdown |

"""

    static let zhWorld26: String = """

# World 26：SQL 工程應用

> 不只會讀資料，還要會寫入、設計表結構、跟應用程式整合。這是 Business Engineer 的必備技能。

前面三章都在「讀」資料（SELECT），這一章教你「寫」資料和設計資料。

---

## 26-1：INSERT / UPDATE / DELETE

### INSERT

\\`\\`\\`sql
INSERT INTO customers (id, name, email, city)
VALUES (106, 'Frank', 'frank@mail.com', 'Taipei');
\\`\\`\\`

### UPDATE（永遠先寫 WHERE！）

\\`\\`\\`sql
UPDATE orders SET status = 'cancelled' WHERE id = 3;
\\`\\`\\`

### DELETE

\\`\\`\\`sql
DELETE FROM orders WHERE status = 'cancelled' AND order_date < '2023-01-01';
\\`\\`\\`

安全做法：先 SELECT 確認影響範圍，再改成 UPDATE/DELETE。

---

## 26-2：CREATE TABLE 與資料型態

### 常用型態（SQLite）

| 型態 | 用途 |
|------|------|
| INTEGER | 整數（id, count） |
| REAL | 浮點數（price, rate） |
| TEXT | 文字（name, email） |

### 常用約束

PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, CHECK, FOREIGN KEY

---

## 26-3：CRUD 與應用程式資料流

### CRUD 對應

| 操作 | SQL | HTTP Method |
|------|-----|------------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT/PATCH |
| Delete | DELETE | DELETE |

### Web App 資料流

用戶操作 → 前端 → API → 後端 → SQL → 資料庫 → 回傳

---

## 26-4：SQL 與 Python 整合

### pandas + SQL

\\`\\`\\`python
import sqlite3, pandas as pd
conn = sqlite3.connect('shop.db')
df = pd.read_sql('SELECT * FROM orders WHERE amount > 100', conn)
\\`\\`\\`

### 避免 SQL Injection

\\`\\`\\`python
# 安全：用參數化查詢
cursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))
\\`\\`\\`

---

## 26-5：權限、資料隔離與 Query Performance

### 角色權限

Analyst: SELECT | Engineer: SELECT+INSERT+UPDATE | DBA: 全部

### Index

\\`\\`\\`sql
CREATE INDEX idx_orders_date ON orders(order_date);
\\`\\`\\`

常用在 WHERE、JOIN、ORDER BY 的欄位建 index。

### 效能陷阱

避免 SELECT *、沒有 WHERE 的全表掃描、在函數裡包 column。

---

## 26-6：Boss — 系統設計 SQL Case

設計 table schema + 核心 CRUD 查詢 + 資料安全 + 效能考量。

---

## 本章重點回顧

| 技能 | 你要會的 |
|------|---------|
| DML 操作 | INSERT / UPDATE / DELETE + 安全意識 |
| Schema 設計 | CREATE TABLE + 資料型態 + 約束 |
| CRUD 思維 | 理解 Web App 的資料操作流程 |
| Python 整合 | pandas + SQL、參數化查詢 |
| 權限與效能 | 角色權限概念、index、query 優化 |

"""

    static let enWorld26: String = """

# World 26: SQL Engineering Applications

> Beyond reading data — learn to write data, design table structures, and integrate with applications. These are essential skills for a Business Engineer.

The previous three chapters focused on "reading" data (SELECT). This chapter teaches you how to "write" data and design data structures.

---

## 26-1: INSERT / UPDATE / DELETE

### INSERT

\\`\\`\\`sql
INSERT INTO customers (id, name, email, city)
VALUES (106, 'Frank', 'frank@mail.com', 'Taipei');
\\`\\`\\`

### UPDATE (Always write the WHERE clause first!)

\\`\\`\\`sql
UPDATE orders SET status = 'cancelled' WHERE id = 3;
\\`\\`\\`

### DELETE

\\`\\`\\`sql
DELETE FROM orders WHERE status = 'cancelled' AND order_date < '2023-01-01';
\\`\\`\\`

Safety practice: First run a SELECT to confirm the affected rows, then change it to UPDATE/DELETE.

---

## 26-2: CREATE TABLE & Data Types

### Common Data Types (SQLite)

| Type | Use Case |
|------|----------|
| INTEGER | Integers (id, count) |
| REAL | Floating point numbers (price, rate) |
| TEXT | Text (name, email) |

### Common Constraints

PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, CHECK, FOREIGN KEY

---

## 26-3: CRUD & Application Data Flow

### CRUD Mapping

| Operation | SQL | HTTP Method |
|-----------|-----|------------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT/PATCH |
| Delete | DELETE | DELETE |

### Web App Data Flow

User action → Frontend → API → Backend → SQL → Database → Response

---

## 26-4: SQL & Python Integration

### pandas + SQL

\\`\\`\\`python
import sqlite3, pandas as pd
conn = sqlite3.connect('shop.db')
df = pd.read_sql('SELECT * FROM orders WHERE amount > 100', conn)
\\`\\`\\`

### Preventing SQL Injection

\\`\\`\\`python
# Safe: Use parameterized queries
cursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))
\\`\\`\\`

---

## 26-5: Permissions, Data Isolation & Query Performance

### Role-Based Permissions

Analyst: SELECT | Engineer: SELECT+INSERT+UPDATE | DBA: Full access

### Index

\\`\\`\\`sql
CREATE INDEX idx_orders_date ON orders(order_date);
\\`\\`\\`

Create indexes on columns frequently used in WHERE, JOIN, and ORDER BY clauses.

### Performance Pitfalls

Avoid SELECT *, full table scans without WHERE, and wrapping columns inside functions.

---

## 26-6: Boss — System Design SQL Case

Design a table schema + core CRUD queries + data security + performance considerations.

---

## Chapter Summary

| Skill | What You Should Know |
|-------|---------------------|
| DML Operations | INSERT / UPDATE / DELETE + safety awareness |
| Schema Design | CREATE TABLE + data types + constraints |
| CRUD Mindset | Understand the data operation flow of a web app |
| Python Integration | pandas + SQL, parameterized queries |
| Permissions & Performance | Role-based permission concepts, indexes, query optimization |

"""

    static let zhWorld39: String = """

# World 39：談判引擎與模擬系統

> **目標：** 理解 DI 怎麼用博弈論幫你跟供應商談判、怎麼用模擬系統在下單前先「演練」一遍
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 39-1：CFR 是什麼 — 用 AI 練習談判一萬次

### 先想一個場景

你是採購經理，要跟供應商談明年的原料價格。你不知道對方有多急著賣（也許他庫存滿了急著出貨，也許他訂單滿了根本不缺你這個客戶）。你只知道自己的情況：預算有限、交期緊迫。

**你該接受對方的報價？還是還價？還是直接走人找別家？**

如果你能模擬一萬次談判，每次嘗試不同的策略，然後統計「哪種策略平均下來賺最多」——你就知道最佳策略了。

**CFR+（Counterfactual Regret Minimization Plus）就是做這件事的演算法。**

### 白話解釋 CFR+

1. **模擬上萬次談判**（預設 50,000 次）
   - 每次隨機抽一種供應商類型（激進型 / 合作型 / 急售型）
   - 從頭到尾走完一次談判（3 輪：開場 → 讓步 → 收場）

2. **每次談判結束後算「後悔值」**
   - 「後悔」= 如果我當初選了另一個動作，我會多賺多少？
   - 例如：我選了「還價」賺了 +0.3，但如果選「接受」能賺 +0.5 → 後悔值 = 0.2

3. **根據後悔值調整策略**
   - 高後悔的動作 → 下次多做一點
   - 低後悔的動作 → 下次少做一點
   - 「+」的改進是把負的後悔值歸零，只學「應該多做什麼」，收斂更快

4. **跑夠多次後收斂到 Nash Equilibrium（納許均衡）**
   - 白話講：不管對方怎麼變招，你的策略都不會吃虧
   - 這有數學保證，不是 ChatGPT 那種「聽起來有道理」的建議

### 為什麼不直接用 ChatGPT 談判？

ChatGPT 可以幫你想談判話術，但它沒有**數學保證**。CFR+ 的策略是經過 50,000 次模擬收斂出來的，在博弈論上是最優的。

> 💡 **面試官可能會追問：**
> 「Nash Equilibrium 是什麼？」
> → 雙方都沒有動機改變策略的狀態。我用策略 A、你用策略 B，我改成 C 不會更好，你改成 D 也不會更好 — 那 (A, B) 就是均衡點。

---

## 39-2：博弈樹與 Position Buckets

### 談判怎麼變成一棵決策樹？

CFR 把談判建模成一棵**決策樹**：

\\`\\`\\`
第 0 步：機率節點 — 隨機抽供應商類型
├── 30% 激進型
├── 50% 合作型
└── 20% 急售型

第 1 步（開場輪）：買方選擇
├── 接受 → 談判結束，算報酬
├── 拒絕 → 供應商回應
└── 還價 → 供應商回應
    ├── 接受 / 拒絕 / 還價 → 進入讓步輪

第 2 步（讓步輪）：同樣結構

第 3 步（收場輪）：拒絕 = 直接走人
\\`\\`\\`

### 隱藏資訊 — 為什麼需要 CFR

如果雙方都攤牌，直接查表就好了。難的是**你不知道對方的底牌**：
- 買方看不到供應商是哪種類型（激進？急售？）
- 供應商看不到買方的談判籌碼有多大

程式碼裡用「資訊集」（info set）表示每個玩家能看到的資訊：
- \\`B|2|OPENING|\\` = 買方、中等籌碼、開場輪、沒有歷史動作
- \\`S|COOPERATIVE|OPENING|COUNTER\\` = 供應商、合作型、開場輪、買方剛還價

### Position Buckets — 你的談判籌碼

你的籌碼取決於供應鏈風險分數，分成 5 個等級：

| 風險分數 | Bucket | 等級 | 白話 |
|---------|--------|------|------|
| 0-39 | 4 | VERY_STRONG | 你有很多替代供應商，隨時可以換 |
| 40-79 | 3 | STRONG | 你有優勢，可以強硬一點 |
| 80-119 | 2 | NEUTRAL | 雙方勢均力敵 |
| 120-159 | 1 | WEAK | 供應商有優勢，你得妥協 |
| 160+ | 0 | VERY_WEAK | 你非常依賴這家，幾乎沒得談 |

風險分數看四個因素：供應集中度（有幾家替代？）、交期重要性（多急？）、市場可得性（容易買嗎？）、庫存緊迫度（快斷了嗎？）。

**CFR 會為每個 bucket 跑出不同的最佳策略。** VERY_STRONG 的人可以大膽還價，VERY_WEAK 的人應該多接受。

> 💡 **面試官可能會追問：**
> 「為什麼分 5 級而不是用連續分數？」
> → CFR 要為每種情況跑策略。連續分數（0-200）= 200 套策略，太多。5 個 bucket 夠精確又夠高效。這是精度和效率的取捨。

---

## 39-3：談判引擎的完整流程（10 步編排）

### 即時階段 — 使用者觸發談判

假設 solver 跑完後回報「預算不夠，無法達到 95% 服務水準」：

\\`\\`\\`
Step 1: 載入基礎資料（solver 結果、限制條件）
Step 2: 偵測觸發條件 → 「solver 不可行，需要談判」
Step 3: 生成 6 個標準談判選項
  → opt_001: 預算增加 10%
  → opt_002: 放寬最低訂購量（MOQ）
  → opt_003: 允許包裝尺寸四捨五入
  → opt_004: 啟用加急模式
  → opt_005: 增加安全庫存 20%
  → opt_006: 降低服務水準目標
Step 3.5: CFR 加權
  → 查表取得每個選項的博弈論權重
  → 例如：WEAK position 時，增加預算（接受型動作）權重最高
Step 4-6: 對每個選項重新跑 solver，評估效果
  → opt_001: 可行，成本增加 $12K，服務水準 96%
  → opt_002: 可行，成本不變，服務水準 94%
  → ...
Step 7-8: 用 LLM 寫報告
  → 「建議增加預算 10%。原因：(1) 這是唯一能達到 95% 的選項
     (2) CFR 策略支持在 WEAK position 做出讓步」
Step 9: 自動產生 email 草稿
Step 10: 回傳結果 + 儲存談判狀態（支援多輪談判）
\\`\\`\\`

### 報酬怎麼算？

| 結果 | 買方報酬 | 解釋 |
|------|---------|------|
| 雙方同意 | +0.30 + 每次成功讓步 +0.15 | 達成協議是好事 |
| 買方走人 | -0.40 | 供應鏈中斷成本很高 |
| 供應商走人 | -0.20 | 失去訂單但還能找別家 |

**走人的懲罰比接受壞條件更重。** 因為在供應鏈場景，斷供的成本通常遠高於多付一點價格。

> 💡 **面試官可能會追問：**
> 「如果 CFR 不可用（第一次用還沒跑過），怎麼辦？」
> → Graceful fallback：6 個選項照常生成、solver 照常評估，只是不加 CFR 權重。排名改為純粹按可行性 → 服務改善 → 成本改善排序。

---

## 39-4：Digital Twin — 在真的下單前先「演練」一遍

### 什麼是 Digital Twin？

你做好了採購計畫，但你怎麼知道這個計畫在真實世界會不會出問題？

**Digital Twin 就是在電腦裡建一個你的供應鏈的「分身」，模擬 365 天看會不會出問題。** 就像飛行模擬器 — 你不會第一次飛就開真飛機。

### 五個模擬模組

**1. DataGenerator — 生成虛擬需求**
模擬一年的每日需求量，包含趨勢、季節性、隨機波動和突發衝擊。

**2. ChaosEngine — 製造各種災難**
每天隨機生成壞事：供應商延遲、港口罷工、品質問題、需求暴增、原料短缺。
有一個狠的設定：**如果你庫存已經很低，壞事機率自動 ×1.5**（墨菲定律模擬）。

**3. InventorySimulator — 模擬庫存每天的變化**
每天跑一個循環：收到貨 → 扣掉瑕疵品 → 滿足需求（不夠就缺貨）→ 算成本 → 要不要補貨？

**4. Orchestrator — 串起所有模組**
把上面三個接在一起，跑 365 天的模擬。每 N 天還會重新跑一次預測（模擬實際使用時會定期更新預測）。

**5. FeedbackLoop — 看結果、給建議**
分析模擬的 KPI。如果 fill_rate < 95% → 建議安全庫存上調 25% → 回饋給 solver 重新計算。

> 💡 **面試官可能會追問：**
> 「模擬可靠嗎？」
> → 模擬不是預測未來，是測試計畫的韌性。同一個計畫跑「正常」「波動」「災難」「旺季」四種場景，如果在「正常」OK 但在「災難」崩潰，你就知道風險在哪。

---

## 39-5：四種模擬場景與反饋循環

### 四個預置場景

| 場景 | 需求 | 供應商 | 混沌強度 | 用途 |
|------|------|--------|---------|------|
| **normal** | 低波動 | 98% 準時 | 低 | 基準 |
| **volatile** | 高季節性、促銷 | 85% 準時 | 高 | 真實市場 |
| **disaster** | 暴增暴跌 | 70% 準時 | 極高 | 壓力測試 |
| **seasonal** | Q4 +80% | 90% 準時 | 中 | 雙 11 / 黑五 |

### 反饋循環的運作

\\`\\`\\`
計畫 → 模擬 365 天 → 看結果
                      ↓
        fill_rate = 92%（不及格，目標 95%）
                      ↓
        FeedbackLoop 建議：安全庫存 +25%
                      ↓
        調整參數 → solver 重新計算 → 新計畫
                      ↓
        再模擬一次 → fill_rate = 97%（合格）
\\`\\`\\`

這就是「閉環」：不是做一版計畫就交差，而是**計畫 → 測試 → 發現問題 → 調整 → 再測試**，直到夠穩健。

---

## 39-6（Boss）：談判策略設計

### 情境

solver 跑完後回報「預算不夠，無法達到 95% 服務水準」。系統觸發談判引擎。

已知：
- 你的 risk_score = 120 → bucket 1（WEAK）
- 供應商準時率 72% → 推測 60% 激進型、30% 合作型、10% 急售型
- CFR 建議（WEAK + OPENING）：Accept 55%、Counter 35%、Reject 10%
- Digital Twin 模擬結果：如果不調整，fill_rate 只有 88%

### 你的任務

1. 為什麼 CFR 建議「接受」機率最高？跟你的 position 有什麼關係？
2. 6 個選項你會怎麼排序？為什麼？
3. 如果你選擇還價，你會怎麼用模擬結果支撐你的立場？

### 評估標準

- 理解 WEAK position = 籌碼少 → 接受機率高是合理的
- 能結合業務邏輯排序選項
- 能用模擬數據（fill_rate 88%）作為談判證據
- 理解 CFR 是「建議」不是「命令」

"""

    static let enWorld39: String = """

# World 39: Negotiation Engine and Simulation System

> **Objective:** Understand how DI uses game theory to help you negotiate with suppliers, and how the simulation system lets you "rehearse" before placing actual orders
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 39-1: What Is CFR — Using AI to Practice Negotiation 10,000 Times

### Start with a Scenario

You're a procurement manager negotiating next year's raw material prices with a supplier. You don't know how eager the other side is to sell (maybe they have excess inventory and urgently need to move it, or maybe they're fully booked and don't need your business). All you know is your own situation: limited budget, tight delivery timeline.

**Should you accept their quote? Counter-offer? Or walk away and find another supplier?**

If you could simulate 10,000 negotiations, trying different strategies each time, then tally up "which strategy yields the best average outcome" — you'd know the optimal strategy.

**CFR+ (Counterfactual Regret Minimization Plus) is the algorithm that does exactly this.**

### CFR+ in Plain Terms

1. **Simulate tens of thousands of negotiations** (default: 50,000)
   - Each time, randomly draw a supplier type (aggressive / cooperative / desperate-to-sell)
   - Play through an entire negotiation (3 rounds: opening → concession → closing)

2. **After each negotiation, calculate "regret"**
   - "Regret" = How much more would I have earned if I had chosen a different action?
   - Example: I chose "counter-offer" and earned +0.3, but if I had chosen "accept" I would've earned +0.5 → regret = 0.2

3. **Adjust the strategy based on regret**
   - High-regret actions → do more of them next time
   - Low-regret actions → do less of them next time
   - The "+" improvement zeros out negative regret, only learning "what to do more of," converging faster

4. **After enough iterations, converge to Nash Equilibrium**
   - In plain terms: no matter how the opponent changes tactics, your strategy won't lose
   - This has mathematical guarantees — it's not ChatGPT's kind of "sounds reasonable" advice

### Why Not Just Use ChatGPT to Negotiate?

ChatGPT can help you brainstorm negotiation talking points, but it has no **mathematical guarantees**. CFR+'s strategy is converged from 50,000 simulations and is optimal in game-theory terms.

> **Possible interview follow-up:**
> "What is Nash Equilibrium?"
> A state where neither side has an incentive to change strategy. I use strategy A, you use strategy B; if I switch to C it won't be better, and if you switch to D it won't be better — then (A, B) is the equilibrium point.

---

## 39-2: Game Tree and Position Buckets

### How Does a Negotiation Become a Decision Tree?

CFR models the negotiation as a **decision tree**:

\\`\\`\\`
Step 0: Chance node — randomly draw supplier type
├── 30% Aggressive
├── 50% Cooperative
└── 20% Desperate-to-sell

Step 1 (Opening round): Buyer chooses
├── Accept → Negotiation ends, calculate payoff
├── Reject → Supplier responds
└── Counter-offer → Supplier responds
    ├── Accept / Reject / Counter → Enter concession round

Step 2 (Concession round): Same structure

Step 3 (Closing round): Reject = walk away
\\`\\`\\`

### Hidden Information — Why CFR Is Needed

If both sides showed their cards, you could just look up the answer in a table. The hard part is that **you don't know the other side's hand**:
- The buyer can't see which supplier type they're facing (aggressive? desperate?)
- The supplier can't see the buyer's bargaining leverage

In the code, "information sets" (info set) represent what each player can see:
- \\`B|2|OPENING|\\` = Buyer, medium leverage, opening round, no action history
- \\`S|COOPERATIVE|OPENING|COUNTER\\` = Supplier, cooperative type, opening round, buyer just countered

### Position Buckets — Your Bargaining Power

Your leverage depends on the supply chain risk score, divided into 5 levels:

| Risk Score | Bucket | Level | Plain Explanation |
|---------|--------|------|------|
| 0-39 | 4 | VERY_STRONG | You have many alternative suppliers; you can switch anytime |
| 40-79 | 3 | STRONG | You have the advantage; you can push harder |
| 80-119 | 2 | NEUTRAL | Both sides are evenly matched |
| 120-159 | 1 | WEAK | The supplier has the advantage; you'll need to compromise |
| 160+ | 0 | VERY_WEAK | You're heavily dependent on this supplier; almost no room to negotiate |

The risk score considers four factors: supply concentration (how many alternatives?), lead time criticality (how urgent?), market availability (easy to source?), and inventory urgency (running low?).

**CFR generates a different optimal strategy for each bucket.** Someone with VERY_STRONG leverage can counter-offer boldly; someone with VERY_WEAK leverage should accept more often.

> **Possible interview follow-up:**
> "Why 5 levels instead of a continuous score?"
> CFR needs to generate a strategy for each situation. A continuous score (0-200) = 200 separate strategies — too many. 5 buckets are precise enough and efficient. This is a trade-off between precision and computational efficiency.

---

## 39-3: Complete Negotiation Engine Flow (10-Step Orchestration)

### Real-Time Phase — User Triggers Negotiation

Suppose the solver reports "budget insufficient to achieve 95% service level":

\\`\\`\\`
Step 1: Load base data (solver results, constraints)
Step 2: Detect trigger condition → "Solver infeasible, negotiation needed"
Step 3: Generate 6 standard negotiation options
  → opt_001: Increase budget by 10%
  → opt_002: Relax minimum order quantity (MOQ)
  → opt_003: Allow package size rounding
  → opt_004: Enable rush mode
  → opt_005: Increase safety stock by 20%
  → opt_006: Lower service level target
Step 3.5: CFR weighting
  → Look up game-theory weights for each option
  → Example: In a WEAK position, increasing budget (an acceptance-type action) gets the highest weight
Steps 4-6: Re-run the solver for each option to evaluate impact
  → opt_001: Feasible, cost increases $12K, service level 96%
  → opt_002: Feasible, no cost change, service level 94%
  → ...
Steps 7-8: Use LLM to write the report
  → "Recommend increasing budget by 10%. Reason: (1) This is the only option that achieves 95%
     (2) CFR strategy supports making concessions in a WEAK position"
Step 9: Auto-generate an email draft
Step 10: Return results + save negotiation state (supports multi-round negotiations)
\\`\\`\\`

### How Are Payoffs Calculated?

| Outcome | Buyer Payoff | Explanation |
|------|---------|------|
| Both agree | +0.30 + each successful concession +0.15 | Reaching an agreement is good |
| Buyer walks away | -0.40 | Supply chain disruption costs are high |
| Supplier walks away | -0.20 | Losing the order, but you can find another supplier |

**Walking away is penalized more than accepting unfavorable terms.** Because in supply chain scenarios, the cost of supply disruption typically far exceeds paying a slightly higher price.

> **Possible interview follow-up:**
> "What if CFR is unavailable (first-time use, hasn't been run yet)?"
> Graceful fallback: the 6 options are still generated, the solver still evaluates them — just without CFR weighting. Ranking falls back to pure feasibility → service improvement → cost improvement ordering.

---

## 39-4: Digital Twin — "Rehearse" Before Actually Placing Orders

### What Is a Digital Twin?

You've made a procurement plan, but how do you know it won't have problems in the real world?

**A Digital Twin builds a "clone" of your supply chain in a computer and simulates 365 days to see if problems arise.** Like a flight simulator — you wouldn't fly a real plane the first time.

### Five Simulation Modules

**1. DataGenerator — Generate synthetic demand**
Simulates one year of daily demand volume, including trends, seasonality, random fluctuations, and sudden shocks.

**2. ChaosEngine — Create various disasters**
Randomly generates bad events each day: supplier delays, port strikes, quality issues, demand spikes, raw material shortages.
There's one harsh setting: **if your inventory is already low, the probability of bad events automatically multiplies by 1.5** (Murphy's Law simulation).

**3. InventorySimulator — Simulate daily inventory changes**
Runs a daily cycle: receive goods → deduct defective items → fulfill demand (stockout if insufficient) → calculate costs → should we reorder?

**4. Orchestrator — Connect all modules together**
Links the three modules above and runs a 365-day simulation. Every N days, it also reruns the forecast (simulating how forecasts are periodically updated in real use).

**5. FeedbackLoop — Review results and make recommendations**
Analyzes simulation KPIs. If fill_rate < 95% → recommends increasing safety stock by 25% → feeds back to the solver for recalculation.

> **Possible interview follow-up:**
> "Is simulation reliable?"
> Simulation doesn't predict the future — it tests a plan's resilience. Run the same plan through "normal," "volatile," "disaster," and "peak season" scenarios. If it's OK in "normal" but collapses in "disaster," you know where the risk is.

---

## 39-5: Four Simulation Scenarios and Feedback Loop

### Four Preset Scenarios

| Scenario | Demand | Supplier | Chaos Intensity | Purpose |
|------|------|--------|---------|------|
| **normal** | Low volatility | 98% on-time | Low | Baseline |
| **volatile** | High seasonality, promotions | 85% on-time | High | Real market conditions |
| **disaster** | Surge and crash | 70% on-time | Extreme | Stress test |
| **seasonal** | Q4 +80% | 90% on-time | Medium | Black Friday / Singles' Day |

### How the Feedback Loop Works

\\`\\`\\`
Plan → Simulate 365 days → Check results
                            ↓
          fill_rate = 92% (failing, target 95%)
                            ↓
          FeedbackLoop recommends: safety stock +25%
                            ↓
          Adjust parameters → solver recalculates → new plan
                            ↓
          Simulate again → fill_rate = 97% (passing)
\\`\\`\\`

This is a "closed loop": not just producing one plan and calling it done, but **plan → test → find issues → adjust → retest** until it's robust enough.

---

## 39-6 (Boss): Negotiation Strategy Design

### Scenario

The solver reports "budget insufficient to achieve 95% service level." The system triggers the negotiation engine.

Known:
- Your risk_score = 120 → bucket 1 (WEAK)
- Supplier on-time rate 72% → estimated 60% aggressive, 30% cooperative, 10% desperate
- CFR recommendation (WEAK + OPENING): Accept 55%, Counter 35%, Reject 10%
- Digital Twin simulation result: if no adjustments, fill_rate is only 88%

### Your Task

1. Why does CFR recommend the highest probability for "accept"? How does this relate to your position?
2. How would you rank the 6 options? Why?
3. If you choose to counter-offer, how would you use the simulation results to support your position?

### Evaluation Criteria

- Understands WEAK position = low leverage → high accept probability is rational
- Can combine business logic to rank options
- Can use simulation data (fill_rate 88%) as negotiation evidence
- Understands CFR is a "recommendation," not a "command"

"""

    static let zhWorld40: String = """

# World 40：閉環學習系統

> **目標：** 理解 DI 怎麼偵測模型退化、怎麼自動重新訓練、怎麼從主管的回饋中學習
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 40-1：為什麼模型會退化

### 先想一個場景

你的預測模型上個月準確率 95%，這個月突然掉到 80%。不是模型壞了，是**世界變了**：

- 市場趨勢改了（原本穩定成長的品類突然下跌）
- 供應商換了（新供應商的交期特性不同）
- 產品組合不同了（停產的品項還在預測裡）
- 季節模式改了（今年的旺季提前了兩週）

這叫做 **drift（漂移）** — 模型是根據過去的數據訓練的，但現在的世界跟過去不一樣了。

### 兩種 drift

**Data Drift（輸入漂移）** — 輸入數據的分佈變了
- 以前的訂單量集中在 100-500 之間，現在突然出現大量 2,000+ 的訂單
- 模型沒見過這種數據，不知道怎麼預測

**Concept Drift（概念漂移）** — 輸入和輸出的關係變了
- 以前「促銷 → 銷量漲 50%」，現在市場飽和了，「促銷 → 銷量只漲 10%」
- 輸入一樣但輸出的模式不同了

> 💡 **面試官可能會追問：**
> 「Data Drift 和 Concept Drift 哪個更難處理？」
> → Concept Drift 更難。Data Drift 可以透過重新訓練解決（新數據分佈反映新現實）。但 Concept Drift 可能需要改模型架構或特徵工程，因為舊的輸入-輸出關係已經不成立了。

---

## 40-2：Drift Detection — 三個溫度計

### DI 怎麼偵測 drift？

在 \\`drift_monitor.py\\` 裡，系統用三個指標（像三支溫度計）監控模型健康：

**1. MAPE 變化（準確度溫度計）**

MAPE = Mean Absolute Percentage Error = 預測平均偏差百分比。

- 上個月 MAPE = 0.12（偏差 12%，正常）
- 這個月 MAPE = 0.25（偏差 25%，不正常）
- 差異 = +0.13 → 超過門檻 → 告警

白話：**「以前猜得蠻準，現在猜得很歪」**

**2. PSI（輸入分佈溫度計）**

PSI = Population Stability Index。它比較「訓練時的數據分佈」跟「現在的數據分佈」是否一致。

- PSI < 0.1 → 分佈穩定（正常）
- PSI 0.1-0.2 → 有點偏移（觀察）
- PSI > 0.2 → 顯著偏移（告警）

白話：**「輸入的數據長相變了」**

例如：以前的訂單量是 \\`[100, 200, 150, 300]\\`，現在變成 \\`[2000, 3000, 2500, 4000]\\`。數據的「形狀」完全不一樣了。

**3. Coverage Drop（信賴區間溫度計）**

預測不只給一個數字，還會給信賴區間（例如「預測 500 個，90% 信心在 400-600 之間」）。

Coverage = 實際值落在信賴區間內的比例。

- 上個月 Coverage = 88%（88% 的預測都在區間內，不錯）
- 這個月 Coverage = 65%（只有 65%，很多預測都猜錯了）
- 下降 23% → 超過門檻 → 告警

白話：**「以前說的信心範圍還算靠譜，現在常常打臉」**

### 三個一起看

| 狀況 | MAPE | PSI | Coverage | 意義 |
|------|------|-----|----------|------|
| 一切正常 | 穩定 | < 0.1 | > 80% | 不用做什麼 |
| 輸入變了 | 可能沒變 | > 0.2 | 可能下降 | 數據源有變化，要檢查 |
| 模型退化 | 上升 | 可能正常 | 下降 | 需要重新訓練 |
| 全面崩潰 | 大幅上升 | > 0.2 | 大幅下降 | 緊急！可能要先 rollback 到舊模型 |

> 💡 **面試官可能會追問：**
> 「為什麼要三個指標？一個不夠嗎？」
> → 因為它們偵測的東西不同。MAPE 只看結果好不好，但不告訴你為什麼。PSI 告訴你「是不是因為輸入變了」。Coverage 告訴你「模型的不確定性估計還準不準」。三個一起看才能做出正確的決策。

---

## 40-3：重新訓練觸發規則

### 偵測到 drift 就馬上重訓嗎？

**不是。** 有四條規則，而且有安全機制防止過度反應。

**四條觸發規則：**

1. **準確度下降** — MAPE 超過門檻（例如 > 0.20）
2. **數據分佈偏移** — PSI 超過 0.2
3. **信賴區間失效** — Coverage 下降超過 15%
4. **定期健檢** — 每 30 天自動評估一次（不管有沒有 drift）

**安全機制：**

- **Cooldown（冷卻期）** — 觸發重訓後，未來 7 天內不會再觸發。防止「訓練完發現還是不好 → 又觸發 → 又訓練」的死循環。
- **Dedup（去重）** — 同一個時間窗口內的重複觸發只算一次。
- **Feature Flag** — 整個閉環系統有開關（\\`DI_CLOSED_LOOP_ENABLED\\`）。正式啟用前可以先關著觀察。
- **Severity 分級** — 不是所有觸發都一樣嚴重：
  - High：多個指標同時超標 → 需要馬上處理
  - Medium：單一指標超標 → 排進待辦
  - Low：接近門檻但還沒超過 → 持續觀察

### 觸發後做什麼？

\\`\\`\\`
1. 評估觸發條件 → 確認真的需要重訓
2. 推導新的訓練參數（用最新 90 天的數據）
3. 跑重新訓練
4. 比較新模型 vs 舊模型的指標
5. 新模型更好 → 升級（promotion）
6. 新模型更差 → 保留舊模型，記錄原因
\\`\\`\\`

> 💡 **面試官可能會追問：**
> 「如果新模型比舊模型差怎麼辦？」
> → 不升級。DI 的模型生命週期有 promotion gate — 新模型必須在回歸測試中比舊模型好（或至少不差）才能取代。這就是 World 12 學的 Release Gate 概念在 ML 領域的應用。

---

## 40-4：Style Learning — 從主管的回饋中偷偷學

### 一個故事

小美的 AI Worker 做了一份採購報告。主管看了之後，把原本的圓餅圖改成長條圖，然後把「建議採購 2,150 個零件」改成「建議分三批採購：第一批 800 個（4/1）、第二批 700 個（4/15）、第三批 650 個（5/1）」。

如果這種修改只發生一次，也許是個案。但如果主管連續 5 次都做了類似的修改，系統就會開始學了。

### Style Learning 的六個階段

**1. 捕捉回饋**
主管每次審核 Worker 的產出，系統記錄：修改了什麼、修改前 vs 修改後、修改幅度。

**2. 提取風格規則**（feedbackStyleExtractor）
系統從修改中提取規則：
- 「主管偏好長條圖不要圓餅圖」→ 信心 0.40（只有 1 次）
- 「主管偏好分批採購不要一次到貨」→ 信心 0.40

**3. 累積信心**
每次出現相同的修改模式，信心 +0.05：
- 第 1 次：0.40
- 第 3 次：0.50
- 第 5 次：0.60
- 第 7 次：0.70

**4. 套用到下次產出**
當信心超過 0.50，Worker 下次做報告時會自動套用這個風格。主管會發現「咦，這次不用改了」。

**5. 升級為公司政策**
當信心超過 0.75 **且** 主管確認，這個規則從「這個主管的偏好」升級為「公司政策」。之後所有 Worker 都會套用。

**6. 持續演化**
如果主管的偏好改了（突然開始用圓餅圖了），信心會下降，規則會被調整。

### 這跟自主等級的關係

Style Learning 會影響 trust metrics：
- Worker 套用了學到的風格 → 主管不用改 → first_pass_acceptance_rate 上升
- first_pass_acceptance_rate 上升 → 自主等級從 A2 升到 A3
- 自主等級升高 → 更多動作可以自動執行

**所以 Style Learning 是自主等級提升的引擎。** 學得越好 → 主管改得越少 → 信任越高 → 自主度越高。

> 💡 **面試官可能會追問：**
> 「如果兩個主管的風格衝突怎麼辦？」
> → 風格規則是按 Worker 分的。Worker A 跟主管 X 學了一種風格，Worker B 跟主管 Y 學了另一種。只有升級為「公司政策」的規則才會跨 Worker 套用，而升級需要主管明確確認。

---

## 40-5：閉環編排（9 步 Pipeline）

### closedLoopRunner.js 做什麼？

整個閉環系統的核心是 \\`closedLoopRunner.js\\`。它是一個 9 步的自動化管線：

\\`\\`\\`
Step 1: Feature Flag 檢查
  → DI_CLOSED_LOOP_ENABLED = true 嗎？
  → 如果 false → 什麼都不做

Step 2: 建立審計紀錄
  → 記錄「閉環評估開始了」
  → 即使後面沒觸發任何動作，也有紀錄

Step 3: 評估觸發條件
  → 讀取最新的 drift 指標
  → 檢查四條規則
  → 如果都沒觸發 → 記錄「一切正常」→ 結束

Step 4: 推導新參數
  → 根據 drift 類型決定怎麼調整
  → 例如：MAPE 上升 → 用最新 90 天數據重新訓練

Step 5: 記錄 Cooldown
  → 寫入「上次觸發時間 = 現在」
  → 7 天內不會再觸發

Step 6: 儲存 Artifact
  → 把觸發條件、推導的參數、評估結果存起來
  → 供後續審計和分析

Step 7: 執行（三種模式）
  → dry_run：只評估，不執行
  → manual_approve：評估完等主管批准再執行
  → auto_run：自動執行重新訓練

Step 8: 記錄結果
  → 成功 / 失敗 / 跳過

Step 9: 結束
  → 完整的審計軌跡已保存
\\`\\`\\`

### 三種模式的選擇

| 模式 | 白話 | 適合場景 |
|------|------|---------|
| **dry_run** | 只看不做 | 剛開始用閉環系統，先觀察幾週 |
| **manual_approve** | 做完等人核准 | 正常使用，人類保持控制權 |
| **auto_run** | 全自動 | 已經跑了幾個月，信任度高 |

大多數企業會從 dry_run 開始，觀察一段時間後切到 manual_approve，最後才考慮 auto_run。**這跟 Worker 的自主等級（A1→A4）是一樣的邏輯。**

> 💡 **面試官可能會追問：**
> 「為什麼不一開始就 auto_run？」
> → 因為你需要先確認閉環系統的判斷是合理的。如果它誤判了 drift（假陽性），就會不必要地重新訓練，浪費計算資源。先用 dry_run 觀察「它會在什麼時候觸發」，確認合理後再開啟自動。

---

## 40-6（Boss）：模型退化診斷

### 情境

系統的 drift monitor 回報了以下數據：

\\`\\`\\`
MAPE：0.12 → 0.25（上升 108%）
PSI：0.35（遠超 0.2 門檻）
Coverage：88% → 65%（下降 23 個百分點）
上次重新訓練：42 天前
Cooldown 狀態：已過期（可以觸發）
\\`\\`\\`

### 你的任務

1. 這三個指標各代表什麼意思？嚴重程度如何？
2. 你會建議怎麼處理？馬上重訓？先 rollback？
3. 你會用 dry_run、manual_approve 還是 auto_run？為什麼？
4. 重訓完後，你怎麼確認新模型比舊模型好？

### 評估標準

- 能正確解讀三個指標（MAPE = 預測準確度差、PSI = 輸入分佈變了、Coverage = 信賴區間失效）
- 判斷嚴重程度：三個全超標 = 全面崩潰，需要緊急處理
- 處理策略：先 rollback 到上一版穩定模型（止血），同時啟動重訓
- 使用 manual_approve（情況嚴重，不適合全自動）
- 驗證方式：用回歸測試比較新模型 vs 舊模型的 MAPE、Coverage

"""

    static let enWorld40: String = """

# World 40: Closed-Loop Learning System

> **Objective:** Understand how DI detects model degradation, how it automatically retrains models, and how it learns from supervisor feedback
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 40-1: Why Models Degrade

### Start with a Scenario

Your forecasting model had 95% accuracy last month, but this month it suddenly dropped to 80%. The model didn't break — **the world changed**:

- Market trends shifted (a previously stable growth category suddenly declined)
- Suppliers changed (the new supplier has different lead time characteristics)
- Product mix changed (discontinued items are still being forecasted)
- Seasonal patterns changed (this year's peak season came two weeks early)

This is called **drift** — the model was trained on past data, but the current world is different from the past.

### Two Types of Drift

**Data Drift (Input Drift)** — The distribution of input data changed
- Order volumes used to cluster between 100-500; now there are suddenly many 2,000+ orders
- The model hasn't seen this kind of data and doesn't know how to forecast it

**Concept Drift** — The relationship between inputs and outputs changed
- Previously "promotion → sales up 50%," but now the market is saturated, so "promotion → sales up only 10%"
- Same inputs but the output pattern is different

> **Possible interview follow-up:**
> "Which is harder to handle, Data Drift or Concept Drift?"
> Concept Drift is harder. Data Drift can be resolved through retraining (new data distribution reflects the new reality). But Concept Drift may require changing the model architecture or feature engineering, because the old input-output relationship no longer holds.

---

## 40-2: Drift Detection — Three Thermometers

### How Does DI Detect Drift?

In \\`drift_monitor.py\\`, the system uses three metrics (like three thermometers) to monitor model health:

**1. MAPE Change (Accuracy Thermometer)**

MAPE = Mean Absolute Percentage Error = average prediction deviation percentage.

- Last month's MAPE = 0.12 (12% deviation, normal)
- This month's MAPE = 0.25 (25% deviation, abnormal)
- Difference = +0.13 → exceeds threshold → alert

In plain terms: **"Used to guess pretty accurately, now guessing way off"**

**2. PSI (Input Distribution Thermometer)**

PSI = Population Stability Index. It compares whether "the data distribution during training" and "the current data distribution" are consistent.

- PSI < 0.1 → Distribution stable (normal)
- PSI 0.1-0.2 → Some shift (observe)
- PSI > 0.2 → Significant shift (alert)

In plain terms: **"The shape of the incoming data has changed"**

For example: order volumes used to be \\`[100, 200, 150, 300]\\`, now they're \\`[2000, 3000, 2500, 4000]\\`. The data's "shape" is completely different.

**3. Coverage Drop (Confidence Interval Thermometer)**

Predictions don't just give a single number — they also provide a confidence interval (e.g., "predicted 500 units, 90% confident it's between 400-600").

Coverage = the proportion of actual values that fall within the confidence interval.

- Last month's Coverage = 88% (88% of predictions were within the interval — good)
- This month's Coverage = 65% (only 65% — many predictions missed)
- Dropped 23% → exceeds threshold → alert

In plain terms: **"The confidence ranges used to be reliable, now they're frequently wrong"**

### Looking at All Three Together

| Situation | MAPE | PSI | Coverage | Meaning |
|------|------|-----|----------|------|
| Everything normal | Stable | < 0.1 | > 80% | No action needed |
| Input changed | May be unchanged | > 0.2 | May drop | Data source has changed, investigate |
| Model degraded | Rising | May be normal | Dropping | Retraining needed |
| Total collapse | Sharply rising | > 0.2 | Sharply dropping | Emergency! May need to rollback to old model |

> **Possible interview follow-up:**
> "Why three metrics? Isn't one enough?"
> Because they detect different things. MAPE only shows whether results are good, but not why. PSI tells you "did the inputs change." Coverage tells you "are the model's uncertainty estimates still accurate." You need all three together to make the right decision.

---

## 40-3: Retraining Trigger Rules

### Does It Retrain Immediately Upon Detecting Drift?

**No.** There are four rules, plus safety mechanisms to prevent overreaction.

**Four Trigger Rules:**

1. **Accuracy decline** — MAPE exceeds threshold (e.g., > 0.20)
2. **Data distribution shift** — PSI exceeds 0.2
3. **Confidence interval failure** — Coverage drops by more than 15%
4. **Periodic health check** — Automatic evaluation every 30 days (regardless of drift)

**Safety Mechanisms:**

- **Cooldown period** — After triggering a retrain, no further triggers for 7 days. Prevents the death loop of "trained, still not good → trigger again → train again."
- **Dedup** — Duplicate triggers within the same time window count only once.
- **Feature Flag** — The entire closed-loop system has an on/off switch (\\`DI_CLOSED_LOOP_ENABLED\\`). You can observe before officially enabling it.
- **Severity levels** — Not all triggers are equally serious:
  - High: Multiple metrics exceed thresholds simultaneously → needs immediate attention
  - Medium: Single metric exceeds threshold → add to backlog
  - Low: Approaching threshold but not exceeded → continue monitoring

### What Happens After Triggering?

\\`\\`\\`
1. Evaluate trigger conditions → confirm retraining is actually needed
2. Derive new training parameters (using the latest 90 days of data)
3. Run the retraining
4. Compare new model vs old model metrics
5. New model is better → promotion (upgrade)
6. New model is worse → keep the old model, record the reason
\\`\\`\\`

> **Possible interview follow-up:**
> "What if the new model is worse than the old one?"
> Don't promote it. DI's model lifecycle has a promotion gate — the new model must be better (or at least not worse) than the old model in regression tests before it can replace it. This is the Release Gate concept from World 12 applied to the ML domain.

---

## 40-4: Style Learning — Quietly Learning from Supervisor Feedback

### A Story

Mei's AI Worker produced a procurement report. The supervisor reviewed it and changed the pie chart to a bar chart, then changed "recommend purchasing 2,150 components" to "recommend purchasing in three batches: first batch 800 (4/1), second batch 700 (4/15), third batch 650 (5/1)."

If this kind of modification happens only once, it might be an isolated case. But if the supervisor makes similar modifications 5 consecutive times, the system starts learning.

### Style Learning's Six Stages

**1. Capture Feedback**
Every time a supervisor reviews Worker output, the system records: what was modified, before vs after, and the magnitude of the change.

**2. Extract Style Rules** (feedbackStyleExtractor)
The system extracts rules from modifications:
- "Supervisor prefers bar charts over pie charts" → confidence 0.40 (only 1 occurrence)
- "Supervisor prefers batch delivery over single delivery" → confidence 0.40

**3. Accumulate Confidence**
Each time the same modification pattern appears, confidence increases by +0.05:
- 1st time: 0.40
- 3rd time: 0.50
- 5th time: 0.60
- 7th time: 0.70

**4. Apply to Next Output**
When confidence exceeds 0.50, the Worker automatically applies this style in the next report. The supervisor will notice "hey, I didn't need to change anything this time."

**5. Promote to Company Policy**
When confidence exceeds 0.75 **and** the supervisor confirms, the rule is promoted from "this supervisor's preference" to "company policy." After that, all Workers apply it.

**6. Continuous Evolution**
If the supervisor's preference changes (suddenly starts using pie charts again), confidence decreases and the rule adjusts.

### Relationship to Autonomy Levels

Style Learning affects trust metrics:
- Worker applies a learned style → supervisor doesn't need to edit → first_pass_acceptance_rate increases
- first_pass_acceptance_rate increases → autonomy level upgrades from A2 to A3
- Higher autonomy level → more actions can be auto-executed

**So Style Learning is the engine for autonomy level advancement.** The better it learns → the less the supervisor edits → the higher the trust → the greater the autonomy.

> **Possible interview follow-up:**
> "What if two supervisors have conflicting styles?"
> Style rules are per-Worker. Worker A learns one style from Supervisor X, Worker B learns another from Supervisor Y. Only rules promoted to "company policy" apply across Workers, and promotion requires the supervisor's explicit confirmation.

---

## 40-5: Closed-Loop Orchestration (9-Step Pipeline)

### What Does closedLoopRunner.js Do?

The core of the entire closed-loop system is \\`closedLoopRunner.js\\`. It's a 9-step automated pipeline:

\\`\\`\\`
Step 1: Feature Flag check
  → DI_CLOSED_LOOP_ENABLED = true?
  → If false → do nothing

Step 2: Create audit record
  → Record "closed-loop evaluation started"
  → Even if nothing triggers later, there's a record

Step 3: Evaluate trigger conditions
  → Read latest drift metrics
  → Check four rules
  → If none triggered → record "all normal" → end

Step 4: Derive new parameters
  → Decide adjustments based on drift type
  → Example: MAPE rising → retrain with latest 90 days of data

Step 5: Record Cooldown
  → Write "last trigger time = now"
  → Won't trigger again for 7 days

Step 6: Store Artifact
  → Save trigger conditions, derived parameters, evaluation results
  → For later auditing and analysis

Step 7: Execute (three modes)
  → dry_run: evaluate only, don't execute
  → manual_approve: evaluate, then wait for supervisor approval before executing
  → auto_run: automatically execute retraining

Step 8: Record results
  → success / failure / skipped

Step 9: End
  → Complete audit trail saved
\\`\\`\\`

### Choosing Among the Three Modes

| Mode | Plain Explanation | Best For |
|------|------|---------|
| **dry_run** | Look but don't act | When first adopting the closed-loop system; observe for a few weeks |
| **manual_approve** | Act but wait for human approval | Normal use; humans retain control |
| **auto_run** | Fully automatic | After running for several months with high confidence |

Most enterprises start with dry_run, observe for a period, then switch to manual_approve, and only then consider auto_run. **This follows the same logic as Worker autonomy levels (A1 → A4).**

> **Possible interview follow-up:**
> "Why not start with auto_run?"
> Because you need to first confirm the closed-loop system's judgment is sound. If it misjudges drift (false positive), it would unnecessarily retrain, wasting compute resources. Start with dry_run to observe "when would it trigger," confirm it's reasonable, then enable automation.

---

## 40-6 (Boss): Model Degradation Diagnosis

### Scenario

The system's drift monitor reports the following data:

\\`\\`\\`
MAPE: 0.12 → 0.25 (up 108%)
PSI: 0.35 (far exceeds 0.2 threshold)
Coverage: 88% → 65% (down 23 percentage points)
Last retraining: 42 days ago
Cooldown status: expired (can trigger)
\\`\\`\\`

### Your Task

1. What does each of these three metrics mean? How severe is the situation?
2. What would you recommend? Retrain immediately? Rollback first?
3. Would you use dry_run, manual_approve, or auto_run? Why?
4. After retraining, how do you confirm the new model is better than the old one?

### Evaluation Criteria

- Correctly interprets all three metrics (MAPE = prediction accuracy is poor, PSI = input distribution changed, Coverage = confidence intervals are failing)
- Judges severity: all three exceeding thresholds = total collapse, requires urgent action
- Handling strategy: first rollback to the last stable model version (stop the bleeding), while simultaneously starting retraining
- Uses manual_approve (situation is serious; full automation isn't appropriate)
- Verification method: use regression tests to compare new model vs old model MAPE and Coverage

"""

    static let zhWorld41: String = """

# World 41：進階執行與智慧路由

> **目標：** 理解 Worker 怎麼自我修正、系統怎麼選 AI 模型、怎麼零成本偵測異常、瀏覽器和伺服器的執行差異
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 41-1：Ralph Loop — 會自我修正的 AI 員工

### 一般的 AI 呼叫 vs Ralph Loop

**一般的 AI 呼叫**就像你叫外送：你下單、等餐點到、吃。如果菜做錯了，你只能重新下單。AI 也一樣 — 你呼叫一次 API，它給你一個結果，好不好你都得接受。

**Ralph Loop** 不一樣。它像一個真的在辦公室裡的員工：做完一步 → 看看結果 → 覺得不夠好就自己調整再做一次 → 直到滿意為止。

在程式碼裡（\\`ralphLoopAdapter.js\\`），Ralph Loop 的流程是：

\\`\\`\\`
1. 初始化 → 為任務建立一個自主代理
2. 代理開始循環：
   a. executeTick(taskId) → 推進任務一步
   b. getTaskStatus(taskId) → 看看做到哪了
   c. 結果 OK？→ markComplete() → 停止
   d. 結果不 OK？→ 分析為什麼，調整策略，再跑一次
3. 直到任務完成、或碰到安全限制
\\`\\`\\`

### 三道安全繩

如果 AI 一直覺得「不夠好」而無限循環呢？有三道安全繩：

**1. 迭代次數上限**
\\`\\`\\`
VITE_RALPH_MAX_ITERATIONS = 30（預設）
\\`\\`\\`
跑 30 次還沒完成就強制停止。防止無限循環。

**2. 成本上限**
\\`\\`\\`
VITE_RALPH_MAX_COST = 5.00（美元）
\\`\\`\\`
一個任務最多花 $5 的 AI 呼叫費用。超過就停。防止帳單爆炸。

**3. 中止控制（AbortController）**
\\`\\`\\`
abortRalphLoop(taskId)    → 停止特定任務
abortAllRalphLoops()      → 停止所有任務
\\`\\`\\`
使用者或系統隨時可以拉停。

### 什麼時候用 Ralph Loop？

不是所有任務都需要 Ralph Loop。簡單的查詢（「上個月營收多少？」）呼叫一次 AI 就夠了。

Ralph Loop 適合**複雜的多步驟任務**：
- 「分析這份數據，找出問題，提出建議，並寫一份報告」
- 這種任務可能需要：先讀數據 → 發現異常 → 深入分析 → 寫報告 → 檢查報告品質 → 修改格式
- 每一步都可能需要根據前一步的結果調整

Ralph Loop 預設是關閉的（\\`VITE_RALPH_LOOP_ENABLED=false\\`），因為它比單次呼叫消耗更多資源。

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

\\`\\`\\`
規劃任務（planner）→ preferred: tier_a, fallback: tier_b
  → 做採購計畫需要最強的推理能力

報告生成（report）→ preferred: tier_c, fallback: tier_b
  → 寫報告不需要太聰明，便宜就好

風險評估（risk）→ preferred: tier_a, fallback: tier_b
  → 風險判斷很重要，不能用便宜的

數據清理（cleaning）→ preferred: tier_c, fallback: tier_c
  → 簡單的格式轉換，最便宜的就夠
\\`\\`\\`

### 降級和升級

**降級（Downgrade）：** 如果 tier_a 模型太忙或超過預算，系統會自動降級到 tier_b。
**升級（Escalation）：** 如果任務失敗了或風險等級高，系統會升級到更高的 tier 重試。

\\`\\`\\`
正常流程：tier_c 做報告 → 成功 → 結束
失敗流程：tier_c 做報告 → 失敗 → 升級到 tier_b → 成功 → 結束
高風險流程：偵測到高風險 → 直接用 tier_a → 成功 → 結束
\\`\\`\\`

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

在 \\`signalRadarEngine.js\\` 裡，系統偵測四種異常：

### 四種異常偵測

**1. 統計離群（Metric Anomalies）**

\\`\\`\\`
看每個指標的歷史變化率
計算平均值 μ 和標準差 σ
如果最新的變化率偏離平均超過 2σ → 告警

例如：
  過去 6 個月的營收月增率：+3%, +5%, +2%, +4%, +3%, +6%
  平均 = 3.8%, 標準差 = 1.3%
  這個月：-15%（偏離 14.4 個標準差）→ 嚴重異常！
\\`\\`\\`

**2. 指標矛盾（Contradictions）**

某些指標應該同向或反向移動。如果它們的方向不對，就有問題：

\\`\\`\\`
營收 ↑ 但毛利 ↓ → 矛盾！（可能是靠降價衝量）
庫存 ↑ 但缺貨也 ↑ → 矛盾！（庫存擺錯地方了？）
成本 ↑ 但品質 ↓ → 矛盾！（錢花到哪去了？）
\\`\\`\\`

**3. 集中度風險（Concentration Risk）**

從數據和圖表中找出過度集中的情況：

\\`\\`\\`
「前 5 大客戶佔營收 85%」→ 嚴重集中風險
  → 如果其中一個大客戶跑了，營收直接腰斬

圓餅圖最大一塊佔 70%+ → 告警
\\`\\`\\`

**4. 過期洞察（Stale Insights）**

\\`\\`\\`
這份分析是 30 天前做的 → 告警：數據可能已經過時
同一個問題的新舊分析，結論差異 > 20% → 告警：結論已經變了
\\`\\`\\`

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

預設情況下，Worker 的任務是在你的瀏覽器裡跑的。\\`orchestrator.js\\` 的 tick loop 就在前端的 JavaScript 裡執行。

**好處：** 簡單，不需要額外的伺服器。
**壞處：** 你關掉瀏覽器，任務就停了。

### 正式環境：伺服器執行

正式環境有一個獨立的 **Node.js Task Worker**（\\`worker/taskWorker.js\\`），在伺服器背景持續運行：

\\`\\`\\`
每 2 秒：去資料庫查「有沒有沒人認領的任務？」
有的話：認領（compare-and-swap，確保不會兩個 worker 搶同一個）
最多同時跑 3 個任務
每個任務跑 tick loop 直到完成

你關掉瀏覽器 → 任務繼續跑
你重新打開瀏覽器 → 用 run_id 查到最新狀態
\\`\\`\\`

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
| \\`ai_employees\\` | Worker 的身份：名字、角色、狀態、管理者 | Worker 的「員工檔案」 |
| \\`ai_employee_tasks\\` | 任務：狀態（todo → in_progress → done）、結果 | Worker 的「工作紀錄」 |
| \\`ai_employee_task_memory\\` | 跨對話記憶：用 dataset_fingerprint 當 key | Worker 的「筆記本」 |

**模型相關：**
| 表 | 存什麼 | 白話 |
|---|--------|------|
| \\`model_registry\\` | AI 模型登記：供應商、tier、成本、上下文長度 | AI 模型的「通訊錄」 |
| \\`solver_telemetry_events\\` | 每次求解的遙測：引擎、耗時、結果 | 求解器的「體檢報告」 |

**審計相關：**
| 表 | 存什麼 | 白話 |
|---|--------|------|
| \\`di_plan_audit_log\\` | 計畫的審計紀錄：誰批准的、什麼時候、理由 | 決策的「法院紀錄」 |
| \\`analysis_snapshots\\` | 分析快照：時序數據的歷史快照 | 數據的「定期照片」 |

### RLS — 資料庫層面的隔離

**Row-Level Security（行級安全）** 確保每個使用者只能看到自己公司的資料。

白話：就算程式碼有 bug 忘了加 \\`WHERE tenant_id = ?\\`，資料庫本身也會擋住你看別人的數據。

\\`\\`\\`
-- 例如 ai_employees 表的 RLS 政策：
CREATE POLICY "Users can only see their own workers"
  ON ai_employees
  FOR SELECT
  USING (manager_user_id = auth.uid());

-- 就算你寫 SELECT * FROM ai_employees（沒加任何條件），
-- 資料庫只會回傳你管理的 Worker，看不到別人的。
\\`\\`\\`

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

"""

    static let enWorld41: String = """

# World 41: Advanced Execution and Intelligent Routing

> **Objective:** Understand how Workers self-correct, how the system selects AI models, how to detect anomalies at zero cost, and the differences between browser and server execution
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 41-1: Ralph Loop — The Self-Correcting AI Employee

### Regular AI Calls vs Ralph Loop

**A regular AI call** is like ordering food delivery: you place the order, wait for it to arrive, eat. If the dish is wrong, you can only reorder. AI is the same — you call an API once, it gives you a result, and you take what you get.

**Ralph Loop** is different. It's like an actual employee sitting in the office: completes one step → reviews the result → decides it's not good enough and adjusts, then tries again → repeats until satisfied.

In the code (\\`ralphLoopAdapter.js\\`), the Ralph Loop flow is:

\\`\\`\\`
1. Initialize → create an autonomous agent for the task
2. Agent begins looping:
   a. executeTick(taskId) → advance the task one step
   b. getTaskStatus(taskId) → check progress
   c. Result OK? → markComplete() → stop
   d. Result not OK? → analyze why, adjust strategy, run again
3. Until the task completes or hits a safety limit
\\`\\`\\`

### Three Safety Ropes

What if the AI keeps thinking "not good enough" and loops forever? There are three safety ropes:

**1. Iteration Limit**
\\`\\`\\`
VITE_RALPH_MAX_ITERATIONS = 30 (default)
\\`\\`\\`
If it hasn't finished after 30 iterations, force stop. Prevents infinite loops.

**2. Cost Limit**
\\`\\`\\`
VITE_RALPH_MAX_COST = 5.00 (USD)
\\`\\`\\`
A single task can spend at most $5 in AI call costs. Exceeding it triggers a stop. Prevents bill explosions.

**3. Abort Control (AbortController)**
\\`\\`\\`
abortRalphLoop(taskId)    → stop a specific task
abortAllRalphLoops()      → stop all tasks
\\`\\`\\`
Users or the system can pull the emergency stop at any time.

### When to Use Ralph Loop?

Not every task needs Ralph Loop. Simple queries ("What was last month's revenue?") need just one AI call.

Ralph Loop is for **complex multi-step tasks**:
- "Analyze this data, find problems, propose recommendations, and write a report"
- Such tasks may require: read data → discover anomalies → deep analysis → write report → check report quality → fix formatting
- Each step may need adjustment based on the previous step's results

Ralph Loop is disabled by default (\\`VITE_RALPH_LOOP_ENABLED=false\\`) because it consumes more resources than single calls.

> **Possible interview follow-up:**
> "How is it different from AutoGPT?"
> The concept is similar, but DI's Ralph Loop has explicit safety limits (cost cap, iteration cap, abort control), and executes within a controlled task framework (with a state machine managing task state) rather than letting AI freely browse the web and do things.

---

## 41-2: Model Routing — Using the Right AI for the Right Job

### Why Can't Every Task Use the Best Model?

The strongest AI models (like Gemini Pro, Claude Opus) are smart but also expensive. If every task uses the strongest model, the bill explodes.

It's like a restaurant not having the head chef chop vegetables — let the apprentice do that; the head chef focuses on the steak.

DI divides AI models into three tiers:

### Three Tiers

| Tier | Plain Explanation | Typical Models | Cost | Best For |
|------|------|---------|------|---------|
| **Tier A** | Head chef | Gemini Pro, Claude Opus, GPT-5.4 | $$$ | Task decomposition, risk assessment, final review |
| **Tier B** | Sous chef | Gemini Flash, Claude Sonnet, DeepSeek Reasoner | $$ | Complex analysis, code generation, reasoning |
| **Tier C** | Apprentice | DeepSeek Chat, Gemini Flash Lite | $ | Summaries, formatting, data cleaning |

### How Does the System Decide Which to Use?

Each task type has a default tier configuration:

\\`\\`\\`
Planning task (planner) → preferred: tier_a, fallback: tier_b
  → Procurement planning needs the strongest reasoning ability

Report generation (report) → preferred: tier_c, fallback: tier_b
  → Writing reports doesn't need top intelligence; cheap is fine

Risk assessment (risk) → preferred: tier_a, fallback: tier_b
  → Risk judgment is critical; can't use the cheapest

Data cleaning (cleaning) → preferred: tier_c, fallback: tier_c
  → Simple format conversion; the cheapest is sufficient
\\`\\`\\`

### Downgrade and Escalation

**Downgrade:** If the tier_a model is too busy or over budget, the system automatically downgrades to tier_b.
**Escalation:** If a task fails or the risk level is high, the system escalates to a higher tier and retries.

\\`\\`\\`
Normal flow: tier_c generates report → success → done
Failure flow: tier_c generates report → fails → escalate to tier_b → success → done
High-risk flow: high risk detected → go directly to tier_a → success → done
\\`\\`\\`

### Multi-Provider Strategy — Don't Put All Eggs in One Basket

DI supports five AI providers: Gemini (Google), DeepSeek, Anthropic (Claude), OpenAI (GPT), and Kimi (Moonshot AI).

Why not use just one?
- **Providers can go down** — If Google's service is out, DeepSeek is still available
- **Different models excel at different things** — DeepSeek Reasoner excels at reasoning, Gemini Flash excels at speed
- **Cost optimization** — Use cheaper providers for cheaper tasks

> **Possible interview follow-up:**
> "How do you track each model's cost?"
> In the model_registry table, each model has cost_per_1k_input and cost_per_1k_output pricing. The system records the token count for each call and calculates the actual cost. Ralph Loop's maxCost limit is also based on this calculation.

---

## 41-3: Signal Radar — Zero-Cost Anomaly Detection

### What Is Signal Radar?

The system automatically scans your data every day, finding anomalies and issues. **Completely without calling any AI models (zero cost)** — purely using statistical rules.

In \\`signalRadarEngine.js\\`, the system detects four types of anomalies:

### Four Types of Anomaly Detection

**1. Statistical Outliers (Metric Anomalies)**

\\`\\`\\`
Look at each metric's historical rate of change
Calculate mean (mu) and standard deviation (sigma)
If the latest change rate deviates from the mean by more than 2 sigma → alert

Example:
  Past 6 months' revenue month-over-month growth: +3%, +5%, +2%, +4%, +3%, +6%
  Mean = 3.8%, standard deviation = 1.3%
  This month: -15% (deviates by 14.4 standard deviations) → severe anomaly!
\\`\\`\\`

**2. Metric Contradictions**

Certain metrics should move in the same or opposite directions. If they don't, something's wrong:

\\`\\`\\`
Revenue ↑ but gross margin ↓ → Contradiction! (Possibly pushing volume through price cuts)
Inventory ↑ but stockouts also ↑ → Contradiction! (Inventory in the wrong place?)
Costs ↑ but quality ↓ → Contradiction! (Where's the money going?)
\\`\\`\\`

**3. Concentration Risk**

Finding excessive concentration from data and charts:

\\`\\`\\`
"Top 5 customers account for 85% of revenue" → severe concentration risk
  → If one major customer leaves, revenue is cut in half

Pie chart's largest slice is 70%+ → alert
\\`\\`\\`

**4. Stale Insights**

\\`\\`\\`
This analysis was done 30 days ago → alert: data may be outdated
Old vs new analyses of the same issue differ by > 20% → alert: conclusions have changed
\\`\\`\\`

### Why Is It Zero Cost?

Because all detection is local computation: comparing numbers, calculating standard deviations, regex matching text. No AI API calls needed. Each execution completes in milliseconds.

**Signal Radar vs Drift Detection:**
- Drift Detection (World 40) monitors **ML model** health (is the model accurate?)
- Signal Radar monitors **business data** health (is revenue normal? is inventory reasonable?)

> **Possible interview follow-up:**
> "Won't pure rules generate lots of false positives?"
> Yes. That's why Signal Radar has confidence scores. Satisfying both the statistical condition (> 2 sigma) and the absolute condition (> 30% change) gets the highest confidence (0.9). Satisfying only one gets lower confidence (0.6-0.75). The frontend ranks low-confidence signals lower.

---

## 41-4: Browser vs Server Execution

### Default Mode: Browser Execution

By default, Worker tasks run in your browser. The \\`orchestrator.js\\` tick loop executes in the frontend's JavaScript.

**Advantage:** Simple, no additional server needed.
**Disadvantage:** If you close the browser, the task stops.

### Production Mode: Server Execution

In production, there's an independent **Node.js Task Worker** (\\`worker/taskWorker.js\\`) running continuously in the background on the server:

\\`\\`\\`
Every 2 seconds: check the database "are there any unclaimed tasks?"
If yes: claim it (compare-and-swap ensures two workers don't grab the same one)
Run up to 3 tasks concurrently
Each task runs a tick loop until complete

Close your browser → task keeps running
Reopen your browser → use run_id to find the latest status
\\`\\`\\`

**Worker Safety Mechanisms:**
- **Heartbeat**: sent every 5 seconds so the system knows it's alive
- **Zombie detection**: if a worker hasn't sent a heartbeat for over 2 minutes → its tasks are released to other workers
- **Graceful shutdown**: on SIGTERM, waits up to 30 seconds for running tasks to complete

**Health check:** The Worker includes its own HTTP server (port 9100) for monitoring systems to check if it's alive.

### Comparing the Two Modes

| | Browser Execution | Server Execution |
|---|----------|----------|
| Close browser | Task stops | Task continues |
| Best for | Demos, development | Production |
| Concurrent tasks | 1 (your browser) | 3 (configurable) |
| Extra deployment needed | No | Yes (run taskWorker.js) |

> **Possible interview follow-up:**
> "Why at most 3 concurrent tasks?"
> Because each task may call the ML API for forecasting and solving, which is CPU and memory intensive. 3 is a tested safe value. Same rationale as the ML API's DI_SOLVER_MAX_CONCURRENT=3.

---

## 41-5: Database Schema and RLS

### Key Tables

DI's Supabase database has 27+ migration files. You don't need to memorize all of them, but you should know the most important tables:

**Worker-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \\`ai_employees\\` | Worker identity: name, role, status, manager | Worker's "personnel file" |
| \\`ai_employee_tasks\\` | Tasks: status (todo → in_progress → done), results | Worker's "work log" |
| \\`ai_employee_task_memory\\` | Cross-conversation memory: keyed by dataset_fingerprint | Worker's "notebook" |

**Model-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \\`model_registry\\` | AI model registration: provider, tier, cost, context length | AI models' "directory" |
| \\`solver_telemetry_events\\` | Telemetry for each solve: engine, duration, result | Solver's "health report" |

**Audit-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \\`di_plan_audit_log\\` | Plan audit records: who approved, when, why | Decision "court records" |
| \\`analysis_snapshots\\` | Analysis snapshots: historical snapshots of time-series data | Data's "periodic photos" |

### RLS — Database-Level Isolation

**Row-Level Security** ensures each user can only see their own company's data.

In plain terms: even if the code has a bug and forgets to add \\`WHERE tenant_id = ?\\`, the database itself blocks you from seeing others' data.

\\`\\`\\`
-- For example, the ai_employees table's RLS policy:
CREATE POLICY "Users can only see their own workers"
  ON ai_employees
  FOR SELECT
  USING (manager_user_id = auth.uid());

-- Even if you write SELECT * FROM ai_employees (no conditions),
-- the database only returns Workers you manage — you can't see anyone else's.
\\`\\`\\`

### Why Is RLS So Important?

In a multi-tenant system, a single bug could let Company A see Company B's data. That's a **security incident**.

RLS is the **last line of defense**:
- First layer: frontend API calls include tenant_id
- Second layer: API middleware extracts tenant_id and filters queries
- Third layer: **RLS — even if the first two layers both fail, the database itself won't leak data**

> **Possible interview follow-up:**
> "Does RLS affect performance?"
> It does, but the impact is minimal. PostgreSQL's RLS applies filter conditions during query planning, similar to writing WHERE yourself. The important thing is to index the tenant_id column.

---

## 41-6 (Boss): Integration Scenario Question

### Scenario

A Worker receives a task: "Analyze last month's sales data and forecast next quarter's demand."

During execution, the following events occur:
1. Ralph Loop on its 3rd iteration discovers MAPE = 0.28 (threshold 0.15)
2. Signal Radar detects a "revenue ↑ but gross margin ↓" contradiction
3. Model Router downgrades from tier_a to tier_b because the budget is nearly exhausted
4. Drift Monitor shows PSI = 0.31 (threshold 0.2)

### Your Task

1. What problem does each of these four signals represent?
2. Is there a causal relationship between them? (Hint: high PSI may explain high MAPE)
3. What would you recommend? In what order?
4. Will downgrading to tier_b affect result quality? How would you judge?

### Evaluation Criteria

- Can connect signals across four systems (not analyze each independently)
- Finds causality: high PSI → data distribution changed → model predictions worsen → high MAPE
- Handling order: first stop the bleeding (rollback model or upgrade tier) → then investigate root cause (why did PSI increase) → finally fix (retrain model)
- Judgment on downgrade: tier_b may be sufficient for analysis tasks but may compromise quality for forecasting tasks
- Can explain that Signal Radar's contradiction (revenue ↑ gross margin ↓) is likely caused by price-cut promotions and is a separate issue from model degradation

"""

    static let zhWorld48: String = """

# World 48：專案介紹英文

> **目標：** 學會用流暢的英文介紹你做過的專案，從 Overview 到技術細節到成果，完整且專業
> **適用場景：** 技術面試、Portfolio 簡報、LinkedIn 專案描述
> **預估學習時間：** 3-4 小時

---

## 48-1：Project Overview 句型

### 為什麼專案介紹的開頭最重要？

面試官每天聽十幾個人介紹專案，你只有 30 秒抓住他的注意力。一個好的 Project Overview 要在三句話內讓對方知道：**你做了什麼、為什麼做、結果如何**。

### 核心句型

**1. 說明專案目標**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| The goal of this project is to... | 這個專案的目標是⋯ | 介紹專案目的 |
| This project aims to address... | 這個專案旨在解決⋯ | 強調問題導向 |
| We set out to solve the problem of... | 我們著手解決⋯的問題 | 敘事感更強 |

**2. 描述做了什麼**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| We developed a system that... | 我們開發了一個⋯的系統 | 描述產出 |
| I built a data pipeline to... | 我建了一個資料管線來⋯ | 強調個人貢獻 |
| The solution involved creating... | 解決方案包含建立⋯ | 較正式的說法 |

**3. 概述成果**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| Overall, this project delivered... | 整體而言，這個專案帶來了⋯ | 總結成果 |
| As a result, we achieved... | 因此，我們達成了⋯ | 連結因果 |
| The project successfully reduced/improved... | 專案成功降低/提升了⋯ | 量化成果 |

### 常見錯誤

> ❌ **錯誤：** "This project is about doing a recommendation system."
> ✅ **正確：** "This project aims to improve user engagement by building a personalized recommendation system."

> ❌ **錯誤：** "We made a website for the company."
> ✅ **正確：** "We developed an internal dashboard that enables the operations team to monitor KPIs in real time."

中文母語者最常犯的錯：太籠統、缺乏 impact。英文專案介紹要 **specific + result-oriented**。

### 實用模板

\\`\\`\\`
In [context/course/internship], I worked on a project that aimed to
[solve what problem]. We developed [what solution] using [key technologies].
Overall, this project delivered [quantified result], and my primary
contribution was [your specific role].
\\`\\`\\`

### 好 vs 壞的範例

**❌ 不好的版本：**
> "My project is a chatbot. I used Python and some APIs. It works well."

**✅ 好的版本：**
> "During my internship at XYZ Corp, I developed a customer service chatbot that automated 40% of routine inquiries. The system was built with Python and integrated with the company's CRM via REST APIs. Overall, this project reduced average response time from 2 hours to under 5 minutes."

---

## 48-2：技術架構描述

### 用英文講技術，不是翻譯中文

很多同學介紹技術時會「逐字翻譯」中文思維，結果講出來的英文很卡。關鍵是用 **英文的邏輯來組織技術描述**：先講整體架構，再講每個元件的角色，最後講資料怎麼流動。

### 核心句型

**1. 描述整體架構**

| 句型 | 中文意思 |
|------|----------|
| The architecture consists of three main components:... | 架構由三個主要元件組成⋯ |
| The system follows a microservices architecture where... | 系統採用微服務架構，其中⋯ |
| At a high level, the system is divided into... | 從高層來看，系統分為⋯ |

**2. 解釋技術選擇**

| 句型 | 中文意思 |
|------|----------|
| We leveraged X for its [advantage]... | 我們採用 X 因為它的 [優勢]⋯ |
| We chose X over Y because... | 我們選 X 而非 Y 因為⋯ |
| X was selected due to its ability to... | 選用 X 是因為它能夠⋯ |

**3. 描述資料流**

| 句型 | 中文意思 |
|------|----------|
| The data flows from [source] through [process] to [destination] | 資料從 [來源] 經過 [處理] 到 [目的地] |
| First, the raw data is ingested via... | 首先，原始資料透過⋯被匯入 |
| The processed results are then stored in... | 處理完的結果接著被存入⋯ |

### 常見錯誤

> ❌ **錯誤：** "We use React because it is popular."
> ✅ **正確：** "We leveraged React for its component-based architecture, which allowed us to build reusable UI modules efficiently."

> ❌ **錯誤：** "The data goes to the database and then we show it."
> ✅ **正確：** "The data flows from the API gateway through a validation layer, is persisted in PostgreSQL, and is served to the frontend via a GraphQL endpoint."

**注意：** 用 "leverage" 而不是 "use" 會更專業，但不要每句都用 leverage，會顯得刻意。交替使用 utilize, employ, adopt, leverage。

### 實用模板

\\`\\`\\`
The architecture consists of [N] main components: [list them].
On the backend, we leveraged [technology] for [reason].
The data flows from [source], is processed by [component],
and the results are served to [consumer] via [method].
We chose [tech A] over [tech B] because [specific reason].
\\`\\`\\`

### 關鍵字彙

| 英文 | 中文 | 例句 |
|------|------|------|
| scalable | 可擴展的 | "a scalable data pipeline" |
| decoupled | 解耦的 | "decoupled services communicate via message queues" |
| latency | 延遲 | "reduced latency by 50ms" |
| throughput | 吞吐量 | "handles 10K requests per second throughput" |
| fault-tolerant | 容錯的 | "a fault-tolerant system with automatic failover" |

---

## 48-3：數據與成果描述

### 用數字說話——但要說對

面試官想聽到數字，但更想聽到 **數字背後的意義**。不是只說 "accuracy is 95%"，而是要說這個 95% 跟之前比怎樣、跟業界標準比怎樣。

### 核心句型

**1. 描述改善幅度**

| 句型 | 中文意思 |
|------|----------|
| This resulted in a X% improvement in... | 這帶來了 X% 的⋯提升 |
| We observed a X% reduction in... | 我們觀察到⋯降低了 X% |
| Performance improved from X to Y, representing a Z% gain | 效能從 X 提升到 Y，代表 Z% 的進步 |

**2. 列舉關鍵指標**

| 句型 | 中文意思 |
|------|----------|
| Key metrics include... | 關鍵指標包括⋯ |
| We tracked three primary KPIs:... | 我們追蹤三個主要 KPI⋯ |
| The model achieved an F1 score of X on the test set | 模型在測試集上達到 F1 score X |

**3. 強調個人貢獻**

| 句型 | 中文意思 |
|------|----------|
| My primary contribution was... | 我的主要貢獻是⋯ |
| I was specifically responsible for... | 我具體負責⋯ |
| I led the effort to... | 我主導了⋯的工作 |

### 常見錯誤

> ❌ **錯誤：** "The result is good. Accuracy is high."
> ✅ **正確：** "This resulted in a 15% improvement in prediction accuracy, raising it from 78% to 93%, which exceeded our target of 90%."

> ❌ **錯誤：** "I did the frontend and backend."
> ✅ **正確：** "My primary contribution was designing and implementing the ETL pipeline, which processed over 2 million records daily."

**小技巧：** 描述成果時用 **「比較級」** 的框架——跟之前比、跟目標比、跟業界比。這樣數字才有意義。

### 實用模板

\\`\\`\\`
The project achieved the following results:
- [Metric 1]: improved from [before] to [after], a [X]% improvement
- [Metric 2]: reduced [what] by [X]%, saving approximately [time/cost]
- [Metric 3]: [qualitative achievement]

My primary contribution was [specific work], which directly
contributed to [which result].
\\`\\`\\`

### 描述數據的實用字彙

| 英文 | 中文 | 常見搭配 |
|------|------|----------|
| baseline | 基準線 | "compared to the baseline" |
| benchmark | 標竿 | "outperformed the industry benchmark" |
| uplift | 提升 | "a 20% uplift in conversion" |
| yield | 產出 / 帶來 | "yielded significant cost savings" |
| outperform | 優於 | "outperformed the previous model by 12%" |

---

## 48-4：挑戰與 Trade-off

### 展現你的思考深度

面試官問 "What challenges did you face?" 不是要聽你抱怨，而是要看你 **如何分析問題、做決策、從中學習**。這是最能展現 senior thinking 的環節。

### 核心句型

**1. 描述挑戰**

| 句型 | 中文意思 |
|------|----------|
| The main challenge was... | 主要挑戰是⋯ |
| One significant obstacle we encountered was... | 我們遇到的一個重大障礙是⋯ |
| We ran into an issue where... | 我們碰到一個⋯的問題 |

**2. 描述 Trade-off**

| 句型 | 中文意思 |
|------|----------|
| The trade-off between X and Y was... | X 和 Y 之間的取捨是⋯ |
| We had to balance [A] against [B] | 我們必須在 [A] 和 [B] 之間取得平衡 |
| We prioritized X at the expense of Y because... | 我們優先選擇 X 而犧牲 Y 因為⋯ |

**3. 反思與學習**

| 句型 | 中文意思 |
|------|----------|
| Looking back, the key lesson was... | 回頭看，關鍵的學習是⋯ |
| If I were to do it again, I would... | 如果重新來過，我會⋯ |
| This experience taught me the importance of... | 這個經驗讓我學到⋯的重要性 |

### 常見錯誤

> ❌ **錯誤：** "The challenge was the data is dirty."（文法錯 + 太籠統）
> ✅ **正確：** "The main challenge was dealing with inconsistent data formats across three different source systems, which required us to build a custom validation layer."

> ❌ **錯誤：** "We chose the simple way because we don't have time."
> ✅ **正確：** "Given the two-week timeline, we prioritized a rule-based approach at the expense of model accuracy, because delivering a working MVP was more critical at that stage."

### 實用模板

\\`\\`\\`
The main challenge was [specific problem]. We considered [option A]
and [option B]. The trade-off between them was [what you gained vs lost].
Ultimately, we chose [decision] because [reasoning].

Looking back, the key lesson was [insight]. If I were to do it again,
I would [what you'd change] to [expected benefit].
\\`\\`\\`

### Trade-off 常見主題

| Trade-off | 英文說法 |
|-----------|----------|
| 速度 vs 品質 | "speed of delivery vs. code quality" |
| 準確度 vs 可解釋性 | "model accuracy vs. interpretability" |
| 功能 vs 時程 | "feature completeness vs. time-to-market" |
| 自建 vs 外購 | "build vs. buy" |
| 一致性 vs 可用性 | "consistency vs. availability" |

---

## 48-5（Boss）：完整專案英文簡報

### 五段式專案簡報框架

把前面學的全部串起來！一個完整的專案英文簡報，遵循 **B-R-A-R-L 框架**：

### The B-R-A-R-L Framework

| 段落 | 英文 | 中文 | 時間分配 |
|------|------|------|----------|
| 1 | **B**ackground | 背景 | 15% |
| 2 | **R**ole | 你的角色 | 10% |
| 3 | **A**pproach | 做法 | 35% |
| 4 | **R**esults | 成果 | 25% |
| 5 | **L**earnings | 學習 | 15% |

### 每段怎麼說

**Background（背景）**
\\`\\`\\`
During [when], at [where], our team identified a problem:
[describe problem]. The business impact was [quantify].
The goal of this project was to [objective].
\\`\\`\\`

**Role（角色）**
\\`\\`\\`
I served as the [role] on a [size]-person team.
I was specifically responsible for [your scope].
\\`\\`\\`

**Approach（做法）**
\\`\\`\\`
The architecture consists of [components].
We leveraged [tech] for [reason].
The data flows from [A] through [B] to [C].
We chose [X] over [Y] because [reasoning].
\\`\\`\\`

**Results（成果）**
\\`\\`\\`
This resulted in a [X]% improvement in [metric].
Key metrics include [list].
My primary contribution was [specific impact].
\\`\\`\\`

**Learnings（學習）**
\\`\\`\\`
The main challenge was [problem].
The trade-off between [A] and [B] was [description].
Looking back, the key lesson was [insight].
\\`\\`\\`

### 完整範例

> "During my summer internship at a fintech startup, our team identified that manual fraud detection was causing a 48-hour delay in transaction reviews. The goal of this project was to build an automated fraud detection system.
>
> I served as the data engineer on a four-person team. I was specifically responsible for building the feature engineering pipeline and the real-time scoring API.
>
> The architecture consists of three components: an ingestion layer using Kafka, a feature store built on Redis, and a scoring service deployed on AWS Lambda. We leveraged XGBoost for its balance of accuracy and inference speed.
>
> This resulted in a 92% reduction in review time and a 15% improvement in fraud detection accuracy. My primary contribution — the real-time feature pipeline — enabled sub-200ms scoring latency.
>
> The main challenge was handling data skew, since only 0.3% of transactions were fraudulent. Looking back, the key lesson was that feature engineering matters more than model selection — our biggest accuracy gain came from adding velocity-based features, not from tuning the model."

### 簡報時的 Do's and Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| 用具體數字 | 說 "it works well" |
| 主動描述你的貢獻 | 只說 "we" 不說 "I" |
| 解釋技術選擇的原因 | 只列技術名稱 |
| 承認挑戰並說明如何解決 | 假裝一切順利 |
| 控制在 3-5 分鐘內 | 講超過 10 分鐘 |

"""

    static let enWorld48: String = """

# World 48: Project Presentation in English

> **Goal:** Learn to present your projects fluently in English — from Overview to technical details to results — in a complete and professional manner
> **Use Cases:** Technical interviews, portfolio presentations, LinkedIn project descriptions
> **Estimated Study Time:** 3–4 hours

---

## 48-1: Project Overview Sentence Patterns

### Why the Opening of Your Project Presentation Matters Most

Interviewers listen to dozens of project pitches every day. You have only 30 seconds to capture their attention. A good Project Overview lets the listener know — within three sentences — **what you built, why you built it, and what came of it**.

### Core Sentence Patterns

**1. Stating the Project Goal**

| Pattern | Meaning | When to Use |
|---------|---------|-------------|
| The goal of this project is to... | States the project's objective | Introducing the project purpose |
| This project aims to address... | Emphasizes a problem-oriented approach | Highlighting the problem you solved |
| We set out to solve the problem of... | Has a stronger narrative feel | Telling a story around the challenge |

**2. Describing What You Did**

| Pattern | Meaning | When to Use |
|---------|---------|-------------|
| We developed a system that... | Describes the deliverable | Talking about the output |
| I built a data pipeline to... | Emphasizes personal contribution | Highlighting your individual role |
| The solution involved creating... | More formal phrasing | Formal or written contexts |

**3. Summarizing the Results**

| Pattern | Meaning | When to Use |
|---------|---------|-------------|
| Overall, this project delivered... | Wraps up outcomes | Summarizing results |
| As a result, we achieved... | Connects cause and effect | Linking actions to impact |
| The project successfully reduced/improved... | Quantifies the outcome | Sharing measurable results |

### Common Mistakes

> ❌ **Wrong:** "This project is about doing a recommendation system."
> ✅ **Right:** "This project aims to improve user engagement by building a personalized recommendation system."

> ❌ **Wrong:** "We made a website for the company."
> ✅ **Right:** "We developed an internal dashboard that enables the operations team to monitor KPIs in real time."

The most common mistake native Chinese speakers make: being too vague and lacking impact. English project descriptions should be **specific + result-oriented**.

### Practical Template

\\`\\`\\`
In [context/course/internship], I worked on a project that aimed to
[solve what problem]. We developed [what solution] using [key technologies].
Overall, this project delivered [quantified result], and my primary
contribution was [your specific role].
\\`\\`\\`

### Good vs. Bad Examples

**❌ Weak version:**
> "My project is a chatbot. I used Python and some APIs. It works well."

**✅ Strong version:**
> "During my internship at XYZ Corp, I developed a customer service chatbot that automated 40% of routine inquiries. The system was built with Python and integrated with the company's CRM via REST APIs. Overall, this project reduced average response time from 2 hours to under 5 minutes."

---

## 48-2: Describing Technical Architecture

### Talk Tech in English — Don't Just Translate Chinese

Many learners "word-for-word translate" their Chinese thought process into English when discussing technology, and the result sounds stilted. The key is to **organize your technical description using English logic**: start with the overall architecture, then explain the role of each component, and finally describe how data flows through the system.

### Core Sentence Patterns

**1. Describing the Overall Architecture**

| Pattern | Meaning |
|---------|---------|
| The architecture consists of three main components:... | The architecture is made up of three key parts... |
| The system follows a microservices architecture where... | The system uses a microservices architecture in which... |
| At a high level, the system is divided into... | From a high level, the system breaks down into... |

**2. Explaining Technology Choices**

| Pattern | Meaning |
|---------|---------|
| We leveraged X for its [advantage]... | We used X because of its [benefit]... |
| We chose X over Y because... | We selected X instead of Y because... |
| X was selected due to its ability to... | X was chosen for its capability to... |

**3. Describing Data Flow**

| Pattern | Meaning |
|---------|---------|
| The data flows from [source] through [process] to [destination] | Data moves from [source] through [process] and arrives at [destination] |
| First, the raw data is ingested via... | Initially, raw data is pulled in through... |
| The processed results are then stored in... | The processed output is then persisted in... |

### Common Mistakes

> ❌ **Wrong:** "We use React because it is popular."
> ✅ **Right:** "We leveraged React for its component-based architecture, which allowed us to build reusable UI modules efficiently."

> ❌ **Wrong:** "The data goes to the database and then we show it."
> ✅ **Right:** "The data flows from the API gateway through a validation layer, is persisted in PostgreSQL, and is served to the frontend via a GraphQL endpoint."

**Note:** Using "leverage" instead of "use" sounds more professional — but don't use "leverage" in every sentence, as it will come across as forced. Alternate between: utilize, employ, adopt, leverage.

### Practical Template

\\`\\`\\`
The architecture consists of [N] main components: [list them].
On the backend, we leveraged [technology] for [reason].
The data flows from [source], is processed by [component],
and the results are served to [consumer] via [method].
We chose [tech A] over [tech B] because [specific reason].
\\`\\`\\`

### Key Vocabulary

| Term | Meaning | Example |
|------|---------|---------|
| scalable | can grow with demand | "a scalable data pipeline" |
| decoupled | loosely connected, independent | "decoupled services communicate via message queues" |
| latency | response delay | "reduced latency by 50ms" |
| throughput | volume processed per unit time | "handles 10K requests per second throughput" |
| fault-tolerant | resilient to failures | "a fault-tolerant system with automatic failover" |

---

## 48-3: Describing Data and Results

### Let Numbers Do the Talking — But Say Them Right

Interviewers want to hear numbers, but more importantly they want to hear **the meaning behind the numbers**. Don't just say "accuracy is 95%" — explain how that 95% compares to before, and how it stacks up against industry standards.

### Core Sentence Patterns

**1. Describing Improvement**

| Pattern | Meaning |
|---------|---------|
| This resulted in a X% improvement in... | Describes the percentage gain achieved |
| We observed a X% reduction in... | Describes a measurable decrease |
| Performance improved from X to Y, representing a Z% gain | Frames improvement with before/after context |

**2. Listing Key Metrics**

| Pattern | Meaning |
|---------|---------|
| Key metrics include... | Introduces the metrics being tracked |
| We tracked three primary KPIs:... | Specifies the number and type of KPIs |
| The model achieved an F1 score of X on the test set | Reports a specific model performance metric |

**3. Highlighting Personal Contribution**

| Pattern | Meaning |
|---------|---------|
| My primary contribution was... | Identifies your main area of ownership |
| I was specifically responsible for... | Pinpoints your exact responsibilities |
| I led the effort to... | Signals leadership in a particular area |

### Common Mistakes

> ❌ **Wrong:** "The result is good. Accuracy is high."
> ✅ **Right:** "This resulted in a 15% improvement in prediction accuracy, raising it from 78% to 93%, which exceeded our target of 90%."

> ❌ **Wrong:** "I did the frontend and backend."
> ✅ **Right:** "My primary contribution was designing and implementing the ETL pipeline, which processed over 2 million records daily."

**Pro tip:** When describing results, use a **comparative framework** — compare to before, compare to your target, compare to the industry standard. That's what makes numbers meaningful.

### Practical Template

\\`\\`\\`
The project achieved the following results:
- [Metric 1]: improved from [before] to [after], a [X]% improvement
- [Metric 2]: reduced [what] by [X]%, saving approximately [time/cost]
- [Metric 3]: [qualitative achievement]

My primary contribution was [specific work], which directly
contributed to [which result].
\\`\\`\\`

### Useful Vocabulary for Describing Data

| Term | Meaning | Common Collocations |
|------|---------|---------------------|
| baseline | starting point for comparison | "compared to the baseline" |
| benchmark | industry or standard reference point | "outperformed the industry benchmark" |
| uplift | measurable improvement | "a 20% uplift in conversion" |
| yield | to produce or generate | "yielded significant cost savings" |
| outperform | to do better than | "outperformed the previous model by 12%" |

---

## 48-4: Challenges and Trade-offs

### Demonstrate Your Depth of Thinking

When an interviewer asks "What challenges did you face?", they are not looking for complaints. They want to see **how you analyze problems, make decisions, and learn from experience**. This is the section where you can best demonstrate senior-level thinking.

### Core Sentence Patterns

**1. Describing a Challenge**

| Pattern | Meaning |
|---------|---------|
| The main challenge was... | Names the primary obstacle |
| One significant obstacle we encountered was... | Introduces a notable difficulty |
| We ran into an issue where... | Describes a specific problem that came up |

**2. Describing Trade-offs**

| Pattern | Meaning |
|---------|---------|
| The trade-off between X and Y was... | Explains what was gained vs. given up |
| We had to balance [A] against [B] | Describes tension between two priorities |
| We prioritized X at the expense of Y because... | Explains a deliberate sacrifice |

**3. Reflection and Lessons Learned**

| Pattern | Meaning |
|---------|---------|
| Looking back, the key lesson was... | Reflects on what you took away |
| If I were to do it again, I would... | Shares what you would do differently |
| This experience taught me the importance of... | Connects the challenge to a broader insight |

### Common Mistakes

> ❌ **Wrong:** "The challenge was the data is dirty." (grammatically incorrect + too vague)
> ✅ **Right:** "The main challenge was dealing with inconsistent data formats across three different source systems, which required us to build a custom validation layer."

> ❌ **Wrong:** "We chose the simple way because we don't have time."
> ✅ **Right:** "Given the two-week timeline, we prioritized a rule-based approach at the expense of model accuracy, because delivering a working MVP was more critical at that stage."

### Practical Template

\\`\\`\\`
The main challenge was [specific problem]. We considered [option A]
and [option B]. The trade-off between them was [what you gained vs lost].
Ultimately, we chose [decision] because [reasoning].

Looking back, the key lesson was [insight]. If I were to do it again,
I would [what you'd change] to [expected benefit].
\\`\\`\\`

### Common Trade-off Topics

| Trade-off | How to Say It in English |
|-----------|--------------------------|
| Speed vs. quality | "speed of delivery vs. code quality" |
| Accuracy vs. interpretability | "model accuracy vs. interpretability" |
| Features vs. schedule | "feature completeness vs. time-to-market" |
| Build vs. buy | "build vs. buy" |
| Consistency vs. availability | "consistency vs. availability" |

---

## 48-5 (Boss): Full Project Presentation in English

### The Five-Part Project Presentation Framework

Pull everything you've learned together! A complete project presentation in English follows the **B-R-A-R-L Framework**:

### The B-R-A-R-L Framework

| Section | Label | Description | Time Allocation |
|---------|-------|-------------|----------------|
| 1 | **B**ackground | Context and problem | 15% |
| 2 | **R**ole | Your role on the team | 10% |
| 3 | **A**pproach | How you built it | 35% |
| 4 | **R**esults | Outcomes and impact | 25% |
| 5 | **L**earnings | Challenges and lessons | 15% |

### How to Deliver Each Section

**Background**
\\`\\`\\`
During [when], at [where], our team identified a problem:
[describe problem]. The business impact was [quantify].
The goal of this project was to [objective].
\\`\\`\\`

**Role**
\\`\\`\\`
I served as the [role] on a [size]-person team.
I was specifically responsible for [your scope].
\\`\\`\\`

**Approach**
\\`\\`\\`
The architecture consists of [components].
We leveraged [tech] for [reason].
The data flows from [A] through [B] to [C].
We chose [X] over [Y] because [reasoning].
\\`\\`\\`

**Results**
\\`\\`\\`
This resulted in a [X]% improvement in [metric].
Key metrics include [list].
My primary contribution was [specific impact].
\\`\\`\\`

**Learnings**
\\`\\`\\`
The main challenge was [problem].
The trade-off between [A] and [B] was [description].
Looking back, the key lesson was [insight].
\\`\\`\\`

### Full Example

> "During my summer internship at a fintech startup, our team identified that manual fraud detection was causing a 48-hour delay in transaction reviews. The goal of this project was to build an automated fraud detection system.
>
> I served as the data engineer on a four-person team. I was specifically responsible for building the feature engineering pipeline and the real-time scoring API.
>
> The architecture consists of three components: an ingestion layer using Kafka, a feature store built on Redis, and a scoring service deployed on AWS Lambda. We leveraged XGBoost for its balance of accuracy and inference speed.
>
> This resulted in a 92% reduction in review time and a 15% improvement in fraud detection accuracy. My primary contribution — the real-time feature pipeline — enabled sub-200ms scoring latency.
>
> The main challenge was handling data skew, since only 0.3% of transactions were fraudulent. Looking back, the key lesson was that feature engineering matters more than model selection — our biggest accuracy gain came from adding velocity-based features, not from tuning the model."

### Presentation Do's and Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Use specific numbers | Say "it works well" |
| Actively describe your own contribution | Only say "we" without ever saying "I" |
| Explain the reasoning behind your technology choices | Just list technology names |
| Acknowledge challenges and explain how you addressed them | Pretend everything went smoothly |
| Keep it within 3–5 minutes | Talk for more than 10 minutes |

"""

    static let zhWorld49: String = """

# World 49：面試英文

> **目標：** 掌握英文面試全流程的關鍵句型，從自我介紹到提問環節，每個階段都能自信表達
> **適用場景：** 外商面試、英文 phone screen、全英文 final round
> **預估學習時間：** 3-4 小時

---

## 49-1：Self Introduction

### 60 秒決勝負

英文自我介紹不是翻譯你的履歷，而是 **用故事線串起你的價值主張**。面試官想在 60 秒內知道：你是誰、你為什麼適合這個職位。

### 核心句型

**1. 開場——你現在的身份**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| I'm currently a [year] student at [school], majoring in... | 我目前是 [學校] [年級] 的學生，主修⋯ | 學生身份 |
| I'm currently working as a [role] at [company] | 我目前在 [公司] 擔任 [職位] | 在職身份 |
| I recently completed [program/internship] at... | 我最近完成了在⋯的 [計畫/實習] | 剛結束某經歷 |

**2. 中段——你的背景與亮點**

| 句型 | 中文意思 |
|------|----------|
| My background is in [field], with a focus on... | 我的背景在 [領域]，專注於⋯ |
| I've had the opportunity to work on... | 我有機會參與過⋯ |
| What I'm most proud of is... | 我最自豪的是⋯ |

**3. 收尾——為什麼是這個職位**

| 句型 | 中文意思 |
|------|----------|
| I'm particularly interested in this role because... | 我對這個職位特別感興趣因為⋯ |
| What excites me about [company] is... | [公司] 讓我興奮的是⋯ |
| I believe my experience in [X] aligns well with... | 我相信我在 [X] 的經驗很適合⋯ |

### 常見錯誤

> ❌ **錯誤：** "My name is Kevin. I study in NTU. I like data science. I want to join your company."
> ✅ **正確：** "I'm currently a senior at NTU, majoring in Information Management. My background is in data analytics, with a focus on building product metrics dashboards. I'm particularly interested in this Product Analyst role because I want to apply my analytical skills to drive real product decisions."

> ❌ **錯誤：** "I have many skills like Python, SQL, Excel, PowerPoint, communication..."（列清單）
> ✅ **正確：** "I've had the opportunity to build an end-to-end analytics pipeline during my internship, which gave me hands-on experience with Python, SQL, and data visualization."

**注意：** 不要用 "My name is..."，面試官已經看過你的名字了。直接講身份和背景。

### 實用模板

\\`\\`\\`
I'm currently [identity] at [organization], where I focus on [area].
My background is in [field] — I've had the opportunity to [1-2 key
experiences]. What I'm most proud of is [specific achievement with
numbers]. I'm particularly interested in this role because [genuine
reason tied to the company/role].
\\`\\`\\`

---

## 49-2：Behavioral Questions / STAR

### 用 STAR 講故事，不是記流水帳

Behavioral questions（行為面試題）問的是 "Tell me about a time when..."。回答的黃金法則是 **STAR 方法**：Situation → Task → Action → Result。

### STAR 四段句型

**S — Situation（情境）**

| 句型 | 中文意思 |
|------|----------|
| During my [internship/project] at [where]... | 在 [地方] 的 [實習/專案] 期間⋯ |
| Last semester, our team was working on... | 上學期，我們團隊正在做⋯ |
| We were facing a situation where... | 我們面臨一個⋯的情況 |

**T — Task（任務）**

| 句型 | 中文意思 |
|------|----------|
| My responsibility was to... | 我的責任是⋯ |
| I was tasked with... | 我被指派⋯ |
| The goal was to [deliverable] within [timeline] | 目標是在 [時間] 內 [交付物] |

**A — Action（行動）**

| 句型 | 中文意思 |
|------|----------|
| The first thing I did was... | 我做的第一件事是⋯ |
| I then proposed a solution to... | 我接著提出了一個⋯的方案 |
| I took the initiative to... | 我主動⋯ |
| I collaborated with [who] to... | 我和 [誰] 合作⋯ |

**R — Result（結果）**

| 句型 | 中文意思 |
|------|----------|
| As a result, we were able to... | 因此，我們成功⋯ |
| This led to a [X]% improvement in... | 這帶來了 [X]% 的⋯提升 |
| The key takeaway was... | 關鍵收穫是⋯ |

### 常見錯誤

> ❌ **錯誤：** 只講 Situation 講了兩分鐘，Result 只有一句 "it worked out well"
> ✅ **正確：** S 和 T 合計 30 秒，A 佔 60 秒（最詳細），R 佔 30 秒（要有數字）

> ❌ **錯誤：** "We did this, we did that"（全用 we）
> ✅ **正確：** Action 部分要用 "I"——面試官要知道 **你** 做了什麼

### 實用模板

\\`\\`\\`
[S+T] During my internship at [company], our team was tasked with
[goal]. I was responsible for [your specific scope].

[A] The first thing I did was [step 1]. I then [step 2].
When I encountered [obstacle], I [how you solved it].
I also collaborated with [who] to [step 3].

[R] As a result, we achieved [quantified outcome].
The key takeaway was [lesson learned].
\\`\\`\\`

### 常見 Behavioral 問題對照

| 問題類型 | 英文問法 | 考什麼 |
|----------|----------|--------|
| 團隊合作 | "Tell me about a time you worked with a difficult teammate" | Collaboration |
| 失敗經驗 | "Describe a time when something didn't go as planned" | Resilience |
| 領導力 | "Give an example of when you took the lead" | Initiative |
| 時間管理 | "How did you handle competing deadlines?" | Prioritization |

---

## 49-3：Case Study 回答句型

### 結構化思考，用英文呈現

Case interview 考的不只是答案對不對，更是你 **怎麼思考**。用英文做 Case 時，你需要在思考的同時「說出你的思路」（think out loud）。

### 核心句型

**1. 開始拆解問題**

| 句型 | 中文意思 |
|------|----------|
| My approach would be to first... | 我的做法是先⋯ |
| Let me break this down into [N] parts... | 讓我把這拆成 [N] 個部分⋯ |
| Before jumping in, I'd like to clarify... | 在開始之前，我想先釐清⋯ |

**2. 提出假設**

| 句型 | 中文意思 |
|------|----------|
| I'd like to hypothesize that... | 我想假設⋯ |
| My initial hypothesis is that the root cause is... | 我初步的假設是根本原因是⋯ |
| Based on the information given, I'd assume... | 根據已知資訊，我會假設⋯ |

**3. 分析與推論**

| 句型 | 中文意思 |
|------|----------|
| If we look at the data, we can see that... | 如果我們看數據，可以發現⋯ |
| This suggests that... | 這暗示⋯ |
| One potential driver could be... | 一個可能的驅動因素是⋯ |

**4. 給出建議**

| 句型 | 中文意思 |
|------|----------|
| Based on this analysis, my recommendation is... | 基於這個分析，我的建議是⋯ |
| I would recommend [action] because... | 我會建議 [行動] 因為⋯ |
| In the short term, I'd suggest... In the long term,... | 短期我建議⋯長期來看⋯ |

### 常見錯誤

> ❌ **錯誤：** 沉默思考 30 秒後直接給答案
> ✅ **正確：** "Let me take a moment to structure my thoughts... My approach would be to first understand the revenue breakdown, then identify which segment is declining."

> ❌ **錯誤：** "I think the answer is to lower the price."
> ✅ **正確：** "Based on this analysis, my recommendation is to implement a tiered pricing strategy, because the data suggests price sensitivity varies significantly across customer segments."

### Case 回答中的過渡用語

| 用途 | 英文說法 |
|------|----------|
| 買時間思考 | "That's a great question. Let me think through this systematically." |
| 要更多資訊 | "Before I proceed, could you share the breakdown of...?" |
| 切換方向 | "Now, shifting to the cost side of the equation..." |
| 確認理解 | "Just to make sure I'm on the right track..." |
| 做結論 | "To summarize my recommendation..." |

---

## 49-4：提問環節

### 好問題比好答案更加分

面試最後的 "Do you have any questions for me?" 不是客套話，是你展現 **genuine interest** 和 **critical thinking** 的機會。

### 核心句型

**1. 了解團隊與文化**

| 句型 | 中文意思 |
|------|----------|
| Could you tell me more about the team structure? | 可以多介紹一下團隊結構嗎？ |
| How does the team approach decision-making? | 團隊怎麼做決策？ |
| What does a typical day look like for this role? | 這個職位的一天大概是什麼樣子？ |

**2. 了解期望與成長**

| 句型 | 中文意思 |
|------|----------|
| What does success look like for this role in the first 90 days? | 這個職位前 90 天的成功是什麼樣子？ |
| What are the biggest challenges the team is currently facing? | 團隊目前面臨的最大挑戰是什麼？ |
| How does the company support professional development? | 公司怎麼支持專業發展？ |

**3. 展現對公司的研究**

| 句型 | 中文意思 |
|------|----------|
| I read that [company] recently [news]. How has that impacted the team? | 我看到 [公司] 最近 [新聞]，這對團隊有什麼影響？ |
| I noticed [product feature]. What's the thinking behind...? | 我注意到 [產品功能]，背後的思路是什麼？ |
| How does this role contribute to [company's strategic goal]? | 這個職位如何貢獻於 [公司策略目標]？ |

### 常見錯誤

> ❌ **錯誤：** "No, I think you've covered everything."（不問問題 = 不感興趣）
> ✅ **正確：** 至少準備 3 個問題，問 1-2 個

> ❌ **錯誤：** "How much is the salary?"（太早問薪資）
> ✅ **正確：** 薪資留到 HR 階段或 offer 階段再談

> ❌ **錯誤：** "What does your company do?"（沒做功課）
> ✅ **正確：** 問題要建立在你已經做過研究的基礎上

### 實用模板——按面試官角色選問題

| 面試官身份 | 推薦問題 |
|------------|----------|
| Hiring Manager | "What does success look like for this role in the first 90 days?" |
| Team Member | "What's your favorite part about working on this team?" |
| Senior Leader | "How does this team's work align with the company's top priorities this year?" |
| HR / Recruiter | "What are the next steps in the interview process?" |

---

## 49-5（Boss）：模擬面試全流程

### 把所有環節串起來

一場完整的英文面試通常包含以下流程。以下是每個環節的時間分配和關鍵句型整理：

### 面試全流程 Cheat Sheet

| 環節 | 時間 | 你該做的 |
|------|------|----------|
| Opening & Self Intro | 3-5 min | 60 秒自我介紹 + small talk |
| Behavioral Round | 15-20 min | 2-3 個 STAR 故事 |
| Technical / Case | 20-30 min | 結構化思考 + think out loud |
| Your Questions | 5-10 min | 問 1-2 個好問題 |
| Closing | 2 min | 感謝 + 表達期待 |

### 每個環節的開場句

**Opening：**
\\`\\`\\`
"Thank you for taking the time to meet with me today.
I've been looking forward to this conversation."
\\`\\`\\`

**Transitioning to Behavioral：**
\\`\\`\\`
"Sure, I'd be happy to walk you through an example."
"That's a great question — let me share a specific experience."
\\`\\`\\`

**Starting a Case：**
\\`\\`\\`
"Thank you for the question. Let me take a moment to structure
my thoughts before diving in."
\\`\\`\\`

**Asking Questions：**
\\`\\`\\`
"I do have a few questions I'd love to ask."
"There are a couple of things I'm curious about."
\\`\\`\\`

**Closing：**
\\`\\`\\`
"Thank you again for your time. This conversation has made me
even more excited about the opportunity. I look forward to
hearing about the next steps."
\\`\\`\\`

### Do's and Don'ts 總整理

| ✅ Do | ❌ Don't |
|-------|---------|
| 開場微笑，語速適中 | 語速太快顯得緊張 |
| 用 STAR 結構回答 | 講故事沒有重點 |
| Think out loud | 沉默太久才回答 |
| 用 "I" 描述貢獻 | 全部用 "we" |
| 用數字支持論點 | 只說 "it went well" |
| 不懂就問 clarifying question | 瞎猜然後答錯方向 |
| 問展現研究的問題 | 問 Google 就查得到的問題 |
| 面試後寄 thank you email | 面試完就忘了這件事 |

### Thank You Email 模板

\\`\\`\\`
Subject: Thank you — [Role] Interview

Hi [Name],

Thank you for taking the time to speak with me today about the
[role] position. I really enjoyed learning about [specific topic
discussed] and how the team approaches [something mentioned].

Our conversation reinforced my excitement about this opportunity,
particularly [specific reason]. I believe my experience in
[relevant skill] would allow me to contribute meaningfully to
[team goal discussed].

Please don't hesitate to reach out if you need any additional
information. I look forward to hearing about the next steps.

Best regards,
[Your Name]
\\`\\`\\`

### 面試英文的終極心態

記住：面試官不是在考你的英文能力，而是透過英文評估你的 **思考能力** 和 **溝通能力**。所以：

1. **清晰 > 華麗** — 用簡單但精準的句子，勝過複雜但卡住的長句
2. **結構 > 內容** — 有結構的普通答案，勝過沒結構的精彩答案
3. **真誠 > 完美** — 不確定就說 "That's a great question, let me think about that"，比硬掰好一百倍

"""

    static let enWorld49: String = """

# World 49: Interview English

> **Goal:** Master key phrases for every stage of an English interview — from self-introduction to the Q&A round — so you can speak with confidence at each step
> **Applicable scenarios:** Foreign-company interviews, English phone screens, all-English final rounds
> **Estimated study time:** 3–4 hours

---

## 49-1: Self Introduction

### Win the Room in 60 Seconds

An English self-introduction is not a translation of your resume — it is **a story that ties together your value proposition**. In 60 seconds, the interviewer wants to know: who you are and why you are the right fit for this role.

### Core Phrases

**1. Opening — Your Current Identity**

| Phrase | When to Use |
|--------|-------------|
| I'm currently a [year] student at [school], majoring in... | Student identity |
| I'm currently working as a [role] at [company] | Currently employed |
| I recently completed [program/internship] at... | Just finished an experience |

**2. Middle — Your Background and Highlights**

| Phrase | Meaning |
|--------|---------|
| My background is in [field], with a focus on... | Describe your domain and specialization |
| I've had the opportunity to work on... | Highlight key experiences |
| What I'm most proud of is... | Showcase a specific achievement |

**3. Closing — Why This Role**

| Phrase | Meaning |
|--------|---------|
| I'm particularly interested in this role because... | State your genuine motivation |
| What excites me about [company] is... | Show company-specific interest |
| I believe my experience in [X] aligns well with... | Connect your background to the role |

### Common Mistakes

> ❌ **Wrong:** "My name is Kevin. I study in NTU. I like data science. I want to join your company."
> ✅ **Right:** "I'm currently a senior at NTU, majoring in Information Management. My background is in data analytics, with a focus on building product metrics dashboards. I'm particularly interested in this Product Analyst role because I want to apply my analytical skills to drive real product decisions."

> ❌ **Wrong:** "I have many skills like Python, SQL, Excel, PowerPoint, communication..." (a laundry list)
> ✅ **Right:** "I've had the opportunity to build an end-to-end analytics pipeline during my internship, which gave me hands-on experience with Python, SQL, and data visualization."

**Note:** Avoid starting with "My name is..." — the interviewer already knows your name. Jump straight to your identity and background.

### Practical Template

\\`\\`\\`
I'm currently [identity] at [organization], where I focus on [area].
My background is in [field] — I've had the opportunity to [1-2 key
experiences]. What I'm most proud of is [specific achievement with
numbers]. I'm particularly interested in this role because [genuine
reason tied to the company/role].
\\`\\`\\`

---

## 49-2: Behavioral Questions / STAR

### Tell a Story with STAR, Not a Chronological Log

Behavioral questions ask "Tell me about a time when...". The golden rule for answering is the **STAR method**: Situation → Task → Action → Result.

### STAR Phrase Guide

**S — Situation**

| Phrase | Meaning |
|--------|---------|
| During my [internship/project] at [where]... | Set the context for your story |
| Last semester, our team was working on... | Establish the time and team context |
| We were facing a situation where... | Describe the challenge or circumstance |

**T — Task**

| Phrase | Meaning |
|--------|---------|
| My responsibility was to... | Define your specific scope |
| I was tasked with... | State what you were assigned |
| The goal was to [deliverable] within [timeline] | Clarify the objective and deadline |

**A — Action**

| Phrase | Meaning |
|--------|---------|
| The first thing I did was... | Describe your first concrete step |
| I then proposed a solution to... | Show proactive problem-solving |
| I took the initiative to... | Demonstrate ownership and initiative |
| I collaborated with [who] to... | Highlight cross-functional work |

**R — Result**

| Phrase | Meaning |
|--------|---------|
| As a result, we were able to... | State the outcome |
| This led to a [X]% improvement in... | Quantify the impact |
| The key takeaway was... | Share what you learned |

### Common Mistakes

> ❌ **Wrong:** Spending two minutes on Situation alone, then ending Result with "it worked out well"
> ✅ **Right:** S and T together = 30 seconds; A = 60 seconds (most detailed); R = 30 seconds (include numbers)

> ❌ **Wrong:** "We did this, we did that" (using "we" throughout)
> ✅ **Right:** Use "I" in the Action section — the interviewer needs to know what **you** specifically did

### Practical Template

\\`\\`\\`
[S+T] During my internship at [company], our team was tasked with
[goal]. I was responsible for [your specific scope].

[A] The first thing I did was [step 1]. I then [step 2].
When I encountered [obstacle], I [how you solved it].
I also collaborated with [who] to [step 3].

[R] As a result, we achieved [quantified outcome].
The key takeaway was [lesson learned].
\\`\\`\\`

### Common Behavioral Question Reference

| Question Type | How It's Phrased | What It Tests |
|---------------|-----------------|---------------|
| Teamwork | "Tell me about a time you worked with a difficult teammate" | Collaboration |
| Failure | "Describe a time when something didn't go as planned" | Resilience |
| Leadership | "Give an example of when you took the lead" | Initiative |
| Time Management | "How did you handle competing deadlines?" | Prioritization |

---

## 49-3: Case Study Response Phrases

### Structured Thinking, Delivered in English

A case interview tests not just whether your answer is correct, but **how you think**. When working through a case in English, you need to verbalize your reasoning as you go — this is called thinking out loud.

### Core Phrases

**1. Breaking Down the Problem**

| Phrase | Meaning |
|--------|---------|
| My approach would be to first... | Signal how you plan to start |
| Let me break this down into [N] parts... | Show structured decomposition |
| Before jumping in, I'd like to clarify... | Ask scoping questions upfront |

**2. Forming a Hypothesis**

| Phrase | Meaning |
|--------|---------|
| I'd like to hypothesize that... | State an initial assumption |
| My initial hypothesis is that the root cause is... | Propose a starting point for analysis |
| Based on the information given, I'd assume... | Ground your hypothesis in the given data |

**3. Analysis and Reasoning**

| Phrase | Meaning |
|--------|---------|
| If we look at the data, we can see that... | Draw attention to a key data point |
| This suggests that... | Interpret evidence and draw an inference |
| One potential driver could be... | Explore possible causes |

**4. Delivering a Recommendation**

| Phrase | Meaning |
|--------|---------|
| Based on this analysis, my recommendation is... | Lead with your conclusion |
| I would recommend [action] because... | Support your recommendation with reasoning |
| In the short term, I'd suggest... In the long term,... | Show multi-horizon thinking |

### Common Mistakes

> ❌ **Wrong:** Staying silent for 30 seconds and then jumping straight to an answer
> ✅ **Right:** "Let me take a moment to structure my thoughts... My approach would be to first understand the revenue breakdown, then identify which segment is declining."

> ❌ **Wrong:** "I think the answer is to lower the price."
> ✅ **Right:** "Based on this analysis, my recommendation is to implement a tiered pricing strategy, because the data suggests price sensitivity varies significantly across customer segments."

### Transition Phrases for Case Interviews

| Purpose | What to Say |
|---------|-------------|
| Buying time to think | "That's a great question. Let me think through this systematically." |
| Requesting more information | "Before I proceed, could you share the breakdown of...?" |
| Shifting to another dimension | "Now, shifting to the cost side of the equation..." |
| Confirming your direction | "Just to make sure I'm on the right track..." |
| Wrapping up | "To summarize my recommendation..." |

---

## 49-4: The Q&A Round

### Good Questions Score More Than Good Answers

The interviewer's closing "Do you have any questions for me?" is not a formality — it is your chance to demonstrate **genuine interest** and **critical thinking**.

### Core Phrases

**1. Understanding Team Dynamics and Culture**

| Phrase | Meaning |
|--------|---------|
| Could you tell me more about the team structure? | Learn how the team is organized |
| How does the team approach decision-making? | Understand the team's working style |
| What does a typical day look like for this role? | Get a realistic picture of day-to-day work |

**2. Understanding Expectations and Growth**

| Phrase | Meaning |
|--------|---------|
| What does success look like for this role in the first 90 days? | Clarify near-term priorities and performance bar |
| What are the biggest challenges the team is currently facing? | Show you are ready to tackle real problems |
| How does the company support professional development? | Explore growth opportunities |

**3. Showing You've Done Your Research**

| Phrase | Meaning |
|--------|---------|
| I read that [company] recently [news]. How has that impacted the team? | Show you follow company developments |
| I noticed [product feature]. What's the thinking behind...? | Demonstrate product curiosity |
| How does this role contribute to [company's strategic goal]? | Connect the role to the bigger picture |

### Common Mistakes

> ❌ **Wrong:** "No, I think you've covered everything." (asking nothing = showing no interest)
> ✅ **Right:** Prepare at least 3 questions; ask 1–2 of them

> ❌ **Wrong:** "How much is the salary?" (too early to ask about compensation)
> ✅ **Right:** Save salary discussions for the HR stage or after you have received an offer

> ❌ **Wrong:** "What does your company do?" (you didn't do your homework)
> ✅ **Right:** Every question should be grounded in research you have already done

### Practical Template — Match Your Question to the Interviewer

| Interviewer Role | Recommended Question |
|-----------------|----------------------|
| Hiring Manager | "What does success look like for this role in the first 90 days?" |
| Team Member | "What's your favorite part about working on this team?" |
| Senior Leader | "How does this team's work align with the company's top priorities this year?" |
| HR / Recruiter | "What are the next steps in the interview process?" |

---

## 49-5 (Boss): Full Mock Interview Walkthrough

### Connecting Every Stage Together

A complete English interview typically follows the flow below. Here is a breakdown of timing and key phrases for each stage:

### Full Interview Cheat Sheet

| Stage | Time | What You Should Do |
|-------|------|-------------------|
| Opening & Self Intro | 3–5 min | 60-second self-intro + small talk |
| Behavioral Round | 15–20 min | 2–3 STAR stories |
| Technical / Case | 20–30 min | Structured thinking + think out loud |
| Your Questions | 5–10 min | Ask 1–2 well-researched questions |
| Closing | 2 min | Express gratitude and enthusiasm |

### Opening Lines for Each Stage

**Opening:**
\\`\\`\\`
"Thank you for taking the time to meet with me today.
I've been looking forward to this conversation."
\\`\\`\\`

**Transitioning to Behavioral:**
\\`\\`\\`
"Sure, I'd be happy to walk you through an example."
"That's a great question — let me share a specific experience."
\\`\\`\\`

**Starting a Case:**
\\`\\`\\`
"Thank you for the question. Let me take a moment to structure
my thoughts before diving in."
\\`\\`\\`

**Asking Questions:**
\\`\\`\\`
"I do have a few questions I'd love to ask."
"There are a couple of things I'm curious about."
\\`\\`\\`

**Closing:**
\\`\\`\\`
"Thank you again for your time. This conversation has made me
even more excited about the opportunity. I look forward to
hearing about the next steps."
\\`\\`\\`

### Interview Do's and Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Smile at the start and speak at a measured pace | Rush your words — it signals nervousness |
| Use the STAR structure for behavioral answers | Tell a story without a clear point |
| Think out loud | Stay silent too long before responding |
| Use "I" to describe your contributions | Default to "we" for everything |
| Support your points with numbers | Just say "it went well" |
| Ask clarifying questions when unsure | Guess and go in the wrong direction |
| Ask questions that reflect your research | Ask things you could Google in 5 seconds |
| Send a thank-you email after the interview | Forget about follow-up entirely |

### Thank You Email Template

\\`\\`\\`
Subject: Thank you — [Role] Interview

Hi [Name],

Thank you for taking the time to speak with me today about the
[role] position. I really enjoyed learning about [specific topic
discussed] and how the team approaches [something mentioned].

Our conversation reinforced my excitement about this opportunity,
particularly [specific reason]. I believe my experience in
[relevant skill] would allow me to contribute meaningfully to
[team goal discussed].

Please don't hesitate to reach out if you need any additional
information. I look forward to hearing about the next steps.

Best regards,
[Your Name]
\\`\\`\\`

### The Ultimate Mindset for Interview English

Remember: interviewers are not testing your English proficiency — they are using English as the medium to assess your **thinking ability** and **communication skills**. With that in mind:

1. **Clarity over eloquence** — A simple but precise sentence beats a complex one that makes you stumble
2. **Structure over content** — A well-structured ordinary answer beats a brilliant but disorganized one
3. **Authenticity over perfection** — When you're unsure, saying "That's a great question, let me think about that" is a hundred times better than bluffing

"""

    static let zhWorld50: String = """

# World 50：Business/Product/Data 字彙

> **目標：** 掌握職場上最常用的商業、產品、數據分析英文字彙，能在會議、報告、Slack 中自然使用
> **適用場景：** 外商日常工作、英文週報、跨國團隊溝通
> **預估學習時間：** 3-4 小時

---

## 50-1：Business 核心字彙

### 不懂這些字，商業會議你會完全聽不懂

這些是 Business 領域最基礎的字彙。不管你是做 Product、Data 還是 Engineering，跟商業團隊合作時一定會碰到。

### 字彙表

| 英文 | 中文 | 定義 | 例句 |
|------|------|------|------|
| Revenue | 營收 | 公司賣東西賺的錢（未扣成本） | "Q3 revenue grew 12% YoY." |
| MRR | 月經常性收入 | Monthly Recurring Revenue，訂閱制每月固定收入 | "Our MRR just crossed \\$100K." |
| ARR | 年經常性收入 | Annual Recurring Revenue = MRR × 12 | "We're targeting \\$1.2M ARR by year-end." |
| Churn | 流失率 | 客戶或用戶停止使用的比率 | "Monthly churn dropped to 3.5%." |
| Retention | 留存率 | 用戶繼續使用的比率（= 1 - Churn） | "Day-7 retention is at 45%." |
| CAC | 客戶取得成本 | Customer Acquisition Cost | "Our CAC is \\$50 per paid user." |
| LTV | 客戶終身價值 | Lifetime Value，一個客戶一輩子貢獻多少錢 | "LTV/CAC ratio should be above 3:1." |
| Growth Rate | 成長率 | 通常指 MoM 或 YoY 的成長 | "We're seeing 15% MoM growth." |
| Burn Rate | 燒錢速率 | 公司每月花多少錢 | "At this burn rate, we have 18 months of runway." |
| Runway | 跑道 | 以目前燒錢速率還能撐多久 | "We need to extend our runway to 24 months." |

### 常見錯誤

> ❌ **錯誤：** "The revenue is very high."（太模糊）
> ✅ **正確：** "Revenue grew 12% year-over-year to \\$2.4M in Q3."

> ❌ **錯誤：** 把 Revenue 跟 Profit 搞混
> ✅ **澄清：** Revenue 是營收（還沒扣成本），Profit 是利潤（扣完成本後的）

### 實用搭配

| 搭配 | 中文 | 例句 |
|------|------|------|
| drive revenue | 驅動營收 | "This feature could drive an additional \\$200K in revenue." |
| reduce churn | 降低流失 | "Improving onboarding reduced churn by 20%." |
| improve retention | 提升留存 | "Push notifications improved D7 retention by 8%." |
| lower CAC | 降低取得成本 | "Organic content helped lower CAC from \\$50 to \\$35." |

---

## 50-2：Product 字彙

### PM 每天掛在嘴邊的詞

如果你想當 Product Analyst 或跟 PM 合作，這些字你不只要認得，還要能自然地用在對話中。

### 字彙表

| 英文 | 中文 | 定義 | 例句 |
|------|------|------|------|
| Sprint | 衝刺期 | 通常 1-2 週的開發週期 | "We'll tackle this in the next sprint." |
| Backlog | 待辦清單 | 所有等待被開發的功能/任務 | "Let's add this to the backlog." |
| MVP | 最小可行產品 | Minimum Viable Product | "Let's ship an MVP first and iterate." |
| Iteration | 迭代 | 重複改善的過程 | "After three iterations, the design was finalized." |
| Stakeholder | 利害關係人 | 對專案有影響力或被影響的人 | "We need to align with all stakeholders." |
| Roadmap | 產品路線圖 | 產品未來的規劃 | "This is on our Q2 roadmap." |
| Prioritization | 優先排序 | 決定什麼先做的過程 | "Prioritization was based on impact vs. effort." |
| User Story | 使用者故事 | 以用戶視角描述功能需求 | "As a user, I want to... so that I can..." |
| Scope Creep | 範圍蔓延 | 專案需求不斷膨脹 | "We need to watch out for scope creep." |
| Ship | 上線 / 發布 | 把功能推到 production | "We shipped the new feature on Friday." |

### 常見錯誤

> ❌ **錯誤：** "We need to develop the MVP very completely."（矛盾！MVP 本來就是最小的）
> ✅ **正確：** "Let's define the core features for our MVP and save the nice-to-haves for future iterations."

> ❌ **錯誤：** "I have a roadmap for today."（roadmap 是長期規劃，不是今天的 to-do）
> ✅ **正確：** "Here's our product roadmap for the next two quarters."

### 實用搭配

| 搭配 | 中文 | 例句 |
|------|------|------|
| groom the backlog | 整理待辦清單 | "Let's groom the backlog before sprint planning." |
| align with stakeholders | 與利害關係人對齊 | "I'll align with stakeholders on the timeline." |
| define the scope | 定義範圍 | "We need to clearly define the scope before kicking off." |
| iterate on | 持續迭代 | "We'll iterate on the design based on user feedback." |

---

## 50-3：Data/Analytics 字彙

### 數據人的共同語言

做 Data Analyst、Product Analyst 或任何跟數據相關的角色，這些詞是你的日常。

### 字彙表

| 英文 | 中文 | 定義 | 例句 |
|------|------|------|------|
| Funnel | 漏斗 | 用戶從進入到完成目標的各階段 | "The biggest drop-off in the funnel is at checkout." |
| Cohort | 世代群組 | 同一時期加入的用戶群 | "The Jan cohort shows better retention than Dec." |
| A/B Test | A/B 測試 | 同時測試兩個版本比較效果 | "We ran an A/B test on the landing page." |
| Statistical Significance | 統計顯著性 | 結果不是隨機發生的信心程度 | "The result is statistically significant at p < 0.05." |
| Conversion Rate | 轉換率 | 完成目標行為的比率 | "Conversion rate improved from 2.1% to 3.4%." |
| DAU / MAU | 日活 / 月活 | Daily / Monthly Active Users | "DAU/MAU ratio indicates strong engagement at 40%." |
| Segmentation | 分群 | 把用戶分成不同群體分析 | "User segmentation revealed three distinct personas." |
| Attribution | 歸因 | 判斷哪個管道帶來轉換 | "Last-touch attribution credits the final channel." |
| Anomaly | 異常值 | 偏離正常模式的數據點 | "We detected an anomaly in yesterday's traffic data." |
| Dashboard | 儀表板 | 數據視覺化面板 | "The executive dashboard tracks all key metrics." |

### 常見錯誤

> ❌ **錯誤：** "The A/B test shows version B is better."（沒提到是否 significant）
> ✅ **正確：** "Version B outperformed A by 8%, and the result is statistically significant with p = 0.03."

> ❌ **錯誤：** "We analyzed a cohort of random users."（cohort 不是隨機抽樣）
> ✅ **正確：** "We analyzed the March 2025 sign-up cohort to track their 30-day retention."

### 實用搭配

| 搭配 | 中文 | 例句 |
|------|------|------|
| run an A/B test | 執行 A/B 測試 | "Let's run an A/B test before rolling out the change." |
| analyze the funnel | 分析漏斗 | "I analyzed the funnel and found a 40% drop at step 3." |
| build a dashboard | 建儀表板 | "I built a dashboard to track weekly KPIs." |
| segment users by | 按⋯分群用戶 | "We segmented users by acquisition channel." |

---

## 50-4：常見搭配與易混淆

### 這些字你以為你會，但你可能用錯了

英文裡有很多「看起來差不多」的字，但意思或用法完全不同。以下是職場英文中最常被混淆的。

### 易混淆字彙

**1. affect vs. effect**

| 字 | 詞性 | 意思 | 例句 |
|----|------|------|------|
| affect | 動詞 | 影響 | "The outage affected 10% of users." |
| effect | 名詞 | 影響 / 效果 | "The effect of the change was significant." |

> 記法：**A**ffect = **A**ction（動詞），**E**ffect = **E**nd result（名詞）

**2. insight vs. finding**

| 字 | 意思 | 差異 |
|----|------|------|
| insight | 洞察 | 需要分析和解讀，帶有「所以呢」 |
| finding | 發現 | 單純的事實描述 |

> ❌ "The insight is that revenue dropped 5%."（這只是 finding）
> ✅ "The finding is that revenue dropped 5%. The insight is that this decline correlates with the removal of the free trial, suggesting price sensitivity among new users."

**3. leverage vs. utilize**

| 字 | 語感 | 使用場合 |
|----|------|----------|
| leverage | 策略性地利用（暗示從中獲得優勢） | "We leveraged our existing user base to drive referrals." |
| utilize | 使用（比 use 正式一點） | "We utilized Python for data processing." |

> 小提醒：很多人為了顯得專業而過度使用 leverage。如果只是單純「使用」，用 use 就好。

**4. ensure vs. assure vs. insure**

| 字 | 意思 | 例句 |
|----|------|------|
| ensure | 確保（事情會發生） | "Please ensure the data is backed up." |
| assure | 向人保證 | "I can assure you that the system is stable." |
| insure | 投保 | "We insured the equipment against damage." |

### 更多常見搭配

| 容易說錯 | 正確說法 |
|----------|----------|
| ❌ "discuss about" | ✅ "discuss [something]"（不需要 about） |
| ❌ "according to me" | ✅ "in my opinion" 或 "from my perspective" |
| ❌ "the datas show" | ✅ "the data show"（data 在學術和商業英文中常作複數） |
| ❌ "make a decision to" | ✅ "decide to"（更簡潔） |
| ❌ "improve the efficiency" | ✅ "improve efficiency"（不需要 the，除非指特定的） |

---

## 50-5：字彙情境應用

### 會背單字不夠，要會「用」在情境裡

把前面學的字彙放到三個真實職場場景中練習：週報、Slack 訊息、簡報。

### 場景一：英文週報 (Weekly Update)

\\`\\`\\`
Subject: Weekly Update — [Your Name] (Mar 17-21)

**What I accomplished this week:**
- Analyzed the sign-up funnel and identified a 35% drop-off
  at the email verification step
- Built a cohort analysis dashboard tracking D1, D7, D30 retention
  by acquisition channel
- Ran an A/B test on the onboarding flow (results pending
  statistical significance)

**Key insights:**
- Users acquired via organic search show 2x higher LTV compared
  to paid channels, suggesting we should invest more in SEO
- Churn is disproportionately high among users who skip the
  onboarding tutorial

**Blockers:**
- Waiting on stakeholder alignment for the Q2 roadmap priorities

**Next week:**
- Segment churned users to identify common patterns
- Present funnel analysis findings to the product team
\\`\\`\\`

### 場景二：Slack 訊息

\\`\\`\\`
@channel Quick update on the pricing A/B test:

After 2 weeks, Version B (annual plan highlighted) shows a 12%
uplift in conversion rate vs. control. Result is statistically
significant (p = 0.02).

Recommendation: Ship Version B to 100% of users.

I'll add the detailed breakdown to the dashboard by EOD.
Let me know if you have questions!
\\`\\`\\`

### 場景三：簡報開場

\\`\\`\\`
"Good morning everyone. Today I'll be walking you through our
Q1 retention analysis.

As you can see on the dashboard, our overall MAU grew 8% QoQ,
but DAU/MAU ratio actually declined from 42% to 38%, which
suggests that while we're acquiring more users, engagement
depth is dropping.

To dig deeper, I segmented users by cohort and found that..."
\\`\\`\\`

### 常見錯誤

> ❌ **錯誤：** 週報寫成流水帳——"Monday I did X, Tuesday I did Y"
> ✅ **正確：** 按主題整理，強調 impact 和 insight，不是按時間

> ❌ **錯誤：** Slack 訊息寫太長像 email
> ✅ **正確：** Slack 要簡潔，重點先行（Bottom Line Up Front），細節放連結

### 實用模板——各場景開場句

| 場景 | 開場句 |
|------|--------|
| 週報 | "Here's my weekly update for [date range]:" |
| Slack 更新 | "Quick update on [topic]:" |
| 簡報 | "Today I'll be walking you through..." |
| Email 請求 | "I'm reaching out to..." |
| 會議摘要 | "To summarize what we discussed today..." |

---

## 50-6（Boss）：字彙綜合測驗

### 自我檢測——你真的會了嗎？

以下是一個綜合測驗，涵蓋前五關的所有字彙。試著不看上面的內容回答：

### Part 1：選詞填空

請從下列選項中選出正確的字填入空格：

\\`\\`\\`
選項：churn, funnel, retention, cohort, stakeholders,
      MVP, conversion rate, A/B test, roadmap, CAC

1. Our monthly _____ rate is 5%, meaning we lose 5% of
   customers every month.

2. The biggest drop-off in the _____ happens between
   sign-up and first purchase.

3. We're running an _____ to see if the new checkout
   design improves sales.

4. Before building the full product, let's launch an _____
   to validate the core assumption.

5. Day-30 _____ for the March cohort is 22%.
\\`\\`\\`

**答案：** 1. churn  2. funnel  3. A/B test  4. MVP  5. retention

### Part 2：改錯練習

找出每句的錯誤並改正：

\\`\\`\\`
1. "The datas shows that our revenue is growing."
   → "The data show that our revenue is growing."

2. "We need to discuss about the Q2 roadmap."
   → "We need to discuss the Q2 roadmap."

3. "The affect of the new feature was positive."
   → "The effect of the new feature was positive."

4. "We leveraged Python to write a for loop."
   → "We used Python to write a for loop."
   （leverage 暗示策略性運用，寫 for loop 太小題大作）

5. "According to me, we should prioritize retention."
   → "In my opinion, we should prioritize retention."
\\`\\`\\`

### Part 3：情境應用

嘗試用學到的字彙完成以下任務：

**任務 1：寫一段 Slack 訊息**
> 告訴團隊你的 A/B test 結果：新版本提升了 15% conversion rate，統計顯著，建議全面上線。

**任務 2：寫週報的 Key Insights 段落**
> 分析發現：付費用戶的 D30 retention (60%) 遠高於免費用戶 (20%)，建議調整 onboarding 引導免費用戶升級。

**任務 3：寫一段簡報開場**
> 介紹你要分享 Q1 的用戶成長數據，MAU 成長但 DAU/MAU ratio 下降。

### 字彙學習的終極建議

1. **不要只背中文意思** — 要記住字的「搭配」和「語境」
2. **每週在真實場景用 5 個新字** — 寫週報、發 Slack 時刻意使用
3. **建立自己的字彙庫** — 用 Notion 或筆記 app 記錄新學到的專業字彙
4. **聽真人怎麼用** — 聽 podcast（推薦：Lenny's Podcast、The Data Scientist Show）
5. **錯了沒關係** — 職場上大家都在學，用錯了就修正，比不敢用好一百倍

"""

    static let enWorld50: String = """

# World 50: Business / Product / Data Vocabulary

> **Goal:** Master the most commonly used Business, Product, and Data Analysis vocabulary in the workplace, so you can use it naturally in meetings, reports, and Slack
> **Use cases:** Day-to-day work at international companies, English weekly updates, cross-functional team communication
> **Estimated study time:** 3–4 hours

---

## 50-1: Core Business Vocabulary

### Without these words, you'll be completely lost in business meetings

These are the most fundamental terms in the Business domain. Whether you work in Product, Data, or Engineering, you'll inevitably encounter them when collaborating with business teams.

### Vocabulary Table

| Term | Definition | Example |
|------|------------|---------|
| Revenue | Money a company earns from selling products/services (before costs) | "Q3 revenue grew 12% YoY." |
| MRR | Monthly Recurring Revenue — fixed monthly income from subscriptions | "Our MRR just crossed \\$100K." |
| ARR | Annual Recurring Revenue = MRR × 12 | "We're targeting \\$1.2M ARR by year-end." |
| Churn | The rate at which customers or users stop using a product | "Monthly churn dropped to 3.5%." |
| Retention | The rate at which users continue using a product (= 1 - Churn) | "Day-7 retention is at 45%." |
| CAC | Customer Acquisition Cost — how much it costs to acquire one paying customer | "Our CAC is \\$50 per paid user." |
| LTV | Lifetime Value — total revenue a single customer generates over their lifetime | "LTV/CAC ratio should be above 3:1." |
| Growth Rate | Usually refers to MoM or YoY growth | "We're seeing 15% MoM growth." |
| Burn Rate | How much money the company spends each month | "At this burn rate, we have 18 months of runway." |
| Runway | How long the company can survive at its current burn rate | "We need to extend our runway to 24 months." |

### Common Mistakes

> ❌ **Wrong:** "The revenue is very high." (too vague)
> ✅ **Right:** "Revenue grew 12% year-over-year to \\$2.4M in Q3."

> ❌ **Wrong:** Confusing Revenue with Profit
> ✅ **Clarification:** Revenue is the top-line income (before costs); Profit is what remains after costs are deducted.

### Useful Collocations

| Collocation | Meaning | Example |
|-------------|---------|---------|
| drive revenue | generate more income | "This feature could drive an additional \\$200K in revenue." |
| reduce churn | lower the loss rate | "Improving onboarding reduced churn by 20%." |
| improve retention | increase the rate users stay | "Push notifications improved D7 retention by 8%." |
| lower CAC | decrease acquisition cost | "Organic content helped lower CAC from \\$50 to \\$35." |

---

## 50-2: Product Vocabulary

### Words PMs use every single day

If you want to become a Product Analyst or work closely with PMs, you need more than recognition — you need to use these words naturally in conversation.

### Vocabulary Table

| Term | Definition | Example |
|------|------------|---------|
| Sprint | A short development cycle, typically 1–2 weeks | "We'll tackle this in the next sprint." |
| Backlog | All features/tasks waiting to be developed | "Let's add this to the backlog." |
| MVP | Minimum Viable Product — the simplest version that validates core assumptions | "Let's ship an MVP first and iterate." |
| Iteration | The process of repeatedly improving something | "After three iterations, the design was finalized." |
| Stakeholder | Anyone who influences or is affected by the project | "We need to align with all stakeholders." |
| Roadmap | A plan for the product's future development | "This is on our Q2 roadmap." |
| Prioritization | The process of deciding what to work on first | "Prioritization was based on impact vs. effort." |
| User Story | A feature requirement described from the user's perspective | "As a user, I want to... so that I can..." |
| Scope Creep | When project requirements keep expanding beyond the original plan | "We need to watch out for scope creep." |
| Ship | To release a feature to production | "We shipped the new feature on Friday." |

### Common Mistakes

> ❌ **Wrong:** "We need to develop the MVP very completely." (contradictory — MVP is meant to be minimal)
> ✅ **Right:** "Let's define the core features for our MVP and save the nice-to-haves for future iterations."

> ❌ **Wrong:** "I have a roadmap for today." (a roadmap is a long-term plan, not a daily to-do list)
> ✅ **Right:** "Here's our product roadmap for the next two quarters."

### Useful Collocations

| Collocation | Meaning | Example |
|-------------|---------|---------|
| groom the backlog | tidy up and prioritize the task list | "Let's groom the backlog before sprint planning." |
| align with stakeholders | get buy-in from key stakeholders | "I'll align with stakeholders on the timeline." |
| define the scope | clarify what is and isn't included | "We need to clearly define the scope before kicking off." |
| iterate on | continuously improve based on feedback | "We'll iterate on the design based on user feedback." |

---

## 50-3: Data / Analytics Vocabulary

### The shared language of data people

Whether you're a Data Analyst, Product Analyst, or in any data-related role, these terms are your daily vocabulary.

### Vocabulary Table

| Term | Definition | Example |
|------|------------|---------|
| Funnel | The stages a user goes through from entry to completing a goal | "The biggest drop-off in the funnel is at checkout." |
| Cohort | A group of users who joined during the same time period | "The Jan cohort shows better retention than Dec." |
| A/B Test | Testing two versions simultaneously to compare performance | "We ran an A/B test on the landing page." |
| Statistical Significance | The confidence level that a result is not due to chance | "The result is statistically significant at p < 0.05." |
| Conversion Rate | The percentage of users who complete a target action | "Conversion rate improved from 2.1% to 3.4%." |
| DAU / MAU | Daily / Monthly Active Users | "DAU/MAU ratio indicates strong engagement at 40%." |
| Segmentation | Dividing users into distinct groups for analysis | "User segmentation revealed three distinct personas." |
| Attribution | Determining which channel is responsible for a conversion | "Last-touch attribution credits the final channel." |
| Anomaly | A data point that deviates significantly from the normal pattern | "We detected an anomaly in yesterday's traffic data." |
| Dashboard | A visual panel displaying key data and metrics | "The executive dashboard tracks all key metrics." |

### Common Mistakes

> ❌ **Wrong:** "The A/B test shows version B is better." (no mention of statistical significance)
> ✅ **Right:** "Version B outperformed A by 8%, and the result is statistically significant with p = 0.03."

> ❌ **Wrong:** "We analyzed a cohort of random users." (a cohort is not a random sample)
> ✅ **Right:** "We analyzed the March 2025 sign-up cohort to track their 30-day retention."

### Useful Collocations

| Collocation | Meaning | Example |
|-------------|---------|---------|
| run an A/B test | execute a split test | "Let's run an A/B test before rolling out the change." |
| analyze the funnel | examine each stage of the conversion funnel | "I analyzed the funnel and found a 40% drop at step 3." |
| build a dashboard | create a metrics visualization panel | "I built a dashboard to track weekly KPIs." |
| segment users by | divide users according to a specific dimension | "We segmented users by acquisition channel." |

---

## 50-4: Common Collocations and Easily Confused Words

### Words you think you know — but might be using wrong

English has many words that look similar but have completely different meanings or usages. Here are the most commonly confused pairs in a professional context.

### Easily Confused Words

**1. affect vs. effect**

| Word | Part of Speech | Meaning | Example |
|------|---------------|---------|---------|
| affect | verb | to influence something | "The outage affected 10% of users." |
| effect | noun | the result or impact | "The effect of the change was significant." |

> Memory tip: **A**ffect = **A**ction (verb), **E**ffect = **E**nd result (noun)

**2. insight vs. finding**

| Word | Meaning | Difference |
|------|---------|------------|
| insight | a deeper understanding | Requires analysis and interpretation — it answers "so what?" |
| finding | a discovery | A straightforward statement of fact |

> ❌ "The insight is that revenue dropped 5%." (this is just a finding)
> ✅ "The finding is that revenue dropped 5%. The insight is that this decline correlates with the removal of the free trial, suggesting price sensitivity among new users."

**3. leverage vs. utilize**

| Word | Tone | Usage context |
|------|------|---------------|
| leverage | strategic use (implies gaining an advantage) | "We leveraged our existing user base to drive referrals." |
| utilize | to use (slightly more formal than "use") | "We utilized Python for data processing." |

> Note: Many people overuse "leverage" to sound professional. If you simply mean "use," just say "use."

**4. ensure vs. assure vs. insure**

| Word | Meaning | Example |
|------|---------|---------|
| ensure | to make certain something happens | "Please ensure the data is backed up." |
| assure | to reassure a person | "I can assure you that the system is stable." |
| insure | to take out insurance | "We insured the equipment against damage." |

### More Common Mistakes

| Incorrect | Correct |
|-----------|---------|
| ❌ "discuss about" | ✅ "discuss [something]" (no "about" needed) |
| ❌ "according to me" | ✅ "in my opinion" or "from my perspective" |
| ❌ "the datas show" | ✅ "the data show" ("data" is often treated as plural in academic and business English) |
| ❌ "make a decision to" | ✅ "decide to" (more concise) |
| ❌ "improve the efficiency" | ✅ "improve efficiency" (no "the" unless referring to a specific efficiency) |

---

## 50-5: Vocabulary in Context

### Knowing words isn't enough — you need to use them in real situations

Practice applying the vocabulary from the previous sections in three real workplace scenarios: weekly updates, Slack messages, and presentations.

### Scenario 1: English Weekly Update

\\`\\`\\`
Subject: Weekly Update — [Your Name] (Mar 17-21)

**What I accomplished this week:**
- Analyzed the sign-up funnel and identified a 35% drop-off
  at the email verification step
- Built a cohort analysis dashboard tracking D1, D7, D30 retention
  by acquisition channel
- Ran an A/B test on the onboarding flow (results pending
  statistical significance)

**Key insights:**
- Users acquired via organic search show 2x higher LTV compared
  to paid channels, suggesting we should invest more in SEO
- Churn is disproportionately high among users who skip the
  onboarding tutorial

**Blockers:**
- Waiting on stakeholder alignment for the Q2 roadmap priorities

**Next week:**
- Segment churned users to identify common patterns
- Present funnel analysis findings to the product team
\\`\\`\\`

### Scenario 2: Slack Message

\\`\\`\\`
@channel Quick update on the pricing A/B test:

After 2 weeks, Version B (annual plan highlighted) shows a 12%
uplift in conversion rate vs. control. Result is statistically
significant (p = 0.02).

Recommendation: Ship Version B to 100% of users.

I'll add the detailed breakdown to the dashboard by EOD.
Let me know if you have questions!
\\`\\`\\`

### Scenario 3: Presentation Opening

\\`\\`\\`
"Good morning everyone. Today I'll be walking you through our
Q1 retention analysis.

As you can see on the dashboard, our overall MAU grew 8% QoQ,
but DAU/MAU ratio actually declined from 42% to 38%, which
suggests that while we're acquiring more users, engagement
depth is dropping.

To dig deeper, I segmented users by cohort and found that..."
\\`\\`\\`

### Common Mistakes

> ❌ **Wrong:** Writing a weekly update as a timeline — "Monday I did X, Tuesday I did Y"
> ✅ **Right:** Organize by theme; emphasize impact and insights, not chronology

> ❌ **Wrong:** Writing a Slack message as long as an email
> ✅ **Right:** Keep Slack messages concise — lead with the Bottom Line Up Front (BLUF) and link to details

### Useful Templates — Opening Lines for Each Scenario

| Scenario | Opening Line |
|----------|-------------|
| Weekly update | "Here's my weekly update for [date range]:" |
| Slack update | "Quick update on [topic]:" |
| Presentation | "Today I'll be walking you through..." |
| Email request | "I'm reaching out to..." |
| Meeting summary | "To summarize what we discussed today..." |

---

## 50-6 (Boss): Comprehensive Vocabulary Quiz

### Self-assessment — Do you really know it?

The following comprehensive quiz covers all vocabulary from the previous five sections. Try to answer without looking back at the content above.

### Part 1: Fill in the Blank

Choose the correct word from the options below to fill in each blank:

\\`\\`\\`
Options: churn, funnel, retention, cohort, stakeholders,
         MVP, conversion rate, A/B test, roadmap, CAC

1. Our monthly _____ rate is 5%, meaning we lose 5% of
   customers every month.

2. The biggest drop-off in the _____ happens between
   sign-up and first purchase.

3. We're running an _____ to see if the new checkout
   design improves sales.

4. Before building the full product, let's launch an _____
   to validate the core assumption.

5. Day-30 _____ for the March cohort is 22%.
\\`\\`\\`

**Answers:** 1. churn  2. funnel  3. A/B test  4. MVP  5. retention

### Part 2: Error Correction

Identify the mistake in each sentence and correct it:

\\`\\`\\`
1. "The datas shows that our revenue is growing."
   → "The data show that our revenue is growing."

2. "We need to discuss about the Q2 roadmap."
   → "We need to discuss the Q2 roadmap."

3. "The affect of the new feature was positive."
   → "The effect of the new feature was positive."

4. "We leveraged Python to write a for loop."
   → "We used Python to write a for loop."
   (leverage implies strategic use — overkill for writing a for loop)

5. "According to me, we should prioritize retention."
   → "In my opinion, we should prioritize retention."
\\`\\`\\`

### Part 3: Situational Application

Try to complete the following tasks using the vocabulary you've learned:

**Task 1: Write a Slack message**
> Tell your team the A/B test results: the new version improved conversion rate by 15%, the result is statistically significant, and you recommend rolling it out to all users.

**Task 2: Write the Key Insights section of a weekly update**
> Analysis shows: D30 retention for paid users (60%) is significantly higher than for free users (20%). Recommend adjusting onboarding to guide free users toward upgrading.

**Task 3: Write a presentation opening**
> Introduce your Q1 user growth data: MAU grew but the DAU/MAU ratio declined.

### The Ultimate Advice for Vocabulary Learning

1. **Don't just memorize the definition** — learn the word's collocations and context
2. **Use 5 new words in real situations every week** — deliberately include them in weekly updates and Slack messages
3. **Build your own vocabulary bank** — use Notion or a notes app to log newly learned professional terms
4. **Listen to how native speakers use them** — tune into podcasts (recommended: Lenny's Podcast, The Data Scientist Show)
5. **Mistakes are fine** — everyone is learning in the workplace; correct and move on; using a word wrong is a hundred times better than never using it at all

"""

    static let zhWorld51: String = """

# World 51：口說句型練習

> 面試中，能不能用「有結構的英文」回答問題，直接決定你給面試官的印象。
> 這一章不教你背單字，而是教你掌握**句型框架**——有了框架，任何內容都能流暢表達。

很多台灣同學英文底子不差，但一到口說就卡住。原因不是詞彙量不夠，而是腦中沒有「現成的句型模板」可以套用。
這五關會幫你建立最實用的口說句型庫，讓你在面試、會議、簡報中都能自信開口。

---

## 51-1：解釋 Explain

### 核心句型

當面試官問「為什麼？」時，你需要清楚地解釋原因或邏輯。以下三個句型是最泛用的：

| 句型 | 使用情境 | 語氣 |
|------|---------|------|
| The reason is that... | 直接說明原因 | 正式、清晰 |
| This is because... | 承接前句做補充 | 自然、口語化 |
| What this means is... | 把抽象概念翻譯成白話 | 有耐心、專業 |

### 怎麼用？

\\`\\`\\`
❌ 常見錯誤：Because the data is wrong. (句子不完整)
✅ 正確用法：The reason is that the data wasn't cleaned properly before analysis.

❌ 常見錯誤：The reason is because... (重複因果，文法錯誤)
✅ 正確用法：The reason is that... 或 This is because...

❌ 常見錯誤：直接講結論，沒有鋪陳
✅ 正確用法：What this means is that our conversion rate dropped by 15% last quarter.
\\`\\`\\`

### 常見錯誤

台灣同學最常犯的錯：
- **reason 跟 because 連用**："The reason is because..." → 應該用 "The reason is that..."
- **解釋太短**：只說一句就停了。好的解釋至少要有「原因 + 影響」兩層
- **中式邏輯直譯**："Because want to save cost" → "This is because we wanted to reduce operational costs."

### 實用模板

\\`\\`\\`
[解釋原因]
The reason we chose this approach is that _______.

[補充說明]
This is because _______, which means _______.

[翻譯概念]
What this means is that _______, so we need to _______.
\\`\\`\\`

### 練習情境

> 情境一：面試官問你為什麼選擇用 Python 做數據分析，而不是 Excel？
> 用 "The reason is that..." 回答。

> 情境二：你在報告中提到用戶留存率下降了，主管追問原因。
> 用 "This is because..." 接著解釋。

> 情境三：你要向非技術背景的同事解釋什麼是 API。
> 用 "What this means is..." 把概念講白。

---

## 51-2：比較 Compare

### 核心句型

比較是面試中超高頻的動作——比較方案、比較工具、比較策略。掌握這三個句型，你就能結構化地做任何比較：

| 句型 | 使用情境 | 訊號詞 |
|------|---------|--------|
| Compared to X, Y is... | 直接對比兩者 | compared to, versus |
| The key difference is that... | 點出核心差異 | key, main, primary |
| While A..., B... | 同時呈現兩面 | while, whereas, on the other hand |

### 怎麼用？

\\`\\`\\`
Compared to SQL, Python is more flexible for handling unstructured data.

The key difference is that Agile focuses on iterative delivery,
while Waterfall follows a sequential process.

While the first option is cheaper, the second option offers better scalability.
\\`\\`\\`

### 常見錯誤

- **比較對象不對等**："Compared to Python, SQL's speed is faster" → "Compared to Python, SQL is faster for structured queries."
- **忘記用連接詞**：兩個句子直接放在一起沒有 however / on the other hand / in contrast
- **只說不同，不說所以呢**：比較完要有結論！加上 "Therefore, I'd recommend..." 或 "That's why we chose..."

### 轉折訊號詞

做比較時，這些詞是你的好朋友：

\\`\\`\\`
表示對比：however, on the other hand, in contrast, whereas
表示相似：similarly, likewise, in the same way
表示結論：therefore, as a result, that's why
舉例補充：specifically, for instance, for example
\\`\\`\\`

### 實用模板

\\`\\`\\`
[直接對比]
Compared to _______, _______ is more _______ because _______.

[核心差異]
The key difference between A and B is that A _______, while B _______.

[帶結論的比較]
While _______ offers _______, _______  provides _______. Therefore, I'd recommend _______.
\\`\\`\\`

### 練習情境

> 情境一：面試官問你 Agile 跟 Waterfall 的差別。
> 用 "The key difference is that..." 回答。

> 情境二：你要在會議中比較兩個 vendor 的方案。
> 用 "While A..., B..." 結構，最後加上你的建議。

> 情境三：有人問你 Product Manager 跟 Project Manager 有什麼不同。
> 用 "Compared to..." 開頭，搭配 "specifically" 舉例。

---

## 51-3：推薦 Recommend

### 核心句型

面試最後常被問：「那你會怎麼做？」這時候你需要有自信但不武斷的推薦句型：

| 句型 | 語氣 | 適用場景 |
|------|------|---------|
| My recommendation would be... | 正式、有自信 | 簡報、面試 |
| I'd suggest... | 稍微委婉 | 團隊討論、提案 |
| Based on the data, we should... | 數據驅動 | 分析報告、決策 |

### 怎麼用？

\\`\\`\\`
My recommendation would be to start with a pilot program
before rolling out to all users.

I'd suggest we focus on the top 3 pain points first,
rather than trying to fix everything at once.

Based on the data, we should prioritize mobile optimization
since 70% of our traffic comes from mobile devices.
\\`\\`\\`

### 常見錯誤

- **太直接**："We must do this." → 改用 "My recommendation would be to..." 更專業
- **沒有理由**：推薦完就停了。一定要加 because / since / given that 說明原因
- **語氣太弱**："Maybe we can try..." → "I'd suggest we..." 更有說服力
- **中式客氣**："I think maybe probably..." 疊太多修飾詞，反而顯得沒自信

### 實用模板

\\`\\`\\`
[正式推薦]
My recommendation would be to _______, because _______.

[委婉建議]
I'd suggest _______, given that _______. This would help us _______.

[數據驅動]
Based on the data, we should _______. Specifically, _______ shows that _______.
\\`\\`\\`

### 推薦的完整結構

一個好的推薦要有三層：

\\`\\`\\`
1. 推薦本身：My recommendation would be to...
2. 理由：This is because... / Based on...
3. 預期效果：This would help us... / As a result, we can expect...
\\`\\`\\`

### 練習情境

> 情境一：公司要選一個專案管理工具，你做完調研要給建議。
> 用 "Based on the data, we should..." 開頭。

> 情境二：面試 case study，分析完數據後面試官問你的建議。
> 用 "My recommendation would be..." 正式回答。

> 情境三：團隊在討論要先做哪個 feature，你有想法。
> 用 "I'd suggest..." 委婉但清楚地表達。

---

## 51-4：描述 Describe

### 核心句型

描述產品、流程、功能是職場英文的日常。你需要能用簡潔的英文把事情講清楚：

| 句型 | 用途 | 適用內容 |
|------|------|---------|
| It's a platform that... | 描述產品/工具 | 軟體、服務、系統 |
| The workflow involves... | 描述流程 | 工作流、SOP |
| This feature enables users to... | 描述功能 | 產品功能、技術能力 |

### 怎麼用？

\\`\\`\\`
It's a platform that connects freelancers with businesses
looking for short-term project help.

The workflow involves three steps: first, the user submits a request;
then, the system assigns it to the relevant team;
finally, the team reviews and responds within 24 hours.

This feature enables users to filter search results by date,
category, and relevance, making it easier to find what they need.
\\`\\`\\`

### 常見錯誤

- **描述太抽象**："It's a good tool." → "It's a platform that automates data pipeline management."
- **流程沒有順序詞**：一定要用 first / then / next / finally 建立順序感
- **功能描述太技術**：對非技術聽眾，用 "enables users to..." 而不是 "implements a RESTful API that..."

### 描述的順序訊號詞

\\`\\`\\`
流程順序：first, then, next, after that, finally
補充細節：specifically, in particular, for instance
強調重點：most importantly, the key point is, notably
\\`\\`\\`

### 實用模板

\\`\\`\\`
[描述產品]
It's a _______ that helps _______ to _______.
For instance, _______.

[描述流程]
The workflow involves _______ steps.
First, _______. Then, _______. Finally, _______.

[描述功能]
This feature enables users to _______,
which helps them _______.
\\`\\`\\`

### 練習情境

> 情境一：面試官問你做過的 side project 是什麼？
> 用 "It's a platform that..." 介紹。

> 情境二：你要向新同事解釋團隊的工作流程。
> 用 "The workflow involves..." 搭配 first / then / finally。

> 情境三：PM 要你在 sprint review 中介紹你開發的新功能。
> 用 "This feature enables users to..." 講功能價值。

---

## 51-5（Boss）：情境口說綜合

### Boss 關卡：模擬面試口說

這一關把前面四個技能整合起來。在真實面試中，你需要在一個回答裡同時使用解釋、比較、推薦和描述。

### 綜合句型速查表

| 功能 | 開頭句型 | 搭配訊號詞 |
|------|---------|-----------|
| 解釋 | The reason is that... | specifically, for instance |
| 比較 | Compared to X, Y is... | however, in contrast, on the other hand |
| 推薦 | My recommendation would be... | based on, given that, therefore |
| 描述 | It's a platform that... | first, then, finally |

### 情境挑戰

> **情境一：產品介紹 + 推薦**
> 「你之前做過一個專案，請介紹那個產品，然後告訴我你會怎麼改善它。」
> 提示：先用 describe 句型介紹 → 再用 recommend 句型提建議

> **情境二：方案比較 + 解釋**
> 「你在兩個技術方案中選了 A，為什麼？」
> 提示：先用 compare 句型比較 → 再用 explain 句型解釋原因

> **情境三：完整 Case Study 回答**
> 「某電商平台的轉換率掉了 20%，你會怎麼分析和解決？」
> 提示：
> 1. 先 describe 問題背景
> 2. 用 explain 分析可能原因
> 3. 用 compare 比較不同解法
> 4. 用 recommend 給出最終建議

### 回答結構模板

\\`\\`\\`
完整回答的黃金結構：

That's a great question. Let me walk you through my thinking.
[describe] First, let me describe the situation...
[explain] The reason this happened is that...
[compare] Compared to other approaches, I think...
[recommend] Based on this analysis, my recommendation would be...

這個結構讓你的回答有邏輯、有層次、有結論。
\\`\\`\\`

### 加分技巧

- **開頭不要急**：用 "That's a great question." 或 "Let me think about this." 爭取思考時間
- **用訊號詞串場**：however, specifically, for instance, as a result 讓回答流暢
- **結尾要有力**：用 "So in summary..." 或 "The bottom line is..." 收尾
- **適當停頓**：寧可講慢一點講清楚，不要含糊帶過

### 自我檢查清單

回答完一個問題後，問自己：
- ✅ 有沒有直接回答問題？（不要繞圈子）
- ✅ 有沒有用到結構化句型？（不是漫無目的地講）
- ✅ 有沒有搭配訊號詞？（讓邏輯清晰）
- ✅ 有沒有給出結論或建議？（不要講完就停了）

"""

    static let enWorld51: String = """

# World 51: Speaking Pattern Practice

> In interviews, your ability to answer questions in **structured English** directly shapes the impression you make on the interviewer.
> This chapter isn't about memorizing vocabulary — it's about mastering **sentence-pattern frameworks**. With the right framework, you can express any idea fluently.

Many Taiwanese students have a solid English foundation, yet freeze up the moment they have to speak. The problem isn't a lack of vocabulary — it's the absence of ready-made sentence templates in their heads.
These five stages will help you build the most practical speaking pattern library, so you can speak with confidence in interviews, meetings, and presentations.

---

## 51-1: Explain

### Core Patterns

When an interviewer asks "Why?", you need to explain your reasoning clearly. These three patterns are the most versatile:

| Pattern | When to Use | Tone |
|---------|-------------|------|
| The reason is that... | State the cause directly | Formal, clear |
| This is because... | Follow up a previous sentence with elaboration | Natural, conversational |
| What this means is... | Translate an abstract concept into plain language | Patient, professional |

### How to Use Them

\\`\\`\\`
❌ Common mistake: Because the data is wrong. (incomplete sentence)
✅ Correct: The reason is that the data wasn't cleaned properly before analysis.

❌ Common mistake: The reason is because... (redundant causality — grammatically incorrect)
✅ Correct: The reason is that... or This is because...

❌ Common mistake: Jumping straight to the conclusion without context
✅ Correct: What this means is that our conversion rate dropped by 15% last quarter.
\\`\\`\\`

### Common Errors

The most frequent mistakes Taiwanese speakers make:
- **Using "reason" with "because"**: "The reason is because..." → should be "The reason is that..."
- **Explaining too briefly**: Stopping after just one sentence. A good explanation needs at least two layers — **cause + impact**
- **Literal translation from Chinese logic**: "Because want to save cost" → "This is because we wanted to reduce operational costs."

### Ready-to-Use Templates

\\`\\`\\`
[Explaining the reason]
The reason we chose this approach is that _______.

[Adding elaboration]
This is because _______, which means _______.

[Translating a concept]
What this means is that _______, so we need to _______.
\\`\\`\\`

### Practice Scenarios

> Scenario 1: The interviewer asks why you chose Python for data analysis instead of Excel.
> Answer using "The reason is that..."

> Scenario 2: You mentioned in a report that user retention dropped, and your manager asks why.
> Follow up with "This is because..." and explain.

> Scenario 3: You need to explain what an API is to a colleague with no technical background.
> Use "What this means is..." to make the concept accessible.

---

## 51-2: Compare

### Core Patterns

Comparison is one of the most frequent tasks in interviews — comparing approaches, tools, and strategies. Master these three patterns and you can structure any comparison:

| Pattern | When to Use | Signal Words |
|---------|-------------|--------------|
| Compared to X, Y is... | Directly contrast two things | compared to, versus |
| The key difference is that... | Highlight the core distinction | key, main, primary |
| While A..., B... | Present both sides simultaneously | while, whereas, on the other hand |

### How to Use Them

\\`\\`\\`
Compared to SQL, Python is more flexible for handling unstructured data.

The key difference is that Agile focuses on iterative delivery,
while Waterfall follows a sequential process.

While the first option is cheaper, the second option offers better scalability.
\\`\\`\\`

### Common Errors

- **Comparing non-parallel items**: "Compared to Python, SQL's speed is faster" → "Compared to Python, SQL is faster for structured queries."
- **Forgetting connectors**: Placing two sentences side by side without however / on the other hand / in contrast
- **Comparing without a takeaway**: Always end with a conclusion! Add "Therefore, I'd recommend..." or "That's why we chose..."

### Contrast Signal Words

These are your best friends when making comparisons:

\\`\\`\\`
Contrast:    however, on the other hand, in contrast, whereas
Similarity:  similarly, likewise, in the same way
Conclusion:  therefore, as a result, that's why
Examples:    specifically, for instance, for example
\\`\\`\\`

### Ready-to-Use Templates

\\`\\`\\`
[Direct contrast]
Compared to _______, _______ is more _______ because _______.

[Core difference]
The key difference between A and B is that A _______, while B _______.

[Comparison with conclusion]
While _______ offers _______, _______ provides _______. Therefore, I'd recommend _______.
\\`\\`\\`

### Practice Scenarios

> Scenario 1: The interviewer asks you to explain the difference between Agile and Waterfall.
> Answer using "The key difference is that..."

> Scenario 2: You need to compare two vendor proposals in a meeting.
> Use the "While A..., B..." structure and close with your recommendation.

> Scenario 3: Someone asks what makes a Product Manager different from a Project Manager.
> Start with "Compared to..." and add a specific example using "specifically."

---

## 51-3: Recommend

### Core Patterns

Interviews often end with: "So what would you do?" This is when you need confident yet measured recommendation patterns:

| Pattern | Tone | Best For |
|---------|------|----------|
| My recommendation would be... | Formal, confident | Presentations, interviews |
| I'd suggest... | Slightly softer | Team discussions, proposals |
| Based on the data, we should... | Data-driven | Analysis reports, decisions |

### How to Use Them

\\`\\`\\`
My recommendation would be to start with a pilot program
before rolling out to all users.

I'd suggest we focus on the top 3 pain points first,
rather than trying to fix everything at once.

Based on the data, we should prioritize mobile optimization
since 70% of our traffic comes from mobile devices.
\\`\\`\\`

### Common Errors

- **Too blunt**: "We must do this." → "My recommendation would be to..." sounds far more professional
- **No reasoning**: Don't stop after the recommendation — always add because / since / given that to explain why
- **Too tentative**: "Maybe we can try..." → "I'd suggest we..." carries more conviction
- **Piling up hedges**: "I think maybe probably..." — stacking too many qualifiers signals a lack of confidence

### Ready-to-Use Templates

\\`\\`\\`
[Formal recommendation]
My recommendation would be to _______, because _______.

[Softer suggestion]
I'd suggest _______, given that _______. This would help us _______.

[Data-driven recommendation]
Based on the data, we should _______. Specifically, _______ shows that _______.
\\`\\`\\`

### A Complete Recommendation Has Three Layers

A strong recommendation always includes:

\\`\\`\\`
1. The recommendation itself: My recommendation would be to...
2. The reasoning:             This is because... / Based on...
3. The expected outcome:      This would help us... / As a result, we can expect...
\\`\\`\\`

### Practice Scenarios

> Scenario 1: Your company needs to choose a project management tool. You've done the research and need to give your recommendation.
> Open with "Based on the data, we should..."

> Scenario 2: You've finished analyzing a case study in an interview and the interviewer asks for your recommendation.
> Give a formal answer using "My recommendation would be..."

> Scenario 3: Your team is debating which feature to build first and you have a preference.
> Express yourself clearly but diplomatically using "I'd suggest..."

---

## 51-4: Describe

### Core Patterns

Describing products, processes, and features is an everyday task in a professional setting. You need to explain things clearly and concisely in English:

| Pattern | Purpose | What to Describe |
|---------|---------|-----------------|
| It's a platform that... | Describe a product or tool | Software, services, systems |
| The workflow involves... | Describe a process | Workflows, SOPs |
| This feature enables users to... | Describe a feature | Product features, technical capabilities |

### How to Use Them

\\`\\`\\`
It's a platform that connects freelancers with businesses
looking for short-term project help.

The workflow involves three steps: first, the user submits a request;
then, the system assigns it to the relevant team;
finally, the team reviews and responds within 24 hours.

This feature enables users to filter search results by date,
category, and relevance, making it easier to find what they need.
\\`\\`\\`

### Common Errors

- **Too vague**: "It's a good tool." → "It's a platform that automates data pipeline management."
- **No sequence words in process descriptions**: Always use first / then / next / finally to signal order
- **Too technical for the audience**: For non-technical listeners, say "enables users to..." instead of "implements a RESTful API that..."

### Sequence Signal Words for Descriptions

\\`\\`\\`
Process order:  first, then, next, after that, finally
Adding detail:  specifically, in particular, for instance
Emphasizing:    most importantly, the key point is, notably
\\`\\`\\`

### Ready-to-Use Templates

\\`\\`\\`
[Describing a product]
It's a _______ that helps _______ to _______.
For instance, _______.

[Describing a process]
The workflow involves _______ steps.
First, _______. Then, _______. Finally, _______.

[Describing a feature]
This feature enables users to _______,
which helps them _______.
\\`\\`\\`

### Practice Scenarios

> Scenario 1: The interviewer asks about a side project you worked on.
> Introduce it using "It's a platform that..."

> Scenario 2: You need to walk a new colleague through your team's workflow.
> Use "The workflow involves..." paired with first / then / finally.

> Scenario 3: Your PM asks you to present the new feature you built during a sprint review.
> Use "This feature enables users to..." to highlight the user value.

---

## 51-5 (Boss): Integrated Speaking in Context

### Boss Stage: Mock Interview Speaking

This stage integrates all four skills from the previous stages. In a real interview, you need to use explanation, comparison, recommendation, and description together — all within a single answer.

### Quick-Reference Pattern Table

| Function | Opening Pattern | Signal Words to Pair |
|----------|-----------------|---------------------|
| Explain | The reason is that... | specifically, for instance |
| Compare | Compared to X, Y is... | however, in contrast, on the other hand |
| Recommend | My recommendation would be... | based on, given that, therefore |
| Describe | It's a platform that... | first, then, finally |

### Situation Challenges

> **Scenario 1: Product Introduction + Recommendation**
> "Tell me about a project you worked on. Describe the product, then tell me how you would improve it."
> Hint: Start with a **describe** pattern to introduce it → then use a **recommend** pattern for your suggestions

> **Scenario 2: Option Comparison + Explanation**
> "You chose option A over two technical approaches. Why?"
> Hint: Use a **compare** pattern first → then use an **explain** pattern to give your reasoning

> **Scenario 3: Full Case Study Answer**
> "An e-commerce platform's conversion rate dropped by 20%. How would you analyze and address this?"
> Hint:
> 1. **Describe** the problem background
> 2. **Explain** the possible causes
> 3. **Compare** different solutions
> 4. **Recommend** your final course of action

### Answer Structure Template

\\`\\`\\`
The Golden Structure for a Complete Answer:

That's a great question. Let me walk you through my thinking.
[describe]   First, let me describe the situation...
[explain]    The reason this happened is that...
[compare]    Compared to other approaches, I think...
[recommend]  Based on this analysis, my recommendation would be...

This structure gives your answer logic, depth, and a clear conclusion.
\\`\\`\\`

### Bonus Tips

- **Don't rush at the start**: Buy yourself thinking time with "That's a great question." or "Let me think about this."
- **Use signal words to link ideas**: however, specifically, for instance, as a result — these keep your answer flowing smoothly
- **End strong**: Close with "So in summary..." or "The bottom line is..."
- **Pause deliberately**: It's better to speak slowly and clearly than to mumble through an answer

"""

    static let zhWorld52: String = """

# World 52：專業閱讀

> 職場上大量資訊都是英文的——JD、README、PRD、報告。讀不懂就會錯過關鍵資訊，甚至做出錯誤判斷。
> 這一章教你如何**快速抓重點**，而不是逐字翻譯。

專業閱讀不是考英文，是考你能不能從一堆文字中**提取行動資訊**。
學會這些閱讀技巧，你在求職、工作中都會比別人快一步。

---

## 52-1：Job Description 閱讀

### 為什麼要會讀 JD？

JD 不只是職缺說明，它是你準備面試的**作弊小抄**。讀懂 JD，你就知道面試官會問什麼、公司在找什麼特質的人。

### JD 結構拆解

一份典型的 JD 長這樣：

\\`\\`\\`
[Job Title] — 職稱，注意 level（Junior / Senior / Lead）
[About the Team] — 了解團隊做什麼、規模多大
[Responsibilities] — 你要做的事（面試會圍繞這些問）
[Requirements] — 必備條件（Must-have）
[Nice-to-haves] — 加分條件（有最好，沒有也行）
[Benefits] — 福利（通常不影響你投不投）
\\`\\`\\`

### 企業語言解碼

JD 裡有很多「暗語」，學會解碼很重要：

| JD 寫的 | 真正的意思 |
|---------|-----------|
| Fast-paced environment | 事情很多、變化很快，要能扛壓 |
| Wear many hats | 人少事多，什麼都要做一點 |
| Self-starter | 不會有人手把手教你 |
| Cross-functional collaboration | 要跟很多部門溝通，溝通能力很重要 |
| Data-driven | 決策要有數據佐證，不能只靠直覺 |
| Ambiguity | 需求常常不明確，你要自己搞清楚 |

### 實用閱讀範例

\\`\\`\\`
Requirements:
- 3+ years of experience in product analytics
  → 「3+」是門檻，但如果你有 2 年 + 強作品集，還是可以投
- Proficiency in SQL and at least one scripting language
  → SQL 是必備，Python 或 R 至少會一個
- Experience with A/B testing frameworks
  → 面試一定會問 A/B test 相關問題

Nice to have:
- Experience with Looker or Tableau
  → 不會也沒關係，但會的話在面試中提到會加分
- Familiarity with machine learning concepts
  → 不需要你會寫 ML model，但要懂基本概念
\\`\\`\\`

### 常見錯誤

- **看到 Requirements 全符合才敢投**：其實符合 60-70% 就可以投了
- **忽略 Nice-to-haves**：這些是面試加分題的線索
- **不看 About the Team**：這段告訴你團隊文化和工作重點

---

## 52-2：README / 技術文件

### README 為什麼重要？

不管你是 PM、BA 還是工程師，看 README 是日常。一個新工具、一個 open source project、一個內部服務——第一步都是讀 README。

### README 標準結構

\\`\\`\\`
# Project Name          ← 專案名稱
## Overview / About     ← 這個專案是做什麼的（最重要！）
## Getting Started      ← 如何安裝和啟動
  ### Prerequisites     ← 需要先裝什麼
  ### Installation      ← 安裝步驟
## Usage                ← 怎麼用（通常有範例 code）
## API Reference        ← API 文件（如果有）
## Contributing         ← 如何貢獻（open source 才有）
## License              ← 授權方式
\\`\\`\\`

### 關鍵詞彙速查

| 英文 | 意思 | 你要注意的 |
|------|------|-----------|
| Prerequisites | 前置需求 | 先裝好這些才能繼續 |
| Dependencies | 相依套件 | 缺了會跑不起來 |
| Breaking changes | 不相容的更新 | 升版前一定要看 |
| Deprecated | 即將淘汰 | 還能用但不建議，遲早會移除 |
| Migration guide | 升版指南 | 告訴你舊版怎麼轉新版 |
| Environment variables | 環境變數 | 設定敏感資訊（API key 等） |

### 實用閱讀範例

\\`\\`\\`
## Getting Started

### Prerequisites
- Node.js >= 18.0      ← 版本有要求，不是隨便裝就好
- npm or yarn           ← 二擇一
- PostgreSQL 14+        ← 要另外裝資料庫

### Installation
$ git clone https://github.com/example/project.git
$ cd project
$ npm install           ← 裝套件
$ cp .env.example .env  ← 複製環境變數模板（重要！要自己填值）
$ npm run dev           ← 啟動開發環境
\\`\\`\\`

### 常見錯誤

- **跳過 Prerequisites**：直接跑 install，然後一堆 error 不知道為什麼
- **不看版本號**：Node 16 跟 Node 18 可能差很多
- **忽略 .env.example**：沒設環境變數就啟動，當然會噴錯

---

## 52-3：PRD / Spec 閱讀

### 什麼是 PRD？

PRD（Product Requirements Document）是產品需求文件，定義了要做什麼、為什麼做、做到什麼程度。不管你是 PM 寫的還是 BA 讀的，都要懂這個格式。

### PRD 核心結構

\\`\\`\\`
1. Overview         — 為什麼做這個（business context）
2. User Stories     — 從用戶角度描述需求
3. Requirements     — 功能細節
4. Priority         — P0 / P1 / P2 排序
5. Acceptance Criteria — 怎樣算「做完了」
6. Out of Scope     — 這次不做的東西（很重要！）
\\`\\`\\`

### User Story 格式

User Story 是 PRD 的核心，格式固定：

\\`\\`\\`
As a [角色], I want to [行為], so that [目的].

範例：
As a new user, I want to sign up with my Google account,
so that I don't have to remember another password.
\\`\\`\\`

### 優先級怎麼讀

| 等級 | 意思 | 你的反應 |
|------|------|---------|
| P0 (Critical) | 沒有這個不能上線 | 最先做，不能妥協 |
| P1 (High) | 很重要但不是阻塞 | 盡量在這個 sprint 做完 |
| P2 (Medium) | 有就更好 | 有時間就做，可以排到下個 sprint |
| P3 (Low) | 錦上添花 | 放到 backlog，有空再說 |

### Acceptance Criteria 範例

\\`\\`\\`
Feature: User Registration

Acceptance Criteria:
- [ ] User can sign up with email and password
- [ ] Password must be at least 8 characters
  with 1 uppercase and 1 number
- [ ] User receives a confirmation email within 2 minutes
- [ ] Duplicate email addresses show an error message
- [ ] All form fields have proper validation messages

→ 這些就是 QA 測試的依據，也是「做完了」的定義
\\`\\`\\`

### 常見錯誤

- **只看 Requirements 不看 Out of Scope**：做了不該做的東西，浪費時間
- **不確認 Acceptance Criteria**：做完了但跟預期不符
- **忽略 Priority**：P2 的東西做了三天，P0 的還沒動

---

## 52-4：資料報告 / Dashboard

### 職場上的報告長什麼樣？

不管是週報、月報還是 dashboard，英文報告都有固定的結構和用詞。學會讀這些，你在會議中就能快速抓到重點。

### 報告常見結構

\\`\\`\\`
1. Executive Summary   — 一段話講完重點（高管只看這段）
2. Key Metrics / KPIs  — 數字表現
3. Highlights          — 好消息
4. Areas of Concern    — 壞消息（委婉說法）
5. Root Cause Analysis — 問題原因分析
6. Recommendations     — 建議行動
\\`\\`\\`

### 報告常見用詞解碼

| 報告寫的 | 真正的意思 |
|---------|-----------|
| Showed modest growth | 成長很少 |
| Underperformed expectations | 沒達標 |
| Remains flat | 沒成長 |
| Experienced headwinds | 遇到困難 |
| Opportunities for improvement | 表現不好（委婉說法） |
| Trending upward / downward | 有上升/下降趨勢 |

### KPI 報告閱讀範例

\\`\\`\\`
Q4 Performance Summary

Revenue: $2.4M (↑12% QoQ)
  → QoQ = Quarter over Quarter，跟上一季比
  → 12% 成長算健康

DAU: 45K (↓8% MoM)
  → MoM = Month over Month，跟上個月比
  → DAU 在掉，需要關注

Churn Rate: 5.2% (↑0.8pp)
  → pp = percentage points，百分點
  → Churn 上升不是好事

NPS: 42 (flat)
  → flat = 沒變化
  → NPS 42 算中等偏上
\\`\\`\\`

### Root Cause Analysis 怎麼讀

\\`\\`\\`
Root Cause Analysis: DAU Decline

Investigation revealed that the decline was primarily driven by:
1. A 15% increase in app load time after the v3.2 release
   → 技術問題導致體驗變差
2. Seasonal patterns consistent with previous years
   → 季節性因素，不完全是我們的問題
3. Increased competition from Product X's new feature launch
   → 競品推了新功能搶走用戶

Recommended Actions:
- Immediate: Rollback performance regression in v3.2.1
- Short-term: Implement caching layer for top 10 API endpoints
- Long-term: Develop competitive feature parity roadmap
\\`\\`\\`

### 常見錯誤

- **只看數字不看趨勢**：單一數字沒意義，要看 QoQ / MoM / YoY 的變化
- **不懂委婉語**："Areas of concern" 就是出問題了，不是小事
- **混淆 percentage 和 percentage points**：從 5% 漲到 6% 是漲了 1pp，不是漲了 1%

---

## 52-5（Boss）：閱讀理解綜合

### Boss 關卡：綜合閱讀挑戰

這一關考的不是翻譯能力，而是你能不能從英文文件中**快速提取行動資訊**。

### 閱讀策略總整理

| 文件類型 | 先看哪裡 | 要抓什麼 |
|---------|---------|---------|
| JD | Requirements + Responsibilities | 面試準備方向 |
| README | Overview + Getting Started | 怎麼跑起來 |
| PRD | User Stories + Acceptance Criteria | 要做什麼、做到什麼程度 |
| 報告 | Executive Summary + KPIs | 數字表現和行動建議 |

### 速讀技巧

\\`\\`\\`
1. Skim First（先掃過）
   → 看標題、粗體、數字，30 秒內掌握大意

2. Identify Action Items（找行動項目）
   → 哪些跟你有關？你需要做什麼？

3. Note Unknown Terms（記下不懂的詞）
   → 不用每個字都查，但關鍵術語要搞懂

4. Summarize in One Sentence（用一句話總結）
   → 如果你不能用一句話說出重點，代表你還沒真的讀懂
\\`\\`\\`

### 綜合練習

> **練習一：讀這段 JD，回答三個問題**
> "We're looking for a data-savvy Product Analyst who thrives in ambiguity
> and can drive insights from complex datasets. You'll partner with
> cross-functional teams to define metrics, run experiments, and inform
> product strategy. Experience with SQL is required; Python is a plus."
>
> 1. 這個職位最重要的硬技能是什麼？
> 2. "thrives in ambiguity" 暗示什麼？
> 3. 面試可能會問你什麼類型的問題？

> **練習二：讀這段報告，找出關鍵行動**
> "Weekly active users declined 12% WoW, primarily due to a login bug
> introduced in v2.5. The engineering team has identified the root cause
> and a hotfix is expected by EOD Friday. Marketing recommends pausing
> the ongoing campaign until the fix is deployed."
>
> 1. 最緊急的行動是什麼？
> 2. 誰要負責什麼？
> 3. 哪個決定需要等？

### 建立你的術語庫

養成習慣：每次讀英文文件，把新學到的術語記到自己的術語庫。

\\`\\`\\`
格式建議：
| 術語 | 縮寫 | 意思 | 在哪裡看到的 |
|------|------|------|-------------|
| Quarter over Quarter | QoQ | 季度環比 | Q4 報告 |
| End of Day | EOD | 今天結束前 | Slack 訊息 |
| Out of Scope | OOS | 不在範圍內 | PRD 文件 |
\\`\\`\\`

持續累積，三個月後你就會發現——英文文件再也不可怕了。

"""

    static let enWorld52: String = """

# World 52: Professional Reading

> A huge amount of workplace information is in English — JDs, READMEs, PRDs, reports. Missing it means missing critical details, or worse, making the wrong call.
> This chapter teaches you how to **quickly extract the key points**, not translate word by word.

Professional reading isn't an English test — it's a test of whether you can **pull actionable information** out of a wall of text.
Master these reading strategies and you'll be one step ahead in job hunting and on the job.

---

## 52-1: Reading a Job Description

### Why You Need to Read JDs Well

A JD isn't just a job listing — it's your **cheat sheet for interview prep**. Read it well and you'll know exactly what the interviewer will ask and what kind of person the company is looking for.

### Anatomy of a JD

A typical JD looks like this:

\\`\\`\\`
[Job Title]       — Your role; watch the level (Junior / Senior / Lead)
[About the Team]  — What the team does and how big it is
[Responsibilities]— What you'll actually do (interviews revolve around this)
[Requirements]    — Must-haves
[Nice-to-haves]   — Bonuses (great to have, but not dealbreakers)
[Benefits]        — Perks (usually doesn't affect whether you apply)
\\`\\`\\`

### Decoding Corporate Speak

JDs are full of "coded language." Learning to decode it is essential:

| What the JD says | What it actually means |
|-----------------|------------------------|
| Fast-paced environment | Lots going on, things change quickly — you need to handle pressure |
| Wear many hats | Small team, lots of tasks — you'll do a bit of everything |
| Self-starter | Nobody will hand-hold you through the work |
| Cross-functional collaboration | You'll work across many teams — communication skills matter a lot |
| Data-driven | Decisions need data to back them up, not just gut feelings |
| Ambiguity | Requirements are often unclear — you'll need to figure things out yourself |

### Annotated Reading Example

\\`\\`\\`
Requirements:
- 3+ years of experience in product analytics
  → "3+" is the bar, but if you have 2 years + a strong portfolio, still apply
- Proficiency in SQL and at least one scripting language
  → SQL is non-negotiable; Python or R, at least one
- Experience with A/B testing frameworks
  → Expect A/B testing questions in the interview for sure

Nice to have:
- Experience with Looker or Tableau
  → Not having it is fine, but mentioning it in the interview is a plus
- Familiarity with machine learning concepts
  → You don't need to build ML models, but you should know the basics
\\`\\`\\`

### Common Mistakes

- **Waiting until you meet every Requirement before applying**: In practice, 60–70% is enough to apply
- **Ignoring Nice-to-haves**: These are clues for bonus interview points
- **Skipping About the Team**: This section reveals team culture and priorities

---

## 52-2: README / Technical Documentation

### Why READMEs Matter

Whether you're a PM, BA, or engineer, reading READMEs is part of the daily routine. A new tool, an open-source project, an internal service — the first step is always the README.

### Standard README Structure

\\`\\`\\`
# Project Name          ← Project name
## Overview / About     ← What this project does (most important!)
## Getting Started      ← How to install and run it
  ### Prerequisites     ← What you need installed first
  ### Installation      ← Step-by-step install
## Usage                ← How to use it (usually includes example code)
## API Reference        ← API docs (if applicable)
## Contributing         ← How to contribute (open source only)
## License              ← License type
\\`\\`\\`

### Quick-Reference Glossary

| Term | Meaning | What to do |
|------|---------|------------|
| Prerequisites | Pre-requirements | Install these first before continuing |
| Dependencies | Required packages | Missing these means it won't run |
| Breaking changes | Non-backward-compatible updates | Always check before upgrading |
| Deprecated | Being phased out | Still works but not recommended; will be removed eventually |
| Migration guide | Upgrade instructions | Tells you how to move from the old version to the new one |
| Environment variables | Env vars | Where sensitive config lives (API keys, etc.) |

### Annotated Reading Example

\\`\\`\\`
## Getting Started

### Prerequisites
- Node.js >= 18.0      ← Specific version required — don't just install any version
- npm or yarn           ← Pick one
- PostgreSQL 14+        ← You need to install the database separately

### Installation
$ git clone https://github.com/example/project.git
$ cd project
$ npm install           ← Install packages
$ cp .env.example .env  ← Copy the env template (important — fill in your own values)
$ npm run dev           ← Start the development environment
\\`\\`\\`

### Common Mistakes

- **Skipping Prerequisites**: Running install straight away, then getting a bunch of errors you can't explain
- **Ignoring version numbers**: Node 16 and Node 18 can behave very differently
- **Missing .env.example**: Starting the app without setting env vars will throw errors

---

## 52-3: PRD / Spec Reading

### What Is a PRD?

A PRD (Product Requirements Document) defines what to build, why, and to what standard. Whether you're the PM writing it or the BA reading it, understanding this format is essential.

### Core PRD Structure

\\`\\`\\`
1. Overview            — Why this is being built (business context)
2. User Stories        — Requirements from the user's perspective
3. Requirements        — Feature details
4. Priority            — P0 / P1 / P2 ranking
5. Acceptance Criteria — What "done" looks like
6. Out of Scope        — What is NOT being built this time (very important!)
\\`\\`\\`

### User Story Format

User Stories are the heart of a PRD, and they follow a fixed format:

\\`\\`\\`
As a [role], I want to [action], so that [outcome].

Example:
As a new user, I want to sign up with my Google account,
so that I don't have to remember another password.
\\`\\`\\`

### How to Read Priority Levels

| Level | Meaning | Your response |
|-------|---------|---------------|
| P0 (Critical) | Can't ship without this | Do first, no compromises |
| P1 (High) | Very important but not a blocker | Aim to finish this sprint |
| P2 (Medium) | Nice to have | Do when time allows; can push to next sprint |
| P3 (Low) | Nice cherry on top | Goes to backlog — do it someday |

### Acceptance Criteria Example

\\`\\`\\`
Feature: User Registration

Acceptance Criteria:
- [ ] User can sign up with email and password
- [ ] Password must be at least 8 characters
  with 1 uppercase and 1 number
- [ ] User receives a confirmation email within 2 minutes
- [ ] Duplicate email addresses show an error message
- [ ] All form fields have proper validation messages

→ These are the basis for QA testing and the definition of "done"
\\`\\`\\`

### Common Mistakes

- **Reading Requirements but ignoring Out of Scope**: You end up building something you shouldn't — wasted time
- **Not confirming Acceptance Criteria**: You finish but the output doesn't match expectations
- **Ignoring Priority**: You spend three days on a P2 while the P0 hasn't been touched

---

## 52-4: Data Reports / Dashboards

### What Do Workplace Reports Look Like?

Whether it's a weekly update, a monthly report, or a dashboard, English-language reports follow predictable structures and vocabulary. Learn to read them and you'll cut straight to the key points in any meeting.

### Common Report Structure

\\`\\`\\`
1. Executive Summary    — Key points in one paragraph (execs only read this)
2. Key Metrics / KPIs   — Numbers and performance
3. Highlights           — The good news
4. Areas of Concern     — The bad news (stated diplomatically)
5. Root Cause Analysis  — What caused the problem
6. Recommendations      — Suggested next steps
\\`\\`\\`

### Decoding Report Language

| What the report says | What it actually means |
|----------------------|------------------------|
| Showed modest growth | Growth was minimal |
| Underperformed expectations | Missed the target |
| Remains flat | No growth at all |
| Experienced headwinds | Ran into trouble |
| Opportunities for improvement | Performance was poor (diplomatic phrasing) |
| Trending upward / downward | There's an upward / downward trend |

### KPI Report Reading Example

\\`\\`\\`
Q4 Performance Summary

Revenue: $2.4M (↑12% QoQ)
  → QoQ = Quarter over Quarter, compared to last quarter
  → 12% growth is healthy

DAU: 45K (↓8% MoM)
  → MoM = Month over Month, compared to last month
  → DAU is dropping — needs attention

Churn Rate: 5.2% (↑0.8pp)
  → pp = percentage points
  → Rising churn is not a good sign

NPS: 42 (flat)
  → flat = no change
  → NPS of 42 is slightly above average
\\`\\`\\`

### How to Read Root Cause Analysis

\\`\\`\\`
Root Cause Analysis: DAU Decline

Investigation revealed that the decline was primarily driven by:
1. A 15% increase in app load time after the v3.2 release
   → A technical issue degraded the user experience
2. Seasonal patterns consistent with previous years
   → Seasonal factors — not entirely our fault
3. Increased competition from Product X's new feature launch
   → A competitor launched a new feature and drew users away

Recommended Actions:
- Immediate: Rollback performance regression in v3.2.1
- Short-term: Implement caching layer for top 10 API endpoints
- Long-term: Develop competitive feature parity roadmap
\\`\\`\\`

### Common Mistakes

- **Looking at numbers without looking at trends**: A single number means nothing — look at QoQ / MoM / YoY change
- **Not understanding diplomatic language**: "Areas of concern" means something went wrong — it's not a minor issue
- **Confusing percentage and percentage points**: Going from 5% to 6% is an increase of 1pp, not 1%

---

## 52-5 (Boss): Integrated Reading Comprehension

### Boss Level: Comprehensive Reading Challenge

This level isn't about translation ability — it's about whether you can **quickly extract actionable information** from English documents.

### Reading Strategy Summary

| Document type | Read first | What to extract |
|---------------|------------|-----------------|
| JD | Requirements + Responsibilities | Direction for interview prep |
| README | Overview + Getting Started | How to get it running |
| PRD | User Stories + Acceptance Criteria | What to build and to what standard |
| Report | Executive Summary + KPIs | Performance numbers and recommended actions |

### Speed Reading Techniques

\\`\\`\\`
1. Skim First
   → Scan headings, bold text, and numbers — get the gist in 30 seconds

2. Identify Action Items
   → What's relevant to you? What do you need to do?

3. Note Unknown Terms
   → You don't need to look up every word, but key terms must be understood

4. Summarize in One Sentence
   → If you can't state the main point in one sentence, you haven't truly read it yet
\\`\\`\\`

### Integrated Practice

> **Exercise 1: Read this JD excerpt and answer three questions**
> "We're looking for a data-savvy Product Analyst who thrives in ambiguity
> and can drive insights from complex datasets. You'll partner with
> cross-functional teams to define metrics, run experiments, and inform
> product strategy. Experience with SQL is required; Python is a plus."
>
> 1. What is the most critical hard skill for this role?
> 2. What does "thrives in ambiguity" signal about this job?
> 3. What types of questions should you expect in the interview?

> **Exercise 2: Read this report excerpt and identify the key actions**
> "Weekly active users declined 12% WoW, primarily due to a login bug
> introduced in v2.5. The engineering team has identified the root cause
> and a hotfix is expected by EOD Friday. Marketing recommends pausing
> the ongoing campaign until the fix is deployed."
>
> 1. What is the most urgent action?
> 2. Who is responsible for what?
> 3. Which decision needs to wait?

### Build Your Personal Glossary

Make it a habit: every time you read an English document, add new terms to your personal glossary.

\\`\\`\\`
Suggested format:
| Term | Abbreviation | Meaning | Where I saw it |
|------|-------------|---------|----------------|
| Quarter over Quarter | QoQ | Compared to the previous quarter | Q4 report |
| End of Day | EOD | By the end of today | Slack message |
| Out of Scope | OOS | Not included in this iteration | PRD document |
\\`\\`\\`

Keep building it — three months from now, you'll find that English documents aren't intimidating anymore.

"""

    static let zhWorld53: String = """

# World 53：短寫作

> 職場英文寫作不是寫作文，而是用最少的字傳達最清楚的訊息。
> Email、會議紀錄、履歷、Slack——每一種都有固定格式和潛規則。

寫得好的人不是英文最好的人，而是**最懂格式和語氣**的人。
這一章教你四種最常見的職場寫作，學完馬上能用。

---

## 53-1：Professional Email

### Email 的基本結構

一封專業的英文 email 有五個部分：

\\`\\`\\`
Subject: [簡潔明確的主旨]
Hi [Name],

[Opening — 一句話說明目的]
[Body — 細節和說明]
[Closing — 下一步行動]

Best regards,
[Your Name]
\\`\\`\\`

### Subject Line 怎麼寫

Subject 是最容易被忽略但最重要的部分。好的 subject 讓對方秒懂這封信在幹嘛：

| 情境 | 差的 Subject | 好的 Subject |
|------|-------------|-------------|
| 請求資料 | Hi | Request: Q4 Sales Data by Friday |
| 會議跟進 | Meeting | Follow-up: Action Items from 3/25 Sync |
| 狀態更新 | Update | Status Update: Dashboard Migration (On Track) |
| 請假 | Leave | OOO: Mar 28-30 |

### 三種常見 Email 模板

**請求型 Email：**
\\`\\`\\`
Subject: Request: User Research Data for Q1 Analysis

Hi Sarah,

I hope you're doing well. I'm reaching out because I need
the Q1 user research data for our upcoming product review.

Could you share the following by end of day Thursday?
- Interview transcripts (anonymized)
- Survey results summary
- NPS score breakdown by segment

Please let me know if you need any clarification
or if the timeline doesn't work.

Best regards,
[Name]
\\`\\`\\`

**跟進型 Email：**
\\`\\`\\`
Subject: Follow-up: API Integration Timeline

Hi David,

Following up on our conversation last Tuesday about
the API integration timeline.

Just wanted to check if there are any updates
on the estimated completion date.
The marketing team is planning the launch campaign
and would like to align on timing.

Happy to jump on a quick call if that's easier.

Thanks,
[Name]
\\`\\`\\`

**狀態更新 Email：**
\\`\\`\\`
Subject: Status Update: Mobile App Redesign (Week 12)

Hi team,

Here's this week's update on the mobile app redesign:

Completed:
- Finalized wireframes for checkout flow
- User testing with 8 participants

In Progress:
- High-fidelity designs (ETA: Friday)
- Developer handoff documentation

Blockers:
- Waiting on brand guidelines update from Design team

Let me know if you have any questions.

Best,
[Name]
\\`\\`\\`

### 常見錯誤

- **開頭太廢話**："I am writing this email to inform you that..." → 直接講重點
- **沒有明確的 action item**：對方看完不知道要幹嘛
- **語氣太直接**："Send me the file." → "Could you share the file by Friday?"
- **信太長**：超過螢幕一頁就太長了，重點放前面

---

## 53-2：會議摘要

### 為什麼要寫 Meeting Notes？

好的會議紀錄讓沒參加的人也能掌握重點，也是日後追蹤進度的依據。很多台灣同學開完會就算了，但在外商，寫 meeting notes 是基本功。

### Meeting Notes 標準格式

\\`\\`\\`
## Meeting Notes: [Meeting Name]
**Date:** March 25, 2026
**Attendees:** Alice, Bob, Charlie
**Note-taker:** [You]

### Key Decisions
- Decided to launch MVP by April 15
- Agreed to use Stripe for payment processing

### Discussion Summary
- Alice presented the competitive analysis
- Team discussed two pricing strategies
- Bob raised concerns about the timeline

### Action Items
| Action | Owner | Due Date |
|--------|-------|----------|
| Finalize pricing model | Alice | Mar 28 |
| Set up Stripe sandbox | Bob | Mar 30 |
| Draft launch announcement | Charlie | Apr 1 |

### Next Meeting
April 1, 2:00 PM — Review launch readiness
\\`\\`\\`

### 寫好 Meeting Notes 的訣竅

\\`\\`\\`
1. Key Decisions 放最上面
   → 高管只看這段，把最重要的結論放第一

2. Action Items 要有三要素：做什麼 + 誰做 + 什麼時候
   → "Look into pricing" ❌
   → "Alice: Finalize pricing model by Mar 28" ✅

3. Discussion 只記重點，不要逐字稿
   → 記結論和分歧，不是記誰說了什麼廢話

4. 開完會 24 小時內發出
   → 拖太久大家都忘了，也顯得你不專業
\\`\\`\\`

### 實用模板

\\`\\`\\`
用這個模板，開完會只需要填空就好：

Subject: Meeting Notes — [Meeting Name] ([Date])

Hi team,

Here are the notes from today's [meeting name].

**Decisions:**
- [Decision 1]
- [Decision 2]

**Action Items:**
- [Person]: [Task] by [Date]
- [Person]: [Task] by [Date]

**Key Discussions:**
- [Topic 1]: [Summary]
- [Topic 2]: [Summary]

Please reply if I missed anything or if any details need correction.

Thanks,
[Name]
\\`\\`\\`

### 常見錯誤

- **寫成逐字稿**：沒人想看三頁的流水帳
- **Action Items 沒有 owner**：寫了等於沒寫，誰要做？
- **沒有 due date**："Do it soon" 是什麼時候？要寫具體日期
- **不發確認信**：寫完要寄給所有人確認，避免理解不一致

---

## 53-3：履歷子彈點

### 為什麼履歷這麼重要？

你的履歷平均只會被看 **6-7 秒**。在這幾秒內，recruiter 會掃描你的 bullet points。寫得好不好，直接決定你有沒有面試機會。

### 子彈點公式

\\`\\`\\`
[Action Verb] + [What you did] + [Impact/Result]

強調：動詞開頭 + 量化成果
\\`\\`\\`

### 高頻 Action Verbs

| 類別 | 動詞 | 適用情境 |
|------|------|---------|
| 領導 | Led, Managed, Directed, Spearheaded | 帶團隊、主導專案 |
| 建造 | Developed, Built, Designed, Created | 從零到一做出東西 |
| 優化 | Optimized, Improved, Streamlined, Enhanced | 讓現有東西變更好 |
| 分析 | Analyzed, Evaluated, Assessed, Identified | 數據分析、研究 |
| 協作 | Collaborated, Partnered, Coordinated | 跨部門合作 |
| 交付 | Delivered, Launched, Shipped, Implemented | 完成並上線 |

### Before / After 比較

\\`\\`\\`
❌ Before（弱）:
- Responsible for data analysis
- Helped with the marketing campaign
- Did user research

✅ After（強）:
- Analyzed 50K+ user behavior records using SQL and Python,
  identifying 3 key drop-off points that informed the product roadmap
- Collaborated with the marketing team to launch a referral campaign,
  resulting in a 25% increase in new user sign-ups within 2 months
- Conducted 15 user interviews and synthesized findings into
  actionable personas, adopted by 3 product teams
\\`\\`\\`

### 量化技巧

沒有數據怎麼辦？用這些方法找數字：

\\`\\`\\`
- 多少人用？ → "serving 10K+ daily active users"
- 省了多少時間？ → "reducing processing time by 40%"
- 影響範圍多大？ → "across 5 departments and 3 regions"
- 做了多少？ → "completed 20+ A/B tests"
- 成長多少？ → "growing revenue by 15% QoQ"
\\`\\`\\`

### 根據 JD 調整

\\`\\`\\`
JD 寫：Experience with A/B testing and data-driven decision making

你的 bullet point 就要包含這些關鍵字：
✅ "Designed and executed 12 A/B tests to optimize checkout flow,
   driving a data-driven decision that increased conversion by 8%"

關鍵字對應：A/B testing ✓, data-driven ✓, 有量化 ✓
\\`\\`\\`

### 實用模板

\\`\\`\\`
[分析類]
Analyzed _______ using _______, resulting in _______.

[專案類]
Led the development of _______, which _______ by _______%.

[優化類]
Optimized _______ by implementing _______, reducing _______ by _______%.

[協作類]
Collaborated with _______ to _______, delivering _______ on time.
\\`\\`\\`

### 常見錯誤

- **用 "Responsible for" 開頭**：這是在描述 JD，不是描述你的成就
- **沒有量化**："Improved efficiency" → 改善了多少？省了多少時間？
- **太技術或太模糊**：要讓非技術的 recruiter 也看得懂
- **每個 bullet 都一樣長**：最重要的經歷寫 2 行，次要的寫 1 行

---

## 53-4：Slack / 工作溝通

### Slack 溝通的潛規則

Slack 不是 LINE。在職場 Slack 中，溝通方式直接影響別人對你的印象。掌握這些潛規則，你就能像 native speaker 一樣自然：

### 四種常見 Slack 情境

**請求幫助：**
\\`\\`\\`
❌ "Can someone help me?"（太模糊）
❌ "URGENT!! Need help NOW"（太誇張）

✅ "Hey team, I'm running into an issue with the data pipeline —
   the daily job has been failing since Monday.
   I've checked the logs and it seems like a permission issue.
   Has anyone seen this before?
   cc @DataEng"

重點：描述問題 + 你已經試了什麼 + 具體問什麼
\\`\\`\\`

**給狀態更新：**
\\`\\`\\`
✅ "Quick update on the dashboard migration:
   ✅ Data source connected
   ✅ Core metrics configured
   🔄 Working on custom filters (ETA: tomorrow)
   ⏳ Stakeholder review (scheduled for Thursday)

   No blockers. Will share the preview link by EOD."

重點：用 emoji 標示狀態，簡潔明瞭
\\`\\`\\`

**禮貌推回（Pushing Back）：**
\\`\\`\\`
❌ "No, I can't do that."
❌ "That's not my job."

✅ "Thanks for thinking of me for this! I want to make sure
   I can give it the attention it deserves. I'm currently
   focused on [Project X] which is due Friday.
   Would it work if I pick this up next week?
   Alternatively, [Name] might have more bandwidth right now."

重點：先感謝 → 說明現狀 → 提供替代方案
\\`\\`\\`

**非同步溝通（Async）：**
\\`\\`\\`
✅ "No rush on this — just leaving a note for when you're back.
   Could you take a look at the PR when you get a chance?
   It's the login flow update we discussed.
   PR link: [link]
   Happy to walk through it if you have questions."

重點：表明不急 + 提供所有 context + 不需要對方回覆也能理解
\\`\\`\\`

### Slack 實用短語

| 場景 | 短語 |
|------|------|
| 確認收到 | "Got it, thanks!" / "Noted!" |
| 稍後回覆 | "Let me look into this and get back to you." |
| 同意 | "Sounds good!" / "Works for me!" / "+1" |
| 不確定 | "I'm not 100% sure, but I think..." |
| 道謝 | "Appreciate the help!" / "Thanks for the quick turnaround!" |
| 道歉 | "Sorry for the delay!" / "My apologies for the confusion." |

### 常見錯誤

- **一個字回**："Ok" → "Got it, thanks! I'll have it done by EOD."
- **不提供 context**：直接丟一個問題，對方還要追問背景
- **在公開頻道討論私事**：敏感話題用 DM
- **訊息太長**：超過一個螢幕就改用 thread 或文件

---

## 53-5（Boss）：寫作綜合

### Boss 關卡：綜合寫作挑戰

這一關測試你能不能在不同情境下，快速切換寫作風格和格式。

### 四種寫作風格對比

| 類型 | 語氣 | 長度 | 格式 |
|------|------|------|------|
| Email | 正式但友善 | 中等 | 有 subject、greeting、closing |
| Meeting Notes | 客觀精簡 | 短 | bullet points、表格 |
| 履歷 | 自信專業 | 極短 | 動詞開頭、量化成果 |
| Slack | 輕鬆直接 | 最短 | 口語化、可用 emoji |

### 綜合練習

> **情境一：寫一封 Email**
> 你負責的專案延遲了一週，需要寫信通知你的主管和相關 stakeholders。
> 提示：說明原因 → 新的時間表 → 你的應對計畫

> **情境二：寫 Meeting Notes**
> 你剛開完 sprint planning meeting，討論了下個 sprint 要做的三個 feature，
> 每個都有 owner 和 due date。其中一個有依賴關係需要等另一個團隊。
> 提示：Decisions → Action Items（含 owner 和 due date）→ Blockers

> **情境三：改寫履歷**
> 把這個弱的 bullet point 改強：
> "I was responsible for the company's social media accounts
> and helped increase followers."
> 提示：動詞開頭 + 量化 + 影響

> **情境四：Slack 回覆**
> PM 在 Slack 上問你一個你不確定答案的技術問題，同時請你幫忙一個
> 你目前沒有 bandwidth 做的任務。
> 提示：先回答問題（誠實說不確定）→ 禮貌推回任務 → 給替代方案

### 寫作品質自我檢查

每次寫完英文，用這個 checklist 檢查：

\\`\\`\\`
□ 主旨/目的在第一句就清楚了嗎？
□ 有沒有明確的 action item？（誰要做什麼、什麼時候）
□ 語氣適合這個場景嗎？（Email vs Slack vs 履歷）
□ 長度適當嗎？（能短就短）
□ 有沒有 typo 或文法錯誤？（用 Grammarly 檢查）
□ 對方看完知道下一步是什麼嗎？
\\`\\`\\`

### 持續進步的方法

\\`\\`\\`
1. 收集好的範例
   → 看到寫得好的 email、Slack 訊息，存下來當模板

2. 先模仿，再創造
   → 剛開始用模板填空就好，熟了再加入自己的風格

3. 請 native speaker 看
   → 不確定的措辭就問同事，大部分人很樂意幫忙

4. 多讀多寫
   → 讀英文文章時注意作者怎麼組織句子和段落
\\`\\`\\`

恭喜你完成短寫作篇章！
記住：職場英文寫作的核心是——**Clear, Concise, Actionable（清楚、簡潔、可行動）**。

"""

    static let enWorld53: String = """

# World 53: Short-form Writing

> Workplace English writing isn't about composing essays — it's about conveying the clearest message with the fewest words.
> Email, meeting notes, resumes, Slack — each one has its own format and unwritten rules.

The best workplace writers aren't the ones with the best English — they're the ones who **know the format and tone**.
This chapter teaches you the four most common types of workplace writing, ready to use immediately.

---

## 53-1: Professional Email

### Basic Email Structure

A professional English email has five parts:

\\`\\`\\`
Subject: [Clear, specific subject line]
Hi [Name],

[Opening — one sentence stating your purpose]
[Body — details and explanation]
[Closing — next steps / action]

Best regards,
[Your Name]
\\`\\`\\`

### How to Write a Subject Line

The subject line is the most overlooked but most important part. A good subject lets the reader instantly understand what the email is about:

| Situation | Weak Subject | Strong Subject |
|-----------|-------------|----------------|
| Requesting data | Hi | Request: Q4 Sales Data by Friday |
| Meeting follow-up | Meeting | Follow-up: Action Items from 3/25 Sync |
| Status update | Update | Status Update: Dashboard Migration (On Track) |
| Time off | Leave | OOO: Mar 28-30 |

### Three Common Email Templates

**Request Email:**
\\`\\`\\`
Subject: Request: User Research Data for Q1 Analysis

Hi Sarah,

I hope you're doing well. I'm reaching out because I need
the Q1 user research data for our upcoming product review.

Could you share the following by end of day Thursday?
- Interview transcripts (anonymized)
- Survey results summary
- NPS score breakdown by segment

Please let me know if you need any clarification
or if the timeline doesn't work.

Best regards,
[Name]
\\`\\`\\`

**Follow-up Email:**
\\`\\`\\`
Subject: Follow-up: API Integration Timeline

Hi David,

Following up on our conversation last Tuesday about
the API integration timeline.

Just wanted to check if there are any updates
on the estimated completion date.
The marketing team is planning the launch campaign
and would like to align on timing.

Happy to jump on a quick call if that's easier.

Thanks,
[Name]
\\`\\`\\`

**Status Update Email:**
\\`\\`\\`
Subject: Status Update: Mobile App Redesign (Week 12)

Hi team,

Here's this week's update on the mobile app redesign:

Completed:
- Finalized wireframes for checkout flow
- User testing with 8 participants

In Progress:
- High-fidelity designs (ETA: Friday)
- Developer handoff documentation

Blockers:
- Waiting on brand guidelines update from Design team

Let me know if you have any questions.

Best,
[Name]
\\`\\`\\`

### Common Mistakes

- **Too much fluff at the start:** "I am writing this email to inform you that..." → Get to the point
- **No clear action item:** The reader finishes and doesn't know what to do next
- **Too blunt:** "Send me the file." → "Could you share the file by Friday?"
- **Email too long:** If it scrolls past one screen, it's too long — put the key points first

---

## 53-2: Meeting Notes

### Why Write Meeting Notes?

Good meeting notes let people who weren't there stay in the loop, and serve as a reference for tracking progress later. Many people skip this step, but in international companies, writing meeting notes is a core professional skill.

### Standard Meeting Notes Format

\\`\\`\\`
## Meeting Notes: [Meeting Name]
**Date:** March 25, 2026
**Attendees:** Alice, Bob, Charlie
**Note-taker:** [You]

### Key Decisions
- Decided to launch MVP by April 15
- Agreed to use Stripe for payment processing

### Discussion Summary
- Alice presented the competitive analysis
- Team discussed two pricing strategies
- Bob raised concerns about the timeline

### Action Items
| Action | Owner | Due Date |
|--------|-------|----------|
| Finalize pricing model | Alice | Mar 28 |
| Set up Stripe sandbox | Bob | Mar 30 |
| Draft launch announcement | Charlie | Apr 1 |

### Next Meeting
April 1, 2:00 PM — Review launch readiness
\\`\\`\\`

### Tips for Great Meeting Notes

\\`\\`\\`
1. Put Key Decisions at the top
   → Executives only read this section — put the most important conclusions first

2. Action Items need three elements: what + who + when
   → "Look into pricing" ❌
   → "Alice: Finalize pricing model by Mar 28" ✅

3. Keep Discussion summaries concise — not a transcript
   → Capture conclusions and disagreements, not every word said

4. Send within 24 hours of the meeting
   → Waiting too long means everyone forgets, and it looks unprofessional
\\`\\`\\`

### Ready-to-Use Template

\\`\\`\\`
Use this template — just fill in the blanks after the meeting:

Subject: Meeting Notes — [Meeting Name] ([Date])

Hi team,

Here are the notes from today's [meeting name].

**Decisions:**
- [Decision 1]
- [Decision 2]

**Action Items:**
- [Person]: [Task] by [Date]
- [Person]: [Task] by [Date]

**Key Discussions:**
- [Topic 1]: [Summary]
- [Topic 2]: [Summary]

Please reply if I missed anything or if any details need correction.

Thanks,
[Name]
\\`\\`\\`

### Common Mistakes

- **Writing a transcript:** Nobody wants to read three pages of blow-by-blow notes
- **Action Items with no owner:** Assigning a task to no one means it won't get done
- **No due date:** "Do it soon" — when exactly? Use specific dates
- **Skipping the confirmation email:** Always send to all attendees to avoid misunderstandings

---

## 53-3: Resume Bullet Points

### Why Do Resume Bullets Matter?

Your resume gets an average of **6–7 seconds** of attention. In that time, recruiters scan your bullet points. How well you write them directly determines whether you get an interview.

### The Bullet Point Formula

\\`\\`\\`
[Action Verb] + [What you did] + [Impact/Result]

Key emphasis: start with a verb + quantify outcomes
\\`\\`\\`

### High-Frequency Action Verbs

| Category | Verbs | Best Used When |
|----------|-------|---------------|
| Leadership | Led, Managed, Directed, Spearheaded | Running a team, owning a project |
| Building | Developed, Built, Designed, Created | Creating something from scratch |
| Optimization | Optimized, Improved, Streamlined, Enhanced | Making existing things better |
| Analysis | Analyzed, Evaluated, Assessed, Identified | Data analysis, research |
| Collaboration | Collaborated, Partnered, Coordinated | Cross-functional work |
| Delivery | Delivered, Launched, Shipped, Implemented | Completing and releasing work |

### Before / After Comparison

\\`\\`\\`
❌ Before (weak):
- Responsible for data analysis
- Helped with the marketing campaign
- Did user research

✅ After (strong):
- Analyzed 50K+ user behavior records using SQL and Python,
  identifying 3 key drop-off points that informed the product roadmap
- Collaborated with the marketing team to launch a referral campaign,
  resulting in a 25% increase in new user sign-ups within 2 months
- Conducted 15 user interviews and synthesized findings into
  actionable personas, adopted by 3 product teams
\\`\\`\\`

### Quantification Tips

No numbers? Here's how to find them:

\\`\\`\\`
- How many users? → "serving 10K+ daily active users"
- How much time saved? → "reducing processing time by 40%"
- How wide was the impact? → "across 5 departments and 3 regions"
- How much did you produce? → "completed 20+ A/B tests"
- How much did it grow? → "growing revenue by 15% QoQ"
\\`\\`\\`

### Tailor Bullets to the Job Description

\\`\\`\\`
JD says: Experience with A/B testing and data-driven decision making

Your bullet point should include those keywords:
✅ "Designed and executed 12 A/B tests to optimize checkout flow,
   driving a data-driven decision that increased conversion by 8%"

Keyword match: A/B testing ✓, data-driven ✓, quantified ✓
\\`\\`\\`

### Ready-to-Use Templates

\\`\\`\\`
[Analysis]
Analyzed _______ using _______, resulting in _______.

[Project]
Led the development of _______, which _______ by _______%.

[Optimization]
Optimized _______ by implementing _______, reducing _______ by _______%.

[Collaboration]
Collaborated with _______ to _______, delivering _______ on time.
\\`\\`\\`

### Common Mistakes

- **Starting with "Responsible for":** That describes a job description, not your achievement
- **No quantification:** "Improved efficiency" — by how much? How much time was saved?
- **Too technical or too vague:** Non-technical recruiters should be able to understand it
- **All bullets the same length:** Write 2 lines for your most important experience, 1 line for secondary ones

---

## 53-4: Slack / Workplace Communication

### The Unwritten Rules of Slack

Slack is not a casual chat app. In a professional setting, how you communicate on Slack directly shapes how others perceive you. Master these unwritten rules and you'll communicate like a native speaker:

### Four Common Slack Scenarios

**Asking for help:**
\\`\\`\\`
❌ "Can someone help me?" (too vague)
❌ "URGENT!! Need help NOW" (too dramatic)

✅ "Hey team, I'm running into an issue with the data pipeline —
   the daily job has been failing since Monday.
   I've checked the logs and it seems like a permission issue.
   Has anyone seen this before?
   cc @DataEng"

Key: describe the problem + what you've already tried + what specifically you're asking
\\`\\`\\`

**Giving a status update:**
\\`\\`\\`
✅ "Quick update on the dashboard migration:
   ✅ Data source connected
   ✅ Core metrics configured
   🔄 Working on custom filters (ETA: tomorrow)
   ⏳ Stakeholder review (scheduled for Thursday)

   No blockers. Will share the preview link by EOD."

Key: use emoji to indicate status, keep it short and clear
\\`\\`\\`

**Politely pushing back:**
\\`\\`\\`
❌ "No, I can't do that."
❌ "That's not my job."

✅ "Thanks for thinking of me for this! I want to make sure
   I can give it the attention it deserves. I'm currently
   focused on [Project X] which is due Friday.
   Would it work if I pick this up next week?
   Alternatively, [Name] might have more bandwidth right now."

Key: thank them → explain your situation → offer an alternative
\\`\\`\\`

**Async communication:**
\\`\\`\\`
✅ "No rush on this — just leaving a note for when you're back.
   Could you take a look at the PR when you get a chance?
   It's the login flow update we discussed.
   PR link: [link]
   Happy to walk through it if you have questions."

Key: signal it's not urgent + provide all context + message is self-contained
\\`\\`\\`

### Useful Slack Phrases

| Situation | Phrases |
|-----------|---------|
| Acknowledging receipt | "Got it, thanks!" / "Noted!" |
| Will reply later | "Let me look into this and get back to you." |
| Agreement | "Sounds good!" / "Works for me!" / "+1" |
| Unsure | "I'm not 100% sure, but I think..." |
| Expressing thanks | "Appreciate the help!" / "Thanks for the quick turnaround!" |
| Apologizing | "Sorry for the delay!" / "My apologies for the confusion." |

### Common Mistakes

- **One-word replies:** "Ok" → "Got it, thanks! I'll have it done by EOD."
- **No context:** Dropping a question with no background so the other person has to follow up
- **Discussing sensitive topics in public channels:** Use DMs for anything private
- **Messages that are too long:** If it scrolls past one screen, move it to a thread or a doc

---

## 53-5 (Boss): Integrated Writing

### Boss Level: The Integrated Writing Challenge

This level tests whether you can quickly switch writing styles and formats across different situations.

### Comparing the Four Writing Styles

| Type | Tone | Length | Format |
|------|------|--------|--------|
| Email | Formal but friendly | Medium | Subject line, greeting, closing |
| Meeting Notes | Objective, concise | Short | Bullet points, tables |
| Resume | Confident, professional | Very short | Verb-first, quantified results |
| Slack | Casual, direct | Shortest | Conversational, emojis OK |

### Integrated Practice

> **Scenario 1: Write an Email**
> The project you're managing is delayed by one week. You need to notify your manager and relevant stakeholders.
> Hint: State the reason → new timeline → your mitigation plan

> **Scenario 2: Write Meeting Notes**
> You just finished a sprint planning meeting. The team discussed three features for the next sprint, each with an owner and due date. One feature has a dependency on another team.
> Hint: Decisions → Action Items (with owner and due date) → Blockers

> **Scenario 3: Rewrite a Resume Bullet**
> Strengthen this weak bullet point:
> "I was responsible for the company's social media accounts
> and helped increase followers."
> Hint: Start with a verb + quantify + show impact

> **Scenario 4: Slack Reply**
> A PM asks you a technical question you're not sure about on Slack, and also asks you to take on a task you don't currently have bandwidth for.
> Hint: Answer the question first (honestly say you're not sure) → politely push back on the task → offer an alternative

### Writing Quality Self-Checklist

Use this checklist every time you finish writing in English:

\\`\\`\\`
□ Is the subject/purpose clear in the first sentence?
□ Is there a clear action item? (who does what, by when)
□ Is the tone right for this context? (Email vs Slack vs Resume)
□ Is the length appropriate? (shorter is better)
□ Are there any typos or grammar errors? (use Grammarly)
□ Does the reader know what the next step is after reading?
\\`\\`\\`

### How to Keep Improving

\\`\\`\\`
1. Collect good examples
   → When you see a well-written email or Slack message, save it as a template

2. Imitate first, then create
   → Start by filling in templates; add your own style once you're comfortable

3. Ask a native speaker to review
   → Ask a colleague when you're unsure about phrasing — most people are happy to help

4. Read and write more
   → When reading English articles, pay attention to how the author structures sentences and paragraphs
\\`\\`\\`

Congratulations on completing the Short-form Writing chapter!
Remember: the core of professional English writing is — **Clear, Concise, Actionable**.

"""

    static let zhWorld54: String = """

# World 54：供應鏈全貌

> **目標：** 搞懂整條供應鏈在做什麼——從原料到消費者的完整流程
> **適用場景：** 供應鏈入門、面試基礎概念、跨部門溝通
> **預估學習時間：** 3-4 小時

---

## 54-1：供應鏈角色與流向

### 供應鏈六大角色

供應鏈（Supply Chain）是一條從原物料到消費者手上的完整鏈條。每個角色都有特定功能：

| 角色 | 英文 | 做什麼 | 例子 |
|------|------|--------|------|
| 供應商 | Supplier | 提供原物料或零組件 | 鋼鐵廠、晶圓代工廠 |
| 製造商 | Manufacturer | 將原料加工為成品 | 手機組裝廠、食品加工廠 |
| 倉庫 | Warehouse | 大量存放成品等待出貨 | 物流中心、配送倉 |
| 配送商 | Distributor | 將產品分送到各地區 | 區域經銷商、批發商 |
| 零售商 | Retailer | 在店面或線上銷售給消費者 | 超市、電商平台 |
| 消費者 | Customer | 購買並使用產品的人 | 你和我 |

> **記憶口訣：** S → M → W → D → R → C（Supplier → Manufacturer → Warehouse → Distributor → Retailer → Customer）

### 三大流向

供應鏈不只有貨物在動，還有資訊和金錢在流動：

**1. Physical Flow（物流）**
- 貨物的實際移動：原料 → 工廠 → 倉庫 → 門市 → 消費者
- 方向：通常從上游到下游（但退貨是反向的）

**2. Information Flow（資訊流）**
- 訂單、預測、庫存水位、交期承諾等資料的傳遞
- 方向：雙向流動（下游的需求資訊往上傳，上游的供貨資訊往下傳）
- **這是現代供應鏈最關鍵的流向**——資訊流的品質決定另外兩個流向的效率

**3. Financial Flow（金流）**
- 付款、信用證、發票等金錢的流動
- 方向：通常從下游到上游（消費者付給零售商，零售商付給配送商⋯）

> 💡 **實務洞察：** 大部分供應鏈問題的根因是「資訊流不通」。如果每一層都能看到真實的消費者需求，很多庫存和交期問題都可以避免。

### Push vs Pull 供應鏈

| | Push（推式） | Pull（拉式） |
|--|-------------|-------------|
| 驅動力 | 預測（Forecast） | 實際需求（Demand） |
| 生產方式 | Make-to-Stock | Make-to-Order |
| 優點 | 規模經濟、快速交付 | 庫存少、浪費低 |
| 缺點 | 可能過度生產 | 交期較長 |
| 代表 | 傳統服飾品牌 | Dell 電腦客製化 |

**Decoupling Point（推拉分界點）：** 現實中大多數企業用 Push-Pull 混合策略。在分界點之前用 Push 備料（享受規模經濟），之後用 Pull 回應需求（減少浪費）。

> **ZARA 案例：** 提前備好布料（Push），但成衣的設計和生產根據門市銷售數據決定（Pull）。設計到上架只要 2-3 週，庫存周轉率是業界 2 倍。

---

## 54-2：供應鏈關鍵概念

### Lead Time（前置時間）

**定義：** 從訂單觸發到交付完成的總時間。

Lead Time = Procurement LT + Manufacturing LT + Delivery LT

- **Procurement Lead Time：** 從下採購單到原料到廠
- **Manufacturing Lead Time：** 從開始生產到成品完成
- **Delivery Lead Time：** 從出廠到客戶收貨

> **縮短 Lead Time 的方法：** 備安全庫存、並行處理、改善瓶頸、靠近客戶設倉

### Bottleneck（瓶頸）

**定義：** 系統中產能最低的環節，決定整體最大產出。

**識別方法：**
1. 找產能最低的環節
2. 看利用率最高的環節（接近 100% = 已滿載）
3. 看前面堆積最多 WIP（在製品）的環節

> **Theory of Constraints（TOC）：** 系統產出 = 瓶頸產能。改善非瓶頸環節不會提升整體產出。永遠先改善瓶頸。

### Bullwhip Effect（長鞭效應）

**定義：** 需求的微小波動在供應鏈上游被逐層放大。消費者需求只變 10%，到製造商端可能變成 80%。

**四大成因：**
1. **Demand Signal Processing** — 每一層做自己的預測並加安全量
2. **Order Batching** — 批量訂購放大波動
3. **Price Fluctuation** — 促銷造成囤貨
4. **Shortage Gaming** — 缺貨時超額訂購

**對策（按優先級）：**
1. 共享真實消費者數據（POS Data Sharing）
2. 縮短 Lead Time
3. 減少批量訂貨
4. 穩定價格策略

> 🆕 **2025 趨勢：** 企業透過 AI Control Tower 整合即時 POS 數據、社群媒體、天氣等外部信號做 Demand Sensing，大幅抑制 Bullwhip Effect。

---

## 54-3：供應鏈績效指標

### Service Level & Fill Rate

| 指標 | 公式 | 用途 |
|------|------|------|
| **Order Fill Rate** | 完整交付訂單數 / 總訂單數 | 看客戶體驗（嚴格） |
| **Line Fill Rate** | 實際交付品項數 / 總訂購品項數 | 找改善方向（較寬鬆） |
| **OTIF** | 同時準時且完整的訂單 / 總訂單 | 物流之王（最嚴格） |

> Walmart 要求供應商 OTIF 達 98%，未達標罰款 3% of COGS。

### Total Cost of Ownership（TCO）

採購決策不能只看單價！TCO 包含：

\\`\\`\\`
TCO = 採購價格
    + 物流成本（運費、關稅）
    + 品質成本（不良品退換、重工）
    + 庫存持有成本（倉儲、資金佔用）
    + 管理成本（溝通、驗貨、稽核）
    + 風險成本（交期不穩、緊急空運）
\\`\\`\\`

> 研究顯示，採購價格通常只佔 TCO 的 50-70%，隱藏成本佔 30-50%。

### 供應鏈問題分析框架

面對複雜的供應鏈問題，用這個框架：

1. **辨識** — 所有受影響的環節有哪些？
2. **分類** — 根因 vs 症狀？內部 vs 外部？
3. **對策** — 短期應急 / 中期改善 / 長期策略
4. **Trade-off** — 每個方案的成本和代價是什麼？

> 🆕 **2024-2026 現實：** 紅海危機、地緣政治、極端氣候讓 **Resilience（韌性）** 成為供應鏈最重要的關鍵字。不是避免風險，而是能快速恢復。

"""

    static let enWorld54: String = """

# World 54: The Big Picture of Supply Chain

> **Goal:** Understand what the entire supply chain does — the complete flow from raw materials to the consumer
> **Use Cases:** Supply chain fundamentals, interview prep, cross-functional communication
> **Estimated Study Time:** 3–4 hours

---

## 54-1: Supply Chain Roles and Flows

### The Six Key Roles in a Supply Chain

A supply chain is a complete chain from raw materials to the hands of the consumer. Each role has a specific function:

| Role | Term | What They Do | Examples |
|------|------|--------------|---------|
| Supplier | Supplier | Provides raw materials or components | Steel mills, wafer foundries |
| Manufacturer | Manufacturer | Processes raw materials into finished goods | Phone assembly plants, food processors |
| Warehouse | Warehouse | Stores large quantities of finished goods awaiting shipment | Distribution centers, fulfillment warehouses |
| Distributor | Distributor | Delivers products to different regions | Regional dealers, wholesalers |
| Retailer | Retailer | Sells to consumers in-store or online | Supermarkets, e-commerce platforms |
| Customer | Customer | The person who buys and uses the product | You and me |

> **Memory aid:** S → M → W → D → R → C (Supplier → Manufacturer → Warehouse → Distributor → Retailer → Customer)

### The Three Major Flows

A supply chain isn't just about moving goods — money and information flow through it too:

**1. Physical Flow**
- The actual movement of goods: raw materials → factory → warehouse → store → consumer
- Direction: typically upstream to downstream (though returns go the other way)

**2. Information Flow**
- The transfer of orders, forecasts, inventory levels, delivery commitments, and other data
- Direction: bidirectional (downstream demand signals travel upstream; upstream supply signals travel downstream)
- **This is the most critical flow in modern supply chains** — the quality of information flow determines the efficiency of the other two flows

**3. Financial Flow**
- The movement of money through payments, letters of credit, invoices, etc.
- Direction: typically downstream to upstream (consumers pay retailers, retailers pay distributors…)

> 💡 **Practical Insight:** The root cause of most supply chain problems is "broken information flow." If every tier could see actual consumer demand in real time, many inventory and lead time issues could be avoided.

### Push vs. Pull Supply Chains

| | Push | Pull |
|--|------|------|
| Driven by | Forecast | Actual Demand |
| Production approach | Make-to-Stock | Make-to-Order |
| Advantages | Economies of scale, fast delivery | Low inventory, less waste |
| Disadvantages | Risk of overproduction | Longer lead times |
| Example | Traditional apparel brands | Dell custom-configured PCs |

**Decoupling Point:** In practice, most companies use a Push-Pull hybrid strategy. Before the decoupling point, Push is used to stock materials (capturing economies of scale); after it, Pull is used to respond to demand (reducing waste).

> **ZARA Case Study:** Fabric is procured in advance (Push), but garment design and production are driven by in-store sales data (Pull). From design to shelf takes just 2–3 weeks, and inventory turnover is twice the industry average.

---

## 54-2: Key Supply Chain Concepts

### Lead Time

**Definition:** The total time from when an order is triggered to when delivery is complete.

Lead Time = Procurement LT + Manufacturing LT + Delivery LT

- **Procurement Lead Time:** From placing the purchase order to raw materials arriving at the factory
- **Manufacturing Lead Time:** From the start of production to finished goods completion
- **Delivery Lead Time:** From leaving the factory to the customer receiving the goods

> **Ways to shorten Lead Time:** Hold safety stock, process steps in parallel, address bottlenecks, position warehouses closer to customers

### Bottleneck

**Definition:** The step in a system with the lowest capacity — it determines the maximum output of the entire system.

**How to identify a bottleneck:**
1. Find the step with the lowest capacity
2. Look for the step with the highest utilization rate (near 100% = already maxed out)
3. Look for the step with the most WIP (Work-In-Progress) piling up in front of it

> **Theory of Constraints (TOC):** System throughput = bottleneck capacity. Improving non-bottleneck steps does not increase overall output. Always improve the bottleneck first.

### Bullwhip Effect

**Definition:** Small fluctuations in demand are amplified at each tier as you move upstream in the supply chain. A 10% change in consumer demand can translate to an 80% swing at the manufacturer level.

**Four root causes:**
1. **Demand Signal Processing** — Each tier makes its own forecast and adds a safety buffer
2. **Order Batching** — Ordering in bulk amplifies fluctuations
3. **Price Fluctuation** — Promotions trigger stockpiling
4. **Shortage Gaming** — Over-ordering during periods of scarcity

**Countermeasures (by priority):**
1. Share real consumer data (POS Data Sharing)
2. Shorten Lead Time
3. Reduce batch ordering
4. Stabilize pricing strategy

> 🆕 **2025 Trend:** Companies are using AI Control Towers to integrate real-time POS data, social media signals, weather data, and other external inputs for Demand Sensing — significantly dampening the Bullwhip Effect.

---

## 54-3: Supply Chain Performance Metrics

### Service Level & Fill Rate

| Metric | Formula | Purpose |
|--------|---------|---------|
| **Order Fill Rate** | Orders delivered complete / Total orders | Measures customer experience (strict) |
| **Line Fill Rate** | Line items delivered / Total line items ordered | Identifies improvement areas (more lenient) |
| **OTIF** | Orders that are both on-time and in-full / Total orders | The gold standard in logistics (strictest) |

> Walmart requires suppliers to meet 98% OTIF; falling short incurs a penalty of 3% of COGS.

### Total Cost of Ownership (TCO)

Procurement decisions can't be made on unit price alone! TCO includes:

\\`\\`\\`
TCO = Purchase Price
    + Logistics Costs (freight, tariffs)
    + Quality Costs (returns, rework)
    + Inventory Holding Costs (warehousing, tied-up capital)
    + Administrative Costs (communication, inspection, auditing)
    + Risk Costs (unreliable lead times, emergency air freight)
\\`\\`\\`

> Research shows that purchase price typically represents only 50–70% of TCO, with hidden costs accounting for 30–50%.

### Supply Chain Problem-Analysis Framework

When facing a complex supply chain problem, use this framework:

1. **Identify** — Which links in the chain are affected?
2. **Classify** — Root cause vs. symptom? Internal vs. external?
3. **Countermeasures** — Short-term fix / Medium-term improvement / Long-term strategy
4. **Trade-offs** — What are the costs and consequences of each option?

> 🆕 **2024–2026 Reality:** The Red Sea crisis, geopolitical tensions, and extreme weather events have made **Resilience** the most important keyword in supply chain. It's not about avoiding risk — it's about recovering quickly.

"""

    static let zhWorld55: String = """

# World 55：需求預測與庫存管理

> **目標：** 學會預測需求、計算安全庫存、掌握 EOQ 等庫存決策模型
> **適用場景：** Demand Planning、Inventory Management、供應鏈分析面試
> **預估學習時間：** 4-5 小時

---

## 55-1：需求預測基礎

### 預測方法分類

| 類別 | 方法 | 適用場景 | 代表方法 |
|------|------|----------|----------|
| **Quantitative（量化）** | 基於歷史數據 | 成熟產品、穩定需求 | Moving Average、Exponential Smoothing、ARIMA |
| **Qualitative（質化）** | 基於人的判斷 | 新產品、缺乏歷史數據 | Expert Opinion、Delphi Method、Market Research |
| **Causal（因果）** | 基於因果關係 | 需求受外部因素影響 | Regression Analysis |

> **選擇原則：** 有歷史數據 → Quantitative；沒數據 → Qualitative；兩者結合 = Consensus Forecasting（最佳實踐）

### Simple Moving Average（SMA）

SMA(N) = 最近 N 期數據的平均值

- **N 大** → 更穩定但更滯後（適合穩定需求）
- **N 小** → 更敏感但更波動（適合變動需求）

> **進階版本：** Weighted Moving Average（近期權重高）→ Exponential Smoothing（自動調整權重，用 α 參數控制）

### 預測準確度指標

| 指標 | 公式 | 用途 |
|------|------|------|
| **MAE** | Σ\\\\|預測-實際\\\\| / n | 絕對誤差平均，直觀 |
| **MAPE** | Σ(\\\\|預測-實際\\\\|/實際) / n × 100% | 百分比誤差，可跨品比較 |
| **Bias** | Σ(預測-實際) / n | 看偏差方向（正=高估，負=低估） |

> 🆕 **2025 趨勢：** Forecast Value Added (FVA) — 衡量每一步預測調整是否真的改善了準確度。AI Demand Sensing 結合 POS、社群、天氣等外部訊號做短期預測。

---

## 55-2：庫存控制模型

### Safety Stock（安全庫存）

**為什麼需要 Safety Stock？** 因為需求和交期都有波動。只備「平均需求 × 平均交期」的庫存，一旦需求突增或交期延遲就缺貨。

**公式概念：**
\\`\\`\\`
Safety Stock = Z × σd × √LT

Z = 服務水準對應的 Z 值（90%→1.28, 95%→1.65, 99%→2.33）
σd = 需求的標準差
LT = Lead Time
\\`\\`\\`

**Reorder Point（再訂購點）：**
\\`\\`\\`
ROP = (Average Daily Demand × Lead Time) + Safety Stock
\\`\\`\\`

### EOQ（經濟訂購量）

**核心問題：** 每次該訂多少？訂太多 → 庫存成本高；訂太少 → 訂購成本高。

**公式：**
\\`\\`\\`
EOQ = √(2DS/H)

D = 年需求量
S = 每次訂購成本（下單、驗貨、入庫的固定成本）
H = 每件每年庫存持有成本
\\`\\`\\`

> 在 EOQ 點，Ordering Cost = Holding Cost，總成本最低。

### ABC-XYZ 分析

**ABC（按價值分類）：**
- A 類：前 20% SKU，佔營收 80%（嚴格管控）
- B 類：中間 30%，佔營收 15%（中等管控）
- C 類：後 50%，佔營收 5%（簡化管理）

**XYZ（按波動性分類）：**
- X：需求穩定（CV < 0.5）
- Y：中等波動（0.5 < CV < 1.0）
- Z：高度波動（CV > 1.0）

> **組合策略：** AX = 高價值穩定 → 精確預測、JIT。CZ = 低價值高波動 → 較高安全庫存或轉為接單生產。

---

## 55-3：庫存策略與平衡

### Inventory Turnover（庫存周轉率）

\\`\\`\\`
Inventory Turnover = COGS / Average Inventory
Days of Inventory (DOI) = 365 / Turnover
\\`\\`\\`

- 高周轉 = 資金效率高、倉儲成本低
- 低周轉 = 可能有滯銷品或過度備貨
- **注意：** 跨產業比較無意義（超市 Turnover 10+ vs 家具店 2-3）

### Newsvendor Model（報童模型）

處理「一次性決策」的庫存問題（如季節性商品）：

\\`\\`\\`
Critical Ratio = Cu / (Cu + Co)

Cu = 缺貨成本（Underage Cost）= 利潤損失 + 客戶流失
Co = 滯銷成本（Overage Cost）= 降價虧損 + 處分成本
\\`\\`\\`

**決策規則：** 備貨量讓需求累積機率 ≥ Critical Ratio。

> **缺貨成本 > 滯銷成本 → 偏向多備；反之偏向少備。**

### 庫存改善優先級

1. **先修根因** — 更新安全庫存參數（很多公司幾年沒更新）
2. **救 A 類** — 高價值品項缺貨對營收衝擊最大
3. **清死庫存** — 釋放倉庫空間和資金
4. **優化策略** — 差異化管理（ABC-XYZ）

"""

    static let enWorld55: String = """

# World 55: Demand Forecasting & Inventory Management

> **Objective:** Learn to forecast demand, calculate safety stock, and master inventory decision models such as EOQ
> **Applicable scenarios:** Demand Planning, Inventory Management, supply chain analytics interviews
> **Estimated study time:** 4–5 hours

---

## 55-1: Demand Forecasting Fundamentals

### Forecasting Method Categories

| Category | Approach | When to Use | Representative Methods |
|----------|----------|-------------|------------------------|
| **Quantitative** | Based on historical data | Mature products, stable demand | Moving Average, Exponential Smoothing, ARIMA |
| **Qualitative** | Based on human judgment | New products, limited historical data | Expert Opinion, Delphi Method, Market Research |
| **Causal** | Based on cause-and-effect relationships | Demand driven by external factors | Regression Analysis |

> **Selection principle:** Historical data available → Quantitative; No data → Qualitative; Combining both = Consensus Forecasting (best practice)

### Simple Moving Average (SMA)

SMA(N) = Average of the most recent N periods of data

- **Large N** → More stable but more lagged (suitable for stable demand)
- **Small N** → More sensitive but more volatile (suitable for variable demand)

> **Advanced versions:** Weighted Moving Average (higher weight on recent periods) → Exponential Smoothing (automatically adjusts weights via the α parameter)

### Forecast Accuracy Metrics

| Metric | Formula | Purpose |
|--------|---------|---------|
| **MAE** | Σ\\|Forecast − Actual\\| / n | Average absolute error, intuitive |
| **MAPE** | Σ(\\|Forecast − Actual\\| / Actual) / n × 100% | Percentage error, comparable across SKUs |
| **Bias** | Σ(Forecast − Actual) / n | Shows error direction (positive = overforecast, negative = underforecast) |

> 🆕 **2025 Trend:** Forecast Value Added (FVA) — measures whether each forecasting adjustment step actually improves accuracy. AI Demand Sensing combines POS data, social signals, weather, and other external inputs for short-term forecasting.

---

## 55-2: Inventory Control Models

### Safety Stock

**Why do we need Safety Stock?** Because both demand and lead times fluctuate. Stocking only "average demand × average lead time" means a stockout the moment demand spikes or a delivery is delayed.

**Formula concept:**
\\`\\`\\`
Safety Stock = Z × σd × √LT

Z = Z-score corresponding to the desired service level (90% → 1.28, 95% → 1.65, 99% → 2.33)
σd = Standard deviation of demand
LT = Lead Time
\\`\\`\\`

**Reorder Point (ROP):**
\\`\\`\\`
ROP = (Average Daily Demand × Lead Time) + Safety Stock
\\`\\`\\`

### EOQ (Economic Order Quantity)

**Core question:** How much should you order each time? Order too much → high holding cost; order too little → high ordering cost.

**Formula:**
\\`\\`\\`
EOQ = √(2DS/H)

D = Annual demand
S = Cost per order (fixed costs of placing, receiving, and stocking the order)
H = Annual holding cost per unit
\\`\\`\\`

> At the EOQ point, Ordering Cost = Holding Cost, and total cost is minimized.

### ABC-XYZ Analysis

**ABC (classified by value):**
- Class A: Top 20% of SKUs, accounting for 80% of revenue (tight control)
- Class B: Middle 30%, accounting for 15% of revenue (moderate control)
- Class C: Bottom 50%, accounting for 5% of revenue (simplified management)

**XYZ (classified by demand variability):**
- X: Stable demand (CV < 0.5)
- Y: Moderate variability (0.5 < CV < 1.0)
- Z: Highly variable demand (CV > 1.0)

> **Combined strategy:** AX = high-value, stable → precise forecasting, JIT. CZ = low-value, highly variable → higher safety stock or shift to make-to-order.

---

## 55-3: Inventory Strategy & Trade-offs

### Inventory Turnover

\\`\\`\\`
Inventory Turnover = COGS / Average Inventory
Days of Inventory (DOI) = 365 / Turnover
\\`\\`\\`

- High turnover = efficient use of capital, lower warehousing costs
- Low turnover = possible slow-moving items or overstocking
- **Note:** Cross-industry comparisons are not meaningful (grocery stores Turnover 10+ vs. furniture stores 2–3)

### Newsvendor Model

Addresses "one-shot" inventory decisions (e.g., seasonal products):

\\`\\`\\`
Critical Ratio = Cu / (Cu + Co)

Cu = Underage Cost = lost profit + lost customers
Co = Overage Cost = markdown losses + disposal costs
\\`\\`\\`

**Decision rule:** Stock up to the quantity where the cumulative probability of demand ≥ Critical Ratio.

> **If stockout cost > overage cost → lean toward stocking more; otherwise lean toward stocking less.**

### Inventory Improvement Priorities

1. **Fix root causes first** — Update safety stock parameters (many companies haven't revisited these in years)
2. **Rescue Class A items** — Stockouts on high-value SKUs have the greatest revenue impact
3. **Clear dead stock** — Free up warehouse space and working capital
4. **Optimize strategy** — Differentiated management using ABC-XYZ

"""

    static let zhWorld56: String = """

# World 56：採購與供應商管理

> **目標：** 從 Sourcing 到供應商評估，掌握現代採購的核心流程與策略
> **適用場景：** Procurement、Supplier Management、供應鏈面試
> **預估學習時間：** 4-5 小時

---

## 56-1：採購流程與文件

### RFI / RFQ / RFP 差異

| 文件 | 全名 | 目的 | 什麼時候用 |
|------|------|------|-----------|
| **RFI** | Request for Information | 了解市場和廠商能力 | 探索階段，不確定要什麼 |
| **RFP** | Request for Proposal | 請廠商提出完整方案 | 複雜服務、需要客製方案 |
| **RFQ** | Request for Quotation | 規格明確，只需報價 | 標準品採購、比價用 |

> **流程：** RFI（探索）→ RFP（提案）→ RFQ（比價）。實務中不一定每次走完三步。

### Sourcing 策略

| 策略 | 優點 | 缺點 | 適用 |
|------|------|------|------|
| **Single Source** | 價格低、關係深 | 風險極高 | 非關鍵品項 |
| **Dual Source** | 平衡成本與風險 | 管理稍複雜 | 關鍵零組件（主流選擇） |
| **Multi Source** | 風險最低 | 管理成本高 | 大宗原料、高風險區域 |

> 🆕 **2025-2026 趨勢：** COVID 後 Dual/Multi Sourcing 成為業界標準。**China+1 策略**（保留中國供應商但培養替代來源）和 **Nearshoring**（靠近消費市場生產）是全球供應鏈重組的主流方向。

### Procure-to-Pay (P2P) 流程

\\`\\`\\`
PR（採購需求）→ Sourcing（選商議價）→ PO（採購訂單）
→ Receipt（收貨驗收）→ 3-Way Match → Payment（付款）
\\`\\`\\`

**Three-Way Match：** PO 內容 + 收貨單 + 發票，三者核對一致才能付款。這是採購內控的關鍵步驟。

---

## 56-2：供應商評估與績效

### Supplier Scorecard（供應商計分卡）

標準維度 **QCD+S：**

| 維度 | 權重（例） | 常用指標 |
|------|-----------|----------|
| **Quality（品質）** | 30% | 不良率、退貨率 |
| **Cost（成本）** | 25% | 單價、TCO |
| **Delivery（交期）** | 25% | On-Time Delivery % |
| **Service（服務）** | 20% | 回應速度、配合度 |

> **進階：** 加入 Risk 和 Sustainability 維度。2025 年趨勢是 AI 自動化 Scoring，整合外部信號動態更新。

### 供應商績效管理流程

\\`\\`\\`
Monitor（監控）→ Alert（警示）→ CAR（矯正行動要求）
→ Review（複查）→ Escalate / Exit（升級或退出）
\\`\\`\\`

**CAR (Corrective Action Request)：** 正式通知供應商問題，要求提出根因分析和改善計畫。

### 2025-2026 採購新趨勢

1. **China+1 / Nearshoring** — 分散地緣風險（墨西哥、越南最熱門）
2. **EU CBAM（碳邊境調整機制）** — 碳排放高的供應商讓你付更多關稅
3. **AI-driven Supplier Risk** — ML 整合新聞、天氣、貿易政策即時評估風險
4. **Everstream Analytics 2026 預測：** 地緣政治碎片化風險 97%，極端天氣 93%

---

## 56-3：採購策略實戰

### Make vs Buy 決策

分析框架：
1. **直接成本比較** — 自製 vs 外包的年成本
2. **品質與交期** — 自製可控 vs 外包依賴
3. **核心能力** — 是公司核心業務嗎？
4. **風險評估** — 依賴外部 vs 投資回收
5. **策略彈性** — 未來擴充或收縮的靈活度

> **經驗法則：** 成本接近時，策略因素（品質、交期、彈性）是決定關鍵。

### BATNA（最佳替代方案）

**BATNA = Best Alternative to Negotiated Agreement**

談判前必須知道：如果談判破裂，你最好的替代方案是什麼？

- **有 BATNA** → 你有底氣，可以設定底線
- **沒 BATNA** → 你沒籌碼，容易被牽著走

> **談判技巧：** (1) 永遠帶 BATNA 上桌 (2) 用數據支持立場 (3) 強調長期合作 (4) 提出 win-win 方案

### ESG 供應鏈合規

2025 年起 **CSRD** 要求企業對整條供應鏈的人權和環保負責（含 Tier 2+）。

**行動步驟：**
1. 建立 Supplier Code of Conduct
2. 將 ESG 條款嵌入合約
3. 定期審計和持續監控
4. 備援方案以防改善失敗

"""

    static let enWorld56: String = """

# World 56: Procurement & Supplier Management

> **Objective:** Master the core processes and strategies of modern procurement, from sourcing to supplier evaluation
> **Applicable Scenarios:** Procurement, Supplier Management, Supply Chain interviews
> **Estimated Study Time:** 4–5 hours

---

## 56-1: Procurement Process & Documents

### RFI / RFQ / RFP Differences

| Document | Full Name | Purpose | When to Use |
|----------|-----------|---------|-------------|
| **RFI** | Request for Information | Understand the market and supplier capabilities | Exploration phase, when requirements are unclear |
| **RFP** | Request for Proposal | Ask suppliers to submit a complete solution proposal | Complex services, customized solutions needed |
| **RFQ** | Request for Quotation | Specs are defined; only pricing is needed | Standard goods procurement, price comparison |

> **Process:** RFI (Explore) → RFP (Propose) → RFQ (Quote). In practice, not every procurement goes through all three steps.

### Sourcing Strategies

| Strategy | Advantages | Disadvantages | Best For |
|----------|-----------|--------------|---------|
| **Single Source** | Lower price, deeper relationship | Extremely high risk | Non-critical items |
| **Dual Source** | Balances cost and risk | Slightly more complex to manage | Critical components (mainstream choice) |
| **Multi Source** | Lowest risk | High management cost | Bulk raw materials, high-risk regions |

> 🆕 **2025–2026 Trends:** Post-COVID, Dual/Multi Sourcing has become the industry standard. The **China+1 Strategy** (keeping Chinese suppliers while developing alternative sources) and **Nearshoring** (producing closer to consumption markets) are the dominant directions of global supply chain restructuring.

### Procure-to-Pay (P2P) Process

\\`\\`\\`
PR (Purchase Requisition) → Sourcing (Vendor Selection & Negotiation) → PO (Purchase Order)
→ Receipt (Goods Receipt & Inspection) → 3-Way Match → Payment
\\`\\`\\`

**Three-Way Match:** PO contents + goods receipt + invoice must all align before payment is released. This is a critical internal control step in procurement.

---

## 56-2: Supplier Evaluation & Performance

### Supplier Scorecard

Standard dimensions **QCD+S:**

| Dimension | Weight (Example) | Common Metrics |
|-----------|-----------------|----------------|
| **Quality** | 30% | Defect rate, return rate |
| **Cost** | 25% | Unit price, TCO |
| **Delivery** | 25% | On-Time Delivery % |
| **Service** | 20% | Response speed, cooperation |

> **Advanced:** Add Risk and Sustainability dimensions. The 2025 trend is AI-automated scoring that integrates external signals for dynamic updates.

### Supplier Performance Management Process

\\`\\`\\`
Monitor → Alert → CAR (Corrective Action Request)
→ Review → Escalate / Exit
\\`\\`\\`

**CAR (Corrective Action Request):** A formal notice to the supplier identifying the issue and requiring a root cause analysis and improvement plan.

### 2025–2026 Procurement Trends

1. **China+1 / Nearshoring** — Diversifying geopolitical risk (Mexico and Vietnam are the most popular alternatives)
2. **EU CBAM (Carbon Border Adjustment Mechanism)** — Higher-carbon suppliers result in higher tariff costs for buyers
3. **AI-driven Supplier Risk** — ML integrates news, weather, and trade policy data for real-time risk assessment
4. **Everstream Analytics 2026 Forecast:** Geopolitical fragmentation risk at 97%, extreme weather at 93%

---

## 56-3: Procurement Strategy in Practice

### Make vs. Buy Decision

Analysis framework:
1. **Direct Cost Comparison** — Annual cost of in-house production vs. outsourcing
2. **Quality & Lead Time** — In-house provides control; outsourcing creates dependency
3. **Core Competency** — Is this a core business function?
4. **Risk Assessment** — External dependency vs. return on investment
5. **Strategic Flexibility** — Ability to scale up or down in the future

> **Rule of Thumb:** When costs are similar, strategic factors (quality, lead time, flexibility) become the deciding factors.

### BATNA (Best Alternative to a Negotiated Agreement)

**BATNA = Best Alternative to Negotiated Agreement**

Before entering any negotiation, you must know: if talks break down, what is your best alternative?

- **Have a BATNA** → You have leverage and can set a firm bottom line
- **No BATNA** → You have no bargaining power and risk being led by the other party

> **Negotiation Tips:** (1) Always come to the table with a BATNA (2) Support your position with data (3) Emphasize long-term partnership (4) Propose win-win solutions

### ESG Supply Chain Compliance

Starting in 2025, **CSRD** requires companies to be accountable for human rights and environmental practices across their entire supply chain (including Tier 2+).

**Action Steps:**
1. Establish a Supplier Code of Conduct
2. Embed ESG clauses into contracts
3. Conduct regular audits and ongoing monitoring
4. Develop contingency plans in case improvement efforts fail

"""

    static let zhWorld57: String = """

# World 57：物流與倉儲

> **目標：** 運輸模式選擇、倉儲作業流程、最後一哩配送與倉庫自動化
> **適用場景：** Logistics、Warehouse Management、物流面試
> **預估學習時間：** 4-5 小時

---

## 57-1：運輸模式與物流

### 四大運輸模式

| 模式 | 速度 | 成本 | 適用 | 特點 |
|------|------|------|------|------|
| **Air（空運）** | 最快 | 最貴 | 高值急件、輕量 | 價值/重量比高的貨物 |
| **Ocean（海運）** | 最慢 | 最便宜 | 大宗、不急 | 國際貿易主力 |
| **Rail（鐵路）** | 中等 | 中等 | 大宗、中長距離 | 陸運效率高 |
| **Road（公路）** | 靈活 | 中等 | 門到門、短中距離 | 最後一哩必備 |

> **Intermodal（多式聯運）：** 結合多種運輸模式的優勢，如海運+鐵路+公路。

### Incoterms（國際貿易條件）

定義買賣雙方的風險和成本分界點：

| 條件 | 風險轉移點 | 賣方負責到 |
|------|-----------|-----------|
| **EXW** | 工廠 | 最少（買方幾乎全包） |
| **FOB** | 裝上船 | 出口清關 + 送上船 |
| **CIF** | 目的港 | 出口清關 + 海運 + 保險 |
| **DDP** | 買方門口 | 最多（賣方全包） |

> **實務選擇：** 你有好的國際物流商 → FOB 可能較省。不熟悉出口國物流 → CIF 讓供應商處理。

### 物流核心 KPI

| KPI | 定義 | 目標範例 |
|-----|------|---------|
| **OTIF** | 同時準時且完整交付 | ≥ 95-98% |
| **Order Accuracy** | 訂單正確率 | ≥ 99% |
| **Freight Cost/Unit** | 單位運費 | 持續降低 |
| **Damage Rate** | 貨物破損率 | < 0.5% |

> **OTIF 是物流之王——** 「準時把對的東西完整送到」是物流的核心使命。Walmart 等大零售商要求 98%，未達標直接罰款。

---

## 57-2：倉儲作業與自動化

### 倉庫五大作業流程

\\`\\`\\`
Receiving（收貨）→ Put-away（上架）→ Picking（揀貨）
→ Packing（包裝）→ Shipping（出貨）
\\`\\`\\`

**Picking 佔倉庫 55% 的人力成本**，主因是行走距離（佔揀貨時間 60%）。

### 揀貨策略

| 策略 | 做法 | 適用 |
|------|------|------|
| **Discrete** | 一張訂單揀完再揀下一張 | 訂單少、品項多 |
| **Batch** | 合併多單同時揀 | 訂單多、SKU 重疊高 |
| **Zone** | 分區揀貨，各區專人 | 大倉庫 |
| **Wave** | 按時段批次處理 | 有配送窗口 |
| **Goods-to-Person** | 貨架送到揀貨員面前 | AMR 自動化倉庫 |

### 2026 倉庫自動化趨勢

1. **AMR（自主移動機器人）** — 成長最快，不需改造倉庫，彈性擴充
2. **Goods-to-Person** — 取代傳統 Person-to-Goods，消除走路時間
3. **Cobot（協作機器人）** — 與人類並肩作業
4. **AI 視覺辨識** — 提升分揀準確度

> 全球倉庫自動化市場預計 2034 年達 **$907 億**（年複合成長率 15.1%）。驅動力：勞動力短缺 + 電商增長 + 次日達期望。

### 最後一哩配送

**最後一哩佔物流成本 53%**（Capgemini 研究），是最大的成本挑戰。

**三大策略：**
1. **Micro-Fulfillment Center / Dark Store** — 靠近消費者的小型倉庫
2. **AI 路線規劃** — 優化配送順序，減少空跑
3. **自提點 / 智能櫃** — 解決「人不在家」問題（配送失敗率從 12% 降到近 0%）

---

## 57-3：物流實戰與 OTIF

### OTIF 計算

\\`\\`\\`
OTIF = 同時準時且完整的訂單數 / 總訂單數
\\`\\`\\`

> **注意：** 準時但數量不足 ≠ 達標。數量足但遲到 ≠ 達標。兩個條件必須**同時**滿足。

### 逆向物流（Reverse Logistics）

退貨處理成本是正向物流的 **2-3 倍**。

**最佳策略：預防 > 處理**
- 40% 退貨因尺寸不合 → AI 尺寸推薦
- 25% 因圖片不符 → 360° 實拍、AR 試穿
- 20% 因商品損壞 → 改善包裝
- 15% 改變心意 → 較難預防

> 65% 的退貨可在源頭預防（改善產品資訊）。

### 物流網絡優化

決策因素：
1. 客戶分佈和交期需求
2. 倉庫位置成本（地價、人力、稅務）
3. 運輸成本和覆蓋範圍
4. 服務水準要求

> **工具：** Center of Gravity Model（重心法）找最佳倉庫位置。新市場策略：先用 3PL 測試 → 驗證需求 → 再自建。

"""

    static let enWorld57: String = """

# World 57: Logistics & Warehousing

> **Objectives:** Transportation mode selection, warehouse operations, last-mile delivery, and warehouse automation
> **Applicable scenarios:** Logistics, Warehouse Management, logistics interviews
> **Estimated study time:** 4–5 hours

---

## 57-1: Transportation Modes & Logistics

### The Four Major Transportation Modes

| Mode | Speed | Cost | Best For | Key Characteristics |
|------|-------|------|----------|---------------------|
| **Air** | Fastest | Most expensive | High-value urgent shipments, lightweight goods | High value-to-weight ratio cargo |
| **Ocean** | Slowest | Cheapest | Bulk goods, non-urgent shipments | Backbone of international trade |
| **Rail** | Medium | Medium | Bulk goods, medium-to-long distances | High efficiency for overland transport |
| **Road** | Flexible | Medium | Door-to-door, short-to-medium distances | Essential for last-mile delivery |

> **Intermodal:** Combines the advantages of multiple transportation modes, e.g., ocean + rail + road.

### Incoterms (International Commercial Terms)

Define the risk and cost transfer points between buyer and seller:

| Term | Risk Transfer Point | Seller Responsible Up To |
|------|---------------------|--------------------------|
| **EXW** | Factory/Ex-works | Minimum (buyer handles almost everything) |
| **FOB** | Loaded on vessel | Export customs clearance + loading onto ship |
| **CIF** | Destination port | Export customs clearance + ocean freight + insurance |
| **DDP** | Buyer's door | Maximum (seller handles everything) |

> **Practical guidance:** If you have a strong international freight forwarder → FOB may be more cost-effective. If unfamiliar with the exporting country's logistics → CIF lets the supplier handle it.

### Core Logistics KPIs

| KPI | Definition | Target Example |
|-----|------------|----------------|
| **OTIF** | On-Time In-Full delivery | ≥ 95–98% |
| **Order Accuracy** | Percentage of orders fulfilled correctly | ≥ 99% |
| **Freight Cost/Unit** | Shipping cost per unit | Continuously decreasing |
| **Damage Rate** | Rate of goods damaged in transit | < 0.5% |

> **OTIF is the king of logistics —** "Delivering the right things on time and in full" is the core mission of logistics. Major retailers like Walmart require 98% OTIF and impose direct penalties for falling short.

---

## 57-2: Warehouse Operations & Automation

### The Five Core Warehouse Processes

\\`\\`\\`
Receiving → Put-away → Picking → Packing → Shipping
\\`\\`\\`

**Picking accounts for 55% of warehouse labor costs**, primarily because of travel distance (which takes up 60% of picking time).

### Picking Strategies

| Strategy | Approach | Best For |
|----------|----------|----------|
| **Discrete** | Complete one order fully before starting the next | Few orders, many SKUs per order |
| **Batch** | Consolidate multiple orders and pick simultaneously | Many orders with high SKU overlap |
| **Zone** | Divide warehouse into zones, each with dedicated staff | Large warehouses |
| **Wave** | Process orders in scheduled time-window batches | Operations with fixed delivery windows |
| **Goods-to-Person** | Shelves are brought to the picker | AMR-automated warehouses |

### 2026 Warehouse Automation Trends

1. **AMR (Autonomous Mobile Robots)** — Fastest-growing segment; requires no warehouse retrofit and scales flexibly
2. **Goods-to-Person** — Replaces traditional Person-to-Goods workflows, eliminating walking time
3. **Cobots (Collaborative Robots)** — Work side-by-side with human workers
4. **AI Vision Recognition** — Improves sorting accuracy

> The global warehouse automation market is projected to reach **$90.7 billion by 2034** (CAGR of 15.1%). Key drivers: labor shortages + e-commerce growth + next-day delivery expectations.

### Last-Mile Delivery

**Last-mile delivery accounts for 53% of logistics costs** (Capgemini research) and is the single largest cost challenge.

**Three Key Strategies:**
1. **Micro-Fulfillment Center / Dark Store** — Small warehouses located close to consumers
2. **AI Route Optimization** — Optimizes delivery sequences to reduce empty runs
3. **Self-pickup Points / Smart Lockers** — Solves the "no one home" problem (failed delivery rate drops from 12% to near 0%)

---

## 57-3: Logistics in Practice & OTIF

### OTIF Calculation

\\`\\`\\`
OTIF = Number of orders that are both on-time AND in-full / Total number of orders
\\`\\`\\`

> **Note:** On-time but short-shipped ≠ meets standard. In-full but late ≠ meets standard. Both conditions must be satisfied **simultaneously**.

### Reverse Logistics

The cost of processing returns is **2–3× higher** than forward logistics.

**Best strategy: Prevention > Remediation**
- 40% of returns due to wrong size → AI size recommendation
- 25% due to product appearance mismatch → 360° product photography, AR try-on
- 20% due to damaged goods → Improved packaging
- 15% due to change of mind → Difficult to prevent

> 65% of returns can be prevented at the source (by improving product information).

### Logistics Network Optimization

Key decision factors:
1. Customer distribution and lead-time requirements
2. Warehouse location costs (land, labor, taxes)
3. Transportation costs and coverage area
4. Service level requirements

> **Tool:** Center of Gravity Model to find the optimal warehouse location. New market strategy: start with a 3PL to test the market → validate demand → then build in-house infrastructure.

"""

    static let zhWorld58: String = """

# World 58：ERP 與系統流程

> **目標：** 了解 ERP、WMS、TMS、MRP 等企業系統如何支撐供應鏈運作
> **適用場景：** Business IT、ERP 導入、系統流程面試
> **預估學習時間：** 4-5 小時

---

## 58-1：ERP 基礎與模組

### 什麼是 ERP？

**ERP (Enterprise Resource Planning)** 的核心是「一個資料庫，多個模組」。所有部門在同一個系統上操作，數據即時同步。

**核心價值 = Single Source of Truth**

| 模組 | 縮寫 | 功能 |
|------|------|------|
| Financial Accounting | FI | 總帳、應收/應付帳款 |
| Controlling | CO | 成本中心、利潤中心 |
| Materials Management | MM | 採購、庫存管理 |
| Sales & Distribution | SD | 訂單、出貨、開票 |
| Production Planning | PP | 生產計劃、MRP |
| Warehouse Management | WM | 倉庫作業管理 |

> **主流 ERP：** SAP S/4HANA（大型企業首選）、Oracle ERP Cloud、Microsoft Dynamics 365、NetSuite（中小企業）

### Master Data（主檔資料）

Master Data 是 ERP 的地基。**GIGO — Garbage In, Garbage Out。**

| 類型 | 內容 | 影響 |
|------|------|------|
| **Material Master** | 品號、描述、單位、倉位 | 所有庫存和採購交易 |
| **Customer Master** | 名稱、地址、付款條件 | 所有銷售訂單 |
| **Vendor Master** | 供應商資訊、採購條件 | 所有採購訂單 |
| **BOM** | 產品的材料清單 | MRP 計算 |
| **Routing** | 生產步驟和工時 | 生產排程和成本 |

> **統計：** 60% 的 ERP 導入問題來自 Master Data 品質不佳。Data Governance（數據治理）是長期工作。

### MRP（物料需求規劃）

MRP 是製造業的核心計劃引擎。

**MRP 邏輯：**
\\`\\`\\`
1. MPS（主生產排程）決定要生產什麼
2. BOM Explosion 展開物料需求（毛需求）
3. 扣除現有庫存和在途量（淨需求）
4. 根據 Lead Time 倒推下單時間（計劃訂單）
\\`\\`\\`

**公式：** 淨需求 = 毛需求 - 現有庫存 - 在途量

> **關鍵：** MRP 不只算「要買多少」，還算「什麼時候要下單」——根據 Lead Time 倒推。

---

## 58-2：供應鏈系統生態

### 系統架構

\\`\\`\\`
ERP（核心骨幹）
├── WMS（倉庫管理系統）— 儲位、揀貨、庫存追蹤
├── TMS（運輸管理系統）— 路線規劃、承運商、運費
├── MES（製造執行系統）— 生產即時監控
└── SCP（供應鏈計劃）— 需求計劃、供應計劃
\\`\\`\\`

| 系統 | 管什麼 | 主流產品 |
|------|--------|----------|
| **WMS** | 倉庫內部作業 | Manhattan, Blue Yonder, SAP EWM |
| **TMS** | 出了倉庫的運輸 | Oracle TMS, SAP TM, project44 |
| **MES** | 工廠生產執行 | Siemens, Rockwell |

### Order-to-Cash (O2C)

銷售端的端到端流程：

\\`\\`\\`
Sales Order → Credit Check → Pick/Pack/Ship → Invoice → Payment
\\`\\`\\`

**關鍵控制點：**
- **Credit Check：** 信用額度不足 → Credit Block → 人工審批
- **ATP Check：** 可用量承諾（Available-to-Promise）
- **Three-Way Match：** PO + Receipt + Invoice 三者核對

> 在 SAP 中：VA01(建單) → VL01N(出貨) → VF01(開票) → F-28(收款)

### ERP 導入成功要素

**三 P 法則：People > Process > Platform**

| 要素 | 重要性 | 常見問題 |
|------|--------|----------|
| **People** | 最高 | 使用者抗拒、培訓不足 |
| **Process** | 高 | 流程沒有重新設計 |
| **Platform** | 中 | 過度客製化 |

> **統計：** ERP 導入失敗 70% 的原因是 Change Management 不足——不是技術問題，是人的問題。

**最佳實踐：**
1. 充分的使用者培訓（教操作也教「為什麼」）
2. Key User 制度（每個部門的種子使用者）
3. 管理層支持和帶頭使用
4. 快速回應使用者問題
5. 定期 Health Check 和持續改善

> SAP 名言：「SAP is not an IT project, it's a business transformation.」

"""

    static let enWorld58: String = """

# World 58: ERP & System Processes

> **Goal:** Understand how enterprise systems such as ERP, WMS, TMS, and MRP support supply chain operations
> **Applicable Scenarios:** Business IT, ERP implementation, system process interviews
> **Estimated Study Time:** 4–5 hours

---

## 58-1: ERP Fundamentals & Modules

### What is ERP?

The core idea of **ERP (Enterprise Resource Planning)** is "one database, many modules." All departments operate on the same system, with data synchronized in real time.

**Core Value = Single Source of Truth**

| Module | Abbreviation | Function |
|--------|--------------|----------|
| Financial Accounting | FI | General ledger, accounts receivable/payable |
| Controlling | CO | Cost centers, profit centers |
| Materials Management | MM | Procurement, inventory management |
| Sales & Distribution | SD | Orders, shipping, invoicing |
| Production Planning | PP | Production planning, MRP |
| Warehouse Management | WM | Warehouse operations management |

> **Leading ERP Systems:** SAP S/4HANA (preferred for large enterprises), Oracle ERP Cloud, Microsoft Dynamics 365, NetSuite (for SMEs)

### Master Data

Master Data is the foundation of ERP. **GIGO — Garbage In, Garbage Out.**

| Type | Content | Impact |
|------|---------|--------|
| **Material Master** | Item number, description, unit of measure, storage location | All inventory and procurement transactions |
| **Customer Master** | Name, address, payment terms | All sales orders |
| **Vendor Master** | Supplier information, purchasing conditions | All purchase orders |
| **BOM** | Bill of materials for a product | MRP calculation |
| **Routing** | Production steps and labor time | Production scheduling and costing |

> **Statistic:** 60% of ERP implementation issues stem from poor Master Data quality. Data Governance is an ongoing, long-term effort.

### MRP (Material Requirements Planning)

MRP is the core planning engine for manufacturing.

**MRP Logic:**
\\`\\`\\`
1. MPS (Master Production Schedule) determines what to produce
2. BOM Explosion breaks down material requirements (gross requirements)
3. Deduct on-hand inventory and in-transit quantities (net requirements)
4. Back-calculate order timing based on Lead Time (planned orders)
\\`\\`\\`

**Formula:** Net Requirements = Gross Requirements − On-Hand Inventory − In-Transit Quantity

> **Key Point:** MRP doesn't just calculate "how much to buy" — it also calculates "when to place the order" by back-scheduling from the Lead Time.

---

## 58-2: The Supply Chain Systems Ecosystem

### System Architecture

\\`\\`\\`
ERP (Core Backbone)
├── WMS (Warehouse Management System) — storage locations, picking, inventory tracking
├── TMS (Transportation Management System) — route planning, carriers, freight costs
├── MES (Manufacturing Execution System) — real-time production monitoring
└── SCP (Supply Chain Planning) — demand planning, supply planning
\\`\\`\\`

| System | Manages | Leading Products |
|--------|---------|-----------------|
| **WMS** | Internal warehouse operations | Manhattan, Blue Yonder, SAP EWM |
| **TMS** | Transportation outside the warehouse | Oracle TMS, SAP TM, project44 |
| **MES** | Factory production execution | Siemens, Rockwell |

### Order-to-Cash (O2C)

The end-to-end process on the sales side:

\\`\\`\\`
Sales Order → Credit Check → Pick/Pack/Ship → Invoice → Payment
\\`\\`\\`

**Key Control Points:**
- **Credit Check:** Insufficient credit limit → Credit Block → Manual approval required
- **ATP Check:** Available-to-Promise commitment
- **Three-Way Match:** Cross-checking PO + Receipt + Invoice

> In SAP: VA01 (create order) → VL01N (outbound delivery) → VF01 (billing) → F-28 (payment receipt)

### Keys to a Successful ERP Implementation

**The Three-P Rule: People > Process > Platform**

| Factor | Importance | Common Issues |
|--------|------------|---------------|
| **People** | Highest | User resistance, insufficient training |
| **Process** | High | Processes not redesigned |
| **Platform** | Medium | Excessive customization |

> **Statistic:** 70% of ERP implementation failures are caused by inadequate Change Management — it's not a technology problem, it's a people problem.

**Best Practices:**
1. Thorough user training (teach both the "how" and the "why")
2. Key User program (seed users in each department)
3. Management sponsorship and leading by example
4. Fast response to user issues
5. Regular Health Checks and continuous improvement

> SAP adage: "SAP is not an IT project, it's a business transformation."

"""

    static let zhWorld59: String = """

# World 59：供應鏈數據分析

> **目標：** 用數據驅動供應鏈決策：KPI Dashboard、分析方法、AI 應用
> **適用場景：** Supply Chain Analyst、BI Dashboard 設計、數據面試
> **預估學習時間：** 4-5 小時

---

## 59-1：供應鏈 KPI 與 Dashboard

### SCOR 模型

**SCOR (Supply Chain Operations Reference)** 是全球最廣泛使用的供應鏈績效框架，分五大流程：

| 流程 | 代表 KPI | 說明 |
|------|----------|------|
| **Plan** | Forecast Accuracy | 預測準確度 |
| **Source** | Supplier OTD | 供應商準時交付 |
| **Make** | Yield Rate | 生產良率 |
| **Deliver** | OTIF | 準時完整交付 |
| **Return** | Return Rate | 退貨率 |

**頂層指標：**
- Perfect Order Rate（完美訂單率）
- Cash-to-Cash Cycle Time（現金循環天數）
- Supply Chain Cost as % of Revenue

### Dashboard 設計原則

**分層設計（Information Architecture）：**

| 層級 | 對象 | KPI 數量 | 內容 |
|------|------|---------|------|
| **Executive** | 高管 | 5-7 個 | 紅黃綠燈 + 趨勢 |
| **Operational** | 經理 | 10-15 個 | Drill-down 細節 |
| **Tactical** | 分析師 | 按需 | 完整數據探索 |

**設計要訣：**
1. **趨勢 > 數字** — 「在變好還是變差」比「現在是多少」更重要
2. **紅黃綠分級** — 紅=需立即行動、黃=需注意、綠=正常
3. **Context** — 加入 Target 和 Benchmark 做比較
4. **5-7 Rule** — 每層不超過 7 個 KPI

> **工具：** Power BI、Tableau 是最主流的 Dashboard 工具。

### 數據驅動決策

數據驅動不是「只看數據」，而是「以數據為基礎做判斷」：

\\`\\`\\`
1. 收集量化數據（歷史、趨勢、外部信號）
2. 加入質化因素（經驗、市場情報、特殊事件）
3. 做出決策並記錄理由
4. 事後回顧準確度（Forecast Value Added）
\\`\\`\\`

> **Consensus Forecasting：** 用數據當基線，用人的判斷做調整。但調整要有根據，不是拍腦袋。

---

## 59-2：AI 驅動的供應鏈

### AI Control Tower

Supply Chain Control Tower 是 2025-2026 年最熱門的供應鏈技術。

**三大能力：**
1. **Visibility** — 整合 ERP + WMS + TMS + 外部數據的端到端可視性
2. **Predictive** — 預測中斷和影響（如偵測供應商所在地區的地震）
3. **Prescriptive** — 推薦最佳行動方案（改從哪個供應商調貨）

**演進路徑：**
\\`\\`\\`
Reactive（出問題才處理）→ Proactive（預測問題）
→ Predictive（量化影響）→ Autonomous（自動處理）
\\`\\`\\`

> 🆕 **2026 關鍵字：Agentic AI** — 不只推薦，還能自動執行低風險決策（如自動重新路由出貨）。BCG 數據顯示 Agentic AI 2025 年已佔 AI 總價值的 17%，預計 2028 年達 29%。

### Digital Supply Chain Twin

**Digital Twin = 整個供應鏈的虛擬複製品**

可以模擬各種 what-if 情境：
- 如果台灣晶圓廠停工 2 週，影響是什麼？
- 如果把 30% 產能從中國移到越南，成本怎麼變？
- 如果海運費漲 50%，應該調整哪些航線？

**核心價值：風險零成本模擬。** 在虛擬世界測試決策，在真實世界信心十足。

**建構基礎：**
- 統一的數據層（ERP + PLM + 市場情報）
- 語義模型
- 增量式建構（不要追求完美，先做再改）

### 分析師的價值鏈

\\`\\`\\`
Data（收集數據）→ Insight（發現洞察）
→ Recommendation（提出建議）→ Impact Quantification（量化影響）
\\`\\`\\`

> **你的競爭力：** Supply Chain（懂業務）+ Data（會分析）+ IT（懂系統）= 2030 年最搶手的供應鏈人才組合。

"""

    static let enWorld59: String = """

# World 59: Supply Chain Data Analytics

> **Objective:** Use data to drive supply chain decisions: KPI Dashboards, analytical methods, and AI applications
> **Applicable roles:** Supply Chain Analyst, BI Dashboard design, data interviews
> **Estimated study time:** 4–5 hours

---

## 59-1: Supply Chain KPIs & Dashboards

### The SCOR Model

**SCOR (Supply Chain Operations Reference)** is the world's most widely adopted supply chain performance framework, organized around five core processes:

| Process | Key KPI | Description |
|---------|---------|-------------|
| **Plan** | Forecast Accuracy | How accurate demand forecasts are |
| **Source** | Supplier OTD | Supplier on-time delivery |
| **Make** | Yield Rate | Production quality yield |
| **Deliver** | OTIF | On-Time In-Full delivery |
| **Return** | Return Rate | Rate of returned goods |

**Top-level metrics:**
- Perfect Order Rate
- Cash-to-Cash Cycle Time
- Supply Chain Cost as % of Revenue

### Dashboard Design Principles

**Layered design (Information Architecture):**

| Layer | Audience | Number of KPIs | Content |
|-------|----------|----------------|---------|
| **Executive** | Senior leadership | 5–7 | Red/yellow/green status lights + trends |
| **Operational** | Managers | 10–15 | Drill-down details |
| **Tactical** | Analysts | As needed | Full data exploration |

**Design tips:**
1. **Trends > Numbers** — "Is it getting better or worse?" matters more than "What is the current value?"
2. **Red/Yellow/Green tiers** — Red = immediate action required, Yellow = monitor closely, Green = normal
3. **Context** — Always include Targets and Benchmarks for comparison
4. **5-7 Rule** — No more than 7 KPIs per layer

> **Tools:** Power BI and Tableau are the most widely used dashboard platforms.

### Data-Driven Decision Making

Being data-driven does not mean "only looking at data" — it means "making judgments grounded in data":

\\`\\`\\`
1. Gather quantitative data (historical records, trends, external signals)
2. Layer in qualitative factors (experience, market intelligence, special events)
3. Make the decision and document the rationale
4. Review accuracy after the fact (Forecast Value Added)
\\`\\`\\`

> **Consensus Forecasting:** Use data as the baseline and human judgment for adjustments. But every adjustment should be justified — not just a gut feeling.

---

## 59-2: AI-Driven Supply Chains

### AI Control Tower

Supply Chain Control Towers are the hottest supply chain technology of 2025–2026.

**Three core capabilities:**
1. **Visibility** — End-to-end visibility by integrating ERP + WMS + TMS + external data
2. **Predictive** — Anticipate disruptions and their impact (e.g., detecting an earthquake near a supplier's region)
3. **Prescriptive** — Recommend the best course of action (e.g., which alternative supplier to source from)

**Maturity progression:**
\\`\\`\\`
Reactive (respond after problems occur) → Proactive (anticipate problems)
→ Predictive (quantify impact) → Autonomous (act automatically)
\\`\\`\\`

> 🆕 **2026 keyword: Agentic AI** — Goes beyond recommendations to automatically execute low-risk decisions (e.g., auto-rerouting shipments). BCG data shows Agentic AI accounted for 17% of total AI value in 2025, projected to reach 29% by 2028.

### Digital Supply Chain Twin

**Digital Twin = a virtual replica of your entire supply chain**

It enables simulation of a wide range of what-if scenarios:
- If a Taiwan wafer fab goes offline for 2 weeks, what is the impact?
- If we shift 30% of production capacity from China to Vietnam, how do costs change?
- If ocean freight rates rise 50%, which shipping lanes should we adjust?

**Core value: zero-cost risk simulation.** Test decisions in the virtual world, then act in the real world with confidence.

**Foundation requirements:**
- A unified data layer (ERP + PLM + market intelligence)
- Semantic data model
- Incremental build approach (don't pursue perfection — start, then iterate)

### The Analyst Value Chain

\\`\\`\\`
Data (collect data) → Insight (discover findings)
→ Recommendation (propose action) → Impact Quantification (measure the outcome)
\\`\\`\\`

> **Your competitive edge:** Supply Chain (business knowledge) + Data (analytical skills) + IT (systems understanding) = the most in-demand supply chain talent profile heading into 2030.

"""

    static let zhWorld60: String = """

# World 60：流程改善與營運管理

> **目標：** 從 Process Mapping 到 Lean/Six Sigma，學會發現問題、改善流程
> **適用場景：** Operations、Process Improvement、面試「你怎麼改善流程？」
> **預估學習時間：** 4-5 小時

---

## 60-1：流程分析工具

### Process Mapping（流程圖）

改善的第一步：**把流程畫出來。**

畫出每個步驟後，標記三種類型：
- **VA（Value-Added）** — 客戶願意付錢的活動（如：組裝產品）
- **BNVA（Business Non-Value-Added）** — 不加值但必要的（如：品質檢驗）
- **NVA（Non-Value-Added）** — 純浪費（如：等待審批 3 小時）

> **驚人事實：** 典型流程中，實際加值時間通常只佔總時間的 **5-10%**，其餘都是等待、搬運、重工。

**Value Stream Mapping (VSM)：** 進階版流程圖，清楚標示每個步驟的時間、等待時間、庫存量，讓浪費一目了然。

### Root Cause Analysis（根因分析）

#### 5 Whys（五個為什麼）

連問五次「為什麼」，從症狀追到根因：

\\`\\`\\`
問題：出貨錯誤率上升
Why 1：揀貨員拿錯商品 ← 症狀
Why 2：兩款新商品包裝很像
Why 3：設計時沒考慮倉庫辨識需求
Why 4：包裝設計流程沒有倉庫團隊參與
Why 5：公司沒有跨部門設計審查流程 ← 根因！
\\`\\`\\`

> **原則：** 根因通常是流程/系統問題，不是人的問題。「揀貨員不用心」不是根因。

#### Fishbone Diagram（魚骨圖）

從 6 個維度分析可能原因：**Man / Machine / Method / Material / Measurement / Environment**

#### Pareto Chart（帕雷托圖）

用 80/20 法則找出最主要的原因——通常 20% 的原因造成 80% 的問題。

### Lean 七大浪費（TIMWOOD）

| 浪費 | 英文 | 例子 | 消除方法 |
|------|------|------|----------|
| **T** 搬運 | Transport | 多餘的搬運路線 | 改善佈局 |
| **I** 庫存 | Inventory | 堆積未處理的退貨 | JIT、Kanban |
| **M** 動作 | Motion | 揀貨員重複走同路線 | Batch Picking |
| **W** 等待 | Waiting | 等審批 3 小時 | 自動審批規則 |
| **O** 過度生產 | Over-production | 生產超過訂單量 | Pull 系統 |
| **O** 過度加工 | Over-processing | 重複檢查兩次 | 合併檢查點 |
| **D** 瑕疵 | Defects | 不良品需重工 | Poka-Yoke 防錯 |

> 有人加 **S = Skills waste**（人才浪費），變成 **TIMWOODS**。

---

## 60-2：KPI 設計與持續改善

### SMART KPI 設計

好的 KPI 要符合 SMART 原則：

| 字母 | 原則 | 反例 | 正例 |
|------|------|------|------|
| **S** | Specific（具體） | 提升效率 | 訂單處理時間降到 4 小時 |
| **M** | Measurable（可衡量） | 改善品質 | 不良率降到 0.5% 以下 |
| **A** | Achievable（可達成） | 零缺陷 | 從 3% 降到 1% |
| **R** | Relevant（相關） | 追蹤天氣 | 追蹤 OTIF |
| **T** | Time-bound（有期限） | 盡快改善 | Q3 前達成 |

**KPI 六要素：** What（衡量什麼）+ How（怎麼計算）+ Target（目標值）+ When（期限）+ Who（負責人）+ Source（數據來源）

### DMAIC（Six Sigma 改善方法）

\\`\\`\\`
D = Define（定義問題和目標）
M = Measure（收集數據建立 baseline）
A = Analyze（用數據找根因）
I = Improve（實施改善方案）
C = Control（建立監控確保持續）
\\`\\`\\`

> **C（Control）最常被忽略** — 很多專案改善完就沒人追蹤，問題又慢慢回來。用 Control Chart 持續監控。

### Lean Six Sigma 結合

- **Lean：** 消除浪費（做對的事）
- **Six Sigma：** 減少變異（把事做對）
- **結合：** 又快又穩的流程

### 面試萬用框架

面試官問：「你的前 90 天會怎麼做？」

\\`\\`\\`
第 1-30 天（了解和量測）：
- 分解問題的各個組成指標
- 訪談關鍵利害關係人
- 建立 baseline

第 30-60 天（分析和規劃）：
- 用 Pareto 找出 Top 3 根因
- 設計改善方案
- 量化預期 ROI

第 60-90 天（執行快贏）：
- 先做 Quick Wins（低成本高影響）
- 建立 Dashboard 追蹤進度
- 展示 early results 建立信任
\\`\\`\\`

"""

    static let enWorld60: String = """

# World 60: Process Improvement & Operations Management

> **Goal:** From Process Mapping to Lean/Six Sigma — learn to identify problems and improve processes
> **Use cases:** Operations, Process Improvement, interview questions like "How do you improve a process?"
> **Estimated study time:** 4–5 hours

---

## 60-1: Process Analysis Tools

### Process Mapping

The first step to improvement: **map out the process.**

After drawing each step, label it with one of three types:
- **VA (Value-Added)** — activities the customer is willing to pay for (e.g., assembling a product)
- **BNVA (Business Non-Value-Added)** — no added value but necessary (e.g., quality inspection)
- **NVA (Non-Value-Added)** — pure waste (e.g., waiting 3 hours for approval)

> **Surprising fact:** In a typical process, actual value-added time usually accounts for only **5–10%** of total time. The rest is waiting, transport, and rework.

**Value Stream Mapping (VSM):** An advanced version of process mapping that clearly shows the time, wait time, and inventory at each step — making waste immediately visible.

### Root Cause Analysis

#### 5 Whys

Ask "Why?" five times to trace from symptom to root cause:

\\`\\`\\`
Problem: Rising shipment error rate
Why 1: Pickers are grabbing the wrong items ← symptom
Why 2: Two new products have very similar packaging
Why 3: Warehouse identification needs were not considered during design
Why 4: The packaging design process did not include the warehouse team
Why 5: The company has no cross-functional design review process ← root cause!
\\`\\`\\`

> **Principle:** The root cause is usually a process or system issue, not a people issue. "Pickers aren't paying attention" is not a root cause.

#### Fishbone Diagram

Analyze potential causes across 6 dimensions: **Man / Machine / Method / Material / Measurement / Environment**

#### Pareto Chart

Use the 80/20 rule to identify the most significant causes — typically 20% of causes are responsible for 80% of problems.

### The 7 Wastes of Lean (TIMWOOD)

| Waste | Full Name | Example | How to Eliminate |
|-------|-----------|---------|-----------------|
| **T** Transport | Transport | Unnecessary movement routes | Improve layout |
| **I** Inventory | Inventory | Backlog of unprocessed returns | JIT, Kanban |
| **M** Motion | Motion | Pickers repeatedly walking the same route | Batch Picking |
| **W** Waiting | Waiting | Waiting 3 hours for approval | Automated approval rules |
| **O** Over-production | Over-production | Producing more than ordered | Pull system |
| **O** Over-processing | Over-processing | Inspecting twice redundantly | Consolidate checkpoints |
| **D** Defects | Defects | Defective items requiring rework | Poka-Yoke error-proofing |

> Some add **S = Skills waste** (underutilizing talent), making it **TIMWOODS**.

---

## 60-2: KPI Design & Continuous Improvement

### Designing SMART KPIs

Good KPIs should follow the SMART criteria:

| Letter | Principle | Bad Example | Good Example |
|--------|-----------|-------------|--------------|
| **S** | Specific | Improve efficiency | Reduce order processing time to 4 hours |
| **M** | Measurable | Improve quality | Reduce defect rate to below 0.5% |
| **A** | Achievable | Zero defects | Reduce from 3% to 1% |
| **R** | Relevant | Track weather | Track OTIF |
| **T** | Time-bound | Improve as soon as possible | Achieve by Q3 |

**6 Elements of a KPI:** What (what to measure) + How (how to calculate) + Target (goal value) + When (deadline) + Who (owner) + Source (data source)

### DMAIC (Six Sigma Improvement Methodology)

\\`\\`\\`
D = Define   (define the problem and objectives)
M = Measure  (collect data to establish a baseline)
A = Analyze  (use data to identify root causes)
I = Improve  (implement improvement solutions)
C = Control  (establish monitoring to sustain gains)
\\`\\`\\`

> **C (Control) is most often neglected** — many projects complete improvements with no follow-up, and problems gradually creep back. Use a Control Chart to monitor continuously.

### Combining Lean and Six Sigma

- **Lean:** Eliminate waste (do the right things)
- **Six Sigma:** Reduce variation (do things right)
- **Combined:** Processes that are both fast and consistent

### Universal Interview Framework

When an interviewer asks: "What would you do in your first 90 days?"

\\`\\`\\`
Days 1–30 (Understand & Measure):
- Break down the problem into its component metrics
- Interview key stakeholders
- Establish a baseline

Days 30–60 (Analyze & Plan):
- Use Pareto to identify the top 3 root causes
- Design improvement solutions
- Quantify expected ROI

Days 60–90 (Execute Quick Wins):
- Start with Quick Wins (low cost, high impact)
- Build a Dashboard to track progress
- Show early results to build credibility
\\`\\`\\`

"""

    static let zhWorld61: String = """

# World 61：風險管理與永續

> **目標：** 供應鏈風險類型、韌性策略、ESG 合規與永續採購
> **適用場景：** Risk Management、ESG Compliance、供應鏈策略面試
> **預估學習時間：** 4-5 小時

---

## 61-1：供應鏈風險管理

### 風險類型

| 類型 | 例子 | 應對策略 |
|------|------|----------|
| **Natural Disasters** | 地震、颱風、洪水 | 備援地點、安全庫存 |
| **Geopolitical** | 關稅、制裁、戰爭 | 分散採購區域 |
| **Supplier Risk** | 供應商倒閉、品質問題 | Dual Sourcing、定期評估 |
| **Climate Risk** | 極端天氣、水資源短缺 | 替代運輸路線、氣候監控 |
| **Cyber Risk** | 駭客攻擊、勒索軟體 | IT 防護、資料備份 |
| **Demand Risk** | 需求暴漲或暴跌 | 彈性產能、需求感測 |
| **Regulatory Risk** | 法規變更（CSRD、CBAM） | 合規團隊、持續監控 |

> 🆕 **2026 風險等級（Everstream Analytics）：** 地緣政治碎片化 97%、極端天氣 93%。全球供應鏈中斷平均成本：每次 $184M（McKinsey）。

### 風險評估矩陣

\\`\\`\\`
風險優先級 = Probability（機率）× Impact（影響）× Actionability（可行動性）
\\`\\`\\`

| | 影響低 | 影響中 | 影響高 |
|--|--------|--------|--------|
| **機率高** | 監控 | 改善 | 立即行動 |
| **機率中** | 接受 | 監控 | 優先準備 |
| **機率低** | 接受 | 接受 | 備援計畫 |

> **重點：** 不只看機率×影響的分數，還要看你「能做什麼」。有具體行動方案的風險（如 Dual Sourcing）比難以預防的風險（如疫情）更值得投資。

### 韌性策略（Resilience）

**Supply Chain Resilience 框架：**

\\`\\`\\`
Anticipate（預測）→ Prepare（準備）→ Respond（回應）
→ Recover（恢復）→ Learn（學習）
\\`\\`\\`

**四層韌性防護：**
1. **Dual/Multi Sourcing** — 分散供應風險
2. **Control Tower** — 即時可視性和預警
3. **彈性庫存策略** — 關鍵零件增加 SS，非關鍵維持精實
4. **Scenario Planning / Digital Twin** — 模擬極端情境，預先準備

> **Resilience by Design** — 韌性不是意外發生後才想，而是設計進供應鏈架構中。

---

## 61-2：ESG 與永續供應鏈

### ESG 基礎

**ESG = Environmental（環境）+ Social（社會）+ Governance（治理）**

- **E：** 碳排放、能源使用、廢棄物、水資源
- **S：** 勞工權益、工作安全、社區影響
- **G：** 企業透明度、反貪腐、數據隱私

### Scope 1 / 2 / 3 排放

| Scope | 定義 | 佔比 | 可控度 |
|-------|------|------|--------|
| **Scope 1** | 公司直接排放（自有工廠、車輛） | ~10% | 高 |
| **Scope 2** | 間接排放（購買的電力） | ~10-20% | 中 |
| **Scope 3** | 價值鏈排放（供應商、運輸、使用、廢棄） | **70-90%** | 低 |

> **Scope 3 是最大挑戰：** 數據在供應商手上，很多供應商（尤其 Tier 2、3）沒有碳排追蹤能力。

### 2025 年 ESG 法規

| 法規 | 地區 | 要求 |
|------|------|------|
| **CSRD** | 歐盟 | 強制揭露完整 ESG 數據（含 Scope 3） |
| **SEC Climate Disclosure** | 美國 | 上市公司強制氣候揭露 |
| **LkSG** | 德國 | 企業對供應鏈人權負法律責任 |
| **CBAM** | 歐盟 | 碳邊境調整機制（碳關稅） |

**四大 ESG 報告框架：**
- **GRI** — 最廣泛使用
- **SASB** — 產業專屬的財務重大 ESG 因素
- **TCFD** — 聚焦氣候風險和財務影響
- **ISSB** — 新的全球統一標準

### 永續供應鏈實務

**五步框架：**
\\`\\`\\`
Measure（測量碳排基線）→ Integrate（嵌入採購流程）
→ Collaborate（與供應商協同減碳）→ Report（合規報告）
→ Improve（持續改善）
\\`\\`\\`

**Scope 3 策略：**
- 大型供應商 → 要求提供實際碳排數據
- 中小供應商 → 用產業平均值估算
- 所有供應商 → 將碳排要求嵌入 RFQ 和合約

> **重要：** 與供應商「協同」比「施壓」的減碳效果高 3-5 倍。Apple 要求前 200 大供應商 2030 年前碳中和，並提供技術和資金支援。

### 2030 供應鏈願景

三大支柱互相強化：

**1. Intelligent（智慧）**
- Agentic AI 自主處理 80% 常規決策
- Digital Twin 即時模擬
- Control Tower 預測性管理

**2. Resilient（韌性）**
- 多元化供應網絡（Nearshoring + Multi-sourcing）
- 彈性產能、即時可視性
- 風險不是要避免，而是能快速恢復

**3. Sustainable（永續）**
- 碳中和是基線不是目標
- 碳排成為成本的一部分（CBAM）
- 循環經濟（Circular Economy）

> **你的定位：** Supply Chain + Data + IT 的交叉——這是 2030 年供應鏈最需要的人才組合。

"""

    static let enWorld61: String = """

# World 61: Risk Management & Sustainability

> **Goal:** Supply chain risk types, resilience strategies, ESG compliance, and sustainable sourcing
> **Applicable Scenarios:** Risk Management, ESG Compliance, supply chain strategy interviews
> **Estimated Study Time:** 4–5 hours

---

## 61-1: Supply Chain Risk Management

### Risk Types

| Type | Examples | Mitigation Strategy |
|------|----------|---------------------|
| **Natural Disasters** | Earthquakes, typhoons, floods | Backup sites, safety stock |
| **Geopolitical** | Tariffs, sanctions, war | Diversify sourcing regions |
| **Supplier Risk** | Supplier bankruptcy, quality issues | Dual Sourcing, regular assessments |
| **Climate Risk** | Extreme weather, water scarcity | Alternative transport routes, climate monitoring |
| **Cyber Risk** | Hacking, ransomware | IT security, data backups |
| **Demand Risk** | Demand spikes or collapses | Flexible capacity, demand sensing |
| **Regulatory Risk** | Regulatory changes (CSRD, CBAM) | Compliance team, continuous monitoring |

> 🆕 **2026 Risk Ratings (Everstream Analytics):** Geopolitical fragmentation 97%, extreme weather 93%. Average cost of global supply chain disruption: $184M per incident (McKinsey).

### Risk Assessment Matrix

\\`\\`\\`
Risk Priority = Probability × Impact × Actionability
\\`\\`\\`

| | Low Impact | Medium Impact | High Impact |
|--|------------|---------------|-------------|
| **High Probability** | Monitor | Improve | Immediate Action |
| **Medium Probability** | Accept | Monitor | Priority Preparation |
| **Low Probability** | Accept | Accept | Contingency Plan |

> **Key Insight:** Don't just look at the Probability × Impact score — also consider "what can you do about it." Risks with concrete action plans (e.g., Dual Sourcing) are more worth investing in than risks that are hard to prevent (e.g., pandemics).

### Resilience Strategies

**Supply Chain Resilience Framework:**

\\`\\`\\`
Anticipate → Prepare → Respond
→ Recover → Learn
\\`\\`\\`

**Four Layers of Resilience Defense:**
1. **Dual/Multi Sourcing** — Spread supply risk across multiple sources
2. **Control Tower** — Real-time visibility and early warning
3. **Flexible Inventory Strategy** — Increase safety stock for critical parts, keep lean for non-critical
4. **Scenario Planning / Digital Twin** — Simulate extreme scenarios and prepare in advance

> **Resilience by Design** — Resilience is not something you think about after a disruption; it is built into the supply chain architecture from the start.

---

## 61-2: ESG and Sustainable Supply Chains

### ESG Basics

**ESG = Environmental + Social + Governance**

- **E:** Carbon emissions, energy use, waste, water resources
- **S:** Labor rights, workplace safety, community impact
- **G:** Corporate transparency, anti-corruption, data privacy

### Scope 1 / 2 / 3 Emissions

| Scope | Definition | Share | Controllability |
|-------|------------|-------|-----------------|
| **Scope 1** | Direct emissions from company-owned facilities and vehicles | ~10% | High |
| **Scope 2** | Indirect emissions from purchased electricity | ~10–20% | Medium |
| **Scope 3** | Value chain emissions (suppliers, transport, product use, disposal) | **70–90%** | Low |

> **Scope 3 is the Biggest Challenge:** The data lives with suppliers, and many suppliers — especially Tier 2 and Tier 3 — lack carbon tracking capabilities.

### 2025 ESG Regulations

| Regulation | Region | Requirements |
|------------|--------|--------------|
| **CSRD** | EU | Mandatory disclosure of full ESG data (including Scope 3) |
| **SEC Climate Disclosure** | US | Mandatory climate disclosure for listed companies |
| **LkSG** | Germany | Companies legally responsible for human rights in their supply chains |
| **CBAM** | EU | Carbon Border Adjustment Mechanism (carbon tariff) |

**Four Major ESG Reporting Frameworks:**
- **GRI** — Most widely used
- **SASB** — Industry-specific financially material ESG factors
- **TCFD** — Focused on climate risk and financial impact
- **ISSB** — New global unified standard

### Sustainable Supply Chain Practices

**Five-Step Framework:**
\\`\\`\\`
Measure (establish carbon emissions baseline) → Integrate (embed into procurement process)
→ Collaborate (work with suppliers to reduce emissions) → Report (compliance reporting)
→ Improve (continuous improvement)
\\`\\`\\`

**Scope 3 Strategy:**
- Large suppliers → Require actual carbon emissions data
- Small and medium suppliers → Estimate using industry averages
- All suppliers → Embed carbon requirements into RFQs and contracts

> **Important:** Collaborating with suppliers on decarbonization is 3–5× more effective than applying pressure alone. Apple requires its top 200 suppliers to achieve carbon neutrality by 2030 and provides technical and financial support to help them get there.

### 2030 Supply Chain Vision

Three mutually reinforcing pillars:

**1. Intelligent**
- Agentic AI autonomously handles 80% of routine decisions
- Digital Twin for real-time simulation
- Control Tower for predictive management

**2. Resilient**
- Diversified supply networks (Nearshoring + Multi-sourcing)
- Flexible capacity, real-time visibility
- The goal is not to avoid risk, but to recover from it quickly

**3. Sustainable**
- Carbon neutrality is the baseline, not the target
- Carbon emissions become part of the cost structure (CBAM)
- Circular Economy

> **Your Position:** The intersection of Supply Chain + Data + IT — this is the talent profile supply chains will need most in 2030.

"""

    static func additionalLesson(for worldId: Int, language: LanguageManager.Language) -> String? {
        switch (worldId, language) {
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
        default: return nil
        }
    }
}
