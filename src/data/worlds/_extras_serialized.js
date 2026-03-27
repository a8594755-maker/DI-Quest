// Extra challenges to merge
// Quest 23-2 (3 extra)
        {
          id: 4,
          name: "多布林條件篩選",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "永續商品標記篩選",
            narrative: "你在一家大型零售商的資料團隊工作。公司最近推動「永續商品」計畫，產品表中有兩個標記欄位：is_recyclable（可回收包裝）和 is_low_carbon（低碳製程）。行銷團隊想找出同時符合兩個標準的商品來做綠色專區推薦。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, is_recyclable INTEGER, is_low_carbon INTEGER)",
          },
          question: "找出 is_recyclable = 1 且 is_low_carbon = 1 的商品，顯示 name、category、price。",
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
          starterCode: "SELECT name, category, price\nFROM products\nWHERE -- 兩個布林條件;",
          expectedQuery: "SELECT name, category, price FROM products WHERE is_recyclable = 1 AND is_low_carbon = 1;",
          hints: ["SQLite 中布林值用 0 和 1 表示","兩個條件同時成立用 AND 連接"],
          explanation: "SQLite 沒有原生的 BOOLEAN 型別，通常用 INTEGER 的 0（false）和 1（true）來表示。篩選時直接用 = 1 判斷即可。這題的關鍵在於同時套用兩個布林條件，AND 確保兩者都必須成立。",
          frameworkTip: "遇到多個布林欄位的篩選，先確認每個欄位的含義和取值範圍（0/1 還是 TRUE/FALSE），再組合條件。面試時記得說明你對資料欄位的理解。",
        },
        {
          id: 5,
          name: "NULL 值處理",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "會員推薦人分析",
            narrative: "會員系統記錄了每位會員的推薦人（referrer_id）。行銷團隊想找出「不是由 VIP 會員（ID = 2）推薦的會員」來做不同的行銷策略。注意：有些會員是自然註冊的，沒有推薦人（referrer_id 為 NULL）。\n\n資料表結構：members (id INTEGER, name TEXT, referrer_id INTEGER)",
          },
          question: "找出 referrer_id 不是 2 的會員（包含沒有推薦人的），顯示 name。",
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
          starterCode: "SELECT name\nFROM members\nWHERE -- 注意 NULL 的處理;",
          expectedQuery: "SELECT name FROM members WHERE referrer_id != 2 OR referrer_id IS NULL;",
          hints: ["NULL != 2 的結果不是 TRUE，而是 NULL（未知）","NULL 值需要用 IS NULL 來判斷","用 OR 把兩種情況都包含進來"],
          explanation: "這題的陷阱在於 NULL 的三值邏輯。在 SQL 中，NULL != 2 的結果是 NULL（不是 TRUE），所以 WHERE referrer_id != 2 會自動排除 NULL 的行。要包含沒有推薦人的會員，必須加上 OR referrer_id IS NULL。這是 SQL 中最常見的 bug 之一。",
          frameworkTip: "NULL 處理是面試高頻考點。記住三個原則：(1) NULL 參與任何比較運算結果都是 NULL，(2) 判斷 NULL 只能用 IS NULL / IS NOT NULL，(3) WHERE 只保留結果為 TRUE 的行。",
        },
        {
          id: 6,
          name: "OR 多條件篩選",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "國際市場篩選",
            narrative: "你在一家跨國顧問公司工作，團隊正在分析各國市場機會。他們定義「大型市場」為：面積超過 300 萬平方公里，或者人口超過 2500 萬。請從國家資料表中找出符合條件的市場。\n\n資料表結構：countries (id INTEGER, name TEXT, continent TEXT, area_sq_km REAL, population INTEGER, gdp_usd REAL)",
          },
          question: "找出 area_sq_km > 3000000 或 population > 25000000 的國家，顯示 name、area_sq_km、population。",
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
          starterCode: "SELECT name, area_sq_km, population\nFROM countries\nWHERE -- 面積或人口條件;",
          expectedQuery: "SELECT name, area_sq_km, population FROM countries WHERE area_sq_km > 3000000 OR population > 25000000;",
          hints: ["OR 表示「任一條件成立即可」","數值比較不需要加引號"],
          explanation: "OR 運算子只需要任一邊的條件成立就會包含該行。例如 Taiwan 人口不超過 2500 萬、面積也不超過 300 萬，所以不符合；而 Japan 雖然面積不到 300 萬，但人口超過 2500 萬，所以符合。OR 和 AND 的差別是面試時最基礎的邏輯考點。",
          frameworkTip: "面試時遇到「A 或 B」的需求就用 OR，「A 且 B」就用 AND。如果 AND 和 OR 混用，一定要用括號明確分組。",
        },

// Quest 23-3 (2 extra)
        {
          id: 4,
          name: "日期範圍與計數",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "近 30 天活躍用戶統計",
            narrative: "產品團隊想了解最近 30 天的日活躍用戶數（DAU 趨勢）。活動紀錄表中記錄了每位用戶的操作，同一天同一個用戶可能有多筆紀錄。你需要按日期統計不重複的活躍用戶數。\n\n資料表結構：user_activity (id INTEGER, user_id INTEGER, activity_type TEXT, activity_date TEXT)",
          },
          question: "統計 2024-03-01 到 2024-03-31 之間每天的不重複活躍用戶數（別名 active_users），按 activity_date 排序。",
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
          starterCode: "SELECT activity_date,\n       -- 不重複用戶數\nFROM user_activity\nWHERE -- 日期範圍\nGROUP BY activity_date\nORDER BY activity_date;",
          expectedQuery: "SELECT activity_date, COUNT(DISTINCT user_id) AS active_users FROM user_activity WHERE activity_date BETWEEN '2024-03-01' AND '2024-03-31' GROUP BY activity_date ORDER BY activity_date;",
          hints: ["COUNT(DISTINCT column) 可以計算不重複的值","BETWEEN 用來篩選日期範圍","同一天同一用戶有多筆紀錄，要用 DISTINCT 去重"],
          explanation: "COUNT(DISTINCT user_id) 是這題的關鍵 — 它只計算不重複的 user_id。沒有 DISTINCT 的話，同一天同一個用戶的多次操作會被重複計算，導致活躍用戶數膨脹。這是計算 DAU（Daily Active Users）最基本的寫法。",
          frameworkTip: "面試提到 DAU/MAU 指標時，一定要強調使用 COUNT(DISTINCT user_id) 而不是 COUNT(*)。這展示你理解產品指標的定義。",
        },
        {
          id: 5,
          name: "HAVING 篩選分組結果",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "熱門課程篩選",
            narrative: "線上學習平台想找出「熱門課程」來做首頁推薦。定義為：選修學生數達到 5 人以上的課程。選課紀錄表中一個學生選一門課就是一筆紀錄。\n\n資料表結構：enrollments (id INTEGER, student_id INTEGER, course_name TEXT, enroll_date TEXT)",
          },
          question: "找出選修人數 >= 5 的課程名稱（course_name）和學生數（student_count），按 student_count 降序排列。",
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
          starterCode: "SELECT course_name,\n       COUNT(*) AS student_count\nFROM enrollments\nGROUP BY course_name\n-- 篩選人數條件\nORDER BY student_count DESC;",
          expectedQuery: "SELECT course_name, COUNT(*) AS student_count FROM enrollments GROUP BY course_name HAVING COUNT(*) >= 5 ORDER BY student_count DESC;",
          hints: ["HAVING 用來篩選 GROUP BY 之後的結果","HAVING 中要用聚合函數 COUNT(*)，不能用別名",">= 5 表示「大於或等於 5」"],
          explanation: "GROUP BY course_name 把選課紀錄按課程分組，COUNT(*) 計算每組的紀錄數（即學生數）。HAVING COUNT(*) >= 5 只保留學生數 >= 5 的課程。注意不能用 WHERE 來篩選聚合結果 — WHERE 在 GROUP BY 之前執行，只能篩選原始資料行。",
          frameworkTip: "WHERE vs HAVING 的區分：WHERE 篩選「原始行」（GROUP BY 之前），HAVING 篩選「分組結果」（GROUP BY 之後）。面試時一句話講清楚就好。",
        },

