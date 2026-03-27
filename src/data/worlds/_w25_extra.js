// ─────────────────────────────────────────────────────
// World 25 — 額外挑戰題（靈感來自 StrataScratch / LeetCode 面試題）
// 匯入後 append 到對應 quest 的 challenges 陣列
// ─────────────────────────────────────────────────────

export const w25Extra = {

  /* ═══════════════════════════════════════════════════
     Quest 25-1  Window Functions 實戰  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-1': [
    // ── 4. Activity Rank (inspired by Google) ──
    {
      id: 4,
      name: 'DENSE_RANK 活動排名',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google 面試題',
      scenario: {
        title: '用戶 Email 活動排名',
        narrative:
          '產品團隊想找出最活躍的 Email 用戶。你需要根據每位用戶寄出的 Email 數量進行排名。如果兩位用戶寄出一樣多的 Email，排名要相同（不跳號）。\n\n資料表：emails (id, from_user, to_user, sent_date)',
        data: [
          { id: 1, from_user: 'alice', to_user: 'bob', sent_date: '2024-03-01' },
          { id: 2, from_user: 'alice', to_user: 'charlie', sent_date: '2024-03-02' },
          { id: 3, from_user: 'bob', to_user: 'alice', sent_date: '2024-03-03' },
          { id: 4, from_user: 'charlie', to_user: 'alice', sent_date: '2024-03-04' },
          { id: 5, from_user: 'alice', to_user: 'diana', sent_date: '2024-03-05' },
        ],
        dataCaption: 'emails 資料表（部分範例）',
      },
      question:
        '計算每位用戶寄出的 Email 數量，並用 DENSE_RANK 排名（寄最多的排第 1）。顯示 from_user, email_count, activity_rank。',
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
      starterCode:
        "SELECT from_user,\n       COUNT(*) AS email_count,\n       DENSE_RANK() OVER (\n         -- 按什麼排序？\n       ) AS activity_rank\nFROM emails\nGROUP BY from_user\nORDER BY activity_rank;",
      expectedQuery:
        "SELECT from_user, COUNT(*) AS email_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS activity_rank FROM emails GROUP BY from_user ORDER BY activity_rank;",
      hints: [
        'DENSE_RANK 不會跳號，RANK 會跳號 — 這裡要不跳號',
        'OVER() 裡的 ORDER BY 可以直接用聚合函數',
        '不需要 PARTITION BY，因為是全域排名',
      ],
      explanation:
        'DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 會根據 email 數量從多到少排名，同數量的用戶排名相同且不跳號。注意 DENSE_RANK vs RANK 的差異：如果兩人並列第 1，DENSE_RANK 下一個是第 2，RANK 下一個是第 3。面試中經常問這兩者的區別。',
      frameworkTip:
        'RANK vs DENSE_RANK vs ROW_NUMBER：RANK 跳號、DENSE_RANK 不跳號、ROW_NUMBER 每行唯一。面試必知的三兄弟。',
    },

    // ── 5. Ranking Most Active Guests (inspired by Airbnb) ──
    {
      id: 5,
      name: '最活躍房客排名',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Airbnb 面試題',
      scenario: {
        title: '房客訊息活躍度排名',
        narrative:
          '平台運營想找出溝通最積極的房客，以便推薦「超級房客」標籤。你需要根據每位房客發送的訊息總數做排名。如果多位房客發送相同數量的訊息，排名相同，並按名稱字母順序排列。\n\n資料表：messages (id, guest_id, guest_name, host_id, message_body, sent_date)',
        data: [
          { id: 1, guest_id: 101, guest_name: 'Amy', host_id: 501, sent_date: '2024-02-10' },
          { id: 2, guest_id: 102, guest_name: 'Ben', host_id: 502, sent_date: '2024-02-11' },
          { id: 3, guest_id: 101, guest_name: 'Amy', host_id: 503, sent_date: '2024-02-12' },
          { id: 4, guest_id: 103, guest_name: 'Cathy', host_id: 501, sent_date: '2024-02-13' },
        ],
        dataCaption: 'messages 資料表（部分範例）',
      },
      question:
        '計算每位房客的訊息數，用 DENSE_RANK 排名（最多的排第 1）。同名次時按 guest_name 字母排序。顯示 guest_name, message_count, ranking。',
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
      starterCode:
        "SELECT guest_name,\n       COUNT(*) AS message_count,\n       DENSE_RANK() OVER (\n         -- 排名邏輯？\n       ) AS ranking\nFROM messages\nGROUP BY guest_id, guest_name\nORDER BY ranking, guest_name;",
      expectedQuery:
        "SELECT guest_name, COUNT(*) AS message_count, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking FROM messages GROUP BY guest_id, guest_name ORDER BY ranking, guest_name;",
      hints: [
        'GROUP BY guest_id 後再用 DENSE_RANK 排名',
        '同名次按 guest_name 字母排序 — 在最外層 ORDER BY 處理',
        '注意 GROUP BY 要包含 guest_id 和 guest_name 兩個欄位',
      ],
      explanation:
        '先 GROUP BY guest_id, guest_name 算出每位房客的訊息數，再用 DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) 排名。最外層 ORDER BY ranking, guest_name 確保同名次的按字母排序。這個 pattern 在排行榜場景中非常常見。',
      frameworkTip:
        '排行榜問題的 pattern：GROUP BY 算指標 → DENSE_RANK 排名 → ORDER BY 處理同名次的排序。',
    },

    // ── 6. Consecutive Numbers (inspired by LeetCode #180) ──
    {
      id: 6,
      name: '連續出現的數字',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'LeetCode Medium',
      scenario: {
        title: '連續三次相同值偵測',
        narrative:
          '資料工程師發現某個感測器的日誌中，有些數值會連續出現多次，可能代表系統異常。PM 請你找出所有「連續出現至少 3 次」的數值。\n\n資料表：sensor_logs (id INTEGER PRIMARY KEY, value INTEGER)，id 是連續編號。',
        data: [
          { id: 1, value: 10 },
          { id: 2, value: 10 },
          { id: 3, value: 10 },
          { id: 4, value: 20 },
          { id: 5, value: 20 },
          { id: 6, value: 30 },
        ],
        dataCaption: 'sensor_logs 資料表（部分範例）',
      },
      question:
        '用 LAG 和 LEAD（或連續兩次 LAG）找出所有連續出現至少 3 次的 value。結果去重，只顯示 value 欄位。',
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
      starterCode:
        "WITH lagged AS (\n  SELECT id, value,\n    LAG(value, 1) OVER (ORDER BY id) AS prev1,\n    LAG(value, 2) OVER (ORDER BY id) AS prev2\n  FROM sensor_logs\n)\nSELECT DISTINCT value\nFROM lagged\nWHERE -- 什麼條件代表「連續三次相同」？;",
      expectedQuery:
        "WITH lagged AS (SELECT id, value, LAG(value, 1) OVER (ORDER BY id) AS prev1, LAG(value, 2) OVER (ORDER BY id) AS prev2 FROM sensor_logs) SELECT DISTINCT value FROM lagged WHERE value = prev1 AND value = prev2;",
      hints: [
        'LAG(value, 1) 取前一筆，LAG(value, 2) 取前兩筆',
        '如果 value = prev1 = prev2，代表連續三筆相同',
        '用 DISTINCT 去重，因為連續 4 次會匹配 2 次',
      ],
      explanation:
        '用 LAG 取得前一筆和前兩筆的值，當三者相等時代表連續出現 3 次。LAG(value, N) 中的 N 是偏移量。另一個解法是同時用 LAG 和 LEAD：如果自己 = 前一個 = 後一個。DISTINCT 是必要的，因為連續 4 次的值會被匹配多次。這是面試經典題，考的是 Window Function 的靈活運用。',
      frameworkTip:
        '連續 N 次問題的解法：LAG/LEAD 取前後值比較，或用「row_number 差值法」（GROUP BY value, id - ROW_NUMBER 分組）。',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-2  Funnel Analysis  (existing ids 1-2)
     ═══════════════════════════════════════════════════ */
  '25-2': [
    // ── 3. Acceptance Rate By Date (inspired by Meta) ──
    {
      id: 3,
      name: '每日好友請求接受率',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta 面試題',
      scenario: {
        title: '好友請求接受率分析',
        narrative:
          'Growth 團隊想追蹤好友功能的健康度。你需要根據好友請求事件（send / accept），計算每日的接受率（acceptance rate）。\n\n資料表：friend_requests (id, sender_id, receiver_id, action TEXT, action_date TEXT)\n- action 為 "send" 或 "accept"',
        data: [
          { id: 1, sender_id: 101, receiver_id: 201, action: 'send', action_date: '2024-03-01' },
          { id: 2, sender_id: 101, receiver_id: 201, action: 'accept', action_date: '2024-03-01' },
          { id: 3, sender_id: 102, receiver_id: 202, action: 'send', action_date: '2024-03-01' },
          { id: 4, sender_id: 103, receiver_id: 203, action: 'send', action_date: '2024-03-02' },
          { id: 5, sender_id: 103, receiver_id: 203, action: 'accept', action_date: '2024-03-02' },
        ],
        dataCaption: 'friend_requests 資料表（部分範例）',
      },
      question:
        '計算每個日期的好友請求接受率：acceptance_rate = 當日 accept 數 / 當日 send 數。顯示 action_date, sends, accepts, acceptance_rate（四捨五入到小數第 2 位）。',
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
      starterCode:
        "SELECT action_date,\n       SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends,\n       SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts,\n       -- 怎麼算 acceptance_rate？\nFROM friend_requests\nGROUP BY action_date\nORDER BY action_date;",
      expectedQuery:
        "SELECT action_date, SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END) AS sends, SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) AS accepts, ROUND(SUM(CASE WHEN action = 'accept' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN action = 'send' THEN 1 ELSE 0 END), 2) AS acceptance_rate FROM friend_requests GROUP BY action_date ORDER BY action_date;",
      hints: [
        '用 CASE WHEN 分別計算 send 和 accept 的數量',
        '記得乘以 1.0 避免整數除法',
        '用 ROUND(..., 2) 取到小數第 2 位',
      ],
      explanation:
        '用 SUM(CASE WHEN ...) 是「橫向 pivot」的經典技巧，可以在一次 GROUP BY 中同時計算多個條件的聚合值。注意 SQLite 的整數除法：5/3 = 1 不是 1.67，所以要乘以 1.0 轉成浮點數。這種 event-based 的轉換率計算是社交平台分析的核心題型。',
      frameworkTip:
        '事件轉換率 pattern：SUM(CASE WHEN event = X) / SUM(CASE WHEN event = Y)。記得處理整數除法和除以零。',
    },

    // ── 4. Highest Energy Consumption (inspired by Meta) ──
    {
      id: 4,
      name: '多來源能源消耗高峰',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta 面試題',
      scenario: {
        title: '多資料來源漏斗合併',
        narrative:
          '公司有三個不同部門的能源消耗紀錄，儲存在不同表中。PM 想找出「合併後」每個月的總消耗量，以及消耗量最高的月份。\n\n資料表：\n- dept_a_consumption (date TEXT, consumption INTEGER)\n- dept_b_consumption (date TEXT, consumption INTEGER)\n- dept_c_consumption (date TEXT, consumption INTEGER)',
        data: [
          { source: 'dept_a', date: '2024-01', consumption: 300 },
          { source: 'dept_b', date: '2024-01', consumption: 250 },
          { source: 'dept_c', date: '2024-01', consumption: 200 },
        ],
        dataCaption: '各部門 2024-01 能源消耗範例',
      },
      question:
        '用 UNION ALL 合併三張表，計算每月的總消耗量，找出消耗量最高的月份。顯示 date, total_consumption，只回傳消耗量最高的月份（可能有多個並列）。',
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
      starterCode:
        "WITH combined AS (\n  SELECT date, consumption FROM dept_a_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_b_consumption\n  UNION ALL\n  SELECT date, consumption FROM dept_c_consumption\n),\nmonthly AS (\n  SELECT date, SUM(consumption) AS total_consumption\n  FROM combined\n  GROUP BY date\n)\nSELECT date, total_consumption\nFROM monthly\nWHERE total_consumption = (\n  -- 怎麼取最大值？\n);",
      expectedQuery:
        "WITH combined AS (SELECT date, consumption FROM dept_a_consumption UNION ALL SELECT date, consumption FROM dept_b_consumption UNION ALL SELECT date, consumption FROM dept_c_consumption), monthly AS (SELECT date, SUM(consumption) AS total_consumption FROM combined GROUP BY date) SELECT date, total_consumption FROM monthly WHERE total_consumption = (SELECT MAX(total_consumption) FROM monthly);",
      hints: [
        'UNION ALL 保留所有列（包括重複），UNION 會去重 — 這裡用 UNION ALL',
        '先合併 → 再 GROUP BY 月份算總和 → 最後找最大值',
        '子查詢 SELECT MAX(...) FROM monthly 取最大值',
      ],
      explanation:
        '多資料來源合併是真實工作中常見的場景（不同平台的數據、不同部門的報表等）。UNION ALL 把結構相同的表垂直合併，再 GROUP BY 做聚合。用子查詢找出最大值後做過濾，可以正確處理多個月份並列的情況。面試中這類題考的是你處理散落在不同表的數據的能力。',
      frameworkTip:
        '多來源合併 pattern：UNION ALL 合併 → GROUP BY 聚合 → 子查詢或 Window Function 篩選極值。',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-3  Segmentation  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-3': [
    // ── 4. Classify Business Type (inspired by Google) ──
    {
      id: 4,
      name: '商家類型分類',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google 面試題',
      scenario: {
        title: '根據名稱分類商家類型',
        narrative:
          '市場團隊收到了一批商家資料，需要根據商家名稱中的關鍵字自動分類。規則如下：\n- 名稱包含 "restaurant" 或 "cafe" → 餐飲\n- 名稱包含 "shop" 或 "store" → 零售\n- 名稱包含 "hotel" 或 "inn" → 住宿\n- 其他 → 其他\n\n資料表：businesses (id, name TEXT, city TEXT, revenue REAL)',
        data: [
          { id: 1, name: 'Sunset Restaurant', city: 'Taipei', revenue: 85000 },
          { id: 2, name: 'Tech Shop Plus', city: 'Hsinchu', revenue: 120000 },
          { id: 3, name: 'Garden Inn', city: 'Taichung', revenue: 200000 },
          { id: 4, name: 'Creative Studio', city: 'Taipei', revenue: 65000 },
        ],
        dataCaption: 'businesses 資料表（部分範例）',
      },
      question:
        '用 CASE WHEN 搭配 LOWER() 和 LIKE 將商家分類，然後計算每個類別的商家數量和平均營收。顯示 business_type, count, avg_revenue。',
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
      starterCode:
        "SELECT\n  CASE\n    WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲'\n    -- 繼續分類...\n  END AS business_type,\n  COUNT(*) AS count,\n  ROUND(AVG(revenue), 0) AS avg_revenue\nFROM businesses\nGROUP BY business_type\nORDER BY avg_revenue DESC;",
      expectedQuery:
        "SELECT CASE WHEN LOWER(name) LIKE '%restaurant%' OR LOWER(name) LIKE '%cafe%' THEN '餐飲' WHEN LOWER(name) LIKE '%shop%' OR LOWER(name) LIKE '%store%' THEN '零售' WHEN LOWER(name) LIKE '%hotel%' OR LOWER(name) LIKE '%inn%' THEN '住宿' ELSE '其他' END AS business_type, COUNT(*) AS count, ROUND(AVG(revenue), 0) AS avg_revenue FROM businesses GROUP BY business_type ORDER BY avg_revenue DESC;",
      hints: [
        "LOWER(name) 先轉小寫，避免大小寫不一致的問題",
        "LIKE '%keyword%' 做模糊匹配",
        'CASE WHEN 的順序很重要 — 如果名稱同時包含多個關鍵字，會被歸到第一個匹配的類別',
      ],
      explanation:
        '用 CASE WHEN + LIKE 做文本分類是資料清理和分群中很常見的技巧。LOWER() 確保大小寫不敏感。注意 CASE WHEN 是「first match wins」的邏輯，所以條件的順序可能影響結果。在真實工作中，這種分類邏輯經常會越來越複雜，最後可能需要搬到 mapping table 或 UDF 中。',
      frameworkTip:
        '文本分類 pattern：CASE WHEN + LOWER + LIKE。生產環境中更好的做法是建一張 mapping table JOIN 進來。',
    },

    // ── 5. Premium vs Freemium (inspired by Microsoft) ──
    {
      id: 5,
      name: '免費 vs 付費用戶比較',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Microsoft 面試題',
      scenario: {
        title: 'Freemium vs Premium 下載量比較',
        narrative:
          '產品團隊想了解免費用戶和付費用戶的每日下載量差異，特別想找出「免費用戶下載量超過付費用戶」的日期。\n\n資料表：\n- downloads (date TEXT, user_id INTEGER, downloads INTEGER)\n- users (id INTEGER, account_type TEXT)  -- account_type: "free" 或 "premium"',
        data: [
          { date: '2024-03-01', account_type: 'free', total_downloads: 150 },
          { date: '2024-03-01', account_type: 'premium', total_downloads: 200 },
          { date: '2024-03-02', account_type: 'free', total_downloads: 250 },
          { date: '2024-03-02', account_type: 'premium', total_downloads: 180 },
        ],
        dataCaption: '每日下載量（彙總後）範例',
      },
      question:
        '計算每日免費用戶 vs 付費用戶的總下載量，找出免費用戶下載量超過付費用戶的日期。顯示 date, free_downloads, premium_downloads。',
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
      starterCode:
        "WITH daily AS (\n  SELECT d.date,\n    SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads,\n    SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads\n  FROM downloads d\n  JOIN users u ON d.user_id = u.id\n  GROUP BY d.date\n)\nSELECT date, free_downloads, premium_downloads\nFROM daily\nWHERE -- 什麼條件？\nORDER BY date;",
      expectedQuery:
        "WITH daily AS (SELECT d.date, SUM(CASE WHEN u.account_type = 'free' THEN d.downloads ELSE 0 END) AS free_downloads, SUM(CASE WHEN u.account_type = 'premium' THEN d.downloads ELSE 0 END) AS premium_downloads FROM downloads d JOIN users u ON d.user_id = u.id GROUP BY d.date) SELECT date, free_downloads, premium_downloads FROM daily WHERE free_downloads > premium_downloads ORDER BY date;",
      hints: [
        "SUM(CASE WHEN) 是把同一筆 GROUP BY 內的數據分成兩群的經典技巧",
        'JOIN users 表取得 account_type 後再做條件聚合',
        'WHERE 條件直接比較兩個 SUM 的結果',
      ],
      explanation:
        '這題的核心技巧是「條件聚合」：在同一個 GROUP BY 中，用 SUM(CASE WHEN ...) 分別計算不同分群的指標。這比分開查再 JOIN 更簡潔高效。在 CTE 裡先算好每日兩群的總量，外層再做過濾。這種 A/B 比較在產品分析中無處不在。',
      frameworkTip:
        '分群比較 pattern：JOIN 取分群標籤 → SUM(CASE WHEN) 條件聚合 → WHERE/HAVING 篩選。比 self-join 更高效。',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-4  Retention / Cohort Analysis  (existing ids 1-2)
     ═══════════════════════════════════════════════════ */
  '25-4': [
    // ── 3. Retention Rate (inspired by Meta) ──
    {
      id: 3,
      name: '月度留存率計算',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta 面試題',
      scenario: {
        title: '月度用戶留存率',
        narrative:
          'Growth 團隊需要追蹤月度留存率：「某月活躍的用戶中，有多少比例在下個月也活躍？」。這和 cohort retention 不同 — 這裡不按註冊月份分組，而是看整體的月到月留存。\n\n資料表：user_activity (user_id INTEGER, activity_date TEXT)',
        data: [
          { user_id: 1, activity_date: '2024-01-05' },
          { user_id: 2, activity_date: '2024-01-10' },
          { user_id: 1, activity_date: '2024-02-03' },
          { user_id: 3, activity_date: '2024-02-15' },
        ],
        dataCaption: 'user_activity 資料表（部分範例）',
      },
      question:
        '計算每個月的留存率：month_N 活躍用戶中，在 month_N+1 也活躍的比例。顯示 activity_month, active_users, retained_next_month, retention_rate。',
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
      starterCode:
        "WITH monthly_users AS (\n  SELECT DISTINCT user_id,\n         strftime('%Y-%m', activity_date) AS activity_month\n  FROM user_activity\n)\nSELECT\n  a.activity_month,\n  COUNT(DISTINCT a.user_id) AS active_users,\n  -- 怎麼算留存到下個月的人數？\n  -- 怎麼算 retention_rate？\nFROM monthly_users a\nLEFT JOIN monthly_users b\n  ON a.user_id = b.user_id\n  -- 怎麼確保 b 是「下個月」？\nGROUP BY a.activity_month\nORDER BY a.activity_month;",
      expectedQuery:
        "WITH monthly_users AS (SELECT DISTINCT user_id, strftime('%Y-%m', activity_date) AS activity_month FROM user_activity) SELECT a.activity_month, COUNT(DISTINCT a.user_id) AS active_users, COUNT(DISTINCT b.user_id) AS retained_next_month, ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 1) AS retention_rate FROM monthly_users a LEFT JOIN monthly_users b ON a.user_id = b.user_id AND b.activity_month = strftime('%Y-%m', date(a.activity_month || '-01', '+1 month')) GROUP BY a.activity_month ORDER BY a.activity_month;",
      hints: [
        '先用 DISTINCT 取得每月的不重複活躍用戶',
        "Self-join：a 是當月用戶，b 是下月用戶，用 date(..., '+1 month') 算下個月",
        'COUNT(DISTINCT b.user_id) 是留存人數，除以 COUNT(DISTINCT a.user_id) 是留存率',
      ],
      explanation:
        "月度留存率用 self-join 實現：monthly_users 表自己 JOIN 自己，條件是同一個 user_id 且 b 的月份 = a 的月份 + 1。LEFT JOIN 確保即使沒有留存用戶也會顯示。SQLite 中用 date(month || '-01', '+1 month') 計算下個月。這是 Growth 團隊最常看的留存指標之一。",
      frameworkTip:
        '月度留存 pattern：CTE 去重取月活用戶 → self-join（同用戶 + 月份差 1） → COUNT(DISTINCT) 算留存人數。',
    },

    // ── 4. Monthly Percentage Difference (inspired by Amazon) ──
    {
      id: 4,
      name: 'MoM 營收百分比變化',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon 面試題',
      scenario: {
        title: '月營收環比變化',
        narrative:
          '財務團隊需要一份報表，顯示每個月的營收和相比上月的百分比變化（MoM %）。這能幫助主管快速發現營收異常。\n\n資料表：purchases (id INTEGER, user_id INTEGER, amount REAL, purchase_date TEXT)',
        data: [
          { id: 1, user_id: 101, amount: 500, purchase_date: '2024-01-15' },
          { id: 2, user_id: 102, amount: 300, purchase_date: '2024-01-20' },
          { id: 3, user_id: 101, amount: 450, purchase_date: '2024-02-10' },
        ],
        dataCaption: 'purchases 資料表（部分範例）',
      },
      question:
        '計算每月總營收和 MoM 百分比變化。用 LAG 取上月營收。顯示 month, revenue, prev_month_revenue, mom_pct_change（四捨五入到小數第 1 位）。',
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
      starterCode:
        "WITH monthly AS (\n  SELECT strftime('%Y-%m', purchase_date) AS month,\n         SUM(amount) AS revenue\n  FROM purchases\n  GROUP BY month\n)\nSELECT month,\n       revenue,\n       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,\n       -- 怎麼算 MoM 百分比變化？\nFROM monthly\nORDER BY month;",
      expectedQuery:
        "WITH monthly AS (SELECT strftime('%Y-%m', purchase_date) AS month, SUM(amount) AS revenue FROM purchases GROUP BY month) SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue, ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / LAG(revenue) OVER (ORDER BY month), 1) AS mom_pct_change FROM monthly ORDER BY month;",
      hints: [
        '先用 CTE 把每月營收算好，再用 LAG 取上月',
        'MoM % = (本月 - 上月) / 上月 * 100',
        '第一個月的 LAG 回傳 NULL，整個計算結果也是 NULL — 不需要額外處理',
      ],
      explanation:
        '先用 CTE 按月聚合營收，再用 LAG 取得上個月的值來計算變化率。這個 pattern 在 Quest 25-1 的 LAG 題有類似概念，但這裡多了一步：先聚合再算。在實務中，MoM 變化率是最常見的趨勢追蹤指標，幾乎每個 dashboard 都會有。',
      frameworkTip:
        'MoM 計算的兩步驟：CTE 先 GROUP BY 月份算出指標 → 外層用 LAG 算環比。分開做比在同一層更清晰。',
    },
  ],

  /* ═══════════════════════════════════════════════════
     Quest 25-5  KPI 與 Dashboard Query Design  (existing ids 1-3)
     ═══════════════════════════════════════════════════ */
  '25-5': [
    // ── 4. Customer Revenue in March (inspired by Meta) ──
    {
      id: 4,
      name: '單月客戶營收排名',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta 面試題',
      scenario: {
        title: '三月份客戶營收報表',
        narrative:
          '業務主管要一份「三月份各客戶的營收排名」，用來識別 VIP 客戶和評估銷售表現。\n\n資料表：orders (id INTEGER, customer_id INTEGER, amount REAL, order_date TEXT)',
        data: [
          { id: 1, customer_id: 301, amount: 500, order_date: '2024-03-05' },
          { id: 2, customer_id: 302, amount: 350, order_date: '2024-03-10' },
          { id: 3, customer_id: 301, amount: 200, order_date: '2024-03-15' },
        ],
        dataCaption: 'orders 資料表（部分範例）',
      },
      question:
        '計算 2024 年 3 月份每位客戶的總營收，並用 DENSE_RANK 排名。顯示 customer_id, march_revenue, revenue_rank。按排名排序。',
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
      starterCode:
        "SELECT customer_id,\n       SUM(amount) AS march_revenue,\n       DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank\nFROM orders\nWHERE -- 怎麼篩選三月份？\nGROUP BY customer_id\nORDER BY revenue_rank;",
      expectedQuery:
        "SELECT customer_id, SUM(amount) AS march_revenue, DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank FROM orders WHERE strftime('%Y-%m', order_date) = '2024-03' GROUP BY customer_id ORDER BY revenue_rank;",
      hints: [
        "strftime('%Y-%m', order_date) = '2024-03' 篩選三月份",
        '先 WHERE 篩選月份，再 GROUP BY 客戶算總營收',
        'DENSE_RANK 直接在 SELECT 中對 SUM(amount) 排名',
      ],
      explanation:
        "這題結合了時間篩選、聚合和 Window Function。先用 WHERE 篩選目標月份，GROUP BY 算每位客戶的營收，再用 DENSE_RANK 排名。注意 WHERE 在 GROUP BY 之前執行，所以篩選條件要放在 WHERE 而不是 HAVING。面試中這類「特定時段的客戶排名」是非常高頻的題型。",
      frameworkTip:
        '時間篩選 + 聚合 + 排名的執行順序：WHERE 篩時間 → GROUP BY 聚合 → Window Function 排名。順序不能錯。',
    },

    // ── 5. Marketing Campaign Success (inspired by Amazon) ──
    {
      id: 5,
      name: '行銷活動成效分析',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon 面試題',
      scenario: {
        title: '行銷活動 ROI 評估',
        narrative:
          '行銷團隊投放了多個廣告活動來獲取新用戶。PM 想知道：透過行銷活動獲得的用戶中，有多少人實際下了訂單？每個活動帶來了多少營收？\n\n資料表：\n- users (id INTEGER, signup_date TEXT, campaign TEXT)  — campaign 為 NULL 表示自然流量\n- orders (id INTEGER, user_id INTEGER, amount REAL, order_date TEXT)',
        data: [
          { id: 1, signup_date: '2024-03-01', campaign: 'spring_sale' },
          { id: 2, signup_date: '2024-03-02', campaign: 'google_ads' },
          { id: 3, signup_date: '2024-03-03', campaign: null },
        ],
        dataCaption: 'users 資料表（部分範例）',
      },
      question:
        '計算每個行銷活動的：獲客人數、有下單的人數、下單率、總營收。排除自然流量（campaign IS NULL）。按總營收降序排列。',
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
      starterCode:
        "SELECT u.campaign,\n       COUNT(DISTINCT u.id) AS acquired_users,\n       -- 有下單的人數？\n       -- 下單率？\n       -- 總營收？\nFROM users u\nLEFT JOIN orders o ON u.id = o.user_id\nWHERE u.campaign IS NOT NULL\nGROUP BY u.campaign\nORDER BY -- 按總營收排序;",
      expectedQuery:
        "SELECT u.campaign, COUNT(DISTINCT u.id) AS acquired_users, COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) AS paying_users, ROUND(COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) * 100.0 / COUNT(DISTINCT u.id), 1) AS conversion_rate, COALESCE(SUM(o.amount), 0) AS total_revenue FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.campaign IS NOT NULL GROUP BY u.campaign ORDER BY total_revenue DESC;",
      hints: [
        "COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 算有下單的不重複用戶數",
        'LEFT JOIN 確保沒下單的用戶也被計入獲客人數',
        'COALESCE(SUM(o.amount), 0) 處理某活動完全沒有訂單的情況',
      ],
      explanation:
        '這題結合了 LEFT JOIN、條件聚合和商業指標計算。LEFT JOIN 確保沒下單的用戶也算在獲客人數中。COUNT(DISTINCT CASE WHEN o.id IS NOT NULL THEN u.id END) 是一個巧妙的技巧：只計算有訂單的不重複用戶。下單率 = 有下單用戶 / 總獲客用戶。這種行銷成效報表是 Growth 和 Marketing Analytics 的核心工作。',
      frameworkTip:
        '行銷成效分析 pattern：LEFT JOIN 保留全量用戶 → 條件聚合區分轉化/未轉化 → 算轉化率和 ROI。LEFT JOIN 是關鍵，不能用 INNER JOIN。',
    },
  ],
};
