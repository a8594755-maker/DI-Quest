// ── World 18 Extra Challenges (Libraries & File I/O Interview Classics) ──────────────────

export const w18ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-1: import & Standard Library — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '18-1': [
    {
      id: 3,
      name: 'Counter Word Frequency',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Product Review Keyword Analysis',
        narrative: 'You are on Amazon\'s product analytics team and need to quickly identify the most frequently mentioned keywords in customer reviews to understand what users praise or complain about most.',
      },
      question: 'Write a function top_keywords(reviews, n) that takes a list of review strings and a number n, and returns the top n most frequent words with their counts. Convert all words to lowercase.\n\nExample:\n```python\nreviews = ["Great battery life", "Battery is amazing", "great screen"]\ntop_keywords(reviews, 2)\n# → [("battery", 2), ("great", 2)]\n```',
      starterCode: 'from collections import Counter\n\ndef top_keywords(reviews, n):\n    # 1. Split all reviews into words, convert to lowercase\n    # 2. Use Counter to count word frequencies\n    # 3. Return the top n most common\n    pass',
      expectedQuery: 'from collections import Counter\n\ndef top_keywords(reviews, n):\n    words = []\n    for review in reviews:\n        words.extend(review.lower().split())\n    counter = Counter(words)\n    return counter.most_common(n)',
      hints: ['Use str.lower().split() to break each review into words', 'Counter can take a list directly to count elements', 'Counter.most_common(n) returns the top n as (element, count) tuples'],
      explanation: 'collections.Counter is Python\'s most practical counting tool:\n- Counter(iterable) automatically counts occurrences of each element\n- .most_common(n) returns the top n most frequent elements\n- It\'s a dict subclass, supporting all dict operations\n\nWidely used in text analysis, log statistics, and similar scenarios.',
      frameworkTip: 'Amazon interviews love Counter questions, especially Top K frequency problems. Remember that Counter.most_common(n) has O(n log k) time complexity, more efficient than manual sorting.',
    },
    {
      id: 4,
      name: 'defaultdict Grouping',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Group Orders by Category',
        narrative: 'You are processing order data for an e-commerce platform and need to group orders by product category. With a regular dict you\'d need to check if the key exists first, but defaultdict makes the code much cleaner.',
      },
      question: 'Write a function group_orders(orders) that takes a list of orders (each order is a (category, product) tuple) and returns a dict where keys are categories and values are lists of products in that category.\n\nExample:\n```python\norders = [("Electronics", "Phone"), ("Clothing", "T-shirt"), ("Electronics", "Earbuds"), ("Clothing", "Jacket")]\ngroup_orders(orders)\n# → {"Electronics": ["Phone", "Earbuds"], "Clothing": ["T-shirt", "Jacket"]}\n```',
      starterCode: 'from collections import defaultdict\n\ndef group_orders(orders):\n    # Use defaultdict(list) to auto-initialize empty lists\n    pass',
      expectedQuery: 'from collections import defaultdict\n\ndef group_orders(orders):\n    grouped = defaultdict(list)\n    for category, product in orders:\n        grouped[category].append(product)\n    return dict(grouped)',
      hints: ['defaultdict(list) auto-initializes each new key with an empty list', 'Just do grouped[key].append(value) without checking if key exists', 'Convert back to regular dict with dict() at the end'],
      explanation: 'defaultdict\'s core value is eliminating the "check if key exists first" step:\n\nRegular dict approach:\nif key not in d:\n    d[key] = []\nd[key].append(value)\n\ndefaultdict approach:\nd[key].append(value)  # auto-initializes\n\nCommon factory functions: list, int, set, lambda: default_value',
      frameworkTip: 'Grouping problems are almost guaranteed in Amazon interviews. Using defaultdict is more Pythonic than dict.setdefault() and cleaner than manual initialization. Proactively mentioning defaultdict earns bonus points.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-2: pip & Third-Party Packages — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '18-2': [
    {
      id: 3,
      name: 'Virtual Environment Management',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'venv vs conda',
        narrative: 'You join a data analytics team and the previous engineer left without documentation. You find both an environment.yml and a requirements.txt in the project. You need to figure out which tool to use for environment management.',
      },
      question: 'Which statement about Python virtual environments is correct?',
      options: [
        { id: 'A', text: 'venv can manage different Python interpreter versions, while conda can only manage packages', explanation: 'It\'s the opposite! venv can only create environments with the current Python version, while conda can specify different Python versions.' },
        { id: 'B', text: 'conda can manage both Python versions and non-Python system dependencies (like CUDA, MKL), while venv only manages Python packages', explanation: 'Correct! conda is a cross-language package manager that can install C/C++ libraries, CUDA toolkit, etc. venv is Python\'s built-in tool that only manages Python packages.' },
        { id: 'C', text: 'venv and conda are functionally identical; it doesn\'t matter which one you choose', explanation: 'venv is a lightweight Python built-in tool, while conda is a full package and environment management system with significant differences.' },
        { id: 'D', text: 'Production projects should not use virtual environments; installing directly to system Python is more stable', explanation: 'Not using virtual environments leads to package version conflicts between projects, which is very bad practice.' },
      ],
      correctAnswer: 'B',
      hints: ['Think about which tool can handle non-Python dependencies', 'venv is part of the Python standard library', 'conda comes from the Anaconda ecosystem'],
      explanation: 'Core differences between venv and conda:\n\nvenv (Python built-in):\n- Lightweight, fast, no extra installation needed\n- Only manages Python packages\n- Best for pure Python projects\n\nconda (Anaconda/Miniconda):\n- Can manage Python versions + non-Python dependencies\n- Best for data science (needs CUDA, MKL, etc.)\n- Has its own package repository: conda-forge',
      frameworkTip: 'Practical rule of thumb: use venv + pip for web development, conda for data science. Showing you know the difference in an interview demonstrates real-world project experience.',
    },
    {
      id: 4,
      name: 'requirements.txt Best Practices',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'The Importance of Version Pinning',
        narrative: 'Your team deployed a Flask API to production, but the requirements.txt only specified flask>=2.0. One day Flask 3.0 was released with a breaking change, causing the production environment to crash. You need to understand the correct approach to version management.',
      },
      question: 'Which requirements.txt version specification is safest for a production environment?',
      options: [
        { id: 'A', text: 'flask\nrequests\npandas', explanation: 'Not specifying versions means "install latest," which could install different versions on each deployment — very dangerous.' },
        { id: 'B', text: 'flask>=2.0\nrequests>=2.28\npandas>=1.5', explanation: 'Only setting a lower bound means a new major version with breaking changes could be installed. Not safe enough for production.' },
        { id: 'C', text: 'flask==3.0.2\nrequests==2.31.0\npandas==2.1.4', explanation: 'Correct! Using == to pin exact versions (pinning) ensures every deployment installs exactly the same versions. Generate with pip freeze > requirements.txt.' },
        { id: 'D', text: 'flask~=3.0\nrequests~=2.31\npandas~=2.1', explanation: '~= allows patch version updates (e.g., 3.0.x), which is acceptable for development but still risky for production.' },
      ],
      correctAnswer: 'C',
      hints: ['Reproducibility is the top priority in production', 'pip freeze lists all installed packages with exact versions', '== is the strictest version specifier'],
      explanation: 'Version specification strategies:\n- Development: use ~= (compatible release) or >=,< (range) for flexibility\n- Production: use == to pin exact versions\n- Generate with: pip freeze > requirements.txt\n\nAdvanced tools: pip-compile (pip-tools) can automatically resolve dependencies and lock versions, similar to npm\'s package-lock.json.',
      frameworkTip: 'Mentioning pip freeze with exact version pinning in an interview shows you have production deployment experience. Going further to mention pip-tools or Poetry will impress interviewers.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-3: File Read/Write txt/csv — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '18-3': [
    {
      id: 4,
      name: 'Large CSV Line-by-Line Processing',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Processing 10GB of Transaction Records',
        narrative: 'You are on Amazon\'s data team and need to process a 10GB CSV file of transaction records. Using pandas.read_csv() directly would load the entire file into memory, causing a MemoryError. You need a more memory-efficient approach.',
      },
      question: 'Write a function sum_column(filepath, column_name) that calculates the sum of a specified column in a CSV file using line-by-line reading, without loading the entire file into memory.\n\nAssume the first row is a header and the specified column contains numbers.\n\nExample CSV:\n```\norder_id,amount,category\n1,250.5,Electronics\n2,89.9,Clothing\n3,1200.0,Electronics\n```\nsum_column("orders.csv", "amount") → 1540.4',
      starterCode: 'import csv\n\ndef sum_column(filepath, column_name):\n    # Use csv.DictReader for line-by-line reading\n    # Do NOT load the entire file at once\n    pass',
      expectedQuery: 'import csv\n\ndef sum_column(filepath, column_name):\n    total = 0\n    with open(filepath, "r", encoding="utf-8") as f:\n        reader = csv.DictReader(f)\n        for row in reader:\n            total += float(row[column_name])\n    return total',
      hints: ['csv.DictReader automatically uses the first row as keys', 'for row in reader reads line by line — only one row in memory at a time', 'Remember to convert string values to float'],
      explanation: 'The core principle for large files is "process line by line" not "load everything":\n\nMemory-exploding approach:\ndf = pd.read_csv("big.csv")  # loads all 10GB\n\nMemory-friendly approach:\nwith open("big.csv") as f:\n    reader = csv.DictReader(f)\n    for row in reader:  # one row at a time\n        ...\n\npandas also has a chunksize parameter for batch reading:\nfor chunk in pd.read_csv("big.csv", chunksize=10000):\n    ...',
      frameworkTip: 'Amazon interviews heavily value memory efficiency. When an interviewer says "the file is large," immediately think of line-by-line processing or generators. Mentioning both csv.DictReader and pandas chunksize demonstrates breadth.',
    },
    {
      id: 5,
      name: 'Encoding Handling',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'The Encoding Crisis',
        narrative: 'You receive a CSV file from a Japanese supplier and get a UnicodeDecodeError when reading it with Python. You need to understand file encoding concepts to solve this problem.',
      },
      question: 'What is the most robust approach to read a CSV file that might be encoded in Shift-JIS?',
      options: [
        { id: 'A', text: 'open("data.csv", "r") without specifying encoding', explanation: 'Without specifying encoding, Python uses the system default (usually UTF-8 or system locale), which will raise an error for non-UTF-8 files.' },
        { id: 'B', text: 'open("data.csv", "r", encoding="utf-8", errors="ignore")', explanation: 'errors="ignore" silently drops characters that can\'t be decoded, causing data loss — very dangerous in data processing.' },
        { id: 'C', text: 'First detect encoding using chardet or charset-normalizer, then open the file with the detected encoding', explanation: 'Correct! Detect-then-read is the most robust approach. chardet.detect() returns the detected encoding and a confidence score, letting you verify before reading with the correct encoding.' },
        { id: 'D', text: 'Read in binary mode with open("data.csv", "rb") to avoid all encoding issues', explanation: 'Binary mode returns bytes not str — you still need to decode to process text content.' },
      ],
      correctAnswer: 'C',
      hints: ['Python 3\'s str is Unicode; reading requires the correct encoding to decode', 'chardet is a library that auto-detects file encoding', 'Reading with the wrong encoding produces garbled text or errors'],
      explanation: 'Best practice for files with unknown encoding:\n\n```python\nimport chardet\n\n# 1. Detect encoding\nwith open("data.csv", "rb") as f:\n    result = chardet.detect(f.read())\n    encoding = result["encoding"]  # e.g., "Shift_JIS"\n\n# 2. Read with correct encoding\nwith open("data.csv", "r", encoding=encoding) as f:\n    content = f.read()\n```\n\nCommon encodings: UTF-8 (universal), Big5 (Traditional Chinese), Shift-JIS (Japanese), GBK (Simplified Chinese).',
      frameworkTip: 'Proactively mentioning encoding handling in file processing questions shows practical experience. Encoding issues are one of the most common bug sources when dealing with multilingual data.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-4: JSON Read/Write — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '18-4': [
    {
      id: 4,
      name: 'Flatten Nested JSON',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'HackerRank',
      scenario: {
        title: 'Convert Complex API Response to Table',
        narrative: 'You received deeply nested JSON data from a third-party API and need to "flatten" it into a single-level dict so it can be converted to CSV or stored in a flat database table.',
      },
      question: 'Write a function flatten_dict(d, parent_key="", sep=".") that flattens a nested dict into a single level, joining keys with ".".\n\nExample:\n```python\ndata = {\n    "user": {\n        "name": "Alice",\n        "address": {\n            "city": "Taipei",\n            "zip": "100"\n        }\n    },\n    "active": True\n}\nflatten_dict(data)\n# → {"user.name": "Alice", "user.address.city": "Taipei", "user.address.zip": "100", "active": True}\n```',
      starterCode: 'def flatten_dict(d, parent_key="", sep="."):\n    # Use recursion to handle nested structures\n    # If a value is a dict, keep flattening\n    # Otherwise, add it to the result\n    pass',
      expectedQuery: 'def flatten_dict(d, parent_key="", sep="."):\n    items = []\n    for k, v in d.items():\n        new_key = f"{parent_key}{sep}{k}" if parent_key else k\n        if isinstance(v, dict):\n            items.extend(flatten_dict(v, new_key, sep).items())\n        else:\n            items.append((new_key, v))\n    return dict(items)',
      hints: ['This is a recursion problem: recurse when the value is a dict', 'Use parent_key to track the full path', 'isinstance(v, dict) determines whether to continue recursing'],
      explanation: 'Flattening nested dicts is an extremely common data processing operation:\n\nCore logic:\n1. Iterate over each key-value pair\n2. If value is a dict → recursively flatten, joining keys with sep\n3. If value is not a dict → add directly to result\n\nIn practice, you can also use pandas.json_normalize(), but interviews usually require you to write the recursive version.',
      frameworkTip: 'Flatten dict is a high-frequency question on HackerRank and in interviews. The key is demonstrating recursive thinking and proper base case handling. Advanced: consider handling dicts nested inside lists.',
    },
    {
      id: 5,
      name: 'API Response Parsing with Error Handling',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: 'Safely Extract Data from APIs',
        narrative: 'You are integrating a weather API, but the JSON response structure is unstable — sometimes fields are missing, sometimes key names are inconsistent. You need a safe parsing function.',
      },
      question: 'Write a function safe_get(data, keys, default=None) that safely retrieves values from a nested dict. keys is a list of key paths, and if any key along the way doesn\'t exist, return default.\n\nExample:\n```python\nresponse = {"data": {"weather": {"temp": 25.5}}}\n\nsafe_get(response, ["data", "weather", "temp"])  # → 25.5\nsafe_get(response, ["data", "wind", "speed"])    # → None\nsafe_get(response, ["data", "wind", "speed"], 0) # → 0\n```',
      starterCode: 'def safe_get(data, keys, default=None):\n    # Traverse level by level\n    # Return default if any level fails\n    pass',
      expectedQuery: 'def safe_get(data, keys, default=None):\n    current = data\n    for key in keys:\n        if isinstance(current, dict) and key in current:\n            current = current[key]\n        else:\n            return default\n    return current',
      hints: ['Iterate through the keys list, going one level deeper each time', 'Use isinstance(current, dict) to ensure the current level is a dict', 'Return default immediately if any key is not found'],
      explanation: 'Safe value retrieval is essential for API response handling:\n\nDangerous approach (may raise KeyError):\ntemp = response["data"]["weather"]["temp"]\n\nSafe approach:\ntemp = safe_get(response, ["data", "weather", "temp"], 0)\n\nPython 3.8+ also supports the walrus operator with dict.get():\nif (d := response.get("data")) and (w := d.get("weather")):\n    temp = w.get("temp", 0)',
      frameworkTip: 'Showing that you consider unstable API responses demonstrates defensive programming thinking. Discussing the trade-offs between try/except vs proactive checking shows practical experience.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-5: OOP Basics (class) — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '18-5': [
    {
      id: 4,
      name: 'dataclass vs Traditional class',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Modern Python Data Classes',
        narrative: 'During a code review at Google, you are asked to rewrite a traditional class as a dataclass. A senior engineer says "After Python 3.7, pure data classes should use the @dataclass decorator." You need to understand why.',
      },
      question: 'Rewrite the following traditional class as a dataclass. The dataclass should auto-generate __init__, __repr__, __eq__, and include a custom method.\n\nTraditional approach:\n```python\nclass Product:\n    def __init__(self, name, price, quantity=0):\n        self.name = name\n        self.price = price\n        self.quantity = quantity\n    \n    def total_value(self):\n        return self.price * self.quantity\n```\n\nRewrite using @dataclass with type hints.',
      starterCode: 'from dataclasses import dataclass\n\n# Rewrite Product class using @dataclass\n# Keep the total_value method\npass',
      expectedQuery: 'from dataclasses import dataclass\n\n@dataclass\nclass Product:\n    name: str\n    price: float\n    quantity: int = 0\n\n    def total_value(self) -> float:\n        return self.price * self.quantity',
      hints: ['The @dataclass decorator auto-generates __init__, __repr__, __eq__', 'Define fields with name: type = default_value syntax', 'Custom methods are written normally inside the class'],
      explanation: '@dataclass advantages:\n\n1. Auto-generates __init__ (no more self.x = x boilerplate)\n2. Auto-generates __repr__ (readable string representation)\n3. Auto-generates __eq__ (value comparison instead of identity)\n4. Enforces type hints, making code clearer\n5. Supports frozen=True for immutable objects\n\nA traditional class takes 15 lines; a dataclass takes just 5.',
      frameworkTip: 'Mentioning dataclass in a Google interview shows you know modern Python. Remember: dataclass is a Python 3.7+ feature. It\'s not meant to replace all classes — just classes that primarily hold data.',
    },
    {
      id: 5,
      name: '__repr__ vs __str__',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'Two String Representations of Objects',
        narrative: 'An interviewer asks: "What is the difference between __repr__ and __str__ in Python? When should you use which?" This is a classic Google OOP fundamentals question.',
      },
      question: 'What is the output of this code?\n\n```python\nclass User:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n    \n    def __repr__(self):\n        return f"User(\'{self.name}\', {self.age})"\n    \n    def __str__(self):\n        return f"{self.name} (age {self.age})"\n\nu = User("Alice", 25)\nprint(str(u))\nprint(repr(u))\nprint([u])\n```',
      options: [
        { id: 'A', text: 'Alice (age 25)\nUser(\'Alice\', 25)\nUser(\'Alice\', 25)', explanation: 'Close, but when a list prints its elements, it uses __repr__ and wraps them in square brackets.' },
        { id: 'B', text: 'Alice (age 25)\nUser(\'Alice\', 25)\n[User(\'Alice\', 25)]', explanation: 'Correct! str() calls __str__, repr() calls __repr__. Containers (list, dict) display their elements using __repr__, not __str__.' },
        { id: 'C', text: 'User(\'Alice\', 25)\nUser(\'Alice\', 25)\n[User(\'Alice\', 25)]', explanation: 'str(u) will prefer __str__ when defined. It only falls back to __repr__ when __str__ is not defined.' },
        { id: 'D', text: 'Alice (age 25)\nAlice (age 25)\n[Alice (age 25)]', explanation: 'repr() always calls __repr__, never __str__. And list elements are displayed using __repr__.' },
      ],
      correctAnswer: 'B',
      hints: ['str() calls __str__, repr() calls __repr__', 'If only __repr__ is defined (no __str__), str() falls back to __repr__', 'Lists use __repr__ when displaying their elements'],
      explanation: 'Key differences between __repr__ and __str__:\n\n__repr__: for developers, should be "precise," ideally eval()-able back to the object\n- Use: debugging, logging, container element display\n- Called by: repr(obj), typing obj in REPL\n\n__str__: for end users, should be "readable"\n- Use: print(), f-strings, str()\n- Called by: str(obj), print(obj)\n\nImportant: if you can only implement one, prioritize __repr__ because __str__ falls back to __repr__.',
      frameworkTip: 'Mentioning that "__repr__ should ideally be eval()-able back to the original object" in a Google interview shows you understand Python\'s design philosophy. Remember: containers (list, dict) display elements using __repr__.',
    },
  ],
}