// Quest 23-4 (3 extra)
        {
          id: 4,
          name: "加權平均計算",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "商品加權平均售價",
            narrative: "電商平台的商品價格會隨促銷活動變動。價格紀錄表記錄了每個時段的售價和該時段的銷售數量。財務團隊需要算出每個商品的「加權平均售價」（按銷售數量加權），而不是簡單平均。\n\n資料表結構：price_log (id INTEGER, product_id INTEGER, product_name TEXT, unit_price REAL, units_sold INTEGER, period TEXT)",
          },
          question: "計算每個商品的加權平均售價（別名 weighted_avg_price）：SUM(unit_price * units_sold) / SUM(units_sold)，顯示 product_name 和 weighted_avg_price，按 product_name 排序。結果四捨五入到小數點後兩位。",
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
          starterCode: "SELECT product_name,\n       ROUND(-- 加權平均公式, 2) AS weighted_avg_price\nFROM price_log\nGROUP BY product_name\nORDER BY product_name;",
          expectedQuery: "SELECT product_name, ROUND(SUM(unit_price * units_sold) * 1.0 / SUM(units_sold), 2) AS weighted_avg_price FROM price_log GROUP BY product_name ORDER BY product_name;",
          hints: ["加權平均 = 總金額 / 總數量 = SUM(price * qty) / SUM(qty)","用 ROUND(value, 2) 四捨五入到小數點後兩位","乘以 1.0 確保浮點數除法（避免整數除法截斷）"],
          explanation: "加權平均跟簡單平均（AVG）不同：它考慮了每個價格對應的銷售量。公式是 SUM(unit_price * units_sold) / SUM(units_sold)。例如，如果一個商品在促銷月賣了 120 件、正常價只賣 50 件，促銷價對平均價的影響就應該更大。這在財務分析中非常常見。",
          frameworkTip: "面試時如果被問到「平均」，先確認是簡單平均還是加權平均。主動提出這個區別會讓面試官知道你懂業務邏輯。",
        },
        {
          id: 5,
          name: "多維度分組統計",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "月度交易分析報表",
            narrative: "風控團隊需要一份月度交易報表：按月份和國家分組，統計每組的交易總數、核准交易數、交易總金額、核准交易金額。這份報表用來偵測異常交易模式。\n\n資料表結構：transactions (id INTEGER, country TEXT, status TEXT, amount REAL, trans_date TEXT)",
          },
          question: "按 SUBSTR(trans_date,1,7)（別名 month）和 country 分組，統計：交易總數（trans_count）、核准交易數（approved_count，status='approved'）、交易總金額（trans_total）、核准交易金額（approved_total）。按 month、country 排序。",
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
          starterCode: "SELECT SUBSTR(trans_date, 1, 7) AS month,\n       country,\n       COUNT(*) AS trans_count,\n       -- 核准交易數\n       SUM(amount) AS trans_total\n       -- 核准交易金額\nFROM transactions\nGROUP BY month, country\nORDER BY month, country;",
          expectedQuery: "SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total, SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) AS approved_total FROM transactions GROUP BY month, country ORDER BY month, country;",
          hints: ["用 CASE WHEN 在聚合函數裡做條件計算","SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 計算核准數","SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) 計算核准金額"],
          explanation: "這題的核心技巧是「條件聚合」（Conditional Aggregation）：在 SUM 裡面放 CASE WHEN，根據條件決定加什麼值。SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 相當於只計算 status 為 approved 的行數。這比用子查詢或多次 JOIN 更簡潔高效。",
          frameworkTip: "CASE WHEN 搭配聚合函數是面試中級題的必備技巧。它讓你在一次查詢中同時計算多個條件的指標，避免寫多個子查詢。",
        },
        {
          id: 6,
          name: "用戶留存率計算",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "新用戶次日留存率",
            narrative: "產品團隊想知道「新用戶次日留存率」：在所有用戶中，有多少比例的人在首次登入的隔天也有登入？這是衡量產品黏性的核心指標。\n\n資料表結構：logins (id INTEGER, player_id INTEGER, login_date TEXT)\n\n提示：先找到每個用戶的首次登入日期，再看隔天有沒有登入紀錄。",
          },
          question: "計算次日留存率（別名 day1_retention）：在首次登入隔天也有登入的用戶數 / 總用戶數。結果用 ROUND 四捨五入到小數點後兩位。",
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
          starterCode: "-- 提示：用子查詢找出每個用戶的首次登入日期\n-- 再用 JOIN 或 EXISTS 檢查隔天是否有登入\nSELECT ROUND(\n  -- 次日有登入的用戶數 * 1.0 / 總用戶數\n, 2) AS day1_retention;",
          expectedQuery: "SELECT ROUND(SUM(CASE WHEN l2.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id), 2) AS day1_retention FROM (SELECT player_id, MIN(login_date) AS first_login FROM logins GROUP BY player_id) f LEFT JOIN logins l2 ON f.player_id = l2.player_id AND l2.login_date = DATE(f.first_login, '+1 day');",
          hints: ["用 MIN(login_date) 搭配 GROUP BY player_id 找首次登入日期","SQLite 的日期加一天：DATE(date_string, '+1 day')","用 LEFT JOIN 保留所有用戶，隔天沒登入的會是 NULL","用 SUM(CASE WHEN ... IS NOT NULL ...) 計算次日有登入的人數"],
          explanation: "這題分三步：(1) 子查詢找每個用戶的首次登入日期 MIN(login_date)，(2) LEFT JOIN 回 logins 表，條件是同一用戶且日期是首次登入 +1 天，(3) 計算比例：有匹配到的用戶數 / 總用戶數。DATE(date, '+1 day') 是 SQLite 的日期加減語法。這是產品分析中非常經典的留存率計算方式。",
          frameworkTip: "留存率是產品面試必考指標。公式是「特定時段後仍活躍的用戶 / 初始用戶」。面試時先說公式，再轉成 SQL，展示你從業務到技術的轉化能力。",
        },

// Quest 23-5 (2 extra)
        {
          id: 3,
          name: "字串大小寫修正",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "使用者姓名格式統一",
            narrative: "客服團隊發現系統中的使用者姓名格式不一致：有人全大寫、有人全小寫、有人大小寫混亂。他們需要把所有姓名統一成「首字母大寫、其餘小寫」的格式（Proper Case），方便製作郵寄標籤和正式文件。\n\n資料表結構：users (id INTEGER, name TEXT, email TEXT)",
          },
          question: "將每位使用者的 name 轉換為 Proper Case（首字母大寫、其餘小寫），別名 formatted_name。顯示 id 和 formatted_name，按 id 排序。\n\n提示：用 UPPER + SUBSTR 取首字母，LOWER + SUBSTR 取其餘部分，再用 || 串接。",
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
          starterCode: "SELECT id,\n       -- 首字母大寫 || 其餘小寫 AS formatted_name\nFROM users\nORDER BY id;",
          expectedQuery: "SELECT id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) AS formatted_name FROM users ORDER BY id;",
          hints: ["SUBSTR(name, 1, 1) 取第一個字元","SUBSTR(name, 2) 取第二個字元到結尾（省略長度參數）","UPPER() 轉大寫，LOWER() 轉小寫","|| 是 SQLite 的字串串接運算子"],
          explanation: "SQLite 沒有內建的 INITCAP 或 Proper Case 函數，所以要手動組合：UPPER(SUBSTR(name, 1, 1)) 把首字母轉大寫，LOWER(SUBSTR(name, 2)) 把剩餘部分轉小寫，|| 串接兩段。這是一個很實用的字串處理技巧。",
          frameworkTip: "字串處理面試題常考 SUBSTR + UPPER/LOWER 的組合。記住 SUBSTR 的參數順序：(字串, 起始位置, 長度)，省略長度代表取到結尾。",
        },
        {
          id: 4,
          name: "分組串接",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "每日熱銷商品清單",
            narrative: "營運團隊每天要看「當天賣出了哪些商品」的彙整報表。他們希望每天一行，把所有賣出的商品名稱用逗號串在一起，而且不要重複、按字母排序。\n\n資料表結構：daily_sales (id INTEGER, product_name TEXT, sale_date TEXT, quantity INTEGER)",
          },
          question: "按 sale_date 分組，把每天賣出的不重複商品名稱按字母排序後用「, 」串接（別名 products），同時顯示不重複商品數（別名 product_count）。按 sale_date 排序。",
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
          starterCode: "SELECT sale_date,\n       -- 串接商品名稱\n       -- 商品數\nFROM daily_sales\nGROUP BY sale_date\nORDER BY sale_date;",
          expectedQuery: "SELECT sale_date, GROUP_CONCAT(DISTINCT product_name) AS products, COUNT(DISTINCT product_name) AS product_count FROM daily_sales GROUP BY sale_date ORDER BY sale_date;",
          hints: ["GROUP_CONCAT() 可以把多行的值串接成一個字串","GROUP_CONCAT(DISTINCT column) 自動去除重複值","COUNT(DISTINCT column) 計算不重複值的數量"],
          explanation: "GROUP_CONCAT 是 SQLite 的聚合函數，它把同組內的多個值串接成一個字串。加上 DISTINCT 可以去除重複值。預設分隔符是逗號。搭配 COUNT(DISTINCT product_name) 可以同時知道每天有幾種不重複商品。這在製作彙整報表時非常實用。",
          frameworkTip: "GROUP_CONCAT 是 SQLite/MySQL 的函數，PostgreSQL 用 STRING_AGG，SQL Server 用 STRING_AGG 或 FOR XML PATH。面試時可以提一下跨資料庫差異，展示你的廣度。",
        },

// Quest 24-1 (3 extra)
        {
          id: 4,
          name: "自連接：績效成長偵測",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "哪些天的業績比前一天高？",
            narrative: "營運主管想知道哪些天的門市業績比前一天成長了。你手上有每日業績記錄表，需要用自連接（Self-Join）找出「當天業績 > 前一天業績」的日期。\n\n資料表：\n- daily_metrics (id INTEGER, record_date TEXT, revenue REAL)",
          },
          question: "寫一段 SQL，找出業績比前一天高的日期，顯示該天的 id、日期和業績。",
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
          starterCode: "SELECT t1.id, t1.record_date, t1.revenue\nFROM daily_metrics t1\n-- 自連接：把今天跟昨天比\nWHERE t1.revenue > -- 昨天的業績\nORDER BY t1.record_date;",
          expectedQuery: "SELECT t1.id, t1.record_date, t1.revenue FROM daily_metrics t1 JOIN daily_metrics t2 ON date(t1.record_date) = date(t2.record_date, '+1 day') WHERE t1.revenue > t2.revenue ORDER BY t1.record_date;",
          hints: ["自連接就是把同一張表 JOIN 自己，用不同的別名（t1, t2）","SQLite 的 date() 函數可以做日期計算：date(record_date, '+1 day') 代表後一天"],
          explanation: "自連接（Self-Join）是把同一張表視為兩張表來比較。這裡 t1 代表「今天」，t2 代表「昨天」，用 date(t1.record_date) = date(t2.record_date, '+1 day') 建立「今天 = 昨天 +1 天」的關聯。接著用 WHERE t1.revenue > t2.revenue 篩出成長的天數。這是經典的「跟前一筆比較」模式，在趨勢分析中很常用。",
          frameworkTip: "自連接的關鍵是想清楚「誰跟誰比」：先定義 t1 是什麼角色、t2 是什麼角色，再用 ON 描述它們的關聯",
        },
        {
          id: 5,
          name: "Cross Join + Left Join 組合",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "員工培訓完成度報表",
            narrative: "HR 主管需要一份報表：每位員工對每門培訓課程的完成狀況。即使某員工沒修某門課，也要在報表中顯示（完成次數為 0）。這需要先用 CROSS JOIN 產生所有組合，再用 LEFT JOIN 帶入實際完成資料。\n\n資料表：\n- employees (id INTEGER, name TEXT)\n- courses (id INTEGER, course_name TEXT)\n- completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT)",
          },
          question: "寫一段 SQL，顯示每位員工對每門課的完成次數。沒修過的課程顯示 0。",
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
          starterCode: "SELECT e.name, c.course_name,\n       -- 怎麼計算完成次數（沒完成的要是 0）？\n       AS completion_count\nFROM employees e\n-- 先產生所有員工 x 課程組合\n-- 再 LEFT JOIN 完成記錄\nGROUP BY e.id, c.id\nORDER BY e.name, c.course_name;",
          expectedQuery: "SELECT e.name, c.course_name, COUNT(comp.id) AS completion_count FROM employees e CROSS JOIN courses c LEFT JOIN completions comp ON e.id = comp.employee_id AND c.id = comp.course_id GROUP BY e.id, c.id ORDER BY e.name, c.course_name;",
          hints: ["CROSS JOIN 會產生兩張表的「全排列組合」（3 員工 x 3 課程 = 9 筆）","LEFT JOIN completions 時要同時匹配 employee_id 和 course_id","COUNT(comp.id) 只會計算非 NULL 的值，所以沒完成的課程會是 0"],
          explanation: "CROSS JOIN + LEFT JOIN 是產生「完整矩陣報表」的經典模式。CROSS JOIN 先建立所有員工與課程的組合（確保每個組合都有一行），LEFT JOIN 再帶入實際的完成記錄。COUNT(comp.id) 只計算有匹配的行，沒有完成的自然是 0。這在實務中非常常用：出勤報表、考試成績、產品 x 地區銷售矩陣等。",
          frameworkTip: "面試遇到「即使沒有資料也要顯示」的需求，想到 CROSS JOIN 建骨架 + LEFT JOIN 填資料，是一個強力的解題模式",
        },
        {
          id: 6,
          name: "LEFT JOIN + 條件聚合",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "用戶驗證成功率分析",
            narrative: "產品團隊在分析用戶身分驗證流程的效果。每位用戶可能發起多次驗證請求，每次結果是 confirmed 或 timeout。PM 想知道每位用戶的「驗證成功率」：confirmed 次數 / 總驗證次數。沒有發起過驗證的用戶，成功率顯示 0.00。\n\n資料表：\n- signups (user_id INTEGER, signup_date TEXT)\n- confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT)\n  action 欄位值為 confirmed 或 timeout",
          },
          question: "寫一段 SQL，計算每位用戶的驗證成功率（保留兩位小數），沒有驗證記錄的用戶顯示 0.00。",
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
          starterCode: "SELECT s.user_id,\n       -- 計算驗證成功率，沒有記錄的顯示 0.00\n       AS confirmation_rate\nFROM signups s\n-- 用什麼 JOIN？\nGROUP BY s.user_id\nORDER BY s.user_id;",
          expectedQuery: "SELECT s.user_id, ROUND(COALESCE(1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(c.id), 0), 0.00), 2) AS confirmation_rate FROM signups s LEFT JOIN confirmations c ON s.user_id = c.user_id GROUP BY s.user_id ORDER BY s.user_id;",
          hints: ["LEFT JOIN 確保沒有驗證記錄的用戶也會出現","SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) 計算成功次數","NULLIF(COUNT(c.id), 0) 避免除以 0，再用 COALESCE 把 NULL 轉成 0.00"],
          explanation: "這題結合了 LEFT JOIN（保留所有用戶）、CASE WHEN（條件計數）、NULLIF（避免除以零）和 COALESCE（處理 NULL）四個技巧。LEFT JOIN 確保沒有驗證記錄的用戶也出現，CASE WHEN 在聚合中做條件計數，NULLIF 避免除以 0 的錯誤，COALESCE 把沒有記錄的用戶設為 0.00。這種「比率計算」模式在轉換率、完成率等分析中非常常見。",
          frameworkTip: "計算比率時的防禦性寫法：COALESCE(成功數 / NULLIF(總數, 0), 0) -- 同時處理「沒有分母」和「分母為零」的情況",
        },

