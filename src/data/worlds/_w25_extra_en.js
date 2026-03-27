// ─────────────────────────────────────────────────────
// World 25 — Extra Challenges (Inspired by StrataScratch / LeetCode Interview Questions)
// Import and append to the corresponding quest's challenges array
// ─────────────────────────────────────────────────────

export const w25ExtraEn = {

  /* ═══════════════════════════════════════════════════
     Quest 25-1  Window Functions in Practice  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-1': [
    // ── 4. Activity Rank (inspired by Google) ──
    {
      id: 4,
      name: 'DENSE_RANK Activity Ranking',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'User Email Activity Ranking',
        narrative:
          'The product team wants to identify the most active email users. You need to rank users by the number of emails they have sent. If two users sent the same number of emails, they should share the same rank (no gaps).\n\nTable: emails (id, from_user, to_user, sent_date)',
        data: [
          { id: 1, from_user: 'alice', to_user: 'bob', sent_date: '2024-03-01' },
          { id: 2, from_user: 'alice', to_user: 'charlie', sent_date: '2024-03-02' },
          { id: 3, from_user: 'bob', to_user: 'alice', sent_date: '2024-03-03' },
          { id: 4, from_user: 'charlie', to_user: 'alice', sent_date: '2024-03-04' },
          { id: 5, from_user: 'alice', to_user: 'diana', sent_date: '2024-03-05' },
        ],
        dataCaption: 'emails table (sample data)',
      },
      question:
        'Count the number of emails sent by each user and rank them using DENSE_RANK (highest count ranks first). Display from_user, email_count, activity_rank.',
      sampleSchema: `
        CREATE TABLE emails (id INTEGER, from_user TEXT, to_user TEXT, sent_date TEXT);
        INSERT INTO emails VALUES (1, 'alice', 'bob', '2024-03-01');
        INSERT INTO emails VALUES (2, 'alice', 'charlie', '2024-03-02');
        INSERT INTO emails VALUES (3, 'bob', 'alice', '2024-03-03');
        INSERT INTO emails VALUES (4, 'charlie', 'alice', '2024-03-04');
        INSERT INTO emails VALUES (5, 'alice', 'diana', '2024-03-05');
        INSERT INTO emails VALUES (6, 'bob', 'diana', '2024-03-06');
        INSERT INTO emails VALUES (7, 'diana', 'alice', '2024-03-07');
        INSERT INTO emails VALUES (8, 'charlie', 'bob', '2024-03-08');
        INSERT INTO emails VALUES (9, 'bob', 'charlie', '2024-03-09');
        INSERT INTO emails VALUES (10, 'alice', 'bob', '2024-03-10');
      `,
      starterCode:
        "SELECT from_user,\n       COUNT(*) AS email_count,\n       DENSE_RANK() OVER (\n         -- What should the ordering be?\n       ) AS activity_rank\nFROM emails\nGROUP BY from_user\nORDER BY activity_rank;",
      expectedQuery:
        "SELECT from_user, COUNT(*) AS email_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS activity_rank FROM emails GROUP BY from_user ORDER BY activity_rank;",
      hints: [
        'DENSE_RANK does not skip ranks, while RANK does — we need no gaps here',
        'The ORDER BY inside OVER() can directly use aggregate functions',
        'No PARTITION BY is needed since this is a global ranking',
      ],
      explanation:
        'DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) ranks users by email count from highest to lowest, assigning the same rank to ties without gaps. Note the difference between DENSE_RANK and RANK: if two users tie for 1st, the next rank with DENSE_RANK is 2, while with RANK it would be 3. This distinction is a frequent interview question.',
      frameworkTip:
        'RANK vs DENSE_RANK vs ROW_NUMBER: RANK skips ranks after ties, DENSE_RANK does not, and ROW_NUMBER assigns a unique number to each row. These three are must-know concepts for interviews.',
    },

    // ── 5. Ranking Most Active Guests (inspired by Airbnb) ──
    {
      id: 5,
      name: 'Most Active Guest Ranking',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Airbnb Interview',
      scenario: {
        title: 'Guest Messaging Activity Ranking',
        narrative:
          'The platform operations team wants to identify the most communicative guests to award them a "Super Guest" badge. You need to rank guests by total number of messages sent. If multiple guests sent the same number of messages, they share the same rank and should be sorted alphabetically by name.\n\nTable: messages (id, guest_id, guest_name, host_id, message_body, sent_date)',
        data: [
          { id: 1, guest_id: 101, guest_name: 'Amy', host_id: 501, sent_date: '2024-02-10' },
          { id: 2, guest_id: 102, guest_name: 'Ben', host_id: 502, sent_date: '2024-02-11' },
          { id: 3, guest_id: 101, guest_name: 'Amy', host_id: 503, sent_date: '2024-02-12' },
          { id: 4, guest_id: 103, guest_name: 'Cathy', host_id: 501, sent_date: '2024-02-13' },
        ],
        dataCaption: 'messages table (sample data)',
      },
      question:
        'Count the number of messages per guest and rank them using DENSE_RANK (highest count ranks first). For ties, sort alphabetically by guest_name. Display guest_name, message_count, ranking.',
      sampleSchema: `
        CREATE TABLE messages (id INTEGER, guest_id INTEGER, guest_name TEXT, host_id INTEGER, message_body TEXT, sent_date TEXT);
        INSERT INTO messages VALUES (1, 101, 'Amy', 501, 'Hello', '2024-02-10');
        INSERT INTO messages VALUES (2, 102, 'Ben', 502, 'Hi there', '2024-02-11');
        INSERT INTO messages VALUES (3, 101, 'Amy', 503, 'Question about check-in', '2024-02-12');
        INSERT INTO messages VALUES (4, 103, 'Cathy', 501, 'Is parking available?', '2024-02-13');
        INSERT INTO messages VALUES (5, 102, 'Ben', 501, 'Thanks!', '2024-02-14');
        INSERT INTO messages VALUES (6, 101, 'Amy', 502, 'Great place!', '2024-02-15');
        INSERT INTO messages VALUES (7, 104, 'Diana', 503, 'Booking question', '2024-02-16');
        INSERT INTO messages VALUES (8, 103, 'Cathy', 502, 'Need directions', '2024-02-17');
        INSERT INTO messages VALUES (9, 102, 'Ben', 503, 'Check-out time?', '2024-02-18');
        INSERT INTO messages VALUES (10, 104, 'Diana', 501, 'Perfect stay', '2024-02-19');
        INSERT INTO messages VALUES (11, 101, 'Amy', 501, 'Recommend!', '2024-02-20');
        INSERT INTO messages VALUES (12, 103, 'Cathy', 503, 'Loved it', '2024-02-21');
      `,
      starterCode:
        "SELECT guest_name,\n       COUNT(*) AS message_count,\n       DENSE_RANK() OVER (\n         -- Ranking logic?\n       ) AS ranking\nFROM messages\nGROUP BY guest_id, guest_name\nORDER BY ranking, guest_name;",
      expectedQuery:
        "SELECT guest_name, COUNT(*) AS message_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking FROM messages GROUP BY guest_id, guest_name ORDER BY ranking, guest_name;",
      hints: [
        'GROUP BY guest_id first, then apply DENSE_RANK for ranking',
        'Ties should be sorted alphabetically by guest_name — handle this in the outer ORDER BY',
        'Note that GROUP BY should include both guest_id and guest_name',
      ],
      explanation:
        'First GROUP BY guest_id, guest_name to count each guest\'s messages, then apply DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) for ranking. The outer ORDER BY ranking, guest_name ensures ties are sorted alphabetically. This pattern is extremely common in leaderboard scenarios.',
      frameworkTip:
        'Leaderboard pattern: GROUP BY to compute metrics -> DENSE_RANK for ranking -> ORDER BY to handle tie-breaking.',
    },

    // ── 6. Consecutive Numbers (inspired by LeetCode #180) ──
    {
      id: 6,
      name: 'Consecutive Repeating Numbers',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: 'Detecting Three Consecutive Identical Values',
        narrative:
          'A data engineer noticed that certain values in a sensor log appear consecutively multiple times, which may indicate a system anomaly. The PM has asked you to find all values that appear at least 3 times in a row.\n\nTable: sensor_logs (id INTEGER PRIMARY KEY, value INTEGER), where id is a sequential number.',
        data: [
          { id: 1, value: 10 },
          { id: 2, value: 10 },
          { id: 3, value: 10 },
          { id: 4, value: 20 },
          { id: 5, value: 20 },
          { id: 6, value: 30 },
        ],
        dataCaption: 'sensor_logs table (sample data)',
      },
      question:
        'Use LAG and LEAD (or two consecutive LAGs) to find all values that appear at least 3 times consecutively. Deduplicate the results and display only the value column.',
      sampleSchema: `
        CREATE TABLE sensor_logs (id INTEGER PRIMARY KEY, value INTEGER);
        INSERT INTO sensor_logs VALUES (1, 10);
        INSERT INTO sensor_logs VALUES (2, 10);
        INSERT INTO sensor_logs VALUES (3, 10);
        INSERT INTO sensor_logs VALUES (4, 20);
        INSERT INTO sensor_logs VALUES (5, 20);
        INSERT INTO sensor_logs VALUES (6, 30);
        INSERT INTO sensor_logs VALUES (7, 30);
        INSERT INTO sensor_logs VALUES (8, 30);
        INSERT INTO sensor_logs VALUES (9, 30);
        INSERT INTO sensor_logs VALUES (10, 40);
        INSERT INTO sensor_logs VALUES (11, 50);
        INSERT INTO sensor_logs VALUES (12, 50);
      `,
      starterCode:
        "WITH lagged AS (\n  SELECT id, value,\n    LAG(value, 1) OVER (ORDER BY id) AS prev1,\n    LAG(value, 2) OVER (ORDER BY id) AS prev2\n  FROM sensor_logs\n)\nSELECT DISTINCT value\nFROM lagged\nWHERE -- What condition means \"three consecutive identical values\"?;",
      expectedQuery:
        "WITH lagged AS (SELECT id, value, LAG(value, 1) OVER (ORDER BY id) AS prev1, LAG(value, 2) OVER (ORDER BY id) AS prev2 FROM sensor_logs) SELECT DISTINCT value FROM lagged WHERE value = prev1 AND value = prev2;",
      hints: [
        'LAG(value, 1) fetches the previous row, LAG(value, 2) fetches two rows back',
        'If value = prev1 = prev2, it means three consecutive rows share the same value',
        'Use DISTINCT to deduplicate, since 4 consecutive occurrences would match twice',
      ],
      explanation:
        'Use LAG to retrieve the previous and second-previous values; when all three are equal, it indicates 3 consecutive occurrences. LAG(value, N) uses N as the offset. An alternative approach uses both LAG and LEAD: check if self = previous = next. DISTINCT is necessary because a value appearing 4 times consecutively would be matched multiple times. This is a classic interview question testing flexible use of window functions.',
      frameworkTip:
        'Consecutive-N-times pattern: use LAG/LEAD to compare adjacent values, or the "row_number gap" technique (GROUP BY value, id - ROW_NUMBER to form groups).',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-2  Funnel Analysis  (existing ids 1-2)
     ═══════════════════════════════════════════════════ */
  '25-2': [
    // ── 3. Acceptance Rate By Date (inspired by Meta) ──
    {
      id: 3,
      name: 'Daily Friend Request Acceptance Rate',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Friend Request Acceptance Rate Analysis',
        narrative:
          'The Growth team wants to track the health of the friend feature. You need to calculate the daily acceptance rate based on friend request events (send / accept).\n\nTable: friend_requests (id, sender_id, receiver_id, action TEXT, action_date TEXT)\n- action is either "send" or "accept"',
        data: [
          { id: 1, sender_id: 101, receiver_id: 201, action: 'send', action_date: '2024-03-01' },
          { id: 2, sender_id: 101, receiver_id: 201, action: 'accept', action_date: '2024-03-01' },
          { id: 3, sender_id: 102, receiver_id: 202, action: 'send', action_date: '2024-03-01' },
          { id: 4, sender_id: 103, receiver_id: 203, action: 'send', action_date: '2024-03-02' },
          { id: 5, sender_id: 103, receiver_id: 203, action: 'accept', action_date: '2024-03-02' },
        ],
        dataCaption: 'friend_requests table (sample data)',
      },
      question:
        'Calculate the daily friend request acceptance rate: acceptance_rate = accepts on that day / sends on that day. Display action_date, sends, accepts, acceptance_rate (rounded to 2 decimal places).',
      sampleSchema: `
        CREATE TABLE friend_requests (id INTEGER, sender_id INTEGER, receiver_id INTEGER, action TEXT, action_date TEXT);
        INSERT INTO friend_requests VALUES (1, 101, 201, 'send', '2024-03-01');
        INSERT INTO friend_requests VALUES (2, 101, 201, 'accept', '2024-03-01');
        INSERT INTO friend_requests VALUES (3, 102, 202, 'send', '2024-03-01');
        INSERT INTO friend_requests VALUES (4, 103, 203, 'send', '2024-03-01');
        INSERT INTO friend_requests VALUES (5, 104, 204, 'send', '2024-03-02');
        INSERT INTO friend_requests VALUES (6, 103, 203, 'accept', '2024-03-02');
        INSERT INTO friend_requests VALUES (7, 104, 204, 'accept', '2024-03-02');
        INSERT INTO friend_requests VALUES (8, 105, 205, 'send', '2024-03-02');
        INSERT INTO friend_requests VALUES (9, 106, 206, 'send', '2024-03-03');
        INSERT INTO friend_requests VALUES (10, 107, 207, 'send', '2024-03-03');
        INSERT INTO friend_requests VALUES (11, 106, 206, 'accept', '2024-03-03');
        INSERT INTO friend_requests VALUES (12, 108, 208, 'send', '2024-03-03');
      `,
      starterCode:
        "SELECT action_date,\n       SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends,\n       SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts,\n       -- How to calculate acceptance_rate?\nFROM friend_requests\nGROUP BY action_date\nORDER BY action_date;",
      expectedQuery:
        "SELECT action_date, SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends, SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts, ROUND(SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END), 2) AS acceptance_rate FROM friend_requests GROUP BY action_date ORDER BY action_date;",
      hints: [
        'Use CASE WHEN to count sends and accepts separately',
        'Remember to multiply by 1.0 to avoid integer division',
        'Use ROUND(..., 2) to round to 2 decimal places',
      ],
      explanation:
        'Using SUM(CASE WHEN ...) is a classic "horizontal pivot" technique that computes multiple conditional aggregates within a single GROUP BY. Watch out for integer division in SQLite: 5/3 = 1, not 1.67, so you must multiply by 1.0 to cast to float. This type of event-based conversion rate calculation is a core question type in social platform analytics.',
      frameworkTip:
        'Event conversion rate pattern: SUM(CASE WHEN event = X) / SUM(CASE WHEN event = Y). Remember to handle integer division and division by zero.',
    },

    // ── 4. Highest Energy Consumption (inspired by Meta) ──
    {
      id: 4,
      name: 'Peak Energy Consumption Across Sources',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Multi-Source Funnel Merge',
        narrative:
          'The company has energy consumption records from three different departments stored in separate tables. The PM wants to find the total consumption per month after merging all sources, and identify the month with the highest consumption.\n\nTables:\n- dept_a_consumption (date TEXT, consumption INTEGER)\n- dept_b_consumption (date TEXT, consumption INTEGER)\n- dept_c_consumption (date TEXT, consumption INTEGER)',
        data: [
          { source: 'dept_a', date: '2024-01', consumption: 300 },
          { source: 'dept_b', date: '2024-01', consumption: 250 },
          { source: 'dept_c', date: '2024-01', consumption: 200 },
        ],
        dataCaption: 'Energy consumption by department for 2024-01 (sample)',
      },
      question:
        'Use UNION ALL to merge the three tables, calculate total consumption per month, and find the month with the highest consumption. Display date, total_consumption, returning only the month(s) with the highest value (there may be ties).',
      sampleSchema: `
        CREATE TABLE dept_a_consumption (date TEXT, consumption INTEGER);
        INSERT INTO dept_a_consumption VALUES ('2024-01', 300);
        INSERT INTO dept_a_consumption VALUES ('2024-02', 350);
        INSERT INTO dept_a_consumption VALUES ('2024-03', 280);
        CREATE TABLE dept_b_consumption (date TEXT, consumption INTEGER);
        INSERT INTO dept_b_consumption VALUES ('2024-01', 250);
        INSERT INTO dept_b_consumption VALUES ('2024-02', 200);
        INSERT INTO dept_b_consumption VALUES ('2024-03', 320);
        CREATE TABLE dept_c_consumption (date TEXT, consumption INTEGER);
        INSERT INTO dept_c_consumption VALUES ('2024-01', 200);
        INSERT INTO dept_c_consumption VALUES ('2024-02', 400);
        INSERT INTO dept_c_consumption VALUES ('2024-03', 150);
      `,
      starterCode:
        "WITH combined AS (\n  SELECT date, consumption FROM dept_a_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_b_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_c_consumption\n),\nmonthly AS (\n  SELECT date, SUM(consumption) AS total_consumption\n  FROM combined\n  GROUP BY date\n)\nSELECT date, total_consumption\nFROM monthly\nWHERE total_consumption = (\n  -- How to get the maximum value?\n);",
      expectedQuery:
        "WITH combined AS (SELECT date, consumption FROM dept_a_consumption UNION ALL SELECT date, consumption FROM dept_b_consumption UNION ALL SELECT date, consumption FROM dept_c_consumption), monthly AS (SELECT date, SUM(consumption) AS total_consumption FROM combined GROUP BY date) SELECT date, total_consumption FROM monthly WHERE total_consumption = (SELECT MAX(total_consumption) FROM monthly);",
      hints: [
        'UNION ALL retains all rows (including duplicates), while UNION deduplicates — use UNION ALL here',
        'Merge first -> GROUP BY month to sum -> then find the maximum',
        'Use a subquery SELECT MAX(...) FROM monthly to get the max value',
      ],
      explanation:
        'Merging multiple data sources is a common real-world scenario (data from different platforms, reports from different departments, etc.). UNION ALL vertically combines tables with the same structure, then GROUP BY performs aggregation. Filtering with a subquery to find the maximum correctly handles the case where multiple months are tied. In interviews, this type of question tests your ability to work with data scattered across different tables.',
      frameworkTip:
        'Multi-source merge pattern: UNION ALL to combine -> GROUP BY to aggregate -> subquery or window function to filter for extreme values.',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-3  Segmentation  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-3': [
    // ── 4. Classify Business Type (inspired by Google) ──
    {
      id: 4,
      name: 'Business Type Classification',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Classify Businesses by Name Keywords',
        narrative:
          'The marketing team received a batch of business data and needs to automatically classify businesses based on keywords in their names. The rules are:\n- Name contains "restaurant" or "cafe" -> Food & Beverage\n- Name contains "shop" or "store" -> Retail\n- Name contains "hotel" or "inn" -> Hospitality\n- Otherwise -> Other\n\nTable: businesses (id, name TEXT, city TEXT, revenue REAL)',
        data: [
          { id: 1, name: 'Sunset Restaurant', city: 'Taipei', revenue: 85000 },
          { id: 2, name: 'Tech Shop Plus', city: 'Hsinchu', revenue: 120000 },
          { id: 3, name: 'Garden Inn', city: 'Taichung', revenue: 200000 },
          { id: 4, name: 'Creative Studio', city: 'Taipei', revenue: 65000 },
        ],
        dataCaption: 'businesses table (sample data)',
      },
      question:
        'Use CASE WHEN with LOWER() and LIKE to classify businesses, then calculate the count and average revenue for each category. Display business_type, count, avg_revenue.',
      sampleSchema: `
        CREATE TABLE businesses (id INTEGER, name TEXT, city TEXT, revenue REAL);
        INSERT INTO businesses VALUES (1, 'Sunset Restaurant', 'Taipei', 85000);
        INSERT INTO businesses VALUES (2, 'Tech Shop Plus', 'Hsinchu', 120000);
        INSERT INTO businesses VALUES (3, 'Garden Inn', 'Taichung', 200000);
        INSERT INTO businesses VALUES (4, 'Creative Studio', 'Taipei', 65000);
        INSERT INTO businesses VALUES (5, 'Downtown Cafe', 'Taipei', 55000);
        INSERT INTO businesses VALUES (6, 'Fashion Store', 'Kaohsiung', 95000);
        INSERT INTO businesses VALUES (7, 'Harbor Hotel', 'Keelung', 300000);
        INSERT INTO businesses VALUES (8, 'Art Gallery', 'Tainan', 45000);
        INSERT INTO businesses VALUES (9, 'Morning Cafe House', 'Taipei', 70000);
        INSERT INTO businesses VALUES (10, 'Book Shop', 'Taichung', 40000);
        INSERT INTO businesses VALUES (11, 'Riverside Restaurant Bar', 'Taipei', 110000);
        INSERT INTO businesses VALUES (12, 'Design Co', 'Hsinchu', 180000);
      `,
      starterCode:
        "SELECT\n  CASE\n    WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN 'Food & Beverage'\n    -- Continue classifying...\n  END AS business_type,\n  COUNT(*) AS count,\n  ROUND(AVG(revenue), 0) AS avg_revenue\nFROM businesses\nGROUP BY business_type\nORDER BY avg_revenue DESC;",
      expectedQuery:
        "SELECT CASE WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN 'Food & Beverage' WHEN LOWER(name) LIKE '%shop%' OR LOWER(name) LIKE '%store%' THEN 'Retail' WHEN LOWER(name) LIKE '%hotel%' OR LOWER(name) LIKE '%inn%' THEN 'Hospitality' ELSE 'Other' END AS business_type, COUNT(*) AS count, ROUND(AVG(revenue), 0) AS avg_revenue FROM businesses GROUP BY business_type ORDER BY avg_revenue DESC;",
      hints: [
        'LOWER(name) converts to lowercase first to avoid case-sensitivity issues',
        "LIKE '%keyword%' performs fuzzy matching",
        'The order of CASE WHEN matters — if a name contains multiple keywords, it will be assigned to the first matching category',
      ],
      explanation:
        'Using CASE WHEN + LIKE for text classification is a common technique in data cleaning and segmentation. LOWER() ensures case-insensitive matching. Note that CASE WHEN follows "first match wins" logic, so the order of conditions can affect results. In practice, this classification logic often grows increasingly complex and may eventually need to be moved to a mapping table or UDF.',
      frameworkTip:
        'Text classification pattern: CASE WHEN + LOWER + LIKE. In production, a better approach is to create a mapping table and JOIN it in.',
    },

    // ── 5. Premium vs Freemium (inspired by Microsoft) ──
    {
      id: 5,
      name: 'Free vs Paid User Comparison',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Microsoft Interview',
      scenario: {
        title: 'Freemium vs Premium Download Comparison',
        narrative:
          'The product team wants to understand the difference in daily download volume between free and paid users, and specifically wants to find dates where free user downloads exceeded paid user downloads.\n\nTables:\n- downloads (date TEXT, user_id INTEGER, downloads INTEGER)\n- users (id INTEGER, account_type TEXT)  -- account_type: "free" or "premium"',
        data: [
          { date: '2024-03-01', account_type: 'free', total_downloads: 150 },
          { date: '2024-03-01', account_type: 'premium', total_downloads: 200 },
          { date: '2024-03-02', account_type: 'free', total_downloads: 250 },
          { date: '2024-03-02', account_type: 'premium', total_downloads: 180 },
        ],
        dataCaption: 'Daily downloads (aggregated) sample',
      },
      question:
        'Calculate the daily total downloads for free users vs paid users, and find dates where free user downloads exceeded paid user downloads. Display date, free_downloads, premium_downloads.',
      sampleSchema: `
        CREATE TABLE users (id INTEGER, account_type TEXT);
        INSERT INTO users VALUES (1, 'free');
        INSERT INTO users VALUES (2, 'free');
        INSERT INTO users VALUES (3, 'premium');
        INSERT INTO users VALUES (4, 'free');
        INSERT INTO users VALUES (5, 'premium');
        INSERT INTO users VALUES (6, 'free');
        INSERT INTO users VALUES (7, 'premium');
        INSERT INTO users VALUES (8, 'free');
        CREATE TABLE downloads (date TEXT, user_id INTEGER, downloads INTEGER);
        INSERT INTO downloads VALUES ('2024-03-01', 1, 50);
        INSERT INTO downloads VALUES ('2024-03-01', 2, 40);
        INSERT INTO downloads VALUES ('2024-03-01', 3, 80);
        INSERT INTO downloads VALUES ('2024-03-01', 4, 60);
        INSERT INTO downloads VALUES ('2024-03-01', 5, 120);
        INSERT INTO downloads VALUES ('2024-03-02', 1, 90);
        INSERT INTO downloads VALUES ('2024-03-02', 2, 70);
        INSERT INTO downloads VALUES ('2024-03-02', 3, 50);
        INSERT INTO downloads VALUES ('2024-03-02', 6, 100);
        INSERT INTO downloads VALUES ('2024-03-02', 5, 60);
        INSERT INTO downloads VALUES ('2024-03-03', 4, 80);
        INSERT INTO downloads VALUES ('2024-03-03', 7, 90);
        INSERT INTO downloads VALUES ('2024-03-03', 8, 110);
        INSERT INTO downloads VALUES ('2024-03-03', 3, 70);
        INSERT INTO downloads VALUES ('2024-03-03', 6, 65);
      `,
      starterCode:
        "WITH daily AS (\n  SELECT d.date,\n    SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads,\n    SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads\n  FROM downloads d\n  JOIN users u ON d.user_id = u.id\n  GROUP BY d.date\n)\nSELECT date, free_downloads, premium_downloads\nFROM daily\nWHERE -- What condition?\nORDER BY date;",
      expectedQuery:
        "WITH daily AS (SELECT d.date, SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads, SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads FROM downloads d JOIN users u ON d.user_id = u.id GROUP BY d.date) SELECT date, free_downloads, premium_downloads FROM daily WHERE free_downloads > premium_downloads ORDER BY date;",
      hints: [
        'SUM(CASE WHEN) is a classic technique to split data within the same GROUP BY into two segments',
        'JOIN the users table to get account_type before performing conditional aggregation',
        'The WHERE condition simply compares the two SUM results',
      ],
      explanation:
        'The core technique here is "conditional aggregation": using SUM(CASE WHEN ...) within the same GROUP BY to compute metrics for different segments separately. This is more concise and efficient than running separate queries and JOINing them. The CTE calculates daily totals for both segments, and the outer query filters. This type of A/B comparison is ubiquitous in product analytics.',
      frameworkTip:
        'Segment comparison pattern: JOIN to get segment labels -> SUM(CASE WHEN) for conditional aggregation -> WHERE/HAVING to filter. More efficient than a self-join.',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-4  Retention / Cohort Analysis  (existing ids 1-2)
     ═══════════════════════════════════════════════════ */
  '25-4': [
    // ── 3. Retention Rate (inspired by Meta) ──
    {
      id: 3,
      name: 'Monthly Retention Rate Calculation',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Monthly User Retention Rate',
        narrative:
          'The Growth team needs to track monthly retention rate: "Of the users active in a given month, what percentage were also active the following month?" This differs from cohort retention — here we are not grouping by signup month, but looking at overall month-over-month retention.\n\nTable: user_activity (user_id INTEGER, activity_date TEXT)',
        data: [
          { user_id: 1, activity_date: '2024-01-05' },
          { user_id: 2, activity_date: '2024-01-10' },
          { user_id: 1, activity_date: '2024-02-03' },
          { user_id: 3, activity_date: '2024-02-15' },
        ],
        dataCaption: 'user_activity table (sample data)',
      },
      question:
        'Calculate the monthly retention rate: of users active in month N, what proportion were also active in month N+1. Display activity_month, active_users, retained_next_month, retention_rate.',
      sampleSchema: `
        CREATE TABLE user_activity (user_id INTEGER, activity_date TEXT);
        INSERT INTO user_activity VALUES (1, '2024-01-05');
        INSERT INTO user_activity VALUES (2, '2024-01-10');
        INSERT INTO user_activity VALUES (3, '2024-01-20');
        INSERT INTO user_activity VALUES (4, '2024-01-25');
        INSERT INTO user_activity VALUES (5, '2024-01-28');
        INSERT INTO user_activity VALUES (1, '2024-02-03');
        INSERT INTO user_activity VALUES (2, '2024-02-08');
        INSERT INTO user_activity VALUES (6, '2024-02-10');
        INSERT INTO user_activity VALUES (3, '2024-02-15');
        INSERT INTO user_activity VALUES (7, '2024-02-20');
        INSERT INTO user_activity VALUES (1, '2024-03-05');
        INSERT INTO user_activity VALUES (6, '2024-03-10');
        INSERT INTO user_activity VALUES (7, '2024-03-12');
        INSERT INTO user_activity VALUES (8, '2024-03-18');
        INSERT INTO user_activity VALUES (2, '2024-03-22');
        INSERT INTO user_activity VALUES (1, '2024-04-01');
        INSERT INTO user_activity VALUES (8, '2024-04-10');
      `,
      starterCode:
        "WITH monthly_users AS (\n  SELECT DISTINCT user_id,\n         strftime('%Y-%m', activity_date) AS activity_month\n  FROM user_activity\n)\nSELECT\n  a.activity_month,\n  COUNT(DISTINCT a.user_id) AS active_users,\n  -- How to count users retained to next month?\n  -- How to calculate retention_rate?\nFROM monthly_users a\nLEFT JOIN monthly_users b\n  ON a.user_id = b.user_id\n  -- How to ensure b is the \"next month\"?\nGROUP BY a.activity_month\nORDER BY a.activity_month;",
      expectedQuery:
        "WITH monthly_users AS (SELECT DISTINCT user_id, strftime('%Y-%m', activity_date) AS activity_month FROM user_activity) SELECT a.activity_month, COUNT(DISTINCT a.user_id) AS active_users, COUNT(DISTINCT b.user_id) AS retained_next_month, ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 1) AS retention_rate FROM monthly_users a LEFT JOIN monthly_users b ON a.user_id = b.user_id AND b.activity_month = strftime('%Y-%m', date(a.activity_month || '-01', '+1 month')) GROUP BY a.activity_month ORDER BY a.activity_month;",
      hints: [
        'First use DISTINCT to get unique active users per month',
        "Self-join: a is the current month's users, b is next month's users — use date(..., '+1 month') to compute the next month",
        'COUNT(DISTINCT b.user_id) gives the retained count; dividing by COUNT(DISTINCT a.user_id) gives the retention rate',
      ],
      explanation:
        "Monthly retention rate is implemented via a self-join: the monthly_users table joins itself on the condition that the user_id matches and b's month = a's month + 1. LEFT JOIN ensures months with zero retention still appear. In SQLite, use date(month || '-01', '+1 month') to calculate the next month. This is one of the most commonly tracked retention metrics on Growth teams.",
      frameworkTip:
        'Monthly retention pattern: CTE to deduplicate and get monthly active users -> self-join (same user + month offset of 1) -> COUNT(DISTINCT) to compute retained count.',
    },

    // ── 4. Monthly Percentage Difference (inspired by Amazon) ──
    {
      id: 4,
      name: 'MoM Revenue Percentage Change',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Month-over-Month Revenue Change',
        narrative:
          'The finance team needs a report showing each month\'s revenue and the percentage change compared to the previous month (MoM %). This helps executives quickly spot revenue anomalies.\n\nTable: purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT)',
        data: [
          { id: 1, user_id: 101, amount: 500, purchase_date: '2024-01-15' },
          { id: 2, user_id: 102, amount: 300, purchase_date: '2024-01-20' },
          { id: 3, user_id: 101, amount: 450, purchase_date: '2024-02-10' },
        ],
        dataCaption: 'purchases table (sample data)',
      },
      question:
        'Calculate the total monthly revenue and MoM percentage change. Use LAG to get the previous month\'s revenue. Display month, revenue, prev_month_revenue, mom_pct_change (rounded to 1 decimal place).',
      sampleSchema: `
        CREATE TABLE purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT);
        INSERT INTO purchases VALUES (1, 101, 500, '2024-01-15');
        INSERT INTO purchases VALUES (2, 102, 300, '2024-01-20');
        INSERT INTO purchases VALUES (3, 103, 200, '2024-01-25');
        INSERT INTO purchases VALUES (4, 101, 450, '2024-02-10');
        INSERT INTO purchases VALUES (5, 104, 600, '2024-02-18');
        INSERT INTO purchases VALUES (6, 102, 350, '2024-02-22');
        INSERT INTO purchases VALUES (7, 105, 150, '2024-03-05');
        INSERT INTO purchases VALUES (8, 101, 800, '2024-03-12');
        INSERT INTO purchases VALUES (9, 103, 250, '2024-03-20');
        INSERT INTO purchases VALUES (10, 106, 700, '2024-03-28');
        INSERT INTO purchases VALUES (11, 104, 400, '2024-04-08');
        INSERT INTO purchases VALUES (12, 105, 550, '2024-04-15');
        INSERT INTO purchases VALUES (13, 102, 300, '2024-04-22');
      `,
      starterCode:
        "WITH monthly AS (\n  SELECT strftime('%Y-%m', purchase_date) AS month,\n         SUM(amount) AS revenue\n  FROM purchases\n  GROUP BY month\n)\nSELECT month,\n       revenue,\n       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,\n       -- How to calculate MoM percentage change?\nFROM monthly\nORDER BY month;",
      expectedQuery:
        "WITH monthly AS (SELECT strftime('%Y-%m', purchase_date) AS month, SUM(amount) AS revenue FROM purchases GROUP BY month) SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue, ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 1) AS mom_pct_change FROM monthly ORDER BY month;",
      hints: [
        'First use a CTE to aggregate monthly revenue, then use LAG to get the previous month',
        'MoM % = (current month - previous month) / previous month * 100',
        'The first month\'s LAG returns NULL, so the entire calculation result is also NULL — no special handling needed',
      ],
      explanation:
        'First aggregate revenue by month in a CTE, then use LAG to retrieve the previous month\'s value for calculating the change rate. This pattern is similar to the LAG challenge in Quest 25-1, but adds an extra step: aggregate first, then compute. In practice, MoM change rate is the most common trend tracking metric and appears on virtually every dashboard.',
      frameworkTip:
        'MoM calculation in two steps: CTE to GROUP BY month and compute the metric -> outer query uses LAG for month-over-month comparison. Separating the steps is cleaner than doing everything in one layer.',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-5  KPI & Dashboard Query Design  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-5': [
    // ── 4. Customer Revenue in March (inspired by Meta) ──
    {
      id: 4,
      name: 'Single-Month Customer Revenue Ranking',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'March Customer Revenue Report',
        narrative:
          'The sales executive needs a "March customer revenue ranking" report to identify VIP customers and evaluate sales performance.\n\nTable: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
        data: [
          { id: 1, customer_id: 301, amount: 500, order_date: '2024-03-05' },
          { id: 2, customer_id: 302, amount: 350, order_date: '2024-03-10' },
          { id: 3, customer_id: 301, amount: 200, order_date: '2024-03-15' },
        ],
        dataCaption: 'orders table (sample data)',
      },
      question:
        'Calculate each customer\'s total revenue for March 2024 and rank them using DENSE_RANK. Display customer_id, march_revenue, revenue_rank. Sort by rank.',
      sampleSchema: `
        CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
        INSERT INTO orders VALUES (1, 301, 500, '2024-03-05');
        INSERT INTO orders VALUES (2, 302, 350, '2024-03-10');
        INSERT INTO orders VALUES (3, 301, 200, '2024-03-15');
        INSERT INTO orders VALUES (4, 303, 800, '2024-03-08');
        INSERT INTO orders VALUES (5, 304, 150, '2024-03-20');
        INSERT INTO orders VALUES (6, 302, 450, '2024-03-22');
        INSERT INTO orders VALUES (7, 305, 700, '2024-03-12');
        INSERT INTO orders VALUES (8, 303, 300, '2024-03-25');
        INSERT INTO orders VALUES (9, 301, 100, '2024-03-28');
        INSERT INTO orders VALUES (10, 306, 600, '2024-03-18');
        INSERT INTO orders VALUES (11, 301, 250, '2024-02-15');
        INSERT INTO orders VALUES (12, 302, 180, '2024-04-01');
      `,
      starterCode:
        "SELECT customer_id,\n       SUM(amount) AS march_revenue,\n       DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank\nFROM orders\nWHERE -- How to filter for March?\nGROUP BY customer_id\nORDER BY revenue_rank;",
      expectedQuery:
        "SELECT customer_id, SUM(amount) AS march_revenue, DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank FROM orders WHERE strftime('%Y-%m', order_date) = '2024-03' GROUP BY customer_id ORDER BY revenue_rank;",
      hints: [
        "strftime('%Y-%m', order_date) = '2024-03' filters for March",
        'Apply WHERE to filter the month first, then GROUP BY customer to sum revenue',
        'DENSE_RANK can be applied directly in SELECT to rank by SUM(amount)',
      ],
      explanation:
        'This question combines time filtering, aggregation, and window functions. First use WHERE to filter the target month, GROUP BY to calculate each customer\'s revenue, then DENSE_RANK for ranking. Note that WHERE executes before GROUP BY, so the filter condition belongs in WHERE, not HAVING. In interviews, "customer ranking for a specific time period" is a very high-frequency question type.',
      frameworkTip:
        'Execution order for time filter + aggregation + ranking: WHERE filters time -> GROUP BY aggregates -> Window Function ranks. Getting the order right is critical.',
    },

    // ── 5. Marketing Campaign Success (inspired by Amazon) ──
    {
      id: 5,
      name: 'Marketing Campaign Performance Analysis',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Marketing Campaign ROI Evaluation',
        narrative:
          'The marketing team ran multiple ad campaigns to acquire new users. The PM wants to know: of the users acquired through marketing campaigns, how many actually placed orders? How much revenue did each campaign generate?\n\nTables:\n- users (id INTEGER, signup_date TEXT, campaign TEXT) — campaign is NULL for organic traffic\n- orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT)',
        data: [
          { id: 1, signup_date: '2024-03-01', campaign: 'spring_sale' },
          { id: 2, signup_date: '2024-03-02', campaign: 'google_ads' },
          { id: 3, signup_date: '2024-03-03', campaign: null },
        ],
        dataCaption: 'users table (sample data)',
      },
      question:
        'Calculate for each marketing campaign: acquired users, users who placed orders, conversion rate, and total revenue. Exclude organic traffic (campaign IS NULL). Sort by total revenue in descending order.',
      sampleSchema: `
        CREATE TABLE users (id INTEGER, signup_date TEXT, campaign TEXT);
        INSERT INTO users VALUES (1, '2024-03-01', 'spring_sale');
        INSERT INTO users VALUES (2, '2024-03-02', 'google_ads');
        INSERT INTO users VALUES (3, '2024-03-03', NULL);
        INSERT INTO users VALUES (4, '2024-03-04', 'spring_sale');
        INSERT INTO users VALUES (5, '2024-03-05', 'facebook_ads');
        INSERT INTO users VALUES (6, '2024-03-06', 'google_ads');
        INSERT INTO users VALUES (7, '2024-03-07', NULL);
        INSERT INTO users VALUES (8, '2024-03-08', 'spring_sale');
        INSERT INTO users VALUES (9, '2024-03-09', 'facebook_ads');
        INSERT INTO users VALUES (10, '2024-03-10', 'google_ads');
        CREATE TABLE orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT);
        INSERT INTO orders VALUES (1, 1, 300, '2024-03-05');
        INSERT INTO orders VALUES (2, 1, 150, '2024-03-12');
        INSERT INTO orders VALUES (3, 2, 500, '2024-03-08');
        INSERT INTO orders VALUES (4, 4, 200, '2024-03-10');
        INSERT INTO orders VALUES (5, 5, 120, '2024-03-11');
        INSERT INTO orders VALUES (6, 6, 350, '2024-03-15');
        INSERT INTO orders VALUES (7, 8, 80, '2024-03-18');
        INSERT INTO orders VALUES (8, 3, 400, '2024-03-09');
        INSERT INTO orders VALUES (9, 10, 250, '2024-03-20');
      `,
      starterCode:
        "SELECT u.campaign,\n       COUNT(DISTINCT u.id) AS acquired_users,\n       -- Users who placed orders?\n       -- Conversion rate?\n       -- Total revenue?\nFROM users u\nLEFT JOIN orders o ON u.id = o.user_id\nWHERE u.campaign IS NOT NULL\nGROUP BY u.campaign\nORDER BY -- Sort by total revenue;",
      expectedQuery:
        "SELECT u.campaign, COUNT(DISTINCT u.id) AS acquired_users, COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) AS paying_users, ROUND(COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) * 100.0 / COUNT(DISTINCT u.id), 1) AS conversion_rate, COALESCE(SUM(o.amount), 0) AS total_revenue FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.campaign IS NOT NULL GROUP BY u.campaign ORDER BY total_revenue DESC;",
      hints: [
        'COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) counts distinct users who placed orders',
        'LEFT JOIN ensures users who never ordered are still counted in acquired users',
        'COALESCE(SUM(o.amount), 0) handles the case where a campaign has zero orders',
      ],
      explanation:
        'This question combines LEFT JOIN, conditional aggregation, and business metric calculation. LEFT JOIN ensures users without orders are still counted toward acquired users. COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) is an elegant technique: it only counts distinct users who have orders. Conversion rate = paying users / total acquired users. This type of marketing performance report is a core task in Growth and Marketing Analytics.',
      frameworkTip:
        'Marketing performance analysis pattern: LEFT JOIN to retain all users -> conditional aggregation to distinguish converted/non-converted -> calculate conversion rate and ROI. LEFT JOIN is the key — do not use INNER JOIN.',
    },
  ],
};
