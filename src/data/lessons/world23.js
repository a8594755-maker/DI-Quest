const world23 = `
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

\`\`\`
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
\`\`\`

orders 表的 \`customer_id\` 是 Foreign Key，指向 customers 表的 \`id\`。

### Schema 是什麼？

Schema 描述資料表的結構：有哪些欄位、每個欄位的資料型態、約束條件。

\`\`\`sql
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  city TEXT
);
\`\`\`

面試中不需要背語法，但你要能看懂 schema 並說出「這張表有什麼欄位、可以回答什麼問題」。

---

## 23-2：SELECT / FROM / WHERE 深入

### SQL 查詢的基本結構

\`\`\`sql
SELECT 欄位1, 欄位2     -- 你要看什麼
FROM 表名               -- 從哪張表
WHERE 條件              -- 篩選什麼
\`\`\`

### 多條件篩選

用 AND、OR、NOT 組合多個條件：

\`\`\`sql
-- 台北的已完成訂單
SELECT * FROM orders
WHERE city = 'Taipei' AND status = 'completed';

-- 台北或高雄的訂單
SELECT * FROM orders
WHERE city = 'Taipei' OR city = 'Kaohsiung';

-- 非取消的訂單
SELECT * FROM orders
WHERE NOT status = 'cancelled';
\`\`\`

### DISTINCT 去重

\`\`\`sql
-- 有多少不同的城市？
SELECT DISTINCT city FROM customers;
\`\`\`

### Column Alias（欄位別名）

\`\`\`sql
SELECT name AS customer_name, email AS contact_email
FROM customers;
\`\`\`

### 面試技巧

面試時先口述你的思路：
> 「我需要從 orders 表取資料，篩選條件是狀態為 completed 且金額大於 100，只需要看 customer_id 和 amount 兩個欄位。」

---

## 23-3：排序與進階篩選

### ORDER BY 排序

\`\`\`sql
-- 按金額由大到小
SELECT * FROM orders ORDER BY amount DESC;

-- 先按城市排，同城市按金額排
SELECT * FROM orders ORDER BY city ASC, amount DESC;
\`\`\`

### IN — 多值匹配

\`\`\`sql
SELECT * FROM customers
WHERE city IN ('Taipei', 'Kaohsiung', 'Taichung');
\`\`\`

### BETWEEN — 範圍篩選

\`\`\`sql
SELECT * FROM orders
WHERE amount BETWEEN 100 AND 500;
\`\`\`

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

\`\`\`sql
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 5;
\`\`\`

### WHERE vs HAVING

| | WHERE | HAVING |
|---|-------|--------|
| 篩選時機 | 聚合前 | 聚合後 |
| 可以用聚合函數？ | 不行 | 可以 |

### SQL 執行順序

\`\`\`
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
\`\`\`

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

\`\`\`sql
SUBSTR(order_date, 1, 7)  -- 取年月 '2024-01'
JULIANDAY('2024-02-01') - JULIANDAY('2024-01-15')  -- 天數差
DATE('now', '-7 days')  -- 7 天前
\`\`\`

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
`
export default world23