// Quest 24-2 (2 extra)
        {
          id: 4,
          name: "CASE WHEN 數學判斷",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "包裝尺寸可行性檢查",
            narrative: "物流團隊收到一批貨物的三邊尺寸資料，需要判斷哪些貨物可以裝進三角形截面的特殊包裝盒。三角形成立的條件是：任意兩邊之和大於第三邊。你需要幫他們標記每筆貨物的三邊是否能構成三角形。\n\n資料表：\n- packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT)",
          },
          question: "寫一段 SQL，判斷每筆貨物的三邊是否能構成三角形，標記為 Yes 或 No。",
          sampleSchema: `
        CREATE TABLE packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT);
        INSERT INTO packages VALUES (1, 10.0, 15.0, 12.0, '精密儀器 A');
        INSERT INTO packages VALUES (2, 3.0, 4.0, 8.0, '長條零件 B');
        INSERT INTO packages VALUES (3, 7.0, 7.0, 7.0, '立方體零件 C');
        INSERT INTO packages VALUES (4, 1.0, 2.0, 3.0, '薄片零件 D');
        INSERT INTO packages VALUES (5, 5.0, 8.0, 6.0, '標準零件 E');
        INSERT INTO packages VALUES (6, 20.0, 5.0, 10.0, '異形零件 F');
      `,
          starterCode: "SELECT id, item_name, side_a, side_b, side_c,\n       CASE\n         -- 三角形成立條件：任意兩邊之和 > 第三邊\n       END AS is_triangle\nFROM packages\nORDER BY id;",
          expectedQuery: "SELECT id, item_name, side_a, side_b, side_c, CASE WHEN side_a + side_b > side_c AND side_a + side_c > side_b AND side_b + side_c > side_a THEN 'Yes' ELSE 'No' END AS is_triangle FROM packages ORDER BY id;",
          hints: ["三角形成立需要同時滿足三個條件，用 AND 連接","a + b > c 且 a + c > b 且 b + c > a"],
          explanation: "CASE WHEN 不只能做分類，也能做數學判斷。三角形不等式要求三個條件同時成立：任意兩邊之和必須大於第三邊。這裡用 AND 把三個條件串起來，全部為真才標記 Yes。這種「業務規則 -> SQL 條件」的轉換能力在實務中很重要：信用評分規則、庫存預警條件、合規性檢查等都用類似的邏輯。",
          frameworkTip: "把業務規則翻譯成 SQL 條件時，先列出所有需要滿足的條件，再決定是 AND（全部要滿足）還是 OR（任一即可）",
        },
        {
          id: 5,
          name: "CASE WHEN + 子查詢：主要歸屬判斷",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "員工主要部門歸屬",
            narrative: "公司有些員工同時屬於多個部門（跨部門專案），HR 系統有標記哪個是主要部門（primary_flag = Y）。但有些員工只屬於一個部門，這種情況沒有標記 primary_flag。\n\nHR 主管需要一份「每位員工的主要部門」清單：\n- 如果有標記 primary_flag = Y，就用那個部門\n- 如果只屬於一個部門，那就是主要部門\n\n資料表：\n- employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT)",
          },
          question: "寫一段 SQL，找出每位員工的主要部門。",
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
          starterCode: "SELECT employee_id, department\nFROM employee_dept\nWHERE -- 怎麼同時處理「有標記」和「只有一個部門」的情況？\nORDER BY employee_id;",
          expectedQuery: "SELECT employee_id, department FROM employee_dept WHERE primary_flag = 'Y' OR employee_id IN (SELECT employee_id FROM employee_dept GROUP BY employee_id HAVING COUNT(*) = 1) ORDER BY employee_id;",
          hints: ["兩種情況用 OR 串接：有標記的 + 只有一個部門的","用子查詢找出「只屬於一個部門的員工」：GROUP BY employee_id HAVING COUNT(*) = 1"],
          explanation: "這題的關鍵是處理兩種不同的情況：(1) 有明確標記 primary_flag = 'Y' 的員工，直接取該部門 (2) 只屬於一個部門的員工（沒有標記的），用子查詢 HAVING COUNT(*) = 1 找出來。兩個條件用 OR 合併。這種「分情況處理」的邏輯在實務中很常見：不同類型的用戶有不同的判斷規則。",
          frameworkTip: "遇到「多種情況」的題目，先列出所有情況，再逐一寫出對應的 WHERE 條件，最後用 OR / UNION 合併",
        },

// Quest 24-3 (2 extra)
        {
          id: 4,
          name: "子查詢：找第二高的值",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "第二高薪資查詢",
            narrative: "HR 主管想知道公司裡第二高的薪資是多少，用來做薪資分級的參考基準。注意：如果沒有第二高的薪資（例如所有人薪資相同），應該回傳 NULL。\n\n資料表：\n- employees (id INTEGER, name TEXT, salary REAL, department TEXT)",
          },
          question: "寫一段 SQL，查詢第二高的薪資。如果不存在，回傳 NULL。",
          sampleSchema: `
        CREATE TABLE employees (id INTEGER, name TEXT, salary REAL, department TEXT);
        INSERT INTO employees VALUES (1, 'Alice', 85000.00, 'Engineering');
        INSERT INTO employees VALUES (2, 'Bob', 72000.00, 'Marketing');
        INSERT INTO employees VALUES (3, 'Charlie', 85000.00, 'Engineering');
        INSERT INTO employees VALUES (4, 'Diana', 95000.00, 'Product');
        INSERT INTO employees VALUES (5, 'Eve', 68000.00, 'Sales');
        INSERT INTO employees VALUES (6, 'Frank', 72000.00, 'Marketing');
      `,
          starterCode: "SELECT\n  -- 怎麼取得第二高的薪資？\n  -- 如果不存在，要回傳 NULL\n  AS second_highest_salary;",
          expectedQuery: "SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);",
          hints: ["先用子查詢找出最高薪資，再找「小於最高薪資的最大值」","MAX() 如果沒有符合的行，自然會回傳 NULL","注意要用 DISTINCT 的概念：如果最高薪資有多人，第二高不是重複的那個"],
          explanation: "「找第 N 高」是經典的子查詢題目。策略是：先用子查詢找出最高值 (SELECT MAX(salary))，再在外層查詢中找「小於最高值的最大值」。如果所有人薪資相同，WHERE salary < MAX 不會匹配到任何行，MAX() 自然回傳 NULL。這比 LIMIT + OFFSET 的解法更優雅，也更能展示你對子查詢的理解。",
          frameworkTip: "面試中「找第 N 高」的題目，先說排除法（用子查詢排除前 N-1），再提 DENSE_RANK 的 window function 解法作為替代方案",
        },
        {
          id: 5,
          name: "UNION 子查詢：雙維度排行",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "餐廳評價分析報告",
            narrative: "餐飲平台想做一份簡報，需要兩個資訊放在同一份結果中：\n1. 評價數量最多的用戶名稱\n2. 2026 年 2 月平均評分最高的餐廳名稱\n\n兩筆資料用 UNION 合併成一張表。\n\n資料表：\n- users (user_id INTEGER, name TEXT)\n- restaurants (restaurant_id INTEGER, name TEXT)\n- reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT)",
          },
          question: "寫一段 SQL，用 UNION 合併兩個查詢結果：(1) 評價數最多的用戶 (2) 2026-02 月平均評分最高的餐廳。",
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
          starterCode: "-- 第一部分：評價數最多的用戶\nSELECT -- ...\n\nUNION ALL\n\n-- 第二部分：2026-02 月平均評分最高的餐廳\nSELECT -- ...;",
          expectedQuery: "SELECT u.name AS result FROM users u JOIN reviews r ON u.user_id = r.user_id GROUP BY u.user_id ORDER BY COUNT(*) DESC, u.name LIMIT 1 UNION ALL SELECT rest.name AS result FROM restaurants rest JOIN reviews r ON rest.restaurant_id = r.restaurant_id WHERE substr(r.review_date, 1, 7) = '2026-02' GROUP BY rest.restaurant_id ORDER BY AVG(r.rating) DESC, rest.name LIMIT 1;",
          hints: ["UNION ALL 合併兩個 SELECT 結果，要求欄位數量和型態一致","每個子查詢要用 ORDER BY + LIMIT 1 找到「最多/最高」的那一筆","平手時用名字字母排序（ORDER BY name）作為決勝條件"],
          explanation: "UNION ALL 可以把兩個完全不同的查詢結果合併成一張表，前提是欄位數量和型態要一致。這裡第一個查詢找評價最多的用戶，第二個找特定月份平均評分最高的餐廳。每個子查詢各自做 JOIN + GROUP BY + ORDER BY + LIMIT。這種「多維度排行」的需求在產品報告中很常見：同時呈現不同角度的 Top 1。",
          frameworkTip: "UNION 的兩個 SELECT 必須有相同數量和相容型態的欄位。欄位名稱以第一個 SELECT 為準。",
        },

