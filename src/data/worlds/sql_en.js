export const sqlWorldsEn = [
  {
    id: 4,
    name: 'SQL & Data Literacy',
    emoji: '🗄️',
    description: 'SQL thinking and data comprehension for interviews',
    color: 'from-orange-500 to-amber-500',
    quests: [
      { id: '4-1', name: 'SQL Query Thinking', description: 'How to explain your data querying approach in interviews', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: 'Basic SELECT & Filtering',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'E-commerce Order Query',
            narrative: 'You just joined the data team at an e-commerce company. The PM wants to understand the order activity for January this year. Query the orders table to find out.\n\nTable structure: orders (id, customer_id, amount, order_date, status)',
            data: [
              { id: 1, customer_id: 101, amount: 250, order_date: '2024-01-15', status: 'completed' },
              { id: 2, customer_id: 102, amount: 180, order_date: '2024-01-20', status: 'completed' },
              { id: 3, customer_id: 103, amount: 320, order_date: '2024-02-01', status: 'pending' },
              { id: 4, customer_id: 101, amount: 95, order_date: '2024-01-28', status: 'completed' },
            ],
            dataCaption: 'orders table (sample data)',
          },
          question: 'Write a SQL query to find all orders from January 2024, sorted by amount in descending order.',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT *\nFROM orders\nWHERE -- filter for January orders\nORDER BY -- sort by amount;",
          expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-01%' ORDER BY amount DESC;",
          hints: ['WHERE can use LIKE with % to match a date prefix', 'ORDER BY column DESC means descending order'],
          explanation: "Use WHERE order_date LIKE '2024-01%' to filter January data, and ORDER BY amount DESC to sort by amount in descending order. This is the most fundamental query structure: FROM -> WHERE -> SELECT -> ORDER BY.",
          frameworkTip: 'SQL thinking order: first consider "which table" -> "what filters" -> "which columns" -> "how to sort"',
        },
        {
          id: 2,
          name: 'GROUP BY & Aggregation',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Customer Spending Summary',
            narrative: 'Your manager wants to understand each customer\'s spending behavior, including their order count and total spending. You need to perform group-level aggregation on the orders data.',
            data: [
              { id: 1, customer_id: 101, amount: 250, order_date: '2024-01-15', status: 'completed' },
              { id: 2, customer_id: 102, amount: 180, order_date: '2024-01-20', status: 'completed' },
              { id: 4, customer_id: 101, amount: 95, order_date: '2024-01-28', status: 'completed' },
            ],
            dataCaption: 'orders table (sample data)',
          },
          question: 'Write a SQL query to calculate each customer\'s order count and total spending, sorted by total amount in descending order.',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_amount\nFROM orders\nGROUP BY -- group by what?\nORDER BY -- sort;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id ORDER BY total_amount DESC;",
          hints: ['GROUP BY customer_id groups rows by customer', 'SUM() and COUNT() are the most commonly used aggregate functions'],
          explanation: "GROUP BY customer_id merges all orders for the same customer. COUNT(*) counts the number of rows, and SUM(amount) calculates the total. In interviews, this is a very fundamental yet important question type — you need to demonstrate that you can extract business insights from raw data.",
          frameworkTip: 'When answering SQL questions in interviews, first verbalize your approach (group -> aggregate -> sort), then write the code',
        },
        {
          id: 3,
          name: 'HAVING & Conditional Filtering',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'High-Value Customer Filtering',
            narrative: 'The marketing team wants to identify "high-value customers" (those who spent over 200) to run a promotional campaign. You need to aggregate first, then filter.',
          },
          question: 'Write a SQL query to find customers whose total spending exceeds 200, showing customer ID, order count, and total amount.',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_amount\nFROM orders\nGROUP BY customer_id\n-- how do you filter aggregated results?\nORDER BY total_amount DESC;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id HAVING total_amount > 200 ORDER BY total_amount DESC;",
          hints: ['You cannot use WHERE to filter aggregated results — use HAVING instead', 'HAVING goes after GROUP BY and before ORDER BY'],
          explanation: "WHERE filters raw data before aggregation; HAVING filters results after aggregation. This is a frequently tested concept in interviews — interviewers want to see if you understand SQL's execution order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.",
          frameworkTip: 'WHERE vs HAVING: WHERE filters raw rows, HAVING filters aggregated results. Be sure to articulate this distinction clearly in interviews.',
        },
      ] },
      { id: '4-2', name: 'Event Data vs Transactional Data', description: 'Understanding the characteristics of different data types', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: 'Identifying Data Types',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: 'E-commerce Platform Tables',
            narrative: 'You joined the Data Team at an e-commerce company. Your manager shows you several tables and asks you to distinguish which are Event Data and which are Transactional Data, since the querying approach differs.',
            data: [
              { table_name: 'page_views', sample_columns: 'user_id, page_url, timestamp, device', characteristics: 'One record per view, very high volume' },
              { table_name: 'orders', sample_columns: 'order_id, user_id, amount, status, created_at', characteristics: 'Has a lifecycle, status gets updated' },
              { table_name: 'button_clicks', sample_columns: 'user_id, button_id, page, timestamp', characteristics: 'One record per click, immutable' },
              { table_name: 'subscriptions', sample_columns: 'sub_id, user_id, plan, start_date, end_date', characteristics: 'Represents an ongoing state' },
            ],
            dataCaption: 'Selected tables from the company',
          },
          question: 'Which of the following statements is correct?',
          options: [
            { id: 'A', text: 'Both page_views and orders are Event Data', explanation: 'Orders have a lifecycle (created -> paid -> shipped) and get updated, making them Transactional Data.' },
            { id: 'B', text: 'page_views and button_clicks are Event Data; orders and subscriptions are Transactional Data', explanation: 'Correct! Event Data records each behavioral event — immutable and high volume. Transactional Data represents the state of business entities — has a lifecycle and gets updated.' },
            { id: 'C', text: 'Everything related to user behavior is Event Data', explanation: '"A user placing an order" is a behavior, but the orders table records the state of the order as a business entity, not simply a behavioral event.' },
            { id: 'D', text: 'Only button_clicks is Event Data; everything else is Transactional', explanation: 'page_views is also Event Data — one record is created per view, and it is never modified.' },
          ],
          correctAnswer: 'B',
          hints: ['Event Data characteristics: a record is created each time something happens, never modified', 'Transactional Data characteristics: represents an entity, undergoes state changes'],
          explanation: 'Event Data records "what happened" (page_view, click) — each record is an event at a point in time. Transactional Data records "the state of a business entity" (orders, subscriptions) — it gets updated over time. Understanding this distinction is essential for knowing which table to use when answering different types of questions.',
          frameworkTip: 'In interviews, when you hear "what did the user do" -> Event Data; "how is the business doing" -> Transactional Data',
        },
        {
          id: 2,
          name: 'Choosing the Right Table',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Answering Different Business Questions',
            narrative: 'The PM and Finance each send you a question:\n\n- PM asks: "At which step in the checkout flow do users drop off the most?"\n- Finance asks: "What was the total refund amount last month?"\n\nYou need to determine which type of data to query for each.',
          },
          question: 'Which analysis strategy is most appropriate for these two questions?',
          options: [
            { id: 'A', text: 'Just query the orders table for both', explanation: 'The PM\'s question requires looking at user behavioral steps (which step they drop off at). The orders table only records the final outcome and cannot show intermediate steps.' },
            { id: 'B', text: 'For the PM\'s question, query Event Data (examine funnel steps); for Finance\'s question, query Transactional Data (look at refunds)', explanation: 'Correct! User drop-off analysis requires examining each behavioral step (page_view -> add_to_cart -> checkout -> payment). Refund amounts need to come from the transaction table\'s refund records.' },
            { id: 'C', text: 'Query Event Data for both, since they both relate to user behavior', explanation: 'Finance needs precise refund amounts. Event Data may have duplicate triggers or inconsistent definitions, making it unreliable for calculating monetary amounts.' },
            { id: 'D', text: 'For the PM\'s question, query Transactional Data (check order status); for Finance\'s question, query Event Data (look at refund events)', explanation: 'This is reversed. Order status cannot show "at which step the user left," and refund events may fire multiple times, making them unsuitable for calculating amounts.' },
          ],
          correctAnswer: 'B',
          hints: ['Think about it: does the PM want to see the "process" or the "outcome"?', 'Finance needs precise amounts — which type of data is more reliable?'],
          explanation: '"Process" questions use Event Data (behavioral tracking); "outcome" questions use Transactional Data (business records). In interviews, demonstrating that you know how to match the right data to the right question is more important than your SQL syntax skills.',
          frameworkTip: 'Interview golden line: "This question requires examining each step of the user journey, so I would use event data to build a funnel."',
        },
      ] },
      { id: '4-3', name: 'JOIN & Aggregation', description: 'Combining and aggregating data', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: 'Basic JOIN',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: 'Merging Orders and Customer Data',
            narrative: 'The PM wants a report that shows both order information and customer names. You need to JOIN the orders and customers tables.\n\nTables:\n- orders (id, customer_id, amount, order_date)\n- customers (id, name, email, city)',
          },
          question: 'Write a SQL query to retrieve the customer name, order amount, and order date for all orders.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
            INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
          `,
          starterCode: "SELECT c.name, o.amount, o.order_date\nFROM orders o\n-- JOIN syntax\nORDER BY o.order_date;",
          expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;",
          hints: ['JOIN customers c ON o.customer_id = c.id', 'Use aliases (o, c) to keep the code concise'],
          explanation: "INNER JOIN connects two tables through a shared column. The interview focus is not just the syntax, but whether you can clearly explain \"why the JOIN is needed\" and \"what the JOIN key is.\"",
          frameworkTip: 'When answering JOIN questions: (1) explain why you need to combine the data, (2) identify the JOIN key, (3) consider the impact of NULLs and duplicates',
        },
        {
          id: 2,
          name: 'LEFT JOIN & Missing Data',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Finding Customers Who Never Ordered',
            narrative: 'The marketing team wants to know which registered customers have never placed an order, so they can run a re-engagement campaign. You need to use LEFT JOIN to find these "dormant customers."',
          },
          question: 'Write a SQL query to find the names of all customers who have no orders.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            INSERT INTO customers VALUES (104, 'Diana', 'diana@mail.com', 'Taichung');
            INSERT INTO customers VALUES (105, 'Eve', 'eve@mail.com', 'Hsinchu');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
          `,
          starterCode: "SELECT c.name\nFROM customers c\n-- which type of JOIN?\nWHERE -- how to find customers with no orders?;",
          expectedQuery: "SELECT c.name FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;",
          hints: ['LEFT JOIN preserves all rows from the left table, even if there is no match in the right table', 'WHERE o.id IS NULL finds rows with no match'],
          explanation: "LEFT JOIN + IS NULL is the classic pattern for finding records that \"don't exist in another table.\" In interviews, this demonstrates your understanding of the semantic differences between JOIN types and is the foundation for churn analysis and missing data detection.",
          frameworkTip: 'INNER JOIN finds the intersection; LEFT JOIN preserves all rows from the left table — using a set diagram to explain this in interviews is the clearest approach',
        },
        {
          id: 3,
          name: 'JOIN + GROUP BY Combined',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Spending Statistics by City',
            narrative: 'Your manager wants to know the customer spending breakdown by city. You need to JOIN the customers and orders data, then group and aggregate by city.',
          },
          question: 'Write a SQL query to calculate the number of customers, total order count, and total spending for each city, sorted by total amount in descending order.',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
            INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
          `,
          starterCode: "SELECT c.city,\n       COUNT(DISTINCT c.id) AS customer_count,\n       COUNT(o.id) AS order_count,\n       SUM(o.amount) AS total_amount\nFROM customers c\n-- JOIN\nGROUP BY -- ?\nORDER BY total_amount DESC;",
          expectedQuery: "SELECT c.city, COUNT(DISTINCT c.id) AS customer_count, COUNT(o.id) AS order_count, SUM(o.amount) AS total_amount FROM customers c JOIN orders o ON c.id = o.customer_id GROUP BY c.city ORDER BY total_amount DESC;",
          hints: ['JOIN orders o ON c.id = o.customer_id', 'COUNT(DISTINCT c.id) avoids double-counting caused by the JOIN'],
          explanation: "JOIN + GROUP BY is the most common combination in interviews. The key point is COUNT(DISTINCT) — when a JOIN produces a one-to-many relationship, a plain COUNT will double-count. This demonstrates your understanding of how JOINs affect row counts.",
          frameworkTip: 'In interviews, always mention: JOINs can produce duplicate rows, so be careful about whether you need DISTINCT when aggregating',
        },
      ] },
      { id: '4-4', name: 'Window Functions', description: 'Advanced analysis: ranking, moving averages, period-over-period comparison', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: 'Understanding Window Functions',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'User Purchase Ranking',
            narrative: 'You need to analyze each user\'s purchase history and determine their "nth purchase." The PM wants to know at which purchase number users typically spend the most.\n\nYou plan to use ROW_NUMBER() for this.',
            data: [
              { user_id: 'A01', amount: 120, order_date: '2024-01-10', 'purchase_number': '?' },
              { user_id: 'A01', amount: 350, order_date: '2024-02-15', 'purchase_number': '?' },
              { user_id: 'A01', amount: 85, order_date: '2024-03-20', 'purchase_number': '?' },
              { user_id: 'B02', amount: 200, order_date: '2024-01-25', 'purchase_number': '?' },
              { user_id: 'B02', amount: 180, order_date: '2024-03-01', 'purchase_number': '?' },
            ],
            dataCaption: 'Order data (need to calculate each user\'s nth purchase)',
          },
          question: 'Which SQL logic correctly calculates "each user\'s nth purchase"?',
          options: [
            { id: 'A', text: 'GROUP BY user_id, then use COUNT(*) to count each user\'s purchases', explanation: 'GROUP BY collapses each user into a single row, so you lose visibility into individual orders. Window Functions can perform calculations without collapsing rows.' },
            { id: 'B', text: 'ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date)', explanation: 'Correct! PARTITION BY user_id means "calculate separately for each user," and ORDER BY order_date means "number them in chronological order." The result is each user\'s 1st, 2nd, 3rd... purchase.' },
            { id: 'C', text: 'ROW_NUMBER() OVER (ORDER BY order_date)', explanation: 'Without PARTITION BY, this numbers all users together instead of "each user\'s nth purchase."' },
            { id: 'D', text: 'RANK() OVER (ORDER BY amount DESC)', explanation: 'RANK produces rankings, not sequential numbers. It also sorts by amount instead of time and does not partition by user.' },
          ],
          correctAnswer: 'B',
          hints: ['The key to Window Functions is PARTITION BY — think of it as "calculate independently within each group"', 'ROW_NUMBER assigns a sequential number to each row without collapsing rows (unlike GROUP BY)'],
          explanation: 'The core concept of Window Functions: perform calculations over a set of related rows without collapsing them. PARTITION BY defines the "group," ORDER BY defines the "sequence." ROW_NUMBER assigns sequential numbers, RANK assigns rankings (with ties), and LAG/LEAD access previous/next row values.',
          frameworkTip: 'When describing Window Functions in interviews: "I would use ROW_NUMBER, PARTITION BY user to group, ORDER BY time to sequence, to identify each user\'s Nth action."',
        },
        {
          id: 2,
          name: 'LAG & Period-over-Period Comparison',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Monthly Revenue Growth Rate',
            narrative: 'Your manager asks you to calculate the month-over-month revenue growth rate. You need to use the LAG function to retrieve "last month\'s revenue."',
            data: [
              { month: '2024-01', revenue: 500000 },
              { month: '2024-02', revenue: 520000 },
              { month: '2024-03', revenue: 480000 },
              { month: '2024-04', revenue: 550000 },
            ],
            dataCaption: 'Monthly revenue data',
          },
          question: 'Which SQL logic correctly calculates the MoM (Month-over-Month) growth rate?',
          options: [
            { id: 'A', text: 'Use a self-join to pair each month with the previous month', explanation: 'This works but is overly complex. Window Functions are more elegant. In interviews, demonstrate that you can solve problems in a cleaner way.' },
            { id: 'B', text: '(revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month)', explanation: 'Correct! LAG(revenue) OVER (ORDER BY month) retrieves the previous month\'s revenue, then you calculate (current month - previous month) / previous month = growth rate.' },
            { id: 'C', text: 'SUM(revenue) OVER (ORDER BY month) to compute cumulative revenue, then subtract', explanation: 'This calculates cumulative revenue, not a month-over-month growth rate.' },
            { id: 'D', text: 'AVG(revenue) OVER (ORDER BY month ROWS 1 PRECEDING) for a moving average', explanation: 'A moving average shows trends but is not a growth rate. Growth rate requires using LAG to get the previous row\'s value for division.' },
          ],
          correctAnswer: 'B',
          hints: ['LAG(column) retrieves the value from the previous row; LEAD(column) retrieves the value from the next row', 'Growth rate = (current period - previous period) / previous period'],
          explanation: 'LAG and LEAD are extremely practical Window Functions in interviews. LAG accesses the previous row, LEAD accesses the next row. They are used for calculating growth rates, MoM, WoW, and YoY comparisons. Interviewers frequently ask about MoM, WoW, and YoY calculation methods.',
          frameworkTip: 'When an interview question involves "compare with the previous period" -> use LAG. "Compare with the next period" -> use LEAD.',
        },
      ] },
      { id: '4-5', name: 'Source of Truth', description: 'Why do different reports show different numbers?', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: 'Root Cause of Inconsistent Numbers',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Three Departments, Three Numbers',
            narrative: 'You are the company\'s Business Analyst. During the quarterly review meeting:\n\n- Marketing reports: "Q1 added 12,000 new users"\n- Product reports: "Q1 added 9,500 new users"\n- Finance reports: "Q1 added 8,200 new paying users"\n\nThe CEO is confused: "Which number is correct?"',
          },
          question: 'What is the most likely cause?',
          options: [
            { id: 'A', text: 'Someone\'s data has a bug that needs to be found', explanation: 'Not necessarily a bug. The three teams may be using different definitions of "user" and different data sources, each of which is technically "correct."' },
            { id: 'B', text: 'The three teams define "new user" differently', explanation: 'Correct! Marketing may count "completed registration," Product may count "completed onboarding," and Finance may count "completed first payment." Each definition is reasonable, but the numbers differ. This is a Source of Truth issue.' },
            { id: 'C', text: 'Different time zones cause the Q1 start and end dates to differ', explanation: 'Time zones can cause discrepancies, but the difference would not be this large (12K vs 8.2K). Different definitions are the more likely cause.' },
            { id: 'D', text: 'You should average the three numbers', explanation: 'Averaging is meaningless here. Each number measures something different. The definitions need to be aligned first.' },
          ],
          correctAnswer: 'B',
          hints: ['The same term "new user" can have completely different definitions across teams', 'Marketing cares about signups, Product cares about activation, Finance cares about payments'],
          explanation: 'Source of Truth issues are extremely common in real-world work. The solution is not to find "the right answer," but to: (1) clarify each team\'s definition, (2) confirm their respective data sources, (3) align on a definition everyone agrees on, (4) build a shared dashboard.',
          frameworkTip: 'Interview golden line: "Before starting any analysis, I would first confirm the metric definitions and data sources with stakeholders to ensure we are all looking at the same data."',
        },
        {
          id: 2,
          name: 'Data Quality Issues',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Daily Report Numbers Don\'t Match',
            narrative: 'Your daily report shows yesterday\'s DAU as 85,000, but the PM says they see 92,000 on another dashboard. You begin investigating the discrepancy.\n\nYou discover:\n- Your report uses UTC time; the dashboard uses local time (UTC+8)\n- Your report excludes bot traffic; the dashboard does not\n- Your report counts "viewed at least 1 page"; the dashboard counts "opened the app"',
          },
          question: 'What is the best way to resolve this?',
          options: [
            { id: 'A', text: 'Use your report because it excludes bots and is more accurate', explanation: 'Your report may be "cleaner," but the issue is not about who is right or wrong — it is about establishing a unified standard.' },
            { id: 'B', text: 'Use the dashboard numbers since the PM is looking at them', explanation: 'You should not choose a source just because of who is looking at it. The definition needs to be clarified first.' },
            { id: 'C', text: 'Document the sources of discrepancy (timezone, bots, definition), propose a unified standard, and align the team', explanation: 'Correct! First investigate the sources of discrepancy thoroughly, then propose a team-wide consensus definition and calculation method. For example: "DAU = unique users in UTC+8 timezone, excluding bots, who completed at least 1 pageview."' },
            { id: 'D', text: 'Keep both numbers and annotate the definition differences in the report', explanation: 'This is acceptable short-term, but long-term it will create more confusion. You should push for unification.' },
          ],
          correctAnswer: 'C',
          hints: ['The first step in resolving a Source of Truth issue is not picking one number, but understanding why they differ'],
          explanation: 'Common data quality issues: inconsistent time zones, different bot filtering logic, different metric definitions, and data latency. Demonstrating this awareness in interviews and showing that you know how to systematically resolve it (definition -> source -> calculation logic -> alignment) will significantly boost your evaluation.',
          frameworkTip: 'Troubleshooting order when data is inconsistent: definition -> source -> timezone -> filtering logic -> deduplication method',
        },
      ] },
      { id: '4-6', name: 'Boss: Data Analysis Design', description: 'Design a complete data analysis plan', xp: 200, isBoss: true, challenges: [
        {
          id: 1,
          name: 'Boss: Design an Analysis Plan',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: 'Churn Investigation for a Subscription SaaS',
            narrative: 'You are a Data Analyst at a B2B SaaS company. The VP of Customer Success comes to you and says:\n\n"Our monthly churn rate has increased from 3% to 5%. The CEO needs to present the root cause and action plan at next week\'s board meeting. I need you to do a thorough analysis."\n\nYou have the following tables available:\n- subscriptions (sub_id, company_id, plan, start_date, end_date, mrr)\n- usage_events (company_id, feature, timestamp, user_count)\n- support_tickets (ticket_id, company_id, category, created_at, resolved_at, satisfaction_score)\n- companies (company_id, name, industry, size, signup_date)',
          },
          prompt: 'Design a comprehensive analysis plan to investigate the increase in churn rate. Include:\n1. What metrics will you define? How will you confirm the definition of churn?\n2. Which tables will you query? How will you JOIN them?\n3. What analyses will you perform? (trends, segmentation, cohort, etc.)\n4. What do you expect to find?\n5. What data quality concerns should you watch for?',
          evaluationCriteria: [
            'Clearly defines churn (what counts as churn? end_date in the current month? or failure to renew?)',
            'Has a systematic analysis plan (does not jump to guessing the cause)',
            'Uses multiple analytical methods (trends, segmentation, cohort)',
            'Identifies which tables need to be JOINed for a complete picture',
            'Considers data quality and limitations (definition consistency, data latency, etc.)',
          ],
          sampleAnswer: '1. Definition: Churn = subscription expired and not renewed (end_date in the current month with no new subscription). Confirm alignment with Finance and CS on this definition.\n\n2. Data: subscriptions LEFT JOIN companies ON company_id (to see company characteristics), LEFT JOIN usage_events (to see usage behavior), LEFT JOIN support_tickets (to see support interactions).\n\n3. Analysis:\n- Trend: Did churn rate spike suddenly or increase gradually? When did it start?\n- Segmentation: Break down by plan, company size, and industry — which segment has the worst churn?\n- Cohort: Do churn curves differ across signup cohorts?\n- Usage: How did churned customers\' usage behavior change before they left? (Did usage decline?)\n- Support: What is the support ticket volume and satisfaction score for churned customers?\n\n4. Expected findings: Possibly a specific plan or company size segment has disproportionately high churn, or recent cohort quality has declined, or a product issue caused a drop in usage.\n\n5. Considerations: Ensure churn definition is consistent, account for seasonality (annual contract renewal months), and be aware of survivorship bias (analyzing only retained customers will skew the data).',
          hints: ['Define what churn means clearly before starting the analysis', 'Think about what each of the 4 tables can tell you'],
          explanation: 'This is a comprehensive data analysis design question. The interviewer is looking for whether you can systematically plan an analysis, not jump straight to guessing the cause. A strong answer should include: clear definition -> data inventory -> analytical methods -> expected results -> caveats.',
          frameworkTip: 'Six steps of analysis design: clarify the problem -> define metrics -> inventory data -> design the analysis -> anticipate outputs -> note caveats',
        },
      ] },
    ],
  },
]
