// ── World 23 額外挑戰（靈感來自 LeetCode SQL 50）──────────────────
// 這些挑戰會被 append 到 World 23 對應的 quest 中

export const w23Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-2: SELECT / FROM / WHERE 深入 — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '23-2': [
    {
      id: 4,
      name: '多布林條件篩選',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '永續商品標記篩選',
        narrative:
          '你在一家大型零售商的資料團隊工作。公司最近推動「永續商品」計畫，產品表中有兩個標記欄位：is_recyclable（可回收包裝）和 is_low_carbon（低碳製程）。行銷團隊想找出同時符合兩個標準的商品來做綠色專區推薦。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, is_recyclable INTEGER, is_low_carbon INTEGER)',
      },
      question:
        '找出 is_recyclable = 1 且 is_low_carbon = 1 的商品，顯示 name、category、price。',
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
        "SELECT name, category, price\nFROM products\nWHERE -- 兩個布林條件;",
      expectedQuery:
        "SELECT name, category, price FROM products WHERE is_recyclable = 1 AND is_low_carbon = 1;",
      hints: [
        'SQLite 中布林值用 0 和 1 表示',
        '兩個條件同時成立用 AND 連接',
      ],
      explanation:
        'SQLite 沒有原生的 BOOLEAN 型別，通常用 INTEGER 的 0（false）和 1（true）來表示。篩選時直接用 = 1 判斷即可。這題的關鍵在於同時套用兩個布林條件，AND 確保兩者都必須成立。',
      frameworkTip:
        '遇到多個布林欄位的篩選，先確認每個欄位的含義和取值範圍（0/1 還是 TRUE/FALSE），再組合條件。面試時記得說明你對資料欄位的理解。',
    },
    {
      id: 5,
      name: 'NULL 值處理',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '會員推薦人分析',
        narrative:
          '會員系統記錄了每位會員的推薦人（referrer_id）。行銷團隊想找出「不是由 VIP 會員（ID = 2）推薦的會員」來做不同的行銷策略。注意：有些會員是自然註冊的，沒有推薦人（referrer_id 為 NULL）。\n\n資料表結構：members (id INTEGER, name TEXT, referrer_id INTEGER)',
      },
      question:
        "找出 referrer_id 不是 2 的會員（包含沒有推薦人的），顯示 name。",
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
        "SELECT name\nFROM members\nWHERE -- 注意 NULL 的處理;",
      expectedQuery:
        "SELECT name FROM members WHERE referrer_id != 2 OR referrer_id IS NULL;",
      hints: [
        'NULL != 2 的結果不是 TRUE，而是 NULL（未知）',
        'NULL 值需要用 IS NULL 來判斷',
        '用 OR 把兩種情況都包含進來',
      ],
      explanation:
        '這題的陷阱在於 NULL 的三值邏輯。在 SQL 中，NULL != 2 的結果是 NULL（不是 TRUE），所以 WHERE referrer_id != 2 會自動排除 NULL 的行。要包含沒有推薦人的會員，必須加上 OR referrer_id IS NULL。這是 SQL 中最常見的 bug 之一。',
      frameworkTip:
        'NULL 處理是面試高頻考點。記住三個原則：(1) NULL 參與任何比較運算結果都是 NULL，(2) 判斷 NULL 只能用 IS NULL / IS NOT NULL，(3) WHERE 只保留結果為 TRUE 的行。',
    },
    {
      id: 6,
      name: 'OR 多條件篩選',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '國際市場篩選',
        narrative:
          '你在一家跨國顧問公司工作，團隊正在分析各國市場機會。他們定義「大型市場」為：面積超過 300 萬平方公里，或者人口超過 2500 萬。請從國家資料表中找出符合條件的市場。\n\n資料表結構：countries (id INTEGER, name TEXT, continent TEXT, area_sq_km REAL, population INTEGER, gdp_usd REAL)',
      },
      question:
        '找出 area_sq_km > 3000000 或 population > 25000000 的國家，顯示 name、area_sq_km、population。',
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
        "SELECT name, area_sq_km, population\nFROM countries\nWHERE -- 面積或人口條件;",
      expectedQuery:
        "SELECT name, area_sq_km, population FROM countries WHERE area_sq_km > 3000000 OR population > 25000000;",
      hints: [
        'OR 表示「任一條件成立即可」',
        '數值比較不需要加引號',
      ],
      explanation:
        'OR 運算子只需要任一邊的條件成立就會包含該行。例如 Taiwan 人口不超過 2500 萬、面積也不超過 300 萬，所以不符合；而 Japan 雖然面積不到 300 萬，但人口超過 2500 萬，所以符合。OR 和 AND 的差別是面試時最基礎的邏輯考點。',
      frameworkTip:
        '面試時遇到「A 或 B」的需求就用 OR，「A 且 B」就用 AND。如果 AND 和 OR 混用，一定要用括號明確分組。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-3: 排序與進階篩選 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '23-3': [
    {
      id: 4,
      name: '日期範圍與計數',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '近 30 天活躍用戶統計',
        narrative:
          '產品團隊想了解最近 30 天的日活躍用戶數（DAU 趨勢）。活動紀錄表中記錄了每位用戶的操作，同一天同一個用戶可能有多筆紀錄。你需要按日期統計不重複的活躍用戶數。\n\n資料表結構：user_activity (id INTEGER, user_id INTEGER, activity_type TEXT, activity_date TEXT)',
      },
      question:
        "統計 2024-03-01 到 2024-03-31 之間每天的不重複活躍用戶數（別名 active_users），按 activity_date 排序。",
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
        "SELECT activity_date,\n       -- 不重複用戶數\nFROM user_activity\nWHERE -- 日期範圍\nGROUP BY activity_date\nORDER BY activity_date;",
      expectedQuery:
        "SELECT activity_date, COUNT(DISTINCT user_id) AS active_users FROM user_activity WHERE activity_date BETWEEN '2024-03-01' AND '2024-03-31' GROUP BY activity_date ORDER BY activity_date;",
      hints: [
        'COUNT(DISTINCT column) 可以計算不重複的值',
        'BETWEEN 用來篩選日期範圍',
        '同一天同一用戶有多筆紀錄，要用 DISTINCT 去重',
      ],
      explanation:
        'COUNT(DISTINCT user_id) 是這題的關鍵 — 它只計算不重複的 user_id。沒有 DISTINCT 的話，同一天同一個用戶的多次操作會被重複計算，導致活躍用戶數膨脹。這是計算 DAU（Daily Active Users）最基本的寫法。',
      frameworkTip:
        '面試提到 DAU/MAU 指標時，一定要強調使用 COUNT(DISTINCT user_id) 而不是 COUNT(*)。這展示你理解產品指標的定義。',
    },
    {
      id: 5,
      name: 'HAVING 篩選分組結果',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '熱門課程篩選',
        narrative:
          '線上學習平台想找出「熱門課程」來做首頁推薦。定義為：選修學生數達到 5 人以上的課程。選課紀錄表中一個學生選一門課就是一筆紀錄。\n\n資料表結構：enrollments (id INTEGER, student_id INTEGER, course_name TEXT, enroll_date TEXT)',
      },
      question:
        '找出選修人數 >= 5 的課程名稱（course_name）和學生數（student_count），按 student_count 降序排列。',
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
        "SELECT course_name,\n       COUNT(*) AS student_count\nFROM enrollments\nGROUP BY course_name\n-- 篩選人數條件\nORDER BY student_count DESC;",
      expectedQuery:
        "SELECT course_name, COUNT(*) AS student_count FROM enrollments GROUP BY course_name HAVING COUNT(*) >= 5 ORDER BY student_count DESC;",
      hints: [
        'HAVING 用來篩選 GROUP BY 之後的結果',
        'HAVING 中要用聚合函數 COUNT(*)，不能用別名',
        '>= 5 表示「大於或等於 5」',
      ],
      explanation:
        'GROUP BY course_name 把選課紀錄按課程分組，COUNT(*) 計算每組的紀錄數（即學生數）。HAVING COUNT(*) >= 5 只保留學生數 >= 5 的課程。注意不能用 WHERE 來篩選聚合結果 — WHERE 在 GROUP BY 之前執行，只能篩選原始資料行。',
      frameworkTip:
        'WHERE vs HAVING 的區分：WHERE 篩選「原始行」（GROUP BY 之前），HAVING 篩選「分組結果」（GROUP BY 之後）。面試時一句話講清楚就好。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-4: 聚合函數深入 — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '23-4': [
    {
      id: 4,
      name: '加權平均計算',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '商品加權平均售價',
        narrative:
          '電商平台的商品價格會隨促銷活動變動。價格紀錄表記錄了每個時段的售價和該時段的銷售數量。財務團隊需要算出每個商品的「加權平均售價」（按銷售數量加權），而不是簡單平均。\n\n資料表結構：price_log (id INTEGER, product_id INTEGER, product_name TEXT, unit_price REAL, units_sold INTEGER, period TEXT)',
      },
      question:
        '計算每個商品的加權平均售價（別名 weighted_avg_price）：SUM(unit_price * units_sold) / SUM(units_sold)，顯示 product_name 和 weighted_avg_price，按 product_name 排序。結果四捨五入到小數點後兩位。',
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
        "SELECT product_name,\n       ROUND(-- 加權平均公式, 2) AS weighted_avg_price\nFROM price_log\nGROUP BY product_name\nORDER BY product_name;",
      expectedQuery:
        "SELECT product_name, ROUND(SUM(unit_price * units_sold) * 1.0 / SUM(units_sold), 2) AS weighted_avg_price FROM price_log GROUP BY product_name ORDER BY product_name;",
      hints: [
        '加權平均 = 總金額 / 總數量 = SUM(price * qty) / SUM(qty)',
        '用 ROUND(value, 2) 四捨五入到小數點後兩位',
        '乘以 1.0 確保浮點數除法（避免整數除法截斷）',
      ],
      explanation:
        '加權平均跟簡單平均（AVG）不同：它考慮了每個價格對應的銷售量。公式是 SUM(unit_price * units_sold) / SUM(units_sold)。例如，如果一個商品在促銷月賣了 120 件、正常價只賣 50 件，促銷價對平均價的影響就應該更大。這在財務分析中非常常見。',
      frameworkTip:
        '面試時如果被問到「平均」，先確認是簡單平均還是加權平均。主動提出這個區別會讓面試官知道你懂業務邏輯。',
    },
    {
      id: 5,
      name: '多維度分組統計',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '月度交易分析報表',
        narrative:
          '風控團隊需要一份月度交易報表：按月份和國家分組，統計每組的交易總數、核准交易數、交易總金額、核准交易金額。這份報表用來偵測異常交易模式。\n\n資料表結構：transactions (id INTEGER, country TEXT, status TEXT, amount REAL, trans_date TEXT)',
      },
      question:
        "按 SUBSTR(trans_date,1,7)（別名 month）和 country 分組，統計：交易總數（trans_count）、核准交易數（approved_count，status='approved'）、交易總金額（trans_total）、核准交易金額（approved_total）。按 month、country 排序。",
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
        "SELECT SUBSTR(trans_date, 1, 7) AS month,\n       country,\n       COUNT(*) AS trans_count,\n       -- 核准交易數\n       SUM(amount) AS trans_total\n       -- 核准交易金額\nFROM transactions\nGROUP BY month, country\nORDER BY month, country;",
      expectedQuery:
        "SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total, SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) AS approved_total FROM transactions GROUP BY month, country ORDER BY month, country;",
      hints: [
        '用 CASE WHEN 在聚合函數裡做條件計算',
        "SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 計算核准數",
        "SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) 計算核准金額",
      ],
      explanation:
        "這題的核心技巧是「條件聚合」（Conditional Aggregation）：在 SUM 裡面放 CASE WHEN，根據條件決定加什麼值。SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 相當於只計算 status 為 approved 的行數。這比用子查詢或多次 JOIN 更簡潔高效。",
      frameworkTip:
        'CASE WHEN 搭配聚合函數是面試中級題的必備技巧。它讓你在一次查詢中同時計算多個條件的指標，避免寫多個子查詢。',
    },
    {
      id: 6,
      name: '用戶留存率計算',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '新用戶次日留存率',
        narrative:
          '產品團隊想知道「新用戶次日留存率」：在所有用戶中，有多少比例的人在首次登入的隔天也有登入？這是衡量產品黏性的核心指標。\n\n資料表結構：logins (id INTEGER, player_id INTEGER, login_date TEXT)\n\n提示：先找到每個用戶的首次登入日期，再看隔天有沒有登入紀錄。',
      },
      question:
        '計算次日留存率（別名 day1_retention）：在首次登入隔天也有登入的用戶數 / 總用戶數。結果用 ROUND 四捨五入到小數點後兩位。',
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
        "-- 提示：用子查詢找出每個用戶的首次登入日期\n-- 再用 JOIN 或 EXISTS 檢查隔天是否有登入\nSELECT ROUND(\n  -- 次日有登入的用戶數 * 1.0 / 總用戶數\n, 2) AS day1_retention;",
      expectedQuery:
        "SELECT ROUND(SUM(CASE WHEN l2.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id), 2) AS day1_retention FROM (SELECT player_id, MIN(login_date) AS first_login FROM logins GROUP BY player_id) f LEFT JOIN logins l2 ON f.player_id = l2.player_id AND l2.login_date = DATE(f.first_login, '+1 day');",
      hints: [
        '用 MIN(login_date) 搭配 GROUP BY player_id 找首次登入日期',
        "SQLite 的日期加一天：DATE(date_string, '+1 day')",
        '用 LEFT JOIN 保留所有用戶，隔天沒登入的會是 NULL',
        '用 SUM(CASE WHEN ... IS NOT NULL ...) 計算次日有登入的人數',
      ],
      explanation:
        "這題分三步：(1) 子查詢找每個用戶的首次登入日期 MIN(login_date)，(2) LEFT JOIN 回 logins 表，條件是同一用戶且日期是首次登入 +1 天，(3) 計算比例：有匹配到的用戶數 / 總用戶數。DATE(date, '+1 day') 是 SQLite 的日期加減語法。這是產品分析中非常經典的留存率計算方式。",
      frameworkTip:
        '留存率是產品面試必考指標。公式是「特定時段後仍活躍的用戶 / 初始用戶」。面試時先說公式，再轉成 SQL，展示你從業務到技術的轉化能力。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 23-5: 字串與日期處理 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '23-5': [
    {
      id: 3,
      name: '字串大小寫修正',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '使用者姓名格式統一',
        narrative:
          '客服團隊發現系統中的使用者姓名格式不一致：有人全大寫、有人全小寫、有人大小寫混亂。他們需要把所有姓名統一成「首字母大寫、其餘小寫」的格式（Proper Case），方便製作郵寄標籤和正式文件。\n\n資料表結構：users (id INTEGER, name TEXT, email TEXT)',
      },
      question:
        "將每位使用者的 name 轉換為 Proper Case（首字母大寫、其餘小寫），別名 formatted_name。顯示 id 和 formatted_name，按 id 排序。\n\n提示：用 UPPER + SUBSTR 取首字母，LOWER + SUBSTR 取其餘部分，再用 || 串接。",
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
        "SELECT id,\n       -- 首字母大寫 || 其餘小寫 AS formatted_name\nFROM users\nORDER BY id;",
      expectedQuery:
        "SELECT id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) AS formatted_name FROM users ORDER BY id;",
      hints: [
        'SUBSTR(name, 1, 1) 取第一個字元',
        'SUBSTR(name, 2) 取第二個字元到結尾（省略長度參數）',
        'UPPER() 轉大寫，LOWER() 轉小寫',
        '|| 是 SQLite 的字串串接運算子',
      ],
      explanation:
        'SQLite 沒有內建的 INITCAP 或 Proper Case 函數，所以要手動組合：UPPER(SUBSTR(name, 1, 1)) 把首字母轉大寫，LOWER(SUBSTR(name, 2)) 把剩餘部分轉小寫，|| 串接兩段。這是一個很實用的字串處理技巧。',
      frameworkTip:
        '字串處理面試題常考 SUBSTR + UPPER/LOWER 的組合。記住 SUBSTR 的參數順序：(字串, 起始位置, 長度)，省略長度代表取到結尾。',
    },
    {
      id: 4,
      name: '分組串接',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '每日熱銷商品清單',
        narrative:
          '營運團隊每天要看「當天賣出了哪些商品」的彙整報表。他們希望每天一行，把所有賣出的商品名稱用逗號串在一起，而且不要重複、按字母排序。\n\n資料表結構：daily_sales (id INTEGER, product_name TEXT, sale_date TEXT, quantity INTEGER)',
      },
      question:
        '按 sale_date 分組，把每天賣出的不重複商品名稱按字母排序後用「, 」串接（別名 products），同時顯示不重複商品數（別名 product_count）。按 sale_date 排序。',
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
        "SELECT sale_date,\n       -- 串接商品名稱\n       -- 商品數\nFROM daily_sales\nGROUP BY sale_date\nORDER BY sale_date;",
      expectedQuery:
        "SELECT sale_date, GROUP_CONCAT(DISTINCT product_name) AS products, COUNT(DISTINCT product_name) AS product_count FROM daily_sales GROUP BY sale_date ORDER BY sale_date;",
      hints: [
        'GROUP_CONCAT() 可以把多行的值串接成一個字串',
        'GROUP_CONCAT(DISTINCT column) 自動去除重複值',
        'COUNT(DISTINCT column) 計算不重複值的數量',
      ],
      explanation:
        'GROUP_CONCAT 是 SQLite 的聚合函數，它把同組內的多個值串接成一個字串。加上 DISTINCT 可以去除重複值。預設分隔符是逗號。搭配 COUNT(DISTINCT product_name) 可以同時知道每天有幾種不重複商品。這在製作彙整報表時非常實用。',
      frameworkTip:
        'GROUP_CONCAT 是 SQLite/MySQL 的函數，PostgreSQL 用 STRING_AGG，SQL Server 用 STRING_AGG 或 FOR XML PATH。面試時可以提一下跨資料庫差異，展示你的廣度。',
    },
  ],
};