// Quest 24-4 (2 extra)
        {
          id: 3,
          name: "CTE + Window：移動平均",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "7 天移動平均營收",
            narrative: "財務主管想看每天的「7 天移動平均營收」，用來平滑每日的波動，觀察長期趨勢。移動平均的定義是：該天往前算 7 天（含當天）的平均日營收。只顯示有足夠 7 天資料的日期。\n\n資料表：\n- daily_revenue (visit_date TEXT, revenue REAL)",
          },
          question: "寫一段 SQL，用 CTE + Window Function 計算每天的 7 天移動平均營收（保留兩位小數）。",
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
          starterCode: "WITH moving AS (\n  SELECT visit_date, revenue,\n         -- 用 Window Function 計算 7 天移動平均\n         AS avg_7d,\n         ROW_NUMBER() OVER (ORDER BY visit_date) AS rn\n  FROM daily_revenue\n)\nSELECT visit_date, revenue,\n       ROUND(avg_7d, 2) AS moving_avg_7d\nFROM moving\nWHERE rn >= 7\nORDER BY visit_date;",
          expectedQuery: "WITH moving AS (SELECT visit_date, revenue, AVG(revenue) OVER (ORDER BY visit_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg_7d, ROW_NUMBER() OVER (ORDER BY visit_date) AS rn FROM daily_revenue) SELECT visit_date, revenue, ROUND(avg_7d, 2) AS moving_avg_7d FROM moving WHERE rn >= 7 ORDER BY visit_date;",
          hints: ["Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了 7 天的窗口","用 ROW_NUMBER() 編號，WHERE rn >= 7 確保只顯示有完整 7 天資料的日期","AVG() OVER (...) 可以在窗口內計算平均值"],
          explanation: "移動平均是時間序列分析的基礎工具。Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了一個滑動窗口：從前 6 行到當前行（共 7 行）。AVG(revenue) OVER (...) 在這個窗口內算平均。CTE 先計算所有行的移動平均和行號，外層用 WHERE rn >= 7 確保只顯示有完整 7 天資料的結果。這在營運 dashboard 中非常常用。",
          frameworkTip: "ROWS BETWEEN N PRECEDING AND CURRENT ROW 是定義移動窗口的標準寫法。面試中提到「移動平均」時，秀出這個語法會讓人印象深刻",
        },
        {
          id: 4,
          name: "CTE + UNION：雙向關係統計",
          type: "code",
          difficulty: "medium",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "找出最多合作夥伴的員工",
            narrative: "公司有一個「專案配對」系統，記錄了哪些員工曾經一起合作過專案。配對是雙向的：如果 A 跟 B 合作，代表 B 也跟 A 合作。管理層想知道哪位員工的合作夥伴最多（社交網絡最廣）。\n\n資料表：\n- project_pairs (requester_id INTEGER, accepter_id INTEGER)\n  每筆記錄代表 requester 發起合作邀請，accepter 接受",
          },
          question: "寫一段 SQL，找出合作夥伴最多的員工 ID 和合作夥伴數量。",
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
          starterCode: "WITH all_connections AS (\n  -- 把雙向關係攤平成單向\n  -- UNION ALL 把 requester 和 accepter 都列出來\n)\nSELECT employee_id,\n       COUNT(*) AS partner_count\nFROM all_connections\nGROUP BY employee_id\nORDER BY partner_count DESC\nLIMIT 1;",
          expectedQuery: "WITH all_connections AS (SELECT requester_id AS employee_id FROM project_pairs UNION ALL SELECT accepter_id AS employee_id FROM project_pairs) SELECT employee_id, COUNT(*) AS partner_count FROM all_connections GROUP BY employee_id ORDER BY partner_count DESC LIMIT 1;",
          hints: ["雙向關係的處理：把 requester_id 和 accepter_id 分別當作 employee_id，用 UNION ALL 合併","每出現一次就代表有一個合作夥伴，COUNT(*) 就是夥伴數量","ORDER BY ... DESC LIMIT 1 找到最多的那位"],
          explanation: "雙向關係（如友誼、合作）在資料庫中通常只存一個方向。要計算每個人的「連接數」，需要把兩個方向都算進去。CTE 用 UNION ALL 把 requester_id 和 accepter_id 都轉成統一的 employee_id，這樣每次出現都代表一次合作關係。再用 GROUP BY + COUNT(*) 統計每人的合作夥伴數。這是社交網絡分析的基礎技巧。",
          frameworkTip: "遇到雙向關係的題目，第一步永遠是用 UNION ALL 把兩個方向攤平成統一格式，然後再做聚合分析",
        },

// Quest 24-5 (1 extra)
        {
          id: 4,
          name: "標記重複記錄（保留最小 ID）",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "重複 Email 清理標記",
            narrative: "在前面的挑戰中你已經找到了重複的 email。現在要進一步：找出應該被刪除的重複記錄。規則是「保留 id 最小的那筆，標記其他為重複」。你不會真的刪除資料（DELETE 太危險了），而是先查詢出所有應該被標記為重複的記錄。\n\n資料表：\n- contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
          },
          question: "寫一段 SQL，找出所有重複 email 中應該被移除的記錄（保留每組 id 最小的那筆，列出其餘的）。",
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
          starterCode: "SELECT c1.id, c1.email, c1.name\nFROM contacts c1\n-- 怎麼找出「同 email 但 id 不是最小」的記錄？\nORDER BY c1.email, c1.id;",
          expectedQuery: "SELECT c1.id, c1.email, c1.name FROM contacts c1 WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) ORDER BY c1.email, c1.id;",
          hints: ["用 correlated subquery 找出同一 email 的最小 id","WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email)","如果 c1.id 大於同 email 的最小 id，代表它是重複的"],
          explanation: "這是「去重保留最小 ID」的經典模式。Correlated subquery (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) 對每一行找出同 email 的最小 id。如果當前行的 id 大於這個最小值，就代表它是重複的、應該被移除。實務中，這個查詢通常是清理資料的第一步：先用 SELECT 確認要刪除的行，確認無誤後再改成 DELETE。",
          frameworkTip: "資料清理的黃金法則：先用 SELECT 查出要處理的資料，人工確認後再執行 DELETE/UPDATE。面試中提到這個習慣，展示你對生產資料的謹慎態度",
        },

// Quest 25-1 (3 extra)
        {
          id: 4,
          name: "DENSE_RANK 活動排名",
          type: "code",
          difficulty: "medium",
          sourceTag: "Google 面試題",
          scenario: {
            title: "用戶 Email 活動排名",
            narrative: "產品團隊想找出最活躍的 Email 用戶。你需要根據每位用戶寄出的 Email 數量進行排名。如果兩位用戶寄出一樣多的 Email，排名要相同（不跳號）。\n\n資料表：emails (id, from_user, to_user, sent_date)",
            data: [{"id":1,"from_user":"alice","to_user":"bob","sent_date":"2024-03-01"},{"id":2,"from_user":"alice","to_user":"charlie","sent_date":"2024-03-02"},{"id":3,"from_user":"bob","to_user":"alice","sent_date":"2024-03-03"},{"id":4,"from_user":"charlie","to_user":"alice","sent_date":"2024-03-04"},{"id":5,"from_user":"alice","to_user":"diana","sent_date":"2024-03-05"}],
            dataCaption: "emails 資料表（部分範例）",
          },
          question: "計算每位用戶寄出的 Email 數量，並用 DENSE_RANK 排名（寄最多的排第 1）。顯示 from_user, email_count, activity_rank。",
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
          starterCode: "SELECT from_user,\n       COUNT(*) AS email_count,\n       DENSE_RANK() OVER (\n         -- 按什麼排序？\n       ) AS activity_rank\nFROM emails\nGROUP BY from_user\nORDER BY activity_rank;",
          expectedQuery: "SELECT from_user, COUNT(*) AS email_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS activity_rank FROM emails GROUP BY from_user ORDER BY activity_rank;",
          hints: ["DENSE_RANK 不會跳號，RANK 會跳號 — 這裡要不跳號","OVER() 裡的 ORDER BY 可以直接用聚合函數","不需要 PARTITION BY，因為是全域排名"],
          explanation: "DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 會根據 email 數量從多到少排名，同數量的用戶排名相同且不跳號。注意 DENSE_RANK vs RANK 的差異：如果兩人並列第 1，DENSE_RANK 下一個是第 2，RANK 下一個是第 3。面試中經常問這兩者的區別。",
          frameworkTip: "RANK vs DENSE_RANK vs ROW_NUMBER：RANK 跳號、DENSE_RANK 不跳號、ROW_NUMBER 每行唯一。面試必知的三兄弟。",
        },
        {
          id: 5,
          name: "最活躍房客排名",
          type: "code",
          difficulty: "medium",
          sourceTag: "Airbnb 面試題",
          scenario: {
            title: "房客訊息活躍度排名",
            narrative: "平台運營想找出溝通最積極的房客，以便推薦「超級房客」標籤。你需要根據每位房客發送的訊息總數做排名。如果多位房客發送相同數量的訊息，排名相同，並按名稱字母順序排列。\n\n資料表：messages (id, guest_id, guest_name, host_id, message_body, sent_date)",
            data: [{"id":1,"guest_id":101,"guest_name":"Amy","host_id":501,"sent_date":"2024-02-10"},{"id":2,"guest_id":102,"guest_name":"Ben","host_id":502,"sent_date":"2024-02-11"},{"id":3,"guest_id":101,"guest_name":"Amy","host_id":503,"sent_date":"2024-02-12"},{"id":4,"guest_id":103,"guest_name":"Cathy","host_id":501,"sent_date":"2024-02-13"}],
            dataCaption: "messages 資料表（部分範例）",
          },
          question: "計算每位房客的訊息數，用 DENSE_RANK 排名（最多的排第 1）。同名次時按 guest_name 字母排序。顯示 guest_name, message_count, ranking。",
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
          starterCode: "SELECT guest_name,\n       COUNT(*) AS message_count,\n       DENSE_RANK() OVER (\n         -- 排名邏輯？\n       ) AS ranking\nFROM messages\nGROUP BY guest_id, guest_name\nORDER BY ranking, guest_name;",
          expectedQuery: "SELECT guest_name, COUNT(*) AS message_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking FROM messages GROUP BY guest_id, guest_name ORDER BY ranking, guest_name;",
          hints: ["GROUP BY guest_id 後再用 DENSE_RANK 排名","同名次按 guest_name 字母排序 — 在最外層 ORDER BY 處理","注意 GROUP BY 要包含 guest_id 和 guest_name 兩個欄位"],
          explanation: "先 GROUP BY guest_id, guest_name 算出每位房客的訊息數，再用 DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 排名。最外層 ORDER BY ranking, guest_name 確保同名次的按字母排序。這個 pattern 在排行榜場景中非常常見。",
          frameworkTip: "排行榜問題的 pattern：GROUP BY 算指標 → DENSE_RANK 排名 → ORDER BY 處理同名次的排序。",
        },
        {
          id: 6,
          name: "連續出現的數字",
          type: "code",
          difficulty: "hard",
          sourceTag: "LeetCode Medium",
          scenario: {
            title: "連續三次相同值偵測",
            narrative: "資料工程師發現某個感測器的日誌中，有些數值會連續出現多次，可能代表系統異常。PM 請你找出所有「連續出現至少 3 次」的數值。\n\n資料表：sensor_logs (id INTEGER PRIMARY KEY, value INTEGER)，id 是連續編號。",
            data: [{"id":1,"value":10},{"id":2,"value":10},{"id":3,"value":10},{"id":4,"value":20},{"id":5,"value":20},{"id":6,"value":30}],
            dataCaption: "sensor_logs 資料表（部分範例）",
          },
          question: "用 LAG 和 LEAD（或連續兩次 LAG）找出所有連續出現至少 3 次的 value。結果去重，只顯示 value 欄位。",
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
          starterCode: "WITH lagged AS (\n  SELECT id, value,\n    LAG(value, 1) OVER (ORDER BY id) AS prev1,\n    LAG(value, 2) OVER (ORDER BY id) AS prev2\n  FROM sensor_logs\n)\nSELECT DISTINCT value\nFROM lagged\nWHERE -- 什麼條件代表「連續三次相同」？;",
          expectedQuery: "WITH lagged AS (SELECT id, value, LAG(value, 1) OVER (ORDER BY id) AS prev1, LAG(value, 2) OVER (ORDER BY id) AS prev2 FROM sensor_logs) SELECT DISTINCT value FROM lagged WHERE value = prev1 AND value = prev2;",
          hints: ["LAG(value, 1) 取前一筆，LAG(value, 2) 取前兩筆","如果 value = prev1 = prev2，代表連續三筆相同","用 DISTINCT 去重，因為連續 4 次會匹配 2 次"],
          explanation: "用 LAG 取得前一筆和前兩筆的值，當三者相等時代表連續出現 3 次。LAG(value, N) 中的 N 是偏移量。另一個解法是同時用 LAG 和 LEAD：如果自己 = 前一個 = 後一個。DISTINCT 是必要的，因為連續 4 次的值會被匹配多次。這是面試經典題，考的是 Window Function 的靈活運用。",
          frameworkTip: "連續 N 次問題的解法：LAG/LEAD 取前後值比較，或用「row_number 差值法」（GROUP BY value, id - ROW_NUMBER 分組）。",
        },

