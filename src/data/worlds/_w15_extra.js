// ── World 15 額外挑戰（Python 面試經典題）──────────────────
// 這些挑戰會被 append 到 World 15 對應的 quest 中

export const w15Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 15-1: 變數與資料型態 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '15-1': [
    {
      id: 5,
      name: 'isinstance vs type',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '型態檢查的正確方式',
        narrative: '你在 code review 時看到同事用 type(x) == int 來檢查型態，但 senior engineer 說這樣不好。你需要理解為什麼。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nclass MyInt(int):\n    pass\n\nx = MyInt(42)\nprint(type(x) == int)\nprint(isinstance(x, int))\n```',
      options: [
        { id: 'A', text: 'True, True', explanation: 'type(x) 回傳 MyInt，不是 int，所以第一個是 False。' },
        { id: 'B', text: 'False, True', explanation: '正確！type() 嚴格比對，不考慮繼承；isinstance() 會檢查繼承鏈，MyInt 繼承自 int 所以是 True。' },
        { id: 'C', text: 'True, False', explanation: 'isinstance 檢查的是「是否為該型態或其子類別」。' },
        { id: 'D', text: 'False, False', explanation: 'MyInt 繼承自 int，isinstance 會回傳 True。' },
      ],
      correctAnswer: 'B',
      hints: ['type() 只檢查精確型態，isinstance() 會考慮繼承關係', 'MyInt 是 int 的子類別'],
      explanation: 'type(x) == int 只在 x 「精確是」int 時為 True。isinstance(x, int) 則會沿著繼承鏈檢查（MRO），MyInt → int → object，所以回傳 True。實務中幾乎都應該用 isinstance()。',
      frameworkTip: '面試時提到型態檢查，說「用 isinstance 而非 type 比對」會讓面試官知道你理解 Python 的繼承機制。這是 Google 常考的基礎題。',
    },
    {
      id: 6,
      name: '可變預設參數陷阱',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Python 最經典的陷阱',
        narrative: '面試官給你看了一段程式碼，問你輸出是什麼。這是 Python 面試中最著名的陷阱題之一。',
      },
      question: '以下程式碼執行後，result 的值是什麼？\n\n```python\ndef append_to(item, lst=[]):\n    lst.append(item)\n    return lst\n\nresult1 = append_to(1)\nresult2 = append_to(2)\nresult = result2\n```',
      options: [
        { id: 'A', text: '[2]', explanation: '預設的 list 在函式定義時只建立一次，後續呼叫共用同一個 list。' },
        { id: 'B', text: '[1, 2]', explanation: '正確！Python 的預設參數在函式定義時就被建立，且只建立一次。後續呼叫如果沒傳 lst，都是操作同一個 list 物件。' },
        { id: 'C', text: '[1]', explanation: '第二次呼叫 append_to(2) 也會在同一個 list 上操作。' },
        { id: 'D', text: '報錯 TypeError', explanation: '這段程式碼語法完全正確，不會報錯。' },
      ],
      correctAnswer: 'B',
      hints: ['Python 預設參數只在函式定義時評估一次', '可變物件（list, dict）作為預設值會跨呼叫共享'],
      explanation: '這是 Python 最經典的陷阱：mutable default argument。解法是用 None 當預設值：\n\ndef append_to(item, lst=None):\n    if lst is None:\n        lst = []\n    lst.append(item)\n    return lst',
      frameworkTip: '面試時如果被問到 Python 的「gotcha」或「常見錯誤」，這題幾乎必考。記住：永遠不要用可變物件（list, dict, set）當函式預設值。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 15-2: Input/Output 與字串格式化 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '15-2': [
    {
      id: 4,
      name: 'f-string 進階格式化',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: '財務報表格式化',
        narrative: '你在一家新創公司的財務團隊，需要產出一份格式整齊的月營收報表。每個數字要千分位分隔、對齊，百分比要精確到一位小數。',
      },
      question: '寫一個函式 format_report(name, revenue, growth)，回傳格式化的字串。name 左對齊 15 字元，revenue 右對齊 12 字元且有千分位逗號，growth 顯示為百分比（一位小數）。\n\n範例：format_report("January", 1234567.89, 0.156) → "January         $1,234,567.89  +15.6%"',
      starterCode: 'def format_report(name, revenue, growth):\n    # name: 左對齊 15 字元\n    # revenue: 右對齊 12 字元，千分位逗號，小數點兩位\n    # growth: 百分比，一位小數，正數加 + 號\n    pass',
      expectedQuery: 'def format_report(name, revenue, growth):\n    sign = "+" if growth >= 0 else ""\n    return f"{name:<15} ${revenue:>12,.2f}  {sign}{growth:.1%}"',
      testCases: [
        { input: 'format_report("January", 1234567.89, 0.156)' },
        { input: 'format_report("Q4 Report", 0, -0.05)' },
        { input: 'format_report("December", 999999.99, 0.0)' },
      ],
      hints: ['f-string 格式：{value:<15} 左對齊 15 字元', '{value:>12,.2f} 右對齊 12 字元 + 千分位 + 2 位小數', '{value:.1%} 自動乘 100 並加 % 號'],
      explanation: 'f-string 的格式化語法：\n- :<15 左對齊，:>12 右對齊\n- , 千分位分隔符號\n- .2f 兩位小數\n- .1% 自動 ×100 並顯示一位小數百分比\n這些在產生報表或對齊輸出時非常實用。',
      frameworkTip: '面試中展示你會用 f-string 的進階格式化（對齊、千分位、百分比），會讓面試官知道你不只會基礎語法，也懂得用 Python 產生 professional 的輸出。',
    },
    {
      id: 5,
      name: 'print 進階參數',
      type: 'multiple-choice',
      difficulty: 'easy',
      sourceTag: 'HackerRank',
      scenario: {
        title: 'print 的隱藏功能',
        narrative: '你要在一行中印出多個值，用特定的分隔符號，而且不要自動換行。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nprint("A", "B", "C", sep=" -> ", end=" !\\n")\nprint("D")\n```',
      options: [
        { id: 'A', text: 'A B C !\nD', explanation: 'sep 會替換掉預設的空格分隔。' },
        { id: 'B', text: 'A -> B -> C !\nD', explanation: '正確！sep 設定多個值之間的分隔符號（預設空格），end 設定結尾字元（預設 \\n）。' },
        { id: 'C', text: 'A -> B -> C\n !\nD', explanation: '! 不會換行後才印出，end 是直接接在最後。' },
        { id: 'D', text: 'ABC -> !\nD', explanation: 'sep 是放在多個值「之間」，不是放在最後。' },
      ],
      correctAnswer: 'B',
      hints: ['sep 設定多個參數之間的分隔符', 'end 設定印完後的結尾（預設是換行 \\n）'],
      explanation: 'print() 的兩個實用參數：sep（separator，多個值之間的分隔符，預設空格）和 end（印完後的結尾，預設 \\n 換行）。',
      frameworkTip: '雖然 print 的 sep/end 參數在面試中不常直接考，但了解它們能幫你快速 debug 和格式化輸出，展示你對 Python 內建函式的掌握度。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 15-3: 運算子與表達式 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '15-3': [
    {
      id: 3,
      name: '短路求值',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '短路求值的實際應用',
        narrative: '你在看一段 Python 程式碼，發現一些用 or 和 and 做預設值的寫法。你需要理解短路求值（short-circuit evaluation）的規則。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\na = "" or "default"\nb = "hello" or "world"\nc = 0 and "yes"\nd = 1 and "yes"\nprint(a, b, c, d)\n```',
      options: [
        { id: 'A', text: 'default hello 0 yes', explanation: '正確！or 回傳第一個 truthy 值或最後一個值；and 在第一個 falsy 時停下並回傳它，否則回傳最後一個值。' },
        { id: 'B', text: 'True True False True', explanation: 'or 和 and 不是回傳 True/False，而是回傳實際的值。' },
        { id: 'C', text: 'default world 0 1', explanation: 'or 在找到第一個 truthy 值時就停下，不會繼續到 "world"。' },
        { id: 'D', text: '"" hello False yes', explanation: 'or 在第一個值是 falsy 時會繼續看第二個值。' },
      ],
      correctAnswer: 'A',
      hints: ['or 回傳第一個 truthy 值（不是 True/False）', 'and 在遇到 falsy 值時停下並回傳它', '空字串 "" 和 0 都是 falsy'],
      explanation: 'Python 的短路求值：\n- x or y：如果 x 是 truthy，回傳 x；否則回傳 y\n- x and y：如果 x 是 falsy，回傳 x；否則回傳 y\n\n常見用法：name = user_input or "Anonymous"（提供預設值）',
      frameworkTip: '短路求值在實務中很常用，像是 config.get("key") or default_value。面試時展示你懂這種 Pythonic 寫法。',
    },
    {
      id: 4,
      name: '整數除法與取餘',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '時間轉換工具',
        narrative: '你在開發一個專案管理工具，需要把秒數轉換成「X 小時 Y 分 Z 秒」的格式。',
      },
      question: '寫一個函式 format_time(seconds)，把秒數轉換成 "Xh Ym Zs" 格式。\n\n範例：format_time(3661) → "1h 1m 1s"\nformat_time(90) → "0h 1m 30s"',
      starterCode: 'def format_time(seconds):\n    # 用 // 和 % 拆解成時、分、秒\n    pass',
      expectedQuery: 'def format_time(seconds):\n    h = seconds // 3600\n    m = (seconds % 3600) // 60\n    s = seconds % 60\n    return f"{h}h {m}m {s}s"',
      testCases: [
        { input: 'format_time(3661)' },
        { input: 'format_time(90)' },
        { input: 'format_time(0)' },
        { input: 'format_time(86399)' },
      ],
      hints: ['1 小時 = 3600 秒', '// 是整數除法，% 是取餘數', '先算小時，再從剩餘秒數算分鐘'],
      explanation: '整數除法 // 和取餘 % 是處理時間轉換、進位制轉換等問題的基本工具。\n- hours = seconds // 3600\n- minutes = (seconds % 3600) // 60\n- secs = seconds % 60',
      frameworkTip: '時間轉換是面試和 LeetCode 的常見基礎題。記住 // 和 % 的組合用法：// 取商，% 取餘。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 15-4: 條件判斷 if/elif/else — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '15-4': [
    {
      id: 3,
      name: 'FizzBuzz',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'FizzBuzz — 史上最經典面試題',
        narrative: '這是程式面試中最經典的入門題，Google、Meta、Amazon 都曾用過它來篩選候選人。規則很簡單，但能測試你對條件判斷順序的理解。',
      },
      question: '寫一個函式 fizzbuzz(n)，回傳一個 list：\n- 如果數字能被 3 和 5 整除，放 "FizzBuzz"\n- 如果只能被 3 整除，放 "Fizz"\n- 如果只能被 5 整除，放 "Buzz"\n- 否則放數字本身（字串）\n\n範例：fizzbuzz(5) → ["1", "2", "Fizz", "4", "Buzz"]',
      starterCode: 'def fizzbuzz(n):\n    result = []\n    for i in range(1, n + 1):\n        # 判斷條件的順序很重要！\n        pass\n    return result',
      expectedQuery: 'def fizzbuzz(n):\n    result = []\n    for i in range(1, n + 1):\n        if i % 3 == 0 and i % 5 == 0:\n            result.append("FizzBuzz")\n        elif i % 3 == 0:\n            result.append("Fizz")\n        elif i % 5 == 0:\n            result.append("Buzz")\n        else:\n            result.append(str(i))\n    return result',
      testCases: [
        { input: 'fizzbuzz(5)' },
        { input: 'fizzbuzz(15)' },
        { input: 'fizzbuzz(1)' },
      ],
      hints: ['先判斷「同時被 3 和 5 整除」，因為如果先判斷 3 就不會進到 FizzBuzz', '用 % 取餘數，等於 0 表示整除', '數字要轉成字串 str(i)'],
      explanation: 'FizzBuzz 看似簡單，但考點是：條件順序很重要！必須先判斷 3 AND 5，再判斷單獨的 3 或 5。如果順序反了，15 會被歸類為 "Fizz" 而非 "FizzBuzz"。',
      frameworkTip: 'FizzBuzz 面試時，先說明你的判斷順序邏輯（最嚴格的條件放最前），再寫程式碼。這展示你有思考過 edge case。',
    },
    {
      id: 4,
      name: '成績等級轉換',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'HackerRank',
      scenario: {
        title: '多條件分級',
        narrative: '你在做一個學生成績管理系統，需要把分數轉換成等級。這類分級問題在面試中很常見，考的是 elif 鏈的設計。',
      },
      question: '寫一個函式 grade(score)，根據分數回傳等級：\n- 90-100: "A"\n- 80-89: "B"\n- 70-79: "C"\n- 60-69: "D"\n- 0-59: "F"\n- 其他（負數或超過 100）: "Invalid"\n\n範例：grade(85) → "B"，grade(-1) → "Invalid"',
      starterCode: 'def grade(score):\n    # 注意邊界值和無效輸入\n    pass',
      expectedQuery: 'def grade(score):\n    if score < 0 or score > 100:\n        return "Invalid"\n    elif score >= 90:\n        return "A"\n    elif score >= 80:\n        return "B"\n    elif score >= 70:\n        return "C"\n    elif score >= 60:\n        return "D"\n    else:\n        return "F"',
      testCases: [
        { input: 'grade(85)' },
        { input: 'grade(90)' },
        { input: 'grade(59)' },
        { input: 'grade(-1)' },
      ],
      hints: ['先處理無效輸入（邊界檢查）', 'elif 從高到低判斷，每個條件自然排除了更高的分數', '注意邊界值 90, 80, 70, 60'],
      explanation: '多條件分級的最佳實踐：(1) 先處理無效輸入 (2) 用 elif 鏈從高到低判斷，因為前面的條件已經排除了更高的值 (3) 不需要寫 score >= 80 and score < 90，因為 elif 的串接已經保證了這一點。',
      frameworkTip: '面試中遇到分級問題，先處理 edge case（無效輸入），再從最嚴格的條件開始。這展示你的防禦性程式設計思維。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 15-5: 條件判斷進階 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '15-5': [
    {
      id: 3,
      name: 'is vs == 陷阱',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Python 身份 vs 相等',
        narrative: '這是 Google 和 Meta 面試中非常喜歡考的 Python 語言特性題。很多有經驗的開發者都會踩到這個坑。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\na = 256\nb = 256\nprint(a is b)\n\nc = 257\nd = 257\nprint(c is d)\n\ne = [1, 2, 3]\nf = [1, 2, 3]\nprint(e == f)\nprint(e is f)\n```',
      options: [
        { id: 'A', text: 'True, True, True, True', explanation: 'c is d 的結果取決於 Python 的 integer caching，257 超出快取範圍。' },
        { id: 'B', text: 'True, False, True, False', explanation: '正確！Python 快取 -5 到 256 的整數（integer interning），所以 256 is 256 為 True，但 257 is 257 為 False（不同物件）。兩個 list 內容相同（==）但不是同一個物件（is）。' },
        { id: 'C', text: 'True, True, True, False', explanation: '257 超出了 Python 的整數快取範圍（-5 到 256）。' },
        { id: 'D', text: 'False, False, True, False', explanation: '256 在 Python 的整數快取範圍內（-5 到 256），所以 a is b 為 True。' },
      ],
      correctAnswer: 'B',
      hints: ['is 比較的是記憶體位址（identity），== 比較的是值（equality）', 'Python 會快取 -5 到 256 之間的整數', '兩個獨立建立的 list 是不同的物件'],
      explanation: 'is 和 == 的關鍵區別：\n- == 比較值是否相等\n- is 比較是否為同一個物件（記憶體位址）\n\nPython 的 integer interning：-5 到 256 之間的整數會被快取，所以 a = 256; b = 256 時 a is b 為 True。但 257 超出範圍，每次建立新物件。\n\n注意：在互動式環境 vs 腳本中結果可能不同。',
      frameworkTip: '面試時記住：比較值用 ==，比較 None 用 is。永遠用 x is None 而不是 x == None，這是 PEP 8 的規定。',
    },
    {
      id: 4,
      name: 'Truthy/Falsy 完整列表',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Python 中什麼是「假」？',
        narrative: 'Meta 面試中常考：在 if 判斷中，哪些值會被當作 False？這對寫出簡潔的 Python 程式碼至關重要。',
      },
      question: '以下哪個選項列出的值在 if 判斷中都會被視為 False（falsy）？',
      options: [
        { id: 'A', text: '0, "", [], {}, None, False', explanation: '正確！這六個是 Python 中最常見的 falsy 值。還有 0.0, 0j, set(), tuple(), range(0) 等。' },
        { id: 'B', text: '0, "", [], {}, None, "False"', explanation: '"False" 是一個非空字串，它是 truthy！' },
        { id: 'C', text: '0, " ", [], {}, None, False', explanation: '" "（含空格的字串）是 truthy！只有 ""（空字串）才是 falsy。' },
        { id: 'D', text: '0, "", [0], {}, None, False', explanation: '[0] 是包含一個元素的 list，它是 truthy！只有 []（空 list）才是 falsy。' },
      ],
      correctAnswer: 'A',
      hints: ['空的容器（list, dict, set, tuple）都是 falsy', '非空字串都是 truthy，即使內容是 "0" 或 "False"', '數字 0（包括 0, 0.0, 0j）是 falsy'],
      explanation: 'Python 的 falsy 值：\n- None\n- False\n- 數字零：0, 0.0, 0j\n- 空序列："", [], ()\n- 空集合：{}, set()\n- 空 range：range(0)\n\n其他所有值都是 truthy。這讓你可以寫 if my_list: 而不是 if len(my_list) > 0:',
      frameworkTip: '面試中寫 if not data: 比 if data == [] or data == None: 更 Pythonic。展示你理解 truthy/falsy 概念。',
    },
  ],
}
