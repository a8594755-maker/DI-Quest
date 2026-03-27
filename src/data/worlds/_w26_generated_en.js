// ─────────────────────────────────────────────────────
// World 26 — SQL Engineering Applications (Original Challenges)
// CRUD, Database Design & Performance Optimization — SQL in Practice for Business Engineers
// ─────────────────────────────────────────────────────

export const w26GeneratedEn = {
  id: 26,
  name: 'SQL Engineering Applications',
  emoji: '⚙️',
  description: 'CRUD, Database Design & Performance Optimization — SQL in Practice for Business Engineers',
  color: 'from-violet-500 to-purple-500',
  quests: [

    /* ═══════════════════════════════════════════════════
       Quest 26-1  INSERT / UPDATE / DELETE
       ═══════════════════════════════════════════════════ */
    {
      id: '26-1',
      name: 'INSERT / UPDATE / DELETE',
      description: 'Master the core operations for inserting, updating, and safely deleting data',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. INSERT Data ──
        {
          id: 1,
          name: 'INSERT Data',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Add New Employees to the HR System',
            narrative:
              'The company just hired three new employees, and HR has asked you to enter their information into the employees table. Each employee needs a name, department, and hire date.\n\nTable structure: employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT)',
            data: [
              { id: 1, name: 'Alice Wang', department: 'Engineering', hire_date: '2024-01-15' },
              { id: 2, name: 'Mei-Ling Li', department: 'Marketing', hire_date: '2024-02-01' },
              { id: 3, name: 'David Chang', department: 'Sales', hire_date: '2024-03-10' },
            ],
            dataCaption: 'Existing data in employees',
          },
          question:
            'Use INSERT INTO to add the following three new employees to the employees table:\n- id=4, Jason Chen, Engineering, 2024-06-01\n- id=5, Grace Lin, Marketing, 2024-06-01\n- id=6, Kevin Huang, Sales, 2024-06-15',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT);
            INSERT INTO employees VALUES (1, 'Alice Wang', 'Engineering', '2024-01-15');
            INSERT INTO employees VALUES (2, 'Mei-Ling Li', 'Marketing', '2024-02-01');
            INSERT INTO employees VALUES (3, 'David Chang', 'Sales', '2024-03-10');
          `,
          starterCode:
            "-- Add three employees to the employees table\nINSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', '2024-06-01');\n-- Continue adding the remaining two...\n",
          expectedQuery:
            "INSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', '2024-06-01'); INSERT INTO employees VALUES (5, 'Grace Lin', 'Marketing', '2024-06-01'); INSERT INTO employees VALUES (6, 'Kevin Huang', 'Sales', '2024-06-15'); SELECT * FROM employees ORDER BY id;",
          hints: [
            'INSERT INTO table_name VALUES (val1, val2, ...); adds one row at a time',
            'You can also use INSERT INTO table_name (col1, col2) VALUES (...) to specify columns explicitly',
            'Use SELECT * FROM employees at the end to verify the results',
          ],
          explanation:
            'INSERT INTO is the most fundamental write operation in SQL. Full syntax: INSERT INTO table_name (col1, col2, ...) VALUES (val1, val2, ...). If you supply all values in column order, you can omit the column names. In practice, explicitly listing column names is recommended to avoid errors when the table structure changes.',
          frameworkTip:
            'INSERT tips: (1) Explicitly listing column names is safer than omitting them (2) Batch inserts can use multiple VALUES clauses or multiple INSERT statements (3) Always verify results with a SELECT query.',
        },

        // ── 2. UPDATE Data ──
        {
          id: 2,
          name: 'UPDATE Data',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Adjust Employee Departments and Salaries',
            narrative:
              'During a mid-year reorganization, all employees in the Engineering department receive a 10% raise, and David Chang is transferring from Sales to Marketing. Use UPDATE statements to make both changes.\n\nTable structure: employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL)',
            data: [
              { id: 1, name: 'Alice Wang', department: 'Engineering', salary: 80000 },
              { id: 2, name: 'Mei-Ling Li', department: 'Marketing', salary: 75000 },
              { id: 3, name: 'David Chang', department: 'Sales', salary: 70000 },
              { id: 4, name: 'Jason Chen', department: 'Engineering', salary: 85000 },
            ],
            dataCaption: 'employees table',
          },
          question:
            'Complete two updates:\n1. Increase the salary of all Engineering employees by 10%\n2. Change David Chang\'s department to Marketing',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL);
            INSERT INTO employees VALUES (1, 'Alice Wang', 'Engineering', 80000);
            INSERT INTO employees VALUES (2, 'Mei-Ling Li', 'Marketing', 75000);
            INSERT INTO employees VALUES (3, 'David Chang', 'Sales', 70000);
            INSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', 85000);
          `,
          starterCode:
            "-- 1. Give Engineering department a 10% raise\nUPDATE employees\nSET salary = salary * 1.1\nWHERE department = 'Engineering';\n\n-- 2. Transfer David Chang to another department\n-- Complete this UPDATE ...\n\nSELECT * FROM employees ORDER BY id;",
          expectedQuery:
            "UPDATE employees SET salary = salary * 1.1 WHERE department = 'Engineering'; UPDATE employees SET department = 'Marketing' WHERE name = 'David Chang'; SELECT * FROM employees ORDER BY id;",
          hints: [
            'UPDATE table_name SET column = new_value WHERE condition;',
            'A 10% raise can be written as salary = salary * 1.1',
            'Always include a WHERE clause — otherwise ALL rows will be updated!',
          ],
          explanation:
            'UPDATE with a WHERE clause allows you to precisely modify specific rows. The most important rule: never forget the WHERE clause. An UPDATE without WHERE affects every row in the table — a catastrophic mistake in production environments.',
          frameworkTip:
            'UPDATE safety checklist: (1) First run a SELECT to confirm which rows the WHERE clause targets (2) Verify the scope is correct before executing the UPDATE (3) Execute within a Transaction so you can ROLLBACK on errors.',
        },

        // ── 3. Safe DELETE ──
        {
          id: 3,
          name: 'Safe DELETE',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Clean Up Expired Orders and Related Items',
            narrative:
              'The e-commerce system has two tables: orders and order_items. Management has requested that all orders from before 2023 (not including 2023) and their associated line items be deleted. You must delete from the child table (order_items) first, then from the parent table (orders), to avoid foreign key constraint violations.\n\nTable structure:\n- orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL)\n- order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER)',
            data: [
              { id: 1, customer: 'Alice Wang', order_date: '2022-06-15', total: 1500 },
              { id: 2, customer: 'Mei-Ling Li', order_date: '2022-11-20', total: 3200 },
              { id: 3, customer: 'David Chang', order_date: '2023-03-10', total: 800 },
              { id: 4, customer: 'Jason Chen', order_date: '2024-01-05', total: 2100 },
            ],
            dataCaption: 'orders table (order_items omitted)',
          },
          question:
            'Safely delete all orders from before 2023: first delete the corresponding order_items, then delete the orders. Use SELECT to verify data before and after deletion.',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL);
            INSERT INTO orders VALUES (1, 'Alice Wang', '2022-06-15', 1500);
            INSERT INTO orders VALUES (2, 'Mei-Ling Li', '2022-11-20', 3200);
            INSERT INTO orders VALUES (3, 'David Chang', '2023-03-10', 800);
            INSERT INTO orders VALUES (4, 'Jason Chen', '2024-01-05', 2100);
            CREATE TABLE order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER);
            INSERT INTO order_items VALUES (1, 1, 'Laptop', 1);
            INSERT INTO order_items VALUES (2, 1, 'Mouse', 2);
            INSERT INTO order_items VALUES (3, 2, 'Monitor', 1);
            INSERT INTO order_items VALUES (4, 3, 'Keyboard', 1);
            INSERT INTO order_items VALUES (5, 4, 'Headphones', 3);
          `,
          starterCode:
            "-- Step 1: Identify which orders to delete\nSELECT * FROM orders WHERE order_date < '2023-01-01';\n\n-- Step 2: Delete related data from the child table first\n-- DELETE FROM order_items WHERE ...;\n\n-- Step 3: Then delete from the parent table\n-- DELETE FROM orders WHERE ...;\n\n-- Step 4: Verify results\nSELECT * FROM orders;\nSELECT * FROM order_items;",
          expectedQuery:
            "DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE order_date < '2023-01-01'); DELETE FROM orders WHERE order_date < '2023-01-01'; SELECT * FROM orders; SELECT * FROM order_items;",
          hints: [
            'First use SELECT to confirm the WHERE clause captures the correct data',
            'For order_items, use a subquery: WHERE order_id IN (SELECT id FROM orders WHERE ...)',
            'Deletion order matters: child table first, then parent table, to avoid foreign key constraint errors',
          ],
          explanation:
            'When deleting data from tables with foreign key relationships, you must follow the correct deletion order: delete from the child table (the referencing side) first, then the parent table (the referenced side). Here we use a subquery WHERE order_id IN (SELECT id FROM orders WHERE ...) to precisely target the order_items to delete. In practice, you can also set ON DELETE CASCADE to let the database handle this automatically, but manual control is safer.',
          frameworkTip:
            'Safe DELETE in 4 steps: (1) SELECT to confirm scope (2) Delete from child table (3) Delete from parent table (4) SELECT to verify results. In production, always execute within a Transaction.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-2  CREATE TABLE & Data Types
       ═══════════════════════════════════════════════════ */
    {
      id: '26-2',
      name: 'CREATE TABLE & Data Types',
      description: 'Design table structures, choose appropriate data types, and apply constraints',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. CREATE TABLE ──
        {
          id: 1,
          name: 'CREATE TABLE',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Design an E-Commerce Products Table',
            narrative:
              'You are developing the backend for an e-commerce platform and need to create a products table to store product information. Requirements:\n- Each product has a unique id (auto-incrementing primary key)\n- Product name cannot be null\n- Price is a decimal with a default value of 0\n- Stock quantity is an integer that cannot be negative\n- Category is text\n- Listing date is stored as text',
            data: [
              { column: 'id', type: 'INTEGER', constraint: 'PRIMARY KEY' },
              { column: 'name', type: 'TEXT', constraint: 'NOT NULL' },
              { column: 'price', type: 'REAL', constraint: 'DEFAULT 0' },
              { column: 'stock', type: 'INTEGER', constraint: 'CHECK(stock >= 0)' },
              { column: 'category', type: 'TEXT', constraint: '' },
              { column: 'listed_date', type: 'TEXT', constraint: '' },
            ],
            dataCaption: 'Expected column design',
          },
          question:
            'Create the products table according to the requirements, insert two test records, and use SELECT to view the results.',
          sampleSchema: '',
          starterCode:
            "-- Create the products table\nCREATE TABLE products (\n  id INTEGER PRIMARY KEY,\n  name TEXT NOT NULL,\n  -- Complete the remaining columns...\n);\n\n-- Insert test data\nINSERT INTO products (name, price, stock, category, listed_date)\nVALUES ('Wireless Bluetooth Earbuds', 1290, 50, 'Electronics', '2024-06-01');\n\n-- Insert another record...\n\nSELECT * FROM products;",
          expectedQuery:
            "CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL, price REAL DEFAULT 0, stock INTEGER CHECK(stock >= 0), category TEXT, listed_date TEXT); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('Wireless Bluetooth Earbuds', 1290, 50, 'Electronics', '2024-06-01'); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('Mechanical Keyboard', 2490, 30, 'Electronics', '2024-06-10'); SELECT * FROM products;",
          hints: [
            'In SQLite, INTEGER PRIMARY KEY automatically auto-increments',
            'CHECK constraints can limit the range of column values, e.g., CHECK(stock >= 0)',
            'DEFAULT sets a default value for a column',
          ],
          explanation:
            'CREATE TABLE is the foundation of defining database structure. SQLite has relatively simple data types: INTEGER, REAL, TEXT, BLOB. Constraints include PRIMARY KEY, NOT NULL (required field), UNIQUE, DEFAULT (default value), and CHECK (conditional validation). Good table design prevents invalid data from entering the system at the source.',
          frameworkTip:
            'CREATE TABLE design principles: (1) Every table should have a PRIMARY KEY (2) Use NOT NULL to protect required fields (3) Use CHECK to restrict value ranges (4) Use DEFAULT to provide sensible default values.',
        },

        // ── 2. Data Types & Constraints (MC) ──
        {
          id: 2,
          name: 'Data Types & Constraints',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Choose the Correct Data Types and Constraints',
            narrative:
              'You are designing a database for a logistics company. One of the tables, shipments, has the following columns: shipment ID (unique identifier), recipient name (required), weight in kg (can have decimals), shipping fee (cannot be negative), and status (can only be pending / shipped / delivered).',
            data: [
              { column: 'shipment_id', description: 'Unique identifier' },
              { column: 'recipient', description: 'Required recipient name' },
              { column: 'weight_kg', description: 'Weight, may have decimals' },
              { column: 'shipping_fee', description: 'Shipping fee, cannot be negative' },
              { column: 'status', description: 'Must be pending/shipped/delivered' },
            ],
            dataCaption: 'shipments table requirements',
          },
          question:
            'Which of the following CREATE TABLE statements most correctly implements the requirements above?',
          options: [
            {
              id: 'A',
              text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee >= 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));",
              explanation: 'Correct! INTEGER PRIMARY KEY for the unique identifier, TEXT NOT NULL ensures the required field, REAL handles decimals, and CHECK constraints limit the value range and allowed options.',
            },
            {
              id: 'B',
              text: "CREATE TABLE shipments (shipment_id VARCHAR PRIMARY KEY, recipient VARCHAR, weight_kg DECIMAL, shipping_fee DECIMAL, status VARCHAR);",
              explanation: 'Incorrect. SQLite does not use VARCHAR or DECIMAL (use TEXT and REAL instead); recipient is missing NOT NULL; shipping_fee and status have no CHECK constraints.',
            },
            {
              id: 'C',
              text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT, weight_kg REAL, shipping_fee REAL, status TEXT DEFAULT 'pending');",
              explanation: 'Not fully correct. recipient is missing NOT NULL, shipping_fee is missing CHECK(>= 0), and status has a DEFAULT but no CHECK constraint to restrict the allowed values.',
            },
            {
              id: 'D',
              text: "CREATE TABLE shipments (shipment_id INTEGER UNIQUE, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee > 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));",
              explanation: 'Close but not fully correct. shipment_id uses UNIQUE instead of PRIMARY KEY (missing a primary key); shipping_fee uses CHECK(> 0), but the fee could be 0 for free shipping — it should be >= 0.',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'SQLite uses TEXT instead of VARCHAR, and REAL instead of DECIMAL',
            'NOT NULL ensures a column cannot be empty',
            "CHECK(status IN ('a', 'b', 'c')) restricts the allowed values",
          ],
          explanation:
            'Choosing appropriate data types and designing constraints is fundamental to database design. SQLite has simple types (INTEGER, REAL, TEXT, BLOB), but combined with CHECK, NOT NULL, DEFAULT, and other constraints, you can prevent invalid data at the database level. Good schema design means your application needs far less validation logic.',
          frameworkTip:
            'Constraint selection guide: Unique identifier -> PRIMARY KEY; Required field -> NOT NULL; Numeric range -> CHECK; Allowed value list -> CHECK ... IN (...); Default value -> DEFAULT.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-3  CRUD & Application Data Flow
       ═══════════════════════════════════════════════════ */
    {
      id: '26-3',
      name: 'CRUD & Application Data Flow',
      description: 'Understand how CRUD operations map to web application data flows',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. Complete CRUD Operations ──
        {
          id: 1,
          name: 'Complete CRUD Operations',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Full CRUD for a To-Do App',
            narrative:
              'You are developing the backend API for a to-do application. You need to perform the following operations in order:\n1. Create — Add a new to-do item\n2. Read — Query all to-do items\n3. Update — Mark an item as completed\n4. Delete — Remove all completed items\n\nTable structure: todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT)',
            data: [
              { id: 1, title: 'Finish project report', is_done: 0, created_at: '2024-06-01' },
              { id: 2, title: 'Prepare weekly meeting slides', is_done: 1, created_at: '2024-06-02' },
              { id: 3, title: 'Reply to client emails', is_done: 0, created_at: '2024-06-03' },
            ],
            dataCaption: 'todos table',
          },
          question:
            'Execute CRUD operations in order:\n1. INSERT a new item: "Deploy new version"\n2. SELECT all to-do items\n3. UPDATE id=1 to mark as completed\n4. DELETE all completed items\nFinally, SELECT to verify the results.',
          sampleSchema: `
            CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT);
            INSERT INTO todos VALUES (1, 'Finish project report', 0, '2024-06-01');
            INSERT INTO todos VALUES (2, 'Prepare weekly meeting slides', 1, '2024-06-02');
            INSERT INTO todos VALUES (3, 'Reply to client emails', 0, '2024-06-03');
          `,
          starterCode:
            "-- C: Create\nINSERT INTO todos (title, created_at) VALUES ('Deploy new version', '2024-06-04');\n\n-- R: Read\nSELECT * FROM todos;\n\n-- U: Update (mark id=1 as completed)\n-- UPDATE ...\n\n-- D: Delete (remove all completed items)\n-- DELETE ...\n\n-- Verify final results\nSELECT * FROM todos;",
          expectedQuery:
            "INSERT INTO todos (title, created_at) VALUES ('Deploy new version', '2024-06-04'); SELECT * FROM todos; UPDATE todos SET is_done = 1 WHERE id = 1; DELETE FROM todos WHERE is_done = 1; SELECT * FROM todos;",
          hints: [
            'UPDATE todos SET is_done = 1 WHERE id = 1;',
            'DELETE FROM todos WHERE is_done = 1; removes all completed items',
            'CRUD stands for Create (INSERT), Read (SELECT), Update (UPDATE), Delete (DELETE)',
          ],
          explanation:
            'CRUD is the core operation pattern for all data-driven applications. Nearly every web/app backend performs CRUD operations on a database. Understanding how these four operations combine to form complete business logic is foundational for becoming a Business Engineer.',
          frameworkTip:
            'CRUD mapping: Create -> INSERT, Read -> SELECT, Update -> UPDATE, Delete -> DELETE. In REST APIs, these correspond to POST, GET, PUT/PATCH, and DELETE respectively.',
        },

        // ── 2. HTTP to SQL Mapping (MC) ──
        {
          id: 2,
          name: 'HTTP to SQL Mapping',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'REST API and SQL Correspondence',
            narrative:
              'You are designing a REST API to manage customer data. The frontend sends different HTTP requests, and the backend needs to map them to the correct SQL operations.\n\nFor example:\n- Frontend sends POST /api/customers with a JSON body -> What SQL does the backend execute?\n- Frontend sends GET /api/customers/123 -> What SQL does the backend execute?\n- Frontend sends PUT /api/customers/123 with a JSON body -> What SQL does the backend execute?\n- Frontend sends DELETE /api/customers/123 -> What SQL does the backend execute?',
            data: [
              { method: 'POST', path: '/api/customers', action: 'Create customer' },
              { method: 'GET', path: '/api/customers/:id', action: 'Query single customer' },
              { method: 'PUT', path: '/api/customers/:id', action: 'Update customer data' },
              { method: 'DELETE', path: '/api/customers/:id', action: 'Delete customer' },
            ],
            dataCaption: 'REST API endpoints',
          },
          question:
            'Which option correctly describes the mapping between HTTP methods and SQL operations?',
          options: [
            {
              id: 'A',
              text: 'POST -> INSERT, GET -> SELECT, PUT -> UPDATE, DELETE -> DELETE',
              explanation: 'Correct! This is the standard mapping in RESTful APIs. POST creates a resource (INSERT), GET reads (SELECT), PUT updates (UPDATE), and DELETE removes (DELETE).',
            },
            {
              id: 'B',
              text: 'GET -> INSERT, POST -> SELECT, PUT -> DELETE, DELETE -> UPDATE',
              explanation: 'Completely wrong. GET is a read operation and should not modify data; POST is a create operation, not a query.',
            },
            {
              id: 'C',
              text: 'POST -> INSERT, GET -> SELECT, PATCH -> INSERT, DELETE -> UPDATE',
              explanation: 'Incorrect. PATCH is for partial updates, not creation; DELETE is for deletion, not updating.',
            },
            {
              id: 'D',
              text: 'POST -> SELECT, GET -> INSERT, PUT -> DELETE, DELETE -> UPDATE',
              explanation: 'Completely reversed. POST is a write operation, GET is a read operation, PUT is for updates, and DELETE is for deletion.',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'HTTP GET is a "read" operation, mapping to the SQL "read" operation',
            'POST means "create a new resource"',
            'REST design principles require that HTTP methods have clear semantics',
          ],
          explanation:
            'The core design principle of RESTful APIs is to make HTTP methods semantic: POST (create) -> INSERT, GET (read) -> SELECT, PUT/PATCH (update) -> UPDATE, DELETE (remove) -> DELETE. This CRUD mapping is fundamental web development knowledge and a common interview topic. Additionally, PUT is a full update while PATCH is a partial update — the difference maps to how many columns the UPDATE SET clause modifies.',
          frameworkTip:
            'HTTP <-> CRUD <-> SQL triple mapping: POST=Create=INSERT, GET=Read=SELECT, PUT/PATCH=Update=UPDATE, DELETE=Delete=DELETE.',
        },

        // ── 3. Transaction Processing ──
        {
          id: 3,
          name: 'Transaction Processing',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Bank Transfer Transaction Safety',
            narrative:
              'In a banking system, a transfer must be an atomic operation: debiting Account A and crediting Account B must either both succeed or both fail. If the debit succeeds but the credit fails (e.g., due to a system crash), the entire operation must be rolled back (ROLLBACK).\n\nTable structure: accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0))',
            data: [
              { id: 1, owner: 'Alice Wang', balance: 50000 },
              { id: 2, owner: 'Mei-Ling Li', balance: 30000 },
              { id: 3, owner: 'David Chang', balance: 10000 },
            ],
            dataCaption: 'accounts balances',
          },
          question:
            'Use BEGIN / COMMIT to implement a transfer transaction: transfer 15,000 from Alice Wang (id=1) to Mei-Ling Li (id=2). Ensure both UPDATEs are completed within a single transaction.',
          sampleSchema: `
            CREATE TABLE accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0));
            INSERT INTO accounts VALUES (1, 'Alice Wang', 50000);
            INSERT INTO accounts VALUES (2, 'Mei-Ling Li', 30000);
            INSERT INTO accounts VALUES (3, 'David Chang', 10000);
          `,
          starterCode:
            "-- Begin the transaction\nBEGIN TRANSACTION;\n\n-- Debit 15000 from Alice Wang's account\nUPDATE accounts SET balance = balance - 15000 WHERE id = 1;\n\n-- Credit 15000 to Mei-Ling Li's account\n-- Complete this...\n\n-- Commit the transaction\nCOMMIT;\n\n-- Verify results\nSELECT * FROM accounts;",
          expectedQuery:
            'BEGIN TRANSACTION; UPDATE accounts SET balance = balance - 15000 WHERE id = 1; UPDATE accounts SET balance = balance + 15000 WHERE id = 2; COMMIT; SELECT * FROM accounts;',
          hints: [
            'BEGIN TRANSACTION starts a transaction, COMMIT saves it, ROLLBACK undoes it',
            'Both UPDATEs must be placed between BEGIN and COMMIT',
            'CHECK(balance >= 0) prevents the balance from going negative',
          ],
          explanation:
            'A Transaction ensures the atomicity of a group of operations: either all succeed or all are rolled back. The ACID properties are: Atomicity, Consistency, Isolation, and Durability. Bank transfers are the classic transaction scenario and are frequently used in interviews to test your understanding of Transactions.',
          frameworkTip:
            'Transaction in 3 steps: BEGIN -> Execute multiple SQL statements -> COMMIT (on success) or ROLLBACK (on failure). Financial operations, inventory deductions, and other multi-table changes should always use Transactions.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-4  SQL & Python Integration
       ═══════════════════════════════════════════════════ */
    {
      id: '26-4',
      name: 'SQL & Python Integration',
      description: 'Learn about SQL injection prevention and best practices for using SQL in Python',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. SQL Injection Prevention (MC) ──
        {
          id: 1,
          name: 'SQL Injection Prevention',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Preventing SQL Injection Attacks',
            narrative:
              'Your colleague wrote a Python login verification script:\n\n```python\nusername = input("Username: ")\npassword = input("Password: ")\nquery = f"SELECT * FROM users WHERE username = \'{username}\' AND password = \'{password}\'"\ncursor.execute(query)\n```\n\nThis code has a severe security vulnerability. If a user enters `admin\' --` in the username field, the SQL becomes:\nSELECT * FROM users WHERE username = \'admin\' --\' AND password = \'...\'\n\nEverything after `--` becomes a comment, and the password check is bypassed!',
            data: [
              { input: "admin' --", result: 'Bypasses password verification, logs in as admin directly' },
              { input: "' OR '1'='1", result: 'Returns all user data' },
              { input: "'; DROP TABLE users; --", result: 'Drops the entire users table' },
            ],
            dataCaption: 'Common SQL injection attack examples',
          },
          question:
            'Which of the following is the best practice for preventing SQL injection?',
          options: [
            {
              id: 'A',
              text: 'Use parameterized queries: cursor.execute("SELECT * FROM users WHERE username = ? AND password = ?", (username, password))',
              explanation: 'Correct! Parameterized queries let the database engine automatically handle escaping of special characters, fundamentally preventing SQL injection. This is the industry-recognized best practice.',
            },
            {
              id: 'B',
              text: "Manually filter special characters: username = username.replace(\"'\", \"''\")",
              explanation: 'Not recommended. Manual filtering is prone to missing edge cases (such as Unicode characters or different database escaping rules) and is difficult to maintain. Use the database\'s parameterized query mechanism instead.',
            },
            {
              id: 'C',
              text: 'Limit input length: if len(username) > 20: raise Error',
              explanation: 'Insufficient. Limiting length can reduce risk but cannot truly prevent injection. A short string like \' OR 1=1-- is already enough for an attack.',
            },
            {
              id: 'D',
              text: 'Allow only alphanumeric characters: re.match(r"^[a-zA-Z0-9]+$", username)',
              explanation: 'Overly restrictive and not comprehensive. Some valid usernames may contain special characters (like email format). Parameterized queries are the fundamental solution.',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'Parameterized queries use ? or :name as placeholders, and the database handles escaping automatically',
            'f-strings or string concatenation are the root cause of SQL injection',
            'ORMs (like SQLAlchemy) use parameterized queries internally',
          ],
          explanation:
            'SQL Injection is the number one vulnerability on the OWASP Top 10. The golden rule of defense: never use string concatenation to build SQL queries. Use parameterized queries to let the database engine handle special characters. Python sqlite3 uses ? placeholders; other languages/frameworks have similar mechanisms (e.g., Java PreparedStatement, Node.js $ placeholders).',
          frameworkTip:
            'Three principles for preventing SQL injection: (1) Always use parameterized queries (2) Never concatenate user input into SQL strings (3) Using an ORM framework can further reduce risk.',
        },

        // ── 2. Python + SQL Integration Design (open-ended) ──
        {
          id: 2,
          name: 'Python + SQL Integration Design',
          type: 'open-ended',
          difficulty: 'medium',
          scenario: {
            title: 'Design a Python + SQLite Data Access Layer',
            narrative:
              'Your team is developing a Customer Management System using Python + SQLite. You need to design a Data Access Layer (DAL) so that business logic can operate on the database through clean Python functions without writing SQL directly.\n\nRequired operations:\n- Create tables (initialization)\n- Add a customer\n- Query a customer by ID\n- Update customer data\n- Delete a customer\n\nConsider how to organize the code, handle errors, and ensure security.',
            data: [
              { function: 'init_db()', description: 'Create tables' },
              { function: 'create_customer(name, email)', description: 'Add a customer' },
              { function: 'get_customer(id)', description: 'Query a single customer' },
              { function: 'update_customer(id, **kwargs)', description: 'Update a customer' },
              { function: 'delete_customer(id)', description: 'Delete a customer' },
            ],
            dataCaption: 'Expected function interface',
          },
          question:
            'Describe how you would design this Python + SQLite data access layer. Your answer should cover:\n1. Table structure design\n2. Connection management (when to open/close connections)\n3. Error handling strategy\n4. SQL injection prevention\n5. Would you use raw sqlite3 or an ORM? Why?',
          prompt:
            'Design a Python + SQLite customer management data access layer, explaining your table design, connection management, error handling, security approach, and technology choices.',
          evaluationCriteria: [
            'Sensible table design (includes PRIMARY KEY, NOT NULL, and other constraints)',
            'Uses parameterized queries to prevent SQL injection',
            'Has a reasonable connection management strategy (e.g., using a context manager)',
            'Includes error handling (try/except or Transaction rollback)',
            'Can explain the trade-offs between sqlite3 and an ORM',
          ],
          sampleAnswer:
            'Table design: CREATE TABLE customers (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, phone TEXT, created_at TEXT DEFAULT CURRENT_TIMESTAMP).\n\nConnection management: Use Python\'s context manager (with statement) to manage connections, ensuring proper closure even if errors occur. This can be wrapped in a get_connection() function.\n\nError handling: Each operation is wrapped in try/except, catching sqlite3.IntegrityError (e.g., UNIQUE violations) and sqlite3.OperationalError. Write operations are placed inside Transactions and ROLLBACK on error.\n\nSQL injection prevention: All queries use parameterized syntax — cursor.execute("SELECT * FROM customers WHERE id = ?", (customer_id,)) — never using f-strings for concatenation.\n\nTechnology choice: For small projects, raw sqlite3 is sufficient — the code is transparent and has minimal dependencies. For medium to large projects, SQLAlchemy ORM is recommended for its Pythonic code, support for multiple database backends, and automatic schema migration. The trade-off is the ORM\'s learning curve and performance overhead.',
          hints: [
            'Python\'s with sqlite3.connect(...) as conn automatically manages Transactions',
            'Use ? placeholders for parameterized queries — never use f-strings',
            'Consider: if the project scales up, can your design smoothly migrate to PostgreSQL?',
          ],
          explanation:
            'The Data Access Layer (DAL / Repository Pattern) is a critical layer in software architecture. It encapsulates database operations in an independent module so that business logic does not depend directly on a specific database. A good DAL design considers: connection management, error handling, security (injection prevention), testability (can be mocked), and future extensibility (only the DAL needs to change when switching databases).',
          frameworkTip:
            'DAL design checklist: (1) Use context managers for connection management (2) All SQL uses parameterized queries (3) Write operations use Transactions (4) Errors have clear handling and reporting (5) Function interfaces are separated from SQL implementation.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-5  Permissions, Data Isolation & Query Performance
       ═══════════════════════════════════════════════════ */
    {
      id: '26-5',
      name: 'Permissions, Data Isolation & Query Performance',
      description: 'Database permission management, indexing, and query performance optimization',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. Permission Management Concepts (MC) ──
        {
          id: 1,
          name: 'Permission Management Concepts',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Database Permission Model',
            narrative:
              'Your company has an internal data warehouse where different roles require different access permissions:\n\n- Data Analyst: Only needs to read data (SELECT)\n- Application Account: Needs read/write access (SELECT, INSERT, UPDATE, DELETE)\n- DBA Administrator: Needs full privileges (including CREATE, DROP, GRANT)\n\nIn enterprise databases like PostgreSQL / MySQL, this is managed through GRANT / REVOKE statements. (SQLite does not support GRANT/REVOKE, but the concept is frequently tested in interviews.)',
            data: [
              { role: 'Data Analyst', permissions: 'SELECT' },
              { role: 'Application Account', permissions: 'SELECT, INSERT, UPDATE, DELETE' },
              { role: 'DBA Administrator', permissions: 'ALL PRIVILEGES' },
            ],
            dataCaption: 'Role-to-permission mapping',
          },
          question:
            'Which of the following descriptions about database permission management is correct?',
          options: [
            {
              id: 'A',
              text: 'GRANT SELECT ON customers TO analyst; grants the analyst role read-only access to the customers table. REVOKE is used to remove previously granted permissions. The Principle of Least Privilege requires granting only the minimum permissions needed to perform the job.',
              explanation: 'Correct! GRANT grants permissions, REVOKE revokes them, and following the Principle of Least Privilege is the foundation of database security. Each role should only have the minimum permissions required for their work.',
            },
            {
              id: 'B',
              text: 'For easier management, all accounts should be given ALL PRIVILEGES, and access should be controlled at the application layer.',
              explanation: 'Seriously wrong! This violates the Principle of Least Privilege. If the application has a vulnerability, an attacker can do anything. Permissions should be controlled at the database level.',
            },
            {
              id: 'C',
              text: 'GRANT and REVOKE only apply to SQLite; large-scale databases use other mechanisms.',
              explanation: 'The opposite is true. SQLite is an embedded database and does not support GRANT/REVOKE. These are features of multi-user databases like PostgreSQL, MySQL, and SQL Server.',
            },
            {
              id: 'D',
              text: 'Database permissions only need to be configured once during initial setup and require no ongoing maintenance.',
              explanation: 'Incorrect. Permissions need continuous maintenance as personnel change and roles shift. Permissions must be revoked when employees leave and adjusted when new features launch — this is ongoing work.',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'GRANT grants permissions, REVOKE revokes them — these are basic security mechanisms in enterprise databases',
            'Principle of Least Privilege: only grant necessary permissions, nothing more',
            'SQLite does not support GRANT/REVOKE, but the concept is commonly tested in interviews',
          ],
          explanation:
            'Database permission management is a critical part of enterprise security. While GRANT/REVOKE syntax is not applicable in SQLite, it is essential knowledge for multi-user databases like PostgreSQL and MySQL. The Principle of Least Privilege means: analysts only need SELECT, application accounts need CRUD, and only DBAs should have DDL and GRANT privileges. Row-Level Security (RLS) provides even finer control, allowing different users to see different rows of data.',
          frameworkTip:
            'Three levels of permission management: (1) Database level — GRANT/REVOKE controls table and operation permissions (2) Row level — Row-Level Security controls visible data scope (3) Application level — additional permission checks in business logic.',
        },

        // ── 2. Indexing & Performance ──
        {
          id: 2,
          name: 'Indexing & Performance',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Create Indexes for Slow Queries',
            narrative:
              'Your e-commerce platform has an orders table with 1 million rows, and the following query takes 5 seconds:\n\nSELECT * FROM orders WHERE customer_id = 12345 AND status = \'shipped\';\n\nBecause there are no indexes, the database performed a Full Table Scan. You need to create appropriate indexes to speed up the query.\n\nTable structure: orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT)',
            data: [
              { id: 1, customer_id: 100, product: 'Laptop', status: 'shipped', amount: 35000, order_date: '2024-03-15' },
              { id: 2, customer_id: 200, product: 'Phone', status: 'pending', amount: 28000, order_date: '2024-03-16' },
              { id: 3, customer_id: 100, product: 'Mouse', status: 'delivered', amount: 800, order_date: '2024-03-17' },
              { id: 4, customer_id: 300, product: 'Monitor', status: 'shipped', amount: 12000, order_date: '2024-03-18' },
            ],
            dataCaption: 'orders table (actually has millions of rows)',
          },
          question:
            'Create indexes for common query patterns:\n1. Create a composite index on customer_id and status\n2. Create an index on order_date (since date range queries are frequent)\n3. Use EXPLAIN QUERY PLAN to verify whether the indexes are being used',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 100, 'Laptop', 'shipped', 35000, '2024-03-15');
            INSERT INTO orders VALUES (2, 200, 'Phone', 'pending', 28000, '2024-03-16');
            INSERT INTO orders VALUES (3, 100, 'Mouse', 'delivered', 800, '2024-03-17');
            INSERT INTO orders VALUES (4, 300, 'Monitor', 'shipped', 12000, '2024-03-18');
            INSERT INTO orders VALUES (5, 100, 'Keyboard', 'shipped', 2500, '2024-03-19');
            INSERT INTO orders VALUES (6, 200, 'Headphones', 'delivered', 3200, '2024-03-20');
          `,
          starterCode:
            "-- 1. Create a composite index (customer_id + status)\nCREATE INDEX idx_orders_customer_status\n  ON orders (customer_id, status);\n\n-- 2. Create a date index\n-- CREATE INDEX ...\n\n-- 3. Use EXPLAIN QUERY PLAN to check index effectiveness\nEXPLAIN QUERY PLAN\nSELECT * FROM orders\nWHERE customer_id = 100 AND status = 'shipped';",
          expectedQuery:
            "CREATE INDEX idx_orders_customer_status ON orders (customer_id, status); CREATE INDEX idx_orders_date ON orders (order_date); EXPLAIN QUERY PLAN SELECT * FROM orders WHERE customer_id = 100 AND status = 'shipped';",
          hints: [
            'CREATE INDEX index_name ON table_name (col1, col2); creates a composite index',
            'Column order matters in composite indexes: place high-selectivity columns first',
            'EXPLAIN QUERY PLAN shows whether the query is using an index',
          ],
          explanation:
            'Indexes are the key to speeding up queries. Without an index, the database must scan every row (Full Table Scan); with an index, it can locate target data directly (Index Scan). Composite indexes are ideal for multi-condition queries, and column order follows the Leftmost Prefix Rule. However, indexes have a cost: they consume additional storage and slow down writes (INSERT/UPDATE/DELETE must also update the index).',
          frameworkTip:
            'Index design principles: (1) Create indexes on columns frequently used in WHERE, JOIN, and ORDER BY (2) Composite indexes follow the leftmost prefix rule (3) Place high-selectivity columns first (4) Avoid over-indexing; be conservative on write-heavy tables (5) Use EXPLAIN to verify.',
        },

        // ── 3. Query Performance Analysis (MC, hard) ──
        {
          id: 3,
          name: 'Query Performance Analysis',
          type: 'multiple-choice',
          difficulty: 'hard',
          scenario: {
            title: 'Analyze and Optimize a Slow Query',
            narrative:
              'A data analyst reports that the following query takes 30 seconds on the orders table with 1 million rows:\n\n```sql\nSELECT c.name, SUM(o.amount) AS total_spent\nFROM orders o\nJOIN customers c ON o.customer_id = c.id\nWHERE SUBSTR(o.order_date, 1, 7) = \'2024-03\'\nGROUP BY c.name\nHAVING SUM(o.amount) > 10000\nORDER BY total_spent DESC;\n```\n\nUsing EXPLAIN QUERY PLAN, you discover the orders table is doing a Full Table Scan. There is an existing idx_orders_date (order_date) index on orders.',
            data: [
              { issue: 'SUBSTR(o.order_date, 1, 7)', impact: 'Function wrapping the column causes index invalidation' },
              { issue: 'Full Table Scan on orders', impact: 'Scanning 1M rows is extremely slow' },
              { issue: 'Missing index on JOIN column', impact: 'customer_id may also need an index' },
            ],
            dataCaption: 'Performance issue analysis',
          },
          question:
            'Which optimization approach would most effectively improve this query\'s performance?',
          options: [
            {
              id: 'A',
              text: "Change WHERE SUBSTR(o.order_date, 1, 7) = '2024-03' to WHERE o.order_date >= '2024-03-01' AND o.order_date < '2024-04-01', allowing the index to be used correctly (Sargable query). Also ensure customer_id has an index to speed up the JOIN.",
              explanation: 'Correct! Applying a function (like SUBSTR) to a column in a WHERE clause causes the index to become unusable. Switching to a range query allows the database to leverage the order_date index. This is the concept of a Sargable (Search ARGument ABLE) query.',
            },
            {
              id: 'B',
              text: 'Create an expression index on SUBSTR(o.order_date, 1, 7) so the original query can use the index.',
              explanation: 'While some databases support expression indexes, SQLite has limited support. More importantly, rewriting as a range query is a more universal and simpler approach that requires no additional indexes.',
            },
            {
              id: 'C',
              text: 'Remove GROUP BY and HAVING, and use a subquery to JOIN first and then filter, which reduces the scan scope.',
              explanation: 'Incorrect. The performance bottleneck is the index invalidation in the WHERE clause, not in GROUP BY and HAVING. Even if you restructure the query, the SUBSTR-caused index problem persists.',
            },
            {
              id: 'D',
              text: 'Add more memory and CPU resources, because a Full Table Scan on 1 million rows needs better hardware.',
              explanation: 'Hardware upgrades are a last resort, not the first choice. The correct approach is to optimize queries and indexes first. Converting a Full Table Scan to an Index Scan delivers far greater improvement than hardware upgrades.',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'Applying functions (SUBSTR, YEAR, LOWER, etc.) to columns in WHERE clauses causes indexes to become unusable',
            'Sargable = Search ARGument ABLE = a query pattern that allows index usage',
            'Range queries (>= and <) can leverage B-Tree indexes',
          ],
          explanation:
            'The first step in query performance optimization is ensuring indexes are used correctly. The most common cause of index invalidation is applying functions to columns in WHERE clauses (Non-Sargable Query). SUBSTR(order_date, 1, 7) forces the database to compute SUBSTR for every row before comparing, making the index unusable. Changing to a range query order_date >= ... AND order_date < ... allows the database to perform a range scan on the B-Tree index, improving efficiency by orders of magnitude.',
          frameworkTip:
            'Common causes of index invalidation: (1) Functions wrapping columns in WHERE clauses (2) Implicit type conversions (3) LIKE starting with % (4) OR conditions across multiple columns (5) NOT IN / NOT EXISTS. These are must-know performance optimization topics for interviews.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-6  Boss: System Design SQL Case
       ═══════════════════════════════════════════════════ */
    {
      id: '26-6',
      name: 'Boss: System Design SQL Case',
      description: 'Comprehensive challenge: full database design and system design interview',
      xp: 200,
      isBoss: true,
      challenges: [
        // ── 1. Full Database Design (code, hard) ──
        {
          id: 1,
          name: 'Full Database Design',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'Database Design for an Online Course Platform',
            narrative:
              'You have been hired as a backend engineer for an online course platform and need to design the complete database schema. Platform requirements:\n\n1. Users (students) can register accounts\n2. Instructors can create courses\n3. Each course has multiple lessons\n4. Students can enroll in multiple courses\n5. Student progress is tracked as they complete lessons\n\nConstraints to consider:\n- A student cannot enroll in the same course twice\n- Course price cannot be negative\n- Lesson sort_order cannot be negative\n- The progress table must record completion timestamps',
            data: [
              { table: 'students', columns: 'id, name, email (unique), registered_at' },
              { table: 'instructors', columns: 'id, name, email (unique), bio' },
              { table: 'courses', columns: 'id, title, instructor_id (FK), price, created_at' },
              { table: 'lessons', columns: 'id, course_id (FK), title, sort_order, content' },
              { table: 'enrollments', columns: 'id, student_id (FK), course_id (FK), enrolled_at' },
              { table: 'progress', columns: 'id, enrollment_id (FK), lesson_id (FK), completed_at' },
            ],
            dataCaption: 'Expected table structure',
          },
          question:
            'Design the complete database schema: create all tables with correct data types, primary keys, foreign keys, and constraints, then insert some test data to verify your design.',
          sampleSchema: '',
          starterCode:
            "-- 1. Create the students table\nCREATE TABLE students (\n  id INTEGER PRIMARY KEY,\n  name TEXT NOT NULL,\n  email TEXT UNIQUE NOT NULL,\n  registered_at TEXT DEFAULT (datetime('now'))\n);\n\n-- 2. Create the instructors table\n-- CREATE TABLE instructors ...\n\n-- 3. Create the courses table (with foreign key)\n-- CREATE TABLE courses ...\n\n-- 4. Create the lessons table\n-- CREATE TABLE lessons ...\n\n-- 5. Create the enrollments table (prevent duplicate enrollment)\n-- CREATE TABLE enrollments ...\n\n-- 6. Create the progress table\n-- CREATE TABLE progress ...\n\n-- Insert test data and verify\n-- INSERT INTO ...",
          expectedQuery:
            "CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, registered_at TEXT DEFAULT (datetime('now'))); CREATE TABLE instructors (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, bio TEXT); CREATE TABLE courses (id INTEGER PRIMARY KEY, title TEXT NOT NULL, instructor_id INTEGER NOT NULL REFERENCES instructors(id), price REAL DEFAULT 0 CHECK(price >= 0), created_at TEXT DEFAULT (datetime('now'))); CREATE TABLE lessons (id INTEGER PRIMARY KEY, course_id INTEGER NOT NULL REFERENCES courses(id), title TEXT NOT NULL, sort_order INTEGER CHECK(sort_order >= 0), content TEXT); CREATE TABLE enrollments (id INTEGER PRIMARY KEY, student_id INTEGER NOT NULL REFERENCES students(id), course_id INTEGER NOT NULL REFERENCES courses(id), enrolled_at TEXT DEFAULT (datetime('now')), UNIQUE(student_id, course_id)); CREATE TABLE progress (id INTEGER PRIMARY KEY, enrollment_id INTEGER NOT NULL REFERENCES enrollments(id), lesson_id INTEGER NOT NULL REFERENCES lessons(id), completed_at TEXT DEFAULT (datetime('now'))); INSERT INTO instructors VALUES (1, 'Prof. Wang', 'wang@edu.tw', 'SQL expert with 10 years of teaching experience'); INSERT INTO students VALUES (1, 'Student Chen', 'chen@mail.com', '2024-06-01'); INSERT INTO courses VALUES (1, 'SQL from Beginner to Expert', 1, 1990, '2024-06-01'); INSERT INTO lessons VALUES (1, 1, 'SELECT Basics', 1, 'Learn basic queries'); INSERT INTO lessons VALUES (2, 1, 'Advanced JOIN', 2, 'Learn multi-table joins'); INSERT INTO enrollments VALUES (1, 1, 1, '2024-06-05'); INSERT INTO progress VALUES (1, 1, 1, '2024-06-06'); SELECT s.name AS student, c.title AS course, l.title AS lesson, p.completed_at FROM progress p JOIN enrollments e ON p.enrollment_id = e.id JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id JOIN lessons l ON p.lesson_id = l.id;",
          hints: [
            'UNIQUE(student_id, course_id) prevents duplicate enrollments',
            'REFERENCES table_name(column) establishes a foreign key relationship',
            'CHECK(price >= 0) restricts the price from being negative',
            'Create tables without foreign key dependencies first, then tables with foreign keys',
          ],
          explanation:
            'A complete database design requires considering: (1) Entity identification — each business object maps to a table (2) Relationship establishment — use foreign keys to express 1:N and N:M relationships (3) Constraint design — PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT (4) Normalization — avoid data redundancy (5) Test verification — insert data to confirm correctness. enrollments is the many-to-many junction table between students and courses; UNIQUE(student_id, course_id) ensures no duplicate enrollments.',
          frameworkTip:
            'Database design in 5 steps: (1) List all entities (2) Define attributes and types for each entity (3) Establish relationships between entities (1:1, 1:N, N:M) (4) Add constraints to prevent invalid data (5) Normalize to Third Normal Form (3NF).',
        },

        // ── 2. System Design Interview (open-ended, hard) ──
        {
          id: 2,
          name: 'System Design Interview',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: 'Design the Data Layer for an E-Commerce Platform',
            narrative:
              'The interviewer asks: "Please design the database layer for a simple e-commerce platform that supports the following features:\n\n1. Product management (CRUD)\n2. Shopping cart functionality\n3. Order creation (checkout from cart)\n4. Order history queries\n5. Basic inventory management (deduct stock on order placement)\n\nDescribe your table design, key queries, indexing strategy, and how you would handle concurrent orders (two people competing for the last item)."',
            data: [
              { feature: 'Product management', tables: 'products' },
              { feature: 'Shopping cart', tables: 'cart_items' },
              { feature: 'Order creation', tables: 'orders, order_items' },
              { feature: 'Inventory management', tables: 'products.stock' },
              { feature: 'Concurrency control', tables: 'Transaction + CHECK constraint' },
            ],
            dataCaption: 'Core features and table mapping',
          },
          question:
            'Provide a complete answer to this system design interview question. Cover:\n1. Table design (Schema Design)\n2. Key SQL queries (SQL for the checkout flow)\n3. Indexing strategy (which columns need indexes and why)\n4. Concurrency control (how to handle two people ordering simultaneously)\n5. Performance considerations (bottlenecks at high order volume and solutions)',
          prompt:
            'Design the database layer for an e-commerce platform, covering schema design, key queries, indexing strategy, concurrency control, and performance considerations.',
          evaluationCriteria: [
            'Complete and normalized table design (products, cart_items, orders, order_items)',
            'Checkout flow uses Transactions for atomicity',
            'Inventory deduction uses CHECK(stock >= 0) to prevent overselling',
            'Indexing strategy is reasonable (considers common query patterns)',
            'Mentions concurrency control approaches (pessimistic locking, optimistic locking, or CHECK constraints)',
            'Can analyze performance bottlenecks and propose solutions',
          ],
          sampleAnswer:
            'Schema design: products (id, name, price, stock CHECK(stock >= 0), category, created_at), cart_items (id, user_id, product_id, quantity, added_at, UNIQUE(user_id, product_id)), orders (id, user_id, total, status, created_at), order_items (id, order_id, product_id, quantity, price_at_purchase).\n\nCheckout flow SQL: BEGIN TRANSACTION -> INSERT INTO orders -> For each cart_item, INSERT INTO order_items and UPDATE products SET stock = stock - quantity -> DELETE FROM cart_items WHERE user_id = ? -> COMMIT. If any step fails, ROLLBACK.\n\nIndexing strategy: orders(user_id) to speed up user order history queries, cart_items(user_id) to speed up cart loading, products(category) to speed up category browsing, order_items(order_id) to speed up order detail queries.\n\nConcurrency control: CHECK(stock >= 0) is the simplest mechanism to prevent overselling — if two people compete for the last item simultaneously, the second UPDATE would make stock negative, triggering the CHECK constraint to fail, and the Transaction automatically rolls back. For more advanced control, you can use SELECT ... FOR UPDATE (pessimistic locking) or a version number column (optimistic locking).\n\nPerformance considerations: At high order volume, the orders table becomes a bottleneck — consider monthly partitioning. Hot product inventory updates face lock contention — use Redis for inventory caching with periodic sync back to the database.',
          hints: [
            'CHECK(stock >= 0) prevents inventory from going negative at the database level',
            'The checkout flow must be completed within a Transaction',
            'Think about: why does order_items record price_at_purchase instead of just JOINing products?',
          ],
          explanation:
            'E-commerce database design is a classic system design interview question. Key points: (1) Order items must snapshot the price (price_at_purchase) because product prices change (2) Inventory deduction must use Transactions for atomicity (3) CHECK constraints are the first line of defense against overselling (4) Index design should follow query patterns (5) At scale, consider partitioning, caching, and read/write splitting strategies.',
          frameworkTip:
            'Database design framework for system design interviews: (1) Draw an ER diagram first (2) Define tables and relationships (3) Write SQL for key flows (4) Design indexes (5) Discuss concurrency and performance (6) Propose scaling strategies. Remember to draw as you explain, demonstrating structured thinking.',
        },
      ],
    },
  ],
};
