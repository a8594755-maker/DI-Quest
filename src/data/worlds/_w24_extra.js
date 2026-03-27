/**
 * World 24 Extra Challenges
 * Inspired by LeetCode SQL 50 — original scenarios, Traditional Chinese content
 * Append these to the corresponding quests in sql.js
 */

export const w24Extra = {
  '24-1': [
    {
      id: 4,
      name: '自連接：績效成長偵測',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '哪些天的業績比前一天高？',
        narrative: '營運主管想知道哪些天的門市業績比前一天成長了。你手上有每日業績記錄表，需要用自連接（Self-Join）找出「當天業績 > 前一天業績」的日期。\n\n資料表：\n- daily_metrics (id INTEGER, record_date TEXT, revenue REAL)',
      },
      question: '寫一段 SQL，找出業績比前一天高的日期，顯示該天的 id、日期和業績。',
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
      hints: [
        '自連接就是把同一張表 JOIN 自己，用不同的別名（t1, t2）',
        'SQLite 的 date() 函數可以做日期計算：date(record_date, \'+1 day\') 代表後一天',
      ],
      explanation: "自連接（Self-Join）是把同一張表視為兩張表來比較。這裡 t1 代表「今天」，t2 代表「昨天」，用 date(t1.record_date) = date(t2.record_date, '+1 day') 建立「今天 = 昨天 +1 天」的關聯。接著用 WHERE t1.revenue > t2.revenue 篩出成長的天數。這是經典的「跟前一筆比較」模式，在趨勢分析中很常用。",
      frameworkTip: '自連接的關鍵是想清楚「誰跟誰比」：先定義 t1 是什麼角色、t2 是什麼角色，再用 ON 描述它們的關聯',
    },
    {
      id: 5,
      name: 'Cross Join + Left Join 組合',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '員工培訓完成度報表',
        narrative: 'HR 主管需要一份報表：每位員工對每門培訓課程的完成狀況。即使某員工沒修某門課，也要在報表中顯示（完成次數為 0）。這需要先用 CROSS JOIN 產生所有組合，再用 LEFT JOIN 帶入實際完成資料。\n\n資料表：\n- employees (id INTEGER, name TEXT)\n- courses (id INTEGER, course_name TEXT)\n- completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT)',
      },
      question: '寫一段 SQL，顯示每位員工對每門課的完成次數。沒修過的課程顯示 0。',
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
      hints: [
        'CROSS JOIN 會產生兩張表的「全排列組合」（3 員工 x 3 課程 = 9 筆）',
        'LEFT JOIN completions 時要同時匹配 employee_id 和 course_id',
        'COUNT(comp.id) 只會計算非 NULL 的值，所以沒完成的課程會是 0',
      ],
      explanation: "CROSS JOIN + LEFT JOIN 是產生「完整矩陣報表」的經典模式。CROSS JOIN 先建立所有員工與課程的組合（確保每個組合都有一行），LEFT JOIN 再帶入實際的完成記錄。COUNT(comp.id) 只計算有匹配的行，沒有完成的自然是 0。這在實務中非常常用：出勤報表、考試成績、產品 x 地區銷售矩陣等。",
      frameworkTip: '面試遇到「即使沒有資料也要顯示」的需求，想到 CROSS JOIN 建骨架 + LEFT JOIN 填資料，是一個強力的解題模式',
    },
    {
      id: 6,
      name: 'LEFT JOIN + 條件聚合',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '用戶驗證成功率分析',
        narrative: '產品團隊在分析用戶身分驗證流程的效果。每位用戶可能發起多次驗證請求，每次結果是 confirmed 或 timeout。PM 想知道每位用戶的「驗證成功率」：confirmed 次數 / 總驗證次數。沒有發起過驗證的用戶，成功率顯示 0.00。\n\n資料表：\n- signups (user_id INTEGER, signup_date TEXT)\n- confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT)\n  action 欄位值為 confirmed 或 timeout',
      },
      question: '寫一段 SQL，計算每位用戶的驗證成功率（保留兩位小數），沒有驗證記錄的用戶顯示 0.00。',
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
      hints: [
        'LEFT JOIN 確保沒有驗證記錄的用戶也會出現',
        'SUM(CASE WHEN action = \'confirmed\' THEN 1 ELSE 0 END) 計算成功次數',
        'NULLIF(COUNT(c.id), 0) 避免除以 0，再用 COALESCE 把 NULL 轉成 0.00',
      ],
      explanation: "這題結合了 LEFT JOIN（保留所有用戶）、CASE WHEN（條件計數）、NULLIF（避免除以零）和 COALESCE（處理 NULL）四個技巧。LEFT JOIN 確保沒有驗證記錄的用戶也出現，CASE WHEN 在聚合中做條件計數，NULLIF 避免除以 0 的錯誤，COALESCE 把沒有記錄的用戶設為 0.00。這種「比率計算」模式在轉換率、完成率等分析中非常常見。",
      frameworkTip: '計算比率時的防禦性寫法：COALESCE(成功數 / NULLIF(總數, 0), 0) -- 同時處理「沒有分母」和「分母為零」的情況',
    },
  ],

  '24-2': [
    {
      id: 4,
      name: 'CASE WHEN 數學判斷',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '包裝尺寸可行性檢查',
        narrative: '物流團隊收到一批貨物的三邊尺寸資料，需要判斷哪些貨物可以裝進三角形截面的特殊包裝盒。三角形成立的條件是：任意兩邊之和大於第三邊。你需要幫他們標記每筆貨物的三邊是否能構成三角形。\n\n資料表：\n- packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT)',
      },
      question: '寫一段 SQL，判斷每筆貨物的三邊是否能構成三角形，標記為 Yes 或 No。',
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
      hints: [
        '三角形成立需要同時滿足三個條件，用 AND 連接',
        'a + b > c 且 a + c > b 且 b + c > a',
      ],
      explanation: "CASE WHEN 不只能做分類，也能做數學判斷。三角形不等式要求三個條件同時成立：任意兩邊之和必須大於第三邊。這裡用 AND 把三個條件串起來，全部為真才標記 Yes。這種「業務規則 -> SQL 條件」的轉換能力在實務中很重要：信用評分規則、庫存預警條件、合規性檢查等都用類似的邏輯。",
      frameworkTip: '把業務規則翻譯成 SQL 條件時，先列出所有需要滿足的條件，再決定是 AND（全部要滿足）還是 OR（任一即可）',
    },
    {
      id: 5,
      name: 'CASE WHEN + 子查詢：主要歸屬判斷',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '員工主要部門歸屬',
        narrative: '公司有些員工同時屬於多個部門（跨部門專案），HR 系統有標記哪個是主要部門（primary_flag = Y）。但有些員工只屬於一個部門，這種情況沒有標記 primary_flag。\n\nHR 主管需要一份「每位員工的主要部門」清單：\n- 如果有標記 primary_flag = Y，就用那個部門\n- 如果只屬於一個部門，那就是主要部門\n\n資料表：\n- employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT)',
      },
      question: '寫一段 SQL，找出每位員工的主要部門。',
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
      hints: [
        '兩種情況用 OR 串接：有標記的 + 只有一個部門的',
        '用子查詢找出「只屬於一個部門的員工」：GROUP BY employee_id HAVING COUNT(*) = 1',
      ],
      explanation: "這題的關鍵是處理兩種不同的情況：(1) 有明確標記 primary_flag = 'Y' 的員工，直接取該部門 (2) 只屬於一個部門的員工（沒有標記的），用子查詢 HAVING COUNT(*) = 1 找出來。兩個條件用 OR 合併。這種「分情況處理」的邏輯在實務中很常見：不同類型的用戶有不同的判斷規則。",
      frameworkTip: '遇到「多種情況」的題目，先列出所有情況，再逐一寫出對應的 WHERE 條件，最後用 OR / UNION 合併',
    },
  ],

  '24-3': [
    {
      id: 4,
      name: '子查詢：找第二高的值',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '第二高薪資查詢',
        narrative: 'HR 主管想知道公司裡第二高的薪資是多少，用來做薪資分級的參考基準。注意：如果沒有第二高的薪資（例如所有人薪資相同），應該回傳 NULL。\n\n資料表：\n- employees (id INTEGER, name TEXT, salary REAL, department TEXT)',
      },
      question: '寫一段 SQL，查詢第二高的薪資。如果不存在，回傳 NULL。',
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
      hints: [
        '先用子查詢找出最高薪資，再找「小於最高薪資的最大值」',
        'MAX() 如果沒有符合的行，自然會回傳 NULL',
        '注意要用 DISTINCT 的概念：如果最高薪資有多人，第二高不是重複的那個',
      ],
      explanation: "「找第 N 高」是經典的子查詢題目。策略是：先用子查詢找出最高值 (SELECT MAX(salary))，再在外層查詢中找「小於最高值的最大值」。如果所有人薪資相同，WHERE salary < MAX 不會匹配到任何行，MAX() 自然回傳 NULL。這比 LIMIT + OFFSET 的解法更優雅，也更能展示你對子查詢的理解。",
      frameworkTip: '面試中「找第 N 高」的題目，先說排除法（用子查詢排除前 N-1），再提 DENSE_RANK 的 window function 解法作為替代方案',
    },
    {
      id: 5,
      name: 'UNION 子查詢：雙維度排行',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '餐廳評價分析報告',
        narrative: '餐飲平台想做一份簡報，需要兩個資訊放在同一份結果中：\n1. 評價數量最多的用戶名稱\n2. 2026 年 2 月平均評分最高的餐廳名稱\n\n兩筆資料用 UNION 合併成一張表。\n\n資料表：\n- users (user_id INTEGER, name TEXT)\n- restaurants (restaurant_id INTEGER, name TEXT)\n- reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT)',
      },
      question: '寫一段 SQL，用 UNION 合併兩個查詢結果：(1) 評價數最多的用戶 (2) 2026-02 月平均評分最高的餐廳。',
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
      hints: [
        'UNION ALL 合併兩個 SELECT 結果，要求欄位數量和型態一致',
        '每個子查詢要用 ORDER BY + LIMIT 1 找到「最多/最高」的那一筆',
        '平手時用名字字母排序（ORDER BY name）作為決勝條件',
      ],
      explanation: "UNION ALL 可以把兩個完全不同的查詢結果合併成一張表，前提是欄位數量和型態要一致。這裡第一個查詢找評價最多的用戶，第二個找特定月份平均評分最高的餐廳。每個子查詢各自做 JOIN + GROUP BY + ORDER BY + LIMIT。這種「多維度排行」的需求在產品報告中很常見：同時呈現不同角度的 Top 1。",
      frameworkTip: 'UNION 的兩個 SELECT 必須有相同數量和相容型態的欄位。欄位名稱以第一個 SELECT 為準。',
    },
  ],

  '24-4': [
    {
      id: 3,
      name: 'CTE + Window：移動平均',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '7 天移動平均營收',
        narrative: '財務主管想看每天的「7 天移動平均營收」，用來平滑每日的波動，觀察長期趨勢。移動平均的定義是：該天往前算 7 天（含當天）的平均日營收。只顯示有足夠 7 天資料的日期。\n\n資料表：\n- daily_revenue (visit_date TEXT, revenue REAL)',
      },
      question: '寫一段 SQL，用 CTE + Window Function 計算每天的 7 天移動平均營收（保留兩位小數）。',
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
      hints: [
        'Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了 7 天的窗口',
        '用 ROW_NUMBER() 編號，WHERE rn >= 7 確保只顯示有完整 7 天資料的日期',
        'AVG() OVER (...) 可以在窗口內計算平均值',
      ],
      explanation: "移動平均是時間序列分析的基礎工具。Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了一個滑動窗口：從前 6 行到當前行（共 7 行）。AVG(revenue) OVER (...) 在這個窗口內算平均。CTE 先計算所有行的移動平均和行號，外層用 WHERE rn >= 7 確保只顯示有完整 7 天資料的結果。這在營運 dashboard 中非常常用。",
      frameworkTip: 'ROWS BETWEEN N PRECEDING AND CURRENT ROW 是定義移動窗口的標準寫法。面試中提到「移動平均」時，秀出這個語法會讓人印象深刻',
    },
    {
      id: 4,
      name: 'CTE + UNION：雙向關係統計',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '找出最多合作夥伴的員工',
        narrative: '公司有一個「專案配對」系統，記錄了哪些員工曾經一起合作過專案。配對是雙向的：如果 A 跟 B 合作，代表 B 也跟 A 合作。管理層想知道哪位員工的合作夥伴最多（社交網絡最廣）。\n\n資料表：\n- project_pairs (requester_id INTEGER, accepter_id INTEGER)\n  每筆記錄代表 requester 發起合作邀請，accepter 接受',
      },
      question: '寫一段 SQL，找出合作夥伴最多的員工 ID 和合作夥伴數量。',
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
      hints: [
        '雙向關係的處理：把 requester_id 和 accepter_id 分別當作 employee_id，用 UNION ALL 合併',
        '每出現一次就代表有一個合作夥伴，COUNT(*) 就是夥伴數量',
        'ORDER BY ... DESC LIMIT 1 找到最多的那位',
      ],
      explanation: "雙向關係（如友誼、合作）在資料庫中通常只存一個方向。要計算每個人的「連接數」，需要把兩個方向都算進去。CTE 用 UNION ALL 把 requester_id 和 accepter_id 都轉成統一的 employee_id，這樣每次出現都代表一次合作關係。再用 GROUP BY + COUNT(*) 統計每人的合作夥伴數。這是社交網絡分析的基礎技巧。",
      frameworkTip: '遇到雙向關係的題目，第一步永遠是用 UNION ALL 把兩個方向攤平成統一格式，然後再做聚合分析',
    },
  ],

  '24-5': [
    {
      id: 4,
      name: '標記重複記錄（保留最小 ID）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '重複 Email 清理標記',
        narrative: '在前面的挑戰中你已經找到了重複的 email。現在要進一步：找出應該被刪除的重複記錄。規則是「保留 id 最小的那筆，標記其他為重複」。你不會真的刪除資料（DELETE 太危險了），而是先查詢出所有應該被標記為重複的記錄。\n\n資料表：\n- contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)',
      },
      question: '寫一段 SQL，找出所有重複 email 中應該被移除的記錄（保留每組 id 最小的那筆，列出其餘的）。',
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
      hints: [
        '用 correlated subquery 找出同一 email 的最小 id',
        'WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email)',
        '如果 c1.id 大於同 email 的最小 id，代表它是重複的',
      ],
      explanation: "這是「去重保留最小 ID」的經典模式。Correlated subquery (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) 對每一行找出同 email 的最小 id。如果當前行的 id 大於這個最小值，就代表它是重複的、應該被移除。實務中，這個查詢通常是清理資料的第一步：先用 SELECT 確認要刪除的行，確認無誤後再改成 DELETE。",
      frameworkTip: '資料清理的黃金法則：先用 SELECT 查出要處理的資料，人工確認後再執行 DELETE/UPDATE。面試中提到這個習慣，展示你對生產資料的謹慎態度',
    },
  ],
};
