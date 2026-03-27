const world26 = `
# World 26：SQL 工程應用

> 不只會讀資料，還要會寫入、設計表結構、跟應用程式整合。這是 Business Engineer 的必備技能。

前面三章都在「讀」資料（SELECT），這一章教你「寫」資料和設計資料。

---

## 26-1：INSERT / UPDATE / DELETE

### INSERT

\`\`\`sql
INSERT INTO customers (id, name, email, city)
VALUES (106, 'Frank', 'frank@mail.com', 'Taipei');
\`\`\`

### UPDATE（永遠先寫 WHERE！）

\`\`\`sql
UPDATE orders SET status = 'cancelled' WHERE id = 3;
\`\`\`

### DELETE

\`\`\`sql
DELETE FROM orders WHERE status = 'cancelled' AND order_date < '2023-01-01';
\`\`\`

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

\`\`\`python
import sqlite3, pandas as pd
conn = sqlite3.connect('shop.db')
df = pd.read_sql('SELECT * FROM orders WHERE amount > 100', conn)
\`\`\`

### 避免 SQL Injection

\`\`\`python
# 安全：用參數化查詢
cursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))
\`\`\`

---

## 26-5：權限、資料隔離與 Query Performance

### 角色權限

Analyst: SELECT | Engineer: SELECT+INSERT+UPDATE | DBA: 全部

### Index

\`\`\`sql
CREATE INDEX idx_orders_date ON orders(order_date);
\`\`\`

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
`
export default world26
