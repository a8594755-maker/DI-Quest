/**
 * World 24 Extra Challenges
 * Inspired by LeetCode SQL 50 — original scenarios, English content
 * Append these to the corresponding quests in sql.js
 */

export const w24ExtraEn = {
  '24-1': [
    {
      id: 4,
      name: 'Self-Join: Detecting Performance Growth',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Which days had higher revenue than the previous day?',
        narrative: 'The operations manager wants to identify which days saw store revenue increase compared to the previous day. You have a daily performance log and need to use a Self-Join to find dates where "today\'s revenue > yesterday\'s revenue."\n\nTable:\n- daily_metrics (id INTEGER, record_date TEXT, revenue REAL)',
      },
      question: 'Write a SQL query to find dates where revenue was higher than the previous day. Display the id, date, and revenue for those days.',
      sampleSchema: `
        CREATE TABLE daily_metrics (id INTEGER, record_date TEXT, revenue REAL);
        INSERT INTO daily_metrics VALUES (1, '2026-03-01', 12000.00);
        INSERT INTO daily_metrics VALUES (2, '2026-03-02', 9500.00);
        INSERT INTO daily_metrics VALUES (3, '2026-03-03', 15000.00);
        INSERT INTO daily_metrics VALUES (4, '2026-03-04', 14800.00);
        INSERT INTO daily_metrics VALUES (5, '2026-03-05', 18200.00);
        INSERT INTO daily_metrics VALUES (6, '2026-03-06', 16000.00);
        INSERT INTO daily_metrics VALUES (7, '2026-03-07', 20100.00);
      `,
      starterCode: "SELECT t1.id, t1.record_date, t1.revenue\nFROM daily_metrics t1\n-- Self-join: compare today with yesterday\nWHERE t1.revenue > -- yesterday's revenue\nORDER BY t1.record_date;",
      expectedQuery: "SELECT t1.id, t1.record_date, t1.revenue FROM daily_metrics t1 JOIN daily_metrics t2 ON date(t1.record_date) = date(t2.record_date, '+1 day') WHERE t1.revenue > t2.revenue ORDER BY t1.record_date;",
      hints: [
        'A self-join means joining the same table to itself using different aliases (t1, t2)',
        "SQLite's date() function supports date arithmetic: date(record_date, '+1 day') represents the next day",
      ],
      explanation: "A Self-Join treats the same table as two separate tables for comparison. Here t1 represents \"today\" and t2 represents \"yesterday,\" linked by date(t1.record_date) = date(t2.record_date, '+1 day') to establish a \"today = yesterday + 1 day\" relationship. Then WHERE t1.revenue > t2.revenue filters for days with growth. This is a classic \"compare with the previous row\" pattern, widely used in trend analysis.",
      frameworkTip: 'The key to self-joins is clearly defining "who is compared with whom": first assign roles to t1 and t2, then use ON to describe their relationship',
    },
    {
      id: 5,
      name: 'Cross Join + Left Join Combo',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Employee Training Completion Report',
        narrative: 'The HR manager needs a report showing each employee\'s completion status for every training course. Even if an employee hasn\'t taken a certain course, it should still appear in the report (with a completion count of 0). This requires a CROSS JOIN to generate all combinations first, then a LEFT JOIN to bring in actual completion data.\n\nTables:\n- employees (id INTEGER, name TEXT)\n- courses (id INTEGER, course_name TEXT)\n- completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT)',
      },
      question: 'Write a SQL query to display each employee\'s completion count for every course. Courses not taken should show 0.',
      sampleSchema: `
        CREATE TABLE employees (id INTEGER, name TEXT);
        INSERT INTO employees VALUES (1, 'Alice');
        INSERT INTO employees VALUES (2, 'Bob');
        INSERT INTO employees VALUES (3, 'Charlie');
        CREATE TABLE courses (id INTEGER, course_name TEXT);
        INSERT INTO courses VALUES (101, 'SQL 基礎');
        INSERT INTO courses VALUES (102, 'Excel 報表');
        INSERT INTO courses VALUES (103, '簡報技巧');
        CREATE TABLE completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT);
        INSERT INTO completions VALUES (1, 1, 101, '2026-01-15');
        INSERT INTO completions VALUES (2, 1, 102, '2026-01-20');
        INSERT INTO completions VALUES (3, 2, 101, '2026-02-01');
        INSERT INTO completions VALUES (4, 1, 101, '2026-02-10');
        INSERT INTO completions VALUES (5, 3, 103, '2026-02-15');
      `,
      starterCode: "SELECT e.name, c.course_name,\n       -- How do you calculate the completion count (0 for uncompleted)?\n       AS completion_count\nFROM employees e\n-- First generate all employee x course combinations\n-- Then LEFT JOIN the completion records\nGROUP BY e.id, c.id\nORDER BY e.name, c.course_name;",
      expectedQuery: "SELECT e.name, c.course_name, COUNT(comp.id) AS completion_count FROM employees e CROSS JOIN courses c LEFT JOIN completions comp ON e.id = comp.employee_id AND c.id = comp.course_id GROUP BY e.id, c.id ORDER BY e.name, c.course_name;",
      hints: [
        'CROSS JOIN produces the "full Cartesian product" of two tables (3 employees x 3 courses = 9 rows)',
        'When LEFT JOINing completions, you need to match both employee_id and course_id',
        'COUNT(comp.id) only counts non-NULL values, so uncompleted courses will show 0',
      ],
      explanation: "CROSS JOIN + LEFT JOIN is a classic pattern for generating a \"complete matrix report.\" CROSS JOIN first creates all employee-course combinations (ensuring every pair has a row), then LEFT JOIN brings in the actual completion records. COUNT(comp.id) only counts matched rows, so missing completions naturally become 0. This is extremely common in practice: attendance reports, exam scores, product-by-region sales matrices, etc.",
      frameworkTip: 'When an interview question requires "show results even if there is no data," think CROSS JOIN to build the skeleton + LEFT JOIN to fill in the data — a powerful problem-solving pattern',
    },
    {
      id: 6,
      name: 'LEFT JOIN + Conditional Aggregation',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'User Confirmation Rate Analysis',
        narrative: 'The product team is analyzing the effectiveness of the user identity verification flow. Each user may initiate multiple verification requests, each resulting in either confirmed or timeout. The PM wants to know each user\'s "confirmation rate": confirmed count / total verification count. Users who never initiated a verification should show 0.00.\n\nTables:\n- signups (user_id INTEGER, signup_date TEXT)\n- confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT)\n  The action column contains either confirmed or timeout',
      },
      question: 'Write a SQL query to calculate each user\'s confirmation rate (rounded to two decimal places). Users with no verification records should show 0.00.',
      sampleSchema: `
        CREATE TABLE signups (user_id INTEGER, signup_date TEXT);
        INSERT INTO signups VALUES (1, '2026-01-01');
        INSERT INTO signups VALUES (2, '2026-01-05');
        INSERT INTO signups VALUES (3, '2026-01-10');
        INSERT INTO signups VALUES (4, '2026-01-15');
        INSERT INTO signups VALUES (5, '2026-01-20');
        CREATE TABLE confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT);
        INSERT INTO confirmations VALUES (1, 1, 'confirmed', '2026-01-02');
        INSERT INTO confirmations VALUES (2, 1, 'confirmed', '2026-01-03');
        INSERT INTO confirmations VALUES (3, 2, 'timeout', '2026-01-06');
        INSERT INTO confirmations VALUES (4, 2, 'confirmed', '2026-01-07');
        INSERT INTO confirmations VALUES (5, 3, 'timeout', '2026-01-11');
        INSERT INTO confirmations VALUES (6, 3, 'timeout', '2026-01-12');
        INSERT INTO confirmations VALUES (7, 4, 'confirmed', '2026-01-16');
      `,
      starterCode: "SELECT s.user_id,\n       -- Calculate confirmation rate; show 0.00 if no records\n       AS confirmation_rate\nFROM signups s\n-- Which type of JOIN?\nGROUP BY s.user_id\nORDER BY s.user_id;",
      expectedQuery: "SELECT s.user_id, ROUND(COALESCE(1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(c.id), 0), 0.00), 2) AS confirmation_rate FROM signups s LEFT JOIN confirmations c ON s.user_id = c.user_id GROUP BY s.user_id ORDER BY s.user_id;",
      hints: [
        'LEFT JOIN ensures users with no verification records still appear',
        "SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) counts the number of successes",
        'NULLIF(COUNT(c.id), 0) prevents division by zero, then COALESCE converts NULL to 0.00',
      ],
      explanation: "This problem combines four techniques: LEFT JOIN (retain all users), CASE WHEN (conditional counting), NULLIF (avoid division by zero), and COALESCE (handle NULLs). LEFT JOIN ensures users without verification records still appear, CASE WHEN performs conditional counting within aggregation, NULLIF prevents division-by-zero errors, and COALESCE sets users with no records to 0.00. This \"rate calculation\" pattern is extremely common in conversion rate, completion rate, and similar analyses.",
      frameworkTip: 'Defensive pattern for calculating ratios: COALESCE(success_count / NULLIF(total_count, 0), 0) — handles both "no denominator" and "zero denominator" cases simultaneously',
    },
  ],

  '24-2': [
    {
      id: 4,
      name: 'CASE WHEN with Mathematical Logic',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Package Dimension Feasibility Check',
        narrative: 'The logistics team received dimension data (three sides) for a batch of shipments and needs to determine which items can fit into a special packaging box with a triangular cross-section. A valid triangle requires that the sum of any two sides is greater than the third. You need to flag whether each item\'s three sides can form a triangle.\n\nTable:\n- packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT)',
      },
      question: 'Write a SQL query to determine whether each item\'s three sides can form a triangle, labeling them as Yes or No.',
      sampleSchema: `
        CREATE TABLE packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT);
        INSERT INTO packages VALUES (1, 10.0, 15.0, 12.0, '精密儀器 A');
        INSERT INTO packages VALUES (2, 3.0, 4.0, 8.0, '長條零件 B');
        INSERT INTO packages VALUES (3, 7.0, 7.0, 7.0, '立方體零件 C');
        INSERT INTO packages VALUES (4, 1.0, 2.0, 3.0, '薄片零件 D');
        INSERT INTO packages VALUES (5, 5.0, 8.0, 6.0, '標準零件 E');
        INSERT INTO packages VALUES (6, 20.0, 5.0, 10.0, '異形零件 F');
      `,
      starterCode: "SELECT id, item_name, side_a, side_b, side_c,\n       CASE\n         -- Triangle condition: sum of any two sides > the third\n       END AS is_triangle\nFROM packages\nORDER BY id;",
      expectedQuery: "SELECT id, item_name, side_a, side_b, side_c, CASE WHEN side_a + side_b > side_c AND side_a + side_c > side_b AND side_b + side_c > side_a THEN 'Yes' ELSE 'No' END AS is_triangle FROM packages ORDER BY id;",
      hints: [
        'A valid triangle requires all three conditions to hold simultaneously — connect them with AND',
        'a + b > c AND a + c > b AND b + c > a',
      ],
      explanation: "CASE WHEN isn't just for categorization — it can also handle mathematical logic. The triangle inequality requires all three conditions to be true simultaneously: the sum of any two sides must be greater than the third. Here, AND chains the three conditions together, marking Yes only when all are satisfied. This ability to translate \"business rules into SQL conditions\" is critical in practice: credit scoring rules, inventory alerts, compliance checks, and more all follow similar logic.",
      frameworkTip: 'When translating business rules into SQL conditions, first list all required conditions, then decide whether to use AND (all must be met) or OR (any one suffices)',
    },
    {
      id: 5,
      name: 'CASE WHEN + Subquery: Primary Assignment',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Employee Primary Department Assignment',
        narrative: 'Some employees belong to multiple departments (cross-functional projects). The HR system flags which one is primary (primary_flag = Y). However, some employees belong to only one department and have no primary_flag set.\n\nThe HR manager needs a "primary department" list for every employee:\n- If primary_flag = Y exists, use that department\n- If the employee belongs to only one department, that is the primary department\n\nTable:\n- employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT)',
      },
      question: 'Write a SQL query to find each employee\'s primary department.',
      sampleSchema: `
        CREATE TABLE employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT);
        INSERT INTO employee_dept VALUES (1, 'Engineering', 'N');
        INSERT INTO employee_dept VALUES (1, 'Marketing', 'Y');
        INSERT INTO employee_dept VALUES (2, 'Sales', 'Y');
        INSERT INTO employee_dept VALUES (2, 'Product', 'N');
        INSERT INTO employee_dept VALUES (2, 'Engineering', 'N');
        INSERT INTO employee_dept VALUES (3, 'Operations', NULL);
        INSERT INTO employee_dept VALUES (4, 'Finance', NULL);
        INSERT INTO employee_dept VALUES (5, 'Engineering', 'N');
        INSERT INTO employee_dept VALUES (5, 'Design', 'Y');
      `,
      starterCode: "SELECT employee_id, department\nFROM employee_dept\nWHERE -- How do you handle both \"has a flag\" and \"only one department\" cases?\nORDER BY employee_id;",
      expectedQuery: "SELECT employee_id, department FROM employee_dept WHERE primary_flag = 'Y' OR employee_id IN (SELECT employee_id FROM employee_dept GROUP BY employee_id HAVING COUNT(*) = 1) ORDER BY employee_id;",
      hints: [
        'Use OR to combine two cases: those with a flag + those with only one department',
        'Use a subquery to find "employees who belong to only one department": GROUP BY employee_id HAVING COUNT(*) = 1',
      ],
      explanation: "The key to this problem is handling two distinct cases: (1) Employees with an explicit primary_flag = 'Y' — take that department directly. (2) Employees belonging to only one department (no flag set) — use a subquery with HAVING COUNT(*) = 1 to identify them. The two conditions are combined with OR. This \"handle different cases\" logic is very common in practice: different user types have different evaluation rules.",
      frameworkTip: 'When facing a "multiple cases" problem, first list all cases, then write the corresponding WHERE condition for each, and finally combine them with OR / UNION',
    },
  ],

  '24-3': [
    {
      id: 4,
      name: 'Subquery: Finding the Second Highest Value',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'Second Highest Salary Query',
        narrative: 'The HR manager wants to know the second highest salary in the company as a reference benchmark for salary grading. Note: if there is no second highest salary (e.g., everyone has the same salary), the result should return NULL.\n\nTable:\n- employees (id INTEGER, name TEXT, salary REAL, department TEXT)',
      },
      question: 'Write a SQL query to find the second highest salary. If it does not exist, return NULL.',
      sampleSchema: `
        CREATE TABLE employees (id INTEGER, name TEXT, salary REAL, department TEXT);
        INSERT INTO employees VALUES (1, 'Alice', 85000.00, 'Engineering');
        INSERT INTO employees VALUES (2, 'Bob', 72000.00, 'Marketing');
        INSERT INTO employees VALUES (3, 'Charlie', 85000.00, 'Engineering');
        INSERT INTO employees VALUES (4, 'Diana', 95000.00, 'Product');
        INSERT INTO employees VALUES (5, 'Eve', 68000.00, 'Sales');
        INSERT INTO employees VALUES (6, 'Frank', 72000.00, 'Marketing');
      `,
      starterCode: "SELECT\n  -- How to get the second highest salary?\n  -- Should return NULL if it doesn't exist\n  AS second_highest_salary;",
      expectedQuery: "SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);",
      hints: [
        'First use a subquery to find the highest salary, then find "the maximum value less than the highest"',
        'MAX() naturally returns NULL if no rows match',
        'Think in terms of DISTINCT: if multiple people share the highest salary, the second highest is not a duplicate of that value',
      ],
      explanation: "\"Find the Nth highest\" is a classic subquery problem. The strategy: first use a subquery to find the maximum (SELECT MAX(salary)), then in the outer query find \"the maximum value less than the highest.\" If everyone has the same salary, WHERE salary < MAX won't match any rows, and MAX() naturally returns NULL. This approach is more elegant than LIMIT + OFFSET and better demonstrates your understanding of subqueries.",
      frameworkTip: 'For interview "find the Nth highest" problems, first describe the exclusion method (use a subquery to exclude the top N-1), then mention a DENSE_RANK window function approach as an alternative',
    },
    {
      id: 5,
      name: 'UNION Subquery: Dual-Dimension Ranking',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'Restaurant Review Analysis Report',
        narrative: 'A dining platform needs to prepare a summary with two pieces of information in a single result set:\n1. The user with the most reviews\n2. The restaurant with the highest average rating in February 2026\n\nCombine both results into one table using UNION.\n\nTables:\n- users (user_id INTEGER, name TEXT)\n- restaurants (restaurant_id INTEGER, name TEXT)\n- reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT)',
      },
      question: 'Write a SQL query using UNION to combine two results: (1) the user with the most reviews and (2) the restaurant with the highest average rating in 2026-02.',
      sampleSchema: `
        CREATE TABLE users (user_id INTEGER, name TEXT);
        INSERT INTO users VALUES (1, 'Alice');
        INSERT INTO users VALUES (2, 'Bob');
        INSERT INTO users VALUES (3, 'Charlie');
        CREATE TABLE restaurants (restaurant_id INTEGER, name TEXT);
        INSERT INTO restaurants VALUES (101, '鼎泰豐');
        INSERT INTO restaurants VALUES (102, '阿宗麵線');
        INSERT INTO restaurants VALUES (103, '度小月');
        CREATE TABLE reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT);
        INSERT INTO reviews VALUES (1, 1, 101, 5, '2026-01-10');
        INSERT INTO reviews VALUES (2, 1, 102, 4, '2026-01-15');
        INSERT INTO reviews VALUES (3, 2, 101, 3, '2026-02-01');
        INSERT INTO reviews VALUES (4, 1, 103, 5, '2026-02-05');
        INSERT INTO reviews VALUES (5, 3, 102, 4, '2026-02-10');
        INSERT INTO reviews VALUES (6, 2, 103, 5, '2026-02-15');
        INSERT INTO reviews VALUES (7, 3, 101, 4, '2026-02-20');
        INSERT INTO reviews VALUES (8, 1, 101, 5, '2026-02-25');
        INSERT INTO reviews VALUES (9, 2, 102, 3, '2026-02-28');
      `,
      starterCode: "-- Part 1: User with the most reviews\nSELECT -- ...\n\nUNION ALL\n\n-- Part 2: Restaurant with the highest average rating in 2026-02\nSELECT -- ...;",
      expectedQuery: "SELECT u.name AS result FROM users u JOIN reviews r ON u.user_id = r.user_id GROUP BY u.user_id ORDER BY COUNT(*) DESC, u.name LIMIT 1 UNION ALL SELECT rest.name AS result FROM restaurants rest JOIN reviews r ON rest.restaurant_id = r.restaurant_id WHERE substr(r.review_date, 1, 7) = '2026-02' GROUP BY rest.restaurant_id ORDER BY AVG(r.rating) DESC, rest.name LIMIT 1;",
      hints: [
        'UNION ALL merges two SELECT results — they must have the same number and compatible types of columns',
        'Each subquery needs ORDER BY + LIMIT 1 to find the "most/highest" entry',
        'Use alphabetical name ordering (ORDER BY name) as the tiebreaker',
      ],
      explanation: "UNION ALL can merge two entirely different query results into one table, as long as the column count and types are compatible. The first query finds the user with the most reviews, and the second finds the restaurant with the highest average rating in a specific month. Each subquery independently performs JOIN + GROUP BY + ORDER BY + LIMIT. This \"multi-dimension ranking\" requirement is common in product reports: presenting Top 1 from different perspectives simultaneously.",
      frameworkTip: 'The two SELECTs in a UNION must have the same number of columns with compatible types. Column names are determined by the first SELECT.',
    },
  ],

  '24-4': [
    {
      id: 3,
      name: 'CTE + Window: Moving Average',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '7-Day Moving Average Revenue',
        narrative: 'The finance director wants to see a "7-day moving average revenue" for each day to smooth out daily fluctuations and observe long-term trends. The moving average is defined as the average daily revenue over the past 7 days (including the current day). Only display dates with a full 7 days of data available.\n\nTable:\n- daily_revenue (visit_date TEXT, revenue REAL)',
      },
      question: 'Write a SQL query using CTE + Window Function to calculate the 7-day moving average revenue for each day (rounded to two decimal places).',
      sampleSchema: `
        CREATE TABLE daily_revenue (visit_date TEXT, revenue REAL);
        INSERT INTO daily_revenue VALUES ('2026-03-01', 5200.00);
        INSERT INTO daily_revenue VALUES ('2026-03-02', 4800.00);
        INSERT INTO daily_revenue VALUES ('2026-03-03', 6100.00);
        INSERT INTO daily_revenue VALUES ('2026-03-04', 5500.00);
        INSERT INTO daily_revenue VALUES ('2026-03-05', 7200.00);
        INSERT INTO daily_revenue VALUES ('2026-03-06', 6800.00);
        INSERT INTO daily_revenue VALUES ('2026-03-07', 5900.00);
        INSERT INTO daily_revenue VALUES ('2026-03-08', 6300.00);
        INSERT INTO daily_revenue VALUES ('2026-03-09', 7100.00);
        INSERT INTO daily_revenue VALUES ('2026-03-10', 8000.00);
        INSERT INTO daily_revenue VALUES ('2026-03-11', 6500.00);
        INSERT INTO daily_revenue VALUES ('2026-03-12', 7400.00);
        INSERT INTO daily_revenue VALUES ('2026-03-13', 5800.00);
        INSERT INTO daily_revenue VALUES ('2026-03-14', 6900.00);
      `,
      starterCode: "WITH moving AS (\n  SELECT visit_date, revenue,\n         -- Use a Window Function to calculate the 7-day moving average\n         AS avg_7d,\n         ROW_NUMBER() OVER (ORDER BY visit_date) AS rn\n  FROM daily_revenue\n)\nSELECT visit_date, revenue,\n       ROUND(avg_7d, 2) AS moving_avg_7d\nFROM moving\nWHERE rn >= 7\nORDER BY visit_date;",
      expectedQuery: "WITH moving AS (SELECT visit_date, revenue, AVG(revenue) OVER (ORDER BY visit_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg_7d, ROW_NUMBER() OVER (ORDER BY visit_date) AS rn FROM daily_revenue) SELECT visit_date, revenue, ROUND(avg_7d, 2) AS moving_avg_7d FROM moving WHERE rn >= 7 ORDER BY visit_date;",
      hints: [
        'ROWS BETWEEN 6 PRECEDING AND CURRENT ROW in the Window Function defines a 7-day window',
        'Use ROW_NUMBER() for numbering, then WHERE rn >= 7 ensures only dates with a full 7 days of data are shown',
        'AVG() OVER (...) computes the average within the window',
      ],
      explanation: "Moving averages are a fundamental tool in time series analysis. The Window Function's ROWS BETWEEN 6 PRECEDING AND CURRENT ROW defines a sliding window: from 6 rows before to the current row (7 rows total). AVG(revenue) OVER (...) computes the average within this window. The CTE calculates the moving average and row number for all rows, and the outer query uses WHERE rn >= 7 to ensure only results with a complete 7-day window are displayed. This is extremely common in operational dashboards.",
      frameworkTip: 'ROWS BETWEEN N PRECEDING AND CURRENT ROW is the standard syntax for defining a moving window. Demonstrating this syntax when discussing "moving averages" in an interview will make a strong impression',
    },
    {
      id: 4,
      name: 'CTE + UNION: Bidirectional Relationship Counting',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'Find the Employee with the Most Collaboration Partners',
        narrative: 'The company has a "project pairing" system that records which employees have collaborated on projects together. Pairings are bidirectional: if A collaborates with B, then B also collaborates with A. Management wants to know which employee has the most collaboration partners (the widest social network).\n\nTable:\n- project_pairs (requester_id INTEGER, accepter_id INTEGER)\n  Each record indicates the requester initiated a collaboration invitation and the accepter accepted',
      },
      question: 'Write a SQL query to find the employee ID with the most collaboration partners and the partner count.',
      sampleSchema: `
        CREATE TABLE project_pairs (requester_id INTEGER, accepter_id INTEGER);
        INSERT INTO project_pairs VALUES (1, 2);
        INSERT INTO project_pairs VALUES (1, 3);
        INSERT INTO project_pairs VALUES (2, 3);
        INSERT INTO project_pairs VALUES (3, 4);
        INSERT INTO project_pairs VALUES (4, 5);
        INSERT INTO project_pairs VALUES (1, 5);
        INSERT INTO project_pairs VALUES (2, 4);
      `,
      starterCode: "WITH all_connections AS (\n  -- Flatten bidirectional relationships into unidirectional\n  -- Use UNION ALL to list both requester and accepter\n)\nSELECT employee_id,\n       COUNT(*) AS partner_count\nFROM all_connections\nGROUP BY employee_id\nORDER BY partner_count DESC\nLIMIT 1;",
      expectedQuery: "WITH all_connections AS (SELECT requester_id AS employee_id FROM project_pairs UNION ALL SELECT accepter_id AS employee_id FROM project_pairs) SELECT employee_id, COUNT(*) AS partner_count FROM all_connections GROUP BY employee_id ORDER BY partner_count DESC LIMIT 1;",
      hints: [
        'Handling bidirectional relationships: treat requester_id and accepter_id each as employee_id, and combine with UNION ALL',
        'Each appearance represents one collaboration partner, so COUNT(*) gives the partner count',
        'ORDER BY ... DESC LIMIT 1 finds the one with the most',
      ],
      explanation: "Bidirectional relationships (such as friendships or collaborations) are typically stored in only one direction in databases. To count each person's \"connection count,\" you need to account for both directions. The CTE uses UNION ALL to convert both requester_id and accepter_id into a unified employee_id, so each appearance represents one collaboration relationship. Then GROUP BY + COUNT(*) tallies each person's partner count. This is a foundational technique in social network analysis.",
      frameworkTip: 'When facing a bidirectional relationship problem, the first step is always to use UNION ALL to flatten both directions into a unified format, then perform aggregation analysis',
    },
  ],

  '24-5': [
    {
      id: 4,
      name: 'Flagging Duplicate Records (Keep Smallest ID)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Duplicate Email Cleanup Flagging',
        narrative: 'In a previous challenge, you already identified duplicate emails. Now take it a step further: find the duplicate records that should be deleted. The rule is "keep the record with the smallest id and flag the rest as duplicates." You won\'t actually delete any data (DELETE is too risky) — instead, first query all records that should be flagged as duplicates.\n\nTable:\n- contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)',
      },
      question: 'Write a SQL query to find all duplicate email records that should be removed (keep the one with the smallest id in each group, and list the rest).',
      sampleSchema: `
        CREATE TABLE contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT);
        INSERT INTO contacts VALUES (1, 'alice@mail.com', 'Alice', '2026-01-01');
        INSERT INTO contacts VALUES (2, 'bob@mail.com', 'Bob', '2026-01-05');
        INSERT INTO contacts VALUES (3, 'alice@mail.com', 'Alice Chen', '2026-01-10');
        INSERT INTO contacts VALUES (4, 'charlie@mail.com', 'Charlie', '2026-01-12');
        INSERT INTO contacts VALUES (5, 'bob@mail.com', 'Bob Wang', '2026-01-15');
        INSERT INTO contacts VALUES (6, 'bob@mail.com', 'Bob Lee', '2026-01-20');
        INSERT INTO contacts VALUES (7, 'diana@mail.com', 'Diana', '2026-01-22');
      `,
      starterCode: "SELECT c1.id, c1.email, c1.name\nFROM contacts c1\n-- How to find records with the \"same email but not the smallest id\"?\nORDER BY c1.email, c1.id;",
      expectedQuery: "SELECT c1.id, c1.email, c1.name FROM contacts c1 WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) ORDER BY c1.email, c1.id;",
      hints: [
        'Use a correlated subquery to find the minimum id for the same email',
        'WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email)',
        'If c1.id is greater than the minimum id for the same email, it is a duplicate',
      ],
      explanation: "This is a classic \"deduplicate and keep the smallest ID\" pattern. The correlated subquery (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) finds the smallest id for each email. If the current row's id is greater than this minimum, it is a duplicate that should be removed. In practice, this query is typically the first step in data cleanup: use SELECT to confirm the rows to delete, verify they are correct, then convert to DELETE.",
      frameworkTip: 'The golden rule of data cleanup: first use SELECT to identify the data to be processed, manually verify it, then execute DELETE/UPDATE. Mentioning this practice in an interview demonstrates your careful approach to production data',
    },
  ],
};
