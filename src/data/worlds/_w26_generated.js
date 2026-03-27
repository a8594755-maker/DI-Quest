// ─────────────────────────────────────────────────────
// World 26 — SQL 工程應用（原創挑戰題）
// CRUD、資料庫設計與效能優化 — Business Engineer 的 SQL 實戰
// ─────────────────────────────────────────────────────

export const w26Generated = {
  id: 26,
  name: 'SQL 工程應用',
  emoji: '⚙️',
  description: 'CRUD、資料庫設計與效能優化 — Business Engineer 的 SQL 實戰',
  color: 'from-violet-500 to-purple-500',
  quests: [

    /* ═══════════════════════════════════════════════════
       Quest 26-1  INSERT / UPDATE / DELETE
       ═══════════════════════════════════════════════════ */
    {
      id: '26-1',
      name: 'INSERT / UPDATE / DELETE',
      description: '學會新增、更新與安全刪除資料的核心操作',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. INSERT 新增資料 ──
        {
          id: 1,
          name: 'INSERT 新增資料',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '新增員工到人事系統',
            narrative:
              '公司剛錄取了三位新員工，HR 請你把他們的資料寫入 employees 資料表。每位員工需要填入姓名、部門和入職日期。\n\n資料表結構：employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT)',
            data: [
              { id: 1, name: '王小明', department: 'Engineering', hire_date: '2024-01-15' },
              { id: 2, name: '李美玲', department: 'Marketing', hire_date: '2024-02-01' },
              { id: 3, name: '張大衛', department: 'Sales', hire_date: '2024-03-10' },
            ],
            dataCaption: 'employees 現有資料',
          },
          question:
            '使用 INSERT INTO 將以下三位新員工加入 employees 資料表：\n- id=4, 陳志明, Engineering, 2024-06-01\n- id=5, 林佳穎, Marketing, 2024-06-01\n- id=6, 黃建豪, Sales, 2024-06-15',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT);
            INSERT INTO employees VALUES (1, '王小明', 'Engineering', '2024-01-15');
            INSERT INTO employees VALUES (2, '李美玲', 'Marketing', '2024-02-01');
            INSERT INTO employees VALUES (3, '張大衛', 'Sales', '2024-03-10');
          `,
          starterCode:
            "-- 新增三位員工到 employees 資料表\nINSERT INTO employees VALUES (4, '陳志明', 'Engineering', '2024-06-01');\n-- 繼續新增其餘兩位...\n",
          expectedQuery:
            "INSERT INTO employees VALUES (4, '陳志明', 'Engineering', '2024-06-01'); INSERT INTO employees VALUES (5, '林佳穎', 'Marketing', '2024-06-01'); INSERT INTO employees VALUES (6, '黃建豪', 'Sales', '2024-06-15'); SELECT * FROM employees ORDER BY id;",
          hints: [
            'INSERT INTO 表名 VALUES (值1, 值2, ...); 可以逐筆新增',
            '也可以用 INSERT INTO 表名 (欄位1, 欄位2) VALUES (...) 指定欄位',
            '最後用 SELECT * FROM employees 確認結果',
          ],
          explanation:
            'INSERT INTO 是 SQL 最基本的寫入操作。完整語法：INSERT INTO table_name (col1, col2, ...) VALUES (val1, val2, ...)。如果依照欄位順序填入所有值，可以省略欄位名稱。實務上建議明確列出欄位名，避免資料表結構變動時出錯。',
          frameworkTip:
            'INSERT 小技巧：(1) 明確列出欄位名稱比省略更安全 (2) 批次插入可用多個 VALUES 子句或多條 INSERT (3) 搭配 SELECT 驗證插入結果。',
        },

        // ── 2. UPDATE 更新資料 ──
        {
          id: 2,
          name: 'UPDATE 更新資料',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '調整員工部門與薪資',
            narrative:
              '年中組織調整，Engineering 部門的員工全部調薪 10%，同時「張大衛」從 Sales 調到 Marketing 部門。請用 UPDATE 語句完成這兩項變更。\n\n資料表結構：employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL)',
            data: [
              { id: 1, name: '王小明', department: 'Engineering', salary: 80000 },
              { id: 2, name: '李美玲', department: 'Marketing', salary: 75000 },
              { id: 3, name: '張大衛', department: 'Sales', salary: 70000 },
              { id: 4, name: '陳志明', department: 'Engineering', salary: 85000 },
            ],
            dataCaption: 'employees 資料表',
          },
          question:
            '完成兩項更新：\n1. Engineering 部門所有員工的 salary 調高 10%\n2. 將「張大衛」的 department 改為 Marketing',
          sampleSchema: `
            CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL);
            INSERT INTO employees VALUES (1, '王小明', 'Engineering', 80000);
            INSERT INTO employees VALUES (2, '李美玲', 'Marketing', 75000);
            INSERT INTO employees VALUES (3, '張大衛', 'Sales', 70000);
            INSERT INTO employees VALUES (4, '陳志明', 'Engineering', 85000);
          `,
          starterCode:
            "-- 1. Engineering 部門調薪 10%\nUPDATE employees\nSET salary = salary * 1.1\nWHERE department = 'Engineering';\n\n-- 2. 張大衛轉部門\n-- 請完成這段 UPDATE ...\n\nSELECT * FROM employees ORDER BY id;",
          expectedQuery:
            "UPDATE employees SET salary = salary * 1.1 WHERE department = 'Engineering'; UPDATE employees SET department = 'Marketing' WHERE name = '張大衛'; SELECT * FROM employees ORDER BY id;",
          hints: [
            'UPDATE 表名 SET 欄位 = 新值 WHERE 條件;',
            '調薪 10% 可以寫成 salary = salary * 1.1',
            '一定要加 WHERE 條件，否則會更新所有資料列！',
          ],
          explanation:
            'UPDATE 搭配 WHERE 子句可以精確更新特定資料列。最重要的原則：永遠不要忘記 WHERE 條件。沒有 WHERE 的 UPDATE 會影響整張表的所有資料列，這在生產環境中是災難性的錯誤。',
          frameworkTip:
            'UPDATE 安全守則：(1) 先用 SELECT 確認 WHERE 條件會影響哪些列 (2) 確認影響範圍正確再執行 UPDATE (3) 在交易（Transaction）中執行，出錯可 ROLLBACK。',
        },

        // ── 3. DELETE 安全刪除 ──
        {
          id: 3,
          name: 'DELETE 安全刪除',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '清理過期訂單與關聯明細',
            narrative:
              '電商系統中有 orders 和 order_items 兩張表。主管要求刪除所有 2023 年以前（不含 2023）的訂單及其相關的訂單明細。你必須先刪除子表（order_items）再刪除主表（orders），否則會違反外鍵約束。\n\n資料表結構：\n- orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL)\n- order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER)',
            data: [
              { id: 1, customer: '王小明', order_date: '2022-06-15', total: 1500 },
              { id: 2, customer: '李美玲', order_date: '2022-11-20', total: 3200 },
              { id: 3, customer: '張大衛', order_date: '2023-03-10', total: 800 },
              { id: 4, customer: '陳志明', order_date: '2024-01-05', total: 2100 },
            ],
            dataCaption: 'orders 資料表（order_items 省略）',
          },
          question:
            '安全地刪除 2023 年以前的訂單：先刪除對應的 order_items，再刪除 orders。用 SELECT 驗證刪除前後的資料。',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL);
            INSERT INTO orders VALUES (1, '王小明', '2022-06-15', 1500);
            INSERT INTO orders VALUES (2, '李美玲', '2022-11-20', 3200);
            INSERT INTO orders VALUES (3, '張大衛', '2023-03-10', 800);
            INSERT INTO orders VALUES (4, '陳志明', '2024-01-05', 2100);
            CREATE TABLE order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER);
            INSERT INTO order_items VALUES (1, 1, '筆電', 1);
            INSERT INTO order_items VALUES (2, 1, '滑鼠', 2);
            INSERT INTO order_items VALUES (3, 2, '螢幕', 1);
            INSERT INTO order_items VALUES (4, 3, '鍵盤', 1);
            INSERT INTO order_items VALUES (5, 4, '耳機', 3);
          `,
          starterCode:
            "-- 步驟 1：先確認要刪除哪些訂單\nSELECT * FROM orders WHERE order_date < '2023-01-01';\n\n-- 步驟 2：先刪除子表的關聯資料\n-- DELETE FROM order_items WHERE ...;\n\n-- 步驟 3：再刪除主表的訂單\n-- DELETE FROM orders WHERE ...;\n\n-- 步驟 4：確認結果\nSELECT * FROM orders;\nSELECT * FROM order_items;",
          expectedQuery:
            "DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE order_date < '2023-01-01'); DELETE FROM orders WHERE order_date < '2023-01-01'; SELECT * FROM orders; SELECT * FROM order_items;",
          hints: [
            '先用 SELECT 確認 WHERE 條件抓到的資料是正確的',
            'order_items 的刪除可以用子查詢：WHERE order_id IN (SELECT id FROM orders WHERE ...)',
            '刪除順序很重要：先子表再主表，避免外鍵約束錯誤',
          ],
          explanation:
            '在有外鍵關聯的資料表中刪除資料，必須注意刪除順序：先刪除子表（引用端），再刪除主表（被引用端）。這裡用子查詢 WHERE order_id IN (SELECT id FROM orders WHERE ...) 精確定位要刪除的 order_items。實務上也可以設定 ON DELETE CASCADE 讓資料庫自動處理，但手動控制更安全。',
          frameworkTip:
            'DELETE 安全四步驟：(1) SELECT 確認範圍 (2) 刪子表 (3) 刪主表 (4) SELECT 驗證結果。生產環境一定要在 Transaction 中執行。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-2  CREATE TABLE 與資料型態
       ═══════════════════════════════════════════════════ */
    {
      id: '26-2',
      name: 'CREATE TABLE 與資料型態',
      description: '設計資料表結構、選擇正確的資料型態與約束',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. CREATE TABLE 建表 ──
        {
          id: 1,
          name: 'CREATE TABLE 建表',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '設計電商產品資料表',
            narrative:
              '你正在開發一個電商平台的後端，需要建立一張 products 資料表來存放商品資訊。需求如下：\n- 每個產品有唯一 id（自動遞增主鍵）\n- 產品名稱不可為空\n- 價格為小數，預設值 0\n- 庫存數量為整數，不可為負數\n- 分類為文字\n- 上架日期為文字格式',
            data: [
              { column: 'id', type: 'INTEGER', constraint: 'PRIMARY KEY' },
              { column: 'name', type: 'TEXT', constraint: 'NOT NULL' },
              { column: 'price', type: 'REAL', constraint: 'DEFAULT 0' },
              { column: 'stock', type: 'INTEGER', constraint: 'CHECK(stock >= 0)' },
              { column: 'category', type: 'TEXT', constraint: '' },
              { column: 'listed_date', type: 'TEXT', constraint: '' },
            ],
            dataCaption: '預期的欄位設計',
          },
          question:
            '根據需求建立 products 資料表，並插入兩筆測試資料，最後用 SELECT 查看結果。',
          sampleSchema: '',
          starterCode:
            "-- 建立 products 資料表\nCREATE TABLE products (\n  id INTEGER PRIMARY KEY,\n  name TEXT NOT NULL,\n  -- 補完其餘欄位...\n);\n\n-- 插入測試資料\nINSERT INTO products (name, price, stock, category, listed_date)\nVALUES ('無線藍牙耳機', 1290, 50, '3C', '2024-06-01');\n\n-- 再插入一筆...\n\nSELECT * FROM products;",
          expectedQuery:
            "CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL, price REAL DEFAULT 0, stock INTEGER CHECK(stock >= 0), category TEXT, listed_date TEXT); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('無線藍牙耳機', 1290, 50, '3C', '2024-06-01'); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('機械鍵盤', 2490, 30, '3C', '2024-06-10'); SELECT * FROM products;",
          hints: [
            'SQLite 用 INTEGER PRIMARY KEY 就會自動遞增',
            'CHECK 約束可以限制欄位值的範圍，例如 CHECK(stock >= 0)',
            'DEFAULT 可以設定欄位的預設值',
          ],
          explanation:
            'CREATE TABLE 是定義資料庫結構的基礎。SQLite 的資料型態比較簡單：INTEGER、REAL、TEXT、BLOB。約束（Constraints）包括 PRIMARY KEY（主鍵）、NOT NULL（不可為空）、UNIQUE（唯一值）、DEFAULT（預設值）、CHECK（條件檢查）。好的資料表設計能從源頭防止不合法的資料進入系統。',
          frameworkTip:
            'CREATE TABLE 設計原則：(1) 每張表都要有 PRIMARY KEY (2) 用 NOT NULL 保護必填欄位 (3) 用 CHECK 限制數值範圍 (4) 用 DEFAULT 提供合理預設值。',
        },

        // ── 2. 資料型態與約束 (MC) ──
        {
          id: 2,
          name: '資料型態與約束',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '選擇正確的資料型態與約束',
            narrative:
              '你正在為一間物流公司設計資料庫。其中有一張 shipments 資料表，欄位包括：出貨編號（唯一識別碼）、收件人名稱（必填）、重量（公斤，可以有小數）、運費（不可為負數）、狀態（只能是 pending / shipped / delivered）。',
            data: [
              { column: 'shipment_id', description: '唯一識別碼' },
              { column: 'recipient', description: '必填的收件人名稱' },
              { column: 'weight_kg', description: '重量，可有小數' },
              { column: 'shipping_fee', description: '運費，不可為負數' },
              { column: 'status', description: '只能是 pending/shipped/delivered' },
            ],
            dataCaption: 'shipments 資料表需求',
          },
          question:
            '以下哪一個 CREATE TABLE 語句最正確地實現了上述需求？',
          options: [
            {
              id: 'A',
              text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee >= 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));",
              explanation: '正確！INTEGER PRIMARY KEY 作為唯一識別碼、TEXT NOT NULL 確保必填、REAL 處理小數、CHECK 約束限制值的範圍和允許的選項。',
            },
            {
              id: 'B',
              text: "CREATE TABLE shipments (shipment_id VARCHAR PRIMARY KEY, recipient VARCHAR, weight_kg DECIMAL, shipping_fee DECIMAL, status VARCHAR);",
              explanation: '錯誤。SQLite 不使用 VARCHAR 和 DECIMAL（應用 TEXT 和 REAL）；recipient 缺少 NOT NULL；shipping_fee 和 status 沒有 CHECK 約束。',
            },
            {
              id: 'C',
              text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT, weight_kg REAL, shipping_fee REAL, status TEXT DEFAULT 'pending');",
              explanation: '不完全正確。recipient 缺少 NOT NULL、shipping_fee 缺少 CHECK(>= 0)、status 雖有 DEFAULT 但沒有 CHECK 約束來限制允許的值。',
            },
            {
              id: 'D',
              text: "CREATE TABLE shipments (shipment_id INTEGER UNIQUE, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee > 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));",
              explanation: '接近但不完全正確。shipment_id 用 UNIQUE 而非 PRIMARY KEY（缺少主鍵）；shipping_fee 用 CHECK(> 0) 但運費可以為 0（免運），應為 >= 0。',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'SQLite 使用 TEXT 而非 VARCHAR，用 REAL 而非 DECIMAL',
            'NOT NULL 確保欄位不可為空',
            "CHECK(status IN ('a', 'b', 'c')) 可以限制允許的值",
          ],
          explanation:
            '資料型態選擇和約束設計是資料庫設計的基礎功。SQLite 的型態較簡單（INTEGER, REAL, TEXT, BLOB），但搭配 CHECK、NOT NULL、DEFAULT 等約束，能在資料庫層面防止不合法資料。好的 schema 設計讓你的應用程式少寫很多驗證邏輯。',
          frameworkTip:
            '約束選擇指南：唯一識別 → PRIMARY KEY；必填 → NOT NULL；數值範圍 → CHECK；允許值列表 → CHECK ... IN (...)；預設值 → DEFAULT。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-3  CRUD 與應用程式資料流
       ═══════════════════════════════════════════════════ */
    {
      id: '26-3',
      name: 'CRUD 與應用程式資料流',
      description: '理解 CRUD 操作如何對應到 Web 應用的資料流',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. CRUD 完整操作 ──
        {
          id: 1,
          name: 'CRUD 完整操作',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '待辦事項的完整 CRUD',
            narrative:
              '你正在開發一個待辦事項 App 的後端 API。需要依序完成以下操作：\n1. Create — 新增一筆待辦事項\n2. Read — 查詢所有待辦事項\n3. Update — 將某筆事項標記為完成\n4. Delete — 刪除已完成的事項\n\n資料表結構：todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT)',
            data: [
              { id: 1, title: '完成專案報告', is_done: 0, created_at: '2024-06-01' },
              { id: 2, title: '準備週會簡報', is_done: 1, created_at: '2024-06-02' },
              { id: 3, title: '回覆客戶信件', is_done: 0, created_at: '2024-06-03' },
            ],
            dataCaption: 'todos 資料表',
          },
          question:
            '依序執行 CRUD 操作：\n1. INSERT 新增「部署新版本」\n2. SELECT 查看所有待辦\n3. UPDATE 將 id=1 標記完成\n4. DELETE 刪除所有已完成的事項\n最後 SELECT 確認結果。',
          sampleSchema: `
            CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT);
            INSERT INTO todos VALUES (1, '完成專案報告', 0, '2024-06-01');
            INSERT INTO todos VALUES (2, '準備週會簡報', 1, '2024-06-02');
            INSERT INTO todos VALUES (3, '回覆客戶信件', 0, '2024-06-03');
          `,
          starterCode:
            "-- C: Create\nINSERT INTO todos (title, created_at) VALUES ('部署新版本', '2024-06-04');\n\n-- R: Read\nSELECT * FROM todos;\n\n-- U: Update（將 id=1 標記完成）\n-- UPDATE ...\n\n-- D: Delete（刪除已完成的事項）\n-- DELETE ...\n\n-- 確認最終結果\nSELECT * FROM todos;",
          expectedQuery:
            "INSERT INTO todos (title, created_at) VALUES ('部署新版本', '2024-06-04'); SELECT * FROM todos; UPDATE todos SET is_done = 1 WHERE id = 1; DELETE FROM todos WHERE is_done = 1; SELECT * FROM todos;",
          hints: [
            'UPDATE todos SET is_done = 1 WHERE id = 1;',
            'DELETE FROM todos WHERE is_done = 1; 會刪除所有已完成的事項',
            'CRUD 就是 Create(INSERT), Read(SELECT), Update(UPDATE), Delete(DELETE)',
          ],
          explanation:
            'CRUD 是所有資料驅動應用的核心操作模式。幾乎每個 Web/App 後端都是在對資料庫做 CRUD。理解這四個操作如何組合成完整的業務邏輯，是成為 Business Engineer 的基礎。',
          frameworkTip:
            'CRUD 對應表：Create → INSERT、Read → SELECT、Update → UPDATE、Delete → DELETE。在 REST API 中分別對應 POST、GET、PUT/PATCH、DELETE。',
        },

        // ── 2. HTTP 與 SQL 對應 (MC) ──
        {
          id: 2,
          name: 'HTTP 與 SQL 對應',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: 'REST API 與 SQL 的對應關係',
            narrative:
              '你正在設計一個 REST API 來管理客戶資料。前端會發送不同的 HTTP 請求，後端需要將這些請求對應到正確的 SQL 操作。\n\n例如：\n- 前端送出 POST /api/customers 加上 JSON body → 後端執行什麼 SQL？\n- 前端送出 GET /api/customers/123 → 後端執行什麼 SQL？\n- 前端送出 PUT /api/customers/123 加上 JSON body → 後端執行什麼 SQL？\n- 前端送出 DELETE /api/customers/123 → 後端執行什麼 SQL？',
            data: [
              { method: 'POST', path: '/api/customers', action: '新增客戶' },
              { method: 'GET', path: '/api/customers/:id', action: '查詢單筆客戶' },
              { method: 'PUT', path: '/api/customers/:id', action: '更新客戶資料' },
              { method: 'DELETE', path: '/api/customers/:id', action: '刪除客戶' },
            ],
            dataCaption: 'REST API 端點',
          },
          question:
            '以下哪個選項正確描述了 HTTP Method 和 SQL 操作的對應關係？',
          options: [
            {
              id: 'A',
              text: 'POST → INSERT、GET → SELECT、PUT → UPDATE、DELETE → DELETE',
              explanation: '正確！這是 RESTful API 中最標準的對應方式。POST 新增資源對應 INSERT，GET 讀取對應 SELECT，PUT 更新對應 UPDATE，DELETE 刪除對應 DELETE。',
            },
            {
              id: 'B',
              text: 'GET → INSERT、POST → SELECT、PUT → DELETE、DELETE → UPDATE',
              explanation: '完全錯誤。GET 是讀取操作不應該修改資料，POST 是新增操作不是查詢。',
            },
            {
              id: 'C',
              text: 'POST → INSERT、GET → SELECT、PATCH → INSERT、DELETE → UPDATE',
              explanation: '不正確。PATCH 是部分更新，不是新增；DELETE 是刪除，不是更新。',
            },
            {
              id: 'D',
              text: 'POST → SELECT、GET → INSERT、PUT → DELETE、DELETE → UPDATE',
              explanation: '完全相反。POST 是寫入操作，GET 是讀取操作，PUT 是更新，DELETE 是刪除。',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'HTTP GET 是「讀取」操作，對應到 SQL 的「讀取」操作',
            'POST 表示「創建新資源」',
            'REST 的設計原則是 HTTP Method 語意明確',
          ],
          explanation:
            'RESTful API 的核心設計理念是讓 HTTP Method 語意化：POST（創建）→ INSERT、GET（讀取）→ SELECT、PUT/PATCH（更新）→ UPDATE、DELETE（刪除）→ DELETE。這套 CRUD 映射是 Web 開發的基礎知識，面試必考。另外 PUT 是全量更新，PATCH 是部分更新，兩者對應到 UPDATE 時 SET 的欄位數量不同。',
          frameworkTip:
            'HTTP ↔ CRUD ↔ SQL 三重對應：POST=Create=INSERT、GET=Read=SELECT、PUT/PATCH=Update=UPDATE、DELETE=Delete=DELETE。',
        },

        // ── 3. 交易處理 Transaction ──
        {
          id: 3,
          name: '交易處理 Transaction',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '銀行轉帳的交易安全',
            narrative:
              '銀行系統中，轉帳必須是「原子操作」：A 帳戶扣款和 B 帳戶加款必須同時成功或同時失敗。如果扣款成功但加款失敗（例如系統當機），必須回滾（ROLLBACK）。\n\n資料表結構：accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0))',
            data: [
              { id: 1, owner: '王小明', balance: 50000 },
              { id: 2, owner: '李美玲', balance: 30000 },
              { id: 3, owner: '張大衛', balance: 10000 },
            ],
            dataCaption: 'accounts 帳戶餘額',
          },
          question:
            '使用 BEGIN / COMMIT 實現一筆轉帳交易：從王小明（id=1）轉帳 15000 到李美玲（id=2）。確保兩個 UPDATE 在同一個交易中完成。',
          sampleSchema: `
            CREATE TABLE accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0));
            INSERT INTO accounts VALUES (1, '王小明', 50000);
            INSERT INTO accounts VALUES (2, '李美玲', 30000);
            INSERT INTO accounts VALUES (3, '張大衛', 10000);
          `,
          starterCode:
            "-- 開始交易\nBEGIN TRANSACTION;\n\n-- 從王小明帳戶扣款 15000\nUPDATE accounts SET balance = balance - 15000 WHERE id = 1;\n\n-- 向李美玲帳戶加款 15000\n-- 請完成...\n\n-- 提交交易\nCOMMIT;\n\n-- 確認結果\nSELECT * FROM accounts;",
          expectedQuery:
            'BEGIN TRANSACTION; UPDATE accounts SET balance = balance - 15000 WHERE id = 1; UPDATE accounts SET balance = balance + 15000 WHERE id = 2; COMMIT; SELECT * FROM accounts;',
          hints: [
            'BEGIN TRANSACTION 開啟交易，COMMIT 提交，ROLLBACK 回滾',
            '兩個 UPDATE 必須放在 BEGIN 和 COMMIT 之間',
            'CHECK(balance >= 0) 會防止餘額變成負數',
          ],
          explanation:
            'Transaction（交易）確保一組操作的原子性（Atomicity）：要嘛全部成功，要嘛全部回滾。ACID 四特性：Atomicity（原子性）、Consistency（一致性）、Isolation（隔離性）、Durability（持久性）。轉帳是最經典的交易場景，面試中經常用來考 Transaction 的概念。',
          frameworkTip:
            'Transaction 三步驟：BEGIN → 執行多條 SQL → COMMIT（成功）或 ROLLBACK（失敗）。金融操作、庫存扣減等涉及多表變更的操作，一定要用 Transaction。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-4  SQL 與 Python 整合
       ═══════════════════════════════════════════════════ */
    {
      id: '26-4',
      name: 'SQL 與 Python 整合',
      description: '了解 SQL 注入防護與 Python 中使用 SQL 的最佳實踐',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. SQL 注入防護 (MC) ──
        {
          id: 1,
          name: 'SQL 注入防護',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '防止 SQL Injection 攻擊',
            narrative:
              '你的同事寫了一段 Python 登入驗證程式：\n\n```python\nusername = input("帳號: ")\npassword = input("密碼: ")\nquery = f"SELECT * FROM users WHERE username = \'{username}\' AND password = \'{password}\'"\ncursor.execute(query)\n```\n\n這段程式有嚴重的安全漏洞。如果使用者在帳號欄位輸入 `admin\' --`，SQL 會變成：\nSELECT * FROM users WHERE username = \'admin\' --\' AND password = \'...\'\n\n`--` 之後變成註解，密碼驗證被跳過了！',
            data: [
              { input: "admin' --", result: '繞過密碼驗證，直接登入 admin 帳號' },
              { input: "' OR '1'='1", result: '回傳所有用戶資料' },
              { input: "'; DROP TABLE users; --", result: '刪除整張 users 資料表' },
            ],
            dataCaption: '常見的 SQL 注入攻擊範例',
          },
          question:
            '以下哪種方式是防止 SQL Injection 的最佳實踐？',
          options: [
            {
              id: 'A',
              text: '使用參數化查詢（Parameterized Query）：cursor.execute("SELECT * FROM users WHERE username = ? AND password = ?", (username, password))',
              explanation: '正確！參數化查詢讓資料庫引擎自動處理特殊字元的轉義，從根本上防止 SQL 注入。這是業界公認的最佳做法。',
            },
            {
              id: 'B',
              text: "手動過濾特殊字元：username = username.replace(\"'\", \"''\")",
              explanation: '不推薦。手動過濾容易遺漏邊界情況（如 Unicode 字元、不同資料庫的轉義規則），而且難以維護。應使用資料庫提供的參數化查詢。',
            },
            {
              id: 'C',
              text: '限制輸入長度：if len(username) > 20: raise Error',
              explanation: '不足夠。限制長度可以降低風險但無法真正防止注入。短字串如 \' OR 1=1-- 已經可以造成攻擊。',
            },
            {
              id: 'D',
              text: '只允許英文和數字：re.match(r"^[a-zA-Z0-9]+$", username)',
              explanation: '過度限制且不夠全面。有些合法的使用者名稱可能包含特殊字元（如 email 格式）。參數化查詢才是根本解法。',
            },
          ],
          correctAnswer: 'A',
          hints: [
            '參數化查詢用 ? 或 :name 作為佔位符，資料庫自動處理轉義',
            'f-string 或字串拼接是 SQL 注入的根源',
            'ORM（如 SQLAlchemy）內部也是使用參數化查詢',
          ],
          explanation:
            'SQL Injection 是 OWASP Top 10 安全漏洞之首。防禦的黃金法則：永遠不要用字串拼接組合 SQL 查詢。使用參數化查詢（Parameterized Query），讓資料庫引擎負責處理特殊字元。Python sqlite3 用 ? 佔位符，其他語言/框架也有類似機制（如 Java 的 PreparedStatement、Node.js 的 $ 佔位符）。',
          frameworkTip:
            '防 SQL 注入三原則：(1) 永遠使用參數化查詢 (2) 永遠不要拼接使用者輸入到 SQL 字串 (3) 使用 ORM 框架可以進一步減少風險。',
        },

        // ── 2. Python + SQL 整合設計 (open-ended) ──
        {
          id: 2,
          name: 'Python + SQL 整合設計',
          type: 'open-ended',
          difficulty: 'medium',
          scenario: {
            title: '設計 Python + SQLite 的資料存取層',
            narrative:
              '你的團隊要開發一個「客戶管理系統」。技術選型為 Python + SQLite。你需要設計資料存取層（Data Access Layer），讓業務邏輯可以透過簡潔的 Python 函式來操作資料庫，而不需要直接寫 SQL。\n\n需要支援的操作：\n- 建立資料表（初始化）\n- 新增客戶\n- 根據 ID 查詢客戶\n- 更新客戶資料\n- 刪除客戶\n\n請思考如何組織程式碼、處理錯誤、和確保安全性。',
            data: [
              { function: 'init_db()', description: '建立資料表' },
              { function: 'create_customer(name, email)', description: '新增客戶' },
              { function: 'get_customer(id)', description: '查詢單筆客戶' },
              { function: 'update_customer(id, **kwargs)', description: '更新客戶' },
              { function: 'delete_customer(id)', description: '刪除客戶' },
            ],
            dataCaption: '預期的函式介面',
          },
          question:
            '請描述你會如何設計這個 Python + SQLite 的資料存取層。需要涵蓋：\n1. 資料表結構設計\n2. 連線管理（何時開啟/關閉連線）\n3. 錯誤處理策略\n4. SQL 注入防護\n5. 你會選擇直接用 sqlite3 還是 ORM？為什麼？',
          prompt:
            '請設計一個 Python + SQLite 的客戶管理資料存取層，說明資料表設計、連線管理、錯誤處理、安全性和技術選型的考量。',
          evaluationCriteria: [
            '資料表設計合理（包含 PRIMARY KEY、NOT NULL 等約束）',
            '使用參數化查詢防止 SQL 注入',
            '有合理的連線管理策略（例如使用 context manager）',
            '包含錯誤處理（try/except 或 Transaction rollback）',
            '能說明 sqlite3 vs ORM 的取捨',
          ],
          sampleAnswer:
            '資料表設計：CREATE TABLE customers (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, phone TEXT, created_at TEXT DEFAULT CURRENT_TIMESTAMP)。\n\n連線管理：使用 Python 的 context manager（with 語法）管理連線，確保即使發生錯誤也會正確關閉。可以封裝成一個 get_connection() 函式。\n\n錯誤處理：每個操作用 try/except 包裹，捕獲 sqlite3.IntegrityError（如 UNIQUE 違反）和 sqlite3.OperationalError。寫入操作放在 Transaction 中，錯誤時 ROLLBACK。\n\nSQL 注入防護：所有查詢都使用參數化語法 cursor.execute("SELECT * FROM customers WHERE id = ?", (customer_id,))，絕不使用 f-string 拼接。\n\n技術選型：小型專案用 sqlite3 即可，程式碼透明且依賴少。中大型專案推薦 SQLAlchemy ORM，好處是程式碼更 Pythonic、支援多種資料庫切換、自動處理 schema migration。取捨在於 ORM 的學習曲線和效能開銷。',
          hints: [
            'Python 的 with sqlite3.connect(...) as conn 可以自動管理 Transaction',
            '參數化查詢用 ? 佔位符，不要用 f-string',
            '思考：如果專案規模變大，你的設計能否平滑遷移到 PostgreSQL？',
          ],
          explanation:
            '資料存取層（DAL / Repository Pattern）是軟體架構中非常重要的一層。它把資料庫操作封裝在獨立模組中，讓業務邏輯不直接依賴特定的資料庫。好的 DAL 設計要考慮：連線管理、錯誤處理、安全性（防注入）、可測試性（可以 mock）、和未來的擴展性（換資料庫時只改 DAL）。',
          frameworkTip:
            'DAL 設計 checklist：(1) 連線管理用 context manager (2) 所有 SQL 用參數化查詢 (3) 寫入操作用 Transaction (4) 錯誤有明確的處理和回報 (5) 函式介面與 SQL 實作分離。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-5  權限、資料隔離與 Query Performance
       ═══════════════════════════════════════════════════ */
    {
      id: '26-5',
      name: '權限、資料隔離與 Query Performance',
      description: '資料庫權限管理、索引與查詢效能優化',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. 權限管理概念 (MC) ──
        {
          id: 1,
          name: '權限管理概念',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '資料庫權限模型',
            narrative:
              '你的公司有一個內部資料倉儲，不同角色的人需要不同的存取權限：\n\n- 資料分析師：只需要讀取資料（SELECT）\n- 應用程式帳號：需要讀寫資料（SELECT, INSERT, UPDATE, DELETE）\n- DBA 管理員：需要完整權限（含 CREATE, DROP, GRANT）\n\n在 PostgreSQL / MySQL 等企業級資料庫中，這是透過 GRANT / REVOKE 語句來管理的。（SQLite 不支援 GRANT/REVOKE，但概念在面試中很常考。）',
            data: [
              { role: '資料分析師', permissions: 'SELECT' },
              { role: '應用程式帳號', permissions: 'SELECT, INSERT, UPDATE, DELETE' },
              { role: 'DBA 管理員', permissions: 'ALL PRIVILEGES' },
            ],
            dataCaption: '角色與權限對應',
          },
          question:
            '關於資料庫權限管理，以下哪個描述是正確的？',
          options: [
            {
              id: 'A',
              text: 'GRANT SELECT ON customers TO analyst; 表示授予 analyst 角色對 customers 資料表的唯讀權限。REVOKE 則用來撤銷已授予的權限。最小權限原則（Principle of Least Privilege）要求只給予完成工作所需的最少權限。',
              explanation: '正確！GRANT 授權、REVOKE 撤權，配合最小權限原則是資料庫安全的基礎。每個角色只應擁有其工作所需的最少權限。',
            },
            {
              id: 'B',
              text: '為了方便管理，應該給所有帳號 ALL PRIVILEGES，再用應用程式層面來控制權限。',
              explanation: '嚴重錯誤！這違反最小權限原則。如果應用程式有漏洞，攻擊者就能做任何事。權限應在資料庫層面控制。',
            },
            {
              id: 'C',
              text: 'GRANT 和 REVOKE 只適用於 SQLite，大型資料庫使用其他機制。',
              explanation: '恰好相反。SQLite 是嵌入式資料庫，不支援 GRANT/REVOKE。這些是 PostgreSQL、MySQL、SQL Server 等多用戶資料庫的功能。',
            },
            {
              id: 'D',
              text: '資料庫權限只需要在初始設定時配置一次，之後不需要維護。',
              explanation: '錯誤。權限需要隨著人員變動、角色調整而持續維護。員工離職要撤權、新功能上線要調整權限，這是持續性的工作。',
            },
          ],
          correctAnswer: 'A',
          hints: [
            'GRANT 授權、REVOKE 撤權 — 這是企業級資料庫的基本安全機制',
            '最小權限原則：只給需要的權限，不多給',
            'SQLite 不支援 GRANT/REVOKE，但面試會考這個概念',
          ],
          explanation:
            '資料庫權限管理是企業安全的重要一環。GRANT/REVOKE 語法雖然在 SQLite 中不適用，但在 PostgreSQL、MySQL 等多用戶資料庫中是必備知識。最小權限原則（Least Privilege）是資安基礎：分析師只需 SELECT、應用帳號需 CRUD、只有 DBA 才有 DDL 和 GRANT 權限。Row-Level Security（RLS）可以更細緻地控制不同用戶看到不同的資料列。',
          frameworkTip:
            '權限管理三層次：(1) 資料庫層 — GRANT/REVOKE 控制表和操作權限 (2) 列層 — Row-Level Security 控制可見資料範圍 (3) 應用層 — 業務邏輯的額外權限檢查。',
        },

        // ── 2. 索引與效能 ──
        {
          id: 2,
          name: '索引與效能',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '為慢查詢建立索引',
            narrative:
              '你的電商平台有一張 100 萬筆的 orders 資料表，以下查詢跑了 5 秒鐘：\n\nSELECT * FROM orders WHERE customer_id = 12345 AND status = \'shipped\';\n\n因為沒有索引，資料庫做了全表掃描（Full Table Scan）。你需要建立適當的索引來加速查詢。\n\n資料表結構：orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT)',
            data: [
              { id: 1, customer_id: 100, product: '筆電', status: 'shipped', amount: 35000, order_date: '2024-03-15' },
              { id: 2, customer_id: 200, product: '手機', status: 'pending', amount: 28000, order_date: '2024-03-16' },
              { id: 3, customer_id: 100, product: '滑鼠', status: 'delivered', amount: 800, order_date: '2024-03-17' },
              { id: 4, customer_id: 300, product: '螢幕', status: 'shipped', amount: 12000, order_date: '2024-03-18' },
            ],
            dataCaption: 'orders 資料表（實際有百萬筆）',
          },
          question:
            '為常見的查詢模式建立索引：\n1. 建立一個複合索引 (composite index) 在 customer_id 和 status 上\n2. 建立一個索引在 order_date 上（因為常按日期範圍查詢）\n3. 用 EXPLAIN QUERY PLAN 驗證索引是否被使用',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 100, '筆電', 'shipped', 35000, '2024-03-15');
            INSERT INTO orders VALUES (2, 200, '手機', 'pending', 28000, '2024-03-16');
            INSERT INTO orders VALUES (3, 100, '滑鼠', 'delivered', 800, '2024-03-17');
            INSERT INTO orders VALUES (4, 300, '螢幕', 'shipped', 12000, '2024-03-18');
            INSERT INTO orders VALUES (5, 100, '鍵盤', 'shipped', 2500, '2024-03-19');
            INSERT INTO orders VALUES (6, 200, '耳機', 'delivered', 3200, '2024-03-20');
          `,
          starterCode:
            "-- 1. 建立複合索引（customer_id + status）\nCREATE INDEX idx_orders_customer_status\n  ON orders (customer_id, status);\n\n-- 2. 建立日期索引\n-- CREATE INDEX ...\n\n-- 3. 用 EXPLAIN QUERY PLAN 檢查索引效果\nEXPLAIN QUERY PLAN\nSELECT * FROM orders\nWHERE customer_id = 100 AND status = 'shipped';",
          expectedQuery:
            "CREATE INDEX idx_orders_customer_status ON orders (customer_id, status); CREATE INDEX idx_orders_date ON orders (order_date); EXPLAIN QUERY PLAN SELECT * FROM orders WHERE customer_id = 100 AND status = 'shipped';",
          hints: [
            'CREATE INDEX 索引名 ON 表名 (欄位1, 欄位2); 建立複合索引',
            '複合索引的欄位順序很重要：高選擇性的欄位放前面',
            'EXPLAIN QUERY PLAN 可以看到查詢是否使用了索引',
          ],
          explanation:
            '索引（Index）是加速查詢的關鍵。沒有索引時資料庫必須掃描每一列（Full Table Scan），有索引時可以直接定位目標資料（Index Scan）。複合索引（Composite Index）適合多條件查詢，欄位順序遵循最左前綴原則（Leftmost Prefix）。但索引也有代價：佔用額外儲存空間，且會降低寫入速度（INSERT/UPDATE/DELETE 需要更新索引）。',
          frameworkTip:
            '索引設計原則：(1) 為 WHERE、JOIN、ORDER BY 常用欄位建索引 (2) 複合索引遵循最左前綴原則 (3) 高選擇性欄位放前面 (4) 不要過度索引，寫入多的表要節制 (5) 用 EXPLAIN 驗證。',
        },

        // ── 3. Query 效能分析 (MC, hard) ──
        {
          id: 3,
          name: 'Query 效能分析',
          type: 'multiple-choice',
          difficulty: 'hard',
          scenario: {
            title: '分析慢查詢並優化',
            narrative:
              '資料分析師反應以下查詢在百萬筆資料的 orders 表上跑了 30 秒：\n\n```sql\nSELECT c.name, SUM(o.amount) AS total_spent\nFROM orders o\nJOIN customers c ON o.customer_id = c.id\nWHERE SUBSTR(o.order_date, 1, 7) = \'2024-03\'\nGROUP BY c.name\nHAVING SUM(o.amount) > 10000\nORDER BY total_spent DESC;\n```\n\n你用 EXPLAIN QUERY PLAN 發現 orders 表做了 Full Table Scan。已知 orders 上有 idx_orders_date (order_date) 索引。',
            data: [
              { issue: 'SUBSTR(o.order_date, 1, 7)', impact: '函式包裹欄位導致索引失效' },
              { issue: 'Full Table Scan on orders', impact: '掃描百萬筆效能極差' },
              { issue: '缺少 JOIN 欄位索引', impact: 'customer_id 可能也需要索引' },
            ],
            dataCaption: '效能問題分析',
          },
          question:
            '以下哪個優化方案最能有效改善這個查詢的效能？',
          options: [
            {
              id: 'A',
              text: "將 WHERE SUBSTR(o.order_date, 1, 7) = '2024-03' 改為 WHERE o.order_date >= '2024-03-01' AND o.order_date < '2024-04-01'，讓索引能被正確使用（Sargable 查詢）。同時確認 customer_id 有索引以加速 JOIN。",
              explanation: '正確！在 WHERE 條件中對欄位使用函式（如 SUBSTR）會導致索引失效。改用範圍查詢可以讓資料庫利用 order_date 上的索引。這就是 Sargable（Search ARGument ABLE）查詢的概念。',
            },
            {
              id: 'B',
              text: '在 SUBSTR(o.order_date, 1, 7) 上建立一個計算索引（Expression Index），這樣原始查詢就可以使用索引了。',
              explanation: '雖然某些資料庫支援 Expression Index，但 SQLite 的支援有限。更重要的是，改寫為範圍查詢是更通用、更簡單的做法，不需要額外索引。',
            },
            {
              id: 'C',
              text: '把 GROUP BY 和 HAVING 移除，改用子查詢先 JOIN 再過濾，這樣可以減少掃描範圍。',
              explanation: '不正確。效能瓶頸在 WHERE 條件的索引失效，不在 GROUP BY 和 HAVING。即使改寫查詢結構，SUBSTR 導致的索引失效問題依然存在。',
            },
            {
              id: 'D',
              text: '增加記憶體和 CPU 資源，因為百萬筆的 Full Table Scan 需要更好的硬體。',
              explanation: '硬體升級是最後手段，不是第一選擇。正確的做法是先優化查詢和索引。把 Full Table Scan 改成 Index Scan 的效果遠遠超過硬體升級。',
            },
          ],
          correctAnswer: 'A',
          hints: [
            '對 WHERE 欄位使用函式（SUBSTR, YEAR, LOWER 等）會讓索引失效',
            'Sargable = Search ARGument ABLE = 索引能用的查詢寫法',
            '範圍查詢（>= 和 <）可以利用 B-Tree 索引',
          ],
          explanation:
            '查詢效能優化的第一步是確保索引被正確使用。最常見的索引失效原因是在 WHERE 條件的欄位上使用函式（Non-Sargable Query）。SUBSTR(order_date, 1, 7) 迫使資料庫對每一列都計算 SUBSTR 再比較，無法利用索引。改為範圍查詢 order_date >= ... AND order_date < ... 後，資料庫可以直接在 B-Tree 索引上做範圍掃描，效率提升數百倍。',
          frameworkTip:
            '索引失效常見原因：(1) WHERE 欄位用函式包裹 (2) 隱性型態轉換 (3) LIKE 以 % 開頭 (4) OR 條件跨多欄位 (5) NOT IN / NOT EXISTS。面試必知的效能優化考點。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 26-6  Boss: 系統設計 SQL Case
       ═══════════════════════════════════════════════════ */
    {
      id: '26-6',
      name: 'Boss: 系統設計 SQL Case',
      description: '綜合考驗：完整資料庫設計與系統設計面試',
      xp: 200,
      isBoss: true,
      challenges: [
        // ── 1. 完整資料庫設計 (code, hard) ──
        {
          id: 1,
          name: '完整資料庫設計',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '線上課程平台的資料庫設計',
            narrative:
              '你被聘為一個線上課程平台的後端工程師，需要設計完整的資料庫 Schema。平台需求：\n\n1. 用戶（students）可以註冊帳號\n2. 講師（instructors）可以開設課程（courses）\n3. 每門課程有多個章節（lessons）\n4. 學生可以報名（enrollments）多門課程\n5. 學生完成章節後記錄進度（progress）\n\n需要考慮的約束：\n- 同一學生不能重複報名同一門課程\n- 課程價格不可為負\n- 章節的排序（sort_order）不可為負\n- 進度表要記錄完成時間',
            data: [
              { table: 'students', columns: 'id, name, email(唯一), registered_at' },
              { table: 'instructors', columns: 'id, name, email(唯一), bio' },
              { table: 'courses', columns: 'id, title, instructor_id(外鍵), price, created_at' },
              { table: 'lessons', columns: 'id, course_id(外鍵), title, sort_order, content' },
              { table: 'enrollments', columns: 'id, student_id(外鍵), course_id(外鍵), enrolled_at' },
              { table: 'progress', columns: 'id, enrollment_id(外鍵), lesson_id(外鍵), completed_at' },
            ],
            dataCaption: '預期的資料表結構',
          },
          question:
            '設計完整的資料庫 Schema：建立所有資料表，包含正確的資料型態、主鍵、外鍵、約束，並插入一些測試資料驗證設計。',
          sampleSchema: '',
          starterCode:
            "-- 1. 建立 students 資料表\nCREATE TABLE students (\n  id INTEGER PRIMARY KEY,\n  name TEXT NOT NULL,\n  email TEXT UNIQUE NOT NULL,\n  registered_at TEXT DEFAULT (datetime('now'))\n);\n\n-- 2. 建立 instructors 資料表\n-- CREATE TABLE instructors ...\n\n-- 3. 建立 courses 資料表（含外鍵）\n-- CREATE TABLE courses ...\n\n-- 4. 建立 lessons 資料表\n-- CREATE TABLE lessons ...\n\n-- 5. 建立 enrollments 資料表（同一學生不能重複報名同一課程）\n-- CREATE TABLE enrollments ...\n\n-- 6. 建立 progress 資料表\n-- CREATE TABLE progress ...\n\n-- 插入測試資料並驗證\n-- INSERT INTO ...",
          expectedQuery:
            "CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, registered_at TEXT DEFAULT (datetime('now'))); CREATE TABLE instructors (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, bio TEXT); CREATE TABLE courses (id INTEGER PRIMARY KEY, title TEXT NOT NULL, instructor_id INTEGER NOT NULL REFERENCES instructors(id), price REAL DEFAULT 0 CHECK(price >= 0), created_at TEXT DEFAULT (datetime('now'))); CREATE TABLE lessons (id INTEGER PRIMARY KEY, course_id INTEGER NOT NULL REFERENCES courses(id), title TEXT NOT NULL, sort_order INTEGER CHECK(sort_order >= 0), content TEXT); CREATE TABLE enrollments (id INTEGER PRIMARY KEY, student_id INTEGER NOT NULL REFERENCES students(id), course_id INTEGER NOT NULL REFERENCES courses(id), enrolled_at TEXT DEFAULT (datetime('now')), UNIQUE(student_id, course_id)); CREATE TABLE progress (id INTEGER PRIMARY KEY, enrollment_id INTEGER NOT NULL REFERENCES enrollments(id), lesson_id INTEGER NOT NULL REFERENCES lessons(id), completed_at TEXT DEFAULT (datetime('now'))); INSERT INTO instructors VALUES (1, '王教授', 'wang@edu.tw', 'SQL 專家，10 年教學經驗'); INSERT INTO students VALUES (1, '陳同學', 'chen@mail.com', '2024-06-01'); INSERT INTO courses VALUES (1, 'SQL 從入門到精通', 1, 1990, '2024-06-01'); INSERT INTO lessons VALUES (1, 1, 'SELECT 基礎', 1, '學習基本查詢'); INSERT INTO lessons VALUES (2, 1, 'JOIN 進階', 2, '學習多表連接'); INSERT INTO enrollments VALUES (1, 1, 1, '2024-06-05'); INSERT INTO progress VALUES (1, 1, 1, '2024-06-06'); SELECT s.name AS student, c.title AS course, l.title AS lesson, p.completed_at FROM progress p JOIN enrollments e ON p.enrollment_id = e.id JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id JOIN lessons l ON p.lesson_id = l.id;",
          hints: [
            'UNIQUE(student_id, course_id) 可以防止重複報名',
            'REFERENCES 表名(欄位) 建立外鍵關係',
            'CHECK(price >= 0) 限制價格不可為負',
            '先建立沒有外鍵依賴的表，再建立有外鍵的表',
          ],
          explanation:
            '完整的資料庫設計需要考慮：(1) 實體識別 — 每個業務物件對應一張表 (2) 關係建立 — 用外鍵表達 1:N 和 N:M 關係 (3) 約束設計 — PRIMARY KEY、FOREIGN KEY、UNIQUE、NOT NULL、CHECK、DEFAULT (4) 正規化 — 避免資料重複 (5) 測試驗證 — 插入資料確認設計正確。enrollments 是學生和課程的多對多關聯表，UNIQUE(student_id, course_id) 確保不重複報名。',
          frameworkTip:
            '資料庫設計 5 步驟：(1) 列出所有實體 (2) 定義每個實體的屬性和型態 (3) 建立實體間的關係（1:1, 1:N, N:M）(4) 加上約束防止不合法資料 (5) 正規化到第三正規形式（3NF）。',
        },

        // ── 2. 系統設計面試 (open-ended, hard) ──
        {
          id: 2,
          name: '系統設計面試',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: '設計電商平台的資料層',
            narrative:
              '面試官問你：「請設計一個簡易電商平台的資料庫層，需要支援以下功能：\n\n1. 商品管理（CRUD）\n2. 購物車功能\n3. 訂單建立（從購物車結帳）\n4. 訂單歷史查詢\n5. 簡易庫存管理（下單時扣庫存）\n\n請描述你的資料表設計、關鍵查詢、索引策略、以及如何處理併發下單（兩人同時搶最後一件商品）。」',
            data: [
              { feature: '商品管理', tables: 'products' },
              { feature: '購物車', tables: 'cart_items' },
              { feature: '訂單建立', tables: 'orders, order_items' },
              { feature: '庫存管理', tables: 'products.stock' },
              { feature: '併發控制', tables: 'Transaction + CHECK constraint' },
            ],
            dataCaption: '核心功能與資料表映射',
          },
          question:
            '請完整回答這個系統設計面試題。需要涵蓋：\n1. 資料表設計（Schema Design）\n2. 關鍵 SQL 查詢（結帳流程的 SQL）\n3. 索引策略（哪些欄位需要索引、為什麼）\n4. 併發控制（如何處理兩人同時搶購）\n5. 效能考量（大量訂單時的瓶頸和解法）',
          prompt:
            '設計電商平台的資料庫層，涵蓋 Schema 設計、關鍵查詢、索引策略、併發控制和效能考量。',
          evaluationCriteria: [
            '資料表設計完整且正規化（products, cart_items, orders, order_items）',
            '結帳流程用 Transaction 確保原子性',
            '庫存扣減用 CHECK(stock >= 0) 防止超賣',
            '索引策略合理（考慮常見查詢模式）',
            '提到併發控制的方案（悲觀鎖 or 樂觀鎖 or CHECK 約束）',
            '能分析效能瓶頸並提出解法',
          ],
          sampleAnswer:
            'Schema 設計：products (id, name, price, stock CHECK(stock >= 0), category, created_at)、cart_items (id, user_id, product_id, quantity, added_at, UNIQUE(user_id, product_id))、orders (id, user_id, total, status, created_at)、order_items (id, order_id, product_id, quantity, price_at_purchase)。\n\n結帳流程 SQL：BEGIN TRANSACTION → INSERT INTO orders → 對每個 cart_item 做 INSERT INTO order_items 並 UPDATE products SET stock = stock - quantity → DELETE FROM cart_items WHERE user_id = ? → COMMIT。如果任何步驟失敗就 ROLLBACK。\n\n索引策略：orders(user_id) 加速查詢用戶訂單歷史、cart_items(user_id) 加速載入購物車、products(category) 加速分類瀏覽、order_items(order_id) 加速訂單明細查詢。\n\n併發控制：CHECK(stock >= 0) 是最簡單的防超賣機制 — 如果兩人同時搶最後一件，第二個 UPDATE 會讓 stock 變成負數，觸發 CHECK 約束而失敗，Transaction 自動 ROLLBACK。更進階可用 SELECT ... FOR UPDATE（悲觀鎖）或版本號欄位（樂觀鎖）。\n\n效能考量：訂單量大時 orders 表是瓶頸，可考慮按月分區（Partitioning）；熱門商品的庫存更新有鎖競爭，可用 Redis 做庫存緩存，定期同步回資料庫。',
          hints: [
            'CHECK(stock >= 0) 可以在資料庫層面防止庫存變成負數',
            '結帳流程必須在 Transaction 中完成',
            '思考：為什麼 order_items 要記錄 price_at_purchase 而不是直接 JOIN products？',
          ],
          explanation:
            '電商資料庫設計是系統設計面試的經典題。核心要點：(1) 訂單明細要快照價格（price_at_purchase），因為商品價格會變 (2) 庫存扣減必須用 Transaction 確保原子性 (3) CHECK 約束是防超賣的第一道防線 (4) 索引設計要根據查詢模式 (5) 大規模場景需要考慮分區、緩存、讀寫分離等策略。',
          frameworkTip:
            '系統設計面試的資料庫設計框架：(1) 先畫 ER 圖 (2) 定義資料表和關係 (3) 寫出關鍵流程的 SQL (4) 設計索引 (5) 討論併發和效能 (6) 提出擴展方案。記得回答時邊畫邊說，展示結構化思考。',
        },
      ],
    },
  ],
};
