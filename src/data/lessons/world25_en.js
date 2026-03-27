const world25_en = `
# World 25: SQL Advanced Analytics

> This is the core skill set of a Product Analyst. Learn to use SQL for Funnel, Segmentation, and Retention analysis.

Basic queries let you retrieve data; advanced analytics let you extract insights from it.
The content of this chapter directly maps to the most commonly tested analytical scenarios in interviews.

---

## 25-1: Window Functions in Practice

### ROW_NUMBER vs RANK vs DENSE_RANK

\`\`\`
Scores: 100, 90, 90, 80
ROW_NUMBER: 1, 2, 3, 4
RANK:       1, 2, 2, 4
DENSE_RANK: 1, 2, 2, 3
\`\`\`

### Running Total

\`\`\`sql
SELECT order_date, amount,
       SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
\`\`\`

### Moving Average

\`\`\`sql
AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
\`\`\`

### NTILE — Quantile-Based Segmentation

\`\`\`sql
NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
\`\`\`

---

## 25-2: Funnel Analysis

### SQL Funnel Query

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

### Key Concepts: Drop-off, Conversion Rate, Segment Comparison

---

## 25-3: Segmentation

### Building Segments with CASE WHEN

\`\`\`sql
CASE
  WHEN COUNT(*) >= 10 THEN 'Power'
  WHEN COUNT(*) >= 5 THEN 'Active'
  WHEN COUNT(*) >= 1 THEN 'Casual'
  ELSE 'Dormant'
END AS segment
\`\`\`

### Common Segmentation Dimensions

User type, region, channel, product tier, behavioral activity level

---

## 25-4: Retention / Cohort Analysis

### Cohort & Retention

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
`
export default world25_en
