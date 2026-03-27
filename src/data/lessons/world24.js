const world24 = `
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

\`\`\`sql
SELECT c.name, o.amount, p.name AS product_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;
\`\`\`

### LEFT JOIN 找「不存在」

\`\`\`sql
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
\`\`\`

---

## 24-2：條件邏輯與 NULL 處理

### CASE WHEN — SQL 的 if-else

\`\`\`sql
SELECT customer_id,
       SUM(amount) AS total,
       CASE
         WHEN SUM(amount) >= 1000 THEN 'VIP'
         WHEN SUM(amount) >= 300 THEN 'Regular'
         ELSE 'Light'
       END AS segment
FROM orders
GROUP BY customer_id;
\`\`\`

### NULL 的陷阱

\`\`\`sql
-- 錯誤：WHERE column = NULL（永遠是 false）
-- 正確：WHERE column IS NULL
\`\`\`

### COALESCE — 處理 NULL 的預設值

\`\`\`sql
SELECT name, COALESCE(phone, email, 'No contact') AS contact
FROM customers;
\`\`\`

---

## 24-3：子查詢

### WHERE 子查詢

\`\`\`sql
SELECT * FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);
\`\`\`

### Correlated Subquery

\`\`\`sql
SELECT * FROM orders o1
WHERE order_date = (
  SELECT MAX(order_date) FROM orders o2
  WHERE o2.customer_id = o1.customer_id
);
\`\`\`

### EXISTS

\`\`\`sql
SELECT * FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);
\`\`\`

---

## 24-4：CTE 與多層查詢

### WITH 語法

\`\`\`sql
WITH monthly_revenue AS (
  SELECT SUBSTR(order_date, 1, 7) AS month, SUM(amount) AS revenue
  FROM orders GROUP BY SUBSTR(order_date, 1, 7)
)
SELECT * FROM monthly_revenue WHERE revenue > 10000;
\`\`\`

### 多層 CTE

\`\`\`sql
WITH
  customer_totals AS (...),
  customer_segments AS (...)
SELECT segment, COUNT(*), AVG(total)
FROM customer_segments GROUP BY segment;
\`\`\`

面試建議：複雜查詢一律用 CTE，展示你的邏輯清晰度。

---

## 24-5：資料清理與品質檢查

### 找重複

\`\`\`sql
SELECT email, COUNT(*) FROM customers GROUP BY email HAVING COUNT(*) > 1;
\`\`\`

### 找缺失值

\`\`\`sql
SELECT
  SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
  ROUND(SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct
FROM customers;
\`\`\`

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
`
export default world24