// Quest 25-2 (2 extra)
        {
          id: 3,
          name: "每日好友請求接受率",
          type: "code",
          difficulty: "medium",
          sourceTag: "Meta 面試題",
          scenario: {
            title: "好友請求接受率分析",
            narrative: "Growth 團隊想追蹤好友功能的健康度。你需要根據好友請求事件（send / accept），計算每日的接受率（acceptance rate）。\n\n資料表：friend_requests (id, sender_id, receiver_id, action TEXT, action_date TEXT)\n- action 為 \"send\" 或 \"accept\"",
            data: [{"id":1,"sender_id":101,"receiver_id":201,"action":"send","action_date":"2024-03-01"},{"id":2,"sender_id":101,"receiver_id":201,"action":"accept","action_date":"2024-03-01"},{"id":3,"sender_id":102,"receiver_id":202,"action":"send","action_date":"2024-03-01"},{"id":4,"sender_id":103,"receiver_id":203,"action":"send","action_date":"2024-03-02"},{"id":5,"sender_id":103,"receiver_id":203,"action":"accept","action_date":"2024-03-02"}],
            dataCaption: "friend_requests 資料表（部分範例）",
          },
          question: "計算每個日期的好友請求接受率：acceptance_rate = 當日 accept 數 / 當日 send 數。顯示 action_date, sends, accepts, acceptance_rate（四捨五入到小數第 2 位）。",
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
          starterCode: "SELECT action_date,\n       SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends,\n       SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts,\n       -- 怎麼算 acceptance_rate？\nFROM friend_requests\nGROUP BY action_date\nORDER BY action_date;",
          expectedQuery: "SELECT action_date, SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends, SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts, ROUND(SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END), 2) AS acceptance_rate FROM friend_requests GROUP BY action_date ORDER BY action_date;",
          hints: ["用 CASE WHEN 分別計算 send 和 accept 的數量","記得乘以 1.0 避免整數除法","用 ROUND(..., 2) 取到小數第 2 位"],
          explanation: "用 SUM(CASE WHEN ...) 是「橫向 pivot」的經典技巧，可以在一次 GROUP BY 中同時計算多個條件的聚合值。注意 SQLite 的整數除法：5/3 = 1 不是 1.67，所以要乘以 1.0 轉成浮點數。這種 event-based 的轉換率計算是社交平台分析的核心題型。",
          frameworkTip: "事件轉換率 pattern：SUM(CASE WHEN event = X) / SUM(CASE WHEN event = Y)。記得處理整數除法和除以零。",
        },
        {
          id: 4,
          name: "多來源能源消耗高峰",
          type: "code",
          difficulty: "hard",
          sourceTag: "Meta 面試題",
          scenario: {
            title: "多資料來源漏斗合併",
            narrative: "公司有三個不同部門的能源消耗紀錄，儲存在不同表中。PM 想找出「合併後」每個月的總消耗量，以及消耗量最高的月份。\n\n資料表：\n- dept_a_consumption (date TEXT, consumption INTEGER)\n- dept_b_consumption (date TEXT, consumption INTEGER)\n- dept_c_consumption (date TEXT, consumption INTEGER)",
            data: [{"source":"dept_a","date":"2024-01","consumption":300},{"source":"dept_b","date":"2024-01","consumption":250},{"source":"dept_c","date":"2024-01","consumption":200}],
            dataCaption: "各部門 2024-01 能源消耗範例",
          },
          question: "用 UNION ALL 合併三張表，計算每月的總消耗量，找出消耗量最高的月份。顯示 date, total_consumption，只回傳消耗量最高的月份（可能有多個並列）。",
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
          starterCode: "WITH combined AS (\n  SELECT date, consumption FROM dept_a_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_b_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_c_consumption\n),\nmonthly AS (\n  SELECT date, SUM(consumption) AS total_consumption\n  FROM combined\n  GROUP BY date\n)\nSELECT date, total_consumption\nFROM monthly\nWHERE total_consumption = (\n  -- 怎麼取最大值？\n);",
          expectedQuery: "WITH combined AS (SELECT date, consumption FROM dept_a_consumption UNION ALL SELECT date, consumption FROM dept_b_consumption UNION ALL SELECT date, consumption FROM dept_c_consumption), monthly AS (SELECT date, SUM(consumption) AS total_consumption FROM combined GROUP BY date) SELECT date, total_consumption FROM monthly WHERE total_consumption = (SELECT MAX(total_consumption) FROM monthly);",
          hints: ["UNION ALL 保留所有列（包括重複），UNION 會去重 — 這裡用 UNION ALL","先合併 → 再 GROUP BY 月份算總和 → 最後找最大值","子查詢 SELECT MAX(...) FROM monthly 取最大值"],
          explanation: "多資料來源合併是真實工作中常見的場景（不同平台的數據、不同部門的報表等）。UNION ALL 把結構相同的表垂直合併，再 GROUP BY 做聚合。用子查詢找出最大值後做過濾，可以正確處理多個月份並列的情況。面試中這類題考的是你處理散落在不同表的數據的能力。",
          frameworkTip: "多來源合併 pattern：UNION ALL 合併 → GROUP BY 聚合 → 子查詢或 Window Function 篩選極值。",
        },

