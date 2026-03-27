// ── World 17 Extra Challenges (Functions & Error Handling Interview Classics) ──────────────────

export const w17ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-1: Function Basics — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '17-1': [
    {
      id: 5,
      name: 'Pure Function vs Side Effects',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Pure Functions vs Side Effects',
        narrative: 'In a Google interview, you\'re asked about core functional programming concepts. The interviewer shows you three code snippets and asks which one is a "pure function" and why it matters in large-scale systems.',
      },
      question: 'Which of the following is a "Pure Function"?\n\n```python\ntotal = 0\n\ndef func_a(price, tax_rate):\n    global total\n    total += price * (1 + tax_rate)\n    return total\n\ndef func_b(price, tax_rate):\n    return price * (1 + tax_rate)\n\ndef func_c(price, tax_rate):\n    result = price * (1 + tax_rate)\n    print(f"Result: {result}")\n    return result\n```',
      options: [
        { id: 'A', text: 'func_a', explanation: 'func_a modifies the global variable total, which is a classic side effect.' },
        { id: 'B', text: 'func_b', explanation: 'Correct! func_b only depends on its input parameters, does not modify external state, and always produces the same output for the same input. This is the definition of a pure function.' },
        { id: 'C', text: 'func_c', explanation: 'func_c returns the correct result, but print() is an I/O operation, which counts as a side effect.' },
        { id: 'D', text: 'Both func_a and func_c', explanation: 'Both have side effects: func_a modifies a global variable, func_c performs I/O.' },
      ],
      correctAnswer: 'B',
      hints: ['Two conditions for pure functions: (1) same input always returns same output (2) no side effects', 'Side effects include: modifying global variables, I/O operations, mutating mutable arguments'],
      explanation: 'A Pure Function must satisfy:\n1. Deterministic: same input → same output\n2. No side effects: no external state modification, no I/O\n\nBenefits: easy to test, parallelizable, cacheable (memoization). At companies like Google, pure functions are an important code review guideline.',
      frameworkTip: 'When discussing pure functions in interviews, connect to "testability" and "predictability". Google values this especially because large distributed systems need reliable function behavior.',
    },
    {
      id: 6,
      name: 'First-Class Functions',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Functions as First-Class Citizens',
        narrative: 'You\'re building a promotion engine for an e-commerce platform. Different promotions have different discount logic. Instead of writing a chain of if/else statements, you need to design a flexible pricing system by passing functions as arguments.',
      },
      question: 'Write a function apply_discount(price, discount_func) that takes a price and a discount function as arguments and returns the discounted price.\n\nThen write two discount functions:\n- percent_off(rate) returns a function that multiplies price by (1 - rate)\n- fixed_off(amount) returns a function that subtracts amount from price (minimum 0)\n\nExamples:\napply_discount(100, percent_off(0.2)) → 80.0\napply_discount(50, fixed_off(30)) → 20\napply_discount(10, fixed_off(30)) → 0',
      starterCode: 'def apply_discount(price, discount_func):\n    # Call discount_func as a function\n    pass\n\ndef percent_off(rate):\n    # Return a discount function\n    pass\n\ndef fixed_off(amount):\n    # Return a discount function\n    pass',
      expectedQuery: 'def apply_discount(price, discount_func):\n    return discount_func(price)\n\ndef percent_off(rate):\n    def discount(price):\n        return price * (1 - rate)\n    return discount\n\ndef fixed_off(amount):\n    def discount(price):\n        return max(0, price - amount)\n    return discount',
      hints: ['In Python, functions are first-class citizens and can be passed as arguments', 'percent_off and fixed_off need to return a "function", not a value', 'Use max(0, ...) to ensure price doesn\'t go negative'],
      explanation: 'This demonstrates Python\'s "First-Class Functions" feature:\n- Functions can be passed as arguments\n- Functions can be returned as values\n- Functions can be stored in variables\n\npercent_off and fixed_off are "Higher-Order Functions" — they return functions. This pattern is very common in the Strategy Pattern.',
      frameworkTip: 'Showing you can pass functions as arguments tells interviewers you understand functional programming. Mentioning "Strategy Pattern" or "Higher-Order Functions" earns bonus points.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-2: Advanced Parameters *args/**kwargs — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '17-2': [
    {
      id: 3,
      name: 'Flexible Logger Function',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Building a Flexible Logger with *args/**kwargs',
        narrative: 'You\'re on Amazon\'s backend team and need to design a flexible logging function. Different microservices need different log formats, so you\'ll use *args and **kwargs to build a universal logger.',
      },
      question: 'Write a function smart_log(*args, **kwargs):\n- Join all args with " | " into a message string\n- If kwargs has level, prepend "[LEVEL] " (uppercase) to the message\n- If kwargs has timestamp, prepend timestamp + " " at the very beginning\n- Return the final log string\n\nExamples:\nsmart_log("User login", "id=123") → "User login | id=123"\nsmart_log("Error", "DB timeout", level="warning") → "[WARNING] Error | DB timeout"\nsmart_log("Sale", amount="$500", level="info", timestamp="2024-01-15") → "2024-01-15 [INFO] Sale"',
      starterCode: 'def smart_log(*args, **kwargs):\n    # 1. Join all args with " | "\n    # 2. Check kwargs for level and timestamp\n    # 3. Compose the final string\n    pass',
      expectedQuery: 'def smart_log(*args, **kwargs):\n    message = " | ".join(str(a) for a in args)\n    level = kwargs.get("level")\n    timestamp = kwargs.get("timestamp")\n    if level:\n        message = f"[{level.upper()}] {message}"\n    if timestamp:\n        message = f"{timestamp} {message}"\n    return message',
      hints: ['Use " | ".join() to connect args', 'Use kwargs.get("level") for safe access', 'Watch the composition order: timestamp first, then level before message'],
      explanation: '*args collects positional arguments into a tuple, **kwargs collects keyword arguments into a dict. This design lets a function accept any number and type of arguments, perfect for logging, event systems, and other flexible scenarios.',
      frameworkTip: 'When asked about practical uses of *args/**kwargs in interviews, logging systems and decorators are the best examples. Amazon values extensible system design.',
    },
    {
      id: 4,
      name: 'Function Signature Design',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Function Parameter Design Best Practices',
        narrative: 'During an Amazon code review, a senior engineer points out a function\'s parameter design is flawed. You need to understand Python function signature best practices and parameter ordering rules.',
      },
      question: 'Which function definition will raise a SyntaxError?\n\n```python\n# A\ndef func_a(a, b=10, *args, **kwargs):\n    pass\n\n# B\ndef func_b(a, *args, b=10, **kwargs):\n    pass\n\n# C\ndef func_c(a, **kwargs, *args):\n    pass\n\n# D\ndef func_d(*, key, value="default"):\n    pass\n```',
      options: [
        { id: 'A', text: 'func_a', explanation: 'func_a has valid parameter order: regular → default → *args → **kwargs.' },
        { id: 'B', text: 'func_b', explanation: 'func_b is valid! b=10 after *args becomes a keyword-only parameter, callable only with func_b(1, 2, 3, b=20).' },
        { id: 'C', text: 'func_c', explanation: 'Correct! **kwargs must come last, it cannot appear before *args. Python requires parameter order: regular → default → *args → keyword-only → **kwargs.' },
        { id: 'D', text: 'func_d', explanation: 'func_d is valid! Parameters after bare * are keyword-only, they must be passed by name.' },
      ],
      correctAnswer: 'C',
      hints: ['Python parameter order: positional → default → *args → keyword-only → **kwargs', '**kwargs must always be last', 'A bare * means all following parameters are keyword-only'],
      explanation: 'Valid Python function parameter order:\n1. Regular positional parameters (a, b)\n2. Parameters with defaults (c=10)\n3. *args (collects extra positional args)\n4. Keyword-only parameters (after *args)\n5. **kwargs (must be last)\n\nNote: In func_b, b=10 after *args automatically becomes a keyword-only parameter.',
      frameworkTip: 'Being able to explain keyword-only parameters (PEP 3102) and parameter ordering rules in interviews shows deep Python understanding. Amazon values clean API design.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-3: Scope & Built-in Functions — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '17-3': [
    {
      id: 3,
      name: 'Closure Interview Classic',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Closure — The Counter',
        narrative: 'This is a classic Google and Meta interview question. The interviewer asks you to implement a counter using only functions, no classes. It tests your understanding of closures — an inner function "remembering" the outer function\'s variables.',
      },
      question: 'Implement a counter factory function make_counter(start=0) using closures:\n- Returns a function counter()\n- Each call to counter() returns the current count value and increments by 1\n- The start parameter sets the initial value\n\nExamples:\ncounter = make_counter()\ncounter() → 0\ncounter() → 1\ncounter() → 2\n\ncounter_from_10 = make_counter(10)\ncounter_from_10() → 10\ncounter_from_10() → 11',
      starterCode: 'def make_counter(start=0):\n    # Hint: you need the nonlocal keyword\n    # to let the inner function modify the outer variable\n    pass',
      expectedQuery: 'def make_counter(start=0):\n    count = start\n    def counter():\n        nonlocal count\n        current = count\n        count += 1\n        return current\n    return counter',
      hints: ['Closure = inner function + the outer variables it "remembers"', 'You need the nonlocal keyword to modify (not shadow) the outer variable', 'Save the current value, increment, then return the saved value'],
      explanation: 'Closure is a core concept in functional programming:\n- The inner function counter() "remembers" the outer count variable\n- Even after make_counter() has finished executing, count still exists\n- The nonlocal declaration lets the inner function modify (rather than shadow) the outer variable\n\nClosures are the foundation of decorators — understanding closures is prerequisite to understanding decorators.',
      frameworkTip: 'When asked about closures in interviews, first draw the scope chain (LEGB), then explain nonlocal\'s role. Mentioning that closures are the foundation of decorators will impress interviewers.',
    },
    {
      id: 4,
      name: 'global vs nonlocal',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'The Difference Between global and nonlocal',
        narrative: 'The interviewer asks about Python\'s scope rules (LEGB) and the difference between global and nonlocal. This is foundational for understanding closures and decorators.',
      },
      question: 'What is the output of this code?\n\n```python\nx = "global"\n\ndef outer():\n    x = "outer"\n    def inner():\n        nonlocal x\n        x = "inner"\n    inner()\n    print("outer:", x)\n\nouter()\nprint("global:", x)\n```',
      options: [
        { id: 'A', text: 'outer: inner\nglobal: inner', explanation: 'nonlocal only affects the enclosing function\'s variable, not the global variable.' },
        { id: 'B', text: 'outer: inner\nglobal: global', explanation: 'Correct! nonlocal makes inner() modify outer()\'s x (changed to "inner"), but the global x is unaffected and remains "global".' },
        { id: 'C', text: 'outer: outer\nglobal: global', explanation: 'nonlocal causes x = "inner" inside inner() to modify outer()\'s x.' },
        { id: 'D', text: 'outer: outer\nglobal: inner', explanation: 'nonlocal modifies the enclosing function\'s variable, not the global one. Use global to modify the global variable.' },
      ],
      correctAnswer: 'B',
      hints: ['nonlocal looks up to the nearest enclosing function\'s variable', 'global goes directly to the global variable', 'Python scope rules: LEGB (Local → Enclosing → Global → Built-in)'],
      explanation: 'Python scope rules LEGB:\n- Local: inside the function\n- Enclosing: outer function (closure)\n- Global: module level\n- Built-in: Python built-ins\n\nnonlocal binds to the Enclosing scope, global binds to the Global scope. They do not affect each other.',
      frameworkTip: 'Being able to clearly explain the LEGB rule and the difference between nonlocal vs global is an indicator of advanced Python skills. Google interviews especially love testing language mechanics.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-4: Error Types & Debugging — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '17-4': [
    {
      id: 3,
      name: 'Common Exception Type Identification',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: 'Quick Exception Type Identification',
        narrative: 'You\'re on-call at an e-commerce company and the system is throwing errors at 3 AM. You need to quickly identify exception types to find the right fix. Understanding Python\'s exception types is the foundation of efficient debugging.',
      },
      question: 'What exception does each of these four code snippets raise?\n\n```python\n# Snippet 1\ndata = {"name": "Alice"}\nprint(data["age"])\n\n# Snippet 2\nnumbers = [1, 2, 3]\nprint(numbers[5])\n\n# Snippet 3\nage = int("twenty")\n\n# Snippet 4\nresult = None\nprint(result.upper())\n```',
      options: [
        { id: 'A', text: 'KeyError, IndexError, ValueError, AttributeError', explanation: 'Correct! Missing dict key → KeyError; list out of range → IndexError; invalid type conversion → ValueError; object lacks attribute/method → AttributeError.' },
        { id: 'B', text: 'ValueError, IndexError, TypeError, AttributeError', explanation: 'Accessing a non-existent dict key is KeyError, not ValueError.' },
        { id: 'C', text: 'KeyError, IndexError, TypeError, NameError', explanation: 'Snippet 3 is ValueError (value cannot be converted), not TypeError. Snippet 4 is AttributeError.' },
        { id: 'D', text: 'KeyError, ValueError, ValueError, TypeError', explanation: 'Snippet 2 is IndexError (index out of range). Snippet 4 where None lacks .upper() is AttributeError.' },
      ],
      correctAnswer: 'A',
      hints: ['KeyError: key not found in dict', 'IndexError: sequence index out of range', 'ValueError: correct type but invalid content', 'AttributeError: object lacks the specified attribute or method'],
      explanation: 'The four most common Python exceptions:\n- KeyError: accessing a non-existent dict key (use .get() to avoid)\n- IndexError: list/tuple index out of range\n- ValueError: invalid value format or content (e.g., int("abc"))\n- AttributeError: object lacks the method or attribute (e.g., None.upper())\n\nQuick exception type identification is the first step to efficient debugging.',
      frameworkTip: 'When asked about debugging skills in interviews, accurately naming exception types and their defenses (dict.get(), bounds checking, try/except) demonstrates real-world experience.',
    },
    {
      id: 4,
      name: 'Custom Exceptions',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: 'Building Business-Specific Exception Classes',
        narrative: 'You\'re designing an order processing system and need custom exception classes to distinguish different business errors. Using generic ValueError or RuntimeError isn\'t specific enough — custom exceptions enable more precise error handling.',
      },
      question: 'Build an order system exception hierarchy:\n1. OrderError(Exception): base order exception, accepts message and order_id\n2. InsufficientStockError(OrderError): stock shortage, additionally accepts product and requested quantity\n3. Write a function process_order(order_id, product, quantity, stock):\n   - If stock < quantity, raise InsufficientStockError\n   - Otherwise return f"Order {order_id}: {quantity}x {product} confirmed"\n\nExamples:\nprocess_order("A001", "Laptop", 5, 3) → raises InsufficientStockError\nprocess_order("A002", "Mouse", 2, 10) → "Order A002: 2x Mouse confirmed"',
      starterCode: 'class OrderError(Exception):\n    def __init__(self, message, order_id):\n        pass\n\nclass InsufficientStockError(OrderError):\n    def __init__(self, order_id, product, requested, available):\n        pass\n\ndef process_order(order_id, product, quantity, stock):\n    pass',
      expectedQuery: 'class OrderError(Exception):\n    def __init__(self, message, order_id):\n        super().__init__(message)\n        self.order_id = order_id\n\nclass InsufficientStockError(OrderError):\n    def __init__(self, order_id, product, requested, available):\n        message = f"Insufficient stock for {product}: requested {requested}, available {available}"\n        super().__init__(message, order_id)\n        self.product = product\n        self.requested = requested\n        self.available = available\n\ndef process_order(order_id, product, quantity, stock):\n    if stock < quantity:\n        raise InsufficientStockError(order_id, product, quantity, stock)\n    return f"Order {order_id}: {quantity}x {product} confirmed"',
      hints: ['Custom exceptions should inherit from Exception or its subclass', 'Use super().__init__(message) to initialize the parent class', 'Use raise to throw exceptions, not return'],
      explanation: 'Custom exception best practices:\n1. Inherit from Exception (not BaseException)\n2. Use super().__init__() to properly initialize parent class\n3. Add extra attributes (order_id, product, etc.) for downstream handling\n4. Build exception hierarchies (OrderError → InsufficientStockError) for layered catching\n\nThis lets except OrderError catch all order-related errors, while except InsufficientStockError catches only stock shortages.',
      frameworkTip: 'Showing custom exception hierarchies (instead of generic ValueError) and explaining "except parent catches all children" demonstrates understanding of Python\'s exception inheritance.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 17-5: try/except & Defensive Programming — 3 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '17-5': [
    {
      id: 4,
      name: '@timer Decorator',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Decorator Classic Trio #1: Timer',
        narrative: 'In Meta interviews, decorators are a must-know topic. The interviewer asks you to write a @timer decorator that measures function execution time. This is the most basic decorator application and the starting point for understanding advanced decorators.',
      },
      question: 'Write a @timer decorator that measures the execution time of the decorated function:\n- Use time.time() to calculate start and end times\n- Print "{function_name} took {seconds:.4f}s"\n- Return the original function\'s return value\n- Use functools.wraps to preserve the original function\'s metadata\n\nExample:\n@timer\ndef slow_add(a, b):\n    time.sleep(0.1)\n    return a + b\n\nresult = slow_add(1, 2)  # prints "slow_add took 0.10xxs"\nprint(result)  # 3',
      starterCode: 'import time\nimport functools\n\ndef timer(func):\n    # Write a wrapper function\n    # Record start time → execute original function → record end time → print elapsed\n    pass',
      expectedQuery: 'import time\nimport functools\n\ndef timer(func):\n    @functools.wraps(func)\n    def wrapper(*args, **kwargs):\n        start = time.time()\n        result = func(*args, **kwargs)\n        end = time.time()\n        print(f"{func.__name__} took {end - start:.4f}s")\n        return result\n    return wrapper',
      hints: ['A decorator is a function that takes a function and returns a function', 'wrapper must use *args, **kwargs to accept any arguments', 'functools.wraps(func) preserves __name__ and other attributes', 'Don\'t forget to return result'],
      explanation: 'The essence of a decorator:\n@timer\ndef f(): ...\nis equivalent to f = timer(f)\n\nStructure:\n1. timer(func) receives the original function\n2. Define wrapper(*args, **kwargs) with wrapping logic\n3. wrapper calls func(*args, **kwargs) internally\n4. Return wrapper\n\nfunctools.wraps is important — without it, f.__name__ becomes "wrapper", which is confusing during debugging.',
      frameworkTip: 'When writing decorators in interviews, always remember @functools.wraps and return result. These two common mistakes are details interviewers specifically watch for.',
    },
    {
      id: 5,
      name: '@retry Decorator',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Decorator Classic Trio #2: Auto-Retry',
        narrative: 'You\'re on Meta\'s infrastructure team. API calls occasionally fail due to network instability. You need to write a @retry decorator that automatically retries failed functions. This is an essential defense mechanism in microservice architectures.',
      },
      question: 'Write a @retry(max_attempts=3) decorator:\n- If the function raises an exception, automatically retry up to max_attempts times\n- Wait 1 second between retries (use time.sleep)\n- If all retries fail, raise the last exception\n- Use functools.wraps to preserve metadata\n\nExample:\n@retry(max_attempts=3)\ndef unstable_api():\n    import random\n    if random.random() < 0.7:\n        raise ConnectionError("API timeout")\n    return "success"',
      starterCode: 'import time\nimport functools\n\ndef retry(max_attempts=3):\n    # Note: this is a "decorator with parameters"\n    # Requires three levels of nested functions\n    pass',
      expectedQuery: 'import time\nimport functools\n\ndef retry(max_attempts=3):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            last_exception = None\n            for attempt in range(max_attempts):\n                try:\n                    return func(*args, **kwargs)\n                except Exception as e:\n                    last_exception = e\n                    if attempt < max_attempts - 1:\n                        time.sleep(1)\n            raise last_exception\n        return wrapper\n    return decorator',
      hints: ['Decorator with parameters needs three levels: retry(params) → decorator(func) → wrapper(*args, **kwargs)', 'Use a for loop to control retry count', 'Use try/except to catch exceptions, raise on final failure', 'No sleep needed after the last retry'],
      explanation: 'A decorator with parameters has three layers:\n1. retry(max_attempts) — receives the decorator\'s parameters\n2. decorator(func) — receives the decorated function\n3. wrapper(*args, **kwargs) — the actual wrapping logic\n\n@retry(max_attempts=3) is equivalent to:\ndecorator = retry(max_attempts=3)\nf = decorator(f)\n\nThe retry pattern is extremely common in production, especially for network requests, database connections, and other unstable operations.',
      frameworkTip: 'Writing a decorator with parameters (three-level nesting) in an interview is a hallmark of intermediate-to-advanced Python skills. Mentioning "exponential backoff" strategy earns bonus points.',
    },
    {
      id: 6,
      name: 'Memoization Concept',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Memoization for Speeding Up Recursion',
        narrative: 'In a Meta interview, the interviewer gives you a recursive Fibonacci function and asks why fib(40) takes forever. You need to explain the memoization concept and Python\'s built-in solution.',
      },
      question: 'Which statement about memoization is correct?\n\n```python\nfrom functools import lru_cache\n\n@lru_cache(maxsize=128)\ndef fib(n):\n    if n < 2:\n        return n\n    return fib(n-1) + fib(n-2)\n```',
      options: [
        { id: 'A', text: '@lru_cache stores function results in a database permanently', explanation: 'lru_cache stores results in memory, they disappear when the program ends.' },
        { id: 'B', text: '@lru_cache optimizes fib(40) from O(2^n) to O(n), because each fib(k) is computed only once and results are cached in memory', explanation: 'Correct! Without cache, fib(40) repeats over 1 billion computations. With cache, fib(0) through fib(40) are each computed only once — 41 total computations.' },
        { id: 'C', text: 'maxsize=128 means cache results for at most 128 seconds', explanation: 'maxsize is the number of cached "entries", not time. When more than 128 different inputs are cached, the least recently used is evicted (LRU = Least Recently Used).' },
        { id: 'D', text: '@lru_cache can only be used with recursive functions', explanation: 'lru_cache can be used with any pure function, as long as inputs are hashable (cannot be list or dict).' },
      ],
      correctAnswer: 'B',
      hints: ['Memoization = remember previously computed results to avoid redundant computation', 'LRU = Least Recently Used, the least recently used entries are evicted', 'Key constraint: function parameters must be hashable'],
      explanation: 'The core idea of memoization:\n- Trade space for time by caching function results\n- Python has built-in @functools.lru_cache\n- fib(40) goes from O(2^n) ≈ 1 billion → O(n) = 40 computations\n\nConstraints:\n1. Function must be pure (same input → same output)\n2. Parameters must be hashable (no list or dict)\n3. maxsize=None means unlimited cache, maxsize=128 is the default',
      frameworkTip: 'In interviews, first explain why recursive fib is slow (overlapping subproblems), then propose memoization, then mention Python\'s @lru_cache. This shows a complete thought process from problem analysis to solution.',
    },
  ],
}
