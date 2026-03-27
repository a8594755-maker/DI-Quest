export const w23Generated = {
  id: 23,
  name: 'SQL 基礎查詢',
  emoji: '📝',
  description: '從 SELECT 到聚合函數，打好 SQL 基礎查詢的根基',
  color: 'from-emerald-400 to-green-500',
  quests: [
    // ══════════════════════════════════════════════════════════════════
    // Quest 23-1: 資料庫與資料表基本概念
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-1',
      name: '資料庫與資料表基本概念',
      description: '了解資料庫、資料表、主鍵與外鍵的基本概念',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: '資料庫基本概念',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: '新進資料分析師的第一天',
            narrative:
              '你是一位剛加入電商公司的資料分析師。主管帶你認識公司的資料庫系統，裡面有好幾張資料表：customers（客戶）、orders（訂單）、products（商品）。他問你一些基本概念，看看你的底子。',
            data: [
              { 概念: 'Database（資料庫）', 說明: '存放所有資料表的容器' },
              { 概念: 'Table（資料表）', 說明: '一組有相同結構的資料集合，像 Excel 工作表' },
              { 概念: 'Row（列/資料列）', 說明: '一筆完整的資料記錄' },
              { 概念: 'Column（欄/欄位）', 說明: '一個資料屬性，如姓名、金額' },
            ],
            dataCaption: '資料庫基本名詞對照',
          },
          question: '以下哪個說法最正確？',
          options: [
            {
              id: 'A',
              text: '資料庫（Database）就是一張資料表（Table）',
              explanation:
                '資料庫是多張資料表的集合。一個資料庫可以包含 customers、orders、products 等多張表。',
            },
            {
              id: 'B',
              text: '一張資料表中，每一列（Row）代表一筆記錄，每一欄（Column）代表一個屬性',
              explanation:
                '正確！例如 customers 表中，一列代表一位客戶的完整資料，一欄代表某個屬性（如姓名、Email）。',
            },
            {
              id: 'C',
              text: '欄位（Column）存的是一筆完整的客戶資料',
              explanation:
                '欄位存的是某個屬性（如 name），一筆完整的客戶資料是由一列（Row）中所有欄位組成的。',
            },
            {
              id: 'D',
              text: '一個資料庫只能有一張資料表',
              explanation:
                '一個資料庫可以有很多張資料表。例如電商系統會有 customers、orders、products、payments 等多張表。',
            },
          ],
          correctAnswer: 'B',
          hints: [
            '想像 Excel：一個工作簿（Database）可以有很多工作表（Table）',
            'Table 的每一列是一筆記錄，每一欄是一個欄位',
          ],
          explanation:
            '資料庫是資料表的集合，資料表是記錄的集合。每張資料表有固定的欄位定義（Schema），每一列代表一筆實際資料。理解這些基本概念是寫 SQL 的第一步。',
          frameworkTip:
            '面試時如果被問到資料庫基本概念，用類比法回答：Database 像檔案櫃，Table 像資料夾，Row 像一張表單，Column 像表單上的欄位。',
        },
        {
          id: 2,
          name: 'Primary Key 與 Foreign Key',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: '理解資料表之間的關聯',
            narrative:
              '主管接著介紹公司的資料架構。customers 表有一個 id 欄位作為 Primary Key，orders 表有 customer_id 欄位連結到 customers 表。他要你理解這些 Key 的用途。',
            data: [
              { 表名: 'customers', 欄位: 'id (PK), name, email, city', 說明: 'id 是 Primary Key，唯一識別每位客戶' },
              { 表名: 'orders', 欄位: 'id (PK), customer_id (FK), amount, order_date', 說明: 'customer_id 是 Foreign Key，連結到 customers.id' },
            ],
            dataCaption: '資料表關聯範例',
          },
          question: '關於 Primary Key 和 Foreign Key，以下哪個敘述最正確？',
          options: [
            {
              id: 'A',
              text: 'Primary Key 可以有重複值，Foreign Key 不可以',
              explanation:
                '正好相反。Primary Key 必須唯一且不能為 NULL；Foreign Key 可以重複（例如同一個客戶可以有多筆訂單）。',
            },
            {
              id: 'B',
              text: 'Primary Key 唯一識別每筆資料，Foreign Key 用來建立表與表之間的關聯',
              explanation:
                '正確！Primary Key 確保每筆資料有唯一的身分證號碼。Foreign Key 則像是一條線，把不同資料表的資料串在一起。',
            },
            {
              id: 'C',
              text: '每張資料表必須同時有 Primary Key 和 Foreign Key',
              explanation:
                '不一定。每張表通常有 Primary Key，但不一定需要 Foreign Key。Foreign Key 只有在需要關聯其他表時才用。',
            },
            {
              id: 'D',
              text: 'Foreign Key 的值可以是任意數字，不需要對應到其他表',
              explanation:
                'Foreign Key 的值必須對應到它所參照的表的 Primary Key。例如 orders.customer_id 的值必須存在於 customers.id 中。',
            },
          ],
          correctAnswer: 'B',
          hints: [
            'Primary Key 就像身分證字號：每個人都不一樣',
            'Foreign Key 像是一條連結線，把兩張表關聯起來',
          ],
          explanation:
            'Primary Key（主鍵）確保資料表中每筆記錄的唯一性，不允許重複和 NULL。Foreign Key（外鍵）建立表與表之間的關聯，它的值必須對應到另一張表的 Primary Key。這兩個概念是理解關聯式資料庫的核心。',
          frameworkTip:
            '面試時如果被問到 PK/FK，記得舉一個具體的例子：「orders 表的 customer_id 是 FK，參照 customers 表的 id（PK），這樣就能透過 JOIN 把訂單和客戶資料合併。」',
        },
        {
          id: 3,
          name: '讀懂 Schema',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '探索員工資料表',
            narrative:
              '你拿到了公司人力資源部門的員工資料表 Schema。在開始分析之前，你想先看看這張表裡有什麼資料，了解欄位和筆數。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: '工程部', salary: 65000, hire_date: '2022-03-15' },
              { id: 2, name: '李小華', department: '行銷部', salary: 55000, hire_date: '2023-01-10' },
              { id: 3, name: '陳大偉', department: '工程部', salary: 72000, hire_date: '2021-08-01' },
            ],
            dataCaption: 'employees 資料表（部分範例）',
          },
          question: '寫一段 SQL，查詢 employees 資料表的所有欄位和所有資料，讓你可以快速瀏覽這張表的內容。',
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
          starterCode: "-- 查詢 employees 表的所有欄位和資料\nSELECT -- 怎麼選所有欄位？\nFROM employees;",
          expectedQuery: "SELECT * FROM employees;",
          hints: [
            '* 代表「所有欄位」',
            'SELECT * FROM table_name 是最基本的查詢語法',
          ],
          explanation:
            'SELECT * FROM employees 是 SQL 最基本的查詢語句。* 代表選取所有欄位。在實際工作中，拿到新的資料表時，第一步通常會用 SELECT * 瀏覽資料，了解表的結構和內容。不過在正式的查詢中，建議指定需要的欄位而不是用 *，以提高效能。',
          frameworkTip:
            '面試時不要急著寫 SQL，先問面試官：「可以先看一下資料表的結構和一些範例資料嗎？」這展示你有良好的分析習慣。',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-2: SELECT / FROM / WHERE 深入
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-2',
      name: 'SELECT / FROM / WHERE 深入',
      description: '學會從資料表中精確篩選你需要的資料',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'SELECT 指定欄位',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '客戶通訊錄製作',
            narrative:
              '行銷部門需要一份客戶通訊錄，只需要客戶姓名和 Email，不需要其他資料。你需要從 customers 表中只選取需要的欄位。\n\n資料表結構：customers (id INTEGER, name TEXT, email TEXT, phone TEXT, city TEXT, registered_date TEXT)',
            data: [
              { id: 1, name: '王小明', email: 'wang@mail.com', phone: '0912-345-678', city: '台北市', registered_date: '2023-01-15' },
              { id: 2, name: '李小華', email: 'lee@mail.com', phone: '0923-456-789', city: '高雄市', registered_date: '2023-03-20' },
            ],
            dataCaption: 'customers 資料表（部分範例）',
          },
          question: '寫一段 SQL，只查詢客戶的姓名（name）和電子郵件（email）。',
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
          starterCode: "SELECT -- 指定需要的欄位\nFROM customers;",
          expectedQuery: "SELECT name, email FROM customers;",
          hints: [
            '用逗號分隔多個欄位名稱',
            '不需要所有欄位時，不要用 *，直接列出需要的欄位',
          ],
          explanation:
            'SELECT name, email FROM customers 只回傳指定的兩個欄位。在實際工作中，指定欄位比用 SELECT * 好：(1) 減少網路傳輸量 (2) 程式碼更清楚表達你需要什麼 (3) 避免不小心暴露敏感欄位。',
          frameworkTip:
            '面試寫 SQL 時，永遠不要用 SELECT *。面試官會注意你是否只選取需要的欄位，這展示你對效能和安全性的意識。',
        },
        {
          id: 2,
          name: 'WHERE 多條件篩選',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '高單價訂單篩選',
            narrative:
              '財務部門想要稽核上個月金額超過 1000 元且狀態為已完成的訂單。你需要用多個 WHERE 條件來精確篩選。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
            data: [
              { id: 1, customer_id: 101, amount: 1500.00, order_date: '2024-03-05', status: 'completed' },
              { id: 2, customer_id: 102, amount: 800.00, order_date: '2024-03-12', status: 'completed' },
              { id: 3, customer_id: 103, amount: 2200.00, order_date: '2024-03-18', status: 'pending' },
              { id: 4, customer_id: 104, amount: 350.00, order_date: '2024-02-25', status: 'completed' },
            ],
            dataCaption: 'orders 資料表（部分範例）',
          },
          question: "寫一段 SQL，找出 2024 年 3 月且金額超過 1000 且狀態為 'completed' 的訂單，顯示所有欄位。",
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
          starterCode: "SELECT *\nFROM orders\nWHERE -- 三個條件用 AND 連接;",
          expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-03%' AND amount > 1000 AND status = 'completed';",
          hints: [
            '多個條件同時成立用 AND 連接',
            '日期可以用 LIKE 搭配 % 來匹配前綴',
            '文字比較要用單引號',
          ],
          explanation:
            "使用 AND 連接三個條件：日期在 3 月（order_date LIKE '2024-03%'）、金額超過 1000（amount > 1000）、狀態為已完成（status = 'completed'）。SQL 的 WHERE 子句可以用 AND 和 OR 組合多個條件，AND 要求所有條件都成立。",
          frameworkTip:
            '面試寫多條件篩選時，建議每個條件換一行，用註解說明每個條件的商業意義。這讓面試官一眼就看懂你的邏輯。',
        },
        {
          id: 3,
          name: 'LIKE 與 IN 篩選',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '商品搜尋功能',
            narrative:
              '電商平台的搜尋功能需要支援模糊搜尋和分類篩選。PM 想要找出名稱包含「有機」的商品，且類別為「食品」或「飲料」。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, stock INTEGER)',
            data: [
              { id: 1, name: '有機蘋果汁', category: '飲料', price: 85.00, stock: 200 },
              { id: 2, name: '有機黑豆', category: '食品', price: 120.00, stock: 150 },
              { id: 3, name: '一般牛奶', category: '飲料', price: 45.00, stock: 500 },
              { id: 4, name: '有機棉T恤', category: '服飾', price: 580.00, stock: 80 },
            ],
            dataCaption: 'products 資料表（部分範例）',
          },
          question: "寫一段 SQL，找出名稱包含「有機」且類別為「食品」或「飲料」的商品，顯示 name、category、price。",
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
          starterCode: "SELECT name, category, price\nFROM products\nWHERE -- LIKE 模糊搜尋\n  AND -- IN 多值篩選;",
          expectedQuery: "SELECT name, category, price FROM products WHERE name LIKE '%有機%' AND category IN ('食品', '飲料');",
          hints: [
            "LIKE '%關鍵字%' 可以搜尋包含關鍵字的文字",
            "IN ('值1', '值2') 等同於 = '值1' OR = '值2'",
          ],
          explanation:
            "LIKE '%有機%' 找出名稱中任何位置包含「有機」的商品（% 代表任意字元）。IN ('食品', '飲料') 是 category = '食品' OR category = '飲料' 的簡潔寫法。LIKE 和 IN 是 SQL 中最實用的篩選工具，工作中天天會用到。",
          frameworkTip:
            '面試時用 IN 代替多個 OR 可以讓 SQL 更簡潔。面試官會欣賞你寫出可讀性高的程式碼。',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-3: 排序與進階篩選
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-3',
      name: '排序與進階篩選',
      description: '學會排序、分頁與去重，精確控制查詢結果',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'ORDER BY 排序',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '業績排行榜',
            narrative:
              '每月底業務部門都會公佈業績排行榜。主管要你產出一份報表，按銷售金額由高到低排列，金額相同時按姓名字母排序。\n\n資料表結構：sales_records (id INTEGER, salesperson TEXT, region TEXT, amount REAL, sale_date TEXT)',
            data: [
              { id: 1, salesperson: '王大明', region: '北區', amount: 85000.00, sale_date: '2024-03-15' },
              { id: 2, salesperson: '李小華', region: '南區', amount: 92000.00, sale_date: '2024-03-20' },
              { id: 3, salesperson: '陳志偉', region: '北區', amount: 78000.00, sale_date: '2024-03-10' },
            ],
            dataCaption: 'sales_records 資料表（部分範例）',
          },
          question: '寫一段 SQL，查詢所有銷售記錄的 salesperson、amount、sale_date，先按 amount 由大到小排，amount 相同時按 salesperson 由小到大排。',
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
          starterCode: "SELECT salesperson, amount, sale_date\nFROM sales_records\nORDER BY -- 先按金額排，再按姓名排;",
          expectedQuery: "SELECT salesperson, amount, sale_date FROM sales_records ORDER BY amount DESC, salesperson ASC;",
          hints: [
            'DESC 代表由大到小（降冪），ASC 代表由小到大（升冪）',
            'ORDER BY 可以用逗號分隔多個排序欄位',
          ],
          explanation:
            'ORDER BY amount DESC, salesperson ASC 先按金額降冪排列，金額相同時再按姓名升冪排列。多欄位排序在製作排行榜、報表時非常常用。注意：ASC 是預設排序方向，可以省略，但為了程式碼的可讀性建議寫出來。',
          frameworkTip:
            '面試時明確寫出 ASC/DESC，不要依賴預設值。這展示你的程式碼風格嚴謹且意圖明確。',
        },
        {
          id: 2,
          name: 'LIMIT 與 OFFSET 分頁',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '商品列表分頁',
            narrative:
              '電商網站的商品列表需要分頁顯示，每頁 5 筆商品。前端工程師問你怎麼用 SQL 實現分頁功能，讓使用者可以翻到第 2 頁。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, created_at TEXT)',
            data: [
              { id: 1, name: '無線滑鼠', price: 450.00 },
              { id: 2, name: '機械鍵盤', price: 2800.00 },
              { id: 3, name: 'USB Hub', price: 380.00 },
            ],
            dataCaption: 'products 資料表（部分範例）',
          },
          question: '寫一段 SQL，查詢商品依 id 排序，取得第 2 頁的資料（每頁 5 筆，也就是第 6 到第 10 筆）。',
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
          starterCode: "SELECT *\nFROM products\nORDER BY id ASC\n-- 跳過前幾筆？取幾筆？;",
          expectedQuery: "SELECT * FROM products ORDER BY id ASC LIMIT 5 OFFSET 5;",
          hints: [
            'LIMIT 控制回傳筆數，OFFSET 控制跳過幾筆',
            '第 2 頁表示跳過第 1 頁的 5 筆，所以 OFFSET = 5',
          ],
          explanation:
            'LIMIT 5 OFFSET 5 表示跳過前 5 筆（第 1 頁），然後取 5 筆（第 2 頁的內容）。分頁公式：OFFSET = (頁碼 - 1) * 每頁筆數。LIMIT/OFFSET 是實作分頁的基本方式，幾乎每個 Web 應用都會用到。',
          frameworkTip:
            '面試延伸題：如果資料量很大（百萬筆），OFFSET 效能會很差。進階做法是用 WHERE id > 上一頁最後一筆的 id，稱為 keyset pagination。',
        },
        {
          id: 3,
          name: 'DISTINCT 與去重',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: '客戶分布分析',
            narrative:
              '行銷團隊想知道公司的客戶分布在哪些城市。你查詢 customers 表的 city 欄位，但發現很多城市重複出現。你需要用 DISTINCT 去除重複值。',
            data: [
              { id: 1, name: '王小明', city: '台北市' },
              { id: 2, name: '李小華', city: '高雄市' },
              { id: 3, name: '陳大偉', city: '台北市' },
              { id: 4, name: '林美玲', city: '台中市' },
              { id: 5, name: '張志豪', city: '台北市' },
            ],
            dataCaption: 'customers 資料表（部分範例）',
          },
          question: '關於 DISTINCT，以下哪個說法最正確？',
          options: [
            {
              id: 'A',
              text: 'SELECT DISTINCT city FROM customers 會回傳所有 city 值，包含重複的',
              explanation:
                'DISTINCT 的功能就是去除重複值。如果不加 DISTINCT，才會回傳所有值（包含重複）。',
            },
            {
              id: 'B',
              text: 'DISTINCT 只能用在一個欄位上，不能同時去重多個欄位',
              explanation:
                'DISTINCT 可以作用在多個欄位的組合上。例如 SELECT DISTINCT city, category 會去除 city + category 組合相同的行。',
            },
            {
              id: 'C',
              text: 'SELECT DISTINCT city FROM customers 會回傳不重複的城市列表，例如台北市只出現一次',
              explanation:
                '正確！DISTINCT 會去除查詢結果中的重複列。即使台北市出現三次，結果中也只會出現一次。',
            },
            {
              id: 'D',
              text: 'DISTINCT 和 GROUP BY 完全不同，無法互換使用',
              explanation:
                '在某些場景下，DISTINCT 和 GROUP BY 可以達到類似效果。例如 SELECT DISTINCT city 和 SELECT city GROUP BY city 結果相同。但 GROUP BY 可以搭配聚合函數，功能更強大。',
            },
          ],
          correctAnswer: 'C',
          hints: [
            'DISTINCT 放在 SELECT 後面，作用是去除重複的列',
            '想想看：如果不加 DISTINCT，台北市會出現幾次？',
          ],
          explanation:
            'DISTINCT 會對查詢結果去重，確保回傳的每一列都是唯一的。這在統計「有哪些不同的值」時特別有用，例如：有哪些城市有客戶、有哪些部門、有哪些商品類別等。在面試中，DISTINCT 常和 COUNT 搭配使用：COUNT(DISTINCT city) 計算不重複的城市數量。',
          frameworkTip:
            '面試小技巧：如果你需要「列出不同的值」用 DISTINCT，如果需要「每個值的統計」用 GROUP BY。展示你知道兩者的差異和適用場景。',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-4: 聚合函數深入
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-4',
      name: '聚合函數深入',
      description: '掌握 COUNT、SUM、AVG 等聚合函數與 GROUP BY、HAVING',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: 'COUNT 與 SUM',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '月度業績報告',
            narrative:
              '財務部門需要一份簡單的月度業績摘要：總訂單數、總營收、平均訂單金額、最高和最低單筆金額。你需要用聚合函數一次算出這些指標。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)',
            data: [
              { id: 1, amount: 1500.00, status: 'completed' },
              { id: 2, amount: 800.00, status: 'completed' },
              { id: 3, amount: 2200.00, status: 'completed' },
              { id: 4, amount: 350.00, status: 'completed' },
            ],
            dataCaption: 'orders 資料表（部分範例）',
          },
          question: '寫一段 SQL，計算 orders 表中所有訂單的：總筆數（total_orders）、總金額（total_revenue）、平均金額（avg_amount）、最高金額（max_amount）、最低金額（min_amount）。',
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
          starterCode: "SELECT\n  COUNT(*) AS total_orders,\n  -- 總金額\n  -- 平均金額\n  -- 最高金額\n  -- 最低金額\nFROM orders;",
          expectedQuery: "SELECT COUNT(*) AS total_orders, SUM(amount) AS total_revenue, AVG(amount) AS avg_amount, MAX(amount) AS max_amount, MIN(amount) AS min_amount FROM orders;",
          hints: [
            'SUM() 計算總和，AVG() 計算平均值',
            'MAX() 和 MIN() 分別找最大和最小值',
            '用 AS 給結果取個有意義的別名',
          ],
          explanation:
            'SQL 五大聚合函數：COUNT（計數）、SUM（總和）、AVG（平均）、MAX（最大值）、MIN（最小值）。這些是資料分析最基本的工具。面試中常被要求用一條 SQL 同時算出多個指標，展示你對聚合函數的熟悉度。',
          frameworkTip:
            '面試時寫聚合查詢，記得用有意義的 AS 別名。面試官看到 SUM(amount) AS total_revenue 比看到 SUM(amount) 更容易理解你的意圖。',
        },
        {
          id: 2,
          name: 'GROUP BY 分組統計',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '各部門薪資分析',
            narrative:
              '人資主管想了解各部門的薪資狀況，包括每個部門有多少人、平均薪資和最高薪資。你需要用 GROUP BY 按部門分組計算。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: '工程部', salary: 72000.00 },
              { id: 2, name: '李小華', department: '行銷部', salary: 55000.00 },
              { id: 3, name: '陳大偉', department: '工程部', salary: 85000.00 },
              { id: 4, name: '林美玲', department: '人資部', salary: 58000.00 },
            ],
            dataCaption: 'employees 資料表（部分範例）',
          },
          question: '寫一段 SQL，計算每個部門的人數（headcount）、平均薪資（avg_salary）、最高薪資（max_salary），按平均薪資由高到低排序。',
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
          starterCode: "SELECT department,\n       COUNT(*) AS headcount,\n       -- 平均薪資\n       -- 最高薪資\nFROM employees\nGROUP BY -- 按什麼分組？\nORDER BY -- 按什麼排序？;",
          expectedQuery: "SELECT department, COUNT(*) AS headcount, AVG(salary) AS avg_salary, MAX(salary) AS max_salary FROM employees GROUP BY department ORDER BY avg_salary DESC;",
          hints: [
            'GROUP BY department 把同一個部門的員工聚合在一起',
            'SELECT 中除了聚合函數外的欄位，都必須出現在 GROUP BY 中',
            'ORDER BY 可以用 AS 別名來排序',
          ],
          explanation:
            'GROUP BY department 將資料按部門分組，然後對每組分別計算聚合函數。關鍵規則：SELECT 中非聚合的欄位必須出現在 GROUP BY 中。ORDER BY avg_salary DESC 讓薪資最高的部門排在最前面。這是面試中出現頻率最高的 SQL 題型之一。',
          frameworkTip:
            '面試時口述思路：「先 GROUP BY 部門分組，再用聚合函數算各組的統計值，最後 ORDER BY 排序。」讓面試官看到你清楚 SQL 的執行順序。',
        },
        {
          id: 3,
          name: 'HAVING 過濾分組',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '活躍客戶辨識',
            narrative:
              '行銷團隊定義「活躍客戶」為下單次數 3 次以上的客戶。他們想找出這些客戶並看他們的消費統計，作為 VIP 行銷活動的目標族群。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
            data: [
              { customer_id: 101, 訂單數: 5, 總消費: 8500.00 },
              { customer_id: 102, 訂單數: 2, 總消費: 1200.00 },
              { customer_id: 103, 訂單數: 4, 總消費: 6800.00 },
            ],
            dataCaption: '客戶消費摘要（預期結果範例）',
          },
          question: '寫一段 SQL，找出下單次數超過 3 次的客戶，顯示 customer_id、訂單數（order_count）、總消費金額（total_spent），按總消費由高到低排序。',
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
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_spent\nFROM orders\nGROUP BY customer_id\n-- 怎麼篩選「下單超過 3 次」的客戶？\nORDER BY total_spent DESC;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_spent FROM orders GROUP BY customer_id HAVING COUNT(*) > 3 ORDER BY total_spent DESC;",
          hints: [
            '聚合後的篩選用 HAVING，不是 WHERE',
            'HAVING 放在 GROUP BY 之後',
            'HAVING 中可以使用聚合函數如 COUNT(*)',
          ],
          explanation:
            'HAVING COUNT(*) > 3 在分組聚合之後篩選結果，只保留下單超過 3 次的客戶。WHERE 和 HAVING 的關鍵區別：WHERE 在分組前篩選原始資料行，HAVING 在分組後篩選聚合結果。SQL 執行順序：FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY。',
          frameworkTip:
            '面試經典追問：「WHERE 和 HAVING 的差別是什麼？」標準回答：「WHERE 篩選原始資料行，在 GROUP BY 之前執行；HAVING 篩選聚合後的分組結果，在 GROUP BY 之後執行。」',
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-5: 字串與日期處理
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-5',
      name: '字串與日期處理',
      description: '使用字串函數和日期函數處理真實世界的資料',
      xp: 50,
      isBoss: false,
      challenges: [
        {
          id: 1,
          name: '字串函數',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '客戶資料清理',
            narrative:
              '資料庫中客戶的姓名大小寫不一致，有些是全大寫，有些是小寫。行銷團隊需要一份格式統一的名單，要求：顯示姓名（全大寫）、Email（全小寫）、姓名長度，並用 || 拼接一段問候語。\n\n資料表結構：customers (id INTEGER, name TEXT, email TEXT, city TEXT)',
            data: [
              { id: 1, name: 'Alice Wang', email: 'ALICE@MAIL.COM', city: '台北市' },
              { id: 2, name: 'bob lee', email: 'Bob@Mail.Com', city: '高雄市' },
            ],
            dataCaption: 'customers 資料表（部分範例）',
          },
          question: "寫一段 SQL，查詢每位客戶的：姓名大寫版（upper_name）、Email 小寫版（lower_email）、姓名字數（name_length）、問候語（greeting，格式為 'Hello, ' || name || '!'）。",
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
          starterCode: "SELECT\n  UPPER(name) AS upper_name,\n  -- Email 小寫\n  -- 姓名字數\n  -- 問候語拼接\nFROM customers;",
          expectedQuery: "SELECT UPPER(name) AS upper_name, LOWER(email) AS lower_email, LENGTH(name) AS name_length, 'Hello, ' || name || '!' AS greeting FROM customers;",
          hints: [
            'UPPER() 轉大寫，LOWER() 轉小寫',
            'LENGTH() 計算字串長度',
            '|| 是 SQLite 的字串拼接運算子',
          ],
          explanation:
            "SQLite 常用字串函數：UPPER() 轉大寫、LOWER() 轉小寫、LENGTH() 計算長度。|| 運算子用來拼接字串，類似其他語言的 + 或 concat()。資料清理是資料分析師的日常工作，面試中也常出現字串處理的題目。",
          frameworkTip:
            '面試延伸：如果被問到 SUBSTR()，語法是 SUBSTR(字串, 起始位置, 長度)。REPLACE(字串, 舊值, 新值) 用來替換文字。記住這些常用函數，面試時可以靈活運用。',
        },
        {
          id: 2,
          name: '日期函數',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '員工年資統計',
            narrative:
              '人資部門要統計每位員工的年資，包括入職日期、到今天為止的任職天數，以及入職的年份和月份。SQLite 中使用 date() 和 strftime() 來處理日期。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: '工程部', hire_date: '2021-03-15' },
              { id: 2, name: '李小華', department: '行銷部', hire_date: '2023-01-10' },
            ],
            dataCaption: 'employees 資料表（部分範例）',
          },
          question: "寫一段 SQL，查詢每位員工的 name、hire_date、入職年份（hire_year）、入職月份（hire_month）、以及從入職到今天的天數（days_employed，使用 julianday）。按天數由大到小排序。",
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
          starterCode: "SELECT name,\n       hire_date,\n       strftime('%Y', hire_date) AS hire_year,\n       -- 入職月份\n       -- 任職天數（用 julianday 計算）\nFROM employees\nORDER BY -- 按天數排序;",
          expectedQuery: "SELECT name, hire_date, strftime('%Y', hire_date) AS hire_year, strftime('%m', hire_date) AS hire_month, CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS days_employed FROM employees ORDER BY days_employed DESC;",
          hints: [
            "strftime('%Y', date) 取年份，strftime('%m', date) 取月份",
            "julianday('now') - julianday(date) 可以計算天數差",
            '用 CAST(... AS INTEGER) 把小數天數轉為整數',
          ],
          explanation:
            "SQLite 日期處理的核心工具：strftime() 用來提取日期的各個部分（年、月、日等），julianday() 把日期轉為儒略日數（一個連續的天數），兩個 julianday 相減就得到天數差。CAST(... AS INTEGER) 把結果轉為整數。這些函數在日期分析中非常實用。",
          frameworkTip:
            "面試中常考的日期處理：(1) 提取年/月：strftime('%Y/%m', date) (2) 計算天數差：julianday 相減 (3) 取今天日期：date('now')。記住這三個模式就能應付大多數日期題目。",
        },
      ],
    },

    // ══════════════════════════════════════════════════════════════════
    // Quest 23-6: Boss — 基礎查詢綜合挑戰
    // ══════════════════════════════════════════════════════════════════
    {
      id: '23-6',
      name: 'Boss: 基礎查詢綜合挑戰',
      description: '結合所有基礎查詢技巧，挑戰綜合型題目',
      xp: 200,
      isBoss: true,
      challenges: [
        {
          id: 1,
          name: '綜合查詢',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '電商平台季度報告',
            narrative:
              '你是電商公司的資料分析師，CEO 要求你產出 2024 年 Q1 的季度報告。他想知道每個商品類別的銷售表現：訂單數、總營收、平均客單價，但只要看銷售額超過 5000 的類別，並按總營收由高到低排列。\n\n資料表結構：\n• products (id INTEGER, name TEXT, category TEXT, price REAL)\n• order_items (id INTEGER, order_id INTEGER, product_id INTEGER, quantity INTEGER, unit_price REAL)\n• orders (id INTEGER, customer_id INTEGER, order_date TEXT, status TEXT)',
          },
          question: "寫一段 SQL，計算 2024 年 Q1（1-3 月）已完成訂單中，每個商品類別的訂單數（order_count）、總營收（total_revenue，quantity * unit_price）、平均客單價（avg_order_value）。只顯示總營收超過 5000 的類別，按總營收由高到低排序。",
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
          starterCode: "SELECT p.category,\n       COUNT(DISTINCT o.id) AS order_count,\n       SUM(oi.quantity * oi.unit_price) AS total_revenue,\n       -- 平均客單價\nFROM order_items oi\nJOIN orders o ON oi.order_id = o.id\nJOIN products p ON oi.product_id = p.id\nWHERE -- Q1 日期篩選 AND 已完成訂單\nGROUP BY -- 按類別分組\n-- 篩選總營收超過 5000\nORDER BY -- 排序;",
          expectedQuery: "SELECT p.category, COUNT(DISTINCT o.id) AS order_count, SUM(oi.quantity * oi.unit_price) AS total_revenue, ROUND(SUM(oi.quantity * oi.unit_price) * 1.0 / COUNT(DISTINCT o.id), 2) AS avg_order_value FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN products p ON oi.product_id = p.id WHERE o.order_date >= '2024-01-01' AND o.order_date < '2024-04-01' AND o.status = 'completed' GROUP BY p.category HAVING total_revenue > 5000 ORDER BY total_revenue DESC;",
          hints: [
            '需要 JOIN 三張表：order_items、orders、products',
            "日期篩選：order_date >= '2024-01-01' AND order_date < '2024-04-01'",
            '平均客單價 = 總營收 / 不重複訂單數',
            '用 HAVING 篩選聚合後的結果',
          ],
          explanation:
            "這題綜合了所有基礎查詢技巧：(1) JOIN 合併三張表 (2) WHERE 篩選日期和狀態 (3) GROUP BY 按類別分組 (4) 聚合函數計算 COUNT、SUM (5) HAVING 篩選聚合結果 (6) ORDER BY 排序。注意 COUNT(DISTINCT o.id) 確保同一筆訂單不被重複計算。平均客單價用總營收除以不重複訂單數。",
          frameworkTip:
            '面試遇到複雜查詢，建議用「由內而外」的思路：(1) 先確定需要哪些表和 JOIN 條件 (2) 加上 WHERE 篩選 (3) GROUP BY 分組 (4) 寫聚合函數 (5) HAVING 過濾 (6) ORDER BY 排序。一步步建構，不要試圖一次寫完。',
        },
        {
          id: 2,
          name: '分析計畫設計',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: '用戶留存分析計畫',
            narrative:
              '你是電商公司的資料分析師，PM 希望你分析「新用戶的 7 天留存率」。他想知道：(1) 過去一個月每天註冊的新用戶中，有多少人在註冊後 7 天內再次下單？(2) 哪些用戶特徵（城市、註冊來源）與留存率有關？\n\n你可以使用的資料表：\n• users (id, name, city, source, registered_date)\n• orders (id, user_id, amount, order_date, status)\n• page_views (id, user_id, page_url, view_date)',
          },
          question: '請設計一個完整的分析計畫：你會寫哪些 SQL 查詢？每個查詢的目的是什麼？你會如何組合這些結果來回答 PM 的問題？',
          prompt: '請設計一個用 SQL 分析「新用戶 7 天留存率」的完整計畫，包括需要的查詢和分析步驟。',
          evaluationCriteria: [
            '是否清楚定義「留存」的計算方式（註冊後 7 天內再次下單）',
            '是否包含基本留存率的查詢（新用戶數 vs 留存用戶數）',
            '是否考慮按用戶特徵（城市、來源）做細分分析',
            '是否提到可能需要的資料驗證步驟（如檢查資料完整性）',
            'SQL 思路是否正確（JOIN users 和 orders，用日期條件篩選）',
          ],
          sampleAnswer:
            "分析計畫分三步：\n\n第一步：計算整體 7 天留存率\n用 users LEFT JOIN orders，條件是 order_date BETWEEN registered_date AND date(registered_date, '+7 days')，按 registered_date GROUP BY，算 COUNT(DISTINCT 有回購的 user) / COUNT(DISTINCT 所有新用戶)。\n\n第二步：按用戶特徵細分\n加入 GROUP BY city 和 GROUP BY source，分別看不同城市和註冊來源的留存率差異，找出高/低留存的族群。\n\n第三步：資料驗證\n(1) 檢查 users 和 orders 的 user_id 是否一致 (2) 確認日期欄位沒有 NULL (3) 排除 status = 'cancelled' 的訂單。\n\n最終輸出一張匯總表：日期、新用戶數、留存用戶數、留存率、各維度的細分。",
          hints: [
            '先定義清楚「留存」的衡量標準',
            '想想需要 JOIN 哪些表，用什麼條件',
            '別忘了按不同維度（城市、來源）做細分',
          ],
          explanation:
            '設計分析計畫的關鍵是：(1) 明確定義指標（什麼是「留存」）(2) 拆解為可執行的 SQL 步驟 (3) 考慮資料品質問題。面試中展示你能把模糊的業務問題轉化為具體的 SQL 查詢計畫，比只會寫 SQL 語法更有價值。',
          frameworkTip:
            '面試中遇到開放式分析題，用這個框架回答：(1) 釐清定義：「留存的定義是...」(2) 拆解步驟：「我會分三步...」(3) 考慮限制：「資料可能有的問題是...」(4) 預期產出：「最終會產出...」。這個框架讓你的回答結構清晰、有說服力。',
        },
      ],
    },
  ],
};