// Quest 25-3 (2 extra)
        {
          id: 4,
          name: "商家類型分類",
          type: "code",
          difficulty: "medium",
          sourceTag: "Google 面試題",
          scenario: {
            title: "根據名稱分類商家類型",
            narrative: "市場團隊收到了一批商家資料，需要根據商家名稱中的關鍵字自動分類。規則如下：\n- 名稱包含 \"restaurant\" 或 \"cafe\" → 餐飲\n- 名稱包含 \"shop\" 或 \"store\" → 零售\n- 名稱包含 \"hotel\" 或 \"inn\" → 住宿\n- 其他 → 其他\n\n資料表：businesses (id, name TEXT, city TEXT, revenue REAL)",
            data: [{"id":1,"name":"Sunset Restaurant","city":"Taipei","revenue":85000},{"id":2,"name":"Tech Shop Plus","city":"Hsinchu","revenue":120000},{"id":3,"name":"Garden Inn","city":"Taichung","revenue":200000},{"id":4,"name":"Creative Studio","city":"Taipei","revenue":65000}],
            dataCaption: "businesses 資料表（部分範例）",
          },
          question: "用 CASE WHEN 搭配 LOWER() 和 LIKE 將商家分類，然後計算每個類別的商家數量和平均營收。顯示 business_type, count, avg_revenue。",
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
          starterCode: "SELECT\n  CASE\n    WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲'\n    -- 繼續分類...\n  END AS business_type,\n  COUNT(*) AS count,\n  ROUND(AVG(revenue), 0) AS avg_revenue\nFROM businesses\nGROUP BY business_type\nORDER BY avg_revenue DESC;",
          expectedQuery: "SELECT CASE WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲' WHEN LOWER(name) LIKE '%shop%' OR LOWER(name) LIKE '%store%' THEN '零售' WHEN LOWER(name) LIKE '%hotel%' OR LOWER(name) LIKE '%inn%' THEN '住宿' ELSE '其他' END AS business_type, COUNT(*) AS count, ROUND(AVG(revenue), 0) AS avg_revenue FROM businesses GROUP BY business_type ORDER BY avg_revenue DESC;",
          hints: ["LOWER(name) 先轉小寫，避免大小寫不一致的問題","LIKE '%keyword%' 做模糊匹配","CASE WHEN 的順序很重要 — 如果名稱同時包含多個關鍵字，會被歸到第一個匹配的類別"],
          explanation: "用 CASE WHEN + LIKE 做文本分類是資料清理和分群中很常見的技巧。LOWER() 確保大小寫不敏感。注意 CASE WHEN 是「first match wins」的邏輯，所以條件的順序可能影響結果。在真實工作中，這種分類邏輯經常會越來越複雜，最後可能需要搬到 mapping table 或 UDF 中。",
          frameworkTip: "文本分類 pattern：CASE WHEN + LOWER + LIKE。生產環境中更好的做法是建一張 mapping table JOIN 進來。",
        },
        {
          id: 5,
          name: "免費 vs 付費用戶比較",
          type: "code",
          difficulty: "hard",
          sourceTag: "Microsoft 面試題",
          scenario: {
            title: "Freemium vs Premium 下載量比較",
            narrative: "產品團隊想了解免費用戶和付費用戶的每日下載量差異，特別想找出「免費用戶下載量超過付費用戶」的日期。\n\n資料表：\n- downloads (date TEXT, user_id INTEGER, downloads INTEGER)\n- users (id INTEGER, account_type TEXT)  -- account_type: \"free\" 或 \"premium\"",
            data: [{"date":"2024-03-01","account_type":"free","total_downloads":150},{"date":"2024-03-01","account_type":"premium","total_downloads":200},{"date":"2024-03-02","account_type":"free","total_downloads":250},{"date":"2024-03-02","account_type":"premium","total_downloads":180}],
            dataCaption: "每日下載量（彙總後）範例",
          },
          question: "計算每日免費用戶 vs 付費用戶的總下載量，找出免費用戶下載量超過付費用戶的日期。顯示 date, free_downloads, premium_downloads。",
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
          starterCode: "WITH daily AS (\n  SELECT d.date,\n    SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads,\n    SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads\n  FROM downloads d\n  JOIN users u ON d.user_id = u.id\n  GROUP BY d.date\n)\nSELECT date, free_downloads, premium_downloads\nFROM daily\nWHERE -- 什麼條件？\nORDER BY date;",
          expectedQuery: "WITH daily AS (SELECT d.date, SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads, SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads FROM downloads d JOIN users u ON d.user_id = u.id GROUP BY d.date) SELECT date, free_downloads, premium_downloads FROM daily WHERE free_downloads > premium_downloads ORDER BY date;",
          hints: ["SUM(CASE WHEN) 是把同一筆 GROUP BY 內的數據分成兩群的經典技巧","JOIN users 表取得 account_type 後再做條件聚合","WHERE 條件直接比較兩個 SUM 的結果"],
          explanation: "這題的核心技巧是「條件聚合」：在同一個 GROUP BY 中，用 SUM(CASE WHEN ...) 分別計算不同分群的指標。這比分開查再 JOIN 更簡潔高效。在 CTE 裡先算好每日兩群的總量，外層再做過濾。這種 A/B 比較在產品分析中無處不在。",
          frameworkTip: "分群比較 pattern：JOIN 取分群標籤 → SUM(CASE WHEN) 條件聚合 → WHERE/HAVING 篩選。比 self-join 更高效。",
        },

// Quest 25-4 (2 extra)
        {
          id: 3,
          name: "月度留存率計算",
          type: "code",
          difficulty: "hard",
          sourceTag: "Meta 面試題",
          scenario: {
            title: "月度用戶留存率",
            narrative: "Growth 團隊需要追蹤月度留存率：「某月活躍的用戶中，有多少比例在下個月也活躍？」。這和 cohort retention 不同 — 這裡不按註冊月份分組，而是看整體的月到月留存。\n\n資料表：user_activity (user_id INTEGER, activity_date TEXT)",
            data: [{"user_id":1,"activity_date":"2024-01-05"},{"user_id":2,"activity_date":"2024-01-10"},{"user_id":1,"activity_date":"2024-02-03"},{"user_id":3,"activity_date":"2024-02-15"}],
            dataCaption: "user_activity 資料表（部分範例）",
          },
          question: "計算每個月的留存率：month_N 活躍用戶中，在 month_N+1 也活躍的比例。顯示 activity_month, active_users, retained_next_month, retention_rate。",
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
          starterCode: "WITH monthly_users AS (\n  SELECT DISTINCT user_id,\n         strftime('%Y-%m', activity_date) AS activity_month\n  FROM user_activity\n)\nSELECT\n  a.activity_month,\n  COUNT(DISTINCT a.user_id) AS active_users,\n  -- 怎麼算留存到下個月的人數？\n  -- 怎麼算 retention_rate？\nFROM monthly_users a\nLEFT JOIN monthly_users b\n  ON a.user_id = b.user_id\n  -- 怎麼確保 b 是「下個月」？\nGROUP BY a.activity_month\nORDER BY a.activity_month;",
          expectedQuery: "WITH monthly_users AS (SELECT DISTINCT user_id, strftime('%Y-%m', activity_date) AS activity_month FROM user_activity) SELECT a.activity_month, COUNT(DISTINCT a.user_id) AS active_users, COUNT(DISTINCT b.user_id) AS retained_next_month, ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 1) AS retention_rate FROM monthly_users a LEFT JOIN monthly_users b ON a.user_id = b.user_id AND b.activity_month = strftime('%Y-%m', date(a.activity_month || '-01', '+1 month')) GROUP BY a.activity_month ORDER BY a.activity_month;",
          hints: ["先用 DISTINCT 取得每月的不重複活躍用戶","Self-join：a 是當月用戶，b 是下月用戶，用 date(..., '+1 month') 算下個月","COUNT(DISTINCT b.user_id) 是留存人數，除以 COUNT(DISTINCT a.user_id) 是留存率"],
          explanation: "月度留存率用 self-join 實現：monthly_users 表自己 JOIN 自己，條件是同一個 user_id 且 b 的月份 = a 的月份 + 1。LEFT JOIN 確保即使沒有留存用戶也會顯示。SQLite 中用 date(month || '-01', '+1 month') 計算下個月。這是 Growth 團隊最常看的留存指標之一。",
          frameworkTip: "月度留存 pattern：CTE 去重取月活用戶 → self-join（同用戶 + 月份差 1） → COUNT(DISTINCT) 算留存人數。",
        },
        {
          id: 4,
          name: "MoM 營收百分比變化",
          type: "code",
          difficulty: "medium",
          sourceTag: "Amazon 面試題",
          scenario: {
            title: "月營收環比變化",
            narrative: "財務團隊需要一份報表，顯示每個月的營收和相比上月的百分比變化（MoM %）。這能幫助主管快速發現營收異常。\n\n資料表：purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT)",
            data: [{"id":1,"user_id":101,"amount":500,"purchase_date":"2024-01-15"},{"id":2,"user_id":102,"amount":300,"purchase_date":"2024-01-20"},{"id":3,"user_id":101,"amount":450,"purchase_date":"2024-02-10"}],
            dataCaption: "purchases 資料表（部分範例）",
          },
          question: "計算每月總營收和 MoM 百分比變化。用 LAG 取上月營收。顯示 month, revenue, prev_month_revenue, mom_pct_change（四捨五入到小數第 1 位）。",
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
          starterCode: "WITH monthly AS (\n  SELECT strftime('%Y-%m', purchase_date) AS month,\n         SUM(amount) AS revenue\n  FROM purchases\n  GROUP BY month\n)\nSELECT month,\n       revenue,\n       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,\n       -- 怎麼算 MoM 百分比變化？\nFROM monthly\nORDER BY month;",
          expectedQuery: "WITH monthly AS (SELECT strftime('%Y-%m', purchase_date) AS month, SUM(amount) AS revenue FROM purchases GROUP BY month) SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue, ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 1) AS mom_pct_change FROM monthly ORDER BY month;",
          hints: ["先用 CTE 把每月營收算好，再用 LAG 取上月","MoM % = (本月 - 上月) / 上月 * 100","第一個月的 LAG 回傳 NULL，整個計算結果也是 NULL — 不需要額外處理"],
          explanation: "先用 CTE 按月聚合營收，再用 LAG 取得上個月的值來計算變化率。這個 pattern 在 Quest 25-1 的 LAG 題有類似概念，但這裡多了一步：先聚合再算。在實務中，MoM 變化率是最常見的趨勢追蹤指標，幾乎每個 dashboard 都會有。",
          frameworkTip: "MoM 計算的兩步驟：CTE 先 GROUP BY 月份算出指標 → 外層用 LAG 算環比。分開做比在同一層更清晰。",
        },

