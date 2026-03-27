// ── World 16 Extra Challenges (Loops & Data Structures — Interview Classics) ──────────────────

export const w16ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-1: for Loops & range — 2 Extra Challenges
  // ══════════════════════════════════════════════════════════════════
  '16-1': [
    {
      id: 4,
      name: 'Contains Duplicate (LeetCode #217)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'E-Commerce Duplicate Order Detection',
        narrative: 'You\'re on the backend team at an e-commerce company. Sometimes the same order ID gets submitted multiple times due to network retries. You need to build a fast duplicate detection tool. This is LeetCode #217, a must-know entry-level interview question.',
      },
      question: 'Write a function contains_duplicate(nums) that returns True if any value appears more than once in the array, otherwise False.\n\nRequirement: Use a set to achieve O(n) time complexity.\n\n```python\n# Examples\ncontains_duplicate([1, 2, 3, 1])  # → True\ncontains_duplicate([1, 2, 3, 4])  # → False\ncontains_duplicate([])            # → False\n```',
      starterCode: 'def contains_duplicate(nums):\n    # Hint: sets don\'t allow duplicates\n    # Compare set length vs original list length\n    pass',
      expectedQuery: 'def contains_duplicate(nums):\n    return len(nums) != len(set(nums))',
      hints: ['set() automatically removes duplicates', 'If the set is shorter than the original list, there are duplicates', 'This can be solved in one line!'],
      explanation: 'The most concise solution: len(nums) != len(set(nums)).\n\nA set removes duplicates, so if there are any, the set will be shorter.\n\nAnother common interview approach (using a for loop):\ndef contains_duplicate(nums):\n    seen = set()\n    for num in nums:\n        if num in seen:\n            return True\n        seen.add(num)\n    return False\n\nThis approach can return early when the first duplicate is found, without traversing the entire array.',
      frameworkTip: 'In interviews, first mention "brute force uses nested for loops, O(n^2)", then say "but using a set achieves O(n)". Show you can analyze time complexity and optimize. This is the first problem in Blind 75 — you must solve it instantly.',
    },
    {
      id: 5,
      name: 'range Step Applications',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'SaaS Tiered Pricing Analysis',
        narrative: 'You\'re doing pricing strategy analysis at a SaaS company. You need to calculate tiered pricing based on different usage brackets, each with different step sizes. This tests your understanding of range\'s third parameter.',
      },
      question: 'Write a function tiered_pricing(units) that calculates total cost based on usage:\n- 0-99 units: $10 per unit\n- 100-499 units: $8 per unit\n- 500+ units: $5 per unit\n\nAlso return a list of cumulative costs at every 100-unit milestone (use range with step 100).\n\n```python\n# Example\ntiered_pricing(250)\n# → (2200, [1000, 1800, 2200])\n# First 100 units: 100*10 = 1000\n# 100-199: 100*8 = 800, cumulative 1800\n# 200-249: 50*8 = 400, cumulative 2200\n```',
      starterCode: 'def tiered_pricing(units):\n    total = 0\n    milestones = []\n    # Use range(0, units, 100) to process in groups of 100\n    # Determine the applicable price for each bracket\n    pass',
      expectedQuery: 'def tiered_pricing(units):\n    total = 0\n    milestones = []\n    for start in range(0, units, 100):\n        chunk = min(100, units - start)\n        if start < 100:\n            total += chunk * 10\n        elif start < 500:\n            total += chunk * 8\n        else:\n            total += chunk * 5\n        milestones.append(total)\n    return (total, milestones)',
      hints: ['range(0, units, 100) generates 0, 100, 200, 300...', 'min(100, units - start) handles the last group that may be less than 100', 'Use the start value to determine which price bracket applies'],
      explanation: 'The third parameter of range(start, stop, step) lets you iterate in steps. This is very useful for segmented calculations, sampling, and batch processing.\n\nmin(100, units - start) is a classic technique for handling "the last batch that isn\'t a full group" — very common in interviews.',
      frameworkTip: 'When you encounter segmented calculation problems in interviews, first draw the interval diagram, then use range + step to process in groups. Mentioning min() for boundary handling earns extra points.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-2: while Loops & break/continue — 3 Extra Challenges
  // ══════════════════════════════════════════════════════════════════
  '16-2': [
    {
      id: 3,
      name: 'Valid Parentheses (LeetCode #20)',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Blind 75',
      scenario: {
        title: 'API Request Format Validation',
        narrative: 'You\'re developing an API gateway and need to validate that incoming JSON query formats are correct — all brackets must be properly matched. This is LeetCode #20, a Blind 75 must-know, and the classic introduction to the stack data structure.',
      },
      question: 'Write a function is_valid(s) that determines if brackets in a string are valid. Valid conditions:\n1. Open brackets must be closed by the same type of bracket\n2. Open brackets must be closed in the correct order\n\n```python\n# Examples\nis_valid("()")      # → True\nis_valid("()[]{}")   # → True\nis_valid("(]")       # → False\nis_valid("([)]")     # → False\nis_valid("{[]}")     # → True\n```',
      starterCode: 'def is_valid(s):\n    # Hint: use a list as a stack (last-in, first-out)\n    # Use a dict for bracket pair mapping\n    stack = []\n    pairs = {")": "(", "]": "[", "}": "{"}\n    pass',
      expectedQuery: 'def is_valid(s):\n    stack = []\n    pairs = {")": "(", "]": "[", "}": "{"}\n    for char in s:\n        if char in pairs:\n            if not stack or stack[-1] != pairs[char]:\n                return False\n            stack.pop()\n        else:\n            stack.append(char)\n    return len(stack) == 0',
      hints: ['Push opening brackets onto the stack', 'For closing brackets, check if the stack top matches', 'The stack must be empty at the end for validity', 'stack[-1] peeks at the top element'],
      explanation: 'The core concept is Stack:\n1. Opening bracket → push onto stack\n2. Closing bracket → check if stack top is the matching opening bracket\n   - Yes → pop it\n   - No → return False\n3. Stack must be empty at the end\n\nUsing a dict for pair mapping is very Pythonic. Python\'s list is a natural stack: append() = push, pop() = pop, [-1] = peek.',
      frameworkTip: 'This is THE entry-level Stack interview question. Start by saying "this is a classic stack application", then explain the LIFO (last-in, first-out) concept. Top 5 most frequently asked in Blind 75.',
    },
    {
      id: 4,
      name: 'break/continue in Practice',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Flow Control in Log Analysis',
        narrative: 'You\'re analyzing server logs and need to find the first error message while skipping unimportant warnings. This tests your precise understanding of break and continue.',
      },
      question: 'What is the output of this code?\n\n```python\nlogs = ["INFO: start", "WARN: slow", "ERROR: timeout",\n        "INFO: retry", "ERROR: crash"]\n\nerrors = []\nfor log in logs:\n    if "WARN" in log:\n        continue\n    if "ERROR" in log:\n        errors.append(log)\n        if len(errors) >= 1:\n            break\n    print(f"Processing: {log}")\n\nprint(f"Found: {errors}")\n```',
      options: [
        { id: 'A', text: 'Processing: INFO: start\nProcessing: INFO: retry\nFound: [\'ERROR: timeout\', \'ERROR: crash\']', explanation: 'break exits the loop after the first ERROR is found, so it never reaches retry or crash.' },
        { id: 'B', text: 'Processing: INFO: start\nFound: [\'ERROR: timeout\']', explanation: 'Correct! continue skips WARN, and break exits the entire loop after the first ERROR. Note that break occurs before print, so the ERROR line is not printed.' },
        { id: 'C', text: 'Processing: INFO: start\nProcessing: ERROR: timeout\nFound: [\'ERROR: timeout\']', explanation: 'break is inside the if block, so the print after it does not execute.' },
        { id: 'D', text: 'Processing: INFO: start\nProcessing: INFO: retry\nFound: [\'ERROR: timeout\']', explanation: 'break exits at the first ERROR, never reaching INFO: retry.' },
      ],
      correctAnswer: 'B',
      hints: ['continue skips the rest of the current iteration and moves to the next', 'break exits the entire loop immediately', 'break is inside the if block, so the subsequent print does not execute'],
      explanation: '- continue: skips remaining code in current iteration, jumps to next iteration\n- break: exits the entire loop completely\n\nExecution flow:\n1. "INFO: start" → doesn\'t match WARN/ERROR → print\n2. "WARN: slow" → continue skips\n3. "ERROR: timeout" → append → len >= 1 → break exits (print not reached)\n\nNote: print(f"Found:...") is outside the loop, so it still executes.',
      frameworkTip: 'When facing break/continue trace questions in interviews, stepping through the code line by line (dry run) is the most reliable approach. Interviewers are testing your trace ability.',
    },
    {
      id: 5,
      name: 'while + Sentinel Value Pattern',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Customer Service Chatbot Command Parser',
        narrative: 'You\'re developing a command parser for a customer service chatbot. The bot needs to process user inputs continuously until it receives a "quit" command. This is the classic while loop with sentinel value pattern.',
      },
      question: 'Write a function process_commands(commands) that takes a list of commands and processes them one by one:\n- Stop when encountering "quit" (don\'t process quit itself)\n- Skip empty strings ""\n- Add other commands to result list in uppercase\n\n```python\n# Example\nprocess_commands(["hello", "", "help", "quit", "extra"])\n# → ["HELLO", "HELP"]\n```',
      starterCode: 'def process_commands(commands):\n    result = []\n    i = 0\n    # Use while loop to iterate through commands\n    # "quit" → break\n    # "" → continue (remember to i += 1 first)\n    pass',
      expectedQuery: 'def process_commands(commands):\n    result = []\n    i = 0\n    while i < len(commands):\n        cmd = commands[i]\n        i += 1\n        if cmd == "quit":\n            break\n        if cmd == "":\n            continue\n        result.append(cmd.upper())\n    return result',
      hints: ['while i < len(commands) controls the loop', 'Remember to increment i += 1 before continue, or you\'ll get an infinite loop', 'break exits the while loop entirely'],
      explanation: 'This combines while + break + continue. Key points:\n\n1. i += 1 must come before continue! If placed at the end, continue would skip i += 1 causing an infinite loop\n2. break exits when the termination condition is met\n3. continue skips items that don\'t need processing\n\nThis "increment first, then check" pattern is very common in practice.',
      frameworkTip: 'while + continue trap questions are common in interviews. Remember the golden rule: increment the counter before continue. Using a for loop avoids this issue entirely.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-3: String Operations — 2 Extra Challenges
  // ══════════════════════════════════════════════════════════════════
  '16-3': [
    {
      id: 3,
      name: 'Valid Palindrome (LeetCode #125)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Social Platform Username Validation',
        narrative: 'You work at a social media platform and the PM wants a fun feature: detecting if a user\'s nickname is a palindrome. But you need to ignore case and non-alphanumeric characters. This is LeetCode #125, a classic string processing starter.',
      },
      question: 'Write a function is_palindrome(s) that checks if a string is a valid palindrome. Consider only alphanumeric characters and ignore case.\n\n```python\n# Examples\nis_palindrome("A man, a plan, a canal: Panama")  # → True\nis_palindrome("race a car")                       # → False\nis_palindrome("")                                  # → True (empty string is palindrome)\n```',
      starterCode: 'def is_palindrome(s):\n    # 1. Filter out non-alphanumeric characters\n    # 2. Convert to lowercase\n    # 3. Compare forward and reversed\n    pass',
      expectedQuery: 'def is_palindrome(s):\n    cleaned = "".join(c.lower() for c in s if c.isalnum())\n    return cleaned == cleaned[::-1]',
      hints: ['c.isalnum() checks if a character is alphanumeric', 's[::-1] reverses a string', '"".join() concatenates characters', 'Clean first, then compare — two steps'],
      explanation: 'Solution steps:\n1. Use isalnum() to filter non-alphanumeric characters\n2. Use lower() to normalize case\n3. Use slicing [::-1] to reverse the string\n4. Compare original and reversed\n\nOne-liner: cleaned == cleaned[::-1]\n\nAdvanced interview follow-up: How to achieve O(1) space with two pointers?\ndef is_palindrome(s):\n    l, r = 0, len(s) - 1\n    while l < r:\n        while l < r and not s[l].isalnum(): l += 1\n        while l < r and not s[r].isalnum(): r -= 1\n        if s[l].lower() != s[r].lower(): return False\n        l += 1; r -= 1\n    return True',
      frameworkTip: 'In interviews, first write the concise [::-1] solution, then proactively say "for O(1) space, we can use two pointers". Show you know multiple approaches and trade-offs.',
    },
    {
      id: 4,
      name: 'String Compression',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Analytics Log Compression',
        narrative: 'You\'re at a data analytics company and need to compress repetitive log characters to save storage space. This is a common string processing question at Amazon interviews, testing your loop and counting skills.',
      },
      question: 'Write a function compress(s) that compresses consecutive repeated characters into "character + count" format. If the compressed string is not shorter, return the original.\n\n```python\n# Examples\ncompress("aabcccccaaa")  # → "a2b1c5a3"\ncompress("abc")          # → "abc" (compressed "a1b1c1" is longer, return original)\ncompress("")             # → ""\n```',
      starterCode: 'def compress(s):\n    if not s:\n        return s\n    result = []\n    count = 1\n    # Iterate through string, compare adjacent characters\n    pass',
      expectedQuery: 'def compress(s):\n    if not s:\n        return s\n    result = []\n    count = 1\n    for i in range(1, len(s)):\n        if s[i] == s[i - 1]:\n            count += 1\n        else:\n            result.append(s[i - 1] + str(count))\n            count = 1\n    result.append(s[-1] + str(count))\n    compressed = "".join(result)\n    return compressed if len(compressed) < len(s) else s',
      hints: ['Compare s[i] and s[i-1] to detect character changes', 'Don\'t forget to handle the last group after the loop ends', 'Compare compressed and original string lengths at the end'],
      explanation: 'Key points:\n1. Iterate through the string, tracking current character and consecutive count\n2. When a different character is encountered, add "char + count" to result\n3. After the loop, handle the last group (easy-to-miss edge case)\n4. Compare compressed length to decide which to return\n\nUse list + join instead of string concatenation, because Python strings are immutable — each + creates a new object. List then join is more efficient.',
      frameworkTip: 'Mentioning "use list to collect results then join, instead of string + concatenation" shows interviewers you understand Python string immutability and performance considerations.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-4: List & Tuple — 3 Extra Challenges
  // ══════════════════════════════════════════════════════════════════
  '16-4': [
    {
      id: 4,
      name: 'Two Sum (LeetCode #1)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'Blind 75',
      scenario: {
        title: 'E-Commerce Cart Bundle Feature',
        narrative: 'You\'re building a promotion feature at an e-commerce platform: find which two items in the cart add up exactly to the discount threshold. This is LeetCode #1 Two Sum, THE most frequently asked question in programming interview history, bar none.',
      },
      question: 'Write a function two_sum(nums, target) that finds two numbers in the array whose indices sum to target.\n\nAssume each input has exactly one solution and the same element cannot be used twice.\n\n```python\n# Examples\ntwo_sum([2, 7, 11, 15], 9)   # → [0, 1] (nums[0] + nums[1] = 9)\ntwo_sum([3, 2, 4], 6)         # → [1, 2]\ntwo_sum([3, 3], 6)            # → [0, 1]\n```',
      starterCode: 'def two_sum(nums, target):\n    # Hint: use dict to store "seen number → index"\n    # For each number, check if target - number exists in dict\n    seen = {}\n    pass',
      expectedQuery: 'def two_sum(nums, target):\n    seen = {}\n    for i, num in enumerate(nums):\n        complement = target - num\n        if complement in seen:\n            return [seen[complement], i]\n        seen[num] = i',
      hints: ['Brute force: nested for loops O(n^2). Optimal: dict O(n)', 'For each number num, its "complement" is target - num', 'Dict key is the number, value is the index', 'enumerate() gives both index and value'],
      explanation: 'Two Sum O(n) solution core concept:\n1. Iterate through array, for each num calculate complement = target - num\n2. Check if complement exists in seen dict\n   - Yes → found the answer, return both indices\n   - No → store num and its index in seen\n\nWhy dict? Because dict lookup is O(1), making the overall solution O(n).\n\nThis is THE most classic application of hash tables.',
      frameworkTip: 'This is LeetCode problem #1 and the most asked interview question ever. Start with brute force O(n^2), then optimize to O(n) hash table. Using enumerate instead of range(len()) is more Pythonic.',
    },
    {
      id: 5,
      name: 'Best Time to Buy and Sell Stock (LeetCode #121)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'Blind 75',
      scenario: {
        title: 'Stock Trading Optimal Timing Analysis',
        narrative: 'You\'re doing quantitative analysis at a fintech startup. Your boss gives you historical stock price data and asks you to find the best day to buy and sell for maximum profit. This is LeetCode #121, a high-frequency Blind 75 problem.',
      },
      question: 'Write a function max_profit(prices) that returns the maximum profit achievable. You can only buy once and sell once, and must buy before selling. Return 0 if no profit is possible.\n\n```python\n# Examples\nmax_profit([7, 1, 5, 3, 6, 4])  # → 5 (buy day 2 at $1, sell day 5 at $6)\nmax_profit([7, 6, 4, 3, 1])     # → 0 (price keeps dropping, no trade)\n```',
      starterCode: 'def max_profit(prices):\n    # Track "lowest price so far" and "maximum profit"\n    # For each price, calculate: if I sell today, what\'s the profit?\n    pass',
      expectedQuery: 'def max_profit(prices):\n    if not prices:\n        return 0\n    min_price = prices[0]\n    profit = 0\n    for price in prices[1:]:\n        if price < min_price:\n            min_price = price\n        else:\n            profit = max(profit, price - min_price)\n    return profit',
      hints: ['No need to track which day to buy/sell, just track min price and max profit', 'For each price, either update min price or calculate profit', 'One pass O(n) is sufficient'],
      explanation: 'The elegance of this problem: no need for nested loops comparing all pairs.\n\nCore idea:\n1. Maintain min_price = lowest buy price so far\n2. Maintain profit = maximum profit so far\n3. For each price:\n   - If lower than min_price → update min_price\n   - Otherwise → calculate profit price - min_price, update profit\n\nThis is a classic application of greedy algorithm: making the optimal local decision at each point.',
      frameworkTip: 'When solving this in interviews, first say "brute force is O(n^2) nested loops", then say "but we can use greedy for O(n): track the minimum buy price". Interviewers want to hear your optimization thought process.',
    },
    {
      id: 6,
      name: 'List Slicing & Tuple Immutability',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'Safety Considerations in Data Pipelines',
        narrative: 'You\'re building a data analysis pipeline and need to ensure certain configuration values can\'t be accidentally modified. Understanding the difference between list and tuple is crucial in practice.',
      },
      question: 'What is the output of this code?\n\n```python\noriginal = [1, 2, [3, 4]]\nshallow = original[:]\nshallow[0] = 99\nshallow[2][0] = 99\n\nprint(original)\nprint(type((1,)))\nprint(type((1)))\n```',
      options: [
        { id: 'A', text: '[1, 2, [99, 4]]\n<class \'tuple\'>\n<class \'int\'>', explanation: 'Correct! [:] is a shallow copy: first level is independent, but nested objects (list) share references. (1,) is a tuple, (1) is just an int with parentheses.' },
        { id: 'B', text: '[99, 2, [99, 4]]\n<class \'tuple\'>\n<class \'tuple\'>', explanation: 'After shallow copy, modifying shallow[0] does not affect original[0]. (1) is not a tuple, it\'s an int.' },
        { id: 'C', text: '[1, 2, [3, 4]]\n<class \'tuple\'>\n<class \'int\'>', explanation: 'Nested objects in shallow copies share references, so shallow[2][0] = 99 affects original[2][0].' },
        { id: 'D', text: '[1, 2, [99, 4]]\n<class \'tuple\'>\n<class \'tuple\'>', explanation: '(1) is missing the comma, Python treats it as regular parentheses, not a tuple.' },
      ],
      correctAnswer: 'A',
      hints: ['[:] is a shallow copy — only copies the first level', 'Nested lists still share the same reference', 'The key to creating a tuple is the comma, not the parentheses'],
      explanation: 'Two important concepts:\n\n1. Shallow vs Deep Copy:\n   - original[:] or list(original) is a shallow copy\n   - First level is an independent copy, but nested objects share references\n   - For fully independent copies: import copy; copy.deepcopy()\n\n2. Tuple Creation:\n   - The key is the comma, not the parentheses\n   - (1,) → tuple\n   - (1) → int (parentheses treated as math grouping)\n   - 1, → also a tuple',
      frameworkTip: '"Shallow vs deep copy" is a high-frequency Python interview topic. Remember: [:] and list() are both shallow copies. If the interviewer asks about deep copying, answer copy.deepcopy().',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 16-5: Dict & Set — 3 Extra Challenges
  // ══════════════════════════════════════════════════════════════════
  '16-5': [
    {
      id: 4,
      name: 'Character Frequency Counting',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'E-Commerce Search Keyword Analysis',
        narrative: 'You\'re on the search team at an e-commerce platform, analyzing character frequencies in user search keywords to find the most common characters for optimizing search suggestions. This is the most fundamental and important dict application.',
      },
      question: 'Write a function char_frequency(s) that returns the frequency of each character (as a dict) and finds the most frequent character.\n\n```python\n# Examples\nchar_frequency("hello")\n# → ({"h": 1, "e": 1, "l": 2, "o": 1}, "l")\n\nchar_frequency("aabbcc")\n# → ({"a": 2, "b": 2, "c": 2}, "a")  # When tied, return the first one\n```',
      starterCode: 'def char_frequency(s):\n    freq = {}\n    # Iterate through string, count with dict\n    # Find the most frequent character\n    pass',
      expectedQuery: 'def char_frequency(s):\n    freq = {}\n    for c in s:\n        freq[c] = freq.get(c, 0) + 1\n    max_char = max(freq, key=freq.get) if freq else ""\n    return (freq, max_char)',
      hints: ['dict.get(key, default) returns default when key doesn\'t exist', 'max(dict, key=dict.get) finds the key with the largest value', 'You could also use collections.Counter, but interviews usually want you to write it manually'],
      explanation: 'Three ways to count characters:\n\n1. Manual counting (must-know for interviews):\n   freq[c] = freq.get(c, 0) + 1\n\n2. defaultdict:\n   from collections import defaultdict\n   freq = defaultdict(int)\n   freq[c] += 1\n\n3. Counter (most concise):\n   from collections import Counter\n   freq = Counter(s)\n\nWrite the manual version first in interviews, then mention Counter for bonus points.\nmax(freq, key=freq.get) is the idiomatic way to find the key with the largest value in a dict.',
      frameworkTip: 'Character counting is the most basic dict application and the foundation of nearly all hash table problems. Using dict.get(key, 0) instead of if key in dict is more concise. Mentioning Counter earns bonus points.',
    },
    {
      id: 5,
      name: 'Valid Anagram (LeetCode #242)',
      type: 'code',
      difficulty: 'easy',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'SaaS Platform Duplicate Content Detection',
        narrative: 'You\'re at a content management SaaS platform and need to detect if someone rearranges the same characters to create seemingly different content (anagram). This is LeetCode #242, a classic hash table application.',
      },
      question: 'Write a function is_anagram(s, t) that determines if t is an anagram of s.\n\nAnagram = two strings use exactly the same letters, just in different order.\n\n```python\n# Examples\nis_anagram("anagram", "nagaram")  # → True\nis_anagram("rat", "car")          # → False\nis_anagram("", "")                 # → True\n```',
      starterCode: 'def is_anagram(s, t):\n    # Approach: compare character frequencies of both strings\n    # Use dict to count character frequencies for each string\n    pass',
      expectedQuery: 'def is_anagram(s, t):\n    if len(s) != len(t):\n        return False\n    freq = {}\n    for c in s:\n        freq[c] = freq.get(c, 0) + 1\n    for c in t:\n        freq[c] = freq.get(c, 0) - 1\n        if freq[c] < 0:\n            return False\n    return True',
      hints: ['If the two strings differ in length, they can\'t be anagrams', 'Use one dict: +1 when iterating s, -1 when iterating t', 'If any count goes negative, t has a character s doesn\'t', 'Simplest solution: sorted(s) == sorted(t), but that\'s O(n log n)'],
      explanation: 'Three approaches compared:\n\n1. Sorting (simplest): sorted(s) == sorted(t)\n   - Time O(n log n), Space O(n)\n\n2. Two dicts: count each separately, then compare\n   - Time O(n), Space O(n)\n\n3. Single dict (optimal): +1 for s chars, -1 for t chars\n   - Time O(n), Space O(1) (only 26 letters)\n   - If all values are 0 at the end, it\'s an anagram\n\nIn interviews, write the sorting solution first to show quick problem-solving, then optimize to hash table.',
      frameworkTip: 'A common follow-up for this problem: "What if the input contains Unicode characters?" Answer: the hash table approach is unaffected, but sorting may need locale considerations. Show you think about extensibility.',
    },
    {
      id: 6,
      name: 'Set Operations',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'LeetCode Easy',
      scenario: {
        title: 'User Behavior Cross-Analysis',
        narrative: 'You\'re doing user behavior analysis: finding "users who bought both A and B", "users who only bought A", "all users who bought A or B". This is the perfect use case for Set operations.',
      },
      question: 'What is the output of this code?\n\n```python\nbought_a = {"Alice", "Bob", "Carol", "Dave"}\nbought_b = {"Bob", "Carol", "Eve", "Frank"}\n\nboth = bought_a & bought_b\nonly_a = bought_a - bought_b\neither = bought_a | bought_b\nnot_both = bought_a ^ bought_b\n\nprint(len(both), len(only_a), len(either), len(not_both))\n```',
      options: [
        { id: 'A', text: '2 2 6 4', explanation: 'Correct! & intersection {Bob, Carol}=2, - difference {Alice, Dave}=2, | union 6 people (no duplicates), ^ symmetric difference {Alice, Dave, Eve, Frank}=4.' },
        { id: 'B', text: '2 2 8 4', explanation: 'Union | removes duplicates, Bob and Carol are counted only once.' },
        { id: 'C', text: '2 4 6 4', explanation: 'Difference bought_a - bought_b only includes elements "in A but not in B".' },
        { id: 'D', text: '2 2 6 2', explanation: 'Symmetric difference ^ includes "in A or B but not in both", which is Alice, Dave, Eve, Frank.' },
      ],
      correctAnswer: 'A',
      hints: ['& intersection: elements in both sets', '- difference: in A but not in B', '| union: in either set (deduplicated)', '^ symmetric difference: in one set but not both'],
      explanation: 'Python Set four major operations:\n- A & B (intersection): exists in both sets\n- A - B (difference): only in A, not in B\n- A | B (union): in either set (deduplicated)\n- A ^ B (symmetric_difference): in only one of the sets\n\nEquivalent methods:\n- A.intersection(B)\n- A.difference(B)\n- A.union(B)\n- A.symmetric_difference(B)',
      frameworkTip: 'When you encounter "find common elements of two lists" or "find unique elements" in interviews, immediately think Set. Set operations are more Pythonic than for loops and have better time complexity (O(n) vs O(n^2)).',
    },
  ],
}
