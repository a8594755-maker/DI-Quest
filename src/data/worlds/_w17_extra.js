// ── World 17 額外挑戰（Functions & Error Handling 面試經典題）──────────────────
// 這些挑戰會被 append 到 World 17 對應的 quest 中

export const w17Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-1: 函式基礎定義 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '17-1': [
    {
      id: 5,
      name: 'Pure Function vs Side Effects',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '純函式 vs 副作用',
        narrative: '你在 Google 面試中被問到函式式程式設計的核心概念。面試官給你看了三段程式碼，要你判斷哪個是「純函式」，以及為什麼這在大型系統中很重要。',
      },
      question: '以下哪個函式是「純函式」（Pure Function）？\n\n```python\ntotal = 0\n\ndef func_a(price, tax_rate):\n    global total\n    total += price * (1 + tax_rate)\n    return total\n\ndef func_b(price, tax_rate):\n    return price * (1 + tax_rate)\n\ndef func_c(price, tax_rate):\n    result = price * (1 + tax_rate)\n    print(f"計算結果：{result}")\n    return result\n```',
      options: [
        { id: 'A', text: 'func_a', explanation: 'func_a 修改了全域變數 total，這是典型的副作用（side effect）。' },
        { id: 'B', text: 'func_b', explanation: '正確！func_b 只依賴輸入參數，不修改外部狀態，相同輸入永遠產生相同輸出。這就是純函式的定義。' },
        { id: 'C', text: 'func_c', explanation: 'func_c 雖然回傳正確結果，但 print() 是 I/O 操作，屬於副作用。' },
        { id: 'D', text: 'func_a 和 func_c 都是', explanation: '兩者都有副作用：func_a 修改全域變數，func_c 執行 I/O 操作。' },
      ],
      correctAnswer: 'B',
      hints: ['純函式的兩個條件：(1) 相同輸入永遠回傳相同輸出 (2) 不產生副作用', '副作用包括：修改全域變數、I/O 操作、修改可變參數'],
      explanation: '純函式（Pure Function）必須滿足：\n1. 確定性：相同輸入 → 相同輸出\n2. 無副作用：不修改外部狀態、不做 I/O\n\n純函式的好處：容易測試、可平行化、可快取結果（memoization）。在 Google 等大公司，純函式是 code review 的重要準則。',
      frameworkTip: '面試時提到純函式，連結到「可測試性」和「可預測性」。Google 特別重視這點，因為大型分散式系統需要可靠的函式行為。',
    },
    {
      id: 6,
      name: 'First-Class Functions',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '函式作為一等公民',
        narrative: '你在開發一個電商平台的促銷引擎。不同的促銷活動有不同的折扣邏輯，你需要用「函式作為參數」的方式來設計一個靈活的定價系統，而不是寫一堆 if/else。',
      },
      question: '寫一個函式 apply_discount(price, discount_func)，接受價格和一個折扣函式作為參數，回傳折扣後的價格。\n\n然後寫兩個折扣函式：\n- percent_off(rate) 回傳一個函式，該函式將價格乘以 (1 - rate)\n- fixed_off(amount) 回傳一個函式，該函式將價格減去 amount（最低為 0）\n\n範例：\napply_discount(100, percent_off(0.2)) → 80.0\napply_discount(50, fixed_off(30)) → 20\napply_discount(10, fixed_off(30)) → 0',
      starterCode: 'def apply_discount(price, discount_func):\n    # 把 discount_func 當作函式來呼叫\n    pass\n\ndef percent_off(rate):\n    # 回傳一個折扣函式\n    pass\n\ndef fixed_off(amount):\n    # 回傳一個折扣函式\n    pass',
      expectedQuery: 'def apply_discount(price, discount_func):\n    return discount_func(price)\n\ndef percent_off(rate):\n    def discount(price):\n        return price * (1 - rate)\n    return discount\n\ndef fixed_off(amount):\n    def discount(price):\n        return max(0, price - amount)\n    return discount',
      testCases: [
        { input: 'apply_discount(100, percent_off(0.2))' },
        { input: 'apply_discount(50, fixed_off(30))' },
        { input: 'apply_discount(10, fixed_off(30))' },
      ],
      hints: ['Python 中函式是一等公民，可以當作參數傳遞', 'percent_off 和 fixed_off 需要回傳一個「函式」，不是回傳一個值', '用 max(0, ...) 確保價格不會變成負數'],
      explanation: '這題展示了 Python 的「一等函式」（First-Class Functions）特性：\n- 函式可以作為參數傳遞\n- 函式可以作為回傳值\n- 函式可以存在變數中\n\npercent_off 和 fixed_off 是「高階函式」（Higher-Order Functions）——它們回傳函式。這種模式在策略模式（Strategy Pattern）中非常常見。',
      frameworkTip: '面試時展示你會用函式作為參數，面試官會認為你理解函式式程式設計。提到「策略模式」或「高階函式」這些關鍵字會加分。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-2: 進階參數 *args/**kwargs — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '17-2': [
    {
      id: 3,
      name: '彈性 Logger 函式',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '用 *args/**kwargs 建構彈性 Logger',
        narrative: '你在 Amazon 的後端團隊，需要設計一個靈活的 logging 函式。不同的微服務需要記錄不同格式的 log，你要用 *args 和 **kwargs 來打造一個通用的 logger。',
      },
      question: '寫一個函式 smart_log(*args, **kwargs)：\n- 將所有 args 用 " | " 連接成訊息字串\n- 如果 kwargs 有 level，在訊息前加上 "[LEVEL] "（大寫）\n- 如果 kwargs 有 timestamp，在最前面加上 timestamp + " "\n- 回傳最終的 log 字串\n\n範例：\nsmart_log("User login", "id=123") → "User login | id=123"\nsmart_log("Error", "DB timeout", level="warning") → "[WARNING] Error | DB timeout"\nsmart_log("Sale", amount="$500", level="info", timestamp="2024-01-15") → "2024-01-15 [INFO] Sale"',
      starterCode: 'def smart_log(*args, **kwargs):\n    # 1. 用 " | " 連接所有 args\n    # 2. 檢查 kwargs 中的 level 和 timestamp\n    # 3. 組合最終字串\n    pass',
      expectedQuery: 'def smart_log(*args, **kwargs):\n    message = " | ".join(str(a) for a in args)\n    level = kwargs.get("level")\n    timestamp = kwargs.get("timestamp")\n    if level:\n        message = f"[{level.upper()}] {message}"\n    if timestamp:\n        message = f"{timestamp} {message}"\n    return message',
      testCases: [
        { input: 'smart_log("User login", "id=123")' },
        { input: 'smart_log("Error", "DB timeout", level="warning")' },
        { input: 'smart_log("Sale", level="info", timestamp="2024-01-15")' },
      ],
      hints: ['用 " | ".join() 連接 args', '用 kwargs.get("level") 安全取值', '注意組合順序：timestamp 在最前面，level 在訊息前面'],
      explanation: '*args 收集位置參數成 tuple，**kwargs 收集關鍵字參數成 dict。這種設計讓函式能接受任意數量和類型的參數，非常適合 logging、事件系統等需要彈性的場景。',
      frameworkTip: '面試時如果被問到 *args/**kwargs 的實際應用，log 系統和裝飾器（decorator）是最好的例子。Amazon 特別重視可擴展的系統設計。',
    },
    {
      id: 4,
      name: '函式簽名設計原則',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '函式參數設計的最佳實踐',
        narrative: '你在 Amazon 的 code review 中，資深工程師指出一個函式的參數設計有問題。你需要理解 Python 函式簽名的最佳實踐和參數順序規則。',
      },
      question: '以下哪個函式定義會引發 SyntaxError？\n\n```python\n# A\ndef func_a(a, b=10, *args, **kwargs):\n    pass\n\n# B\ndef func_b(a, *args, b=10, **kwargs):\n    pass\n\n# C\ndef func_c(a, **kwargs, *args):\n    pass\n\n# D\ndef func_d(*, key, value="default"):\n    pass\n```',
      options: [
        { id: 'A', text: 'func_a', explanation: 'func_a 的參數順序合法：一般參數 → 預設值參數 → *args → **kwargs。' },
        { id: 'B', text: 'func_b', explanation: 'func_b 合法！*args 後面的 b=10 變成 keyword-only 參數，只能用 func_b(1, 2, 3, b=20) 來傳。' },
        { id: 'C', text: 'func_c', explanation: '正確！**kwargs 必須在最後面，不能放在 *args 前面。Python 規定參數順序是：一般 → 預設值 → *args → keyword-only → **kwargs。' },
        { id: 'D', text: 'func_d', explanation: 'func_d 合法！* 後面的參數都是 keyword-only，必須用名字傳遞。' },
      ],
      correctAnswer: 'C',
      hints: ['Python 參數順序：positional → default → *args → keyword-only → **kwargs', '**kwargs 永遠在最後', '* 單獨出現表示後面的參數都是 keyword-only'],
      explanation: 'Python 函式參數的合法順序：\n1. 一般位置參數（a, b）\n2. 有預設值的參數（c=10）\n3. *args（收集額外位置參數）\n4. keyword-only 參數（*args 之後的參數）\n5. **kwargs（必須最後）\n\n特別注意：func_b 中 *args 後面的 b=10 自動成為 keyword-only 參數。',
      frameworkTip: '面試時能正確解釋 keyword-only 參數（PEP 3102）和參數順序規則，展示你對 Python 的深入理解。Amazon 重視清晰的 API 設計。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-3: 作用域與內建函式 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '17-3': [
    {
      id: 3,
      name: 'Closure 經典面試題',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: '閉包（Closure）— 計數器',
        narrative: '這是 Google 和 Meta 面試中的經典題。面試官要你不使用 class，只用函式來實作一個計數器。這考的是對閉包（Closure）的理解——內層函式「記住」外層函式的變數。',
      },
      question: '用閉包（Closure）實作一個計數器工廠函式 make_counter(start=0)：\n- 回傳一個函式 counter()\n- 每次呼叫 counter() 時，回傳目前的計數值並加 1\n- start 參數設定起始值\n\n範例：\ncounter = make_counter()\ncounter() → 0\ncounter() → 1\ncounter() → 2\n\ncounter_from_10 = make_counter(10)\ncounter_from_10() → 10\ncounter_from_10() → 11',
      starterCode: 'def make_counter(start=0):\n    # 提示：需要用 nonlocal 關鍵字\n    # 讓內層函式能修改外層變數\n    pass',
      expectedQuery: 'def make_counter(start=0):\n    count = start\n    def counter():\n        nonlocal count\n        current = count\n        count += 1\n        return current\n    return counter',
      testCases: [
        { input: 'c = make_counter()\n[c(), c(), c()]' },
        { input: 'c = make_counter(10)\n[c(), c()]' },
        { input: 'c = make_counter(0)\nc()' },
      ],
      hints: ['閉包 = 內層函式 + 它「記住」的外層變數', '需要用 nonlocal 關鍵字才能在內層函式中修改外層變數', '先保存目前值，再遞增，最後回傳保存的值'],
      explanation: '閉包（Closure）是函式式程式設計的核心概念：\n- 內層函式 counter() 「記住」了外層的 count 變數\n- 即使 make_counter() 已經執行完畢，count 仍然存在\n- nonlocal 宣告讓內層函式能修改（而非遮蔽）外層變數\n\n閉包是裝飾器（decorator）的基礎，理解閉包才能理解裝飾器。',
      frameworkTip: '面試時被問到閉包，先畫出作用域鏈（LEGB），再解釋 nonlocal 的作用。提到閉包是裝飾器的基礎會讓面試官印象深刻。',
    },
    {
      id: 4,
      name: 'global vs nonlocal',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'global 與 nonlocal 的差異',
        narrative: '面試官問你 Python 的作用域規則（LEGB）以及 global 和 nonlocal 的區別。這是理解閉包和裝飾器的基礎。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nx = "global"\n\ndef outer():\n    x = "outer"\n    def inner():\n        nonlocal x\n        x = "inner"\n    inner()\n    print("outer:", x)\n\nouter()\nprint("global:", x)\n```',
      options: [
        { id: 'A', text: 'outer: inner\nglobal: inner', explanation: 'nonlocal 只影響外層函式的變數，不影響全域變數。' },
        { id: 'B', text: 'outer: inner\nglobal: global', explanation: '正確！nonlocal 讓 inner() 修改了 outer() 的 x（變成 "inner"），但全域的 x 不受影響，仍然是 "global"。' },
        { id: 'C', text: 'outer: outer\nglobal: global', explanation: 'nonlocal 會讓 inner() 中的 x = "inner" 修改到 outer() 的 x。' },
        { id: 'D', text: 'outer: outer\nglobal: inner', explanation: 'nonlocal 修改的是外層函式的變數，不是全域變數。要修改全域的要用 global。' },
      ],
      correctAnswer: 'B',
      hints: ['nonlocal 只向上找到最近的外層函式的變數', 'global 直接找全域變數', 'Python 作用域規則：LEGB（Local → Enclosing → Global → Built-in）'],
      explanation: 'Python 作用域規則 LEGB：\n- Local：函式內部\n- Enclosing：外層函式（閉包）\n- Global：模組層級\n- Built-in：Python 內建\n\nnonlocal 讓變數綁定到 Enclosing scope，global 讓變數綁定到 Global scope。兩者互不影響。',
      frameworkTip: '面試時能清楚解釋 LEGB 規則和 nonlocal vs global 的差異，是 Python 進階能力的指標。Google 面試特別愛考這類語言機制題。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-4: 錯誤類型與除錯 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '17-4': [
    {
      id: 3,
      name: '常見 Exception 類型辨識',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: '例外類型快速辨識',
        narrative: '你在一家電商公司做 on-call 輪值，系統在凌晨 3 點噴出一堆錯誤 log。你需要快速判斷錯誤類型才能找到正確的修復方式。理解 Python 的例外類型是高效除錯的基礎。',
      },
      question: '以下四段程式碼分別會引發什麼例外？\n\n```python\n# 片段 1\ndata = {"name": "Alice"}\nprint(data["age"])\n\n# 片段 2\nnumbers = [1, 2, 3]\nprint(numbers[5])\n\n# 片段 3\nage = int("twenty")\n\n# 片段 4\nresult = None\nprint(result.upper())\n```',
      options: [
        { id: 'A', text: 'KeyError, IndexError, ValueError, AttributeError', explanation: '正確！字典缺 key → KeyError；list 超出範圍 → IndexError；無法轉換型態 → ValueError；物件沒有該屬性/方法 → AttributeError。' },
        { id: 'B', text: 'ValueError, IndexError, TypeError, AttributeError', explanation: '存取字典不存在的 key 是 KeyError，不是 ValueError。' },
        { id: 'C', text: 'KeyError, IndexError, TypeError, NameError', explanation: '片段 3 是 ValueError（值無法轉換），不是 TypeError。片段 4 是 AttributeError。' },
        { id: 'D', text: 'KeyError, ValueError, ValueError, TypeError', explanation: '片段 2 是 IndexError（索引超出範圍）。片段 4 的 None 沒有 .upper() 方法，是 AttributeError。' },
      ],
      correctAnswer: 'A',
      hints: ['KeyError：字典中找不到指定的 key', 'IndexError：序列的索引超出範圍', 'ValueError：值的型態正確但內容不合法', 'AttributeError：物件沒有指定的屬性或方法'],
      explanation: 'Python 最常見的四種例外：\n- KeyError：存取字典中不存在的 key（用 .get() 避免）\n- IndexError：list/tuple 索引超出範圍\n- ValueError：值的格式或內容不合法（如 int("abc")）\n- AttributeError：物件沒有該方法或屬性（如 None.upper()）\n\n快速辨識例外類型是高效除錯的第一步。',
      frameworkTip: '面試中被問到除錯能力時，能準確說出例外類型和對應的防禦方式（dict.get()、邊界檢查、try/except），展示你的實戰經驗。',
    },
    {
      id: 4,
      name: '自定義 Exception',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: '建立業務專用的例外類別',
        narrative: '你在設計一個訂單處理系統，需要定義專屬的例外類別來區分不同的業務錯誤。使用內建的 ValueError 或 RuntimeError 不夠明確，客製化例外能讓錯誤處理更精準。',
      },
      question: '建立一個訂單系統的例外層級：\n1. OrderError(Exception)：基礎訂單例外，接受 message 和 order_id\n2. InsufficientStockError(OrderError)：庫存不足，額外接受 product 和 requested 數量\n3. 寫一個函式 process_order(order_id, product, quantity, stock)：\n   - 如果 stock < quantity，引發 InsufficientStockError\n   - 否則回傳 f"Order {order_id}: {quantity}x {product} confirmed"\n\n範例：\nprocess_order("A001", "Laptop", 5, 3) → 引發 InsufficientStockError\nprocess_order("A002", "Mouse", 2, 10) → "Order A002: 2x Mouse confirmed"',
      starterCode: 'class OrderError(Exception):\n    def __init__(self, message, order_id):\n        pass\n\nclass InsufficientStockError(OrderError):\n    def __init__(self, order_id, product, requested, available):\n        pass\n\ndef process_order(order_id, product, quantity, stock):\n    pass',
      expectedQuery: 'class OrderError(Exception):\n    def __init__(self, message, order_id):\n        super().__init__(message)\n        self.order_id = order_id\n\nclass InsufficientStockError(OrderError):\n    def __init__(self, order_id, product, requested, available):\n        message = f"Insufficient stock for {product}: requested {requested}, available {available}"\n        super().__init__(message, order_id)\n        self.product = product\n        self.requested = requested\n        self.available = available\n\ndef process_order(order_id, product, quantity, stock):\n    if stock < quantity:\n        raise InsufficientStockError(order_id, product, quantity, stock)\n    return f"Order {order_id}: {quantity}x {product} confirmed"',
      testCases: [
        { input: 'process_order("A002", "Mouse", 2, 10)' },
        { input: 'try:\n    process_order("A001", "Laptop", 5, 3)\nexcept InsufficientStockError as e:\n    e.product' },
        { input: 'process_order("B001", "Keyboard", 1, 1)' },
      ],
      hints: ['自定義例外要繼承自 Exception 或其子類別', '用 super().__init__(message) 初始化父類別', '用 raise 引發例外，不是 return'],
      explanation: '自定義例外的最佳實踐：\n1. 繼承自 Exception（不是 BaseException）\n2. 用 super().__init__() 正確初始化父類別\n3. 加入額外屬性（order_id, product 等）方便後續處理\n4. 建立例外層級（OrderError → InsufficientStockError）方便分層捕捉\n\n這讓 except OrderError 能捕捉所有訂單相關錯誤，except InsufficientStockError 只捕捉庫存不足。',
      frameworkTip: '面試時展示自定義例外層級（而非用通用的 ValueError），說明「可以用 except 父類別捕捉所有子類別」，這展示你理解 Python 的例外繼承機制。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-5: try/except 與防禦性程式設計 — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '17-5': [
    {
      id: 4,
      name: '@timer 裝飾器',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '裝飾器三經典之一：計時器',
        narrative: 'Meta 面試中，裝飾器（Decorator）是必考題。面試官請你寫一個 @timer 裝飾器來測量函式執行時間。這是最基礎的裝飾器應用，也是理解進階裝飾器的起點。',
      },
      question: '寫一個 @timer 裝飾器，測量被裝飾函式的執行時間：\n- 用 time.time() 計算開始和結束時間\n- 印出 "{函式名稱} took {秒數:.4f}s"\n- 回傳原函式的回傳值\n- 用 functools.wraps 保留原函式的 metadata\n\n範例：\n@timer\ndef slow_add(a, b):\n    time.sleep(0.1)\n    return a + b\n\nresult = slow_add(1, 2)  # 印出 "slow_add took 0.10xxs"\nprint(result)  # 3',
      starterCode: 'import time\nimport functools\n\ndef timer(func):\n    # 寫一個 wrapper 函式\n    # 記錄開始時間 → 執行原函式 → 記錄結束時間 → 印出耗時\n    pass',
      expectedQuery: 'import time\nimport functools\n\ndef timer(func):\n    @functools.wraps(func)\n    def wrapper(*args, **kwargs):\n        start = time.time()\n        result = func(*args, **kwargs)\n        end = time.time()\n        print(f"{func.__name__} took {end - start:.4f}s")\n        return result\n    return wrapper',
      testCases: [
        { input: '@timer\ndef add(a, b):\n    return a + b\nadd(1, 2)' },
        { input: '@timer\ndef greet(name):\n    return f"Hello {name}"\ngreet("Alice")' },
      ],
      hints: ['裝飾器是一個接受函式、回傳函式的函式', 'wrapper 要用 *args, **kwargs 接受任意參數', 'functools.wraps(func) 保留原函式的 __name__ 等屬性', '不要忘記 return result'],
      explanation: '裝飾器的本質是：\n@timer\ndef f(): ... \n等同於 f = timer(f)\n\n結構：\n1. timer(func) 接受原函式\n2. 定義 wrapper(*args, **kwargs) 包裝邏輯\n3. wrapper 內部呼叫 func(*args, **kwargs)\n4. 回傳 wrapper\n\nfunctools.wraps 很重要，沒有它 f.__name__ 會變成 "wrapper"，debug 時會很困擾。',
      frameworkTip: '面試時寫裝飾器，一定要記得 @functools.wraps 和 return result。這兩個常見錯誤是面試官特別會注意的細節。',
    },
    {
      id: 5,
      name: '@retry 裝飾器',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '裝飾器三經典之二：自動重試',
        narrative: '你在 Meta 的基礎設施團隊，API 呼叫偶爾會因為網路不穩定而失敗。你需要寫一個 @retry 裝飾器，讓函式在失敗時自動重試。這在微服務架構中是不可或缺的防禦機制。',
      },
      question: '寫一個 @retry(max_attempts=3) 裝飾器：\n- 如果函式拋出例外，自動重試最多 max_attempts 次\n- 每次重試之間等待 1 秒（用 time.sleep）\n- 如果所有重試都失敗，拋出最後一次的例外\n- 用 functools.wraps 保留 metadata\n\n範例：\n@retry(max_attempts=3)\ndef unstable_api():\n    import random\n    if random.random() < 0.7:\n        raise ConnectionError("API timeout")\n    return "success"',
      starterCode: 'import time\nimport functools\n\ndef retry(max_attempts=3):\n    # 注意：這是一個「帶參數的裝飾器」\n    # 需要三層巢狀函式\n    pass',
      expectedQuery: 'import time\nimport functools\n\ndef retry(max_attempts=3):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            last_exception = None\n            for attempt in range(max_attempts):\n                try:\n                    return func(*args, **kwargs)\n                except Exception as e:\n                    last_exception = e\n                    if attempt < max_attempts - 1:\n                        time.sleep(1)\n            raise last_exception\n        return wrapper\n    return decorator',
      testCases: [
        { input: '@retry(max_attempts=1)\ndef ok():\n    return "success"\nok()' },
        { input: 'counter = {"n": 0}\n@retry(max_attempts=3)\ndef flaky():\n    counter["n"] += 1\n    if counter["n"] < 3:\n        raise ValueError("fail")\n    return "done"\nflaky()' },
      ],
      hints: ['帶參數的裝飾器需要三層：retry(params) → decorator(func) → wrapper(*args, **kwargs)', '用 for loop 控制重試次數', '用 try/except 捕捉例外，最後一次失敗時 raise', '最後一次重試後不需要 sleep'],
      explanation: '帶參數的裝飾器有三層：\n1. retry(max_attempts) — 接受裝飾器的參數\n2. decorator(func) — 接受被裝飾的函式\n3. wrapper(*args, **kwargs) — 實際的包裝邏輯\n\n@retry(max_attempts=3) 等同於：\ndecorator = retry(max_attempts=3)\nf = decorator(f)\n\n重試模式在生產環境中極為常見，特別是處理網路請求、資料庫連線等不穩定操作。',
      frameworkTip: '面試時寫出帶參數的裝飾器（三層巢狀），是 Python 中高級能力的標誌。如果還能提到「指數退避」（exponential backoff）策略，會額外加分。',
    },
    {
      id: 6,
      name: 'Memoization 概念',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '記憶化（Memoization）加速遞迴',
        narrative: 'Meta 面試中，面試官給你一個遞迴的費氏數列函式，問你為什麼執行 fib(40) 要等很久。你需要解釋 memoization 的概念，以及 Python 內建的解決方案。',
      },
      question: '以下關於 memoization 的描述，哪一個是正確的？\n\n```python\nfrom functools import lru_cache\n\n@lru_cache(maxsize=128)\ndef fib(n):\n    if n < 2:\n        return n\n    return fib(n-1) + fib(n-2)\n```',
      options: [
        { id: 'A', text: '@lru_cache 會將函式的結果存在資料庫中，永久保存', explanation: 'lru_cache 是存在記憶體中，程式結束後就消失了。' },
        { id: 'B', text: '@lru_cache 將 fib(40) 從 O(2^n) 優化到 O(n)，因為每個 fib(k) 只計算一次，結果被快取在記憶體中', explanation: '正確！沒有 cache 時，fib(40) 會重複計算超過 10 億次。有了 cache，fib(0) 到 fib(40) 各只算一次，總共 41 次計算。' },
        { id: 'C', text: 'maxsize=128 表示最多快取 128 秒的計算結果', explanation: 'maxsize 是快取的「條目數量」，不是時間。超過 128 個不同的輸入時，最久沒用的會被移除（LRU = Least Recently Used）。' },
        { id: 'D', text: '@lru_cache 只能用在遞迴函式上，一般函式不能用', explanation: 'lru_cache 可以用在任何純函式上，只要輸入是 hashable 的（不能是 list 或 dict）。' },
      ],
      correctAnswer: 'B',
      hints: ['Memoization = 記住已經算過的結果，避免重複計算', 'LRU = Least Recently Used，最近最少使用的會被移除', '關鍵限制：函式參數必須是 hashable 的'],
      explanation: 'Memoization（記憶化）的核心思想：\n- 用空間換時間，快取函式結果\n- Python 內建 @functools.lru_cache\n- fib(40) 從 O(2^n) ≈ 10 億次 → O(n) = 40 次\n\n使用限制：\n1. 函式必須是純函式（相同輸入 → 相同輸出）\n2. 參數必須是 hashable（不能傳 list 或 dict）\n3. maxsize=None 表示無限快取，maxsize=128 是預設值',
      frameworkTip: '面試時先解釋為什麼遞迴 fib 慢（重複子問題），再提出 memoization 解法，最後提到 Python 的 @lru_cache。這展示了從問題分析到解決方案的完整思路。',
    },
  ],
}
