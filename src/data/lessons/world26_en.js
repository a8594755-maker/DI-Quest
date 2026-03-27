const world26_en = `
# World 26: SQL Engineering Applications

> Beyond reading data — learn to write data, design table structures, and integrate with applications. These are essential skills for a Business Engineer.

The previous three chapters focused on "reading" data (SELECT). This chapter teaches you how to "write" data and design data structures.

---

## 26-1: INSERT / UPDATE / DELETE

### INSERT

\`\`\`sql
INSERT INTO customers (id, name, email, city)
VALUES (106, 'Frank', 'frank@mail.com', 'Taipei');
\`\`\`

### UPDATE (Always write the WHERE clause first!)

\`\`\`sql
UPDATE orders SET status = 'cancelled' WHERE id = 3;
\`\`\`

### DELETE

\`\`\`sql
DELETE FROM orders WHERE status = 'cancelled' AND order_date < '2023-01-01';
\`\`\`

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

\`\`\`python
import sqlite3, pandas as pd
conn = sqlite3.connect('shop.db')
df = pd.read_sql('SELECT * FROM orders WHERE amount > 100', conn)
\`\`\`

### Preventing SQL Injection

\`\`\`python
# Safe: Use parameterized queries
cursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))
\`\`\`

---

## 26-5: Permissions, Data Isolation & Query Performance

### Role-Based Permissions

Analyst: SELECT | Engineer: SELECT+INSERT+UPDATE | DBA: Full access

### Index

\`\`\`sql
CREATE INDEX idx_orders_date ON orders(order_date);
\`\`\`

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
`
export default world26_en