// Quest 25-5 (2 extra)
        {
          id: 4,
          name: "單月客戶營收排名",
          type: "code",
          difficulty: "medium",
          sourceTag: "Meta 面試題",
          scenario: {
            title: "三月份客戶營收報表",
            narrative: "業務主管要一份「三月份各客戶的營收排名」，用來識別 VIP 客戶和評估銷售表現。\n\n資料表：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
            data: [{"id":1,"customer_id":301,"amount":500,"order_date":"2024-03-05"},{"id":2,"customer_id":302,"amount":350,"order_date":"2024-03-10"},{"id":3,"customer_id":301,"amount":200,"order_date":"2024-03-15"}],
            dataCaption: "orders 資料表（部分範例）",
          },
          question: "計算 2024 年 3 月份每位客戶的總營收，並用 DENSE_RANK 排名。顯示 customer_id, march_revenue, revenue_rank。按排名排序。",
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
          starterCode: "SELECT customer_id,\n       SUM(amount) AS march_revenue,\n       DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank\nFROM orders\nWHERE -- 怎麼篩選三月份？\nGROUP BY customer_id\nORDER BY revenue_rank;",
          expectedQuery: "SELECT customer_id, SUM(amount) AS march_revenue, DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank FROM orders WHERE strftime('%Y-%m', order_date) = '2024-03' GROUP BY customer_id ORDER BY revenue_rank;",
          hints: ["strftime('%Y-%m', order_date) = '2024-03' 篩選三月份","先 WHERE 篩選月份，再 GROUP BY 客戶算總營收","DENSE_RANK 直接在 SELECT 中對 SUM(amount) 排名"],
          explanation: "這題結合了時間篩選、聚合和 Window Function。先用 WHERE 篩選目標月份，GROUP BY 算每位客戶的營收，再用 DENSE_RANK 排名。注意 WHERE 在 GROUP BY 之前執行，所以篩選條件要放在 WHERE 而不是 HAVING。面試中這類「特定時段的客戶排名」是非常高頻的題型。",
          frameworkTip: "時間篩選 + 聚合 + 排名的執行順序：WHERE 篩時間 → GROUP BY 聚合 → Window Function 排名。順序不能錯。",
        },
        {
          id: 5,
          name: "行銷活動成效分析",
          type: "code",
          difficulty: "hard",
          sourceTag: "Amazon 面試題",
          scenario: {
            title: "行銷活動 ROI 評估",
            narrative: "行銷團隊投放了多個廣告活動來獲取新用戶。PM 想知道：透過行銷活動獲得的用戶中，有多少人實際下了訂單？每個活動帶來了多少營收？\n\n資料表：\n- users (id INTEGER, signup_date TEXT, campaign TEXT)  — campaign 為 NULL 表示自然流量\n- orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT)",
            data: [{"id":1,"signup_date":"2024-03-01","campaign":"spring_sale"},{"id":2,"signup_date":"2024-03-02","campaign":"google_ads"},{"id":3,"signup_date":"2024-03-03","campaign":null}],
            dataCaption: "users 資料表（部分範例）",
          },
          question: "計算每個行銷活動的：獲客人數、有下單的人數、下單率、總營收。排除自然流量（campaign IS NULL）。按總營收降序排列。",
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
          starterCode: "SELECT u.campaign,\n       COUNT(DISTINCT u.id) AS acquired_users,\n       -- 有下單的人數？\n       -- 下單率？\n       -- 總營收？\nFROM users u\nLEFT JOIN orders o ON u.id = o.user_id\nWHERE u.campaign IS NOT NULL\nGROUP BY u.campaign\nORDER BY -- 按總營收排序;",
          expectedQuery: "SELECT u.campaign, COUNT(DISTINCT u.id) AS acquired_users, COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) AS paying_users, ROUND(COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) * 100.0 / COUNT(DISTINCT u.id), 1) AS conversion_rate, COALESCE(SUM(o.amount), 0) AS total_revenue FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.campaign IS NOT NULL GROUP BY u.campaign ORDER BY total_revenue DESC;",
          hints: ["COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 算有下單的不重複用戶數","LEFT JOIN 確保沒下單的用戶也被計入獲客人數","COALESCE(SUM(o.amount), 0) 處理某活動完全沒有訂單的情況"],
          explanation: "這題結合了 LEFT JOIN、條件聚合和商業指標計算。LEFT JOIN 確保沒下單的用戶也算在獲客人數中。COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 是一個巧妙的技巧：只計算有訂單的不重複用戶。下單率 = 有下單用戶 / 總獲客用戶。這種行銷成效報表是 Growth 和 Marketing Analytics 的核心工作。",
          frameworkTip: "行銷成效分析 pattern：LEFT JOIN 保留全量用戶 → 條件聚合區分轉化/未轉化 → 算轉化率和 ROI。LEFT JOIN 是關鍵，不能用 INNER JOIN。",
        },

// Quest 26-1 (1 extra)
        {
          id: 4,
          name: "刪除重複資料",
          type: "code",
          difficulty: "easy",
          sourceTag: "LeetCode Easy",
          scenario: {
            title: "清理重複的客戶 Email",
            narrative: "行銷團隊匯入了一批名單到 contacts 資料表，但因為檔案重複匯入，有些 email 出現了多筆紀錄。主管請你刪除重複的資料，只保留每個 email 最早的那筆（id 最小的）。\n\n資料表結構：contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
            data: [{"id":1,"email":"alice@mail.com","name":"Alice","created_at":"2024-01-10"},{"id":2,"email":"bob@mail.com","name":"Bob","created_at":"2024-01-12"},{"id":3,"email":"alice@mail.com","name":"Alice Lin","created_at":"2024-01-15"},{"id":4,"email":"charlie@mail.com","name":"Charlie","created_at":"2024-01-18"},{"id":5,"email":"bob@mail.com","name":"Bob Wang","created_at":"2024-01-20"}],
            dataCaption: "contacts 資料表（可看到 alice 和 bob 各有兩筆）",
          },
          question: "刪除 contacts 資料表中 email 重複的資料，只保留每個 email 中 id 最小的那筆。",
          sampleSchema: `
        CREATE TABLE contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT);
        INSERT INTO contacts VALUES (1, 'alice@mail.com', 'Alice', '2024-01-10');
        INSERT INTO contacts VALUES (2, 'bob@mail.com', 'Bob', '2024-01-12');
        INSERT INTO contacts VALUES (3, 'alice@mail.com', 'Alice Lin', '2024-01-15');
        INSERT INTO contacts VALUES (4, 'charlie@mail.com', 'Charlie', '2024-01-18');
        INSERT INTO contacts VALUES (5, 'bob@mail.com', 'Bob Wang', '2024-01-20');
        INSERT INTO contacts VALUES (6, 'alice@mail.com', 'Alice C', '2024-02-01');
      `,
          starterCode: "DELETE FROM contacts\nWHERE id NOT IN (\n  -- 怎麼找出每個 email 最小的 id？\n);",
          expectedQuery: "DELETE FROM contacts WHERE id NOT IN (SELECT MIN(id) FROM contacts GROUP BY email);",
          hints: ["用 GROUP BY email 搭配 MIN(id) 可以找出每個 email 最早的那筆","DELETE ... WHERE id NOT IN (子查詢) 可以刪除不在保留名單中的資料"],
          explanation: "這是經典的刪除重複資料問題（LeetCode #196 變體）。核心思路：先用子查詢 SELECT MIN(id) FROM contacts GROUP BY email 找出每個 email 要保留的 id，再用 DELETE ... WHERE id NOT IN (...) 刪除其他的。面試中這題考的是 DELETE 搭配子查詢的能力，以及對 GROUP BY 聚合的理解。",
          frameworkTip: "刪除重複資料的標準步驟：(1) 先用 SELECT 確認哪些是重複的 (2) 用子查詢找出要保留的 id (3) DELETE 不在保留名單中的資料。記得先跑 SELECT 確認再改成 DELETE。",
        },

// Quest 26-2 (1 extra)
        {
          id: 3,
          name: "部門最高薪員工",
          type: "code",
          difficulty: "medium",
          sourceTag: "Microsoft 面試題",
          scenario: {
            title: "找出各部門薪資最高的員工",
            narrative: "HR 部門要做年度薪資報告，需要列出每個部門中薪資最高的員工。你需要先理解資料表結構，再寫出查詢。\n\n資料表結構：\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)",
            data: [{"id":1,"name":"Alice","salary":85000,"department":"Engineering"},{"id":2,"name":"Bob","salary":92000,"department":"Engineering"},{"id":3,"name":"Charlie","salary":78000,"department":"Marketing"},{"id":4,"name":"Diana","salary":81000,"department":"Marketing"},{"id":5,"name":"Eve","salary":95000,"department":"Engineering"}],
            dataCaption: "workers + departments（合併展示）",
          },
          question: "寫一段 SQL 查詢，找出每個部門中薪資最高的員工姓名、部門名稱和薪資。如果某部門有多人同為最高薪，全部列出。",
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
          starterCode: "SELECT w.name, d.dept_name, w.salary\nFROM workers w\nJOIN departments d ON w.department_id = d.id\nWHERE w.salary = (\n  -- 怎麼找出同部門的最高薪資？\n);",
          expectedQuery: "SELECT w.name, d.dept_name, w.salary FROM workers w JOIN departments d ON w.department_id = d.id WHERE w.salary = (SELECT MAX(w2.salary) FROM workers w2 WHERE w2.department_id = w.department_id);",
          hints: ["用相關子查詢（correlated subquery）：內層查詢引用外層的 department_id","SELECT MAX(salary) FROM workers WHERE department_id = 外層的 department_id"],
          explanation: "這題的關鍵是「相關子查詢」（correlated subquery）：內層的 WHERE w2.department_id = w.department_id 會針對外層每一列動態計算該部門的最高薪資。相比 GROUP BY 方案，這種寫法可以自然地處理「同部門多人同為最高薪」的情境。這是微軟等大公司面試常考的 SQL 模式。",
          frameworkTip: "「找出每組中最大/最小值對應的完整資料」是經典面試模式。兩種解法：(1) 相關子查詢 WHERE val = (SELECT MAX...) (2) 視窗函式 RANK() OVER (PARTITION BY ...)。面試時兩種都能講更好。",
        },

// Quest 26-3 (1 extra)
        {
          id: 4,
          name: "訂單生命週期 SQL 追蹤",
          type: "multiple-choice",
          difficulty: "medium",
          sourceTag: "Amazon 面試題",
          scenario: {
            title: "電商訂單的完整生命週期",
            narrative: "你在 Amazon 面試，面試官給了一個訂單處理系統的場景。一筆訂單從「用戶下單」到「退貨完成」會經歷完整的生命週期。系統涉及以下資料表：\n\n- orders (id, user_id, total_amount, status, created_at, updated_at)\n- order_items (id, order_id, product_id, quantity, unit_price)\n- inventory (product_id, stock_quantity)\n- payments (id, order_id, amount, payment_method, status, paid_at)\n- refunds (id, order_id, amount, reason, status, created_at)\n\n面試官問你：一筆訂單從下單到退貨完成，依序會觸發哪些 SQL 操作？",
            data: [{"階段":"1. 下單","狀態":"pending"},{"階段":"2. 付款成功","狀態":"paid"},{"階段":"3. 出貨","狀態":"shipped"},{"階段":"4. 送達","狀態":"delivered"},{"階段":"5. 申請退貨","狀態":"return_requested"},{"階段":"6. 退款完成","狀態":"refunded"}],
            dataCaption: "訂單生命週期階段",
          },
          question: "以下哪個選項正確描述了從「用戶下單」到「退款完成」的完整 SQL 操作順序？",
          options: [
            {"id":"A","text":"下單：INSERT orders → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：DELETE orders + DELETE order_items","explanation":"退貨絕對不是 DELETE！刪除訂單會失去所有歷史紀錄，無法做財務對帳和審計。退貨應該是 UPDATE 狀態 + INSERT 退款紀錄。"},
            {"id":"B","text":"下單：INSERT orders + INSERT order_items + UPDATE inventory（扣庫存）→ 付款：INSERT payments + UPDATE orders status → 出貨：UPDATE orders status → 送達：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds + UPDATE inventory（加回庫存）+ UPDATE payments status","explanation":"正確！完整的訂單生命週期涉及多張表的協同操作。下單時要同時新增訂單主表、明細和扣庫存。付款時新增付款紀錄並更新訂單狀態。退貨時要更新訂單狀態、新增退款紀錄、歸還庫存、更新付款狀態。每個階段都是用 INSERT 或 UPDATE，永遠不會 DELETE。"},
            {"id":"C","text":"下單：INSERT orders → 付款：INSERT payments → 出貨：INSERT shipments → 退貨：INSERT refunds","explanation":"只有 INSERT 是不夠的。每個階段除了新增紀錄，還需要 UPDATE 現有表的狀態（如 orders.status）。而且下單時也要扣庫存（UPDATE inventory）。"},
            {"id":"D","text":"下單：INSERT orders + INSERT order_items → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds","explanation":"遺漏了幾個關鍵操作：下單時沒有扣庫存（UPDATE inventory）、付款時沒有新增付款紀錄（INSERT payments）、退貨時沒有歸還庫存。實務中每個環節都需要完整的資料操作。"},
          ],
          correctAnswer: "B",
          hints: ["想想每個階段「新增了什麼紀錄」和「更新了哪些現有資料」","庫存在下單時扣除，退貨時要記得加回去","實務中永遠不會 DELETE 訂單，只會用 UPDATE status 標記狀態"],
          explanation: "訂單生命週期是電商系統最核心的資料流。關鍵要點：(1) 每個狀態轉換都是 UPDATE orders.status (2) 重要事件要 INSERT 到對應的紀錄表（payments、refunds）(3) 庫存是雙向的——下單扣除、退貨歸還 (4) 所有操作應該在 transaction 中執行，確保一致性。面試中能講出完整的多表操作和 transaction 概念會大大加分。",
          frameworkTip: "描述資料流時，用「哪張表、什麼操作、為什麼」的格式：INSERT orders（建立訂單紀錄）→ UPDATE inventory（扣庫存）→ 以此類推。展示你對每個操作背後商業邏輯的理解。",
        },

