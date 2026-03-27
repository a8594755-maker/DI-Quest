/**
 * World 26 — SQL Engineering Applications: Extra Challenges
 * Inspired by real interview questions and LeetCode / StrataScratch
 * Each question includes a sourceTag indicating its origin
 */

export const w26ExtraEn = {
  '26-1': [
    {
      id: 4,
      name: 'Delete Duplicate Records',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Cleaning Up Duplicate Customer Emails',
        narrative: 'The marketing team imported a batch of contacts into the contacts table, but due to a duplicate file import, some emails ended up with multiple records. Your manager asks you to remove the duplicates, keeping only the earliest record (smallest id) for each email.\n\nTable structure: contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)',
        data: [
          { id: 1, email: 'alice@mail.com', name: 'Alice', created_at: '2024-01-10' },
          { id: 2, email: 'bob@mail.com', name: 'Bob', created_at: '2024-01-12' },
          { id: 3, email: 'alice@mail.com', name: 'Alice Lin', created_at: '2024-01-15' },
          { id: 4, email: 'charlie@mail.com', name: 'Charlie', created_at: '2024-01-18' },
          { id: 5, email: 'bob@mail.com', name: 'Bob Wang', created_at: '2024-01-20' },
        ],
        dataCaption: 'contacts table (notice alice and bob each have two records)',
      },
      question: 'Delete duplicate records from the contacts table based on email, keeping only the record with the smallest id for each email.',
      sampleSchema: `
        CREATE TABLE contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT);
        INSERT INTO contacts VALUES (1, 'alice@mail.com', 'Alice', '2024-01-10');
        INSERT INTO contacts VALUES (2, 'bob@mail.com', 'Bob', '2024-01-12');
        INSERT INTO contacts VALUES (3, 'alice@mail.com', 'Alice Lin', '2024-01-15');
        INSERT INTO contacts VALUES (4, 'charlie@mail.com', 'Charlie', '2024-01-18');
        INSERT INTO contacts VALUES (5, 'bob@mail.com', 'Bob Wang', '2024-01-20');
        INSERT INTO contacts VALUES (6, 'alice@mail.com', 'Alice C', '2024-02-01');
      `,
      starterCode: "DELETE FROM contacts\nWHERE id NOT IN (\n  -- How do you find the smallest id for each email?\n);",
      expectedQuery: "DELETE FROM contacts WHERE id NOT IN (SELECT MIN(id) FROM contacts GROUP BY email);",
      hints: [
        'Use GROUP BY email with MIN(id) to find the earliest record for each email',
        'DELETE ... WHERE id NOT IN (subquery) removes records not on the keep list',
      ],
      explanation: 'This is the classic delete-duplicates problem (a LeetCode #196 variant). The core idea: first use a subquery SELECT MIN(id) FROM contacts GROUP BY email to identify the id to keep for each email, then use DELETE ... WHERE id NOT IN (...) to remove the rest. In interviews, this tests your ability to combine DELETE with subqueries and your understanding of GROUP BY aggregation.',
      frameworkTip: 'Standard steps for deleting duplicates: (1) Use SELECT to confirm which records are duplicates (2) Use a subquery to find the ids to keep (3) DELETE records not on the keep list. Always run SELECT first to verify before converting to DELETE.',
    },
  ],

  '26-2': [
    {
      id: 3,
      name: 'Highest-Paid Employee per Department',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Microsoft 面試題',
      scenario: {
        title: 'Find the Top Earner in Each Department',
        narrative: 'The HR department is preparing the annual salary report and needs a list of the highest-paid employee in each department. You need to understand the table structure first, then write the query.\n\nTable structure:\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)',
        data: [
          { id: 1, name: 'Alice', salary: 85000, department: 'Engineering' },
          { id: 2, name: 'Bob', salary: 92000, department: 'Engineering' },
          { id: 3, name: 'Charlie', salary: 78000, department: 'Marketing' },
          { id: 4, name: 'Diana', salary: 81000, department: 'Marketing' },
          { id: 5, name: 'Eve', salary: 95000, department: 'Engineering' },
        ],
        dataCaption: 'workers + departments (combined view)',
      },
      question: 'Write a SQL query to find the name, department name, and salary of the highest-paid employee in each department. If multiple employees share the top salary in a department, list all of them.',
      sampleSchema: `
        CREATE TABLE departments (id INTEGER PRIMARY KEY, dept_name TEXT);
        INSERT INTO departments VALUES (1, 'Engineering');
        INSERT INTO departments VALUES (2, 'Marketing');
        INSERT INTO departments VALUES (3, 'Sales');
        CREATE TABLE workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER);
        INSERT INTO workers VALUES (1, 'Alice', 85000, 1);
        INSERT INTO workers VALUES (2, 'Bob', 92000, 1);
        INSERT INTO workers VALUES (3, 'Charlie', 78000, 2);
        INSERT INTO workers VALUES (4, 'Diana', 81000, 2);
        INSERT INTO workers VALUES (5, 'Eve', 95000, 1);
        INSERT INTO workers VALUES (6, 'Frank', 72000, 3);
        INSERT INTO workers VALUES (7, 'Grace', 72000, 3);
      `,
      starterCode: "SELECT w.name, d.dept_name, w.salary\nFROM workers w\nJOIN departments d ON w.department_id = d.id\nWHERE w.salary = (\n  -- How do you find the highest salary in the same department?\n);",
      expectedQuery: "SELECT w.name, d.dept_name, w.salary FROM workers w JOIN departments d ON w.department_id = d.id WHERE w.salary = (SELECT MAX(w2.salary) FROM workers w2 WHERE w2.department_id = w.department_id);",
      hints: [
        'Use a correlated subquery: the inner query references the outer query\'s department_id',
        'SELECT MAX(salary) FROM workers WHERE department_id = outer department_id',
      ],
      explanation: 'The key to this problem is the correlated subquery: the inner WHERE w2.department_id = w.department_id dynamically computes the maximum salary for each department relative to the outer row. Compared to a GROUP BY approach, this naturally handles the "multiple employees tied for the top salary" scenario. This is a commonly tested SQL pattern at major companies like Microsoft.',
      frameworkTip: '"Find the row with the max/min value in each group" is a classic interview pattern. Two approaches: (1) Correlated subquery WHERE val = (SELECT MAX...) (2) Window function RANK() OVER (PARTITION BY ...). Being able to discuss both in an interview is a strong advantage.',
    },
  ],

  '26-3': [
    {
      id: 4,
      name: 'Order Lifecycle SQL Tracking',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon 面試題',
      scenario: {
        title: 'The Complete Lifecycle of an E-Commerce Order',
        narrative: 'You are in an Amazon interview, and the interviewer presents an order processing system scenario. An order goes through a complete lifecycle from "placed" to "refund completed." The system involves the following tables:\n\n- orders (id, user_id, total_amount, status, created_at, updated_at)\n- order_items (id, order_id, product_id, quantity, unit_price)\n- inventory (product_id, stock_quantity)\n- payments (id, order_id, amount, payment_method, status, paid_at)\n- refunds (id, order_id, amount, reason, status, created_at)\n\nThe interviewer asks: What SQL operations are triggered in sequence as an order goes from placement to refund completion?',
        data: [
          { 階段: '1. Order Placed', 狀態: 'pending' },
          { 階段: '2. Payment Successful', 狀態: 'paid' },
          { 階段: '3. Shipped', 狀態: 'shipped' },
          { 階段: '4. Delivered', 狀態: 'delivered' },
          { 階段: '5. Return Requested', 狀態: 'return_requested' },
          { 階段: '6. Refund Completed', 狀態: 'refunded' },
        ],
        dataCaption: 'Order lifecycle stages',
      },
      question: 'Which option correctly describes the complete sequence of SQL operations from "order placed" to "refund completed"?',
      options: [
        {
          id: 'A',
          text: 'Place order: INSERT orders → Payment: UPDATE orders status → Ship: UPDATE orders status → Return: DELETE orders + DELETE order_items',
          explanation: 'Returns should never use DELETE! Deleting the order would destroy all historical records, making financial reconciliation and auditing impossible. Returns should UPDATE the status and INSERT a refund record.',
        },
        {
          id: 'B',
          text: 'Place order: INSERT orders + INSERT order_items + UPDATE inventory (deduct stock) → Payment: INSERT payments + UPDATE orders status → Ship: UPDATE orders status → Deliver: UPDATE orders status → Return: UPDATE orders status + INSERT refunds + UPDATE inventory (restore stock) + UPDATE payments status',
          explanation: 'Correct! The complete order lifecycle involves coordinated operations across multiple tables. When placing an order, you must create the order record, line items, and deduct inventory. Payment creates a payment record and updates order status. Returns update the order status, create a refund record, restore inventory, and update payment status. Every stage uses INSERT or UPDATE — never DELETE.',
        },
        {
          id: 'C',
          text: 'Place order: INSERT orders → Payment: INSERT payments → Ship: INSERT shipments → Return: INSERT refunds',
          explanation: 'INSERT alone is insufficient. Each stage also requires UPDATE operations on existing tables (e.g., orders.status). Additionally, placing an order also requires deducting inventory (UPDATE inventory).',
        },
        {
          id: 'D',
          text: 'Place order: INSERT orders + INSERT order_items → Payment: UPDATE orders status → Ship: UPDATE orders status → Return: UPDATE orders status + INSERT refunds',
          explanation: 'Several critical operations are missing: no inventory deduction (UPDATE inventory) when placing the order, no payment record (INSERT payments) during payment, and no inventory restoration during the return. In practice, each step requires complete data operations.',
        },
      ],
      correctAnswer: 'B',
      hints: [
        'Think about what new records are created and what existing data is updated at each stage',
        'Inventory is deducted when the order is placed and must be restored upon return',
        'In practice, orders are never DELETEd — status changes are tracked via UPDATE status',
      ],
      explanation: 'The order lifecycle is the most critical data flow in an e-commerce system. Key takeaways: (1) Every status transition is an UPDATE on orders.status (2) Important events require an INSERT into the corresponding record table (payments, refunds) (3) Inventory is bidirectional — deducted on order, restored on return (4) All operations should execute within a transaction to ensure consistency. Being able to articulate the full multi-table operations and transaction concepts in an interview is a significant advantage.',
      frameworkTip: 'When describing data flows, use the format "which table, what operation, why": INSERT orders (create the order record) → UPDATE inventory (deduct stock) → and so on. Demonstrate your understanding of the business logic behind each operation.',
    },
  ],

  '26-4': [
    {
      id: 3,
      name: 'SQL vs Python Task Assignment',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LinkedIn 面試題',
      scenario: {
        title: 'Daily Task Assignment for the Data Team',
        narrative: 'You just joined LinkedIn\'s Data Analytics team. Your manager has listed a set of tasks for the day and wants you to determine the best tool for each. The team has SQL (connected to the company data warehouse) and Python (Jupyter Notebook with pandas, matplotlib, and scikit-learn).\n\nTask list:\nA. Calculate daily active users (DAU) from 1 billion event records\nB. Create a line chart of DAU data and email it to the manager\nC. Merge two CSV files, clean missing values, and upload to the database\nD. Build a model to predict which users are likely to churn next month\nE. Find the list of users who logged in every day for the past 7 consecutive days',
        data: [
          { 任務: 'A. Calculate DAU', 資料量: '1 billion rows', 適合工具: '?' },
          { 任務: 'B. DAU line chart', 資料量: '365 rows', 適合工具: '?' },
          { 任務: 'C. CSV cleanup & upload', 資料量: '50,000 rows', 適合工具: '?' },
          { 任務: 'D. Churn prediction model', 資料量: '100,000 rows (feature table)', 適合工具: '?' },
          { 任務: 'E. Consecutive login users', 資料量: '1 billion rows', 適合工具: '?' },
        ],
        dataCaption: 'Task list and tool selection',
      },
      question: 'Which tool assignment is the most reasonable?',
      options: [
        {
          id: 'A',
          text: 'A=SQL, B=Python, C=Python, D=Python, E=SQL',
          explanation: 'Correct! A and E involve large-scale data aggregation and filtering — SQL executes these on the database side most efficiently. B requires visualization, best done with Python matplotlib. C involves CSV parsing and missing value cleanup — a strength of pandas. D is an ML task that requires Python. The key principle: let SQL handle large-scale aggregation at the database, and Python handle post-processing and analysis.',
        },
        {
          id: 'B',
          text: 'A=Python, B=Python, C=Python, D=Python, E=Python',
          explanation: 'Using Python for everything is a common beginner mistake. A and E both involve 1 billion records — pulling that into local memory with pandas would consume roughly 80GB of RAM and be extremely slow. Large-scale aggregation should be performed server-side by the database engine.',
        },
        {
          id: 'C',
          text: 'A=SQL, B=SQL, C=SQL, D=SQL, E=SQL',
          explanation: 'Using SQL for everything is also inappropriate. SQL cannot produce visualizations (B), is not well-suited for CSV cleanup (C), and cannot build ML models (D). Tool selection should match the nature of the task — not be one-size-fits-all.',
        },
        {
          id: 'D',
          text: 'A=SQL, B=Python, C=SQL, D=Python, E=Python',
          explanation: 'Using SQL to process CSV files (C) is awkward — pandas read_csv + fillna is far more convenient. Using Python for E with 1 billion event records would run into memory issues — the consecutive login logic is more efficiently handled with SQL window functions.',
        },
      ],
      correctAnswer: 'A',
      hints: [
        'Data volume is a key factor in tool selection — is it practical to pull 1 billion rows to local memory?',
        'Consider the core action of each task: aggregation? visualization? data cleaning? modeling?',
      ],
      explanation: 'Choosing between SQL and Python is not a matter of preference — it is an engineering judgment. Core principles: (1) Large-scale filtering and aggregation → SQL (compute at the database, no data transfer needed) (2) Visualization, ML, file processing → Python (3) Small-scale exploratory analysis → either works. In interviews, demonstrating "I choose tools based on data volume and task nature" is far more convincing than "I use Python for everything."',
      frameworkTip: 'Tool selection decision framework: first check data volume (large → process at the SQL/database layer) → then check task nature (aggregation → SQL, ML/visualization → Python) → finally check convenience (CSV → pandas, JSON → Python).',
    },
  ],

  '26-5': [
    {
      id: 4,
      name: 'Slow Query Rewrite Optimization',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'LinkedIn 面試題',
      scenario: {
        title: 'Optimizing a Department Salary Report',
        narrative: 'The company has two tables: workers and departments. HR wrote a query to calculate the maximum salary per department, but it takes over 60 seconds on millions of rows.\n\nOriginal slow query:\nSELECT d.dept_name,\n       (SELECT MAX(w.salary) FROM workers w WHERE w.department_id = d.id) AS max_salary\nFROM departments d\nORDER BY max_salary DESC;\n\nThe problem: the subquery scans the workers table once per department, leading to poor performance when there are many departments.\n\nTable structure:\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)',
      },
      question: 'Rewrite the slow query above into a more performant version using JOIN + GROUP BY instead of the correlated subquery.',
      sampleSchema: `
        CREATE TABLE departments (id INTEGER PRIMARY KEY, dept_name TEXT);
        INSERT INTO departments VALUES (1, 'Engineering');
        INSERT INTO departments VALUES (2, 'Marketing');
        INSERT INTO departments VALUES (3, 'Sales');
        INSERT INTO departments VALUES (4, 'HR');
        CREATE TABLE workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER);
        INSERT INTO workers VALUES (1, 'Alice', 85000, 1);
        INSERT INTO workers VALUES (2, 'Bob', 92000, 1);
        INSERT INTO workers VALUES (3, 'Charlie', 78000, 2);
        INSERT INTO workers VALUES (4, 'Diana', 81000, 2);
        INSERT INTO workers VALUES (5, 'Eve', 95000, 1);
        INSERT INTO workers VALUES (6, 'Frank', 72000, 3);
        INSERT INTO workers VALUES (7, 'Grace', 68000, 4);
      `,
      starterCode: "SELECT d.dept_name, -- How to calculate max salary? AS max_salary\nFROM departments d\n-- How to join workers?\n-- How to group?\nORDER BY max_salary DESC;",
      expectedQuery: "SELECT d.dept_name, MAX(w.salary) AS max_salary FROM departments d JOIN workers w ON d.id = w.department_id GROUP BY d.dept_name ORDER BY max_salary DESC;",
      hints: [
        'Use JOIN to connect departments and workers, replacing the subquery',
        'After GROUP BY department, use MAX(salary) to get each department\'s highest salary',
        'JOIN + GROUP BY scans the workers table only once, far more efficient than a correlated subquery',
      ],
      explanation: 'A correlated subquery executes the inner query once for every row in the outer query. With N departments, that means N full scans of the workers table (O(N) full table scans). Rewriting with JOIN + GROUP BY requires only a single scan of the workers table to compute all department aggregates. On millions of rows, this can reduce execution time from 60 seconds to under 1 second. This is one of the most commonly tested SQL optimization patterns in interviews.',
      frameworkTip: 'First instinct for SQL optimization: when you see a correlated subquery in a SELECT or WHERE clause → consider whether it can be rewritten as JOIN + GROUP BY. This is almost always faster.',
    },
    {
      id: 5,
      name: 'Complex Aggregation and String Processing',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Airbnb 面試題',
      scenario: {
        title: 'Host Popularity and Average Pricing Analysis',
        narrative: 'You are on Airbnb\'s Data Team and need to analyze host popularity and pricing strategies. Each listing record has a host_name field formatted as "First Last". You need to group by host, then calculate each host\'s listing count and average nightly price.\n\nTable structure: listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER)',
        data: [
          { id: 1, host_name: 'John Smith', neighbourhood: 'Daan', room_type: 'Entire home', price: 3200, reviews_count: 45 },
          { id: 2, host_name: 'John Smith', neighbourhood: 'Xinyi', room_type: 'Private room', price: 1800, reviews_count: 32 },
          { id: 3, host_name: 'Mary Chen', neighbourhood: 'Zhongshan', room_type: 'Entire home', price: 4500, reviews_count: 78 },
          { id: 4, host_name: 'Mary Chen', neighbourhood: 'Daan', room_type: 'Entire home', price: 5200, reviews_count: 91 },
          { id: 5, host_name: 'Mary Chen', neighbourhood: 'Songshan', room_type: 'Private room', price: 2100, reviews_count: 25 },
        ],
        dataCaption: 'listings table (sample data)',
      },
      question: 'Query each host\'s listing count, average price (rounded to the nearest integer), and total review count. Filter to hosts with 2 or more listings, sorted by total reviews in descending order.',
      sampleSchema: `
        CREATE TABLE listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER);
        INSERT INTO listings VALUES (1, 'John Smith', 'Daan', 'Entire home', 3200, 2, 45);
        INSERT INTO listings VALUES (2, 'John Smith', 'Xinyi', 'Private room', 1800, 1, 32);
        INSERT INTO listings VALUES (3, 'Mary Chen', 'Zhongshan', 'Entire home', 4500, 3, 78);
        INSERT INTO listings VALUES (4, 'Mary Chen', 'Daan', 'Entire home', 5200, 2, 91);
        INSERT INTO listings VALUES (5, 'Mary Chen', 'Songshan', 'Private room', 2100, 1, 25);
        INSERT INTO listings VALUES (6, 'Tom Lee', 'Xinyi', 'Entire home', 6800, 5, 120);
        INSERT INTO listings VALUES (7, 'Amy Wang', 'Daan', 'Private room', 1500, 1, 15);
        INSERT INTO listings VALUES (8, 'Amy Wang', 'Zhongshan', 'Private room', 1600, 1, 22);
        INSERT INTO listings VALUES (9, 'Tom Lee', 'Daan', 'Entire home', 7200, 3, 95);
      `,
      starterCode: "SELECT\n  host_name,\n  -- listing count,\n  -- average price (rounded),\n  -- total reviews\nFROM listings\nGROUP BY host_name\n-- filter condition?\n-- sort order?;",
      expectedQuery: "SELECT host_name, COUNT(*) AS listing_count, ROUND(AVG(price)) AS avg_price, SUM(reviews_count) AS total_reviews FROM listings GROUP BY host_name HAVING COUNT(*) >= 2 ORDER BY total_reviews DESC;",
      hints: [
        'COUNT(*) calculates each host\'s number of listings',
        'ROUND(AVG(price)) computes the average price rounded to the nearest integer',
        'Use HAVING to filter after GROUP BY, not WHERE',
      ],
      explanation: 'This question comprehensively tests GROUP BY, aggregate functions (COUNT, AVG, SUM), the ROUND function, HAVING filtering, and ORDER BY sorting. The distinction between HAVING and WHERE is a high-frequency interview topic: WHERE filters before grouping (filters individual rows), while HAVING filters after grouping (filters aggregated results). Here, since "listing count >= 2" involves COUNT(*) — an aggregate result — you must use HAVING.',
      frameworkTip: 'The complete structure of an aggregate query: SELECT aggregate functions → FROM → WHERE (pre-grouping filter) → GROUP BY → HAVING (post-grouping filter) → ORDER BY. Writing out the full structure in an interview demonstrates solid SQL fundamentals.',
    },
  ],
}
