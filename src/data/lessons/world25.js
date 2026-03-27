const world25 = `
# World 25：SQL 進階分析

> 這是 Product Analyst 的核心技能。學會用 SQL 做 Funnel、Segmentation、Retention 分析。

基礎查詢讓你拿到資料，進階分析讓你從資料中提煉出 insight。
這一章的內容直接對應面試中最常考的分析場景。

---

## 25-1：Window Functions 實戰

### ROW_NUMBER vs RANK vs DENSE_RANK

\`\`\`
成績：100, 90, 90, 80
ROW_NUMBER: 1, 2, 3, 4
RANK:       1, 2, 2, 4
DENSE_RANK: 1, 2, 2, 3
\`\`\`

### 累計加總（Running Total）

\`\`\`sql
SELECT order_date, amount,
       SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
\`\`\`

### 移動平均

\`\`\`sql
AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
\`\`\`

### NTILE — 分位數分群

\`\`\`sql
NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
\`\`\`

---

## 25-2：Funnel Analysis

### SQL Funnel 查詢

\`\`\`sql
WITH funnel AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event = 'visit' THEN user_id END) AS step1,
    COUNT(DISTINCT CASE WHEN event = 'add_to_cart' THEN user_id END) AS step2,
    COUNT(DISTINCT CASE WHEN event = 'payment' THEN user_id END) AS step3
  FROM events
)
SELECT *, ROUND(step3 * 100.0 / step1, 1) AS conversion FROM funnel;
\`\`\`

### 重點：Drop-off、Conversion rate、分群比較

---

## 25-3：Segmentation

### 用 CASE WHEN 建立分群

\`\`\`sql
CASE
  WHEN COUNT(*) >= 10 THEN 'Power'
  WHEN COUNT(*) >= 5 THEN 'Active'
  WHEN COUNT(*) >= 1 THEN 'Casual'
  ELSE 'Dormant'
END AS segment
\`\`\`

### 常見分群維度

用戶類型、地區、渠道、產品層級、行為活躍度

---

## 25-4：Retention / Cohort Analysis

### Cohort 與 Retention

\`\`\`sql
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
\`\`\`

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
`
export default world25