// Quest 26-4 (1 extra)
        {
          id: 3,
          name: "SQL vs Python 任務分配",
          type: "multiple-choice",
          difficulty: "medium",
          sourceTag: "LinkedIn 面試題",
          scenario: {
            title: "資料團隊的每日工作分配",
            narrative: "你剛加入 LinkedIn 的 Data Analytics 團隊。主管列了一份當天要完成的任務清單，要你判斷每個任務最適合用什麼工具完成。團隊有 SQL（連接公司的資料倉儲）和 Python（Jupyter Notebook 環境，有 pandas、matplotlib、scikit-learn）。\n\n任務清單：\nA. 從 10 億筆事件資料中算出每日活躍用戶數（DAU）\nB. 把 DAU 數據做成折線圖寄給老闆\nC. 合併兩個 CSV 檔案，清洗缺失值後上傳到資料庫\nD. 建立一個模型預測哪些用戶可能下個月流失\nE. 找出過去 7 天連續登入的用戶清單",
            data: [{"任務":"A. 計算 DAU","資料量":"10 億筆","適合工具":"?"},{"任務":"B. DAU 折線圖","資料量":"365 筆","適合工具":"?"},{"任務":"C. CSV 清洗上傳","資料量":"5 萬筆","適合工具":"?"},{"任務":"D. 流失預測模型","資料量":"特徵表 10 萬筆","適合工具":"?"},{"任務":"E. 連續登入用戶","資料量":"10 億筆","適合工具":"?"}],
            dataCaption: "任務清單與工具選擇",
          },
          question: "以下哪個工具分配方案最合理？",
          options: [
            {"id":"A","text":"A=SQL, B=Python, C=Python, D=Python, E=SQL","explanation":"正確！A 和 E 是大數據量的聚合與篩選，SQL 在資料庫端執行效率最高。B 需要視覺化，用 Python matplotlib 最方便。C 涉及 CSV 解析和缺失值清洗，pandas 的專長。D 是 ML 任務，必須用 Python。關鍵原則：資料量大的聚合交給 SQL，後處理和分析交給 Python。"},
            {"id":"B","text":"A=Python, B=Python, C=Python, D=Python, E=Python","explanation":"全部用 Python 是新手常見的錯誤。A 和 E 都涉及 10 億筆資料，如果用 pandas 從資料庫把 10 億筆拉到本地處理，記憶體會爆炸（約 80GB），而且速度極慢。大數據量的聚合應該讓資料庫引擎在伺服器端完成。"},
            {"id":"C","text":"A=SQL, B=SQL, C=SQL, D=SQL, E=SQL","explanation":"全部用 SQL 也不合適。SQL 不能做視覺化（B）、不擅長 CSV 清洗（C）、更做不了 ML 模型（D）。工具選擇要看任務性質，不是一刀切。"},
            {"id":"D","text":"A=SQL, B=Python, C=SQL, D=Python, E=Python","explanation":"C 用 SQL 處理 CSV 不太直觀，pandas 的 read_csv + fillna 更方便。E 用 Python 處理 10 億筆事件資料會遇到記憶體問題，連續登入的邏輯用 SQL 視窗函式更高效。"},
          ],
          correctAnswer: "A",
          hints: ["資料量是決定工具的關鍵因素之一——10 億筆資料拉到本地處理合理嗎？","想想每個任務的核心動作：聚合？視覺化？清洗？建模？"],
          explanation: "SQL vs Python 的選擇不是偏好問題，而是工程判斷。核心原則：(1) 大數據量的篩選和聚合 → SQL（在資料庫端計算，不需搬資料）(2) 視覺化、ML、檔案處理 → Python (3) 小數據量的探索分析 → 兩者皆可。面試中展示「我會根據資料量和任務性質選擇工具」比「我什麼都用 Python」更有說服力。",
          frameworkTip: "工具選擇的判斷框架：先看資料量（大 → SQL 端處理）→ 再看任務性質（聚合 → SQL、ML/視覺化 → Python）→ 最後看便利性（CSV → pandas、JSON → Python）。",
        },

// Quest 26-5 (2 extra)
        {
          id: 4,
          name: "慢查詢改寫優化",
          type: "code",
          difficulty: "hard",
          sourceTag: "LinkedIn 面試題",
          scenario: {
            title: "優化部門薪資差異報表",
            narrative: "公司有 workers 和 departments 兩張表。HR 寫了一個查詢來計算每個部門的最高薪資，但這個查詢在百萬筆資料下跑了超過 60 秒。\n\n原始慢查詢：\nSELECT d.dept_name,\n       (SELECT MAX(w.salary) FROM workers w WHERE w.department_id = d.id) AS max_salary\nFROM departments d\nORDER BY max_salary DESC;\n\n問題在於：子查詢對每個部門都要掃一次 workers 表，當部門數量多時效能很差。\n\n資料表結構：\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)",
          },
          question: "把上面的慢查詢改寫成效能更好的版本，使用 JOIN + GROUP BY 取代相關子查詢。",
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
          starterCode: "SELECT d.dept_name, -- 怎麼算最高薪資？ AS max_salary\nFROM departments d\n-- 怎麼連接 workers？\n-- 怎麼分組？\nORDER BY max_salary DESC;",
          expectedQuery: "SELECT d.dept_name, MAX(w.salary) AS max_salary FROM departments d JOIN workers w ON d.id = w.department_id GROUP BY d.dept_name ORDER BY max_salary DESC;",
          hints: ["用 JOIN 把 departments 和 workers 連接起來，取代子查詢","GROUP BY 部門後用 MAX(salary) 就能算出每個部門的最高薪資","JOIN + GROUP BY 只需要掃描 workers 表一次，比相關子查詢高效得多"],
          explanation: "相關子查詢（correlated subquery）對外層每一列都要執行一次內層查詢，當部門有 N 個時就要掃 N 次 workers 表（O(N) 次全表掃描）。改用 JOIN + GROUP BY 後，只需要掃描 workers 表一次就能算出所有部門的聚合結果。在百萬筆資料下，這個差異可以從 60 秒降到 1 秒以內。這是面試中最常考的 SQL 優化模式之一。",
          frameworkTip: "SQL 優化的第一直覺：看到 SELECT 子句或 WHERE 子句中的相關子查詢 → 考慮能否改寫成 JOIN + GROUP BY。這幾乎永遠更快。",
        },
        {
          id: 5,
          name: "複雜聚合與字串處理",
          type: "code",
          difficulty: "hard",
          sourceTag: "Airbnb 面試題",
          scenario: {
            title: "房東熱門度與平均房價分析",
            narrative: "你在 Airbnb 的 Data Team，需要分析房東的熱門程度和定價策略。每筆房源紀錄中，host_name 欄位的格式是「名字 姓氏」。你需要依照房東分組，計算每位房東的房源數量和平均每晚價格。\n\n資料表結構：listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER)",
            data: [{"id":1,"host_name":"John Smith","neighbourhood":"大安區","room_type":"Entire home","price":3200,"reviews_count":45},{"id":2,"host_name":"John Smith","neighbourhood":"信義區","room_type":"Private room","price":1800,"reviews_count":32},{"id":3,"host_name":"Mary Chen","neighbourhood":"中山區","room_type":"Entire home","price":4500,"reviews_count":78},{"id":4,"host_name":"Mary Chen","neighbourhood":"大安區","room_type":"Entire home","price":5200,"reviews_count":91},{"id":5,"host_name":"Mary Chen","neighbourhood":"松山區","room_type":"Private room","price":2100,"reviews_count":25}],
            dataCaption: "listings 資料表（部分範例）",
          },
          question: "查詢每位房東的房源數量、平均價格（四捨五入到整數）和總評論數，篩選出房源數量 >= 2 的房東，按總評論數由高到低排序。",
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
          starterCode: "SELECT\n  host_name,\n  -- 房源數量,\n  -- 平均價格（四捨五入）,\n  -- 總評論數\nFROM listings\nGROUP BY host_name\n-- 篩選條件？\n-- 排序？;",
          expectedQuery: "SELECT host_name, COUNT(*) AS listing_count, ROUND(AVG(price)) AS avg_price, SUM(reviews_count) AS total_reviews FROM listings GROUP BY host_name HAVING COUNT(*) >= 2 ORDER BY total_reviews DESC;",
          hints: ["COUNT(*) 計算每位房東的房源數量","ROUND(AVG(price)) 計算平均價格並四捨五入","用 HAVING 在 GROUP BY 之後篩選，而不是 WHERE"],
          explanation: "這題綜合考了 GROUP BY、聚合函式（COUNT、AVG、SUM）、ROUND 函式、HAVING 篩選和 ORDER BY 排序。HAVING 和 WHERE 的差異是面試高頻考點：WHERE 在分組前篩選（篩原始列），HAVING 在分組後篩選（篩聚合結果）。這裡要篩選「房源數量 >= 2」，因為 COUNT(*) 是聚合結果，所以必須用 HAVING。",
          frameworkTip: "聚合查詢的完整結構：SELECT 聚合函式 → FROM → WHERE（分組前篩選）→ GROUP BY → HAVING（分組後篩選）→ ORDER BY。面試時寫出完整結構展示你的 SQL 基本功。",
        },

