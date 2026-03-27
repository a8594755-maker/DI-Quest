const world24_en = `
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

\`\`\`sql
SELECT c.name, o.amount, p.name AS product_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;
\`\`\`

### LEFT JOIN to Find "Does Not Exist"

\`\`\`sql
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
\`\`\`

---

## 24-2: Conditional Logic & NULL Handling

### CASE WHEN — SQL's if-else

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

### The NULL Trap

\`\`\`sql
-- Wrong: WHERE column = NULL (always evaluates to false)
-- Correct: WHERE column IS NULL
\`\`\`

### COALESCE — Default Values for NULLs

\`\`\`sql
SELECT name, COALESCE(phone, email, 'No contact') AS contact
FROM customers;
\`\`\`

---

## 24-3: Subqueries

### WHERE Subquery

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

## 24-4: CTEs & Multi-Layer Queries

### WITH Syntax

\`\`\`sql
WITH monthly_revenue AS (
  SELECT SUBSTR(order_date, 1, 7) AS month, SUM(amount) AS revenue
  FROM orders GROUP BY SUBSTR(order_date, 1, 7)
)
SELECT * FROM monthly_revenue WHERE revenue > 10000;
\`\`\`

### Multi-Layer CTEs

\`\`\`sql
WITH
  customer_totals AS (...),
  customer_segments AS (...)
SELECT segment, COUNT(*), AVG(total)
FROM customer_segments GROUP BY segment;
\`\`\`

Interview tip: Always use CTEs for complex queries — it demonstrates clear logical thinking.

---

## 24-5: Data Cleaning & Quality Checks

### Finding Duplicates

\`\`\`sql
SELECT email, COUNT(*) FROM customers GROUP BY email HAVING COUNT(*) > 1;
\`\`\`

### Finding Missing Values

\`\`\`sql
SELECT
  SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS phone_null,
  ROUND(SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct
FROM customers;
\`\`\`

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
`
export default world24_en
