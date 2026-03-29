// ── World 19 Extra Challenges (Advanced Data Processing — Interview Classics) ──
// These challenges will be appended to the corresponding quests in World 19

export const w19ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-1: List Comprehension — 3 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '19-1': [
    {
      id: 5,
      name: 'Nested List Comprehension',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Transaction Data Matrix Transformation',
        narrative: 'You\'re on Meta\'s business analytics team and received nested transaction data. You need to flatten a 2D matrix into a 1D list while filtering out values below a threshold.',
      },
      question: 'Write a function flatten_filter(matrix, threshold) that uses nested list comprehension to flatten a 2D list, keeping only values greater than threshold, sorted in ascending order.\n\nExample:\nflatten_filter([[10, 200, 30], [400, 5, 60]], 50) → [60, 200, 400]',
      starterCode: 'def flatten_filter(matrix, threshold):\n    # Use nested list comprehension to flatten and filter\n    pass',
      expectedQuery: 'def flatten_filter(matrix, threshold):\n    return sorted([x for row in matrix for x in row if x > threshold])',
      testCases: [
        { input: 'flatten_filter([[10, 200, 30], [400, 5, 60]], 50)' },
        { input: 'flatten_filter([[1, 2], [3, 4]], 0)' },
        { input: 'flatten_filter([[1, 2], [3, 4]], 10)' },
      ],
      hints: ['Nested list comprehension order: outer for first, inner for second', 'The if condition goes at the end', 'Use sorted() to sort the result'],
      explanation: 'Nested list comprehension reading order:\n[expression for outer in outer_list for inner in inner_list if condition]\n\nEquivalent to:\nresult = []\nfor row in matrix:\n    for x in row:\n        if x > threshold:\n            result.append(x)\n\nThis is a commonly tested Python technique in interviews, showing you can concisely handle nested data.',
      frameworkTip: 'In interviews, first write the logic using for loops, verify correctness, then refactor into list comprehension. This shows your thought process is clear and structured.',
    },
    {
      id: 6,
      name: 'Generator vs List Comprehension',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'The Critical Memory Difference',
        narrative: 'A Meta interviewer asks: when processing 10 million user behavior records, what\'s the memory difference between list comprehension and generator expression? This is a classic question that separates junior from senior engineers.',
      },
      question: 'What is the main difference between these two code snippets?\n\n```python\n# Approach A\ntotal_a = sum([x**2 for x in range(10_000_000)])\n\n# Approach B\ntotal_b = sum(x**2 for x in range(10_000_000))\n```',
      options: [
        { id: 'A', text: 'Different results — Approach B will error', explanation: 'Both produce exactly the same result; only memory usage differs.' },
        { id: 'B', text: 'Same result, but A creates a full list in memory while B uses a generator that produces values one at a time with near-zero memory', explanation: 'Correct! List comprehension [x**2 for ...] builds a list of 10 million elements in memory. Generator expression (x**2 for ...) uses lazy evaluation, producing one value at a time with ~O(1) memory usage.' },
        { id: 'C', text: 'Same result, B is faster but uses the same memory', explanation: 'The main advantage of generators is memory efficiency, not speed.' },
        { id: 'D', text: 'B is a syntax error — sum() cannot take a generator', explanation: 'sum() can directly accept a generator expression, and this is actually the recommended approach.' },
      ],
      correctAnswer: 'B',
      hints: ['[] creates a full list, () creates a generator', 'Generator uses lazy evaluation', 'When you only need to iterate once without indexing, generator is better'],
      explanation: 'List comprehension vs Generator expression:\n- [x for x in iterable]: builds the complete list at once, O(n) memory\n- (x for x in iterable): lazy evaluation, produces one value at a time, O(1) memory\n\nWhen you only need to iterate once (sum, max, min, any, all), use a generator to save memory. Use a list when you need multiple accesses or slicing.',
      frameworkTip: 'Mentioning "I use generator expressions instead of list comprehensions when processing large datasets to save memory" shows scalability awareness — something Meta and Google highly value.',
    },
    {
      id: 7,
      name: 'Dict & Set Comprehension',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Quick Customer Spending Analysis',
        narrative: 'You\'re analyzing e-commerce order data and need to quickly build a dictionary of each customer\'s total spending, then find the set of VIP customers who spent above average.',
      },
      question: 'Given orders = [(customer, amount), ...], write two functions:\n1. total_by_customer(orders) — return a dict with customer name as key, total spending as value\n2. vip_customers(totals) — return a set of customer names who spent above average\n\nExample:\norders = [("Alice", 100), ("Bob", 200), ("Alice", 150), ("Bob", 50)]\ntotals = total_by_customer(orders) → {"Alice": 250, "Bob": 250}\nvip_customers({"Alice": 250, "Bob": 100, "Carol": 50}) → {"Alice", "Bob"}',
      starterCode: 'def total_by_customer(orders):\n    # Hint: accumulate using dict comprehension + sum\n    pass\n\ndef vip_customers(totals):\n    # Use set comprehension to find above-average customers\n    pass',
      expectedQuery: 'def total_by_customer(orders):\n    customers = set(c for c, _ in orders)\n    return {c: sum(a for cu, a in orders if cu == c) for c in customers}\n\ndef vip_customers(totals):\n    avg = sum(totals.values()) / len(totals)\n    return {c for c, v in totals.items() if v > avg}',
      testCases: [
        { input: 'total_by_customer([("Alice", 100), ("Bob", 200), ("Alice", 150), ("Bob", 50)])' },
        { input: 'vip_customers({"Alice": 250, "Bob": 100, "Carol": 50})' },
        { input: 'vip_customers({"X": 100, "Y": 100})' },
      ],
      hints: ['Dict comprehension: {key: value for ... if ...}', 'Set comprehension: {value for ... if ...}', 'Calculate the average first, then filter with comprehension'],
      explanation: 'Dict comprehension {k: v for ...} and set comprehension {v for ...} extend list comprehension:\n- Dict: {customer: total for customer in customers}\n- Set: {customer for customer, amount in totals.items() if amount > avg}\n\nThese tools let you complete complex data transformations in a single line.',
      frameworkTip: 'Showing you can flexibly use dict/set comprehension — not just list comprehension — tells the interviewer you have a comprehensive grasp of Python data structures.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-2: Readability & PEP 8 — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '19-2': [
    {
      id: 3,
      name: 'Code Refactoring Exercise',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'Fix Non-Compliant Code',
        narrative: 'You joined a data analytics team and the previous engineer left behind code that works correctly but has terrible style. Your manager asks you to refactor it to comply with PEP 8 and improve readability.',
      },
      question: 'Refactor the following code to comply with PEP 8. Requirements:\n1. Fix naming (variables use snake_case, constants use UPPER_CASE)\n2. Add proper spacing and blank lines\n3. Use more Pythonic idioms\n\n```python\ndef CalcStats(Data,minVal=0):\n  filteredData=[x for x in Data if x>=minVal]\n  N=len(filteredData)\n  if N==0:return None\n  Mean=sum(filteredData)/N\n  Variance=sum([(x-Mean)**2 for x in filteredData])/N\n  return {"mean":Mean,"variance":Variance,"count":N}\n```',
      starterCode: '# Refactor the code to comply with PEP 8\n# 1. Function and variable names use snake_case\n# 2. Add spaces around operators\n# 3. Use blank lines to separate logical blocks\n\ndef calc_stats(data, min_val=0):\n    pass',
      expectedQuery: 'def calc_stats(data, min_val=0):\n    """Calculate basic statistics for filtered data."""\n    filtered_data = [x for x in data if x >= min_val]\n    n = len(filtered_data)\n\n    if n == 0:\n        return None\n\n    mean = sum(filtered_data) / n\n    variance = sum((x - mean) ** 2 for x in filtered_data) / n\n\n    return {"mean": mean, "variance": variance, "count": n}',
      testCases: [
        { input: 'calc_stats([10, 20, 30])' },
        { input: 'calc_stats([5, 10, 15, 20], 10)' },
        { input: 'calc_stats([1, 2, 3], 100)' },
      ],
      hints: ['PEP 8: function and variable names use snake_case', 'Add spaces around operators (=, ==, >=, **, /)', 'Don\'t put return on the same line as if — use a new line with indentation'],
      explanation: 'Key PEP 8 refactoring items:\n1. Naming: CalcStats → calc_stats, filteredData → filtered_data\n2. Spacing: x>=minVal → x >= min_val\n3. Indentation: return after if should be on a new line\n4. Blank lines: add between logical blocks for readability\n5. Docstring: add a description at the function start\n6. Minor optimization: remove [] in sum([(x-Mean)**2 ...]) to use a generator instead',
      frameworkTip: 'In code review or pair programming interviews, proactively suggesting PEP 8 improvements shows your code quality awareness. Good naming habits are a key differentiator between beginners and experienced engineers.',
    },
    {
      id: 4,
      name: 'Naming Conventions & Readability',
      type: 'multiple-choice',
      difficulty: 'easy',
      sourceTag: 'Practical',
      scenario: {
        title: 'Python Naming Convention Quick Reference',
        narrative: 'A new data analyst on your team asks about Python naming conventions. As the team\'s Python mentor, you need to clearly explain which naming style to use in different scenarios.',
      },
      question: 'According to PEP 8, which group of naming conventions is entirely correct?\n\n```python\n# Group A\nMAX_RETRY_COUNT = 3\ndef calculate_revenue(raw_data):\n    total_amount = sum(raw_data)\n\n# Group B  \nMaxRetryCount = 3\ndef CalculateRevenue(rawData):\n    TotalAmount = sum(rawData)\n\n# Group C\nmax_retry_count = 3\ndef calculate_revenue(RawData):\n    total_amount = sum(RawData)\n\n# Group D\nMAX_RETRY_COUNT = 3\ndef Calculate_Revenue(raw_data):\n    total_amount = sum(raw_data)\n```',
      options: [
        { id: 'A', text: 'Group A', explanation: 'Correct! Constants use UPPER_SNAKE_CASE, functions and variables use lower_snake_case — this is the PEP 8 standard.' },
        { id: 'B', text: 'Group B', explanation: 'PascalCase is for classes, not functions or variables. camelCase (rawData) is a Java/JS convention, not used in Python.' },
        { id: 'C', text: 'Group C', explanation: 'The constant max_retry_count should use UPPER_SNAKE_CASE. The parameter RawData should use snake_case.' },
        { id: 'D', text: 'Group D', explanation: 'The function name Calculate_Revenue mixes PascalCase and snake_case — it should be entirely snake_case.' },
      ],
      correctAnswer: 'A',
      hints: ['Python variables and functions: snake_case', 'Constants: UPPER_SNAKE_CASE', 'Class names: PascalCase (not tested here)'],
      explanation: 'PEP 8 naming conventions:\n- Constants: UPPER_SNAKE_CASE (e.g., MAX_RETRY_COUNT)\n- Functions/methods: lower_snake_case (e.g., calculate_revenue)\n- Variables/parameters: lower_snake_case (e.g., raw_data)\n- Classes: PascalCase (e.g., DataProcessor)\n- Private attributes: leading underscore _private_var\n\nFollowing these conventions makes it immediately clear what each identifier represents.',
      frameworkTip: 'In interviews and at work, consistent naming conventions are the first impression of code quality. Mentioning PEP 8 in code reviews shows you value code maintainability.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-3: Pandas intro DataFrame — 3 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '19-3': [
    {
      id: 4,
      name: 'DataFrame Merge (Join Operations)',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'StrataScratch',
      scenario: {
        title: 'Left Join vs Inner Join — High-Frequency Interview Question',
        narrative: 'You\'re analyzing e-commerce data with two tables: orders and customers. The interviewer asks you to merge them using Pandas and explain the differences between join types.',
      },
      question: 'Given these two DataFrames:\n\n```python\nimport pandas as pd\n\norders = pd.DataFrame({\n    "order_id": [1, 2, 3, 4],\n    "customer_id": [101, 102, 103, 999],\n    "amount": [50, 30, 70, 20]\n})\n\ncustomers = pd.DataFrame({\n    "customer_id": [101, 102, 103, 104],\n    "name": ["Alice", "Bob", "Carol", "Dave"]\n})\n\nresult = orders.merge(customers, on="customer_id", how="left")\n```\n\nHow many rows does result have? What is the name value for customer_id=999?',
      options: [
        { id: 'A', text: '4 rows, name is NaN', explanation: 'Correct! Left join keeps all rows from the left table (orders). customer_id=999 has no match in customers, so name is NaN. Dave (customer_id=104) won\'t appear since he has no orders in the left table.' },
        { id: 'B', text: '3 rows, the customer_id=999 row is dropped', explanation: 'That\'s inner join behavior, not left join. Left join keeps all rows from the left table.' },
        { id: 'C', text: '5 rows, including Dave\'s row', explanation: 'That\'s outer join behavior. Left join only keeps all rows from the left table, not unique rows from the right.' },
        { id: 'D', text: '4 rows, name is empty string ""', explanation: 'When no match is found, Pandas uses NaN (not empty string) to represent missing values.' },
      ],
      correctAnswer: 'A',
      hints: ['Left join keeps all rows from the left table', 'Unmatched fields are filled with NaN', 'Inner join only keeps rows with matches on both sides'],
      explanation: 'Four types of Pandas merge joins:\n- inner (default): only keeps rows with matches on both sides\n- left: keeps all left table rows, fills NaN for unmatched right columns\n- right: keeps all right table rows, fills NaN for unmatched left columns\n- outer: keeps all rows from both sides, fills NaN for unmatched\n\nEquivalent to SQL INNER/LEFT/RIGHT/FULL OUTER JOIN.',
      frameworkTip: 'In interviews, draw a Venn diagram to explain join types — left join = entire left circle + intersection. This shows deep understanding of concepts shared between SQL and Pandas. Over 30% of StrataScratch problems involve merge/join operations.',
    },
    {
      id: 5,
      name: 'loc vs iloc Trap',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'StrataScratch',
      scenario: {
        title: 'The Fatal Difference Between loc and iloc',
        narrative: 'While practicing Pandas problems on StrataScratch, you notice many people make mistakes with loc and iloc. This question tests the critical difference in their slicing behavior.',
      },
      question: 'What is the output of this code?\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame(\n    {"product": ["A", "B", "C", "D", "E"]},\n    index=[10, 20, 30, 40, 50]\n)\n\nprint(len(df.loc[10:30]))\nprint(len(df.iloc[0:2]))\n```',
      options: [
        { id: 'A', text: '3, 2', explanation: 'Correct! loc uses label-based slicing that INCLUDES the endpoint (10, 20, 30 = 3 rows). iloc uses position-based slicing that EXCLUDES the endpoint (positions 0, 1 = 2 rows), consistent with Python list slicing.' },
        { id: 'B', text: '2, 2', explanation: 'loc slicing is inclusive of the endpoint, unlike standard Python slicing.' },
        { id: 'C', text: '3, 3', explanation: 'iloc slicing follows Python list conventions — it excludes the endpoint.' },
        { id: 'D', text: 'Raises KeyError', explanation: '10, 20, 30 are all valid index labels, so no error occurs.' },
      ],
      correctAnswer: 'A',
      hints: ['loc uses labels, slicing is inclusive of endpoint', 'iloc uses integer positions, slicing excludes endpoint', 'This is one of the most confusing aspects of Pandas'],
      explanation: 'Key difference between loc and iloc:\n- df.loc[start:end]: label-based indexing, slice INCLUDES end (inclusive)\n- df.iloc[start:end]: position-based indexing, slice EXCLUDES end (exclusive), consistent with Python list/range\n\nMnemonic: loc = label + inclusive, iloc = integer + exclusive (follows Python convention).',
      frameworkTip: 'In interviews, clearly state "loc uses labels and includes the endpoint, iloc uses positions and excludes the endpoint." This is one of the most common Pandas trap questions — getting it right immediately establishes credibility.',
    },
    {
      id: 6,
      name: 'DataFrame Creation & Basic Operations',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'StrataScratch',
      scenario: {
        title: 'Quick Sales Data Analysis',
        narrative: 'You\'re on a retail company\'s data team and need to create a DataFrame from raw dictionary data, perform column calculations, and merge product category information.',
      },
      question: 'Complete the following tasks:\n1. Create a DataFrame from sales_data\n2. Add a total column = quantity * price\n3. Inner merge sales_df with categories_df\n4. Return the merged DataFrame\n\n```python\nsales_data = {\n    "product_id": [1, 2, 3],\n    "quantity": [10, 5, 8],\n    "price": [100, 200, 150]\n}\ncategories_data = {\n    "product_id": [1, 2, 4],\n    "category": ["Electronics", "Clothing", "Food"]\n}\n```',
      starterCode: 'import pandas as pd\n\ndef process_sales(sales_data, categories_data):\n    # 1. Create DataFrames\n    # 2. Add total column\n    # 3. Inner merge\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef process_sales(sales_data, categories_data):\n    sales_df = pd.DataFrame(sales_data)\n    categories_df = pd.DataFrame(categories_data)\n    sales_df["total"] = sales_df["quantity"] * sales_df["price"]\n    result = sales_df.merge(categories_df, on="product_id", how="inner")\n    return result',
      testCases: [
        { input: 'import pandas as pd\nresult = process_sales({"product_id": [1, 2, 3], "quantity": [10, 5, 8], "price": [100, 200, 150]}, {"product_id": [1, 2, 4], "category": ["Electronics", "Clothing", "Food"]})\nlen(result)' },
        { input: 'import pandas as pd\nresult = process_sales({"product_id": [1, 2, 3], "quantity": [10, 5, 8], "price": [100, 200, 150]}, {"product_id": [1, 2, 4], "category": ["Electronics", "Clothing", "Food"]})\nlist(result["total"])' },
      ],
      hints: ['pd.DataFrame(dict) creates a DataFrame from a dictionary', 'df["new_col"] = df["col1"] * df["col2"] adds a computed column', 'df1.merge(df2, on="key", how="inner") for inner join'],
      explanation: 'Standard Pandas workflow:\n1. pd.DataFrame(dict) to create a table\n2. df["new_col"] = expression to add columns\n3. df1.merge(df2, on="key", how="inner") to join tables\n\nInner merge only keeps rows where product_id exists in both tables (1 and 2); product_id=3 and 4 are excluded.',
      frameworkTip: 'When tackling Pandas problems in interviews, first explain your data processing pipeline (create → compute → merge → filter), then implement step by step. This shows structured analytical thinking.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-4: Data filtering & sorting — 3 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '19-4': [
    {
      id: 4,
      name: 'Multi-Condition Filtering & apply',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'User Behavior Data Analysis',
        narrative: 'You\'re on Meta\'s Growth team and need to filter high-value users meeting multiple conditions from user activity data, then calculate an engagement score using a custom function.',
      },
      question: 'Complete the following tasks:\n1. Filter users with sessions > 5 AND purchases > 0\n2. Use apply to calculate engagement_score = sessions * 0.3 + purchases * 0.7 for each row\n3. Sort by engagement_score in descending order\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    "user_id": [1, 2, 3, 4, 5],\n    "sessions": [10, 3, 8, 15, 2],\n    "purchases": [2, 0, 5, 1, 3]\n})\n```',
      starterCode: 'import pandas as pd\n\ndef analyze_users(df):\n    # 1. Multi-condition filter\n    # 2. Use apply to calculate engagement_score\n    # 3. Sort descending\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef analyze_users(df):\n    filtered = df[(df["sessions"] > 5) & (df["purchases"] > 0)]\n    filtered = filtered.copy()\n    filtered["engagement_score"] = filtered.apply(\n        lambda row: row["sessions"] * 0.3 + row["purchases"] * 0.7, axis=1\n    )\n    return filtered.sort_values("engagement_score", ascending=False)',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"user_id": [1, 2, 3, 4, 5], "sessions": [10, 3, 8, 15, 2], "purchases": [2, 0, 5, 1, 3]})\nresult = analyze_users(df)\nlen(result)' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"user_id": [1, 2, 3, 4, 5], "sessions": [10, 3, 8, 15, 2], "purchases": [2, 0, 5, 1, 3]})\nresult = analyze_users(df)\nlist(result["user_id"])' },
      ],
      hints: ['Multi-condition filtering uses & to connect conditions, each wrapped in parentheses', 'apply(func, axis=1) applies the function to each row', 'sort_values("col", ascending=False) for descending order'],
      explanation: 'Pandas multi-condition filtering syntax:\n- df[(cond1) & (cond2)]: AND conditions\n- df[(cond1) | (cond2)]: OR conditions\n- Each condition MUST be wrapped in parentheses!\n\napply(func, axis=1) applies a custom function to each row; axis=0 applies to each column. sort_values with ascending=False means descending order.',
      frameworkTip: 'When mentioning apply in interviews, add that "for simple operations, vectorized operations are faster than apply." This shows performance awareness and earns bonus points.',
    },
    {
      id: 5,
      name: 'apply vs Vectorized Operations Performance',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Performance Trap: Why Is Your Code 100x Slower?',
        narrative: 'A Meta interviewer shows you two functionally identical Pandas code snippets and asks which performs better. This is the key interview question that separates those who "use" Pandas from those who truly "understand" it.',
      },
      question: 'All three approaches calculate BMI (weight / height squared). Which performs best with 1 million rows?\n\n```python\n# Approach A: for loop\nfor i in range(len(df)):\n    df.loc[i, "bmi"] = df.loc[i, "weight"] / df.loc[i, "height"]**2\n\n# Approach B: apply\ndf["bmi"] = df.apply(lambda row: row["weight"] / row["height"]**2, axis=1)\n\n# Approach C: vectorized\ndf["bmi"] = df["weight"] / df["height"]**2\n```',
      options: [
        { id: 'A', text: 'A is fastest — it directly manipulates memory', explanation: 'for loop + df.loc is the slowest approach due to massive Python object overhead per iteration.' },
        { id: 'B', text: 'B is fastest — apply is a Pandas built-in optimization', explanation: 'apply is still a Python-level loop under the hood — it\'s just syntactically cleaner, not truly vectorized.' },
        { id: 'C', text: 'C is fastest — vectorized operations use the underlying C/NumPy engine', explanation: 'Correct! Vectorized operations process data in bulk at the C/NumPy level, avoiding Python loop overhead. Performance gap: C is ~100-1000x faster than A, ~10-100x faster than B.' },
        { id: 'D', text: 'All three perform equally — just different syntax', explanation: 'The performance gap is enormous, especially with large datasets (millions of rows).' },
      ],
      correctAnswer: 'C',
      hints: ['Pandas uses NumPy under the hood, and NumPy operations execute at the C level', 'apply looks vectorized but actually isn\'t', 'for loops in Pandas are almost always the slowest approach'],
      explanation: 'Pandas performance pyramid (fastest to slowest):\n1. Vectorized operations (NumPy/C level): df["a"] + df["b"]\n2. apply (Python-level loop, clean syntax but not fast)\n3. itertuples() (faster than iterrows)\n4. iterrows() (slow)\n5. for + df.loc/iloc (slowest)\n\nRule: use vectorized over apply, use apply over for loops.',
      frameworkTip: 'Proactively stating "I prioritize vectorized operations over apply or for loops" and explaining why (C/NumPy engine vs Python loops) is a strong signal in Meta and Google data science interviews.',
    },
    {
      id: 6,
      name: 'Compound Sorting & nlargest',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Ad Campaign ROI Analysis',
        narrative: 'You\'re analyzing Meta\'s ad campaign data and need to find the top N campaigns by ROI, with tie-breaking by cost in ascending order when ROI values are equal.',
      },
      question: 'Write a function top_campaigns(df, n):\n1. Calculate ROI column = (revenue - cost) / cost\n2. Filter campaigns with ROI > 0\n3. Sort by ROI descending, then by cost ascending for ties\n4. Return top n rows\n\nThe DataFrame has campaign, cost, and revenue columns.',
      starterCode: 'import pandas as pd\n\ndef top_campaigns(df, n):\n    # 1. Calculate ROI\n    # 2. Filter ROI > 0\n    # 3. Compound sort\n    # 4. Return top n\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef top_campaigns(df, n):\n    df = df.copy()\n    df["roi"] = (df["revenue"] - df["cost"]) / df["cost"]\n    profitable = df[df["roi"] > 0]\n    sorted_df = profitable.sort_values(\n        ["roi", "cost"], ascending=[False, True]\n    )\n    return sorted_df.head(n)',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"campaign": ["A", "B", "C"], "cost": [100, 200, 50], "revenue": [300, 180, 200]})\nresult = top_campaigns(df, 2)\nlist(result["campaign"])' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"campaign": ["A", "B"], "cost": [100, 100], "revenue": [50, 200]})\nresult = top_campaigns(df, 5)\nlen(result)' },
      ],
      hints: ['sort_values accepts a list for multi-column sorting', 'ascending can also be a list, one value per sort column', 'head(n) gets the top n rows — more flexible than nlargest for compound sorts'],
      explanation: 'Pandas compound sorting syntax:\nsort_values(["col1", "col2"], ascending=[False, True])\n\nThis sorts by col1 descending first, then by col2 ascending for ties. The ascending parameter accepts a list corresponding to each sort column.\n\nnlargest(n, "col") is good for single-column top-n, but sort_values + head is more flexible for compound sorting.',
      frameworkTip: 'When facing sorting problems in interviews, remember to consider tie-breaking rules. Proactively raising this point demonstrates thoroughness.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 19-5: GroupBy & Aggregation — 3 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '19-5': [
    {
      id: 3,
      name: 'pivot_table Pivot Analysis',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Sales Data Pivot Analysis — Google Interview',
        narrative: 'A Google interviewer asks you to use Pandas pivot_table for cross-dimensional sales analysis — like Excel\'s pivot table but implemented in code. This tests whether you can quickly reshape data.',
      },
      question: 'Given a sales DataFrame (columns: region, quarter, product, revenue), use pivot_table to create:\n- Rows (index): region\n- Columns: quarter\n- Values: sum of revenue\n- Fill missing values with 0\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    "region": ["North", "North", "South", "South", "North", "South"],\n    "quarter": ["Q1", "Q2", "Q1", "Q2", "Q1", "Q3"],\n    "product": ["A", "B", "A", "A", "B", "A"],\n    "revenue": [100, 200, 150, 300, 50, 250]\n})\n```',
      starterCode: 'import pandas as pd\n\ndef create_pivot(df):\n    # Use pivot_table to create a pivot analysis table\n    # index=region, columns=quarter, values=revenue, aggfunc=sum\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef create_pivot(df):\n    return pd.pivot_table(\n        df,\n        index="region",\n        columns="quarter",\n        values="revenue",\n        aggfunc="sum",\n        fill_value=0\n    )',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"region": ["North", "North", "South", "South", "North", "South"], "quarter": ["Q1", "Q2", "Q1", "Q2", "Q1", "Q3"], "product": ["A", "B", "A", "A", "B", "A"], "revenue": [100, 200, 150, 300, 50, 250]})\nresult = create_pivot(df)\nresult.loc["North", "Q1"]' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"region": ["North", "North", "South", "South", "North", "South"], "quarter": ["Q1", "Q2", "Q1", "Q2", "Q1", "Q3"], "product": ["A", "B", "A", "A", "B", "A"], "revenue": [100, 200, 150, 300, 50, 250]})\nresult = create_pivot(df)\nresult.loc["South", "Q3"]' },
      ],
      hints: ['Core parameters of pd.pivot_table(): index, columns, values, aggfunc', 'fill_value=0 replaces NaN with 0', 'aggfunc can be "sum", "mean", "count", etc.'],
      explanation: 'pd.pivot_table is Pandas\' most powerful data reshaping tool:\n- index: row grouping labels (like SQL GROUP BY)\n- columns: dimension to spread into columns\n- values: numeric column to aggregate\n- aggfunc: aggregation function (sum, mean, count, etc.)\n- fill_value: fill missing values\n\nThe result is a cross-tabulation where each cell is the revenue sum for that region + quarter combination.',
      frameworkTip: 'In interviews, compare pivot_table to Excel\'s pivot table but more flexible. Mention you can apply different aggfuncs to multiple values simultaneously — this demonstrates advanced Pandas skills.',
    },
    {
      id: 4,
      name: 'groupby + agg Multiple Aggregations',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Multi-Dimensional Customer Analysis — Meta/Google High-Frequency',
        narrative: 'In an interview, you\'re asked to perform multi-dimensional aggregation on customer transaction data: simultaneously calculate each customer\'s transaction count, total amount, average amount, and max single transaction. This is a high-frequency question type at Meta and Google.',
      },
      question: 'Write a function customer_summary(df):\n1. Group by customer_id\n2. Simultaneously calculate count, sum, mean, max of amount\n3. Rename columns to txn_count, total_amount, avg_amount, max_amount\n4. Sort by total_amount descending\n5. Reset index\n\nThe DataFrame has customer_id, amount, and date columns.',
      starterCode: 'import pandas as pd\n\ndef customer_summary(df):\n    # groupby + agg multiple aggregations\n    # Rename columns\n    # Sort + reset_index\n    pass',
      expectedQuery: 'import pandas as pd\n\ndef customer_summary(df):\n    summary = df.groupby("customer_id")["amount"].agg(\n        txn_count="count",\n        total_amount="sum",\n        avg_amount="mean",\n        max_amount="max"\n    ).sort_values("total_amount", ascending=False).reset_index()\n    return summary',
      testCases: [
        { input: 'import pandas as pd\ndf = pd.DataFrame({"customer_id": [1, 1, 2, 2, 2], "amount": [100, 200, 50, 150, 100], "date": ["2024-01-01"]*5})\nresult = customer_summary(df)\nlist(result["customer_id"])' },
        { input: 'import pandas as pd\ndf = pd.DataFrame({"customer_id": [1, 1, 2, 2, 2], "amount": [100, 200, 50, 150, 100], "date": ["2024-01-01"]*5})\nresult = customer_summary(df)\nlist(result["total_amount"])' },
      ],
      hints: ['agg() supports named aggregation: agg(new_name="agg_func")', 'This syntax handles aggregation and renaming in one step', 'reset_index() converts the groupby key back to a regular column'],
      explanation: 'Pandas Named Aggregation syntax (recommended):\ndf.groupby("key")["col"].agg(\n    new_name1="func1",\n    new_name2="func2"\n)\n\nAdvantage: aggregation and renaming in one step, cleaner than agg then rename.\n\nYou can also aggregate different columns differently:\ndf.groupby("key").agg(\n    total=("amount", "sum"),\n    avg_qty=("quantity", "mean")\n)',
      frameworkTip: 'Using named aggregation syntax instead of agg({"col": ["sum", "mean"]}) then rename shows you know Pandas best practices. Google interviews especially value code conciseness and readability.',
    },
    {
      id: 5,
      name: 'groupby + transform in Practice',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'transform vs agg — Interview Trap',
        narrative: 'A Google interviewer asks: I want to add a column showing each transaction\'s percentage of that customer\'s total spending. Should you use agg or transform? This tests your understanding of groupby return structures.',
      },
      question: 'The goal is to calculate each transaction\'s percentage of the customer\'s total spending. Which code works correctly?\n\n```python\n# Approach A\ndf["pct"] = df.groupby("customer_id")["amount"].transform("sum")\ndf["pct"] = df["amount"] / df["pct"]\n\n# Approach B\ndf["pct"] = df["amount"] / df.groupby("customer_id")["amount"].agg("sum")\n\n# Approach C\ntotals = df.groupby("customer_id")["amount"].sum()\ndf["pct"] = df["amount"] / df["customer_id"].map(totals)\n```',
      options: [
        { id: 'A', text: 'Only Approach A is correct', explanation: 'Both Approach A and C work correctly.' },
        { id: 'B', text: 'A and C are correct; B will error or give wrong results', explanation: 'Correct! transform returns a Series with the same length as the original DataFrame (each row gets its group\'s aggregated value), enabling direct arithmetic. agg returns a Series with length equal to the number of groups — dividing directly causes index misalignment and produces NaN values. Approach C uses map to manually align and also works correctly.' },
        { id: 'C', text: 'All three are correct, just different syntax', explanation: 'Approach B\'s agg result has customer_id as its index, which doesn\'t align with the original DataFrame\'s index (row numbers).' },
        { id: 'D', text: 'Only Approach C is correct', explanation: 'Approach A with transform also works correctly.' },
      ],
      correctAnswer: 'B',
      hints: ['transform returns results with the same length as the original DataFrame', 'agg returns results with length equal to the number of groups', 'Index misalignment causes arithmetic operations to produce NaN'],
      explanation: 'Key difference between transform and agg:\n- agg(): returns one aggregated value per group; result index = group keys, length = number of groups\n- transform(): returns results with the same length as the original DataFrame; each row gets its group\'s aggregated value\n\nUse transform when you need to "broadcast" aggregated results back to the original DataFrame (e.g., percentages, deviations).\nUse agg when you only need group summaries.',
      frameworkTip: 'In interviews, clearly distinguish transform and agg use cases: "Use transform to keep original row count, use agg for summaries." This is a high-frequency topic in Google data science interviews.',
    },
  ],
}
