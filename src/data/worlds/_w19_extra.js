// ── World 19 額外挑戰（進階資料處理 — 面試經典題）──────────────────
// 這些挑戰會被 append 到 World 19 對應的 quest 中

export const w19Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-1: List Comprehension — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '19-1': [
    {
      id: 5,
      name: '巢狀 List Comprehension',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '交易資料矩陣轉換',
        narrative: '你在 Meta 的商務分析團隊，收到一份巢狀的交易資料，需要將二維矩陣攤平成一維 list，同時篩選出高於閾值的交易金額。',
      },
      question: '寫一個函式 flatten_filter(matrix, threshold)，用巢狀 list comprehension 把二維 list 攤平，並只保留大於 threshold 的值，結果要排序。\n\n範例：\nflatten_filter([[10, 200, 30], [400, 5, 60]], 50) → [60, 200, 400]',
      starterCode: 'def flatten_filter(matrix, threshold):\n    # 用巢狀 list comprehension 攤平並篩選\n    pass',
      expectedQuery: 'def flatten_filter(matrix, threshold):\n    return sorted([x for row in matrix for x in row if x > threshold])',
      testCases: [
        { input: 'flatten_filter([[10, 200, 30], [400, 5, 60]], 50)' },
        { input: 'flatten_filter([[1, 2], [3, 4]], 5)' },
        { input: 'flatten_filter([[100]], 0)' },
      ],
      hints: ['巢狀 list comprehension 的順序：外層 for 在前，內層 for 在後', '篩選條件 if 放在最後面', '最後用 sorted() 排序'],
      explanation: '巢狀 list comprehension 的閱讀順序：\n[expression for outer in outer_list for inner in outer_list if condition]\n\n等價於：\nresult = []\nfor row in matrix:\n    for x in row:\n        if x > threshold:\n            result.append(x)\n\n這是面試中常考的 Python 技巧，展示你能用簡潔的方式處理巢狀資料。',
      frameworkTip: '面試時先用 for 迴圈寫出邏輯，確認正確後再改寫成 list comprehension。這展示你的思考過程清晰有條理。',
    },
    {
      id: 6,
      name: 'Generator vs List Comprehension',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '記憶體效能的關鍵差異',
        narrative: 'Meta 面試官問你：處理一千萬筆用戶行為數據時，list comprehension 和 generator expression 在記憶體上有什麼差異？這是區分 junior 和 senior 的經典題。',
      },
      question: '以下兩段程式碼的主要差異是什麼？\n\n```python\n# 方式 A\ntotal_a = sum([x**2 for x in range(10_000_000)])\n\n# 方式 B\ntotal_b = sum(x**2 for x in range(10_000_000))\n```',
      options: [
        { id: 'A', text: '結果不同，方式 B 會出錯', explanation: '兩者的計算結果完全相同，只是記憶體使用方式不同。' },
        { id: 'B', text: '結果相同，但方式 A 會先建立完整 list 佔用大量記憶體，方式 B 使用 generator 逐一產生值幾乎不佔記憶體', explanation: '正確！List comprehension [x**2 for ...] 會在記憶體中建立一個包含一千萬個元素的 list。Generator expression (x**2 for ...) 則是惰性求值（lazy evaluation），一次只產生一個值，記憶體使用量接近 O(1)。' },
        { id: 'C', text: '結果相同，方式 B 比較快但記憶體用量一樣', explanation: 'Generator 的主要優勢正是在記憶體，而非速度。' },
        { id: 'D', text: '方式 B 是語法錯誤，sum() 裡不能放 generator', explanation: 'sum() 可以直接接受 generator expression，而且這是推薦的寫法。' },
      ],
      correctAnswer: 'B',
      hints: ['[] 建立完整 list，() 建立 generator', 'generator 是惰性求值（lazy evaluation）', '當你只需要遍歷一次且不需要索引時，generator 更好'],
      explanation: 'List comprehension vs Generator expression：\n- [x for x in iterable]：一次建立完整 list，佔用 O(n) 記憶體\n- (x for x in iterable)：惰性求值，一次只產生一個值，佔用 O(1) 記憶體\n\n當你只需要遍歷一次（如 sum、max、min、any、all），用 generator 更省記憶體。當你需要多次存取或切片，才用 list。',
      frameworkTip: '面試時提到「處理大量數據時我會用 generator expression 而非 list comprehension 來節省記憶體」，展示你有 scalability 的意識。這是 Meta 和 Google 非常看重的能力。',
    },
    {
      id: 7,
      name: 'Dict & Set Comprehension',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '客戶消費數據快速整理',
        narrative: '你在分析電商平台的訂單數據，需要快速建立每位客戶的消費總額字典，並找出消費超過平均值的 VIP 客戶集合。',
      },
      question: '給定一組訂單 orders = [(customer, amount), ...]，寫兩個函式：\n1. total_by_customer(orders) — 回傳 dict，key 是客戶名，value 是總消費\n2. vip_customers(totals) — 回傳 set，包含消費高於平均值的客戶名\n\n範例：\norders = [("Alice", 100), ("Bob", 200), ("Alice", 150), ("Bob", 50)]\ntotals = total_by_customer(orders) → {"Alice": 250, "Bob": 250}\nvip_customers({"Alice": 250, "Bob": 100, "Carol": 50}) → {"Alice", "Bob"}',
      starterCode: 'def total_by_customer(orders):\n    # 提示：先用一般方法累加，或用 dict comprehension + sum\n    pass\n\ndef vip_customers(totals):\n    # 用 set comprehension 找出高於平均的客戶\n    pass',
      expectedQuery: 'def total_by_customer(orders):\n    customers = set(c for c, _ in orders)\n    return {c: sum(a for cu, a in orders if cu == c) for c in customers}\n\ndef vip_customers(totals):\n    avg = sum(totals.values()) / len(totals)\n    return {c for c, v in totals.items() if v > avg}',
      testCases: [
        { input: 'total_by_customer([("Alice", 100), ("Bob", 200), ("Alice", 150)])' },
        { input: 'vip_customers({"Alice": 250, "Bob": 100, "Carol": 50})' },
        { input: 'vip_customers({"A": 100, "B": 100})' },
      ],
      hints: ['dict comprehension: {key: value for ... if ...}', 'set comprehension: {value for ... if ...}', '先計算平均值，再用 comprehension 篩選'],
      explanation: 'Dict comprehension {k: v for ...} 和 set comprehension {v for ...} 是 list comprehension 的延伸：\n- Dict: {customer: total for customer in customers}\n- Set: {customer for customer, amount in totals.items() if amount > avg}\n\n這些工具讓你用一行程式碼完成複雜的資料轉換。',
      frameworkTip: '面試時展示你能靈活運用 dict/set comprehension，而不只是 list comprehension，會讓面試官知道你對 Python 資料結構有全面的掌握。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-2: Readability & PEP 8 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '19-2': [
    {
      id: 3,
      name: '程式碼重構練習',
      type: 'code',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: '修正不合規範的程式碼',
        narrative: '你加入了一個資料分析團隊，前任工程師留下了一段功能正確但風格糟糕的程式碼。你的主管要求你重構它，使其符合 PEP 8 規範並提升可讀性。',
      },
      question: '將以下程式碼重構為符合 PEP 8 規範的版本。要求：\n1. 修正命名（變數用 snake_case，常數用 UPPER_CASE）\n2. 添加適當的空格和空行\n3. 用更 Pythonic 的寫法改寫\n\n```python\ndef CalcStats(Data,minVal=0):\n  filteredData=[x for x in Data if x>=minVal]\n  N=len(filteredData)\n  if N==0:return None\n  Mean=sum(filteredData)/N\n  Variance=sum([(x-Mean)**2 for x in filteredData])/N\n  return {"mean":Mean,"variance":Variance,"count":N}\n```',
      starterCode: '# 重構以下程式碼，使其符合 PEP 8 規範\n# 1. 函式和變數名用 snake_case\n# 2. 運算子前後加空格\n# 3. 適當的空行分隔邏輯區塊\n\ndef calc_stats(data, min_val=0):\n    pass',
      expectedQuery: 'def calc_stats(data, min_val=0):\n    """Calculate basic statistics for filtered data."""\n    filtered_data = [x for x in data if x >= min_val]\n    n = len(filtered_data)\n\n    if n == 0:\n        return None\n\n    mean = sum(filtered_data) / n\n    variance = sum((x - mean) ** 2 for x in filtered_data) / n\n\n    return {"mean": mean, "variance": variance, "count": n}',
      testCases: [
        { input: 'calc_stats([10, 20, 30])' },
        { input: 'calc_stats([1, 2, 3, 4, 5], 3)' },
        { input: 'calc_stats([], 0)' },
      ],
      hints: ['PEP 8：函式名和變數名用 snake_case', '運算子（=, ==, >=, **, /）前後要有空格', 'return 不要跟 if 放在同一行，應該換行加縮排'],
      explanation: 'PEP 8 重點重構項目：\n1. 命名：CalcStats → calc_stats, filteredData → filtered_data\n2. 空格：x>=minVal → x >= min_val\n3. 縮排：if 後的 return 應該換行\n4. 空行：邏輯區塊之間加空行提升可讀性\n5. Docstring：函式開頭加說明文字\n6. 小優化：sum([(x-Mean)**2 ...]) 的 [] 可省略，用 generator 更省記憶體',
      frameworkTip: '在 code review 或結對程式設計面試中，主動提出 PEP 8 修改建議展示你的程式碼品質意識。好的命名習慣是區分新手和有經驗工程師的重要指標。',
    },
    {
      id: 4,
      name: '命名慣例與可讀性',
      type: 'multiple-choice',
      difficulty: 'easy',
      sourceTag: '實戰',
      scenario: {
        title: 'Python 命名慣例速查',
        narrative: '新進的 data analyst 問你 Python 的命名規範。作為團隊的 Python 導師，你需要清楚解釋不同場景該用什麼命名方式。',
      },
      question: '根據 PEP 8 規範，以下哪組命名方式全部正確？\n\n```python\n# A 組\nMAX_RETRY_COUNT = 3\ndef calculate_revenue(raw_data):\n    total_amount = sum(raw_data)\n\n# B 組  \nMaxRetryCount = 3\ndef CalculateRevenue(rawData):\n    TotalAmount = sum(rawData)\n\n# C 組\nmax_retry_count = 3\ndef calculate_revenue(RawData):\n    total_amount = sum(RawData)\n\n# D 組\nMAX_RETRY_COUNT = 3\ndef Calculate_Revenue(raw_data):\n    total_amount = sum(raw_data)\n```',
      options: [
        { id: 'A', text: 'A 組', explanation: '正確！常數用 UPPER_SNAKE_CASE，函式和變數用 lower_snake_case，這是 PEP 8 的標準命名規範。' },
        { id: 'B', text: 'B 組', explanation: 'PascalCase 是給 class 用的，不適用於函式和變數。camelCase (rawData) 是 Java/JS 的慣例，Python 不用。' },
        { id: 'C', text: 'C 組', explanation: '常數 max_retry_count 應該用 UPPER_SNAKE_CASE 表示它是常數。參數 RawData 應該用 snake_case。' },
        { id: 'D', text: 'D 組', explanation: '函式名 Calculate_Revenue 混合了 PascalCase 和 snake_case，應該全部用 snake_case。' },
      ],
      correctAnswer: 'A',
      hints: ['Python 變數和函式：snake_case', '常數：UPPER_SNAKE_CASE', '類別名稱：PascalCase（但這題沒考）'],
      explanation: 'PEP 8 命名規範：\n- 常數：UPPER_SNAKE_CASE（如 MAX_RETRY_COUNT）\n- 函式/方法：lower_snake_case（如 calculate_revenue）\n- 變數/參數：lower_snake_case（如 raw_data）\n- 類別：PascalCase（如 DataProcessor）\n- 私有屬性：前綴底線 _private_var\n\n遵循這些規範讓程式碼一眼就能看出變數的用途和範圍。',
      frameworkTip: '面試或工作中，一致的命名慣例是程式碼品質的第一印象。在 code review 中提到 PEP 8 展示你重視程式碼的可維護性。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-3: Pandas intro DataFrame — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '19-3': [
    {
      id: 4,
      name: 'DataFrame Merge（Join 操作）',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'StrataScratch',
      scenario: {
        title: 'Left Join vs Inner Join — 面試高頻題',
        narrative: '你在分析電商平台數據，有兩張表：orders（訂單）和 customers（客戶）。面試官要你用 Pandas 合併這兩張表，並解釋不同 join 方式的差異。',
      },
      question: '給定以下兩個 DataFrame：\n\n```python\nimport pandas as pd\n\norders = pd.DataFrame({\n    "order_id": [1, 2, 3, 4],\n    "customer_id": [101, 102, 103, 999],\n    "amount": [50, 30, 70, 20]\n})\n\ncustomers = pd.DataFrame({\n    "customer_id": [101, 102, 103, 104],\n    "name": ["Alice", "Bob", "Carol", "Dave"]\n})\n\nresult = orders.merge(customers, on="customer_id", how="left")\n```\n\nresult 有幾列？customer_id=999 那列的 name 欄位值是什麼？',
      options: [
        { id: 'A', text: '4 列，name 欄位為 NaN', explanation: '正確！left join 保留左表（orders）的所有列。customer_id=999 在 customers 表中找不到對應，所以 name 為 NaN。customer_id=104 的 Dave 不會出現，因為他在左表中沒有訂單。' },
        { id: 'B', text: '3 列，customer_id=999 那列被刪除', explanation: '這是 inner join 的行為，不是 left join。left join 會保留左表的所有列。' },
        { id: 'C', text: '5 列，包含 Dave 的列', explanation: '這是 outer join 的行為。left join 只保留左表的所有列，不會加入右表獨有的列。' },
        { id: 'D', text: '4 列，name 欄位為空字串 ""', explanation: '找不到匹配時，Pandas 用 NaN（而非空字串）來表示缺失值。' },
      ],
      correctAnswer: 'A',
      hints: ['left join 保留左表所有列', '找不到匹配的欄位會填入 NaN', 'inner join 只保留兩邊都有的列'],
      explanation: 'Pandas merge 的四種 join 方式：\n- inner（預設）：只保留兩邊都有匹配的列\n- left：保留左表所有列，右表無匹配的填 NaN\n- right：保留右表所有列，左表無匹配的填 NaN\n- outer：保留兩邊所有列，無匹配的填 NaN\n\n等價於 SQL 的 INNER/LEFT/RIGHT/FULL OUTER JOIN。',
      frameworkTip: '面試時畫一個 Venn diagram 來解釋 join 類型，left join = 左圈全部 + 交集部分。這展示你對 SQL 和 Pandas 的共通概念有深入理解。StrataScratch 上超過 30% 的題目涉及 merge/join 操作。',
    },
    {
      id: 5,
      name: 'loc vs iloc 陷阱',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'StrataScratch',
      scenario: {
        title: 'loc 和 iloc 的致命差異',
        narrative: '你在 StrataScratch 上練習 Pandas 題目，發現很多人在 loc 和 iloc 的使用上犯錯。這道題考的是兩者在切片行為上的關鍵差異。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame(\n    {"product": ["A", "B", "C", "D", "E"]},\n    index=[10, 20, 30, 40, 50]\n)\n\nprint(len(df.loc[10:30]))\nprint(len(df.iloc[0:2]))\n```',
      options: [
        { id: 'A', text: '3, 2', explanation: '正確！loc 用標籤切片時「包含」結尾（10, 20, 30 共 3 列）。iloc 用位置切片時「不包含」結尾（位置 0, 1 共 2 列），跟 Python 的 list 切片一致。' },
        { id: 'B', text: '2, 2', explanation: 'loc 的切片包含結尾（inclusive），不像 Python 的一般切片。' },
        { id: 'C', text: '3, 3', explanation: 'iloc 的切片跟 Python list 一樣，不包含結尾。' },
        { id: 'D', text: '報錯 KeyError', explanation: '10, 20, 30 都是有效的 index 標籤，不會報錯。' },
      ],
      correctAnswer: 'A',
      hints: ['loc 用標籤（label），切片包含結尾', 'iloc 用整數位置（integer location），切片不包含結尾', '這是 Pandas 最容易混淆的點之一'],
      explanation: 'loc vs iloc 的關鍵差異：\n- df.loc[start:end]：用標籤索引，切片「包含」end（inclusive）\n- df.iloc[start:end]：用位置索引，切片「不包含」end（exclusive），跟 Python list/range 一致\n\n記憶口訣：loc = label + inclusive，iloc = integer + exclusive（跟 Python 慣例一致）。',
      frameworkTip: '面試時明確說出「loc 用標籤且包含結尾，iloc 用位置且不包含結尾」這個關鍵差異。這是 Pandas 面試中最常見的陷阱題之一，答對能立刻建立你的可信度。',
    },
    {
      id: 6,
      name: 'DataFrame 建立與基本操作',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'StrataScratch',
      scenario: {
        title: '銷售數據快速分析',
        narrative: '你在一家零售公司的資料團隊，需要從原始字典數據建立 DataFrame，進行欄位計算，並用 merge 合併產品類別資訊。',
      },
      question: '完成以下任務：\n1. 從 sales_data 建立 DataFrame\n2. 新增 total 欄位 = quantity * price\n3. 將 sales_df 和 categories_df 用 inner merge 合併\n4. 回傳合併後的 DataFrame\n\n```python\nsales_data = {\n    "product_id": [1, 2, 3],\n    "quantity": [10, 5, 8],\n    "price": [100, 200, 150]\n}\ncategories_data = {\n    "product_id": [1, 2, 4],\n    "category": ["Electronics", "Clothing", "Food"]\n}\n```',
      starterCode: 'import pandas as pd\n\ndef process_sales(sales_data, categories_data):\n    # 1. 建立 DataFrame\n    # 2. 新增 total 欄位\n    # 3. inner merge\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef process_sales(sales_data, categories_data):\n    sales_df = pd.DataFrame(sales_data)\n    categories_df = pd.DataFrame(categories_data)\n    sales_df["total"] = sales_df["quantity"] * sales_df["price"]\n    result = sales_df.merge(categories_df, on="product_id", how="inner")\n    return result',
      testCases: [
        { input: 'df = process_sales({"product_id": [1, 2, 3], "quantity": [10, 5, 8], "price": [100, 200, 150]}, {"product_id": [1, 2, 4], "category": ["Electronics", "Clothing", "Food"]})\nlen(df)' },
        { input: 'df = process_sales({"product_id": [1], "quantity": [3], "price": [50]}, {"product_id": [1], "category": ["A"]})\ndf["total"].iloc[0]' },
      ],
      hints: ['pd.DataFrame(dict) 從字典建立 DataFrame', 'df["new_col"] = df["col1"] * df["col2"] 新增計算欄位', 'df1.merge(df2, on="key", how="inner") 內連結'],
      explanation: 'Pandas 基本操作流程：\n1. pd.DataFrame(dict) 從字典建立表格\n2. df["new_col"] = 運算式 新增欄位\n3. df1.merge(df2, on="key", how="inner") 合併表格\n\ninner merge 只保留 product_id 在兩張表都有的列（1 和 2），product_id=3 和 4 會被排除。',
      frameworkTip: '面試中處理 Pandas 題目時，先說明你的資料處理流程（建立 → 計算 → 合併 → 篩選），再逐步實作。展示你有結構化的分析思維。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-4: Data filtering & sorting — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '19-4': [
    {
      id: 4,
      name: '多條件篩選與 apply',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '用戶行為數據分析',
        narrative: '你在 Meta 的 Growth 團隊，需要從用戶活動數據中篩選出符合多個條件的高價值用戶，並用自定義函式計算每位用戶的參與度分數。',
      },
      question: '完成以下任務：\n1. 篩選出 sessions > 5 且 purchases > 0 的用戶\n2. 用 apply 對每列計算 engagement_score = sessions * 0.3 + purchases * 0.7\n3. 按 engagement_score 降序排列\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    "user_id": [1, 2, 3, 4, 5],\n    "sessions": [10, 3, 8, 15, 2],\n    "purchases": [2, 0, 5, 1, 3]\n})\n```',
      starterCode: 'import pandas as pd\n\ndef analyze_users(df):\n    # 1. 多條件篩選\n    # 2. 用 apply 計算 engagement_score\n    # 3. 降序排列\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef analyze_users(df):\n    filtered = df[(df["sessions"] > 5) & (df["purchases"] > 0)]\n    filtered = filtered.copy()\n    filtered["engagement_score"] = filtered.apply(\n        lambda row: row["sessions"] * 0.3 + row["purchases"] * 0.7, axis=1\n    )\n    return filtered.sort_values("engagement_score", ascending=False)',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"user_id": [1, 2, 3], "sessions": [10, 3, 8], "purchases": [2, 0, 5]})\nlen(analyze_users(df))' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"user_id": [1], "sessions": [10], "purchases": [2]})\nresult = analyze_users(df)\nresult["engagement_score"].iloc[0]' },
      ],
      hints: ['多條件篩選用 & 連接，每個條件要加括號', 'apply(func, axis=1) 對每一列（row）執行函式', 'sort_values("col", ascending=False) 降序排列'],
      explanation: 'Pandas 多條件篩選語法：\n- df[(cond1) & (cond2)]：AND 條件\n- df[(cond1) | (cond2)]：OR 條件\n- 每個條件必須加括號！\n\napply(func, axis=1) 對每一列執行自定義函式，axis=0 則是對每一欄。sort_values 的 ascending=False 表示降序。',
      frameworkTip: '面試時提到 apply 時，順便說明「對於簡單運算，向量化操作比 apply 更快」。這展示你有效能意識，面試官會加分。',
    },
    {
      id: 5,
      name: 'apply vs 向量化操作效能比較',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '效能陷阱：為什麼你的程式碼慢 100 倍？',
        narrative: 'Meta 面試官給你看兩段功能相同的 Pandas 程式碼，問你哪個效能更好。這是區分會用 Pandas 和「真正懂」Pandas 的關鍵面試題。',
      },
      question: '以下三種方式都是計算 BMI（體重/身高平方），哪個效能最好？假設 DataFrame 有 100 萬列。\n\n```python\n# 方式 A：for 迴圈\nfor i in range(len(df)):\n    df.loc[i, "bmi"] = df.loc[i, "weight"] / df.loc[i, "height"]**2\n\n# 方式 B：apply\ndf["bmi"] = df.apply(lambda row: row["weight"] / row["height"]**2, axis=1)\n\n# 方式 C：向量化\ndf["bmi"] = df["weight"] / df["height"]**2\n```',
      options: [
        { id: 'A', text: 'A 最快，因為直接操作記憶體', explanation: 'for 迴圈 + df.loc 是最慢的方式，每次迭代都有大量 Python 物件開銷。' },
        { id: 'B', text: 'B 最快，因為 apply 是 Pandas 內建優化', explanation: 'apply 實際上還是 Python 層級的迴圈，只是語法比較簡潔，並沒有真正向量化。' },
        { id: 'C', text: 'C 最快，向量化操作直接呼叫底層 C/NumPy 引擎', explanation: '正確！向量化操作在 C/NumPy 層級批量處理，避免了 Python 迴圈的開銷。效能差距：C 約比 A 快 100-1000 倍，比 B 快 10-100 倍。' },
        { id: 'D', text: '三者效能相同，只是寫法不同', explanation: '效能差距非常大，尤其在大數據量（百萬列以上）時。' },
      ],
      correctAnswer: 'C',
      hints: ['Pandas 底層使用 NumPy，NumPy 的運算是在 C 層級執行的', 'apply 看起來像向量化但其實不是', 'for 迴圈在 Pandas 中幾乎總是最慢的方式'],
      explanation: 'Pandas 效能金字塔（從快到慢）：\n1. 向量化操作（NumPy/C 層級）：df["a"] + df["b"]\n2. apply（Python 層級迴圈，語法簡潔但不快）\n3. itertuples()（比 iterrows 快）\n4. iterrows()（很慢）\n5. for + df.loc/iloc（最慢）\n\n規則：能用向量化就不要用 apply，能用 apply 就不要用 for 迴圈。',
      frameworkTip: '面試時主動提到「我會優先用向量化操作而非 apply 或 for 迴圈」，並解釋為什麼（C/NumPy 底層 vs Python 迴圈），這是 Meta 和 Google 資料科學面試的加分項。',
    },
    {
      id: 6,
      name: '複合排序與 nlargest',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '廣告投放 ROI 分析',
        narrative: '你在分析 Meta 的廣告投放數據，需要找出 ROI 最高的前 N 個廣告活動，並處理同 ROI 時按花費升序排列的情況。',
      },
      question: '寫一個函式 top_campaigns(df, n)：\n1. 計算 ROI 欄位 = (revenue - cost) / cost\n2. 篩選出 ROI > 0 的廣告活動\n3. 按 ROI 降序排列，ROI 相同時按 cost 升序排列\n4. 回傳前 n 筆\n\n範例 DataFrame 有 campaign, cost, revenue 三個欄位。',
      starterCode: 'import pandas as pd\n\ndef top_campaigns(df, n):\n    # 1. 計算 ROI\n    # 2. 篩選 ROI > 0\n    # 3. 複合排序\n    # 4. 取前 n 筆\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef top_campaigns(df, n):\n    df = df.copy()\n    df["roi"] = (df["revenue"] - df["cost"]) / df["cost"]\n    profitable = df[df["roi"] > 0]\n    sorted_df = profitable.sort_values(\n        ["roi", "cost"], ascending=[False, True]\n    )\n    return sorted_df.head(n)',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"campaign": ["A", "B", "C"], "cost": [100, 200, 50], "revenue": [300, 150, 200]})\nlen(top_campaigns(df, 2))' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"campaign": ["X"], "cost": [100], "revenue": [50]})\nlen(top_campaigns(df, 5))' },
      ],
      hints: ['sort_values 可接受 list 做多欄排序', 'ascending 也可以是 list，對應每個排序欄位的方向', 'head(n) 取前 n 筆，等效於 nlargest 但更靈活'],
      explanation: 'Pandas 複合排序語法：\nsort_values(["col1", "col2"], ascending=[False, True])\n\n這表示先按 col1 降序，col1 相同時按 col2 升序。ascending 參數接受一個 list，對應每個排序欄位的方向。\n\nnlargest(n, "col") 適合單欄取最大的 n 筆，但複合排序時用 sort_values + head 更靈活。',
      frameworkTip: '面試中遇到排序題，記得考慮 tie-breaking（平手時的排序規則）。主動提出這一點展示你的嚴謹度。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-5: GroupBy & Aggregation — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '19-5': [
    {
      id: 3,
      name: 'pivot_table 樞紐分析',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: '銷售數據樞紐分析 — Google 面試題',
        narrative: 'Google 面試官要你用 Pandas 的 pivot_table 做一個跨維度的銷售分析，類似 Excel 的樞紐分析表但用程式碼實現。這考的是你能否快速做資料重塑（reshaping）。',
      },
      question: '給定銷售數據 DataFrame（欄位：region, quarter, product, revenue），用 pivot_table 建立：\n- 列（index）：region\n- 欄（columns）：quarter\n- 值（values）：revenue 的總和\n- 用 0 填充缺失值\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    "region": ["North", "North", "South", "South", "North", "South"],\n    "quarter": ["Q1", "Q2", "Q1", "Q2", "Q1", "Q3"],\n    "product": ["A", "B", "A", "A", "B", "A"],\n    "revenue": [100, 200, 150, 300, 50, 250]\n})\n```',
      starterCode: 'import pandas as pd\n\ndef create_pivot(df):\n    # 用 pivot_table 建立樞紐分析表\n    # index=region, columns=quarter, values=revenue, aggfunc=sum\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef create_pivot(df):\n    return pd.pivot_table(\n        df,\n        index="region",\n        columns="quarter",\n        values="revenue",\n        aggfunc="sum",\n        fill_value=0\n    )',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"region": ["N", "N", "S"], "quarter": ["Q1", "Q2", "Q1"], "product": ["A", "B", "A"], "revenue": [100, 200, 150]})\nresult = create_pivot(df)\nresult.loc["N", "Q1"]' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"region": ["N", "S"], "quarter": ["Q1", "Q2"], "product": ["A", "A"], "revenue": [100, 200]})\nresult = create_pivot(df)\nresult.loc["N", "Q2"]' },
      ],
      hints: ['pd.pivot_table() 的核心參數：index, columns, values, aggfunc', 'fill_value=0 把 NaN 填成 0', 'aggfunc 可以是 "sum", "mean", "count" 等'],
      explanation: 'pd.pivot_table 是 Pandas 最強大的資料重塑工具：\n- index：分組的列標籤（相當於 SQL GROUP BY）\n- columns：展開成欄的維度\n- values：要聚合的數值欄位\n- aggfunc：聚合函式（sum, mean, count, etc.）\n- fill_value：填充缺失值\n\n結果是一個交叉表，每個 cell 是該 region + quarter 組合的 revenue 總和。',
      frameworkTip: '面試時把 pivot_table 比喻成 Excel 的樞紐分析表，但更靈活。提到你可以同時對多個 values 用不同的 aggfunc，這展示你的進階 Pandas 能力。',
    },
    {
      id: 4,
      name: 'groupby + agg 多重聚合',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: '客戶行為多維度分析 — Meta/Google 高頻題',
        narrative: '你在面試中被要求對客戶交易數據做多維度的聚合分析：同時計算每個客戶的交易次數、總金額、平均金額和最大單筆交易。這是 Meta 和 Google 資料分析面試的高頻題型。',
      },
      question: '寫一個函式 customer_summary(df)：\n1. 按 customer_id 分組\n2. 同時計算 amount 的 count, sum, mean, max\n3. 將欄位重新命名為 txn_count, total_amount, avg_amount, max_amount\n4. 按 total_amount 降序排列\n5. 重設 index\n\nDataFrame 有 customer_id, amount, date 三個欄位。',
      starterCode: 'import pandas as pd\n\ndef customer_summary(df):\n    # groupby + agg 多重聚合\n    # 重命名欄位\n    # 排序 + reset_index\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef customer_summary(df):\n    summary = df.groupby("customer_id")["amount"].agg(\n        txn_count="count",\n        total_amount="sum",\n        avg_amount="mean",\n        max_amount="max"\n    ).sort_values("total_amount", ascending=False).reset_index()\n    return summary',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"customer_id": [1, 1, 2], "amount": [100, 200, 50], "date": ["2024-01-01", "2024-01-02", "2024-01-01"]})\nresult = customer_summary(df)\nresult["total_amount"].iloc[0]' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"customer_id": [1, 1, 1], "amount": [10, 20, 30], "date": ["a", "b", "c"]})\nresult = customer_summary(df)\nresult["txn_count"].iloc[0]' },
      ],
      hints: ['agg() 可用 named aggregation：agg(新欄名="聚合函式")', '這種語法同時完成聚合和重命名', 'reset_index() 把 groupby 的 key 變回普通欄位'],
      explanation: 'Pandas Named Aggregation 語法（推薦寫法）：\ndf.groupby("key")["col"].agg(\n    new_name1="func1",\n    new_name2="func2"\n)\n\n優點：一步完成聚合和重命名，比先 agg 再 rename 更簡潔。\n\n也可以對不同欄位做不同聚合：\ndf.groupby("key").agg(\n    total=("amount", "sum"),\n    avg_qty=("quantity", "mean")\n)',
      frameworkTip: '面試時展示 named aggregation 語法而不是 agg({"col": ["sum", "mean"]}) 再 rename，這展示你知道 Pandas 的最新最佳實踐。Google 面試特別看重程式碼的簡潔性和可讀性。',
    },
    {
      id: 5,
      name: 'groupby + transform 實戰',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'transform vs agg — 面試陷阱',
        narrative: 'Google 面試官問你：我想在原始 DataFrame 中新增一欄「該客戶的交易佔比」，你應該用 agg 還是 transform？這題考的是你對 groupby 回傳結構的理解。',
      },
      question: '以下程式碼的目的是計算每筆交易佔該客戶總消費的百分比。哪段程式碼能正確執行？\n\n```python\n# 方式 A\ndf["pct"] = df.groupby("customer_id")["amount"].transform("sum")\ndf["pct"] = df["amount"] / df["pct"]\n\n# 方式 B\ndf["pct"] = df["amount"] / df.groupby("customer_id")["amount"].agg("sum")\n\n# 方式 C\ntotals = df.groupby("customer_id")["amount"].sum()\ndf["pct"] = df["amount"] / df["customer_id"].map(totals)\n```',
      options: [
        { id: 'A', text: '只有方式 A 正確', explanation: '方式 A 和方式 C 都能正確執行。' },
        { id: 'B', text: '方式 A 和 C 正確，方式 B 會出錯或結果不對', explanation: '正確！transform 回傳與原 DataFrame 同樣長度的 Series（每列對應其分組的聚合值），可直接運算。agg 回傳的 Series 長度等於分組數，直接除會因 index 不對齊導致大量 NaN。方式 C 用 map 手動對齊也能正確執行。' },
        { id: 'C', text: '三種都正確，只是寫法不同', explanation: '方式 B 的 agg 結果 index 是 customer_id，與原 DataFrame 的 index（行號）不對齊。' },
        { id: 'D', text: '只有方式 C 正確', explanation: '方式 A 的 transform 也能正確執行。' },
      ],
      correctAnswer: 'B',
      hints: ['transform 回傳與原 DataFrame 同長度的結果', 'agg 回傳的結果長度等於分組數', 'index 不對齊會導致運算產生 NaN'],
      explanation: 'transform vs agg 的關鍵差異：\n- agg()：回傳每個分組的聚合值，結果的 index 是分組的 key，長度 = 分組數\n- transform()：回傳與原 DataFrame 同長度的結果，每列填入其所屬分組的聚合值\n\n當你需要把聚合結果「廣播」回原 DataFrame 時（如計算佔比、偏差），用 transform。\n當你只需要分組摘要時，用 agg。',
      frameworkTip: '面試時明確區分 transform 和 agg 的使用場景：「需要保持原始 DataFrame 行數用 transform，需要摘要用 agg」。這是 Google 資料科學面試的高頻考點。',
    },
  ],
}
