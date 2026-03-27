// ── World 23 Extra Challenges (Inspired by LeetCode SQL 50) ──────────────────
// These challenges are appended to the corresponding quests in World 23

export const w23ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-2: SELECT / FROM / WHERE Deep Dive — 3 New Challenges
  // ══════════════════════════════════════════════════════════════════
  '23-2': [
    {
      id: 4,
      name: 'Multi-Boolean Condition Filtering',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Sustainable Product Label Filtering',
        narrative:
          'You work on the data team at a large retailer. The company recently launched a "Sustainable Products" initiative, and the products table has two flag columns: is_recyclable (recyclable packaging) and is_low_carbon (low-carbon manufacturing). The marketing team wants to find products that meet both criteria for a green zone recommendation.\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, is_recyclable INTEGER, is_low_carbon INTEGER)',
      },
      question:
        'Find products where is_recyclable = 1 AND is_low_carbon = 1. Display name, category, and price.',
      sampleSchema: `CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price REAL NOT NULL,
  is_recyclable INTEGER NOT NULL,
  is_low_carbon INTEGER NOT NULL
);
INSERT INTO products VALUES (1, '竹纖維牙刷', '日用品', 45.00, 1, 1);
INSERT INTO products VALUES (2, '塑膠水瓶', '日用品', 25.00, 0, 0);
INSERT INTO products VALUES (3, '再生紙筆記本', '文具', 35.00, 1, 1);
INSERT INTO products VALUES (4, '不鏽鋼吸管組', '日用品', 120.00, 1, 0);
INSERT INTO products VALUES (5, '有機棉T恤', '服飾', 580.00, 1, 1);
INSERT INTO products VALUES (6, '快時尚外套', '服飾', 390.00, 0, 0);
INSERT INTO products VALUES (7, '環保洗碗精', '清潔用品', 89.00, 1, 1);
INSERT INTO products VALUES (8, '一般洗衣精', '清潔用品', 65.00, 0, 1);`,
      starterCode:
        "SELECT name, category, price\nFROM products\nWHERE -- two boolean conditions;",
      expectedQuery:
        "SELECT name, category, price FROM products WHERE is_recyclable = 1 AND is_low_carbon = 1;",
      hints: [
        'In SQLite, boolean values are represented as 0 and 1',
        'Use AND to combine two conditions that must both be true',
      ],
      explanation:
        'SQLite does not have a native BOOLEAN type; it typically uses INTEGER with 0 (false) and 1 (true). When filtering, simply compare with = 1. The key to this problem is applying two boolean conditions simultaneously — AND ensures both must be satisfied.',
      frameworkTip:
        'When filtering on multiple boolean columns, first confirm the meaning and value range of each column (0/1 vs TRUE/FALSE), then combine the conditions. In an interview, explain your understanding of the data columns.',
    },
    {
      id: 5,
      name: 'NULL Value Handling',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Member Referrer Analysis',
        narrative:
          'The membership system records each member\'s referrer (referrer_id). The marketing team wants to find members who were NOT referred by the VIP member (ID = 2) to apply a different marketing strategy. Note: some members signed up organically and have no referrer (referrer_id is NULL).\n\nTable structure: members (id INTEGER, name TEXT, referrer_id INTEGER)',
      },
      question:
        "Find members whose referrer_id is not 2 (including those with no referrer). Display name.",
      sampleSchema: `CREATE TABLE members (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  referrer_id INTEGER
);
INSERT INTO members VALUES (1, 'Alice', NULL);
INSERT INTO members VALUES (2, 'Bob', NULL);
INSERT INTO members VALUES (3, 'Charlie', 2);
INSERT INTO members VALUES (4, 'Diana', 1);
INSERT INTO members VALUES (5, 'Eve', 2);
INSERT INTO members VALUES (6, 'Frank', NULL);
INSERT INTO members VALUES (7, 'Grace', 3);
INSERT INTO members VALUES (8, 'Henry', 2);`,
      starterCode:
        "SELECT name\nFROM members\nWHERE -- watch out for NULL handling;",
      expectedQuery:
        "SELECT name FROM members WHERE referrer_id != 2 OR referrer_id IS NULL;",
      hints: [
        'NULL != 2 does not evaluate to TRUE — it evaluates to NULL (unknown)',
        'Use IS NULL to check for NULL values',
        'Use OR to include both cases',
      ],
      explanation:
        'The trap in this problem is SQL\'s three-valued logic. In SQL, NULL != 2 evaluates to NULL (not TRUE), so WHERE referrer_id != 2 automatically excludes rows where the value is NULL. To include members without a referrer, you must add OR referrer_id IS NULL. This is one of the most common bugs in SQL.',
      frameworkTip:
        'NULL handling is a frequently tested interview topic. Remember three principles: (1) Any comparison involving NULL evaluates to NULL, (2) Use IS NULL / IS NOT NULL to check for NULLs, (3) WHERE only keeps rows where the result is TRUE.',
    },
    {
      id: 6,
      name: 'OR Multi-Condition Filtering',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'International Market Filtering',
        narrative:
          'You work at a multinational consulting firm, and the team is analyzing market opportunities across countries. They define a "large market" as one with an area exceeding 3 million square kilometers OR a population exceeding 25 million. Find the qualifying markets from the countries table.\n\nTable structure: countries (id INTEGER, name TEXT, continent TEXT, area_sq_km REAL, population INTEGER, gdp_usd REAL)',
      },
      question:
        'Find countries where area_sq_km > 3000000 OR population > 25000000. Display name, area_sq_km, and population.',
      sampleSchema: `CREATE TABLE countries (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  continent TEXT NOT NULL,
  area_sq_km REAL NOT NULL,
  population INTEGER NOT NULL,
  gdp_usd REAL NOT NULL
);
INSERT INTO countries VALUES (1, 'Japan', 'Asia', 377975, 125800000, 4.94e12);
INSERT INTO countries VALUES (2, 'Iceland', 'Europe', 103000, 376000, 2.4e10);
INSERT INTO countries VALUES (3, 'Australia', 'Oceania', 7692024, 26000000, 1.55e12);
INSERT INTO countries VALUES (4, 'Singapore', 'Asia', 733, 5900000, 3.97e11);
INSERT INTO countries VALUES (5, 'Canada', 'North America', 9984670, 39000000, 2.14e12);
INSERT INTO countries VALUES (6, 'Luxembourg', 'Europe', 2586, 654000, 8.5e10);
INSERT INTO countries VALUES (7, 'Brazil', 'South America', 8515767, 214000000, 1.92e12);
INSERT INTO countries VALUES (8, 'Taiwan', 'Asia', 36193, 23500000, 7.9e11);`,
      starterCode:
        "SELECT name, area_sq_km, population\nFROM countries\nWHERE -- area or population condition;",
      expectedQuery:
        "SELECT name, area_sq_km, population FROM countries WHERE area_sq_km > 3000000 OR population > 25000000;",
      hints: [
        'OR means "either condition being true is sufficient"',
        'Numeric comparisons do not require quotes',
      ],
      explanation:
        'The OR operator includes a row as long as either side of the condition is true. For example, Taiwan\'s population does not exceed 25 million and its area does not exceed 3 million, so it does not qualify. Japan, although its area is under 3 million, has a population exceeding 25 million, so it qualifies. The difference between OR and AND is a fundamental logic concept tested in interviews.',
      frameworkTip:
        'In interviews, when the requirement says "A or B", use OR; when it says "A and B", use AND. If AND and OR are mixed in the same query, always use parentheses to group them explicitly.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-3: Sorting & Advanced Filtering — 2 New Challenges
  // ══════════════════════════════════════════════════════════════════
  '23-3': [
    {
      id: 4,
      name: 'Date Range & Counting',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Active Users in the Last 30 Days',
        narrative:
          'The product team wants to understand Daily Active User (DAU) trends over the last 30 days. The activity log records each user\'s actions, and a single user may have multiple entries on the same day. You need to count distinct active users per day.\n\nTable structure: user_activity (id INTEGER, user_id INTEGER, activity_type TEXT, activity_date TEXT)',
      },
      question:
        "Count the number of distinct active users per day (alias active_users) between 2024-03-01 and 2024-03-31. Order by activity_date.",
      sampleSchema: `CREATE TABLE user_activity (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  activity_type TEXT NOT NULL,
  activity_date TEXT NOT NULL
);
INSERT INTO user_activity VALUES (1, 101, 'login', '2024-03-01');
INSERT INTO user_activity VALUES (2, 102, 'login', '2024-03-01');
INSERT INTO user_activity VALUES (3, 101, 'page_view', '2024-03-01');
INSERT INTO user_activity VALUES (4, 103, 'login', '2024-03-01');
INSERT INTO user_activity VALUES (5, 101, 'login', '2024-03-02');
INSERT INTO user_activity VALUES (6, 104, 'login', '2024-03-02');
INSERT INTO user_activity VALUES (7, 102, 'page_view', '2024-03-02');
INSERT INTO user_activity VALUES (8, 102, 'login', '2024-03-02');
INSERT INTO user_activity VALUES (9, 105, 'login', '2024-03-03');
INSERT INTO user_activity VALUES (10, 101, 'login', '2024-03-03');
INSERT INTO user_activity VALUES (11, 101, 'purchase', '2024-03-03');
INSERT INTO user_activity VALUES (12, 106, 'login', '2024-02-28');`,
      starterCode:
        "SELECT activity_date,\n       -- distinct user count\nFROM user_activity\nWHERE -- date range\nGROUP BY activity_date\nORDER BY activity_date;",
      expectedQuery:
        "SELECT activity_date, COUNT(DISTINCT user_id) AS active_users FROM user_activity WHERE activity_date BETWEEN '2024-03-01' AND '2024-03-31' GROUP BY activity_date ORDER BY activity_date;",
      hints: [
        'COUNT(DISTINCT column) counts unique values only',
        'Use BETWEEN to filter a date range',
        'A single user may have multiple records per day — use DISTINCT to deduplicate',
      ],
      explanation:
        'COUNT(DISTINCT user_id) is the key here — it counts only unique user IDs. Without DISTINCT, multiple actions by the same user on the same day would be counted repeatedly, inflating the active user count. This is the most fundamental way to calculate DAU (Daily Active Users).',
      frameworkTip:
        'When DAU/MAU metrics come up in interviews, always emphasize using COUNT(DISTINCT user_id) instead of COUNT(*). This shows you understand how product metrics are defined.',
    },
    {
      id: 5,
      name: 'Filtering Grouped Results with HAVING',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Popular Course Filtering',
        narrative:
          'An online learning platform wants to identify "popular courses" for homepage recommendations. A course is defined as popular if it has 5 or more enrolled students. Each enrollment record represents one student enrolling in one course.\n\nTable structure: enrollments (id INTEGER, student_id INTEGER, course_name TEXT, enroll_date TEXT)',
      },
      question:
        'Find courses with enrollment count >= 5. Display course_name and student count (student_count), ordered by student_count descending.',
      sampleSchema: `CREATE TABLE enrollments (
  id INTEGER PRIMARY KEY,
  student_id INTEGER NOT NULL,
  course_name TEXT NOT NULL,
  enroll_date TEXT NOT NULL
);
INSERT INTO enrollments VALUES (1, 101, 'SQL 入門', '2024-01-10');
INSERT INTO enrollments VALUES (2, 102, 'SQL 入門', '2024-01-11');
INSERT INTO enrollments VALUES (3, 103, 'Python 基礎', '2024-01-12');
INSERT INTO enrollments VALUES (4, 104, 'SQL 入門', '2024-01-13');
INSERT INTO enrollments VALUES (5, 105, 'SQL 入門', '2024-01-14');
INSERT INTO enrollments VALUES (6, 106, 'SQL 入門', '2024-01-15');
INSERT INTO enrollments VALUES (7, 101, 'Python 基礎', '2024-01-16');
INSERT INTO enrollments VALUES (8, 102, 'Python 基礎', '2024-01-17');
INSERT INTO enrollments VALUES (9, 103, '機器學習', '2024-01-18');
INSERT INTO enrollments VALUES (10, 107, 'Python 基礎', '2024-01-19');
INSERT INTO enrollments VALUES (11, 108, 'Python 基礎', '2024-01-20');
INSERT INTO enrollments VALUES (12, 104, '機器學習', '2024-01-21');
INSERT INTO enrollments VALUES (13, 109, 'SQL 入門', '2024-01-22');
INSERT INTO enrollments VALUES (14, 110, '資料視覺化', '2024-01-23');
INSERT INTO enrollments VALUES (15, 105, '機器學習', '2024-01-24');`,
      starterCode:
        "SELECT course_name,\n       COUNT(*) AS student_count\nFROM enrollments\nGROUP BY course_name\n-- filter by count condition\nORDER BY student_count DESC;",
      expectedQuery:
        "SELECT course_name, COUNT(*) AS student_count FROM enrollments GROUP BY course_name HAVING COUNT(*) >= 5 ORDER BY student_count DESC;",
      hints: [
        'HAVING is used to filter results after GROUP BY',
        'In the HAVING clause, use the aggregate function COUNT(*), not the alias',
        '>= 5 means "greater than or equal to 5"',
      ],
      explanation:
        'GROUP BY course_name groups enrollment records by course, and COUNT(*) counts the number of records in each group (i.e., the number of students). HAVING COUNT(*) >= 5 keeps only courses with 5 or more students. Note that WHERE cannot filter aggregate results — WHERE executes before GROUP BY and can only filter raw data rows.',
      frameworkTip:
        'The distinction between WHERE and HAVING: WHERE filters "raw rows" (before GROUP BY), HAVING filters "grouped results" (after GROUP BY). One clear sentence in an interview is all you need.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-4: Aggregate Functions Deep Dive — 3 New Challenges
  // ══════════════════════════════════════════════════════════════════
  '23-4': [
    {
      id: 4,
      name: 'Weighted Average Calculation',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Product Weighted Average Selling Price',
        narrative:
          'An e-commerce platform\'s product prices fluctuate with promotions. The price log table records the selling price and units sold for each period. The finance team needs the "weighted average selling price" (weighted by units sold) for each product, not a simple average.\n\nTable structure: price_log (id INTEGER, product_id INTEGER, product_name TEXT, unit_price REAL, units_sold INTEGER, period TEXT)',
      },
      question:
        'Calculate the weighted average selling price for each product (alias weighted_avg_price): SUM(unit_price * units_sold) / SUM(units_sold). Display product_name and weighted_avg_price, ordered by product_name. Round the result to 2 decimal places.',
      sampleSchema: `CREATE TABLE price_log (
  id INTEGER PRIMARY KEY,
  product_id INTEGER NOT NULL,
  product_name TEXT NOT NULL,
  unit_price REAL NOT NULL,
  units_sold INTEGER NOT NULL,
  period TEXT NOT NULL
);
INSERT INTO price_log VALUES (1, 1, '無線滑鼠', 299.00, 50, '2024-01');
INSERT INTO price_log VALUES (2, 1, '無線滑鼠', 249.00, 120, '2024-02');
INSERT INTO price_log VALUES (3, 1, '無線滑鼠', 279.00, 80, '2024-03');
INSERT INTO price_log VALUES (4, 2, '機械鍵盤', 899.00, 30, '2024-01');
INSERT INTO price_log VALUES (5, 2, '機械鍵盤', 799.00, 60, '2024-02');
INSERT INTO price_log VALUES (6, 2, '機械鍵盤', 849.00, 45, '2024-03');
INSERT INTO price_log VALUES (7, 3, 'USB-C 集線器', 450.00, 40, '2024-01');
INSERT INTO price_log VALUES (8, 3, 'USB-C 集線器', 399.00, 90, '2024-02');
INSERT INTO price_log VALUES (9, 3, 'USB-C 集線器', 420.00, 70, '2024-03');`,
      starterCode:
        "SELECT product_name,\n       ROUND(-- weighted average formula, 2) AS weighted_avg_price\nFROM price_log\nGROUP BY product_name\nORDER BY product_name;",
      expectedQuery:
        "SELECT product_name, ROUND(SUM(unit_price * units_sold) * 1.0 / SUM(units_sold), 2) AS weighted_avg_price FROM price_log GROUP BY product_name ORDER BY product_name;",
      hints: [
        'Weighted average = total revenue / total quantity = SUM(price * qty) / SUM(qty)',
        'Use ROUND(value, 2) to round to 2 decimal places',
        'Multiply by 1.0 to ensure floating-point division (avoid integer division truncation)',
      ],
      explanation:
        'A weighted average differs from a simple average (AVG) in that it accounts for the sales volume associated with each price. The formula is SUM(unit_price * units_sold) / SUM(units_sold). For example, if a product sold 120 units during a promotion but only 50 units at regular price, the promotional price should have a greater impact on the average. This is extremely common in financial analysis.',
      frameworkTip:
        'In interviews, when asked about "averages," first clarify whether it\'s a simple average or a weighted average. Proactively raising this distinction shows the interviewer you understand business logic.',
    },
    {
      id: 5,
      name: 'Multi-Dimension Group Statistics',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'Monthly Transaction Analysis Report',
        narrative:
          'The risk management team needs a monthly transaction report: grouped by month and country, showing total transaction count, approved transaction count, total transaction amount, and approved transaction amount. This report is used to detect anomalous transaction patterns.\n\nTable structure: transactions (id INTEGER, country TEXT, status TEXT, amount REAL, trans_date TEXT)',
      },
      question:
        "Group by SUBSTR(trans_date,1,7) (alias month) and country. Calculate: total transaction count (trans_count), approved transaction count (approved_count, where status='approved'), total transaction amount (trans_total), and approved transaction amount (approved_total). Order by month, country.",
      sampleSchema: `CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  country TEXT NOT NULL,
  status TEXT NOT NULL,
  amount REAL NOT NULL,
  trans_date TEXT NOT NULL
);
INSERT INTO transactions VALUES (1, 'TW', 'approved', 1200.00, '2024-01-15');
INSERT INTO transactions VALUES (2, 'TW', 'declined', 800.00, '2024-01-20');
INSERT INTO transactions VALUES (3, 'JP', 'approved', 3500.00, '2024-01-22');
INSERT INTO transactions VALUES (4, 'TW', 'approved', 950.00, '2024-01-28');
INSERT INTO transactions VALUES (5, 'JP', 'declined', 1500.00, '2024-02-01');
INSERT INTO transactions VALUES (6, 'TW', 'approved', 2200.00, '2024-02-05');
INSERT INTO transactions VALUES (7, 'JP', 'approved', 4100.00, '2024-02-10');
INSERT INTO transactions VALUES (8, 'US', 'approved', 5000.00, '2024-02-15');
INSERT INTO transactions VALUES (9, 'US', 'declined', 6000.00, '2024-02-20');
INSERT INTO transactions VALUES (10, 'TW', 'declined', 700.00, '2024-02-25');`,
      starterCode:
        "SELECT SUBSTR(trans_date, 1, 7) AS month,\n       country,\n       COUNT(*) AS trans_count,\n       -- approved transaction count\n       SUM(amount) AS trans_total\n       -- approved transaction amount\nFROM transactions\nGROUP BY month, country\nORDER BY month, country;",
      expectedQuery:
        "SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total, SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) AS approved_total FROM transactions GROUP BY month, country ORDER BY month, country;",
      hints: [
        'Use CASE WHEN inside aggregate functions for conditional calculations',
        "SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) counts approved transactions",
        "SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) sums approved amounts",
      ],
      explanation:
        "The core technique here is Conditional Aggregation: placing CASE WHEN inside SUM to decide what value to add based on a condition. SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) effectively counts only rows where status is 'approved'. This is more concise and efficient than using subqueries or multiple JOINs.",
      frameworkTip:
        'CASE WHEN combined with aggregate functions is an essential technique for intermediate interview questions. It lets you calculate multiple conditional metrics in a single query, avoiding the need for multiple subqueries.',
    },
    {
      id: 6,
      name: 'User Retention Rate Calculation',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'New User Day-1 Retention Rate',
        narrative:
          'The product team wants to know the "new user day-1 retention rate": of all users, what proportion logged in again the day after their first login? This is a core metric for measuring product stickiness.\n\nTable structure: logins (id INTEGER, player_id INTEGER, login_date TEXT)\n\nHint: First find each user\'s first login date, then check whether they have a login record for the following day.',
      },
      question:
        'Calculate the day-1 retention rate (alias day1_retention): number of users who also logged in the day after their first login / total number of users. Round the result to 2 decimal places using ROUND.',
      sampleSchema: `CREATE TABLE logins (
  id INTEGER PRIMARY KEY,
  player_id INTEGER NOT NULL,
  login_date TEXT NOT NULL
);
INSERT INTO logins VALUES (1, 1, '2024-01-01');
INSERT INTO logins VALUES (2, 1, '2024-01-02');
INSERT INTO logins VALUES (3, 1, '2024-01-05');
INSERT INTO logins VALUES (4, 2, '2024-01-02');
INSERT INTO logins VALUES (5, 2, '2024-01-04');
INSERT INTO logins VALUES (6, 3, '2024-01-01');
INSERT INTO logins VALUES (7, 3, '2024-01-02');
INSERT INTO logins VALUES (8, 4, '2024-01-03');
INSERT INTO logins VALUES (9, 4, '2024-01-04');
INSERT INTO logins VALUES (10, 5, '2024-01-05');
INSERT INTO logins VALUES (11, 6, '2024-01-03');
INSERT INTO logins VALUES (12, 6, '2024-01-05');`,
      starterCode:
        "-- Hint: Use a subquery to find each user's first login date\n-- Then use JOIN or EXISTS to check if they logged in the next day\nSELECT ROUND(\n  -- users who logged in the next day * 1.0 / total users\n, 2) AS day1_retention;",
      expectedQuery:
        "SELECT ROUND(SUM(CASE WHEN l2.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id), 2) AS day1_retention FROM (SELECT player_id, MIN(login_date) AS first_login FROM logins GROUP BY player_id) f LEFT JOIN logins l2 ON f.player_id = l2.player_id AND l2.login_date = DATE(f.first_login, '+1 day');",
      hints: [
        'Use MIN(login_date) with GROUP BY player_id to find the first login date',
        "SQLite date arithmetic: DATE(date_string, '+1 day')",
        'Use LEFT JOIN to keep all users — those who did not log in the next day will be NULL',
        'Use SUM(CASE WHEN ... IS NOT NULL ...) to count users who logged in the next day',
      ],
      explanation:
        "This problem has three steps: (1) A subquery finds each user's first login date using MIN(login_date), (2) LEFT JOIN back to the logins table where the same user logged in on first_login + 1 day, (3) Calculate the ratio: users with a match / total users. DATE(date, '+1 day') is SQLite's date arithmetic syntax. This is a classic retention rate calculation in product analytics.",
      frameworkTip:
        'Retention rate is a must-know metric for product interviews. The formula is "users still active after a given period / initial users." In interviews, state the formula first, then translate it into SQL to demonstrate your ability to go from business logic to technical implementation.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-5: String & Date Processing — 2 New Challenges
  // ══════════════════════════════════════════════════════════════════
  '23-5': [
    {
      id: 3,
      name: 'String Case Correction',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Standardizing User Name Formatting',
        narrative:
          'The support team discovered that user names in the system have inconsistent casing: some are all uppercase, some all lowercase, and some have random capitalization. They need all names converted to Proper Case (first letter uppercase, rest lowercase) for mailing labels and official documents.\n\nTable structure: users (id INTEGER, name TEXT, email TEXT)',
      },
      question:
        "Convert each user's name to Proper Case (first letter uppercase, rest lowercase), alias formatted_name. Display id and formatted_name, ordered by id.\n\nHint: Use UPPER + SUBSTR for the first letter, LOWER + SUBSTR for the rest, then concatenate with ||.",
      sampleSchema: `CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL
);
INSERT INTO users VALUES (1, 'aLICE', 'alice@mail.com');
INSERT INTO users VALUES (2, 'bOB', 'bob@mail.com');
INSERT INTO users VALUES (3, 'CHARLIE', 'charlie@mail.com');
INSERT INTO users VALUES (4, 'diana', 'diana@mail.com');
INSERT INTO users VALUES (5, 'Eve', 'eve@mail.com');
INSERT INTO users VALUES (6, 'fRANK', 'frank@mail.com');`,
      starterCode:
        "SELECT id,\n       -- first letter uppercase || rest lowercase AS formatted_name\nFROM users\nORDER BY id;",
      expectedQuery:
        "SELECT id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) AS formatted_name FROM users ORDER BY id;",
      hints: [
        'SUBSTR(name, 1, 1) extracts the first character',
        'SUBSTR(name, 2) extracts from the second character to the end (omitting the length parameter)',
        'UPPER() converts to uppercase, LOWER() converts to lowercase',
        '|| is SQLite\'s string concatenation operator',
      ],
      explanation:
        'SQLite does not have a built-in INITCAP or Proper Case function, so you need to build it manually: UPPER(SUBSTR(name, 1, 1)) capitalizes the first letter, LOWER(SUBSTR(name, 2)) lowercases the rest, and || concatenates the two parts. This is a very practical string manipulation technique.',
      frameworkTip:
        'String processing interview questions often test the SUBSTR + UPPER/LOWER combination. Remember SUBSTR\'s parameter order: (string, start_position, length) — omitting the length means extract to the end.',
    },
    {
      id: 4,
      name: 'Group Concatenation',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Daily Best-Selling Products List',
        narrative:
          'The operations team needs a daily summary of "which products were sold that day." They want one row per day with all sold product names concatenated by commas, without duplicates, sorted alphabetically.\n\nTable structure: daily_sales (id INTEGER, product_name TEXT, sale_date TEXT, quantity INTEGER)',
      },
      question:
        'Group by sale_date. Concatenate distinct product names alphabetically using ", " as separator (alias products), and also show the distinct product count (alias product_count). Order by sale_date.',
      sampleSchema: `CREATE TABLE daily_sales (
  id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  sale_date TEXT NOT NULL,
  quantity INTEGER NOT NULL
);
INSERT INTO daily_sales VALUES (1, '紅茶', '2024-03-01', 5);
INSERT INTO daily_sales VALUES (2, '綠茶', '2024-03-01', 3);
INSERT INTO daily_sales VALUES (3, '紅茶', '2024-03-01', 2);
INSERT INTO daily_sales VALUES (4, '咖啡', '2024-03-01', 8);
INSERT INTO daily_sales VALUES (5, '綠茶', '2024-03-02', 4);
INSERT INTO daily_sales VALUES (6, '奶茶', '2024-03-02', 6);
INSERT INTO daily_sales VALUES (7, '咖啡', '2024-03-02', 3);
INSERT INTO daily_sales VALUES (8, '咖啡', '2024-03-02', 5);
INSERT INTO daily_sales VALUES (9, '紅茶', '2024-03-03', 7);
INSERT INTO daily_sales VALUES (10, '紅茶', '2024-03-03', 2);`,
      starterCode:
        "SELECT sale_date,\n       -- concatenate product names\n       -- product count\nFROM daily_sales\nGROUP BY sale_date\nORDER BY sale_date;",
      expectedQuery:
        "SELECT sale_date, GROUP_CONCAT(DISTINCT product_name) AS products, COUNT(DISTINCT product_name) AS product_count FROM daily_sales GROUP BY sale_date ORDER BY sale_date;",
      hints: [
        'GROUP_CONCAT() concatenates multiple row values into a single string',
        'GROUP_CONCAT(DISTINCT column) automatically removes duplicates',
        'COUNT(DISTINCT column) counts the number of unique values',
      ],
      explanation:
        'GROUP_CONCAT is a SQLite aggregate function that concatenates multiple values within a group into a single string. Adding DISTINCT removes duplicates. The default separator is a comma. Combined with COUNT(DISTINCT product_name), you can also see how many unique products were sold each day. This is very useful for building summary reports.',
      frameworkTip:
        'GROUP_CONCAT is specific to SQLite/MySQL. PostgreSQL uses STRING_AGG, and SQL Server uses STRING_AGG or FOR XML PATH. Mentioning cross-database differences in interviews demonstrates breadth of knowledge.',
    },
  ],
};
