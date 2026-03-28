import Foundation

enum SqlWorlds {
    static let worlds: [World] = [
        World(
            id: 4,
            name: "SQL 與資料素養",
            emoji: "🗄️",
            description: "面試中的 SQL 思維和資料理解力",
            quests: [
                Quest(
                    id: "4-1",
                    name: "SQL 查詢思維",
                    description: "面試中如何說明你會怎麼查資料",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 SELECT 與篩選",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL 查詢，找出 2024 年 1 月的所有訂單，按金額由大到小排序。",
                            scenario: Challenge.Scenario(
                                title: "電商訂單查詢",
                                narrative: "你剛加入一家電商公司的資料團隊。PM 想了解今年一月的訂單狀況，請你從 orders 資料表中查詢。\n\n資料表結構：orders (id, customer_id, amount, order_date, status)",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "250", "order_date": "2024-01-15", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "180", "order_date": "2024-01-20", "status": "completed"],
                                    ["id": "3", "customer_id": "103", "amount": "320", "order_date": "2024-02-01", "status": "pending"],
                                    ["id": "4", "customer_id": "101", "amount": "95", "order_date": "2024-01-28", "status": "completed"],
                                ],
                                dataCaption: "orders 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["WHERE 可以用 LIKE 配合 % 來比對日期前綴", "ORDER BY column DESC 代表由大到小"],
                            explanation: "使用 WHERE order_date LIKE '2024-01%' 篩選一月的資料，ORDER BY amount DESC 依金額由大到小排列。這是最基本的查詢結構：FROM → WHERE → SELECT → ORDER BY。",
                            frameworkTip: "SQL 思考順序：先想「從哪張表」→「篩選什麼」→「要哪些欄位」→「怎麼排序」",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
                                INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
                                INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
                                INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
                                INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
                                INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
                                INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
                            """,
                            starterCode: """
                                SELECT *
                                FROM orders
                                WHERE -- 篩選一月的訂單
                                ORDER BY -- 按金額排序;
                            """,
                            expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-01%' ORDER BY amount DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "GROUP BY 與聚合",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，計算每位客戶的訂單數和總消費金額，按總金額由大到小排序。",
                            scenario: Challenge.Scenario(
                                title: "客戶消費統計",
                                narrative: "主管想了解每位客戶的消費狀況，包含訂單數量和總消費金額。你需要對 orders 資料進行分組統計。",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "250", "order_date": "2024-01-15", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "180", "order_date": "2024-01-20", "status": "completed"],
                                    ["id": "4", "customer_id": "101", "amount": "95", "order_date": "2024-01-28", "status": "completed"],
                                ],
                                dataCaption: "orders 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY customer_id 可以按客戶分組", "SUM() 和 COUNT() 是最常用的聚合函數"],
                            explanation: "GROUP BY customer_id 把同一個客戶的訂單合併計算。COUNT(*) 算筆數，SUM(amount) 算總金額。面試中這是非常基礎但重要的題型 — 你需要展示你能從原始資料中提取 business insight。",
                            frameworkTip: "面試答 SQL 題時，先口述你的思路（分組 → 聚合 → 排序），再寫 code",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
                                INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
                                INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
                                INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
                                INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
                                INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
                                INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
                            """,
                            starterCode: """
                                SELECT customer_id,
                                       COUNT(*) AS order_count,
                                       SUM(amount) AS total_amount
                                FROM orders
                                GROUP BY -- 按什麼分組？
                                ORDER BY -- 排序;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id ORDER BY total_amount DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "HAVING 與條件篩選",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出總消費金額超過 200 的客戶，顯示客戶 ID、訂單數、總金額。",
                            scenario: Challenge.Scenario(
                                title: "高價值客戶篩選",
                                narrative: "行銷團隊想找出「高價值客戶」（消費超過 200 元的客戶），針對他們做促銷活動。你需要先聚合再篩選。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["聚合後的篩選不能用 WHERE，要用 HAVING", "HAVING 放在 GROUP BY 之後、ORDER BY 之前"],
                            explanation: "WHERE 在聚合前篩選原始資料，HAVING 在聚合後篩選結果。這是面試常考的概念 — 面試官想看你是否理解 SQL 的執行順序：FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY。",
                            frameworkTip: "WHERE vs HAVING：WHERE 篩原始行，HAVING 篩聚合結果。面試時務必講清楚差異。",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT);
                                INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15', 'completed');
                                INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20', 'completed');
                                INSERT INTO orders VALUES (3, 103, 320.00, '2024-02-01', 'pending');
                                INSERT INTO orders VALUES (4, 101, 95.00, '2024-01-28', 'completed');
                                INSERT INTO orders VALUES (5, 104, 410.00, '2024-01-05', 'completed');
                                INSERT INTO orders VALUES (6, 105, 75.00, '2024-02-10', 'cancelled');
                            """,
                            starterCode: """
                                SELECT customer_id,
                                       COUNT(*) AS order_count,
                                       SUM(amount) AS total_amount
                                FROM orders
                                GROUP BY customer_id
                                -- 怎麼篩選聚合後的結果？
                                ORDER BY total_amount DESC;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id HAVING total_amount > 200 ORDER BY total_amount DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "4-2",
                    name: "Event Data vs Transactional Data",
                    description: "理解不同資料類型的特性",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別資料類型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個說法是正確的？",
                            scenario: Challenge.Scenario(
                                title: "電商平台的資料表",
                                narrative: "你加入了一家電商公司的 Data Team。主管給你看了幾張資料表，要你分清楚哪些是 Event Data、哪些是 Transactional Data，因為查詢方式不同。",
                                data: [
                                    ["table_name": "page_views", "sample_columns": "user_id, page_url, timestamp, device", "特性": "每次瀏覽一筆，量很大"],
                                    ["table_name": "orders", "sample_columns": "order_id, user_id, amount, status, created_at", "特性": "有生命週期，會更新狀態"],
                                    ["table_name": "button_clicks", "sample_columns": "user_id, button_id, page, timestamp", "特性": "每次點擊一筆，不可修改"],
                                    ["table_name": "subscriptions", "sample_columns": "sub_id, user_id, plan, start_date, end_date", "特性": "代表一個持續的狀態"],
                                ],
                                dataCaption: "公司的部分資料表"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "page_views 和 orders 都是 Event Data", explanation: "orders 有生命週期（created → paid → shipped），會被更新，是 Transactional Data。"),
                                Challenge.Option(id: "B", text: "page_views 和 button_clicks 是 Event Data；orders 和 subscriptions 是 Transactional Data", explanation: "正確！Event Data 記錄每一個行為事件，不可修改、量大。Transactional Data 代表業務實體的狀態，有生命週期、會被更新。"),
                                Challenge.Option(id: "C", text: "所有跟使用者行為有關的都是 Event Data", explanation: "「使用者下訂單」是行為，但 orders 表記錄的是訂單這個業務實體的狀態，不是單純的行為事件。"),
                                Challenge.Option(id: "D", text: "只有 button_clicks 是 Event Data，其他都是 Transactional", explanation: "page_views 也是 Event Data — 每次瀏覽產生一筆，不會被修改。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Event Data 的特徵：每次發生就記錄一筆、不會被修改", "Transactional Data 的特徵：代表一個實體、有狀態變化"],
                            explanation: "Event Data 記錄「發生了什麼」（page_view、click），每一筆都是一個時間點上的事件。Transactional Data 記錄「業務實體的狀態」（orders、subscriptions），會隨時間更新。搞清楚這個區別，你才知道用哪張表回答哪種問題。",
                            frameworkTip: "面試時聽到「使用者做了什麼」→ Event Data；「業務狀況怎樣」→ Transactional Data"
                        ),
                        Challenge(
                            id: 2,
                            name: "選對資料表",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "關於這兩個問題，以下哪個分析策略最正確？",
                            scenario: Challenge.Scenario(
                                title: "回答不同的業務問題",
                                narrative: "PM 和 Finance 各丟了一個問題給你：\n\n• PM 問：「使用者在結帳流程哪一步流失最多？」\n• Finance 問：「上個月的退款金額是多少？」\n\n你需要判斷各自該查哪種資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "兩個都查 orders 表就好", explanation: "PM 的問題需要看使用者的行為步驟（哪一步流失），orders 表只記錄最終結果，看不到中間步驟。"),
                                Challenge.Option(id: "B", text: "PM 的問題查 Event Data（看 funnel 每一步），Finance 的問題查 Transactional Data（看 refunds）", explanation: "正確！使用者流失分析需要看行為事件的每一步（page_view → add_to_cart → checkout → payment）。退款金額需要看交易表的 refund 記錄。"),
                                Challenge.Option(id: "C", text: "兩個都查 Event Data，因為都跟使用者行為有關", explanation: "Finance 要的是精確的退款金額，Event Data 可能有重複觸發或定義不一致的問題，不適合算金額。"),
                                Challenge.Option(id: "D", text: "PM 的問題查 Transactional Data（看訂單狀態），Finance 的問題查 Event Data（看退款事件）", explanation: "反了。訂單狀態看不到「使用者在哪一步離開」，退款事件可能重複觸發，不適合算金額。"),
                            ],
                            correctAnswer: "B",
                            hints: ["想想看：PM 要看的是「過程」還是「結果」？", "Finance 要的是精確金額，哪種資料更可靠？"],
                            explanation: "「過程」問題用 Event Data（行為追蹤），「結果」問題用 Transactional Data（業務記錄）。面試中展示你知道用對資料來回答對的問題，比你會寫 SQL 更重要。",
                            frameworkTip: "面試黃金句：「這個問題需要看使用者行為的每一步，所以我會用 event data 來建 funnel。」"
                        ),
                    ]
                ),
                Quest(
                    id: "4-3",
                    name: "JOIN 與 Aggregation",
                    description: "合併和聚合資料的思路",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 JOIN",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，查詢所有訂單的客戶名稱、訂單金額和訂單日期。",
                            scenario: Challenge.Scenario(
                                title: "訂單與客戶資料合併",
                                narrative: "PM 想要一份報表，同時看到訂單資訊和客戶名稱。你需要把 orders 和 customers 兩張表 JOIN 起來。\n\n資料表：\n• orders (id, customer_id, amount, order_date)\n• customers (id, name, email, city)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["JOIN customers c ON o.customer_id = c.id", "用 alias（o, c）讓程式碼更簡潔"],
                            explanation: "INNER JOIN 把兩張表透過共同欄位連接。面試重點不只是語法，而是你能不能說清楚「為什麼要 JOIN」以及「JOIN 的 key 是什麼」。",
                            frameworkTip: "回答 JOIN 題時：(1) 說明為什麼需要合併 (2) 指出 JOIN key (3) 考慮 NULL 和重複的影響",
                            sampleSchema: """
                                CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
                                INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
                                INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
                                INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
                                INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
                                INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
                                INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
                                INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
                            """,
                            starterCode: """
                                SELECT c.name, o.amount, o.order_date
                                FROM orders o
                                -- JOIN 語法
                                ORDER BY o.order_date;
                            """,
                            expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;"
                        ),
                        Challenge(
                            id: 2,
                            name: "LEFT JOIN 與缺失資料",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出所有沒有任何訂單的客戶名稱。",
                            scenario: Challenge.Scenario(
                                title: "找出沒下單的客戶",
                                narrative: "行銷團隊想知道有哪些註冊客戶從來沒下過單，好做再行銷。你需要用 LEFT JOIN 找出這些「沉睡客戶」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN 保留左表所有行，即使右表沒有匹配", "WHERE o.id IS NULL 可以找到沒有匹配的行"],
                            explanation: "LEFT JOIN + IS NULL 是找「不存在於另一張表」的經典模式。面試中這代表你理解不同 JOIN 類型的語意差異，也是 churn 分析、缺失資料檢測的基礎。",
                            frameworkTip: "INNER JOIN 找交集，LEFT JOIN 保留全部左表 — 面試時用集合圖解釋最清楚",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT c.name
                                FROM customers c
                                -- 用什麼 JOIN？
                                WHERE -- 怎麼找到「沒有訂單」的客戶？;
                            """,
                            expectedQuery: "SELECT c.name FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;"
                        ),
                        Challenge(
                            id: 3,
                            name: "JOIN + GROUP BY 綜合",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，統計每個城市的客戶數、總訂單數、總消費金額，按總金額由大到小排序。",
                            scenario: Challenge.Scenario(
                                title: "各城市消費統計",
                                narrative: "主管想知道各城市的客戶消費狀況。你需要 JOIN 客戶和訂單資料，再按城市分組統計。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["JOIN orders o ON c.id = o.customer_id", "COUNT(DISTINCT c.id) 避免因為 JOIN 產生的重複計算"],
                            explanation: "JOIN + GROUP BY 是面試中最常見的組合。關鍵是 COUNT(DISTINCT) — 當 JOIN 產生一對多時，直接 COUNT 會重複計算。這展示你理解 JOIN 對行數的影響。",
                            frameworkTip: "面試時永遠要提到：JOIN 可能產生重複行，聚合時注意是否需要 DISTINCT",
                            sampleSchema: """
                                CREATE TABLE customers (id INTEGER, name TEXT, email TEXT, city TEXT);
                                INSERT INTO customers VALUES (101, 'Alice', 'alice@mail.com', 'Taipei');
                                INSERT INTO customers VALUES (102, 'Bob', 'bob@mail.com', 'Kaohsiung');
                                INSERT INTO customers VALUES (103, 'Charlie', 'charlie@mail.com', 'Taipei');
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT);
                                INSERT INTO orders VALUES (1, 101, 250.00, '2024-01-15');
                                INSERT INTO orders VALUES (2, 102, 180.00, '2024-01-20');
                                INSERT INTO orders VALUES (3, 101, 95.00, '2024-01-28');
                                INSERT INTO orders VALUES (4, 103, 320.00, '2024-02-01');
                            """,
                            starterCode: """
                                SELECT c.city,
                                       COUNT(DISTINCT c.id) AS customer_count,
                                       COUNT(o.id) AS order_count,
                                       SUM(o.amount) AS total_amount
                                FROM customers c
                                -- JOIN
                                GROUP BY -- ?
                                ORDER BY total_amount DESC;
                            """,
                            expectedQuery: "SELECT c.city, COUNT(DISTINCT c.id) AS customer_count, COUNT(o.id) AS order_count, SUM(o.amount) AS total_amount FROM customers c JOIN orders o ON c.id = o.customer_id GROUP BY c.city ORDER BY total_amount DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "4-4",
                    name: "Window Functions",
                    description: "進階分析：排名、移動平均、前後比較",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "理解 Window Functions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪段 SQL 邏輯可以正確計算「每個用戶的第幾次購買」？",
                            scenario: Challenge.Scenario(
                                title: "用戶購買排名",
                                narrative: "你需要分析每個用戶的購買紀錄，找出每個人的「第幾次購買」。PM 想知道用戶通常第幾次購買時金額最高。\n\n你打算用 ROW_NUMBER() 來做。",
                                data: [
                                    ["user_id": "A01", "amount": "120", "order_date": "2024-01-10", "第幾次購買": "?"],
                                    ["user_id": "A01", "amount": "350", "order_date": "2024-02-15", "第幾次購買": "?"],
                                    ["user_id": "A01", "amount": "85", "order_date": "2024-03-20", "第幾次購買": "?"],
                                    ["user_id": "B02", "amount": "200", "order_date": "2024-01-25", "第幾次購買": "?"],
                                    ["user_id": "B02", "amount": "180", "order_date": "2024-03-01", "第幾次購買": "?"],
                                ],
                                dataCaption: "訂單資料（需要計算每個用戶的第幾次購買）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GROUP BY user_id，然後用 COUNT(*) 算每個用戶的購買次數", explanation: "GROUP BY 會把每個用戶合併成一行，你就看不到每一筆訂單了。Window Function 可以在不合併行的情況下做計算。"),
                                Challenge.Option(id: "B", text: "ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date)", explanation: "正確！PARTITION BY user_id 表示「對每個用戶分別計算」，ORDER BY order_date 表示「按購買時間排序編號」。結果就是每個用戶的第 1、2、3... 次購買。"),
                                Challenge.Option(id: "C", text: "ROW_NUMBER() OVER (ORDER BY order_date)", explanation: "少了 PARTITION BY，這樣會對所有用戶混在一起編號，不是「每個用戶的第幾次」。"),
                                Challenge.Option(id: "D", text: "RANK() OVER (ORDER BY amount DESC)", explanation: "RANK 是排名不是編號，而且按金額排序不是按時間，也沒有按用戶分組。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Window Function 的重點是 PARTITION BY — 想成「在每個分組內獨立計算」", "ROW_NUMBER 給每一行一個序號，不會合併行（跟 GROUP BY 的差別）"],
                            explanation: "Window Functions 的核心概念：在不合併行的前提下，對一組相關的行做計算。PARTITION BY 定義「分組」，ORDER BY 定義「順序」。ROW_NUMBER 按順序編號，RANK 按排名（可並列），LAG/LEAD 拿前/後一行的值。",
                            frameworkTip: "面試時描述 Window Function：「我會用 ROW_NUMBER，PARTITION BY 用戶分組，ORDER BY 時間排序，找出每個用戶的第 N 次行為。」"
                        ),
                        Challenge(
                            id: 2,
                            name: "LAG 與前後比較",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 SQL 邏輯可以計算 MoM（Month-over-Month）成長率？",
                            scenario: Challenge.Scenario(
                                title: "月營收成長率",
                                narrative: "主管要你計算每個月的營收跟上個月比的成長率。你需要用 LAG 函數來取得「上個月的營收」。",
                                data: [
                                    ["month": "2024-01", "revenue": "500000"],
                                    ["month": "2024-02", "revenue": "520000"],
                                    ["month": "2024-03", "revenue": "480000"],
                                    ["month": "2024-04", "revenue": "550000"],
                                ],
                                dataCaption: "月營收數據"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用 self-join 把 revenue 表跟自己 JOIN，配對每個月和上個月", explanation: "可以做到但很複雜，Window Function 更優雅。面試中展示你會用更簡潔的方式解決問題。"),
                                Challenge.Option(id: "B", text: "(revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month)", explanation: "正確！LAG(revenue) OVER (ORDER BY month) 取得上一個月的營收，然後計算 (本月 - 上月) / 上月 = 成長率。"),
                                Challenge.Option(id: "C", text: "SUM(revenue) OVER (ORDER BY month) 計算累計營收，然後相減", explanation: "這計算的是累計營收，不是月對月的成長率。"),
                                Challenge.Option(id: "D", text: "AVG(revenue) OVER (ORDER BY month ROWS 1 PRECEDING) 算移動平均", explanation: "移動平均可以看趨勢，但不是成長率。成長率需要用 LAG 取前一行做除法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["LAG(column) 取得「前一行」的值，LEAD(column) 取得「後一行」的值", "成長率 = (本期 - 上期) / 上期"],
                            explanation: "LAG 和 LEAD 是面試中非常實用的 Window Functions。LAG 取前一行、LEAD 取後一行。計算成長率、環比、同比都會用到。面試官常問 MoM、WoW、YoY 的計算方式。",
                            frameworkTip: "面試遇到「跟上一期比較」的問題 → 用 LAG。「跟下一期比較」→ 用 LEAD。"
                        ),
                    ]
                ),
                Quest(
                    id: "4-5",
                    name: "Source of Truth",
                    description: "為什麼不同報表數字不一樣？",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "數字不一致的根因",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最有可能的原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "三個部門，三個數字",
                                narrative: "你是公司的 Business Analyst。在季度 review 會議上：\n\n• Marketing 報告：「Q1 新增 12,000 個用戶」\n• Product 報告：「Q1 新增 9,500 個用戶」\n• Finance 報告：「Q1 新增 8,200 個付費用戶」\n\nCEO 很困惑：「到底哪個數字是對的？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "有人的數據是錯的，需要找到 bug", explanation: "不一定有 bug。三個團隊可能用不同的「用戶」定義和不同的資料來源，每個都是「對的」。"),
                                Challenge.Option(id: "B", text: "三個團隊對「新用戶」的定義不同", explanation: "正確！Marketing 可能算「完成註冊」，Product 算「完成 onboarding」，Finance 算「完成首次付款」。每個定義都合理，但數字不同。這就是 Source of Truth 問題。"),
                                Challenge.Option(id: "C", text: "時區不同導致 Q1 的起止日期不一樣", explanation: "時區確實會造成差異，但差異不會這麼大（12K vs 8.2K）。更可能是定義不同。"),
                                Challenge.Option(id: "D", text: "應該用三個數字的平均值", explanation: "平均值沒有意義。每個數字衡量的是不同的東西，應該先統一定義。"),
                            ],
                            correctAnswer: "B",
                            hints: ["同樣叫「新用戶」，不同團隊的定義可能完全不同", "Marketing 關心註冊、Product 關心活躍、Finance 關心付費"],
                            explanation: "Source of Truth 問題在真實工作中極其常見。解法不是找「正確答案」，而是：(1) 釐清每個團隊的定義 (2) 確認各自的資料來源 (3) 對齊一個大家同意的定義 (4) 建立共同的 dashboard。",
                            frameworkTip: "面試黃金句：「在分析之前，我會先跟 stakeholder 確認指標的定義和資料來源，確保我們看的是同一份數據。」"
                        ),
                        Challenge(
                            id: 2,
                            name: "資料品質問題",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的解決方式是什麼？",
                            scenario: Challenge.Scenario(
                                title: "日報數字不對",
                                narrative: "你的日報顯示昨天的 DAU 是 85,000，但 PM 說他在另一個 dashboard 看到是 92,000。你開始調查差異。\n\n你發現：\n• 你的報表用 UTC 時間，dashboard 用台灣時間（UTC+8）\n• 你的報表排除了 bot 流量，dashboard 沒排除\n• 你的報表只算「至少瀏覽 1 頁」，dashboard 算「打開 app」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用你的報表，因為排除了 bot 比較準確", explanation: "你的報表可能比較「乾淨」，但問題不在誰對誰錯，而是要建立統一標準。"),
                                Challenge.Option(id: "B", text: "統一使用 dashboard 的數字，因為 PM 在看", explanation: "不是因為誰在看就用誰的。需要先定義清楚再決定。"),
                                Challenge.Option(id: "C", text: "記錄差異的原因（時區、bot、定義），提出統一定義標準，讓團隊對齊", explanation: "正確！先調查清楚差異來源，然後提議一個團隊共識的定義和計算方式。「DAU = UTC+8 時區內，排除 bot，至少完成 1 個 pageview 的 unique users」。"),
                                Challenge.Option(id: "D", text: "兩個數字都保留，在報表裡註明定義差異", explanation: "短期可以，但長期會造成更多混亂。應該推動統一。"),
                            ],
                            correctAnswer: "C",
                            hints: ["解決 Source of Truth 問題的第一步不是選一個數字，而是搞清楚為什麼不一樣"],
                            explanation: "常見的資料品質問題：時區不一致、bot 過濾邏輯不同、指標定義不同、資料延遲。面試中展示你有這個 awareness，並且知道怎麼系統性解決（定義 → 來源 → 計算邏輯 → 對齊），會大大加分。",
                            frameworkTip: "資料不一致時的排查順序：定義 → 來源 → 時區 → 過濾邏輯 → 去重方式"
                        ),
                    ]
                ),
                Quest(
                    id: "4-6",
                    name: "Boss: 資料分析設計",
                    description: "設計一個完整的資料分析計畫",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 設計分析計畫",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "訂閱制 SaaS 的 Churn 調查",
                                narrative: "你是一家 B2B SaaS 公司的 Data Analyst。VP of Customer Success 找你說：\n\n「我們的月 churn rate 從 3% 上升到 5%。CEO 要在下週的 board meeting 上報告原因和對策。我需要你做一份完整的分析。」\n\n你有以下資料表可用：\n• subscriptions（sub_id, company_id, plan, start_date, end_date, mrr）\n• usage_events（company_id, feature, timestamp, user_count）\n• support_tickets（ticket_id, company_id, category, created_at, resolved_at, satisfaction_score）\n• companies（company_id, name, industry, size, signup_date）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先定義清楚什麼是 churn，再開始分析", "想想你有 4 張表，各自能告訴你什麼"],
                            explanation: "這是完整的資料分析設計題。面試官看的是你能不能系統性地規劃分析，而不是直接猜原因。好的回答要有：清楚的定義 → 資料盤點 → 分析方法 → 預期結果 → 注意事項。",
                            frameworkTip: "分析設計六步：釐清問題 → 定義指標 → 盤點資料 → 設計分析 → 預期產出 → 注意事項"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 23,
            name: "SQL 基礎查詢",
            emoji: "📝",
            description: "從 SELECT 到聚合函數，打好 SQL 基礎查詢的根基",
            quests: [
                Quest(
                    id: "23-1",
                    name: "資料庫與資料表基本概念",
                    description: "了解資料庫、資料表、主鍵與外鍵的基本概念",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "資料庫基本概念",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個說法最正確？",
                            scenario: Challenge.Scenario(
                                title: "新進資料分析師的第一天",
                                narrative: "你是一位剛加入電商公司的資料分析師。主管帶你認識公司的資料庫系統，裡面有好幾張資料表：customers（客戶）、orders（訂單）、products（商品）。他問你一些基本概念，看看你的底子。",
                                data: [
                                    ["概念": "Database（資料庫）", "說明": "存放所有資料表的容器"],
                                    ["概念": "Table（資料表）", "說明": "一組有相同結構的資料集合，像 Excel 工作表"],
                                    ["概念": "Row（列/資料列）", "說明": "一筆完整的資料記錄"],
                                    ["概念": "Column（欄/欄位）", "說明": "一個資料屬性，如姓名、金額"],
                                ],
                                dataCaption: "資料庫基本名詞對照"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "資料庫（Database）就是一張資料表（Table）", explanation: "資料庫是多張資料表的集合。一個資料庫可以包含 customers、orders、products 等多張表。"),
                                Challenge.Option(id: "B", text: "一張資料表中，每一列（Row）代表一筆記錄，每一欄（Column）代表一個屬性", explanation: "正確！例如 customers 表中，一列代表一位客戶的完整資料，一欄代表某個屬性（如姓名、Email）。"),
                                Challenge.Option(id: "C", text: "欄位（Column）存的是一筆完整的客戶資料", explanation: "欄位存的是某個屬性（如 name），一筆完整的客戶資料是由一列（Row）中所有欄位組成的。"),
                                Challenge.Option(id: "D", text: "一個資料庫只能有一張資料表", explanation: "一個資料庫可以有很多張資料表。例如電商系統會有 customers、orders、products、payments 等多張表。"),
                            ],
                            correctAnswer: "B",
                            hints: ["想像 Excel：一個工作簿（Database）可以有很多工作表（Table）", "Table 的每一列是一筆記錄，每一欄是一個欄位"],
                            explanation: "資料庫是資料表的集合，資料表是記錄的集合。每張資料表有固定的欄位定義（Schema），每一列代表一筆實際資料。理解這些基本概念是寫 SQL 的第一步。",
                            frameworkTip: "面試時如果被問到資料庫基本概念，用類比法回答：Database 像檔案櫃，Table 像資料夾，Row 像一張表單，Column 像表單上的欄位。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Primary Key 與 Foreign Key",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "關於 Primary Key 和 Foreign Key，以下哪個敘述最正確？",
                            scenario: Challenge.Scenario(
                                title: "理解資料表之間的關聯",
                                narrative: "主管接著介紹公司的資料架構。customers 表有一個 id 欄位作為 Primary Key，orders 表有 customer_id 欄位連結到 customers 表。他要你理解這些 Key 的用途。",
                                data: [
                                    ["表名": "customers", "欄位": "id (PK), name, email, city", "說明": "id 是 Primary Key，唯一識別每位客戶"],
                                    ["表名": "orders", "欄位": "id (PK), customer_id (FK), amount, order_date", "說明": "customer_id 是 Foreign Key，連結到 customers.id"],
                                ],
                                dataCaption: "資料表關聯範例"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Primary Key 可以有重複值，Foreign Key 不可以", explanation: "正好相反。Primary Key 必須唯一且不能為 NULL；Foreign Key 可以重複（例如同一個客戶可以有多筆訂單）。"),
                                Challenge.Option(id: "B", text: "Primary Key 唯一識別每筆資料，Foreign Key 用來建立表與表之間的關聯", explanation: "正確！Primary Key 確保每筆資料有唯一的身分證號碼。Foreign Key 則像是一條線，把不同資料表的資料串在一起。"),
                                Challenge.Option(id: "C", text: "每張資料表必須同時有 Primary Key 和 Foreign Key", explanation: "不一定。每張表通常有 Primary Key，但不一定需要 Foreign Key。Foreign Key 只有在需要關聯其他表時才用。"),
                                Challenge.Option(id: "D", text: "Foreign Key 的值可以是任意數字，不需要對應到其他表", explanation: "Foreign Key 的值必須對應到它所參照的表的 Primary Key。例如 orders.customer_id 的值必須存在於 customers.id 中。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Primary Key 就像身分證字號：每個人都不一樣", "Foreign Key 像是一條連結線，把兩張表關聯起來"],
                            explanation: "Primary Key（主鍵）確保資料表中每筆記錄的唯一性，不允許重複和 NULL。Foreign Key（外鍵）建立表與表之間的關聯，它的值必須對應到另一張表的 Primary Key。這兩個概念是理解關聯式資料庫的核心。",
                            frameworkTip: "面試時如果被問到 PK/FK，記得舉一個具體的例子：「orders 表的 customer_id 是 FK，參照 customers 表的 id（PK），這樣就能透過 JOIN 把訂單和客戶資料合併。」"
                        ),
                        Challenge(
                            id: 3,
                            name: "讀懂 Schema",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，查詢 employees 資料表的所有欄位和所有資料，讓你可以快速瀏覽這張表的內容。",
                            scenario: Challenge.Scenario(
                                title: "探索員工資料表",
                                narrative: "你拿到了公司人力資源部門的員工資料表 Schema。在開始分析之前，你想先看看這張表裡有什麼資料，了解欄位和筆數。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "工程部", "salary": "65000", "hire_date": "2022-03-15"],
                                    ["id": "2", "name": "李小華", "department": "行銷部", "salary": "55000", "hire_date": "2023-01-10"],
                                    ["id": "3", "name": "陳大偉", "department": "工程部", "salary": "72000", "hire_date": "2021-08-01"],
                                ],
                                dataCaption: "employees 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["* 代表「所有欄位」", "SELECT * FROM table_name 是最基本的查詢語法"],
                            explanation: "SELECT * FROM employees 是 SQL 最基本的查詢語句。* 代表選取所有欄位。在實際工作中，拿到新的資料表時，第一步通常會用 SELECT * 瀏覽資料，了解表的結構和內容。不過在正式的查詢中，建議指定需要的欄位而不是用 *，以提高效能。",
                            frameworkTip: "面試時不要急著寫 SQL，先問面試官：「可以先看一下資料表的結構和一些範例資料嗎？」這展示你有良好的分析習慣。",
                            sampleSchema: """
                                CREATE TABLE employees (
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
                                INSERT INTO employees VALUES (5, '張志豪', '行銷部', 52000.00, '2024-02-01');
                            """,
                            starterCode: """
                                -- 查詢 employees 表的所有欄位和資料
                                SELECT -- 怎麼選所有欄位？
                                FROM employees;
                            """,
                            expectedQuery: "SELECT * FROM employees;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-2",
                    name: "SELECT / FROM / WHERE 深入",
                    description: "學會從資料表中精確篩選你需要的資料",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SELECT 指定欄位",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，只查詢客戶的姓名（name）和電子郵件（email）。",
                            scenario: Challenge.Scenario(
                                title: "客戶通訊錄製作",
                                narrative: "行銷部門需要一份客戶通訊錄，只需要客戶姓名和 Email，不需要其他資料。你需要從 customers 表中只選取需要的欄位。\n\n資料表結構：customers (id INTEGER, name TEXT, email TEXT, phone TEXT, city TEXT, registered_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "email": "wang@mail.com", "phone": "0912-345-678", "city": "台北市", "registered_date": "2023-01-15"],
                                    ["id": "2", "name": "李小華", "email": "lee@mail.com", "phone": "0923-456-789", "city": "高雄市", "registered_date": "2023-03-20"],
                                ],
                                dataCaption: "customers 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用逗號分隔多個欄位名稱", "不需要所有欄位時，不要用 *，直接列出需要的欄位"],
                            explanation: "SELECT name, email FROM customers 只回傳指定的兩個欄位。在實際工作中，指定欄位比用 SELECT * 好：(1) 減少網路傳輸量 (2) 程式碼更清楚表達你需要什麼 (3) 避免不小心暴露敏感欄位。",
                            frameworkTip: "面試寫 SQL 時，永遠不要用 SELECT *。面試官會注意你是否只選取需要的欄位，這展示你對效能和安全性的意識。",
                            sampleSchema: """
                                CREATE TABLE customers (
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
                                INSERT INTO customers VALUES (5, '張志豪', 'chang@mail.com', '0956-789-012', '新竹市', '2024-01-15');
                            """,
                            starterCode: """
                                SELECT -- 指定需要的欄位
                                FROM customers;
                            """,
                            expectedQuery: "SELECT name, email FROM customers;"
                        ),
                        Challenge(
                            id: 2,
                            name: "WHERE 多條件篩選",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出 2024 年 3 月且金額超過 1000 且狀態為 'completed' 的訂單，顯示所有欄位。",
                            scenario: Challenge.Scenario(
                                title: "高單價訂單篩選",
                                narrative: "財務部門想要稽核上個月金額超過 1000 元且狀態為已完成的訂單。你需要用多個 WHERE 條件來精確篩選。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "1500", "order_date": "2024-03-05", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "800", "order_date": "2024-03-12", "status": "completed"],
                                    ["id": "3", "customer_id": "103", "amount": "2200", "order_date": "2024-03-18", "status": "pending"],
                                    ["id": "4", "customer_id": "104", "amount": "350", "order_date": "2024-02-25", "status": "completed"],
                                ],
                                dataCaption: "orders 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["多個條件同時成立用 AND 連接", "日期可以用 LIKE 搭配 % 來匹配前綴", "文字比較要用單引號"],
                            explanation: "使用 AND 連接三個條件：日期在 3 月（order_date LIKE '2024-03%'）、金額超過 1000（amount > 1000）、狀態為已完成（status = 'completed'）。SQL 的 WHERE 子句可以用 AND 和 OR 組合多個條件，AND 要求所有條件都成立。",
                            frameworkTip: "面試寫多條件篩選時，建議每個條件換一行，用註解說明每個條件的商業意義。這讓面試官一眼就看懂你的邏輯。",
                            sampleSchema: """
                                CREATE TABLE orders (
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
                                INSERT INTO orders VALUES (7, 106, 1200.00, '2024-03-28', 'completed');
                            """,
                            starterCode: """
                                SELECT *
                                FROM orders
                                WHERE -- 三個條件用 AND 連接;
                            """,
                            expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-03%' AND amount > 1000 AND status = 'completed';"
                        ),
                        Challenge(
                            id: 3,
                            name: "LIKE 與 IN 篩選",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出名稱包含「有機」且類別為「食品」或「飲料」的商品，顯示 name、category、price。",
                            scenario: Challenge.Scenario(
                                title: "商品搜尋功能",
                                narrative: "電商平台的搜尋功能需要支援模糊搜尋和分類篩選。PM 想要找出名稱包含「有機」的商品，且類別為「食品」或「飲料」。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, stock INTEGER)",
                                data: [
                                    ["id": "1", "name": "有機蘋果汁", "category": "飲料", "price": "85", "stock": "200"],
                                    ["id": "2", "name": "有機黑豆", "category": "食品", "price": "120", "stock": "150"],
                                    ["id": "3", "name": "一般牛奶", "category": "飲料", "price": "45", "stock": "500"],
                                    ["id": "4", "name": "有機棉T恤", "category": "服飾", "price": "580", "stock": "80"],
                                ],
                                dataCaption: "products 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LIKE '%關鍵字%' 可以搜尋包含關鍵字的文字", "IN ('值1', '值2') 等同於 = '值1' OR = '值2'"],
                            explanation: "LIKE '%有機%' 找出名稱中任何位置包含「有機」的商品（% 代表任意字元）。IN ('食品', '飲料') 是 category = '食品' OR category = '飲料' 的簡潔寫法。LIKE 和 IN 是 SQL 中最實用的篩選工具，工作中天天會用到。",
                            frameworkTip: "面試時用 IN 代替多個 OR 可以讓 SQL 更簡潔。面試官會欣賞你寫出可讀性高的程式碼。",
                            sampleSchema: """
                                CREATE TABLE products (
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
                                INSERT INTO products VALUES (8, '有機洗髮精', '日用品', 220.00, 60);
                            """,
                            starterCode: """
                                SELECT name, category, price
                                FROM products
                                WHERE -- LIKE 模糊搜尋
                                  AND -- IN 多值篩選;
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE name LIKE '%有機%' AND category IN ('食品', '飲料');"
                        ),
                        Challenge(
                            id: 4,
                            name: "多布林條件篩選",
                            type: .code,
                            difficulty: .easy,
                            question: "找出 is_recyclable = 1 且 is_low_carbon = 1 的商品，顯示 name、category、price。",
                            scenario: Challenge.Scenario(
                                title: "永續商品標記篩選",
                                narrative: "你在一家大型零售商的資料團隊工作。公司最近推動「永續商品」計畫，產品表中有兩個標記欄位：is_recyclable（可回收包裝）和 is_low_carbon（低碳製程）。行銷團隊想找出同時符合兩個標準的商品來做綠色專區推薦。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, is_recyclable INTEGER, is_low_carbon INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SQLite 中布林值用 0 和 1 表示", "兩個條件同時成立用 AND 連接"],
                            explanation: "SQLite 沒有原生的 BOOLEAN 型別，通常用 INTEGER 的 0（false）和 1（true）來表示。篩選時直接用 = 1 判斷即可。這題的關鍵在於同時套用兩個布林條件，AND 確保兩者都必須成立。",
                            frameworkTip: "遇到多個布林欄位的篩選，先確認每個欄位的含義和取值範圍（0/1 還是 TRUE/FALSE），再組合條件。面試時記得說明你對資料欄位的理解。",
                            sampleSchema: """
                                CREATE TABLE products (
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
                                INSERT INTO products VALUES (8, '一般洗衣精', '清潔用品', 65.00, 0, 1);
                            """,
                            starterCode: """
                                SELECT name, category, price
                                FROM products
                                WHERE -- 兩個布林條件;
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE is_recyclable = 1 AND is_low_carbon = 1;"
                        ),
                        Challenge(
                            id: 5,
                            name: "NULL 值處理",
                            type: .code,
                            difficulty: .easy,
                            question: "找出 referrer_id 不是 2 的會員（包含沒有推薦人的），顯示 name。",
                            scenario: Challenge.Scenario(
                                title: "會員推薦人分析",
                                narrative: "會員系統記錄了每位會員的推薦人（referrer_id）。行銷團隊想找出「不是由 VIP 會員（ID = 2）推薦的會員」來做不同的行銷策略。注意：有些會員是自然註冊的，沒有推薦人（referrer_id 為 NULL）。\n\n資料表結構：members (id INTEGER, name TEXT, referrer_id INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["NULL != 2 的結果不是 TRUE，而是 NULL（未知）", "NULL 值需要用 IS NULL 來判斷", "用 OR 把兩種情況都包含進來"],
                            explanation: "這題的陷阱在於 NULL 的三值邏輯。在 SQL 中，NULL != 2 的結果是 NULL（不是 TRUE），所以 WHERE referrer_id != 2 會自動排除 NULL 的行。要包含沒有推薦人的會員，必須加上 OR referrer_id IS NULL。這是 SQL 中最常見的 bug 之一。",
                            frameworkTip: "NULL 處理是面試高頻考點。記住三個原則：(1) NULL 參與任何比較運算結果都是 NULL，(2) 判斷 NULL 只能用 IS NULL / IS NOT NULL，(3) WHERE 只保留結果為 TRUE 的行。",
                            sampleSchema: """
                                CREATE TABLE members (
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
                                INSERT INTO members VALUES (8, 'Henry', 2);
                            """,
                            starterCode: """
                                SELECT name
                                FROM members
                                WHERE -- 注意 NULL 的處理;
                            """,
                            expectedQuery: "SELECT name FROM members WHERE referrer_id != 2 OR referrer_id IS NULL;"
                        ),
                        Challenge(
                            id: 6,
                            name: "OR 多條件篩選",
                            type: .code,
                            difficulty: .easy,
                            question: "找出 area_sq_km > 3000000 或 population > 25000000 的國家，顯示 name、area_sq_km、population。",
                            scenario: Challenge.Scenario(
                                title: "國際市場篩選",
                                narrative: "你在一家跨國顧問公司工作，團隊正在分析各國市場機會。他們定義「大型市場」為：面積超過 300 萬平方公里，或者人口超過 2500 萬。請從國家資料表中找出符合條件的市場。\n\n資料表結構：countries (id INTEGER, name TEXT, continent TEXT, area_sq_km REAL, population INTEGER, gdp_usd REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["OR 表示「任一條件成立即可」", "數值比較不需要加引號"],
                            explanation: "OR 運算子只需要任一邊的條件成立就會包含該行。例如 Taiwan 人口不超過 2500 萬、面積也不超過 300 萬，所以不符合；而 Japan 雖然面積不到 300 萬，但人口超過 2500 萬，所以符合。OR 和 AND 的差別是面試時最基礎的邏輯考點。",
                            frameworkTip: "面試時遇到「A 或 B」的需求就用 OR，「A 且 B」就用 AND。如果 AND 和 OR 混用，一定要用括號明確分組。",
                            sampleSchema: """
                                CREATE TABLE countries (
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
                                INSERT INTO countries VALUES (8, 'Taiwan', 'Asia', 36193, 23500000, 7.9e11);
                            """,
                            starterCode: """
                                SELECT name, area_sq_km, population
                                FROM countries
                                WHERE -- 面積或人口條件;
                            """,
                            expectedQuery: "SELECT name, area_sq_km, population FROM countries WHERE area_sq_km > 3000000 OR population > 25000000;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-3",
                    name: "排序與進階篩選",
                    description: "學會排序、分頁與去重，精確控制查詢結果",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ORDER BY 排序",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，查詢所有銷售記錄的 salesperson、amount、sale_date，先按 amount 由大到小排，amount 相同時按 salesperson 由小到大排。",
                            scenario: Challenge.Scenario(
                                title: "業績排行榜",
                                narrative: "每月底業務部門都會公佈業績排行榜。主管要你產出一份報表，按銷售金額由高到低排列，金額相同時按姓名字母排序。\n\n資料表結構：sales_records (id INTEGER, salesperson TEXT, region TEXT, amount REAL, sale_date TEXT)",
                                data: [
                                    ["id": "1", "salesperson": "王大明", "region": "北區", "amount": "85000", "sale_date": "2024-03-15"],
                                    ["id": "2", "salesperson": "李小華", "region": "南區", "amount": "92000", "sale_date": "2024-03-20"],
                                    ["id": "3", "salesperson": "陳志偉", "region": "北區", "amount": "78000", "sale_date": "2024-03-10"],
                                ],
                                dataCaption: "sales_records 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DESC 代表由大到小（降冪），ASC 代表由小到大（升冪）", "ORDER BY 可以用逗號分隔多個排序欄位"],
                            explanation: "ORDER BY amount DESC, salesperson ASC 先按金額降冪排列，金額相同時再按姓名升冪排列。多欄位排序在製作排行榜、報表時非常常用。注意：ASC 是預設排序方向，可以省略，但為了程式碼的可讀性建議寫出來。",
                            frameworkTip: "面試時明確寫出 ASC/DESC，不要依賴預設值。這展示你的程式碼風格嚴謹且意圖明確。",
                            sampleSchema: """
                                CREATE TABLE sales_records (
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
                                INSERT INTO sales_records VALUES (6, '黃雅婷', '北區', 85000.00, '2024-03-30');
                            """,
                            starterCode: """
                                SELECT salesperson, amount, sale_date
                                FROM sales_records
                                ORDER BY -- 先按金額排，再按姓名排;
                            """,
                            expectedQuery: "SELECT salesperson, amount, sale_date FROM sales_records ORDER BY amount DESC, salesperson ASC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "LIMIT 與 OFFSET 分頁",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，查詢商品依 id 排序，取得第 2 頁的資料（每頁 5 筆，也就是第 6 到第 10 筆）。",
                            scenario: Challenge.Scenario(
                                title: "商品列表分頁",
                                narrative: "電商網站的商品列表需要分頁顯示，每頁 5 筆商品。前端工程師問你怎麼用 SQL 實現分頁功能，讓使用者可以翻到第 2 頁。\n\n資料表結構：products (id INTEGER, name TEXT, category TEXT, price REAL, created_at TEXT)",
                                data: [
                                    ["id": "1", "name": "無線滑鼠", "price": "450"],
                                    ["id": "2", "name": "機械鍵盤", "price": "2800"],
                                    ["id": "3", "name": "USB Hub", "price": "380"],
                                ],
                                dataCaption: "products 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LIMIT 控制回傳筆數，OFFSET 控制跳過幾筆", "第 2 頁表示跳過第 1 頁的 5 筆，所以 OFFSET = 5"],
                            explanation: "LIMIT 5 OFFSET 5 表示跳過前 5 筆（第 1 頁），然後取 5 筆（第 2 頁的內容）。分頁公式：OFFSET = (頁碼 - 1) * 每頁筆數。LIMIT/OFFSET 是實作分頁的基本方式，幾乎每個 Web 應用都會用到。",
                            frameworkTip: "面試延伸題：如果資料量很大（百萬筆），OFFSET 效能會很差。進階做法是用 WHERE id > 上一頁最後一筆的 id，稱為 keyset pagination。",
                            sampleSchema: """
                                CREATE TABLE products (
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
                                INSERT INTO products VALUES (12, '電競滑鼠墊', '周邊', 450.00, '2024-03-05');
                            """,
                            starterCode: """
                                SELECT *
                                FROM products
                                ORDER BY id ASC
                                -- 跳過前幾筆？取幾筆？;
                            """,
                            expectedQuery: "SELECT * FROM products ORDER BY id ASC LIMIT 5 OFFSET 5;"
                        ),
                        Challenge(
                            id: 3,
                            name: "DISTINCT 與去重",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "關於 DISTINCT，以下哪個說法最正確？",
                            scenario: Challenge.Scenario(
                                title: "客戶分布分析",
                                narrative: "行銷團隊想知道公司的客戶分布在哪些城市。你查詢 customers 表的 city 欄位，但發現很多城市重複出現。你需要用 DISTINCT 去除重複值。",
                                data: [
                                    ["id": "1", "name": "王小明", "city": "台北市"],
                                    ["id": "2", "name": "李小華", "city": "高雄市"],
                                    ["id": "3", "name": "陳大偉", "city": "台北市"],
                                    ["id": "4", "name": "林美玲", "city": "台中市"],
                                    ["id": "5", "name": "張志豪", "city": "台北市"],
                                ],
                                dataCaption: "customers 資料表（部分範例）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SELECT DISTINCT city FROM customers 會回傳所有 city 值，包含重複的", explanation: "DISTINCT 的功能就是去除重複值。如果不加 DISTINCT，才會回傳所有值（包含重複）。"),
                                Challenge.Option(id: "B", text: "DISTINCT 只能用在一個欄位上，不能同時去重多個欄位", explanation: "DISTINCT 可以作用在多個欄位的組合上。例如 SELECT DISTINCT city, category 會去除 city + category 組合相同的行。"),
                                Challenge.Option(id: "C", text: "SELECT DISTINCT city FROM customers 會回傳不重複的城市列表，例如台北市只出現一次", explanation: "正確！DISTINCT 會去除查詢結果中的重複列。即使台北市出現三次，結果中也只會出現一次。"),
                                Challenge.Option(id: "D", text: "DISTINCT 和 GROUP BY 完全不同，無法互換使用", explanation: "在某些場景下，DISTINCT 和 GROUP BY 可以達到類似效果。例如 SELECT DISTINCT city 和 SELECT city GROUP BY city 結果相同。但 GROUP BY 可以搭配聚合函數，功能更強大。"),
                            ],
                            correctAnswer: "C",
                            hints: ["DISTINCT 放在 SELECT 後面，作用是去除重複的列", "想想看：如果不加 DISTINCT，台北市會出現幾次？"],
                            explanation: "DISTINCT 會對查詢結果去重，確保回傳的每一列都是唯一的。這在統計「有哪些不同的值」時特別有用，例如：有哪些城市有客戶、有哪些部門、有哪些商品類別等。在面試中，DISTINCT 常和 COUNT 搭配使用：COUNT(DISTINCT city) 計算不重複的城市數量。",
                            frameworkTip: "面試小技巧：如果你需要「列出不同的值」用 DISTINCT，如果需要「每個值的統計」用 GROUP BY。展示你知道兩者的差異和適用場景。"
                        ),
                        Challenge(
                            id: 4,
                            name: "日期範圍與計數",
                            type: .code,
                            difficulty: .easy,
                            question: "統計 2024-03-01 到 2024-03-31 之間每天的不重複活躍用戶數（別名 active_users），按 activity_date 排序。",
                            scenario: Challenge.Scenario(
                                title: "近 30 天活躍用戶統計",
                                narrative: "產品團隊想了解最近 30 天的日活躍用戶數（DAU 趨勢）。活動紀錄表中記錄了每位用戶的操作，同一天同一個用戶可能有多筆紀錄。你需要按日期統計不重複的活躍用戶數。\n\n資料表結構：user_activity (id INTEGER, user_id INTEGER, activity_type TEXT, activity_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT column) 可以計算不重複的值", "BETWEEN 用來篩選日期範圍", "同一天同一用戶有多筆紀錄，要用 DISTINCT 去重"],
                            explanation: "COUNT(DISTINCT user_id) 是這題的關鍵 — 它只計算不重複的 user_id。沒有 DISTINCT 的話，同一天同一個用戶的多次操作會被重複計算，導致活躍用戶數膨脹。這是計算 DAU（Daily Active Users）最基本的寫法。",
                            frameworkTip: "面試提到 DAU/MAU 指標時，一定要強調使用 COUNT(DISTINCT user_id) 而不是 COUNT(*)。這展示你理解產品指標的定義。",
                            sampleSchema: """
                                CREATE TABLE user_activity (
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
                                INSERT INTO user_activity VALUES (12, 106, 'login', '2024-02-28');
                            """,
                            starterCode: """
                                SELECT activity_date,
                                       -- 不重複用戶數
                                FROM user_activity
                                WHERE -- 日期範圍
                                GROUP BY activity_date
                                ORDER BY activity_date;
                            """,
                            expectedQuery: "SELECT activity_date, COUNT(DISTINCT user_id) AS active_users FROM user_activity WHERE activity_date BETWEEN '2024-03-01' AND '2024-03-31' GROUP BY activity_date ORDER BY activity_date;"
                        ),
                        Challenge(
                            id: 5,
                            name: "HAVING 篩選分組結果",
                            type: .code,
                            difficulty: .easy,
                            question: "找出選修人數 >= 5 的課程名稱（course_name）和學生數（student_count），按 student_count 降序排列。",
                            scenario: Challenge.Scenario(
                                title: "熱門課程篩選",
                                narrative: "線上學習平台想找出「熱門課程」來做首頁推薦。定義為：選修學生數達到 5 人以上的課程。選課紀錄表中一個學生選一門課就是一筆紀錄。\n\n資料表結構：enrollments (id INTEGER, student_id INTEGER, course_name TEXT, enroll_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["HAVING 用來篩選 GROUP BY 之後的結果", "HAVING 中要用聚合函數 COUNT(*)，不能用別名", ">= 5 表示「大於或等於 5」"],
                            explanation: "GROUP BY course_name 把選課紀錄按課程分組，COUNT(*) 計算每組的紀錄數（即學生數）。HAVING COUNT(*) >= 5 只保留學生數 >= 5 的課程。注意不能用 WHERE 來篩選聚合結果 — WHERE 在 GROUP BY 之前執行，只能篩選原始資料行。",
                            frameworkTip: "WHERE vs HAVING 的區分：WHERE 篩選「原始行」（GROUP BY 之前），HAVING 篩選「分組結果」（GROUP BY 之後）。面試時一句話講清楚就好。",
                            sampleSchema: """
                                CREATE TABLE enrollments (
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
                                INSERT INTO enrollments VALUES (15, 105, '機器學習', '2024-01-24');
                            """,
                            starterCode: """
                                SELECT course_name,
                                       COUNT(*) AS student_count
                                FROM enrollments
                                GROUP BY course_name
                                -- 篩選人數條件
                                ORDER BY student_count DESC;
                            """,
                            expectedQuery: "SELECT course_name, COUNT(*) AS student_count FROM enrollments GROUP BY course_name HAVING COUNT(*) >= 5 ORDER BY student_count DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-4",
                    name: "聚合函數深入",
                    description: "掌握 COUNT、SUM、AVG 等聚合函數與 GROUP BY、HAVING",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "COUNT 與 SUM",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，計算 orders 表中所有訂單的：總筆數（total_orders）、總金額（total_revenue）、平均金額（avg_amount）、最高金額（max_amount）、最低金額（min_amount）。",
                            scenario: Challenge.Scenario(
                                title: "月度業績報告",
                                narrative: "財務部門需要一份簡單的月度業績摘要：總訂單數、總營收、平均訂單金額、最高和最低單筆金額。你需要用聚合函數一次算出這些指標。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: [
                                    ["id": "1", "amount": "1500", "status": "completed"],
                                    ["id": "2", "amount": "800", "status": "completed"],
                                    ["id": "3", "amount": "2200", "status": "completed"],
                                    ["id": "4", "amount": "350", "status": "completed"],
                                ],
                                dataCaption: "orders 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM() 計算總和，AVG() 計算平均值", "MAX() 和 MIN() 分別找最大和最小值", "用 AS 給結果取個有意義的別名"],
                            explanation: "SQL 五大聚合函數：COUNT（計數）、SUM（總和）、AVG（平均）、MAX（最大值）、MIN（最小值）。這些是資料分析最基本的工具。面試中常被要求用一條 SQL 同時算出多個指標，展示你對聚合函數的熟悉度。",
                            frameworkTip: "面試時寫聚合查詢，記得用有意義的 AS 別名。面試官看到 SUM(amount) AS total_revenue 比看到 SUM(amount) 更容易理解你的意圖。",
                            sampleSchema: """
                                CREATE TABLE orders (
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
                                INSERT INTO orders VALUES (6, 101, 950.00, '2024-03-28', 'completed');
                            """,
                            starterCode: """
                                SELECT
                                  COUNT(*) AS total_orders,
                                  -- 總金額
                                  -- 平均金額
                                  -- 最高金額
                                  -- 最低金額
                                FROM orders;
                            """,
                            expectedQuery: "SELECT COUNT(*) AS total_orders, SUM(amount) AS total_revenue, AVG(amount) AS avg_amount, MAX(amount) AS max_amount, MIN(amount) AS min_amount FROM orders;"
                        ),
                        Challenge(
                            id: 2,
                            name: "GROUP BY 分組統計",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，計算每個部門的人數（headcount）、平均薪資（avg_salary）、最高薪資（max_salary），按平均薪資由高到低排序。",
                            scenario: Challenge.Scenario(
                                title: "各部門薪資分析",
                                narrative: "人資主管想了解各部門的薪資狀況，包括每個部門有多少人、平均薪資和最高薪資。你需要用 GROUP BY 按部門分組計算。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "工程部", "salary": "72000"],
                                    ["id": "2", "name": "李小華", "department": "行銷部", "salary": "55000"],
                                    ["id": "3", "name": "陳大偉", "department": "工程部", "salary": "85000"],
                                    ["id": "4", "name": "林美玲", "department": "人資部", "salary": "58000"],
                                ],
                                dataCaption: "employees 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY department 把同一個部門的員工聚合在一起", "SELECT 中除了聚合函數外的欄位，都必須出現在 GROUP BY 中", "ORDER BY 可以用 AS 別名來排序"],
                            explanation: "GROUP BY department 將資料按部門分組，然後對每組分別計算聚合函數。關鍵規則：SELECT 中非聚合的欄位必須出現在 GROUP BY 中。ORDER BY avg_salary DESC 讓薪資最高的部門排在最前面。這是面試中出現頻率最高的 SQL 題型之一。",
                            frameworkTip: "面試時口述思路：「先 GROUP BY 部門分組，再用聚合函數算各組的統計值，最後 ORDER BY 排序。」讓面試官看到你清楚 SQL 的執行順序。",
                            sampleSchema: """
                                CREATE TABLE employees (
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
                                INSERT INTO employees VALUES (8, '周怡君', '行銷部', 60000.00, '2022-11-10');
                            """,
                            starterCode: """
                                SELECT department,
                                       COUNT(*) AS headcount,
                                       -- 平均薪資
                                       -- 最高薪資
                                FROM employees
                                GROUP BY -- 按什麼分組？
                                ORDER BY -- 按什麼排序？;
                            """,
                            expectedQuery: "SELECT department, COUNT(*) AS headcount, AVG(salary) AS avg_salary, MAX(salary) AS max_salary FROM employees GROUP BY department ORDER BY avg_salary DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "HAVING 過濾分組",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出下單次數超過 3 次的客戶，顯示 customer_id、訂單數（order_count）、總消費金額（total_spent），按總消費由高到低排序。",
                            scenario: Challenge.Scenario(
                                title: "活躍客戶辨識",
                                narrative: "行銷團隊定義「活躍客戶」為下單次數 3 次以上的客戶。他們想找出這些客戶並看他們的消費統計，作為 VIP 行銷活動的目標族群。\n\n資料表結構：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["customer_id": "101", "訂單數": "5", "總消費": "8500"],
                                    ["customer_id": "102", "訂單數": "2", "總消費": "1200"],
                                    ["customer_id": "103", "訂單數": "4", "總消費": "6800"],
                                ],
                                dataCaption: "客戶消費摘要（預期結果範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["聚合後的篩選用 HAVING，不是 WHERE", "HAVING 放在 GROUP BY 之後", "HAVING 中可以使用聚合函數如 COUNT(*)"],
                            explanation: "HAVING COUNT(*) > 3 在分組聚合之後篩選結果，只保留下單超過 3 次的客戶。WHERE 和 HAVING 的關鍵區別：WHERE 在分組前篩選原始資料行，HAVING 在分組後篩選聚合結果。SQL 執行順序：FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY。",
                            frameworkTip: "面試經典追問：「WHERE 和 HAVING 的差別是什麼？」標準回答：「WHERE 篩選原始資料行，在 GROUP BY 之前執行；HAVING 篩選聚合後的分組結果，在 GROUP BY 之後執行。」",
                            sampleSchema: """
                                CREATE TABLE orders (
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
                                INSERT INTO orders VALUES (12, 103, 1400.00, '2024-03-25');
                            """,
                            starterCode: """
                                SELECT customer_id,
                                       COUNT(*) AS order_count,
                                       SUM(amount) AS total_spent
                                FROM orders
                                GROUP BY customer_id
                                -- 怎麼篩選「下單超過 3 次」的客戶？
                                ORDER BY total_spent DESC;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_spent FROM orders GROUP BY customer_id HAVING COUNT(*) > 3 ORDER BY total_spent DESC;"
                        ),
                        Challenge(
                            id: 4,
                            name: "加權平均計算",
                            type: .code,
                            difficulty: .easy,
                            question: "計算每個商品的加權平均售價（別名 weighted_avg_price）：SUM(unit_price * units_sold) / SUM(units_sold)，顯示 product_name 和 weighted_avg_price，按 product_name 排序。結果四捨五入到小數點後兩位。",
                            scenario: Challenge.Scenario(
                                title: "商品加權平均售價",
                                narrative: "電商平台的商品價格會隨促銷活動變動。價格紀錄表記錄了每個時段的售價和該時段的銷售數量。財務團隊需要算出每個商品的「加權平均售價」（按銷售數量加權），而不是簡單平均。\n\n資料表結構：price_log (id INTEGER, product_id INTEGER, product_name TEXT, unit_price REAL, units_sold INTEGER, period TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["加權平均 = 總金額 / 總數量 = SUM(price * qty) / SUM(qty)", "用 ROUND(value, 2) 四捨五入到小數點後兩位", "乘以 1.0 確保浮點數除法（避免整數除法截斷）"],
                            explanation: "加權平均跟簡單平均（AVG）不同：它考慮了每個價格對應的銷售量。公式是 SUM(unit_price * units_sold) / SUM(units_sold)。例如，如果一個商品在促銷月賣了 120 件、正常價只賣 50 件，促銷價對平均價的影響就應該更大。這在財務分析中非常常見。",
                            frameworkTip: "面試時如果被問到「平均」，先確認是簡單平均還是加權平均。主動提出這個區別會讓面試官知道你懂業務邏輯。",
                            sampleSchema: """
                                CREATE TABLE price_log (
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
                                INSERT INTO price_log VALUES (9, 3, 'USB-C 集線器', 420.00, 70, '2024-03');
                            """,
                            starterCode: """
                                SELECT product_name,
                                       ROUND(-- 加權平均公式, 2) AS weighted_avg_price
                                FROM price_log
                                GROUP BY product_name
                                ORDER BY product_name;
                            """,
                            expectedQuery: "SELECT product_name, ROUND(SUM(unit_price * units_sold) * 1.0 / SUM(units_sold), 2) AS weighted_avg_price FROM price_log GROUP BY product_name ORDER BY product_name;"
                        ),
                        Challenge(
                            id: 5,
                            name: "多維度分組統計",
                            type: .code,
                            difficulty: .medium,
                            question: "按 SUBSTR(trans_date,1,7)（別名 month）和 country 分組，統計：交易總數（trans_count）、核准交易數（approved_count，status='approved'）、交易總金額（trans_total）、核准交易金額（approved_total）。按 month、country 排序。",
                            scenario: Challenge.Scenario(
                                title: "月度交易分析報表",
                                narrative: "風控團隊需要一份月度交易報表：按月份和國家分組，統計每組的交易總數、核准交易數、交易總金額、核准交易金額。這份報表用來偵測異常交易模式。\n\n資料表結構：transactions (id INTEGER, country TEXT, status TEXT, amount REAL, trans_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 CASE WHEN 在聚合函數裡做條件計算", "SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 計算核准數", "SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) 計算核准金額"],
                            explanation: "這題的核心技巧是「條件聚合」（Conditional Aggregation）：在 SUM 裡面放 CASE WHEN，根據條件決定加什麼值。SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) 相當於只計算 status 為 approved 的行數。這比用子查詢或多次 JOIN 更簡潔高效。",
                            frameworkTip: "CASE WHEN 搭配聚合函數是面試中級題的必備技巧。它讓你在一次查詢中同時計算多個條件的指標，避免寫多個子查詢。",
                            sampleSchema: """
                                CREATE TABLE transactions (
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
                                INSERT INTO transactions VALUES (10, 'TW', 'declined', 700.00, '2024-02-25');
                            """,
                            starterCode: """
                                SELECT SUBSTR(trans_date, 1, 7) AS month,
                                       country,
                                       COUNT(*) AS trans_count,
                                       -- 核准交易數
                                       SUM(amount) AS trans_total
                                       -- 核准交易金額
                                FROM transactions
                                GROUP BY month, country
                                ORDER BY month, country;
                            """,
                            expectedQuery: "SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total, SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) AS approved_total FROM transactions GROUP BY month, country ORDER BY month, country;"
                        ),
                        Challenge(
                            id: 6,
                            name: "用戶留存率計算",
                            type: .code,
                            difficulty: .medium,
                            question: "計算次日留存率（別名 day1_retention）：在首次登入隔天也有登入的用戶數 / 總用戶數。結果用 ROUND 四捨五入到小數點後兩位。",
                            scenario: Challenge.Scenario(
                                title: "新用戶次日留存率",
                                narrative: "產品團隊想知道「新用戶次日留存率」：在所有用戶中，有多少比例的人在首次登入的隔天也有登入？這是衡量產品黏性的核心指標。\n\n資料表結構：logins (id INTEGER, player_id INTEGER, login_date TEXT)\n\n提示：先找到每個用戶的首次登入日期，再看隔天有沒有登入紀錄。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 MIN(login_date) 搭配 GROUP BY player_id 找首次登入日期", "SQLite 的日期加一天：DATE(date_string, '+1 day')", "用 LEFT JOIN 保留所有用戶，隔天沒登入的會是 NULL", "用 SUM(CASE WHEN ... IS NOT NULL ...) 計算次日有登入的人數"],
                            explanation: "這題分三步：(1) 子查詢找每個用戶的首次登入日期 MIN(login_date)，(2) LEFT JOIN 回 logins 表，條件是同一用戶且日期是首次登入 +1 天，(3) 計算比例：有匹配到的用戶數 / 總用戶數。DATE(date, '+1 day') 是 SQLite 的日期加減語法。這是產品分析中非常經典的留存率計算方式。",
                            frameworkTip: "留存率是產品面試必考指標。公式是「特定時段後仍活躍的用戶 / 初始用戶」。面試時先說公式，再轉成 SQL，展示你從業務到技術的轉化能力。",
                            sampleSchema: """
                                CREATE TABLE logins (
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
                                INSERT INTO logins VALUES (12, 6, '2024-01-05');
                            """,
                            starterCode: """
                                -- 提示：用子查詢找出每個用戶的首次登入日期
                                -- 再用 JOIN 或 EXISTS 檢查隔天是否有登入
                                SELECT ROUND(
                                  -- 次日有登入的用戶數 * 1.0 / 總用戶數
                                , 2) AS day1_retention;
                            """,
                            expectedQuery: "SELECT ROUND(SUM(CASE WHEN l2.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id), 2) AS day1_retention FROM (SELECT player_id, MIN(login_date) AS first_login FROM logins GROUP BY player_id) f LEFT JOIN logins l2 ON f.player_id = l2.player_id AND l2.login_date = DATE(f.first_login, '+1 day');"
                        ),
                    ]
                ),
                Quest(
                    id: "23-5",
                    name: "字串與日期處理",
                    description: "使用字串函數和日期函數處理真實世界的資料",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "字串函數",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，查詢每位客戶的：姓名大寫版（upper_name）、Email 小寫版（lower_email）、姓名字數（name_length）、問候語（greeting，格式為 'Hello, ' || name || '!'）。",
                            scenario: Challenge.Scenario(
                                title: "客戶資料清理",
                                narrative: "資料庫中客戶的姓名大小寫不一致，有些是全大寫，有些是小寫。行銷團隊需要一份格式統一的名單，要求：顯示姓名（全大寫）、Email（全小寫）、姓名長度，並用 || 拼接一段問候語。\n\n資料表結構：customers (id INTEGER, name TEXT, email TEXT, city TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice Wang", "email": "ALICE@MAIL.COM", "city": "台北市"],
                                    ["id": "2", "name": "bob lee", "email": "Bob@Mail.Com", "city": "高雄市"],
                                ],
                                dataCaption: "customers 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPPER() 轉大寫，LOWER() 轉小寫", "LENGTH() 計算字串長度", "|| 是 SQLite 的字串拼接運算子"],
                            explanation: "SQLite 常用字串函數：UPPER() 轉大寫、LOWER() 轉小寫、LENGTH() 計算長度。|| 運算子用來拼接字串，類似其他語言的 + 或 concat()。資料清理是資料分析師的日常工作，面試中也常出現字串處理的題目。",
                            frameworkTip: "面試延伸：如果被問到 SUBSTR()，語法是 SUBSTR(字串, 起始位置, 長度)。REPLACE(字串, 舊值, 新值) 用來替換文字。記住這些常用函數，面試時可以靈活運用。",
                            sampleSchema: """
                                CREATE TABLE customers (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  email TEXT NOT NULL,
                                  city TEXT NOT NULL
                                );
                                INSERT INTO customers VALUES (1, 'Alice Wang', 'ALICE@MAIL.COM', '台北市');
                                INSERT INTO customers VALUES (2, 'bob lee', 'Bob@Mail.Com', '高雄市');
                                INSERT INTO customers VALUES (3, 'Charlie Chen', 'charlie@MAIL.com', '台中市');
                                INSERT INTO customers VALUES (4, 'Diana Lin', 'DIANA@mail.COM', '新竹市');
                            """,
                            starterCode: """
                                SELECT
                                  UPPER(name) AS upper_name,
                                  -- Email 小寫
                                  -- 姓名字數
                                  -- 問候語拼接
                                FROM customers;
                            """,
                            expectedQuery: "SELECT UPPER(name) AS upper_name, LOWER(email) AS lower_email, LENGTH(name) AS name_length, 'Hello, ' || name || '!' AS greeting FROM customers;"
                        ),
                        Challenge(
                            id: 2,
                            name: "日期函數",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，查詢每位員工的 name、hire_date、入職年份（hire_year）、入職月份（hire_month）、以及從入職到今天的天數（days_employed，使用 julianday）。按天數由大到小排序。",
                            scenario: Challenge.Scenario(
                                title: "員工年資統計",
                                narrative: "人資部門要統計每位員工的年資，包括入職日期、到今天為止的任職天數，以及入職的年份和月份。SQLite 中使用 date() 和 strftime() 來處理日期。\n\n資料表結構：employees (id INTEGER, name TEXT, department TEXT, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "工程部", "hire_date": "2021-03-15"],
                                    ["id": "2", "name": "李小華", "department": "行銷部", "hire_date": "2023-01-10"],
                                ],
                                dataCaption: "employees 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["strftime('%Y', date) 取年份，strftime('%m', date) 取月份", "julianday('now') - julianday(date) 可以計算天數差", "用 CAST(... AS INTEGER) 把小數天數轉為整數"],
                            explanation: "SQLite 日期處理的核心工具：strftime() 用來提取日期的各個部分（年、月、日等），julianday() 把日期轉為儒略日數（一個連續的天數），兩個 julianday 相減就得到天數差。CAST(... AS INTEGER) 把結果轉為整數。這些函數在日期分析中非常實用。",
                            frameworkTip: "面試中常考的日期處理：(1) 提取年/月：strftime('%Y/%m', date) (2) 計算天數差：julianday 相減 (3) 取今天日期：date('now')。記住這三個模式就能應付大多數日期題目。",
                            sampleSchema: """
                                CREATE TABLE employees (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  department TEXT NOT NULL,
                                  hire_date TEXT NOT NULL
                                );
                                INSERT INTO employees VALUES (1, '王小明', '工程部', '2021-03-15');
                                INSERT INTO employees VALUES (2, '李小華', '行銷部', '2023-01-10');
                                INSERT INTO employees VALUES (3, '陳大偉', '工程部', '2020-08-01');
                                INSERT INTO employees VALUES (4, '林美玲', '人資部', '2022-06-20');
                                INSERT INTO employees VALUES (5, '張志豪', '行銷部', '2024-02-01');
                            """,
                            starterCode: """
                                SELECT name,
                                       hire_date,
                                       strftime('%Y', hire_date) AS hire_year,
                                       -- 入職月份
                                       -- 任職天數（用 julianday 計算）
                                FROM employees
                                ORDER BY -- 按天數排序;
                            """,
                            expectedQuery: "SELECT name, hire_date, strftime('%Y', hire_date) AS hire_year, strftime('%m', hire_date) AS hire_month, CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS days_employed FROM employees ORDER BY days_employed DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "字串大小寫修正",
                            type: .code,
                            difficulty: .easy,
                            question: "將每位使用者的 name 轉換為 Proper Case（首字母大寫、其餘小寫），別名 formatted_name。顯示 id 和 formatted_name，按 id 排序。\n\n提示：用 UPPER + SUBSTR 取首字母，LOWER + SUBSTR 取其餘部分，再用 || 串接。",
                            scenario: Challenge.Scenario(
                                title: "使用者姓名格式統一",
                                narrative: "客服團隊發現系統中的使用者姓名格式不一致：有人全大寫、有人全小寫、有人大小寫混亂。他們需要把所有姓名統一成「首字母大寫、其餘小寫」的格式（Proper Case），方便製作郵寄標籤和正式文件。\n\n資料表結構：users (id INTEGER, name TEXT, email TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUBSTR(name, 1, 1) 取第一個字元", "SUBSTR(name, 2) 取第二個字元到結尾（省略長度參數）", "UPPER() 轉大寫，LOWER() 轉小寫", "|| 是 SQLite 的字串串接運算子"],
                            explanation: "SQLite 沒有內建的 INITCAP 或 Proper Case 函數，所以要手動組合：UPPER(SUBSTR(name, 1, 1)) 把首字母轉大寫，LOWER(SUBSTR(name, 2)) 把剩餘部分轉小寫，|| 串接兩段。這是一個很實用的字串處理技巧。",
                            frameworkTip: "字串處理面試題常考 SUBSTR + UPPER/LOWER 的組合。記住 SUBSTR 的參數順序：(字串, 起始位置, 長度)，省略長度代表取到結尾。",
                            sampleSchema: """
                                CREATE TABLE users (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  email TEXT NOT NULL
                                );
                                INSERT INTO users VALUES (1, 'aLICE', 'alice@mail.com');
                                INSERT INTO users VALUES (2, 'bOB', 'bob@mail.com');
                                INSERT INTO users VALUES (3, 'CHARLIE', 'charlie@mail.com');
                                INSERT INTO users VALUES (4, 'diana', 'diana@mail.com');
                                INSERT INTO users VALUES (5, 'Eve', 'eve@mail.com');
                                INSERT INTO users VALUES (6, 'fRANK', 'frank@mail.com');
                            """,
                            starterCode: """
                                SELECT id,
                                       -- 首字母大寫 || 其餘小寫 AS formatted_name
                                FROM users
                                ORDER BY id;
                            """,
                            expectedQuery: "SELECT id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) AS formatted_name FROM users ORDER BY id;"
                        ),
                        Challenge(
                            id: 4,
                            name: "分組串接",
                            type: .code,
                            difficulty: .easy,
                            question: "按 sale_date 分組，把每天賣出的不重複商品名稱按字母排序後用「, 」串接（別名 products），同時顯示不重複商品數（別名 product_count）。按 sale_date 排序。",
                            scenario: Challenge.Scenario(
                                title: "每日熱銷商品清單",
                                narrative: "營運團隊每天要看「當天賣出了哪些商品」的彙整報表。他們希望每天一行，把所有賣出的商品名稱用逗號串在一起，而且不要重複、按字母排序。\n\n資料表結構：daily_sales (id INTEGER, product_name TEXT, sale_date TEXT, quantity INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP_CONCAT() 可以把多行的值串接成一個字串", "GROUP_CONCAT(DISTINCT column) 自動去除重複值", "COUNT(DISTINCT column) 計算不重複值的數量"],
                            explanation: "GROUP_CONCAT 是 SQLite 的聚合函數，它把同組內的多個值串接成一個字串。加上 DISTINCT 可以去除重複值。預設分隔符是逗號。搭配 COUNT(DISTINCT product_name) 可以同時知道每天有幾種不重複商品。這在製作彙整報表時非常實用。",
                            frameworkTip: "GROUP_CONCAT 是 SQLite/MySQL 的函數，PostgreSQL 用 STRING_AGG，SQL Server 用 STRING_AGG 或 FOR XML PATH。面試時可以提一下跨資料庫差異，展示你的廣度。",
                            sampleSchema: """
                                CREATE TABLE daily_sales (
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
                                INSERT INTO daily_sales VALUES (10, '紅茶', '2024-03-03', 2);
                            """,
                            starterCode: """
                                SELECT sale_date,
                                       -- 串接商品名稱
                                       -- 商品數
                                FROM daily_sales
                                GROUP BY sale_date
                                ORDER BY sale_date;
                            """,
                            expectedQuery: "SELECT sale_date, GROUP_CONCAT(DISTINCT product_name) AS products, COUNT(DISTINCT product_name) AS product_count FROM daily_sales GROUP BY sale_date ORDER BY sale_date;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-6",
                    name: "Boss: 基礎查詢綜合挑戰",
                    description: "結合所有基礎查詢技巧，挑戰綜合型題目",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "綜合查詢",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一段 SQL，計算 2024 年 Q1（1-3 月）已完成訂單中，每個商品類別的訂單數（order_count）、總營收（total_revenue，quantity * unit_price）、平均客單價（avg_order_value）。只顯示總營收超過 5000 的類別，按總營收由高到低排序。",
                            scenario: Challenge.Scenario(
                                title: "電商平台季度報告",
                                narrative: "你是電商公司的資料分析師，CEO 要求你產出 2024 年 Q1 的季度報告。他想知道每個商品類別的銷售表現：訂單數、總營收、平均客單價，但只要看銷售額超過 5000 的類別，並按總營收由高到低排列。\n\n資料表結構：\n• products (id INTEGER, name TEXT, category TEXT, price REAL)\n• order_items (id INTEGER, order_id INTEGER, product_id INTEGER, quantity INTEGER, unit_price REAL)\n• orders (id INTEGER, customer_id INTEGER, order_date TEXT, status TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["需要 JOIN 三張表：order_items、orders、products", "日期篩選：order_date >= '2024-01-01' AND order_date < '2024-04-01'", "平均客單價 = 總營收 / 不重複訂單數", "用 HAVING 篩選聚合後的結果"],
                            explanation: "這題綜合了所有基礎查詢技巧：(1) JOIN 合併三張表 (2) WHERE 篩選日期和狀態 (3) GROUP BY 按類別分組 (4) 聚合函數計算 COUNT、SUM (5) HAVING 篩選聚合結果 (6) ORDER BY 排序。注意 COUNT(DISTINCT o.id) 確保同一筆訂單不被重複計算。平均客單價用總營收除以不重複訂單數。",
                            frameworkTip: "面試遇到複雜查詢，建議用「由內而外」的思路：(1) 先確定需要哪些表和 JOIN 條件 (2) 加上 WHERE 篩選 (3) GROUP BY 分組 (4) 寫聚合函數 (5) HAVING 過濾 (6) ORDER BY 排序。一步步建構，不要試圖一次寫完。",
                            sampleSchema: """
                                CREATE TABLE products (
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
                                INSERT INTO order_items VALUES (16, 9, 1, 1, 450.00);
                            """,
                            starterCode: """
                                SELECT p.category,
                                       COUNT(DISTINCT o.id) AS order_count,
                                       SUM(oi.quantity * oi.unit_price) AS total_revenue,
                                       -- 平均客單價
                                FROM order_items oi
                                JOIN orders o ON oi.order_id = o.id
                                JOIN products p ON oi.product_id = p.id
                                WHERE -- Q1 日期篩選 AND 已完成訂單
                                GROUP BY -- 按類別分組
                                -- 篩選總營收超過 5000
                                ORDER BY -- 排序;
                            """,
                            expectedQuery: "SELECT p.category, COUNT(DISTINCT o.id) AS order_count, SUM(oi.quantity * oi.unit_price) AS total_revenue, ROUND(SUM(oi.quantity * oi.unit_price) * 1.0 / COUNT(DISTINCT o.id), 2) AS avg_order_value FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN products p ON oi.product_id = p.id WHERE o.order_date >= '2024-01-01' AND o.order_date < '2024-04-01' AND o.status = 'completed' GROUP BY p.category HAVING total_revenue > 5000 ORDER BY total_revenue DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "分析計畫設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請設計一個完整的分析計畫：你會寫哪些 SQL 查詢？每個查詢的目的是什麼？你會如何組合這些結果來回答 PM 的問題？",
                            scenario: Challenge.Scenario(
                                title: "用戶留存分析計畫",
                                narrative: "你是電商公司的資料分析師，PM 希望你分析「新用戶的 7 天留存率」。他想知道：(1) 過去一個月每天註冊的新用戶中，有多少人在註冊後 7 天內再次下單？(2) 哪些用戶特徵（城市、註冊來源）與留存率有關？\n\n你可以使用的資料表：\n• users (id, name, city, source, registered_date)\n• orders (id, user_id, amount, order_date, status)\n• page_views (id, user_id, page_url, view_date)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先定義清楚「留存」的衡量標準", "想想需要 JOIN 哪些表，用什麼條件", "別忘了按不同維度（城市、來源）做細分"],
                            explanation: "設計分析計畫的關鍵是：(1) 明確定義指標（什麼是「留存」）(2) 拆解為可執行的 SQL 步驟 (3) 考慮資料品質問題。面試中展示你能把模糊的業務問題轉化為具體的 SQL 查詢計畫，比只會寫 SQL 語法更有價值。",
                            frameworkTip: "面試中遇到開放式分析題，用這個框架回答：(1) 釐清定義：「留存的定義是...」(2) 拆解步驟：「我會分三步...」(3) 考慮限制：「資料可能有的問題是...」(4) 預期產出：「最終會產出...」。這個框架讓你的回答結構清晰、有說服力。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 24,
            name: "SQL 分析核心",
            emoji: "🔗",
            description: "多表連接、子查詢與 CTE，掌握資料整合的核心技能",
            quests: [
                Quest(
                    id: "24-1",
                    name: "多表連接進階",
                    description: "INNER JOIN、LEFT JOIN、三表 JOIN，掌握多表查詢的核心能力",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INNER JOIN 基礎",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，用 INNER JOIN 列出每筆訂單的客戶名稱、訂單金額和日期，按日期排序。",
                            scenario: Challenge.Scenario(
                                title: "訂單與客戶資料合併",
                                narrative: "電商營運團隊需要一份報表，列出每筆訂單對應的客戶名稱與訂單金額。訂單資料和客戶資料分別存在兩張表中，你需要用 INNER JOIN 將它們合併。\n\n資料表：\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["customer": "Alice", "order_id": "1", "amount": "1200", "order_date": "2026-01-10"],
                                    ["customer": "Bob", "order_id": "2", "amount": "850", "order_date": "2026-01-12"],
                                    ["customer": "Alice", "order_id": "3", "amount": "2300", "order_date": "2026-01-15"],
                                ],
                                dataCaption: "預期結果（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["INNER JOIN 的語法：FROM table1 INNER JOIN table2 ON table1.key = table2.key", "用 ON 指定連接條件：orders 的 customer_id 對應 customers 的 id"],
                            explanation: "INNER JOIN 只會回傳兩張表中有匹配的行。這裡用 ON o.customer_id = c.id 把訂單和客戶連起來。如果某個客戶沒有訂單，或某筆訂單的 customer_id 不存在，都不會出現在結果中。這是最基本也最常用的 JOIN 類型。",
                            frameworkTip: "面試中遇到「合併兩張表」的需求，先確認用什麼欄位連接（外鍵關係），再決定用 INNER 還是 LEFT JOIN",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT c.name, o.amount, o.order_date
                                FROM orders o
                                -- 用 INNER JOIN 連接客戶表
                                ORDER BY o.order_date;
                            """,
                            expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o INNER JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;"
                        ),
                        Challenge(
                            id: 2,
                            name: "LEFT JOIN 找缺失",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出所有沒有下過任何訂單的客戶，顯示客戶名稱和 email。",
                            scenario: Challenge.Scenario(
                                title: "找出沒有下單的客戶",
                                narrative: "行銷團隊想針對從未下單的客戶發送促銷郵件。你需要找出在客戶表中有資料、但在訂單表中沒有任何記錄的客戶。這是 LEFT JOIN + IS NULL 的經典應用。\n\n資料表：\n- customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN 會保留左表的所有行，右表沒有匹配的會填 NULL", "用 WHERE o.id IS NULL 篩選出右表沒有匹配的行，就是「沒有訂單」的客戶"],
                            explanation: "LEFT JOIN 保留左表（customers）的所有行。對於沒有訂單的客戶，orders 那邊的欄位全部會是 NULL。接著用 WHERE o.id IS NULL 篩選出這些行，就能找到「沒有下單的客戶」。這是 SQL 中找「不存在」關聯的經典模式，比用 NOT IN 子查詢更有效率。",
                            frameworkTip: "「找缺失」的需求（沒下單的客戶、沒參加活動的用戶）在面試中非常常見，LEFT JOIN + IS NULL 是標準解法",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT c.name, c.email
                                FROM customers c
                                -- 用什麼 JOIN？
                                -- 怎麼篩選「沒有訂單」的客戶？
                            """,
                            expectedQuery: "SELECT c.name, c.email FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;"
                        ),
                        Challenge(
                            id: 3,
                            name: "三表 JOIN",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，列出每筆訂單明細：客戶名稱、訂單日期、商品名稱、數量和小計（quantity * unit_price），按訂單日期排序。",
                            scenario: Challenge.Scenario(
                                title: "訂單明細完整報表",
                                narrative: "財務部門需要一份完整的訂單明細報表，包含客戶資訊、訂單資訊和商品資訊。這些資料分散在三張表中，你需要用多個 JOIN 把它們串起來。\n\n資料表：\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT)\n- order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["三表 JOIN 就是連續寫兩個 JOIN：先連一張，再連下一張", "order_items 透過 order_id 連到 orders，orders 再透過 customer_id 連到 customers", "小計可以直接用算式：oi.quantity * oi.unit_price AS subtotal"],
                            explanation: "多表 JOIN 的關鍵是找出表之間的連接路徑。order_items 透過 order_id 連到 orders，orders 再透過 customer_id 連到 customers。寫法就是連續的 JOIN ... ON ...。實務中常見 3~5 張表的 JOIN，重點是理清楚每張表的主鍵和外鍵關係。",
                            frameworkTip: "多表 JOIN 的面試技巧：先畫出 ER 關係圖（表之間的連線），再依序寫 JOIN，可以避免遺漏",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT c.name, o.order_date, oi.product_name, oi.quantity,
                                       -- 計算小計
                                FROM order_items oi
                                -- JOIN 訂單表
                                -- JOIN 客戶表
                                ORDER BY o.order_date, oi.id;
                            """,
                            expectedQuery: "SELECT c.name, o.order_date, oi.product_name, oi.quantity, oi.quantity * oi.unit_price AS subtotal FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date, oi.id;"
                        ),
                        Challenge(
                            id: 4,
                            name: "自連接：績效成長偵測",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出業績比前一天高的日期，顯示該天的 id、日期和業績。",
                            scenario: Challenge.Scenario(
                                title: "哪些天的業績比前一天高？",
                                narrative: "營運主管想知道哪些天的門市業績比前一天成長了。你手上有每日業績記錄表，需要用自連接（Self-Join）找出「當天業績 > 前一天業績」的日期。\n\n資料表：\n- daily_metrics (id INTEGER, record_date TEXT, revenue REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["自連接就是把同一張表 JOIN 自己，用不同的別名（t1, t2）", "SQLite 的 date() 函數可以做日期計算：date(record_date, '+1 day') 代表後一天"],
                            explanation: "自連接（Self-Join）是把同一張表視為兩張表來比較。這裡 t1 代表「今天」，t2 代表「昨天」，用 date(t1.record_date) = date(t2.record_date, '+1 day') 建立「今天 = 昨天 +1 天」的關聯。接著用 WHERE t1.revenue > t2.revenue 篩出成長的天數。這是經典的「跟前一筆比較」模式，在趨勢分析中很常用。",
                            frameworkTip: "自連接的關鍵是想清楚「誰跟誰比」：先定義 t1 是什麼角色、t2 是什麼角色，再用 ON 描述它們的關聯",
                            sampleSchema: """
                                CREATE TABLE daily_metrics (id INTEGER, record_date TEXT, revenue REAL);
                                INSERT INTO daily_metrics VALUES (1, '2026-03-01', 12000.00);
                                INSERT INTO daily_metrics VALUES (2, '2026-03-02', 9500.00);
                                INSERT INTO daily_metrics VALUES (3, '2026-03-03', 15000.00);
                                INSERT INTO daily_metrics VALUES (4, '2026-03-04', 14800.00);
                                INSERT INTO daily_metrics VALUES (5, '2026-03-05', 18200.00);
                                INSERT INTO daily_metrics VALUES (6, '2026-03-06', 16000.00);
                                INSERT INTO daily_metrics VALUES (7, '2026-03-07', 20100.00);
                            """,
                            starterCode: """
                                SELECT t1.id, t1.record_date, t1.revenue
                                FROM daily_metrics t1
                                -- 自連接：把今天跟昨天比
                                WHERE t1.revenue > -- 昨天的業績
                                ORDER BY t1.record_date;
                            """,
                            expectedQuery: "SELECT t1.id, t1.record_date, t1.revenue FROM daily_metrics t1 JOIN daily_metrics t2 ON date(t1.record_date) = date(t2.record_date, '+1 day') WHERE t1.revenue > t2.revenue ORDER BY t1.record_date;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Cross Join + Left Join 組合",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，顯示每位員工對每門課的完成次數。沒修過的課程顯示 0。",
                            scenario: Challenge.Scenario(
                                title: "員工培訓完成度報表",
                                narrative: "HR 主管需要一份報表：每位員工對每門培訓課程的完成狀況。即使某員工沒修某門課，也要在報表中顯示（完成次數為 0）。這需要先用 CROSS JOIN 產生所有組合，再用 LEFT JOIN 帶入實際完成資料。\n\n資料表：\n- employees (id INTEGER, name TEXT)\n- courses (id INTEGER, course_name TEXT)\n- completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CROSS JOIN 會產生兩張表的「全排列組合」（3 員工 x 3 課程 = 9 筆）", "LEFT JOIN completions 時要同時匹配 employee_id 和 course_id", "COUNT(comp.id) 只會計算非 NULL 的值，所以沒完成的課程會是 0"],
                            explanation: "CROSS JOIN + LEFT JOIN 是產生「完整矩陣報表」的經典模式。CROSS JOIN 先建立所有員工與課程的組合（確保每個組合都有一行），LEFT JOIN 再帶入實際的完成記錄。COUNT(comp.id) 只計算有匹配的行，沒有完成的自然是 0。這在實務中非常常用：出勤報表、考試成績、產品 x 地區銷售矩陣等。",
                            frameworkTip: "面試遇到「即使沒有資料也要顯示」的需求，想到 CROSS JOIN 建骨架 + LEFT JOIN 填資料，是一個強力的解題模式",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT e.name, c.course_name,
                                       -- 怎麼計算完成次數（沒完成的要是 0）？
                                       AS completion_count
                                FROM employees e
                                -- 先產生所有員工 x 課程組合
                                -- 再 LEFT JOIN 完成記錄
                                GROUP BY e.id, c.id
                                ORDER BY e.name, c.course_name;
                            """,
                            expectedQuery: "SELECT e.name, c.course_name, COUNT(comp.id) AS completion_count FROM employees e CROSS JOIN courses c LEFT JOIN completions comp ON e.id = comp.employee_id AND c.id = comp.course_id GROUP BY e.id, c.id ORDER BY e.name, c.course_name;"
                        ),
                        Challenge(
                            id: 6,
                            name: "LEFT JOIN + 條件聚合",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，計算每位用戶的驗證成功率（保留兩位小數），沒有驗證記錄的用戶顯示 0.00。",
                            scenario: Challenge.Scenario(
                                title: "用戶驗證成功率分析",
                                narrative: "產品團隊在分析用戶身分驗證流程的效果。每位用戶可能發起多次驗證請求，每次結果是 confirmed 或 timeout。PM 想知道每位用戶的「驗證成功率」：confirmed 次數 / 總驗證次數。沒有發起過驗證的用戶，成功率顯示 0.00。\n\n資料表：\n- signups (user_id INTEGER, signup_date TEXT)\n- confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT)\n  action 欄位值為 confirmed 或 timeout",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN 確保沒有驗證記錄的用戶也會出現", "SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) 計算成功次數", "NULLIF(COUNT(c.id), 0) 避免除以 0，再用 COALESCE 把 NULL 轉成 0.00"],
                            explanation: "這題結合了 LEFT JOIN（保留所有用戶）、CASE WHEN（條件計數）、NULLIF（避免除以零）和 COALESCE（處理 NULL）四個技巧。LEFT JOIN 確保沒有驗證記錄的用戶也出現，CASE WHEN 在聚合中做條件計數，NULLIF 避免除以 0 的錯誤，COALESCE 把沒有記錄的用戶設為 0.00。這種「比率計算」模式在轉換率、完成率等分析中非常常見。",
                            frameworkTip: "計算比率時的防禦性寫法：COALESCE(成功數 / NULLIF(總數, 0), 0) -- 同時處理「沒有分母」和「分母為零」的情況",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT s.user_id,
                                       -- 計算驗證成功率，沒有記錄的顯示 0.00
                                       AS confirmation_rate
                                FROM signups s
                                -- 用什麼 JOIN？
                                GROUP BY s.user_id
                                ORDER BY s.user_id;
                            """,
                            expectedQuery: "SELECT s.user_id, ROUND(COALESCE(1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(c.id), 0), 0.00), 2) AS confirmation_rate FROM signups s LEFT JOIN confirmations c ON s.user_id = c.user_id GROUP BY s.user_id ORDER BY s.user_id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-2",
                    name: "條件邏輯與 NULL 處理",
                    description: "CASE WHEN、COALESCE 與 NULL 陷阱，讓查詢更靈活",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CASE WHEN 分類",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，為每位客戶加上 spending_tier 欄位：total_spent >= 10000 為 \"VIP\"、>= 3000 為 \"一般\"、其餘為 \"新客\"。按 total_spent 由大到小排序。",
                            scenario: Challenge.Scenario(
                                title: "客戶消費等級分類",
                                narrative: "行銷部門想將客戶依照累計消費金額分成三個等級：VIP（消費 >= 10000）、一般（消費 >= 3000）、新客（消費 < 3000）。你需要用 CASE WHEN 來建立分類欄位。\n\n資料表：\n- customer_spending (customer_id INTEGER, name TEXT, total_spent REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CASE WHEN 的條件會由上往下逐一判斷，第一個符合的就會被選中", "因為從大到小判斷，>= 10000 先判斷，通過的就不會再判斷 >= 3000", "不符合任何條件的會走到 ELSE"],
                            explanation: "CASE WHEN 是 SQL 中的條件表達式，類似程式語言的 if-else。條件由上往下判斷，第一個符合的就回傳對應值。這裡先判斷 >= 10000（VIP），再判斷 >= 3000（一般），其餘歸為新客。CASE WHEN 在資料分析中非常實用，常用於分群、標籤化和建立衍生欄位。",
                            frameworkTip: "面試中用 CASE WHEN 展示「資料分群」能力，是加分項目。記得考慮邊界值和 NULL 的情況",
                            sampleSchema: """
                                CREATE TABLE customer_spending (customer_id INTEGER, name TEXT, total_spent REAL);
                                INSERT INTO customer_spending VALUES (1, 'Alice', 15200.00);
                                INSERT INTO customer_spending VALUES (2, 'Bob', 4800.00);
                                INSERT INTO customer_spending VALUES (3, 'Charlie', 1200.00);
                                INSERT INTO customer_spending VALUES (4, 'Diana', 32000.00);
                                INSERT INTO customer_spending VALUES (5, 'Eve', 890.00);
                                INSERT INTO customer_spending VALUES (6, 'Frank', 7600.00);
                            """,
                            starterCode: """
                                SELECT name, total_spent,
                                       CASE
                                         -- 依金額分三個等級
                                       END AS spending_tier
                                FROM customer_spending
                                ORDER BY total_spent DESC;
                            """,
                            expectedQuery: "SELECT name, total_spent, CASE WHEN total_spent >= 10000 THEN 'VIP' WHEN total_spent >= 3000 THEN '一般' ELSE '新客' END AS spending_tier FROM customer_spending ORDER BY total_spent DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "NULL 處理",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL：(1) 使用 COALESCE 將 NULL 的 phone 替換為 \"未提供\"；(2) 計算每個部門缺少電話的人數和總人數。",
                            scenario: Challenge.Scenario(
                                title: "員工聯絡資訊清理",
                                narrative: "人資部門在整理員工聯絡資訊，發現有些員工的 phone 或 email 欄位是 NULL。主管需要一份報表，如果 phone 是 NULL 就顯示 \"未提供\"，並計算每個部門有多少員工缺少電話號碼。\n\n資料表：\n- employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COALESCE(phone, \"未提供\") 可以把 NULL 替換為預設值", "計算 NULL 數量可以用 SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END)", "COUNT(phone) 只會計算非 NULL 的值，所以 COUNT(*) - COUNT(phone) 也能得到 NULL 數量"],
                            explanation: "COALESCE 接受多個參數，回傳第一個非 NULL 的值，是處理 NULL 的標準工具。計算 NULL 數量有兩種方法：(1) SUM(CASE WHEN col IS NULL THEN 1 ELSE 0 END)，(2) COUNT(*) - COUNT(col)。兩者結果相同，但 CASE WHEN 方式更有彈性，可以同時處理多種條件。",
                            frameworkTip: "NULL 處理是面試中的高頻考點。記住：NULL 不等於空字串，NULL 參與任何比較都是 NULL，要用 IS NULL / IS NOT NULL",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT);
                                INSERT INTO employees VALUES (1, 'Alice', '工程部', '0912345678', 'alice@corp.com');
                                INSERT INTO employees VALUES (2, 'Bob', '工程部', NULL, 'bob@corp.com');
                                INSERT INTO employees VALUES (3, 'Charlie', '行銷部', '0923456789', NULL);
                                INSERT INTO employees VALUES (4, 'Diana', '行銷部', NULL, 'diana@corp.com');
                                INSERT INTO employees VALUES (5, 'Eve', '工程部', '0934567890', 'eve@corp.com');
                                INSERT INTO employees VALUES (6, 'Frank', '行銷部', NULL, NULL);
                                INSERT INTO employees VALUES (7, 'Grace', '人資部', NULL, 'grace@corp.com');
                                INSERT INTO employees VALUES (8, 'Henry', '人資部', '0956789012', 'henry@corp.com');
                            """,
                            starterCode: """
                                SELECT department,
                                       COUNT(*) AS total_employees,
                                       -- 計算缺少電話的人數
                                       -- 提示：phone IS NULL 的數量
                                FROM employees
                                GROUP BY department
                                ORDER BY department;
                            """,
                            expectedQuery: "SELECT department, COUNT(*) AS total_employees, SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS missing_phone_count FROM employees GROUP BY department ORDER BY department;"
                        ),
                        Challenge(
                            id: 3,
                            name: "NULL 陷阱",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 SQL 的結果數量是正確的？\n\nSELECT COUNT(*) FROM scores; -- 結果 A\nSELECT COUNT(math_score) FROM scores; -- 結果 B\nSELECT * FROM scores WHERE math_score != 85; -- 結果 C\nSELECT * FROM scores WHERE math_score IS NULL OR math_score != 85; -- 結果 D",
                            scenario: Challenge.Scenario(
                                title: "SQL 中的 NULL 行為測驗",
                                narrative: "在 SQL 中，NULL 代表「未知值」，它的行為和一般值很不同。很多初學者在這裡踩坑。以下是一張包含 NULL 的表：\n\nscores (student TEXT, math_score INTEGER, english_score INTEGER)\n\n| student | math_score | english_score |\n|---------|-----------|---------------|\n| Alice   | 85        | 90            |\n| Bob     | NULL      | 75            |\n| Charlie | 70        | NULL          |\n| Diana   | NULL      | NULL          |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A=4, B=4, C=2, D=3", explanation: "錯誤。COUNT(math_score) 不計算 NULL，所以 B 不是 4"),
                                Challenge.Option(id: "B", text: "A=4, B=2, C=1, D=3", explanation: "正確！COUNT(*) 計所有行 =4；COUNT(math_score) 只計非 NULL =2；!= 85 不含 NULL 行 =1（只有 Charlie）；加上 IS NULL 才能撈到 Bob 和 Diana =3"),
                                Challenge.Option(id: "C", text: "A=4, B=2, C=2, D=4", explanation: "錯誤。math_score != 85 不會選到 NULL 的行，C 只有 1 行"),
                                Challenge.Option(id: "D", text: "A=4, B=2, C=3, D=3", explanation: "錯誤。NULL != 85 的結果是 NULL（不是 TRUE），所以 C 不是 3"),
                            ],
                            correctAnswer: "B",
                            hints: ["COUNT(*) 計算所有行，COUNT(column) 只計算該欄位非 NULL 的行", "NULL 參與任何比較運算（=, !=, >, <）結果都是 NULL，不是 TRUE 也不是 FALSE", "WHERE 只保留條件為 TRUE 的行，NULL 和 FALSE 的行都會被過濾掉"],
                            explanation: "NULL 的核心概念是「未知值」。COUNT(*) 計所有行不管內容；COUNT(col) 跳過 NULL。最大陷阱：NULL != 85 的結果是 NULL（未知），不是 TRUE，所以 WHERE math_score != 85 不會回傳 NULL 行。要包含 NULL 行必須明確寫 IS NULL。這是面試中非常高頻的考點。",
                            frameworkTip: "面試中遇到 NULL 問題，三個關鍵記住：(1) NULL 不等於任何值包括 NULL 本身 (2) 用 IS NULL 不用 = NULL (3) 聚合函數通常忽略 NULL"
                        ),
                        Challenge(
                            id: 4,
                            name: "CASE WHEN 數學判斷",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，判斷每筆貨物的三邊是否能構成三角形，標記為 Yes 或 No。",
                            scenario: Challenge.Scenario(
                                title: "包裝尺寸可行性檢查",
                                narrative: "物流團隊收到一批貨物的三邊尺寸資料，需要判斷哪些貨物可以裝進三角形截面的特殊包裝盒。三角形成立的條件是：任意兩邊之和大於第三邊。你需要幫他們標記每筆貨物的三邊是否能構成三角形。\n\n資料表：\n- packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["三角形成立需要同時滿足三個條件，用 AND 連接", "a + b > c 且 a + c > b 且 b + c > a"],
                            explanation: "CASE WHEN 不只能做分類，也能做數學判斷。三角形不等式要求三個條件同時成立：任意兩邊之和必須大於第三邊。這裡用 AND 把三個條件串起來，全部為真才標記 Yes。這種「業務規則 -> SQL 條件」的轉換能力在實務中很重要：信用評分規則、庫存預警條件、合規性檢查等都用類似的邏輯。",
                            frameworkTip: "把業務規則翻譯成 SQL 條件時，先列出所有需要滿足的條件，再決定是 AND（全部要滿足）還是 OR（任一即可）",
                            sampleSchema: """
                                CREATE TABLE packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT);
                                INSERT INTO packages VALUES (1, 10.0, 15.0, 12.0, '精密儀器 A');
                                INSERT INTO packages VALUES (2, 3.0, 4.0, 8.0, '長條零件 B');
                                INSERT INTO packages VALUES (3, 7.0, 7.0, 7.0, '立方體零件 C');
                                INSERT INTO packages VALUES (4, 1.0, 2.0, 3.0, '薄片零件 D');
                                INSERT INTO packages VALUES (5, 5.0, 8.0, 6.0, '標準零件 E');
                                INSERT INTO packages VALUES (6, 20.0, 5.0, 10.0, '異形零件 F');
                            """,
                            starterCode: """
                                SELECT id, item_name, side_a, side_b, side_c,
                                       CASE
                                         -- 三角形成立條件：任意兩邊之和 > 第三邊
                                       END AS is_triangle
                                FROM packages
                                ORDER BY id;
                            """,
                            expectedQuery: "SELECT id, item_name, side_a, side_b, side_c, CASE WHEN side_a + side_b > side_c AND side_a + side_c > side_b AND side_b + side_c > side_a THEN 'Yes' ELSE 'No' END AS is_triangle FROM packages ORDER BY id;"
                        ),
                        Challenge(
                            id: 5,
                            name: "CASE WHEN + 子查詢：主要歸屬判斷",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出每位員工的主要部門。",
                            scenario: Challenge.Scenario(
                                title: "員工主要部門歸屬",
                                narrative: "公司有些員工同時屬於多個部門（跨部門專案），HR 系統有標記哪個是主要部門（primary_flag = Y）。但有些員工只屬於一個部門，這種情況沒有標記 primary_flag。\n\nHR 主管需要一份「每位員工的主要部門」清單：\n- 如果有標記 primary_flag = Y，就用那個部門\n- 如果只屬於一個部門，那就是主要部門\n\n資料表：\n- employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["兩種情況用 OR 串接：有標記的 + 只有一個部門的", "用子查詢找出「只屬於一個部門的員工」：GROUP BY employee_id HAVING COUNT(*) = 1"],
                            explanation: "這題的關鍵是處理兩種不同的情況：(1) 有明確標記 primary_flag = 'Y' 的員工，直接取該部門 (2) 只屬於一個部門的員工（沒有標記的），用子查詢 HAVING COUNT(*) = 1 找出來。兩個條件用 OR 合併。這種「分情況處理」的邏輯在實務中很常見：不同類型的用戶有不同的判斷規則。",
                            frameworkTip: "遇到「多種情況」的題目，先列出所有情況，再逐一寫出對應的 WHERE 條件，最後用 OR / UNION 合併",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT employee_id, department
                                FROM employee_dept
                                WHERE -- 怎麼同時處理「有標記」和「只有一個部門」的情況？
                                ORDER BY employee_id;
                            """,
                            expectedQuery: "SELECT employee_id, department FROM employee_dept WHERE primary_flag = 'Y' OR employee_id IN (SELECT employee_id FROM employee_dept GROUP BY employee_id HAVING COUNT(*) = 1) ORDER BY employee_id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-3",
                    name: "子查詢",
                    description: "掌握 WHERE IN、相關子查詢和 EXISTS 的使用時機",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "WHERE IN 子查詢",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，用 WHERE IN 子查詢找出所有曾被退貨的商品，顯示商品名稱、類別和價格。",
                            scenario: Challenge.Scenario(
                                title: "找出有退貨記錄的商品",
                                narrative: "品管團隊想了解哪些商品曾經被退貨。退貨記錄在 returns 表中，商品資訊在 products 表中。你需要用子查詢找出在退貨表中出現過的商品。\n\n資料表：\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["WHERE IN (子查詢) 可以篩選「存在於子查詢結果中」的行", "子查詢需要從 returns 表中取出所有被退貨的 product_id", "加上 DISTINCT 可以避免子查詢回傳重複值（雖然 IN 本身不受影響）"],
                            explanation: "WHERE IN (子查詢) 是最直覺的子查詢用法：先用子查詢找出一組值，再用外部查詢篩選匹配的行。這裡子查詢從 returns 表取出所有 product_id，外部查詢再從 products 中篩選。這種模式適合「找出符合某個條件的相關資料」。",
                            frameworkTip: "面試中 WHERE IN 子查詢是基本功，但要注意：當子查詢結果很大時，效能可能不如 JOIN 或 EXISTS",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT name, category, price
                                FROM products
                                WHERE id IN (
                                  -- 子查詢：找出被退貨的商品 id
                                );
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE id IN (SELECT DISTINCT product_id FROM returns);"
                        ),
                        Challenge(
                            id: 2,
                            name: "相關子查詢",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，用相關子查詢找出每個部門中薪資最高的員工，顯示姓名、部門和薪資。",
                            scenario: Challenge.Scenario(
                                title: "找出每個部門薪資最高的員工",
                                narrative: "人資主管想知道每個部門中薪資最高的員工是誰。這需要用相關子查詢（Correlated Subquery）：子查詢會參考外部查詢的值，對每一行重新計算。\n\n資料表：\n- staff (id INTEGER, name TEXT, department TEXT, salary REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["相關子查詢的特點：子查詢中會用到外部查詢的欄位（例如 s1.department）", "子查詢找同部門的 MAX(salary)，外部查詢篩選 salary 等於該值的行", "如果同部門有多人並列最高薪，都會被選出來"],
                            explanation: "相關子查詢和普通子查詢的差別在於：子查詢參考了外部查詢的值（s1.department）。資料庫會對外部的每一行，用該行的 department 值去執行子查詢。雖然概念上像巢狀迴圈，但資料庫引擎會自動最佳化。這是找「每組最大/最小值對應行」的經典模式。",
                            frameworkTip: "相關子查詢在面試中常考「每組 Top N」問題。替代方案包括：(1) JOIN + GROUP BY (2) 視窗函數 ROW_NUMBER()，建議都會",
                            sampleSchema: """
                                CREATE TABLE staff (id INTEGER, name TEXT, department TEXT, salary REAL);
                                INSERT INTO staff VALUES (1, 'Alice', '工程部', 85000.00);
                                INSERT INTO staff VALUES (2, 'Bob', '工程部', 72000.00);
                                INSERT INTO staff VALUES (3, 'Charlie', '行銷部', 68000.00);
                                INSERT INTO staff VALUES (4, 'Diana', '行銷部', 75000.00);
                                INSERT INTO staff VALUES (5, 'Eve', '工程部', 91000.00);
                                INSERT INTO staff VALUES (6, 'Frank', '人資部', 65000.00);
                                INSERT INTO staff VALUES (7, 'Grace', '人資部', 70000.00);
                            """,
                            starterCode: """
                                SELECT name, department, salary
                                FROM staff s1
                                WHERE salary = (
                                  -- 子查詢：找出同部門的最高薪資
                                  -- 提示：子查詢要參考外部的 s1.department
                                );
                            """,
                            expectedQuery: "SELECT name, department, salary FROM staff s1 WHERE salary = (SELECT MAX(salary) FROM staff s2 WHERE s2.department = s1.department);"
                        ),
                        Challenge(
                            id: 3,
                            name: "EXISTS vs IN",
                            type: .code,
                            difficulty: .medium,
                            question: "用 EXISTS 子查詢找出有活躍訂閱的客戶，顯示客戶名稱和 email。",
                            scenario: Challenge.Scenario(
                                title: "找出有活躍訂閱的客戶",
                                narrative: "營運團隊需要找出目前有至少一筆「活躍」訂閱的客戶。訂閱狀態為 \"active\" 的才算。相比 IN，EXISTS 在子查詢返回大量資料時通常更有效率，因為它找到第一筆匹配就停止。\n\n資料表：\n- customers (id INTEGER, name TEXT, email TEXT)\n- subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["EXISTS 只檢查「子查詢是否回傳至少一行」，找到就立刻回傳 TRUE", "EXISTS 子查詢中的 SELECT 內容不重要（常寫 SELECT 1），重要的是 WHERE 條件", "子查詢需要同時比對 customer_id 和 status = \"active\""],
                            explanation: "EXISTS 檢查子查詢「是否有結果」，有就是 TRUE。和 IN 的差別：IN 先執行子查詢產生完整清單再比對；EXISTS 逐行檢查，找到匹配就停止。當子查詢結果很大、或需要多個條件時，EXISTS 通常效能更好。子查詢中 SELECT 1 只是慣例，寫 SELECT * 也一樣。",
                            frameworkTip: "EXISTS vs IN 的選擇：子查詢結果小用 IN 直觀，子查詢結果大或條件複雜用 EXISTS 效率好。面試中說明你的選擇理由是加分的",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT c.name, c.email
                                FROM customers c
                                WHERE EXISTS (
                                  -- 子查詢：檢查是否有活躍訂閱
                                  -- 提示：要同時匹配 customer_id 和 status
                                );
                            """,
                            expectedQuery: "SELECT c.name, c.email FROM customers c WHERE EXISTS (SELECT 1 FROM subscriptions s WHERE s.customer_id = c.id AND s.status = 'active');"
                        ),
                        Challenge(
                            id: 4,
                            name: "子查詢：找第二高的值",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，查詢第二高的薪資。如果不存在，回傳 NULL。",
                            scenario: Challenge.Scenario(
                                title: "第二高薪資查詢",
                                narrative: "HR 主管想知道公司裡第二高的薪資是多少，用來做薪資分級的參考基準。注意：如果沒有第二高的薪資（例如所有人薪資相同），應該回傳 NULL。\n\n資料表：\n- employees (id INTEGER, name TEXT, salary REAL, department TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用子查詢找出最高薪資，再找「小於最高薪資的最大值」", "MAX() 如果沒有符合的行，自然會回傳 NULL", "注意要用 DISTINCT 的概念：如果最高薪資有多人，第二高不是重複的那個"],
                            explanation: "「找第 N 高」是經典的子查詢題目。策略是：先用子查詢找出最高值 (SELECT MAX(salary))，再在外層查詢中找「小於最高值的最大值」。如果所有人薪資相同，WHERE salary < MAX 不會匹配到任何行，MAX() 自然回傳 NULL。這比 LIMIT + OFFSET 的解法更優雅，也更能展示你對子查詢的理解。",
                            frameworkTip: "面試中「找第 N 高」的題目，先說排除法（用子查詢排除前 N-1），再提 DENSE_RANK 的 window function 解法作為替代方案",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER, name TEXT, salary REAL, department TEXT);
                                INSERT INTO employees VALUES (1, 'Alice', 85000.00, 'Engineering');
                                INSERT INTO employees VALUES (2, 'Bob', 72000.00, 'Marketing');
                                INSERT INTO employees VALUES (3, 'Charlie', 85000.00, 'Engineering');
                                INSERT INTO employees VALUES (4, 'Diana', 95000.00, 'Product');
                                INSERT INTO employees VALUES (5, 'Eve', 68000.00, 'Sales');
                                INSERT INTO employees VALUES (6, 'Frank', 72000.00, 'Marketing');
                            """,
                            starterCode: """
                                SELECT
                                  -- 怎麼取得第二高的薪資？
                                  -- 如果不存在，要回傳 NULL
                                  AS second_highest_salary;
                            """,
                            expectedQuery: "SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);"
                        ),
                        Challenge(
                            id: 5,
                            name: "UNION 子查詢：雙維度排行",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，用 UNION 合併兩個查詢結果：(1) 評價數最多的用戶 (2) 2026-02 月平均評分最高的餐廳。",
                            scenario: Challenge.Scenario(
                                title: "餐廳評價分析報告",
                                narrative: "餐飲平台想做一份簡報，需要兩個資訊放在同一份結果中：\n1. 評價數量最多的用戶名稱\n2. 2026 年 2 月平均評分最高的餐廳名稱\n\n兩筆資料用 UNION 合併成一張表。\n\n資料表：\n- users (user_id INTEGER, name TEXT)\n- restaurants (restaurant_id INTEGER, name TEXT)\n- reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL 合併兩個 SELECT 結果，要求欄位數量和型態一致", "每個子查詢要用 ORDER BY + LIMIT 1 找到「最多/最高」的那一筆", "平手時用名字字母排序（ORDER BY name）作為決勝條件"],
                            explanation: "UNION ALL 可以把兩個完全不同的查詢結果合併成一張表，前提是欄位數量和型態要一致。這裡第一個查詢找評價最多的用戶，第二個找特定月份平均評分最高的餐廳。每個子查詢各自做 JOIN + GROUP BY + ORDER BY + LIMIT。這種「多維度排行」的需求在產品報告中很常見：同時呈現不同角度的 Top 1。",
                            frameworkTip: "UNION 的兩個 SELECT 必須有相同數量和相容型態的欄位。欄位名稱以第一個 SELECT 為準。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                -- 第一部分：評價數最多的用戶
                                SELECT -- ...

                                UNION ALL

                                -- 第二部分：2026-02 月平均評分最高的餐廳
                                SELECT -- ...;
                            """,
                            expectedQuery: "SELECT u.name AS result FROM users u JOIN reviews r ON u.user_id = r.user_id GROUP BY u.user_id ORDER BY COUNT(*) DESC, u.name LIMIT 1 UNION ALL SELECT rest.name AS result FROM restaurants rest JOIN reviews r ON rest.restaurant_id = r.restaurant_id WHERE substr(r.review_date, 1, 7) = '2026-02' GROUP BY rest.restaurant_id ORDER BY AVG(r.rating) DESC, rest.name LIMIT 1;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-4",
                    name: "CTE 與多層查詢",
                    description: "用 WITH 子句讓複雜查詢更清晰、更可讀",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 CTE",
                            type: .code,
                            difficulty: .medium,
                            question: "用 CTE 先計算每位客戶的總消費，再從中篩選出總消費超過所有客戶平均總消費的客戶。",
                            scenario: Challenge.Scenario(
                                title: "用 CTE 重寫客戶消費統計",
                                narrative: "你需要找出消費金額超過平均值的客戶。用子查詢寫會比較難讀，CTE（Common Table Expression）可以把計算步驟拆開，讓邏輯更清楚。\n\n資料表：\n- orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CTE 用 WITH name AS (...) 定義，之後可以像一般表一樣使用", "平均值可以用子查詢：SELECT AVG(total_spent) FROM customer_totals", "CTE 的好處是可以在主查詢和子查詢中重複引用同一個 CTE"],
                            explanation: "CTE 把複雜查詢拆成有名稱的步驟：先在 customer_totals 中計算每位客戶的總消費，再在主查詢中篩選超過平均的客戶。CTE 的一大優勢是可以被引用多次（這裡主查詢和子查詢都用了 customer_totals），避免重複寫相同的子查詢。這讓查詢更易讀、更好維護。",
                            frameworkTip: "面試中遇到複雜查詢，主動說「我用 CTE 讓邏輯更清楚」能展現你的程式碼品質意識",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT);
                                INSERT INTO orders VALUES (1, 1, 'Alice', 3200.00, '2026-01-10');
                                INSERT INTO orders VALUES (2, 2, 'Bob', 1500.00, '2026-01-12');
                                INSERT INTO orders VALUES (3, 1, 'Alice', 2800.00, '2026-01-15');
                                INSERT INTO orders VALUES (4, 3, 'Charlie', 950.00, '2026-01-18');
                                INSERT INTO orders VALUES (5, 2, 'Bob', 4100.00, '2026-01-22');
                                INSERT INTO orders VALUES (6, 4, 'Diana', 1200.00, '2026-01-25');
                                INSERT INTO orders VALUES (7, 3, 'Charlie', 600.00, '2026-02-01');
                                INSERT INTO orders VALUES (8, 1, 'Alice', 1900.00, '2026-02-05');
                            """,
                            starterCode: """
                                WITH customer_totals AS (
                                  -- 第一步：計算每位客戶的總消費
                                  SELECT customer_id, customer_name,
                                         SUM(amount) AS total_spent
                                  FROM orders
                                  GROUP BY customer_id, customer_name
                                )
                                SELECT customer_name, total_spent
                                FROM customer_totals
                                WHERE total_spent > (
                                  -- 第二步：跟平均值比較
                                );
                            """,
                            expectedQuery: "WITH customer_totals AS (SELECT customer_id, customer_name, SUM(amount) AS total_spent FROM orders GROUP BY customer_id, customer_name) SELECT customer_name, total_spent FROM customer_totals WHERE total_spent > (SELECT AVG(total_spent) FROM customer_totals);"
                        ),
                        Challenge(
                            id: 2,
                            name: "多層 CTE",
                            type: .code,
                            difficulty: .medium,
                            question: "用多個 CTE 完成：(1) 計算每部門總營收 (2) 計算總公司營收 (3) 算出各部門佔比並排名。",
                            scenario: Challenge.Scenario(
                                title: "部門績效排名報表",
                                narrative: "管理層需要一份報表：先算出每個部門的月營收，再計算每個部門佔總營收的百分比，最後依百分比排名。這需要多層 CTE 逐步計算。\n\n資料表：\n- sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["多個 CTE 用逗號分隔：WITH cte1 AS (...), cte2 AS (...) SELECT ...", "第二個 CTE 可以引用第一個 CTE 的結果", "百分比計算：total_revenue * 100.0 / grand_total（用 100.0 確保浮點數除法）"],
                            explanation: "多層 CTE 的強大之處在於每一層可以引用前面的 CTE。dept_revenue 先算每部門營收，company_total 再從 dept_revenue 算總和，最後主查詢用兩個 CTE 算百分比。這種「步驟化」的寫法讓複雜的計算變得容易理解和除錯。注意 100.0 而不是 100，確保 SQLite 做浮點除法。",
                            frameworkTip: "多層 CTE 是處理「分層計算」的利器。面試中遇到需要「先算 A，再用 A 算 B」的問題，CTE 是首選",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH dept_revenue AS (
                                  -- 第一步：每部門總營收
                                  SELECT department, SUM(amount) AS total_revenue
                                  FROM sales
                                  GROUP BY department
                                ),
                                company_total AS (
                                  -- 第二步：總公司營收
                                  SELECT SUM(total_revenue) AS grand_total
                                  FROM dept_revenue
                                )
                                SELECT
                                  d.department,
                                  d.total_revenue,
                                  -- 第三步：計算百分比 (ROUND 到小數點後 1 位)
                                FROM dept_revenue d, company_total c
                                ORDER BY d.total_revenue DESC;
                            """,
                            expectedQuery: "WITH dept_revenue AS (SELECT department, SUM(amount) AS total_revenue FROM sales GROUP BY department), company_total AS (SELECT SUM(total_revenue) AS grand_total FROM dept_revenue) SELECT d.department, d.total_revenue, ROUND(d.total_revenue * 100.0 / c.grand_total, 1) AS revenue_pct FROM dept_revenue d, company_total c ORDER BY d.total_revenue DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "CTE + Window：移動平均",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，用 CTE + Window Function 計算每天的 7 天移動平均營收（保留兩位小數）。",
                            scenario: Challenge.Scenario(
                                title: "7 天移動平均營收",
                                narrative: "財務主管想看每天的「7 天移動平均營收」，用來平滑每日的波動，觀察長期趨勢。移動平均的定義是：該天往前算 7 天（含當天）的平均日營收。只顯示有足夠 7 天資料的日期。\n\n資料表：\n- daily_revenue (visit_date TEXT, revenue REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了 7 天的窗口", "用 ROW_NUMBER() 編號，WHERE rn >= 7 確保只顯示有完整 7 天資料的日期", "AVG() OVER (...) 可以在窗口內計算平均值"],
                            explanation: "移動平均是時間序列分析的基礎工具。Window Function 的 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW 定義了一個滑動窗口：從前 6 行到當前行（共 7 行）。AVG(revenue) OVER (...) 在這個窗口內算平均。CTE 先計算所有行的移動平均和行號，外層用 WHERE rn >= 7 確保只顯示有完整 7 天資料的結果。這在營運 dashboard 中非常常用。",
                            frameworkTip: "ROWS BETWEEN N PRECEDING AND CURRENT ROW 是定義移動窗口的標準寫法。面試中提到「移動平均」時，秀出這個語法會讓人印象深刻",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH moving AS (
                                  SELECT visit_date, revenue,
                                         -- 用 Window Function 計算 7 天移動平均
                                         AS avg_7d,
                                         ROW_NUMBER() OVER (ORDER BY visit_date) AS rn
                                  FROM daily_revenue
                                )
                                SELECT visit_date, revenue,
                                       ROUND(avg_7d, 2) AS moving_avg_7d
                                FROM moving
                                WHERE rn >= 7
                                ORDER BY visit_date;
                            """,
                            expectedQuery: "WITH moving AS (SELECT visit_date, revenue, AVG(revenue) OVER (ORDER BY visit_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg_7d, ROW_NUMBER() OVER (ORDER BY visit_date) AS rn FROM daily_revenue) SELECT visit_date, revenue, ROUND(avg_7d, 2) AS moving_avg_7d FROM moving WHERE rn >= 7 ORDER BY visit_date;"
                        ),
                        Challenge(
                            id: 4,
                            name: "CTE + UNION：雙向關係統計",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出合作夥伴最多的員工 ID 和合作夥伴數量。",
                            scenario: Challenge.Scenario(
                                title: "找出最多合作夥伴的員工",
                                narrative: "公司有一個「專案配對」系統，記錄了哪些員工曾經一起合作過專案。配對是雙向的：如果 A 跟 B 合作，代表 B 也跟 A 合作。管理層想知道哪位員工的合作夥伴最多（社交網絡最廣）。\n\n資料表：\n- project_pairs (requester_id INTEGER, accepter_id INTEGER)\n  每筆記錄代表 requester 發起合作邀請，accepter 接受",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["雙向關係的處理：把 requester_id 和 accepter_id 分別當作 employee_id，用 UNION ALL 合併", "每出現一次就代表有一個合作夥伴，COUNT(*) 就是夥伴數量", "ORDER BY ... DESC LIMIT 1 找到最多的那位"],
                            explanation: "雙向關係（如友誼、合作）在資料庫中通常只存一個方向。要計算每個人的「連接數」，需要把兩個方向都算進去。CTE 用 UNION ALL 把 requester_id 和 accepter_id 都轉成統一的 employee_id，這樣每次出現都代表一次合作關係。再用 GROUP BY + COUNT(*) 統計每人的合作夥伴數。這是社交網絡分析的基礎技巧。",
                            frameworkTip: "遇到雙向關係的題目，第一步永遠是用 UNION ALL 把兩個方向攤平成統一格式，然後再做聚合分析",
                            sampleSchema: """
                                CREATE TABLE project_pairs (requester_id INTEGER, accepter_id INTEGER);
                                INSERT INTO project_pairs VALUES (1, 2);
                                INSERT INTO project_pairs VALUES (1, 3);
                                INSERT INTO project_pairs VALUES (2, 3);
                                INSERT INTO project_pairs VALUES (3, 4);
                                INSERT INTO project_pairs VALUES (4, 5);
                                INSERT INTO project_pairs VALUES (1, 5);
                                INSERT INTO project_pairs VALUES (2, 4);
                            """,
                            starterCode: """
                                WITH all_connections AS (
                                  -- 把雙向關係攤平成單向
                                  -- UNION ALL 把 requester 和 accepter 都列出來
                                )
                                SELECT employee_id,
                                       COUNT(*) AS partner_count
                                FROM all_connections
                                GROUP BY employee_id
                                ORDER BY partner_count DESC
                                LIMIT 1;
                            """,
                            expectedQuery: "WITH all_connections AS (SELECT requester_id AS employee_id FROM project_pairs UNION ALL SELECT accepter_id AS employee_id FROM project_pairs) SELECT employee_id, COUNT(*) AS partner_count FROM all_connections GROUP BY employee_id ORDER BY partner_count DESC LIMIT 1;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-5",
                    name: "資料清理與品質檢查",
                    description: "找重複、檢查資料品質、合併資料集",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "找重複資料",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出重複的 email 及其出現次數，只顯示出現超過 1 次的。",
                            scenario: Challenge.Scenario(
                                title: "客戶名單去重",
                                narrative: "行銷團隊匯入了一批客戶資料，但懷疑有重複的 email。你需要找出哪些 email 出現超過一次，以便清理資料。\n\n資料表：\n- customer_list (id INTEGER, name TEXT, email TEXT, source TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY 之後的篩選要用 HAVING，不是 WHERE", "WHERE 在分組前篩選，HAVING 在分組後篩選", "HAVING COUNT(*) > 1 就能找出出現超過一次的"],
                            explanation: "找重複資料是資料清理的第一步。用 GROUP BY email 把相同 email 分組，COUNT(*) 計算每組的行數，再用 HAVING COUNT(*) > 1 只保留出現超過一次的。HAVING 和 WHERE 的區別：WHERE 在分組前過濾行，HAVING 在分組後過濾組。這是面試和實務中都非常常用的查詢模式。",
                            frameworkTip: "面試中展示你有「資料品質意識」是加分的。先檢查重複、NULL、異常值，再做分析，這是專業資料人員的標準流程",
                            sampleSchema: """
                                CREATE TABLE customer_list (id INTEGER, name TEXT, email TEXT, source TEXT);
                                INSERT INTO customer_list VALUES (1, 'Alice Chen', 'alice@example.com', '官網');
                                INSERT INTO customer_list VALUES (2, 'Bob Lin', 'bob@example.com', '展覽');
                                INSERT INTO customer_list VALUES (3, 'Alice C.', 'alice@example.com', '展覽');
                                INSERT INTO customer_list VALUES (4, 'Charlie Wu', 'charlie@example.com', '官網');
                                INSERT INTO customer_list VALUES (5, 'Diana Lee', 'diana@example.com', '推薦');
                                INSERT INTO customer_list VALUES (6, 'Bob', 'bob@example.com', '推薦');
                                INSERT INTO customer_list VALUES (7, 'Eve Wang', 'eve@example.com', '官網');
                                INSERT INTO customer_list VALUES (8, 'Alice', 'alice@example.com', '推薦');
                            """,
                            starterCode: """
                                SELECT email, COUNT(*) AS occurrence_count
                                FROM customer_list
                                GROUP BY email
                                -- 怎麼只保留重複的？
                            """,
                            expectedQuery: "SELECT email, COUNT(*) AS occurrence_count FROM customer_list GROUP BY email HAVING COUNT(*) > 1 ORDER BY occurrence_count DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "資料品質檢查",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL，找出所有有問題的訂單：金額 <= 0、或 customer_id 不存在於 customers 表中。顯示訂單 id、問題描述和相關欄位。",
                            scenario: Challenge.Scenario(
                                title: "訂單資料一致性檢查",
                                narrative: "資料工程師在維護訂單系統時，需要檢查資料品質：(1) 找出金額為負數或零的異常訂單 (2) 找出日期格式不正確的記錄 (3) 找出 customer_id 在客戶表中不存在的「孤兒」訂單。\n\n資料表：\n- customers (id INTEGER, name TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 CASE WHEN 標示不同的問題類型", "檢查「客戶不存在」可以用 NOT IN 子查詢或 LEFT JOIN + IS NULL", "WHERE 條件把兩種問題用 OR 連接"],
                            explanation: "資料品質檢查是資料工程的日常工作。這題結合了 CASE WHEN（標示問題類型）和 NOT IN 子查詢（檢查參照完整性）。實務中常見的品質問題包括：NULL 值過多、數值超出合理範圍、外鍵關聯失效、重複資料等。建立自動化的品質檢查查詢，可以及早發現問題。",
                            frameworkTip: "面試中提到「我會先做 data quality check」能展現你的嚴謹度。常見檢查：NULL 比例、重複率、數值分布、參照完整性",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT o.id AS order_id,
                                       CASE
                                         -- 判斷是哪種問題
                                       END AS issue_type,
                                       o.amount, o.customer_id
                                FROM orders o
                                WHERE -- 金額異常
                                   OR -- 客戶不存在
                                ORDER BY o.id;
                            """,
                            expectedQuery: "SELECT o.id AS order_id, CASE WHEN o.amount <= 0 THEN '金額異常' WHEN o.customer_id NOT IN (SELECT id FROM customers) THEN '客戶不存在' END AS issue_type, o.amount, o.customer_id FROM orders o WHERE o.amount <= 0 OR o.customer_id NOT IN (SELECT id FROM customers) ORDER BY o.id;"
                        ),
                        Challenge(
                            id: 3,
                            name: "UNION 合併資料",
                            type: .code,
                            difficulty: .easy,
                            question: "用 UNION ALL 合併兩個銷售表，加上 channel 欄位標示來源（\"線上\" / \"線下\"），按日期排序。",
                            scenario: Challenge.Scenario(
                                title: "合併線上線下銷售資料",
                                narrative: "公司有兩個銷售管道：線上商城和實體門市，各有自己的銷售表。管理層需要一份合併的報表，看到所有通路的銷售紀錄。\n\n資料表：\n- online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT)\n- offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL 合併所有結果（包含重複），UNION 會去重", "在 SELECT 中加常數值 \"線上\" AS channel 可以標示來源", "兩個 SELECT 的欄位數和類型要一致", "ORDER BY 放在最後，對整個合併結果排序"],
                            explanation: "UNION ALL 把兩個查詢的結果垂直合併（上下堆疊）。和 UNION 的差別：UNION 會去除重複行，UNION ALL 保留所有行（效能也更好）。這裡用常數 '線上'/'線下' AS channel 標示每筆資料的來源。注意 UNION 要求兩邊的欄位數和類型一致。ORDER BY 只能放在最後，對整個合併結果排序。",
                            frameworkTip: "實務中合併多來源資料是常見需求。UNION ALL 通常比 UNION 更常用（效能好、且你通常不想意外去重）",
                            sampleSchema: """
                                CREATE TABLE online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT);
                                INSERT INTO online_sales VALUES (1, '無線耳機', 1200.00, '2026-02-01');
                                INSERT INTO online_sales VALUES (2, '手機殼', 350.00, '2026-02-03');
                                INSERT INTO online_sales VALUES (3, '充電線', 180.00, '2026-02-05');
                                CREATE TABLE offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT);
                                INSERT INTO offline_sales VALUES (1, '藍牙喇叭', 2400.00, '2026-02-02', '台北店');
                                INSERT INTO offline_sales VALUES (2, '行動電源', 890.00, '2026-02-04', '台中店');
                                INSERT INTO offline_sales VALUES (3, '無線耳機', 1200.00, '2026-02-06', '高雄店');
                            """,
                            starterCode: """
                                SELECT product, amount, sale_date,
                                       -- 加上來源標示
                                FROM online_sales

                                UNION ALL

                                SELECT product, amount, sale_date,
                                       -- 加上來源標示
                                FROM offline_sales

                                ORDER BY sale_date;
                            """,
                            expectedQuery: "SELECT product, amount, sale_date, '線上' AS channel FROM online_sales UNION ALL SELECT product, amount, sale_date, '線下' AS channel FROM offline_sales ORDER BY sale_date;"
                        ),
                        Challenge(
                            id: 4,
                            name: "標記重複記錄（保留最小 ID）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一段 SQL，找出所有重複 email 中應該被移除的記錄（保留每組 id 最小的那筆，列出其餘的）。",
                            scenario: Challenge.Scenario(
                                title: "重複 Email 清理標記",
                                narrative: "在前面的挑戰中你已經找到了重複的 email。現在要進一步：找出應該被刪除的重複記錄。規則是「保留 id 最小的那筆，標記其他為重複」。你不會真的刪除資料（DELETE 太危險了），而是先查詢出所有應該被標記為重複的記錄。\n\n資料表：\n- contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 correlated subquery 找出同一 email 的最小 id", "WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email)", "如果 c1.id 大於同 email 的最小 id，代表它是重複的"],
                            explanation: "這是「去重保留最小 ID」的經典模式。Correlated subquery (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) 對每一行找出同 email 的最小 id。如果當前行的 id 大於這個最小值，就代表它是重複的、應該被移除。實務中，這個查詢通常是清理資料的第一步：先用 SELECT 確認要刪除的行，確認無誤後再改成 DELETE。",
                            frameworkTip: "資料清理的黃金法則：先用 SELECT 查出要處理的資料，人工確認後再執行 DELETE/UPDATE。面試中提到這個習慣，展示你對生產資料的謹慎態度",
                            sampleSchema: """
                                CREATE TABLE contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT);
                                INSERT INTO contacts VALUES (1, 'alice@mail.com', 'Alice', '2026-01-01');
                                INSERT INTO contacts VALUES (2, 'bob@mail.com', 'Bob', '2026-01-05');
                                INSERT INTO contacts VALUES (3, 'alice@mail.com', 'Alice Chen', '2026-01-10');
                                INSERT INTO contacts VALUES (4, 'charlie@mail.com', 'Charlie', '2026-01-12');
                                INSERT INTO contacts VALUES (5, 'bob@mail.com', 'Bob Wang', '2026-01-15');
                                INSERT INTO contacts VALUES (6, 'bob@mail.com', 'Bob Lee', '2026-01-20');
                                INSERT INTO contacts VALUES (7, 'diana@mail.com', 'Diana', '2026-01-22');
                            """,
                            starterCode: """
                                SELECT c1.id, c1.email, c1.name
                                FROM contacts c1
                                -- 怎麼找出「同 email 但 id 不是最小」的記錄？
                                ORDER BY c1.email, c1.id;
                            """,
                            expectedQuery: "SELECT c1.id, c1.email, c1.name FROM contacts c1 WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) ORDER BY c1.email, c1.id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-6",
                    name: "Boss: 資料整合分析",
                    description: "綜合運用 JOIN、CTE 和聚合，解決真實的資料整合問題",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "綜合 JOIN + CTE + 聚合",
                            type: .code,
                            difficulty: .hard,
                            question: "用 CTE + JOIN + CASE WHEN + 聚合完成客戶生命週期分析報表。",
                            scenario: Challenge.Scenario(
                                title: "客戶生命週期價值分析",
                                narrative: "經營團隊想了解不同客戶群的生命週期價值（LTV）。你需要：\n1. 從 orders 和 customers 表計算每位客戶的總消費和訂單數\n2. 用 CASE WHEN 依註冊天數分成「新客（<90天）」「中期（90-365天）」「老客（>365天）」\n3. 計算每個客群的平均 LTV、平均訂單數和客戶人數\n\n資料表：\n- customers (id INTEGER, name TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)\n\n假設今天是 2026-03-01。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["第一個 CTE 用 LEFT JOIN 確保沒有訂單的客戶也被計入（total_spent 用 COALESCE 處理 NULL）", "JULIANDAY 回傳天數，兩個日期相減就是間隔天數", "CASE WHEN 條件從小到大判斷：< 90 → 新客、<= 365 → 中期、ELSE → 老客", "最後用 GROUP BY segment 算每群的統計值"],
                            explanation: "這題綜合了 World 24 的所有核心技能：LEFT JOIN 連接客戶和訂單、CTE 分步計算、CASE WHEN 分群、聚合函數統計。關鍵設計：用 LEFT JOIN 確保沒有訂單的客戶也計入；COALESCE 處理 NULL；JULIANDAY 計算日期差；多層 CTE 讓每一步邏輯清晰。這是典型的「客戶分群分析」場景，在實務和面試中都非常常見。",
                            frameworkTip: "面試中的綜合題，先說「我會分幾個步驟」再逐步寫。用 CTE 展示清晰的思路比一口氣寫一大段更加分",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH customer_stats AS (
                                  -- 第一步：每位客戶的總消費和訂單數
                                  SELECT c.id, c.name, c.registered_date,
                                         SUM(o.amount) AS total_spent,
                                         COUNT(o.id) AS order_count,
                                         -- 計算註冊天數
                                         JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg
                                  FROM customers c
                                  LEFT JOIN orders o ON c.id = o.customer_id
                                  GROUP BY c.id, c.name, c.registered_date
                                ),
                                customer_segments AS (
                                  -- 第二步：分群
                                  SELECT *,
                                         CASE
                                           -- 依天數分三群
                                         END AS segment
                                  FROM customer_stats
                                )
                                -- 第三步：每群的統計
                                SELECT segment,
                                       COUNT(*) AS customer_count,
                                       ROUND(AVG(total_spent), 0) AS avg_ltv,
                                       ROUND(AVG(order_count), 1) AS avg_orders
                                FROM customer_segments
                                GROUP BY segment
                                ORDER BY avg_ltv DESC;
                            """,
                            expectedQuery: "WITH customer_stats AS (SELECT c.id, c.name, c.registered_date, COALESCE(SUM(o.amount), 0) AS total_spent, COUNT(o.id) AS order_count, JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg FROM customers c LEFT JOIN orders o ON c.id = o.customer_id GROUP BY c.id, c.name, c.registered_date), customer_segments AS (SELECT *, CASE WHEN days_since_reg < 90 THEN '新客' WHEN days_since_reg <= 365 THEN '中期' ELSE '老客' END AS segment FROM customer_stats) SELECT segment, COUNT(*) AS customer_count, ROUND(AVG(total_spent), 0) AS avg_ltv, ROUND(AVG(order_count), 1) AS avg_orders FROM customer_segments GROUP BY segment ORDER BY avg_ltv DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "資料整合策略",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "多來源資料整合挑戰",
                                narrative: "你加入一家零售公司的資料團隊，公司有三個獨立系統：\n\n1. POS 系統：門市銷售資料（有商品編號、數量、金額、門市代碼）\n2. 電商平台：線上訂單資料（有會員帳號、商品 SKU、金額、配送地址）\n3. CRM 系統：客戶資料（有姓名、電話、email、會員等級）\n\n問題：\n- POS 沒有客戶 ID，只有門市會員卡號（部分客戶才有）\n- 電商的商品 SKU 和 POS 的商品編號格式不同\n- CRM 的客戶 ID 和電商會員帳號是同一個，但 POS 會員卡號要另外對應\n- 資料時間粒度不同：POS 是逐筆交易，電商是訂單層級",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["想想看：不同系統之間怎麼「認出是同一個人」？", "商品對應表（mapping table）是跨系統整合的基本工具", "考慮「匹配不到」的情況：有些 POS 客戶可能沒有 CRM 記錄"],
                            explanation: "多來源資料整合是資料工程的核心挑戰。關鍵步驟：(1) 建立維度表統一實體識別（客戶、商品）(2) 建立映射表處理不同系統的 ID 對應 (3) 統一時間粒度和指標定義 (4) 用 CTE 或中間表逐步清洗和轉換 (5) 持續監控資料品質。這不只是寫 SQL 的問題，更是資料架構設計的思維。",
                            frameworkTip: "面試中的開放式資料問題，展示你的思考框架：先定義實體 → 建立映射 → 設計中間層 → 產出報表 → 品質監控。有結構化思維比答案完美更重要"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 25,
            name: "SQL 進階分析",
            emoji: "📊",
            description: "Window Functions、Funnel、Retention — Product Analyst 的核心 SQL 技能",
            quests: [
                Quest(
                    id: "25-1",
                    name: "Window Functions 實戰",
                    description: "ROW_NUMBER、RANK、累計加總、LAG/LEAD — 掌握視窗函數的核心用法",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ROW_NUMBER 排名",
                            type: .code,
                            difficulty: .medium,
                            question: "用 ROW_NUMBER 搭配 PARTITION BY category，在每個類別內根據 total_sales 由高到低排名。顯示 category, product_name, total_sales, category_rank。",
                            scenario: Challenge.Scenario(
                                title: "各部門業績排名",
                                narrative: "電商平台的營運主管想看每個產品類別中，銷售額最高的商品排名。你需要用 ROW_NUMBER 搭配 PARTITION BY 在每個類別內做排名。\n\n資料表：product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL)",
                                data: [
                                    ["product_id": "1", "category": "電子產品", "product_name": "藍牙耳機", "total_sales": "58000"],
                                    ["product_id": "2", "category": "電子產品", "product_name": "無線滑鼠", "total_sales": "32000"],
                                    ["product_id": "3", "category": "生活用品", "product_name": "保溫杯", "total_sales": "45000"],
                                    ["product_id": "4", "category": "生活用品", "product_name": "收納盒", "total_sales": "28000"],
                                    ["product_id": "5", "category": "電子產品", "product_name": "行動電源", "total_sales": "41000"],
                                ],
                                dataCaption: "product_sales 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["PARTITION BY category 會讓排名在每個類別內重新開始", "ORDER BY total_sales DESC 在 OVER() 裡面，代表排名依據", "ROW_NUMBER 每行都有唯一編號，即使值相同也不會並列"],
                            explanation: "ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) 會在每個類別內根據銷售額由高到低分配 1, 2, 3... 的編號。PARTITION BY 決定分組範圍，ORDER BY 決定排名依據。這是 Window Functions 最基礎也最常用的模式。",
                            frameworkTip: "Window Function 三要素：函數（ROW_NUMBER）、分割（PARTITION BY）、排序（ORDER BY）。面試時先說出這三個部分，再寫 SQL。",
                            sampleSchema: """
                                CREATE TABLE product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL);
                                INSERT INTO product_sales VALUES (1, '電子產品', '藍牙耳機', 58000);
                                INSERT INTO product_sales VALUES (2, '電子產品', '無線滑鼠', 32000);
                                INSERT INTO product_sales VALUES (3, '生活用品', '保溫杯', 45000);
                                INSERT INTO product_sales VALUES (4, '生活用品', '收納盒', 28000);
                                INSERT INTO product_sales VALUES (5, '電子產品', '行動電源', 41000);
                                INSERT INTO product_sales VALUES (6, '生活用品', '環保袋', 51000);
                                INSERT INTO product_sales VALUES (7, '食品', '堅果禮盒', 37000);
                                INSERT INTO product_sales VALUES (8, '食品', '有機茶葉', 29000);
                                INSERT INTO product_sales VALUES (9, '食品', '手工餅乾', 42000);
                                INSERT INTO product_sales VALUES (10, '電子產品', '充電線', 18000);
                            """,
                            starterCode: """
                                SELECT category, product_name, total_sales,
                                       ROW_NUMBER() OVER (
                                         -- 每個類別內分別排名
                                         -- 按銷售額由高到低
                                       ) AS category_rank
                                FROM product_sales
                                ORDER BY category, category_rank;
                            """,
                            expectedQuery: "SELECT category, product_name, total_sales, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_rank FROM product_sales ORDER BY category, category_rank;"
                        ),
                        Challenge(
                            id: 2,
                            name: "累計加總 Running Total",
                            type: .code,
                            difficulty: .medium,
                            question: "計算每天的營收以及到該天為止的累計營收（running_total）。按日期排序顯示 revenue_date, revenue, running_total。",
                            scenario: Challenge.Scenario(
                                title: "每日營收累計追蹤",
                                narrative: "財務團隊需要追蹤每天的營收累計，用來判斷是否能在月底前達到目標。你需要用 SUM() OVER 計算每天的累積營收。\n\n資料表：daily_revenue (revenue_date TEXT, revenue REAL)",
                                data: [
                                    ["revenue_date": "2026-03-01", "revenue": "12500"],
                                    ["revenue_date": "2026-03-02", "revenue": "8300"],
                                    ["revenue_date": "2026-03-03", "revenue": "15700"],
                                    ["revenue_date": "2026-03-04", "revenue": "9100"],
                                    ["revenue_date": "2026-03-05", "revenue": "22000"],
                                ],
                                dataCaption: "daily_revenue 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM() OVER (ORDER BY ...) 會自動累加到當前行", "不需要 PARTITION BY，因為是全體累計", "ORDER BY revenue_date 讓累計按日期順序加上去"],
                            explanation: "SUM(revenue) OVER (ORDER BY revenue_date) 會從第一筆開始，逐行累加 revenue。這就是 Running Total（累計加總），是 Window Function 最經典的用法之一。預設的 frame 是 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW，也就是從最前面加到當前行。",
                            frameworkTip: "面試時常見的 follow-up：「如果要算 7 天移動平均呢？」答案是加上 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW。",
                            sampleSchema: """
                                CREATE TABLE daily_revenue (revenue_date TEXT, revenue REAL);
                                INSERT INTO daily_revenue VALUES ('2026-03-01', 12500);
                                INSERT INTO daily_revenue VALUES ('2026-03-02', 8300);
                                INSERT INTO daily_revenue VALUES ('2026-03-03', 15700);
                                INSERT INTO daily_revenue VALUES ('2026-03-04', 9100);
                                INSERT INTO daily_revenue VALUES ('2026-03-05', 22000);
                                INSERT INTO daily_revenue VALUES ('2026-03-06', 11200);
                                INSERT INTO daily_revenue VALUES ('2026-03-07', 19800);
                            """,
                            starterCode: """
                                SELECT revenue_date, revenue,
                                       SUM(revenue) OVER (
                                         -- 如何定義累計的範圍？
                                       ) AS running_total
                                FROM daily_revenue
                                ORDER BY revenue_date;
                            """,
                            expectedQuery: "SELECT revenue_date, revenue, SUM(revenue) OVER (ORDER BY revenue_date) AS running_total FROM daily_revenue ORDER BY revenue_date;"
                        ),
                        Challenge(
                            id: 3,
                            name: "LAG/LEAD 比較前後",
                            type: .code,
                            difficulty: .medium,
                            question: "用 LAG 取得上個月營收，計算環比成長率（百分比，保留一位小數）。顯示 month, revenue, prev_revenue, growth_rate。第一個月的 prev_revenue 和 growth_rate 可以是 NULL。",
                            scenario: Challenge.Scenario(
                                title: "月營收環比成長率",
                                narrative: "管理層要求每月報表上顯示「跟上個月相比成長了多少百分比」。你需要用 LAG 函數取得上個月的營收，再計算環比成長率。\n\n資料表：monthly_revenue (month TEXT, revenue REAL)",
                                data: [
                                    ["month": "2025-10", "revenue": "320000"],
                                    ["month": "2025-11", "revenue": "285000"],
                                    ["month": "2025-12", "revenue": "410000"],
                                    ["month": "2026-01", "revenue": "375000"],
                                    ["month": "2026-02", "revenue": "398000"],
                                ],
                                dataCaption: "monthly_revenue 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LAG(revenue, 1) OVER (ORDER BY month) 取前一行的 revenue", "成長率公式：(本月 - 上月) / 上月 * 100", "第一行沒有前一行，LAG 會自動回傳 NULL"],
                            explanation: "LAG(column, offset) 讓你可以在同一行中存取「前 N 行」的資料，LEAD 則是「後 N 行」。這裡用 LAG(revenue, 1) 取得上個月營收，再用 (revenue - prev) / prev * 100 計算成長率。這是 MoM（Month-over-Month）分析的核心 SQL 模式，面試超常考。",
                            frameworkTip: "LAG 看過去，LEAD 看未來。面試時可以主動提到：「如果要跟去年同期比（YoY），用 LAG(revenue, 12)。」",
                            sampleSchema: """
                                CREATE TABLE monthly_revenue (month TEXT, revenue REAL);
                                INSERT INTO monthly_revenue VALUES ('2025-07', 280000);
                                INSERT INTO monthly_revenue VALUES ('2025-08', 310000);
                                INSERT INTO monthly_revenue VALUES ('2025-09', 295000);
                                INSERT INTO monthly_revenue VALUES ('2025-10', 320000);
                                INSERT INTO monthly_revenue VALUES ('2025-11', 285000);
                                INSERT INTO monthly_revenue VALUES ('2025-12', 410000);
                                INSERT INTO monthly_revenue VALUES ('2026-01', 375000);
                                INSERT INTO monthly_revenue VALUES ('2026-02', 398000);
                            """,
                            starterCode: """
                                SELECT month, revenue,
                                       LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue,
                                       -- 計算成長率：(本月 - 上月) / 上月 * 100
                                       ROUND(
                                         -- 你的公式
                                       , 1) AS growth_rate
                                FROM monthly_revenue
                                ORDER BY month;
                            """,
                            expectedQuery: "SELECT month, revenue, LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue, ROUND((revenue - LAG(revenue, 1) OVER (ORDER BY month)) * 100.0 / LAG(revenue, 1) OVER (ORDER BY month), 1) AS growth_rate FROM monthly_revenue ORDER BY month;"
                        ),
                        Challenge(
                            id: 4,
                            name: "DENSE_RANK 活動排名",
                            type: .code,
                            difficulty: .medium,
                            question: "計算每位用戶寄出的 Email 數量，並用 DENSE_RANK 排名（寄最多的排第 1）。顯示 from_user, email_count, activity_rank。",
                            scenario: Challenge.Scenario(
                                title: "用戶 Email 活動排名",
                                narrative: "產品團隊想找出最活躍的 Email 用戶。你需要根據每位用戶寄出的 Email 數量進行排名。如果兩位用戶寄出一樣多的 Email，排名要相同（不跳號）。\n\n資料表：emails (id, from_user, to_user, sent_date)",
                                data: [
                                    ["id": "1", "from_user": "alice", "to_user": "bob", "sent_date": "2024-03-01"],
                                    ["id": "2", "from_user": "alice", "to_user": "charlie", "sent_date": "2024-03-02"],
                                    ["id": "3", "from_user": "bob", "to_user": "alice", "sent_date": "2024-03-03"],
                                    ["id": "4", "from_user": "charlie", "to_user": "alice", "sent_date": "2024-03-04"],
                                    ["id": "5", "from_user": "alice", "to_user": "diana", "sent_date": "2024-03-05"],
                                ],
                                dataCaption: "emails 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DENSE_RANK 不會跳號，RANK 會跳號 — 這裡要不跳號", "OVER() 裡的 ORDER BY 可以直接用聚合函數", "不需要 PARTITION BY，因為是全域排名"],
                            explanation: "DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 會根據 email 數量從多到少排名，同數量的用戶排名相同且不跳號。注意 DENSE_RANK vs RANK 的差異：如果兩人並列第 1，DENSE_RANK 下一個是第 2，RANK 下一個是第 3。面試中經常問這兩者的區別。",
                            frameworkTip: "RANK vs DENSE_RANK vs ROW_NUMBER：RANK 跳號、DENSE_RANK 不跳號、ROW_NUMBER 每行唯一。面試必知的三兄弟。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT from_user,
                                       COUNT(*) AS email_count,
                                       DENSE_RANK() OVER (
                                         -- 按什麼排序？
                                       ) AS activity_rank
                                FROM emails
                                GROUP BY from_user
                                ORDER BY activity_rank;
                            """,
                            expectedQuery: "SELECT from_user, COUNT(*) AS email_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS activity_rank FROM emails GROUP BY from_user ORDER BY activity_rank;"
                        ),
                        Challenge(
                            id: 5,
                            name: "最活躍房客排名",
                            type: .code,
                            difficulty: .medium,
                            question: "計算每位房客的訊息數，用 DENSE_RANK 排名（最多的排第 1）。同名次時按 guest_name 字母排序。顯示 guest_name, message_count, ranking。",
                            scenario: Challenge.Scenario(
                                title: "房客訊息活躍度排名",
                                narrative: "平台運營想找出溝通最積極的房客，以便推薦「超級房客」標籤。你需要根據每位房客發送的訊息總數做排名。如果多位房客發送相同數量的訊息，排名相同，並按名稱字母順序排列。\n\n資料表：messages (id, guest_id, guest_name, host_id, message_body, sent_date)",
                                data: [
                                    ["id": "1", "guest_id": "101", "guest_name": "Amy", "host_id": "501", "sent_date": "2024-02-10"],
                                    ["id": "2", "guest_id": "102", "guest_name": "Ben", "host_id": "502", "sent_date": "2024-02-11"],
                                    ["id": "3", "guest_id": "101", "guest_name": "Amy", "host_id": "503", "sent_date": "2024-02-12"],
                                    ["id": "4", "guest_id": "103", "guest_name": "Cathy", "host_id": "501", "sent_date": "2024-02-13"],
                                ],
                                dataCaption: "messages 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY guest_id 後再用 DENSE_RANK 排名", "同名次按 guest_name 字母排序 — 在最外層 ORDER BY 處理", "注意 GROUP BY 要包含 guest_id 和 guest_name 兩個欄位"],
                            explanation: "先 GROUP BY guest_id, guest_name 算出每位房客的訊息數，再用 DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 排名。最外層 ORDER BY ranking, guest_name 確保同名次的按字母排序。這個 pattern 在排行榜場景中非常常見。",
                            frameworkTip: "排行榜問題的 pattern：GROUP BY 算指標 → DENSE_RANK 排名 → ORDER BY 處理同名次的排序。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT guest_name,
                                       COUNT(*) AS message_count,
                                       DENSE_RANK() OVER (
                                         -- 排名邏輯？
                                       ) AS ranking
                                FROM messages
                                GROUP BY guest_id, guest_name
                                ORDER BY ranking, guest_name;
                            """,
                            expectedQuery: "SELECT guest_name, COUNT(*) AS message_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking FROM messages GROUP BY guest_id, guest_name ORDER BY ranking, guest_name;"
                        ),
                        Challenge(
                            id: 6,
                            name: "連續出現的數字",
                            type: .code,
                            difficulty: .hard,
                            question: "用 LAG 和 LEAD（或連續兩次 LAG）找出所有連續出現至少 3 次的 value。結果去重，只顯示 value 欄位。",
                            scenario: Challenge.Scenario(
                                title: "連續三次相同值偵測",
                                narrative: "資料工程師發現某個感測器的日誌中，有些數值會連續出現多次，可能代表系統異常。PM 請你找出所有「連續出現至少 3 次」的數值。\n\n資料表：sensor_logs (id INTEGER PRIMARY KEY, value INTEGER)，id 是連續編號。",
                                data: [
                                    ["id": "1", "value": "10"],
                                    ["id": "2", "value": "10"],
                                    ["id": "3", "value": "10"],
                                    ["id": "4", "value": "20"],
                                    ["id": "5", "value": "20"],
                                    ["id": "6", "value": "30"],
                                ],
                                dataCaption: "sensor_logs 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LAG(value, 1) 取前一筆，LAG(value, 2) 取前兩筆", "如果 value = prev1 = prev2，代表連續三筆相同", "用 DISTINCT 去重，因為連續 4 次會匹配 2 次"],
                            explanation: "用 LAG 取得前一筆和前兩筆的值，當三者相等時代表連續出現 3 次。LAG(value, N) 中的 N 是偏移量。另一個解法是同時用 LAG 和 LEAD：如果自己 = 前一個 = 後一個。DISTINCT 是必要的，因為連續 4 次的值會被匹配多次。這是面試經典題，考的是 Window Function 的靈活運用。",
                            frameworkTip: "連續 N 次問題的解法：LAG/LEAD 取前後值比較，或用「row_number 差值法」（GROUP BY value, id - ROW_NUMBER 分組）。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH lagged AS (
                                  SELECT id, value,
                                    LAG(value, 1) OVER (ORDER BY id) AS prev1,
                                    LAG(value, 2) OVER (ORDER BY id) AS prev2
                                  FROM sensor_logs
                                )
                                SELECT DISTINCT value
                                FROM lagged
                                WHERE -- 什麼條件代表「連續三次相同」？;
                            """,
                            expectedQuery: "WITH lagged AS (SELECT id, value, LAG(value, 1) OVER (ORDER BY id) AS prev1, LAG(value, 2) OVER (ORDER BY id) AS prev2 FROM sensor_logs) SELECT DISTINCT value FROM lagged WHERE value = prev1 AND value = prev2;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-2",
                    name: "Funnel Analysis",
                    description: "轉換漏斗分析 — 計算每一步的轉換率與流失率",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 Funnel 查詢",
                            type: .code,
                            difficulty: .medium,
                            question: "用 COUNT(DISTINCT CASE WHEN ...) 計算每個漏斗步驟的不重複用戶數，並計算每步相對於第一步（view）的轉換率（百分比，保留一位小數）。",
                            scenario: Challenge.Scenario(
                                title: "電商購買漏斗轉換率",
                                narrative: "產品經理想了解從「瀏覽商品」到「完成付款」的每一步轉換率。事件記錄在 user_events 表中，有四個步驟：view（瀏覽）、add_to_cart（加入購物車）、checkout（結帳）、payment（付款）。\n\n資料表：user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)",
                                data: [
                                    ["event_id": "1", "user_id": "101", "event_name": "view", "event_date": "2026-03-01"],
                                    ["event_id": "2", "user_id": "101", "event_name": "add_to_cart", "event_date": "2026-03-01"],
                                    ["event_id": "3", "user_id": "101", "event_name": "checkout", "event_date": "2026-03-01"],
                                    ["event_id": "4", "user_id": "101", "event_name": "payment", "event_date": "2026-03-01"],
                                    ["event_id": "5", "user_id": "102", "event_name": "view", "event_date": "2026-03-01"],
                                    ["event_id": "6", "user_id": "102", "event_name": "add_to_cart", "event_date": "2026-03-02"],
                                ],
                                dataCaption: "user_events 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) 計算加入購物車的不重複用戶數", "轉換率 = 該步驟用戶數 / 第一步用戶數 * 100", "CTE 先算出每步人數，外層再算比率，SQL 更清楚"],
                            explanation: "Funnel 分析的核心模式是 COUNT(DISTINCT CASE WHEN ... THEN user_id END)。每個 CASE WHEN 對應一個漏斗步驟，COUNT DISTINCT 確保同一用戶只計一次。用 CTE 把漏斗數字算好後，外層再算轉換率。這是 Product Analyst 面試的經典題型。",
                            frameworkTip: "Funnel 分析三步驟：(1) 定義步驟 (2) COUNT DISTINCT 算每步人數 (3) 算轉換率。面試時用 CTE 分層寫，更好閱讀。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH funnel AS (
                                  SELECT
                                    COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view,
                                    -- 補完其他三個步驟
                                  FROM user_events
                                )
                                SELECT
                                  step1_view,
                                  step2_cart,
                                  step3_checkout,
                                  step4_payment,
                                  -- 計算每步相對於 step1 的轉換率
                                FROM funnel;
                            """,
                            expectedQuery: "WITH funnel AS (SELECT COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN event_name = 'checkout' THEN user_id END) AS step3_checkout, COUNT(DISTINCT CASE WHEN event_name = 'payment' THEN user_id END) AS step4_payment FROM user_events) SELECT step1_view, step2_cart, step3_checkout, step4_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_checkout * 100.0 / step1_view, 1) AS checkout_rate, ROUND(step4_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;"
                        ),
                        Challenge(
                            id: 2,
                            name: "分群 Funnel 比較",
                            type: .code,
                            difficulty: .hard,
                            question: "先用 CASE WHEN 判斷用戶是「新用戶」（first_visit_date 在 2026-03 月）或「回訪用戶」，再分群計算 view → add_to_cart → payment 的轉換率。",
                            scenario: Challenge.Scenario(
                                title: "新舊用戶轉換漏斗對比",
                                narrative: "PM 想知道新用戶和回訪用戶在購買漏斗上的轉換率有什麼差異，以便決定是優化新客引導還是提升老客回購。你需要先判斷用戶類型（首次造訪 vs 回訪），再分別計算漏斗。\n\n資料表：\n- user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- users (user_id INTEGER, first_visit_date TEXT)",
                                data: [
                                    ["user_id": "101", "first_visit_date": "2026-03-01", "type": "新用戶"],
                                    ["user_id": "102", "first_visit_date": "2026-01-15", "type": "回訪用戶"],
                                    ["user_id": "103", "first_visit_date": "2026-03-02", "type": "新用戶"],
                                ],
                                dataCaption: "users 資料表（部分範例，type 欄位為說明用）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用 CTE 把每個用戶分成新用戶或回訪用戶", "在 funnel CTE 中 GROUP BY segment，每個群組分別計算漏斗", "最後外層算轉換率，就能直接比較兩群的差異"],
                            explanation: "分群 Funnel 是 Product Analyst 的常見需求。關鍵是先建一個 user_type CTE 定義分群邏輯，再 JOIN 到事件表上。GROUP BY segment 讓每個群組獨立計算漏斗。這樣就能比較新舊用戶的轉換率差異，找出優化方向。",
                            frameworkTip: "面試答 Funnel 題時的加分點：主動提出「是否要分群比較？例如新舊用戶、不同渠道、不同地區」。這展現了分析思維。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH user_type AS (
                                  SELECT user_id,
                                         CASE
                                           WHEN first_visit_date >= '2026-03-01' THEN '新用戶'
                                           ELSE '回訪用戶'
                                         END AS segment
                                  FROM users
                                ),
                                funnel AS (
                                  SELECT ut.segment,
                                         -- 計算每個 segment 的 view, add_to_cart, payment 人數
                                  FROM user_events e
                                  JOIN user_type ut ON e.user_id = ut.user_id
                                  GROUP BY ut.segment
                                )
                                SELECT segment,
                                       step1_view, step2_cart, step3_payment,
                                       -- 計算轉換率
                                FROM funnel;
                            """,
                            expectedQuery: "WITH user_type AS (SELECT user_id, CASE WHEN first_visit_date >= '2026-03-01' THEN '新用戶' ELSE '回訪用戶' END AS segment FROM users), funnel AS (SELECT ut.segment, COUNT(DISTINCT CASE WHEN e.event_name = 'view' THEN e.user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN e.event_name = 'add_to_cart' THEN e.user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN e.event_name = 'payment' THEN e.user_id END) AS step3_payment FROM user_events e JOIN user_type ut ON e.user_id = ut.user_id GROUP BY ut.segment) SELECT segment, step1_view, step2_cart, step3_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;"
                        ),
                        Challenge(
                            id: 3,
                            name: "每日好友請求接受率",
                            type: .code,
                            difficulty: .medium,
                            question: "計算每個日期的好友請求接受率：acceptance_rate = 當日 accept 數 / 當日 send 數。顯示 action_date, sends, accepts, acceptance_rate（四捨五入到小數第 2 位）。",
                            scenario: Challenge.Scenario(
                                title: "好友請求接受率分析",
                                narrative: "Growth 團隊想追蹤好友功能的健康度。你需要根據好友請求事件（send / accept），計算每日的接受率（acceptance rate）。\n\n資料表：friend_requests (id, sender_id, receiver_id, action TEXT, action_date TEXT)\n- action 為 \"send\" 或 \"accept\"",
                                data: [
                                    ["id": "1", "sender_id": "101", "receiver_id": "201", "action": "send", "action_date": "2024-03-01"],
                                    ["id": "2", "sender_id": "101", "receiver_id": "201", "action": "accept", "action_date": "2024-03-01"],
                                    ["id": "3", "sender_id": "102", "receiver_id": "202", "action": "send", "action_date": "2024-03-01"],
                                    ["id": "4", "sender_id": "103", "receiver_id": "203", "action": "send", "action_date": "2024-03-02"],
                                    ["id": "5", "sender_id": "103", "receiver_id": "203", "action": "accept", "action_date": "2024-03-02"],
                                ],
                                dataCaption: "friend_requests 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 CASE WHEN 分別計算 send 和 accept 的數量", "記得乘以 1.0 避免整數除法", "用 ROUND(..., 2) 取到小數第 2 位"],
                            explanation: "用 SUM(CASE WHEN ...) 是「橫向 pivot」的經典技巧，可以在一次 GROUP BY 中同時計算多個條件的聚合值。注意 SQLite 的整數除法：5/3 = 1 不是 1.67，所以要乘以 1.0 轉成浮點數。這種 event-based 的轉換率計算是社交平台分析的核心題型。",
                            frameworkTip: "事件轉換率 pattern：SUM(CASE WHEN event = X) / SUM(CASE WHEN event = Y)。記得處理整數除法和除以零。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT action_date,
                                       SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends,
                                       SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts,
                                       -- 怎麼算 acceptance_rate？
                                FROM friend_requests
                                GROUP BY action_date
                                ORDER BY action_date;
                            """,
                            expectedQuery: "SELECT action_date, SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends, SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts, ROUND(SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END), 2) AS acceptance_rate FROM friend_requests GROUP BY action_date ORDER BY action_date;"
                        ),
                        Challenge(
                            id: 4,
                            name: "多來源能源消耗高峰",
                            type: .code,
                            difficulty: .hard,
                            question: "用 UNION ALL 合併三張表，計算每月的總消耗量，找出消耗量最高的月份。顯示 date, total_consumption，只回傳消耗量最高的月份（可能有多個並列）。",
                            scenario: Challenge.Scenario(
                                title: "多資料來源漏斗合併",
                                narrative: "公司有三個不同部門的能源消耗紀錄，儲存在不同表中。PM 想找出「合併後」每個月的總消耗量，以及消耗量最高的月份。\n\n資料表：\n- dept_a_consumption (date TEXT, consumption INTEGER)\n- dept_b_consumption (date TEXT, consumption INTEGER)\n- dept_c_consumption (date TEXT, consumption INTEGER)",
                                data: [
                                    ["source": "dept_a", "date": "2024-01", "consumption": "300"],
                                    ["source": "dept_b", "date": "2024-01", "consumption": "250"],
                                    ["source": "dept_c", "date": "2024-01", "consumption": "200"],
                                ],
                                dataCaption: "各部門 2024-01 能源消耗範例"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL 保留所有列（包括重複），UNION 會去重 — 這裡用 UNION ALL", "先合併 → 再 GROUP BY 月份算總和 → 最後找最大值", "子查詢 SELECT MAX(...) FROM monthly 取最大值"],
                            explanation: "多資料來源合併是真實工作中常見的場景（不同平台的數據、不同部門的報表等）。UNION ALL 把結構相同的表垂直合併，再 GROUP BY 做聚合。用子查詢找出最大值後做過濾，可以正確處理多個月份並列的情況。面試中這類題考的是你處理散落在不同表的數據的能力。",
                            frameworkTip: "多來源合併 pattern：UNION ALL 合併 → GROUP BY 聚合 → 子查詢或 Window Function 篩選極值。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH combined AS (
                                  SELECT date, consumption FROM dept_a_consumption
                                  UNION ALL
                                  SELECT date, consumption FROM dept_b_consumption
                                  UNION ALL
                                  SELECT date, consumption FROM dept_c_consumption
                                ),
                                monthly AS (
                                  SELECT date, SUM(consumption) AS total_consumption
                                  FROM combined
                                  GROUP BY date
                                )
                                SELECT date, total_consumption
                                FROM monthly
                                WHERE total_consumption = (
                                  -- 怎麼取最大值？
                                );
                            """,
                            expectedQuery: "WITH combined AS (SELECT date, consumption FROM dept_a_consumption UNION ALL SELECT date, consumption FROM dept_b_consumption UNION ALL SELECT date, consumption FROM dept_c_consumption), monthly AS (SELECT date, SUM(consumption) AS total_consumption FROM combined GROUP BY date) SELECT date, total_consumption FROM monthly WHERE total_consumption = (SELECT MAX(total_consumption) FROM monthly);"
                        ),
                    ]
                ),
                Quest(
                    id: "25-3",
                    name: "Segmentation",
                    description: "NTILE 分群、CASE WHEN 行為分群 — 用 SQL 做用戶分群",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "NTILE 分群",
                            type: .code,
                            difficulty: .medium,
                            question: "用 NTILE(4) 將用戶依 total_amount 由高到低分成四組（1=前 25%, 4=後 25%），再用 CASE WHEN 轉成中文標籤。顯示 user_name, total_amount, quartile, segment_label。",
                            scenario: Challenge.Scenario(
                                title: "用戶消費金額四分位分群",
                                narrative: "行銷團隊想把用戶依消費金額分成四個等級（前 25% 為 VIP、25-50% 為高價值、50-75% 為一般、後 25% 為低活躍），以便制定不同的行銷策略。你需要用 NTILE 將用戶分成四組。\n\n資料表：user_spending (user_id INTEGER, user_name TEXT, total_amount REAL)",
                                data: [
                                    ["user_id": "1", "user_name": "王小明", "total_amount": "85200"],
                                    ["user_id": "2", "user_name": "李美玲", "total_amount": "42300"],
                                    ["user_id": "3", "user_name": "張大維", "total_amount": "128500"],
                                    ["user_id": "4", "user_name": "陳怡君", "total_amount": "15800"],
                                    ["user_id": "5", "user_name": "林志豪", "total_amount": "67400"],
                                ],
                                dataCaption: "user_spending 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["NTILE(4) 把資料平均分成 4 組，第 1 組是最高的 25%", "CASE NTILE(4) OVER (...) WHEN 1 THEN ... 可以直接對結果做標籤", "ORDER BY total_amount DESC 讓金額最高的排在第 1 組"],
                            explanation: "NTILE(n) 是分群分析的利器。它把排序後的資料盡量平均分成 n 組。NTILE(4) 就是四分位數分群。搭配 CASE WHEN 可以把數字轉成有意義的標籤。在 RFM 分析中，經常用 NTILE 來把 Recency、Frequency、Monetary 各切成若干組。",
                            frameworkTip: "NTILE 的限制：如果資料量不能被 n 整除，前面的組會多一個。面試時可以提到這個 edge case。",
                            sampleSchema: """
                                CREATE TABLE user_spending (user_id INTEGER, user_name TEXT, total_amount REAL);
                                INSERT INTO user_spending VALUES (1, '王小明', 85200);
                                INSERT INTO user_spending VALUES (2, '李美玲', 42300);
                                INSERT INTO user_spending VALUES (3, '張大維', 128500);
                                INSERT INTO user_spending VALUES (4, '陳怡君', 15800);
                                INSERT INTO user_spending VALUES (5, '林志豪', 67400);
                                INSERT INTO user_spending VALUES (6, '黃雅婷', 93100);
                                INSERT INTO user_spending VALUES (7, '吳建宏', 28900);
                                INSERT INTO user_spending VALUES (8, '劉淑芬', 51600);
                                INSERT INTO user_spending VALUES (9, '蔡宗翰', 110200);
                                INSERT INTO user_spending VALUES (10, '鄭佳慧', 38700);
                                INSERT INTO user_spending VALUES (11, '周俊傑', 72800);
                                INSERT INTO user_spending VALUES (12, '許雅琪', 19500);
                            """,
                            starterCode: """
                                SELECT user_name, total_amount,
                                       NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile,
                                       CASE NTILE(4) OVER (ORDER BY total_amount DESC)
                                         -- 1 = VIP, 2 = 高價值, 3 = 一般, 4 = 低活躍
                                       END AS segment_label
                                FROM user_spending
                                ORDER BY total_amount DESC;
                            """,
                            expectedQuery: "SELECT user_name, total_amount, NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile, CASE NTILE(4) OVER (ORDER BY total_amount DESC) WHEN 1 THEN 'VIP' WHEN 2 THEN '高價值' WHEN 3 THEN '一般' WHEN 4 THEN '低活躍' END AS segment_label FROM user_spending ORDER BY total_amount DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "CASE WHEN 行為分群",
                            type: .code,
                            difficulty: .medium,
                            question: "用 CASE WHEN 根據上述規則將用戶分群。顯示 user_name, login_count, action_count, segment。再統計每個 segment 的用戶數。",
                            scenario: Challenge.Scenario(
                                title: "用戶活躍度分群",
                                narrative: "產品團隊想根據用戶過去 30 天的行為（登入次數 + 操作次數）做活躍度分群。規則如下：\n- Power User：登入 >= 20 次 且 操作 >= 50 次\n- Active：登入 >= 10 次 且 操作 >= 20 次\n- Casual：登入 >= 3 次\n- Dormant：其餘\n\n資料表：user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER)",
                                data: [
                                    ["user_id": "1", "user_name": "小明", "login_count": "25", "action_count": "80", "segment": "Power User"],
                                    ["user_id": "2", "user_name": "美玲", "login_count": "12", "action_count": "35", "segment": "Active"],
                                    ["user_id": "3", "user_name": "大維", "login_count": "5", "action_count": "8", "segment": "Casual"],
                                    ["user_id": "4", "user_name": "怡君", "login_count": "1", "action_count": "2", "segment": "Dormant"],
                                ],
                                dataCaption: "user_activity 資料表（部分範例，segment 為預期結果）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CASE WHEN 的條件順序很重要 — 先判斷最嚴格的條件", "Power User 的條件最嚴格，要放第一個", "用 CTE 先建立分群結果，外層再做聚合統計"],
                            explanation: "CASE WHEN 行為分群的關鍵是條件順序：從最嚴格到最寬鬆。因為 CASE WHEN 會在第一個符合的條件就停止，所以 Power User（最嚴格）要放最前面。用 CTE 先分群、再聚合是常見的兩步模式。",
                            frameworkTip: "面試中分群題的思路：(1) 定義分群規則 (2) 確認條件優先順序 (3) CASE WHEN 實作 (4) 用 GROUP BY 統計各群人數與指標。",
                            sampleSchema: """
                                CREATE TABLE user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER);
                                INSERT INTO user_activity VALUES (1, '小明', 25, 80);
                                INSERT INTO user_activity VALUES (2, '美玲', 12, 35);
                                INSERT INTO user_activity VALUES (3, '大維', 5, 8);
                                INSERT INTO user_activity VALUES (4, '怡君', 1, 2);
                                INSERT INTO user_activity VALUES (5, '志豪', 22, 60);
                                INSERT INTO user_activity VALUES (6, '雅婷', 15, 25);
                                INSERT INTO user_activity VALUES (7, '建宏', 8, 15);
                                INSERT INTO user_activity VALUES (8, '淑芬', 3, 5);
                                INSERT INTO user_activity VALUES (9, '宗翰', 0, 0);
                                INSERT INTO user_activity VALUES (10, '佳慧', 18, 45);
                            """,
                            starterCode: """
                                WITH segmented AS (
                                  SELECT user_name, login_count, action_count,
                                         CASE
                                           -- 根據規則分群
                                         END AS segment
                                  FROM user_activity
                                )
                                SELECT segment, COUNT(*) AS user_count
                                FROM segmented
                                GROUP BY segment
                                ORDER BY user_count DESC;
                            """,
                            expectedQuery: "WITH segmented AS (SELECT user_name, login_count, action_count, CASE WHEN login_count >= 20 AND action_count >= 50 THEN 'Power User' WHEN login_count >= 10 AND action_count >= 20 THEN 'Active' WHEN login_count >= 3 THEN 'Casual' ELSE 'Dormant' END AS segment FROM user_activity) SELECT segment, COUNT(*) AS user_count FROM segmented GROUP BY segment ORDER BY user_count DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "分群策略選擇",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "PM 想把用戶按「最近一次購買距今天數」、「購買頻率」、「累計消費金額」三個維度各分成 5 等份，再組合成一個綜合分群。這是哪種分群方法？應該用哪個 SQL 函數？",
                            scenario: Challenge.Scenario(
                                title: "選擇正確的分群方法",
                                narrative: "你是一位 Product Analyst，PM 提出了不同的分群需求。你需要判斷哪種 SQL 分群方法最適合。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CASE WHEN 硬編碼分群，手動設定每個維度的閾值", explanation: "CASE WHEN 適合規則明確的分群，但 RFM 需要動態分位數，硬編碼不夠彈性。"),
                                Challenge.Option(id: "B", text: "NTILE(5) 搭配 PARTITION BY 各維度，做 RFM 分群", explanation: "正確！RFM 分群的標準做法是用 NTILE 對 Recency、Frequency、Monetary 各自做分位數切割，再組合成 RFM Score。"),
                                Challenge.Option(id: "C", text: "ROW_NUMBER 排名後取 TOP N 用戶", explanation: "ROW_NUMBER 適合取排名，但不適合做分位數分群。"),
                                Challenge.Option(id: "D", text: "GROUP BY 三個維度直接聚合", explanation: "GROUP BY 會產生太多組合，不是分群的正確方法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["RFM = Recency, Frequency, Monetary", "需要把連續數值切成等份的需求，想到 NTILE", "三個維度各切 5 等份 → NTILE(5) 用三次"],
                            explanation: "RFM 分群是經典的用戶分群框架。R（Recency 最近購買距今）、F（Frequency 購買頻率）、M（Monetary 消費金額）各用 NTILE(5) 分成 5 組，組合後就是 RFM Score（例如 5-5-5 是最有價值的用戶）。NTILE 是做分位數分群的最佳工具。",
                            frameworkTip: "RFM 是 Product Analyst 必知的分群框架。面試時聽到「用戶價值分群」就想到 RFM + NTILE。"
                        ),
                        Challenge(
                            id: 4,
                            name: "商家類型分類",
                            type: .code,
                            difficulty: .medium,
                            question: "用 CASE WHEN 搭配 LOWER() 和 LIKE 將商家分類，然後計算每個類別的商家數量和平均營收。顯示 business_type, count, avg_revenue。",
                            scenario: Challenge.Scenario(
                                title: "根據名稱分類商家類型",
                                narrative: "市場團隊收到了一批商家資料，需要根據商家名稱中的關鍵字自動分類。規則如下：\n- 名稱包含 \"restaurant\" 或 \"cafe\" → 餐飲\n- 名稱包含 \"shop\" 或 \"store\" → 零售\n- 名稱包含 \"hotel\" 或 \"inn\" → 住宿\n- 其他 → 其他\n\n資料表：businesses (id, name TEXT, city TEXT, revenue REAL)",
                                data: [
                                    ["id": "1", "name": "Sunset Restaurant", "city": "Taipei", "revenue": "85000"],
                                    ["id": "2", "name": "Tech Shop Plus", "city": "Hsinchu", "revenue": "120000"],
                                    ["id": "3", "name": "Garden Inn", "city": "Taichung", "revenue": "200000"],
                                    ["id": "4", "name": "Creative Studio", "city": "Taipei", "revenue": "65000"],
                                ],
                                dataCaption: "businesses 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LOWER(name) 先轉小寫，避免大小寫不一致的問題", "LIKE '%keyword%' 做模糊匹配", "CASE WHEN 的順序很重要 — 如果名稱同時包含多個關鍵字，會被歸到第一個匹配的類別"],
                            explanation: "用 CASE WHEN + LIKE 做文本分類是資料清理和分群中很常見的技巧。LOWER() 確保大小寫不敏感。注意 CASE WHEN 是「first match wins」的邏輯，所以條件的順序可能影響結果。在真實工作中，這種分類邏輯經常會越來越複雜，最後可能需要搬到 mapping table 或 UDF 中。",
                            frameworkTip: "文本分類 pattern：CASE WHEN + LOWER + LIKE。生產環境中更好的做法是建一張 mapping table JOIN 進來。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT
                                  CASE
                                    WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲'
                                    -- 繼續分類...
                                  END AS business_type,
                                  COUNT(*) AS count,
                                  ROUND(AVG(revenue), 0) AS avg_revenue
                                FROM businesses
                                GROUP BY business_type
                                ORDER BY avg_revenue DESC;
                            """,
                            expectedQuery: "SELECT CASE WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲' WHEN LOWER(name) LIKE '%shop%' OR LOWER(name) LIKE '%store%' THEN '零售' WHEN LOWER(name) LIKE '%hotel%' OR LOWER(name) LIKE '%inn%' THEN '住宿' ELSE '其他' END AS business_type, COUNT(*) AS count, ROUND(AVG(revenue), 0) AS avg_revenue FROM businesses GROUP BY business_type ORDER BY avg_revenue DESC;"
                        ),
                        Challenge(
                            id: 5,
                            name: "免費 vs 付費用戶比較",
                            type: .code,
                            difficulty: .hard,
                            question: "計算每日免費用戶 vs 付費用戶的總下載量，找出免費用戶下載量超過付費用戶的日期。顯示 date, free_downloads, premium_downloads。",
                            scenario: Challenge.Scenario(
                                title: "Freemium vs Premium 下載量比較",
                                narrative: "產品團隊想了解免費用戶和付費用戶的每日下載量差異，特別想找出「免費用戶下載量超過付費用戶」的日期。\n\n資料表：\n- downloads (date TEXT, user_id INTEGER, downloads INTEGER)\n- users (id INTEGER, account_type TEXT)  -- account_type: \"free\" 或 \"premium\"",
                                data: [
                                    ["date": "2024-03-01", "account_type": "free", "total_downloads": "150"],
                                    ["date": "2024-03-01", "account_type": "premium", "total_downloads": "200"],
                                    ["date": "2024-03-02", "account_type": "free", "total_downloads": "250"],
                                    ["date": "2024-03-02", "account_type": "premium", "total_downloads": "180"],
                                ],
                                dataCaption: "每日下載量（彙總後）範例"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM(CASE WHEN) 是把同一筆 GROUP BY 內的數據分成兩群的經典技巧", "JOIN users 表取得 account_type 後再做條件聚合", "WHERE 條件直接比較兩個 SUM 的結果"],
                            explanation: "這題的核心技巧是「條件聚合」：在同一個 GROUP BY 中，用 SUM(CASE WHEN ...) 分別計算不同分群的指標。這比分開查再 JOIN 更簡潔高效。在 CTE 裡先算好每日兩群的總量，外層再做過濾。這種 A/B 比較在產品分析中無處不在。",
                            frameworkTip: "分群比較 pattern：JOIN 取分群標籤 → SUM(CASE WHEN) 條件聚合 → WHERE/HAVING 篩選。比 self-join 更高效。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH daily AS (
                                  SELECT d.date,
                                    SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads,
                                    SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads
                                  FROM downloads d
                                  JOIN users u ON d.user_id = u.id
                                  GROUP BY d.date
                                )
                                SELECT date, free_downloads, premium_downloads
                                FROM daily
                                WHERE -- 什麼條件？
                                ORDER BY date;
                            """,
                            expectedQuery: "WITH daily AS (SELECT d.date, SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads, SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads FROM downloads d JOIN users u ON d.user_id = u.id GROUP BY d.date) SELECT date, free_downloads, premium_downloads FROM daily WHERE free_downloads > premium_downloads ORDER BY date;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-4",
                    name: "Retention / Cohort Analysis",
                    description: "留存率與 Cohort 分析 — 追蹤用戶是否持續回來",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "月活躍留存率",
                            type: .code,
                            difficulty: .hard,
                            question: "計算每個月的活躍用戶數、下個月還活躍的用戶數、以及月留存率（百分比，保留一位小數）。",
                            scenario: Challenge.Scenario(
                                title: "計算月留存率",
                                narrative: "產品負責人想知道「本月活躍的用戶中，有多少比例下個月還會回來」。你需要找出每個月的活躍用戶，再比對下個月是否還活躍，計算留存率。\n\n資料表：user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)",
                                data: [
                                    ["action_id": "1", "user_id": "101", "action_date": "2025-11-05"],
                                    ["action_id": "2", "user_id": "101", "action_date": "2025-12-10"],
                                    ["action_id": "3", "user_id": "102", "action_date": "2025-11-08"],
                                    ["action_id": "4", "user_id": "103", "action_date": "2025-11-15"],
                                    ["action_id": "5", "user_id": "103", "action_date": "2025-12-20"],
                                ],
                                dataCaption: "user_actions 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 LEFT JOIN 自連接 monthly_active，把本月和下個月配對", "SQLite 中下個月：SUBSTR(DATE(active_month || '-01', '+1 month'), 1, 7)", "LEFT JOIN 確保即使沒有留存用戶的月份也會顯示（留存 = 0）"],
                            explanation: "月留存率的核心是自連接：把同一用戶的本月活躍記錄和下月活躍記錄配對。用 LEFT JOIN 確保即使沒有留存也會顯示。COUNT(DISTINCT m2.user_id) 只計算有匹配的（下月也活躍的）用戶。留存率 = 留存人數 / 本月活躍人數。",
                            frameworkTip: "留存率的思路：先建「月 x 用戶」的去重表，再用自連接比對前後月。這個模式可以推廣到「週留存」、「日留存」。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH monthly_active AS (
                                  -- 每月有哪些活躍用戶（去重）
                                  SELECT DISTINCT user_id,
                                         SUBSTR(action_date, 1, 7) AS active_month
                                  FROM user_actions
                                )
                                SELECT
                                  m1.active_month,
                                  COUNT(DISTINCT m1.user_id) AS active_users,
                                  -- 下個月還活躍的用戶數？
                                  -- 留存率？
                                FROM monthly_active m1
                                -- 怎麼找到「下個月也活躍」的用戶？
                                GROUP BY m1.active_month
                                ORDER BY m1.active_month;
                            """,
                            expectedQuery: "WITH monthly_active AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions) SELECT m1.active_month, COUNT(DISTINCT m1.user_id) AS active_users, COUNT(DISTINCT m2.user_id) AS retained_users, ROUND(COUNT(DISTINCT m2.user_id) * 100.0 / COUNT(DISTINCT m1.user_id), 1) AS retention_rate FROM monthly_active m1 LEFT JOIN monthly_active m2 ON m1.user_id = m2.user_id AND m2.active_month = SUBSTR(DATE(m1.active_month || '-01', '+1 month'), 1, 7) GROUP BY m1.active_month ORDER BY m1.active_month;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Cohort Retention 矩陣",
                            type: .code,
                            difficulty: .hard,
                            question: "建立 Cohort Retention 報表：每個 Cohort（註冊月份）在第 0, 1, 2 個月後的活躍用戶數與留存率。顯示 cohort_month, month_number, active_users, cohort_size, retention_rate。",
                            scenario: Challenge.Scenario(
                                title: "建立 Cohort 留存矩陣",
                                narrative: "產品團隊需要一個 Cohort Retention 矩陣：橫軸是「註冊後的第 N 個月」，縱軸是「註冊月份的 Cohort」，格子裡是留存率。這是 Product Analytics 的核心報表。\n\n資料表：\n- user_signups (user_id INTEGER, signup_date TEXT)\n- user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)",
                                data: [
                                    ["cohort": "2025-10", "month_0": "100%", "month_1": "62%", "month_2": "45%"],
                                    ["cohort": "2025-11", "month_0": "100%", "month_1": "58%", "month_2": "-"],
                                    ["cohort": "2025-12", "month_0": "100%", "month_1": "-", "month_2": "-"],
                                ],
                                dataCaption: "Cohort Retention 矩陣（預期輸出格式）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 JULIANDAY 計算兩個月份之間的差距（除以 30 取整數 = 月數）", "需要一個 cohort_size CTE 記錄每個 Cohort 的初始人數", "retention_rate = 該月活躍人數 / Cohort 初始人數 * 100"],
                            explanation: "Cohort Retention 矩陣是 Product Analytics 的「聖杯報表」。步驟：(1) 定義 Cohort（註冊月份）(2) 計算每人每月活躍狀態 (3) 算出 month_number（距註冊幾個月）(4) 聚合出每個 Cohort x month_number 的留存率。JULIANDAY 差值除以 30 是 SQLite 中算月份差的技巧。",
                            frameworkTip: "面試時 Cohort 分析三步驟：(1) 定義 Cohort 維度（通常是註冊月）(2) 定義活躍事件 (3) 用 month_number 攤開留存。這個框架適用於所有留存分析。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH cohorts AS (
                                  -- 每位用戶的 cohort（註冊月）
                                  SELECT user_id,
                                         SUBSTR(signup_date, 1, 7) AS cohort_month
                                  FROM user_signups
                                ),
                                user_monthly AS (
                                  -- 每位用戶每月的活躍記錄
                                  SELECT DISTINCT user_id,
                                         SUBSTR(action_date, 1, 7) AS active_month
                                  FROM user_actions
                                ),
                                cohort_activity AS (
                                  SELECT c.cohort_month,
                                         -- 計算 month_number（活躍月 - 註冊月）
                                         um.active_month,
                                         c.user_id
                                  FROM cohorts c
                                  JOIN user_monthly um ON c.user_id = um.user_id
                                )
                                -- 最終聚合：每個 cohort x month_number 的留存率
                                SELECT cohort_month, month_number,
                                       COUNT(DISTINCT user_id) AS active_users,
                                       -- cohort_size 和 retention_rate
                                FROM cohort_activity
                                GROUP BY cohort_month, month_number
                                ORDER BY cohort_month, month_number;
                            """,
                            expectedQuery: "WITH cohorts AS (SELECT user_id, SUBSTR(signup_date, 1, 7) AS cohort_month FROM user_signups), cohort_size AS (SELECT cohort_month, COUNT(*) AS size FROM cohorts GROUP BY cohort_month), user_monthly AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions), cohort_activity AS (SELECT c.cohort_month, CAST((JULIANDAY(um.active_month || '-01') - JULIANDAY(c.cohort_month || '-01')) / 30 AS INTEGER) AS month_number, c.user_id FROM cohorts c JOIN user_monthly um ON c.user_id = um.user_id) SELECT ca.cohort_month, ca.month_number, COUNT(DISTINCT ca.user_id) AS active_users, cs.size AS cohort_size, ROUND(COUNT(DISTINCT ca.user_id) * 100.0 / cs.size, 1) AS retention_rate FROM cohort_activity ca JOIN cohort_size cs ON ca.cohort_month = cs.cohort_month GROUP BY ca.cohort_month, ca.month_number ORDER BY ca.cohort_month, ca.month_number;"
                        ),
                        Challenge(
                            id: 3,
                            name: "月度留存率計算",
                            type: .code,
                            difficulty: .hard,
                            question: "計算每個月的留存率：month_N 活躍用戶中，在 month_N+1 也活躍的比例。顯示 activity_month, active_users, retained_next_month, retention_rate。",
                            scenario: Challenge.Scenario(
                                title: "月度用戶留存率",
                                narrative: "Growth 團隊需要追蹤月度留存率：「某月活躍的用戶中，有多少比例在下個月也活躍？」。這和 cohort retention 不同 — 這裡不按註冊月份分組，而是看整體的月到月留存。\n\n資料表：user_activity (user_id INTEGER, activity_date TEXT)",
                                data: [
                                    ["user_id": "1", "activity_date": "2024-01-05"],
                                    ["user_id": "2", "activity_date": "2024-01-10"],
                                    ["user_id": "1", "activity_date": "2024-02-03"],
                                    ["user_id": "3", "activity_date": "2024-02-15"],
                                ],
                                dataCaption: "user_activity 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用 DISTINCT 取得每月的不重複活躍用戶", "Self-join：a 是當月用戶，b 是下月用戶，用 date(..., '+1 month') 算下個月", "COUNT(DISTINCT b.user_id) 是留存人數，除以 COUNT(DISTINCT a.user_id) 是留存率"],
                            explanation: "月度留存率用 self-join 實現：monthly_users 表自己 JOIN 自己，條件是同一個 user_id 且 b 的月份 = a 的月份 + 1。LEFT JOIN 確保即使沒有留存用戶也會顯示。SQLite 中用 date(month || '-01', '+1 month') 計算下個月。這是 Growth 團隊最常看的留存指標之一。",
                            frameworkTip: "月度留存 pattern：CTE 去重取月活用戶 → self-join（同用戶 + 月份差 1） → COUNT(DISTINCT) 算留存人數。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH monthly_users AS (
                                  SELECT DISTINCT user_id,
                                         strftime('%Y-%m', activity_date) AS activity_month
                                  FROM user_activity
                                )
                                SELECT
                                  a.activity_month,
                                  COUNT(DISTINCT a.user_id) AS active_users,
                                  -- 怎麼算留存到下個月的人數？
                                  -- 怎麼算 retention_rate？
                                FROM monthly_users a
                                LEFT JOIN monthly_users b
                                  ON a.user_id = b.user_id
                                  -- 怎麼確保 b 是「下個月」？
                                GROUP BY a.activity_month
                                ORDER BY a.activity_month;
                            """,
                            expectedQuery: "WITH monthly_users AS (SELECT DISTINCT user_id, strftime('%Y-%m', activity_date) AS activity_month FROM user_activity) SELECT a.activity_month, COUNT(DISTINCT a.user_id) AS active_users, COUNT(DISTINCT b.user_id) AS retained_next_month, ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 1) AS retention_rate FROM monthly_users a LEFT JOIN monthly_users b ON a.user_id = b.user_id AND b.activity_month = strftime('%Y-%m', date(a.activity_month || '-01', '+1 month')) GROUP BY a.activity_month ORDER BY a.activity_month;"
                        ),
                        Challenge(
                            id: 4,
                            name: "MoM 營收百分比變化",
                            type: .code,
                            difficulty: .medium,
                            question: "計算每月總營收和 MoM 百分比變化。用 LAG 取上月營收。顯示 month, revenue, prev_month_revenue, mom_pct_change（四捨五入到小數第 1 位）。",
                            scenario: Challenge.Scenario(
                                title: "月營收環比變化",
                                narrative: "財務團隊需要一份報表，顯示每個月的營收和相比上月的百分比變化（MoM %）。這能幫助主管快速發現營收異常。\n\n資料表：purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT)",
                                data: [
                                    ["id": "1", "user_id": "101", "amount": "500", "purchase_date": "2024-01-15"],
                                    ["id": "2", "user_id": "102", "amount": "300", "purchase_date": "2024-01-20"],
                                    ["id": "3", "user_id": "101", "amount": "450", "purchase_date": "2024-02-10"],
                                ],
                                dataCaption: "purchases 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用 CTE 把每月營收算好，再用 LAG 取上月", "MoM % = (本月 - 上月) / 上月 * 100", "第一個月的 LAG 回傳 NULL，整個計算結果也是 NULL — 不需要額外處理"],
                            explanation: "先用 CTE 按月聚合營收，再用 LAG 取得上個月的值來計算變化率。這個 pattern 在 Quest 25-1 的 LAG 題有類似概念，但這裡多了一步：先聚合再算。在實務中，MoM 變化率是最常見的趨勢追蹤指標，幾乎每個 dashboard 都會有。",
                            frameworkTip: "MoM 計算的兩步驟：CTE 先 GROUP BY 月份算出指標 → 外層用 LAG 算環比。分開做比在同一層更清晰。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH monthly AS (
                                  SELECT strftime('%Y-%m', purchase_date) AS month,
                                         SUM(amount) AS revenue
                                  FROM purchases
                                  GROUP BY month
                                )
                                SELECT month,
                                       revenue,
                                       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
                                       -- 怎麼算 MoM 百分比變化？
                                FROM monthly
                                ORDER BY month;
                            """,
                            expectedQuery: "WITH monthly AS (SELECT strftime('%Y-%m', purchase_date) AS month, SUM(amount) AS revenue FROM purchases GROUP BY month) SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue, ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 1) AS mom_pct_change FROM monthly ORDER BY month;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-5",
                    name: "KPI 與 Dashboard Query Design",
                    description: "DAU/MAU、ARPU、轉換率 — 用 SQL 定義與計算產品核心指標",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DAU / MAU 計算",
                            type: .code,
                            difficulty: .medium,
                            question: "計算 2026 年 3 月的每日 DAU（每天不重複活躍用戶數），以及整月的 MAU 和平均 DAU/MAU 比率（保留兩位小數）。",
                            scenario: Challenge.Scenario(
                                title: "計算每日與每月活躍用戶",
                                narrative: "你正在為產品 Dashboard 建立核心指標查詢。第一個需求是計算 DAU（Daily Active Users）和 MAU（Monthly Active Users），以及 DAU/MAU 比率（也叫 Stickiness，代表用戶黏著度）。\n\n資料表：app_events (event_id INTEGER, user_id INTEGER, event_date TEXT, event_type TEXT)",
                                data: [
                                    ["event_id": "1", "user_id": "101", "event_date": "2026-03-01", "event_type": "login"],
                                    ["event_id": "2", "user_id": "102", "event_date": "2026-03-01", "event_type": "view"],
                                    ["event_id": "3", "user_id": "101", "event_date": "2026-03-02", "event_type": "click"],
                                    ["event_id": "4", "user_id": "103", "event_date": "2026-03-02", "event_type": "login"],
                                ],
                                dataCaption: "app_events 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DAU = 每天的 COUNT(DISTINCT user_id)", "MAU = 整月的 COUNT(DISTINCT user_id)", "Stickiness = 平均 DAU / MAU，數值越高代表用戶越黏著"],
                            explanation: "DAU/MAU（又稱 Stickiness）是衡量產品黏著度的核心指標。如果 DAU/MAU = 0.5，代表平均每月有一半的月活用戶每天都在用。社群產品通常在 0.3-0.6 之間。用兩個 CTE 分別算 DAU 和 MAU，最後交叉計算比率。",
                            frameworkTip: "Dashboard 指標三層：(1) 流量指標 DAU/MAU (2) 互動指標 Session 長度、事件數 (3) 商業指標 ARPU、轉換率。面試時按層次回答更有結構。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH daily_active AS (
                                  -- 每天的 DAU
                                  SELECT event_date,
                                         COUNT(DISTINCT user_id) AS dau
                                  FROM app_events
                                  WHERE event_date LIKE '2026-03%'
                                  GROUP BY event_date
                                ),
                                mau AS (
                                  -- 整月的 MAU
                                  SELECT COUNT(DISTINCT user_id) AS mau
                                  FROM app_events
                                  WHERE event_date LIKE '2026-03%'
                                )
                                -- 計算平均 DAU 和 DAU/MAU 比率
                                SELECT
                                  -- 平均 DAU, MAU, DAU/MAU
                                FROM daily_active, mau;
                            """,
                            expectedQuery: "WITH daily_active AS (SELECT event_date, COUNT(DISTINCT user_id) AS dau FROM app_events WHERE event_date LIKE '2026-03%' GROUP BY event_date), mau AS (SELECT COUNT(DISTINCT user_id) AS mau FROM app_events WHERE event_date LIKE '2026-03%') SELECT ROUND(AVG(da.dau), 1) AS avg_dau, mau.mau, ROUND(AVG(da.dau) * 1.0 / mau.mau, 2) AS stickiness FROM daily_active da, mau;"
                        ),
                        Challenge(
                            id: 2,
                            name: "轉換率與 ARPU",
                            type: .code,
                            difficulty: .medium,
                            question: "計算 2026 年 3 月的付費轉換率和 ARPU。顯示 total_active_users, paying_users, total_revenue, conversion_rate（百分比，保留一位小數）, arpu（保留兩位小數）。",
                            scenario: Challenge.Scenario(
                                title: "計算付費轉換率與 ARPU",
                                narrative: "商業分析師需要在 Dashboard 上顯示兩個關鍵指標：付費轉換率（Conversion Rate = 付費用戶數 / 總活躍用戶數）和 ARPU（Average Revenue Per User = 總營收 / 總活躍用戶數）。\n\n資料表：\n- active_users (user_id INTEGER, active_month TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)",
                                data: [
                                    ["metric": "total_active", "value": "1000"],
                                    ["metric": "paying_users", "value": "150"],
                                    ["metric": "total_revenue", "value": "75000"],
                                    ["metric": "conversion_rate", "value": "15.0%"],
                                    ["metric": "arpu", "value": "75"],
                                ],
                                dataCaption: "預期指標（範例數據）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["付費用戶數 = COUNT(DISTINCT user_id) FROM payments", "ARPU 的分母是「所有活躍用戶」，不只是付費用戶", "用子查詢在 CTE 中分別計算三個基礎數字"],
                            explanation: "轉換率 = 付費用戶數 / 總活躍用戶數，ARPU = 總營收 / 總活躍用戶數。注意 ARPU 的分母是「全部活躍用戶」（包含未付費的），而不是只有付費用戶（那是 ARPPU）。面試時常考的 follow-up 就是 ARPU vs ARPPU 的區別。",
                            frameworkTip: "ARPU vs ARPPU：ARPU = Revenue / All Users，ARPPU = Revenue / Paying Users。面試時說明兩者差異會加分。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH metrics AS (
                                  SELECT
                                    (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active,
                                    -- 付費用戶數（有付款記錄的不重複用戶）
                                    -- 總營收
                                )
                                SELECT total_active AS total_active_users,
                                       paying_users,
                                       total_revenue,
                                       -- conversion_rate 和 arpu
                                FROM metrics;
                            """,
                            expectedQuery: "WITH metrics AS (SELECT (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active, (SELECT COUNT(DISTINCT user_id) FROM payments WHERE payment_date LIKE '2026-03%') AS paying_users, (SELECT COALESCE(SUM(amount), 0) FROM payments WHERE payment_date LIKE '2026-03%') AS total_revenue) SELECT total_active AS total_active_users, paying_users, total_revenue, ROUND(paying_users * 100.0 / total_active, 1) AS conversion_rate, ROUND(total_revenue * 1.0 / total_active, 2) AS arpu FROM metrics;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Dashboard 指標設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組指標最適合作為 SaaS 產品的「北極星指標 + 支撐指標」？",
                            scenario: Challenge.Scenario(
                                title: "選擇正確的 Dashboard 指標",
                                narrative: "你正在為一個 SaaS 產品設計 Executive Dashboard。CEO 想看「產品健康度」的核心指標。目前有以下選項：",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "DAU + 頁面載入速度 + 伺服器錯誤率", explanation: "頁面載入速度和錯誤率是 Engineering 指標，不是產品健康度的核心。"),
                                Challenge.Option(id: "B", text: "MAU + DAU/MAU + 付費轉換率 + MRR", explanation: "正確！MAU 衡量規模，DAU/MAU 衡量黏著度，轉換率衡量變現效率，MRR 衡量營收。這四個指標覆蓋了用戶規模、互動品質、商業價值三個層面。"),
                                Challenge.Option(id: "C", text: "註冊人數 + 總營收 + 客服回覆時間", explanation: "這些指標太分散，沒有衡量用戶活躍度和黏著度。"),
                                Challenge.Option(id: "D", text: "NPS 分數 + 功能使用率 + Bug 修復速度", explanation: "NPS 是用戶滿意度指標，但不是產品健康度的核心 KPI。Bug 修復速度是工程指標。"),
                            ],
                            correctAnswer: "B",
                            hints: ["好的指標組合要覆蓋：規模、互動、變現", "SaaS 核心指標通常包含 MRR（Monthly Recurring Revenue）", "DAU/MAU 反映用戶是否「真的在用」產品"],
                            explanation: "設計 Dashboard 的 AARRR 框架：Acquisition（獲取）→ Activation（啟動）→ Retention（留存）→ Revenue（收入）→ Referral（推薦）。MAU 對應規模，DAU/MAU 對應留存與活躍，轉換率對應收入，MRR 對應商業價值。好的 Dashboard 用 3-5 個核心指標講一個完整的故事。",
                            frameworkTip: "面試設計 Dashboard 時，用 AARRR 或「規模 x 品質 x 變現」框架來選指標，避免堆砌無關數字。"
                        ),
                        Challenge(
                            id: 4,
                            name: "單月客戶營收排名",
                            type: .code,
                            difficulty: .medium,
                            question: "計算 2024 年 3 月份每位客戶的總營收，並用 DENSE_RANK 排名。顯示 customer_id, march_revenue, revenue_rank。按排名排序。",
                            scenario: Challenge.Scenario(
                                title: "三月份客戶營收報表",
                                narrative: "業務主管要一份「三月份各客戶的營收排名」，用來識別 VIP 客戶和評估銷售表現。\n\n資料表：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "301", "amount": "500", "order_date": "2024-03-05"],
                                    ["id": "2", "customer_id": "302", "amount": "350", "order_date": "2024-03-10"],
                                    ["id": "3", "customer_id": "301", "amount": "200", "order_date": "2024-03-15"],
                                ],
                                dataCaption: "orders 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["strftime('%Y-%m', order_date) = '2024-03' 篩選三月份", "先 WHERE 篩選月份，再 GROUP BY 客戶算總營收", "DENSE_RANK 直接在 SELECT 中對 SUM(amount) 排名"],
                            explanation: "這題結合了時間篩選、聚合和 Window Function。先用 WHERE 篩選目標月份，GROUP BY 算每位客戶的營收，再用 DENSE_RANK 排名。注意 WHERE 在 GROUP BY 之前執行，所以篩選條件要放在 WHERE 而不是 HAVING。面試中這類「特定時段的客戶排名」是非常高頻的題型。",
                            frameworkTip: "時間篩選 + 聚合 + 排名的執行順序：WHERE 篩時間 → GROUP BY 聚合 → Window Function 排名。順序不能錯。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT customer_id,
                                       SUM(amount) AS march_revenue,
                                       DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
                                FROM orders
                                WHERE -- 怎麼篩選三月份？
                                GROUP BY customer_id
                                ORDER BY revenue_rank;
                            """,
                            expectedQuery: "SELECT customer_id, SUM(amount) AS march_revenue, DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank FROM orders WHERE strftime('%Y-%m', order_date) = '2024-03' GROUP BY customer_id ORDER BY revenue_rank;"
                        ),
                        Challenge(
                            id: 5,
                            name: "行銷活動成效分析",
                            type: .code,
                            difficulty: .hard,
                            question: "計算每個行銷活動的：獲客人數、有下單的人數、下單率、總營收。排除自然流量（campaign IS NULL）。按總營收降序排列。",
                            scenario: Challenge.Scenario(
                                title: "行銷活動 ROI 評估",
                                narrative: "行銷團隊投放了多個廣告活動來獲取新用戶。PM 想知道：透過行銷活動獲得的用戶中，有多少人實際下了訂單？每個活動帶來了多少營收？\n\n資料表：\n- users (id INTEGER, signup_date TEXT, campaign TEXT)  — campaign 為 NULL 表示自然流量\n- orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "signup_date": "2024-03-01", "campaign": "spring_sale"],
                                    ["id": "2", "signup_date": "2024-03-02", "campaign": "google_ads"],
                                    ["id": "3", "signup_date": "2024-03-03", "campaign": "null"],
                                ],
                                dataCaption: "users 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 算有下單的不重複用戶數", "LEFT JOIN 確保沒下單的用戶也被計入獲客人數", "COALESCE(SUM(o.amount), 0) 處理某活動完全沒有訂單的情況"],
                            explanation: "這題結合了 LEFT JOIN、條件聚合和商業指標計算。LEFT JOIN 確保沒下單的用戶也算在獲客人數中。COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 是一個巧妙的技巧：只計算有訂單的不重複用戶。下單率 = 有下單用戶 / 總獲客用戶。這種行銷成效報表是 Growth 和 Marketing Analytics 的核心工作。",
                            frameworkTip: "行銷成效分析 pattern：LEFT JOIN 保留全量用戶 → 條件聚合區分轉化/未轉化 → 算轉化率和 ROI。LEFT JOIN 是關鍵，不能用 INNER JOIN。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT u.campaign,
                                       COUNT(DISTINCT u.id) AS acquired_users,
                                       -- 有下單的人數？
                                       -- 下單率？
                                       -- 總營收？
                                FROM users u
                                LEFT JOIN orders o ON u.id = o.user_id
                                WHERE u.campaign IS NOT NULL
                                GROUP BY u.campaign
                                ORDER BY -- 按總營收排序;
                            """,
                            expectedQuery: "SELECT u.campaign, COUNT(DISTINCT u.id) AS acquired_users, COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) AS paying_users, ROUND(COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) * 100.0 / COUNT(DISTINCT u.id), 1) AS conversion_rate, COALESCE(SUM(o.amount), 0) AS total_revenue FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.campaign IS NOT NULL GROUP BY u.campaign ORDER BY total_revenue DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-6",
                    name: "Boss: 產品分析 SQL Case",
                    description: "綜合 Boss 關卡 — 結合 Window Functions、Funnel、Segmentation 做完整產品分析",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "完整產品分析",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一段 SQL，計算每個 plan（free / pro）的用戶在「trial_start → feature_use → upgrade」漏斗中的轉換率，並用 RANK 按轉換率排名。這能幫 PM 了解哪個方案的用戶轉換表現最好。",
                            scenario: Challenge.Scenario(
                                title: "訂閱制產品完整分析",
                                narrative: "你是一位 Product Analyst，PM 要求你用 SQL 做一份完整的產品分析報告。需要結合 Window Functions（排名與趨勢）、Funnel（轉換漏斗）和 Segmentation（用戶分群），找出產品成長的機會點。\n\n資料表：\n- users (user_id INTEGER, signup_date TEXT, plan TEXT)\n- events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)",
                                data: [
                                    ["user_id": "101", "signup_date": "2025-12-01", "plan": "free"],
                                    ["user_id": "102", "signup_date": "2025-12-05", "plan": "pro"],
                                    ["user_id": "103", "signup_date": "2026-01-10", "plan": "free"],
                                ],
                                dataCaption: "users 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用 CTE 算出每個 plan 的漏斗數字", "轉換率 = 該步驟用戶數 / step1 用戶數 * 100", "RANK() OVER (ORDER BY upgrade_rate DESC) 按轉換率排名"],
                            explanation: "這道 Boss 題結合了三個核心技能：(1) Funnel 漏斗 — COUNT DISTINCT CASE WHEN 算每步人數 (2) Segmentation — GROUP BY plan 分群計算 (3) Window Function — RANK 排名。在實務中，PM 經常需要這種「分群漏斗 + 排名」的分析來決定產品策略。",
                            frameworkTip: "Product Analysis 的思路框架：先 Segment（分群）→ 再 Measure（度量，例如 Funnel）→ 最後 Rank/Compare（比較）。這三步能解決大部分產品分析問題。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                WITH funnel AS (
                                  SELECT
                                    u.plan,
                                    COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial,
                                    COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature,
                                    COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade
                                  FROM users u
                                  JOIN events e ON u.user_id = e.user_id
                                  GROUP BY u.plan
                                )
                                SELECT plan,
                                       step1_trial, step2_feature, step3_upgrade,
                                       -- 計算每步轉換率
                                       -- 用 RANK 按最終轉換率排名
                                FROM funnel
                                ORDER BY conversion_rank;
                            """,
                            expectedQuery: "WITH funnel AS (SELECT u.plan, COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial, COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature, COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade FROM users u JOIN events e ON u.user_id = e.user_id GROUP BY u.plan) SELECT plan, step1_trial, step2_feature, step3_upgrade, ROUND(step2_feature * 100.0 / step1_trial, 1) AS feature_rate, ROUND(step3_upgrade * 100.0 / step1_trial, 1) AS upgrade_rate, RANK() OVER (ORDER BY step3_upgrade * 1.0 / step1_trial DESC) AS conversion_rank FROM funnel ORDER BY conversion_rank;"
                        ),
                        Challenge(
                            id: 2,
                            name: "產品分析計畫",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請設計一套完整的分析計畫，回答以下問題：\n1. 你會建立哪些 SQL 查詢來診斷問題？（至少列出 3 個）\n2. 每個查詢的目的是什麼？\n3. 你預期可能發現什麼 insight？\n4. 你會如何向 CEO 呈現結果？",
                            scenario: Challenge.Scenario(
                                title: "設計完整的產品分析方案",
                                narrative: "你剛加入一家 B2C 訂閱制 SaaS 公司擔任 Product Analyst。PM 告訴你：「我們的付費轉換率從上個月的 8% 掉到 5%，CEO 下週要看分析報告。」\n\n你需要設計一套完整的分析計畫，用 SQL 查詢來找出原因並提出建議。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["想想 Funnel 的每一步 — 是哪一步的轉換率掉了？", "不同用戶群組的轉換率有差異嗎？新用戶 vs 舊用戶？", "是逐漸下降還是某個時間點突然掉？可以用 LAG 比較"],
                            explanation: "產品分析的核心思路是「分解 → 比較 → 假設 → 驗證」。遇到指標異常時，先分解（Funnel 看哪步掉了），再比較（分群看誰掉了），接著建立假設（為什麼掉了），最後設計驗證（A/B test 或更深入的分析）。這個思路適用於所有產品分析場景。",
                            frameworkTip: "指標異常分析框架：(1) 確認問題 — 真的掉了嗎？排除季節性和數據問題 (2) 分解 — Funnel 哪步掉 (3) 分群 — 誰掉了 (4) 時間 — 什麼時候掉 (5) 假設 → 建議。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 26,
            name: "SQL 工程應用",
            emoji: "⚙️",
            description: "CRUD、資料庫設計與效能優化 — Business Engineer 的 SQL 實戰",
            quests: [
                Quest(
                    id: "26-1",
                    name: "INSERT / UPDATE / DELETE",
                    description: "學會新增、更新與安全刪除資料的核心操作",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INSERT 新增資料",
                            type: .code,
                            difficulty: .easy,
                            question: "使用 INSERT INTO 將以下三位新員工加入 employees 資料表：\n- id=4, 陳志明, Engineering, 2024-06-01\n- id=5, 林佳穎, Marketing, 2024-06-01\n- id=6, 黃建豪, Sales, 2024-06-15",
                            scenario: Challenge.Scenario(
                                title: "新增員工到人事系統",
                                narrative: "公司剛錄取了三位新員工，HR 請你把他們的資料寫入 employees 資料表。每位員工需要填入姓名、部門和入職日期。\n\n資料表結構：employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "Engineering", "hire_date": "2024-01-15"],
                                    ["id": "2", "name": "李美玲", "department": "Marketing", "hire_date": "2024-02-01"],
                                    ["id": "3", "name": "張大衛", "department": "Sales", "hire_date": "2024-03-10"],
                                ],
                                dataCaption: "employees 現有資料"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["INSERT INTO 表名 VALUES (值1, 值2, ...); 可以逐筆新增", "也可以用 INSERT INTO 表名 (欄位1, 欄位2) VALUES (...) 指定欄位", "最後用 SELECT * FROM employees 確認結果"],
                            explanation: "INSERT INTO 是 SQL 最基本的寫入操作。完整語法：INSERT INTO table_name (col1, col2, ...) VALUES (val1, val2, ...)。如果依照欄位順序填入所有值，可以省略欄位名稱。實務上建議明確列出欄位名，避免資料表結構變動時出錯。",
                            frameworkTip: "INSERT 小技巧：(1) 明確列出欄位名稱比省略更安全 (2) 批次插入可用多個 VALUES 子句或多條 INSERT (3) 搭配 SELECT 驗證插入結果。",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT);
                                INSERT INTO employees VALUES (1, '王小明', 'Engineering', '2024-01-15');
                                INSERT INTO employees VALUES (2, '李美玲', 'Marketing', '2024-02-01');
                                INSERT INTO employees VALUES (3, '張大衛', 'Sales', '2024-03-10');
                            """,
                            starterCode: """
                                -- 新增三位員工到 employees 資料表
                                INSERT INTO employees VALUES (4, '陳志明', 'Engineering', '2024-06-01');
                                -- 繼續新增其餘兩位...
                            """,
                            expectedQuery: "INSERT INTO employees VALUES (4, '陳志明', 'Engineering', '2024-06-01'); INSERT INTO employees VALUES (5, '林佳穎', 'Marketing', '2024-06-01'); INSERT INTO employees VALUES (6, '黃建豪', 'Sales', '2024-06-15'); SELECT * FROM employees ORDER BY id;"
                        ),
                        Challenge(
                            id: 2,
                            name: "UPDATE 更新資料",
                            type: .code,
                            difficulty: .easy,
                            question: "完成兩項更新：\n1. Engineering 部門所有員工的 salary 調高 10%\n2. 將「張大衛」的 department 改為 Marketing",
                            scenario: Challenge.Scenario(
                                title: "調整員工部門與薪資",
                                narrative: "年中組織調整，Engineering 部門的員工全部調薪 10%，同時「張大衛」從 Sales 調到 Marketing 部門。請用 UPDATE 語句完成這兩項變更。\n\n資料表結構：employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "Engineering", "salary": "80000"],
                                    ["id": "2", "name": "李美玲", "department": "Marketing", "salary": "75000"],
                                    ["id": "3", "name": "張大衛", "department": "Sales", "salary": "70000"],
                                    ["id": "4", "name": "陳志明", "department": "Engineering", "salary": "85000"],
                                ],
                                dataCaption: "employees 資料表"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPDATE 表名 SET 欄位 = 新值 WHERE 條件;", "調薪 10% 可以寫成 salary = salary * 1.1", "一定要加 WHERE 條件，否則會更新所有資料列！"],
                            explanation: "UPDATE 搭配 WHERE 子句可以精確更新特定資料列。最重要的原則：永遠不要忘記 WHERE 條件。沒有 WHERE 的 UPDATE 會影響整張表的所有資料列，這在生產環境中是災難性的錯誤。",
                            frameworkTip: "UPDATE 安全守則：(1) 先用 SELECT 確認 WHERE 條件會影響哪些列 (2) 確認影響範圍正確再執行 UPDATE (3) 在交易（Transaction）中執行，出錯可 ROLLBACK。",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL);
                                INSERT INTO employees VALUES (1, '王小明', 'Engineering', 80000);
                                INSERT INTO employees VALUES (2, '李美玲', 'Marketing', 75000);
                                INSERT INTO employees VALUES (3, '張大衛', 'Sales', 70000);
                                INSERT INTO employees VALUES (4, '陳志明', 'Engineering', 85000);
                            """,
                            starterCode: """
                                -- 1. Engineering 部門調薪 10%
                                UPDATE employees
                                SET salary = salary * 1.1
                                WHERE department = 'Engineering';

                                -- 2. 張大衛轉部門
                                -- 請完成這段 UPDATE ...

                                SELECT * FROM employees ORDER BY id;
                            """,
                            expectedQuery: "UPDATE employees SET salary = salary * 1.1 WHERE department = 'Engineering'; UPDATE employees SET department = 'Marketing' WHERE name = '張大衛'; SELECT * FROM employees ORDER BY id;"
                        ),
                        Challenge(
                            id: 3,
                            name: "DELETE 安全刪除",
                            type: .code,
                            difficulty: .medium,
                            question: "安全地刪除 2023 年以前的訂單：先刪除對應的 order_items，再刪除 orders。用 SELECT 驗證刪除前後的資料。",
                            scenario: Challenge.Scenario(
                                title: "清理過期訂單與關聯明細",
                                narrative: "電商系統中有 orders 和 order_items 兩張表。主管要求刪除所有 2023 年以前（不含 2023）的訂單及其相關的訂單明細。你必須先刪除子表（order_items）再刪除主表（orders），否則會違反外鍵約束。\n\n資料表結構：\n- orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL)\n- order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER)",
                                data: [
                                    ["id": "1", "customer": "王小明", "order_date": "2022-06-15", "total": "1500"],
                                    ["id": "2", "customer": "李美玲", "order_date": "2022-11-20", "total": "3200"],
                                    ["id": "3", "customer": "張大衛", "order_date": "2023-03-10", "total": "800"],
                                    ["id": "4", "customer": "陳志明", "order_date": "2024-01-05", "total": "2100"],
                                ],
                                dataCaption: "orders 資料表（order_items 省略）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用 SELECT 確認 WHERE 條件抓到的資料是正確的", "order_items 的刪除可以用子查詢：WHERE order_id IN (SELECT id FROM orders WHERE ...)", "刪除順序很重要：先子表再主表，避免外鍵約束錯誤"],
                            explanation: "在有外鍵關聯的資料表中刪除資料，必須注意刪除順序：先刪除子表（引用端），再刪除主表（被引用端）。這裡用子查詢 WHERE order_id IN (SELECT id FROM orders WHERE ...) 精確定位要刪除的 order_items。實務上也可以設定 ON DELETE CASCADE 讓資料庫自動處理，但手動控制更安全。",
                            frameworkTip: "DELETE 安全四步驟：(1) SELECT 確認範圍 (2) 刪子表 (3) 刪主表 (4) SELECT 驗證結果。生產環境一定要在 Transaction 中執行。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                -- 步驟 1：先確認要刪除哪些訂單
                                SELECT * FROM orders WHERE order_date < '2023-01-01';

                                -- 步驟 2：先刪除子表的關聯資料
                                -- DELETE FROM order_items WHERE ...;

                                -- 步驟 3：再刪除主表的訂單
                                -- DELETE FROM orders WHERE ...;

                                -- 步驟 4：確認結果
                                SELECT * FROM orders;
                                SELECT * FROM order_items;
                            """,
                            expectedQuery: "DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE order_date < '2023-01-01'); DELETE FROM orders WHERE order_date < '2023-01-01'; SELECT * FROM orders; SELECT * FROM order_items;"
                        ),
                        Challenge(
                            id: 4,
                            name: "刪除重複資料",
                            type: .code,
                            difficulty: .easy,
                            question: "刪除 contacts 資料表中 email 重複的資料，只保留每個 email 中 id 最小的那筆。",
                            scenario: Challenge.Scenario(
                                title: "清理重複的客戶 Email",
                                narrative: "行銷團隊匯入了一批名單到 contacts 資料表，但因為檔案重複匯入，有些 email 出現了多筆紀錄。主管請你刪除重複的資料，只保留每個 email 最早的那筆（id 最小的）。\n\n資料表結構：contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
                                data: [
                                    ["id": "1", "email": "alice@mail.com", "name": "Alice", "created_at": "2024-01-10"],
                                    ["id": "2", "email": "bob@mail.com", "name": "Bob", "created_at": "2024-01-12"],
                                    ["id": "3", "email": "alice@mail.com", "name": "Alice Lin", "created_at": "2024-01-15"],
                                    ["id": "4", "email": "charlie@mail.com", "name": "Charlie", "created_at": "2024-01-18"],
                                    ["id": "5", "email": "bob@mail.com", "name": "Bob Wang", "created_at": "2024-01-20"],
                                ],
                                dataCaption: "contacts 資料表（可看到 alice 和 bob 各有兩筆）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 GROUP BY email 搭配 MIN(id) 可以找出每個 email 最早的那筆", "DELETE ... WHERE id NOT IN (子查詢) 可以刪除不在保留名單中的資料"],
                            explanation: "這是經典的刪除重複資料問題（LeetCode #196 變體）。核心思路：先用子查詢 SELECT MIN(id) FROM contacts GROUP BY email 找出每個 email 要保留的 id，再用 DELETE ... WHERE id NOT IN (...) 刪除其他的。面試中這題考的是 DELETE 搭配子查詢的能力，以及對 GROUP BY 聚合的理解。",
                            frameworkTip: "刪除重複資料的標準步驟：(1) 先用 SELECT 確認哪些是重複的 (2) 用子查詢找出要保留的 id (3) DELETE 不在保留名單中的資料。記得先跑 SELECT 確認再改成 DELETE。",
                            sampleSchema: """
                                CREATE TABLE contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT);
                                INSERT INTO contacts VALUES (1, 'alice@mail.com', 'Alice', '2024-01-10');
                                INSERT INTO contacts VALUES (2, 'bob@mail.com', 'Bob', '2024-01-12');
                                INSERT INTO contacts VALUES (3, 'alice@mail.com', 'Alice Lin', '2024-01-15');
                                INSERT INTO contacts VALUES (4, 'charlie@mail.com', 'Charlie', '2024-01-18');
                                INSERT INTO contacts VALUES (5, 'bob@mail.com', 'Bob Wang', '2024-01-20');
                                INSERT INTO contacts VALUES (6, 'alice@mail.com', 'Alice C', '2024-02-01');
                            """,
                            starterCode: """
                                DELETE FROM contacts
                                WHERE id NOT IN (
                                  -- 怎麼找出每個 email 最小的 id？
                                );
                            """,
                            expectedQuery: "DELETE FROM contacts WHERE id NOT IN (SELECT MIN(id) FROM contacts GROUP BY email);"
                        ),
                    ]
                ),
                Quest(
                    id: "26-2",
                    name: "CREATE TABLE 與資料型態",
                    description: "設計資料表結構、選擇正確的資料型態與約束",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CREATE TABLE 建表",
                            type: .code,
                            difficulty: .easy,
                            question: "根據需求建立 products 資料表，並插入兩筆測試資料，最後用 SELECT 查看結果。",
                            scenario: Challenge.Scenario(
                                title: "設計電商產品資料表",
                                narrative: "你正在開發一個電商平台的後端，需要建立一張 products 資料表來存放商品資訊。需求如下：\n- 每個產品有唯一 id（自動遞增主鍵）\n- 產品名稱不可為空\n- 價格為小數，預設值 0\n- 庫存數量為整數，不可為負數\n- 分類為文字\n- 上架日期為文字格式",
                                data: [
                                    ["column": "id", "type": "INTEGER", "constraint": "PRIMARY KEY"],
                                    ["column": "name", "type": "TEXT", "constraint": "NOT NULL"],
                                    ["column": "price", "type": "REAL", "constraint": "DEFAULT 0"],
                                    ["column": "stock", "type": "INTEGER", "constraint": "CHECK(stock >= 0)"],
                                    ["column": "category", "type": "TEXT", "constraint": ""],
                                    ["column": "listed_date", "type": "TEXT", "constraint": ""],
                                ],
                                dataCaption: "預期的欄位設計"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SQLite 用 INTEGER PRIMARY KEY 就會自動遞增", "CHECK 約束可以限制欄位值的範圍，例如 CHECK(stock >= 0)", "DEFAULT 可以設定欄位的預設值"],
                            explanation: "CREATE TABLE 是定義資料庫結構的基礎。SQLite 的資料型態比較簡單：INTEGER、REAL、TEXT、BLOB。約束（Constraints）包括 PRIMARY KEY（主鍵）、NOT NULL（不可為空）、UNIQUE（唯一值）、DEFAULT（預設值）、CHECK（條件檢查）。好的資料表設計能從源頭防止不合法的資料進入系統。",
                            frameworkTip: "CREATE TABLE 設計原則：(1) 每張表都要有 PRIMARY KEY (2) 用 NOT NULL 保護必填欄位 (3) 用 CHECK 限制數值範圍 (4) 用 DEFAULT 提供合理預設值。",
                            starterCode: """
                                -- 建立 products 資料表
                                CREATE TABLE products (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  -- 補完其餘欄位...
                                );

                                -- 插入測試資料
                                INSERT INTO products (name, price, stock, category, listed_date)
                                VALUES ('無線藍牙耳機', 1290, 50, '3C', '2024-06-01');

                                -- 再插入一筆...

                                SELECT * FROM products;
                            """,
                            expectedQuery: "CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL, price REAL DEFAULT 0, stock INTEGER CHECK(stock >= 0), category TEXT, listed_date TEXT); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('無線藍牙耳機', 1290, 50, '3C', '2024-06-01'); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('機械鍵盤', 2490, 30, '3C', '2024-06-10'); SELECT * FROM products;"
                        ),
                        Challenge(
                            id: 2,
                            name: "資料型態與約束",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪一個 CREATE TABLE 語句最正確地實現了上述需求？",
                            scenario: Challenge.Scenario(
                                title: "選擇正確的資料型態與約束",
                                narrative: "你正在為一間物流公司設計資料庫。其中有一張 shipments 資料表，欄位包括：出貨編號（唯一識別碼）、收件人名稱（必填）、重量（公斤，可以有小數）、運費（不可為負數）、狀態（只能是 pending / shipped / delivered）。",
                                data: [
                                    ["column": "shipment_id", "description": "唯一識別碼"],
                                    ["column": "recipient", "description": "必填的收件人名稱"],
                                    ["column": "weight_kg", "description": "重量，可有小數"],
                                    ["column": "shipping_fee", "description": "運費，不可為負數"],
                                    ["column": "status", "description": "只能是 pending/shipped/delivered"],
                                ],
                                dataCaption: "shipments 資料表需求"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee >= 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));", explanation: "正確！INTEGER PRIMARY KEY 作為唯一識別碼、TEXT NOT NULL 確保必填、REAL 處理小數、CHECK 約束限制值的範圍和允許的選項。"),
                                Challenge.Option(id: "B", text: "CREATE TABLE shipments (shipment_id VARCHAR PRIMARY KEY, recipient VARCHAR, weight_kg DECIMAL, shipping_fee DECIMAL, status VARCHAR);", explanation: "錯誤。SQLite 不使用 VARCHAR 和 DECIMAL（應用 TEXT 和 REAL）；recipient 缺少 NOT NULL；shipping_fee 和 status 沒有 CHECK 約束。"),
                                Challenge.Option(id: "C", text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT, weight_kg REAL, shipping_fee REAL, status TEXT DEFAULT 'pending');", explanation: "不完全正確。recipient 缺少 NOT NULL、shipping_fee 缺少 CHECK(>= 0)、status 雖有 DEFAULT 但沒有 CHECK 約束來限制允許的值。"),
                                Challenge.Option(id: "D", text: "CREATE TABLE shipments (shipment_id INTEGER UNIQUE, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee > 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));", explanation: "接近但不完全正確。shipment_id 用 UNIQUE 而非 PRIMARY KEY（缺少主鍵）；shipping_fee 用 CHECK(> 0) 但運費可以為 0（免運），應為 >= 0。"),
                            ],
                            correctAnswer: "A",
                            hints: ["SQLite 使用 TEXT 而非 VARCHAR，用 REAL 而非 DECIMAL", "NOT NULL 確保欄位不可為空", "CHECK(status IN ('a', 'b', 'c')) 可以限制允許的值"],
                            explanation: "資料型態選擇和約束設計是資料庫設計的基礎功。SQLite 的型態較簡單（INTEGER, REAL, TEXT, BLOB），但搭配 CHECK、NOT NULL、DEFAULT 等約束，能在資料庫層面防止不合法資料。好的 schema 設計讓你的應用程式少寫很多驗證邏輯。",
                            frameworkTip: "約束選擇指南：唯一識別 → PRIMARY KEY；必填 → NOT NULL；數值範圍 → CHECK；允許值列表 → CHECK ... IN (...)；預設值 → DEFAULT。"
                        ),
                        Challenge(
                            id: 3,
                            name: "部門最高薪員工",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一段 SQL 查詢，找出每個部門中薪資最高的員工姓名、部門名稱和薪資。如果某部門有多人同為最高薪，全部列出。",
                            scenario: Challenge.Scenario(
                                title: "找出各部門薪資最高的員工",
                                narrative: "HR 部門要做年度薪資報告，需要列出每個部門中薪資最高的員工。你需要先理解資料表結構，再寫出查詢。\n\n資料表結構：\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice", "salary": "85000", "department": "Engineering"],
                                    ["id": "2", "name": "Bob", "salary": "92000", "department": "Engineering"],
                                    ["id": "3", "name": "Charlie", "salary": "78000", "department": "Marketing"],
                                    ["id": "4", "name": "Diana", "salary": "81000", "department": "Marketing"],
                                    ["id": "5", "name": "Eve", "salary": "95000", "department": "Engineering"],
                                ],
                                dataCaption: "workers + departments（合併展示）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用相關子查詢（correlated subquery）：內層查詢引用外層的 department_id", "SELECT MAX(salary) FROM workers WHERE department_id = 外層的 department_id"],
                            explanation: "這題的關鍵是「相關子查詢」（correlated subquery）：內層的 WHERE w2.department_id = w.department_id 會針對外層每一列動態計算該部門的最高薪資。相比 GROUP BY 方案，這種寫法可以自然地處理「同部門多人同為最高薪」的情境。這是微軟等大公司面試常考的 SQL 模式。",
                            frameworkTip: "「找出每組中最大/最小值對應的完整資料」是經典面試模式。兩種解法：(1) 相關子查詢 WHERE val = (SELECT MAX...) (2) 視窗函式 RANK() OVER (PARTITION BY ...)。面試時兩種都能講更好。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT w.name, d.dept_name, w.salary
                                FROM workers w
                                JOIN departments d ON w.department_id = d.id
                                WHERE w.salary = (
                                  -- 怎麼找出同部門的最高薪資？
                                );
                            """,
                            expectedQuery: "SELECT w.name, d.dept_name, w.salary FROM workers w JOIN departments d ON w.department_id = d.id WHERE w.salary = (SELECT MAX(w2.salary) FROM workers w2 WHERE w2.department_id = w.department_id);"
                        ),
                    ]
                ),
                Quest(
                    id: "26-3",
                    name: "CRUD 與應用程式資料流",
                    description: "理解 CRUD 操作如何對應到 Web 應用的資料流",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CRUD 完整操作",
                            type: .code,
                            difficulty: .easy,
                            question: "依序執行 CRUD 操作：\n1. INSERT 新增「部署新版本」\n2. SELECT 查看所有待辦\n3. UPDATE 將 id=1 標記完成\n4. DELETE 刪除所有已完成的事項\n最後 SELECT 確認結果。",
                            scenario: Challenge.Scenario(
                                title: "待辦事項的完整 CRUD",
                                narrative: "你正在開發一個待辦事項 App 的後端 API。需要依序完成以下操作：\n1. Create — 新增一筆待辦事項\n2. Read — 查詢所有待辦事項\n3. Update — 將某筆事項標記為完成\n4. Delete — 刪除已完成的事項\n\n資料表結構：todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT)",
                                data: [
                                    ["id": "1", "title": "完成專案報告", "is_done": "0", "created_at": "2024-06-01"],
                                    ["id": "2", "title": "準備週會簡報", "is_done": "1", "created_at": "2024-06-02"],
                                    ["id": "3", "title": "回覆客戶信件", "is_done": "0", "created_at": "2024-06-03"],
                                ],
                                dataCaption: "todos 資料表"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPDATE todos SET is_done = 1 WHERE id = 1;", "DELETE FROM todos WHERE is_done = 1; 會刪除所有已完成的事項", "CRUD 就是 Create(INSERT), Read(SELECT), Update(UPDATE), Delete(DELETE)"],
                            explanation: "CRUD 是所有資料驅動應用的核心操作模式。幾乎每個 Web/App 後端都是在對資料庫做 CRUD。理解這四個操作如何組合成完整的業務邏輯，是成為 Business Engineer 的基礎。",
                            frameworkTip: "CRUD 對應表：Create → INSERT、Read → SELECT、Update → UPDATE、Delete → DELETE。在 REST API 中分別對應 POST、GET、PUT/PATCH、DELETE。",
                            sampleSchema: """
                                CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT);
                                INSERT INTO todos VALUES (1, '完成專案報告', 0, '2024-06-01');
                                INSERT INTO todos VALUES (2, '準備週會簡報', 1, '2024-06-02');
                                INSERT INTO todos VALUES (3, '回覆客戶信件', 0, '2024-06-03');
                            """,
                            starterCode: """
                                -- C: Create
                                INSERT INTO todos (title, created_at) VALUES ('部署新版本', '2024-06-04');

                                -- R: Read
                                SELECT * FROM todos;

                                -- U: Update（將 id=1 標記完成）
                                -- UPDATE ...

                                -- D: Delete（刪除已完成的事項）
                                -- DELETE ...

                                -- 確認最終結果
                                SELECT * FROM todos;
                            """,
                            expectedQuery: "INSERT INTO todos (title, created_at) VALUES ('部署新版本', '2024-06-04'); SELECT * FROM todos; UPDATE todos SET is_done = 1 WHERE id = 1; DELETE FROM todos WHERE is_done = 1; SELECT * FROM todos;"
                        ),
                        Challenge(
                            id: 2,
                            name: "HTTP 與 SQL 對應",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個選項正確描述了 HTTP Method 和 SQL 操作的對應關係？",
                            scenario: Challenge.Scenario(
                                title: "REST API 與 SQL 的對應關係",
                                narrative: "你正在設計一個 REST API 來管理客戶資料。前端會發送不同的 HTTP 請求，後端需要將這些請求對應到正確的 SQL 操作。\n\n例如：\n- 前端送出 POST /api/customers 加上 JSON body → 後端執行什麼 SQL？\n- 前端送出 GET /api/customers/123 → 後端執行什麼 SQL？\n- 前端送出 PUT /api/customers/123 加上 JSON body → 後端執行什麼 SQL？\n- 前端送出 DELETE /api/customers/123 → 後端執行什麼 SQL？",
                                data: [
                                    ["method": "POST", "path": "/api/customers", "action": "新增客戶"],
                                    ["method": "GET", "path": "/api/customers/:id", "action": "查詢單筆客戶"],
                                    ["method": "PUT", "path": "/api/customers/:id", "action": "更新客戶資料"],
                                    ["method": "DELETE", "path": "/api/customers/:id", "action": "刪除客戶"],
                                ],
                                dataCaption: "REST API 端點"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "POST → INSERT、GET → SELECT、PUT → UPDATE、DELETE → DELETE", explanation: "正確！這是 RESTful API 中最標準的對應方式。POST 新增資源對應 INSERT，GET 讀取對應 SELECT，PUT 更新對應 UPDATE，DELETE 刪除對應 DELETE。"),
                                Challenge.Option(id: "B", text: "GET → INSERT、POST → SELECT、PUT → DELETE、DELETE → UPDATE", explanation: "完全錯誤。GET 是讀取操作不應該修改資料，POST 是新增操作不是查詢。"),
                                Challenge.Option(id: "C", text: "POST → INSERT、GET → SELECT、PATCH → INSERT、DELETE → UPDATE", explanation: "不正確。PATCH 是部分更新，不是新增；DELETE 是刪除，不是更新。"),
                                Challenge.Option(id: "D", text: "POST → SELECT、GET → INSERT、PUT → DELETE、DELETE → UPDATE", explanation: "完全相反。POST 是寫入操作，GET 是讀取操作，PUT 是更新，DELETE 是刪除。"),
                            ],
                            correctAnswer: "A",
                            hints: ["HTTP GET 是「讀取」操作，對應到 SQL 的「讀取」操作", "POST 表示「創建新資源」", "REST 的設計原則是 HTTP Method 語意明確"],
                            explanation: "RESTful API 的核心設計理念是讓 HTTP Method 語意化：POST（創建）→ INSERT、GET（讀取）→ SELECT、PUT/PATCH（更新）→ UPDATE、DELETE（刪除）→ DELETE。這套 CRUD 映射是 Web 開發的基礎知識，面試必考。另外 PUT 是全量更新，PATCH 是部分更新，兩者對應到 UPDATE 時 SET 的欄位數量不同。",
                            frameworkTip: "HTTP ↔ CRUD ↔ SQL 三重對應：POST=Create=INSERT、GET=Read=SELECT、PUT/PATCH=Update=UPDATE、DELETE=Delete=DELETE。"
                        ),
                        Challenge(
                            id: 3,
                            name: "交易處理 Transaction",
                            type: .code,
                            difficulty: .medium,
                            question: "使用 BEGIN / COMMIT 實現一筆轉帳交易：從王小明（id=1）轉帳 15000 到李美玲（id=2）。確保兩個 UPDATE 在同一個交易中完成。",
                            scenario: Challenge.Scenario(
                                title: "銀行轉帳的交易安全",
                                narrative: "銀行系統中，轉帳必須是「原子操作」：A 帳戶扣款和 B 帳戶加款必須同時成功或同時失敗。如果扣款成功但加款失敗（例如系統當機），必須回滾（ROLLBACK）。\n\n資料表結構：accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0))",
                                data: [
                                    ["id": "1", "owner": "王小明", "balance": "50000"],
                                    ["id": "2", "owner": "李美玲", "balance": "30000"],
                                    ["id": "3", "owner": "張大衛", "balance": "10000"],
                                ],
                                dataCaption: "accounts 帳戶餘額"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["BEGIN TRANSACTION 開啟交易，COMMIT 提交，ROLLBACK 回滾", "兩個 UPDATE 必須放在 BEGIN 和 COMMIT 之間", "CHECK(balance >= 0) 會防止餘額變成負數"],
                            explanation: "Transaction（交易）確保一組操作的原子性（Atomicity）：要嘛全部成功，要嘛全部回滾。ACID 四特性：Atomicity（原子性）、Consistency（一致性）、Isolation（隔離性）、Durability（持久性）。轉帳是最經典的交易場景，面試中經常用來考 Transaction 的概念。",
                            frameworkTip: "Transaction 三步驟：BEGIN → 執行多條 SQL → COMMIT（成功）或 ROLLBACK（失敗）。金融操作、庫存扣減等涉及多表變更的操作，一定要用 Transaction。",
                            sampleSchema: """
                                CREATE TABLE accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0));
                                INSERT INTO accounts VALUES (1, '王小明', 50000);
                                INSERT INTO accounts VALUES (2, '李美玲', 30000);
                                INSERT INTO accounts VALUES (3, '張大衛', 10000);
                            """,
                            starterCode: """
                                -- 開始交易
                                BEGIN TRANSACTION;

                                -- 從王小明帳戶扣款 15000
                                UPDATE accounts SET balance = balance - 15000 WHERE id = 1;

                                -- 向李美玲帳戶加款 15000
                                -- 請完成...

                                -- 提交交易
                                COMMIT;

                                -- 確認結果
                                SELECT * FROM accounts;
                            """,
                            expectedQuery: "BEGIN TRANSACTION; UPDATE accounts SET balance = balance - 15000 WHERE id = 1; UPDATE accounts SET balance = balance + 15000 WHERE id = 2; COMMIT; SELECT * FROM accounts;"
                        ),
                        Challenge(
                            id: 4,
                            name: "訂單生命週期 SQL 追蹤",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個選項正確描述了從「用戶下單」到「退款完成」的完整 SQL 操作順序？",
                            scenario: Challenge.Scenario(
                                title: "電商訂單的完整生命週期",
                                narrative: "你在 Amazon 面試，面試官給了一個訂單處理系統的場景。一筆訂單從「用戶下單」到「退貨完成」會經歷完整的生命週期。系統涉及以下資料表：\n\n- orders (id, user_id, total_amount, status, created_at, updated_at)\n- order_items (id, order_id, product_id, quantity, unit_price)\n- inventory (product_id, stock_quantity)\n- payments (id, order_id, amount, payment_method, status, paid_at)\n- refunds (id, order_id, amount, reason, status, created_at)\n\n面試官問你：一筆訂單從下單到退貨完成，依序會觸發哪些 SQL 操作？",
                                data: [
                                    ["階段": "1. 下單", "狀態": "pending"],
                                    ["階段": "2. 付款成功", "狀態": "paid"],
                                    ["階段": "3. 出貨", "狀態": "shipped"],
                                    ["階段": "4. 送達", "狀態": "delivered"],
                                    ["階段": "5. 申請退貨", "狀態": "return_requested"],
                                    ["階段": "6. 退款完成", "狀態": "refunded"],
                                ],
                                dataCaption: "訂單生命週期階段"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "下單：INSERT orders → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：DELETE orders + DELETE order_items", explanation: "退貨絕對不是 DELETE！刪除訂單會失去所有歷史紀錄，無法做財務對帳和審計。退貨應該是 UPDATE 狀態 + INSERT 退款紀錄。"),
                                Challenge.Option(id: "B", text: "下單：INSERT orders + INSERT order_items + UPDATE inventory（扣庫存）→ 付款：INSERT payments + UPDATE orders status → 出貨：UPDATE orders status → 送達：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds + UPDATE inventory（加回庫存）+ UPDATE payments status", explanation: "正確！完整的訂單生命週期涉及多張表的協同操作。下單時要同時新增訂單主表、明細和扣庫存。付款時新增付款紀錄並更新訂單狀態。退貨時要更新訂單狀態、新增退款紀錄、歸還庫存、更新付款狀態。每個階段都是用 INSERT 或 UPDATE，永遠不會 DELETE。"),
                                Challenge.Option(id: "C", text: "下單：INSERT orders → 付款：INSERT payments → 出貨：INSERT shipments → 退貨：INSERT refunds", explanation: "只有 INSERT 是不夠的。每個階段除了新增紀錄，還需要 UPDATE 現有表的狀態（如 orders.status）。而且下單時也要扣庫存（UPDATE inventory）。"),
                                Challenge.Option(id: "D", text: "下單：INSERT orders + INSERT order_items → 付款：UPDATE orders status → 出貨：UPDATE orders status → 退貨：UPDATE orders status + INSERT refunds", explanation: "遺漏了幾個關鍵操作：下單時沒有扣庫存（UPDATE inventory）、付款時沒有新增付款紀錄（INSERT payments）、退貨時沒有歸還庫存。實務中每個環節都需要完整的資料操作。"),
                            ],
                            correctAnswer: "B",
                            hints: ["想想每個階段「新增了什麼紀錄」和「更新了哪些現有資料」", "庫存在下單時扣除，退貨時要記得加回去", "實務中永遠不會 DELETE 訂單，只會用 UPDATE status 標記狀態"],
                            explanation: "訂單生命週期是電商系統最核心的資料流。關鍵要點：(1) 每個狀態轉換都是 UPDATE orders.status (2) 重要事件要 INSERT 到對應的紀錄表（payments、refunds）(3) 庫存是雙向的——下單扣除、退貨歸還 (4) 所有操作應該在 transaction 中執行，確保一致性。面試中能講出完整的多表操作和 transaction 概念會大大加分。",
                            frameworkTip: "描述資料流時，用「哪張表、什麼操作、為什麼」的格式：INSERT orders（建立訂單紀錄）→ UPDATE inventory（扣庫存）→ 以此類推。展示你對每個操作背後商業邏輯的理解。"
                        ),
                    ]
                ),
                Quest(
                    id: "26-4",
                    name: "SQL 與 Python 整合",
                    description: "了解 SQL 注入防護與 Python 中使用 SQL 的最佳實踐",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SQL 注入防護",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪種方式是防止 SQL Injection 的最佳實踐？",
                            scenario: Challenge.Scenario(
                                title: "防止 SQL Injection 攻擊",
                                narrative: "你的同事寫了一段 Python 登入驗證程式：\n\n```python\nusername = input(\"帳號: \")\npassword = input(\"密碼: \")\nquery = f\"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'\"\ncursor.execute(query)\n```\n\n這段程式有嚴重的安全漏洞。如果使用者在帳號欄位輸入 `admin' --`，SQL 會變成：\nSELECT * FROM users WHERE username = 'admin' --' AND password = '...'\n\n`--` 之後變成註解，密碼驗證被跳過了！",
                                data: [
                                    ["input": "admin' --", "result": "繞過密碼驗證，直接登入 admin 帳號"],
                                    ["input": "' OR '1'='1", "result": "回傳所有用戶資料"],
                                    ["input": "'; DROP TABLE users; --", "result": "刪除整張 users 資料表"],
                                ],
                                dataCaption: "常見的 SQL 注入攻擊範例"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "使用參數化查詢（Parameterized Query）：cursor.execute(\"SELECT * FROM users WHERE username = ? AND password = ?\", (username, password))", explanation: "正確！參數化查詢讓資料庫引擎自動處理特殊字元的轉義，從根本上防止 SQL 注入。這是業界公認的最佳做法。"),
                                Challenge.Option(id: "B", text: "手動過濾特殊字元：username = username.replace(\"'\", \"''\")", explanation: "不推薦。手動過濾容易遺漏邊界情況（如 Unicode 字元、不同資料庫的轉義規則），而且難以維護。應使用資料庫提供的參數化查詢。"),
                                Challenge.Option(id: "C", text: "限制輸入長度：if len(username) > 20: raise Error", explanation: "不足夠。限制長度可以降低風險但無法真正防止注入。短字串如 ' OR 1=1-- 已經可以造成攻擊。"),
                                Challenge.Option(id: "D", text: "只允許英文和數字：re.match(r\"^[a-zA-Z0-9]+$\", username)", explanation: "過度限制且不夠全面。有些合法的使用者名稱可能包含特殊字元（如 email 格式）。參數化查詢才是根本解法。"),
                            ],
                            correctAnswer: "A",
                            hints: ["參數化查詢用 ? 或 :name 作為佔位符，資料庫自動處理轉義", "f-string 或字串拼接是 SQL 注入的根源", "ORM（如 SQLAlchemy）內部也是使用參數化查詢"],
                            explanation: "SQL Injection 是 OWASP Top 10 安全漏洞之首。防禦的黃金法則：永遠不要用字串拼接組合 SQL 查詢。使用參數化查詢（Parameterized Query），讓資料庫引擎負責處理特殊字元。Python sqlite3 用 ? 佔位符，其他語言/框架也有類似機制（如 Java 的 PreparedStatement、Node.js 的 $ 佔位符）。",
                            frameworkTip: "防 SQL 注入三原則：(1) 永遠使用參數化查詢 (2) 永遠不要拼接使用者輸入到 SQL 字串 (3) 使用 ORM 框架可以進一步減少風險。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Python + SQL 整合設計",
                            type: .openEnded,
                            difficulty: .medium,
                            question: "請描述你會如何設計這個 Python + SQLite 的資料存取層。需要涵蓋：\n1. 資料表結構設計\n2. 連線管理（何時開啟/關閉連線）\n3. 錯誤處理策略\n4. SQL 注入防護\n5. 你會選擇直接用 sqlite3 還是 ORM？為什麼？",
                            scenario: Challenge.Scenario(
                                title: "設計 Python + SQLite 的資料存取層",
                                narrative: "你的團隊要開發一個「客戶管理系統」。技術選型為 Python + SQLite。你需要設計資料存取層（Data Access Layer），讓業務邏輯可以透過簡潔的 Python 函式來操作資料庫，而不需要直接寫 SQL。\n\n需要支援的操作：\n- 建立資料表（初始化）\n- 新增客戶\n- 根據 ID 查詢客戶\n- 更新客戶資料\n- 刪除客戶\n\n請思考如何組織程式碼、處理錯誤、和確保安全性。",
                                data: [
                                    ["function": "init_db()", "description": "建立資料表"],
                                    ["function": "create_customer(name, email)", "description": "新增客戶"],
                                    ["function": "get_customer(id)", "description": "查詢單筆客戶"],
                                    ["function": "update_customer(id, **kwargs)", "description": "更新客戶"],
                                    ["function": "delete_customer(id)", "description": "刪除客戶"],
                                ],
                                dataCaption: "預期的函式介面"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Python 的 with sqlite3.connect(...) as conn 可以自動管理 Transaction", "參數化查詢用 ? 佔位符，不要用 f-string", "思考：如果專案規模變大，你的設計能否平滑遷移到 PostgreSQL？"],
                            explanation: "資料存取層（DAL / Repository Pattern）是軟體架構中非常重要的一層。它把資料庫操作封裝在獨立模組中，讓業務邏輯不直接依賴特定的資料庫。好的 DAL 設計要考慮：連線管理、錯誤處理、安全性（防注入）、可測試性（可以 mock）、和未來的擴展性（換資料庫時只改 DAL）。",
                            frameworkTip: "DAL 設計 checklist：(1) 連線管理用 context manager (2) 所有 SQL 用參數化查詢 (3) 寫入操作用 Transaction (4) 錯誤有明確的處理和回報 (5) 函式介面與 SQL 實作分離。"
                        ),
                        Challenge(
                            id: 3,
                            name: "SQL vs Python 任務分配",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個工具分配方案最合理？",
                            scenario: Challenge.Scenario(
                                title: "資料團隊的每日工作分配",
                                narrative: "你剛加入 LinkedIn 的 Data Analytics 團隊。主管列了一份當天要完成的任務清單，要你判斷每個任務最適合用什麼工具完成。團隊有 SQL（連接公司的資料倉儲）和 Python（Jupyter Notebook 環境，有 pandas、matplotlib、scikit-learn）。\n\n任務清單：\nA. 從 10 億筆事件資料中算出每日活躍用戶數（DAU）\nB. 把 DAU 數據做成折線圖寄給老闆\nC. 合併兩個 CSV 檔案，清洗缺失值後上傳到資料庫\nD. 建立一個模型預測哪些用戶可能下個月流失\nE. 找出過去 7 天連續登入的用戶清單",
                                data: [
                                    ["任務": "A. 計算 DAU", "資料量": "10 億筆", "適合工具": "?"],
                                    ["任務": "B. DAU 折線圖", "資料量": "365 筆", "適合工具": "?"],
                                    ["任務": "C. CSV 清洗上傳", "資料量": "5 萬筆", "適合工具": "?"],
                                    ["任務": "D. 流失預測模型", "資料量": "特徵表 10 萬筆", "適合工具": "?"],
                                    ["任務": "E. 連續登入用戶", "資料量": "10 億筆", "適合工具": "?"],
                                ],
                                dataCaption: "任務清單與工具選擇"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A=SQL, B=Python, C=Python, D=Python, E=SQL", explanation: "正確！A 和 E 是大數據量的聚合與篩選，SQL 在資料庫端執行效率最高。B 需要視覺化，用 Python matplotlib 最方便。C 涉及 CSV 解析和缺失值清洗，pandas 的專長。D 是 ML 任務，必須用 Python。關鍵原則：資料量大的聚合交給 SQL，後處理和分析交給 Python。"),
                                Challenge.Option(id: "B", text: "A=Python, B=Python, C=Python, D=Python, E=Python", explanation: "全部用 Python 是新手常見的錯誤。A 和 E 都涉及 10 億筆資料，如果用 pandas 從資料庫把 10 億筆拉到本地處理，記憶體會爆炸（約 80GB），而且速度極慢。大數據量的聚合應該讓資料庫引擎在伺服器端完成。"),
                                Challenge.Option(id: "C", text: "A=SQL, B=SQL, C=SQL, D=SQL, E=SQL", explanation: "全部用 SQL 也不合適。SQL 不能做視覺化（B）、不擅長 CSV 清洗（C）、更做不了 ML 模型（D）。工具選擇要看任務性質，不是一刀切。"),
                                Challenge.Option(id: "D", text: "A=SQL, B=Python, C=SQL, D=Python, E=Python", explanation: "C 用 SQL 處理 CSV 不太直觀，pandas 的 read_csv + fillna 更方便。E 用 Python 處理 10 億筆事件資料會遇到記憶體問題，連續登入的邏輯用 SQL 視窗函式更高效。"),
                            ],
                            correctAnswer: "A",
                            hints: ["資料量是決定工具的關鍵因素之一——10 億筆資料拉到本地處理合理嗎？", "想想每個任務的核心動作：聚合？視覺化？清洗？建模？"],
                            explanation: "SQL vs Python 的選擇不是偏好問題，而是工程判斷。核心原則：(1) 大數據量的篩選和聚合 → SQL（在資料庫端計算，不需搬資料）(2) 視覺化、ML、檔案處理 → Python (3) 小數據量的探索分析 → 兩者皆可。面試中展示「我會根據資料量和任務性質選擇工具」比「我什麼都用 Python」更有說服力。",
                            frameworkTip: "工具選擇的判斷框架：先看資料量（大 → SQL 端處理）→ 再看任務性質（聚合 → SQL、ML/視覺化 → Python）→ 最後看便利性（CSV → pandas、JSON → Python）。"
                        ),
                    ]
                ),
                Quest(
                    id: "26-5",
                    name: "權限、資料隔離與 Query Performance",
                    description: "資料庫權限管理、索引與查詢效能優化",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "權限管理概念",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "關於資料庫權限管理，以下哪個描述是正確的？",
                            scenario: Challenge.Scenario(
                                title: "資料庫權限模型",
                                narrative: "你的公司有一個內部資料倉儲，不同角色的人需要不同的存取權限：\n\n- 資料分析師：只需要讀取資料（SELECT）\n- 應用程式帳號：需要讀寫資料（SELECT, INSERT, UPDATE, DELETE）\n- DBA 管理員：需要完整權限（含 CREATE, DROP, GRANT）\n\n在 PostgreSQL / MySQL 等企業級資料庫中，這是透過 GRANT / REVOKE 語句來管理的。（SQLite 不支援 GRANT/REVOKE，但概念在面試中很常考。）",
                                data: [
                                    ["role": "資料分析師", "permissions": "SELECT"],
                                    ["role": "應用程式帳號", "permissions": "SELECT, INSERT, UPDATE, DELETE"],
                                    ["role": "DBA 管理員", "permissions": "ALL PRIVILEGES"],
                                ],
                                dataCaption: "角色與權限對應"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GRANT SELECT ON customers TO analyst; 表示授予 analyst 角色對 customers 資料表的唯讀權限。REVOKE 則用來撤銷已授予的權限。最小權限原則（Principle of Least Privilege）要求只給予完成工作所需的最少權限。", explanation: "正確！GRANT 授權、REVOKE 撤權，配合最小權限原則是資料庫安全的基礎。每個角色只應擁有其工作所需的最少權限。"),
                                Challenge.Option(id: "B", text: "為了方便管理，應該給所有帳號 ALL PRIVILEGES，再用應用程式層面來控制權限。", explanation: "嚴重錯誤！這違反最小權限原則。如果應用程式有漏洞，攻擊者就能做任何事。權限應在資料庫層面控制。"),
                                Challenge.Option(id: "C", text: "GRANT 和 REVOKE 只適用於 SQLite，大型資料庫使用其他機制。", explanation: "恰好相反。SQLite 是嵌入式資料庫，不支援 GRANT/REVOKE。這些是 PostgreSQL、MySQL、SQL Server 等多用戶資料庫的功能。"),
                                Challenge.Option(id: "D", text: "資料庫權限只需要在初始設定時配置一次，之後不需要維護。", explanation: "錯誤。權限需要隨著人員變動、角色調整而持續維護。員工離職要撤權、新功能上線要調整權限，這是持續性的工作。"),
                            ],
                            correctAnswer: "A",
                            hints: ["GRANT 授權、REVOKE 撤權 — 這是企業級資料庫的基本安全機制", "最小權限原則：只給需要的權限，不多給", "SQLite 不支援 GRANT/REVOKE，但面試會考這個概念"],
                            explanation: "資料庫權限管理是企業安全的重要一環。GRANT/REVOKE 語法雖然在 SQLite 中不適用，但在 PostgreSQL、MySQL 等多用戶資料庫中是必備知識。最小權限原則（Least Privilege）是資安基礎：分析師只需 SELECT、應用帳號需 CRUD、只有 DBA 才有 DDL 和 GRANT 權限。Row-Level Security（RLS）可以更細緻地控制不同用戶看到不同的資料列。",
                            frameworkTip: "權限管理三層次：(1) 資料庫層 — GRANT/REVOKE 控制表和操作權限 (2) 列層 — Row-Level Security 控制可見資料範圍 (3) 應用層 — 業務邏輯的額外權限檢查。"
                        ),
                        Challenge(
                            id: 2,
                            name: "索引與效能",
                            type: .code,
                            difficulty: .medium,
                            question: "為常見的查詢模式建立索引：\n1. 建立一個複合索引 (composite index) 在 customer_id 和 status 上\n2. 建立一個索引在 order_date 上（因為常按日期範圍查詢）\n3. 用 EXPLAIN QUERY PLAN 驗證索引是否被使用",
                            scenario: Challenge.Scenario(
                                title: "為慢查詢建立索引",
                                narrative: "你的電商平台有一張 100 萬筆的 orders 資料表，以下查詢跑了 5 秒鐘：\n\nSELECT * FROM orders WHERE customer_id = 12345 AND status = 'shipped';\n\n因為沒有索引，資料庫做了全表掃描（Full Table Scan）。你需要建立適當的索引來加速查詢。\n\n資料表結構：orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "100", "product": "筆電", "status": "shipped", "amount": "35000", "order_date": "2024-03-15"],
                                    ["id": "2", "customer_id": "200", "product": "手機", "status": "pending", "amount": "28000", "order_date": "2024-03-16"],
                                    ["id": "3", "customer_id": "100", "product": "滑鼠", "status": "delivered", "amount": "800", "order_date": "2024-03-17"],
                                    ["id": "4", "customer_id": "300", "product": "螢幕", "status": "shipped", "amount": "12000", "order_date": "2024-03-18"],
                                ],
                                dataCaption: "orders 資料表（實際有百萬筆）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CREATE INDEX 索引名 ON 表名 (欄位1, 欄位2); 建立複合索引", "複合索引的欄位順序很重要：高選擇性的欄位放前面", "EXPLAIN QUERY PLAN 可以看到查詢是否使用了索引"],
                            explanation: "索引（Index）是加速查詢的關鍵。沒有索引時資料庫必須掃描每一列（Full Table Scan），有索引時可以直接定位目標資料（Index Scan）。複合索引（Composite Index）適合多條件查詢，欄位順序遵循最左前綴原則（Leftmost Prefix）。但索引也有代價：佔用額外儲存空間，且會降低寫入速度（INSERT/UPDATE/DELETE 需要更新索引）。",
                            frameworkTip: "索引設計原則：(1) 為 WHERE、JOIN、ORDER BY 常用欄位建索引 (2) 複合索引遵循最左前綴原則 (3) 高選擇性欄位放前面 (4) 不要過度索引，寫入多的表要節制 (5) 用 EXPLAIN 驗證。",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT);
                                INSERT INTO orders VALUES (1, 100, '筆電', 'shipped', 35000, '2024-03-15');
                                INSERT INTO orders VALUES (2, 200, '手機', 'pending', 28000, '2024-03-16');
                                INSERT INTO orders VALUES (3, 100, '滑鼠', 'delivered', 800, '2024-03-17');
                                INSERT INTO orders VALUES (4, 300, '螢幕', 'shipped', 12000, '2024-03-18');
                                INSERT INTO orders VALUES (5, 100, '鍵盤', 'shipped', 2500, '2024-03-19');
                                INSERT INTO orders VALUES (6, 200, '耳機', 'delivered', 3200, '2024-03-20');
                            """,
                            starterCode: """
                                -- 1. 建立複合索引（customer_id + status）
                                CREATE INDEX idx_orders_customer_status
                                  ON orders (customer_id, status);

                                -- 2. 建立日期索引
                                -- CREATE INDEX ...

                                -- 3. 用 EXPLAIN QUERY PLAN 檢查索引效果
                                EXPLAIN QUERY PLAN
                                SELECT * FROM orders
                                WHERE customer_id = 100 AND status = 'shipped';
                            """,
                            expectedQuery: "CREATE INDEX idx_orders_customer_status ON orders (customer_id, status); CREATE INDEX idx_orders_date ON orders (order_date); EXPLAIN QUERY PLAN SELECT * FROM orders WHERE customer_id = 100 AND status = 'shipped';"
                        ),
                        Challenge(
                            id: 3,
                            name: "Query 效能分析",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪個優化方案最能有效改善這個查詢的效能？",
                            scenario: Challenge.Scenario(
                                title: "分析慢查詢並優化",
                                narrative: "資料分析師反應以下查詢在百萬筆資料的 orders 表上跑了 30 秒：\n\n```sql\nSELECT c.name, SUM(o.amount) AS total_spent\nFROM orders o\nJOIN customers c ON o.customer_id = c.id\nWHERE SUBSTR(o.order_date, 1, 7) = '2024-03'\nGROUP BY c.name\nHAVING SUM(o.amount) > 10000\nORDER BY total_spent DESC;\n```\n\n你用 EXPLAIN QUERY PLAN 發現 orders 表做了 Full Table Scan。已知 orders 上有 idx_orders_date (order_date) 索引。",
                                data: [
                                    ["issue": "SUBSTR(o.order_date, 1, 7)", "impact": "函式包裹欄位導致索引失效"],
                                    ["issue": "Full Table Scan on orders", "impact": "掃描百萬筆效能極差"],
                                    ["issue": "缺少 JOIN 欄位索引", "impact": "customer_id 可能也需要索引"],
                                ],
                                dataCaption: "效能問題分析"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "將 WHERE SUBSTR(o.order_date, 1, 7) = '2024-03' 改為 WHERE o.order_date >= '2024-03-01' AND o.order_date < '2024-04-01'，讓索引能被正確使用（Sargable 查詢）。同時確認 customer_id 有索引以加速 JOIN。", explanation: "正確！在 WHERE 條件中對欄位使用函式（如 SUBSTR）會導致索引失效。改用範圍查詢可以讓資料庫利用 order_date 上的索引。這就是 Sargable（Search ARGument ABLE）查詢的概念。"),
                                Challenge.Option(id: "B", text: "在 SUBSTR(o.order_date, 1, 7) 上建立一個計算索引（Expression Index），這樣原始查詢就可以使用索引了。", explanation: "雖然某些資料庫支援 Expression Index，但 SQLite 的支援有限。更重要的是，改寫為範圍查詢是更通用、更簡單的做法，不需要額外索引。"),
                                Challenge.Option(id: "C", text: "把 GROUP BY 和 HAVING 移除，改用子查詢先 JOIN 再過濾，這樣可以減少掃描範圍。", explanation: "不正確。效能瓶頸在 WHERE 條件的索引失效，不在 GROUP BY 和 HAVING。即使改寫查詢結構，SUBSTR 導致的索引失效問題依然存在。"),
                                Challenge.Option(id: "D", text: "增加記憶體和 CPU 資源，因為百萬筆的 Full Table Scan 需要更好的硬體。", explanation: "硬體升級是最後手段，不是第一選擇。正確的做法是先優化查詢和索引。把 Full Table Scan 改成 Index Scan 的效果遠遠超過硬體升級。"),
                            ],
                            correctAnswer: "A",
                            hints: ["對 WHERE 欄位使用函式（SUBSTR, YEAR, LOWER 等）會讓索引失效", "Sargable = Search ARGument ABLE = 索引能用的查詢寫法", "範圍查詢（>= 和 <）可以利用 B-Tree 索引"],
                            explanation: "查詢效能優化的第一步是確保索引被正確使用。最常見的索引失效原因是在 WHERE 條件的欄位上使用函式（Non-Sargable Query）。SUBSTR(order_date, 1, 7) 迫使資料庫對每一列都計算 SUBSTR 再比較，無法利用索引。改為範圍查詢 order_date >= ... AND order_date < ... 後，資料庫可以直接在 B-Tree 索引上做範圍掃描，效率提升數百倍。",
                            frameworkTip: "索引失效常見原因：(1) WHERE 欄位用函式包裹 (2) 隱性型態轉換 (3) LIKE 以 % 開頭 (4) OR 條件跨多欄位 (5) NOT IN / NOT EXISTS。面試必知的效能優化考點。"
                        ),
                        Challenge(
                            id: 4,
                            name: "慢查詢改寫優化",
                            type: .code,
                            difficulty: .hard,
                            question: "把上面的慢查詢改寫成效能更好的版本，使用 JOIN + GROUP BY 取代相關子查詢。",
                            scenario: Challenge.Scenario(
                                title: "優化部門薪資差異報表",
                                narrative: "公司有 workers 和 departments 兩張表。HR 寫了一個查詢來計算每個部門的最高薪資，但這個查詢在百萬筆資料下跑了超過 60 秒。\n\n原始慢查詢：\nSELECT d.dept_name,\n       (SELECT MAX(w.salary) FROM workers w WHERE w.department_id = d.id) AS max_salary\nFROM departments d\nORDER BY max_salary DESC;\n\n問題在於：子查詢對每個部門都要掃一次 workers 表，當部門數量多時效能很差。\n\n資料表結構：\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 JOIN 把 departments 和 workers 連接起來，取代子查詢", "GROUP BY 部門後用 MAX(salary) 就能算出每個部門的最高薪資", "JOIN + GROUP BY 只需要掃描 workers 表一次，比相關子查詢高效得多"],
                            explanation: "相關子查詢（correlated subquery）對外層每一列都要執行一次內層查詢，當部門有 N 個時就要掃 N 次 workers 表（O(N) 次全表掃描）。改用 JOIN + GROUP BY 後，只需要掃描 workers 表一次就能算出所有部門的聚合結果。在百萬筆資料下，這個差異可以從 60 秒降到 1 秒以內。這是面試中最常考的 SQL 優化模式之一。",
                            frameworkTip: "SQL 優化的第一直覺：看到 SELECT 子句或 WHERE 子句中的相關子查詢 → 考慮能否改寫成 JOIN + GROUP BY。這幾乎永遠更快。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT d.dept_name, -- 怎麼算最高薪資？ AS max_salary
                                FROM departments d
                                -- 怎麼連接 workers？
                                -- 怎麼分組？
                                ORDER BY max_salary DESC;
                            """,
                            expectedQuery: "SELECT d.dept_name, MAX(w.salary) AS max_salary FROM departments d JOIN workers w ON d.id = w.department_id GROUP BY d.dept_name ORDER BY max_salary DESC;"
                        ),
                        Challenge(
                            id: 5,
                            name: "複雜聚合與字串處理",
                            type: .code,
                            difficulty: .hard,
                            question: "查詢每位房東的房源數量、平均價格（四捨五入到整數）和總評論數，篩選出房源數量 >= 2 的房東，按總評論數由高到低排序。",
                            scenario: Challenge.Scenario(
                                title: "房東熱門度與平均房價分析",
                                narrative: "你在 Airbnb 的 Data Team，需要分析房東的熱門程度和定價策略。每筆房源紀錄中，host_name 欄位的格式是「名字 姓氏」。你需要依照房東分組，計算每位房東的房源數量和平均每晚價格。\n\n資料表結構：listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER)",
                                data: [
                                    ["id": "1", "host_name": "John Smith", "neighbourhood": "大安區", "room_type": "Entire home", "price": "3200", "reviews_count": "45"],
                                    ["id": "2", "host_name": "John Smith", "neighbourhood": "信義區", "room_type": "Private room", "price": "1800", "reviews_count": "32"],
                                    ["id": "3", "host_name": "Mary Chen", "neighbourhood": "中山區", "room_type": "Entire home", "price": "4500", "reviews_count": "78"],
                                    ["id": "4", "host_name": "Mary Chen", "neighbourhood": "大安區", "room_type": "Entire home", "price": "5200", "reviews_count": "91"],
                                    ["id": "5", "host_name": "Mary Chen", "neighbourhood": "松山區", "room_type": "Private room", "price": "2100", "reviews_count": "25"],
                                ],
                                dataCaption: "listings 資料表（部分範例）"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(*) 計算每位房東的房源數量", "ROUND(AVG(price)) 計算平均價格並四捨五入", "用 HAVING 在 GROUP BY 之後篩選，而不是 WHERE"],
                            explanation: "這題綜合考了 GROUP BY、聚合函式（COUNT、AVG、SUM）、ROUND 函式、HAVING 篩選和 ORDER BY 排序。HAVING 和 WHERE 的差異是面試高頻考點：WHERE 在分組前篩選（篩原始列），HAVING 在分組後篩選（篩聚合結果）。這裡要篩選「房源數量 >= 2」，因為 COUNT(*) 是聚合結果，所以必須用 HAVING。",
                            frameworkTip: "聚合查詢的完整結構：SELECT 聚合函式 → FROM → WHERE（分組前篩選）→ GROUP BY → HAVING（分組後篩選）→ ORDER BY。面試時寫出完整結構展示你的 SQL 基本功。",
                            sampleSchema: """
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
                            """,
                            starterCode: """
                                SELECT
                                  host_name,
                                  -- 房源數量,
                                  -- 平均價格（四捨五入）,
                                  -- 總評論數
                                FROM listings
                                GROUP BY host_name
                                -- 篩選條件？
                                -- 排序？;
                            """,
                            expectedQuery: "SELECT host_name, COUNT(*) AS listing_count, ROUND(AVG(price)) AS avg_price, SUM(reviews_count) AS total_reviews FROM listings GROUP BY host_name HAVING COUNT(*) >= 2 ORDER BY total_reviews DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "26-6",
                    name: "Boss: 系統設計 SQL Case",
                    description: "綜合考驗：完整資料庫設計與系統設計面試",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "完整資料庫設計",
                            type: .code,
                            difficulty: .hard,
                            question: "設計完整的資料庫 Schema：建立所有資料表，包含正確的資料型態、主鍵、外鍵、約束，並插入一些測試資料驗證設計。",
                            scenario: Challenge.Scenario(
                                title: "線上課程平台的資料庫設計",
                                narrative: "你被聘為一個線上課程平台的後端工程師，需要設計完整的資料庫 Schema。平台需求：\n\n1. 用戶（students）可以註冊帳號\n2. 講師（instructors）可以開設課程（courses）\n3. 每門課程有多個章節（lessons）\n4. 學生可以報名（enrollments）多門課程\n5. 學生完成章節後記錄進度（progress）\n\n需要考慮的約束：\n- 同一學生不能重複報名同一門課程\n- 課程價格不可為負\n- 章節的排序（sort_order）不可為負\n- 進度表要記錄完成時間",
                                data: [
                                    ["table": "students", "columns": "id, name, email(唯一), registered_at"],
                                    ["table": "instructors", "columns": "id, name, email(唯一), bio"],
                                    ["table": "courses", "columns": "id, title, instructor_id(外鍵), price, created_at"],
                                    ["table": "lessons", "columns": "id, course_id(外鍵), title, sort_order, content"],
                                    ["table": "enrollments", "columns": "id, student_id(外鍵), course_id(外鍵), enrolled_at"],
                                    ["table": "progress", "columns": "id, enrollment_id(外鍵), lesson_id(外鍵), completed_at"],
                                ],
                                dataCaption: "預期的資料表結構"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNIQUE(student_id, course_id) 可以防止重複報名", "REFERENCES 表名(欄位) 建立外鍵關係", "CHECK(price >= 0) 限制價格不可為負", "先建立沒有外鍵依賴的表，再建立有外鍵的表"],
                            explanation: "完整的資料庫設計需要考慮：(1) 實體識別 — 每個業務物件對應一張表 (2) 關係建立 — 用外鍵表達 1:N 和 N:M 關係 (3) 約束設計 — PRIMARY KEY、FOREIGN KEY、UNIQUE、NOT NULL、CHECK、DEFAULT (4) 正規化 — 避免資料重複 (5) 測試驗證 — 插入資料確認設計正確。enrollments 是學生和課程的多對多關聯表，UNIQUE(student_id, course_id) 確保不重複報名。",
                            frameworkTip: "資料庫設計 5 步驟：(1) 列出所有實體 (2) 定義每個實體的屬性和型態 (3) 建立實體間的關係（1:1, 1:N, N:M）(4) 加上約束防止不合法資料 (5) 正規化到第三正規形式（3NF）。",
                            starterCode: """
                                -- 1. 建立 students 資料表
                                CREATE TABLE students (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  email TEXT UNIQUE NOT NULL,
                                  registered_at TEXT DEFAULT (datetime('now'))
                                );

                                -- 2. 建立 instructors 資料表
                                -- CREATE TABLE instructors ...

                                -- 3. 建立 courses 資料表（含外鍵）
                                -- CREATE TABLE courses ...

                                -- 4. 建立 lessons 資料表
                                -- CREATE TABLE lessons ...

                                -- 5. 建立 enrollments 資料表（同一學生不能重複報名同一課程）
                                -- CREATE TABLE enrollments ...

                                -- 6. 建立 progress 資料表
                                -- CREATE TABLE progress ...

                                -- 插入測試資料並驗證
                                -- INSERT INTO ...
                            """,
                            expectedQuery: "CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, registered_at TEXT DEFAULT (datetime('now'))); CREATE TABLE instructors (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, bio TEXT); CREATE TABLE courses (id INTEGER PRIMARY KEY, title TEXT NOT NULL, instructor_id INTEGER NOT NULL REFERENCES instructors(id), price REAL DEFAULT 0 CHECK(price >= 0), created_at TEXT DEFAULT (datetime('now'))); CREATE TABLE lessons (id INTEGER PRIMARY KEY, course_id INTEGER NOT NULL REFERENCES courses(id), title TEXT NOT NULL, sort_order INTEGER CHECK(sort_order >= 0), content TEXT); CREATE TABLE enrollments (id INTEGER PRIMARY KEY, student_id INTEGER NOT NULL REFERENCES students(id), course_id INTEGER NOT NULL REFERENCES courses(id), enrolled_at TEXT DEFAULT (datetime('now')), UNIQUE(student_id, course_id)); CREATE TABLE progress (id INTEGER PRIMARY KEY, enrollment_id INTEGER NOT NULL REFERENCES enrollments(id), lesson_id INTEGER NOT NULL REFERENCES lessons(id), completed_at TEXT DEFAULT (datetime('now'))); INSERT INTO instructors VALUES (1, '王教授', 'wang@edu.tw', 'SQL 專家，10 年教學經驗'); INSERT INTO students VALUES (1, '陳同學', 'chen@mail.com', '2024-06-01'); INSERT INTO courses VALUES (1, 'SQL 從入門到精通', 1, 1990, '2024-06-01'); INSERT INTO lessons VALUES (1, 1, 'SELECT 基礎', 1, '學習基本查詢'); INSERT INTO lessons VALUES (2, 1, 'JOIN 進階', 2, '學習多表連接'); INSERT INTO enrollments VALUES (1, 1, 1, '2024-06-05'); INSERT INTO progress VALUES (1, 1, 1, '2024-06-06'); SELECT s.name AS student, c.title AS course, l.title AS lesson, p.completed_at FROM progress p JOIN enrollments e ON p.enrollment_id = e.id JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id JOIN lessons l ON p.lesson_id = l.id;"
                        ),
                        Challenge(
                            id: 2,
                            name: "系統設計面試",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請完整回答這個系統設計面試題。需要涵蓋：\n1. 資料表設計（Schema Design）\n2. 關鍵 SQL 查詢（結帳流程的 SQL）\n3. 索引策略（哪些欄位需要索引、為什麼）\n4. 併發控制（如何處理兩人同時搶購）\n5. 效能考量（大量訂單時的瓶頸和解法）",
                            scenario: Challenge.Scenario(
                                title: "設計電商平台的資料層",
                                narrative: "面試官問你：「請設計一個簡易電商平台的資料庫層，需要支援以下功能：\n\n1. 商品管理（CRUD）\n2. 購物車功能\n3. 訂單建立（從購物車結帳）\n4. 訂單歷史查詢\n5. 簡易庫存管理（下單時扣庫存）\n\n請描述你的資料表設計、關鍵查詢、索引策略、以及如何處理併發下單（兩人同時搶最後一件商品）。」",
                                data: [
                                    ["feature": "商品管理", "tables": "products"],
                                    ["feature": "購物車", "tables": "cart_items"],
                                    ["feature": "訂單建立", "tables": "orders, order_items"],
                                    ["feature": "庫存管理", "tables": "products.stock"],
                                    ["feature": "併發控制", "tables": "Transaction + CHECK constraint"],
                                ],
                                dataCaption: "核心功能與資料表映射"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CHECK(stock >= 0) 可以在資料庫層面防止庫存變成負數", "結帳流程必須在 Transaction 中完成", "思考：為什麼 order_items 要記錄 price_at_purchase 而不是直接 JOIN products？"],
                            explanation: "電商資料庫設計是系統設計面試的經典題。核心要點：(1) 訂單明細要快照價格（price_at_purchase），因為商品價格會變 (2) 庫存扣減必須用 Transaction 確保原子性 (3) CHECK 約束是防超賣的第一道防線 (4) 索引設計要根據查詢模式 (5) 大規模場景需要考慮分區、緩存、讀寫分離等策略。",
                            frameworkTip: "系統設計面試的資料庫設計框架：(1) 先畫 ER 圖 (2) 定義資料表和關係 (3) 寫出關鍵流程的 SQL (4) 設計索引 (5) 討論併發和效能 (6) 提出擴展方案。記得回答時邊畫邊說，展示結構化思考。"
                        ),
                    ]
                ),
            ]
        ),
    ]
}
