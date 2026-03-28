import Foundation

enum SqlWorldsEn {
    static let worlds: [World] = [
        World(
            id: 4,
            name: "SQL & Data Literacy",
            emoji: "🗄️",
            description: "SQL thinking and data comprehension for interviews",
            quests: [
                Quest(
                    id: "4-1",
                    name: "SQL Query Thinking",
                    description: "How to explain your data querying approach in interviews",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic SELECT & Filtering",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find all orders from January 2024, sorted by amount in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Order Query",
                                narrative: "You just joined the data team at an e-commerce company. The PM wants to understand the order activity for January this year. Query the orders table to find out.\n\nTable structure: orders (id, customer_id, amount, order_date, status)",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "250", "order_date": "2024-01-15", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "180", "order_date": "2024-01-20", "status": "completed"],
                                    ["id": "3", "customer_id": "103", "amount": "320", "order_date": "2024-02-01", "status": "pending"],
                                    ["id": "4", "customer_id": "101", "amount": "95", "order_date": "2024-01-28", "status": "completed"],
                                ],
                                dataCaption: "orders table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["WHERE can use LIKE with % to match a date prefix", "ORDER BY column DESC means descending order"],
                            explanation: "Use WHERE order_date LIKE '2024-01%' to filter January data, and ORDER BY amount DESC to sort by amount in descending order. This is the most fundamental query structure: FROM -> WHERE -> SELECT -> ORDER BY.",
                            frameworkTip: "SQL thinking order: first consider \"which table\" -> \"what filters\" -> \"which columns\" -> \"how to sort\"",
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
                                WHERE -- filter for January orders
                                ORDER BY -- sort by amount;
                            """,
                            expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-01%' ORDER BY amount DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "GROUP BY & Aggregation",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to calculate each customer's order count and total spending, sorted by total amount in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Spending Summary",
                                narrative: "Your manager wants to understand each customer's spending behavior, including their order count and total spending. You need to perform group-level aggregation on the orders data.",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "250", "order_date": "2024-01-15", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "180", "order_date": "2024-01-20", "status": "completed"],
                                    ["id": "4", "customer_id": "101", "amount": "95", "order_date": "2024-01-28", "status": "completed"],
                                ],
                                dataCaption: "orders table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY customer_id groups rows by customer", "SUM() and COUNT() are the most commonly used aggregate functions"],
                            explanation: "GROUP BY customer_id merges all orders for the same customer. COUNT(*) counts the number of rows, and SUM(amount) calculates the total. In interviews, this is a very fundamental yet important question type — you need to demonstrate that you can extract business insights from raw data.",
                            frameworkTip: "When answering SQL questions in interviews, first verbalize your approach (group -> aggregate -> sort), then write the code",
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
                                GROUP BY -- group by what?
                                ORDER BY -- sort;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id ORDER BY total_amount DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "HAVING & Conditional Filtering",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find customers whose total spending exceeds 200, showing customer ID, order count, and total amount.",
                            scenario: 
                            Challenge.Scenario(
                                title: "High-Value Customer Filtering",
                                narrative: "The marketing team wants to identify \"high-value customers\" (those who spent over 200) to run a promotional campaign. You need to aggregate first, then filter.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["You cannot use WHERE to filter aggregated results — use HAVING instead", "HAVING goes after GROUP BY and before ORDER BY"],
                            explanation: "WHERE filters raw data before aggregation; HAVING filters results after aggregation. This is a frequently tested concept in interviews — interviewers want to see if you understand SQL's execution order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.",
                            frameworkTip: "WHERE vs HAVING: WHERE filters raw rows, HAVING filters aggregated results. Be sure to articulate this distinction clearly in interviews.",
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
                                -- how do you filter aggregated results?
                                ORDER BY total_amount DESC;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_amount FROM orders GROUP BY customer_id HAVING total_amount > 200 ORDER BY total_amount DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "4-2",
                    name: "Event Data vs Transactional Data",
                    description: "Understanding the characteristics of different data types",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Data Types",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following statements is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Platform Tables",
                                narrative: "You joined the Data Team at an e-commerce company. Your manager shows you several tables and asks you to distinguish which are Event Data and which are Transactional Data, since the querying approach differs.",
                                data: [
                                    ["table_name": "page_views", "sample_columns": "user_id, page_url, timestamp, device", "characteristics": "One record per view, very high volume"],
                                    ["table_name": "orders", "sample_columns": "order_id, user_id, amount, status, created_at", "characteristics": "Has a lifecycle, status gets updated"],
                                    ["table_name": "button_clicks", "sample_columns": "user_id, button_id, page, timestamp", "characteristics": "One record per click, immutable"],
                                    ["table_name": "subscriptions", "sample_columns": "sub_id, user_id, plan, start_date, end_date", "characteristics": "Represents an ongoing state"],
                                ],
                                dataCaption: "Selected tables from the company"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Both page_views and orders are Event Data", explanation: "Orders have a lifecycle (created -> paid -> shipped) and get updated, making them Transactional Data."),
                                Challenge.Option(id: "B", text: "page_views and button_clicks are Event Data; orders and subscriptions are Transactional Data", explanation: "Correct! Event Data records each behavioral event — immutable and high volume. Transactional Data represents the state of business entities — has a lifecycle and gets updated."),
                                Challenge.Option(id: "C", text: "Everything related to user behavior is Event Data", explanation: "\"A user placing an order\" is a behavior, but the orders table records the state of the order as a business entity, not simply a behavioral event."),
                                Challenge.Option(id: "D", text: "Only button_clicks is Event Data; everything else is Transactional", explanation: "page_views is also Event Data — one record is created per view, and it is never modified."),
                            ],
                            correctAnswer: "B",
                            hints: ["Event Data characteristics: a record is created each time something happens, never modified", "Transactional Data characteristics: represents an entity, undergoes state changes"],
                            explanation: "Event Data records \"what happened\" (page_view, click) — each record is an event at a point in time. Transactional Data records \"the state of a business entity\" (orders, subscriptions) — it gets updated over time. Understanding this distinction is essential for knowing which table to use when answering different types of questions.",
                            frameworkTip: "In interviews, when you hear \"what did the user do\" -> Event Data; \"how is the business doing\" -> Transactional Data"
                        ),
                        Challenge(
                            id: 2,
                            name: "Choosing the Right Table",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which analysis strategy is most appropriate for these two questions?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Answering Different Business Questions",
                                narrative: "The PM and Finance each send you a question:\n\n- PM asks: \"At which step in the checkout flow do users drop off the most?\"\n- Finance asks: \"What was the total refund amount last month?\"\n\nYou need to determine which type of data to query for each.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Just query the orders table for both", explanation: "The PM's question requires looking at user behavioral steps (which step they drop off at). The orders table only records the final outcome and cannot show intermediate steps."),
                                Challenge.Option(id: "B", text: "For the PM's question, query Event Data (examine funnel steps); for Finance's question, query Transactional Data (look at refunds)", explanation: "Correct! User drop-off analysis requires examining each behavioral step (page_view -> add_to_cart -> checkout -> payment). Refund amounts need to come from the transaction table's refund records."),
                                Challenge.Option(id: "C", text: "Query Event Data for both, since they both relate to user behavior", explanation: "Finance needs precise refund amounts. Event Data may have duplicate triggers or inconsistent definitions, making it unreliable for calculating monetary amounts."),
                                Challenge.Option(id: "D", text: "For the PM's question, query Transactional Data (check order status); for Finance's question, query Event Data (look at refund events)", explanation: "This is reversed. Order status cannot show \"at which step the user left,\" and refund events may fire multiple times, making them unsuitable for calculating amounts."),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about it: does the PM want to see the \"process\" or the \"outcome\"?", "Finance needs precise amounts — which type of data is more reliable?"],
                            explanation: "\"Process\" questions use Event Data (behavioral tracking); \"outcome\" questions use Transactional Data (business records). In interviews, demonstrating that you know how to match the right data to the right question is more important than your SQL syntax skills.",
                            frameworkTip: "Interview golden line: \"This question requires examining each step of the user journey, so I would use event data to build a funnel.\""
                        ),
                    ]
                ),
                Quest(
                    id: "4-3",
                    name: "JOIN & Aggregation",
                    description: "Combining and aggregating data",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic JOIN",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve the customer name, order amount, and order date for all orders.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Merging Orders and Customer Data",
                                narrative: "The PM wants a report that shows both order information and customer names. You need to JOIN the orders and customers tables.\n\nTables:\n- orders (id, customer_id, amount, order_date)\n- customers (id, name, email, city)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["JOIN customers c ON o.customer_id = c.id", "Use aliases (o, c) to keep the code concise"],
                            explanation: "INNER JOIN connects two tables through a shared column. The interview focus is not just the syntax, but whether you can clearly explain \"why the JOIN is needed\" and \"what the JOIN key is.\"",
                            frameworkTip: "When answering JOIN questions: (1) explain why you need to combine the data, (2) identify the JOIN key, (3) consider the impact of NULLs and duplicates",
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
                                -- JOIN syntax
                                ORDER BY o.order_date;
                            """,
                            expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;"
                        ),
                        Challenge(
                            id: 2,
                            name: "LEFT JOIN & Missing Data",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find the names of all customers who have no orders.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Finding Customers Who Never Ordered",
                                narrative: "The marketing team wants to know which registered customers have never placed an order, so they can run a re-engagement campaign. You need to use LEFT JOIN to find these \"dormant customers.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN preserves all rows from the left table, even if there is no match in the right table", "WHERE o.id IS NULL finds rows with no match"],
                            explanation: "LEFT JOIN + IS NULL is the classic pattern for finding records that \"don't exist in another table.\" In interviews, this demonstrates your understanding of the semantic differences between JOIN types and is the foundation for churn analysis and missing data detection.",
                            frameworkTip: "INNER JOIN finds the intersection; LEFT JOIN preserves all rows from the left table — using a set diagram to explain this in interviews is the clearest approach",
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
                                -- which type of JOIN?
                                WHERE -- how to find customers with no orders?;
                            """,
                            expectedQuery: "SELECT c.name FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;"
                        ),
                        Challenge(
                            id: 3,
                            name: "JOIN + GROUP BY Combined",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to calculate the number of customers, total order count, and total spending for each city, sorted by total amount in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Spending Statistics by City",
                                narrative: "Your manager wants to know the customer spending breakdown by city. You need to JOIN the customers and orders data, then group and aggregate by city.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["JOIN orders o ON c.id = o.customer_id", "COUNT(DISTINCT c.id) avoids double-counting caused by the JOIN"],
                            explanation: "JOIN + GROUP BY is the most common combination in interviews. The key point is COUNT(DISTINCT) — when a JOIN produces a one-to-many relationship, a plain COUNT will double-count. This demonstrates your understanding of how JOINs affect row counts.",
                            frameworkTip: "In interviews, always mention: JOINs can produce duplicate rows, so be careful about whether you need DISTINCT when aggregating",
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
                    description: "Advanced analysis: ranking, moving averages, period-over-period comparison",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Understanding Window Functions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which SQL logic correctly calculates \"each user's nth purchase\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Purchase Ranking",
                                narrative: "You need to analyze each user's purchase history and determine their \"nth purchase.\" The PM wants to know at which purchase number users typically spend the most.\n\nYou plan to use ROW_NUMBER() for this.",
                                data: [
                                    ["user_id": "A01", "amount": "120", "order_date": "2024-01-10", "purchase_number": "?"],
                                    ["user_id": "A01", "amount": "350", "order_date": "2024-02-15", "purchase_number": "?"],
                                    ["user_id": "A01", "amount": "85", "order_date": "2024-03-20", "purchase_number": "?"],
                                    ["user_id": "B02", "amount": "200", "order_date": "2024-01-25", "purchase_number": "?"],
                                    ["user_id": "B02", "amount": "180", "order_date": "2024-03-01", "purchase_number": "?"],
                                ],
                                dataCaption: "Order data (need to calculate each user's nth purchase)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GROUP BY user_id, then use COUNT(*) to count each user's purchases", explanation: "GROUP BY collapses each user into a single row, so you lose visibility into individual orders. Window Functions can perform calculations without collapsing rows."),
                                Challenge.Option(id: "B", text: "ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date)", explanation: "Correct! PARTITION BY user_id means \"calculate separately for each user,\" and ORDER BY order_date means \"number them in chronological order.\" The result is each user's 1st, 2nd, 3rd... purchase."),
                                Challenge.Option(id: "C", text: "ROW_NUMBER() OVER (ORDER BY order_date)", explanation: "Without PARTITION BY, this numbers all users together instead of \"each user's nth purchase.\""),
                                Challenge.Option(id: "D", text: "RANK() OVER (ORDER BY amount DESC)", explanation: "RANK produces rankings, not sequential numbers. It also sorts by amount instead of time and does not partition by user."),
                            ],
                            correctAnswer: "B",
                            hints: ["The key to Window Functions is PARTITION BY — think of it as \"calculate independently within each group\"", "ROW_NUMBER assigns a sequential number to each row without collapsing rows (unlike GROUP BY)"],
                            explanation: "The core concept of Window Functions: perform calculations over a set of related rows without collapsing them. PARTITION BY defines the \"group,\" ORDER BY defines the \"sequence.\" ROW_NUMBER assigns sequential numbers, RANK assigns rankings (with ties), and LAG/LEAD access previous/next row values.",
                            frameworkTip: "When describing Window Functions in interviews: \"I would use ROW_NUMBER, PARTITION BY user to group, ORDER BY time to sequence, to identify each user's Nth action.\""
                        ),
                        Challenge(
                            id: 2,
                            name: "LAG & Period-over-Period Comparison",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which SQL logic correctly calculates the MoM (Month-over-Month) growth rate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly Revenue Growth Rate",
                                narrative: "Your manager asks you to calculate the month-over-month revenue growth rate. You need to use the LAG function to retrieve \"last month's revenue.\"",
                                data: [
                                    ["month": "2024-01", "revenue": "500000"],
                                    ["month": "2024-02", "revenue": "520000"],
                                    ["month": "2024-03", "revenue": "480000"],
                                    ["month": "2024-04", "revenue": "550000"],
                                ],
                                dataCaption: "Monthly revenue data"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use a self-join to pair each month with the previous month", explanation: "This works but is overly complex. Window Functions are more elegant. In interviews, demonstrate that you can solve problems in a cleaner way."),
                                Challenge.Option(id: "B", text: "(revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month)", explanation: "Correct! LAG(revenue) OVER (ORDER BY month) retrieves the previous month's revenue, then you calculate (current month - previous month) / previous month = growth rate."),
                                Challenge.Option(id: "C", text: "SUM(revenue) OVER (ORDER BY month) to compute cumulative revenue, then subtract", explanation: "This calculates cumulative revenue, not a month-over-month growth rate."),
                                Challenge.Option(id: "D", text: "AVG(revenue) OVER (ORDER BY month ROWS 1 PRECEDING) for a moving average", explanation: "A moving average shows trends but is not a growth rate. Growth rate requires using LAG to get the previous row's value for division."),
                            ],
                            correctAnswer: "B",
                            hints: ["LAG(column) retrieves the value from the previous row; LEAD(column) retrieves the value from the next row", "Growth rate = (current period - previous period) / previous period"],
                            explanation: "LAG and LEAD are extremely practical Window Functions in interviews. LAG accesses the previous row, LEAD accesses the next row. They are used for calculating growth rates, MoM, WoW, and YoY comparisons. Interviewers frequently ask about MoM, WoW, and YoY calculation methods.",
                            frameworkTip: "When an interview question involves \"compare with the previous period\" -> use LAG. \"Compare with the next period\" -> use LEAD."
                        ),
                    ]
                ),
                Quest(
                    id: "4-5",
                    name: "Source of Truth",
                    description: "Why do different reports show different numbers?",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Root Cause of Inconsistent Numbers",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most likely cause?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Three Departments, Three Numbers",
                                narrative: "You are the company's Business Analyst. During the quarterly review meeting:\n\n- Marketing reports: \"Q1 added 12,000 new users\"\n- Product reports: \"Q1 added 9,500 new users\"\n- Finance reports: \"Q1 added 8,200 new paying users\"\n\nThe CEO is confused: \"Which number is correct?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Someone's data has a bug that needs to be found", explanation: "Not necessarily a bug. The three teams may be using different definitions of \"user\" and different data sources, each of which is technically \"correct.\""),
                                Challenge.Option(id: "B", text: "The three teams define \"new user\" differently", explanation: "Correct! Marketing may count \"completed registration,\" Product may count \"completed onboarding,\" and Finance may count \"completed first payment.\" Each definition is reasonable, but the numbers differ. This is a Source of Truth issue."),
                                Challenge.Option(id: "C", text: "Different time zones cause the Q1 start and end dates to differ", explanation: "Time zones can cause discrepancies, but the difference would not be this large (12K vs 8.2K). Different definitions are the more likely cause."),
                                Challenge.Option(id: "D", text: "You should average the three numbers", explanation: "Averaging is meaningless here. Each number measures something different. The definitions need to be aligned first."),
                            ],
                            correctAnswer: "B",
                            hints: ["The same term \"new user\" can have completely different definitions across teams", "Marketing cares about signups, Product cares about activation, Finance cares about payments"],
                            explanation: "Source of Truth issues are extremely common in real-world work. The solution is not to find \"the right answer,\" but to: (1) clarify each team's definition, (2) confirm their respective data sources, (3) align on a definition everyone agrees on, (4) build a shared dashboard.",
                            frameworkTip: "Interview golden line: \"Before starting any analysis, I would first confirm the metric definitions and data sources with stakeholders to ensure we are all looking at the same data.\""
                        ),
                        Challenge(
                            id: 2,
                            name: "Data Quality Issues",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best way to resolve this?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Report Numbers Don't Match",
                                narrative: "Your daily report shows yesterday's DAU as 85,000, but the PM says they see 92,000 on another dashboard. You begin investigating the discrepancy.\n\nYou discover:\n- Your report uses UTC time; the dashboard uses local time (UTC+8)\n- Your report excludes bot traffic; the dashboard does not\n- Your report counts \"viewed at least 1 page\"; the dashboard counts \"opened the app\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use your report because it excludes bots and is more accurate", explanation: "Your report may be \"cleaner,\" but the issue is not about who is right or wrong — it is about establishing a unified standard."),
                                Challenge.Option(id: "B", text: "Use the dashboard numbers since the PM is looking at them", explanation: "You should not choose a source just because of who is looking at it. The definition needs to be clarified first."),
                                Challenge.Option(id: "C", text: "Document the sources of discrepancy (timezone, bots, definition), propose a unified standard, and align the team", explanation: "Correct! First investigate the sources of discrepancy thoroughly, then propose a team-wide consensus definition and calculation method. For example: \"DAU = unique users in UTC+8 timezone, excluding bots, who completed at least 1 pageview.\""),
                                Challenge.Option(id: "D", text: "Keep both numbers and annotate the definition differences in the report", explanation: "This is acceptable short-term, but long-term it will create more confusion. You should push for unification."),
                            ],
                            correctAnswer: "C",
                            hints: ["The first step in resolving a Source of Truth issue is not picking one number, but understanding why they differ"],
                            explanation: "Common data quality issues: inconsistent time zones, different bot filtering logic, different metric definitions, and data latency. Demonstrating this awareness in interviews and showing that you know how to systematically resolve it (definition -> source -> calculation logic -> alignment) will significantly boost your evaluation.",
                            frameworkTip: "Troubleshooting order when data is inconsistent: definition -> source -> timezone -> filtering logic -> deduplication method"
                        ),
                    ]
                ),
                Quest(
                    id: "4-6",
                    name: "Boss: Data Analysis Design",
                    description: "Design a complete data analysis plan",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Design an Analysis Plan",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Churn Investigation for a Subscription SaaS",
                                narrative: "You are a Data Analyst at a B2B SaaS company. The VP of Customer Success comes to you and says:\n\n\"Our monthly churn rate has increased from 3% to 5%. The CEO needs to present the root cause and action plan at next week's board meeting. I need you to do a thorough analysis.\"\n\nYou have the following tables available:\n- subscriptions (sub_id, company_id, plan, start_date, end_date, mrr)\n- usage_events (company_id, feature, timestamp, user_count)\n- support_tickets (ticket_id, company_id, category, created_at, resolved_at, satisfaction_score)\n- companies (company_id, name, industry, size, signup_date)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Define what churn means clearly before starting the analysis", "Think about what each of the 4 tables can tell you"],
                            explanation: "This is a comprehensive data analysis design question. The interviewer is looking for whether you can systematically plan an analysis, not jump straight to guessing the cause. A strong answer should include: clear definition -> data inventory -> analytical methods -> expected results -> caveats.",
                            frameworkTip: "Six steps of analysis design: clarify the problem -> define metrics -> inventory data -> design the analysis -> anticipate outputs -> note caveats"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 23,
            name: "SQL Basic Queries",
            emoji: "📝",
            description: "From SELECT to aggregate functions — build a solid foundation in SQL queries",
            quests: [
                Quest(
                    id: "23-1",
                    name: "Database and Table Fundamentals",
                    description: "Understand the basic concepts of databases, tables, primary keys, and foreign keys",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Database Basic Concepts",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following statements is most accurate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "First Day as a Data Analyst",
                                narrative: "You are a data analyst who just joined an e-commerce company. Your manager walks you through the company's database system, which contains several tables: customers, orders, and products. He asks you some basic concept questions to gauge your foundation.",
                                data: [
                                    ["Concept": "Database", "Description": "A container that holds all tables"],
                                    ["Concept": "Table", "Description": "A collection of data with the same structure, similar to an Excel worksheet"],
                                    ["Concept": "Row", "Description": "A single complete data record"],
                                    ["Concept": "Column", "Description": "A data attribute, such as name or amount"],
                                ],
                                dataCaption: "Database Terminology Reference"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A Database is the same thing as a Table", explanation: "A database is a collection of multiple tables. A single database can contain tables like customers, orders, products, etc."),
                                Challenge.Option(id: "B", text: "In a table, each Row represents a record, and each Column represents an attribute", explanation: "Correct! For example, in the customers table, a row represents one customer's complete data, and a column represents an attribute (such as name or email)."),
                                Challenge.Option(id: "C", text: "A Column stores a complete customer record", explanation: "A column stores a single attribute (such as name). A complete customer record is composed of all columns in a single row."),
                                Challenge.Option(id: "D", text: "A database can only contain one table", explanation: "A database can contain many tables. For example, an e-commerce system would have tables like customers, orders, products, payments, and more."),
                            ],
                            correctAnswer: "B",
                            hints: ["Think of Excel: a workbook (Database) can contain many worksheets (Tables)", "Each row in a table is a record, and each column is a field"],
                            explanation: "A database is a collection of tables, and a table is a collection of records. Each table has a fixed column definition (Schema), and each row represents an actual data record. Understanding these basic concepts is the first step to writing SQL.",
                            frameworkTip: "If asked about basic database concepts in an interview, use analogies: a Database is like a filing cabinet, a Table is like a folder, a Row is like a form, and a Column is like a field on that form."
                        ),
                        Challenge(
                            id: 2,
                            name: "Primary Key and Foreign Key",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Regarding Primary Keys and Foreign Keys, which of the following statements is most accurate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Understanding Relationships Between Tables",
                                narrative: "Your manager then introduces the company's data architecture. The customers table has an id column as its Primary Key, and the orders table has a customer_id column that links to the customers table. He wants you to understand the purpose of these keys.",
                                data: [
                                    ["Table": "customers", "Columns": "id (PK), name, email, city", "Description": "id is the Primary Key, uniquely identifying each customer"],
                                    ["Table": "orders", "Columns": "id (PK), customer_id (FK), amount, order_date", "Description": "customer_id is a Foreign Key, linking to customers.id"],
                                ],
                                dataCaption: "Table Relationship Example"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Primary Keys can have duplicate values, but Foreign Keys cannot", explanation: "It is the opposite. Primary Keys must be unique and cannot be NULL; Foreign Keys can have duplicates (e.g., the same customer can have multiple orders)."),
                                Challenge.Option(id: "B", text: "A Primary Key uniquely identifies each record, and a Foreign Key establishes relationships between tables", explanation: "Correct! A Primary Key ensures every record has a unique identifier. A Foreign Key acts as a link that connects data across different tables."),
                                Challenge.Option(id: "C", text: "Every table must have both a Primary Key and a Foreign Key", explanation: "Not necessarily. Every table typically has a Primary Key, but does not always need a Foreign Key. Foreign Keys are only used when you need to relate to another table."),
                                Challenge.Option(id: "D", text: "A Foreign Key value can be any number and does not need to correspond to another table", explanation: "A Foreign Key value must correspond to a Primary Key in the referenced table. For example, orders.customer_id values must exist in customers.id."),
                            ],
                            correctAnswer: "B",
                            hints: ["A Primary Key is like a social security number: each person has a unique one", "A Foreign Key is like a linking line that connects two tables together"],
                            explanation: "A Primary Key ensures the uniqueness of each record in a table and does not allow duplicates or NULLs. A Foreign Key establishes relationships between tables, and its values must correspond to the Primary Key of another table. These two concepts are core to understanding relational databases.",
                            frameworkTip: "If asked about PK/FK in an interview, give a concrete example: \"The customer_id in the orders table is a FK referencing the id (PK) in the customers table, allowing us to combine order and customer data via JOIN.\""
                        ),
                        Challenge(
                            id: 3,
                            name: "Reading a Schema",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve all columns and all rows from the employees table so you can quickly browse its contents.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Exploring the Employee Table",
                                narrative: "You received the employee table Schema from the HR department. Before starting your analysis, you want to see what data is in this table and understand its columns and records.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice Wang", "department": "Engineering", "salary": "65000", "hire_date": "2022-03-15"],
                                    ["id": "2", "name": "Bob Lee", "department": "Marketing", "salary": "55000", "hire_date": "2023-01-10"],
                                    ["id": "3", "name": "Charlie Chen", "department": "Engineering", "salary": "72000", "hire_date": "2021-08-01"],
                                ],
                                dataCaption: "employees table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["* means \"all columns\"", "SELECT * FROM table_name is the most basic query syntax"],
                            explanation: "SELECT * FROM employees is the most basic SQL query statement. * means selecting all columns. In practice, when you receive a new table, the first step is usually to browse the data with SELECT * to understand the table's structure and contents. However, in production queries, it is recommended to specify the columns you need rather than using *, for better performance.",
                            frameworkTip: "In an interview, don't rush to write SQL. Ask the interviewer first: \"Can I look at the table structure and some sample data?\" This demonstrates good analytical habits.",
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
                                -- Query all columns and rows from the employees table
                                SELECT -- How do you select all columns?
                                FROM employees;
                            """,
                            expectedQuery: "SELECT * FROM employees;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-2",
                    name: "Deep Dive into SELECT / FROM / WHERE",
                    description: "Learn to precisely filter the data you need from a table",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SELECT Specific Columns",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve only the customer name (name) and email address (email).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Building a Customer Contact List",
                                narrative: "The marketing department needs a customer contact list with only names and emails — no other data. You need to select only the required columns from the customers table.\n\nTable structure: customers (id INTEGER, name TEXT, email TEXT, phone TEXT, city TEXT, registered_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "email": "wang@mail.com", "phone": "0912-345-678", "city": "台北市", "registered_date": "2023-01-15"],
                                    ["id": "2", "name": "李小華", "email": "lee@mail.com", "phone": "0923-456-789", "city": "高雄市", "registered_date": "2023-03-20"],
                                ],
                                dataCaption: "customers table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Separate multiple column names with commas", "When you don't need all columns, don't use * — list the specific columns you need"],
                            explanation: "SELECT name, email FROM customers returns only the two specified columns. In practice, specifying columns is better than using SELECT *: (1) reduces network data transfer (2) makes your code clearer about what you need (3) avoids accidentally exposing sensitive columns.",
                            frameworkTip: "When writing SQL in an interview, never use SELECT *. Interviewers will notice whether you select only the needed columns, which demonstrates your awareness of performance and security.",
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
                                SELECT -- Specify the columns you need
                                FROM customers;
                            """,
                            expectedQuery: "SELECT name, email FROM customers;"
                        ),
                        Challenge(
                            id: 2,
                            name: "WHERE with Multiple Conditions",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find orders from March 2024 with an amount greater than 1000 and a status of 'completed'. Display all columns.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Filtering High-Value Orders",
                                narrative: "The finance department wants to audit last month's orders that exceed 1000 in amount and have a completed status. You need to use multiple WHERE conditions to filter precisely.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "101", "amount": "1500", "order_date": "2024-03-05", "status": "completed"],
                                    ["id": "2", "customer_id": "102", "amount": "800", "order_date": "2024-03-12", "status": "completed"],
                                    ["id": "3", "customer_id": "103", "amount": "2200", "order_date": "2024-03-18", "status": "pending"],
                                    ["id": "4", "customer_id": "104", "amount": "350", "order_date": "2024-02-25", "status": "completed"],
                                ],
                                dataCaption: "orders table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use AND to combine multiple conditions that must all be true", "You can use LIKE with % to match a date prefix", "Text comparisons require single quotes"],
                            explanation: "Using AND to connect three conditions: date in March (order_date LIKE '2024-03%'), amount over 1000 (amount > 1000), and status is completed (status = 'completed'). The WHERE clause in SQL can combine multiple conditions with AND and OR, where AND requires all conditions to be true.",
                            frameworkTip: "When writing multi-condition filters in an interview, put each condition on a new line and add comments explaining the business meaning of each. This lets the interviewer understand your logic at a glance.",
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
                                WHERE -- Connect three conditions with AND;
                            """,
                            expectedQuery: "SELECT * FROM orders WHERE order_date LIKE '2024-03%' AND amount > 1000 AND status = 'completed';"
                        ),
                        Challenge(
                            id: 3,
                            name: "Filtering with LIKE and IN",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find products whose name contains '有機' (Organic) and whose category is '食品' (Food) or '飲料' (Beverages). Display name, category, and price.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Product Search Feature",
                                narrative: "The e-commerce platform's search feature needs to support fuzzy search and category filtering. The PM wants to find products whose names contain \"Organic\" and whose category is either \"Food\" or \"Beverages\".\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, stock INTEGER)",
                                data: [
                                    ["id": "1", "name": "有機蘋果汁", "category": "飲料", "price": "85", "stock": "200"],
                                    ["id": "2", "name": "有機黑豆", "category": "食品", "price": "120", "stock": "150"],
                                    ["id": "3", "name": "一般牛奶", "category": "飲料", "price": "45", "stock": "500"],
                                    ["id": "4", "name": "有機棉T恤", "category": "服飾", "price": "580", "stock": "80"],
                                ],
                                dataCaption: "products table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LIKE '%keyword%' searches for text containing that keyword", "IN ('value1', 'value2') is equivalent to = 'value1' OR = 'value2'"],
                            explanation: "LIKE '%有機%' finds products containing '有機' (Organic) anywhere in the name (% represents any characters). IN ('食品', '飲料') is a concise alternative to category = '食品' OR category = '飲料'. LIKE and IN are among the most practical SQL filtering tools, used constantly in everyday work.",
                            frameworkTip: "Using IN instead of multiple OR statements makes SQL more concise in interviews. Interviewers appreciate code with high readability.",
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
                                WHERE -- LIKE for fuzzy search
                                  AND -- IN for multi-value filtering;
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE name LIKE '%有機%' AND category IN ('食品', '飲料');"
                        ),
                        Challenge(
                            id: 4,
                            name: "Multi-Boolean Condition Filtering",
                            type: .code,
                            difficulty: .easy,
                            question: "Find products where is_recyclable = 1 AND is_low_carbon = 1. Display name, category, and price.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sustainable Product Label Filtering",
                                narrative: "You work on the data team at a large retailer. The company recently launched a \"Sustainable Products\" initiative, and the products table has two flag columns: is_recyclable (recyclable packaging) and is_low_carbon (low-carbon manufacturing). The marketing team wants to find products that meet both criteria for a green zone recommendation.\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, is_recyclable INTEGER, is_low_carbon INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["In SQLite, boolean values are represented as 0 and 1", "Use AND to combine two conditions that must both be true"],
                            explanation: "SQLite does not have a native BOOLEAN type; it typically uses INTEGER with 0 (false) and 1 (true). When filtering, simply compare with = 1. The key to this problem is applying two boolean conditions simultaneously — AND ensures both must be satisfied.",
                            frameworkTip: "When filtering on multiple boolean columns, first confirm the meaning and value range of each column (0/1 vs TRUE/FALSE), then combine the conditions. In an interview, explain your understanding of the data columns.",
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
                                WHERE -- two boolean conditions;
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE is_recyclable = 1 AND is_low_carbon = 1;"
                        ),
                        Challenge(
                            id: 5,
                            name: "NULL Value Handling",
                            type: .code,
                            difficulty: .easy,
                            question: "Find members whose referrer_id is not 2 (including those with no referrer). Display name.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Member Referrer Analysis",
                                narrative: "The membership system records each member's referrer (referrer_id). The marketing team wants to find members who were NOT referred by the VIP member (ID = 2) to apply a different marketing strategy. Note: some members signed up organically and have no referrer (referrer_id is NULL).\n\nTable structure: members (id INTEGER, name TEXT, referrer_id INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["NULL != 2 does not evaluate to TRUE — it evaluates to NULL (unknown)", "Use IS NULL to check for NULL values", "Use OR to include both cases"],
                            explanation: "The trap in this problem is SQL's three-valued logic. In SQL, NULL != 2 evaluates to NULL (not TRUE), so WHERE referrer_id != 2 automatically excludes rows where the value is NULL. To include members without a referrer, you must add OR referrer_id IS NULL. This is one of the most common bugs in SQL.",
                            frameworkTip: "NULL handling is a frequently tested interview topic. Remember three principles: (1) Any comparison involving NULL evaluates to NULL, (2) Use IS NULL / IS NOT NULL to check for NULLs, (3) WHERE only keeps rows where the result is TRUE.",
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
                                WHERE -- watch out for NULL handling;
                            """,
                            expectedQuery: "SELECT name FROM members WHERE referrer_id != 2 OR referrer_id IS NULL;"
                        ),
                        Challenge(
                            id: 6,
                            name: "OR Multi-Condition Filtering",
                            type: .code,
                            difficulty: .easy,
                            question: "Find countries where area_sq_km > 3000000 OR population > 25000000. Display name, area_sq_km, and population.",
                            scenario: 
                            Challenge.Scenario(
                                title: "International Market Filtering",
                                narrative: "You work at a multinational consulting firm, and the team is analyzing market opportunities across countries. They define a \"large market\" as one with an area exceeding 3 million square kilometers OR a population exceeding 25 million. Find the qualifying markets from the countries table.\n\nTable structure: countries (id INTEGER, name TEXT, continent TEXT, area_sq_km REAL, population INTEGER, gdp_usd REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["OR means \"either condition being true is sufficient\"", "Numeric comparisons do not require quotes"],
                            explanation: "The OR operator includes a row as long as either side of the condition is true. For example, Taiwan's population does not exceed 25 million and its area does not exceed 3 million, so it does not qualify. Japan, although its area is under 3 million, has a population exceeding 25 million, so it qualifies. The difference between OR and AND is a fundamental logic concept tested in interviews.",
                            frameworkTip: "In interviews, when the requirement says \"A or B\", use OR; when it says \"A and B\", use AND. If AND and OR are mixed in the same query, always use parentheses to group them explicitly.",
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
                                WHERE -- area or population condition;
                            """,
                            expectedQuery: "SELECT name, area_sq_km, population FROM countries WHERE area_sq_km > 3000000 OR population > 25000000;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-3",
                    name: "Sorting and Advanced Filtering",
                    description: "Master sorting, pagination, and deduplication to precisely control query results",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ORDER BY Sorting",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve salesperson, amount, and sale_date from all sales records. Sort by amount descending first, then by salesperson ascending as a tiebreaker.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Leaderboard",
                                narrative: "At the end of each month, the sales department publishes a performance leaderboard. Your manager asks you to generate a report sorted by sales amount from highest to lowest, with alphabetical name sorting as a tiebreaker.\n\nTable structure: sales_records (id INTEGER, salesperson TEXT, region TEXT, amount REAL, sale_date TEXT)",
                                data: [
                                    ["id": "1", "salesperson": "王大明", "region": "北區", "amount": "85000", "sale_date": "2024-03-15"],
                                    ["id": "2", "salesperson": "李小華", "region": "南區", "amount": "92000", "sale_date": "2024-03-20"],
                                    ["id": "3", "salesperson": "陳志偉", "region": "北區", "amount": "78000", "sale_date": "2024-03-10"],
                                ],
                                dataCaption: "sales_records table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DESC means descending (largest first), ASC means ascending (smallest first)", "ORDER BY can use commas to separate multiple sort columns"],
                            explanation: "ORDER BY amount DESC, salesperson ASC sorts by amount in descending order first, then by name in ascending order when amounts are equal. Multi-column sorting is very common when creating leaderboards and reports. Note: ASC is the default sort direction and can be omitted, but it is recommended to write it explicitly for code readability.",
                            frameworkTip: "In interviews, always explicitly write ASC/DESC rather than relying on defaults. This shows that your coding style is rigorous and your intent is clear.",
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
                                ORDER BY -- Sort by amount first, then by name;
                            """,
                            expectedQuery: "SELECT salesperson, amount, sale_date FROM sales_records ORDER BY amount DESC, salesperson ASC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Pagination with LIMIT and OFFSET",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve products sorted by id, getting page 2 of results (5 items per page, i.e., items 6 through 10).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Product Listing Pagination",
                                narrative: "The e-commerce website's product listing needs to display results in pages of 5 items each. The frontend engineer asks how to implement pagination in SQL so users can navigate to page 2.\n\nTable structure: products (id INTEGER, name TEXT, category TEXT, price REAL, created_at TEXT)",
                                data: [
                                    ["id": "1", "name": "無線滑鼠", "price": "450"],
                                    ["id": "2", "name": "機械鍵盤", "price": "2800"],
                                    ["id": "3", "name": "USB Hub", "price": "380"],
                                ],
                                dataCaption: "products table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LIMIT controls how many rows are returned, OFFSET controls how many rows to skip", "Page 2 means skipping the 5 rows on page 1, so OFFSET = 5"],
                            explanation: "LIMIT 5 OFFSET 5 means skip the first 5 rows (page 1), then return 5 rows (the contents of page 2). Pagination formula: OFFSET = (page number - 1) * items per page. LIMIT/OFFSET is the basic way to implement pagination and is used in nearly every web application.",
                            frameworkTip: "Interview follow-up: if the dataset is very large (millions of rows), OFFSET performance degrades significantly. An advanced approach is to use WHERE id > last_id_from_previous_page, known as keyset pagination.",
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
                                -- Skip how many rows? Take how many?;
                            """,
                            expectedQuery: "SELECT * FROM products ORDER BY id ASC LIMIT 5 OFFSET 5;"
                        ),
                        Challenge(
                            id: 3,
                            name: "DISTINCT and Deduplication",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Regarding DISTINCT, which of the following statements is most accurate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Distribution Analysis",
                                narrative: "The marketing team wants to know which cities the company's customers are located in. You query the city column from the customers table, but find that many cities appear multiple times. You need to use DISTINCT to remove duplicate values.",
                                data: [
                                    ["id": "1", "name": "王小明", "city": "台北市"],
                                    ["id": "2", "name": "李小華", "city": "高雄市"],
                                    ["id": "3", "name": "陳大偉", "city": "台北市"],
                                    ["id": "4", "name": "林美玲", "city": "台中市"],
                                    ["id": "5", "name": "張志豪", "city": "台北市"],
                                ],
                                dataCaption: "customers table (sample data)"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SELECT DISTINCT city FROM customers returns all city values, including duplicates", explanation: "The purpose of DISTINCT is precisely to remove duplicate values. Without DISTINCT, all values (including duplicates) would be returned."),
                                Challenge.Option(id: "B", text: "DISTINCT can only be used on a single column and cannot deduplicate across multiple columns", explanation: "DISTINCT can operate on combinations of multiple columns. For example, SELECT DISTINCT city, category removes rows where the city + category combination is identical."),
                                Challenge.Option(id: "C", text: "SELECT DISTINCT city FROM customers returns a unique list of cities — for example, Taipei appears only once", explanation: "Correct! DISTINCT removes duplicate rows from the query results. Even if Taipei appears three times in the data, it will only appear once in the result."),
                                Challenge.Option(id: "D", text: "DISTINCT and GROUP BY are completely different and can never be used interchangeably", explanation: "In some scenarios, DISTINCT and GROUP BY can achieve similar results. For example, SELECT DISTINCT city and SELECT city GROUP BY city return the same result. However, GROUP BY can be combined with aggregate functions, making it more powerful."),
                            ],
                            correctAnswer: "C",
                            hints: ["DISTINCT goes after SELECT and removes duplicate rows from the result", "Think about it: without DISTINCT, how many times would Taipei appear?"],
                            explanation: "DISTINCT deduplicates query results, ensuring that every row returned is unique. This is especially useful when counting \"how many different values exist\" — such as which cities have customers, which departments exist, or which product categories there are. In interviews, DISTINCT is often combined with COUNT: COUNT(DISTINCT city) counts the number of unique cities.",
                            frameworkTip: "Interview tip: if you need to \"list distinct values,\" use DISTINCT. If you need \"statistics per value,\" use GROUP BY. Demonstrating that you know the difference and appropriate use cases for each is valuable."
                        ),
                        Challenge(
                            id: 4,
                            name: "Date Range & Counting",
                            type: .code,
                            difficulty: .easy,
                            question: "Count the number of distinct active users per day (alias active_users) between 2024-03-01 and 2024-03-31. Order by activity_date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Active Users in the Last 30 Days",
                                narrative: "The product team wants to understand Daily Active User (DAU) trends over the last 30 days. The activity log records each user's actions, and a single user may have multiple entries on the same day. You need to count distinct active users per day.\n\nTable structure: user_activity (id INTEGER, user_id INTEGER, activity_type TEXT, activity_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT column) counts unique values only", "Use BETWEEN to filter a date range", "A single user may have multiple records per day — use DISTINCT to deduplicate"],
                            explanation: "COUNT(DISTINCT user_id) is the key here — it counts only unique user IDs. Without DISTINCT, multiple actions by the same user on the same day would be counted repeatedly, inflating the active user count. This is the most fundamental way to calculate DAU (Daily Active Users).",
                            frameworkTip: "When DAU/MAU metrics come up in interviews, always emphasize using COUNT(DISTINCT user_id) instead of COUNT(*). This shows you understand how product metrics are defined.",
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
                                       -- distinct user count
                                FROM user_activity
                                WHERE -- date range
                                GROUP BY activity_date
                                ORDER BY activity_date;
                            """,
                            expectedQuery: "SELECT activity_date, COUNT(DISTINCT user_id) AS active_users FROM user_activity WHERE activity_date BETWEEN '2024-03-01' AND '2024-03-31' GROUP BY activity_date ORDER BY activity_date;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Filtering Grouped Results with HAVING",
                            type: .code,
                            difficulty: .easy,
                            question: "Find courses with enrollment count >= 5. Display course_name and student count (student_count), ordered by student_count descending.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Popular Course Filtering",
                                narrative: "An online learning platform wants to identify \"popular courses\" for homepage recommendations. A course is defined as popular if it has 5 or more enrolled students. Each enrollment record represents one student enrolling in one course.\n\nTable structure: enrollments (id INTEGER, student_id INTEGER, course_name TEXT, enroll_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["HAVING is used to filter results after GROUP BY", "In the HAVING clause, use the aggregate function COUNT(*), not the alias", ">= 5 means \"greater than or equal to 5\""],
                            explanation: "GROUP BY course_name groups enrollment records by course, and COUNT(*) counts the number of records in each group (i.e., the number of students). HAVING COUNT(*) >= 5 keeps only courses with 5 or more students. Note that WHERE cannot filter aggregate results — WHERE executes before GROUP BY and can only filter raw data rows.",
                            frameworkTip: "The distinction between WHERE and HAVING: WHERE filters \"raw rows\" (before GROUP BY), HAVING filters \"grouped results\" (after GROUP BY). One clear sentence in an interview is all you need.",
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
                                -- filter by count condition
                                ORDER BY student_count DESC;
                            """,
                            expectedQuery: "SELECT course_name, COUNT(*) AS student_count FROM enrollments GROUP BY course_name HAVING COUNT(*) >= 5 ORDER BY student_count DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "23-4",
                    name: "Deep Dive into Aggregate Functions",
                    description: "Master COUNT, SUM, AVG, and other aggregate functions along with GROUP BY and HAVING",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "COUNT and SUM",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to calculate the following for all orders in the orders table: total count (total_orders), total amount (total_revenue), average amount (avg_amount), maximum amount (max_amount), and minimum amount (min_amount).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly Performance Report",
                                narrative: "The finance department needs a simple monthly performance summary: total number of orders, total revenue, average order amount, and the highest and lowest individual order amounts. You need to calculate all these metrics at once using aggregate functions.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: [
                                    ["id": "1", "amount": "1500", "status": "completed"],
                                    ["id": "2", "amount": "800", "status": "completed"],
                                    ["id": "3", "amount": "2200", "status": "completed"],
                                    ["id": "4", "amount": "350", "status": "completed"],
                                ],
                                dataCaption: "orders table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM() calculates the total, AVG() calculates the average", "MAX() and MIN() find the largest and smallest values respectively", "Use AS to give each result a meaningful alias"],
                            explanation: "The five core SQL aggregate functions: COUNT (count), SUM (total), AVG (average), MAX (maximum), MIN (minimum). These are the most fundamental data analysis tools. In interviews, you are often asked to calculate multiple metrics in a single SQL statement, demonstrating your familiarity with aggregate functions.",
                            frameworkTip: "When writing aggregate queries in an interview, always use meaningful AS aliases. An interviewer reading SUM(amount) AS total_revenue understands your intent more easily than just SUM(amount).",
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
                                  -- Total amount
                                  -- Average amount
                                  -- Maximum amount
                                  -- Minimum amount
                                FROM orders;
                            """,
                            expectedQuery: "SELECT COUNT(*) AS total_orders, SUM(amount) AS total_revenue, AVG(amount) AS avg_amount, MAX(amount) AS max_amount, MIN(amount) AS min_amount FROM orders;"
                        ),
                        Challenge(
                            id: 2,
                            name: "GROUP BY for Grouped Statistics",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to calculate the headcount (headcount), average salary (avg_salary), and maximum salary (max_salary) for each department, sorted by average salary in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Department Salary Analysis",
                                narrative: "The HR manager wants to understand the salary situation across departments, including headcount, average salary, and maximum salary per department. You need to use GROUP BY to calculate by department.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, salary REAL, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "工程部", "salary": "72000"],
                                    ["id": "2", "name": "李小華", "department": "行銷部", "salary": "55000"],
                                    ["id": "3", "name": "陳大偉", "department": "工程部", "salary": "85000"],
                                    ["id": "4", "name": "林美玲", "department": "人資部", "salary": "58000"],
                                ],
                                dataCaption: "employees table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY department groups employees from the same department together", "Columns in SELECT that are not inside aggregate functions must appear in GROUP BY", "ORDER BY can use an AS alias for sorting"],
                            explanation: "GROUP BY department groups data by department, then calculates aggregate functions separately for each group. Key rule: non-aggregated columns in SELECT must appear in GROUP BY. ORDER BY avg_salary DESC puts the highest-paid department first. This is one of the most frequently tested SQL question types in interviews.",
                            frameworkTip: "Explain your thought process in interviews: \"First GROUP BY department to create groups, then use aggregate functions to compute statistics for each group, and finally ORDER BY to sort.\" This shows the interviewer you clearly understand SQL execution order.",
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
                                       -- Average salary
                                       -- Maximum salary
                                FROM employees
                                GROUP BY -- Group by what?
                                ORDER BY -- Sort by what?;
                            """,
                            expectedQuery: "SELECT department, COUNT(*) AS headcount, AVG(salary) AS avg_salary, MAX(salary) AS max_salary FROM employees GROUP BY department ORDER BY avg_salary DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "HAVING to Filter Groups",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find customers who have placed more than 3 orders. Display customer_id, order count (order_count), and total spending (total_spent), sorted by total spending in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Identifying Active Customers",
                                narrative: "The marketing team defines \"active customers\" as those who have placed more than 3 orders. They want to identify these customers and see their spending statistics to use as the target audience for a VIP marketing campaign.\n\nTable structure: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["customer_id": "101", "order_count": "5", "total_spent": "8500"],
                                    ["customer_id": "102", "order_count": "2", "total_spent": "1200"],
                                    ["customer_id": "103", "order_count": "4", "total_spent": "6800"],
                                ],
                                dataCaption: "Customer Spending Summary (expected result sample)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use HAVING (not WHERE) to filter after aggregation", "HAVING goes after GROUP BY", "You can use aggregate functions like COUNT(*) in HAVING"],
                            explanation: "HAVING COUNT(*) > 3 filters the aggregated results to keep only customers with more than 3 orders. The key difference between WHERE and HAVING: WHERE filters raw data rows before grouping, while HAVING filters aggregated results after grouping. SQL execution order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.",
                            frameworkTip: "Classic interview follow-up: \"What is the difference between WHERE and HAVING?\" Standard answer: \"WHERE filters raw data rows and executes before GROUP BY; HAVING filters aggregated group results and executes after GROUP BY.\"",
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
                                -- How do you filter for customers with more than 3 orders?
                                ORDER BY total_spent DESC;
                            """,
                            expectedQuery: "SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total_spent FROM orders GROUP BY customer_id HAVING COUNT(*) > 3 ORDER BY total_spent DESC;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Weighted Average Calculation",
                            type: .code,
                            difficulty: .easy,
                            question: "Calculate the weighted average selling price for each product (alias weighted_avg_price): SUM(unit_price * units_sold) / SUM(units_sold). Display product_name and weighted_avg_price, ordered by product_name. Round the result to 2 decimal places.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Product Weighted Average Selling Price",
                                narrative: "An e-commerce platform's product prices fluctuate with promotions. The price log table records the selling price and units sold for each period. The finance team needs the \"weighted average selling price\" (weighted by units sold) for each product, not a simple average.\n\nTable structure: price_log (id INTEGER, product_id INTEGER, product_name TEXT, unit_price REAL, units_sold INTEGER, period TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Weighted average = total revenue / total quantity = SUM(price * qty) / SUM(qty)", "Use ROUND(value, 2) to round to 2 decimal places", "Multiply by 1.0 to ensure floating-point division (avoid integer division truncation)"],
                            explanation: "A weighted average differs from a simple average (AVG) in that it accounts for the sales volume associated with each price. The formula is SUM(unit_price * units_sold) / SUM(units_sold). For example, if a product sold 120 units during a promotion but only 50 units at regular price, the promotional price should have a greater impact on the average. This is extremely common in financial analysis.",
                            frameworkTip: "In interviews, when asked about \"averages,\" first clarify whether it's a simple average or a weighted average. Proactively raising this distinction shows the interviewer you understand business logic.",
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
                                       ROUND(-- weighted average formula, 2) AS weighted_avg_price
                                FROM price_log
                                GROUP BY product_name
                                ORDER BY product_name;
                            """,
                            expectedQuery: "SELECT product_name, ROUND(SUM(unit_price * units_sold) * 1.0 / SUM(units_sold), 2) AS weighted_avg_price FROM price_log GROUP BY product_name ORDER BY product_name;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Multi-Dimension Group Statistics",
                            type: .code,
                            difficulty: .medium,
                            question: "Group by SUBSTR(trans_date,1,7) (alias month) and country. Calculate: total transaction count (trans_count), approved transaction count (approved_count, where status='approved'), total transaction amount (trans_total), and approved transaction amount (approved_total). Order by month, country.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly Transaction Analysis Report",
                                narrative: "The risk management team needs a monthly transaction report: grouped by month and country, showing total transaction count, approved transaction count, total transaction amount, and approved transaction amount. This report is used to detect anomalous transaction patterns.\n\nTable structure: transactions (id INTEGER, country TEXT, status TEXT, amount REAL, trans_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use CASE WHEN inside aggregate functions for conditional calculations", "SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) counts approved transactions", "SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) sums approved amounts"],
                            explanation: "The core technique here is Conditional Aggregation: placing CASE WHEN inside SUM to decide what value to add based on a condition. SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) effectively counts only rows where status is 'approved'. This is more concise and efficient than using subqueries or multiple JOINs.",
                            frameworkTip: "CASE WHEN combined with aggregate functions is an essential technique for intermediate interview questions. It lets you calculate multiple conditional metrics in a single query, avoiding the need for multiple subqueries.",
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
                                       -- approved transaction count
                                       SUM(amount) AS trans_total
                                       -- approved transaction amount
                                FROM transactions
                                GROUP BY month, country
                                ORDER BY month, country;
                            """,
                            expectedQuery: "SELECT SUBSTR(trans_date, 1, 7) AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN status = 'approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total, SUM(CASE WHEN status = 'approved' THEN amount ELSE 0 END) AS approved_total FROM transactions GROUP BY month, country ORDER BY month, country;"
                        ),
                        Challenge(
                            id: 6,
                            name: "User Retention Rate Calculation",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate the day-1 retention rate (alias day1_retention): number of users who also logged in the day after their first login / total number of users. Round the result to 2 decimal places using ROUND.",
                            scenario: 
                            Challenge.Scenario(
                                title: "New User Day-1 Retention Rate",
                                narrative: "The product team wants to know the \"new user day-1 retention rate\": of all users, what proportion logged in again the day after their first login? This is a core metric for measuring product stickiness.\n\nTable structure: logins (id INTEGER, player_id INTEGER, login_date TEXT)\n\nHint: First find each user's first login date, then check whether they have a login record for the following day.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use MIN(login_date) with GROUP BY player_id to find the first login date", "SQLite date arithmetic: DATE(date_string, '+1 day')", "Use LEFT JOIN to keep all users — those who did not log in the next day will be NULL", "Use SUM(CASE WHEN ... IS NOT NULL ...) to count users who logged in the next day"],
                            explanation: "This problem has three steps: (1) A subquery finds each user's first login date using MIN(login_date), (2) LEFT JOIN back to the logins table where the same user logged in on first_login + 1 day, (3) Calculate the ratio: users with a match / total users. DATE(date, '+1 day') is SQLite's date arithmetic syntax. This is a classic retention rate calculation in product analytics.",
                            frameworkTip: "Retention rate is a must-know metric for product interviews. The formula is \"users still active after a given period / initial users.\" In interviews, state the formula first, then translate it into SQL to demonstrate your ability to go from business logic to technical implementation.",
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
                                -- Hint: Use a subquery to find each user's first login date
                                -- Then use JOIN or EXISTS to check if they logged in the next day
                                SELECT ROUND(
                                  -- users who logged in the next day * 1.0 / total users
                                , 2) AS day1_retention;
                            """,
                            expectedQuery: "SELECT ROUND(SUM(CASE WHEN l2.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id), 2) AS day1_retention FROM (SELECT player_id, MIN(login_date) AS first_login FROM logins GROUP BY player_id) f LEFT JOIN logins l2 ON f.player_id = l2.player_id AND l2.login_date = DATE(f.first_login, '+1 day');"
                        ),
                    ]
                ),
                Quest(
                    id: "23-5",
                    name: "String and Date Processing",
                    description: "Use string functions and date functions to handle real-world data",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "String Functions",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to retrieve for each customer: the uppercase name (upper_name), lowercase email (lower_email), name length (name_length), and a greeting (greeting, in the format 'Hello, ' || name || '!').",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Data Cleanup",
                                narrative: "Customer names in the database have inconsistent capitalization — some are all uppercase, others are lowercase. The marketing team needs a uniformly formatted list: display the name (all uppercase), email (all lowercase), name length, and a greeting using || concatenation.\n\nTable structure: customers (id INTEGER, name TEXT, email TEXT, city TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice Wang", "email": "ALICE@MAIL.COM", "city": "Taipei"],
                                    ["id": "2", "name": "bob lee", "email": "Bob@Mail.Com", "city": "Kaohsiung"],
                                ],
                                dataCaption: "customers table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPPER() converts to uppercase, LOWER() converts to lowercase", "LENGTH() calculates string length", "|| is the string concatenation operator in SQLite"],
                            explanation: "Common SQLite string functions: UPPER() converts to uppercase, LOWER() converts to lowercase, LENGTH() calculates length. The || operator concatenates strings, similar to + or concat() in other languages. Data cleanup is a daily task for data analysts, and string processing questions are common in interviews.",
                            frameworkTip: "Interview extension: if asked about SUBSTR(), the syntax is SUBSTR(string, start_position, length). REPLACE(string, old_value, new_value) is used for text replacement. Memorize these common functions so you can apply them flexibly in interviews.",
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
                                  -- Lowercase email
                                  -- Name length
                                  -- Greeting concatenation
                                FROM customers;
                            """,
                            expectedQuery: "SELECT UPPER(name) AS upper_name, LOWER(email) AS lower_email, LENGTH(name) AS name_length, 'Hello, ' || name || '!' AS greeting FROM customers;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Date Functions",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to retrieve each employee's name, hire_date, hire year (hire_year), hire month (hire_month), and the number of days employed from hire date to today (days_employed, using julianday). Sort by days in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Tenure Statistics",
                                narrative: "The HR department wants to calculate each employee's tenure, including their hire date, the number of days employed as of today, and the year and month they were hired. SQLite uses date() and strftime() for date processing.\n\nTable structure: employees (id INTEGER, name TEXT, department TEXT, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "王小明", "department": "工程部", "hire_date": "2021-03-15"],
                                    ["id": "2", "name": "李小華", "department": "行銷部", "hire_date": "2023-01-10"],
                                ],
                                dataCaption: "employees table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["strftime('%Y', date) extracts the year, strftime('%m', date) extracts the month", "julianday('now') - julianday(date) calculates the difference in days", "Use CAST(... AS INTEGER) to convert decimal days to an integer"],
                            explanation: "Core SQLite date processing tools: strftime() extracts parts of a date (year, month, day, etc.), julianday() converts a date to a Julian day number (a continuous day count), and subtracting two julianday values gives the difference in days. CAST(... AS INTEGER) converts the result to an integer. These functions are very practical for date analysis.",
                            frameworkTip: "Commonly tested date operations in interviews: (1) Extract year/month: strftime('%Y/%m', date) (2) Calculate day difference: subtract julianday values (3) Get today's date: date('now'). Memorize these three patterns and you can handle most date-related questions.",
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
                                       -- Hire month
                                       -- Days employed (using julianday)
                                FROM employees
                                ORDER BY -- Sort by days;
                            """,
                            expectedQuery: "SELECT name, hire_date, strftime('%Y', hire_date) AS hire_year, strftime('%m', hire_date) AS hire_month, CAST(julianday('now') - julianday(hire_date) AS INTEGER) AS days_employed FROM employees ORDER BY days_employed DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "String Case Correction",
                            type: .code,
                            difficulty: .easy,
                            question: "Convert each user's name to Proper Case (first letter uppercase, rest lowercase), alias formatted_name. Display id and formatted_name, ordered by id.\n\nHint: Use UPPER + SUBSTR for the first letter, LOWER + SUBSTR for the rest, then concatenate with ||.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Standardizing User Name Formatting",
                                narrative: "The support team discovered that user names in the system have inconsistent casing: some are all uppercase, some all lowercase, and some have random capitalization. They need all names converted to Proper Case (first letter uppercase, rest lowercase) for mailing labels and official documents.\n\nTable structure: users (id INTEGER, name TEXT, email TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUBSTR(name, 1, 1) extracts the first character", "SUBSTR(name, 2) extracts from the second character to the end (omitting the length parameter)", "UPPER() converts to uppercase, LOWER() converts to lowercase", "|| is SQLite's string concatenation operator"],
                            explanation: "SQLite does not have a built-in INITCAP or Proper Case function, so you need to build it manually: UPPER(SUBSTR(name, 1, 1)) capitalizes the first letter, LOWER(SUBSTR(name, 2)) lowercases the rest, and || concatenates the two parts. This is a very practical string manipulation technique.",
                            frameworkTip: "String processing interview questions often test the SUBSTR + UPPER/LOWER combination. Remember SUBSTR's parameter order: (string, start_position, length) — omitting the length means extract to the end.",
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
                                       -- first letter uppercase || rest lowercase AS formatted_name
                                FROM users
                                ORDER BY id;
                            """,
                            expectedQuery: "SELECT id, UPPER(SUBSTR(name, 1, 1)) || LOWER(SUBSTR(name, 2)) AS formatted_name FROM users ORDER BY id;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Group Concatenation",
                            type: .code,
                            difficulty: .easy,
                            question: "Group by sale_date. Concatenate distinct product names alphabetically using \", \" as separator (alias products), and also show the distinct product count (alias product_count). Order by sale_date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Best-Selling Products List",
                                narrative: "The operations team needs a daily summary of \"which products were sold that day.\" They want one row per day with all sold product names concatenated by commas, without duplicates, sorted alphabetically.\n\nTable structure: daily_sales (id INTEGER, product_name TEXT, sale_date TEXT, quantity INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP_CONCAT() concatenates multiple row values into a single string", "GROUP_CONCAT(DISTINCT column) automatically removes duplicates", "COUNT(DISTINCT column) counts the number of unique values"],
                            explanation: "GROUP_CONCAT is a SQLite aggregate function that concatenates multiple values within a group into a single string. Adding DISTINCT removes duplicates. The default separator is a comma. Combined with COUNT(DISTINCT product_name), you can also see how many unique products were sold each day. This is very useful for building summary reports.",
                            frameworkTip: "GROUP_CONCAT is specific to SQLite/MySQL. PostgreSQL uses STRING_AGG, and SQL Server uses STRING_AGG or FOR XML PATH. Mentioning cross-database differences in interviews demonstrates breadth of knowledge.",
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
                                       -- concatenate product names
                                       -- product count
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
                    name: "Boss: Comprehensive Basic Query Challenge",
                    description: "Combine all basic query techniques to tackle comprehensive problems",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Comprehensive Query",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a SQL query to calculate, for completed orders in Q1 2024 (January through March), each product category's order count (order_count), total revenue (total_revenue, as quantity * unit_price), and average order value (avg_order_value). Only show categories with total revenue exceeding 5000, sorted by total revenue in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce Quarterly Report",
                                narrative: "You are a data analyst at an e-commerce company. The CEO asks you to produce a Q1 2024 quarterly report. He wants to know the sales performance of each product category: order count, total revenue, and average order value. Only show categories with revenue exceeding 5000, sorted by total revenue in descending order.\n\nTable structures:\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- order_items (id INTEGER, order_id INTEGER, product_id INTEGER, quantity INTEGER, unit_price REAL)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT, status TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["You need to JOIN three tables: order_items, orders, and products", "Date filter: order_date >= '2024-01-01' AND order_date < '2024-04-01'", "Average order value = total revenue / distinct order count", "Use HAVING to filter aggregated results"],
                            explanation: "This question combines all basic query techniques: (1) JOIN to combine three tables (2) WHERE to filter by date and status (3) GROUP BY to group by category (4) aggregate functions for COUNT and SUM (5) HAVING to filter aggregated results (6) ORDER BY to sort. Note that COUNT(DISTINCT o.id) ensures the same order is not counted multiple times. Average order value is calculated as total revenue divided by distinct order count.",
                            frameworkTip: "When facing complex queries in interviews, use an \"inside-out\" approach: (1) identify which tables and JOIN conditions you need (2) add WHERE filters (3) GROUP BY for grouping (4) write aggregate functions (5) HAVING for filtering (6) ORDER BY for sorting. Build step by step rather than trying to write everything at once.",
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
                                       -- Average order value
                                FROM order_items oi
                                JOIN orders o ON oi.order_id = o.id
                                JOIN products p ON oi.product_id = p.id
                                WHERE -- Q1 date filter AND completed orders
                                GROUP BY -- Group by category
                                -- Filter for total revenue over 5000
                                ORDER BY -- Sort;
                            """,
                            expectedQuery: "SELECT p.category, COUNT(DISTINCT o.id) AS order_count, SUM(oi.quantity * oi.unit_price) AS total_revenue, ROUND(SUM(oi.quantity * oi.unit_price) * 1.0 / COUNT(DISTINCT o.id), 2) AS avg_order_value FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN products p ON oi.product_id = p.id WHERE o.order_date >= '2024-01-01' AND o.order_date < '2024-04-01' AND o.status = 'completed' GROUP BY p.category HAVING total_revenue > 5000 ORDER BY total_revenue DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Analysis Plan Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "Design a complete analysis plan: What SQL queries would you write? What is the purpose of each query? How would you combine the results to answer the PM's questions?",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Retention Analysis Plan",
                                narrative: "You are a data analyst at an e-commerce company. The PM asks you to analyze \"7-day retention rate for new users.\" He wants to know: (1) Of the new users who registered each day over the past month, how many placed another order within 7 days of registration? (2) Which user attributes (city, registration source) correlate with retention rates?\n\nAvailable tables:\n- users (id, name, city, source, registered_date)\n- orders (id, user_id, amount, order_date, status)\n- page_views (id, user_id, page_url, view_date)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Start by clearly defining the metric for \"retention\"", "Think about which tables you need to JOIN and what conditions to use", "Don't forget to segment by different dimensions (city, source)"],
                            explanation: "The keys to designing an analysis plan are: (1) clearly define the metric (what counts as \"retention\") (2) break it down into executable SQL steps (3) consider data quality issues. In interviews, demonstrating that you can translate a vague business question into a concrete SQL query plan is more valuable than just knowing SQL syntax.",
                            frameworkTip: "When facing open-ended analysis questions in interviews, use this framework: (1) Clarify definitions: \"Retention is defined as...\" (2) Break into steps: \"I would approach this in three steps...\" (3) Consider limitations: \"Potential data issues include...\" (4) Expected output: \"The final deliverable would be...\" This framework makes your answer clear, structured, and convincing."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 24,
            name: "SQL Analytics Core",
            emoji: "🔗",
            description: "Multi-table joins, subqueries, and CTEs — master the core skills of data integration",
            quests: [
                Quest(
                    id: "24-1",
                    name: "Advanced Multi-Table Joins",
                    description: "INNER JOIN, LEFT JOIN, and three-table JOINs — master the core of multi-table querying",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INNER JOIN Basics",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query using INNER JOIN to list each order's customer name, order amount, and date, sorted by date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Merging Orders with Customer Data",
                                narrative: "The e-commerce operations team needs a report listing each order along with the corresponding customer name and order amount. The order data and customer data are stored in two separate tables, and you need to use INNER JOIN to combine them.\n\nTables:\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["customer": "Alice", "order_id": "1", "amount": "1200", "order_date": "2026-01-10"],
                                    ["customer": "Bob", "order_id": "2", "amount": "850", "order_date": "2026-01-12"],
                                    ["customer": "Alice", "order_id": "3", "amount": "2300", "order_date": "2026-01-15"],
                                ],
                                dataCaption: "Expected result (partial sample)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["INNER JOIN syntax: FROM table1 INNER JOIN table2 ON table1.key = table2.key", "Use ON to specify the join condition: orders.customer_id corresponds to customers.id"],
                            explanation: "INNER JOIN only returns rows that have matches in both tables. Here we use ON o.customer_id = c.id to link orders with customers. If a customer has no orders, or an order's customer_id doesn't exist, they won't appear in the results. This is the most basic and commonly used JOIN type.",
                            frameworkTip: "When you encounter a \"merge two tables\" requirement in an interview, first identify the join column (foreign key relationship), then decide between INNER JOIN and LEFT JOIN.",
                            sampleSchema: """
                                CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
                                INSERT INTO customers VALUES (1, 'Alice', 'Taipei');
                                INSERT INTO customers VALUES (2, 'Bob', 'Taichung');
                                INSERT INTO customers VALUES (3, 'Charlie', 'Kaohsiung');
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
                                -- Use INNER JOIN to connect the customers table
                                ORDER BY o.order_date;
                            """,
                            expectedQuery: "SELECT c.name, o.amount, o.order_date FROM orders o INNER JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date;"
                        ),
                        Challenge(
                            id: 2,
                            name: "LEFT JOIN to Find Missing Data",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find all customers who have never placed an order, showing customer name and email.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find Customers Who Have Never Placed an Order",
                                narrative: "The marketing team wants to send promotional emails to customers who have never placed an order. You need to find customers who exist in the customers table but have no records in the orders table. This is a classic use case for LEFT JOIN + IS NULL.\n\nTables:\n- customers (id INTEGER, name TEXT, email TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN preserves all rows from the left table; unmatched rows from the right table are filled with NULL", "Use WHERE o.id IS NULL to filter for rows with no match on the right side — these are the customers with no orders"],
                            explanation: "LEFT JOIN preserves all rows from the left table (customers). For customers with no orders, all columns from the orders side will be NULL. Then, WHERE o.id IS NULL filters for these rows, giving you customers who have never placed an order. This is the classic SQL pattern for finding missing relationships, and it's more efficient than using a NOT IN subquery.",
                            frameworkTip: "\"Find the missing\" requirements (customers with no orders, users who never attended an event) are very common in interviews. LEFT JOIN + IS NULL is the standard approach.",
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
                                -- Which type of JOIN should you use?
                                -- How do you filter for customers with no orders?
                            """,
                            expectedQuery: "SELECT c.name, c.email FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Three-Table JOIN",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to list each order line item: customer name, order date, product name, quantity, and subtotal (quantity * unit_price), sorted by order date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Complete Order Detail Report",
                                narrative: "The finance department needs a complete order detail report that includes customer information, order information, and product information. This data is spread across three tables, and you need to use multiple JOINs to link them together.\n\nTables:\n- customers (id INTEGER, name TEXT, city TEXT)\n- orders (id INTEGER, customer_id INTEGER, order_date TEXT)\n- order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A three-table JOIN simply means writing two consecutive JOINs: join one table first, then join the next", "order_items connects to orders via order_id, and orders connects to customers via customer_id", "The subtotal can be calculated directly: oi.quantity * oi.unit_price AS subtotal"],
                            explanation: "The key to multi-table JOINs is identifying the connection path between tables. order_items connects to orders via order_id, and orders connects to customers via customer_id. The syntax is simply consecutive JOIN ... ON ... clauses. In practice, JOINs across 3 to 5 tables are common — the important thing is to clearly understand the primary key and foreign key relationships between tables.",
                            frameworkTip: "Interview tip for multi-table JOINs: sketch out the ER diagram (the connections between tables) first, then write the JOINs in order to avoid missing any.",
                            sampleSchema: """
                                CREATE TABLE customers (id INTEGER, name TEXT, city TEXT);
                                INSERT INTO customers VALUES (1, 'Alice', 'Taipei');
                                INSERT INTO customers VALUES (2, 'Bob', 'Taichung');
                                CREATE TABLE orders (id INTEGER, customer_id INTEGER, order_date TEXT);
                                INSERT INTO orders VALUES (101, 1, '2026-01-10');
                                INSERT INTO orders VALUES (102, 2, '2026-01-12');
                                INSERT INTO orders VALUES (103, 1, '2026-01-15');
                                CREATE TABLE order_items (id INTEGER, order_id INTEGER, product_name TEXT, quantity INTEGER, unit_price REAL);
                                INSERT INTO order_items VALUES (1, 101, 'Wireless Mouse', 2, 350.00);
                                INSERT INTO order_items VALUES (2, 101, 'USB Hub', 1, 280.00);
                                INSERT INTO order_items VALUES (3, 102, 'Mechanical Keyboard', 1, 2400.00);
                                INSERT INTO order_items VALUES (4, 103, 'Monitor Stand', 1, 1200.00);
                                INSERT INTO order_items VALUES (5, 103, 'Mouse Pad', 3, 150.00);
                            """,
                            starterCode: """
                                SELECT c.name, o.order_date, oi.product_name, oi.quantity,
                                       -- Calculate subtotal
                                FROM order_items oi
                                -- JOIN the orders table
                                -- JOIN the customers table
                                ORDER BY o.order_date, oi.id;
                            """,
                            expectedQuery: "SELECT c.name, o.order_date, oi.product_name, oi.quantity, oi.quantity * oi.unit_price AS subtotal FROM order_items oi JOIN orders o ON oi.order_id = o.id JOIN customers c ON o.customer_id = c.id ORDER BY o.order_date, oi.id;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Self-Join: Detecting Performance Growth",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find dates where revenue was higher than the previous day. Display the id, date, and revenue for those days.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Which days had higher revenue than the previous day?",
                                narrative: "The operations manager wants to identify which days saw store revenue increase compared to the previous day. You have a daily performance log and need to use a Self-Join to find dates where \"today's revenue > yesterday's revenue.\"\n\nTable:\n- daily_metrics (id INTEGER, record_date TEXT, revenue REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A self-join means joining the same table to itself using different aliases (t1, t2)", "SQLite's date() function supports date arithmetic: date(record_date, '+1 day') represents the next day"],
                            explanation: "A Self-Join treats the same table as two separate tables for comparison. Here t1 represents \"today\" and t2 represents \"yesterday,\" linked by date(t1.record_date) = date(t2.record_date, '+1 day') to establish a \"today = yesterday + 1 day\" relationship. Then WHERE t1.revenue > t2.revenue filters for days with growth. This is a classic \"compare with the previous row\" pattern, widely used in trend analysis.",
                            frameworkTip: "The key to self-joins is clearly defining \"who is compared with whom\": first assign roles to t1 and t2, then use ON to describe their relationship",
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
                                -- Self-join: compare today with yesterday
                                WHERE t1.revenue > -- yesterday's revenue
                                ORDER BY t1.record_date;
                            """,
                            expectedQuery: "SELECT t1.id, t1.record_date, t1.revenue FROM daily_metrics t1 JOIN daily_metrics t2 ON date(t1.record_date) = date(t2.record_date, '+1 day') WHERE t1.revenue > t2.revenue ORDER BY t1.record_date;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Cross Join + Left Join Combo",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to display each employee's completion count for every course. Courses not taken should show 0.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Training Completion Report",
                                narrative: "The HR manager needs a report showing each employee's completion status for every training course. Even if an employee hasn't taken a certain course, it should still appear in the report (with a completion count of 0). This requires a CROSS JOIN to generate all combinations first, then a LEFT JOIN to bring in actual completion data.\n\nTables:\n- employees (id INTEGER, name TEXT)\n- courses (id INTEGER, course_name TEXT)\n- completions (id INTEGER, employee_id INTEGER, course_id INTEGER, completed_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CROSS JOIN produces the \"full Cartesian product\" of two tables (3 employees x 3 courses = 9 rows)", "When LEFT JOINing completions, you need to match both employee_id and course_id", "COUNT(comp.id) only counts non-NULL values, so uncompleted courses will show 0"],
                            explanation: "CROSS JOIN + LEFT JOIN is a classic pattern for generating a \"complete matrix report.\" CROSS JOIN first creates all employee-course combinations (ensuring every pair has a row), then LEFT JOIN brings in the actual completion records. COUNT(comp.id) only counts matched rows, so missing completions naturally become 0. This is extremely common in practice: attendance reports, exam scores, product-by-region sales matrices, etc.",
                            frameworkTip: "When an interview question requires \"show results even if there is no data,\" think CROSS JOIN to build the skeleton + LEFT JOIN to fill in the data — a powerful problem-solving pattern",
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
                                       -- How do you calculate the completion count (0 for uncompleted)?
                                       AS completion_count
                                FROM employees e
                                -- First generate all employee x course combinations
                                -- Then LEFT JOIN the completion records
                                GROUP BY e.id, c.id
                                ORDER BY e.name, c.course_name;
                            """,
                            expectedQuery: "SELECT e.name, c.course_name, COUNT(comp.id) AS completion_count FROM employees e CROSS JOIN courses c LEFT JOIN completions comp ON e.id = comp.employee_id AND c.id = comp.course_id GROUP BY e.id, c.id ORDER BY e.name, c.course_name;"
                        ),
                        Challenge(
                            id: 6,
                            name: "LEFT JOIN + Conditional Aggregation",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to calculate each user's confirmation rate (rounded to two decimal places). Users with no verification records should show 0.00.",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Confirmation Rate Analysis",
                                narrative: "The product team is analyzing the effectiveness of the user identity verification flow. Each user may initiate multiple verification requests, each resulting in either confirmed or timeout. The PM wants to know each user's \"confirmation rate\": confirmed count / total verification count. Users who never initiated a verification should show 0.00.\n\nTables:\n- signups (user_id INTEGER, signup_date TEXT)\n- confirmations (id INTEGER, user_id INTEGER, action TEXT, action_date TEXT)\n  The action column contains either confirmed or timeout",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LEFT JOIN ensures users with no verification records still appear", "SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) counts the number of successes", "NULLIF(COUNT(c.id), 0) prevents division by zero, then COALESCE converts NULL to 0.00"],
                            explanation: "This problem combines four techniques: LEFT JOIN (retain all users), CASE WHEN (conditional counting), NULLIF (avoid division by zero), and COALESCE (handle NULLs). LEFT JOIN ensures users without verification records still appear, CASE WHEN performs conditional counting within aggregation, NULLIF prevents division-by-zero errors, and COALESCE sets users with no records to 0.00. This \"rate calculation\" pattern is extremely common in conversion rate, completion rate, and similar analyses.",
                            frameworkTip: "Defensive pattern for calculating ratios: COALESCE(success_count / NULLIF(total_count, 0), 0) — handles both \"no denominator\" and \"zero denominator\" cases simultaneously",
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
                                       -- Calculate confirmation rate; show 0.00 if no records
                                       AS confirmation_rate
                                FROM signups s
                                -- Which type of JOIN?
                                GROUP BY s.user_id
                                ORDER BY s.user_id;
                            """,
                            expectedQuery: "SELECT s.user_id, ROUND(COALESCE(1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(c.id), 0), 0.00), 2) AS confirmation_rate FROM signups s LEFT JOIN confirmations c ON s.user_id = c.user_id GROUP BY s.user_id ORDER BY s.user_id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-2",
                    name: "Conditional Logic and NULL Handling",
                    description: "CASE WHEN, COALESCE, and NULL pitfalls — make your queries more flexible",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CASE WHEN Classification",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to add a spending_tier column for each customer: total_spent >= 10000 is \"VIP\", >= 3000 is \"Regular\", and the rest is \"New\". Sort by total_spent in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Spending Tier Classification",
                                narrative: "The marketing department wants to classify customers into three tiers based on cumulative spending: VIP (spending >= 10000), Regular (spending >= 3000), and New (spending < 3000). You need to use CASE WHEN to create the classification column.\n\nTable:\n- customer_spending (customer_id INTEGER, name TEXT, total_spent REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CASE WHEN conditions are evaluated from top to bottom; the first match is selected", "Since we check from high to low, >= 10000 is evaluated first, and matches skip the >= 3000 check", "Anything that doesn't match any condition falls through to ELSE"],
                            explanation: "CASE WHEN is SQL's conditional expression, similar to if-else in programming languages. Conditions are evaluated top to bottom, and the first match returns its corresponding value. Here we check >= 10000 (VIP) first, then >= 3000 (Regular), with the rest falling to New. CASE WHEN is extremely useful in data analysis for segmentation, labeling, and creating derived columns.",
                            frameworkTip: "Using CASE WHEN in an interview to demonstrate \"data segmentation\" ability is a plus. Remember to consider edge cases and NULL values.",
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
                                         -- Classify into three tiers by amount
                                       END AS spending_tier
                                FROM customer_spending
                                ORDER BY total_spent DESC;
                            """,
                            expectedQuery: "SELECT name, total_spent, CASE WHEN total_spent >= 10000 THEN 'VIP' WHEN total_spent >= 3000 THEN 'Regular' ELSE 'New' END AS spending_tier FROM customer_spending ORDER BY total_spent DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "NULL Handling",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to: (1) use COALESCE to replace NULL phone values with \"Not provided\"; (2) count the number of employees missing phone numbers and total employees per department.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Contact Information Cleanup",
                                narrative: "The HR department is cleaning up employee contact information and found that some employees have NULL values in their phone or email fields. Management needs a report that shows \"Not provided\" if phone is NULL, along with a count of how many employees in each department are missing phone numbers.\n\nTable:\n- employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COALESCE(phone, \"Not provided\") replaces NULL with a default value", "To count NULLs, use SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END)", "COUNT(phone) only counts non-NULL values, so COUNT(*) - COUNT(phone) also gives you the NULL count"],
                            explanation: "COALESCE accepts multiple arguments and returns the first non-NULL value — it's the standard tool for handling NULLs. There are two ways to count NULLs: (1) SUM(CASE WHEN col IS NULL THEN 1 ELSE 0 END), (2) COUNT(*) - COUNT(col). Both give the same result, but the CASE WHEN approach is more flexible and can handle multiple conditions simultaneously.",
                            frameworkTip: "NULL handling is a high-frequency topic in interviews. Remember: NULL is not the same as an empty string, NULL in any comparison yields NULL, and you must use IS NULL / IS NOT NULL.",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER, name TEXT, department TEXT, phone TEXT, email TEXT);
                                INSERT INTO employees VALUES (1, 'Alice', 'Engineering', '0912345678', 'alice@corp.com');
                                INSERT INTO employees VALUES (2, 'Bob', 'Engineering', NULL, 'bob@corp.com');
                                INSERT INTO employees VALUES (3, 'Charlie', 'Marketing', '0923456789', NULL);
                                INSERT INTO employees VALUES (4, 'Diana', 'Marketing', NULL, 'diana@corp.com');
                                INSERT INTO employees VALUES (5, 'Eve', 'Engineering', '0934567890', 'eve@corp.com');
                                INSERT INTO employees VALUES (6, 'Frank', 'Marketing', NULL, NULL);
                                INSERT INTO employees VALUES (7, 'Grace', 'HR', NULL, 'grace@corp.com');
                                INSERT INTO employees VALUES (8, 'Henry', 'HR', '0956789012', 'henry@corp.com');
                            """,
                            starterCode: """
                                SELECT department,
                                       COUNT(*) AS total_employees,
                                       -- Count employees missing phone numbers
                                       -- Hint: count where phone IS NULL
                                FROM employees
                                GROUP BY department
                                ORDER BY department;
                            """,
                            expectedQuery: "SELECT department, COUNT(*) AS total_employees, SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS missing_phone_count FROM employees GROUP BY department ORDER BY department;"
                        ),
                        Challenge(
                            id: 3,
                            name: "NULL Pitfalls",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following SQL result counts are correct?\n\nSELECT COUNT(*) FROM scores; -- Result A\nSELECT COUNT(math_score) FROM scores; -- Result B\nSELECT * FROM scores WHERE math_score != 85; -- Result C\nSELECT * FROM scores WHERE math_score IS NULL OR math_score != 85; -- Result D",
                            scenario: 
                            Challenge.Scenario(
                                title: "NULL Behavior Quiz in SQL",
                                narrative: "In SQL, NULL represents an \"unknown value,\" and its behavior is very different from regular values. Many beginners stumble here. Consider this table with NULLs:\n\nscores (student TEXT, math_score INTEGER, english_score INTEGER)\n\n| student | math_score | english_score |\n|---------|-----------|---------------|\n| Alice   | 85        | 90            |\n| Bob     | NULL      | 75            |\n| Charlie | 70        | NULL          |\n| Diana   | NULL      | NULL          |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A=4, B=4, C=2, D=3", explanation: "Incorrect. COUNT(math_score) does not count NULLs, so B is not 4."),
                                Challenge.Option(id: "B", text: "A=4, B=2, C=1, D=3", explanation: "Correct! COUNT(*) counts all rows = 4; COUNT(math_score) only counts non-NULLs = 2; != 85 excludes NULL rows = 1 (only Charlie); adding IS NULL captures Bob and Diana = 3."),
                                Challenge.Option(id: "C", text: "A=4, B=2, C=2, D=4", explanation: "Incorrect. math_score != 85 does not select NULL rows, so C is only 1 row."),
                                Challenge.Option(id: "D", text: "A=4, B=2, C=3, D=3", explanation: "Incorrect. NULL != 85 evaluates to NULL (not TRUE), so C is not 3."),
                            ],
                            correctAnswer: "B",
                            hints: ["COUNT(*) counts all rows; COUNT(column) only counts non-NULL values in that column", "NULL in any comparison operation (=, !=, >, <) evaluates to NULL, not TRUE or FALSE", "WHERE only keeps rows where the condition is TRUE; rows with NULL or FALSE are filtered out"],
                            explanation: "The core concept of NULL is 'unknown value.' COUNT(*) counts all rows regardless of content; COUNT(col) skips NULLs. The biggest pitfall: NULL != 85 evaluates to NULL (unknown), not TRUE, so WHERE math_score != 85 will not return NULL rows. To include NULL rows, you must explicitly write IS NULL. This is a very high-frequency interview topic.",
                            frameworkTip: "When facing NULL questions in interviews, remember three key rules: (1) NULL is not equal to anything, including NULL itself; (2) Use IS NULL, not = NULL; (3) Aggregate functions generally ignore NULLs."
                        ),
                        Challenge(
                            id: 4,
                            name: "CASE WHEN with Mathematical Logic",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to determine whether each item's three sides can form a triangle, labeling them as Yes or No.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Package Dimension Feasibility Check",
                                narrative: "The logistics team received dimension data (three sides) for a batch of shipments and needs to determine which items can fit into a special packaging box with a triangular cross-section. A valid triangle requires that the sum of any two sides is greater than the third. You need to flag whether each item's three sides can form a triangle.\n\nTable:\n- packages (id INTEGER, side_a REAL, side_b REAL, side_c REAL, item_name TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A valid triangle requires all three conditions to hold simultaneously — connect them with AND", "a + b > c AND a + c > b AND b + c > a"],
                            explanation: "CASE WHEN isn't just for categorization — it can also handle mathematical logic. The triangle inequality requires all three conditions to be true simultaneously: the sum of any two sides must be greater than the third. Here, AND chains the three conditions together, marking Yes only when all are satisfied. This ability to translate \"business rules into SQL conditions\" is critical in practice: credit scoring rules, inventory alerts, compliance checks, and more all follow similar logic.",
                            frameworkTip: "When translating business rules into SQL conditions, first list all required conditions, then decide whether to use AND (all must be met) or OR (any one suffices)",
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
                                         -- Triangle condition: sum of any two sides > the third
                                       END AS is_triangle
                                FROM packages
                                ORDER BY id;
                            """,
                            expectedQuery: "SELECT id, item_name, side_a, side_b, side_c, CASE WHEN side_a + side_b > side_c AND side_a + side_c > side_b AND side_b + side_c > side_a THEN 'Yes' ELSE 'No' END AS is_triangle FROM packages ORDER BY id;"
                        ),
                        Challenge(
                            id: 5,
                            name: "CASE WHEN + Subquery: Primary Assignment",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find each employee's primary department.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Primary Department Assignment",
                                narrative: "Some employees belong to multiple departments (cross-functional projects). The HR system flags which one is primary (primary_flag = Y). However, some employees belong to only one department and have no primary_flag set.\n\nThe HR manager needs a \"primary department\" list for every employee:\n- If primary_flag = Y exists, use that department\n- If the employee belongs to only one department, that is the primary department\n\nTable:\n- employee_dept (employee_id INTEGER, department TEXT, primary_flag TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use OR to combine two cases: those with a flag + those with only one department", "Use a subquery to find \"employees who belong to only one department\": GROUP BY employee_id HAVING COUNT(*) = 1"],
                            explanation: "The key to this problem is handling two distinct cases: (1) Employees with an explicit primary_flag = 'Y' — take that department directly. (2) Employees belonging to only one department (no flag set) — use a subquery with HAVING COUNT(*) = 1 to identify them. The two conditions are combined with OR. This \"handle different cases\" logic is very common in practice: different user types have different evaluation rules.",
                            frameworkTip: "When facing a \"multiple cases\" problem, first list all cases, then write the corresponding WHERE condition for each, and finally combine them with OR / UNION",
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
                                WHERE -- How do you handle both "has a flag" and "only one department" cases?
                                ORDER BY employee_id;
                            """,
                            expectedQuery: "SELECT employee_id, department FROM employee_dept WHERE primary_flag = 'Y' OR employee_id IN (SELECT employee_id FROM employee_dept GROUP BY employee_id HAVING COUNT(*) = 1) ORDER BY employee_id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-3",
                    name: "Subqueries",
                    description: "Master the use cases for WHERE IN, correlated subqueries, and EXISTS",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "WHERE IN Subquery",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query using a WHERE IN subquery to find all products that have been returned, showing the product name, category, and price.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find Products with Return Records",
                                narrative: "The quality assurance team wants to know which products have been returned. Return records are in the returns table and product information is in the products table. You need to use a subquery to find products that appear in the returns table.\n\nTables:\n- products (id INTEGER, name TEXT, category TEXT, price REAL)\n- returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["WHERE IN (subquery) filters rows that \"exist in the subquery result set\"", "The subquery needs to retrieve all returned product_id values from the returns table", "Adding DISTINCT avoids duplicate values in the subquery (though IN is not affected by duplicates)"],
                            explanation: "WHERE IN (subquery) is the most intuitive subquery usage: first use a subquery to find a set of values, then use the outer query to filter matching rows. Here the subquery retrieves all product_ids from returns, and the outer query filters products accordingly. This pattern is ideal for 'find data that meets a certain relational condition.'",
                            frameworkTip: "WHERE IN subqueries are fundamental in interviews, but note: when the subquery result is large, performance may be worse than JOIN or EXISTS.",
                            sampleSchema: """
                                CREATE TABLE products (id INTEGER, name TEXT, category TEXT, price REAL);
                                INSERT INTO products VALUES (1, 'Wireless Earbuds', 'Electronics', 1200.00);
                                INSERT INTO products VALUES (2, 'Sports Water Bottle', 'Lifestyle', 350.00);
                                INSERT INTO products VALUES (3, 'Laptop', 'Electronics', 32000.00);
                                INSERT INTO products VALUES (4, 'Yoga Mat', 'Sports', 800.00);
                                INSERT INTO products VALUES (5, 'Bluetooth Speaker', 'Electronics', 2400.00);
                                CREATE TABLE returns (id INTEGER, product_id INTEGER, return_date TEXT, reason TEXT);
                                INSERT INTO returns VALUES (1, 1, '2026-01-15', 'Defective');
                                INSERT INTO returns VALUES (2, 3, '2026-01-20', 'Wrong specifications');
                                INSERT INTO returns VALUES (3, 1, '2026-02-01', 'Unsatisfied');
                                INSERT INTO returns VALUES (4, 5, '2026-02-10', 'Defective');
                            """,
                            starterCode: """
                                SELECT name, category, price
                                FROM products
                                WHERE id IN (
                                  -- Subquery: find returned product IDs
                                );
                            """,
                            expectedQuery: "SELECT name, category, price FROM products WHERE id IN (SELECT DISTINCT product_id FROM returns);"
                        ),
                        Challenge(
                            id: 2,
                            name: "Correlated Subquery",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query using a correlated subquery to find the highest-paid employee in each department, showing name, department, and salary.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find the Highest-Paid Employee in Each Department",
                                narrative: "The HR manager wants to know who the highest-paid employee is in each department. This requires a correlated subquery: the subquery references values from the outer query and re-executes for each row.\n\nTable:\n- staff (id INTEGER, name TEXT, department TEXT, salary REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A correlated subquery references a column from the outer query (e.g., s1.department)", "The subquery finds MAX(salary) for the same department; the outer query filters rows matching that value", "If multiple employees in a department tie for the highest salary, all of them will be returned"],
                            explanation: "The difference between a correlated subquery and a regular subquery is that the subquery references a value from the outer query (s1.department). The database executes the subquery for each row of the outer query using that row's department value. Although conceptually like a nested loop, the database engine optimizes it automatically. This is the classic pattern for finding 'the row with the max/min value per group.'",
                            frameworkTip: "Correlated subqueries are commonly tested in interviews for \"Top N per group\" problems. Alternative approaches include: (1) JOIN + GROUP BY, (2) window function ROW_NUMBER() — you should know all of them.",
                            sampleSchema: """
                                CREATE TABLE staff (id INTEGER, name TEXT, department TEXT, salary REAL);
                                INSERT INTO staff VALUES (1, 'Alice', 'Engineering', 85000.00);
                                INSERT INTO staff VALUES (2, 'Bob', 'Engineering', 72000.00);
                                INSERT INTO staff VALUES (3, 'Charlie', 'Marketing', 68000.00);
                                INSERT INTO staff VALUES (4, 'Diana', 'Marketing', 75000.00);
                                INSERT INTO staff VALUES (5, 'Eve', 'Engineering', 91000.00);
                                INSERT INTO staff VALUES (6, 'Frank', 'HR', 65000.00);
                                INSERT INTO staff VALUES (7, 'Grace', 'HR', 70000.00);
                            """,
                            starterCode: """
                                SELECT name, department, salary
                                FROM staff s1
                                WHERE salary = (
                                  -- Subquery: find the highest salary in the same department
                                  -- Hint: the subquery should reference s1.department from the outer query
                                );
                            """,
                            expectedQuery: "SELECT name, department, salary FROM staff s1 WHERE salary = (SELECT MAX(salary) FROM staff s2 WHERE s2.department = s1.department);"
                        ),
                        Challenge(
                            id: 3,
                            name: "EXISTS vs IN",
                            type: .code,
                            difficulty: .medium,
                            question: "Use an EXISTS subquery to find customers with active subscriptions, showing customer name and email.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find Customers with Active Subscriptions",
                                narrative: "The operations team needs to find customers who currently have at least one \"active\" subscription. Only subscriptions with status \"active\" count. Compared to IN, EXISTS is generally more efficient when the subquery returns a large dataset, because it stops as soon as it finds the first match.\n\nTables:\n- customers (id INTEGER, name TEXT, email TEXT)\n- subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["EXISTS only checks \"whether the subquery returns at least one row\" — it returns TRUE as soon as a match is found", "The content of the SELECT in an EXISTS subquery doesn't matter (SELECT 1 is conventional); what matters is the WHERE condition", "The subquery needs to match both customer_id and status = \"active\""],
                            explanation: "EXISTS checks whether the subquery 'has any results' — if so, it returns TRUE. The difference from IN: IN executes the subquery first to produce a complete list, then matches; EXISTS checks row by row and stops on the first match. When the subquery result set is large or requires multiple conditions, EXISTS generally performs better. SELECT 1 in the subquery is just convention — SELECT * works the same way.",
                            frameworkTip: "Choosing between EXISTS and IN: use IN when the subquery result is small for readability; use EXISTS when the result is large or conditions are complex for efficiency. Explaining your rationale in interviews earns bonus points.",
                            sampleSchema: """
                                CREATE TABLE customers (id INTEGER, name TEXT, email TEXT);
                                INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com');
                                INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com');
                                INSERT INTO customers VALUES (3, 'Charlie', 'charlie@example.com');
                                INSERT INTO customers VALUES (4, 'Diana', 'diana@example.com');
                                CREATE TABLE subscriptions (id INTEGER, customer_id INTEGER, plan TEXT, status TEXT, start_date TEXT);
                                INSERT INTO subscriptions VALUES (1, 1, 'Monthly Plan', 'active', '2026-01-01');
                                INSERT INTO subscriptions VALUES (2, 1, 'Annual Plan', 'cancelled', '2025-01-01');
                                INSERT INTO subscriptions VALUES (3, 2, 'Monthly Plan', 'expired', '2025-06-01');
                                INSERT INTO subscriptions VALUES (4, 3, 'Quarterly Plan', 'active', '2026-02-01');
                                INSERT INTO subscriptions VALUES (5, 4, 'Monthly Plan', 'active', '2026-03-01');
                            """,
                            starterCode: """
                                SELECT c.name, c.email
                                FROM customers c
                                WHERE EXISTS (
                                  -- Subquery: check for active subscriptions
                                  -- Hint: match both customer_id and status
                                );
                            """,
                            expectedQuery: "SELECT c.name, c.email FROM customers c WHERE EXISTS (SELECT 1 FROM subscriptions s WHERE s.customer_id = c.id AND s.status = 'active');"
                        ),
                        Challenge(
                            id: 4,
                            name: "Subquery: Finding the Second Highest Value",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find the second highest salary. If it does not exist, return NULL.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Second Highest Salary Query",
                                narrative: "The HR manager wants to know the second highest salary in the company as a reference benchmark for salary grading. Note: if there is no second highest salary (e.g., everyone has the same salary), the result should return NULL.\n\nTable:\n- employees (id INTEGER, name TEXT, salary REAL, department TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use a subquery to find the highest salary, then find \"the maximum value less than the highest\"", "MAX() naturally returns NULL if no rows match", "Think in terms of DISTINCT: if multiple people share the highest salary, the second highest is not a duplicate of that value"],
                            explanation: "\"Find the Nth highest\" is a classic subquery problem. The strategy: first use a subquery to find the maximum (SELECT MAX(salary)), then in the outer query find \"the maximum value less than the highest.\" If everyone has the same salary, WHERE salary < MAX won't match any rows, and MAX() naturally returns NULL. This approach is more elegant than LIMIT + OFFSET and better demonstrates your understanding of subqueries.",
                            frameworkTip: "For interview \"find the Nth highest\" problems, first describe the exclusion method (use a subquery to exclude the top N-1), then mention a DENSE_RANK window function approach as an alternative",
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
                                  -- How to get the second highest salary?
                                  -- Should return NULL if it doesn't exist
                                  AS second_highest_salary;
                            """,
                            expectedQuery: "SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);"
                        ),
                        Challenge(
                            id: 5,
                            name: "UNION Subquery: Dual-Dimension Ranking",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query using UNION to combine two results: (1) the user with the most reviews and (2) the restaurant with the highest average rating in 2026-02.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Restaurant Review Analysis Report",
                                narrative: "A dining platform needs to prepare a summary with two pieces of information in a single result set:\n1. The user with the most reviews\n2. The restaurant with the highest average rating in February 2026\n\nCombine both results into one table using UNION.\n\nTables:\n- users (user_id INTEGER, name TEXT)\n- restaurants (restaurant_id INTEGER, name TEXT)\n- reviews (id INTEGER, user_id INTEGER, restaurant_id INTEGER, rating INTEGER, review_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL merges two SELECT results — they must have the same number and compatible types of columns", "Each subquery needs ORDER BY + LIMIT 1 to find the \"most/highest\" entry", "Use alphabetical name ordering (ORDER BY name) as the tiebreaker"],
                            explanation: "UNION ALL can merge two entirely different query results into one table, as long as the column count and types are compatible. The first query finds the user with the most reviews, and the second finds the restaurant with the highest average rating in a specific month. Each subquery independently performs JOIN + GROUP BY + ORDER BY + LIMIT. This \"multi-dimension ranking\" requirement is common in product reports: presenting Top 1 from different perspectives simultaneously.",
                            frameworkTip: "The two SELECTs in a UNION must have the same number of columns with compatible types. Column names are determined by the first SELECT.",
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
                                -- Part 1: User with the most reviews
                                SELECT -- ...

                                UNION ALL

                                -- Part 2: Restaurant with the highest average rating in 2026-02
                                SELECT -- ...;
                            """,
                            expectedQuery: "SELECT u.name AS result FROM users u JOIN reviews r ON u.user_id = r.user_id GROUP BY u.user_id ORDER BY COUNT(*) DESC, u.name LIMIT 1 UNION ALL SELECT rest.name AS result FROM restaurants rest JOIN reviews r ON rest.restaurant_id = r.restaurant_id WHERE substr(r.review_date, 1, 7) = '2026-02' GROUP BY rest.restaurant_id ORDER BY AVG(r.rating) DESC, rest.name LIMIT 1;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-4",
                    name: "CTEs and Multi-Layer Queries",
                    description: "Use WITH clauses to make complex queries clearer and more readable",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic CTE",
                            type: .code,
                            difficulty: .medium,
                            question: "Use a CTE to first calculate each customer's total spending, then filter for customers whose total exceeds the overall average total spending.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Rewrite Customer Spending Stats with a CTE",
                                narrative: "You need to find customers whose spending exceeds the average. Writing this with nested subqueries is hard to read — a CTE (Common Table Expression) lets you break the calculation into named steps for clearer logic.\n\nTable:\n- orders (id INTEGER, customer_id INTEGER, customer_name TEXT, amount REAL, order_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A CTE is defined with WITH name AS (...) and can then be used like a regular table", "The average can be computed with a subquery: SELECT AVG(total_spent) FROM customer_totals", "A key benefit of CTEs is that the same CTE can be referenced multiple times in the main query and subqueries"],
                            explanation: "A CTE breaks a complex query into named steps: first compute each customer's total spending in customer_totals, then filter for above-average customers in the main query. A major advantage of CTEs is that they can be referenced multiple times (here both the main query and the subquery use customer_totals), avoiding redundant subqueries. This makes queries more readable and maintainable.",
                            frameworkTip: "When facing a complex query in an interview, proactively saying \"I'll use a CTE to keep the logic clear\" demonstrates your code quality awareness.",
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
                                  -- Step 1: Calculate each customer's total spending
                                  SELECT customer_id, customer_name,
                                         SUM(amount) AS total_spent
                                  FROM orders
                                  GROUP BY customer_id, customer_name
                                )
                                SELECT customer_name, total_spent
                                FROM customer_totals
                                WHERE total_spent > (
                                  -- Step 2: Compare against the average
                                );
                            """,
                            expectedQuery: "WITH customer_totals AS (SELECT customer_id, customer_name, SUM(amount) AS total_spent FROM orders GROUP BY customer_id, customer_name) SELECT customer_name, total_spent FROM customer_totals WHERE total_spent > (SELECT AVG(total_spent) FROM customer_totals);"
                        ),
                        Challenge(
                            id: 2,
                            name: "Multi-Layer CTE",
                            type: .code,
                            difficulty: .medium,
                            question: "Use multiple CTEs to: (1) calculate each department's total revenue, (2) calculate the company-wide total revenue, (3) compute each department's share and rank accordingly.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Department Performance Ranking Report",
                                narrative: "Management needs a report: first calculate each department's monthly revenue, then compute each department's percentage of total revenue, and finally rank by percentage. This requires multi-layer CTEs for step-by-step calculation.\n\nTable:\n- sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Multiple CTEs are separated by commas: WITH cte1 AS (...), cte2 AS (...) SELECT ...", "The second CTE can reference the results of the first CTE", "Percentage calculation: total_revenue * 100.0 / grand_total (use 100.0 to ensure floating-point division)"],
                            explanation: "The power of multi-layer CTEs is that each layer can reference previous CTEs. dept_revenue calculates per-department revenue first, company_total then sums from dept_revenue, and finally the main query uses both CTEs to compute percentages. This 'step-by-step' approach makes complex calculations easy to understand and debug. Note: use 100.0 instead of 100 to ensure SQLite performs floating-point division.",
                            frameworkTip: "Multi-layer CTEs are the go-to tool for \"layered calculations.\" When you encounter problems that require \"compute A first, then use A to compute B\" in interviews, CTEs are the first choice.",
                            sampleSchema: """
                                CREATE TABLE sales (id INTEGER, department TEXT, amount REAL, sale_date TEXT);
                                INSERT INTO sales VALUES (1, 'Electronics', 45000.00, '2026-02-03');
                                INSERT INTO sales VALUES (2, 'Apparel', 28000.00, '2026-02-05');
                                INSERT INTO sales VALUES (3, 'Electronics', 32000.00, '2026-02-08');
                                INSERT INTO sales VALUES (4, 'Food', 15000.00, '2026-02-10');
                                INSERT INTO sales VALUES (5, 'Apparel', 19000.00, '2026-02-12');
                                INSERT INTO sales VALUES (6, 'Food', 22000.00, '2026-02-15');
                                INSERT INTO sales VALUES (7, 'Electronics', 51000.00, '2026-02-18');
                                INSERT INTO sales VALUES (8, 'Home', 12000.00, '2026-02-20');
                                INSERT INTO sales VALUES (9, 'Home', 8000.00, '2026-02-22');
                            """,
                            starterCode: """
                                WITH dept_revenue AS (
                                  -- Step 1: Total revenue per department
                                  SELECT department, SUM(amount) AS total_revenue
                                  FROM sales
                                  GROUP BY department
                                ),
                                company_total AS (
                                  -- Step 2: Company-wide total revenue
                                  SELECT SUM(total_revenue) AS grand_total
                                  FROM dept_revenue
                                )
                                SELECT
                                  d.department,
                                  d.total_revenue,
                                  -- Step 3: Calculate percentage (ROUND to 1 decimal place)
                                FROM dept_revenue d, company_total c
                                ORDER BY d.total_revenue DESC;
                            """,
                            expectedQuery: "WITH dept_revenue AS (SELECT department, SUM(amount) AS total_revenue FROM sales GROUP BY department), company_total AS (SELECT SUM(total_revenue) AS grand_total FROM dept_revenue) SELECT d.department, d.total_revenue, ROUND(d.total_revenue * 100.0 / c.grand_total, 1) AS revenue_pct FROM dept_revenue d, company_total c ORDER BY d.total_revenue DESC;"
                        ),
                        Challenge(
                            id: 3,
                            name: "CTE + Window: Moving Average",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query using CTE + Window Function to calculate the 7-day moving average revenue for each day (rounded to two decimal places).",
                            scenario: 
                            Challenge.Scenario(
                                title: "7-Day Moving Average Revenue",
                                narrative: "The finance director wants to see a \"7-day moving average revenue\" for each day to smooth out daily fluctuations and observe long-term trends. The moving average is defined as the average daily revenue over the past 7 days (including the current day). Only display dates with a full 7 days of data available.\n\nTable:\n- daily_revenue (visit_date TEXT, revenue REAL)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["ROWS BETWEEN 6 PRECEDING AND CURRENT ROW in the Window Function defines a 7-day window", "Use ROW_NUMBER() for numbering, then WHERE rn >= 7 ensures only dates with a full 7 days of data are shown", "AVG() OVER (...) computes the average within the window"],
                            explanation: "Moving averages are a fundamental tool in time series analysis. The Window Function's ROWS BETWEEN 6 PRECEDING AND CURRENT ROW defines a sliding window: from 6 rows before to the current row (7 rows total). AVG(revenue) OVER (...) computes the average within this window. The CTE calculates the moving average and row number for all rows, and the outer query uses WHERE rn >= 7 to ensure only results with a complete 7-day window are displayed. This is extremely common in operational dashboards.",
                            frameworkTip: "ROWS BETWEEN N PRECEDING AND CURRENT ROW is the standard syntax for defining a moving window. Demonstrating this syntax when discussing \"moving averages\" in an interview will make a strong impression",
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
                                         -- Use a Window Function to calculate the 7-day moving average
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
                            name: "CTE + UNION: Bidirectional Relationship Counting",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find the employee ID with the most collaboration partners and the partner count.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find the Employee with the Most Collaboration Partners",
                                narrative: "The company has a \"project pairing\" system that records which employees have collaborated on projects together. Pairings are bidirectional: if A collaborates with B, then B also collaborates with A. Management wants to know which employee has the most collaboration partners (the widest social network).\n\nTable:\n- project_pairs (requester_id INTEGER, accepter_id INTEGER)\n  Each record indicates the requester initiated a collaboration invitation and the accepter accepted",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Handling bidirectional relationships: treat requester_id and accepter_id each as employee_id, and combine with UNION ALL", "Each appearance represents one collaboration partner, so COUNT(*) gives the partner count", "ORDER BY ... DESC LIMIT 1 finds the one with the most"],
                            explanation: "Bidirectional relationships (such as friendships or collaborations) are typically stored in only one direction in databases. To count each person's \"connection count,\" you need to account for both directions. The CTE uses UNION ALL to convert both requester_id and accepter_id into a unified employee_id, so each appearance represents one collaboration relationship. Then GROUP BY + COUNT(*) tallies each person's partner count. This is a foundational technique in social network analysis.",
                            frameworkTip: "When facing a bidirectional relationship problem, the first step is always to use UNION ALL to flatten both directions into a unified format, then perform aggregation analysis",
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
                                  -- Flatten bidirectional relationships into unidirectional
                                  -- Use UNION ALL to list both requester and accepter
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
                    name: "Data Cleaning and Quality Checks",
                    description: "Find duplicates, check data quality, and merge datasets",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Find Duplicate Data",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find duplicate emails and their occurrence counts, showing only those that appear more than once.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer List Deduplication",
                                narrative: "The marketing team imported a batch of customer data and suspects there are duplicate emails. You need to find which emails appear more than once so the data can be cleaned.\n\nTable:\n- customer_list (id INTEGER, name TEXT, email TEXT, source TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Filtering after GROUP BY requires HAVING, not WHERE", "WHERE filters rows before grouping; HAVING filters groups after grouping", "HAVING COUNT(*) > 1 finds groups that appear more than once"],
                            explanation: "Finding duplicate data is the first step in data cleaning. GROUP BY email groups rows by the same email, COUNT(*) counts the rows in each group, and HAVING COUNT(*) > 1 keeps only those appearing more than once. The difference between HAVING and WHERE: WHERE filters rows before grouping, HAVING filters groups after grouping. This is an extremely common query pattern in both interviews and real-world work.",
                            frameworkTip: "Demonstrating \"data quality awareness\" in an interview is a plus. Check for duplicates, NULLs, and outliers before analysis — this is the standard workflow for professional data practitioners.",
                            sampleSchema: """
                                CREATE TABLE customer_list (id INTEGER, name TEXT, email TEXT, source TEXT);
                                INSERT INTO customer_list VALUES (1, 'Alice Chen', 'alice@example.com', 'Website');
                                INSERT INTO customer_list VALUES (2, 'Bob Lin', 'bob@example.com', 'Trade Show');
                                INSERT INTO customer_list VALUES (3, 'Alice C.', 'alice@example.com', 'Trade Show');
                                INSERT INTO customer_list VALUES (4, 'Charlie Wu', 'charlie@example.com', 'Website');
                                INSERT INTO customer_list VALUES (5, 'Diana Lee', 'diana@example.com', 'Referral');
                                INSERT INTO customer_list VALUES (6, 'Bob', 'bob@example.com', 'Referral');
                                INSERT INTO customer_list VALUES (7, 'Eve Wang', 'eve@example.com', 'Website');
                                INSERT INTO customer_list VALUES (8, 'Alice', 'alice@example.com', 'Referral');
                            """,
                            starterCode: """
                                SELECT email, COUNT(*) AS occurrence_count
                                FROM customer_list
                                GROUP BY email
                                -- How do you keep only duplicates?
                            """,
                            expectedQuery: "SELECT email, COUNT(*) AS occurrence_count FROM customer_list GROUP BY email HAVING COUNT(*) > 1 ORDER BY occurrence_count DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Data Quality Check",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find all problematic orders: amount <= 0 or customer_id not found in the customers table. Show the order id, issue description, and relevant fields.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Order Data Consistency Check",
                                narrative: "A data engineer maintaining the order system needs to check data quality: (1) find orders with negative or zero amounts, (2) find records with incorrect date formats, (3) find \"orphan\" orders whose customer_id doesn't exist in the customers table.\n\nTables:\n- customers (id INTEGER, name TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT, status TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use CASE WHEN to label different issue types", "To check \"customer doesn't exist,\" use a NOT IN subquery or LEFT JOIN + IS NULL", "Combine both conditions in WHERE with OR"],
                            explanation: "Data quality checking is a routine part of data engineering. This question combines CASE WHEN (to label issue types) with a NOT IN subquery (to check referential integrity). Common data quality issues in practice include: excessive NULL values, values outside reasonable ranges, broken foreign key relationships, and duplicate data. Building automated quality check queries helps catch problems early.",
                            frameworkTip: "Mentioning \"I always run a data quality check first\" in interviews demonstrates thoroughness. Common checks: NULL ratio, duplicate rate, value distribution, and referential integrity.",
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
                                         -- Identify the type of issue
                                       END AS issue_type,
                                       o.amount, o.customer_id
                                FROM orders o
                                WHERE -- Amount is abnormal
                                   OR -- Customer does not exist
                                ORDER BY o.id;
                            """,
                            expectedQuery: "SELECT o.id AS order_id, CASE WHEN o.amount <= 0 THEN 'Invalid amount' WHEN o.customer_id NOT IN (SELECT id FROM customers) THEN 'Customer not found' END AS issue_type, o.amount, o.customer_id FROM orders o WHERE o.amount <= 0 OR o.customer_id NOT IN (SELECT id FROM customers) ORDER BY o.id;"
                        ),
                        Challenge(
                            id: 3,
                            name: "UNION to Merge Data",
                            type: .code,
                            difficulty: .easy,
                            question: "Use UNION ALL to combine both sales tables, adding a channel column to label the source (\"Online\" / \"Offline\"), sorted by date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Merge Online and Offline Sales Data",
                                narrative: "The company has two sales channels: an online store and physical retail locations, each with its own sales table. Management needs a combined report showing all sales records across channels.\n\nTables:\n- online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT)\n- offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL combines all results (including duplicates); UNION removes duplicates", "Adding a constant value like \"Online\" AS channel in the SELECT labels the source", "Both SELECT statements must have the same number and types of columns", "ORDER BY goes at the end and sorts the entire combined result"],
                            explanation: "UNION ALL vertically combines two query results (stacking them). The difference from UNION: UNION removes duplicate rows, while UNION ALL keeps all rows (and performs better). Here we use constants 'Online'/'Offline' AS channel to label each record's source. Note that UNION requires both sides to have the same number and types of columns. ORDER BY can only appear at the end and sorts the entire combined result.",
                            frameworkTip: "Merging data from multiple sources is a common real-world need. UNION ALL is generally used more often than UNION (better performance, and you usually don't want accidental deduplication).",
                            sampleSchema: """
                                CREATE TABLE online_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT);
                                INSERT INTO online_sales VALUES (1, 'Wireless Earbuds', 1200.00, '2026-02-01');
                                INSERT INTO online_sales VALUES (2, 'Phone Case', 350.00, '2026-02-03');
                                INSERT INTO online_sales VALUES (3, 'Charging Cable', 180.00, '2026-02-05');
                                CREATE TABLE offline_sales (id INTEGER, product TEXT, amount REAL, sale_date TEXT, store TEXT);
                                INSERT INTO offline_sales VALUES (1, 'Bluetooth Speaker', 2400.00, '2026-02-02', 'Taipei Store');
                                INSERT INTO offline_sales VALUES (2, 'Power Bank', 890.00, '2026-02-04', 'Taichung Store');
                                INSERT INTO offline_sales VALUES (3, 'Wireless Earbuds', 1200.00, '2026-02-06', 'Kaohsiung Store');
                            """,
                            starterCode: """
                                SELECT product, amount, sale_date,
                                       -- Add source label
                                FROM online_sales

                                UNION ALL

                                SELECT product, amount, sale_date,
                                       -- Add source label
                                FROM offline_sales

                                ORDER BY sale_date;
                            """,
                            expectedQuery: "SELECT product, amount, sale_date, 'Online' AS channel FROM online_sales UNION ALL SELECT product, amount, sale_date, 'Offline' AS channel FROM offline_sales ORDER BY sale_date;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Flagging Duplicate Records (Keep Smallest ID)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a SQL query to find all duplicate email records that should be removed (keep the one with the smallest id in each group, and list the rest).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Duplicate Email Cleanup Flagging",
                                narrative: "In a previous challenge, you already identified duplicate emails. Now take it a step further: find the duplicate records that should be deleted. The rule is \"keep the record with the smallest id and flag the rest as duplicates.\" You won't actually delete any data (DELETE is too risky) — instead, first query all records that should be flagged as duplicates.\n\nTable:\n- contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use a correlated subquery to find the minimum id for the same email", "WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email)", "If c1.id is greater than the minimum id for the same email, it is a duplicate"],
                            explanation: "This is a classic \"deduplicate and keep the smallest ID\" pattern. The correlated subquery (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) finds the smallest id for each email. If the current row's id is greater than this minimum, it is a duplicate that should be removed. In practice, this query is typically the first step in data cleanup: use SELECT to confirm the rows to delete, verify they are correct, then convert to DELETE.",
                            frameworkTip: "The golden rule of data cleanup: first use SELECT to identify the data to be processed, manually verify it, then execute DELETE/UPDATE. Mentioning this practice in an interview demonstrates your careful approach to production data",
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
                                -- How to find records with the "same email but not the smallest id"?
                                ORDER BY c1.email, c1.id;
                            """,
                            expectedQuery: "SELECT c1.id, c1.email, c1.name FROM contacts c1 WHERE c1.id > (SELECT MIN(c2.id) FROM contacts c2 WHERE c2.email = c1.email) ORDER BY c1.email, c1.id;"
                        ),
                    ]
                ),
                Quest(
                    id: "24-6",
                    name: "Boss: Data Integration Analysis",
                    description: "Combine JOINs, CTEs, and aggregations to solve real-world data integration problems",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Comprehensive JOIN + CTE + Aggregation",
                            type: .code,
                            difficulty: .hard,
                            question: "Use CTE + JOIN + CASE WHEN + aggregation to complete the customer lifetime value analysis report.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Lifetime Value Analysis",
                                narrative: "The management team wants to understand the lifetime value (LTV) of different customer segments. You need to:\n1. Calculate each customer's total spending and order count from the orders and customers tables\n2. Use CASE WHEN to classify customers by registration age: \"New\" (<90 days), \"Mid-term\" (90-365 days), \"Loyal\" (>365 days)\n3. Calculate the average LTV, average order count, and customer count per segment\n\nTables:\n- customers (id INTEGER, name TEXT, registered_date TEXT)\n- orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)\n\nAssume today is 2026-03-01.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The first CTE uses LEFT JOIN to ensure customers with no orders are included (use COALESCE to handle NULL for total_spent)", "JULIANDAY returns a day number; subtracting two dates gives the number of days between them", "CASE WHEN conditions go from smallest to largest: < 90 = New, <= 365 = Mid-term, ELSE = Loyal", "Finally, GROUP BY segment to compute statistics for each group"],
                            explanation: "This question combines all core skills from World 24: LEFT JOIN to connect customers and orders, CTEs for step-by-step computation, CASE WHEN for segmentation, and aggregate functions for statistics. Key design decisions: LEFT JOIN ensures customers without orders are included; COALESCE handles NULLs; JULIANDAY calculates date differences; multi-layer CTEs keep each step's logic clear. This is a typical 'customer segmentation analysis' scenario, extremely common in both real work and interviews.",
                            frameworkTip: "For comprehensive interview questions, start by saying \"I'll break this into several steps\" and build incrementally. Using CTEs to show clear thinking scores higher than writing one massive query.",
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
                                  -- Step 1: Total spending and order count per customer
                                  SELECT c.id, c.name, c.registered_date,
                                         SUM(o.amount) AS total_spent,
                                         COUNT(o.id) AS order_count,
                                         -- Calculate days since registration
                                         JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg
                                  FROM customers c
                                  LEFT JOIN orders o ON c.id = o.customer_id
                                  GROUP BY c.id, c.name, c.registered_date
                                ),
                                customer_segments AS (
                                  -- Step 2: Segment customers
                                  SELECT *,
                                         CASE
                                           -- Classify into three segments by days
                                         END AS segment
                                  FROM customer_stats
                                )
                                -- Step 3: Statistics per segment
                                SELECT segment,
                                       COUNT(*) AS customer_count,
                                       ROUND(AVG(total_spent), 0) AS avg_ltv,
                                       ROUND(AVG(order_count), 1) AS avg_orders
                                FROM customer_segments
                                GROUP BY segment
                                ORDER BY avg_ltv DESC;
                            """,
                            expectedQuery: "WITH customer_stats AS (SELECT c.id, c.name, c.registered_date, COALESCE(SUM(o.amount), 0) AS total_spent, COUNT(o.id) AS order_count, JULIANDAY('2026-03-01') - JULIANDAY(c.registered_date) AS days_since_reg FROM customers c LEFT JOIN orders o ON c.id = o.customer_id GROUP BY c.id, c.name, c.registered_date), customer_segments AS (SELECT *, CASE WHEN days_since_reg < 90 THEN 'New' WHEN days_since_reg <= 365 THEN 'Mid-term' ELSE 'Loyal' END AS segment FROM customer_stats) SELECT segment, COUNT(*) AS customer_count, ROUND(AVG(total_spent), 0) AS avg_ltv, ROUND(AVG(order_count), 1) AS avg_orders FROM customer_segments GROUP BY segment ORDER BY avg_ltv DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Data Integration Strategy",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Source Data Integration Challenge",
                                narrative: "You join the data team of a retail company that has three independent systems:\n\n1. POS System: In-store sales data (product code, quantity, amount, store code)\n2. E-commerce Platform: Online order data (member account, product SKU, amount, shipping address)\n3. CRM System: Customer data (name, phone, email, membership tier)\n\nChallenges:\n- The POS system has no customer ID — only a store loyalty card number (which only some customers have)\n- The e-commerce product SKU and POS product code use different formats\n- The CRM customer ID and e-commerce member account are the same, but the POS loyalty card number requires a separate mapping\n- Data granularity differs: POS data is per-transaction, while e-commerce data is at the order level",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Think about it: how do you \"identify the same person\" across different systems?", "A product mapping table is a fundamental tool for cross-system integration", "Consider the \"no match\" scenario: some POS customers may not have CRM records"],
                            explanation: "Multi-source data integration is a core challenge in data engineering. Key steps: (1) Build dimension tables to unify entity identification (customers, products); (2) Create mapping tables for cross-system ID correspondence; (3) Standardize time granularity and metric definitions; (4) Use CTEs or staging tables for incremental cleansing and transformation; (5) Continuously monitor data quality. This is not just about writing SQL — it's about data architecture design thinking.",
                            frameworkTip: "For open-ended data questions in interviews, demonstrate your thinking framework: define entities first, then build mappings, design an intermediate layer, produce reports, and monitor quality. Showing structured thinking matters more than having a perfect answer."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 25,
            name: "Advanced SQL Analytics",
            emoji: "📊",
            description: "Window Functions, Funnel, Retention — Core SQL Skills for Product Analysts",
            quests: [
                Quest(
                    id: "25-1",
                    name: "Window Functions in Practice",
                    description: "ROW_NUMBER, RANK, Running Totals, LAG/LEAD — Master the core usage of window functions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ROW_NUMBER Ranking",
                            type: .code,
                            difficulty: .medium,
                            question: "Use ROW_NUMBER with PARTITION BY category to rank products within each category by total_sales in descending order. Display category, product_name, total_sales, category_rank.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Ranking Sales by Department",
                                narrative: "The operations manager at an e-commerce platform wants to see the ranking of top-selling products within each product category. You need to use ROW_NUMBER with PARTITION BY to rank within each category.\n\nTable: product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL)",
                                data: [
                                    ["product_id": "1", "category": "Electronics", "product_name": "Bluetooth Headphones", "total_sales": "58000"],
                                    ["product_id": "2", "category": "Electronics", "product_name": "Wireless Mouse", "total_sales": "32000"],
                                    ["product_id": "3", "category": "Household", "product_name": "Insulated Bottle", "total_sales": "45000"],
                                    ["product_id": "4", "category": "Household", "product_name": "Storage Box", "total_sales": "28000"],
                                    ["product_id": "5", "category": "Electronics", "product_name": "Power Bank", "total_sales": "41000"],
                                ],
                                dataCaption: "product_sales table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["PARTITION BY category restarts the ranking within each category", "ORDER BY total_sales DESC inside OVER() defines the ranking criteria", "ROW_NUMBER assigns a unique number to each row, even when values are tied"],
                            explanation: "ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) assigns sequential numbers 1, 2, 3... within each category based on sales in descending order. PARTITION BY defines the grouping scope, and ORDER BY defines the ranking criteria. This is the most fundamental and commonly used Window Functions pattern.",
                            frameworkTip: "Three elements of a Window Function: the function (ROW_NUMBER), partitioning (PARTITION BY), and ordering (ORDER BY). In interviews, state these three components first, then write the SQL.",
                            sampleSchema: """
                                CREATE TABLE product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL);
                                INSERT INTO product_sales VALUES (1, 'Electronics', 'Bluetooth Headphones', 58000);
                                INSERT INTO product_sales VALUES (2, 'Electronics', 'Wireless Mouse', 32000);
                                INSERT INTO product_sales VALUES (3, 'Household', 'Insulated Bottle', 45000);
                                INSERT INTO product_sales VALUES (4, 'Household', 'Storage Box', 28000);
                                INSERT INTO product_sales VALUES (5, 'Electronics', 'Power Bank', 41000);
                                INSERT INTO product_sales VALUES (6, 'Household', 'Eco Bag', 51000);
                                INSERT INTO product_sales VALUES (7, 'Food', 'Nut Gift Box', 37000);
                                INSERT INTO product_sales VALUES (8, 'Food', 'Organic Tea', 29000);
                                INSERT INTO product_sales VALUES (9, 'Food', 'Artisan Cookies', 42000);
                                INSERT INTO product_sales VALUES (10, 'Electronics', 'Charging Cable', 18000);
                            """,
                            starterCode: """
                                SELECT category, product_name, total_sales,
                                       ROW_NUMBER() OVER (
                                         -- Rank within each category
                                         -- Order by sales descending
                                       ) AS category_rank
                                FROM product_sales
                                ORDER BY category, category_rank;
                            """,
                            expectedQuery: "SELECT category, product_name, total_sales, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_rank FROM product_sales ORDER BY category, category_rank;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Running Total",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate each day's revenue and the cumulative revenue up to that day (running_total). Display revenue_date, revenue, running_total ordered by date.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Revenue Running Total",
                                narrative: "The finance team needs to track cumulative daily revenue to determine whether the monthly target can be met by month-end. You need to use SUM() OVER to calculate the running total of revenue each day.\n\nTable: daily_revenue (revenue_date TEXT, revenue REAL)",
                                data: [
                                    ["revenue_date": "2026-03-01", "revenue": "12500"],
                                    ["revenue_date": "2026-03-02", "revenue": "8300"],
                                    ["revenue_date": "2026-03-03", "revenue": "15700"],
                                    ["revenue_date": "2026-03-04", "revenue": "9100"],
                                    ["revenue_date": "2026-03-05", "revenue": "22000"],
                                ],
                                dataCaption: "daily_revenue table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM() OVER (ORDER BY ...) automatically accumulates up to the current row", "No PARTITION BY is needed since this is a grand total accumulation", "ORDER BY revenue_date ensures the running total follows chronological order"],
                            explanation: "SUM(revenue) OVER (ORDER BY revenue_date) accumulates revenue row by row starting from the first record. This is a Running Total, one of the most classic uses of Window Functions. The default frame is ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW, meaning it sums from the very beginning up to the current row.",
                            frameworkTip: "A common interview follow-up: \"What if you need a 7-day moving average?\" The answer is to add ROWS BETWEEN 6 PRECEDING AND CURRENT ROW.",
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
                                         -- How do you define the cumulative range?
                                       ) AS running_total
                                FROM daily_revenue
                                ORDER BY revenue_date;
                            """,
                            expectedQuery: "SELECT revenue_date, revenue, SUM(revenue) OVER (ORDER BY revenue_date) AS running_total FROM daily_revenue ORDER BY revenue_date;"
                        ),
                        Challenge(
                            id: 3,
                            name: "LAG/LEAD Comparison",
                            type: .code,
                            difficulty: .medium,
                            question: "Use LAG to retrieve the previous month's revenue and calculate the month-over-month growth rate (percentage, rounded to one decimal place). Display month, revenue, prev_revenue, growth_rate. The first month's prev_revenue and growth_rate may be NULL.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Month-over-Month Revenue Growth Rate",
                                narrative: "Management requires the monthly report to show \"how much the revenue grew compared to the previous month.\" You need to use the LAG function to retrieve the previous month's revenue and calculate the month-over-month growth rate.\n\nTable: monthly_revenue (month TEXT, revenue REAL)",
                                data: [
                                    ["month": "2025-10", "revenue": "320000"],
                                    ["month": "2025-11", "revenue": "285000"],
                                    ["month": "2025-12", "revenue": "410000"],
                                    ["month": "2026-01", "revenue": "375000"],
                                    ["month": "2026-02", "revenue": "398000"],
                                ],
                                dataCaption: "monthly_revenue table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LAG(revenue, 1) OVER (ORDER BY month) retrieves the revenue from the previous row", "Growth rate formula: (current month - previous month) / previous month * 100", "The first row has no preceding row, so LAG automatically returns NULL"],
                            explanation: "LAG(column, offset) lets you access data from \"N rows before\" within the same row, while LEAD accesses \"N rows after.\" Here we use LAG(revenue, 1) to get the previous month's revenue, then compute the growth rate with (revenue - prev) / prev * 100. This is the core SQL pattern for MoM (Month-over-Month) analysis and is extremely common in interviews.",
                            frameworkTip: "LAG looks backward, LEAD looks forward. In interviews, you can proactively mention: \"For year-over-year (YoY) comparison, use LAG(revenue, 12).\"",
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
                                       -- Calculate growth rate: (current - previous) / previous * 100
                                       ROUND(
                                         -- Your formula here
                                       , 1) AS growth_rate
                                FROM monthly_revenue
                                ORDER BY month;
                            """,
                            expectedQuery: "SELECT month, revenue, LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue, ROUND((revenue - LAG(revenue, 1) OVER (ORDER BY month)) * 100.0 / LAG(revenue, 1) OVER (ORDER BY month), 1) AS growth_rate FROM monthly_revenue ORDER BY month;"
                        ),
                        Challenge(
                            id: 4,
                            name: "DENSE_RANK Activity Ranking",
                            type: .code,
                            difficulty: .medium,
                            question: "Count the number of emails sent by each user and rank them using DENSE_RANK (highest count ranks first). Display from_user, email_count, activity_rank.",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Email Activity Ranking",
                                narrative: "The product team wants to identify the most active email users. You need to rank users by the number of emails they have sent. If two users sent the same number of emails, they should share the same rank (no gaps).\n\nTable: emails (id, from_user, to_user, sent_date)",
                                data: [
                                    ["id": "1", "from_user": "alice", "to_user": "bob", "sent_date": "2024-03-01"],
                                    ["id": "2", "from_user": "alice", "to_user": "charlie", "sent_date": "2024-03-02"],
                                    ["id": "3", "from_user": "bob", "to_user": "alice", "sent_date": "2024-03-03"],
                                    ["id": "4", "from_user": "charlie", "to_user": "alice", "sent_date": "2024-03-04"],
                                    ["id": "5", "from_user": "alice", "to_user": "diana", "sent_date": "2024-03-05"],
                                ],
                                dataCaption: "emails table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DENSE_RANK does not skip ranks, while RANK does — we need no gaps here", "The ORDER BY inside OVER() can directly use aggregate functions", "No PARTITION BY is needed since this is a global ranking"],
                            explanation: "DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) ranks users by email count from highest to lowest, assigning the same rank to ties without gaps. Note the difference between DENSE_RANK and RANK: if two users tie for 1st, the next rank with DENSE_RANK is 2, while with RANK it would be 3. This distinction is a frequent interview question.",
                            frameworkTip: "RANK vs DENSE_RANK vs ROW_NUMBER: RANK skips ranks after ties, DENSE_RANK does not, and ROW_NUMBER assigns a unique number to each row. These three are must-know concepts for interviews.",
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
                                         -- What should the ordering be?
                                       ) AS activity_rank
                                FROM emails
                                GROUP BY from_user
                                ORDER BY activity_rank;
                            """,
                            expectedQuery: "SELECT from_user, COUNT(*) AS email_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS activity_rank FROM emails GROUP BY from_user ORDER BY activity_rank;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Most Active Guest Ranking",
                            type: .code,
                            difficulty: .medium,
                            question: "Count the number of messages per guest and rank them using DENSE_RANK (highest count ranks first). For ties, sort alphabetically by guest_name. Display guest_name, message_count, ranking.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Guest Messaging Activity Ranking",
                                narrative: "The platform operations team wants to identify the most communicative guests to award them a \"Super Guest\" badge. You need to rank guests by total number of messages sent. If multiple guests sent the same number of messages, they share the same rank and should be sorted alphabetically by name.\n\nTable: messages (id, guest_id, guest_name, host_id, message_body, sent_date)",
                                data: [
                                    ["id": "1", "guest_id": "101", "guest_name": "Amy", "host_id": "501", "sent_date": "2024-02-10"],
                                    ["id": "2", "guest_id": "102", "guest_name": "Ben", "host_id": "502", "sent_date": "2024-02-11"],
                                    ["id": "3", "guest_id": "101", "guest_name": "Amy", "host_id": "503", "sent_date": "2024-02-12"],
                                    ["id": "4", "guest_id": "103", "guest_name": "Cathy", "host_id": "501", "sent_date": "2024-02-13"],
                                ],
                                dataCaption: "messages table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["GROUP BY guest_id first, then apply DENSE_RANK for ranking", "Ties should be sorted alphabetically by guest_name — handle this in the outer ORDER BY", "Note that GROUP BY should include both guest_id and guest_name"],
                            explanation: "First GROUP BY guest_id, guest_name to count each guest's messages, then apply DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) for ranking. The outer ORDER BY ranking, guest_name ensures ties are sorted alphabetically. This pattern is extremely common in leaderboard scenarios.",
                            frameworkTip: "Leaderboard pattern: GROUP BY to compute metrics -> DENSE_RANK for ranking -> ORDER BY to handle tie-breaking.",
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
                                         -- Ranking logic?
                                       ) AS ranking
                                FROM messages
                                GROUP BY guest_id, guest_name
                                ORDER BY ranking, guest_name;
                            """,
                            expectedQuery: "SELECT guest_name, COUNT(*) AS message_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking FROM messages GROUP BY guest_id, guest_name ORDER BY ranking, guest_name;"
                        ),
                        Challenge(
                            id: 6,
                            name: "Consecutive Repeating Numbers",
                            type: .code,
                            difficulty: .hard,
                            question: "Use LAG and LEAD (or two consecutive LAGs) to find all values that appear at least 3 times consecutively. Deduplicate the results and display only the value column.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Detecting Three Consecutive Identical Values",
                                narrative: "A data engineer noticed that certain values in a sensor log appear consecutively multiple times, which may indicate a system anomaly. The PM has asked you to find all values that appear at least 3 times in a row.\n\nTable: sensor_logs (id INTEGER PRIMARY KEY, value INTEGER), where id is a sequential number.",
                                data: [
                                    ["id": "1", "value": "10"],
                                    ["id": "2", "value": "10"],
                                    ["id": "3", "value": "10"],
                                    ["id": "4", "value": "20"],
                                    ["id": "5", "value": "20"],
                                    ["id": "6", "value": "30"],
                                ],
                                dataCaption: "sensor_logs table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LAG(value, 1) fetches the previous row, LAG(value, 2) fetches two rows back", "If value = prev1 = prev2, it means three consecutive rows share the same value", "Use DISTINCT to deduplicate, since 4 consecutive occurrences would match twice"],
                            explanation: "Use LAG to retrieve the previous and second-previous values; when all three are equal, it indicates 3 consecutive occurrences. LAG(value, N) uses N as the offset. An alternative approach uses both LAG and LEAD: check if self = previous = next. DISTINCT is necessary because a value appearing 4 times consecutively would be matched multiple times. This is a classic interview question testing flexible use of window functions.",
                            frameworkTip: "Consecutive-N-times pattern: use LAG/LEAD to compare adjacent values, or the \"row_number gap\" technique (GROUP BY value, id - ROW_NUMBER to form groups).",
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
                                WHERE -- What condition means "three consecutive identical values"?;
                            """,
                            expectedQuery: "WITH lagged AS (SELECT id, value, LAG(value, 1) OVER (ORDER BY id) AS prev1, LAG(value, 2) OVER (ORDER BY id) AS prev2 FROM sensor_logs) SELECT DISTINCT value FROM lagged WHERE value = prev1 AND value = prev2;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-2",
                    name: "Funnel Analysis",
                    description: "Conversion funnel analysis — Calculate step-by-step conversion rates and drop-off rates",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic Funnel Query",
                            type: .code,
                            difficulty: .medium,
                            question: "Use COUNT(DISTINCT CASE WHEN ...) to calculate the distinct user count at each funnel step, and compute each step's conversion rate relative to the first step (view) as a percentage rounded to one decimal place.",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-commerce Purchase Funnel Conversion",
                                narrative: "The product manager wants to understand the conversion rate at each step from \"browsing products\" to \"completing payment.\" Events are recorded in the user_events table with four steps: view, add_to_cart, checkout, and payment.\n\nTable: user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)",
                                data: [
                                    ["event_id": "1", "user_id": "101", "event_name": "view", "event_date": "2026-03-01"],
                                    ["event_id": "2", "user_id": "101", "event_name": "add_to_cart", "event_date": "2026-03-01"],
                                    ["event_id": "3", "user_id": "101", "event_name": "checkout", "event_date": "2026-03-01"],
                                    ["event_id": "4", "user_id": "101", "event_name": "payment", "event_date": "2026-03-01"],
                                    ["event_id": "5", "user_id": "102", "event_name": "view", "event_date": "2026-03-01"],
                                    ["event_id": "6", "user_id": "102", "event_name": "add_to_cart", "event_date": "2026-03-02"],
                                ],
                                dataCaption: "user_events table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) counts the distinct users who added to cart", "Conversion rate = users at that step / users at step 1 * 100", "Use a CTE to compute the step counts first, then calculate the rates in the outer query for cleaner SQL"],
                            explanation: "The core pattern for funnel analysis is COUNT(DISTINCT CASE WHEN ... THEN user_id END). Each CASE WHEN corresponds to a funnel step, and COUNT DISTINCT ensures each user is counted only once. Use a CTE to compute the funnel numbers, then calculate conversion rates in the outer query. This is a classic interview question for Product Analyst roles.",
                            frameworkTip: "Three steps of funnel analysis: (1) Define the steps (2) COUNT DISTINCT to get the user count at each step (3) Calculate conversion rates. Use CTEs for layered queries in interviews for better readability.",
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
                                    -- Complete the other three steps
                                  FROM user_events
                                )
                                SELECT
                                  step1_view,
                                  step2_cart,
                                  step3_checkout,
                                  step4_payment,
                                  -- Calculate each step's conversion rate relative to step1
                                FROM funnel;
                            """,
                            expectedQuery: "WITH funnel AS (SELECT COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN event_name = 'checkout' THEN user_id END) AS step3_checkout, COUNT(DISTINCT CASE WHEN event_name = 'payment' THEN user_id END) AS step4_payment FROM user_events) SELECT step1_view, step2_cart, step3_checkout, step4_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_checkout * 100.0 / step1_view, 1) AS checkout_rate, ROUND(step4_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Segmented Funnel Comparison",
                            type: .code,
                            difficulty: .hard,
                            question: "First use CASE WHEN to classify users as \"New User\" (first_visit_date in March 2026) or \"Returning User,\" then calculate the view → add_to_cart → payment conversion rate by segment.",
                            scenario: 
                            Challenge.Scenario(
                                title: "New vs. Returning User Funnel Comparison",
                                narrative: "The PM wants to know how conversion rates differ between new users and returning users in the purchase funnel, in order to decide whether to optimize new user onboarding or improve returning user repurchase. You need to first classify users (first visit vs. returning), then calculate funnels separately.\n\nTables:\n- user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- users (user_id INTEGER, first_visit_date TEXT)",
                                data: [
                                    ["user_id": "101", "first_visit_date": "2026-03-01", "type": "New User"],
                                    ["user_id": "102", "first_visit_date": "2026-01-15", "type": "Returning User"],
                                    ["user_id": "103", "first_visit_date": "2026-03-02", "type": "New User"],
                                ],
                                dataCaption: "users table (sample data; type column is for illustration)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use a CTE to classify each user as new or returning", "In the funnel CTE, GROUP BY segment to calculate the funnel for each group separately", "Finally, compute conversion rates in the outer query to directly compare the two groups"],
                            explanation: "Segmented funnel analysis is a common requirement for Product Analysts. The key is to first create a user_type CTE that defines the segmentation logic, then JOIN it to the events table. GROUP BY segment lets each group compute its funnel independently. This enables you to compare conversion rates between new and returning users and identify optimization opportunities.",
                            frameworkTip: "Bonus points in funnel interview questions: proactively suggest \"Should we segment the comparison? For example, new vs. returning users, different channels, or different regions.\" This demonstrates analytical thinking.",
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
                                           WHEN first_visit_date >= '2026-03-01' THEN 'New User'
                                           ELSE 'Returning User'
                                         END AS segment
                                  FROM users
                                ),
                                funnel AS (
                                  SELECT ut.segment,
                                         -- Calculate view, add_to_cart, payment counts per segment
                                  FROM user_events e
                                  JOIN user_type ut ON e.user_id = ut.user_id
                                  GROUP BY ut.segment
                                )
                                SELECT segment,
                                       step1_view, step2_cart, step3_payment,
                                       -- Calculate conversion rates
                                FROM funnel;
                            """,
                            expectedQuery: "WITH user_type AS (SELECT user_id, CASE WHEN first_visit_date >= '2026-03-01' THEN 'New User' ELSE 'Returning User' END AS segment FROM users), funnel AS (SELECT ut.segment, COUNT(DISTINCT CASE WHEN e.event_name = 'view' THEN e.user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN e.event_name = 'add_to_cart' THEN e.user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN e.event_name = 'payment' THEN e.user_id END) AS step3_payment FROM user_events e JOIN user_type ut ON e.user_id = ut.user_id GROUP BY ut.segment) SELECT segment, step1_view, step2_cart, step3_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Daily Friend Request Acceptance Rate",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate the daily friend request acceptance rate: acceptance_rate = accepts on that day / sends on that day. Display action_date, sends, accepts, acceptance_rate (rounded to 2 decimal places).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Friend Request Acceptance Rate Analysis",
                                narrative: "The Growth team wants to track the health of the friend feature. You need to calculate the daily acceptance rate based on friend request events (send / accept).\n\nTable: friend_requests (id, sender_id, receiver_id, action TEXT, action_date TEXT)\n- action is either \"send\" or \"accept\"",
                                data: [
                                    ["id": "1", "sender_id": "101", "receiver_id": "201", "action": "send", "action_date": "2024-03-01"],
                                    ["id": "2", "sender_id": "101", "receiver_id": "201", "action": "accept", "action_date": "2024-03-01"],
                                    ["id": "3", "sender_id": "102", "receiver_id": "202", "action": "send", "action_date": "2024-03-01"],
                                    ["id": "4", "sender_id": "103", "receiver_id": "203", "action": "send", "action_date": "2024-03-02"],
                                    ["id": "5", "sender_id": "103", "receiver_id": "203", "action": "accept", "action_date": "2024-03-02"],
                                ],
                                dataCaption: "friend_requests table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use CASE WHEN to count sends and accepts separately", "Remember to multiply by 1.0 to avoid integer division", "Use ROUND(..., 2) to round to 2 decimal places"],
                            explanation: "Using SUM(CASE WHEN ...) is a classic \"horizontal pivot\" technique that computes multiple conditional aggregates within a single GROUP BY. Watch out for integer division in SQLite: 5/3 = 1, not 1.67, so you must multiply by 1.0 to cast to float. This type of event-based conversion rate calculation is a core question type in social platform analytics.",
                            frameworkTip: "Event conversion rate pattern: SUM(CASE WHEN event = X) / SUM(CASE WHEN event = Y). Remember to handle integer division and division by zero.",
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
                                       -- How to calculate acceptance_rate?
                                FROM friend_requests
                                GROUP BY action_date
                                ORDER BY action_date;
                            """,
                            expectedQuery: "SELECT action_date, SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends, SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts, ROUND(SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END), 2) AS acceptance_rate FROM friend_requests GROUP BY action_date ORDER BY action_date;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Peak Energy Consumption Across Sources",
                            type: .code,
                            difficulty: .hard,
                            question: "Use UNION ALL to merge the three tables, calculate total consumption per month, and find the month with the highest consumption. Display date, total_consumption, returning only the month(s) with the highest value (there may be ties).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Source Funnel Merge",
                                narrative: "The company has energy consumption records from three different departments stored in separate tables. The PM wants to find the total consumption per month after merging all sources, and identify the month with the highest consumption.\n\nTables:\n- dept_a_consumption (date TEXT, consumption INTEGER)\n- dept_b_consumption (date TEXT, consumption INTEGER)\n- dept_c_consumption (date TEXT, consumption INTEGER)",
                                data: [
                                    ["source": "dept_a", "date": "2024-01", "consumption": "300"],
                                    ["source": "dept_b", "date": "2024-01", "consumption": "250"],
                                    ["source": "dept_c", "date": "2024-01", "consumption": "200"],
                                ],
                                dataCaption: "Energy consumption by department for 2024-01 (sample)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNION ALL retains all rows (including duplicates), while UNION deduplicates — use UNION ALL here", "Merge first -> GROUP BY month to sum -> then find the maximum", "Use a subquery SELECT MAX(...) FROM monthly to get the max value"],
                            explanation: "Merging multiple data sources is a common real-world scenario (data from different platforms, reports from different departments, etc.). UNION ALL vertically combines tables with the same structure, then GROUP BY performs aggregation. Filtering with a subquery to find the maximum correctly handles the case where multiple months are tied. In interviews, this type of question tests your ability to work with data scattered across different tables.",
                            frameworkTip: "Multi-source merge pattern: UNION ALL to combine -> GROUP BY to aggregate -> subquery or window function to filter for extreme values.",
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
                                  -- How to get the maximum value?
                                );
                            """,
                            expectedQuery: "WITH combined AS (SELECT date, consumption FROM dept_a_consumption UNION ALL SELECT date, consumption FROM dept_b_consumption UNION ALL SELECT date, consumption FROM dept_c_consumption), monthly AS (SELECT date, SUM(consumption) AS total_consumption FROM combined GROUP BY date) SELECT date, total_consumption FROM monthly WHERE total_consumption = (SELECT MAX(total_consumption) FROM monthly);"
                        ),
                    ]
                ),
                Quest(
                    id: "25-3",
                    name: "Segmentation",
                    description: "NTILE grouping, CASE WHEN behavioral segmentation — User segmentation with SQL",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "NTILE Segmentation",
                            type: .code,
                            difficulty: .medium,
                            question: "Use NTILE(4) to divide users into four groups by total_amount in descending order (1 = top 25%, 4 = bottom 25%), then use CASE WHEN to convert the number into a label. Display user_name, total_amount, quartile, segment_label.",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Spending Quartile Segmentation",
                                narrative: "The marketing team wants to divide users into four tiers by spending amount (top 25% as VIP, 25-50% as High Value, 50-75% as Regular, bottom 25% as Low Activity) to tailor different marketing strategies. You need to use NTILE to split users into four groups.\n\nTable: user_spending (user_id INTEGER, user_name TEXT, total_amount REAL)",
                                data: [
                                    ["user_id": "1", "user_name": "Alice Wang", "total_amount": "85200"],
                                    ["user_id": "2", "user_name": "Bella Li", "total_amount": "42300"],
                                    ["user_id": "3", "user_name": "David Zhang", "total_amount": "128500"],
                                    ["user_id": "4", "user_name": "Eva Chen", "total_amount": "15800"],
                                    ["user_id": "5", "user_name": "Frank Lin", "total_amount": "67400"],
                                ],
                                dataCaption: "user_spending table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["NTILE(4) divides data evenly into 4 groups; group 1 is the top 25%", "CASE NTILE(4) OVER (...) WHEN 1 THEN ... lets you label the result directly", "ORDER BY total_amount DESC ensures the highest spenders land in group 1"],
                            explanation: "NTILE(n) is a powerful tool for segmentation analysis. It divides sorted data into n roughly equal groups. NTILE(4) produces quartile-based segmentation. Combined with CASE WHEN, you can convert numbers into meaningful labels. In RFM analysis, NTILE is frequently used to bucket Recency, Frequency, and Monetary into groups.",
                            frameworkTip: "A limitation of NTILE: if the data count is not evenly divisible by n, earlier groups will have one extra row. Mentioning this edge case in interviews is a plus.",
                            sampleSchema: """
                                CREATE TABLE user_spending (user_id INTEGER, user_name TEXT, total_amount REAL);
                                INSERT INTO user_spending VALUES (1, 'Alice Wang', 85200);
                                INSERT INTO user_spending VALUES (2, 'Bella Li', 42300);
                                INSERT INTO user_spending VALUES (3, 'David Zhang', 128500);
                                INSERT INTO user_spending VALUES (4, 'Eva Chen', 15800);
                                INSERT INTO user_spending VALUES (5, 'Frank Lin', 67400);
                                INSERT INTO user_spending VALUES (6, 'Grace Huang', 93100);
                                INSERT INTO user_spending VALUES (7, 'Henry Wu', 28900);
                                INSERT INTO user_spending VALUES (8, 'Irene Liu', 51600);
                                INSERT INTO user_spending VALUES (9, 'Jack Tsai', 110200);
                                INSERT INTO user_spending VALUES (10, 'Karen Zheng', 38700);
                                INSERT INTO user_spending VALUES (11, 'Leo Zhou', 72800);
                                INSERT INTO user_spending VALUES (12, 'Mia Hsu', 19500);
                            """,
                            starterCode: """
                                SELECT user_name, total_amount,
                                       NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile,
                                       CASE NTILE(4) OVER (ORDER BY total_amount DESC)
                                         -- 1 = VIP, 2 = High Value, 3 = Regular, 4 = Low Activity
                                       END AS segment_label
                                FROM user_spending
                                ORDER BY total_amount DESC;
                            """,
                            expectedQuery: "SELECT user_name, total_amount, NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile, CASE NTILE(4) OVER (ORDER BY total_amount DESC) WHEN 1 THEN 'VIP' WHEN 2 THEN 'High Value' WHEN 3 THEN 'Regular' WHEN 4 THEN 'Low Activity' END AS segment_label FROM user_spending ORDER BY total_amount DESC;"
                        ),
                        Challenge(
                            id: 2,
                            name: "CASE WHEN Behavioral Segmentation",
                            type: .code,
                            difficulty: .medium,
                            question: "Use CASE WHEN to segment users according to the rules above. Display user_name, login_count, action_count, segment. Then count the number of users in each segment.",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Activity Segmentation",
                                narrative: "The product team wants to segment users based on their behavior over the past 30 days (login count + action count). The rules are:\n- Power User: logins >= 20 AND actions >= 50\n- Active: logins >= 10 AND actions >= 20\n- Casual: logins >= 3\n- Dormant: all others\n\nTable: user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER)",
                                data: [
                                    ["user_id": "1", "user_name": "Ming", "login_count": "25", "action_count": "80", "segment": "Power User"],
                                    ["user_id": "2", "user_name": "Mei", "login_count": "12", "action_count": "35", "segment": "Active"],
                                    ["user_id": "3", "user_name": "David", "login_count": "5", "action_count": "8", "segment": "Casual"],
                                    ["user_id": "4", "user_name": "Eva", "login_count": "1", "action_count": "2", "segment": "Dormant"],
                                ],
                                dataCaption: "user_activity table (sample data; segment shows expected result)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The order of CASE WHEN conditions matters — evaluate the strictest condition first", "Power User has the strictest criteria, so it should come first", "Use a CTE to build the segmentation, then aggregate in the outer query"],
                            explanation: "The key to CASE WHEN behavioral segmentation is condition ordering: from strictest to most lenient. Since CASE WHEN stops at the first matching condition, Power User (the strictest) must come first. Using a CTE for segmentation followed by aggregation is a common two-step pattern.",
                            frameworkTip: "Approach for segmentation questions in interviews: (1) Define segmentation rules (2) Confirm condition priority (3) Implement with CASE WHEN (4) Use GROUP BY to count users and compute metrics per segment.",
                            sampleSchema: """
                                CREATE TABLE user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER);
                                INSERT INTO user_activity VALUES (1, 'Ming', 25, 80);
                                INSERT INTO user_activity VALUES (2, 'Mei', 12, 35);
                                INSERT INTO user_activity VALUES (3, 'David', 5, 8);
                                INSERT INTO user_activity VALUES (4, 'Eva', 1, 2);
                                INSERT INTO user_activity VALUES (5, 'Frank', 22, 60);
                                INSERT INTO user_activity VALUES (6, 'Grace', 15, 25);
                                INSERT INTO user_activity VALUES (7, 'Henry', 8, 15);
                                INSERT INTO user_activity VALUES (8, 'Irene', 3, 5);
                                INSERT INTO user_activity VALUES (9, 'Jack', 0, 0);
                                INSERT INTO user_activity VALUES (10, 'Karen', 18, 45);
                            """,
                            starterCode: """
                                WITH segmented AS (
                                  SELECT user_name, login_count, action_count,
                                         CASE
                                           -- Segment according to the rules
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
                            name: "Segmentation Strategy Selection",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "The PM wants to divide users into 5 equal buckets along each of three dimensions: \"days since last purchase,\" \"purchase frequency,\" and \"total spending,\" then combine them into a composite segment. What segmentation method is this, and which SQL function should you use?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choosing the Right Segmentation Method",
                                narrative: "You are a Product Analyst. The PM has different segmentation requirements. You need to determine which SQL segmentation method is most appropriate.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CASE WHEN with hard-coded segmentation, manually setting thresholds for each dimension", explanation: "CASE WHEN works well for rule-based segmentation, but RFM requires dynamic quantiles, making hard-coded thresholds too inflexible."),
                                Challenge.Option(id: "B", text: "NTILE(5) with PARTITION BY for each dimension, performing RFM segmentation", explanation: "Correct! The standard approach for RFM segmentation is to use NTILE to create quantile buckets for Recency, Frequency, and Monetary, then combine them into an RFM Score."),
                                Challenge.Option(id: "C", text: "ROW_NUMBER to rank and then select the top N users", explanation: "ROW_NUMBER is suited for ranking, but not for quantile-based segmentation."),
                                Challenge.Option(id: "D", text: "GROUP BY all three dimensions directly", explanation: "GROUP BY would produce too many combinations and is not the correct approach for segmentation."),
                            ],
                            correctAnswer: "B",
                            hints: ["RFM = Recency, Frequency, Monetary", "When you need to split continuous values into equal buckets, think NTILE", "Three dimensions, each split into 5 buckets → use NTILE(5) three times"],
                            explanation: "RFM segmentation is a classic user segmentation framework. R (Recency — days since last purchase), F (Frequency — purchase count), and M (Monetary — total spending) are each divided into 5 groups using NTILE(5). The combination forms the RFM Score (e.g., 5-5-5 represents the most valuable users). NTILE is the best tool for quantile-based segmentation.",
                            frameworkTip: "RFM is a must-know segmentation framework for Product Analysts. When you hear \"user value segmentation\" in an interview, think RFM + NTILE."
                        ),
                        Challenge(
                            id: 4,
                            name: "Business Type Classification",
                            type: .code,
                            difficulty: .medium,
                            question: "Use CASE WHEN with LOWER() and LIKE to classify businesses, then calculate the count and average revenue for each category. Display business_type, count, avg_revenue.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Classify Businesses by Name Keywords",
                                narrative: "The marketing team received a batch of business data and needs to automatically classify businesses based on keywords in their names. The rules are:\n- Name contains \"restaurant\" or \"cafe\" -> Food & Beverage\n- Name contains \"shop\" or \"store\" -> Retail\n- Name contains \"hotel\" or \"inn\" -> Hospitality\n- Otherwise -> Other\n\nTable: businesses (id, name TEXT, city TEXT, revenue REAL)",
                                data: [
                                    ["id": "1", "name": "Sunset Restaurant", "city": "Taipei", "revenue": "85000"],
                                    ["id": "2", "name": "Tech Shop Plus", "city": "Hsinchu", "revenue": "120000"],
                                    ["id": "3", "name": "Garden Inn", "city": "Taichung", "revenue": "200000"],
                                    ["id": "4", "name": "Creative Studio", "city": "Taipei", "revenue": "65000"],
                                ],
                                dataCaption: "businesses table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["LOWER(name) converts to lowercase first to avoid case-sensitivity issues", "LIKE '%keyword%' performs fuzzy matching", "The order of CASE WHEN matters — if a name contains multiple keywords, it will be assigned to the first matching category"],
                            explanation: "Using CASE WHEN + LIKE for text classification is a common technique in data cleaning and segmentation. LOWER() ensures case-insensitive matching. Note that CASE WHEN follows \"first match wins\" logic, so the order of conditions can affect results. In practice, this classification logic often grows increasingly complex and may eventually need to be moved to a mapping table or UDF.",
                            frameworkTip: "Text classification pattern: CASE WHEN + LOWER + LIKE. In production, a better approach is to create a mapping table and JOIN it in.",
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
                                    WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN 'Food & Beverage'
                                    -- Continue classifying...
                                  END AS business_type,
                                  COUNT(*) AS count,
                                  ROUND(AVG(revenue), 0) AS avg_revenue
                                FROM businesses
                                GROUP BY business_type
                                ORDER BY avg_revenue DESC;
                            """,
                            expectedQuery: "SELECT CASE WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN 'Food & Beverage' WHEN LOWER(name) LIKE '%shop%' OR LOWER(name) LIKE '%store%' THEN 'Retail' WHEN LOWER(name) LIKE '%hotel%' OR LOWER(name) LIKE '%inn%' THEN 'Hospitality' ELSE 'Other' END AS business_type, COUNT(*) AS count, ROUND(AVG(revenue), 0) AS avg_revenue FROM businesses GROUP BY business_type ORDER BY avg_revenue DESC;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Free vs Paid User Comparison",
                            type: .code,
                            difficulty: .hard,
                            question: "Calculate the daily total downloads for free users vs paid users, and find dates where free user downloads exceeded paid user downloads. Display date, free_downloads, premium_downloads.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Freemium vs Premium Download Comparison",
                                narrative: "The product team wants to understand the difference in daily download volume between free and paid users, and specifically wants to find dates where free user downloads exceeded paid user downloads.\n\nTables:\n- downloads (date TEXT, user_id INTEGER, downloads INTEGER)\n- users (id INTEGER, account_type TEXT)  -- account_type: \"free\" or \"premium\"",
                                data: [
                                    ["date": "2024-03-01", "account_type": "free", "total_downloads": "150"],
                                    ["date": "2024-03-01", "account_type": "premium", "total_downloads": "200"],
                                    ["date": "2024-03-02", "account_type": "free", "total_downloads": "250"],
                                    ["date": "2024-03-02", "account_type": "premium", "total_downloads": "180"],
                                ],
                                dataCaption: "Daily downloads (aggregated) sample"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["SUM(CASE WHEN) is a classic technique to split data within the same GROUP BY into two segments", "JOIN the users table to get account_type before performing conditional aggregation", "The WHERE condition simply compares the two SUM results"],
                            explanation: "The core technique here is \"conditional aggregation\": using SUM(CASE WHEN ...) within the same GROUP BY to compute metrics for different segments separately. This is more concise and efficient than running separate queries and JOINing them. The CTE calculates daily totals for both segments, and the outer query filters. This type of A/B comparison is ubiquitous in product analytics.",
                            frameworkTip: "Segment comparison pattern: JOIN to get segment labels -> SUM(CASE WHEN) for conditional aggregation -> WHERE/HAVING to filter. More efficient than a self-join.",
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
                                WHERE -- What condition?
                                ORDER BY date;
                            """,
                            expectedQuery: "WITH daily AS (SELECT d.date, SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads, SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads FROM downloads d JOIN users u ON d.user_id = u.id GROUP BY d.date) SELECT date, free_downloads, premium_downloads FROM daily WHERE free_downloads > premium_downloads ORDER BY date;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-4",
                    name: "Retention / Cohort Analysis",
                    description: "Retention rate and cohort analysis — Track whether users continue to come back",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Monthly Active Retention Rate",
                            type: .code,
                            difficulty: .hard,
                            question: "Calculate each month's active user count, the number of users still active the next month, and the monthly retention rate (percentage, rounded to one decimal place).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Calculating Monthly Retention Rate",
                                narrative: "The product owner wants to know \"of the users active this month, what percentage will return next month.\" You need to identify each month's active users, then check whether they are also active the following month, and calculate the retention rate.\n\nTable: user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)",
                                data: [
                                    ["action_id": "1", "user_id": "101", "action_date": "2025-11-05"],
                                    ["action_id": "2", "user_id": "101", "action_date": "2025-12-10"],
                                    ["action_id": "3", "user_id": "102", "action_date": "2025-11-08"],
                                    ["action_id": "4", "user_id": "103", "action_date": "2025-11-15"],
                                    ["action_id": "5", "user_id": "103", "action_date": "2025-12-20"],
                                ],
                                dataCaption: "user_actions table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use a LEFT JOIN self-join on monthly_active to pair the current month with the next month", "In SQLite, next month: SUBSTR(DATE(active_month || '-01', '+1 month'), 1, 7)", "LEFT JOIN ensures months with zero retention still appear (retained = 0)"],
                            explanation: "The core of monthly retention is a self-join: pairing the same user's current-month activity record with their next-month activity record. Use a LEFT JOIN to ensure months with no retained users still show up. COUNT(DISTINCT m2.user_id) only counts matched users (those active the following month). Retention rate = retained users / current month active users.",
                            frameworkTip: "Retention rate approach: first build a deduplicated \"month x user\" table, then self-join to compare consecutive months. This pattern generalizes to weekly or daily retention.",
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
                                  -- Distinct active users per month
                                  SELECT DISTINCT user_id,
                                         SUBSTR(action_date, 1, 7) AS active_month
                                  FROM user_actions
                                )
                                SELECT
                                  m1.active_month,
                                  COUNT(DISTINCT m1.user_id) AS active_users,
                                  -- Users still active next month?
                                  -- Retention rate?
                                FROM monthly_active m1
                                -- How to find users who are also active next month?
                                GROUP BY m1.active_month
                                ORDER BY m1.active_month;
                            """,
                            expectedQuery: "WITH monthly_active AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions) SELECT m1.active_month, COUNT(DISTINCT m1.user_id) AS active_users, COUNT(DISTINCT m2.user_id) AS retained_users, ROUND(COUNT(DISTINCT m2.user_id) * 100.0 / COUNT(DISTINCT m1.user_id), 1) AS retention_rate FROM monthly_active m1 LEFT JOIN monthly_active m2 ON m1.user_id = m2.user_id AND m2.active_month = SUBSTR(DATE(m1.active_month || '-01', '+1 month'), 1, 7) GROUP BY m1.active_month ORDER BY m1.active_month;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Cohort Retention Matrix",
                            type: .code,
                            difficulty: .hard,
                            question: "Build a Cohort Retention report: for each cohort (signup month), show the active user count and retention rate at months 0, 1, and 2. Display cohort_month, month_number, active_users, cohort_size, retention_rate.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Building a Cohort Retention Matrix",
                                narrative: "The product team needs a Cohort Retention Matrix: the horizontal axis is \"month N after signup,\" the vertical axis is \"signup month cohort,\" and each cell contains the retention rate. This is the definitive report in Product Analytics.\n\nTables:\n- user_signups (user_id INTEGER, signup_date TEXT)\n- user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)",
                                data: [
                                    ["cohort": "2025-10", "month_0": "100%", "month_1": "62%", "month_2": "45%"],
                                    ["cohort": "2025-11", "month_0": "100%", "month_1": "58%", "month_2": "-"],
                                    ["cohort": "2025-12", "month_0": "100%", "month_1": "-", "month_2": "-"],
                                ],
                                dataCaption: "Cohort Retention Matrix (expected output format)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use JULIANDAY to compute the difference between two months (divide by 30 and truncate to get month count)", "You need a cohort_size CTE to store the initial user count for each cohort", "retention_rate = active users in that month / initial cohort size * 100"],
                            explanation: "The Cohort Retention Matrix is the \"holy grail report\" of Product Analytics. Steps: (1) Define the cohort (signup month) (2) Compute each user's monthly activity status (3) Calculate month_number (months since signup) (4) Aggregate retention rate for each cohort x month_number. Dividing the JULIANDAY difference by 30 is a SQLite technique for computing month differences.",
                            frameworkTip: "Three steps for cohort analysis in interviews: (1) Define the cohort dimension (usually signup month) (2) Define the activity event (3) Spread retention by month_number. This framework applies to all retention analyses.",
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
                                  -- Each user's cohort (signup month)
                                  SELECT user_id,
                                         SUBSTR(signup_date, 1, 7) AS cohort_month
                                  FROM user_signups
                                ),
                                user_monthly AS (
                                  -- Each user's monthly activity records
                                  SELECT DISTINCT user_id,
                                         SUBSTR(action_date, 1, 7) AS active_month
                                  FROM user_actions
                                ),
                                cohort_activity AS (
                                  SELECT c.cohort_month,
                                         -- Calculate month_number (active month - signup month)
                                         um.active_month,
                                         c.user_id
                                  FROM cohorts c
                                  JOIN user_monthly um ON c.user_id = um.user_id
                                )
                                -- Final aggregation: retention rate for each cohort x month_number
                                SELECT cohort_month, month_number,
                                       COUNT(DISTINCT user_id) AS active_users,
                                       -- cohort_size and retention_rate
                                FROM cohort_activity
                                GROUP BY cohort_month, month_number
                                ORDER BY cohort_month, month_number;
                            """,
                            expectedQuery: "WITH cohorts AS (SELECT user_id, SUBSTR(signup_date, 1, 7) AS cohort_month FROM user_signups), cohort_size AS (SELECT cohort_month, COUNT(*) AS size FROM cohorts GROUP BY cohort_month), user_monthly AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions), cohort_activity AS (SELECT c.cohort_month, CAST((JULIANDAY(um.active_month || '-01') - JULIANDAY(c.cohort_month || '-01')) / 30 AS INTEGER) AS month_number, c.user_id FROM cohorts c JOIN user_monthly um ON c.user_id = um.user_id) SELECT ca.cohort_month, ca.month_number, COUNT(DISTINCT ca.user_id) AS active_users, cs.size AS cohort_size, ROUND(COUNT(DISTINCT ca.user_id) * 100.0 / cs.size, 1) AS retention_rate FROM cohort_activity ca JOIN cohort_size cs ON ca.cohort_month = cs.cohort_month GROUP BY ca.cohort_month, ca.month_number ORDER BY ca.cohort_month, ca.month_number;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Monthly Retention Rate Calculation",
                            type: .code,
                            difficulty: .hard,
                            question: "Calculate the monthly retention rate: of users active in month N, what proportion were also active in month N+1. Display activity_month, active_users, retained_next_month, retention_rate.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly User Retention Rate",
                                narrative: "The Growth team needs to track monthly retention rate: \"Of the users active in a given month, what percentage were also active the following month?\" This differs from cohort retention — here we are not grouping by signup month, but looking at overall month-over-month retention.\n\nTable: user_activity (user_id INTEGER, activity_date TEXT)",
                                data: [
                                    ["user_id": "1", "activity_date": "2024-01-05"],
                                    ["user_id": "2", "activity_date": "2024-01-10"],
                                    ["user_id": "1", "activity_date": "2024-02-03"],
                                    ["user_id": "3", "activity_date": "2024-02-15"],
                                ],
                                dataCaption: "user_activity table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use DISTINCT to get unique active users per month", "Self-join: a is the current month's users, b is next month's users — use date(..., '+1 month') to compute the next month", "COUNT(DISTINCT b.user_id) gives the retained count; dividing by COUNT(DISTINCT a.user_id) gives the retention rate"],
                            explanation: "Monthly retention rate is implemented via a self-join: the monthly_users table joins itself on the condition that the user_id matches and b's month = a's month + 1. LEFT JOIN ensures months with zero retention still appear. In SQLite, use date(month || '-01', '+1 month') to calculate the next month. This is one of the most commonly tracked retention metrics on Growth teams.",
                            frameworkTip: "Monthly retention pattern: CTE to deduplicate and get monthly active users -> self-join (same user + month offset of 1) -> COUNT(DISTINCT) to compute retained count.",
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
                                  -- How to count users retained to next month?
                                  -- How to calculate retention_rate?
                                FROM monthly_users a
                                LEFT JOIN monthly_users b
                                  ON a.user_id = b.user_id
                                  -- How to ensure b is the "next month"?
                                GROUP BY a.activity_month
                                ORDER BY a.activity_month;
                            """,
                            expectedQuery: "WITH monthly_users AS (SELECT DISTINCT user_id, strftime('%Y-%m', activity_date) AS activity_month FROM user_activity) SELECT a.activity_month, COUNT(DISTINCT a.user_id) AS active_users, COUNT(DISTINCT b.user_id) AS retained_next_month, ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 1) AS retention_rate FROM monthly_users a LEFT JOIN monthly_users b ON a.user_id = b.user_id AND b.activity_month = strftime('%Y-%m', date(a.activity_month || '-01', '+1 month')) GROUP BY a.activity_month ORDER BY a.activity_month;"
                        ),
                        Challenge(
                            id: 4,
                            name: "MoM Revenue Percentage Change",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate the total monthly revenue and MoM percentage change. Use LAG to get the previous month's revenue. Display month, revenue, prev_month_revenue, mom_pct_change (rounded to 1 decimal place).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Month-over-Month Revenue Change",
                                narrative: "The finance team needs a report showing each month's revenue and the percentage change compared to the previous month (MoM %). This helps executives quickly spot revenue anomalies.\n\nTable: purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT)",
                                data: [
                                    ["id": "1", "user_id": "101", "amount": "500", "purchase_date": "2024-01-15"],
                                    ["id": "2", "user_id": "102", "amount": "300", "purchase_date": "2024-01-20"],
                                    ["id": "3", "user_id": "101", "amount": "450", "purchase_date": "2024-02-10"],
                                ],
                                dataCaption: "purchases table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use a CTE to aggregate monthly revenue, then use LAG to get the previous month", "MoM % = (current month - previous month) / previous month * 100", "The first month's LAG returns NULL, so the entire calculation result is also NULL — no special handling needed"],
                            explanation: "First aggregate revenue by month in a CTE, then use LAG to retrieve the previous month's value for calculating the change rate. This pattern is similar to the LAG challenge in Quest 25-1, but adds an extra step: aggregate first, then compute. In practice, MoM change rate is the most common trend tracking metric and appears on virtually every dashboard.",
                            frameworkTip: "MoM calculation in two steps: CTE to GROUP BY month and compute the metric -> outer query uses LAG for month-over-month comparison. Separating the steps is cleaner than doing everything in one layer.",
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
                                       -- How to calculate MoM percentage change?
                                FROM monthly
                                ORDER BY month;
                            """,
                            expectedQuery: "WITH monthly AS (SELECT strftime('%Y-%m', purchase_date) AS month, SUM(amount) AS revenue FROM purchases GROUP BY month) SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue, ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 1) AS mom_pct_change FROM monthly ORDER BY month;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-5",
                    name: "KPI & Dashboard Query Design",
                    description: "DAU/MAU, ARPU, Conversion Rate — Define and compute core product metrics with SQL",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DAU / MAU Calculation",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate the daily DAU (distinct active users per day) for March 2026, along with the monthly MAU and the average DAU/MAU ratio (rounded to two decimal places).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Calculating Daily and Monthly Active Users",
                                narrative: "You are building core metric queries for a product dashboard. The first requirement is to compute DAU (Daily Active Users), MAU (Monthly Active Users), and the DAU/MAU ratio (also called Stickiness, representing user engagement).\n\nTable: app_events (event_id INTEGER, user_id INTEGER, event_date TEXT, event_type TEXT)",
                                data: [
                                    ["event_id": "1", "user_id": "101", "event_date": "2026-03-01", "event_type": "login"],
                                    ["event_id": "2", "user_id": "102", "event_date": "2026-03-01", "event_type": "view"],
                                    ["event_id": "3", "user_id": "101", "event_date": "2026-03-02", "event_type": "click"],
                                    ["event_id": "4", "user_id": "103", "event_date": "2026-03-02", "event_type": "login"],
                                ],
                                dataCaption: "app_events table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["DAU = COUNT(DISTINCT user_id) per day", "MAU = COUNT(DISTINCT user_id) for the entire month", "Stickiness = average DAU / MAU; a higher value means stronger user engagement"],
                            explanation: "DAU/MAU (also known as Stickiness) is a core metric for measuring product engagement. If DAU/MAU = 0.5, it means that on average, half of monthly active users are using the product every day. Social products typically range between 0.3 and 0.6. Use two CTEs to calculate DAU and MAU separately, then cross-compute the ratio.",
                            frameworkTip: "Dashboard metrics in three layers: (1) Traffic metrics — DAU/MAU (2) Engagement metrics — session length, event count (3) Business metrics — ARPU, conversion rate. Answering in layers during interviews provides better structure.",
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
                                  -- Daily DAU
                                  SELECT event_date,
                                         COUNT(DISTINCT user_id) AS dau
                                  FROM app_events
                                  WHERE event_date LIKE '2026-03%'
                                  GROUP BY event_date
                                ),
                                mau AS (
                                  -- Monthly MAU
                                  SELECT COUNT(DISTINCT user_id) AS mau
                                  FROM app_events
                                  WHERE event_date LIKE '2026-03%'
                                )
                                -- Calculate average DAU and DAU/MAU ratio
                                SELECT
                                  -- avg_dau, mau, dau/mau
                                FROM daily_active, mau;
                            """,
                            expectedQuery: "WITH daily_active AS (SELECT event_date, COUNT(DISTINCT user_id) AS dau FROM app_events WHERE event_date LIKE '2026-03%' GROUP BY event_date), mau AS (SELECT COUNT(DISTINCT user_id) AS mau FROM app_events WHERE event_date LIKE '2026-03%') SELECT ROUND(AVG(da.dau), 1) AS avg_dau, mau.mau, ROUND(AVG(da.dau) * 1.0 / mau.mau, 2) AS stickiness FROM daily_active da, mau;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Conversion Rate & ARPU",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate the paid conversion rate and ARPU for March 2026. Display total_active_users, paying_users, total_revenue, conversion_rate (percentage, one decimal place), arpu (two decimal places).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Calculating Paid Conversion Rate & ARPU",
                                narrative: "The business analyst needs to display two key metrics on the dashboard: Paid Conversion Rate (paying users / total active users) and ARPU (Average Revenue Per User = total revenue / total active users).\n\nTables:\n- active_users (user_id INTEGER, active_month TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)",
                                data: [
                                    ["metric": "total_active", "value": "1000"],
                                    ["metric": "paying_users", "value": "150"],
                                    ["metric": "total_revenue", "value": "75000"],
                                    ["metric": "conversion_rate", "value": "15.0%"],
                                    ["metric": "arpu", "value": "75"],
                                ],
                                dataCaption: "Expected metrics (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Paying users = COUNT(DISTINCT user_id) FROM payments", "The denominator for ARPU is \"all active users,\" not just paying users", "Use subqueries in the CTE to calculate the three base numbers separately"],
                            explanation: "Conversion rate = paying users / total active users. ARPU = total revenue / total active users. Note that the ARPU denominator is \"all active users\" (including non-paying ones), not just paying users (that would be ARPPU). A common interview follow-up is the difference between ARPU and ARPPU.",
                            frameworkTip: "ARPU vs. ARPPU: ARPU = Revenue / All Users, ARPPU = Revenue / Paying Users. Explaining this distinction in interviews earns bonus points.",
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
                                    -- Paying users (distinct users with payment records)
                                    -- Total revenue
                                )
                                SELECT total_active AS total_active_users,
                                       paying_users,
                                       total_revenue,
                                       -- conversion_rate and arpu
                                FROM metrics;
                            """,
                            expectedQuery: "WITH metrics AS (SELECT (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active, (SELECT COUNT(DISTINCT user_id) FROM payments WHERE payment_date LIKE '2026-03%') AS paying_users, (SELECT COALESCE(SUM(amount), 0) FROM payments WHERE payment_date LIKE '2026-03%') AS total_revenue) SELECT total_active AS total_active_users, paying_users, total_revenue, ROUND(paying_users * 100.0 / total_active, 1) AS conversion_rate, ROUND(total_revenue * 1.0 / total_active, 2) AS arpu FROM metrics;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Dashboard Metric Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which set of metrics is most suitable as \"North Star metric + supporting metrics\" for a SaaS product?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choosing the Right Dashboard Metrics",
                                narrative: "You are designing an Executive Dashboard for a SaaS product. The CEO wants to see core metrics for \"product health.\" Here are the options:",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "DAU + Page Load Speed + Server Error Rate", explanation: "Page load speed and error rate are engineering metrics, not core indicators of product health."),
                                Challenge.Option(id: "B", text: "MAU + DAU/MAU + Paid Conversion Rate + MRR", explanation: "Correct! MAU measures scale, DAU/MAU measures stickiness, conversion rate measures monetization efficiency, and MRR measures revenue. These four metrics cover user scale, engagement quality, and business value."),
                                Challenge.Option(id: "C", text: "Signups + Total Revenue + Customer Support Response Time", explanation: "These metrics are too scattered and do not measure user activity or stickiness."),
                                Challenge.Option(id: "D", text: "NPS Score + Feature Usage Rate + Bug Fix Speed", explanation: "NPS is a user satisfaction metric, but not a core KPI for product health. Bug fix speed is an engineering metric."),
                            ],
                            correctAnswer: "B",
                            hints: ["A good set of metrics should cover: scale, engagement, and monetization", "Core SaaS metrics typically include MRR (Monthly Recurring Revenue)", "DAU/MAU reflects whether users are \"actually using\" the product"],
                            explanation: "Use the AARRR framework when designing dashboards: Acquisition, Activation, Retention, Revenue, Referral. MAU maps to scale, DAU/MAU maps to retention and activity, conversion rate maps to revenue, and MRR maps to business value. A well-designed dashboard tells a complete story with 3-5 core metrics.",
                            frameworkTip: "When designing a dashboard in interviews, use the AARRR or \"Scale x Quality x Monetization\" framework to select metrics. Avoid piling up unrelated numbers."
                        ),
                        Challenge(
                            id: 4,
                            name: "Single-Month Customer Revenue Ranking",
                            type: .code,
                            difficulty: .medium,
                            question: "Calculate each customer's total revenue for March 2024 and rank them using DENSE_RANK. Display customer_id, march_revenue, revenue_rank. Sort by rank.",
                            scenario: 
                            Challenge.Scenario(
                                title: "March Customer Revenue Report",
                                narrative: "The sales executive needs a \"March customer revenue ranking\" report to identify VIP customers and evaluate sales performance.\n\nTable: orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "301", "amount": "500", "order_date": "2024-03-05"],
                                    ["id": "2", "customer_id": "302", "amount": "350", "order_date": "2024-03-10"],
                                    ["id": "3", "customer_id": "301", "amount": "200", "order_date": "2024-03-15"],
                                ],
                                dataCaption: "orders table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["strftime('%Y-%m', order_date) = '2024-03' filters for March", "Apply WHERE to filter the month first, then GROUP BY customer to sum revenue", "DENSE_RANK can be applied directly in SELECT to rank by SUM(amount)"],
                            explanation: "This question combines time filtering, aggregation, and window functions. First use WHERE to filter the target month, GROUP BY to calculate each customer's revenue, then DENSE_RANK for ranking. Note that WHERE executes before GROUP BY, so the filter condition belongs in WHERE, not HAVING. In interviews, \"customer ranking for a specific time period\" is a very high-frequency question type.",
                            frameworkTip: "Execution order for time filter + aggregation + ranking: WHERE filters time -> GROUP BY aggregates -> Window Function ranks. Getting the order right is critical.",
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
                                WHERE -- How to filter for March?
                                GROUP BY customer_id
                                ORDER BY revenue_rank;
                            """,
                            expectedQuery: "SELECT customer_id, SUM(amount) AS march_revenue, DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank FROM orders WHERE strftime('%Y-%m', order_date) = '2024-03' GROUP BY customer_id ORDER BY revenue_rank;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Marketing Campaign Performance Analysis",
                            type: .code,
                            difficulty: .hard,
                            question: "Calculate for each marketing campaign: acquired users, users who placed orders, conversion rate, and total revenue. Exclude organic traffic (campaign IS NULL). Sort by total revenue in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketing Campaign ROI Evaluation",
                                narrative: "The marketing team ran multiple ad campaigns to acquire new users. The PM wants to know: of the users acquired through marketing campaigns, how many actually placed orders? How much revenue did each campaign generate?\n\nTables:\n- users (id INTEGER, signup_date TEXT, campaign TEXT) — campaign is NULL for organic traffic\n- orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "signup_date": "2024-03-01", "campaign": "spring_sale"],
                                    ["id": "2", "signup_date": "2024-03-02", "campaign": "google_ads"],
                                    ["id": "3", "signup_date": "2024-03-03", "campaign": "null"],
                                ],
                                dataCaption: "users table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) counts distinct users who placed orders", "LEFT JOIN ensures users who never ordered are still counted in acquired users", "COALESCE(SUM(o.amount), 0) handles the case where a campaign has zero orders"],
                            explanation: "This question combines LEFT JOIN, conditional aggregation, and business metric calculation. LEFT JOIN ensures users without orders are still counted toward acquired users. COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) is an elegant technique: it only counts distinct users who have orders. Conversion rate = paying users / total acquired users. This type of marketing performance report is a core task in Growth and Marketing Analytics.",
                            frameworkTip: "Marketing performance analysis pattern: LEFT JOIN to retain all users -> conditional aggregation to distinguish converted/non-converted -> calculate conversion rate and ROI. LEFT JOIN is the key — do not use INNER JOIN.",
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
                                       -- Users who placed orders?
                                       -- Conversion rate?
                                       -- Total revenue?
                                FROM users u
                                LEFT JOIN orders o ON u.id = o.user_id
                                WHERE u.campaign IS NOT NULL
                                GROUP BY u.campaign
                                ORDER BY -- Sort by total revenue;
                            """,
                            expectedQuery: "SELECT u.campaign, COUNT(DISTINCT u.id) AS acquired_users, COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) AS paying_users, ROUND(COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) * 100.0 / COUNT(DISTINCT u.id), 1) AS conversion_rate, COALESCE(SUM(o.amount), 0) AS total_revenue FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.campaign IS NOT NULL GROUP BY u.campaign ORDER BY total_revenue DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "25-6",
                    name: "Boss: Product Analytics SQL Case",
                    description: "Comprehensive Boss challenge — Combine Window Functions, Funnel, and Segmentation for a full product analysis",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Full Product Analysis",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a SQL query that calculates the conversion rate through the \"trial_start → feature_use → upgrade\" funnel for each plan (free / pro), and uses RANK to order them by conversion rate. This helps the PM understand which plan has the best conversion performance.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Subscription Product Full Analysis",
                                narrative: "You are a Product Analyst. The PM has asked you to use SQL to produce a comprehensive product analysis report. You need to combine Window Functions (ranking and trends), Funnel (conversion analysis), and Segmentation (user grouping) to identify growth opportunities.\n\nTables:\n- users (user_id INTEGER, signup_date TEXT, plan TEXT)\n- events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)",
                                data: [
                                    ["user_id": "101", "signup_date": "2025-12-01", "plan": "free"],
                                    ["user_id": "102", "signup_date": "2025-12-05", "plan": "pro"],
                                    ["user_id": "103", "signup_date": "2026-01-10", "plan": "free"],
                                ],
                                dataCaption: "users table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use a CTE to compute the funnel numbers for each plan", "Conversion rate = users at that step / step1 users * 100", "RANK() OVER (ORDER BY upgrade_rate DESC) ranks by conversion rate"],
                            explanation: "This Boss challenge combines three core skills: (1) Funnel — COUNT DISTINCT CASE WHEN to compute step counts (2) Segmentation — GROUP BY plan to calculate per-segment (3) Window Function — RANK to order results. In practice, PMs frequently need this kind of \"segmented funnel + ranking\" analysis to inform product strategy.",
                            frameworkTip: "Product Analysis thinking framework: first Segment (group users) → then Measure (e.g., Funnel) → finally Rank/Compare. These three steps solve most product analysis problems.",
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
                                       -- Calculate conversion rates per step
                                       -- Use RANK to order by final conversion rate
                                FROM funnel
                                ORDER BY conversion_rank;
                            """,
                            expectedQuery: "WITH funnel AS (SELECT u.plan, COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial, COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature, COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade FROM users u JOIN events e ON u.user_id = e.user_id GROUP BY u.plan) SELECT plan, step1_trial, step2_feature, step3_upgrade, ROUND(step2_feature * 100.0 / step1_trial, 1) AS feature_rate, ROUND(step3_upgrade * 100.0 / step1_trial, 1) AS upgrade_rate, RANK() OVER (ORDER BY step3_upgrade * 1.0 / step1_trial DESC) AS conversion_rank FROM funnel ORDER BY conversion_rank;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Product Analysis Plan",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "Design a complete analysis plan addressing the following:\n1. What SQL queries would you build to diagnose the problem? (List at least 3)\n2. What is the purpose of each query?\n3. What insights do you expect to uncover?\n4. How would you present the results to the CEO?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Designing a Complete Product Analysis Plan",
                                narrative: "You just joined a B2C subscription SaaS company as a Product Analyst. The PM tells you: \"Our paid conversion rate dropped from 8% last month to 5%. The CEO wants to see the analysis report next week.\"\n\nYou need to design a comprehensive analysis plan, using SQL queries to identify the root cause and provide recommendations.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Think about each step in the funnel — which step saw the conversion rate drop?", "Do different user segments have different conversion rates? New vs. returning users?", "Was it a gradual decline or a sudden drop at a specific point? You can use LAG to compare"],
                            explanation: "The core approach to product analysis is \"Decompose → Compare → Hypothesize → Validate.\" When a metric anomaly occurs, first decompose (Funnel: which step dropped), then compare (Segmentation: who dropped), then hypothesize (why it dropped), and finally design validation (A/B test or deeper analysis). This approach applies to all product analysis scenarios.",
                            frameworkTip: "Metric anomaly analysis framework: (1) Confirm the problem — did it really drop? Rule out seasonality and data issues (2) Decompose — which funnel step dropped (3) Segment — who was affected (4) Time — when did it drop (5) Hypothesize → Recommend."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 26,
            name: "SQL Engineering Applications",
            emoji: "⚙️",
            description: "CRUD, Database Design & Performance Optimization — SQL in Practice for Business Engineers",
            quests: [
                Quest(
                    id: "26-1",
                    name: "INSERT / UPDATE / DELETE",
                    description: "Master the core operations for inserting, updating, and safely deleting data",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INSERT Data",
                            type: .code,
                            difficulty: .easy,
                            question: "Use INSERT INTO to add the following three new employees to the employees table:\n- id=4, Jason Chen, Engineering, 2024-06-01\n- id=5, Grace Lin, Marketing, 2024-06-01\n- id=6, Kevin Huang, Sales, 2024-06-15",
                            scenario: 
                            Challenge.Scenario(
                                title: "Add New Employees to the HR System",
                                narrative: "The company just hired three new employees, and HR has asked you to enter their information into the employees table. Each employee needs a name, department, and hire date.\n\nTable structure: employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice Wang", "department": "Engineering", "hire_date": "2024-01-15"],
                                    ["id": "2", "name": "Mei-Ling Li", "department": "Marketing", "hire_date": "2024-02-01"],
                                    ["id": "3", "name": "David Chang", "department": "Sales", "hire_date": "2024-03-10"],
                                ],
                                dataCaption: "Existing data in employees"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["INSERT INTO table_name VALUES (val1, val2, ...); adds one row at a time", "You can also use INSERT INTO table_name (col1, col2) VALUES (...) to specify columns explicitly", "Use SELECT * FROM employees at the end to verify the results"],
                            explanation: "INSERT INTO is the most fundamental write operation in SQL. Full syntax: INSERT INTO table_name (col1, col2, ...) VALUES (val1, val2, ...). If you supply all values in column order, you can omit the column names. In practice, explicitly listing column names is recommended to avoid errors when the table structure changes.",
                            frameworkTip: "INSERT tips: (1) Explicitly listing column names is safer than omitting them (2) Batch inserts can use multiple VALUES clauses or multiple INSERT statements (3) Always verify results with a SELECT query.",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT NOT NULL, department TEXT, hire_date TEXT);
                                INSERT INTO employees VALUES (1, 'Alice Wang', 'Engineering', '2024-01-15');
                                INSERT INTO employees VALUES (2, 'Mei-Ling Li', 'Marketing', '2024-02-01');
                                INSERT INTO employees VALUES (3, 'David Chang', 'Sales', '2024-03-10');
                            """,
                            starterCode: """
                                -- Add three employees to the employees table
                                INSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', '2024-06-01');
                                -- Continue adding the remaining two...
                            """,
                            expectedQuery: "INSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', '2024-06-01'); INSERT INTO employees VALUES (5, 'Grace Lin', 'Marketing', '2024-06-01'); INSERT INTO employees VALUES (6, 'Kevin Huang', 'Sales', '2024-06-15'); SELECT * FROM employees ORDER BY id;"
                        ),
                        Challenge(
                            id: 2,
                            name: "UPDATE Data",
                            type: .code,
                            difficulty: .easy,
                            question: "Complete two updates:\n1. Increase the salary of all Engineering employees by 10%\n2. Change David Chang's department to Marketing",
                            scenario: 
                            Challenge.Scenario(
                                title: "Adjust Employee Departments and Salaries",
                                narrative: "During a mid-year reorganization, all employees in the Engineering department receive a 10% raise, and David Chang is transferring from Sales to Marketing. Use UPDATE statements to make both changes.\n\nTable structure: employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL)",
                                data: [
                                    ["id": "1", "name": "Alice Wang", "department": "Engineering", "salary": "80000"],
                                    ["id": "2", "name": "Mei-Ling Li", "department": "Marketing", "salary": "75000"],
                                    ["id": "3", "name": "David Chang", "department": "Sales", "salary": "70000"],
                                    ["id": "4", "name": "Jason Chen", "department": "Engineering", "salary": "85000"],
                                ],
                                dataCaption: "employees table"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPDATE table_name SET column = new_value WHERE condition;", "A 10% raise can be written as salary = salary * 1.1", "Always include a WHERE clause — otherwise ALL rows will be updated!"],
                            explanation: "UPDATE with a WHERE clause allows you to precisely modify specific rows. The most important rule: never forget the WHERE clause. An UPDATE without WHERE affects every row in the table — a catastrophic mistake in production environments.",
                            frameworkTip: "UPDATE safety checklist: (1) First run a SELECT to confirm which rows the WHERE clause targets (2) Verify the scope is correct before executing the UPDATE (3) Execute within a Transaction so you can ROLLBACK on errors.",
                            sampleSchema: """
                                CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, department TEXT, salary REAL);
                                INSERT INTO employees VALUES (1, 'Alice Wang', 'Engineering', 80000);
                                INSERT INTO employees VALUES (2, 'Mei-Ling Li', 'Marketing', 75000);
                                INSERT INTO employees VALUES (3, 'David Chang', 'Sales', 70000);
                                INSERT INTO employees VALUES (4, 'Jason Chen', 'Engineering', 85000);
                            """,
                            starterCode: """
                                -- 1. Give Engineering department a 10% raise
                                UPDATE employees
                                SET salary = salary * 1.1
                                WHERE department = 'Engineering';

                                -- 2. Transfer David Chang to another department
                                -- Complete this UPDATE ...

                                SELECT * FROM employees ORDER BY id;
                            """,
                            expectedQuery: "UPDATE employees SET salary = salary * 1.1 WHERE department = 'Engineering'; UPDATE employees SET department = 'Marketing' WHERE name = 'David Chang'; SELECT * FROM employees ORDER BY id;"
                        ),
                        Challenge(
                            id: 3,
                            name: "Safe DELETE",
                            type: .code,
                            difficulty: .medium,
                            question: "Safely delete all orders from before 2023: first delete the corresponding order_items, then delete the orders. Use SELECT to verify data before and after deletion.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Clean Up Expired Orders and Related Items",
                                narrative: "The e-commerce system has two tables: orders and order_items. Management has requested that all orders from before 2023 (not including 2023) and their associated line items be deleted. You must delete from the child table (order_items) first, then from the parent table (orders), to avoid foreign key constraint violations.\n\nTable structure:\n- orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL)\n- order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER)",
                                data: [
                                    ["id": "1", "customer": "Alice Wang", "order_date": "2022-06-15", "total": "1500"],
                                    ["id": "2", "customer": "Mei-Ling Li", "order_date": "2022-11-20", "total": "3200"],
                                    ["id": "3", "customer": "David Chang", "order_date": "2023-03-10", "total": "800"],
                                    ["id": "4", "customer": "Jason Chen", "order_date": "2024-01-05", "total": "2100"],
                                ],
                                dataCaption: "orders table (order_items omitted)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First use SELECT to confirm the WHERE clause captures the correct data", "For order_items, use a subquery: WHERE order_id IN (SELECT id FROM orders WHERE ...)", "Deletion order matters: child table first, then parent table, to avoid foreign key constraint errors"],
                            explanation: "When deleting data from tables with foreign key relationships, you must follow the correct deletion order: delete from the child table (the referencing side) first, then the parent table (the referenced side). Here we use a subquery WHERE order_id IN (SELECT id FROM orders WHERE ...) to precisely target the order_items to delete. In practice, you can also set ON DELETE CASCADE to let the database handle this automatically, but manual control is safer.",
                            frameworkTip: "Safe DELETE in 4 steps: (1) SELECT to confirm scope (2) Delete from child table (3) Delete from parent table (4) SELECT to verify results. In production, always execute within a Transaction.",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER PRIMARY KEY, customer TEXT, order_date TEXT, total REAL);
                                INSERT INTO orders VALUES (1, 'Alice Wang', '2022-06-15', 1500);
                                INSERT INTO orders VALUES (2, 'Mei-Ling Li', '2022-11-20', 3200);
                                INSERT INTO orders VALUES (3, 'David Chang', '2023-03-10', 800);
                                INSERT INTO orders VALUES (4, 'Jason Chen', '2024-01-05', 2100);
                                CREATE TABLE order_items (id INTEGER PRIMARY KEY, order_id INTEGER, product TEXT, quantity INTEGER);
                                INSERT INTO order_items VALUES (1, 1, 'Laptop', 1);
                                INSERT INTO order_items VALUES (2, 1, 'Mouse', 2);
                                INSERT INTO order_items VALUES (3, 2, 'Monitor', 1);
                                INSERT INTO order_items VALUES (4, 3, 'Keyboard', 1);
                                INSERT INTO order_items VALUES (5, 4, 'Headphones', 3);
                            """,
                            starterCode: """
                                -- Step 1: Identify which orders to delete
                                SELECT * FROM orders WHERE order_date < '2023-01-01';

                                -- Step 2: Delete related data from the child table first
                                -- DELETE FROM order_items WHERE ...;

                                -- Step 3: Then delete from the parent table
                                -- DELETE FROM orders WHERE ...;

                                -- Step 4: Verify results
                                SELECT * FROM orders;
                                SELECT * FROM order_items;
                            """,
                            expectedQuery: "DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE order_date < '2023-01-01'); DELETE FROM orders WHERE order_date < '2023-01-01'; SELECT * FROM orders; SELECT * FROM order_items;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Delete Duplicate Records",
                            type: .code,
                            difficulty: .easy,
                            question: "Delete duplicate records from the contacts table based on email, keeping only the record with the smallest id for each email.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Cleaning Up Duplicate Customer Emails",
                                narrative: "The marketing team imported a batch of contacts into the contacts table, but due to a duplicate file import, some emails ended up with multiple records. Your manager asks you to remove the duplicates, keeping only the earliest record (smallest id) for each email.\n\nTable structure: contacts (id INTEGER, email TEXT, name TEXT, created_at TEXT)",
                                data: [
                                    ["id": "1", "email": "alice@mail.com", "name": "Alice", "created_at": "2024-01-10"],
                                    ["id": "2", "email": "bob@mail.com", "name": "Bob", "created_at": "2024-01-12"],
                                    ["id": "3", "email": "alice@mail.com", "name": "Alice Lin", "created_at": "2024-01-15"],
                                    ["id": "4", "email": "charlie@mail.com", "name": "Charlie", "created_at": "2024-01-18"],
                                    ["id": "5", "email": "bob@mail.com", "name": "Bob Wang", "created_at": "2024-01-20"],
                                ],
                                dataCaption: "contacts table (notice alice and bob each have two records)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use GROUP BY email with MIN(id) to find the earliest record for each email", "DELETE ... WHERE id NOT IN (subquery) removes records not on the keep list"],
                            explanation: "This is the classic delete-duplicates problem (a LeetCode #196 variant). The core idea: first use a subquery SELECT MIN(id) FROM contacts GROUP BY email to identify the id to keep for each email, then use DELETE ... WHERE id NOT IN (...) to remove the rest. In interviews, this tests your ability to combine DELETE with subqueries and your understanding of GROUP BY aggregation.",
                            frameworkTip: "Standard steps for deleting duplicates: (1) Use SELECT to confirm which records are duplicates (2) Use a subquery to find the ids to keep (3) DELETE records not on the keep list. Always run SELECT first to verify before converting to DELETE.",
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
                                  -- How do you find the smallest id for each email?
                                );
                            """,
                            expectedQuery: "DELETE FROM contacts WHERE id NOT IN (SELECT MIN(id) FROM contacts GROUP BY email);"
                        ),
                    ]
                ),
                Quest(
                    id: "26-2",
                    name: "CREATE TABLE & Data Types",
                    description: "Design table structures, choose appropriate data types, and apply constraints",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CREATE TABLE",
                            type: .code,
                            difficulty: .easy,
                            question: "Create the products table according to the requirements, insert two test records, and use SELECT to view the results.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Design an E-Commerce Products Table",
                                narrative: "You are developing the backend for an e-commerce platform and need to create a products table to store product information. Requirements:\n- Each product has a unique id (auto-incrementing primary key)\n- Product name cannot be null\n- Price is a decimal with a default value of 0\n- Stock quantity is an integer that cannot be negative\n- Category is text\n- Listing date is stored as text",
                                data: [
                                    ["column": "id", "type": "INTEGER", "constraint": "PRIMARY KEY"],
                                    ["column": "name", "type": "TEXT", "constraint": "NOT NULL"],
                                    ["column": "price", "type": "REAL", "constraint": "DEFAULT 0"],
                                    ["column": "stock", "type": "INTEGER", "constraint": "CHECK(stock >= 0)"],
                                    ["column": "category", "type": "TEXT", "constraint": ""],
                                    ["column": "listed_date", "type": "TEXT", "constraint": ""],
                                ],
                                dataCaption: "Expected column design"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["In SQLite, INTEGER PRIMARY KEY automatically auto-increments", "CHECK constraints can limit the range of column values, e.g., CHECK(stock >= 0)", "DEFAULT sets a default value for a column"],
                            explanation: "CREATE TABLE is the foundation of defining database structure. SQLite has relatively simple data types: INTEGER, REAL, TEXT, BLOB. Constraints include PRIMARY KEY, NOT NULL (required field), UNIQUE, DEFAULT (default value), and CHECK (conditional validation). Good table design prevents invalid data from entering the system at the source.",
                            frameworkTip: "CREATE TABLE design principles: (1) Every table should have a PRIMARY KEY (2) Use NOT NULL to protect required fields (3) Use CHECK to restrict value ranges (4) Use DEFAULT to provide sensible default values.",
                            starterCode: """
                                -- Create the products table
                                CREATE TABLE products (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  -- Complete the remaining columns...
                                );

                                -- Insert test data
                                INSERT INTO products (name, price, stock, category, listed_date)
                                VALUES ('Wireless Bluetooth Earbuds', 1290, 50, 'Electronics', '2024-06-01');

                                -- Insert another record...

                                SELECT * FROM products;
                            """,
                            expectedQuery: "CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL, price REAL DEFAULT 0, stock INTEGER CHECK(stock >= 0), category TEXT, listed_date TEXT); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('Wireless Bluetooth Earbuds', 1290, 50, 'Electronics', '2024-06-01'); INSERT INTO products (name, price, stock, category, listed_date) VALUES ('Mechanical Keyboard', 2490, 30, 'Electronics', '2024-06-10'); SELECT * FROM products;"
                        ),
                        Challenge(
                            id: 2,
                            name: "Data Types & Constraints",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following CREATE TABLE statements most correctly implements the requirements above?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choose the Correct Data Types and Constraints",
                                narrative: "You are designing a database for a logistics company. One of the tables, shipments, has the following columns: shipment ID (unique identifier), recipient name (required), weight in kg (can have decimals), shipping fee (cannot be negative), and status (can only be pending / shipped / delivered).",
                                data: [
                                    ["column": "shipment_id", "description": "Unique identifier"],
                                    ["column": "recipient", "description": "Required recipient name"],
                                    ["column": "weight_kg", "description": "Weight, may have decimals"],
                                    ["column": "shipping_fee", "description": "Shipping fee, cannot be negative"],
                                    ["column": "status", "description": "Must be pending/shipped/delivered"],
                                ],
                                dataCaption: "shipments table requirements"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee >= 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));", explanation: "Correct! INTEGER PRIMARY KEY for the unique identifier, TEXT NOT NULL ensures the required field, REAL handles decimals, and CHECK constraints limit the value range and allowed options."),
                                Challenge.Option(id: "B", text: "CREATE TABLE shipments (shipment_id VARCHAR PRIMARY KEY, recipient VARCHAR, weight_kg DECIMAL, shipping_fee DECIMAL, status VARCHAR);", explanation: "Incorrect. SQLite does not use VARCHAR or DECIMAL (use TEXT and REAL instead); recipient is missing NOT NULL; shipping_fee and status have no CHECK constraints."),
                                Challenge.Option(id: "C", text: "CREATE TABLE shipments (shipment_id INTEGER PRIMARY KEY, recipient TEXT, weight_kg REAL, shipping_fee REAL, status TEXT DEFAULT 'pending');", explanation: "Not fully correct. recipient is missing NOT NULL, shipping_fee is missing CHECK(>= 0), and status has a DEFAULT but no CHECK constraint to restrict the allowed values."),
                                Challenge.Option(id: "D", text: "CREATE TABLE shipments (shipment_id INTEGER UNIQUE, recipient TEXT NOT NULL, weight_kg REAL, shipping_fee REAL CHECK(shipping_fee > 0), status TEXT CHECK(status IN ('pending', 'shipped', 'delivered')));", explanation: "Close but not fully correct. shipment_id uses UNIQUE instead of PRIMARY KEY (missing a primary key); shipping_fee uses CHECK(> 0), but the fee could be 0 for free shipping — it should be >= 0."),
                            ],
                            correctAnswer: "A",
                            hints: ["SQLite uses TEXT instead of VARCHAR, and REAL instead of DECIMAL", "NOT NULL ensures a column cannot be empty", "CHECK(status IN ('a', 'b', 'c')) restricts the allowed values"],
                            explanation: "Choosing appropriate data types and designing constraints is fundamental to database design. SQLite has simple types (INTEGER, REAL, TEXT, BLOB), but combined with CHECK, NOT NULL, DEFAULT, and other constraints, you can prevent invalid data at the database level. Good schema design means your application needs far less validation logic.",
                            frameworkTip: "Constraint selection guide: Unique identifier -> PRIMARY KEY; Required field -> NOT NULL; Numeric range -> CHECK; Allowed value list -> CHECK ... IN (...); Default value -> DEFAULT."
                        ),
                        Challenge(
                            id: 3,
                            name: "Highest-Paid Employee per Department",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a SQL query to find the name, department name, and salary of the highest-paid employee in each department. If multiple employees share the top salary in a department, list all of them.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Find the Top Earner in Each Department",
                                narrative: "The HR department is preparing the annual salary report and needs a list of the highest-paid employee in each department. You need to understand the table structure first, then write the query.\n\nTable structure:\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)",
                                data: [
                                    ["id": "1", "name": "Alice", "salary": "85000", "department": "Engineering"],
                                    ["id": "2", "name": "Bob", "salary": "92000", "department": "Engineering"],
                                    ["id": "3", "name": "Charlie", "salary": "78000", "department": "Marketing"],
                                    ["id": "4", "name": "Diana", "salary": "81000", "department": "Marketing"],
                                    ["id": "5", "name": "Eve", "salary": "95000", "department": "Engineering"],
                                ],
                                dataCaption: "workers + departments (combined view)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use a correlated subquery: the inner query references the outer query's department_id", "SELECT MAX(salary) FROM workers WHERE department_id = outer department_id"],
                            explanation: "The key to this problem is the correlated subquery: the inner WHERE w2.department_id = w.department_id dynamically computes the maximum salary for each department relative to the outer row. Compared to a GROUP BY approach, this naturally handles the \"multiple employees tied for the top salary\" scenario. This is a commonly tested SQL pattern at major companies like Microsoft.",
                            frameworkTip: "\"Find the row with the max/min value in each group\" is a classic interview pattern. Two approaches: (1) Correlated subquery WHERE val = (SELECT MAX...) (2) Window function RANK() OVER (PARTITION BY ...). Being able to discuss both in an interview is a strong advantage.",
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
                                  -- How do you find the highest salary in the same department?
                                );
                            """,
                            expectedQuery: "SELECT w.name, d.dept_name, w.salary FROM workers w JOIN departments d ON w.department_id = d.id WHERE w.salary = (SELECT MAX(w2.salary) FROM workers w2 WHERE w2.department_id = w.department_id);"
                        ),
                    ]
                ),
                Quest(
                    id: "26-3",
                    name: "CRUD & Application Data Flow",
                    description: "Understand how CRUD operations map to web application data flows",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Complete CRUD Operations",
                            type: .code,
                            difficulty: .easy,
                            question: "Execute CRUD operations in order:\n1. INSERT a new item: \"Deploy new version\"\n2. SELECT all to-do items\n3. UPDATE id=1 to mark as completed\n4. DELETE all completed items\nFinally, SELECT to verify the results.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Full CRUD for a To-Do App",
                                narrative: "You are developing the backend API for a to-do application. You need to perform the following operations in order:\n1. Create — Add a new to-do item\n2. Read — Query all to-do items\n3. Update — Mark an item as completed\n4. Delete — Remove all completed items\n\nTable structure: todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT)",
                                data: [
                                    ["id": "1", "title": "Finish project report", "is_done": "0", "created_at": "2024-06-01"],
                                    ["id": "2", "title": "Prepare weekly meeting slides", "is_done": "1", "created_at": "2024-06-02"],
                                    ["id": "3", "title": "Reply to client emails", "is_done": "0", "created_at": "2024-06-03"],
                                ],
                                dataCaption: "todos table"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UPDATE todos SET is_done = 1 WHERE id = 1;", "DELETE FROM todos WHERE is_done = 1; removes all completed items", "CRUD stands for Create (INSERT), Read (SELECT), Update (UPDATE), Delete (DELETE)"],
                            explanation: "CRUD is the core operation pattern for all data-driven applications. Nearly every web/app backend performs CRUD operations on a database. Understanding how these four operations combine to form complete business logic is foundational for becoming a Business Engineer.",
                            frameworkTip: "CRUD mapping: Create -> INSERT, Read -> SELECT, Update -> UPDATE, Delete -> DELETE. In REST APIs, these correspond to POST, GET, PUT/PATCH, and DELETE respectively.",
                            sampleSchema: """
                                CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT NOT NULL, is_done INTEGER DEFAULT 0, created_at TEXT);
                                INSERT INTO todos VALUES (1, 'Finish project report', 0, '2024-06-01');
                                INSERT INTO todos VALUES (2, 'Prepare weekly meeting slides', 1, '2024-06-02');
                                INSERT INTO todos VALUES (3, 'Reply to client emails', 0, '2024-06-03');
                            """,
                            starterCode: """
                                -- C: Create
                                INSERT INTO todos (title, created_at) VALUES ('Deploy new version', '2024-06-04');

                                -- R: Read
                                SELECT * FROM todos;

                                -- U: Update (mark id=1 as completed)
                                -- UPDATE ...

                                -- D: Delete (remove all completed items)
                                -- DELETE ...

                                -- Verify final results
                                SELECT * FROM todos;
                            """,
                            expectedQuery: "INSERT INTO todos (title, created_at) VALUES ('Deploy new version', '2024-06-04'); SELECT * FROM todos; UPDATE todos SET is_done = 1 WHERE id = 1; DELETE FROM todos WHERE is_done = 1; SELECT * FROM todos;"
                        ),
                        Challenge(
                            id: 2,
                            name: "HTTP to SQL Mapping",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which option correctly describes the mapping between HTTP methods and SQL operations?",
                            scenario: 
                            Challenge.Scenario(
                                title: "REST API and SQL Correspondence",
                                narrative: "You are designing a REST API to manage customer data. The frontend sends different HTTP requests, and the backend needs to map them to the correct SQL operations.\n\nFor example:\n- Frontend sends POST /api/customers with a JSON body -> What SQL does the backend execute?\n- Frontend sends GET /api/customers/123 -> What SQL does the backend execute?\n- Frontend sends PUT /api/customers/123 with a JSON body -> What SQL does the backend execute?\n- Frontend sends DELETE /api/customers/123 -> What SQL does the backend execute?",
                                data: [
                                    ["method": "POST", "path": "/api/customers", "action": "Create customer"],
                                    ["method": "GET", "path": "/api/customers/:id", "action": "Query single customer"],
                                    ["method": "PUT", "path": "/api/customers/:id", "action": "Update customer data"],
                                    ["method": "DELETE", "path": "/api/customers/:id", "action": "Delete customer"],
                                ],
                                dataCaption: "REST API endpoints"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "POST -> INSERT, GET -> SELECT, PUT -> UPDATE, DELETE -> DELETE", explanation: "Correct! This is the standard mapping in RESTful APIs. POST creates a resource (INSERT), GET reads (SELECT), PUT updates (UPDATE), and DELETE removes (DELETE)."),
                                Challenge.Option(id: "B", text: "GET -> INSERT, POST -> SELECT, PUT -> DELETE, DELETE -> UPDATE", explanation: "Completely wrong. GET is a read operation and should not modify data; POST is a create operation, not a query."),
                                Challenge.Option(id: "C", text: "POST -> INSERT, GET -> SELECT, PATCH -> INSERT, DELETE -> UPDATE", explanation: "Incorrect. PATCH is for partial updates, not creation; DELETE is for deletion, not updating."),
                                Challenge.Option(id: "D", text: "POST -> SELECT, GET -> INSERT, PUT -> DELETE, DELETE -> UPDATE", explanation: "Completely reversed. POST is a write operation, GET is a read operation, PUT is for updates, and DELETE is for deletion."),
                            ],
                            correctAnswer: "A",
                            hints: ["HTTP GET is a \"read\" operation, mapping to the SQL \"read\" operation", "POST means \"create a new resource\"", "REST design principles require that HTTP methods have clear semantics"],
                            explanation: "The core design principle of RESTful APIs is to make HTTP methods semantic: POST (create) -> INSERT, GET (read) -> SELECT, PUT/PATCH (update) -> UPDATE, DELETE (remove) -> DELETE. This CRUD mapping is fundamental web development knowledge and a common interview topic. Additionally, PUT is a full update while PATCH is a partial update — the difference maps to how many columns the UPDATE SET clause modifies.",
                            frameworkTip: "HTTP <-> CRUD <-> SQL triple mapping: POST=Create=INSERT, GET=Read=SELECT, PUT/PATCH=Update=UPDATE, DELETE=Delete=DELETE."
                        ),
                        Challenge(
                            id: 3,
                            name: "Transaction Processing",
                            type: .code,
                            difficulty: .medium,
                            question: "Use BEGIN / COMMIT to implement a transfer transaction: transfer 15,000 from Alice Wang (id=1) to Mei-Ling Li (id=2). Ensure both UPDATEs are completed within a single transaction.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Bank Transfer Transaction Safety",
                                narrative: "In a banking system, a transfer must be an atomic operation: debiting Account A and crediting Account B must either both succeed or both fail. If the debit succeeds but the credit fails (e.g., due to a system crash), the entire operation must be rolled back (ROLLBACK).\n\nTable structure: accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0))",
                                data: [
                                    ["id": "1", "owner": "Alice Wang", "balance": "50000"],
                                    ["id": "2", "owner": "Mei-Ling Li", "balance": "30000"],
                                    ["id": "3", "owner": "David Chang", "balance": "10000"],
                                ],
                                dataCaption: "accounts balances"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["BEGIN TRANSACTION starts a transaction, COMMIT saves it, ROLLBACK undoes it", "Both UPDATEs must be placed between BEGIN and COMMIT", "CHECK(balance >= 0) prevents the balance from going negative"],
                            explanation: "A Transaction ensures the atomicity of a group of operations: either all succeed or all are rolled back. The ACID properties are: Atomicity, Consistency, Isolation, and Durability. Bank transfers are the classic transaction scenario and are frequently used in interviews to test your understanding of Transactions.",
                            frameworkTip: "Transaction in 3 steps: BEGIN -> Execute multiple SQL statements -> COMMIT (on success) or ROLLBACK (on failure). Financial operations, inventory deductions, and other multi-table changes should always use Transactions.",
                            sampleSchema: """
                                CREATE TABLE accounts (id INTEGER PRIMARY KEY, owner TEXT, balance REAL CHECK(balance >= 0));
                                INSERT INTO accounts VALUES (1, 'Alice Wang', 50000);
                                INSERT INTO accounts VALUES (2, 'Mei-Ling Li', 30000);
                                INSERT INTO accounts VALUES (3, 'David Chang', 10000);
                            """,
                            starterCode: """
                                -- Begin the transaction
                                BEGIN TRANSACTION;

                                -- Debit 15000 from Alice Wang's account
                                UPDATE accounts SET balance = balance - 15000 WHERE id = 1;

                                -- Credit 15000 to Mei-Ling Li's account
                                -- Complete this...

                                -- Commit the transaction
                                COMMIT;

                                -- Verify results
                                SELECT * FROM accounts;
                            """,
                            expectedQuery: "BEGIN TRANSACTION; UPDATE accounts SET balance = balance - 15000 WHERE id = 1; UPDATE accounts SET balance = balance + 15000 WHERE id = 2; COMMIT; SELECT * FROM accounts;"
                        ),
                        Challenge(
                            id: 4,
                            name: "Order Lifecycle SQL Tracking",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which option correctly describes the complete sequence of SQL operations from \"order placed\" to \"refund completed\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Complete Lifecycle of an E-Commerce Order",
                                narrative: "You are in an Amazon interview, and the interviewer presents an order processing system scenario. An order goes through a complete lifecycle from \"placed\" to \"refund completed.\" The system involves the following tables:\n\n- orders (id, user_id, total_amount, status, created_at, updated_at)\n- order_items (id, order_id, product_id, quantity, unit_price)\n- inventory (product_id, stock_quantity)\n- payments (id, order_id, amount, payment_method, status, paid_at)\n- refunds (id, order_id, amount, reason, status, created_at)\n\nThe interviewer asks: What SQL operations are triggered in sequence as an order goes from placement to refund completion?",
                                data: [
                                    ["階段": "1. Order Placed", "狀態": "pending"],
                                    ["階段": "2. Payment Successful", "狀態": "paid"],
                                    ["階段": "3. Shipped", "狀態": "shipped"],
                                    ["階段": "4. Delivered", "狀態": "delivered"],
                                    ["階段": "5. Return Requested", "狀態": "return_requested"],
                                    ["階段": "6. Refund Completed", "狀態": "refunded"],
                                ],
                                dataCaption: "Order lifecycle stages"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Place order: INSERT orders → Payment: UPDATE orders status → Ship: UPDATE orders status → Return: DELETE orders + DELETE order_items", explanation: "Returns should never use DELETE! Deleting the order would destroy all historical records, making financial reconciliation and auditing impossible. Returns should UPDATE the status and INSERT a refund record."),
                                Challenge.Option(id: "B", text: "Place order: INSERT orders + INSERT order_items + UPDATE inventory (deduct stock) → Payment: INSERT payments + UPDATE orders status → Ship: UPDATE orders status → Deliver: UPDATE orders status → Return: UPDATE orders status + INSERT refunds + UPDATE inventory (restore stock) + UPDATE payments status", explanation: "Correct! The complete order lifecycle involves coordinated operations across multiple tables. When placing an order, you must create the order record, line items, and deduct inventory. Payment creates a payment record and updates order status. Returns update the order status, create a refund record, restore inventory, and update payment status. Every stage uses INSERT or UPDATE — never DELETE."),
                                Challenge.Option(id: "C", text: "Place order: INSERT orders → Payment: INSERT payments → Ship: INSERT shipments → Return: INSERT refunds", explanation: "INSERT alone is insufficient. Each stage also requires UPDATE operations on existing tables (e.g., orders.status). Additionally, placing an order also requires deducting inventory (UPDATE inventory)."),
                                Challenge.Option(id: "D", text: "Place order: INSERT orders + INSERT order_items → Payment: UPDATE orders status → Ship: UPDATE orders status → Return: UPDATE orders status + INSERT refunds", explanation: "Several critical operations are missing: no inventory deduction (UPDATE inventory) when placing the order, no payment record (INSERT payments) during payment, and no inventory restoration during the return. In practice, each step requires complete data operations."),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about what new records are created and what existing data is updated at each stage", "Inventory is deducted when the order is placed and must be restored upon return", "In practice, orders are never DELETEd — status changes are tracked via UPDATE status"],
                            explanation: "The order lifecycle is the most critical data flow in an e-commerce system. Key takeaways: (1) Every status transition is an UPDATE on orders.status (2) Important events require an INSERT into the corresponding record table (payments, refunds) (3) Inventory is bidirectional — deducted on order, restored on return (4) All operations should execute within a transaction to ensure consistency. Being able to articulate the full multi-table operations and transaction concepts in an interview is a significant advantage.",
                            frameworkTip: "When describing data flows, use the format \"which table, what operation, why\": INSERT orders (create the order record) → UPDATE inventory (deduct stock) → and so on. Demonstrate your understanding of the business logic behind each operation."
                        ),
                    ]
                ),
                Quest(
                    id: "26-4",
                    name: "SQL & Python Integration",
                    description: "Learn about SQL injection prevention and best practices for using SQL in Python",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SQL Injection Prevention",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is the best practice for preventing SQL injection?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Preventing SQL Injection Attacks",
                                narrative: "Your colleague wrote a Python login verification script:\n\n```python\nusername = input(\"Username: \")\npassword = input(\"Password: \")\nquery = f\"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'\"\ncursor.execute(query)\n```\n\nThis code has a severe security vulnerability. If a user enters `admin' --` in the username field, the SQL becomes:\nSELECT * FROM users WHERE username = 'admin' --' AND password = '...'\n\nEverything after `--` becomes a comment, and the password check is bypassed!",
                                data: [
                                    ["input": "admin' --", "result": "Bypasses password verification, logs in as admin directly"],
                                    ["input": "' OR '1'='1", "result": "Returns all user data"],
                                    ["input": "'; DROP TABLE users; --", "result": "Drops the entire users table"],
                                ],
                                dataCaption: "Common SQL injection attack examples"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use parameterized queries: cursor.execute(\"SELECT * FROM users WHERE username = ? AND password = ?\", (username, password))", explanation: "Correct! Parameterized queries let the database engine automatically handle escaping of special characters, fundamentally preventing SQL injection. This is the industry-recognized best practice."),
                                Challenge.Option(id: "B", text: "Manually filter special characters: username = username.replace(\"'\", \"''\")", explanation: "Not recommended. Manual filtering is prone to missing edge cases (such as Unicode characters or different database escaping rules) and is difficult to maintain. Use the database's parameterized query mechanism instead."),
                                Challenge.Option(id: "C", text: "Limit input length: if len(username) > 20: raise Error", explanation: "Insufficient. Limiting length can reduce risk but cannot truly prevent injection. A short string like ' OR 1=1-- is already enough for an attack."),
                                Challenge.Option(id: "D", text: "Allow only alphanumeric characters: re.match(r\"^[a-zA-Z0-9]+$\", username)", explanation: "Overly restrictive and not comprehensive. Some valid usernames may contain special characters (like email format). Parameterized queries are the fundamental solution."),
                            ],
                            correctAnswer: "A",
                            hints: ["Parameterized queries use ? or :name as placeholders, and the database handles escaping automatically", "f-strings or string concatenation are the root cause of SQL injection", "ORMs (like SQLAlchemy) use parameterized queries internally"],
                            explanation: "SQL Injection is the number one vulnerability on the OWASP Top 10. The golden rule of defense: never use string concatenation to build SQL queries. Use parameterized queries to let the database engine handle special characters. Python sqlite3 uses ? placeholders; other languages/frameworks have similar mechanisms (e.g., Java PreparedStatement, Node.js $ placeholders).",
                            frameworkTip: "Three principles for preventing SQL injection: (1) Always use parameterized queries (2) Never concatenate user input into SQL strings (3) Using an ORM framework can further reduce risk."
                        ),
                        Challenge(
                            id: 2,
                            name: "Python + SQL Integration Design",
                            type: .openEnded,
                            difficulty: .medium,
                            question: "Describe how you would design this Python + SQLite data access layer. Your answer should cover:\n1. Table structure design\n2. Connection management (when to open/close connections)\n3. Error handling strategy\n4. SQL injection prevention\n5. Would you use raw sqlite3 or an ORM? Why?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Design a Python + SQLite Data Access Layer",
                                narrative: "Your team is developing a Customer Management System using Python + SQLite. You need to design a Data Access Layer (DAL) so that business logic can operate on the database through clean Python functions without writing SQL directly.\n\nRequired operations:\n- Create tables (initialization)\n- Add a customer\n- Query a customer by ID\n- Update customer data\n- Delete a customer\n\nConsider how to organize the code, handle errors, and ensure security.",
                                data: [
                                    ["function": "init_db()", "description": "Create tables"],
                                    ["function": "create_customer(name, email)", "description": "Add a customer"],
                                    ["function": "get_customer(id)", "description": "Query a single customer"],
                                    ["function": "update_customer(id, **kwargs)", "description": "Update a customer"],
                                    ["function": "delete_customer(id)", "description": "Delete a customer"],
                                ],
                                dataCaption: "Expected function interface"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Python's with sqlite3.connect(...) as conn automatically manages Transactions", "Use ? placeholders for parameterized queries — never use f-strings", "Consider: if the project scales up, can your design smoothly migrate to PostgreSQL?"],
                            explanation: "The Data Access Layer (DAL / Repository Pattern) is a critical layer in software architecture. It encapsulates database operations in an independent module so that business logic does not depend directly on a specific database. A good DAL design considers: connection management, error handling, security (injection prevention), testability (can be mocked), and future extensibility (only the DAL needs to change when switching databases).",
                            frameworkTip: "DAL design checklist: (1) Use context managers for connection management (2) All SQL uses parameterized queries (3) Write operations use Transactions (4) Errors have clear handling and reporting (5) Function interfaces are separated from SQL implementation."
                        ),
                        Challenge(
                            id: 3,
                            name: "SQL vs Python Task Assignment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which tool assignment is the most reasonable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Task Assignment for the Data Team",
                                narrative: "You just joined LinkedIn's Data Analytics team. Your manager has listed a set of tasks for the day and wants you to determine the best tool for each. The team has SQL (connected to the company data warehouse) and Python (Jupyter Notebook with pandas, matplotlib, and scikit-learn).\n\nTask list:\nA. Calculate daily active users (DAU) from 1 billion event records\nB. Create a line chart of DAU data and email it to the manager\nC. Merge two CSV files, clean missing values, and upload to the database\nD. Build a model to predict which users are likely to churn next month\nE. Find the list of users who logged in every day for the past 7 consecutive days",
                                data: [
                                    ["任務": "A. Calculate DAU", "資料量": "1 billion rows", "適合工具": "?"],
                                    ["任務": "B. DAU line chart", "資料量": "365 rows", "適合工具": "?"],
                                    ["任務": "C. CSV cleanup & upload", "資料量": "50,000 rows", "適合工具": "?"],
                                    ["任務": "D. Churn prediction model", "資料量": "100,000 rows (feature table)", "適合工具": "?"],
                                    ["任務": "E. Consecutive login users", "資料量": "1 billion rows", "適合工具": "?"],
                                ],
                                dataCaption: "Task list and tool selection"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A=SQL, B=Python, C=Python, D=Python, E=SQL", explanation: "Correct! A and E involve large-scale data aggregation and filtering — SQL executes these on the database side most efficiently. B requires visualization, best done with Python matplotlib. C involves CSV parsing and missing value cleanup — a strength of pandas. D is an ML task that requires Python. The key principle: let SQL handle large-scale aggregation at the database, and Python handle post-processing and analysis."),
                                Challenge.Option(id: "B", text: "A=Python, B=Python, C=Python, D=Python, E=Python", explanation: "Using Python for everything is a common beginner mistake. A and E both involve 1 billion records — pulling that into local memory with pandas would consume roughly 80GB of RAM and be extremely slow. Large-scale aggregation should be performed server-side by the database engine."),
                                Challenge.Option(id: "C", text: "A=SQL, B=SQL, C=SQL, D=SQL, E=SQL", explanation: "Using SQL for everything is also inappropriate. SQL cannot produce visualizations (B), is not well-suited for CSV cleanup (C), and cannot build ML models (D). Tool selection should match the nature of the task — not be one-size-fits-all."),
                                Challenge.Option(id: "D", text: "A=SQL, B=Python, C=SQL, D=Python, E=Python", explanation: "Using SQL to process CSV files (C) is awkward — pandas read_csv + fillna is far more convenient. Using Python for E with 1 billion event records would run into memory issues — the consecutive login logic is more efficiently handled with SQL window functions."),
                            ],
                            correctAnswer: "A",
                            hints: ["Data volume is a key factor in tool selection — is it practical to pull 1 billion rows to local memory?", "Consider the core action of each task: aggregation? visualization? data cleaning? modeling?"],
                            explanation: "Choosing between SQL and Python is not a matter of preference — it is an engineering judgment. Core principles: (1) Large-scale filtering and aggregation → SQL (compute at the database, no data transfer needed) (2) Visualization, ML, file processing → Python (3) Small-scale exploratory analysis → either works. In interviews, demonstrating \"I choose tools based on data volume and task nature\" is far more convincing than \"I use Python for everything.\"",
                            frameworkTip: "Tool selection decision framework: first check data volume (large → process at the SQL/database layer) → then check task nature (aggregation → SQL, ML/visualization → Python) → finally check convenience (CSV → pandas, JSON → Python)."
                        ),
                    ]
                ),
                Quest(
                    id: "26-5",
                    name: "Permissions, Data Isolation & Query Performance",
                    description: "Database permission management, indexing, and query performance optimization",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Permission Management Concepts",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following descriptions about database permission management is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Database Permission Model",
                                narrative: "Your company has an internal data warehouse where different roles require different access permissions:\n\n- Data Analyst: Only needs to read data (SELECT)\n- Application Account: Needs read/write access (SELECT, INSERT, UPDATE, DELETE)\n- DBA Administrator: Needs full privileges (including CREATE, DROP, GRANT)\n\nIn enterprise databases like PostgreSQL / MySQL, this is managed through GRANT / REVOKE statements. (SQLite does not support GRANT/REVOKE, but the concept is frequently tested in interviews.)",
                                data: [
                                    ["role": "Data Analyst", "permissions": "SELECT"],
                                    ["role": "Application Account", "permissions": "SELECT, INSERT, UPDATE, DELETE"],
                                    ["role": "DBA Administrator", "permissions": "ALL PRIVILEGES"],
                                ],
                                dataCaption: "Role-to-permission mapping"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GRANT SELECT ON customers TO analyst; grants the analyst role read-only access to the customers table. REVOKE is used to remove previously granted permissions. The Principle of Least Privilege requires granting only the minimum permissions needed to perform the job.", explanation: "Correct! GRANT grants permissions, REVOKE revokes them, and following the Principle of Least Privilege is the foundation of database security. Each role should only have the minimum permissions required for their work."),
                                Challenge.Option(id: "B", text: "For easier management, all accounts should be given ALL PRIVILEGES, and access should be controlled at the application layer.", explanation: "Seriously wrong! This violates the Principle of Least Privilege. If the application has a vulnerability, an attacker can do anything. Permissions should be controlled at the database level."),
                                Challenge.Option(id: "C", text: "GRANT and REVOKE only apply to SQLite; large-scale databases use other mechanisms.", explanation: "The opposite is true. SQLite is an embedded database and does not support GRANT/REVOKE. These are features of multi-user databases like PostgreSQL, MySQL, and SQL Server."),
                                Challenge.Option(id: "D", text: "Database permissions only need to be configured once during initial setup and require no ongoing maintenance.", explanation: "Incorrect. Permissions need continuous maintenance as personnel change and roles shift. Permissions must be revoked when employees leave and adjusted when new features launch — this is ongoing work."),
                            ],
                            correctAnswer: "A",
                            hints: ["GRANT grants permissions, REVOKE revokes them — these are basic security mechanisms in enterprise databases", "Principle of Least Privilege: only grant necessary permissions, nothing more", "SQLite does not support GRANT/REVOKE, but the concept is commonly tested in interviews"],
                            explanation: "Database permission management is a critical part of enterprise security. While GRANT/REVOKE syntax is not applicable in SQLite, it is essential knowledge for multi-user databases like PostgreSQL and MySQL. The Principle of Least Privilege means: analysts only need SELECT, application accounts need CRUD, and only DBAs should have DDL and GRANT privileges. Row-Level Security (RLS) provides even finer control, allowing different users to see different rows of data.",
                            frameworkTip: "Three levels of permission management: (1) Database level — GRANT/REVOKE controls table and operation permissions (2) Row level — Row-Level Security controls visible data scope (3) Application level — additional permission checks in business logic."
                        ),
                        Challenge(
                            id: 2,
                            name: "Indexing & Performance",
                            type: .code,
                            difficulty: .medium,
                            question: "Create indexes for common query patterns:\n1. Create a composite index on customer_id and status\n2. Create an index on order_date (since date range queries are frequent)\n3. Use EXPLAIN QUERY PLAN to verify whether the indexes are being used",
                            scenario: 
                            Challenge.Scenario(
                                title: "Create Indexes for Slow Queries",
                                narrative: "Your e-commerce platform has an orders table with 1 million rows, and the following query takes 5 seconds:\n\nSELECT * FROM orders WHERE customer_id = 12345 AND status = 'shipped';\n\nBecause there are no indexes, the database performed a Full Table Scan. You need to create appropriate indexes to speed up the query.\n\nTable structure: orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT)",
                                data: [
                                    ["id": "1", "customer_id": "100", "product": "Laptop", "status": "shipped", "amount": "35000", "order_date": "2024-03-15"],
                                    ["id": "2", "customer_id": "200", "product": "Phone", "status": "pending", "amount": "28000", "order_date": "2024-03-16"],
                                    ["id": "3", "customer_id": "100", "product": "Mouse", "status": "delivered", "amount": "800", "order_date": "2024-03-17"],
                                    ["id": "4", "customer_id": "300", "product": "Monitor", "status": "shipped", "amount": "12000", "order_date": "2024-03-18"],
                                ],
                                dataCaption: "orders table (actually has millions of rows)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CREATE INDEX index_name ON table_name (col1, col2); creates a composite index", "Column order matters in composite indexes: place high-selectivity columns first", "EXPLAIN QUERY PLAN shows whether the query is using an index"],
                            explanation: "Indexes are the key to speeding up queries. Without an index, the database must scan every row (Full Table Scan); with an index, it can locate target data directly (Index Scan). Composite indexes are ideal for multi-condition queries, and column order follows the Leftmost Prefix Rule. However, indexes have a cost: they consume additional storage and slow down writes (INSERT/UPDATE/DELETE must also update the index).",
                            frameworkTip: "Index design principles: (1) Create indexes on columns frequently used in WHERE, JOIN, and ORDER BY (2) Composite indexes follow the leftmost prefix rule (3) Place high-selectivity columns first (4) Avoid over-indexing; be conservative on write-heavy tables (5) Use EXPLAIN to verify.",
                            sampleSchema: """
                                CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, status TEXT, amount REAL, order_date TEXT);
                                INSERT INTO orders VALUES (1, 100, 'Laptop', 'shipped', 35000, '2024-03-15');
                                INSERT INTO orders VALUES (2, 200, 'Phone', 'pending', 28000, '2024-03-16');
                                INSERT INTO orders VALUES (3, 100, 'Mouse', 'delivered', 800, '2024-03-17');
                                INSERT INTO orders VALUES (4, 300, 'Monitor', 'shipped', 12000, '2024-03-18');
                                INSERT INTO orders VALUES (5, 100, 'Keyboard', 'shipped', 2500, '2024-03-19');
                                INSERT INTO orders VALUES (6, 200, 'Headphones', 'delivered', 3200, '2024-03-20');
                            """,
                            starterCode: """
                                -- 1. Create a composite index (customer_id + status)
                                CREATE INDEX idx_orders_customer_status
                                  ON orders (customer_id, status);

                                -- 2. Create a date index
                                -- CREATE INDEX ...

                                -- 3. Use EXPLAIN QUERY PLAN to check index effectiveness
                                EXPLAIN QUERY PLAN
                                SELECT * FROM orders
                                WHERE customer_id = 100 AND status = 'shipped';
                            """,
                            expectedQuery: "CREATE INDEX idx_orders_customer_status ON orders (customer_id, status); CREATE INDEX idx_orders_date ON orders (order_date); EXPLAIN QUERY PLAN SELECT * FROM orders WHERE customer_id = 100 AND status = 'shipped';"
                        ),
                        Challenge(
                            id: 3,
                            name: "Query Performance Analysis",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which optimization approach would most effectively improve this query's performance?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Analyze and Optimize a Slow Query",
                                narrative: "A data analyst reports that the following query takes 30 seconds on the orders table with 1 million rows:\n\n```sql\nSELECT c.name, SUM(o.amount) AS total_spent\nFROM orders o\nJOIN customers c ON o.customer_id = c.id\nWHERE SUBSTR(o.order_date, 1, 7) = '2024-03'\nGROUP BY c.name\nHAVING SUM(o.amount) > 10000\nORDER BY total_spent DESC;\n```\n\nUsing EXPLAIN QUERY PLAN, you discover the orders table is doing a Full Table Scan. There is an existing idx_orders_date (order_date) index on orders.",
                                data: [
                                    ["issue": "SUBSTR(o.order_date, 1, 7)", "impact": "Function wrapping the column causes index invalidation"],
                                    ["issue": "Full Table Scan on orders", "impact": "Scanning 1M rows is extremely slow"],
                                    ["issue": "Missing index on JOIN column", "impact": "customer_id may also need an index"],
                                ],
                                dataCaption: "Performance issue analysis"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Change WHERE SUBSTR(o.order_date, 1, 7) = '2024-03' to WHERE o.order_date >= '2024-03-01' AND o.order_date < '2024-04-01', allowing the index to be used correctly (Sargable query). Also ensure customer_id has an index to speed up the JOIN.", explanation: "Correct! Applying a function (like SUBSTR) to a column in a WHERE clause causes the index to become unusable. Switching to a range query allows the database to leverage the order_date index. This is the concept of a Sargable (Search ARGument ABLE) query."),
                                Challenge.Option(id: "B", text: "Create an expression index on SUBSTR(o.order_date, 1, 7) so the original query can use the index.", explanation: "While some databases support expression indexes, SQLite has limited support. More importantly, rewriting as a range query is a more universal and simpler approach that requires no additional indexes."),
                                Challenge.Option(id: "C", text: "Remove GROUP BY and HAVING, and use a subquery to JOIN first and then filter, which reduces the scan scope.", explanation: "Incorrect. The performance bottleneck is the index invalidation in the WHERE clause, not in GROUP BY and HAVING. Even if you restructure the query, the SUBSTR-caused index problem persists."),
                                Challenge.Option(id: "D", text: "Add more memory and CPU resources, because a Full Table Scan on 1 million rows needs better hardware.", explanation: "Hardware upgrades are a last resort, not the first choice. The correct approach is to optimize queries and indexes first. Converting a Full Table Scan to an Index Scan delivers far greater improvement than hardware upgrades."),
                            ],
                            correctAnswer: "A",
                            hints: ["Applying functions (SUBSTR, YEAR, LOWER, etc.) to columns in WHERE clauses causes indexes to become unusable", "Sargable = Search ARGument ABLE = a query pattern that allows index usage", "Range queries (>= and <) can leverage B-Tree indexes"],
                            explanation: "The first step in query performance optimization is ensuring indexes are used correctly. The most common cause of index invalidation is applying functions to columns in WHERE clauses (Non-Sargable Query). SUBSTR(order_date, 1, 7) forces the database to compute SUBSTR for every row before comparing, making the index unusable. Changing to a range query order_date >= ... AND order_date < ... allows the database to perform a range scan on the B-Tree index, improving efficiency by orders of magnitude.",
                            frameworkTip: "Common causes of index invalidation: (1) Functions wrapping columns in WHERE clauses (2) Implicit type conversions (3) LIKE starting with % (4) OR conditions across multiple columns (5) NOT IN / NOT EXISTS. These are must-know performance optimization topics for interviews."
                        ),
                        Challenge(
                            id: 4,
                            name: "Slow Query Rewrite Optimization",
                            type: .code,
                            difficulty: .hard,
                            question: "Rewrite the slow query above into a more performant version using JOIN + GROUP BY instead of the correlated subquery.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Optimizing a Department Salary Report",
                                narrative: "The company has two tables: workers and departments. HR wrote a query to calculate the maximum salary per department, but it takes over 60 seconds on millions of rows.\n\nOriginal slow query:\nSELECT d.dept_name,\n       (SELECT MAX(w.salary) FROM workers w WHERE w.department_id = d.id) AS max_salary\nFROM departments d\nORDER BY max_salary DESC;\n\nThe problem: the subquery scans the workers table once per department, leading to poor performance when there are many departments.\n\nTable structure:\n- departments (id INTEGER PRIMARY KEY, dept_name TEXT)\n- workers (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use JOIN to connect departments and workers, replacing the subquery", "After GROUP BY department, use MAX(salary) to get each department's highest salary", "JOIN + GROUP BY scans the workers table only once, far more efficient than a correlated subquery"],
                            explanation: "A correlated subquery executes the inner query once for every row in the outer query. With N departments, that means N full scans of the workers table (O(N) full table scans). Rewriting with JOIN + GROUP BY requires only a single scan of the workers table to compute all department aggregates. On millions of rows, this can reduce execution time from 60 seconds to under 1 second. This is one of the most commonly tested SQL optimization patterns in interviews.",
                            frameworkTip: "First instinct for SQL optimization: when you see a correlated subquery in a SELECT or WHERE clause → consider whether it can be rewritten as JOIN + GROUP BY. This is almost always faster.",
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
                                SELECT d.dept_name, -- How to calculate max salary? AS max_salary
                                FROM departments d
                                -- How to join workers?
                                -- How to group?
                                ORDER BY max_salary DESC;
                            """,
                            expectedQuery: "SELECT d.dept_name, MAX(w.salary) AS max_salary FROM departments d JOIN workers w ON d.id = w.department_id GROUP BY d.dept_name ORDER BY max_salary DESC;"
                        ),
                        Challenge(
                            id: 5,
                            name: "Complex Aggregation and String Processing",
                            type: .code,
                            difficulty: .hard,
                            question: "Query each host's listing count, average price (rounded to the nearest integer), and total review count. Filter to hosts with 2 or more listings, sorted by total reviews in descending order.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Host Popularity and Average Pricing Analysis",
                                narrative: "You are on Airbnb's Data Team and need to analyze host popularity and pricing strategies. Each listing record has a host_name field formatted as \"First Last\". You need to group by host, then calculate each host's listing count and average nightly price.\n\nTable structure: listings (id INTEGER, host_name TEXT, neighbourhood TEXT, room_type TEXT, price REAL, minimum_nights INTEGER, reviews_count INTEGER)",
                                data: [
                                    ["id": "1", "host_name": "John Smith", "neighbourhood": "Daan", "room_type": "Entire home", "price": "3200", "reviews_count": "45"],
                                    ["id": "2", "host_name": "John Smith", "neighbourhood": "Xinyi", "room_type": "Private room", "price": "1800", "reviews_count": "32"],
                                    ["id": "3", "host_name": "Mary Chen", "neighbourhood": "Zhongshan", "room_type": "Entire home", "price": "4500", "reviews_count": "78"],
                                    ["id": "4", "host_name": "Mary Chen", "neighbourhood": "Daan", "room_type": "Entire home", "price": "5200", "reviews_count": "91"],
                                    ["id": "5", "host_name": "Mary Chen", "neighbourhood": "Songshan", "room_type": "Private room", "price": "2100", "reviews_count": "25"],
                                ],
                                dataCaption: "listings table (sample data)"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["COUNT(*) calculates each host's number of listings", "ROUND(AVG(price)) computes the average price rounded to the nearest integer", "Use HAVING to filter after GROUP BY, not WHERE"],
                            explanation: "This question comprehensively tests GROUP BY, aggregate functions (COUNT, AVG, SUM), the ROUND function, HAVING filtering, and ORDER BY sorting. The distinction between HAVING and WHERE is a high-frequency interview topic: WHERE filters before grouping (filters individual rows), while HAVING filters after grouping (filters aggregated results). Here, since \"listing count >= 2\" involves COUNT(*) — an aggregate result — you must use HAVING.",
                            frameworkTip: "The complete structure of an aggregate query: SELECT aggregate functions → FROM → WHERE (pre-grouping filter) → GROUP BY → HAVING (post-grouping filter) → ORDER BY. Writing out the full structure in an interview demonstrates solid SQL fundamentals.",
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
                                  -- listing count,
                                  -- average price (rounded),
                                  -- total reviews
                                FROM listings
                                GROUP BY host_name
                                -- filter condition?
                                -- sort order?;
                            """,
                            expectedQuery: "SELECT host_name, COUNT(*) AS listing_count, ROUND(AVG(price)) AS avg_price, SUM(reviews_count) AS total_reviews FROM listings GROUP BY host_name HAVING COUNT(*) >= 2 ORDER BY total_reviews DESC;"
                        ),
                    ]
                ),
                Quest(
                    id: "26-6",
                    name: "Boss: System Design SQL Case",
                    description: "Comprehensive challenge: full database design and system design interview",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Full Database Design",
                            type: .code,
                            difficulty: .hard,
                            question: "Design the complete database schema: create all tables with correct data types, primary keys, foreign keys, and constraints, then insert some test data to verify your design.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Database Design for an Online Course Platform",
                                narrative: "You have been hired as a backend engineer for an online course platform and need to design the complete database schema. Platform requirements:\n\n1. Users (students) can register accounts\n2. Instructors can create courses\n3. Each course has multiple lessons\n4. Students can enroll in multiple courses\n5. Student progress is tracked as they complete lessons\n\nConstraints to consider:\n- A student cannot enroll in the same course twice\n- Course price cannot be negative\n- Lesson sort_order cannot be negative\n- The progress table must record completion timestamps",
                                data: [
                                    ["table": "students", "columns": "id, name, email (unique), registered_at"],
                                    ["table": "instructors", "columns": "id, name, email (unique), bio"],
                                    ["table": "courses", "columns": "id, title, instructor_id (FK), price, created_at"],
                                    ["table": "lessons", "columns": "id, course_id (FK), title, sort_order, content"],
                                    ["table": "enrollments", "columns": "id, student_id (FK), course_id (FK), enrolled_at"],
                                    ["table": "progress", "columns": "id, enrollment_id (FK), lesson_id (FK), completed_at"],
                                ],
                                dataCaption: "Expected table structure"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["UNIQUE(student_id, course_id) prevents duplicate enrollments", "REFERENCES table_name(column) establishes a foreign key relationship", "CHECK(price >= 0) restricts the price from being negative", "Create tables without foreign key dependencies first, then tables with foreign keys"],
                            explanation: "A complete database design requires considering: (1) Entity identification — each business object maps to a table (2) Relationship establishment — use foreign keys to express 1:N and N:M relationships (3) Constraint design — PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT (4) Normalization — avoid data redundancy (5) Test verification — insert data to confirm correctness. enrollments is the many-to-many junction table between students and courses; UNIQUE(student_id, course_id) ensures no duplicate enrollments.",
                            frameworkTip: "Database design in 5 steps: (1) List all entities (2) Define attributes and types for each entity (3) Establish relationships between entities (1:1, 1:N, N:M) (4) Add constraints to prevent invalid data (5) Normalize to Third Normal Form (3NF).",
                            starterCode: """
                                -- 1. Create the students table
                                CREATE TABLE students (
                                  id INTEGER PRIMARY KEY,
                                  name TEXT NOT NULL,
                                  email TEXT UNIQUE NOT NULL,
                                  registered_at TEXT DEFAULT (datetime('now'))
                                );

                                -- 2. Create the instructors table
                                -- CREATE TABLE instructors ...

                                -- 3. Create the courses table (with foreign key)
                                -- CREATE TABLE courses ...

                                -- 4. Create the lessons table
                                -- CREATE TABLE lessons ...

                                -- 5. Create the enrollments table (prevent duplicate enrollment)
                                -- CREATE TABLE enrollments ...

                                -- 6. Create the progress table
                                -- CREATE TABLE progress ...

                                -- Insert test data and verify
                                -- INSERT INTO ...
                            """,
                            expectedQuery: "CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, registered_at TEXT DEFAULT (datetime('now'))); CREATE TABLE instructors (id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, bio TEXT); CREATE TABLE courses (id INTEGER PRIMARY KEY, title TEXT NOT NULL, instructor_id INTEGER NOT NULL REFERENCES instructors(id), price REAL DEFAULT 0 CHECK(price >= 0), created_at TEXT DEFAULT (datetime('now'))); CREATE TABLE lessons (id INTEGER PRIMARY KEY, course_id INTEGER NOT NULL REFERENCES courses(id), title TEXT NOT NULL, sort_order INTEGER CHECK(sort_order >= 0), content TEXT); CREATE TABLE enrollments (id INTEGER PRIMARY KEY, student_id INTEGER NOT NULL REFERENCES students(id), course_id INTEGER NOT NULL REFERENCES courses(id), enrolled_at TEXT DEFAULT (datetime('now')), UNIQUE(student_id, course_id)); CREATE TABLE progress (id INTEGER PRIMARY KEY, enrollment_id INTEGER NOT NULL REFERENCES enrollments(id), lesson_id INTEGER NOT NULL REFERENCES lessons(id), completed_at TEXT DEFAULT (datetime('now'))); INSERT INTO instructors VALUES (1, 'Prof. Wang', 'wang@edu.tw', 'SQL expert with 10 years of teaching experience'); INSERT INTO students VALUES (1, 'Student Chen', 'chen@mail.com', '2024-06-01'); INSERT INTO courses VALUES (1, 'SQL from Beginner to Expert', 1, 1990, '2024-06-01'); INSERT INTO lessons VALUES (1, 1, 'SELECT Basics', 1, 'Learn basic queries'); INSERT INTO lessons VALUES (2, 1, 'Advanced JOIN', 2, 'Learn multi-table joins'); INSERT INTO enrollments VALUES (1, 1, 1, '2024-06-05'); INSERT INTO progress VALUES (1, 1, 1, '2024-06-06'); SELECT s.name AS student, c.title AS course, l.title AS lesson, p.completed_at FROM progress p JOIN enrollments e ON p.enrollment_id = e.id JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id JOIN lessons l ON p.lesson_id = l.id;"
                        ),
                        Challenge(
                            id: 2,
                            name: "System Design Interview",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "Provide a complete answer to this system design interview question. Cover:\n1. Table design (Schema Design)\n2. Key SQL queries (SQL for the checkout flow)\n3. Indexing strategy (which columns need indexes and why)\n4. Concurrency control (how to handle two people ordering simultaneously)\n5. Performance considerations (bottlenecks at high order volume and solutions)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Design the Data Layer for an E-Commerce Platform",
                                narrative: "The interviewer asks: \"Please design the database layer for a simple e-commerce platform that supports the following features:\n\n1. Product management (CRUD)\n2. Shopping cart functionality\n3. Order creation (checkout from cart)\n4. Order history queries\n5. Basic inventory management (deduct stock on order placement)\n\nDescribe your table design, key queries, indexing strategy, and how you would handle concurrent orders (two people competing for the last item).\"",
                                data: [
                                    ["feature": "Product management", "tables": "products"],
                                    ["feature": "Shopping cart", "tables": "cart_items"],
                                    ["feature": "Order creation", "tables": "orders, order_items"],
                                    ["feature": "Inventory management", "tables": "products.stock"],
                                    ["feature": "Concurrency control", "tables": "Transaction + CHECK constraint"],
                                ],
                                dataCaption: "Core features and table mapping"
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CHECK(stock >= 0) prevents inventory from going negative at the database level", "The checkout flow must be completed within a Transaction", "Think about: why does order_items record price_at_purchase instead of just JOINing products?"],
                            explanation: "E-commerce database design is a classic system design interview question. Key points: (1) Order items must snapshot the price (price_at_purchase) because product prices change (2) Inventory deduction must use Transactions for atomicity (3) CHECK constraints are the first line of defense against overselling (4) Index design should follow query patterns (5) At scale, consider partitioning, caching, and read/write splitting strategies.",
                            frameworkTip: "Database design framework for system design interviews: (1) Draw an ER diagram first (2) Define tables and relationships (3) Write SQL for key flows (4) Design indexes (5) Discuss concurrency and performance (6) Propose scaling strategies. Remember to draw as you explain, demonstrating structured thinking."
                        ),
                    ]
                ),
            ]
        ),
    ]
}
