import { w23Generated } from './_w23_generated.js'
import { w24Generated } from './_w24_generated.js'
import { w25Generated } from './_w25_generated.js'
import { w26Generated } from './_w26_generated.js'
import { w23Extra } from './_w23_extra.js'
import { w24Extra } from './_w24_extra.js'
import { w25Extra } from './_w25_extra.js'
import { w26Extra } from './_w26_extra.js'

// Merge extra challenges into generated worlds
function mergeExtras(world, extras) {
  for (const quest of world.quests) {
    const extraChallenges = extras[quest.id]
    if (extraChallenges) {
      quest.challenges = [...quest.challenges, ...extraChallenges]
    }
  }
  return world
}

const w23 = mergeExtras({ ...w23Generated, quests: w23Generated.quests.map(q => ({ ...q, challenges: [...q.challenges] })) }, w23Extra)
const w24 = mergeExtras({ ...w24Generated, quests: w24Generated.quests.map(q => ({ ...q, challenges: [...q.challenges] })) }, w24Extra)
const w25 = mergeExtras({ ...w25Generated, quests: w25Generated.quests.map(q => ({ ...q, challenges: [...q.challenges] })) }, w25Extra)
const w26 = mergeExtras({ ...w26Generated, quests: w26Generated.quests.map(q => ({ ...q, challenges: [...q.challenges] })) }, w26Extra)

