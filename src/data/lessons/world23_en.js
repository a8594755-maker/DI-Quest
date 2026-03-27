const world23_en = `
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

\`\`\`
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
\`\`\`

The \`customer_id\` in the orders table is a Foreign Key pointing to the \`id\` in the customers table.

### What Is a Schema?

A schema describes a table's structure: which columns it has, the data type of each column, and constraints.

\`\`\`sql
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  city TEXT
);
\`\`\`

You don't need to memorize syntax for interviews, but you should be able to read a schema and say "this table has these columns and can answer these questions."

---

## 23-2: Deep Dive into SELECT / FROM / WHERE

### Basic SQL Query Structure

\`\`\`sql
SELECT column1, column2     -- What you want to see
FROM table_name              -- Which table
WHERE condition              -- What to filter
\`\`\`

### Multi-Condition Filtering

Use AND, OR, NOT to combine multiple conditions:

\`\`\`sql
-- Completed orders from Taipei
SELECT * FROM orders
WHERE city = 'Taipei' AND status = 'completed';

-- Orders from Taipei or Kaohsiung
SELECT * FROM orders
WHERE city = 'Taipei' OR city = 'Kaohsiung';

-- Non-cancelled orders
SELECT * FROM orders
WHERE NOT status = 'cancelled';
\`\`\`

### DISTINCT for Deduplication

\`\`\`sql
-- How many distinct cities?
SELECT DISTINCT city FROM customers;
\`\`\`

### Column Alias

\`\`\`sql
SELECT name AS customer_name, email AS contact_email
FROM customers;
\`\`\`

### Interview Tips

In interviews, verbalize your thought process first:
> "I need to pull data from the orders table, filter for status = completed and amount > 100, and I only need the customer_id and amount columns."

---

## 23-3: Sorting & Advanced Filtering

### ORDER BY for Sorting

\`\`\`sql
-- Sort by amount descending
SELECT * FROM orders ORDER BY amount DESC;

-- Sort by city first, then by amount within each city
SELECT * FROM orders ORDER BY city ASC, amount DESC;
\`\`\`

### IN — Multi-Value Matching

\`\`\`sql
SELECT * FROM customers
WHERE city IN ('Taipei', 'Kaohsiung', 'Taichung');
\`\`\`

### BETWEEN — Range Filtering

\`\`\`sql
SELECT * FROM orders
WHERE amount BETWEEN 100 AND 500;
\`\`\`

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

\`\`\`sql
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 5;
\`\`\`

### WHERE vs HAVING

| | WHERE | HAVING |
|---|-------|--------|
| When it filters | Before aggregation | After aggregation |
| Can use aggregate functions? | No | Yes |

### SQL Execution Order

\`\`\`
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
\`\`\`

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

\`\`\`sql
SUBSTR(order_date, 1, 7)  -- Extract year-month '2024-01'
JULIANDAY('2024-02-01') - JULIANDAY('2024-01-15')  -- Day difference
DATE('now', '-7 days')  -- 7 days ago
\`\`\`

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
`
export default world23_en
