// ── World 16 額外挑戰（迴圈與資料結構 — 面試經典題）──────────────────
// 這些挑戰會被 append 到 World 16 對應的 quest 中

export const w16Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-1: for 迴圈 & range — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '16-1': [
    {
      id: 4,
      name: 'Contains Duplicate（LeetCode #217）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '電商平台重複訂單偵測',
        narrative: '你在一家電商公司的後端團隊，發現有時候同一個訂單 ID 會因為網路重試而被送出多次。你需要寫一個快速偵測重複值的工具。這是 LeetCode #217，面試入門必考題。',
      },
      question: '寫一個函式 contains_duplicate(nums)，如果陣列中有任何值出現超過一次就回傳 True，否則回傳 False。\n\n要求：使用 set 來達到 O(n) 時間複雜度。\n\n```python\n# 範例\ncontains_duplicate([1, 2, 3, 1])  # → True\ncontains_duplicate([1, 2, 3, 4])  # → False\ncontains_duplicate([])            # → False\n```',
      starterCode: 'def contains_duplicate(nums):\n    # 提示：set 不允許重複元素\n    # 比較 set 長度和原始 list 長度\n    pass',
      expectedQuery: 'def contains_duplicate(nums):\n    return len(nums) != len(set(nums))',
      testCases: [
        { input: 'contains_duplicate([1, 2, 3, 1])' },
        { input: 'contains_duplicate([1, 2, 3, 4])' },
        { input: 'contains_duplicate([])' },
      ],
      hints: ['set() 會自動移除重複值', '如果 set 的長度比原始 list 短，代表有重複', '一行就能解決！'],
      explanation: '最簡潔的解法：len(nums) != len(set(nums))。\n\nset 會移除重複值，所以如果有重複，set 長度會比原本短。\n\n另一種面試常見寫法（用 for 迴圈）：\ndef contains_duplicate(nums):\n    seen = set()\n    for num in nums:\n        if num in seen:\n            return True\n        seen.add(num)\n    return False\n\n這種寫法的好處是可以在找到第一個重複時就提前 return，不需要遍歷整個陣列。',
      frameworkTip: '面試時先說「暴力法是用兩層 for 迴圈，O(n²)」，再說「但用 set 可以做到 O(n)」。展示你會分析時間複雜度並優化。這是 Blind 75 的第一題，必須秒殺。',
    },
    {
      id: 5,
      name: 'range 步長應用',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'SaaS 定價階梯分析',
        narrative: '你在一家 SaaS 公司做定價策略分析。需要根據不同用量區間計算階梯價格，每個區間的步長不同。這考驗你對 range 函式第三個參數的理解。',
      },
      question: '寫一個函式 tiered_pricing(units)，根據用量計算總費用：\n- 0-99 units：每 unit $10\n- 100-499 units：每 unit $8\n- 500+ units：每 unit $5\n\n同時，回傳一個 list，包含每 100 units 的累計費用（用 range 步長 100 來遍歷）。\n\n```python\n# 範例\ntiered_pricing(250)\n# → (2200, [1000, 1800, 2200])\n# 前 100 units: 100*10 = 1000\n# 100-199: 100*8 = 800, 累計 1800\n# 200-249: 50*8 = 400, 累計 2200\n```',
      starterCode: 'def tiered_pricing(units):\n    total = 0\n    milestones = []\n    # 用 range(0, units, 100) 每 100 個一組計算\n    # 每個區間判斷適用的價格\n    pass',
      expectedQuery: 'def tiered_pricing(units):\n    total = 0\n    milestones = []\n    for start in range(0, units, 100):\n        chunk = min(100, units - start)\n        if start < 100:\n            total += chunk * 10\n        elif start < 500:\n            total += chunk * 8\n        else:\n            total += chunk * 5\n        milestones.append(total)\n    return (total, milestones)',
      testCases: [
        { input: 'tiered_pricing(250)' },
        { input: 'tiered_pricing(50)' },
        { input: 'tiered_pricing(600)' },
      ],
      hints: ['range(0, units, 100) 會產生 0, 100, 200, 300...', 'min(100, units - start) 處理最後一組不滿 100 的情況', '用 start 的值判斷落在哪個價格區間'],
      explanation: 'range(start, stop, step) 的第三個參數 step 讓你可以跳著遍歷。這在分段計算、取樣、批次處理等場景非常實用。\n\nmin(100, units - start) 是處理「最後一批不足一組」的經典技巧，面試中很常見。',
      frameworkTip: '面試中遇到分段計算題，先畫出區間圖，再用 range + step 分組處理。提到 min() 來處理邊界情況會加分。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-2: while 迴圈 & break/continue — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '16-2': [
    {
      id: 3,
      name: 'Valid Parentheses（LeetCode #20）',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Blind 75',
      scenario: {
        title: 'API 請求格式驗證',
        narrative: '你在開發一個 API gateway，需要驗證傳入的 JSON query 格式是否正確——所有的括號都必須正確配對。這是 LeetCode #20，Blind 75 必考題，也是 stack 資料結構的入門經典。',
      },
      question: '寫一個函式 is_valid(s)，判斷字串中的括號是否有效。有效條件：\n1. 左括號必須用相同類型的右括號閉合\n2. 左括號必須以正確的順序閉合\n\n```python\n# 範例\nis_valid("()")      # → True\nis_valid("()[]{}")   # → True\nis_valid("(]")       # → False\nis_valid("([)]")     # → False\nis_valid("{[]}")     # → True\n```',
      starterCode: 'def is_valid(s):\n    # 提示：用 list 當 stack（後進先出）\n    # 用 dict 存括號的配對關係\n    stack = []\n    pairs = {")": "(", "]": "[", "}": "{"}\n    pass',
      expectedQuery: 'def is_valid(s):\n    stack = []\n    pairs = {")": "(", "]": "[", "}": "{"}\n    for char in s:\n        if char in pairs:\n            if not stack or stack[-1] != pairs[char]:\n                return False\n            stack.pop()\n        else:\n            stack.append(char)\n    return len(stack) == 0',
      testCases: [
        { input: 'is_valid("()")' },
        { input: 'is_valid("()[]{}")' },
        { input: 'is_valid("(]")' },
        { input: 'is_valid("{[]}")' },
      ],
      hints: ['遇到左括號就 push 進 stack', '遇到右括號就檢查 stack 頂端是否為對應的左括號', '最後 stack 必須為空才算有效', 'stack[-1] 可以看 stack 最頂端的元素'],
      explanation: '這題的核心概念是 Stack（堆疊）：\n1. 遇到左括號 → push 進 stack\n2. 遇到右括號 → 檢查 stack 頂端是否為配對的左括號\n   - 是 → pop 出來\n   - 不是 → 回傳 False\n3. 結束時 stack 必須為空\n\n用 dict 存配對關係是很 Pythonic 的做法。Python 的 list 天然就是 stack：append() = push, pop() = pop, [-1] = peek。',
      frameworkTip: '這是面試中 Stack 題的入門必考。面試時先說「這是 stack 的經典應用」，再解釋 LIFO（後進先出）的概念。Blind 75 中排名前五的高頻題。',
    },
    {
      id: 4,
      name: 'break/continue 實戰',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '日誌分析中的流程控制',
        narrative: '你在分析伺服器日誌，需要找出第一個錯誤訊息，同時跳過某些不重要的 warning。這考驗你對 break 和 continue 的精確理解。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nlogs = ["INFO: start", "WARN: slow", "ERROR: timeout",\n        "INFO: retry", "ERROR: crash"]\n\nerrors = []\nfor log in logs:\n    if "WARN" in log:\n        continue\n    if "ERROR" in log:\n        errors.append(log)\n        if len(errors) >= 1:\n            break\n    print(f"Processing: {log}")\n\nprint(f"Found: {errors}")\n```',
      options: [
        { id: 'A', text: 'Processing: INFO: start\nProcessing: INFO: retry\nFound: [\'ERROR: timeout\', \'ERROR: crash\']', explanation: 'break 在找到第一個 ERROR 後就跳出迴圈了，不會繼續到 retry 和 crash。' },
        { id: 'B', text: 'Processing: INFO: start\nFound: [\'ERROR: timeout\']', explanation: '正確！continue 跳過 WARN，遇到第一個 ERROR 後 break 跳出整個迴圈。注意 break 發生在 print 之前，所以 ERROR 那行不會被 print。' },
        { id: 'C', text: 'Processing: INFO: start\nProcessing: ERROR: timeout\nFound: [\'ERROR: timeout\']', explanation: 'break 在 if 區塊內，執行 break 後不會執行後面的 print。' },
        { id: 'D', text: 'Processing: INFO: start\nProcessing: INFO: retry\nFound: [\'ERROR: timeout\']', explanation: 'break 在第一個 ERROR 就跳出了，不會到達 INFO: retry。' },
      ],
      correctAnswer: 'B',
      hints: ['continue 跳過當前迭代的剩餘部分，進入下一次迭代', 'break 立即跳出整個迴圈', 'break 在 if 區塊內，所以後面的 print 不會執行'],
      explanation: '- continue：跳過當前迭代的剩餘程式碼，直接進入下一次迭代\n- break：完全跳出整個迴圈\n\n執行流程：\n1. "INFO: start" → 不符合 WARN/ERROR → print\n2. "WARN: slow" → continue 跳過\n3. "ERROR: timeout" → append → len >= 1 → break 跳出（不執行 print）\n\n注意：break 後的 print(f"Found:...") 不在迴圈內，所以會執行。',
      frameworkTip: '面試時遇到 break/continue 的追蹤題，逐行走過程式碼（dry run）是最穩的方法。面試官看的是你的 trace 能力。',
    },
    {
      id: 5,
      name: 'while + 哨兵值模式',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '客服聊天機器人指令解析',
        narrative: '你在開發一個客服聊天機器人的指令解析器。機器人需要持續讀取使用者輸入，直到收到「結束」指令。這是 while 迴圈搭配哨兵值（sentinel value）的經典模式。',
      },
      question: '寫一個函式 process_commands(commands)，接收一個指令列表，模擬逐一處理：\n- 遇到 "quit" 就停止（不處理 quit 本身）\n- 跳過空字串 ""\n- 其他指令加入結果 list 並轉大寫\n\n```python\n# 範例\nprocess_commands(["hello", "", "help", "quit", "extra"])\n# → ["HELLO", "HELP"]\n```',
      starterCode: 'def process_commands(commands):\n    result = []\n    i = 0\n    # 用 while 迴圈遍歷 commands\n    # 遇到 "quit" → break\n    # 遇到 "" → continue（記得先 i += 1）\n    pass',
      expectedQuery: 'def process_commands(commands):\n    result = []\n    i = 0\n    while i < len(commands):\n        cmd = commands[i]\n        i += 1\n        if cmd == "quit":\n            break\n        if cmd == "":\n            continue\n        result.append(cmd.upper())\n    return result',
      testCases: [
        { input: 'process_commands(["hello", "", "help", "quit", "extra"])' },
        { input: 'process_commands(["quit"])' },
        { input: 'process_commands(["a", "b", "c"])' },
      ],
      hints: ['while i < len(commands) 控制迴圈', '記得在 continue 之前就 i += 1，否則會無限迴圈', 'break 會完全跳出 while 迴圈'],
      explanation: '這是 while + break + continue 的綜合應用。關鍵注意事項：\n\n1. i += 1 必須放在 continue 之前！如果放在最後，continue 會跳過 i += 1 導致無限迴圈\n2. break 用於遇到終止條件時跳出\n3. continue 用於跳過不需要處理的項目\n\n這個「先遞增再判斷」的模式在實務中很常見。',
      frameworkTip: '面試中 while + continue 的陷阱題很常見。記住黃金規則：計數器的遞增要放在 continue 之前。如果用 for 迴圈就不會有這個問題。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-3: 字串操作 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '16-3': [
    {
      id: 3,
      name: 'Valid Palindrome（LeetCode #125）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '社群平台用戶名驗證',
        narrative: '你在一家社群平台工作，產品經理想做一個趣味功能：偵測使用者的暱稱是否是回文（palindrome）。但要忽略大小寫和非字母數字字元。這是 LeetCode #125，字串處理的經典入門。',
      },
      question: '寫一個函式 is_palindrome(s)，判斷字串是否為有效回文。只考慮字母和數字，忽略大小寫。\n\n```python\n# 範例\nis_palindrome("A man, a plan, a canal: Panama")  # → True\nis_palindrome("race a car")                       # → False\nis_palindrome("")                                  # → True（空字串算回文）\n```',
      starterCode: 'def is_palindrome(s):\n    # 1. 濾掉非字母數字字元\n    # 2. 轉小寫\n    # 3. 比較正向和反向是否相同\n    pass',
      expectedQuery: 'def is_palindrome(s):\n    cleaned = "".join(c.lower() for c in s if c.isalnum())\n    return cleaned == cleaned[::-1]',
      testCases: [
        { input: 'is_palindrome("A man, a plan, a canal: Panama")' },
        { input: 'is_palindrome("race a car")' },
        { input: 'is_palindrome("")' },
      ],
      hints: ['c.isalnum() 判斷字元是否為字母或數字', 's[::-1] 可以反轉字串', '"".join() 把字元串接起來', '先清理再比較，兩步驟'],
      explanation: '解題步驟：\n1. 用 isalnum() 過濾非字母數字字元\n2. 用 lower() 統一小寫\n3. 用切片 [::-1] 反轉字串\n4. 比較原始和反轉是否相同\n\n一行解法：cleaned == cleaned[::-1]\n\n進階面試追問：如何用雙指標（two-pointer）做到 O(1) 空間？\ndef is_palindrome(s):\n    l, r = 0, len(s) - 1\n    while l < r:\n        while l < r and not s[l].isalnum(): l += 1\n        while l < r and not s[r].isalnum(): r -= 1\n        if s[l].lower() != s[r].lower(): return False\n        l += 1; r -= 1\n    return True',
      frameworkTip: '面試先用 [::-1] 寫出簡潔解，再主動說「如果要 O(1) 空間，可以用 two-pointer」。展示你知道多種解法和 trade-off。',
    },
    {
      id: 4,
      name: '字串壓縮',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '數據分析日誌壓縮',
        narrative: '你在一家數據分析公司，需要壓縮重複的日誌字元來節省儲存空間。這是 Amazon 面試中常見的字串處理題，考驗你對迴圈和計數的掌握。',
      },
      question: '寫一個函式 compress(s)，將連續重複的字元壓縮成「字元+次數」的格式。如果壓縮後沒有更短，回傳原字串。\n\n```python\n# 範例\ncompress("aabcccccaaa")  # → "a2b1c5a3"\ncompress("abc")          # → "abc"（壓縮後 "a1b1c1" 更長，回傳原字串）\ncompress("")             # → ""\n```',
      starterCode: 'def compress(s):\n    if not s:\n        return s\n    result = []\n    count = 1\n    # 遍歷字串，比較相鄰字元\n    pass',
      expectedQuery: 'def compress(s):\n    if not s:\n        return s\n    result = []\n    count = 1\n    for i in range(1, len(s)):\n        if s[i] == s[i - 1]:\n            count += 1\n        else:\n            result.append(s[i - 1] + str(count))\n            count = 1\n    result.append(s[-1] + str(count))\n    compressed = "".join(result)\n    return compressed if len(compressed) < len(s) else s',
      testCases: [
        { input: 'compress("aabcccccaaa")' },
        { input: 'compress("abc")' },
        { input: 'compress("")' },
        { input: 'compress("aaa")' },
      ],
      hints: ['比較 s[i] 和 s[i-1] 來偵測字元變化', '迴圈結束後別忘了處理最後一組字元', '最後比較壓縮後和原始字串的長度'],
      explanation: '這題的重點：\n1. 遍歷字串，追蹤當前字元和連續出現次數\n2. 當遇到不同字元時，把「字元+次數」加入結果\n3. 迴圈結束後要處理最後一組（容易遺漏的 edge case）\n4. 比較壓縮後長度，決定回傳哪個\n\n用 list + join 而非字串串接，因為 Python 字串不可變，每次 + 都會建立新物件，用 list 再 join 效率更好。',
      frameworkTip: '面試時提到「用 list 收集結果再 join，而非字串 + 串接」會讓面試官知道你理解 Python 字串的不可變性和效能考量。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-4: List & Tuple — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '16-4': [
    {
      id: 4,
      name: 'Two Sum（LeetCode #1）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'Blind 75',
      scenario: {
        title: '電商購物車湊單功能',
        narrative: '你在一家電商平台做促銷功能：找出購物車中哪兩個商品的價格加起來剛好等於優惠門檻。這是 LeetCode #1 Two Sum，程式面試史上被考最多次的題目，沒有之一。',
      },
      question: '寫一個函式 two_sum(nums, target)，找出陣列中兩個數字的索引，使它們的和等於 target。\n\n假設每個輸入恰好有一個解，且同一個元素不能使用兩次。\n\n```python\n# 範例\ntwo_sum([2, 7, 11, 15], 9)   # → [0, 1]（因為 nums[0] + nums[1] = 9）\ntwo_sum([3, 2, 4], 6)         # → [1, 2]\ntwo_sum([3, 3], 6)            # → [0, 1]\n```',
      starterCode: 'def two_sum(nums, target):\n    # 提示：用 dict 記錄「已看過的數字 → 索引」\n    # 對每個數字，檢查 target - 數字 是否在 dict 中\n    seen = {}\n    pass',
      expectedQuery: 'def two_sum(nums, target):\n    seen = {}\n    for i, num in enumerate(nums):\n        complement = target - num\n        if complement in seen:\n            return [seen[complement], i]\n        seen[num] = i',
      testCases: [
        { input: 'two_sum([2, 7, 11, 15], 9)' },
        { input: 'two_sum([3, 2, 4], 6)' },
        { input: 'two_sum([3, 3], 6)' },
      ],
      hints: ['暴力法：兩層 for 迴圈 O(n²)。最佳解：用 dict O(n)', '對每個數字 num，它的「互補數」是 target - num', 'dict 的 key 是數字，value 是索引', 'enumerate() 同時取得索引和值'],
      explanation: 'Two Sum 的 O(n) 解法核心概念：\n1. 遍歷陣列，對每個數字 num 計算互補數 complement = target - num\n2. 檢查 complement 是否在 seen dict 中\n   - 是 → 找到答案，回傳兩個索引\n   - 否 → 把 num 和它的索引存入 seen\n\n為什麼用 dict？因為 dict 的查找是 O(1)，所以整體是 O(n)。\n\n這是 hash table 最經典的應用場景。',
      frameworkTip: '這是 LeetCode 第一題，也是面試史上考最多的題。面試時先說暴力法 O(n²)，再優化到 O(n) hash table 解法。用 enumerate 而非 range(len()) 更 Pythonic。',
    },
    {
      id: 5,
      name: 'Best Time to Buy and Sell Stock（LeetCode #121）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'Blind 75',
      scenario: {
        title: '股票交易最佳時機分析',
        narrative: '你在一家金融科技新創做量化分析。老闆給你一組歷史股價數據，要你找出「哪天買、哪天賣」能獲得最大利潤。這是 LeetCode #121，Blind 75 中的高頻題。',
      },
      question: '寫一個函式 max_profit(prices)，回傳能獲得的最大利潤。你只能買一次、賣一次，且必須先買後賣。如果無法獲利，回傳 0。\n\n```python\n# 範例\nmax_profit([7, 1, 5, 3, 6, 4])  # → 5（第 2 天買 $1，第 5 天賣 $6）\nmax_profit([7, 6, 4, 3, 1])     # → 0（股價一直跌，不交易）\n```',
      starterCode: 'def max_profit(prices):\n    # 追蹤「目前為止的最低價」和「最大利潤」\n    # 遍歷價格，每天計算：如果今天賣，利潤是多少？\n    pass',
      expectedQuery: 'def max_profit(prices):\n    if not prices:\n        return 0\n    min_price = prices[0]\n    profit = 0\n    for price in prices[1:]:\n        if price < min_price:\n            min_price = price\n        else:\n            profit = max(profit, price - min_price)\n    return profit',
      testCases: [
        { input: 'max_profit([7, 1, 5, 3, 6, 4])' },
        { input: 'max_profit([7, 6, 4, 3, 1])' },
        { input: 'max_profit([])' },
        { input: 'max_profit([1])' },
      ],
      hints: ['不需要記錄「哪天買哪天賣」，只需要追蹤最低價和最大利潤', '遍歷時，每個價格要嘛更新最低價，要嘛計算利潤', '一次遍歷 O(n) 就能解決'],
      explanation: '這題的巧妙之處：不需要兩層迴圈比較所有組合。\n\n核心思路：\n1. 維護 min_price = 目前為止的最低買入價\n2. 維護 profit = 目前為止的最大利潤\n3. 對每個價格：\n   - 如果比 min_price 低 → 更新 min_price\n   - 否則 → 計算利潤 price - min_price，更新 profit\n\n這是 greedy（貪心）演算法的經典應用：在每個時間點做出最優的局部決策。',
      frameworkTip: '面試時解這題，先說「暴力法是 O(n²) 雙重迴圈」，再說「但可以用 greedy 做到 O(n)：追蹤最低買入價」。面試官最想聽到的是你的優化思路。',
    },
    {
      id: 6,
      name: 'List 切片與 Tuple 不可變性',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '資料管線中的安全考量',
        narrative: '你在建構一個數據分析管線，需要確保某些設定值不會被意外修改。理解 list 和 tuple 的差異在實務中非常重要。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\noriginal = [1, 2, [3, 4]]\nshallow = original[:]\nshallow[0] = 99\nshallow[2][0] = 99\n\nprint(original)\nprint(type((1,)))\nprint(type((1)))\n```',
      options: [
        { id: 'A', text: '[1, 2, [99, 4]]\n<class \'tuple\'>\n<class \'int\'>', explanation: '正確！[:] 是淺拷貝：第一層獨立，但巢狀物件（list）共享引用。(1,) 是 tuple，(1) 只是加了括號的 int。' },
        { id: 'B', text: '[99, 2, [99, 4]]\n<class \'tuple\'>\n<class \'tuple\'>', explanation: '淺拷貝後，修改 shallow[0] 不會影響 original[0]。(1) 不是 tuple，是 int。' },
        { id: 'C', text: '[1, 2, [3, 4]]\n<class \'tuple\'>\n<class \'int\'>', explanation: '淺拷貝的巢狀物件是共享引用，所以 shallow[2][0] = 99 會影響 original[2][0]。' },
        { id: 'D', text: '[1, 2, [99, 4]]\n<class \'tuple\'>\n<class \'tuple\'>', explanation: '(1) 缺少逗號，Python 把它當成普通括號而非 tuple。' },
      ],
      correctAnswer: 'A',
      hints: ['[:] 是淺拷貝（shallow copy），只複製第一層', '巢狀的 list 還是共享同一個參照', '建立 tuple 的關鍵是逗號，不是括號'],
      explanation: '兩個重要概念：\n\n1. 淺拷貝 vs 深拷貝：\n   - original[:] 或 list(original) 是淺拷貝\n   - 第一層是獨立副本，但巢狀物件共享引用\n   - 需要完整獨立副本時用 import copy; copy.deepcopy()\n\n2. Tuple 的建立：\n   - 關鍵是逗號，不是括號\n   - (1,) → tuple\n   - (1) → int（括號被當作數學運算的括號）\n   - 1, → 也是 tuple',
      frameworkTip: '面試中「淺拷貝 vs 深拷貝」是 Python 高頻考點。記住：[:] 和 list() 都是淺拷貝。如果面試官追問如何深拷貝，答 copy.deepcopy()。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-5: Dict & Set — 新增 3 題
  // ══════════════════════════════════════════════════════════════════
  '16-5': [
    {
      id: 4,
      name: '字元頻率統計',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '電商搜尋關鍵字分析',
        narrative: '你在電商平台的搜尋團隊，需要分析使用者搜尋關鍵字中每個字元出現的頻率，找出最常出現的字元來優化搜尋建議。這是 dict 最基礎也最重要的應用。',
      },
      question: '寫一個函式 char_frequency(s)，回傳字串中每個字元的出現次數（dict），並找出出現最多次的字元。\n\n```python\n# 範例\nchar_frequency("hello")\n# → ({"h": 1, "e": 1, "l": 2, "o": 1}, "l")\n\nchar_frequency("aabbcc")\n# → ({"a": 2, "b": 2, "c": 2}, "a")  # 出現次數相同時回傳第一個\n```',
      starterCode: 'def char_frequency(s):\n    freq = {}\n    # 遍歷字串，用 dict 計數\n    # 找出出現最多次的字元\n    pass',
      expectedQuery: 'def char_frequency(s):\n    freq = {}\n    for c in s:\n        freq[c] = freq.get(c, 0) + 1\n    max_char = max(freq, key=freq.get) if freq else ""\n    return (freq, max_char)',
      testCases: [
        { input: 'char_frequency("hello")' },
        { input: 'char_frequency("aabbcc")' },
        { input: 'char_frequency("a")' },
      ],
      hints: ['dict.get(key, default) 在 key 不存在時回傳 default', 'max(dict, key=dict.get) 可以找出值最大的 key', '也可以用 collections.Counter，但面試通常要你手寫'],
      explanation: '字元計數的三種寫法：\n\n1. 手動計數（面試必會）：\n   freq[c] = freq.get(c, 0) + 1\n\n2. defaultdict：\n   from collections import defaultdict\n   freq = defaultdict(int)\n   freq[c] += 1\n\n3. Counter（最簡潔）：\n   from collections import Counter\n   freq = Counter(s)\n\n面試時先寫手動版，再提 Counter 加分。\nmax(freq, key=freq.get) 是找 dict 中值最大的 key 的慣用寫法。',
      frameworkTip: '字元計數是 dict 最基本的應用，幾乎所有 hash table 題目的基礎。面試時用 dict.get(key, 0) 而非 if key in dict 會更簡潔。提到 Counter 可以加分。',
    },
    {
      id: 5,
      name: 'Valid Anagram（LeetCode #242）',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'SaaS 平台重複內容偵測',
        narrative: '你在一個內容管理 SaaS 平台，需要偵測是否有人用相同的字元重新排列來建立看似不同的內容（anagram）。這是 LeetCode #242，hash table 的經典應用。',
      },
      question: '寫一個函式 is_anagram(s, t)，判斷 t 是否為 s 的 anagram（字母異位詞）。\n\nAnagram = 兩個字串使用完全相同的字母，只是排列順序不同。\n\n```python\n# 範例\nis_anagram("anagram", "nagaram")  # → True\nis_anagram("rat", "car")          # → False\nis_anagram("", "")                 # → True\n```',
      starterCode: 'def is_anagram(s, t):\n    # 方法：比較兩個字串的字元頻率是否相同\n    # 用 dict 分別統計兩個字串的字元頻率\n    pass',
      expectedQuery: 'def is_anagram(s, t):\n    if len(s) != len(t):\n        return False\n    freq = {}\n    for c in s:\n        freq[c] = freq.get(c, 0) + 1\n    for c in t:\n        freq[c] = freq.get(c, 0) - 1\n        if freq[c] < 0:\n            return False\n    return True',
      testCases: [
        { input: 'is_anagram("anagram", "nagaram")' },
        { input: 'is_anagram("rat", "car")' },
        { input: 'is_anagram("", "")' },
      ],
      hints: ['如果兩個字串長度不同，一定不是 anagram', '用一個 dict：遍歷 s 時 +1，遍歷 t 時 -1', '如果任何計數變成負數，代表 t 有 s 沒有的字元', '最簡潔解：sorted(s) == sorted(t)，但是 O(n log n)'],
      explanation: '三種解法比較：\n\n1. 排序法（最簡潔）：sorted(s) == sorted(t)\n   - 時間 O(n log n)，空間 O(n)\n\n2. 雙 dict 比較：分別計數再比較\n   - 時間 O(n)，空間 O(n)\n\n3. 單 dict（最佳）：s 的字元 +1，t 的字元 -1\n   - 時間 O(n)，空間 O(1)（字母只有 26 個）\n   - 如果最後所有值為 0，就是 anagram\n\n面試中先寫排序法展示快速解題能力，再優化到 hash table 解法。',
      frameworkTip: '面試時這題的 follow-up 常問：「如果輸入包含 Unicode 字元呢？」答案：hash table 解法不受影響，但排序法的比較可能需要注意 locale。展示你考慮了擴展性。',
    },
    {
      id: 6,
      name: 'Set 集合運算',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: '用戶行為交叉分析',
        narrative: '你在做用戶行為分析：找出「同時購買 A 和 B 的用戶」、「只購買 A 的用戶」、「購買 A 或 B 的所有用戶」。這正是 Set 集合運算的完美應用場景。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nbought_a = {"Alice", "Bob", "Carol", "Dave"}\nbought_b = {"Bob", "Carol", "Eve", "Frank"}\n\nboth = bought_a & bought_b\nonly_a = bought_a - bought_b\neither = bought_a | bought_b\nnot_both = bought_a ^ bought_b\n\nprint(len(both), len(only_a), len(either), len(not_both))\n```',
      options: [
        { id: 'A', text: '2 2 6 4', explanation: '正確！& 交集 {Bob, Carol}=2，- 差集 {Alice, Dave}=2，| 聯集 6 人（不重複），^ 對稱差集 {Alice, Dave, Eve, Frank}=4。' },
        { id: 'B', text: '2 2 8 4', explanation: '聯集 | 會去除重複，Bob 和 Carol 只算一次。' },
        { id: 'C', text: '2 4 6 4', explanation: '差集 bought_a - bought_b 只包含「在 A 但不在 B」的元素。' },
        { id: 'D', text: '2 2 6 2', explanation: '對稱差集 ^ 是「在 A 或 B 但不同時在兩者」，包含 Alice, Dave, Eve, Frank。' },
      ],
      correctAnswer: 'A',
      hints: ['& 交集：同時在兩個 set 中的元素', '- 差集：在 A 中但不在 B 中', '| 聯集：在 A 或 B 中（去重）', '^ 對稱差集：在 A 或 B 中，但不同時在兩者'],
      explanation: 'Python Set 四大運算：\n- A & B（交集 intersection）：同時存在於兩個集合\n- A - B（差集 difference）：只在 A 不在 B\n- A | B（聯集 union）：在任一集合中（去重）\n- A ^ B（對稱差集 symmetric_difference）：只在其中一個集合中\n\n等價的方法：\n- A.intersection(B)\n- A.difference(B)\n- A.union(B)\n- A.symmetric_difference(B)',
      frameworkTip: '面試中遇到「找出兩個列表的共同元素」或「找出不重複的元素」，立刻想到 Set。用 set 運算比 for 迴圈更 Pythonic，時間複雜度也更好（O(n) vs O(n²)）。',
    },
  ],
}
