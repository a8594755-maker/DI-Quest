/**
 * World 24: SQL 分析核心
 * 多表連接、子查詢與 CTE，掌握資料整合的核心技能
 * Original challenges only (no sourceTag)
 */

export const w24Generated = {
  id: 24,
  name: 'SQL 分析核心',
  emoji: '🔗',
  description: '多表連接、子查詢與 CTE，掌握資料整合的核心技能',
  color: 'from-teal-500 to-cyan-500',
  quests: [
    // ──────────────────────────────────────────
    // Quest 24-1: 多表連接進階
    // ──────────────────────────────────────────
    {
      id: '24-1',
      name: '多表連接進階',
      description: 'INNER JOIN、LEFT JOIN、三表 JOIN，掌握多表查詢的核心能力',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'INNER JOIN 基礎',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '訂單與客戶資料合併',
            narrative: '電商營運團隊需要一份報表，列出每筆訂單對應的客戶名稱與訂單金額。訂單資料和客戶資料分別存在兩張表中，你需要用 INNER JOIN 將它們合併。\n\n資料表：\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
            data: [
              { customer: 'Alice', order_id: 1, amount: 1200, order_date: '2026-01-10' },
              { customer: 'Bob', order_id: 2, amount: 850, order_date: '2026-01-12' },
              { customer: 'Alice', order_id: 3, amount: 2300, order_date: '2026-01-15' },
            ],
            dataCaption: '預期結果（部分範例）',
          },
          question: '寫一段 SQL，用 INNER JOIN 列出每筆訂單的客戶名稱、訂單金額和日期，按日期排序。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
            INSERT INTO customers VALUES (1, 'Alice', '台北');
            INSERT INTO customers VALUES (2, 'Bob', '台中');
            INSERT INTO customers VALUES (3, 'Charlie', '高雄');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2026-01-10');
            INSERT INTO orders VALUES (2, 2, 850.00, '2026-01-12');
            INSERT INTO orders VALUES (3, 1, 2300.00, '2026-01-15');
            INSERT INTO orders VALUES (4, 2, 670.00, '2026-01-18');
            INSERT INTO orders VALUES (5, 1, 990.00, '2026-01-22');
          `,
          starterCode: "SELECT c.name, o.amount, o.order_date\nFROM orders o\n-- 用 INNER JOIN 連接客戶表\nORDER BY o.order_date;",
          expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o INNER JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;",
          hints: [
            'INNER JOIN 的語法：FROM table1 INNER JOIN table2 ON table1.key = table2.key',
            '用 ON 指定連接條件：orders 的 customer_id 對應 customers 的 id',
          ],
          explanation: "INNER JOIN 只會回傳兩張表中有匹配的行。這裡用 ON o.customer_id = c.id 把訂單和客戶連起來。如果某個客戶沒有訂單，或某筆訂單的 customer_id 不存在，都不會出現在結果中。這是最基本也最常用的 JOIN 類型。",
          frameworkTip: '面試中遇到「合併兩張表」的需求，先確認用什麼欄位連接（外鍵關係），再決定用 INNER 還是 LEFT JOIN',
        },
        {
          id: 2,
          name: 'LEFT JOIN 找缺失',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '找出沒有下單的客戶',
            narrative: '行銷團隊想針對從未下單的客戶發送促銷郵件。你需要找出在客戶表中有資料、但在訂單表中沒有任何記錄的客戶。這是 LEFT JOIN + IS NULL 的經典應用。\n\n資料表：\n- customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
          },
          question: '寫一段 SQL，找出所有沒有下過任何訂單的客戶，顯示客戶名稱和 email。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com', '2025-06-01');
            INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com', '2025-07-15');
            INSERT INTO customers VALUES (3, 'Charlie', 'charlie@example.com', '2025-08-20');
            INSERT INTO customers VALUES (4, 'Diana', 'diana@example.com', '2025-09-10');
            INSERT INTO customers VALUES (5, 'Eve', 'eve@example.com', '2025-10-05');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2025-08-10');
            INSERT INTO orders VALUES (2, 2, 850.00, '2025-09-12');
            INSERT INTO orders VALUES (3, 1, 2300.00, '2025-10-15');
          `,
          starterCode: "SELECT c.name, c.email\nFROM customers c\n-- 用什麼 JOIN？\n-- 怎麼篩選「沒有訂單」的客戶？",
          expectedQuery: "SELECT c.name, c.email FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;",
          hints: [
            'LEFT JOIN 會保留左表的所有行，右表沒有匹配的會填 NULL',
            '用 WHERE o.id IS NULL 篩選出右表沒有匹配的行，就是「沒有訂單」的客戶',
          ],
          explanation: "LEFT JOIN 保留左表（customers）的所有行。對於沒有訂單的客戶，orders 那邊的欄位全部會是 NULL。接著用 WHERE o.id IS NULL 篩選出這些行，就能找到「沒有下單的客戶」。這是 SQL 中找「不存在」關聯的經典模式，比用 NOT IN 子查詢更有效率。",
          frameworkTip: '「找缺失」的需求（沒下單的客戶、沒參加活動的用戶）在面試中非常常見，LEFT JOIN + IS NULL 是標準解法',
        },
        {
          id: 3,
          name: '三表 JOIN',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '訂單明細完整報表',
            narrative: '財務部門需要一份完整的訂單明細報表，包含客戶資訊、訂單資訊和商品資訊。這些資料分散在三張表中，你需要用多個 JOIN 把它們串起來。\n\n資料表：\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT)\n- order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL)',
          },
          question: '寫一段 SQL，列出每筆訂單明細：客戶名稱、訂單日期、商品名稱、數量和小計（quantity * unit_price），按訂單日期排序。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
            INSERT INTO customers VALUES (1, 'Alice', '台北');
            INSERT INTO customers VALUES (2, 'Bob', '台中');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, order_date TEXT);
            INSERT INTO orders VALUES (101, 1, '2026-01-10');
            INSERT INTO orders VALUES (102, 2, '2026-01-12');
            INSERT INTO orders VALUES (103, 1, '2026-01-15');
            CREATE TABLE order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL);
            INSERT INTO order_items VALUES (1, 101, '無線滑鼠', 2, 350.00);
            INSERT INTO order_items VALUES (2, 101, 'USB 集線器', 1, 280.00);
            INSERT INTO order_items VALUES (3, 102, '機械鍵盤', 1, 2400.00);
            INSERT INTO order_items VALUES (4, 103, '螢幕支架', 1, 1200.00);
            INSERT INTO order_items VALUES (5, 103, '滑鼠墊', 3, 150.00);
          `,
          starterCode: "SELECT c.name, o.order_date, oi.product_name, oi.quantity,\n       -- 計算小計\nFROM order_items oi\n-- JOIN 訂單表\n-- JOIN 客戶表\nORDER BY o.order_date, oi.id;",
          expectedQuery: "SELECT c.name, o.order_date, oi.product_name, oi.quantity, oi.quantity * oi.unit_price AS subtotal FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date, oi.id;",
          hints: [
            '三表 JOIN 就是連續寫兩個 JOIN：先連一張，再連下一張',
            'order_items 透過 order_id 連到 orders，orders 再透過 customer_id 連到 customers',
            '小計可以直接用算式：oi.quantity * oi.unit_price AS subtotal',
          ],
          explanation: "多表 JOIN 的關鍵是找出表之間的連接路徑。order_items 透過 order_id 連到 orders，orders 再透過 customer_id 連到 customers。寫法就是連續的 JOIN ... ON ...。實務中常見 3~5 張表的 JOIN，重點是理清楚每張表的主鍵和外鍵關係。",
          frameworkTip: '多表 JOIN 的面試技巧：先畫出 ER 關係圖（表之間的連線），再依序寫 JOIN，可以避免遺漏',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-2: 條件邏輯與 NULL 處理
    // ──────────────────────────────────────────
    {
      id: '24-2',
      name: '條件邏輯與 NULL 處理',
      description: 'CASE WHEN、COALESCE 與 NULL 陷阱，讓查詢更靈活',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'CASE WHEN 分類',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '客戶消費等級分類',
            narrative: '行銷部門想將客戶依照累計消費金額分成三個等級：VIP（消費 >= 10000）、一般（消費 >= 3000）、新客（消費 < 3000）。你需要用 CASE WHEN 來建立分類欄位。\n\n資料表：\n- customer_spending (customer_id INTEGER, name TEXT, total_spent REAL)',
          },
          question: '寫一段 SQL，為每位客戶加上 spending_tier 欄位：total_spent >= 10000 為 "VIP"、>= 3000 為 "一般"、其餘為 "新客"。按 total_spent 由大到小排序。',
          sampleSchema: `
            CREATE TABLE customer_spending (customer_id INTEGER, name TEXT, total_spent REAL);
            INSERT INTO customer_spending VALUES (1, 'Alice', 15200.00);
            INSERT INTO customer_spending VALUES (2, 'Bob', 4800.00);
            INSERT INTO customer_spending VALUES (3, 'Charlie', 1200.00);
            INSERT INTO customer_spending VALUES (4, 'Diana', 32000.00);
            INSERT INTO customer_spending VALUES (5, 'Eve', 890.00);
            INSERT INTO customer_spending VALUES (6, 'Frank', 7600.00);
          `,
          starterCode: "SELECT name, total_spent,\n       CASE\n         -- 依金額分三個等級\n       END AS spending_tier\nFROM customer_spending\nORDER BY total_spent DESC;",
          expectedQuery: "SELECT name, total_spent, CASE WHEN total_spent >= 10000 THEN 'VIP' WHEN total_spent >= 3000 THEN '一般' ELSE '新客' END AS spending_tier FROM customer_spending ORDER BY total_spent DESC;",
          hints: [
            'CASE WHEN 的條件會由上往下逐一判斷，第一個符合的就會被選中',
            '因為從大到小判斷，>= 10000 先判斷，通過的就不會再判斷 >= 3000',
            '不符合任何條件的會走到 ELSE',
          ],
          explanation: "CASE WHEN 是 SQL 中的條件表達式，類似程式語言的 if-else。條件由上往下判斷，第一個符合的就回傳對應值。這裡先判斷 >= 10000（VIP），再判斷 >= 3000（一般），其餘歸為新客。CASE WHEN 在資料分析中非常實用，常用於分群、標籤化和建立衍生欄位。",
          frameworkTip: '面試中用 CASE WHEN 展示「資料分群」能力，是加分項目。記得考慮邊界值和 NULL 的情況',
        },
        {
          id: 2,
          name: 'NULL 處理',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '員工聯絡資訊清理',
            narrative: '人資部門在整理員工聯絡資訊，發現有些員工的 phone 或 email 欄位是 NULL。主管需要一份報表，如果 phone 是 NULL 就顯示 "未提供"，並計算每個部門有多少員工缺少電話號碼。\n\n資料表：\n- employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT)',
          },
          question: '寫一段 SQL：(1) 使用 COALESCE 將 NULL 的 phone 替換為 "未提供"；(2) 計算每個部門缺少電話的人數和總人數。',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT);
            INSERT INTO employees VALUES (1, 'Alice', '工程部', '0912345678', 'alice@corp.com');
            INSERT INTO employees VALUES (2, 'Bob', '工程部', NULL, 'bob@corp.com');
            INSERT INTO employees VALUES (3, 'Charlie', '行銷部', '0923456789', NULL);
            INSERT INTO employees VALUES (4, 'Diana', '行銷部', NULL, 'diana@corp.com');
            INSERT INTO employees VALUES (5, 'Eve', '工程部', '0934567890', 'eve@corp.com');
            INSERT INTO employees VALUES (6, 'Frank', '行銷部', NULL, NULL);
            INSERT INTO employees VALUES (7, 'Grace', '人資部', NULL, 'grace@corp.com');
            INSERT INTO employees VALUES (8, 'Henry', '人資部', '0956789012', 'henry@corp.com');
          `,
          starterCode: "SELECT department,\n       COUNT(*) AS total_employees,\n       -- 計算缺少電話的人數\n       -- 提示：phone IS NULL 的數量\nFROM employees\nGROUP BY department\nORDER BY department;",
          expectedQuery: "SELECT department, COUNT(*) AS total_employees, SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS missing_phone_count FROM employees GROUP BY department ORDER BY department;",
          hints: [
            'COALESCE(phone, "未提供") 可以把 NULL 替換為預設值',
            '計算 NULL 數量可以用 SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END)',
            'COUNT(phone) 只會計算非 NULL 的值，所以 COUNT(*) - COUNT(phone) 也能得到 NULL 數量',
          ],
          explanation: "COALESCE 接受多個參數，回傳第一個非 NULL 的值，是處理 NULL 的標準工具。計算 NULL 數量有兩種方法：(1) SUM(CASE WHEN col IS NULL THEN 1 ELSE 0 END)，(2) COUNT(*) - COUNT(col)。兩者結果相同，但 CASE WHEN 方式更有彈性，可以同時處理多種條件。",
          frameworkTip: 'NULL 處理是面試中的高頻考點。記住：NULL 不等於空字串，NULL 參與任何比較都是 NULL，要用 IS NULL / IS NOT NULL',
        },
        {
          id: 3,
          name: 'NULL 陷阱',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'SQL 中的 NULL 行為測驗',
            narrative: '在 SQL 中，NULL 代表「未知值」，它的行為和一般值很不同。很多初學者在這裡踩坑。以下是一張包含 NULL 的表：\n\nscores (student TEXT, math_score INTEGER, english_score INTEGER)\n\n| student | math_score | english_score |\n|---------|-----------|---------------|\n| Alice   | 85        | 90            |\n| Bob     | NULL      | 75            |\n| Charlie | 70        | NULL          |\n| Diana   | NULL      | NULL          |',
          },
          question: '以下哪個 SQL 的結果數量是正確的？\n\nSELECT COUNT(*) FROM scores; -- 結果 A\nSELECT COUNT(math_score) FROM scores; -- 結果 B\nSELECT * FROM scores WHERE math_score != 85; -- 結果 C\nSELECT * FROM scores WHERE math_score IS NULL OR math_score != 85; -- 結果 D',
          options: [
            { id: 'A', text: 'A=4, B=4, C=2, D=3', explanation: '錯誤。COUNT(math_score) 不計算 NULL，所以 B 不是 4' },
            { id: 'B', text: 'A=4, B=2, C=1, D=3', explanation: '正確！COUNT(*) 計所有行 =4；COUNT(math_score) 只計非 NULL =2；!= 85 不含 NULL 行 =1（只有 Charlie）；加上 IS NULL 才能撈到 Bob 和 Diana =3' },
            { id: 'C', text: 'A=4, B=2, C=2, D=4', explanation: '錯誤。math_score != 85 不會選到 NULL 的行，C 只有 1 行' },
            { id: 'D', text: 'A=4, B=2, C=3, D=3', explanation: '錯誤。NULL != 85 的結果是 NULL（不是 TRUE），所以 C 不是 3' },
          ],
          correctAnswer: 'B',
          hints: [
            'COUNT(*) 計算所有行，COUNT(column) 只計算該欄位非 NULL 的行',
            'NULL 參與任何比較運算（=, !=, >, <）結果都是 NULL，不是 TRUE 也不是 FALSE',
            'WHERE 只保留條件為 TRUE 的行，NULL 和 FALSE 的行都會被過濾掉',
          ],
          explanation: "NULL 的核心概念是「未知值」。COUNT(*) 計所有行不管內容；COUNT(col) 跳過 NULL。最大陷阱：NULL != 85 的結果是 NULL（未知），不是 TRUE，所以 WHERE math_score != 85 不會回傳 NULL 行。要包含 NULL 行必須明確寫 IS NULL。這是面試中非常高頻的考點。",
          frameworkTip: '面試中遇到 NULL 問題，三個關鍵記住：(1) NULL 不等於任何值包括 NULL 本身 (2) 用 IS NULL 不用 = NULL (3) 聚合函數通常忽略 NULL',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-3: 子查詢
    // ──────────────────────────────────────────
    {
      id: '24-3',
      name: '子查詢',
      description: '掌握 WHERE IN、相關子查詢和 EXISTS 的使用時機',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'WHERE IN 子查詢',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '找出有退貨記錄的商品',
            narrative: '品管團隊想了解哪些商品曾經被退貨。退貨記錄在 returns 表中，商品資訊在 products 表中。你需要用子查詢找出在退貨表中出現過的商品。\n\n資料表：\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT)',
          },
          question: '寫一段 SQL，用 WHERE IN 子查詢找出所有曾被退貨的商品，顯示商品名稱、類別和價格。',
          sampleSchema: `
            CREATE TABLE products (id INTEGER, name TEXT, category TEXT, price REAL);
            INSERT INTO products VALUES (1, '無線耳機', '電子', 1200.00);
            INSERT INTO products VALUES (2, '運動水壺', '生活', 350.00);
            INSERT INTO products VALUES (3, '筆記型電腦', '電子', 32000.00);
            INSERT INTO products VALUES (4, '瑜伽墊', '運動', 800.00);
            INSERT INTO products VALUES (5, '藍牙喇叭', '電子', 2400.00);
            CREATE TABLE returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT);
            INSERT INTO returns VALUES (1, 1, '2026-01-15', '瑕疵品');
            INSERT INTO returns VALUES (2, 3, '2026-01-20', '規格不符');
            INSERT INTO returns VALUES (3, 1, '2026-02-01', '不滿意');
            INSERT INTO returns VALUES (4, 5, '2026-02-10', '瑕疵品');
          `,
          starterCode: "SELECT name, category, price\nFROM products\nWHERE id IN (\n  -- 子查詢：找出被退貨的商品 id\n);",
          expectedQuery: "SELECT name, category, price FROM products WHERE id IN (SELECT DISTINCT product_id FROM returns);",
          hints: [
            'WHERE IN (子查詢) 可以篩選「存在於子查詢結果中」的行',
            '子查詢需要從 returns 表中取出所有被退貨的 product_id',
            '加上 DISTINCT 可以避免子查詢回傳重複值（雖然 IN 本身不受影響）',
          ],
          explanation: "WHERE IN (子查詢) 是最直覺的子查詢用法：先用子查詢找出一組值，再用外部查詢篩選匹配的行。這裡子查詢從 returns 表取出所有 product_id，外部查詢再從 products 中篩選。這種模式適合「找出符合某個條件的相關資料」。",
          frameworkTip: '面試中 WHERE IN 子查詢是基本功，但要注意：當子查詢結果很大時，效能可能不如 JOIN 或 EXISTS',
        },
        {
          id: 2,
          name: '相關子查詢',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '找出每個部門薪資最高的員工',
            narrative: '人資主管想知道每個部門中薪資最高的員工是誰。這需要用相關子查詢（Correlated Subquery）：子查詢會參考外部查詢的值，對每一行重新計算。\n\n資料表：\n- staff (id INTEGER, name TEXT, department TEXT, salary REAL)',
          },
          question: '寫一段 SQL，用相關子查詢找出每個部門中薪資最高的員工，顯示姓名、部門和薪資。',
          sampleSchema: `
            CREATE TABLE staff (id INTEGER, name TEXT, department TEXT, salary REAL);
            INSERT INTO staff VALUES (1, 'Alice', '工程部', 85000.00);
            INSERT INTO staff VALUES (2, 'Bob', '工程部', 72000.00);
            INSERT INTO staff VALUES (3, 'Charlie', '行銷部', 68000.00);
            INSERT INTO staff VALUES (4, 'Diana', '行銷部', 75000.00);
            INSERT INTO staff VALUES (5, 'Eve', '工程部', 91000.00);
            INSERT INTO staff VALUES (6, 'Frank', '人資部', 65000.00);
            INSERT INTO staff VALUES (7, 'Grace', '人資部', 70000.00);
          `,
          starterCode: "SELECT name, department, salary\nFROM staff s1\nWHERE salary = (\n  -- 子查詢：找出同部門的最高薪資\n  -- 提示：子查詢要參考外部的 s1.department\n);",
          expectedQuery: "SELECT name, department, salary FROM staff s1 WHERE salary = (SELECT MAX(salary) FROM staff s2 WHERE s2.department = s1.department);",
          hints: [
            '相關子查詢的特點：子查詢中會用到外部查詢的欄位（例如 s1.department）',
            '子查詢找同部門的 MAX(salary)，外部查詢篩選 salary 等於該值的行',
            '如果同部門有多人並列最高薪，都會被選出來',
          ],
          explanation: "相關子查詢和普通子查詢的差別在於：子查詢參考了外部查詢的值（s1.department）。資料庫會對外部的每一行，用該行的 department 值去執行子查詢。雖然概念上像巢狀迴圈，但資料庫引擎會自動最佳化。這是找「每組最大/最小值對應行」的經典模式。",
          frameworkTip: '相關子查詢在面試中常考「每組 Top N」問題。替代方案包括：(1) JOIN + GROUP BY (2) 視窗函數 ROW_NUMBER()，建議都會',
        },
        {
          id: 3,
          name: 'EXISTS vs IN',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '找出有活躍訂閱的客戶',
            narrative: '營運團隊需要找出目前有至少一筆「活躍」訂閱的客戶。訂閱狀態為 "active" 的才算。相比 IN，EXISTS 在子查詢返回大量資料時通常更有效率，因為它找到第一筆匹配就停止。\n\n資料表：\n- customers (id INTEGER, name TEXT, email TEXT)\n- subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT)',
          },
          question: '用 EXISTS 子查詢找出有活躍訂閱的客戶，顯示客戶名稱和 email。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT);
            INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com');
            INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com');
            INSERT INTO customers VALUES (3, 'Charlie', 'charlie@example.com');
            INSERT INTO customers VALUES (4, 'Diana', 'diana@example.com');
            CREATE TABLE subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT);
            INSERT INTO subscriptions VALUES (1, 1, '月費方案', 'active', '2026-01-01');
            INSERT INTO subscriptions VALUES (2, 1, '年費方案', 'cancelled', '2025-01-01');
            INSERT INTO subscriptions VALUES (3, 2, '月費方案', 'expired', '2025-06-01');
            INSERT INTO subscriptions VALUES (4, 3, '季費方案', 'active', '2026-02-01');
            INSERT INTO subscriptions VALUES (5, 4, '月費方案', 'active', '2026-03-01');
          `,
          starterCode: "SELECT c.name, c.email\nFROM customers c\nWHERE EXISTS (\n  -- 子查詢：檢查是否有活躍訂閱\n  -- 提示：要同時匹配 customer_id 和 status\n);",
          expectedQuery: "SELECT c.name, c.email FROM customers c WHERE EXISTS (SELECT 1 FROM subscriptions s WHERE s.customer_id = c.id AND s.status = 'active');",
          hints: [
            'EXISTS 只檢查「子查詢是否回傳至少一行」，找到就立刻回傳 TRUE',
            'EXISTS 子查詢中的 SELECT 內容不重要（常寫 SELECT 1），重要的是 WHERE 條件',
            '子查詢需要同時比對 customer_id 和 status = "active"',
          ],
          explanation: "EXISTS 檢查子查詢「是否有結果」，有就是 TRUE。和 IN 的差別：IN 先執行子查詢產生完整清單再比對；EXISTS 逐行檢查，找到匹配就停止。當子查詢結果很大、或需要多個條件時，EXISTS 通常效能更好。子查詢中 SELECT 1 只是慣例，寫 SELECT * 也一樣。",
          frameworkTip: 'EXISTS vs IN 的選擇：子查詢結果小用 IN 直觀，子查詢結果大或條件複雜用 EXISTS 效率好。面試中說明你的選擇理由是加分的',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-4: CTE 與多層查詢
    // ──────────────────────────────────────────
    {
      id: '24-4',
      name: 'CTE 與多層查詢',
      description: '用 WITH 子句讓複雜查詢更清晰、更可讀',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: '基本 CTE',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '用 CTE 重寫客戶消費統計',
            narrative: '你需要找出消費金額超過平均值的客戶。用子查詢寫會比較難讀，CTE（Common Table Expression）可以把計算步驟拆開，讓邏輯更清楚。\n\n資料表：\n- orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT)',
          },
          question: '用 CTE 先計算每位客戶的總消費，再從中篩選出總消費超過所有客戶平均總消費的客戶。',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 'Alice', 3200.00, '2026-01-10');
            INSERT INTO orders VALUES (2, 2, 'Bob', 1500.00, '2026-01-12');
            INSERT INTO orders VALUES (3, 1, 'Alice', 2800.00, '2026-01-15');
            INSERT INTO orders VALUES (4, 3, 'Charlie', 950.00, '2026-01-18');
            INSERT INTO orders VALUES (5, 2, 'Bob', 4100.00, '2026-01-22');
            INSERT INTO orders VALUES (6, 4, 'Diana', 1200.00, '2026-01-25');
            INSERT INTO orders VALUES (7, 3, 'Charlie', 600.00, '2026-02-01');
            INSERT INTO orders VALUES (8, 1, 'Alice', 1900.00, '2026-02-05');
          `,
          starterCode: "WITH customer_totals AS (\n  -- 第一步：計算每位客戶的總消費\n  SELECT customer_id, customer_name,\n         SUM(amount) AS total_spent\n  FROM orders\n  GROUP BY customer_id, customer_name\n)\nSELECT customer_name, total_spent\nFROM customer_totals\nWHERE total_spent > (\n  -- 第二步：跟平均值比較\n);",
          expectedQuery: "WITH customer_totals AS (SELECT customer_id, customer_name, SUM(amount) AS total_spent FROM orders GROUP BY customer_id, customer_name) SELECT customer_name, total_spent FROM customer_totals WHERE total_spent > (SELECT AVG(total_spent) FROM customer_totals);",
          hints: [
            'CTE 用 WITH name AS (...) 定義，之後可以像一般表一樣使用',
            '平均值可以用子查詢：SELECT AVG(total_spent) FROM customer_totals',
            'CTE 的好處是可以在主查詢和子查詢中重複引用同一個 CTE',
          ],
          explanation: "CTE 把複雜查詢拆成有名稱的步驟：先在 customer_totals 中計算每位客戶的總消費，再在主查詢中篩選超過平均的客戶。CTE 的一大優勢是可以被引用多次（這裡主查詢和子查詢都用了 customer_totals），避免重複寫相同的子查詢。這讓查詢更易讀、更好維護。",
          frameworkTip: '面試中遇到複雜查詢，主動說「我用 CTE 讓邏輯更清楚」能展現你的程式碼品質意識',
        },
        {
          id: 2,
          name: '多層 CTE',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '部門績效排名報表',
            narrative: '管理層需要一份報表：先算出每個部門的月營收，再計算每個部門佔總營收的百分比，最後依百分比排名。這需要多層 CTE 逐步計算。\n\n資料表：\n- sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT)',
          },
          question: '用多個 CTE 完成：(1) 計算每部門總營收 (2) 計算總公司營收 (3) 算出各部門佔比並排名。',
          sampleSchema: `
            CREATE TABLE sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT);
            INSERT INTO sales VALUES (1, '電子產品', 45000.00, '2026-02-03');
            INSERT INTO sales VALUES (2, '服飾', 28000.00, '2026-02-05');
            INSERT INTO sales VALUES (3, '電子產品', 32000.00, '2026-02-08');
            INSERT INTO sales VALUES (4, '食品', 15000.00, '2026-02-10');
            INSERT INTO sales VALUES (5, '服飾', 19000.00, '2026-02-12');
            INSERT INTO sales VALUES (6, '食品', 22000.00, '2026-02-15');
            INSERT INTO sales VALUES (7, '電子產品', 51000.00, '2026-02-18');
            INSERT INTO sales VALUES (8, '家居', 12000.00, '2026-02-20');
            INSERT INTO sales VALUES (9, '家居', 8000.00, '2026-02-22');
          `,
          starterCode: "WITH dept_revenue AS (\n  -- 第一步：每部門總營收\n  SELECT department, SUM(amount) AS total_revenue\n  FROM sales\n  GROUP BY department\n),\ncompany_total AS (\n  -- 第二步：總公司營收\n  SELECT SUM(total_revenue) AS grand_total\n  FROM dept_revenue\n)\nSELECT\n  d.department,\n  d.total_revenue,\n  -- 第三步：計算百分比 (ROUND 到小數點後 1 位)\nFROM dept_revenue d, company_total c\nORDER BY d.total_revenue DESC;",
          expectedQuery: "WITH dept_revenue AS (SELECT department, SUM(amount) AS total_revenue FROM sales GROUP BY department), company_total AS (SELECT SUM(total_revenue) AS grand_total FROM dept_revenue) SELECT d.department, d.total_revenue, ROUND(d.total_revenue * 100.0 / c.grand_total, 1) AS revenue_pct FROM dept_revenue d, company_total c ORDER BY d.total_revenue DESC;",
          hints: [
            '多個 CTE 用逗號分隔：WITH cte1 AS (...), cte2 AS (...) SELECT ...',
            '第二個 CTE 可以引用第一個 CTE 的結果',
            '百分比計算：total_revenue * 100.0 / grand_total（用 100.0 確保浮點數除法）',
          ],
          explanation: "多層 CTE 的強大之處在於每一層可以引用前面的 CTE。dept_revenue 先算每部門營收，company_total 再從 dept_revenue 算總和，最後主查詢用兩個 CTE 算百分比。這種「步驟化」的寫法讓複雜的計算變得容易理解和除錯。注意 100.0 而不是 100，確保 SQLite 做浮點除法。",
          frameworkTip: '多層 CTE 是處理「分層計算」的利器。面試中遇到需要「先算 A，再用 A 算 B」的問題，CTE 是首選',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-5: 資料清理與品質檢查
    // ──────────────────────────────────────────
    {
      id: '24-5',
      name: '資料清理與品質檢查',
      description: '找重複、檢查資料品質、合併資料集',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: '找重複資料',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '客戶名單去重',
            narrative: '行銷團隊匯入了一批客戶資料，但懷疑有重複的 email。你需要找出哪些 email 出現超過一次，以便清理資料。\n\n資料表：\n- customer_list (id INTEGER, name TEXT, email TEXT, source TEXT)',
          },
          question: '寫一段 SQL，找出重複的 email 及其出現次數，只顯示出現超過 1 次的。',
          sampleSchema: `
            CREATE TABLE customer_list (id INTEGER, name TEXT, email TEXT, source TEXT);
            INSERT INTO customer_list VALUES (1, 'Alice Chen', 'alice@example.com', '官網');
            INSERT INTO customer_list VALUES (2, 'Bob Lin', 'bob@example.com', '展覽');
            INSERT INTO customer_list VALUES (3, 'Alice C.', 'alice@example.com', '展覽');
            INSERT INTO customer_list VALUES (4, 'Charlie Wu', 'charlie@example.com', '官網');
            INSERT INTO customer_list VALUES (5, 'Diana Lee', 'diana@example.com', '推薦');
            INSERT INTO customer_list VALUES (6, 'Bob', 'bob@example.com', '推薦');
            INSERT INTO customer_list VALUES (7, 'Eve Wang', 'eve@example.com', '官網');
            INSERT INTO customer_list VALUES (8, 'Alice', 'alice@example.com', '推薦');
          `,
          starterCode: "SELECT email, COUNT(*) AS occurrence_count\nFROM customer_list\nGROUP BY email\n-- 怎麼只保留重複的？",
          expectedQuery: "SELECT email, COUNT(*) AS occurrence_count FROM customer_list GROUP BY email HAVING COUNT(*) > 1 ORDER BY occurrence_count DESC;",
          hints: [
            'GROUP BY 之後的篩選要用 HAVING，不是 WHERE',
            'WHERE 在分組前篩選，HAVING 在分組後篩選',
            'HAVING COUNT(*) > 1 就能找出出現超過一次的',
          ],
          explanation: "找重複資料是資料清理的第一步。用 GROUP BY email 把相同 email 分組，COUNT(*) 計算每組的行數，再用 HAVING COUNT(*) > 1 只保留出現超過一次的。HAVING 和 WHERE 的區別：WHERE 在分組前過濾行，HAVING 在分組後過濾組。這是面試和實務中都非常常用的查詢模式。",
          frameworkTip: '面試中展示你有「資料品質意識」是加分的。先檢查重複、NULL、異常值，再做分析，這是專業資料人員的標準流程',
        },
        {
          id: 2,
          name: '資料品質檢查',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '訂單資料一致性檢查',
            narrative: '資料工程師在維護訂單系統時，需要檢查資料品質：(1) 找出金額為負數或零的異常訂單 (2) 找出日期格式不正確的記錄 (3) 找出 customer_id 在客戶表中不存在的「孤兒」訂單。\n\n資料表：\n- customers (id INTEGER, name TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
          },
          question: '寫一段 SQL，找出所有有問題的訂單：金額 <= 0、或 customer_id 不存在於 customers 表中。顯示訂單 id、問題描述和相關欄位。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT);
            INSERT INTO customers VALUES (1, 'Alice');
            INSERT INTO customers VALUES (2, 'Bob');
            INSERT INTO customers VALUES (3, 'Charlie');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 1, 1200.00, '2026-01-10', 'completed');
            INSERT INTO orders VALUES (2, 2, -50.00, '2026-01-12', 'completed');
            INSERT INTO orders VALUES (3, 99, 800.00, '2026-01-15', 'pending');
            INSERT INTO orders VALUES (4, 3, 0.00, '2026-01-18', 'completed');
            INSERT INTO orders VALUES (5, 1, 2300.00, '2026-01-22', 'completed');
            INSERT INTO orders VALUES (6, 88, 450.00, '2026-01-25', 'pending');
          `,
          starterCode: "SELECT o.id AS order_id,\n       CASE\n         -- 判斷是哪種問題\n       END AS issue_type,\n       o.amount, o.customer_id\nFROM orders o\nWHERE -- 金額異常\n   OR -- 客戶不存在\nORDER BY o.id;",
          expectedQuery: "SELECT o.id AS order_id, CASE WHEN o.amount <= 0 THEN '金額異常' WHEN o.customer_id NOT IN (SELECT id FROM customers) THEN '客戶不存在' END AS issue_type, o.amount, o.customer_id FROM orders o WHERE o.amount <= 0 OR o.customer_id NOT IN (SELECT id FROM customers) ORDER BY o.id;",
          hints: [
            '用 CASE WHEN 標示不同的問題類型',
            '檢查「客戶不存在」可以用 NOT IN 子查詢或 LEFT JOIN + IS NULL',
            'WHERE 條件把兩種問題用 OR 連接',
          ],
          explanation: "資料品質檢查是資料工程的日常工作。這題結合了 CASE WHEN（標示問題類型）和 NOT IN 子查詢（檢查參照完整性）。實務中常見的品質問題包括：NULL 值過多、數值超出合理範圍、外鍵關聯失效、重複資料等。建立自動化的品質檢查查詢，可以及早發現問題。",
          frameworkTip: '面試中提到「我會先做 data quality check」能展現你的嚴謹度。常見檢查：NULL 比例、重複率、數值分布、參照完整性',
        },
        {
          id: 3,
          name: 'UNION 合併資料',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '合併線上線下銷售資料',
            narrative: '公司有兩個銷售管道：線上商城和實體門市，各有自己的銷售表。管理層需要一份合併的報表，看到所有通路的銷售紀錄。\n\n資料表：\n- online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT)\n- offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT)',
          },
          question: '用 UNION ALL 合併兩個銷售表，加上 channel 欄位標示來源（"線上" / "線下"），按日期排序。',
          sampleSchema: `
            CREATE TABLE online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT);
            INSERT INTO online_sales VALUES (1, '無線耳機', 1200.00, '2026-02-01');
            INSERT INTO online_sales VALUES (2, '手機殼', 350.00, '2026-02-03');
            INSERT INTO online_sales VALUES (3, '充電線', 180.00, '2026-02-05');
            CREATE TABLE offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT);
            INSERT INTO offline_sales VALUES (1, '藍牙喇叭', 2400.00, '2026-02-02', '台北店');
            INSERT INTO offline_sales VALUES (2, '行動電源', 890.00, '2026-02-04', '台中店');
            INSERT INTO offline_sales VALUES (3, '無線耳機', 1200.00, '2026-02-06', '高雄店');
          `,
          starterCode: "SELECT product, amount, sale_date,\n       -- 加上來源標示\nFROM online_sales\n\nUNION ALL\n\nSELECT product, amount, sale_date,\n       -- 加上來源標示\nFROM offline_sales\n\nORDER BY sale_date;",
          expectedQuery: "SELECT product, amount, sale_date, '線上' AS channel FROM online_sales UNION ALL SELECT product, amount, sale_date, '線下' AS channel FROM offline_sales ORDER BY sale_date;",
          hints: [
            'UNION ALL 合併所有結果（包含重複），UNION 會去重',
            '在 SELECT 中加常數值 "線上" AS channel 可以標示來源',
            '兩個 SELECT 的欄位數和類型要一致',
            'ORDER BY 放在最後，對整個合併結果排序',
          ],
          explanation: "UNION ALL 把兩個查詢的結果垂直合併（上下堆疊）。和 UNION 的差別：UNION 會去除重複行，UNION ALL 保留所有行（效能也更好）。這裡用常數 '線上'/'線下' AS channel 標示每筆資料的來源。注意 UNION 要求兩邊的欄位數和類型一致。ORDER BY 只能放在最後，對整個合併結果排序。",
          frameworkTip: '實務中合併多來源資料是常見需求。UNION ALL 通常比 UNION 更常用（效能好、且你通常不想意外去重）',
        },
      ],
    },

    // ──────────────────────────────────────────
    // Quest 24-6: Boss: 資料整合分析
    // ──────────────────────────────────────────
    {
      id: '24-6',
      name: 'Boss: 資料整合分析',
      description: '綜合運用 JOIN、CTE 和聚合，解決真實的資料整合問題',
      xp: 200,
      isBoss: true,
      challenges: [
        {
          id: 1,
          name: '綜合 JOIN + CTE + 聚合',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '客戶生命週期價值分析',
            narrative: '經營團隊想了解不同客戶群的生命週期價值（LTV）。你需要：\n1. 從 orders 和 customers 表計算每位客戶的總消費和訂單數\n2. 用 CASE WHEN 依註冊天數分成「新客（<90天）」「中期（90-365天）」「老客（>365天）」\n3. 計算每個客群的平均 LTV、平均訂單數和客戶人數\n\n資料表：\n- customers (id INTEGER, name TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)\n\n假設今天是 2026-03-01。',
          },
          question: '用 CTE + JOIN + CASE WHEN + 聚合完成客戶生命週期分析報表。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, registered_date TEXT);
            INSERT INTO customers VALUES (1, 'Alice', '2025-06-15');
            INSERT INTO customers VALUES (2, 'Bob', '2025-11-20');
            INSERT INTO customers VALUES (3, 'Charlie', '2026-01-10');
            INSERT INTO customers VALUES (4, 'Diana', '2024-08-01');
            INSERT INTO customers VALUES (5, 'Eve', '2025-03-25');
            INSERT INTO customers VALUES (6, 'Frank', '2026-02-15');
            INSERT INTO customers VALUES (7, 'Grace', '2025-09-01');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 1, 3200.00, '2025-07-10');
            INSERT INTO orders VALUES (2, 1, 1800.00, '2025-09-15');
            INSERT INTO orders VALUES (3, 2, 4500.00, '2025-12-01');
            INSERT INTO orders VALUES (4, 3, 1200.00, '2026-01-20');
            INSERT INTO orders VALUES (5, 4, 2800.00, '2024-09-15');
            INSERT INTO orders VALUES (6, 4, 3600.00, '2025-02-20');
            INSERT INTO orders VALUES (7, 4, 1500.00, '2025-08-10');
            INSERT INTO orders VALUES (8, 5, 5200.00, '2025-05-01');
            INSERT INTO orders VALUES (9, 5, 2100.00, '2025-11-15');
            INSERT INTO orders VALUES (10, 6, 800.00, '2026-02-20');
            INSERT INTO orders VALUES (11, 7, 3100.00, '2025-10-05');
            INSERT INTO orders VALUES (12, 7, 1900.00, '2026-01-08');
            INSERT INTO orders VALUES (13, 2, 2200.00, '2026-02-10');
          `,
          starterCode: "WITH customer_stats AS (\n  -- 第一步：每位客戶的總消費和訂單數\n  SELECT c.id, c.name, c.registered_date,\n         SUM(o.amount) AS total_spent,\n         COUNT(o.id) AS order_count,\n         -- 計算註冊天數\n         JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg\n  FROM customers c\n  LEFT JOIN orders o ON c.id = o.customer_id\n  GROUP BY c.id, c.name, c.registered_date\n),\ncustomer_segments AS (\n  -- 第二步：分群\n  SELECT *,\n         CASE\n           -- 依天數分三群\n         END AS segment\n  FROM customer_stats\n)\n-- 第三步：每群的統計\nSELECT segment,\n       COUNT(*) AS customer_count,\n       ROUND(AVG(total_spent), 0) AS avg_ltv,\n       ROUND(AVG(order_count), 1) AS avg_orders\nFROM customer_segments\nGROUP BY segment\nORDER BY avg_ltv DESC;",
          expectedQuery: "WITH customer_stats AS (SELECT c.id, c.name, c.registered_date, COALESCE(SUM(o.amount), 0) AS total_spent, COUNT(o.id) AS order_count, JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg FROM customers c LEFT JOIN orders o ON c.id = o.customer_id GROUP BY c.id, c.name, c.registered_date), customer_segments AS (SELECT *, CASE WHEN days_since_reg < 90 THEN '新客' WHEN days_since_reg <= 365 THEN '中期' ELSE '老客' END AS segment FROM customer_stats) SELECT segment, COUNT(*) AS customer_count, ROUND(AVG(total_spent), 0) AS avg_ltv, ROUND(AVG(order_count), 1) AS avg_orders FROM customer_segments GROUP BY segment ORDER BY avg_ltv DESC;",
          hints: [
            '第一個 CTE 用 LEFT JOIN 確保沒有訂單的客戶也被計入（total_spent 用 COALESCE 處理 NULL）',
            'JULIANDAY 回傳天數，兩個日期相減就是間隔天數',
            'CASE WHEN 條件從小到大判斷：< 90 → 新客、<= 365 → 中期、ELSE → 老客',
            '最後用 GROUP BY segment 算每群的統計值',
          ],
          explanation: "這題綜合了 World 24 的所有核心技能：LEFT JOIN 連接客戶和訂單、CTE 分步計算、CASE WHEN 分群、聚合函數統計。關鍵設計：用 LEFT JOIN 確保沒有訂單的客戶也計入；COALESCE 處理 NULL；JULIANDAY 計算日期差；多層 CTE 讓每一步邏輯清晰。這是典型的「客戶分群分析」場景，在實務和面試中都非常常見。",
          frameworkTip: '面試中的綜合題，先說「我會分幾個步驟」再逐步寫。用 CTE 展示清晰的思路比一口氣寫一大段更加分',
        },
        {
          id: 2,
          name: '資料整合策略',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: '多來源資料整合挑戰',
            narrative: '你加入一家零售公司的資料團隊，公司有三個獨立系統：\n\n1. POS 系統：門市銷售資料（有商品編號、數量、金額、門市代碼）\n2. 電商平台：線上訂單資料（有會員帳號、商品 SKU、金額、配送地址）\n3. CRM 系統：客戶資料（有姓名、電話、email、會員等級）\n\n問題：\n- POS 沒有客戶 ID，只有門市會員卡號（部分客戶才有）\n- 電商的商品 SKU 和 POS 的商品編號格式不同\n- CRM 的客戶 ID 和電商會員帳號是同一個，但 POS 會員卡號要另外對應\n- 資料時間粒度不同：POS 是逐筆交易，電商是訂單層級',
          },
          prompt: '請設計一個資料整合方案，說明：\n1. 你會如何統一客戶身份識別？\n2. 商品 SKU 和商品編號的映射策略？\n3. 你會建立哪些中間表或 CTE？\n4. 最終要產出什麼樣的整合報表？\n5. 可能遇到的資料品質問題和處理方式？',
          evaluationCriteria: [
            '是否提出合理的客戶身份統一策略（mapping table、fuzzy match 等）',
            '是否考慮商品編號映射表的設計',
            '是否規劃清楚的 ETL 步驟或中間表結構',
            '是否提到資料品質問題及其處理方式（NULL、重複、不一致）',
            '是否考慮到時間粒度統一和跨通路的彙總邏輯',
          ],
          sampleAnswer: '1. 客戶統一：建立 customer_mapping 表，包含 crm_id、ecom_account、pos_card_number 三欄。CRM 和電商直接用相同 ID 對應；POS 會員卡號需要另建 mapping（可透過電話或 email 比對）。沒有會員卡的 POS 交易歸為「匿名客戶」。\n\n2. 商品映射：建立 product_mapping 表，包含 pos_product_code 和 ecom_sku 的對應關係。可能需要人工核對或用商品名稱做模糊比對建立初始映射。\n\n3. 中間表設計：\n   - customer_master：統一客戶維度表\n   - product_master：統一商品維度表\n   - unified_transactions：統一交易事實表（包含 channel、customer_id、product_id、amount、transaction_date）\n\n4. 整合報表：跨通路客戶消費報表（每位客戶在線上/線下的消費佔比和趨勢）、商品通路表現報表（同一商品在不同通路的銷售比較）。\n\n5. 品質問題處理：(a) NULL 值：POS 無會員卡的設為匿名 (b) 重複：同一客戶可能有多個帳號，用電話/email 去重 (c) 時間粒度：POS 逐筆彙總到日/月粒度再和電商比較 (d) 金額差異：注意含稅/未稅的統一',
          hints: [
            '想想看：不同系統之間怎麼「認出是同一個人」？',
            '商品對應表（mapping table）是跨系統整合的基本工具',
            '考慮「匹配不到」的情況：有些 POS 客戶可能沒有 CRM 記錄',
          ],
          explanation: "多來源資料整合是資料工程的核心挑戰。關鍵步驟：(1) 建立維度表統一實體識別（客戶、商品）(2) 建立映射表處理不同系統的 ID 對應 (3) 統一時間粒度和指標定義 (4) 用 CTE 或中間表逐步清洗和轉換 (5) 持續監控資料品質。這不只是寫 SQL 的問題，更是資料架構設計的思維。",
          frameworkTip: '面試中的開放式資料問題，展示你的思考框架：先定義實體 → 建立映射 → 設計中間層 → 產出報表 → 品質監控。有結構化思維比答案完美更重要',
        },
      ],
    },
  ],
};
