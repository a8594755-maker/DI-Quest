/**
 * World 26 — SQL 工程應用：額外挑戰題
 * 靈感來自真實面試題與 LeetCode / StrataScratch
 * 每題皆有 sourceTag 標示來源
 */

export const w26Extra = {
  '26-1': [
    {
      id: 4,
      name: '刪除重複資料',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '清理重複的客戶 Email',
        narrative: '行銷團隊匯入了一批名單到 contacts 資料表，但因為檔案重複匯入，有些 email 出現了多筆紀錄。主管請你刪除重複的資料，只保留每個 email 最早的那筆（id 最小的）。\n\n資料表結構：contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)',
        data: [
          { id: 1, email: 'alice@mail.com', name: 'Alice', created_at: '2024-01-10' },
          { id: 2, email: 'bob@mail.com', name: 'Bob', created_at: '2024-01-12' },
          { id: 3, email: 'alice@mail.com', name: 'Alice Lin', created_at: '2024-01-15' },
          { id: 4, email: 'charlie@mail.com', name: 'Charlie', created_at: '2024-01-18' },
          { id: 5, email: 'bob@mail.com', name: 'Bob Wang', created_at: '2024-01-20' },
        ],
        dataCaption: 'contacts 資料表（可看到 alice 和 bob 各有兩筆）',
      },
      question: '刪除 contacts 資料表中 email 重複的資料，只保留每個 email 中 id 最小的那筆。',
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
      hints: [
        '用 GROUP BY email 搭配 MIN(id) 可以找出每個 email 最早的那筆',
        'DELETE ... WHERE id NOT IN (子查詢) 可以刪除不在保留名單中的資料',
      ],
      explanation: '這是經典的刪除重複資料問題（LeetCode #196 變體）。核心思路：先用子查詢 SELECT MIN(id) FROM contacts GROUP BY email 找出每個 email 要保留的 id，再用 DELETE ... WHERE id NOT IN (...) 刪除其他的。面試中這題考的是 DELETE 搭配子查詢的能力，以及對 GROUP BY 聚合的理解。',
      frameworkTip: '刪除重複資料的標準步驟：(1) 先用 SELECT 確認哪些是重複的 (2) 用子查詢找出要保留的 id (3) DELETE 不在保留名單中的資料。記得先跑 SELECT 確認再改成 DELETE。',
    },
  ],

  '26-2': [
    {
      id: 3,
      name: '部門最高薪員工',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Microsoft 面試題',
      scenario: {
        title: '找出各部門薪資最高的員工',
        narrative: 'HR 部門要做年度薪資報告，需要列出每個部門中薪資最高的員工。你需要先理解資料表結構，再寫出查詢。\n\n資料表結構：\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)',
        data: [
          { id: 1, name: 'Alice', salary: 85000, department: 'Engineering' },
          { id: 2, name: 'Bob', salary: 92000, department: 'Engineering' },
          { id: 3, name: 'Charlie', salary: 78000, department: 'Marketing' },
          { id: 4, name: 'Diana', salary: 81000, department: 'Marketing' },
          { id: 5, name: 'Eve', salary: 95000, department: 'Engineering' },
        ],
        dataCaption: 'workers + departments（合併展示）',
      },
      question: '寫一段 SQL 查詢，找出每個部門中薪資最高的員工姓名、部門名稱和薪資。如果某部門有多人同為最高薪，全部列出。',
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
      hints: [
        '用相關子查詢（correlated subquery）：內層查詢引用外層的 department_id',
        'SELECT MAX(salary) FROM workers WHERE department_id = 外層的 department_id',
      ],
      explanation: '這題的關鍵是「相關子查詢」（correlated subquery）：內層的 WHERE w2.department_id = w.department_id 會針對外層每一列動態計算該部門的最高薪資。相比 GROUP BY 方案，這種寫法可以自然地處理「同部門多人同為最高薪」的情境。這是微軟等大公司面試常考的 SQL 模式。',
      frameworkTip: '「找出每組中最大/最小值對應的完整資料」是經典面試模式。兩種解法：(1) 相關子查詢 WHERE val = (SELECT MAX...) (2) 視窗函式 RANK() OVER (PARTITION BY ...)。面試時兩種都能講更好。',
    },
  ],

  '26-3': [
    {
      id: 4,
      name: '訂單生命週期 SQL 追蹤',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon 面試題',
      scenario: {
        title: '電商訂單的完整生命週期',
        narrative: '你在 Amazon 面試，面試官給了一個訂單處理系統的場景。一筆訂單從「用戶下單」到「退貨完成」會經歷完整的生命週期。系統涉及以下資料表：\n\n- orders (id, user_id, total_amount, status, created_at, updated_at)\n- order_items (id, order_id, product_id, quantity, unit_price)\n- inventory (product_id, stock_quantity)\n- payments (id, order_id, amount, payment_method, status, paid_at)\n- refunds (id, order_id, amount, reason, status, created_at)\n\n面試官問你：一筆訂單從下單到退貨完成，依序會觸發哪些 SQL 操作？',
        data: [
          { 階段: '1. 下單', 狀態: 'pending' },
          { 階段: '2. 付款成功', 狀態: 'paid' },
          { 階段: '3. 出貨', 狀態: 'shipped' },
          { 階段: '4. 送達', 狀態: 'delivered' },
          { 階段: '5. 申請退貨', 狀態: 'return_requested' },
          { 階段: '6. 退款完成', 狀態: 'refunded' },
        ],
        dataCaption: '訂單生命週期階段',
      },
      question: '以下哪個選項正確描述了從「用戶下單」到「退款完成」的完整 SQL 操作順序？',
      options: [
        {
          id: 'A',
          text: '下單：INSERT orders → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：DELETE orders + DELETE order_items',
          explanation: '退貨絕對不是 DELETE！刪除訂單會失去所有歷史紀錄，無法做財務對帳和審計。退貨應該是 UPDATE 狀態 + INSERT 退款紀錄。',
        },
        {
          id: 'B',
          text: '下單：INSERT orders + INSERT order_items + UPDATE inventory（扣庫存）→ 付款：INSERT payments + UPDATE orders status → 出貨：UPDATE orders status → 送達：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds + UPDATE inventory（加回庫存）+ UPDATE payments status',
          explanation: '正確！完整的訂單生命週期涉及多張表的協同操作。下單時要同時新增訂單主表、明細和扣庫存。付款時新增付款紀錄並更新訂單狀態。退貨時要更新訂單狀態、新增退款紀錄、歸還庫存、更新付款狀態。每個階段都是用 INSERT 或 UPDATE，永遠不會 DELETE。',
        },
        {
          id: 'C',
          text: '下單：INSERT orders → 付款：INSERT payments → 出貨：INSERT shipments → 退貨：INSERT refunds',
          explanation: '只有 INSERT 是不夠的。每個階段除了新增紀錄，還需要 UPDATE 現有表的狀態（如 orders.status）。而且下單時也要扣庫存（UPDATE inventory）。',
        },
        {
          id: 'D',
          text: '下單：INSERT orders + INSERT order_items → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds',
          explanation: '遺漏了幾個關鍵操作：下單時沒有扣庫存（UPDATE inventory）、付款時沒有新增付款紀錄（INSERT payments）、退貨時沒有歸還庫存。實務中每個環節都需要完整的資料操作。',
        },
      ],
      correctAnswer: 'B',
      hints: [
        '想想每個階段「新增了什麼紀錄」和「更新了哪些現有資料」',
        '庫存在下單時扣除，退貨時要記得加回去',
        '實務中永遠不會 DELETE 訂單，只會用 UPDATE status 標記狀態',
      ],
      explanation: '訂單生命週期是電商系統最核心的資料流。關鍵要點：(1) 每個狀態轉換都是 UPDATE orders.status (2) 重要事件要 INSERT 到對應的紀錄表（payments、refunds）(3) 庫存是雙向的——下單扣除、退貨歸還 (4) 所有操作應該在 transaction 中執行，確保一致性。面試中能講出完整的多表操作和 transaction 概念會大大加分。',
      frameworkTip: '描述資料流時，用「哪張表、什麼操作、為什麼」的格式：INSERT orders（建立訂單紀錄）→ UPDATE inventory（扣庫存）→ 以此類推。展示你對每個操作背後商業邏輯的理解。',
    },
  ],

  '26-4': [
    {
      id: 3,
      name: 'SQL vs Python 任務分配',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LinkedIn 面試題',
      scenario: {
        title: '資料團隊的每日工作分配',
        narrative: '你剛加入 LinkedIn 的 Data Analytics 團隊。主管列了一份當天要完成的任務清單，要你判斷每個任務最適合用什麼工具完成。團隊有 SQL（連接公司的資料倉儲）和 Python（Jupyter Notebook 環境，有 pandas、matplotlib、scikit-learn）。\n\n任務清單：\nA. 從 10 億筆事件資料中算出每日活躍用戶數（DAU）\nB. 把 DAU 數據做成折線圖寄給老闆\nC. 合併兩個 CSV 檔案，清洗缺失值後上傳到資料庫\nD. 建立一個模型預測哪些用戶可能下個月流失\nE. 找出過去 7 天連續登入的用戶清單',
        data: [
          { 任務: 'A. 計算 DAU', 資料量: '10 億筆', 適合工具: '?' },
          { 任務: 'B. DAU 折線圖', 資料量: '365 筆', 適合工具: '?' },
          { 任務: 'C. CSV 清洗上傳', 資料量: '5 萬筆', 適合工具: '?' },
          { 任務: 'D. 流失預測模型', 資料量: '特徵表 10 萬筆', 適合工具: '?' },
          { 任務: 'E. 連續登入用戶', 資料量: '10 億筆', 適合工具: '?' },
        ],
        dataCaption: '任務清單與工具選擇',
      },
      question: '以下哪個工具分配方案最合理？',
      options: [
        {
          id: 'A',
          text: 'A=SQL, B=Python, C=Python, D=Python, E=SQL',
          explanation: '正確！A 和 E 是大數據量的聚合與篩選，SQL 在資料庫端執行效率最高。B 需要視覺化，用 Python matplotlib 最方便。C 涉及 CSV 解析和缺失值清洗，pandas 的專長。D 是 ML 任務，必須用 Python。關鍵原則：資料量大的聚合交給 SQL，後處理和分析交給 Python。',
        },
        {
          id: 'B',
          text: 'A=Python, B=Python, C=Python, D=Python, E=Python',
          explanation: '全部用 Python 是新手常見的錯誤。A 和 E 都涉及 10 億筆資料，如果用 pandas 從資料庫把 10 億筆拉到本地處理，記憶體會爆炸（約 80GB），而且速度極慢。大數據量的聚合應該讓資料庫引擎在伺服器端完成。',
        },
        {
          id: 'C',
          text: 'A=SQL, B=SQL, C=SQL, D=SQL, E=SQL',
          explanation: '全部用 SQL 也不合適。SQL 不能做視覺化（B）、不擅長 CSV 清洗（C）、更做不了 ML 模型（D）。工具選擇要看任務性質，不是一刀切。',
        },
        {
          id: 'D',
          text: 'A=SQL, B=Python, C=SQL, D=Python, E=Python',
          explanation: 'C 用 SQL 處理 CSV 不太直觀，pandas 的 read_csv + fillna 更方便。E 用 Python 處理 10 億筆事件資料會遇到記憶體問題，連續登入的邏輯用 SQL 視窗函式更高效。',
        },
      ],
      correctAnswer: 'A',
      hints: [
        '資料量是決定工具的關鍵因素之一——10 億筆資料拉到本地處理合理嗎？',
        '想想每個任務的核心動作：聚合？視覺化？清洗？建模？',
      ],
      explanation: 'SQL vs Python 的選擇不是偏好問題，而是工程判斷。核心原則：(1) 大數據量的篩選和聚合 → SQL（在資料庫端計算，不需搬資料）(2) 視覺化、ML、檔案處理 → Python (3) 小數據量的探索分析 → 兩者皆可。面試中展示「我會根據資料量和任務性質選擇工具」比「我什麼都用 Python」更有說服力。',
      frameworkTip: '工具選擇的判斷框架：先看資料量（大 → SQL 端處理）→ 再看任務性質（聚合 → SQL、ML/視覺化 → Python）→ 最後看便利性（CSV → pandas、JSON → Python）。',
    },
  ],

  '26-5': [
    {
      id: 4,
      name: '慢查詢改寫優化',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'LinkedIn 面試題',
      scenario: {
        title: '優化部門薪資差異報表',
        narrative: '公司有 workers 和 departments 兩張表。HR 寫了一個查詢來計算每個部門的最高薪資，但這個查詢在百萬筆資料下跑了超過 60 秒。\n\n原始慢查詢：\nSELECT d.dept_name,\n       (SELECT MAX(w.salary) FROM workers w WHERE w.department_id = d.id) AS max_salary\nFROM departments d\nORDER BY max_salary DESC;\n\n問題在於：子查詢對每個部門都要掃一次 workers 表，當部門數量多時效能很差。\n\n資料表結構：\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)',
      },
      question: '把上面的慢查詢改寫成效能更好的版本，使用 JOIN + GROUP BY 取代相關子查詢。',
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
      hints: [
        '用 JOIN 把 departments 和 workers 連接起來，取代子查詢',
        'GROUP BY 部門後用 MAX(salary) 就能算出每個部門的最高薪資',
        'JOIN + GROUP BY 只需要掃描 workers 表一次，比相關子查詢高效得多',
      ],
      explanation: '相關子查詢（correlated subquery）對外層每一列都要執行一次內層查詢，當部門有 N 個時就要掃 N 次 workers 表（O(N) 次全表掃描）。改用 JOIN + GROUP BY 後，只需要掃描 workers 表一次就能算出所有部門的聚合結果。在百萬筆資料下，這個差異可以從 60 秒降到 1 秒以內。這是面試中最常考的 SQL 優化模式之一。',
      frameworkTip: 'SQL 優化的第一直覺：看到 SELECT 子句或 WHERE 子句中的相關子查詢 → 考慮能否改寫成 JOIN + GROUP BY。這幾乎永遠更快。',
    },
    {
      id: 5,
      name: '複雜聚合與字串處理',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Airbnb 面試題',
      scenario: {
        title: '房東熱門度與平均房價分析',
        narrative: '你在 Airbnb 的 Data Team，需要分析房東的熱門程度和定價策略。每筆房源紀錄中，host_name 欄位的格式是「名字 姓氏」。你需要依照房東分組，計算每位房東的房源數量和平均每晚價格。\n\n資料表結構：listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER)',
        data: [
          { id: 1, host_name: 'John Smith', neighbourhood: '大安區', room_type: 'Entire home', price: 3200, reviews_count: 45 },
          { id: 2, host_name: 'John Smith', neighbourhood: '信義區', room_type: 'Private room', price: 1800, reviews_count: 32 },
          { id: 3, host_name: 'Mary Chen', neighbourhood: '中山區', room_type: 'Entire home', price: 4500, reviews_count: 78 },
          { id: 4, host_name: 'Mary Chen', neighbourhood: '大安區', room_type: 'Entire home', price: 5200, reviews_count: 91 },
          { id: 5, host_name: 'Mary Chen', neighbourhood: '松山區', room_type: 'Private room', price: 2100, reviews_count: 25 },
        ],
        dataCaption: 'listings 資料表（部分範例）',
      },
      question: '查詢每位房東的房源數量、平均價格（四捨五入到整數）和總評論數，篩選出房源數量 >= 2 的房東，按總評論數由高到低排序。',
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
      hints: [
        'COUNT(*) 計算每位房東的房源數量',
        'ROUND(AVG(price)) 計算平均價格並四捨五入',
        '用 HAVING 在 GROUP BY 之後篩選，而不是 WHERE',
      ],
      explanation: '這題綜合考了 GROUP BY、聚合函式（COUNT、AVG、SUM）、ROUND 函式、HAVING 篩選和 ORDER BY 排序。HAVING 和 WHERE 的差異是面試高頻考點：WHERE 在分組前篩選（篩原始列），HAVING 在分組後篩選（篩聚合結果）。這裡要篩選「房源數量 >= 2」，因為 COUNT(*) 是聚合結果，所以必須用 HAVING。',
      frameworkTip: '聚合查詢的完整結構：SELECT 聚合函式 → FROM → WHERE（分組前篩選）→ GROUP BY → HAVING（分組後篩選）→ ORDER BY。面試時寫出完整結構展示你的 SQL 基本功。',
    },
  ],
}