export const sqlWorlds = [
  {
    id: 4,
    name: 'SQL 與資料素養',
    emoji: '🗄️',
    description: '面試中的 SQL 思維和資料理解力',
    color: 'from-orange-500 to-amber-500',
    quests: [
      { id: '4-1', name: 'SQL 查詢思維', description: '面試中如何說明你會怎麼查資料', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: '基本 SELECT 與篩選',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '電商訂單查詢',
            narrative: '你剛加入一家電商公司的資料團隊。PM 想了解今年一月的訂單狀況，請你從 orders 資料表中查詢。\n\n資料表結構：orders (id, customer_id, amount, order_date, status)',
            data: [
              { id: 1, customer_id: 101, amount: 250, order_date: '2024-01-15', status: 'completed' },
              { id: 2, customer_id: 102, amount: 180, order_date: '2024-01-20', status: 'completed' },
              { id: 3, customer_id: 103, amount: 320, order_date: '2024-02-01', status: 'pending' },
              { id: 4, customer_id: 101, amount: 95, order_date: '2024-01-28', status: 'completed' },
            ],
            dataCaption: 'orders 資料表（部分範例）',
          },
          question: '寫一段 SQL 查詢，找出 2024 年 1 月的所有訂單，按金額由大到小排序。',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT *\nFROM orders\nWHERE -- 篩選一月的訂單\nORDER BY -- 按金額排序;",
          expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-01%' ORDER BY amount DESC;",
          hints: ['WHERE 可以用 LIKE 配合 % 來比對日期前綴', 'ORDER BY column DESC 代表由大到小'],
          explanation: "使用 WHERE order_date LIKE '2024-01%' 篩選一月的資料，ORDER BY amount DESC 依金額由大到小排列。這是最基本的查詢結構：FROM → WHERE → SELECT → ORDER BY。",
          frameworkTip: 'SQL 思考順序：先想「從哪張表」→「篩選什麼」→「要哪些欄位」→「怎麼排序」',
        },
        {
          id: 2,
          name: 'GROUP BY 與聚合',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '客戶消費統計',
            narrative: '主管想了解每位客戶的消費狀況，包含訂單數量和總消費金額。你需要對 orders 資料進行分組統計。',
            data: [
              { id: 1, customer_id: 101, amount: 250, order_date: '2024-01-15', status: 'completed' },
              { id: 2, customer_id: 102, amount: 180, order_date: '2024-01-20', status: 'completed' },
              { id: 4, customer_id: 101, amount: 95, order_date: '2024-01-28', status: 'completed' },
            ],
            dataCaption: 'orders 資料表（部分範例）',
          },
          question: '寫一段 SQL，計算每位客戶的訂單數和總消費金額，按總金額由大到小排序。',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_amount\nFROM orders\nGROUP BY -- 按什麼分組？\nORDER BY -- 排序;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id ORDER BY total_amount DESC;",
          hints: ['GROUP BY customer_id 可以按客戶分組', 'SUM() 和 COUNT() 是最常用的聚合函數'],
          explanation: "GROUP BY customer_id 把同一個客戶的訂單合併計算。COUNT(*) 算筆數，SUM(amount) 算總金額。面試中這是非常基礎但重要的題型 — 你需要展示你能從原始資料中提取 business insight。",
          frameworkTip: '面試答 SQL 題時，先口述你的思路（分組 → 聚合 → 排序），再寫 code',
        },
        {
          id: 3,
          name: 'HAVING 與條件篩選',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '高價值客戶篩選',
            narrative: '行銷團隊想找出「高價值客戶」（消費超過 200 元的客戶），針對他們做促銷活動。你需要先聚合再篩選。',
          },
          question: '寫一段 SQL，找出總消費金額超過 200 的客戶，顯示客戶 ID、訂單數、總金額。',
          sampleSchema: `
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
            INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
            INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
            INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
            INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
          `,
          starterCode: "SELECT customer_id,\n       COUNT(*) AS order_count,\n       SUM(amount) AS total_amount\nFROM orders\nGROUP BY customer_id\n-- 怎麼篩選聚合後的結果？\nORDER BY total_amount DESC;",
          expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id HAVING total_amount > 200 ORDER BY total_amount DESC;",
          hints: ['聚合後的篩選不能用 WHERE，要用 HAVING', 'HAVING 放在 GROUP BY 之後、ORDER BY 之前'],
          explanation: "WHERE 在聚合前篩選原始資料，HAVING 在聚合後篩選結果。這是面試常考的概念 — 面試官想看你是否理解 SQL 的執行順序：FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY。",
          frameworkTip: 'WHERE vs HAVING：WHERE 篩原始行，HAVING 篩聚合結果。面試時務必講清楚差異。',
        },
      ] },
      { id: '4-2', name: 'Event Data vs Transactional Data', description: '理解不同資料類型的特性', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: '識別資料類型',
          type: 'multiple-choice',
          difficulty: 'easy',
          scenario: {
            title: '電商平台的資料表',
            narrative: '你加入了一家電商公司的 Data Team。主管給你看了幾張資料表，要你分清楚哪些是 Event Data、哪些是 Transactional Data，因為查詢方式不同。',
            data: [
              { table_name: 'page_views', sample_columns: 'user_id, page_url, timestamp, device', 特性: '每次瀏覽一筆，量很大' },
              { table_name: 'orders', sample_columns: 'order_id, user_id, amount, status, created_at', 特性: '有生命週期，會更新狀態' },
              { table_name: 'button_clicks', sample_columns: 'user_id, button_id, page, timestamp', 特性: '每次點擊一筆，不可修改' },
              { table_name: 'subscriptions', sample_columns: 'sub_id, user_id, plan, start_date, end_date', 特性: '代表一個持續的狀態' },
            ],
            dataCaption: '公司的部分資料表',
          },
          question: '以下哪個說法是正確的？',
          options: [
            { id: 'A', text: 'page_views 和 orders 都是 Event Data', explanation: 'orders 有生命週期（created → paid → shipped），會被更新，是 Transactional Data。' },
            { id: 'B', text: 'page_views 和 button_clicks 是 Event Data；orders 和 subscriptions 是 Transactional Data', explanation: '正確！Event Data 記錄每一個行為事件，不可修改、量大。Transactional Data 代表業務實體的狀態，有生命週期、會被更新。' },
            { id: 'C', text: '所有跟使用者行為有關的都是 Event Data', explanation: '「使用者下訂單」是行為，但 orders 表記錄的是訂單這個業務實體的狀態，不是單純的行為事件。' },
            { id: 'D', text: '只有 button_clicks 是 Event Data，其他都是 Transactional', explanation: 'page_views 也是 Event Data — 每次瀏覽產生一筆，不會被修改。' },
          ],
          correctAnswer: 'B',
          hints: ['Event Data 的特徵：每次發生就記錄一筆、不會被修改', 'Transactional Data 的特徵：代表一個實體、有狀態變化'],
          explanation: 'Event Data 記錄「發生了什麼」（page_view、click），每一筆都是一個時間點上的事件。Transactional Data 記錄「業務實體的狀態」（orders、subscriptions），會隨時間更新。搞清楚這個區別，你才知道用哪張表回答哪種問題。',
          frameworkTip: '面試時聽到「使用者做了什麼」→ Event Data；「業務狀況怎樣」→ Transactional Data',
        },
        {
          id: 2,
          name: '選對資料表',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '回答不同的業務問題',
            narrative: 'PM 和 Finance 各丟了一個問題給你：\n\n• PM 問：「使用者在結帳流程哪一步流失最多？」\n• Finance 問：「上個月的退款金額是多少？」\n\n你需要判斷各自該查哪種資料。',
          },
          question: '關於這兩個問題，以下哪個分析策略最正確？',
          options: [
            { id: 'A', text: '兩個都查 orders 表就好', explanation: 'PM 的問題需要看使用者的行為步驟（哪一步流失），orders 表只記錄最終結果，看不到中間步驟。' },
            { id: 'B', text: 'PM 的問題查 Event Data（看 funnel 每一步），Finance 的問題查 Transactional Data（看 refunds）', explanation: '正確！使用者流失分析需要看行為事件的每一步（page_view → add_to_cart → checkout → payment）。退款金額需要看交易表的 refund 記錄。' },
            { id: 'C', text: '兩個都查 Event Data，因為都跟使用者行為有關', explanation: 'Finance 要的是精確的退款金額，Event Data 可能有重複觸發或定義不一致的問題，不適合算金額。' },
            { id: 'D', text: 'PM 的問題查 Transactional Data（看訂單狀態），Finance 的問題查 Event Data（看退款事件）', explanation: '反了。訂單狀態看不到「使用者在哪一步離開」，退款事件可能重複觸發，不適合算金額。' },
          ],
          correctAnswer: 'B',
          hints: ['想想看：PM 要看的是「過程」還是「結果」？', 'Finance 要的是精確金額，哪種資料更可靠？'],
          explanation: '「過程」問題用 Event Data（行為追蹤），「結果」問題用 Transactional Data（業務記錄）。面試中展示你知道用對資料來回答對的問題，比你會寫 SQL 更重要。',
          frameworkTip: '面試黃金句：「這個問題需要看使用者行為的每一步，所以我會用 event data 來建 funnel。」',
        },
      ] },
      { id: '4-3', name: 'JOIN 與 Aggregation', description: '合併和聚合資料的思路', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: '基本 JOIN',
          type: 'code',
          difficulty: 'easy',
          scenario: {
            title: '訂單與客戶資料合併',
            narrative: 'PM 想要一份報表，同時看到訂單資訊和客戶名稱。你需要把 orders 和 customers 兩張表 JOIN 起來。\n\n資料表：\n• orders (id, customer_id, amount, order_date)\n• customers (id, name, email, city)',
          },
          question: '寫一段 SQL，查詢所有訂單的客戶名稱、訂單金額和訂單日期。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
            INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
          `,
          starterCode: "SELECT c.name, o.amount, o.order_date\nFROM orders o\n-- JOIN 語法\nORDER BY o.order_date;",
          expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;",
          hints: ['JOIN customers c ON o.customer_id = c.id', '用 alias（o, c）讓程式碼更簡潔'],
          explanation: "INNER JOIN 把兩張表透過共同欄位連接。面試重點不只是語法，而是你能不能說清楚「為什麼要 JOIN」以及「JOIN 的 key 是什麼」。",
          frameworkTip: '回答 JOIN 題時：(1) 說明為什麼需要合併 (2) 指出 JOIN key (3) 考慮 NULL 和重複的影響',
        },
        {
          id: 2,
          name: 'LEFT JOIN 與缺失資料',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '找出沒下單的客戶',
            narrative: '行銷團隊想知道有哪些註冊客戶從來沒下過單，好做再行銷。你需要用 LEFT JOIN 找出這些「沉睡客戶」。',
          },
          question: '寫一段 SQL，找出所有沒有任何訂單的客戶名稱。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            INSERT INTO customers VALUES (104, 'Diana', 'diana@mail.com', 'Taichung');
            INSERT INTO customers VALUES (105, 'Eve', 'eve@mail.com', 'Hsinchu');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
          `,
          starterCode: "SELECT c.name\nFROM customers c\n-- 用什麼 JOIN？\nWHERE -- 怎麼找到「沒有訂單」的客戶？;",
          expectedQuery: "SELECT c.name FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;",
          hints: ['LEFT JOIN 保留左表所有行，即使右表沒有匹配', 'WHERE o.id IS NULL 可以找到沒有匹配的行'],
          explanation: "LEFT JOIN + IS NULL 是找「不存在於另一張表」的經典模式。面試中這代表你理解不同 JOIN 類型的語意差異，也是 churn 分析、缺失資料檢測的基礎。",
          frameworkTip: 'INNER JOIN 找交集，LEFT JOIN 保留全部左表 — 面試時用集合圖解釋最清楚',
        },
        {
          id: 3,
          name: 'JOIN + GROUP BY 綜合',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '各城市消費統計',
            narrative: '主管想知道各城市的客戶消費狀況。你需要 JOIN 客戶和訂單資料，再按城市分組統計。',
          },
          question: '寫一段 SQL，統計每個城市的客戶數、總訂單數、總消費金額，按總金額由大到小排序。',
          sampleSchema: `
            CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
            INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
            INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
            INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
            CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
            INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
            INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
            INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
            INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
          `,
          starterCode: "SELECT c.city,\n       COUNT(DISTINCT c.id) AS customer_count,\n       COUNT(o.id) AS order_count,\n       SUM(o.amount) AS total_amount\nFROM customers c\n-- JOIN\nGROUP BY -- ?\nORDER BY total_amount DESC;",
          expectedQuery: "SELECT c.city, COUNT(DISTINCT c.id) AS customer_count, COUNT(o.id) AS order_count, SUM(o.amount) AS total_amount FROM customers c JOIN orders o ON c.id = o.customer_id GROUP BY c.city ORDER BY total_amount DESC;",
          hints: ['JOIN orders o ON c.id = o.customer_id', 'COUNT(DISTINCT c.id) 避免因為 JOIN 產生的重複計算'],
          explanation: "JOIN + GROUP BY 是面試中最常見的組合。關鍵是 COUNT(DISTINCT) — 當 JOIN 產生一對多時，直接 COUNT 會重複計算。這展示你理解 JOIN 對行數的影響。",
          frameworkTip: '面試時永遠要提到：JOIN 可能產生重複行，聚合時注意是否需要 DISTINCT',
        },
      ] },
      { id: '4-4', name: 'Window Functions', description: '進階分析：排名、移動平均、前後比較', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: '理解 Window Functions',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '用戶購買排名',
            narrative: '你需要分析每個用戶的購買紀錄，找出每個人的「第幾次購買」。PM 想知道用戶通常第幾次購買時金額最高。\n\n你打算用 ROW_NUMBER() 來做。',
            data: [
              { user_id: 'A01', amount: 120, order_date: '2024-01-10', '第幾次購買': '?' },
              { user_id: 'A01', amount: 350, order_date: '2024-02-15', '第幾次購買': '?' },
              { user_id: 'A01', amount: 85, order_date: '2024-03-20', '第幾次購買': '?' },
              { user_id: 'B02', amount: 200, order_date: '2024-01-25', '第幾次購買': '?' },
              { user_id: 'B02', amount: 180, order_date: '2024-03-01', '第幾次購買': '?' },
            ],
            dataCaption: '訂單資料（需要計算每個用戶的第幾次購買）',
          },
          question: '以下哪段 SQL 邏輯可以正確計算「每個用戶的第幾次購買」？',
          options: [
            { id: 'A', text: 'GROUP BY user_id，然後用 COUNT(*) 算每個用戶的購買次數', explanation: 'GROUP BY 會把每個用戶合併成一行，你就看不到每一筆訂單了。Window Function 可以在不合併行的情況下做計算。' },
            { id: 'B', text: 'ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date)', explanation: '正確！PARTITION BY user_id 表示「對每個用戶分別計算」，ORDER BY order_date 表示「按購買時間排序編號」。結果就是每個用戶的第 1、2、3... 次購買。' },
            { id: 'C', text: 'ROW_NUMBER() OVER (ORDER BY order_date)', explanation: '少了 PARTITION BY，這樣會對所有用戶混在一起編號，不是「每個用戶的第幾次」。' },
            { id: 'D', text: 'RANK() OVER (ORDER BY amount DESC)', explanation: 'RANK 是排名不是編號，而且按金額排序不是按時間，也沒有按用戶分組。' },
          ],
          correctAnswer: 'B',
          hints: ['Window Function 的重點是 PARTITION BY — 想成「在每個分組內獨立計算」', 'ROW_NUMBER 給每一行一個序號，不會合併行（跟 GROUP BY 的差別）'],
          explanation: 'Window Functions 的核心概念：在不合併行的前提下，對一組相關的行做計算。PARTITION BY 定義「分組」，ORDER BY 定義「順序」。ROW_NUMBER 按順序編號，RANK 按排名（可並列），LAG/LEAD 拿前/後一行的值。',
          frameworkTip: '面試時描述 Window Function：「我會用 ROW_NUMBER，PARTITION BY 用戶分組，ORDER BY 時間排序，找出每個用戶的第 N 次行為。」',
        },
        {
          id: 2,
          name: 'LAG 與前後比較',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '月營收成長率',
            narrative: '主管要你計算每個月的營收跟上個月比的成長率。你需要用 LAG 函數來取得「上個月的營收」。',
            data: [
              { month: '2024-01', revenue: 500000 },
              { month: '2024-02', revenue: 520000 },
              { month: '2024-03', revenue: 480000 },
              { month: '2024-04', revenue: 550000 },
            ],
            dataCaption: '月營收數據',
          },
          question: '以下哪個 SQL 邏輯可以計算 MoM（Month-over-Month）成長率？',
          options: [
            { id: 'A', text: '用 self-join 把 revenue 表跟自己 JOIN，配對每個月和上個月', explanation: '可以做到但很複雜，Window Function 更優雅。面試中展示你會用更簡潔的方式解決問題。' },
            { id: 'B', text: '(revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month)', explanation: '正確！LAG(revenue) OVER (ORDER BY month) 取得上一個月的營收，然後計算 (本月 - 上月) / 上月 = 成長率。' },
            { id: 'C', text: 'SUM(revenue) OVER (ORDER BY month) 計算累計營收，然後相減', explanation: '這計算的是累計營收，不是月對月的成長率。' },
            { id: 'D', text: 'AVG(revenue) OVER (ORDER BY month ROWS 1 PRECEDING) 算移動平均', explanation: '移動平均可以看趨勢，但不是成長率。成長率需要用 LAG 取前一行做除法。' },
          ],
          correctAnswer: 'B',
          hints: ['LAG(column) 取得「前一行」的值，LEAD(column) 取得「後一行」的值', '成長率 = (本期 - 上期) / 上期'],
          explanation: 'LAG 和 LEAD 是面試中非常實用的 Window Functions。LAG 取前一行、LEAD 取後一行。計算成長率、環比、同比都會用到。面試官常問 MoM、WoW、YoY 的計算方式。',
          frameworkTip: '面試遇到「跟上一期比較」的問題 → 用 LAG。「跟下一期比較」→ 用 LEAD。',
        },
      ] },
      { id: '4-5', name: 'Source of Truth', description: '為什麼不同報表數字不一樣？', xp: 50, isBoss: false, challenges: [
        {
          id: 1,
          name: '數字不一致的根因',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '三個部門，三個數字',
            narrative: '你是公司的 Business Analyst。在季度 review 會議上：\n\n• Marketing 報告：「Q1 新增 12,000 個用戶」\n• Product 報告：「Q1 新增 9,500 個用戶」\n• Finance 報告：「Q1 新增 8,200 個付費用戶」\n\nCEO 很困惑：「到底哪個數字是對的？」',
          },
          question: '最有可能的原因是什麼？',
          options: [
            { id: 'A', text: '有人的數據是錯的，需要找到 bug', explanation: '不一定有 bug。三個團隊可能用不同的「用戶」定義和不同的資料來源，每個都是「對的」。' },
            { id: 'B', text: '三個團隊對「新用戶」的定義不同', explanation: '正確！Marketing 可能算「完成註冊」，Product 算「完成 onboarding」，Finance 算「完成首次付款」。每個定義都合理，但數字不同。這就是 Source of Truth 問題。' },
            { id: 'C', text: '時區不同導致 Q1 的起止日期不一樣', explanation: '時區確實會造成差異，但差異不會這麼大（12K vs 8.2K）。更可能是定義不同。' },
            { id: 'D', text: '應該用三個數字的平均值', explanation: '平均值沒有意義。每個數字衡量的是不同的東西，應該先統一定義。' },
          ],
          correctAnswer: 'B',
          hints: ['同樣叫「新用戶」，不同團隊的定義可能完全不同', 'Marketing 關心註冊、Product 關心活躍、Finance 關心付費'],
          explanation: 'Source of Truth 問題在真實工作中極其常見。解法不是找「正確答案」，而是：(1) 釐清每個團隊的定義 (2) 確認各自的資料來源 (3) 對齊一個大家同意的定義 (4) 建立共同的 dashboard。',
          frameworkTip: '面試黃金句：「在分析之前，我會先跟 stakeholder 確認指標的定義和資料來源，確保我們看的是同一份數據。」',
        },
        {
          id: 2,
          name: '資料品質問題',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '日報數字不對',
            narrative: '你的日報顯示昨天的 DAU 是 85,000，但 PM 說他在另一個 dashboard 看到是 92,000。你開始調查差異。\n\n你發現：\n• 你的報表用 UTC 時間，dashboard 用台灣時間（UTC+8）\n• 你的報表排除了 bot 流量，dashboard 沒排除\n• 你的報表只算「至少瀏覽 1 頁」，dashboard 算「打開 app」',
          },
          question: '最好的解決方式是什麼？',
          options: [
            { id: 'A', text: '用你的報表，因為排除了 bot 比較準確', explanation: '你的報表可能比較「乾淨」，但問題不在誰對誰錯，而是要建立統一標準。' },
            { id: 'B', text: '統一使用 dashboard 的數字，因為 PM 在看', explanation: '不是因為誰在看就用誰的。需要先定義清楚再決定。' },
            { id: 'C', text: '記錄差異的原因（時區、bot、定義），提出統一定義標準，讓團隊對齊', explanation: '正確！先調查清楚差異來源，然後提議一個團隊共識的定義和計算方式。「DAU = UTC+8 時區內，排除 bot，至少完成 1 個 pageview 的 unique users」。' },
            { id: 'D', text: '兩個數字都保留，在報表裡註明定義差異', explanation: '短期可以，但長期會造成更多混亂。應該推動統一。' },
          ],
          correctAnswer: 'C',
          hints: ['解決 Source of Truth 問題的第一步不是選一個數字，而是搞清楚為什麼不一樣'],
          explanation: '常見的資料品質問題：時區不一致、bot 過濾邏輯不同、指標定義不同、資料延遲。面試中展示你有這個 awareness，並且知道怎麼系統性解決（定義 → 來源 → 計算邏輯 → 對齊），會大大加分。',
          frameworkTip: '資料不一致時的排查順序：定義 → 來源 → 時區 → 過濾邏輯 → 去重方式',
        },
      ] },
      { id: '4-6', name: 'Boss: 資料分析設計', description: '設計一個完整的資料分析計畫', xp: 200, isBoss: true, challenges: [
        {
          id: 1,
          name: 'Boss: 設計分析計畫',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: '訂閱制 SaaS 的 Churn 調查',
            narrative: '你是一家 B2B SaaS 公司的 Data Analyst。VP of Customer Success 找你說：\n\n「我們的月 churn rate 從 3% 上升到 5%。CEO 要在下週的 board meeting 上報告原因和對策。我需要你做一份完整的分析。」\n\n你有以下資料表可用：\n• subscriptions（sub_id, company_id, plan, start_date, end_date, mrr）\n• usage_events（company_id, feature, timestamp, user_count）\n• support_tickets（ticket_id, company_id, category, created_at, resolved_at, satisfaction_score）\n• companies（company_id, name, industry, size, signup_date）',
          },
          prompt: '請設計一份完整的分析計畫來調查 churn rate 上升的原因。包含：\n1. 你會定義什麼指標？怎麼確認 churn 的定義？\n2. 你會查哪些表？怎麼 JOIN？\n3. 你會做哪些分析？（趨勢、分群、cohort 等）\n4. 你預期可能發現什麼？\n5. 有什麼資料品質要注意的？',
          evaluationCriteria: [
            '明確定義 churn（什麼算 churn？end_date 在本月？還是沒有續約？）',
            '有系統的分析計畫（不是直接猜原因）',
            '使用多種分析方法（趨勢、分群、cohort）',
            '指出需要 JOIN 哪些表來獲得完整圖景',
            '考慮資料品質和限制（定義一致性、資料延遲等）',
          ],
          sampleAnswer: '1. 定義：Churn = 訂閱到期未續約（end_date 在本月且沒有新的 subscription）。確認跟 Finance 和 CS 的定義一致。\n\n2. 資料：subscriptions LEFT JOIN companies ON company_id（看公司特徵），LEFT JOIN usage_events（看使用行為），LEFT JOIN support_tickets（看客服互動）。\n\n3. 分析：\n- Trend：churn rate 是突然上升還是逐漸？什麼時候開始？\n- Segmentation：按 plan、company size、industry 切開看，哪個 segment churn 最嚴重？\n- Cohort：不同註冊時間的 cohort，churn 曲線有變化嗎？\n- Usage：churn 客戶在離開前的使用行為有什麼變化？（usage 下降？）\n- Support：churn 客戶的 support ticket 數量和滿意度如何？\n\n4. 預期發現：可能是某個 plan 或 size 的客戶 churn 特別高，或是最近的 cohort 品質下降，或是某個功能問題導致使用量下降。\n\n5. 注意：確認 churn 定義一致、排除季節性因素（年約到期月份）、注意 survivorship bias（只看留存客戶的數據會有偏差）。',
          hints: ['先定義清楚什麼是 churn，再開始分析', '想想你有 4 張表，各自能告訴你什麼'],
          explanation: '這是完整的資料分析設計題。面試官看的是你能不能系統性地規劃分析，而不是直接猜原因。好的回答要有：清楚的定義 → 資料盤點 → 分析方法 → 預期結果 → 注意事項。',
          frameworkTip: '分析設計六步：釐清問題 → 定義指標 → 盤點資料 → 設計分析 → 預期產出 → 注意事項',
        },
      ] },
    ],
  },
  // ── SQL 基礎查詢（Phase 1）──
  w23,
  // ── SQL 分析核心（Phase 2）──
  w24,
  // ── SQL 進階分析（Phase 3）──
  w25,
  // ── SQL 工程應用（Phase 4）──
  w26,
]
