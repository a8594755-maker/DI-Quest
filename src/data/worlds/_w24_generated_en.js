/**
 * World 24: SQL Analytics Core
 * Multi-table joins, subqueries, and CTEs — master the core skills of data integration
 * Original challenges only (no sourceTag)
 */

export const w24GeneratedEn = {
  id: 24,
  name: 'SQL Analytics Core',
  emoji: '🔗',
  description: 'Multi-table joins, subqueries, and CTEs — master the core skills of data integration',
  color: 'from-teal-500 to-cyan-500',
  quests: [
    // ──────────────────────────────────────────
    // Quest 24-1: Advanced Multi-Table Joins
    // ──────────────────────────────────────────
    {
      id: '24-1',
      name: 'Advanced Multi-Table Joins',
      description: 'INNER JOIN, LEFT JOIN, and three-table JOINs — master the core of multi-table querying',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'INNER JOIN Basics',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Merging Orders with Customer Data',
            narrative: 'The e-commerce operations team needs a report listing each order along with the corresponding customer name and order amount. The order data and customer data are stored in two separate tables, and you need to use INNER JOIN to combine them.\n\nTables:\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
            data: [
              { customer: 'Alice', order_id: 1, amount: 1200, order_date: '2026-01-10' },
              { customer: 'Bob', order_id: 2, amount: 850, order_date: '2026-01-12' },
              { customer: 'Alice', order_id: 3, amount: 2300, order_date: '2026-01-15' },
            ],
            dataCaption: 'Expected result (partial sample)',
          },
          question: 'Write a SQL query using INNER JOIN to list each order\'s customer name, order amount, and date, sorted by date.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'Taipei');
            INSERT INTO customers VALUES (2, 'Bob', 'Taichung');
            INSERT INTO customers VALUES (3, 'Charlie', 'Kaohsiung');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2026-01-10');
            INSERT INTO orders VALUES (2, 2, 850.00, '2026-01-12');
            INSERT INTO orders VALUES (3, 1, 2300.00, '2026-01-15');
            INSERT INTO orders VALUES (4, 2, 670.00, '2026-01-18');
            INSERT INTO orders VALUES (5, 1, 990.00, '2026-01-22');
          `,
          starterCode: "SELECT c.name, o.amount, o.order_date\nFROM orders o\n-- Use INNER JOIN to connect the customers table\nORDER BY o.order_date;",
          expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o INNER JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;",
          hints: [
            'INNER JOIN syntax: FROM table1 INNER JOIN table2 ON table1.key = table2.key',
            'Use ON to specify the join condition: orders.customer_id corresponds to customers.id',
          ],
          explanation: "INNER JOIN only returns rows that have matches in both tables. Here we use ON o.customer_id = c.id to link orders with customers. If a customer has no orders, or an order's customer_id doesn't exist, they won't appear in the results. This is the most basic and commonly used JOIN type.",
          frameworkTip: 'When you encounter a "merge two tables" requirement in an interview, first identify the join column (foreign key relationship), then decide between INNER JOIN and LEFT JOIN.',
        },
        {
          id: 2,
          name: 'LEFT JOIN to Find Missing Data',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Find Customers Who Have Never Placed an Order',
            narrative: 'The marketing team wants to send promotional emails to customers who have never placed an order. You need to find customers who exist in the customers table but have no records in the orders table. This is a classic use case for LEFT JOIN + IS NULL.\n\nTables:\n- customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
          },
          question: 'Write a SQL query to find all customers who have never placed an order, showing customer name and email.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com', '2025-06-01');
            INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com', '2025-07-15');
            INSERT INTO customers VALUES (3, 'Charlie', 'charlie@example.com', '2025-08-20');
            INSERT INTO customers VALUES (4, 'Diana', 'diana@example.com', '2025-09-10');
            INSERT INTO customers VALUES (5, 'Eve', 'eve@example.com', '2025-10-05');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2025-08-10');
            INSERT INTO orders VALUES (2, 2, 850.00, '2025-09-12');
            INSERT INTO orders VALUES (3, 1, 2300.00, '2025-10-15');
          `,
          starterCode: "SELECT c.name, c.email\nFROM customers c\n-- Which type of JOIN should you use?\n-- How do you filter for customers with no orders?",
          expectedQuery: "SELECT c.name, c.email FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;",
          hints: [
            'LEFT JOIN preserves all rows from the left table; unmatched rows from the right table are filled with NULL',
            'Use WHERE o.id IS NULL to filter for rows with no match on the right side — these are the customers with no orders',
          ],
          explanation: "LEFT JOIN preserves all rows from the left table (customers). For customers with no orders, all columns from the orders side will be NULL. Then, WHERE o.id IS NULL filters for these rows, giving you customers who have never placed an order. This is the classic SQL pattern for finding missing relationships, and it's more efficient than using a NOT IN subquery.",
          frameworkTip: '"Find the missing" requirements (customers with no orders, users who never attended an event) are very common in interviews. LEFT JOIN + IS NULL is the standard approach.',
        },
        {
          id: 3,
          name: 'Three-Table JOIN',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Complete Order Detail Report',
            narrative: 'The finance department needs a complete order detail report that includes customer information, order information, and product information. This data is spread across three tables, and you need to use multiple JOINs to link them together.\n\nTables:\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT)\n- order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL)',
          },
          question: 'Write a SQL query to list each order line item: customer name, order date, product name, quantity, and subtotal (quantity * unit_price), sorted by order date.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'Taipei');
            INSERT INTO customers VALUES (2, 'Bob', 'Taichung');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, order_date TEXT);
            INSERT INTO orders VALUES (101, 1, '2026-01-10');
            INSERT INTO orders VALUES (102, 2, '2026-01-12');
            INSERT INTO orders VALUES (103, 1, '2026-01-15');
            CREATE TABLE order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL);
            INSERT INTO order_items VALUES (1, 101, 'Wireless Mouse', 2, 350.00);
            INSERT INTO order_items VALUES (2, 101, 'USB Hub', 1, 280.00);
            INSERT INTO order_items VALUES (3, 102, 'Mechanical Keyboard', 1, 2400.00);
            INSERT INTO order_items VALUES (4, 103, 'Monitor Stand', 1, 1200.00);
            INSERT INTO order_items VALUES (5, 103, 'Mouse Pad', 3, 150.00);
          `,
          starterCode: "SELECT c.name, o.order_date, oi.product_name, oi.quantity,\n       -- Calculate subtotal\nFROM order_items oi\n-- JOIN the orders table\n-- JOIN the customers table\nORDER BY o.order_date, oi.id;",
          expectedQuery: "SELECT c.name, o.order_date, oi.product_name, oi.quantity, oi.quantity * oi.unit_price AS subtotal FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date, oi.id;",
          hints: [
            'A three-table JOIN simply means writing two consecutive JOINs: join one table first, then join the next',
            'order_items connects to orders via order_id, and orders connects to customers via customer_id',
            'The subtotal can be calculated directly: oi.quantity * oi.unit_price AS subtotal',
          ],
          explanation: "The key to multi-table JOINs is identifying the connection path between tables. order_items connects to orders via order_id, and orders connects to customers via customer_id. The syntax is simply consecutive JOIN ... ON ... clauses. In practice, JOINs across 3 to 5 tables are common — the important thing is to clearly understand the primary key and foreign key relationships between tables.",
          frameworkTip: 'Interview tip for multi-table JOINs: sketch out the ER diagram (the connections between tables) first, then write the JOINs in order to avoid missing any.',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-2: Conditional Logic and NULL Handling
    // ──────────────────────────────────────────
    {
      id: '24-2',
      name: 'Conditional Logic and NULL Handling',
      description: 'CASE WHEN, COALESCE, and NULL pitfalls — make your queries more flexible',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'CASE WHEN Classification',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Customer Spending Tier Classification',
            narrative: 'The marketing department wants to classify customers into three tiers based on cumulative spending: VIP (spending >= 10000), Regular (spending >= 3000), and New (spending < 3000). You need to use CASE WHEN to create the classification column.\n\nTable:\n- customer_spending (customer_id INTEGER, name TEXT, total_spent REAL)',
          },
          question: 'Write a SQL query to add a spending_tier column for each customer: total_spent >= 10000 is "VIP", >= 3000 is "Regular", and the rest is "New". Sort by total_spent in descending order.',
          sampleSchema: `
            CREATE TABLE customer_spending (customer_id INTEGER, name TEXT, total_spent REAL);
            INSERT INTO customer_spending VALUES (1, 'Alice', 15200.00);
            INSERT INTO customer_spending VALUES (2, 'Bob', 4800.00);
            INSERT INTO customer_spending VALUES (3, 'Charlie', 1200.00);
            INSERT INTO customer_spending VALUES (4, 'Diana', 32000.00);
            INSERT INTO customer_spending VALUES (5, 'Eve', 890.00);
            INSERT INTO customer_spending VALUES (6, 'Frank', 7600.00);
          `,
          starterCode: "SELECT name, total_spent,\n       CASE\n         -- Classify into three tiers by amount\n       END AS spending_tier\nFROM customer_spending\nORDER BY total_spent DESC;",
          expectedQuery: "SELECT name, total_spent, CASE WHEN total_spent >= 10000 THEN 'VIP' WHEN total_spent >= 3000 THEN 'Regular' ELSE 'New' END AS spending_tier FROM customer_spending ORDER BY total_spent DESC;",
          hints: [
            'CASE WHEN conditions are evaluated from top to bottom; the first match is selected',
            'Since we check from high to low, >= 10000 is evaluated first, and matches skip the >= 3000 check',
            'Anything that doesn\'t match any condition falls through to ELSE',
          ],
          explanation: "CASE WHEN is SQL's conditional expression, similar to if-else in programming languages. Conditions are evaluated top to bottom, and the first match returns its corresponding value. Here we check >= 10000 (VIP) first, then >= 3000 (Regular), with the rest falling to New. CASE WHEN is extremely useful in data analysis for segmentation, labeling, and creating derived columns.",
          frameworkTip: 'Using CASE WHEN in an interview to demonstrate "data segmentation" ability is a plus. Remember to consider edge cases and NULL values.',
        },
        {
          id: 2,
          name: 'NULL Handling',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Employee Contact Information Cleanup',
            narrative: 'The HR department is cleaning up employee contact information and found that some employees have NULL values in their phone or email fields. Management needs a report that shows "Not provided" if phone is NULL, along with a count of how many employees in each department are missing phone numbers.\n\nTable:\n- employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT)',
          },
          question: 'Write a SQL query to: (1) use COALESCE to replace NULL phone values with "Not provided"; (2) count the number of employees missing phone numbers and total employees per department.',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT);
            INSERT INTO employees VALUES (1, 'Alice', 'Engineering', '0912345678', 'alice@corp.com');
            INSERT INTO employees VALUES (2, 'Bob', 'Engineering', NULL, 'bob@corp.com');
            INSERT INTO employees VALUES (3, 'Charlie', 'Marketing', '0923456789', NULL);
            INSERT INTO employees VALUES (4, 'Diana', 'Marketing', NULL, 'diana@corp.com');
            INSERT INTO employees VALUES (5, 'Eve', 'Engineering', '0934567890', 'eve@corp.com');
            INSERT INTO employees VALUES (6, 'Frank', 'Marketing', NULL, NULL);
            INSERT INTO employees VALUES (7, 'Grace', 'HR', NULL, 'grace@corp.com');
            INSERT INTO employees VALUES (8, 'Henry', 'HR', '0956789012', 'henry@corp.com');
          `,
          starterCode: "SELECT department,\n       COUNT(*) AS total_employees,\n       -- Count employees missing phone numbers\n       -- Hint: count where phone IS NULL\nFROM employees\nGROUP BY department\nORDER BY department;",
          expectedQuery: "SELECT department, COUNT(*) AS total_employees, SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS missing_phone_count FROM employees GROUP BY department ORDER BY department;",
          hints: [
            'COALESCE(phone, "Not provided") replaces NULL with a default value',
            'To count NULLs, use SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END)',
            'COUNT(phone) only counts non-NULL values, so COUNT(*) - COUNT(phone) also gives you the NULL count',
          ],
          explanation: "COALESCE accepts multiple arguments and returns the first non-NULL value — it's the standard tool for handling NULLs. There are two ways to count NULLs: (1) SUM(CASE WHEN col IS NULL THEN 1 ELSE 0 END), (2) COUNT(*) - COUNT(col). Both give the same result, but the CASE WHEN approach is more flexible and can handle multiple conditions simultaneously.",
          frameworkTip: 'NULL handling is a high-frequency topic in interviews. Remember: NULL is not the same as an empty string, NULL in any comparison yields NULL, and you must use IS NULL / IS NOT NULL.',
        },
        {
          id: 3,
          name: 'NULL Pitfalls',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'NULL Behavior Quiz in SQL',
            narrative: 'In SQL, NULL represents an "unknown value," and its behavior is very different from regular values. Many beginners stumble here. Consider this table with NULLs:\n\nscores (student TEXT, math_score INTEGER, english_score INTEGER)\n\n| student | math_score | english_score |\n|---------|-----------|---------------|\n| Alice   | 85        | 90            |\n| Bob     | NULL      | 75            |\n| Charlie | 70        | NULL          |\n| Diana   | NULL      | NULL          |',
          },
          question: 'Which of the following SQL result counts are correct?\n\nSELECT COUNT(*) FROM scores; -- Result A\nSELECT COUNT(math_score) FROM scores; -- Result B\nSELECT * FROM scores WHERE math_score != 85; -- Result C\nSELECT * FROM scores WHERE math_score IS NULL OR math_score != 85; -- Result D',
          options: [
            { id: 'A', text: 'A=4, B=4, C=2, D=3', explanation: 'Incorrect. COUNT(math_score) does not count NULLs, so B is not 4.' },
            { id: 'B', text: 'A=4, B=2, C=1, D=3', explanation: 'Correct! COUNT(*) counts all rows = 4; COUNT(math_score) only counts non-NULLs = 2; != 85 excludes NULL rows = 1 (only Charlie); adding IS NULL captures Bob and Diana = 3.' },
            { id: 'C', text: 'A=4, B=2, C=2, D=4', explanation: 'Incorrect. math_score != 85 does not select NULL rows, so C is only 1 row.' },
            { id: 'D', text: 'A=4, B=2, C=3, D=3', explanation: 'Incorrect. NULL != 85 evaluates to NULL (not TRUE), so C is not 3.' },
          ],
          correctAnswer: 'B',
          hints: [
            'COUNT(*) counts all rows; COUNT(column) only counts non-NULL values in that column',
            'NULL in any comparison operation (=, !=, >, <) evaluates to NULL, not TRUE or FALSE',
            'WHERE only keeps rows where the condition is TRUE; rows with NULL or FALSE are filtered out',
          ],
          explanation: "The core concept of NULL is 'unknown value.' COUNT(*) counts all rows regardless of content; COUNT(col) skips NULLs. The biggest pitfall: NULL != 85 evaluates to NULL (unknown), not TRUE, so WHERE math_score != 85 will not return NULL rows. To include NULL rows, you must explicitly write IS NULL. This is a very high-frequency interview topic.",
          frameworkTip: 'When facing NULL questions in interviews, remember three key rules: (1) NULL is not equal to anything, including NULL itself; (2) Use IS NULL, not = NULL; (3) Aggregate functions generally ignore NULLs.',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-3: Subqueries
    // ──────────────────────────────────────────
    {
      id: '24-3',
      name: 'Subqueries',
      description: 'Master the use cases for WHERE IN, correlated subqueries, and EXISTS',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'WHERE IN Subquery',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Find Products with Return Records',
            narrative: 'The quality assurance team wants to know which products have been returned. Return records are in the returns table and product information is in the products table. You need to use a subquery to find products that appear in the returns table.\n\nTables:\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT)',
          },
          question: 'Write a SQL query using a WHERE IN subquery to find all products that have been returned, showing the product name, category, and price.',
          sampleSchema: `
            CREATE TABLE products (id INTEGER, name TEXT, category TEXT, price REAL);
            INSERT INTO products VALUES (1, 'Wireless Earbuds', 'Electronics', 1200.00);
            INSERT INTO products VALUES (2, 'Sports Water Bottle', 'Lifestyle', 350.00);
            INSERT INTO products VALUES (3, 'Laptop', 'Electronics', 32000.00);
            INSERT INTO products VALUES (4, 'Yoga Mat', 'Sports', 800.00);
            INSERT INTO products VALUES (5, 'Bluetooth Speaker', 'Electronics', 2400.00);
            CREATE TABLE returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT);
            INSERT INTO returns VALUES (1, 1, '2026-01-15', 'Defective');
            INSERT INTO returns VALUES (2, 3, '2026-01-20', 'Wrong specifications');
            INSERT INTO returns VALUES (3, 1, '2026-02-01', 'Unsatisfied');
            INSERT INTO returns VALUES (4, 5, '2026-02-10', 'Defective');
          `,
          starterCode: "SELECT name, category, price\nFROM products\nWHERE id IN (\n  -- Subquery: find returned product IDs\n);",
          expectedQuery: "SELECT name, category, price FROM products WHERE id IN (SELECT DISTINCT product_id FROM returns);",
          hints: [
            'WHERE IN (subquery) filters rows that "exist in the subquery result set"',
            'The subquery needs to retrieve all returned product_id values from the returns table',
            'Adding DISTINCT avoids duplicate values in the subquery (though IN is not affected by duplicates)',
          ],
          explanation: "WHERE IN (subquery) is the most intuitive subquery usage: first use a subquery to find a set of values, then use the outer query to filter matching rows. Here the subquery retrieves all product_ids from returns, and the outer query filters products accordingly. This pattern is ideal for 'find data that meets a certain relational condition.'",
          frameworkTip: 'WHERE IN subqueries are fundamental in interviews, but note: when the subquery result is large, performance may be worse than JOIN or EXISTS.',
        },
        {
          id: 2,
          name: 'Correlated Subquery',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Find the Highest-Paid Employee in Each Department',
            narrative: 'The HR manager wants to know who the highest-paid employee is in each department. This requires a correlated subquery: the subquery references values from the outer query and re-executes for each row.\n\nTable:\n- staff (id INTEGER, name TEXT, department TEXT, salary REAL)',
          },
          question: 'Write a SQL query using a correlated subquery to find the highest-paid employee in each department, showing name, department, and salary.',
          sampleSchema: `
            CREATE TABLE staff (id INTEGER, name TEXT, department TEXT, salary REAL);
            INSERT INTO staff VALUES (1, 'Alice', 'Engineering', 85000.00);
            INSERT INTO staff VALUES (2, 'Bob', 'Engineering', 72000.00);
            INSERT INTO staff VALUES (3, 'Charlie', 'Marketing', 68000.00);
            INSERT INTO staff VALUES (4, 'Diana', 'Marketing', 75000.00);
            INSERT INTO staff VALUES (5, 'Eve', 'Engineering', 91000.00);
            INSERT INTO staff VALUES (6, 'Frank', 'HR', 65000.00);
            INSERT INTO staff VALUES (7, 'Grace', 'HR', 70000.00);
          `,
          starterCode: "SELECT name, department, salary\nFROM staff s1\nWHERE salary = (\n  -- Subquery: find the highest salary in the same department\n  -- Hint: the subquery should reference s1.department from the outer query\n);",
          expectedQuery: "SELECT name, department, salary FROM staff s1 WHERE salary = (SELECT MAX(salary) FROM staff s2 WHERE s2.department = s1.department);",
          hints: [
            'A correlated subquery references a column from the outer query (e.g., s1.department)',
            'The subquery finds MAX(salary) for the same department; the outer query filters rows matching that value',
            'If multiple employees in a department tie for the highest salary, all of them will be returned',
          ],
          explanation: "The difference between a correlated subquery and a regular subquery is that the subquery references a value from the outer query (s1.department). The database executes the subquery for each row of the outer query using that row's department value. Although conceptually like a nested loop, the database engine optimizes it automatically. This is the classic pattern for finding 'the row with the max/min value per group.'",
          frameworkTip: 'Correlated subqueries are commonly tested in interviews for "Top N per group" problems. Alternative approaches include: (1) JOIN + GROUP BY, (2) window function ROW_NUMBER() — you should know all of them.',
        },
        {
          id: 3,
          name: 'EXISTS vs IN',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Find Customers with Active Subscriptions',
            narrative: 'The operations team needs to find customers who currently have at least one "active" subscription. Only subscriptions with status "active" count. Compared to IN, EXISTS is generally more efficient when the subquery returns a large dataset, because it stops as soon as it finds the first match.\n\nTables:\n- customers (id INTEGER, name TEXT, email TEXT)\n- subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT)',
          },
          question: 'Use an EXISTS subquery to find customers with active subscriptions, showing customer name and email.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com');
            INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com');
            INSERT INTO customers VALUES (3, 'Charlie', 'charlie@example.com');
            INSERT INTO customers VALUES (4, 'Diana', 'diana@example.com');
            CREATE TABLE subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT);
            INSERT INTO subscriptions VALUES (1, 1, 'Monthly Plan', 'active', '2026-01-01');
            INSERT INTO subscriptions VALUES (2, 1, 'Annual Plan', 'cancelled', '2025-01-01');
            INSERT INTO subscriptions VALUES (3, 2, 'Monthly Plan', 'expired', '2025-06-01');
            INSERT INTO subscriptions VALUES (4, 3, 'Quarterly Plan', 'active', '2026-02-01');
            INSERT INTO subscriptions VALUES (5, 4, 'Monthly Plan', 'active', '2026-03-01');
          `,
          starterCode: "SELECT c.name, c.email\nFROM customers c\nWHERE EXISTS (\n  -- Subquery: check for active subscriptions\n  -- Hint: match both customer_id and status\n);",
          expectedQuery: "SELECT c.name, c.email FROM customers c WHERE EXISTS (SELECT 1 FROM subscriptions s WHERE s.customer_id = c.id AND s.status = 'active');",
          hints: [
            'EXISTS only checks "whether the subquery returns at least one row" — it returns TRUE as soon as a match is found',
            'The content of the SELECT in an EXISTS subquery doesn\'t matter (SELECT 1 is conventional); what matters is the WHERE condition',
            'The subquery needs to match both customer_id and status = "active"',
          ],
          explanation: "EXISTS checks whether the subquery 'has any results' — if so, it returns TRUE. The difference from IN: IN executes the subquery first to produce a complete list, then matches; EXISTS checks row by row and stops on the first match. When the subquery result set is large or requires multiple conditions, EXISTS generally performs better. SELECT 1 in the subquery is just convention — SELECT * works the same way.",
          frameworkTip: 'Choosing between EXISTS and IN: use IN when the subquery result is small for readability; use EXISTS when the result is large or conditions are complex for efficiency. Explaining your rationale in interviews earns bonus points.',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-4: CTEs and Multi-Layer Queries
    // ──────────────────────────────────────────
    {
      id: '24-4',
      name: 'CTEs and Multi-Layer Queries',
      description: 'Use WITH clauses to make complex queries clearer and more readable',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'Basic CTE',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Rewrite Customer Spending Stats with a CTE',
            narrative: 'You need to find customers whose spending exceeds the average. Writing this with nested subqueries is hard to read — a CTE (Common Table Expression) lets you break the calculation into named steps for clearer logic.\n\nTable:\n- orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT)',
          },
          question: 'Use a CTE to first calculate each customer\'s total spending, then filter for customers whose total exceeds the overall average total spending.',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 'Alice', 3200.00, '2026-01-10');
            INSERT INTO orders VALUES (2, 2, 'Bob', 1500.00, '2026-01-12');
            INSERT INTO orders VALUES (3, 1, 'Alice', 2800.00, '2026-01-15');
            INSERT INTO orders VALUES (4, 3, 'Charlie', 950.00, '2026-01-18');
            INSERT INTO orders VALUES (5, 2, 'Bob', 4100.00, '2026-01-22');
            INSERT INTO orders VALUES (6, 4, 'Diana', 1200.00, '2026-01-25');
            INSERT INTO orders VALUES (7, 3, 'Charlie', 600.00, '2026-02-01');
            INSERT INTO orders VALUES (8, 1, 'Alice', 1900.00, '2026-02-05');
          `,
          starterCode: "WITH customer_totals AS (\n  -- Step 1: Calculate each customer's total spending\n  SELECT customer_id, customer_name,\n         SUM(amount) AS total_spent\n  FROM orders\n  GROUP BY customer_id, customer_name\n)\nSELECT customer_name, total_spent\nFROM customer_totals\nWHERE total_spent > (\n  -- Step 2: Compare against the average\n);",
          expectedQuery: "WITH customer_totals AS (SELECT customer_id, customer_name, SUM(amount) AS total_spent FROM orders GROUP BY customer_id, customer_name) SELECT customer_name, total_spent FROM customer_totals WHERE total_spent > (SELECT AVG(total_spent) FROM customer_totals);",
          hints: [
            'A CTE is defined with WITH name AS (...) and can then be used like a regular table',
            'The average can be computed with a subquery: SELECT AVG(total_spent) FROM customer_totals',
            'A key benefit of CTEs is that the same CTE can be referenced multiple times in the main query and subqueries',
          ],
          explanation: "A CTE breaks a complex query into named steps: first compute each customer's total spending in customer_totals, then filter for above-average customers in the main query. A major advantage of CTEs is that they can be referenced multiple times (here both the main query and the subquery use customer_totals), avoiding redundant subqueries. This makes queries more readable and maintainable.",
          frameworkTip: 'When facing a complex query in an interview, proactively saying "I\'ll use a CTE to keep the logic clear" demonstrates your code quality awareness.',
        },
        {
          id: 2,
          name: 'Multi-Layer CTE',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Department Performance Ranking Report',
            narrative: 'Management needs a report: first calculate each department\'s monthly revenue, then compute each department\'s percentage of total revenue, and finally rank by percentage. This requires multi-layer CTEs for step-by-step calculation.\n\nTable:\n- sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT)',
          },
          question: 'Use multiple CTEs to: (1) calculate each department\'s total revenue, (2) calculate the company-wide total revenue, (3) compute each department\'s share and rank accordingly.',
          sampleSchema: `
            CREATE TABLE sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT);
            INSERT INTO sales VALUES (1, 'Electronics', 45000.00, '2026-02-03');
            INSERT INTO sales VALUES (2, 'Apparel', 28000.00, '2026-02-05');
            INSERT INTO sales VALUES (3, 'Electronics', 32000.00, '2026-02-08');
            INSERT INTO sales VALUES (4, 'Food', 15000.00, '2026-02-10');
            INSERT INTO sales VALUES (5, 'Apparel', 19000.00, '2026-02-12');
            INSERT INTO sales VALUES (6, 'Food', 22000.00, '2026-02-15');
            INSERT INTO sales VALUES (7, 'Electronics', 51000.00, '2026-02-18');
            INSERT INTO sales VALUES (8, 'Home', 12000.00, '2026-02-20');
            INSERT INTO sales VALUES (9, 'Home', 8000.00, '2026-02-22');
          `,
          starterCode: "WITH dept_revenue AS (\n  -- Step 1: Total revenue per department\n  SELECT department, SUM(amount) AS total_revenue\n  FROM sales\n  GROUP BY department\n),\ncompany_total AS (\n  -- Step 2: Company-wide total revenue\n  SELECT SUM(total_revenue) AS grand_total\n  FROM dept_revenue\n)\nSELECT\n  d.department,\n  d.total_revenue,\n  -- Step 3: Calculate percentage (ROUND to 1 decimal place)\nFROM dept_revenue d, company_total c\nORDER BY d.total_revenue DESC;",
          expectedQuery: "WITH dept_revenue AS (SELECT department, SUM(amount) AS total_revenue FROM sales GROUP BY department), company_total AS (SELECT SUM(total_revenue) AS grand_total FROM dept_revenue) SELECT d.department, d.total_revenue, ROUND(d.total_revenue * 100.0 / c.grand_total, 1) AS revenue_pct FROM dept_revenue d, company_total c ORDER BY d.total_revenue DESC;",
          hints: [
            'Multiple CTEs are separated by commas: WITH cte1 AS (...), cte2 AS (...) SELECT ...',
            'The second CTE can reference the results of the first CTE',
            'Percentage calculation: total_revenue * 100.0 / grand_total (use 100.0 to ensure floating-point division)',
          ],
          explanation: "The power of multi-layer CTEs is that each layer can reference previous CTEs. dept_revenue calculates per-department revenue first, company_total then sums from dept_revenue, and finally the main query uses both CTEs to compute percentages. This 'step-by-step' approach makes complex calculations easy to understand and debug. Note: use 100.0 instead of 100 to ensure SQLite performs floating-point division.",
          frameworkTip: 'Multi-layer CTEs are the go-to tool for "layered calculations." When you encounter problems that require "compute A first, then use A to compute B" in interviews, CTEs are the first choice.',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-5: Data Cleaning and Quality Checks
    // ──────────────────────────────────────────
    {
      id: '24-5',
      name: 'Data Cleaning and Quality Checks',
      description: 'Find duplicates, check data quality, and merge datasets',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'Find Duplicate Data',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Customer List Deduplication',
            narrative: 'The marketing team imported a batch of customer data and suspects there are duplicate emails. You need to find which emails appear more than once so the data can be cleaned.\n\nTable:\n- customer_list (id INTEGER, name TEXT, email TEXT, source TEXT)',
          },
          question: 'Write a SQL query to find duplicate emails and their occurrence counts, showing only those that appear more than once.',
          sampleSchema: `
            CREATE TABLE customer_list (id INTEGER, name TEXT, email TEXT, source TEXT);
            INSERT INTO customer_list VALUES (1, 'Alice Chen', 'alice@example.com', 'Website');
            INSERT INTO customer_list VALUES (2, 'Bob Lin', 'bob@example.com', 'Trade Show');
            INSERT INTO customer_list VALUES (3, 'Alice C.', 'alice@example.com', 'Trade Show');
            INSERT INTO customer_list VALUES (4, 'Charlie Wu', 'charlie@example.com', 'Website');
            INSERT INTO customer_list VALUES (5, 'Diana Lee', 'diana@example.com', 'Referral');
            INSERT INTO customer_list VALUES (6, 'Bob', 'bob@example.com', 'Referral');
            INSERT INTO customer_list VALUES (7, 'Eve Wang', 'eve@example.com', 'Website');
            INSERT INTO customer_list VALUES (8, 'Alice', 'alice@example.com', 'Referral');
          `,
          starterCode: "SELECT email, COUNT(*) AS occurrence_count\nFROM customer_list\nGROUP BY email\n-- How do you keep only duplicates?",
          expectedQuery: "SELECT email, COUNT(*) AS occurrence_count FROM customer_list GROUP BY email HAVING COUNT(*) > 1 ORDER BY occurrence_count DESC;",
          hints: [
            'Filtering after GROUP BY requires HAVING, not WHERE',
            'WHERE filters rows before grouping; HAVING filters groups after grouping',
            'HAVING COUNT(*) > 1 finds groups that appear more than once',
          ],
          explanation: "Finding duplicate data is the first step in data cleaning. GROUP BY email groups rows by the same email, COUNT(*) counts the rows in each group, and HAVING COUNT(*) > 1 keeps only those appearing more than once. The difference between HAVING and WHERE: WHERE filters rows before grouping, HAVING filters groups after grouping. This is an extremely common query pattern in both interviews and real-world work.",
          frameworkTip: 'Demonstrating "data quality awareness" in an interview is a plus. Check for duplicates, NULLs, and outliers before analysis — this is the standard workflow for professional data practitioners.',
        },
        {
          id: 2,
          name: 'Data Quality Check',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Order Data Consistency Check',
            narrative: 'A data engineer maintaining the order system needs to check data quality: (1) find orders with negative or zero amounts, (2) find records with incorrect date formats, (3) find "orphan" orders whose customer_id doesn\'t exist in the customers table.\n\nTables:\n- customers (id INTEGER, name TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
          },
          question: 'Write a SQL query to find all problematic orders: amount <= 0 or customer_id not found in the customers table. Show the order id, issue description, and relevant fields.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT);
            INSERT INTO customers VALUES (1, 'Alice');
            INSERT INTO customers VALUES (2, 'Bob');
            INSERT INTO customers VALUES (3, 'Charlie');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2026-01-10', 'completed');
            INSERT INTO orders VALUES (2, 2, -50.00, '2026-01-12', 'completed');
            INSERT INTO orders VALUES (3, 99, 800.00, '2026-01-15', 'pending');
            INSERT INTO orders VALUES (4, 3, 0.00, '2026-01-18', 'completed');
            INSERT INTO orders VALUES (5, 1, 2300.00, '2026-01-22', 'completed');
            INSERT INTO orders VALUES (6, 88, 450.00, '2026-01-25', 'pending');
          `,
          starterCode: "SELECT o.id AS order_id,\n       CASE\n         -- Identify the type of issue\n       END AS issue_type,\n       o.amount, o.customer_id\nFROM orders o\nWHERE -- Amount is abnormal\n   OR -- Customer does not exist\nORDER BY o.id;",
          expectedQuery: "SELECT o.id AS order_id, CASE WHEN o.amount <= 0 THEN 'Invalid amount' WHEN o.customer_id NOT IN (SELECT id FROM customers) THEN 'Customer not found' END AS issue_type, o.amount, o.customer_id FROM orders o WHERE o.amount <= 0 OR o.customer_id NOT IN (SELECT id FROM customers) ORDER BY o.id;",
          hints: [
            'Use CASE WHEN to label different issue types',
            'To check "customer doesn\'t exist," use a NOT IN subquery or LEFT JOIN + IS NULL',
            'Combine both conditions in WHERE with OR',
          ],
          explanation: "Data quality checking is a routine part of data engineering. This question combines CASE WHEN (to label issue types) with a NOT IN subquery (to check referential integrity). Common data quality issues in practice include: excessive NULL values, values outside reasonable ranges, broken foreign key relationships, and duplicate data. Building automated quality check queries helps catch problems early.",
          frameworkTip: 'Mentioning "I always run a data quality check first" in interviews demonstrates thoroughness. Common checks: NULL ratio, duplicate rate, value distribution, and referential integrity.',
        },
        {
          id: 3,
          name: 'UNION to Merge Data',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Merge Online and Offline Sales Data',
            narrative: 'The company has two sales channels: an online store and physical retail locations, each with its own sales table. Management needs a combined report showing all sales records across channels.\n\nTables:\n- online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT)\n- offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT)',
          },
          question: 'Use UNION ALL to combine both sales tables, adding a channel column to label the source ("Online" / "Offline"), sorted by date.',
          sampleSchema: `
            CREATE TABLE online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT);
            INSERT INTO online_sales VALUES (1, 'Wireless Earbuds', 1200.00, '2026-02-01');
            INSERT INTO online_sales VALUES (2, 'Phone Case', 350.00, '2026-02-03');
            INSERT INTO online_sales VALUES (3, 'Charging Cable', 180.00, '2026-02-05');
            CREATE TABLE offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT);
            INSERT INTO offline_sales VALUES (1, 'Bluetooth Speaker', 2400.00, '2026-02-02', 'Taipei Store');
            INSERT INTO offline_sales VALUES (2, 'Power Bank', 890.00, '2026-02-04', 'Taichung Store');
            INSERT INTO offline_sales VALUES (3, 'Wireless Earbuds', 1200.00, '2026-02-06', 'Kaohsiung Store');
          `,
          starterCode: "SELECT product, amount, sale_date,\n       -- Add source label\nFROM online_sales\n\nUNION ALL\n\nSELECT product, amount, sale_date,\n       -- Add source label\nFROM offline_sales\n\nORDER BY sale_date;",
          expectedQuery: "SELECT product, amount, sale_date, 'Online' AS channel FROM online_sales UNION ALL SELECT product, amount, sale_date, 'Offline' AS channel FROM offline_sales ORDER BY sale_date;",
          hints: [
            'UNION ALL combines all results (including duplicates); UNION removes duplicates',
            'Adding a constant value like "Online" AS channel in the SELECT labels the source',
            'Both SELECT statements must have the same number and types of columns',
            'ORDER BY goes at the end and sorts the entire combined result',
          ],
          explanation: "UNION ALL vertically combines two query results (stacking them). The difference from UNION: UNION removes duplicate rows, while UNION ALL keeps all rows (and performs better). Here we use constants 'Online'/'Offline' AS channel to label each record's source. Note that UNION requires both sides to have the same number and types of columns. ORDER BY can only appear at the end and sorts the entire combined result.",
          frameworkTip: 'Merging data from multiple sources is a common real-world need. UNION ALL is generally used more often than UNION (better performance, and you usually don\'t want accidental deduplication).',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-6: Boss: Data Integration Analysis
    // ──────────────────────────────────────────
    {
      id: '24-6',
      name: 'Boss: Data Integration Analysis',
      description: 'Combine JOINs, CTEs, and aggregations to solve real-world data integration problems',
      xp: 200,
      isBoss: true,
      challenges: [
        {
          id: 1,
          name: 'Comprehensive JOIN + CTE + Aggregation',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'Customer Lifetime Value Analysis',
            narrative: 'The management team wants to understand the lifetime value (LTV) of different customer segments. You need to:\n1. Calculate each customer\'s total spending and order count from the orders and customers tables\n2. Use CASE WHEN to classify customers by registration age: "New" (<90 days), "Mid-term" (90-365 days), "Loyal" (>365 days)\n3. Calculate the average LTV, average order count, and customer count per segment\n\nTables:\n- customers (id INTEGER, name TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)\n\nAssume today is 2026-03-01.',
          },
          question: 'Use CTE + JOIN + CASE WHEN + aggregation to complete the customer lifetime value analysis report.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, registered_date TEXT);
            INSERT INTO customers VALUES (1, 'Alice', '2025-06-15');
            INSERT INTO customers VALUES (2, 'Bob', '2025-11-20');
            INSERT INTO customers VALUES (3, 'Charlie', '2026-01-10');
            INSERT INTO customers VALUES (4, 'Diana', '2024-08-01');
            INSERT INTO customers VALUES (5, 'Eve', '2025-03-25');
            INSERT INTO customers VALUES (6, 'Frank', '2026-02-15');
            INSERT INTO customers VALUES (7, 'Grace', '2025-09-01');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 3200.00, '2025-07-10');
            INSERT INTO orders VALUES (2, 1, 1800.00, '2025-09-15');
            INSERT INTO orders VALUES (3, 2, 4500.00, '2025-12-01');
            INSERT INTO orders VALUES (4, 3, 1200.00, '2026-01-20');
            INSERT INTO orders VALUES (5, 4, 2800.00, '2024-09-15');
            INSERT INTO orders VALUES (6, 4, 3600.00, '2025-02-20');
            INSERT INTO orders VALUES (7, 4, 1500.00, '2025-08-10');
            INSERT INTO orders VALUES (8, 5, 5200.00, '2025-05-01');
            INSERT INTO orders VALUES (9, 5, 2100.00, '2025-11-15');
            INSERT INTO orders VALUES (10, 6, 800.00, '2026-02-20');
            INSERT INTO orders VALUES (11, 7, 3100.00, '2025-10-05');
            INSERT INTO orders VALUES (12, 7, 1900.00, '2026-01-08');
            INSERT INTO orders VALUES (13, 2, 2200.00, '2026-02-10');
          `,
          starterCode: "WITH customer_stats AS (\n  -- Step 1: Total spending and order count per customer\n  SELECT c.id, c.name, c.registered_date,\n         SUM(o.amount) AS total_spent,\n         COUNT(o.id) AS order_count,\n         -- Calculate days since registration\n         JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg\n  FROM customers c\n  LEFT JOIN orders o ON c.id = o.customer_id\n  GROUP BY c.id, c.name, c.registered_date\n),\ncustomer_segments AS (\n  -- Step 2: Segment customers\n  SELECT *,\n         CASE\n           -- Classify into three segments by days\n         END AS segment\n  FROM customer_stats\n)\n-- Step 3: Statistics per segment\nSELECT segment,\n       COUNT(*) AS customer_count,\n       ROUND(AVG(total_spent), 0) AS avg_ltv,\n       ROUND(AVG(order_count), 1) AS avg_orders\nFROM customer_segments\nGROUP BY segment\nORDER BY avg_ltv DESC;",
          expectedQuery: "WITH customer_stats AS (SELECT c.id, c.name, c.registered_date, COALESCE(SUM(o.amount), 0) AS total_spent, COUNT(o.id) AS order_count, JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg FROM customers c LEFT JOIN orders o ON c.id = o.customer_id GROUP BY c.id, c.name, c.registered_date), customer_segments AS (SELECT *, CASE WHEN days_since_reg < 90 THEN 'New' WHEN days_since_reg <= 365 THEN 'Mid-term' ELSE 'Loyal' END AS segment FROM customer_stats) SELECT segment, COUNT(*) AS customer_count, ROUND(AVG(total_spent), 0) AS avg_ltv, ROUND(AVG(order_count), 1) AS avg_orders FROM customer_segments GROUP BY segment ORDER BY avg_ltv DESC;",
          hints: [
            'The first CTE uses LEFT JOIN to ensure customers with no orders are included (use COALESCE to handle NULL for total_spent)',
            'JULIANDAY returns a day number; subtracting two dates gives the number of days between them',
            'CASE WHEN conditions go from smallest to largest: < 90 = New, <= 365 = Mid-term, ELSE = Loyal',
            'Finally, GROUP BY segment to compute statistics for each group',
          ],
          explanation: "This question combines all core skills from World 24: LEFT JOIN to connect customers and orders, CTEs for step-by-step computation, CASE WHEN for segmentation, and aggregate functions for statistics. Key design decisions: LEFT JOIN ensures customers without orders are included; COALESCE handles NULLs; JULIANDAY calculates date differences; multi-layer CTEs keep each step's logic clear. This is a typical 'customer segmentation analysis' scenario, extremely common in both real work and interviews.",
          frameworkTip: 'For comprehensive interview questions, start by saying "I\'ll break this into several steps" and build incrementally. Using CTEs to show clear thinking scores higher than writing one massive query.',
        },
        {
          id: 2,
          name: 'Data Integration Strategy',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: 'Multi-Source Data Integration Challenge',
            narrative: 'You join the data team of a retail company that has three independent systems:\n\n1. POS System: In-store sales data (product code, quantity, amount, store code)\n2. E-commerce Platform: Online order data (member account, product SKU, amount, shipping address)\n3. CRM System: Customer data (name, phone, email, membership tier)\n\nChallenges:\n- The POS system has no customer ID — only a store loyalty card number (which only some customers have)\n- The e-commerce product SKU and POS product code use different formats\n- The CRM customer ID and e-commerce member account are the same, but the POS loyalty card number requires a separate mapping\n- Data granularity differs: POS data is per-transaction, while e-commerce data is at the order level',
          },
          prompt: 'Design a data integration plan addressing:\n1. How would you unify customer identity across systems?\n2. What is your strategy for mapping product SKUs to product codes?\n3. What intermediate tables or CTEs would you create?\n4. What should the final integrated report look like?\n5. What data quality issues might you encounter and how would you handle them?',
          evaluationCriteria: [
            'Does the response propose a reasonable customer identity unification strategy (mapping table, fuzzy matching, etc.)?',
            'Does it consider the design of a product code mapping table?',
            'Does it outline clear ETL steps or intermediate table structures?',
            'Does it mention data quality issues and handling approaches (NULLs, duplicates, inconsistencies)?',
            'Does it address time granularity unification and cross-channel aggregation logic?',
          ],
          sampleAnswer: '1. Customer Unification: Create a customer_mapping table with crm_id, ecom_account, and pos_card_number columns. CRM and e-commerce share the same ID directly; POS loyalty card numbers need a separate mapping (via phone or email matching). POS transactions without a loyalty card are classified as "anonymous customers."\n\n2. Product Mapping: Create a product_mapping table linking pos_product_code and ecom_sku. This may require manual verification or fuzzy matching on product names to build the initial mapping.\n\n3. Intermediate Table Design:\n   - customer_master: Unified customer dimension table\n   - product_master: Unified product dimension table\n   - unified_transactions: Unified transaction fact table (including channel, customer_id, product_id, amount, transaction_date)\n\n4. Integrated Reports: Cross-channel customer spending report (each customer\'s online/offline spending breakdown and trends), product channel performance report (comparing the same product\'s sales across channels).\n\n5. Quality Issue Handling: (a) NULLs: POS transactions without a loyalty card are labeled as anonymous; (b) Duplicates: The same customer may have multiple accounts — deduplicate via phone/email; (c) Time Granularity: Aggregate POS per-transaction data to daily/monthly level before comparing with e-commerce; (d) Amount Differences: Standardize tax-inclusive vs. tax-exclusive amounts.',
          hints: [
            'Think about it: how do you "identify the same person" across different systems?',
            'A product mapping table is a fundamental tool for cross-system integration',
            'Consider the "no match" scenario: some POS customers may not have CRM records',
          ],
          explanation: "Multi-source data integration is a core challenge in data engineering. Key steps: (1) Build dimension tables to unify entity identification (customers, products); (2) Create mapping tables for cross-system ID correspondence; (3) Standardize time granularity and metric definitions; (4) Use CTEs or staging tables for incremental cleansing and transformation; (5) Continuously monitor data quality. This is not just about writing SQL — it's about data architecture design thinking.",
          frameworkTip: 'For open-ended data questions in interviews, demonstrate your thinking framework: define entities first, then build mappings, design an intermediate layer, produce reports, and monitor quality. Showing structured thinking matters more than having a perfect answer.',
        },
      ],
    },
  ],
};
