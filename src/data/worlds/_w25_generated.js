// ─────────────────────────────────────────────────────
// World 25 — SQL 進階分析（原創挑戰題）
// Window Functions、Funnel、Retention — Product Analyst 的核心 SQL 技能
// ─────────────────────────────────────────────────────

export const w25Generated = {
  id: 25,
  name: 'SQL 進階分析',
  emoji: '📊',
  description: 'Window Functions、Funnel、Retention — Product Analyst 的核心 SQL 技能',
  color: 'from-blue-500 to-indigo-500',
  quests: [
    /* ═══════════════════════════════════════════════════
       Quest 25-1  Window Functions 實戰
       ═══════════════════════════════════════════════════ */
    {
      id: '25-1',
      name: 'Window Functions 實戰',
      description: 'ROW_NUMBER、RANK、累計加總、LAG/LEAD — 掌握視窗函數的核心用法',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. ROW_NUMBER 排名 ──
        {
          id: 1,
          name: 'ROW_NUMBER 排名',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '各部門業績排名',
            narrative:
              '電商平台的營運主管想看每個產品類別中，銷售額最高的商品排名。你需要用 ROW_NUMBER 搭配 PARTITION BY 在每個類別內做排名。\n\n資料表：product_sales (product_id INTEGER, category TEXT, product_name TEXT, total_sales REAL)',
            data: [
              { product_id: 1, category: '電子產品', product_name: '藍牙耳機', total_sales: 58000 },
              { product_id: 2, category: '電子產品', product_name: '無線滑鼠', total_sales: 32000 },
              { product_id: 3, category: '生活用品', product_name: '保溫杯', total_sales: 45000 },
              { product_id: 4, category: '生活用品', product_name: '收納盒', total_sales: 28000 },
              { product_id: 5, category: '電子產品', product_name: '行動電源', total_sales: 41000 },
            ],
            dataCaption: 'product_sales 資料表（部分範例）',
          },
          question:
            '用 ROW_NUMBER 搭配 PARTITION BY category，在每個類別內根據 total_sales 由高到低排名。顯示 category, product_name, total_sales, category_rank。',
          sampleSchema: `
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
          `,
          starterCode:
            "SELECT category, product_name, total_sales,\n       ROW_NUMBER() OVER (\n         -- 每個類別內分別排名\n         -- 按銷售額由高到低\n       ) AS category_rank\nFROM product_sales\nORDER BY category, category_rank;",
          expectedQuery:
            "SELECT category, product_name, total_sales, ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_rank FROM product_sales ORDER BY category, category_rank;",
          hints: [
            'PARTITION BY category 會讓排名在每個類別內重新開始',
            'ORDER BY total_sales DESC 在 OVER() 裡面，代表排名依據',
            'ROW_NUMBER 每行都有唯一編號，即使值相同也不會並列',
          ],
          explanation:
            'ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) 會在每個類別內根據銷售額由高到低分配 1, 2, 3... 的編號。PARTITION BY 決定分組範圍，ORDER BY 決定排名依據。這是 Window Functions 最基礎也最常用的模式。',
          frameworkTip:
            'Window Function 三要素：函數（ROW_NUMBER）、分割（PARTITION BY）、排序（ORDER BY）。面試時先說出這三個部分，再寫 SQL。',
        },

        // ── 2. 累計加總 Running Total ──
        {
          id: 2,
          name: '累計加總 Running Total',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '每日營收累計追蹤',
            narrative:
              '財務團隊需要追蹤每天的營收累計，用來判斷是否能在月底前達到目標。你需要用 SUM() OVER 計算每天的累積營收。\n\n資料表：daily_revenue (revenue_date TEXT, revenue REAL)',
            data: [
              { revenue_date: '2026-03-01', revenue: 12500 },
              { revenue_date: '2026-03-02', revenue: 8300 },
              { revenue_date: '2026-03-03', revenue: 15700 },
              { revenue_date: '2026-03-04', revenue: 9100 },
              { revenue_date: '2026-03-05', revenue: 22000 },
            ],
            dataCaption: 'daily_revenue 資料表（部分範例）',
          },
          question:
            '計算每天的營收以及到該天為止的累計營收（running_total）。按日期排序顯示 revenue_date, revenue, running_total。',
          sampleSchema: `
CREATE TABLE daily_revenue (revenue_date TEXT, revenue REAL);
INSERT INTO daily_revenue VALUES ('2026-03-01', 12500);
INSERT INTO daily_revenue VALUES ('2026-03-02', 8300);
INSERT INTO daily_revenue VALUES ('2026-03-03', 15700);
INSERT INTO daily_revenue VALUES ('2026-03-04', 9100);
INSERT INTO daily_revenue VALUES ('2026-03-05', 22000);
INSERT INTO daily_revenue VALUES ('2026-03-06', 11200);
INSERT INTO daily_revenue VALUES ('2026-03-07', 19800);
          `,
          starterCode:
            "SELECT revenue_date, revenue,\n       SUM(revenue) OVER (\n         -- 如何定義累計的範圍？\n       ) AS running_total\nFROM daily_revenue\nORDER BY revenue_date;",
          expectedQuery:
            "SELECT revenue_date, revenue, SUM(revenue) OVER (ORDER BY revenue_date) AS running_total FROM daily_revenue ORDER BY revenue_date;",
          hints: [
            'SUM() OVER (ORDER BY ...) 會自動累加到當前行',
            '不需要 PARTITION BY，因為是全體累計',
            'ORDER BY revenue_date 讓累計按日期順序加上去',
          ],
          explanation:
            'SUM(revenue) OVER (ORDER BY revenue_date) 會從第一筆開始，逐行累加 revenue。這就是 Running Total（累計加總），是 Window Function 最經典的用法之一。預設的 frame 是 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW，也就是從最前面加到當前行。',
          frameworkTip:
            '面試時常見的 follow-up：「如果要算 7 天移動平均呢？」答案是加上 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW。',
        },

        // ── 3. LAG/LEAD 比較前後 ──
        {
          id: 3,
          name: 'LAG/LEAD 比較前後',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '月營收環比成長率',
            narrative:
              '管理層要求每月報表上顯示「跟上個月相比成長了多少百分比」。你需要用 LAG 函數取得上個月的營收，再計算環比成長率。\n\n資料表：monthly_revenue (month TEXT, revenue REAL)',
            data: [
              { month: '2025-10', revenue: 320000 },
              { month: '2025-11', revenue: 285000 },
              { month: '2025-12', revenue: 410000 },
              { month: '2026-01', revenue: 375000 },
              { month: '2026-02', revenue: 398000 },
            ],
            dataCaption: 'monthly_revenue 資料表（部分範例）',
          },
          question:
            '用 LAG 取得上個月營收，計算環比成長率（百分比，保留一位小數）。顯示 month, revenue, prev_revenue, growth_rate。第一個月的 prev_revenue 和 growth_rate 可以是 NULL。',
          sampleSchema: `
CREATE TABLE monthly_revenue (month TEXT, revenue REAL);
INSERT INTO monthly_revenue VALUES ('2025-07', 280000);
INSERT INTO monthly_revenue VALUES ('2025-08', 310000);
INSERT INTO monthly_revenue VALUES ('2025-09', 295000);
INSERT INTO monthly_revenue VALUES ('2025-10', 320000);
INSERT INTO monthly_revenue VALUES ('2025-11', 285000);
INSERT INTO monthly_revenue VALUES ('2025-12', 410000);
INSERT INTO monthly_revenue VALUES ('2026-01', 375000);
INSERT INTO monthly_revenue VALUES ('2026-02', 398000);
          `,
          starterCode:
            "SELECT month, revenue,\n       LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue,\n       -- 計算成長率：(本月 - 上月) / 上月 * 100\n       ROUND(\n         -- 你的公式\n       , 1) AS growth_rate\nFROM monthly_revenue\nORDER BY month;",
          expectedQuery:
            "SELECT month, revenue, LAG(revenue, 1) OVER (ORDER BY month) AS prev_revenue, ROUND((revenue - LAG(revenue, 1) OVER (ORDER BY month)) * 100.0 / LAG(revenue, 1) OVER (ORDER BY month), 1) AS growth_rate FROM monthly_revenue ORDER BY month;",
          hints: [
            'LAG(revenue, 1) OVER (ORDER BY month) 取前一行的 revenue',
            '成長率公式：(本月 - 上月) / 上月 * 100',
            '第一行沒有前一行，LAG 會自動回傳 NULL',
          ],
          explanation:
            'LAG(column, offset) 讓你可以在同一行中存取「前 N 行」的資料，LEAD 則是「後 N 行」。這裡用 LAG(revenue, 1) 取得上個月營收，再用 (revenue - prev) / prev * 100 計算成長率。這是 MoM（Month-over-Month）分析的核心 SQL 模式，面試超常考。',
          frameworkTip:
            'LAG 看過去，LEAD 看未來。面試時可以主動提到：「如果要跟去年同期比（YoY），用 LAG(revenue, 12)。」',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-2  Funnel Analysis
       ═══════════════════════════════════════════════════ */
    {
      id: '25-2',
      name: 'Funnel Analysis',
      description: '轉換漏斗分析 — 計算每一步的轉換率與流失率',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. 基本 Funnel 查詢 ──
        {
          id: 1,
          name: '基本 Funnel 查詢',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '電商購買漏斗轉換率',
            narrative:
              '產品經理想了解從「瀏覽商品」到「完成付款」的每一步轉換率。事件記錄在 user_events 表中，有四個步驟：view（瀏覽）、add_to_cart（加入購物車）、checkout（結帳）、payment（付款）。\n\n資料表：user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)',
            data: [
              { event_id: 1, user_id: 101, event_name: 'view', event_date: '2026-03-01' },
              { event_id: 2, user_id: 101, event_name: 'add_to_cart', event_date: '2026-03-01' },
              { event_id: 3, user_id: 101, event_name: 'checkout', event_date: '2026-03-01' },
              { event_id: 4, user_id: 101, event_name: 'payment', event_date: '2026-03-01' },
              { event_id: 5, user_id: 102, event_name: 'view', event_date: '2026-03-01' },
              { event_id: 6, user_id: 102, event_name: 'add_to_cart', event_date: '2026-03-02' },
            ],
            dataCaption: 'user_events 資料表（部分範例）',
          },
          question:
            '用 COUNT(DISTINCT CASE WHEN ...) 計算每個漏斗步驟的不重複用戶數，並計算每步相對於第一步（view）的轉換率（百分比，保留一位小數）。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH funnel AS (\n  SELECT\n    COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view,\n    -- 補完其他三個步驟\n  FROM user_events\n)\nSELECT\n  step1_view,\n  step2_cart,\n  step3_checkout,\n  step4_payment,\n  -- 計算每步相對於 step1 的轉換率\nFROM funnel;",
          expectedQuery:
            "WITH funnel AS (SELECT COUNT(DISTINCT CASE WHEN event_name = 'view' THEN user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN event_name = 'checkout' THEN user_id END) AS step3_checkout, COUNT(DISTINCT CASE WHEN event_name = 'payment' THEN user_id END) AS step4_payment FROM user_events) SELECT step1_view, step2_cart, step3_checkout, step4_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_checkout * 100.0 / step1_view, 1) AS checkout_rate, ROUND(step4_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;",
          hints: [
            'COUNT(DISTINCT CASE WHEN event_name = \'add_to_cart\' THEN user_id END) 計算加入購物車的不重複用戶數',
            '轉換率 = 該步驟用戶數 / 第一步用戶數 * 100',
            'CTE 先算出每步人數，外層再算比率，SQL 更清楚',
          ],
          explanation:
            'Funnel 分析的核心模式是 COUNT(DISTINCT CASE WHEN ... THEN user_id END)。每個 CASE WHEN 對應一個漏斗步驟，COUNT DISTINCT 確保同一用戶只計一次。用 CTE 把漏斗數字算好後，外層再算轉換率。這是 Product Analyst 面試的經典題型。',
          frameworkTip:
            'Funnel 分析三步驟：(1) 定義步驟 (2) COUNT DISTINCT 算每步人數 (3) 算轉換率。面試時用 CTE 分層寫，更好閱讀。',
        },

        // ── 2. 分群 Funnel 比較 ──
        {
          id: 2,
          name: '分群 Funnel 比較',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '新舊用戶轉換漏斗對比',
            narrative:
              'PM 想知道新用戶和回訪用戶在購買漏斗上的轉換率有什麼差異，以便決定是優化新客引導還是提升老客回購。你需要先判斷用戶類型（首次造訪 vs 回訪），再分別計算漏斗。\n\n資料表：\n- user_events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- users (user_id INTEGER, first_visit_date TEXT)',
            data: [
              { user_id: 101, first_visit_date: '2026-03-01', type: '新用戶' },
              { user_id: 102, first_visit_date: '2026-01-15', type: '回訪用戶' },
              { user_id: 103, first_visit_date: '2026-03-02', type: '新用戶' },
            ],
            dataCaption: 'users 資料表（部分範例，type 欄位為說明用）',
          },
          question:
            '先用 CASE WHEN 判斷用戶是「新用戶」（first_visit_date 在 2026-03 月）或「回訪用戶」，再分群計算 view → add_to_cart → payment 的轉換率。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH user_type AS (\n  SELECT user_id,\n         CASE\n           WHEN first_visit_date >= '2026-03-01' THEN '新用戶'\n           ELSE '回訪用戶'\n         END AS segment\n  FROM users\n),\nfunnel AS (\n  SELECT ut.segment,\n         -- 計算每個 segment 的 view, add_to_cart, payment 人數\n  FROM user_events e\n  JOIN user_type ut ON e.user_id = ut.user_id\n  GROUP BY ut.segment\n)\nSELECT segment,\n       step1_view, step2_cart, step3_payment,\n       -- 計算轉換率\nFROM funnel;",
          expectedQuery:
            "WITH user_type AS (SELECT user_id, CASE WHEN first_visit_date >= '2026-03-01' THEN '新用戶' ELSE '回訪用戶' END AS segment FROM users), funnel AS (SELECT ut.segment, COUNT(DISTINCT CASE WHEN e.event_name = 'view' THEN e.user_id END) AS step1_view, COUNT(DISTINCT CASE WHEN e.event_name = 'add_to_cart' THEN e.user_id END) AS step2_cart, COUNT(DISTINCT CASE WHEN e.event_name = 'payment' THEN e.user_id END) AS step3_payment FROM user_events e JOIN user_type ut ON e.user_id = ut.user_id GROUP BY ut.segment) SELECT segment, step1_view, step2_cart, step3_payment, ROUND(step2_cart * 100.0 / step1_view, 1) AS cart_rate, ROUND(step3_payment * 100.0 / step1_view, 1) AS payment_rate FROM funnel;",
          hints: [
            '先用 CTE 把每個用戶分成新用戶或回訪用戶',
            '在 funnel CTE 中 GROUP BY segment，每個群組分別計算漏斗',
            '最後外層算轉換率，就能直接比較兩群的差異',
          ],
          explanation:
            '分群 Funnel 是 Product Analyst 的常見需求。關鍵是先建一個 user_type CTE 定義分群邏輯，再 JOIN 到事件表上。GROUP BY segment 讓每個群組獨立計算漏斗。這樣就能比較新舊用戶的轉換率差異，找出優化方向。',
          frameworkTip:
            '面試答 Funnel 題時的加分點：主動提出「是否要分群比較？例如新舊用戶、不同渠道、不同地區」。這展現了分析思維。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-3  Segmentation
       ═══════════════════════════════════════════════════ */
    {
      id: '25-3',
      name: 'Segmentation',
      description: 'NTILE 分群、CASE WHEN 行為分群 — 用 SQL 做用戶分群',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. NTILE 分群 ──
        {
          id: 1,
          name: 'NTILE 分群',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '用戶消費金額四分位分群',
            narrative:
              '行銷團隊想把用戶依消費金額分成四個等級（前 25% 為 VIP、25-50% 為高價值、50-75% 為一般、後 25% 為低活躍），以便制定不同的行銷策略。你需要用 NTILE 將用戶分成四組。\n\n資料表：user_spending (user_id INTEGER, user_name TEXT, total_amount REAL)',
            data: [
              { user_id: 1, user_name: '王小明', total_amount: 85200 },
              { user_id: 2, user_name: '李美玲', total_amount: 42300 },
              { user_id: 3, user_name: '張大維', total_amount: 128500 },
              { user_id: 4, user_name: '陳怡君', total_amount: 15800 },
              { user_id: 5, user_name: '林志豪', total_amount: 67400 },
            ],
            dataCaption: 'user_spending 資料表（部分範例）',
          },
          question:
            '用 NTILE(4) 將用戶依 total_amount 由高到低分成四組（1=前 25%, 4=後 25%），再用 CASE WHEN 轉成中文標籤。顯示 user_name, total_amount, quartile, segment_label。',
          sampleSchema: `
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
          `,
          starterCode:
            "SELECT user_name, total_amount,\n       NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile,\n       CASE NTILE(4) OVER (ORDER BY total_amount DESC)\n         -- 1 = VIP, 2 = 高價值, 3 = 一般, 4 = 低活躍\n       END AS segment_label\nFROM user_spending\nORDER BY total_amount DESC;",
          expectedQuery:
            "SELECT user_name, total_amount, NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile, CASE NTILE(4) OVER (ORDER BY total_amount DESC) WHEN 1 THEN 'VIP' WHEN 2 THEN '高價值' WHEN 3 THEN '一般' WHEN 4 THEN '低活躍' END AS segment_label FROM user_spending ORDER BY total_amount DESC;",
          hints: [
            'NTILE(4) 把資料平均分成 4 組，第 1 組是最高的 25%',
            'CASE NTILE(4) OVER (...) WHEN 1 THEN ... 可以直接對結果做標籤',
            'ORDER BY total_amount DESC 讓金額最高的排在第 1 組',
          ],
          explanation:
            'NTILE(n) 是分群分析的利器。它把排序後的資料盡量平均分成 n 組。NTILE(4) 就是四分位數分群。搭配 CASE WHEN 可以把數字轉成有意義的標籤。在 RFM 分析中，經常用 NTILE 來把 Recency、Frequency、Monetary 各切成若干組。',
          frameworkTip:
            'NTILE 的限制：如果資料量不能被 n 整除，前面的組會多一個。面試時可以提到這個 edge case。',
        },

        // ── 2. CASE WHEN 行為分群 ──
        {
          id: 2,
          name: 'CASE WHEN 行為分群',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '用戶活躍度分群',
            narrative:
              '產品團隊想根據用戶過去 30 天的行為（登入次數 + 操作次數）做活躍度分群。規則如下：\n- Power User：登入 >= 20 次 且 操作 >= 50 次\n- Active：登入 >= 10 次 且 操作 >= 20 次\n- Casual：登入 >= 3 次\n- Dormant：其餘\n\n資料表：user_activity (user_id INTEGER, user_name TEXT, login_count INTEGER, action_count INTEGER)',
            data: [
              { user_id: 1, user_name: '小明', login_count: 25, action_count: 80, segment: 'Power User' },
              { user_id: 2, user_name: '美玲', login_count: 12, action_count: 35, segment: 'Active' },
              { user_id: 3, user_name: '大維', login_count: 5, action_count: 8, segment: 'Casual' },
              { user_id: 4, user_name: '怡君', login_count: 1, action_count: 2, segment: 'Dormant' },
            ],
            dataCaption: 'user_activity 資料表（部分範例，segment 為預期結果）',
          },
          question:
            '用 CASE WHEN 根據上述規則將用戶分群。顯示 user_name, login_count, action_count, segment。再統計每個 segment 的用戶數。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH segmented AS (\n  SELECT user_name, login_count, action_count,\n         CASE\n           -- 根據規則分群\n         END AS segment\n  FROM user_activity\n)\nSELECT segment, COUNT(*) AS user_count\nFROM segmented\nGROUP BY segment\nORDER BY user_count DESC;",
          expectedQuery:
            "WITH segmented AS (SELECT user_name, login_count, action_count, CASE WHEN login_count >= 20 AND action_count >= 50 THEN 'Power User' WHEN login_count >= 10 AND action_count >= 20 THEN 'Active' WHEN login_count >= 3 THEN 'Casual' ELSE 'Dormant' END AS segment FROM user_activity) SELECT segment, COUNT(*) AS user_count FROM segmented GROUP BY segment ORDER BY user_count DESC;",
          hints: [
            'CASE WHEN 的條件順序很重要 — 先判斷最嚴格的條件',
            'Power User 的條件最嚴格，要放第一個',
            '用 CTE 先建立分群結果，外層再做聚合統計',
          ],
          explanation:
            'CASE WHEN 行為分群的關鍵是條件順序：從最嚴格到最寬鬆。因為 CASE WHEN 會在第一個符合的條件就停止，所以 Power User（最嚴格）要放最前面。用 CTE 先分群、再聚合是常見的兩步模式。',
          frameworkTip:
            '面試中分群題的思路：(1) 定義分群規則 (2) 確認條件優先順序 (3) CASE WHEN 實作 (4) 用 GROUP BY 統計各群人數與指標。',
        },

        // ── 3. 分群策略選擇（MC）──
        {
          id: 3,
          name: '分群策略選擇',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '選擇正確的分群方法',
            narrative:
              '你是一位 Product Analyst，PM 提出了不同的分群需求。你需要判斷哪種 SQL 分群方法最適合。',
          },
          question:
            'PM 想把用戶按「最近一次購買距今天數」、「購買頻率」、「累計消費金額」三個維度各分成 5 等份，再組合成一個綜合分群。這是哪種分群方法？應該用哪個 SQL 函數？',
          options: [
            { id: 'A', text: 'CASE WHEN 硬編碼分群，手動設定每個維度的閾值', explanation: 'CASE WHEN 適合規則明確的分群，但 RFM 需要動態分位數，硬編碼不夠彈性。' },
            { id: 'B', text: 'NTILE(5) 搭配 PARTITION BY 各維度，做 RFM 分群', explanation: '正確！RFM 分群的標準做法是用 NTILE 對 Recency、Frequency、Monetary 各自做分位數切割，再組合成 RFM Score。' },
            { id: 'C', text: 'ROW_NUMBER 排名後取 TOP N 用戶', explanation: 'ROW_NUMBER 適合取排名，但不適合做分位數分群。' },
            { id: 'D', text: 'GROUP BY 三個維度直接聚合', explanation: 'GROUP BY 會產生太多組合，不是分群的正確方法。' },
          ],
          correctAnswer: 'B',
          hints: [
            'RFM = Recency, Frequency, Monetary',
            '需要把連續數值切成等份的需求，想到 NTILE',
            '三個維度各切 5 等份 → NTILE(5) 用三次',
          ],
          explanation:
            'RFM 分群是經典的用戶分群框架。R（Recency 最近購買距今）、F（Frequency 購買頻率）、M（Monetary 消費金額）各用 NTILE(5) 分成 5 組，組合後就是 RFM Score（例如 5-5-5 是最有價值的用戶）。NTILE 是做分位數分群的最佳工具。',
          frameworkTip:
            'RFM 是 Product Analyst 必知的分群框架。面試時聽到「用戶價值分群」就想到 RFM + NTILE。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-4  Retention / Cohort Analysis
       ═══════════════════════════════════════════════════ */
    {
      id: '25-4',
      name: 'Retention / Cohort Analysis',
      description: '留存率與 Cohort 分析 — 追蹤用戶是否持續回來',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. 月活躍留存率 ──
        {
          id: 1,
          name: '月活躍留存率',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '計算月留存率',
            narrative:
              '產品負責人想知道「本月活躍的用戶中，有多少比例下個月還會回來」。你需要找出每個月的活躍用戶，再比對下個月是否還活躍，計算留存率。\n\n資料表：user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)',
            data: [
              { action_id: 1, user_id: 101, action_date: '2025-11-05' },
              { action_id: 2, user_id: 101, action_date: '2025-12-10' },
              { action_id: 3, user_id: 102, action_date: '2025-11-08' },
              { action_id: 4, user_id: 103, action_date: '2025-11-15' },
              { action_id: 5, user_id: 103, action_date: '2025-12-20' },
            ],
            dataCaption: 'user_actions 資料表（部分範例）',
          },
          question:
            '計算每個月的活躍用戶數、下個月還活躍的用戶數、以及月留存率（百分比，保留一位小數）。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH monthly_active AS (\n  -- 每月有哪些活躍用戶（去重）\n  SELECT DISTINCT user_id,\n         SUBSTR(action_date, 1, 7) AS active_month\n  FROM user_actions\n)\nSELECT\n  m1.active_month,\n  COUNT(DISTINCT m1.user_id) AS active_users,\n  -- 下個月還活躍的用戶數？\n  -- 留存率？\nFROM monthly_active m1\n-- 怎麼找到「下個月也活躍」的用戶？\nGROUP BY m1.active_month\nORDER BY m1.active_month;",
          expectedQuery:
            "WITH monthly_active AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions) SELECT m1.active_month, COUNT(DISTINCT m1.user_id) AS active_users, COUNT(DISTINCT m2.user_id) AS retained_users, ROUND(COUNT(DISTINCT m2.user_id) * 100.0 / COUNT(DISTINCT m1.user_id), 1) AS retention_rate FROM monthly_active m1 LEFT JOIN monthly_active m2 ON m1.user_id = m2.user_id AND m2.active_month = SUBSTR(DATE(m1.active_month || '-01', '+1 month'), 1, 7) GROUP BY m1.active_month ORDER BY m1.active_month;",
          hints: [
            '用 LEFT JOIN 自連接 monthly_active，把本月和下個月配對',
            'SQLite 中下個月：SUBSTR(DATE(active_month || \'-01\', \'+1 month\'), 1, 7)',
            'LEFT JOIN 確保即使沒有留存用戶的月份也會顯示（留存 = 0）',
          ],
          explanation:
            '月留存率的核心是自連接：把同一用戶的本月活躍記錄和下月活躍記錄配對。用 LEFT JOIN 確保即使沒有留存也會顯示。COUNT(DISTINCT m2.user_id) 只計算有匹配的（下月也活躍的）用戶。留存率 = 留存人數 / 本月活躍人數。',
          frameworkTip:
            '留存率的思路：先建「月 x 用戶」的去重表，再用自連接比對前後月。這個模式可以推廣到「週留存」、「日留存」。',
        },

        // ── 2. Cohort Retention 矩陣 ──
        {
          id: 2,
          name: 'Cohort Retention 矩陣',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '建立 Cohort 留存矩陣',
            narrative:
              '產品團隊需要一個 Cohort Retention 矩陣：橫軸是「註冊後的第 N 個月」，縱軸是「註冊月份的 Cohort」，格子裡是留存率。這是 Product Analytics 的核心報表。\n\n資料表：\n- user_signups (user_id INTEGER, signup_date TEXT)\n- user_actions (action_id INTEGER, user_id INTEGER, action_date TEXT)',
            data: [
              { cohort: '2025-10', month_0: '100%', month_1: '62%', month_2: '45%' },
              { cohort: '2025-11', month_0: '100%', month_1: '58%', month_2: '-' },
              { cohort: '2025-12', month_0: '100%', month_1: '-', month_2: '-' },
            ],
            dataCaption: 'Cohort Retention 矩陣（預期輸出格式）',
          },
          question:
            '建立 Cohort Retention 報表：每個 Cohort（註冊月份）在第 0, 1, 2 個月後的活躍用戶數與留存率。顯示 cohort_month, month_number, active_users, cohort_size, retention_rate。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH cohorts AS (\n  -- 每位用戶的 cohort（註冊月）\n  SELECT user_id,\n         SUBSTR(signup_date, 1, 7) AS cohort_month\n  FROM user_signups\n),\nuser_monthly AS (\n  -- 每位用戶每月的活躍記錄\n  SELECT DISTINCT user_id,\n         SUBSTR(action_date, 1, 7) AS active_month\n  FROM user_actions\n),\ncohort_activity AS (\n  SELECT c.cohort_month,\n         -- 計算 month_number（活躍月 - 註冊月）\n         um.active_month,\n         c.user_id\n  FROM cohorts c\n  JOIN user_monthly um ON c.user_id = um.user_id\n)\n-- 最終聚合：每個 cohort x month_number 的留存率\nSELECT cohort_month, month_number,\n       COUNT(DISTINCT user_id) AS active_users,\n       -- cohort_size 和 retention_rate\nFROM cohort_activity\nGROUP BY cohort_month, month_number\nORDER BY cohort_month, month_number;",
          expectedQuery:
            "WITH cohorts AS (SELECT user_id, SUBSTR(signup_date, 1, 7) AS cohort_month FROM user_signups), cohort_size AS (SELECT cohort_month, COUNT(*) AS size FROM cohorts GROUP BY cohort_month), user_monthly AS (SELECT DISTINCT user_id, SUBSTR(action_date, 1, 7) AS active_month FROM user_actions), cohort_activity AS (SELECT c.cohort_month, CAST((JULIANDAY(um.active_month || '-01') - JULIANDAY(c.cohort_month || '-01')) / 30 AS INTEGER) AS month_number, c.user_id FROM cohorts c JOIN user_monthly um ON c.user_id = um.user_id) SELECT ca.cohort_month, ca.month_number, COUNT(DISTINCT ca.user_id) AS active_users, cs.size AS cohort_size, ROUND(COUNT(DISTINCT ca.user_id) * 100.0 / cs.size, 1) AS retention_rate FROM cohort_activity ca JOIN cohort_size cs ON ca.cohort_month = cs.cohort_month GROUP BY ca.cohort_month, ca.month_number ORDER BY ca.cohort_month, ca.month_number;",
          hints: [
            '用 JULIANDAY 計算兩個月份之間的差距（除以 30 取整數 = 月數）',
            '需要一個 cohort_size CTE 記錄每個 Cohort 的初始人數',
            'retention_rate = 該月活躍人數 / Cohort 初始人數 * 100',
          ],
          explanation:
            'Cohort Retention 矩陣是 Product Analytics 的「聖杯報表」。步驟：(1) 定義 Cohort（註冊月份）(2) 計算每人每月活躍狀態 (3) 算出 month_number（距註冊幾個月）(4) 聚合出每個 Cohort x month_number 的留存率。JULIANDAY 差值除以 30 是 SQLite 中算月份差的技巧。',
          frameworkTip:
            '面試時 Cohort 分析三步驟：(1) 定義 Cohort 維度（通常是註冊月）(2) 定義活躍事件 (3) 用 month_number 攤開留存。這個框架適用於所有留存分析。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-5  KPI 與 Dashboard Query Design
       ═══════════════════════════════════════════════════ */
    {
      id: '25-5',
      name: 'KPI 與 Dashboard Query Design',
      description: 'DAU/MAU、ARPU、轉換率 — 用 SQL 定義與計算產品核心指標',
      xp: 50,
      isBoss: false,
      challenges: [
        // ── 1. DAU / MAU 計算 ──
        {
          id: 1,
          name: 'DAU / MAU 計算',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '計算每日與每月活躍用戶',
            narrative:
              '你正在為產品 Dashboard 建立核心指標查詢。第一個需求是計算 DAU（Daily Active Users）和 MAU（Monthly Active Users），以及 DAU/MAU 比率（也叫 Stickiness，代表用戶黏著度）。\n\n資料表：app_events (event_id INTEGER, user_id INTEGER, event_date TEXT, event_type TEXT)',
            data: [
              { event_id: 1, user_id: 101, event_date: '2026-03-01', event_type: 'login' },
              { event_id: 2, user_id: 102, event_date: '2026-03-01', event_type: 'view' },
              { event_id: 3, user_id: 101, event_date: '2026-03-02', event_type: 'click' },
              { event_id: 4, user_id: 103, event_date: '2026-03-02', event_type: 'login' },
            ],
            dataCaption: 'app_events 資料表（部分範例）',
          },
          question:
            '計算 2026 年 3 月的每日 DAU（每天不重複活躍用戶數），以及整月的 MAU 和平均 DAU/MAU 比率（保留兩位小數）。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH daily_active AS (\n  -- 每天的 DAU\n  SELECT event_date,\n         COUNT(DISTINCT user_id) AS dau\n  FROM app_events\n  WHERE event_date LIKE '2026-03%'\n  GROUP BY event_date\n),\nmau AS (\n  -- 整月的 MAU\n  SELECT COUNT(DISTINCT user_id) AS mau\n  FROM app_events\n  WHERE event_date LIKE '2026-03%'\n)\n-- 計算平均 DAU 和 DAU/MAU 比率\nSELECT\n  -- 平均 DAU, MAU, DAU/MAU\nFROM daily_active, mau;",
          expectedQuery:
            "WITH daily_active AS (SELECT event_date, COUNT(DISTINCT user_id) AS dau FROM app_events WHERE event_date LIKE '2026-03%' GROUP BY event_date), mau AS (SELECT COUNT(DISTINCT user_id) AS mau FROM app_events WHERE event_date LIKE '2026-03%') SELECT ROUND(AVG(da.dau), 1) AS avg_dau, mau.mau, ROUND(AVG(da.dau) * 1.0 / mau.mau, 2) AS stickiness FROM daily_active da, mau;",
          hints: [
            'DAU = 每天的 COUNT(DISTINCT user_id)',
            'MAU = 整月的 COUNT(DISTINCT user_id)',
            'Stickiness = 平均 DAU / MAU，數值越高代表用戶越黏著',
          ],
          explanation:
            'DAU/MAU（又稱 Stickiness）是衡量產品黏著度的核心指標。如果 DAU/MAU = 0.5，代表平均每月有一半的月活用戶每天都在用。社群產品通常在 0.3-0.6 之間。用兩個 CTE 分別算 DAU 和 MAU，最後交叉計算比率。',
          frameworkTip:
            'Dashboard 指標三層：(1) 流量指標 DAU/MAU (2) 互動指標 Session 長度、事件數 (3) 商業指標 ARPU、轉換率。面試時按層次回答更有結構。',
        },

        // ── 2. 轉換率與 ARPU ──
        {
          id: 2,
          name: '轉換率與 ARPU',
          type: 'code',
          difficulty: 'medium',
          scenario: {
            title: '計算付費轉換率與 ARPU',
            narrative:
              '商業分析師需要在 Dashboard 上顯示兩個關鍵指標：付費轉換率（Conversion Rate = 付費用戶數 / 總活躍用戶數）和 ARPU（Average Revenue Per User = 總營收 / 總活躍用戶數）。\n\n資料表：\n- active_users (user_id INTEGER, active_month TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)',
            data: [
              { metric: 'total_active', value: 1000 },
              { metric: 'paying_users', value: 150 },
              { metric: 'total_revenue', value: 75000 },
              { metric: 'conversion_rate', value: '15.0%' },
              { metric: 'arpu', value: 75.0 },
            ],
            dataCaption: '預期指標（範例數據）',
          },
          question:
            '計算 2026 年 3 月的付費轉換率和 ARPU。顯示 total_active_users, paying_users, total_revenue, conversion_rate（百分比，保留一位小數）, arpu（保留兩位小數）。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH metrics AS (\n  SELECT\n    (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active,\n    -- 付費用戶數（有付款記錄的不重複用戶）\n    -- 總營收\n)\nSELECT total_active AS total_active_users,\n       paying_users,\n       total_revenue,\n       -- conversion_rate 和 arpu\nFROM metrics;",
          expectedQuery:
            "WITH metrics AS (SELECT (SELECT COUNT(*) FROM active_users WHERE active_month = '2026-03') AS total_active, (SELECT COUNT(DISTINCT user_id) FROM payments WHERE payment_date LIKE '2026-03%') AS paying_users, (SELECT COALESCE(SUM(amount), 0) FROM payments WHERE payment_date LIKE '2026-03%') AS total_revenue) SELECT total_active AS total_active_users, paying_users, total_revenue, ROUND(paying_users * 100.0 / total_active, 1) AS conversion_rate, ROUND(total_revenue * 1.0 / total_active, 2) AS arpu FROM metrics;",
          hints: [
            '付費用戶數 = COUNT(DISTINCT user_id) FROM payments',
            'ARPU 的分母是「所有活躍用戶」，不只是付費用戶',
            '用子查詢在 CTE 中分別計算三個基礎數字',
          ],
          explanation:
            '轉換率 = 付費用戶數 / 總活躍用戶數，ARPU = 總營收 / 總活躍用戶數。注意 ARPU 的分母是「全部活躍用戶」（包含未付費的），而不是只有付費用戶（那是 ARPPU）。面試時常考的 follow-up 就是 ARPU vs ARPPU 的區別。',
          frameworkTip:
            'ARPU vs ARPPU：ARPU = Revenue / All Users，ARPPU = Revenue / Paying Users。面試時說明兩者差異會加分。',
        },

        // ── 3. Dashboard 指標設計（MC）──
        {
          id: 3,
          name: 'Dashboard 指標設計',
          type: 'multiple-choice',
          difficulty: 'medium',
          scenario: {
            title: '選擇正確的 Dashboard 指標',
            narrative:
              '你正在為一個 SaaS 產品設計 Executive Dashboard。CEO 想看「產品健康度」的核心指標。目前有以下選項：',
          },
          question:
            '以下哪組指標最適合作為 SaaS 產品的「北極星指標 + 支撐指標」？',
          options: [
            {
              id: 'A',
              text: 'DAU + 頁面載入速度 + 伺服器錯誤率',
              explanation: '頁面載入速度和錯誤率是 Engineering 指標，不是產品健康度的核心。',
            },
            {
              id: 'B',
              text: 'MAU + DAU/MAU + 付費轉換率 + MRR',
              explanation: '正確！MAU 衡量規模，DAU/MAU 衡量黏著度，轉換率衡量變現效率，MRR 衡量營收。這四個指標覆蓋了用戶規模、互動品質、商業價值三個層面。',
            },
            {
              id: 'C',
              text: '註冊人數 + 總營收 + 客服回覆時間',
              explanation: '這些指標太分散，沒有衡量用戶活躍度和黏著度。',
            },
            {
              id: 'D',
              text: 'NPS 分數 + 功能使用率 + Bug 修復速度',
              explanation: 'NPS 是用戶滿意度指標，但不是產品健康度的核心 KPI。Bug 修復速度是工程指標。',
            },
          ],
          correctAnswer: 'B',
          hints: [
            '好的指標組合要覆蓋：規模、互動、變現',
            'SaaS 核心指標通常包含 MRR（Monthly Recurring Revenue）',
            'DAU/MAU 反映用戶是否「真的在用」產品',
          ],
          explanation:
            '設計 Dashboard 的 AARRR 框架：Acquisition（獲取）→ Activation（啟動）→ Retention（留存）→ Revenue（收入）→ Referral（推薦）。MAU 對應規模，DAU/MAU 對應留存與活躍，轉換率對應收入，MRR 對應商業價值。好的 Dashboard 用 3-5 個核心指標講一個完整的故事。',
          frameworkTip:
            '面試設計 Dashboard 時，用 AARRR 或「規模 x 品質 x 變現」框架來選指標，避免堆砌無關數字。',
        },
      ],
    },

    /* ═══════════════════════════════════════════════════
       Quest 25-6  Boss: 產品分析 SQL Case
       ═══════════════════════════════════════════════════ */
    {
      id: '25-6',
      name: 'Boss: 產品分析 SQL Case',
      description: '綜合 Boss 關卡 — 結合 Window Functions、Funnel、Segmentation 做完整產品分析',
      xp: 200,
      isBoss: true,
      challenges: [
        // ── 1. 完整產品分析（code, hard）──
        {
          id: 1,
          name: '完整產品分析',
          type: 'code',
          difficulty: 'hard',
          scenario: {
            title: '訂閱制產品完整分析',
            narrative:
              '你是一位 Product Analyst，PM 要求你用 SQL 做一份完整的產品分析報告。需要結合 Window Functions（排名與趨勢）、Funnel（轉換漏斗）和 Segmentation（用戶分群），找出產品成長的機會點。\n\n資料表：\n- users (user_id INTEGER, signup_date TEXT, plan TEXT)\n- events (event_id INTEGER, user_id INTEGER, event_name TEXT, event_date TEXT)\n- payments (payment_id INTEGER, user_id INTEGER, amount REAL, payment_date TEXT)',
            data: [
              { user_id: 101, signup_date: '2025-12-01', plan: 'free' },
              { user_id: 102, signup_date: '2025-12-05', plan: 'pro' },
              { user_id: 103, signup_date: '2026-01-10', plan: 'free' },
            ],
            dataCaption: 'users 資料表（部分範例）',
          },
          question:
            '寫一段 SQL，計算每個 plan（free / pro）的用戶在「trial_start → feature_use → upgrade」漏斗中的轉換率，並用 RANK 按轉換率排名。這能幫 PM 了解哪個方案的用戶轉換表現最好。',
          sampleSchema: `
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
          `,
          starterCode:
            "WITH funnel AS (\n  SELECT\n    u.plan,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature,\n    COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade\n  FROM users u\n  JOIN events e ON u.user_id = e.user_id\n  GROUP BY u.plan\n)\nSELECT plan,\n       step1_trial, step2_feature, step3_upgrade,\n       -- 計算每步轉換率\n       -- 用 RANK 按最終轉換率排名\nFROM funnel\nORDER BY conversion_rank;",
          expectedQuery:
            "WITH funnel AS (SELECT u.plan, COUNT(DISTINCT CASE WHEN e.event_name = 'trial_start' THEN e.user_id END) AS step1_trial, COUNT(DISTINCT CASE WHEN e.event_name = 'feature_use' THEN e.user_id END) AS step2_feature, COUNT(DISTINCT CASE WHEN e.event_name = 'upgrade' THEN e.user_id END) AS step3_upgrade FROM users u JOIN events e ON u.user_id = e.user_id GROUP BY u.plan) SELECT plan, step1_trial, step2_feature, step3_upgrade, ROUND(step2_feature * 100.0 / step1_trial, 1) AS feature_rate, ROUND(step3_upgrade * 100.0 / step1_trial, 1) AS upgrade_rate, RANK() OVER (ORDER BY step3_upgrade * 1.0 / step1_trial DESC) AS conversion_rank FROM funnel ORDER BY conversion_rank;",
          hints: [
            '先用 CTE 算出每個 plan 的漏斗數字',
            '轉換率 = 該步驟用戶數 / step1 用戶數 * 100',
            'RANK() OVER (ORDER BY upgrade_rate DESC) 按轉換率排名',
          ],
          explanation:
            '這道 Boss 題結合了三個核心技能：(1) Funnel 漏斗 — COUNT DISTINCT CASE WHEN 算每步人數 (2) Segmentation — GROUP BY plan 分群計算 (3) Window Function — RANK 排名。在實務中，PM 經常需要這種「分群漏斗 + 排名」的分析來決定產品策略。',
          frameworkTip:
            'Product Analysis 的思路框架：先 Segment（分群）→ 再 Measure（度量，例如 Funnel）→ 最後 Rank/Compare（比較）。這三步能解決大部分產品分析問題。',
        },

        // ── 2. 產品分析計畫（open-ended, hard）──
        {
          id: 2,
          name: '產品分析計畫',
          type: 'open-ended',
          difficulty: 'hard',
          scenario: {
            title: '設計完整的產品分析方案',
            narrative:
              '你剛加入一家 B2C 訂閱制 SaaS 公司擔任 Product Analyst。PM 告訴你：「我們的付費轉換率從上個月的 8% 掉到 5%，CEO 下週要看分析報告。」\n\n你需要設計一套完整的分析計畫，用 SQL 查詢來找出原因並提出建議。',
          },
          question:
            '請設計一套完整的分析計畫，回答以下問題：\n1. 你會建立哪些 SQL 查詢來診斷問題？（至少列出 3 個）\n2. 每個查詢的目的是什麼？\n3. 你預期可能發現什麼 insight？\n4. 你會如何向 CEO 呈現結果？',
          prompt:
            '請根據付費轉換率下降的場景，設計一套包含至少 3 個 SQL 查詢的分析計畫，說明每個查詢的目的和預期發現。',
          evaluationCriteria: [
            '是否包含 Funnel 分析（找出哪一步流失最多）',
            '是否包含分群比較（新 vs 舊用戶、不同渠道、不同方案）',
            '是否包含時間趨勢分析（MoM 或 WoW 比較）',
            '是否考慮了 Cohort 分析（是特定 Cohort 的問題還是全面下降）',
            '呈現方式是否清楚且可行動',
          ],
          sampleAnswer:
            '分析計畫：\n\n1. **Funnel 分析**：用 COUNT DISTINCT CASE WHEN 計算 visit → signup → trial → payment 每步轉換率，比較本月和上月。目的：找出轉換率在哪一步掉最多。\n\n2. **分群比較**：用 CASE WHEN 把用戶分為新用戶 / 回訪用戶 / 不同渠道，分別計算付費轉換率。目的：看是所有群組都下降，還是某個群組特別嚴重。\n\n3. **週趨勢 + LAG 比較**：用 LAG 計算每週的 WoW 轉換率變化。目的：找出轉換率是逐漸下降還是某一週突然掉落（可能對應產品改版或行銷活動結束）。\n\n4. **Cohort Retention**：比較最近三個月 Cohort 的第一個月付費率。目的：判斷是新用戶品質下降還是產品體驗問題。\n\n呈現方式：先給 CEO 看 Funnel 圖找出問題步驟，再用分群對比定位問題群組，最後用時間趨勢圖指出轉折點，提出 2-3 個可測試的假說和建議的 A/B test。',
          hints: [
            '想想 Funnel 的每一步 — 是哪一步的轉換率掉了？',
            '不同用戶群組的轉換率有差異嗎？新用戶 vs 舊用戶？',
            '是逐漸下降還是某個時間點突然掉？可以用 LAG 比較',
          ],
          explanation:
            '產品分析的核心思路是「分解 → 比較 → 假設 → 驗證」。遇到指標異常時，先分解（Funnel 看哪步掉了），再比較（分群看誰掉了），接著建立假設（為什麼掉了），最後設計驗證（A/B test 或更深入的分析）。這個思路適用於所有產品分析場景。',
          frameworkTip:
            '指標異常分析框架：(1) 確認問題 — 真的掉了嗎？排除季節性和數據問題 (2) 分解 — Funnel 哪步掉 (3) 分群 — 誰掉了 (4) 時間 — 什麼時候掉 (5) 假設 → 建議。',
        },
      ],
    },
  ],
};
