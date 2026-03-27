// ─────────────────────────────────────────────────────
// World 25 — Advanced SQL Analytics (Original Challenges)
// Window Functions, Funnel, Retention — Core SQL Skills for Product Analysts
// ─────────────────────────────────────────────────────

export const w25GeneratedEn = {
  id: 25,
  name: 'Advanced SQL Analytics',
  emoji: '📊',
  description: 'Window Functions, Funnel, Retention — Core SQL Skills for Product Analysts',
  color: 'from-blue-500 to-indigo-500',
  quests: [
    /* ═══════════════════════════════════════════════════
       Quest 25-1  Window Functions in Practice
       ═══════════════════════════════════════════════════ */
    {
      id: '25-1',
      name: 'Window Functions in Practice',
      description: 'ROW_NUMBER, RANK, Running Totals, LAG/LEAD — Master the core usage of window functions',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. ROW_NUMBER Ranking ──
        {
          id: 1,
          name: 'ROW_NUMBER Ranking',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Ranking Sales by Department',
            narrative:
              'The operations manager at an e-commerce platform wants to see the ranking of top-selling products within each product category. You need to use ROW_NUMBER with PARTITION BY to rank within each category.\n\nTable: product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL)',
            data: [
              { product_id: 1, category: 'Electronics', product_name: 'Bluetooth Headphones', total_sales: 58000 },
              { product_id: 2, category: 'Electronics', product_name: 'Wireless Mouse', total_sales: 32000 },
              { product_id: 3, category: 'Household', product_name: 'Insulated Bottle', total_sales: 45000 },
              { product_id: 4, category: 'Household', product_name: 'Storage Box', total_sales: 28000 },
              { product_id: 5, category: 'Electronics', product_name: 'Power Bank', total_sales: 41000 },
            ],
            dataCaption: 'product_sales table (sample data)',
          },
          question:
            'Use ROW_NUMBER with PARTITION BY category to rank products within each category by total_sales in descending order. Display category, product_name, total_sales, category_rank.',
          sampleSchema: `
CREATE TABLE product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL);
INSERT INTO product_sales VALUES (1, 'Electronics', 'Bluetooth Headphones', 58000);
INSERT INTO product_sales VALUES (2, 'Electronics', 'Wireless Mouse', 32000);
INSERT INTO product_sales VALUES (3, 'Household', 'Insulated Bottle', 45000);
INSERT INTO product_sales VALUES (4, 'Household', 'Storage Box', 28000);
INSERT INTO product_sales VALUES (5, 'Electronics', 'Power Bank', 41000);
INSERT INTO product_sales VALUES (6, 'Household', 'Eco Bag', 51000);
INSERT INTO product_sales VALUES (7, 'Food', 'Nut Gift Box', 37000);
INSERT INTO product_sales VALUES (8, 'Food', 'Organic Tea', 29000);
INSERT INTO product_sales VALUES (9, 'Food', 'Artisan Cookies', 42000);
INSERT INTO product_sales VALUES (10, 'Electronics', 'Charging Cable', 18000);
          `,
          starterCode:
            "SELECT category, product_name, total_sales,\n       ROW_NUMBER() OVER (\n         -- Rank within each category\n         -- Order by sales descending\n       ) AS category_rank\nFROM product_sales\nORDER BY category, category_rank;",
          expectedQuery:
            "SELECT category, product_name, total_sales, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_rank FROM product_sales ORDER BY category, category_rank;",
          hints: [
            'PARTITION BY category restarts the ranking within each category',
            'ORDER BY total_sales DESC inside OVER() defines the ranking criteria',
            'ROW_NUMBER assigns a unique number to each row, even when values are tied',
          ],
          explanation:
            'ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) assigns sequential numbers 1, 2, 3... within each category based on sales in descending order. PARTITION BY defines the grouping scope, and ORDER BY defines the ranking criteria. This is the most fundamental and commonly used Window Functions pattern.',
          frameworkTip:
            'Three elements of a Window Function: the function (ROW_NUMBER), partitioning (PARTITION BY), and ordering (ORDER BY). In interviews, state these three components first, then write the SQL.',
        },

        // ── 2. Running Total ──
        {
          id: 2,
          name: 'Running Total',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Daily Revenue Running Total',
            narrative:
              'The finance team needs to track cumulative daily revenue to determine whether the monthly target can be met by month-end. You need to use SUM() OVER to calculate the running total of revenue each day.\n\nTable: daily_revenue (revenue_date TEXT, revenue REAL)',
            data: [
              { revenue_date: '2026-03-01', revenue: 12500 },
              { revenue_date: '2026-03-02', revenue: 8300 },
              { revenue_date: '2026-03-03', revenue: 15700 },
              { revenue_date: '2026-03-04', revenue: 9100 },
              { revenue_date: '2026-03-05', revenue: 22000 },
            ],
            dataCaption: 'daily_revenue table (sample data)',
          },
          question:
            'Calculate each day\'s revenue and the cumulative revenue up to that day (running_total). Display revenue_date, revenue, running_total ordered by date.',
          sampleSchema: `
CREATE TABLE daily_revenue (revenue_date TEXT, revenue REAL);
INSERT INTO daily_revenue VALUES ('2026-03-01', 12500);
INSERT INTO daily_revenue VALUES ('2026-03-02', 8300);
INSERT INTO daily_revenue VALUES ('2026-03-03', 15700);
INSERT INTO daily_revenue VALUES ('2026-03-04', 9100);
INSERT INTO daily_revenue VALUES ('2026-03-05', 22000);
INSERT INTO daily_revenue VALUES ('2026-03-06', 11200);
INSERT INTO daily_revenue VALUES ('2026-03-07', 19800);
          `,
          starterCode:
            "SELECT revenue_date, revenue,\n       SUM(revenue) OVER (\n         -- How do you define the cumulative range?\n       ) AS running_total\nFROM daily_revenue\nORDER BY revenue_date;",
          expectedQuery:
            "SELECT revenue_date, revenue, SUM(revenue) OVER (ORDER BY revenue_date) AS running_total FROM daily_revenue ORDER BY revenue_date;",
          hints: [
            'SUM() OVER (ORDER BY ...) automatically accumulates up to the current row',
            'No PARTITION BY is needed since this is a grand total accumulation',
            'ORDER BY revenue_date ensures the running total follows chronological order',
          ],
          explanation:
            'SUM(revenue) OVER (ORDER BY revenue_date) accumulates revenue row by row starting from the first record. This is a Running Total, one of the most classic uses of Window Functions. The default frame is ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW, meaning it sums from the very beginning up to the current row.',
          frameworkTip:
            'A common interview follow-up: "What if you need a 7-day moving average?" The answer is to add ROWS BETWEEN 6 PRECEDING AND CURRENT ROW.',
        },

        // ── 3. LAG/LEAD Comparison ──
        {
          id: 3,
          name: 'LAG/LEAD Comparison',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Month-over-Month Revenue Growth Rate',
            narrative:
              'Management requires the monthly report to show "how much the revenue grew compared to the previous month." You need to use the LAG function to retrieve the previous month\'s revenue and calculate the month-over-month growth rate.\n\nTable: monthly_revenue (month TEXT, revenue REAL)',
            data: [
              { month: '2025-10', revenue: 320000 },
              { month: '2025-11', revenue: 285000 },
              { month: '2025-12', revenue: 410000 },
              { month: '2026-01', revenue: 375000 },
              { month: '2026-02', revenue: 398000 },
            ],
            dataCaption: 'monthly_revenue table (sample data)',
          },
          question:
            'Use LAG to retrieve the previous month\'s revenue and calculate the month-over-month growth rate (percentage, rounded to one decimal place). Display month, revenue, prev_revenue, growth_rate. The first month\'s prev_revenue and growth_rate may be NULL.',
          sampleSchema: `
CREATE TABLE monthly_revenue (month TEXT, revenue REAL);
INSERT INTO monthly_revenue VALUES ('2025-07', 280000);
INSERT INTO monthly_revenue VALUES ('2025-08', 310000);
INSERT INTO monthly_revenue VALUES ('2025-09', 295000);
INSERT INTO monthly_revenue VALUES ('2025-10', 320000);
INSERT INTO monthly_revenue VALUES ('2025-11', 285000);
INSERT INTO monthly_revenue VALUES ('2025-12', 410000);
INSERT INTO monthly_revenue VALUES ('2026-01', 375000);
INSERT INTO monthly_revenue VALUES ('2026-02', 398000);
          `,
          starterCode:
            "SELECT month, revenue,\n       LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue,\n       -- Calculate growth rate: (current - previous) / previous * 100\n       ROUND(\n         -- Your formula here\n       , 1) AS growth_rate\nFROM monthly_revenue\nORDER BY month;",
          expectedQuery:
            "SELECT month, revenue, LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue, ROUND((revenue - LAG(revenue, 1) OVER (ORDER BY month)) * 100.0 / LAG(revenue, 1) OVER (ORDER BY month), 1) AS growth_rate FROM monthly_revenue ORDER BY month;",
          hints: [
            'LAG(revenue, 1) OVER (ORDER BY month) retrieves the revenue from the previous row',
            'Growth rate formula: (current month - previous month) / previous month * 100',
            'The first row has no preceding row, so LAG automatically returns NULL',
          ],
          explanation:
            'LAG(column, offset) lets you access data from "N rows before" within the same row, while LEAD accesses "N rows after." Here we use LAG(revenue, 1) to get the previous month\'s revenue, then compute the growth rate with (revenue - prev) / prev * 100. This is the core SQL pattern for MoM (Month-over-Month) analysis and is extremely common in interviews.',
          frameworkTip:
            'LAG looks backward, LEAD looks forward. In interviews, you can proactively mention: "For year-over-year (YoY) comparison, use LAG(revenue, 12)."',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-2  Funnel Analysis
       ═══════════════════════════════════════════════════ */
    {
      id: '25-2',
      name: 'Funnel Analysis',
      description: 'Conversion funnel analysis — Calculate step-by-step conversion rates and drop-off rates',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. Basic Funnel Query ──
        {
          id: 1,
          name: 'Basic Funnel Query',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'E-commerce Purchase Funnel Conversion',
            narrative:
              'The product manager wants to understand the conversion rate at each step from "browsing products" to "completing payment." Events are recorded in the user_events table with four steps: view, add_to_cart, checkout, and payment.\n\nTable: user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)',
            data: [
              { event_id: 1, user_id: 101, event_name: 'view', event_date: '2026-03-01' },
              { event_id: 2, user_id: 101, event_name: 'add_to_cart', event_date: '2026-03-01' },
              { event_id: 3, user_id: 101, event_name: 'checkout', event_date: '2026-03-01' },
              { event_id: 4, user_id: 101, event_name: 'payment', event_date: '2026-03-01' },
              { event_id: 5, user_id: 102, event_name: 'view', event_date: '2026-03-01' },
              { event_id: 6, user_id: 102, event_name: 'add_to_cart', event_date: '2026-03-02' },
            ],
            dataCaption: 'user_events table (sample data)',
          },
          question:
            'Use COUNT(DISTINCT CASE WHEN ...) to calculate the distinct user count at each funnel step, and compute each step\'s conversion rate relative to the first step (view) as a percentage rounded to one decimal place.',
          sampleSchema: `
CREATE TABLE user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT);
INSERT INTO user_events VALUES (1, 101, 'view', '2026-03-01');
INSERT INTO user_events VALUES (2, 101, 'add_to_cart', '2026-03-01');
INSERT INTO user_events VALUES (3, 101, 'checkout', '2026-03-01');
INSERT INTO user_events VALUES (4, 101, 'payment', '2026-03-01');
INSERT INTO user_events VALUES (5, 102, 'view', '2026-03-01');
INSERT INTO user_events VALUES (6, 102, 'add_to_cart', '2026-03-02');
INSERT INTO user_events VALUES (7, 103, 'view', '2026-03-02');
INSERT INTO user_events VALUES (8, 104, 'view', '2026-03-02');
INSERT INTO user_events VALUES (9, 104, 'add_to_cart', '2026-03-02');
INSERT INTO user_events VALUES (10, 104, 'checkout', '2026-03-03');
INSERT INTO user_events VALUES (11, 104, 'payment', '2026-03-03');
INSERT INTO user_events VALUES (12, 105, 'view', '2026-03-03');
INSERT INTO user_events VALUES (13, 105, 'add_to_cart', '2026-03-03');
INSERT INTO user_events VALUES (14, 105, 'checkout', '2026-03-03');
INSERT INTO user_events VALUES (15, 106, 'view', '2026-03-03');
          `,
          starterCode:
            "WITH funnel AS (\n  SELECT\n    COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view,\n    -- Complete the other three steps\n  FROM user_events\n)\nSELECT\n  step1_view,\n  step2_cart,\n  step3_checkout,\n  step4_payment,\n  -- Calculate each step's conversion rate relative to step1\nFROM funnel;",
          expectedQuery:
            "WITH funnel AS (SELECT COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN event_name = 'checkout' THEN user_id END) AS step3_checkout, COUNT(DISTINCT CASE WHEN event_name = 'payment' THEN user_id END) AS step4_payment FROM user_events) SELECT step1_view, step2_cart, step3_checkout, step4_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_checkout * 100.0 / step1_view, 1) AS checkout_rate, ROUND(step4_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;",
          hints: [
            "COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) counts the distinct users who added to cart",
            'Conversion rate = users at that step / users at step 1 * 100',
            'Use a CTE to compute the step counts first, then calculate the rates in the outer query for cleaner SQL',
          ],
          explanation:
            'The core pattern for funnel analysis is COUNT(DISTINCT CASE WHEN ... THEN user_id END). Each CASE WHEN corresponds to a funnel step, and COUNT DISTINCT ensures each user is counted only once. Use a CTE to compute the funnel numbers, then calculate conversion rates in the outer query. This is a classic interview question for Product Analyst roles.',
          frameworkTip:
            'Three steps of funnel analysis: (1) Define the steps (2) COUNT DISTINCT to get the user count at each step (3) Calculate conversion rates. Use CTEs for layered queries in interviews for better readability.',
        },

        // ── 2. Segmented Funnel Comparison ──
        {
          id: 2,
          name: 'Segmented Funnel Comparison',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'New vs. Returning User Funnel Comparison',
            narrative:
              'The PM wants to know how conversion rates differ between new users and returning users in the purchase funnel, in order to decide whether to optimize new user onboarding or improve returning user repurchase. You need to first classify users (first visit vs. returning), then calculate funnels separately.\n\nTables:\n- user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- users (user_id INTEGER, first_visit_date TEXT)',
            data: [
              { user_id: 101, first_visit_date: '2026-03-01', type: 'New User' },
              { user_id: 102, first_visit_date: '2026-01-15', type: 'Returning User' },
              { user_id: 103, first_visit_date: '2026-03-02', type: 'New User' },
            ],
            dataCaption: 'users table (sample data; type column is for illustration)',
          },
          question:
            'First use CASE WHEN to classify users as "New User" (first_visit_date in March 2026) or "Returning User," then calculate the view → add_to_cart → payment conversion rate by segment.',
          sampleSchema: `
CREATE TABLE users (user_id INTEGER, first_visit_date TEXT);
INSERT INTO users VALUES (101, '2026-03-01');
INSERT INTO users VALUES (102, '2026-01-15');
INSERT INTO users VALUES (103, '2026-03-02');
INSERT INTO users VALUES (104, '2026-02-10');
INSERT INTO users VALUES (105, '2026-03-03');
INSERT INTO users VALUES (106, '2025-12-20');
INSERT INTO users VALUES (107, '2026-03-05');
INSERT INTO users VALUES (108, '2026-02-01');
CREATE TABLE user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT);
INSERT INTO user_events VALUES (1, 101, 'view', '2026-03-01');
INSERT INTO user_events VALUES (2, 101, 'add_to_cart', '2026-03-01');
INSERT INTO user_events VALUES (3, 101, 'payment', '2026-03-01');
INSERT INTO user_events VALUES (4, 102, 'view', '2026-03-01');
INSERT INTO user_events VALUES (5, 102, 'add_to_cart', '2026-03-02');
INSERT INTO user_events VALUES (6, 102, 'payment', '2026-03-02');
INSERT INTO user_events VALUES (7, 103, 'view', '2026-03-02');
INSERT INTO user_events VALUES (8, 103, 'add_to_cart', '2026-03-02');
INSERT INTO user_events VALUES (9, 104, 'view', '2026-03-02');
INSERT INTO user_events VALUES (10, 104, 'add_to_cart', '2026-03-03');
INSERT INTO user_events VALUES (11, 104, 'payment', '2026-03-03');
INSERT INTO user_events VALUES (12, 105, 'view', '2026-03-03');
INSERT INTO user_events VALUES (13, 106, 'view', '2026-03-03');
INSERT INTO user_events VALUES (14, 106, 'add_to_cart', '2026-03-04');
INSERT INTO user_events VALUES (15, 107, 'view', '2026-03-05');
INSERT INTO user_events VALUES (16, 107, 'add_to_cart', '2026-03-05');
INSERT INTO user_events VALUES (17, 107, 'payment', '2026-03-06');
INSERT INTO user_events VALUES (18, 108, 'view', '2026-03-05');
          `,
          starterCode:
            "WITH user_type AS (\n  SELECT user_id,\n         CASE\n           WHEN first_visit_date >= '2026-03-01' THEN 'New User'\n           ELSE 'Returning User'\n         END AS segment\n  FROM users\n),\nfunnel AS (\n  SELECT ut.segment,\n         -- Calculate view, add_to_cart, payment counts per segment\n  FROM user_events e\n  JOIN user_type ut ON e.user_id = ut.user_id\n  GROUP BY ut.segment\n)\nSELECT segment,\n       step1_view, step2_cart, step3_payment,\n       -- Calculate conversion rates\nFROM funnel;",
          expectedQuery:
            "WITH user_type AS (SELECT user_id, CASE WHEN first_visit_date >= '2026-03-01' THEN 'New User' ELSE 'Returning User' END AS segment FROM users), funnel AS (SELECT ut.segment, COUNT(DISTINCT CASE WHEN e.event_name = 'view' THEN e.user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN e.event_name = 'add_to_cart' THEN e.user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN e.event_name = 'payment' THEN e.user_id END) AS step3_payment FROM user_events e JOIN user_type ut ON e.user_id = ut.user_id GROUP BY ut.segment) SELECT segment, step1_view, step2_cart, step3_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;",
          hints: [
            'First use a CTE to classify each user as new or returning',
            'In the funnel CTE, GROUP BY segment to calculate the funnel for each group separately',
            'Finally, compute conversion rates in the outer query to directly compare the two groups',
          ],
          explanation:
            'Segmented funnel analysis is a common requirement for Product Analysts. The key is to first create a user_type CTE that defines the segmentation logic, then JOIN it to the events table. GROUP BY segment lets each group compute its funnel independently. This enables you to compare conversion rates between new and returning users and identify optimization opportunities.',
          frameworkTip:
            'Bonus points in funnel interview questions: proactively suggest "Should we segment the comparison? For example, new vs. returning users, different channels, or different regions." This demonstrates analytical thinking.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-3  Segmentation
       ═══════════════════════════════════════════════════ */
    {
      id: '25-3',
      name: 'Segmentation',
      description: 'NTILE grouping, CASE WHEN behavioral segmentation — User segmentation with SQL',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. NTILE Segmentation ──
        {
          id: 1,
          name: 'NTILE Segmentation',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'User Spending Quartile Segmentation',
            narrative:
              'The marketing team wants to divide users into four tiers by spending amount (top 25% as VIP, 25-50% as High Value, 50-75% as Regular, bottom 25% as Low Activity) to tailor different marketing strategies. You need to use NTILE to split users into four groups.\n\nTable: user_spending (user_id INTEGER, user_name TEXT, total_amount REAL)',
            data: [
              { user_id: 1, user_name: 'Alice Wang', total_amount: 85200 },
              { user_id: 2, user_name: 'Bella Li', total_amount: 42300 },
              { user_id: 3, user_name: 'David Zhang', total_amount: 128500 },
              { user_id: 4, user_name: 'Eva Chen', total_amount: 15800 },
              { user_id: 5, user_name: 'Frank Lin', total_amount: 67400 },
            ],
            dataCaption: 'user_spending table (sample data)',
          },
          question:
            'Use NTILE(4) to divide users into four groups by total_amount in descending order (1 = top 25%, 4 = bottom 25%), then use CASE WHEN to convert the number into a label. Display user_name, total_amount, quartile, segment_label.',
          sampleSchema: `
CREATE TABLE user_spending (user_id INTEGER, user_name TEXT, total_amount REAL);
INSERT INTO user_spending VALUES (1, 'Alice Wang', 85200);
INSERT INTO user_spending VALUES (2, 'Bella Li', 42300);
INSERT INTO user_spending VALUES (3, 'David Zhang', 128500);
INSERT INTO user_spending VALUES (4, 'Eva Chen', 15800);
INSERT INTO user_spending VALUES (5, 'Frank Lin', 67400);
INSERT INTO user_spending VALUES (6, 'Grace Huang', 93100);
INSERT INTO user_spending VALUES (7, 'Henry Wu', 28900);
INSERT INTO user_spending VALUES (8, 'Irene Liu', 51600);
INSERT INTO user_spending VALUES (9, 'Jack Tsai', 110200);
INSERT INTO user_spending VALUES (10, 'Karen Zheng', 38700);
INSERT INTO user_spending VALUES (11, 'Leo Zhou', 72800);
INSERT INTO user_spending VALUES (12, 'Mia Hsu', 19500);
          `,
          starterCode:
            "SELECT user_name, total_amount,\n       NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile,\n       CASE NTILE(4) OVER (ORDER BY total_amount DESC)\n         -- 1 = VIP, 2 = High Value, 3 = Regular, 4 = Low Activity\n       END AS segment_label\nFROM user_spending\nORDER BY total_amount DESC;",
          expectedQuery:
            "SELECT user_name, total_amount, NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile, CASE NTILE(4) OVER (ORDER BY total_amount DESC) WHEN 1 THEN 'VIP' WHEN 2 THEN 'High Value' WHEN 3 THEN 'Regular' WHEN 4 THEN 'Low Activity' END AS segment_label FROM user_spending ORDER BY total_amount DESC;",
          hints: [
            'NTILE(4) divides data evenly into 4 groups; group 1 is the top 25%',
            'CASE NTILE(4) OVER (...) WHEN 1 THEN ... lets you label the result directly',
            'ORDER BY total_amount DESC ensures the highest spenders land in group 1',
          ],
          explanation:
            'NTILE(n) is a powerful tool for segmentation analysis. It divides sorted data into n roughly equal groups. NTILE(4) produces quartile-based segmentation. Combined with CASE WHEN, you can convert numbers into meaningful labels. In RFM analysis, NTILE is frequently used to bucket Recency, Frequency, and Monetary into groups.',
          frameworkTip:
            'A limitation of NTILE: if the data count is not evenly divisible by n, earlier groups will have one extra row. Mentioning this edge case in interviews is a plus.',
        },

        // ── 2. CASE WHEN Behavioral Segmentation ──
        {
          id: 2,
          name: 'CASE WHEN Behavioral Segmentation',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'User Activity Segmentation',
            narrative:
              'The product team wants to segment users based on their behavior over the past 30 days (login count + action count). The rules are:\n- Power User: logins >= 20 AND actions >= 50\n- Active: logins >= 10 AND actions >= 20\n- Casual: logins >= 3\n- Dormant: all others\n\nTable: user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER)',
            data: [
              { user_id: 1, user_name: 'Ming', login_count: 25, action_count: 80, segment: 'Power User' },
              { user_id: 2, user_name: 'Mei', login_count: 12, action_count: 35, segment: 'Active' },
              { user_id: 3, user_name: 'David', login_count: 5, action_count: 8, segment: 'Casual' },
              { user_id: 4, user_name: 'Eva', login_count: 1, action_count: 2, segment: 'Dormant' },
            ],
            dataCaption: 'user_activity table (sample data; segment shows expected result)',
          },
          question:
            'Use CASE WHEN to segment users according to the rules above. Display user_name, login_count, action_count, segment. Then count the number of users in each segment.',
          sampleSchema: `
CREATE TABLE user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER);
INSERT INTO user_activity VALUES (1, 'Ming', 25, 80);
INSERT INTO user_activity VALUES (2, 'Mei', 12, 35);
INSERT INTO user_activity VALUES (3, 'David', 5, 8);
INSERT INTO user_activity VALUES (4, 'Eva', 1, 2);
INSERT INTO user_activity VALUES (5, 'Frank', 22, 60);
INSERT INTO user_activity VALUES (6, 'Grace', 15, 25);
INSERT INTO user_activity VALUES (7, 'Henry', 8, 15);
INSERT INTO user_activity VALUES (8, 'Irene', 3, 5);
INSERT INTO user_activity VALUES (9, 'Jack', 0, 0);
INSERT INTO user_activity VALUES (10, 'Karen', 18, 45);
          `,
          starterCode:
            "WITH segmented AS (\n  SELECT user_name, login_count, action_count,\n         CASE\n           -- Segment according to the rules\n         END AS segment\n  FROM user_activity\n)\nSELECT segment, COUNT(*) AS user_count\nFROM segmented\nGROUP BY segment\nORDER BY user_count DESC;",
          expectedQuery:
            "WITH segmented AS (SELECT user_name, login_count, action_count, CASE WHEN login_count >= 20 AND action_count >= 50 THEN 'Power User' WHEN login_count >= 10 AND action_count >= 20 THEN 'Active' WHEN login_count >= 3 THEN 'Casual' ELSE 'Dormant' END AS segment FROM user_activity) SELECT segment, COUNT(*) AS user_count FROM segmented GROUP BY segment ORDER BY user_count DESC;",
          hints: [
            'The order of CASE WHEN conditions matters — evaluate the strictest condition first',
            'Power User has the strictest criteria, so it should come first',
            'Use a CTE to build the segmentation, then aggregate in the outer query',
          ],
          explanation:
            'The key to CASE WHEN behavioral segmentation is condition ordering: from strictest to most lenient. Since CASE WHEN stops at the first matching condition, Power User (the strictest) must come first. Using a CTE for segmentation followed by aggregation is a common two-step pattern.',
          frameworkTip:
            'Approach for segmentation questions in interviews: (1) Define segmentation rules (2) Confirm condition priority (3) Implement with CASE WHEN (4) Use GROUP BY to count users and compute metrics per segment.',
        },

        // ── 3. Segmentation Strategy Selection (MC) ──
        {
          id: 3,
          name: 'Segmentation Strategy Selection',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Choosing the Right Segmentation Method',
            narrative:
              'You are a Product Analyst. The PM has different segmentation requirements. You need to determine which SQL segmentation method is most appropriate.',
          },
          question:
            'The PM wants to divide users into 5 equal buckets along each of three dimensions: "days since last purchase," "purchase frequency," and "total spending," then combine them into a composite segment. What segmentation method is this, and which SQL function should you use?',
          options: [
            { id: 'A', text: 'CASE WHEN with hard-coded segmentation, manually setting thresholds for each dimension', explanation: 'CASE WHEN works well for rule-based segmentation, but RFM requires dynamic quantiles, making hard-coded thresholds too inflexible.' },
            { id: 'B', text: 'NTILE(5) with PARTITION BY for each dimension, performing RFM segmentation', explanation: 'Correct! The standard approach for RFM segmentation is to use NTILE to create quantile buckets for Recency, Frequency, and Monetary, then combine them into an RFM Score.' },
            { id: 'C', text: 'ROW_NUMBER to rank and then select the top N users', explanation: 'ROW_NUMBER is suited for ranking, but not for quantile-based segmentation.' },
            { id: 'D', text: 'GROUP BY all three dimensions directly', explanation: 'GROUP BY would produce too many combinations and is not the correct approach for segmentation.' },
          ],
          correctAnswer: 'B',
          hints: [
            'RFM = Recency, Frequency, Monetary',
            'When you need to split continuous values into equal buckets, think NTILE',
            'Three dimensions, each split into 5 buckets → use NTILE(5) three times',
          ],
          explanation:
            'RFM segmentation is a classic user segmentation framework. R (Recency — days since last purchase), F (Frequency — purchase count), and M (Monetary — total spending) are each divided into 5 groups using NTILE(5). The combination forms the RFM Score (e.g., 5-5-5 represents the most valuable users). NTILE is the best tool for quantile-based segmentation.',
          frameworkTip:
            'RFM is a must-know segmentation framework for Product Analysts. When you hear "user value segmentation" in an interview, think RFM + NTILE.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-4  Retention / Cohort Analysis
       ═══════════════════════════════════════════════════ */
    {
      id: '25-4',
      name: 'Retention / Cohort Analysis',
      description: 'Retention rate and cohort analysis — Track whether users continue to come back',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. Monthly Active Retention Rate ──
        {
          id: 1,
          name: 'Monthly Active Retention Rate',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'Calculating Monthly Retention Rate',
            narrative:
              'The product owner wants to know "of the users active this month, what percentage will return next month." You need to identify each month\'s active users, then check whether they are also active the following month, and calculate the retention rate.\n\nTable: user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)',
            data: [
              { action_id: 1, user_id: 101, action_date: '2025-11-05' },
              { action_id: 2, user_id: 101, action_date: '2025-12-10' },
              { action_id: 3, user_id: 102, action_date: '2025-11-08' },
              { action_id: 4, user_id: 103, action_date: '2025-11-15' },
              { action_id: 5, user_id: 103, action_date: '2025-12-20' },
            ],
            dataCaption: 'user_actions table (sample data)',
          },
          question:
            'Calculate each month\'s active user count, the number of users still active the next month, and the monthly retention rate (percentage, rounded to one decimal place).',
          sampleSchema: `
CREATE TABLE user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT);
INSERT INTO user_actions VALUES (1, 101, '2025-10-05');
INSERT INTO user_actions VALUES (2, 101, '2025-11-10');
INSERT INTO user_actions VALUES (3, 101, '2025-12-15');
INSERT INTO user_actions VALUES (4, 102, '2025-10-08');
INSERT INTO user_actions VALUES (5, 102, '2025-11-12');
INSERT INTO user_actions VALUES (6, 103, '2025-10-15');
INSERT INTO user_actions VALUES (7, 103, '2025-12-20');
INSERT INTO user_actions VALUES (8, 104, '2025-10-20');
INSERT INTO user_actions VALUES (9, 104, '2025-11-25');
INSERT INTO user_actions VALUES (10, 104, '2025-12-28');
INSERT INTO user_actions VALUES (11, 105, '2025-11-01');
INSERT INTO user_actions VALUES (12, 105, '2025-12-05');
INSERT INTO user_actions VALUES (13, 106, '2025-11-18');
INSERT INTO user_actions VALUES (14, 107, '2025-10-22');
INSERT INTO user_actions VALUES (15, 108, '2025-12-01');
          `,
          starterCode:
            "WITH monthly_active AS (\n  -- Distinct active users per month\n  SELECT DISTINCT user_id,\n         SUBSTR(action_date, 1, 7) AS active_month\n  FROM user_actions\n)\nSELECT\n  m1.active_month,\n  COUNT(DISTINCT m1.user_id) AS active_users,\n  -- Users still active next month?\n  -- Retention rate?\nFROM monthly_active m1\n-- How to find users who are also active next month?\nGROUP BY m1.active_month\nORDER BY m1.active_month;",
          expectedQuery:
            "WITH monthly_active AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions) SELECT m1.active_month, COUNT(DISTINCT m1.user_id) AS active_users, COUNT(DISTINCT m2.user_id) AS retained_users, ROUND(COUNT(DISTINCT m2.user_id) * 100.0 / COUNT(DISTINCT m1.user_id), 1) AS retention_rate FROM monthly_active m1 LEFT JOIN monthly_active m2 ON m1.user_id = m2.user_id AND m2.active_month = SUBSTR(DATE(m1.active_month || '-01', '+1 month'), 1, 7) GROUP BY m1.active_month ORDER BY m1.active_month;",
          hints: [
            'Use a LEFT JOIN self-join on monthly_active to pair the current month with the next month',
            "In SQLite, next month: SUBSTR(DATE(active_month || '-01', '+1 month'), 1, 7)",
            'LEFT JOIN ensures months with zero retention still appear (retained = 0)',
          ],
          explanation:
            'The core of monthly retention is a self-join: pairing the same user\'s current-month activity record with their next-month activity record. Use a LEFT JOIN to ensure months with no retained users still show up. COUNT(DISTINCT m2.user_id) only counts matched users (those active the following month). Retention rate = retained users / current month active users.',
          frameworkTip:
            'Retention rate approach: first build a deduplicated "month x user" table, then self-join to compare consecutive months. This pattern generalizes to weekly or daily retention.',
        },

        // ── 2. Cohort Retention Matrix ──
        {
          id: 2,
          name: 'Cohort Retention Matrix',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'Building a Cohort Retention Matrix',
            narrative:
              'The product team needs a Cohort Retention Matrix: the horizontal axis is "month N after signup," the vertical axis is "signup month cohort," and each cell contains the retention rate. This is the definitive report in Product Analytics.\n\nTables:\n- user_signups (user_id INTEGER, signup_date TEXT)\n- user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)',
            data: [
              { cohort: '2025-10', month_0: '100%', month_1: '62%', month_2: '45%' },
              { cohort: '2025-11', month_0: '100%', month_1: '58%', month_2: '-' },
              { cohort: '2025-12', month_0: '100%', month_1: '-', month_2: '-' },
            ],
            dataCaption: 'Cohort Retention Matrix (expected output format)',
          },
          question:
            'Build a Cohort Retention report: for each cohort (signup month), show the active user count and retention rate at months 0, 1, and 2. Display cohort_month, month_number, active_users, cohort_size, retention_rate.',
          sampleSchema: `
CREATE TABLE user_signups (user_id INTEGER, signup_date TEXT);
INSERT INTO user_signups VALUES (101, '2025-10-01');
INSERT INTO user_signups VALUES (102, '2025-10-05');
INSERT INTO user_signups VALUES (103, '2025-10-12');
INSERT INTO user_signups VALUES (104, '2025-10-20');
INSERT INTO user_signups VALUES (105, '2025-11-02');
INSERT INTO user_signups VALUES (106, '2025-11-10');
INSERT INTO user_signups VALUES (107, '2025-11-18');
INSERT INTO user_signups VALUES (108, '2025-12-01');
INSERT INTO user_signups VALUES (109, '2025-12-15');
CREATE TABLE user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT);
INSERT INTO user_actions VALUES (1, 101, '2025-10-03');
INSERT INTO user_actions VALUES (2, 101, '2025-11-05');
INSERT INTO user_actions VALUES (3, 101, '2025-12-10');
INSERT INTO user_actions VALUES (4, 102, '2025-10-08');
INSERT INTO user_actions VALUES (5, 102, '2025-11-12');
INSERT INTO user_actions VALUES (6, 103, '2025-10-15');
INSERT INTO user_actions VALUES (7, 103, '2025-12-20');
INSERT INTO user_actions VALUES (8, 104, '2025-10-22');
INSERT INTO user_actions VALUES (9, 105, '2025-11-05');
INSERT INTO user_actions VALUES (10, 105, '2025-12-08');
INSERT INTO user_actions VALUES (11, 106, '2025-11-15');
INSERT INTO user_actions VALUES (12, 106, '2025-12-22');
INSERT INTO user_actions VALUES (13, 107, '2025-11-20');
INSERT INTO user_actions VALUES (14, 108, '2025-12-05');
INSERT INTO user_actions VALUES (15, 109, '2025-12-18');
          `,
          starterCode:
            "WITH cohorts AS (\n  -- Each user's cohort (signup month)\n  SELECT user_id,\n         SUBSTR(signup_date, 1, 7) AS cohort_month\n  FROM user_signups\n),\nuser_monthly AS (\n  -- Each user's monthly activity records\n  SELECT DISTINCT user_id,\n         SUBSTR(action_date, 1, 7) AS active_month\n  FROM user_actions\n),\ncohort_activity AS (\n  SELECT c.cohort_month,\n         -- Calculate month_number (active month - signup month)\n         um.active_month,\n         c.user_id\n  FROM cohorts c\n  JOIN user_monthly um ON c.user_id = um.user_id\n)\n-- Final aggregation: retention rate for each cohort x month_number\nSELECT cohort_month, month_number,\n       COUNT(DISTINCT user_id) AS active_users,\n       -- cohort_size and retention_rate\nFROM cohort_activity\nGROUP BY cohort_month, month_number\nORDER BY cohort_month, month_number;",
          expectedQuery:
            "WITH cohorts AS (SELECT user_id, SUBSTR(signup_date, 1, 7) AS cohort_month FROM user_signups), cohort_size AS (SELECT cohort_month, COUNT(*) AS size FROM cohorts GROUP BY cohort_month), user_monthly AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions), cohort_activity AS (SELECT c.cohort_month, CAST((JULIANDAY(um.active_month || '-01') - JULIANDAY(c.cohort_month || '-01')) / 30 AS INTEGER) AS month_number, c.user_id FROM cohorts c JOIN user_monthly um ON c.user_id = um.user_id) SELECT ca.cohort_month, ca.month_number, COUNT(DISTINCT ca.user_id) AS active_users, cs.size AS cohort_size, ROUND(COUNT(DISTINCT ca.user_id) * 100.0 / cs.size, 1) AS retention_rate FROM cohort_activity ca JOIN cohort_size cs ON ca.cohort_month = cs.cohort_month GROUP BY ca.cohort_month, ca.month_number ORDER BY ca.cohort_month, ca.month_number;",
          hints: [
            'Use JULIANDAY to compute the difference between two months (divide by 30 and truncate to get month count)',
            'You need a cohort_size CTE to store the initial user count for each cohort',
            'retention_rate = active users in that month / initial cohort size * 100',
          ],
          explanation:
            'The Cohort Retention Matrix is the "holy grail report" of Product Analytics. Steps: (1) Define the cohort (signup month) (2) Compute each user\'s monthly activity status (3) Calculate month_number (months since signup) (4) Aggregate retention rate for each cohort x month_number. Dividing the JULIANDAY difference by 30 is a SQLite technique for computing month differences.',
          frameworkTip:
            'Three steps for cohort analysis in interviews: (1) Define the cohort dimension (usually signup month) (2) Define the activity event (3) Spread retention by month_number. This framework applies to all retention analyses.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-5  KPI & Dashboard Query Design
       ═══════════════════════════════════════════════════ */
    {
      id: '25-5',
      name: 'KPI & Dashboard Query Design',
      description: 'DAU/MAU, ARPU, Conversion Rate — Define and compute core product metrics with SQL',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. DAU / MAU Calculation ──
        {
          id: 1,
          name: 'DAU / MAU Calculation',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Calculating Daily and Monthly Active Users',
            narrative:
              'You are building core metric queries for a product dashboard. The first requirement is to compute DAU (Daily Active Users), MAU (Monthly Active Users), and the DAU/MAU ratio (also called Stickiness, representing user engagement).\n\nTable: app_events (event_id INTEGER, user_id INTEGER, event_date TEXT, event_type TEXT)',
            data: [
              { event_id: 1, user_id: 101, event_date: '2026-03-01', event_type: 'login' },
              { event_id: 2, user_id: 102, event_date: '2026-03-01', event_type: 'view' },
              { event_id: 3, user_id: 101, event_date: '2026-03-02', event_type: 'click' },
              { event_id: 4, user_id: 103, event_date: '2026-03-02', event_type: 'login' },
            ],
            dataCaption: 'app_events table (sample data)',
          },
          question:
            'Calculate the daily DAU (distinct active users per day) for March 2026, along with the monthly MAU and the average DAU/MAU ratio (rounded to two decimal places).',
          sampleSchema: `
CREATE TABLE app_events (event_id INTEGER, user_id INTEGER, event_date TEXT, event_type TEXT);
INSERT INTO app_events VALUES (1, 101, '2026-03-01', 'login');
INSERT INTO app_events VALUES (2, 102, '2026-03-01', 'view');
INSERT INTO app_events VALUES (3, 103, '2026-03-01', 'login');
INSERT INTO app_events VALUES (4, 101, '2026-03-02', 'click');
INSERT INTO app_events VALUES (5, 103, '2026-03-02', 'login');
INSERT INTO app_events VALUES (6, 104, '2026-03-02', 'view');
INSERT INTO app_events VALUES (7, 101, '2026-03-03', 'login');
INSERT INTO app_events VALUES (8, 102, '2026-03-03', 'view');
INSERT INTO app_events VALUES (9, 105, '2026-03-03', 'login');
INSERT INTO app_events VALUES (10, 104, '2026-03-03', 'click');
INSERT INTO app_events VALUES (11, 101, '2026-03-04', 'view');
INSERT INTO app_events VALUES (12, 106, '2026-03-04', 'login');
INSERT INTO app_events VALUES (13, 102, '2026-03-05', 'login');
INSERT INTO app_events VALUES (14, 103, '2026-03-05', 'view');
INSERT INTO app_events VALUES (15, 107, '2026-03-05', 'login');
          `,
          starterCode:
            "WITH daily_active AS (\n  -- Daily DAU\n  SELECT event_date,\n         COUNT(DISTINCT user_id) AS dau\n  FROM app_events\n  WHERE event_date LIKE '2026-03%'\n  GROUP BY event_date\n),\nmau AS (\n  -- Monthly MAU\n  SELECT COUNT(DISTINCT user_id) AS mau\n  FROM app_events\n  WHERE event_date LIKE '2026-03%'\n)\n-- Calculate average DAU and DAU/MAU ratio\nSELECT\n  -- avg_dau, mau, dau/mau\nFROM daily_active, mau;",
          expectedQuery:
            "WITH daily_active AS (SELECT event_date, COUNT(DISTINCT user_id) AS dau FROM app_events WHERE event_date LIKE '2026-03%' GROUP BY event_date), mau AS (SELECT COUNT(DISTINCT user_id) AS mau FROM app_events WHERE event_date LIKE '2026-03%') SELECT ROUND(AVG(da.dau), 1) AS avg_dau, mau.mau, ROUND(AVG(da.dau) * 1.0 / mau.mau, 2) AS stickiness FROM daily_active da, mau;",
          hints: [
            'DAU = COUNT(DISTINCT user_id) per day',
            'MAU = COUNT(DISTINCT user_id) for the entire month',
            'Stickiness = average DAU / MAU; a higher value means stronger user engagement',
          ],
          explanation:
            'DAU/MAU (also known as Stickiness) is a core metric for measuring product engagement. If DAU/MAU = 0.5, it means that on average, half of monthly active users are using the product every day. Social products typically range between 0.3 and 0.6. Use two CTEs to calculate DAU and MAU separately, then cross-compute the ratio.',
          frameworkTip:
            'Dashboard metrics in three layers: (1) Traffic metrics — DAU/MAU (2) Engagement metrics — session length, event count (3) Business metrics — ARPU, conversion rate. Answering in layers during interviews provides better structure.',
        },

        // ── 2. Conversion Rate & ARPU ──
        {
          id: 2,
          name: 'Conversion Rate & ARPU',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: 'Calculating Paid Conversion Rate & ARPU',
            narrative:
              'The business analyst needs to display two key metrics on the dashboard: Paid Conversion Rate (paying users / total active users) and ARPU (Average Revenue Per User = total revenue / total active users).\n\nTables:\n- active_users (user_id INTEGER, active_month TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)',
            data: [
              { metric: 'total_active', value: 1000 },
              { metric: 'paying_users', value: 150 },
              { metric: 'total_revenue', value: 75000 },
              { metric: 'conversion_rate', value: '15.0%' },
              { metric: 'arpu', value: 75.0 },
            ],
            dataCaption: 'Expected metrics (sample data)',
          },
          question:
            'Calculate the paid conversion rate and ARPU for March 2026. Display total_active_users, paying_users, total_revenue, conversion_rate (percentage, one decimal place), arpu (two decimal places).',
          sampleSchema: `
CREATE TABLE active_users (user_id INTEGER, active_month TEXT);
INSERT INTO active_users VALUES (101, '2026-03');
INSERT INTO active_users VALUES (102, '2026-03');
INSERT INTO active_users VALUES (103, '2026-03');
INSERT INTO active_users VALUES (104, '2026-03');
INSERT INTO active_users VALUES (105, '2026-03');
INSERT INTO active_users VALUES (106, '2026-03');
INSERT INTO active_users VALUES (107, '2026-03');
INSERT INTO active_users VALUES (108, '2026-03');
INSERT INTO active_users VALUES (109, '2026-03');
INSERT INTO active_users VALUES (110, '2026-03');
CREATE TABLE payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT);
INSERT INTO payments VALUES (1, 101, 299, '2026-03-05');
INSERT INTO payments VALUES (2, 103, 599, '2026-03-08');
INSERT INTO payments VALUES (3, 105, 199, '2026-03-10');
INSERT INTO payments VALUES (4, 101, 150, '2026-03-15');
INSERT INTO payments VALUES (5, 108, 499, '2026-03-20');
          `,
          starterCode:
            "WITH metrics AS (\n  SELECT\n    (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active,\n    -- Paying users (distinct users with payment records)\n    -- Total revenue\n)\nSELECT total_active AS total_active_users,\n       paying_users,\n       total_revenue,\n       -- conversion_rate and arpu\nFROM metrics;",
          expectedQuery:
            "WITH metrics AS (SELECT (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active, (SELECT COUNT(DISTINCT user_id) FROM payments WHERE payment_date LIKE '2026-03%') AS paying_users, (SELECT COALESCE(SUM(amount), 0) FROM payments WHERE payment_date LIKE '2026-03%') AS total_revenue) SELECT total_active AS total_active_users, paying_users, total_revenue, ROUND(paying_users * 100.0 / total_active, 1) AS conversion_rate, ROUND(total_revenue * 1.0 / total_active, 2) AS arpu FROM metrics;",
          hints: [
            'Paying users = COUNT(DISTINCT user_id) FROM payments',
            'The denominator for ARPU is "all active users," not just paying users',
            'Use subqueries in the CTE to calculate the three base numbers separately',
          ],
          explanation:
            'Conversion rate = paying users / total active users. ARPU = total revenue / total active users. Note that the ARPU denominator is "all active users" (including non-paying ones), not just paying users (that would be ARPPU). A common interview follow-up is the difference between ARPU and ARPPU.',
          frameworkTip:
            'ARPU vs. ARPPU: ARPU = Revenue / All Users, ARPPU = Revenue / Paying Users. Explaining this distinction in interviews earns bonus points.',
        },

        // ── 3. Dashboard Metric Design (MC) ──
        {
          id: 3,
          name: 'Dashboard Metric Design',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'Choosing the Right Dashboard Metrics',
            narrative:
              'You are designing an Executive Dashboard for a SaaS product. The CEO wants to see core metrics for "product health." Here are the options:',
          },
          question:
            'Which set of metrics is most suitable as "North Star metric + supporting metrics" for a SaaS product?',
          options: [
            {
              id: 'A',
              text: 'DAU + Page Load Speed + Server Error Rate',
              explanation: 'Page load speed and error rate are engineering metrics, not core indicators of product health.',
            },
            {
              id: 'B',
              text: 'MAU + DAU/MAU + Paid Conversion Rate + MRR',
              explanation: 'Correct! MAU measures scale, DAU/MAU measures stickiness, conversion rate measures monetization efficiency, and MRR measures revenue. These four metrics cover user scale, engagement quality, and business value.',
            },
            {
              id: 'C',
              text: 'Signups + Total Revenue + Customer Support Response Time',
              explanation: 'These metrics are too scattered and do not measure user activity or stickiness.',
            },
            {
              id: 'D',
              text: 'NPS Score + Feature Usage Rate + Bug Fix Speed',
              explanation: 'NPS is a user satisfaction metric, but not a core KPI for product health. Bug fix speed is an engineering metric.',
            },
          ],
          correctAnswer: 'B',
          hints: [
            'A good set of metrics should cover: scale, engagement, and monetization',
            'Core SaaS metrics typically include MRR (Monthly Recurring Revenue)',
            'DAU/MAU reflects whether users are "actually using" the product',
          ],
          explanation:
            'Use the AARRR framework when designing dashboards: Acquisition, Activation, Retention, Revenue, Referral. MAU maps to scale, DAU/MAU maps to retention and activity, conversion rate maps to revenue, and MRR maps to business value. A well-designed dashboard tells a complete story with 3-5 core metrics.',
          frameworkTip:
            'When designing a dashboard in interviews, use the AARRR or "Scale x Quality x Monetization" framework to select metrics. Avoid piling up unrelated numbers.',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-6  Boss: Product Analytics SQL Case
       ═══════════════════════════════════════════════════ */
    {
      id: '25-6',
      name: 'Boss: Product Analytics SQL Case',
      description: 'Comprehensive Boss challenge — Combine Window Functions, Funnel, and Segmentation for a full product analysis',
      xp: 200,
      isBoss: true,
      challenges: [
        // ── 1. Full Product Analysis (code, hard) ──
        {
          id: 1,
          name: 'Full Product Analysis',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: 'Subscription Product Full Analysis',
            narrative:
              'You are a Product Analyst. The PM has asked you to use SQL to produce a comprehensive product analysis report. You need to combine Window Functions (ranking and trends), Funnel (conversion analysis), and Segmentation (user grouping) to identify growth opportunities.\n\nTables:\n- users (user_id INTEGER, signup_date TEXT, plan TEXT)\n- events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)',
            data: [
              { user_id: 101, signup_date: '2025-12-01', plan: 'free' },
              { user_id: 102, signup_date: '2025-12-05', plan: 'pro' },
              { user_id: 103, signup_date: '2026-01-10', plan: 'free' },
            ],
            dataCaption: 'users table (sample data)',
          },
          question:
            'Write a SQL query that calculates the conversion rate through the "trial_start → feature_use → upgrade" funnel for each plan (free / pro), and uses RANK to order them by conversion rate. This helps the PM understand which plan has the best conversion performance.',
          sampleSchema: `
CREATE TABLE users (user_id INTEGER, signup_date TEXT, plan TEXT);
INSERT INTO users VALUES (101, '2025-12-01', 'free');
INSERT INTO users VALUES (102, '2025-12-05', 'pro');
INSERT INTO users VALUES (103, '2026-01-10', 'free');
INSERT INTO users VALUES (104, '2026-01-15', 'free');
INSERT INTO users VALUES (105, '2025-12-20', 'pro');
INSERT INTO users VALUES (106, '2026-01-25', 'free');
INSERT INTO users VALUES (107, '2026-02-01', 'pro');
INSERT INTO users VALUES (108, '2026-02-10', 'free');
INSERT INTO users VALUES (109, '2026-02-15', 'free');
INSERT INTO users VALUES (110, '2025-12-28', 'pro');
CREATE TABLE events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT);
INSERT INTO events VALUES (1, 101, 'trial_start', '2025-12-02');
INSERT INTO events VALUES (2, 101, 'feature_use', '2025-12-05');
INSERT INTO events VALUES (3, 101, 'upgrade', '2025-12-10');
INSERT INTO events VALUES (4, 102, 'trial_start', '2025-12-06');
INSERT INTO events VALUES (5, 102, 'feature_use', '2025-12-08');
INSERT INTO events VALUES (6, 102, 'upgrade', '2025-12-12');
INSERT INTO events VALUES (7, 103, 'trial_start', '2026-01-11');
INSERT INTO events VALUES (8, 103, 'feature_use', '2026-01-15');
INSERT INTO events VALUES (9, 104, 'trial_start', '2026-01-16');
INSERT INTO events VALUES (10, 105, 'trial_start', '2025-12-21');
INSERT INTO events VALUES (11, 105, 'feature_use', '2025-12-25');
INSERT INTO events VALUES (12, 105, 'upgrade', '2025-12-28');
INSERT INTO events VALUES (13, 106, 'trial_start', '2026-01-26');
INSERT INTO events VALUES (14, 106, 'feature_use', '2026-01-30');
INSERT INTO events VALUES (15, 107, 'trial_start', '2026-02-02');
INSERT INTO events VALUES (16, 107, 'feature_use', '2026-02-05');
INSERT INTO events VALUES (17, 107, 'upgrade', '2026-02-08');
INSERT INTO events VALUES (18, 108, 'trial_start', '2026-02-11');
INSERT INTO events VALUES (19, 109, 'trial_start', '2026-02-16');
INSERT INTO events VALUES (20, 110, 'trial_start', '2025-12-29');
INSERT INTO events VALUES (21, 110, 'feature_use', '2026-01-02');
CREATE TABLE payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT);
INSERT INTO payments VALUES (1, 101, 299, '2025-12-10');
INSERT INTO payments VALUES (2, 102, 599, '2025-12-12');
INSERT INTO payments VALUES (3, 105, 599, '2025-12-28');
INSERT INTO payments VALUES (4, 107, 599, '2026-02-08');
          `,
          starterCode:
            "WITH funnel AS (\n  SELECT\n    u.plan,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade\n  FROM users u\n  JOIN events e ON u.user_id = e.user_id\n  GROUP BY u.plan\n)\nSELECT plan,\n       step1_trial, step2_feature, step3_upgrade,\n       -- Calculate conversion rates per step\n       -- Use RANK to order by final conversion rate\nFROM funnel\nORDER BY conversion_rank;",
          expectedQuery:
            "WITH funnel AS (SELECT u.plan, COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial, COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature, COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade FROM users u JOIN events e ON u.user_id = e.user_id GROUP BY u.plan) SELECT plan, step1_trial, step2_feature, step3_upgrade, ROUND(step2_feature * 100.0 / step1_trial, 1) AS feature_rate, ROUND(step3_upgrade * 100.0 / step1_trial, 1) AS upgrade_rate, RANK() OVER (ORDER BY step3_upgrade * 1.0 / step1_trial DESC) AS conversion_rank FROM funnel ORDER BY conversion_rank;",
          hints: [
            'First use a CTE to compute the funnel numbers for each plan',
            'Conversion rate = users at that step / step1 users * 100',
            'RANK() OVER (ORDER BY upgrade_rate DESC) ranks by conversion rate',
          ],
          explanation:
            'This Boss challenge combines three core skills: (1) Funnel — COUNT DISTINCT CASE WHEN to compute step counts (2) Segmentation — GROUP BY plan to calculate per-segment (3) Window Function — RANK to order results. In practice, PMs frequently need this kind of "segmented funnel + ranking" analysis to inform product strategy.',
          frameworkTip:
            'Product Analysis thinking framework: first Segment (group users) → then Measure (e.g., Funnel) → finally Rank/Compare. These three steps solve most product analysis problems.',
        },

        // ── 2. Product Analysis Plan (open-ended, hard) ──
        {
          id: 2,
          name: 'Product Analysis Plan',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: 'Designing a Complete Product Analysis Plan',
            narrative:
              'You just joined a B2C subscription SaaS company as a Product Analyst. The PM tells you: "Our paid conversion rate dropped from 8% last month to 5%. The CEO wants to see the analysis report next week."\n\nYou need to design a comprehensive analysis plan, using SQL queries to identify the root cause and provide recommendations.',
          },
          question:
            'Design a complete analysis plan addressing the following:\n1. What SQL queries would you build to diagnose the problem? (List at least 3)\n2. What is the purpose of each query?\n3. What insights do you expect to uncover?\n4. How would you present the results to the CEO?',
          prompt:
            'Based on the paid conversion rate decline scenario, design an analysis plan with at least 3 SQL queries, explaining the purpose and expected findings for each.',
          evaluationCriteria: [
            'Does it include funnel analysis (identifying which step has the most drop-off)?',
            'Does it include segmented comparison (new vs. returning users, different channels, different plans)?',
            'Does it include time trend analysis (MoM or WoW comparison)?',
            'Does it consider cohort analysis (is it a specific cohort issue or a broad decline)?',
            'Is the presentation approach clear and actionable?',
          ],
          sampleAnswer:
            'Analysis Plan:\n\n1. **Funnel Analysis**: Use COUNT DISTINCT CASE WHEN to calculate the conversion rate at each step of visit → signup → trial → payment, comparing this month with last month. Purpose: Identify which step had the largest drop in conversion.\n\n2. **Segmented Comparison**: Use CASE WHEN to divide users into new users / returning users / different channels, and calculate the paid conversion rate for each group. Purpose: Determine whether all segments declined or just a specific one.\n\n3. **Weekly Trend + LAG Comparison**: Use LAG to calculate the WoW conversion rate change. Purpose: Determine whether the decline was gradual or sudden (which may correlate with a product release or the end of a marketing campaign).\n\n4. **Cohort Retention**: Compare the first-month payment rate across the three most recent cohorts. Purpose: Determine if it is a new user quality issue or a product experience problem.\n\nPresentation approach: Start by showing the CEO the funnel chart to identify the problem step, then use segment comparisons to pinpoint the affected group, and finally use the time trend chart to highlight the inflection point. Propose 2-3 testable hypotheses and recommend A/B tests.',
          hints: [
            'Think about each step in the funnel — which step saw the conversion rate drop?',
            'Do different user segments have different conversion rates? New vs. returning users?',
            'Was it a gradual decline or a sudden drop at a specific point? You can use LAG to compare',
          ],
          explanation:
            'The core approach to product analysis is "Decompose → Compare → Hypothesize → Validate." When a metric anomaly occurs, first decompose (Funnel: which step dropped), then compare (Segmentation: who dropped), then hypothesize (why it dropped), and finally design validation (A/B test or deeper analysis). This approach applies to all product analysis scenarios.',
          frameworkTip:
            'Metric anomaly analysis framework: (1) Confirm the problem — did it really drop? Rule out seasonality and data issues (2) Decompose — which funnel step dropped (3) Segment — who was affected (4) Time — when did it drop (5) Hypothesize → Recommend.',
        },
      ],
    },
  ],
};
