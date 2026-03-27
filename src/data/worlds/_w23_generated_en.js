export const w23GeneratedEn = {
  id: 23,
  name: 'SQL Basic Queries',
  emoji: '📝',
  description: 'From SELECT to aggregate functions — build a solid foundation in SQL queries',
  color: 'from-emerald-400 to-green-500',
  quests: [
    // ══════════════════════════════════════════════════════════════════
    // Quest 23-1: Database and Table Fundamentals
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-1',
      name: 'Database and Table Fundamentals',
      description: 'Understand the basic concepts of databases, tables, primary keys, and foreign keys',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'Database Basic Concepts',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: 'First Day as a Data Analyst',
            narrative:
              'You are a data analyst who just joined an e-commerce company. Your manager walks you through the company\'s database system, which contains several tables: customers, orders, and products. He asks you some basic concept questions to gauge your foundation.',
            data: [
              { Concept: 'Database', Description: 'A container that holds all tables' },
              { Concept: 'Table', Description: 'A collection of data with the same structure, similar to an Excel worksheet' },
              { Concept: 'Row', Description: 'A single complete data record' },
              { Concept: 'Column', Description: 'A data attribute, such as name or amount' },
            ],
            dataCaption: 'Database Terminology Reference',
          },
          question: 'Which of the following statements is most accurate?',
          options: [
            {
              id: 'A',
              text: 'A Database is the same thing as a Table',
              explanation:
                'A database is a collection of multiple tables. A single database can contain tables like customers, orders, products, etc.',
            },
            {
              id: 'B',
              text: 'In a table, each Row represents a record, and each Column represents an attribute',
              explanation:
                'Correct! For example, in the customers table, a row represents one customer\'s complete data, and a column represents an attribute (such as name or email).',
            },
            {
              id: 'C',
              text: 'A Column stores a complete customer record',
              explanation:
                'A column stores a single attribute (such as name). A complete customer record is composed of all columns in a single row.',
            },
            {
              id: 'D',
              text: 'A database can only contain one table',
              explanation:
                'A database can contain many tables. For example, an e-commerce system would have tables like customers, orders, products, payments, and more.',
            },
          ],
          correctAnswer: 'B',
          hints: [
            'Think of Excel: a workbook (Database) can contain many worksheets (Tables)',
            'Each row in a table is a record, and each column is a field',
          ],
          explanation:
            'A database is a collection of tables, and a table is a collection of records. Each table has a fixed column definition (Schema), and each row represents an actual data record. Understanding these basic concepts is the first step to writing SQL.',
          frameworkTip:
            'If asked about basic database concepts in an interview, use analogies: a Database is like a filing cabinet, a Table is like a folder, a Row is like a form, and a Column is like a field on that form.',
        },
        {
          id: 2,
          name: 'Primary Key and Foreign Key',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: 'Understanding Relationships Between Tables',
            narrative:
              'Your manager then introduces the company\'s data architecture. The customers table has an id column as its Primary Key, and the orders table has a customer_id column that links to the customers table. He wants you to understand the purpose of these keys.',
            data: [
              { Table: 'customers', Columns: 'id (PK), name, email, city', Description: 'id is the Primary Key, uniquely identifying each customer' },
              { Table: 'orders', Columns: 'id (PK), customer_id (FK), amount, order_date', Description: 'customer_id is a Foreign Key, linking to customers.id' },
            ],
            dataCaption: 'Table Relationship Example',
          },
          question: 'Regarding Primary Keys and Foreign Keys, which of the following statements is most accurate?',
          options: [
            {
              id: 'A',
              text: 'Primary Keys can have duplicate values, but Foreign Keys cannot',
              explanation:
                'It is the opposite. Primary Keys must be unique and cannot be NULL; Foreign Keys can have duplicates (e.g., the same customer can have multiple orders).',
            },
            {
              id: 'B',
              text: 'A Primary Key uniquely identifies each record, and a Foreign Key establishes relationships between tables',
              explanation:
                'Correct! A Primary Key ensures every record has a unique identifier. A Foreign Key acts as a link that connects data across different tables.',
            },
            {
              id: 'C',
              text: 'Every table must have both a Primary Key and a Foreign Key',
              explanation:
                'Not necessarily. Every table typically has a Primary Key, but does not always need a Foreign Key. Foreign Keys are only used when you need to relate to another table.',
            },
            {
              id: 'D',
              text: 'A Foreign Key value can be any number and does not need to correspond to another table',
              explanation:
                'A Foreign Key value must correspond to a Primary Key in the referenced table. For example, orders.customer_id values must exist in customers.id.',
            },
          ],
          correctAnswer: 'B',
          hints: [
            'A Primary Key is like a social security number: each person has a unique one',
            'A Foreign Key is like a linking line that connects two tables together',
          ],
          explanation:
            'A Primary Key ensures the uniqueness of each record in a table and does not allow duplicates or NULLs. A Foreign Key establishes relationships between tables, and its values must correspond to the Primary Key of another table. These two concepts are core to understanding relational databases.',
          frameworkTip:
            'If asked about PK/FK in an interview, give a concrete example: "The customer_id in the orders table is a FK referencing the id (PK) in the customers table, allowing us to combine order and customer data via JOIN."',
        },
        {
          id: 3,
          name: 'Reading a Schema',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Exploring the Employee Table',
            narrative:
              'You received the employee table Schema from the HR department. Before starting your analysis, you want to see what data is in this table and understand its columns and records.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)',
            data: [
              { id: 1, name: 'Alice Wang', department: 'Engineering', salary: 65000, hire_date: '2022-03-15' },
              { id: 2, name: 'Bob Lee', department: 'Marketing', salary: 55000, hire_date: '2023-01-10' },
              { id: 3, name: 'Charlie Chen', department: 'Engineering', salary: 72000, hire_date: '2021-08-01' },
            ],
            dataCaption: 'employees table (sample data)',
          },
          question: 'Write a SQL query to retrieve all columns and all rows from the employees table so you can quickly browse its contents.',
          sampleSchema: `CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT NOT NULL,
  salary REAL NOT NULL,
  hire_date TEXT NOT NULL
);
INSERT INTO employees VALUES (1, '王小明', '工程部', 65000.00, '2022-03-15');
INSERT INTO employees VALUES (2, '李小華', '行銷部', 55000.00, '2023-01-10');
INSERT INTO employees VALUES (3, '陳大偉', '工程部', 72000.00, '2021-08-01');
INSERT INTO employees VALUES (4, '林美玲', '人資部', 58000.00, '2023-06-20');
INSERT INTO employees VALUES (5, '張志豪', '行銷部', 52000.00, '2024-02-01');`,
          starterCode: "-- Query all columns and rows from the employees table\nSELECT -- How do you select all columns?\nFROM employees;",
          expectedQuery: "SELECT * FROM employees;",
          hints: [
            '* means "all columns"',
            'SELECT * FROM table_name is the most basic query syntax',
          ],
          explanation:
            'SELECT * FROM employees is the most basic SQL query statement. * means selecting all columns. In practice, when you receive a new table, the first step is usually to browse the data with SELECT * to understand the table\'s structure and contents. However, in production queries, it is recommended to specify the columns you need rather than using *, for better performance.',
          frameworkTip:
            'In an interview, don\'t rush to write SQL. Ask the interviewer first: "Can I look at the table structure and some sample data?" This demonstrates good analytical habits.',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-2: Deep Dive into SELECT / FROM / WHERE
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-2',
      name: 'Deep Dive into SELECT / FROM / WHERE',
      description: 'Learn to precisely filter the data you need from a table',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'SELECT Specific Columns',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Building a Customer Contact List',
            narrative:
              'The marketing department needs a customer contact list with only names and emails — no other data. You need to select only the required columns from the customers table.\n\nTable structure: customers (id INTEGER, name TEXT, email TEXT, phone TEXT, city TEXT, registered_date TEXT)',
            data: [
              { id: 1, name: '王小明', email: 'wang@mail.com', phone: '0912-345-678', city: '台北市', registered_date: '2023-01-15' },
              { id: 2, name: '李小華', email: 'lee@mail.com', phone: '0923-456-789', city: '高雄市', registered_date: '2023-03-20' },
            ],
            dataCaption: 'customers table (sample data)',
          },
          question: 'Write a SQL query to retrieve only the customer name (name) and email address (email).',
          sampleSchema: `CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  city TEXT NOT NULL,
  registered_date TEXT NOT NULL
);
INSERT INTO customers VALUES (1, '王小明', 'wang@mail.com', '0912-345-678', '台北市', '2023-01-15');
INSERT INTO customers VALUES (2, '李小華', 'lee@mail.com', '0923-456-789', '高雄市', '2023-03-20');
INSERT INTO customers VALUES (3, '陳大偉', 'chen@mail.com', '0934-567-890', '台中市', '2023-05-10');
INSERT INTO customers VALUES (4, '林美玲', 'lin@mail.com', '0945-678-901', '台北市', '2023-07-01');
INSERT INTO customers VALUES (5, '張志豪', 'chang@mail.com', '0956-789-012', '新竹市', '2024-01-15');`,
          starterCode: "SELECT -- Specify the columns you need\nFROM customers;",
          expectedQuery: "SELECT name, email FROM customers;",
          hints: [
            'Separate multiple column names with commas',
            'When you don\'t need all columns, don\'t use * — list the specific columns you need',
          ],
          explanation:
            'SELECT name, email FROM customers returns only the two specified columns. In practice, specifying columns is better than using SELECT *: (1) reduces network data transfer (2) makes your code clearer about what you need (3) avoids accidentally exposing sensitive columns.',
          frameworkTip:
            'When writing SQL in an interview, never use SELECT *. Interviewers will notice whether you select only the needed columns, which demonstrates your awareness of performance and security.',
        },
        {
          id: 2,
          name: 'WHERE with Multiple Conditions',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Filtering High-Value Orders',
            narrative:
              'The finance department wants to audit last month\'s orders that exceed 1000 in amount and have a completed status. You need to use multiple WHERE conditions to filter precisely.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
            data: [
              { id: 1, customer_id: 101, amount: 1500.00, order_date: '2024-03-05', status: 'completed' },
              { id: 2, customer_id: 102, amount: 800.00, order_date: '2024-03-12', status: 'completed' },
              { id: 3, customer_id: 103, amount: 2200.00, order_date: '2024-03-18', status: 'pending' },
              { id: 4, customer_id: 104, amount: 350.00, order_date: '2024-02-25', status: 'completed' },
            ],
            dataCaption: 'orders table (sample data)',
          },
          question: "Write a SQL query to find orders from March 2024 with an amount greater than 1000 and a status of 'completed'. Display all columns.",
          sampleSchema: `CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  amount REAL NOT NULL,
  order_date TEXT NOT NULL,
  status TEXT NOT NULL
);
INSERT INTO orders VALUES (1, 101, 1500.00, '2024-03-05', 'completed');
INSERT INTO orders VALUES (2, 102, 800.00, '2024-03-12', 'completed');
INSERT INTO orders VALUES (3, 103, 2200.00, '2024-03-18', 'pending');
INSERT INTO orders VALUES (4, 104, 350.00, '2024-02-25', 'completed');
INSERT INTO orders VALUES (5, 105, 1800.00, '2024-03-22', 'completed');
INSERT INTO orders VALUES (6, 101, 4500.00, '2024-03-01', 'cancelled');
INSERT INTO orders VALUES (7, 106, 1200.00, '2024-03-28', 'completed');`,
          starterCode: "SELECT *\nFROM orders\nWHERE -- Connect three conditions with AND;",
          expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-03%' AND amount > 1000 AND status = 'completed';",
          hints: [
            'Use AND to combine multiple conditions that must all be true',
            'You can use LIKE with % to match a date prefix',
            'Text comparisons require single quotes',
          ],
          explanation:
            "Using AND to connect three conditions: date in March (order_date LIKE '2024-03%'), amount over 1000 (amount > 1000), and status is completed (status = 'completed'). The WHERE clause in SQL can combine multiple conditions with AND and OR, where AND requires all conditions to be true.",
          frameworkTip:
            'When writing multi-condition filters in an interview, put each condition on a new line and add comments explaining the business meaning of each. This lets the interviewer understand your logic at a glance.',
        },
        {
          id: 3,
          name: 'Filtering with LIKE and IN',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Product Search Feature',
            narrative:
              'The e-commerce platform\'s search feature needs to support fuzzy search and category filtering. The PM wants to find products whose names contain "Organic" and whose category is either "Food" or "Beverages".\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, stock INTEGER)',
            data: [
              { id: 1, name: '有機蘋果汁', category: '飲料', price: 85.00, stock: 200 },
              { id: 2, name: '有機黑豆', category: '食品', price: 120.00, stock: 150 },
              { id: 3, name: '一般牛奶', category: '飲料', price: 45.00, stock: 500 },
              { id: 4, name: '有機棉T恤', category: '服飾', price: 580.00, stock: 80 },
            ],
            dataCaption: 'products table (sample data)',
          },
          question: "Write a SQL query to find products whose name contains '有機' (Organic) and whose category is '食品' (Food) or '飲料' (Beverages). Display name, category, and price.",
          sampleSchema: `CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price REAL NOT NULL,
  stock INTEGER NOT NULL
);
INSERT INTO products VALUES (1, '有機蘋果汁', '飲料', 85.00, 200);
INSERT INTO products VALUES (2, '有機黑豆', '食品', 120.00, 150);
INSERT INTO products VALUES (3, '一般牛奶', '飲料', 45.00, 500);
INSERT INTO products VALUES (4, '有機棉T恤', '服飾', 580.00, 80);
INSERT INTO products VALUES (5, '有機綠茶', '飲料', 65.00, 300);
INSERT INTO products VALUES (6, '普通白米', '食品', 90.00, 400);
INSERT INTO products VALUES (7, '有機橄欖油', '食品', 350.00, 100);
INSERT INTO products VALUES (8, '有機洗髮精', '日用品', 220.00, 60);`,
          starterCode: "SELECT name, category, price\nFROM products\nWHERE -- LIKE for fuzzy search\n  AND -- IN for multi-value filtering;",
          expectedQuery: "SELECT name, category, price FROM products WHERE name LIKE '%有機%' AND category IN ('食品', '飲料');",
          hints: [
            "LIKE '%keyword%' searches for text containing that keyword",
            "IN ('value1', 'value2') is equivalent to = 'value1' OR = 'value2'",
          ],
          explanation:
            "LIKE '%有機%' finds products containing '有機' (Organic) anywhere in the name (% represents any characters). IN ('食品', '飲料') is a concise alternative to category = '食品' OR category = '飲料'. LIKE and IN are among the most practical SQL filtering tools, used constantly in everyday work.",
          frameworkTip:
            'Using IN instead of multiple OR statements makes SQL more concise in interviews. Interviewers appreciate code with high readability.',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-3: Sorting and Advanced Filtering
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-3',
      name: 'Sorting and Advanced Filtering',
      description: 'Master sorting, pagination, and deduplication to precisely control query results',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'ORDER BY Sorting',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Sales Leaderboard',
            narrative:
              'At the end of each month, the sales department publishes a performance leaderboard. Your manager asks you to generate a report sorted by sales amount from highest to lowest, with alphabetical name sorting as a tiebreaker.\n\nTable structure: sales_records (id INTEGER, salesperson TEXT, region TEXT, amount REAL, sale_date TEXT)',
            data: [
              { id: 1, salesperson: '王大明', region: '北區', amount: 85000.00, sale_date: '2024-03-15' },
              { id: 2, salesperson: '李小華', region: '南區', amount: 92000.00, sale_date: '2024-03-20' },
              { id: 3, salesperson: '陳志偉', region: '北區', amount: 78000.00, sale_date: '2024-03-10' },
            ],
            dataCaption: 'sales_records table (sample data)',
          },
          question: 'Write a SQL query to retrieve salesperson, amount, and sale_date from all sales records. Sort by amount descending first, then by salesperson ascending as a tiebreaker.',
          sampleSchema: `CREATE TABLE sales_records (
  id INTEGER PRIMARY KEY,
  salesperson TEXT NOT NULL,
  region TEXT NOT NULL,
  amount REAL NOT NULL,
  sale_date TEXT NOT NULL
);
INSERT INTO sales_records VALUES (1, '王大明', '北區', 85000.00, '2024-03-15');
INSERT INTO sales_records VALUES (2, '李小華', '南區', 92000.00, '2024-03-20');
INSERT INTO sales_records VALUES (3, '陳志偉', '北區', 78000.00, '2024-03-10');
INSERT INTO sales_records VALUES (4, '林美玲', '中區', 92000.00, '2024-03-25');
INSERT INTO sales_records VALUES (5, '張志豪', '南區', 65000.00, '2024-03-08');
INSERT INTO sales_records VALUES (6, '黃雅婷', '北區', 85000.00, '2024-03-30');`,
          starterCode: "SELECT salesperson, amount, sale_date\nFROM sales_records\nORDER BY -- Sort by amount first, then by name;",
          expectedQuery: "SELECT salesperson, amount, sale_date FROM sales_records ORDER BY amount DESC, salesperson ASC;",
          hints: [
            'DESC means descending (largest first), ASC means ascending (smallest first)',
            'ORDER BY can use commas to separate multiple sort columns',
          ],
          explanation:
            'ORDER BY amount DESC, salesperson ASC sorts by amount in descending order first, then by name in ascending order when amounts are equal. Multi-column sorting is very common when creating leaderboards and reports. Note: ASC is the default sort direction and can be omitted, but it is recommended to write it explicitly for code readability.',
          frameworkTip:
            'In interviews, always explicitly write ASC/DESC rather than relying on defaults. This shows that your coding style is rigorous and your intent is clear.',
        },
        {
          id: 2,
          name: 'Pagination with LIMIT and OFFSET',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Product Listing Pagination',
            narrative:
              'The e-commerce website\'s product listing needs to display results in pages of 5 items each. The frontend engineer asks how to implement pagination in SQL so users can navigate to page 2.\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, created_at TEXT)',
            data: [
              { id: 1, name: '無線滑鼠', price: 450.00 },
              { id: 2, name: '機械鍵盤', price: 2800.00 },
              { id: 3, name: 'USB Hub', price: 380.00 },
            ],
            dataCaption: 'products table (sample data)',
          },
          question: 'Write a SQL query to retrieve products sorted by id, getting page 2 of results (5 items per page, i.e., items 6 through 10).',
          sampleSchema: `CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price REAL NOT NULL,
  created_at TEXT NOT NULL
);
INSERT INTO products VALUES (1, '無線滑鼠', '周邊', 450.00, '2024-01-10');
INSERT INTO products VALUES (2, '機械鍵盤', '周邊', 2800.00, '2024-01-12');
INSERT INTO products VALUES (3, 'USB Hub', '周邊', 380.00, '2024-01-15');
INSERT INTO products VALUES (4, '螢幕支架', '周邊', 1200.00, '2024-01-18');
INSERT INTO products VALUES (5, '筆電散熱墊', '周邊', 650.00, '2024-01-20');
INSERT INTO products VALUES (6, '藍牙耳機', '音訊', 1500.00, '2024-02-01');
INSERT INTO products VALUES (7, '行動電源', '配件', 890.00, '2024-02-05');
INSERT INTO products VALUES (8, '手機殼', '配件', 350.00, '2024-02-10');
INSERT INTO products VALUES (9, '充電線', '配件', 180.00, '2024-02-15');
INSERT INTO products VALUES (10, '螢幕保護貼', '配件', 250.00, '2024-02-20');
INSERT INTO products VALUES (11, '無線充電盤', '配件', 780.00, '2024-03-01');
INSERT INTO products VALUES (12, '電競滑鼠墊', '周邊', 450.00, '2024-03-05');`,
          starterCode: "SELECT *\nFROM products\nORDER BY id ASC\n-- Skip how many rows? Take how many?;",
          expectedQuery: "SELECT * FROM products ORDER BY id ASC LIMIT 5 OFFSET 5;",
          hints: [
            'LIMIT controls how many rows are returned, OFFSET controls how many rows to skip',
            'Page 2 means skipping the 5 rows on page 1, so OFFSET = 5',
          ],
          explanation:
            'LIMIT 5 OFFSET 5 means skip the first 5 rows (page 1), then return 5 rows (the contents of page 2). Pagination formula: OFFSET = (page number - 1) * items per page. LIMIT/OFFSET is the basic way to implement pagination and is used in nearly every web application.',
          frameworkTip:
            'Interview follow-up: if the dataset is very large (millions of rows), OFFSET performance degrades significantly. An advanced approach is to use WHERE id > last_id_from_previous_page, known as keyset pagination.',
        },
        {
          id: 3,
          name: 'DISTINCT and Deduplication',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: 'Customer Distribution Analysis',
            narrative:
              'The marketing team wants to know which cities the company\'s customers are located in. You query the city column from the customers table, but find that many cities appear multiple times. You need to use DISTINCT to remove duplicate values.',
            data: [
              { id: 1, name: '王小明', city: '台北市' },
              { id: 2, name: '李小華', city: '高雄市' },
              { id: 3, name: '陳大偉', city: '台北市' },
              { id: 4, name: '林美玲', city: '台中市' },
              { id: 5, name: '張志豪', city: '台北市' },
            ],
            dataCaption: 'customers table (sample data)',
          },
          question: 'Regarding DISTINCT, which of the following statements is most accurate?',
          options: [
            {
              id: 'A',
              text: 'SELECT DISTINCT city FROM customers returns all city values, including duplicates',
              explanation:
                'The purpose of DISTINCT is precisely to remove duplicate values. Without DISTINCT, all values (including duplicates) would be returned.',
            },
            {
              id: 'B',
              text: 'DISTINCT can only be used on a single column and cannot deduplicate across multiple columns',
              explanation:
                'DISTINCT can operate on combinations of multiple columns. For example, SELECT DISTINCT city, category removes rows where the city + category combination is identical.',
            },
            {
              id: 'C',
              text: 'SELECT DISTINCT city FROM customers returns a unique list of cities — for example, Taipei appears only once',
              explanation:
                'Correct! DISTINCT removes duplicate rows from the query results. Even if Taipei appears three times in the data, it will only appear once in the result.',
            },
            {
              id: 'D',
              text: 'DISTINCT and GROUP BY are completely different and can never be used interchangeably',
              explanation:
                'In some scenarios, DISTINCT and GROUP BY can achieve similar results. For example, SELECT DISTINCT city and SELECT city GROUP BY city return the same result. However, GROUP BY can be combined with aggregate functions, making it more powerful.',
            },
          ],
          correctAnswer: 'C',
          hints: [
            'DISTINCT goes after SELECT and removes duplicate rows from the result',
            'Think about it: without DISTINCT, how many times would Taipei appear?',
          ],
          explanation:
            'DISTINCT deduplicates query results, ensuring that every row returned is unique. This is especially useful when counting "how many different values exist" — such as which cities have customers, which departments exist, or which product categories there are. In interviews, DISTINCT is often combined with COUNT: COUNT(DISTINCT city) counts the number of unique cities.',
          frameworkTip:
            'Interview tip: if you need to "list distinct values," use DISTINCT. If you need "statistics per value," use GROUP BY. Demonstrating that you know the difference and appropriate use cases for each is valuable.',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-4: Deep Dive into Aggregate Functions
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-4',
      name: 'Deep Dive into Aggregate Functions',
      description: 'Master COUNT, SUM, AVG, and other aggregate functions along with GROUP BY and HAVING',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'COUNT and SUM',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Monthly Performance Report',
            narrative:
              'The finance department needs a simple monthly performance summary: total number of orders, total revenue, average order amount, and the highest and lowest individual order amounts. You need to calculate all these metrics at once using aggregate functions.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
            data: [
              { id: 1, amount: 1500.00, status: 'completed' },
              { id: 2, amount: 800.00, status: 'completed' },
              { id: 3, amount: 2200.00, status: 'completed' },
              { id: 4, amount: 350.00, status: 'completed' },
            ],
            dataCaption: 'orders table (sample data)',
          },
          question: 'Write a SQL query to calculate the following for all orders in the orders table: total count (total_orders), total amount (total_revenue), average amount (avg_amount), maximum amount (max_amount), and minimum amount (min_amount).',
          sampleSchema: `CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  amount REAL NOT NULL,
  order_date TEXT NOT NULL,
  status TEXT NOT NULL
);
INSERT INTO orders VALUES (1, 101, 1500.00, '2024-03-05', 'completed');
INSERT INTO orders VALUES (2, 102, 800.00, '2024-03-12', 'completed');
INSERT INTO orders VALUES (3, 103, 2200.00, '2024-03-18', 'completed');
INSERT INTO orders VALUES (4, 104, 350.00, '2024-03-22', 'completed');
INSERT INTO orders VALUES (5, 105, 1800.00, '2024-03-25', 'completed');
INSERT INTO orders VALUES (6, 101, 950.00, '2024-03-28', 'completed');`,
          starterCode: "SELECT\n  COUNT(*) AS total_orders,\n  -- Total amount\n  -- Average amount\n  -- Maximum amount\n  -- Minimum amount\nFROM orders;",
          expectedQuery: "SELECT COUNT(*) AS total_orders, SUM(amount) AS total_revenue, AVG(amount) AS avg_amount, MAX(amount) AS max_amount, MIN(amount) AS min_amount FROM orders;",
          hints: [
            'SUM() calculates the total, AVG() calculates the average',
            'MAX() and MIN() find the largest and smallest values respectively',
            'Use AS to give each result a meaningful alias',
          ],
          explanation:
            'The five core SQL aggregate functions: COUNT (count), SUM (total), AVG (average), MAX (maximum), MIN (minimum). These are the most fundamental data analysis tools. In interviews, you are often asked to calculate multiple metrics in a single SQL statement, demonstrating your familiarity with aggregate functions.',
          frameworkTip:
            'When writing aggregate queries in an interview, always use meaningful AS aliases. An interviewer reading SUM(amount) AS total_revenue understands your intent more easily than just SUM(amount).',
        },
        {
          id: 2,
          name: 'GROUP BY for Grouped Statistics',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Department Salary Analysis',
            narrative:
              'The HR manager wants to understand the salary situation across departments, including headcount, average salary, and maximum salary per department. You need to use GROUP BY to calculate by department.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: '工程部', salary: 72000.00 },
              { id: 2, name: '李小華', department: '行銷部', salary: 55000.00 },
              { id: 3, name: '陳大偉', department: '工程部', salary: 85000.00 },
              { id: 4, name: '林美玲', department: '人資部', salary: 58000.00 },
            ],
            dataCaption: 'employees table (sample data)',
          },
          question: 'Write a SQL query to calculate the headcount (headcount), average salary (avg_salary), and maximum salary (max_salary) for each department, sorted by average salary in descending order.',
          sampleSchema: `CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT NOT NULL,
  salary REAL NOT NULL,
  hire_date TEXT NOT NULL
);
INSERT INTO employees VALUES (1, '王小明', '工程部', 72000.00, '2022-03-15');
INSERT INTO employees VALUES (2, '李小華', '行銷部', 55000.00, '2023-01-10');
INSERT INTO employees VALUES (3, '陳大偉', '工程部', 85000.00, '2021-08-01');
INSERT INTO employees VALUES (4, '林美玲', '人資部', 58000.00, '2023-06-20');
INSERT INTO employees VALUES (5, '張志豪', '行銷部', 52000.00, '2024-02-01');
INSERT INTO employees VALUES (6, '黃雅婷', '工程部', 68000.00, '2023-04-15');
INSERT INTO employees VALUES (7, '劉建宏', '人資部', 62000.00, '2022-09-01');
INSERT INTO employees VALUES (8, '周怡君', '行銷部', 60000.00, '2022-11-10');`,
          starterCode: "SELECT department,\n       COUNT(*) AS headcount,\n       -- Average salary\n       -- Maximum salary\nFROM employees\nGROUP BY -- Group by what?\nORDER BY -- Sort by what?;",
          expectedQuery: "SELECT department, COUNT(*) AS headcount, AVG(salary) AS avg_salary, MAX(salary) AS max_salary FROM employees GROUP BY department ORDER BY avg_salary DESC;",
          hints: [
            'GROUP BY department groups employees from the same department together',
            'Columns in SELECT that are not inside aggregate functions must appear in GROUP BY',
            'ORDER BY can use an AS alias for sorting',
          ],
          explanation:
            'GROUP BY department groups data by department, then calculates aggregate functions separately for each group. Key rule: non-aggregated columns in SELECT must appear in GROUP BY. ORDER BY avg_salary DESC puts the highest-paid department first. This is one of the most frequently tested SQL question types in interviews.',
          frameworkTip:
            'Explain your thought process in interviews: "First GROUP BY department to create groups, then use aggregate functions to compute statistics for each group, and finally ORDER BY to sort." This shows the interviewer you clearly understand SQL execution order.',
        },
        {
          id: 3,
          name: 'HAVING to Filter Groups',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Identifying Active Customers',
            narrative:
              'The marketing team defines "active customers" as those who have placed more than 3 orders. They want to identify these customers and see their spending statistics to use as the target audience for a VIP marketing campaign.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
            data: [
              { customer_id: 101, order_count: 5, total_spent: 8500.00 },
              { customer_id: 102, order_count: 2, total_spent: 1200.00 },
              { customer_id: 103, order_count: 4, total_spent: 6800.00 },
            ],
            dataCaption: 'Customer Spending Summary (expected result sample)',
          },
          question: 'Write a SQL query to find customers who have placed more than 3 orders. Display customer_id, order count (order_count), and total spending (total_spent), sorted by total spending in descending order.',
          sampleSchema: `CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  amount REAL NOT NULL,
  order_date TEXT NOT NULL
);
INSERT INTO orders VALUES (1, 101, 1500.00, '2024-01-05');
INSERT INTO orders VALUES (2, 101, 2200.00, '2024-01-18');
INSERT INTO orders VALUES (3, 102, 800.00, '2024-01-20');
INSERT INTO orders VALUES (4, 103, 1800.00, '2024-02-01');
INSERT INTO orders VALUES (5, 101, 950.00, '2024-02-10');
INSERT INTO orders VALUES (6, 103, 2100.00, '2024-02-15');
INSERT INTO orders VALUES (7, 104, 350.00, '2024-02-22');
INSERT INTO orders VALUES (8, 101, 1200.00, '2024-03-01');
INSERT INTO orders VALUES (9, 103, 1500.00, '2024-03-10');
INSERT INTO orders VALUES (10, 101, 2650.00, '2024-03-15');
INSERT INTO orders VALUES (11, 102, 400.00, '2024-03-20');
INSERT INTO orders VALUES (12, 103, 1400.00, '2024-03-25');`,
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_spent\nFROM orders\nGROUP BY customer_id\n-- How do you filter for customers with more than 3 orders?\nORDER BY total_spent DESC;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_spent FROM orders GROUP BY customer_id HAVING COUNT(*) > 3 ORDER BY total_spent DESC;",
          hints: [
            'Use HAVING (not WHERE) to filter after aggregation',
            'HAVING goes after GROUP BY',
            'You can use aggregate functions like COUNT(*) in HAVING',
          ],
          explanation:
            'HAVING COUNT(*) > 3 filters the aggregated results to keep only customers with more than 3 orders. The key difference between WHERE and HAVING: WHERE filters raw data rows before grouping, while HAVING filters aggregated results after grouping. SQL execution order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.',
          frameworkTip:
            'Classic interview follow-up: "What is the difference between WHERE and HAVING?" Standard answer: "WHERE filters raw data rows and executes before GROUP BY; HAVING filters aggregated group results and executes after GROUP BY."',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-5: String and Date Processing
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-5',
      name: 'String and Date Processing',
      description: 'Use string functions and date functions to handle real-world data',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'String Functions',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Customer Data Cleanup',
            narrative:
              'Customer names in the database have inconsistent capitalization — some are all uppercase, others are lowercase. The marketing team needs a uniformly formatted list: display the name (all uppercase), email (all lowercase), name length, and a greeting using || concatenation.\n\nTable structure: customers (id INTEGER, name TEXT, email TEXT, city TEXT)',
            data: [
              { id: 1, name: 'Alice Wang', email: 'ALICE@MAIL.COM', city: 'Taipei' },
              { id: 2, name: 'bob lee', email: 'Bob@Mail.Com', city: 'Kaohsiung' },
            ],
            dataCaption: 'customers table (sample data)',
          },
          question: "Write a SQL query to retrieve for each customer: the uppercase name (upper_name), lowercase email (lower_email), name length (name_length), and a greeting (greeting, in the format 'Hello, ' || name || '!').",
          sampleSchema: `CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  city TEXT NOT NULL
);
INSERT INTO customers VALUES (1, 'Alice Wang', 'ALICE@MAIL.COM', '台北市');
INSERT INTO customers VALUES (2, 'bob lee', 'Bob@Mail.Com', '高雄市');
INSERT INTO customers VALUES (3, 'Charlie Chen', 'charlie@MAIL.com', '台中市');
INSERT INTO customers VALUES (4, 'Diana Lin', 'DIANA@mail.COM', '新竹市');`,
          starterCode: "SELECT\n  UPPER(name) AS upper_name,\n  -- Lowercase email\n  -- Name length\n  -- Greeting concatenation\nFROM customers;",
          expectedQuery: "SELECT UPPER(name) AS upper_name, LOWER(email) AS lower_email, LENGTH(name) AS name_length, 'Hello, ' || name || '!' AS greeting FROM customers;",
          hints: [
            'UPPER() converts to uppercase, LOWER() converts to lowercase',
            'LENGTH() calculates string length',
            '|| is the string concatenation operator in SQLite',
          ],
          explanation:
            "Common SQLite string functions: UPPER() converts to uppercase, LOWER() converts to lowercase, LENGTH() calculates length. The || operator concatenates strings, similar to + or concat() in other languages. Data cleanup is a daily task for data analysts, and string processing questions are common in interviews.",
          frameworkTip:
            'Interview extension: if asked about SUBSTR(), the syntax is SUBSTR(string, start_position, length). REPLACE(string, old_value, new_value) is used for text replacement. Memorize these common functions so you can apply them flexibly in interviews.',
        },
        {
          id: 2,
          name: 'Date Functions',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Employee Tenure Statistics',
            narrative:
              'The HR department wants to calculate each employee\'s tenure, including their hire date, the number of days employed as of today, and the year and month they were hired. SQLite uses date() and strftime() for date processing.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: '工程部', hire_date: '2021-03-15' },
              { id: 2, name: '李小華', department: '行銷部', hire_date: '2023-01-10' },
            ],
            dataCaption: 'employees table (sample data)',
          },
          question: "Write a SQL query to retrieve each employee's name, hire_date, hire year (hire_year), hire month (hire_month), and the number of days employed from hire date to today (days_employed, using julianday). Sort by days in descending order.",
          sampleSchema: `CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT NOT NULL,
  hire_date TEXT NOT NULL
);
INSERT INTO employees VALUES (1, '王小明', '工程部', '2021-03-15');
INSERT INTO employees VALUES (2, '李小華', '行銷部', '2023-01-10');
INSERT INTO employees VALUES (3, '陳大偉', '工程部', '2020-08-01');
INSERT INTO employees VALUES (4, '林美玲', '人資部', '2022-06-20');
INSERT INTO employees VALUES (5, '張志豪', '行銷部', '2024-02-01');`,
          starterCode: "SELECT name,\n       hire_date,\n       strftime('%Y', hire_date) AS hire_year,\n       -- Hire month\n       -- Days employed (using julianday)\nFROM employees\nORDER BY -- Sort by days;",
          expectedQuery: "SELECT name, hire_date, strftime('%Y', hire_date) AS hire_year, strftime('%m', hire_date) AS hire_month, CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS days_employed FROM employees ORDER BY days_employed DESC;",
          hints: [
            "strftime('%Y', date) extracts the year, strftime('%m', date) extracts the month",
            "julianday('now') - julianday(date) calculates the difference in days",
            'Use CAST(... AS INTEGER) to convert decimal days to an integer',
          ],
          explanation:
            "Core SQLite date processing tools: strftime() extracts parts of a date (year, month, day, etc.), julianday() converts a date to a Julian day number (a continuous day count), and subtracting two julianday values gives the difference in days. CAST(... AS INTEGER) converts the result to an integer. These functions are very practical for date analysis.",
          frameworkTip:
            "Commonly tested date operations in interviews: (1) Extract year/month: strftime('%Y/%m', date) (2) Calculate day difference: subtract julianday values (3) Get today's date: date('now'). Memorize these three patterns and you can handle most date-related questions.",
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-6: Boss — Comprehensive Basic Query Challenge
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-6',
      name: 'Boss: Comprehensive Basic Query Challenge',
      description: 'Combine all basic query techniques to tackle comprehensive problems',
      xp: 200,
      isBoss: true,
      challenges: [
        {
          id: 1,
          name: 'Comprehensive Query',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'E-Commerce Quarterly Report',
            narrative:
              'You are a data analyst at an e-commerce company. The CEO asks you to produce a Q1 2024 quarterly report. He wants to know the sales performance of each product category: order count, total revenue, and average order value. Only show categories with revenue exceeding 5000, sorted by total revenue in descending order.\n\nTable structures:\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- order_items (id INTEGER, order_id INTEGER, product_id INTEGER, quantity INTEGER, unit_price REAL)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT, status TEXT)',
          },
          question: "Write a SQL query to calculate, for completed orders in Q1 2024 (January through March), each product category's order count (order_count), total revenue (total_revenue, as quantity * unit_price), and average order value (avg_order_value). Only show categories with total revenue exceeding 5000, sorted by total revenue in descending order.",
          sampleSchema: `CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price REAL NOT NULL
);
INSERT INTO products VALUES (1, '無線滑鼠', '周邊設備', 450.00);
INSERT INTO products VALUES (2, '機械鍵盤', '周邊設備', 2800.00);
INSERT INTO products VALUES (3, '程式設計書', '書籍', 580.00);
INSERT INTO products VALUES (4, 'USB Hub', '周邊設備', 380.00);
INSERT INTO products VALUES (5, 'SQL 入門', '書籍', 420.00);
INSERT INTO products VALUES (6, '筆電支架', '辦公用品', 1200.00);
INSERT INTO products VALUES (7, '人體工學椅', '辦公用品', 8500.00);
INSERT INTO products VALUES (8, '螢幕保護貼', '配件', 250.00);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date TEXT NOT NULL,
  status TEXT NOT NULL
);
INSERT INTO orders VALUES (1, 101, '2024-01-05', 'completed');
INSERT INTO orders VALUES (2, 102, '2024-01-12', 'completed');
INSERT INTO orders VALUES (3, 103, '2024-01-20', 'cancelled');
INSERT INTO orders VALUES (4, 104, '2024-02-01', 'completed');
INSERT INTO orders VALUES (5, 105, '2024-02-15', 'completed');
INSERT INTO orders VALUES (6, 101, '2024-03-01', 'completed');
INSERT INTO orders VALUES (7, 106, '2024-03-10', 'completed');
INSERT INTO orders VALUES (8, 102, '2024-03-22', 'completed');
INSERT INTO orders VALUES (9, 107, '2024-04-01', 'completed');

CREATE TABLE order_items (
  id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price REAL NOT NULL
);
INSERT INTO order_items VALUES (1, 1, 1, 2, 450.00);
INSERT INTO order_items VALUES (2, 1, 3, 1, 580.00);
INSERT INTO order_items VALUES (3, 2, 2, 1, 2800.00);
INSERT INTO order_items VALUES (4, 2, 5, 2, 420.00);
INSERT INTO order_items VALUES (5, 3, 7, 1, 8500.00);
INSERT INTO order_items VALUES (6, 4, 1, 3, 450.00);
INSERT INTO order_items VALUES (7, 4, 4, 2, 380.00);
INSERT INTO order_items VALUES (8, 5, 6, 1, 1200.00);
INSERT INTO order_items VALUES (9, 5, 7, 1, 8500.00);
INSERT INTO order_items VALUES (10, 6, 2, 1, 2800.00);
INSERT INTO order_items VALUES (11, 6, 1, 1, 450.00);
INSERT INTO order_items VALUES (12, 7, 3, 3, 580.00);
INSERT INTO order_items VALUES (13, 7, 5, 1, 420.00);
INSERT INTO order_items VALUES (14, 8, 6, 2, 1200.00);
INSERT INTO order_items VALUES (15, 8, 8, 5, 250.00);
INSERT INTO order_items VALUES (16, 9, 1, 1, 450.00);`,
          starterCode: "SELECT p.category,\n       COUNT(DISTINCT o.id) AS order_count,\n       SUM(oi.quantity * oi.unit_price) AS total_revenue,\n       -- Average order value\nFROM order_items oi\nJOIN orders o ON oi.order_id = o.id\nJOIN products p ON oi.product_id = p.id\nWHERE -- Q1 date filter AND completed orders\nGROUP BY -- Group by category\n-- Filter for total revenue over 5000\nORDER BY -- Sort;",
          expectedQuery: "SELECT p.category, COUNT(DISTINCT o.id) AS order_count, SUM(oi.quantity * oi.unit_price) AS total_revenue, ROUND(SUM(oi.quantity * oi.unit_price) * 1.0 / COUNT(DISTINCT o.id), 2) AS avg_order_value FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN products p ON oi.product_id = p.id WHERE o.order_date >= '2024-01-01' AND o.order_date < '2024-04-01' AND o.status = 'completed' GROUP BY p.category HAVING total_revenue > 5000 ORDER BY total_revenue DESC;",
          hints: [
            'You need to JOIN three tables: order_items, orders, and products',
            "Date filter: order_date >= '2024-01-01' AND order_date < '2024-04-01'",
            'Average order value = total revenue / distinct order count',
            'Use HAVING to filter aggregated results',
          ],
          explanation:
            "This question combines all basic query techniques: (1) JOIN to combine three tables (2) WHERE to filter by date and status (3) GROUP BY to group by category (4) aggregate functions for COUNT and SUM (5) HAVING to filter aggregated results (6) ORDER BY to sort. Note that COUNT(DISTINCT o.id) ensures the same order is not counted multiple times. Average order value is calculated as total revenue divided by distinct order count.",
          frameworkTip:
            'When facing complex queries in interviews, use an "inside-out" approach: (1) identify which tables and JOIN conditions you need (2) add WHERE filters (3) GROUP BY for grouping (4) write aggregate functions (5) HAVING for filtering (6) ORDER BY for sorting. Build step by step rather than trying to write everything at once.',
        },
        {
          id: 2,
          name: 'Analysis Plan Design',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: 'User Retention Analysis Plan',
            narrative:
              'You are a data analyst at an e-commerce company. The PM asks you to analyze "7-day retention rate for new users." He wants to know: (1) Of the new users who registered each day over the past month, how many placed another order within 7 days of registration? (2) Which user attributes (city, registration source) correlate with retention rates?\n\nAvailable tables:\n- users (id, name, city, source, registered_date)\n- orders (id, user_id, amount, order_date, status)\n- page_views (id, user_id, page_url, view_date)',
          },
          question: 'Design a complete analysis plan: What SQL queries would you write? What is the purpose of each query? How would you combine the results to answer the PM\'s questions?',
          prompt: 'Design a complete plan to analyze "7-day retention rate for new users" using SQL, including the required queries and analysis steps.',
          evaluationCriteria: [
            'Does it clearly define how "retention" is calculated (placed another order within 7 days of registration)?',
            'Does it include a query for the basic retention rate (new user count vs. retained user count)?',
            'Does it consider segmentation by user attributes (city, source)?',
            'Does it mention necessary data validation steps (such as checking data completeness)?',
            'Is the SQL approach correct (JOIN users and orders, filter by date conditions)?',
          ],
          sampleAnswer:
            "The analysis plan has three steps:\n\nStep 1: Calculate the overall 7-day retention rate\nUse users LEFT JOIN orders, with the condition order_date BETWEEN registered_date AND date(registered_date, '+7 days'), GROUP BY registered_date, and calculate COUNT(DISTINCT users who reordered) / COUNT(DISTINCT all new users).\n\nStep 2: Segment by user attributes\nAdd GROUP BY city and GROUP BY source to examine retention rate differences across cities and registration sources, identifying high/low retention segments.\n\nStep 3: Data validation\n(1) Check that user_id is consistent between users and orders (2) Confirm no NULL values in date fields (3) Exclude orders where status = 'cancelled'.\n\nFinal output: a summary table with date, new user count, retained user count, retention rate, and breakdowns by each dimension.",
          hints: [
            'Start by clearly defining the metric for "retention"',
            'Think about which tables you need to JOIN and what conditions to use',
            'Don\'t forget to segment by different dimensions (city, source)',
          ],
          explanation:
            'The keys to designing an analysis plan are: (1) clearly define the metric (what counts as "retention") (2) break it down into executable SQL steps (3) consider data quality issues. In interviews, demonstrating that you can translate a vague business question into a concrete SQL query plan is more valuable than just knowing SQL syntax.',
          frameworkTip:
            'When facing open-ended analysis questions in interviews, use this framework: (1) Clarify definitions: "Retention is defined as..." (2) Break into steps: "I would approach this in three steps..." (3) Consider limitations: "Potential data issues include..." (4) Expected output: "The final deliverable would be..." This framework makes your answer clear, structured, and convincing.',
        },
      ],
    },
  ],
};
