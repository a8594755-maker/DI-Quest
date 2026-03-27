// ── World 18 額外挑戰（Libraries & File I/O 面試經典題）──────────────────
// 這些挑戰會被 append 到 World 18 對應的 quest 中

export const w18Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-1: import & 標準函式庫 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '18-1': [
    {
      id: 3,
      name: 'Counter 詞頻統計',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '商品評論關鍵字分析',
        narrative: '你在 Amazon 的商品分析團隊，需要快速找出顧客評論中出現最頻繁的關鍵字，以了解使用者最常抱怨或稱讚的面向。',
      },
      question: '寫一個函式 top_keywords(reviews, n)，接收一個評論字串 list 和數字 n，回傳出現次數最多的前 n 個單字及其次數。單字全部轉小寫，忽略大小寫差異。\n\n範例：\n```python\nreviews = ["Great battery life", "Battery is amazing", "great screen"]\ntop_keywords(reviews, 2)\n# → [("battery", 2), ("great", 2)]\n```',
      starterCode: 'from collections import Counter\n\ndef top_keywords(reviews, n):\n    # 1. 把所有評論拆成單字，全部轉小寫\n    # 2. 用 Counter 統計詞頻\n    # 3. 回傳前 n 個最常出現的\n    pass',
      expectedQuery: 'from collections import Counter\n\ndef top_keywords(reviews, n):\n    words = []\n    for review in reviews:\n        words.extend(review.lower().split())\n    counter = Counter(words)\n    return counter.most_common(n)',
      hints: ['用 str.lower().split() 拆解每則評論', 'Counter 可以直接傳入 list 來統計', 'Counter.most_common(n) 回傳前 n 個最頻繁的 (元素, 次數) tuple'],
      explanation: 'collections.Counter 是 Python 最實用的計數工具：\n- Counter(iterable) 自動統計每個元素出現的次數\n- .most_common(n) 回傳前 n 個最頻繁的元素\n- 底層是 dict 的子類別，支援所有 dict 操作\n\n這在文本分析、日誌統計等場景中非常常用。',
      frameworkTip: 'Amazon 面試非常喜歡考 Counter，尤其是 Top K 頻率問題。記住 Counter.most_common(n) 的時間複雜度是 O(n log k)，比自己排序更高效。',
    },
    {
      id: 4,
      name: 'defaultdict 資料分組',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '訂單按類別分組',
        narrative: '你在處理電商平台的訂單資料，需要把訂單按商品類別分組。用普通 dict 要先檢查 key 是否存在，但 defaultdict 可以讓程式碼更簡潔。',
      },
      question: '寫一個函式 group_orders(orders)，接收一個訂單 list（每個訂單是 (category, product) tuple），回傳一個 dict，key 是類別，value 是該類別所有商品的 list。\n\n範例：\n```python\norders = [("電子", "手機"), ("服飾", "T恤"), ("電子", "耳機"), ("服飾", "外套")]\ngroup_orders(orders)\n# → {"電子": ["手機", "耳機"], "服飾": ["T恤", "外套"]}\n```',
      starterCode: 'from collections import defaultdict\n\ndef group_orders(orders):\n    # 用 defaultdict(list) 來自動初始化空 list\n    pass',
      expectedQuery: 'from collections import defaultdict\n\ndef group_orders(orders):\n    grouped = defaultdict(list)\n    for category, product in orders:\n        grouped[category].append(product)\n    return dict(grouped)',
      hints: ['defaultdict(list) 讓每個新 key 自動初始化為空 list', '直接 grouped[key].append(value)，不需要先檢查 key 是否存在', '最後用 dict() 轉回普通 dict'],
      explanation: 'defaultdict 的核心價值是省去「先檢查 key 是否存在」的步驟：\n\n普通 dict 寫法：\nif key not in d:\n    d[key] = []\nd[key].append(value)\n\ndefaultdict 寫法：\nd[key].append(value)  # 自動初始化\n\n常見的 factory function：list, int, set, lambda: default_value',
      frameworkTip: 'Amazon 面試中分組問題幾乎必出。用 defaultdict 比 dict.setdefault() 更 Pythonic，也比手動初始化更簡潔。面試時主動提到 defaultdict 會加分。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-2: pip & 第三方套件 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '18-2': [
    {
      id: 3,
      name: '虛擬環境管理',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: 'venv vs conda 選擇',
        narrative: '你加入一個數據分析團隊，前任工程師離職前沒留文件。你發現專案裡同時有 environment.yml 和 requirements.txt，需要釐清該用哪個工具管理環境。',
      },
      question: '關於 Python 虛擬環境，以下哪個說法是正確的？',
      options: [
        { id: 'A', text: 'venv 可以管理不同版本的 Python 直譯器，conda 只能管理套件', explanation: '正好相反！venv 只能用當前 Python 版本建立環境，conda 可以指定不同 Python 版本。' },
        { id: 'B', text: 'conda 可以同時管理 Python 版本和非 Python 的系統依賴（如 CUDA、MKL），venv 只管理 Python 套件', explanation: '正確！conda 是跨語言的套件管理器，能安裝 C/C++ library、CUDA toolkit 等；venv 是 Python 內建的，只管理 Python 套件。' },
        { id: 'C', text: 'venv 和 conda 功能完全相同，選哪個都一樣', explanation: 'venv 是輕量級的 Python 內建工具，conda 是完整的套件和環境管理系統，功能差異很大。' },
        { id: 'D', text: '正式專案中不應該使用虛擬環境，直接安裝在系統 Python 更穩定', explanation: '不使用虛擬環境會導致不同專案間的套件版本衝突，這是非常不好的實踐。' },
      ],
      correctAnswer: 'B',
      hints: ['想想哪個工具能處理非 Python 的依賴', 'venv 是 Python 標準函式庫的一部分', 'conda 來自 Anaconda 生態系'],
      explanation: 'venv vs conda 的核心差異：\n\nvenv（Python 內建）：\n- 輕量、快速、不需額外安裝\n- 只管理 Python 套件\n- 適合純 Python 專案\n\nconda（Anaconda/Miniconda）：\n- 可管理 Python 版本 + 非 Python 依賴\n- 適合數據科學（需要 CUDA、MKL 等）\n- 有自己的套件倉庫 conda-forge',
      frameworkTip: '實務中的選擇原則：Web 開發用 venv + pip，數據科學用 conda。面試時展示你知道兩者差異，說明你有實際專案經驗。',
    },
    {
      id: 4,
      name: 'requirements.txt 最佳實踐',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: '套件版本鎖定的重要性',
        narrative: '你的團隊部署了一個 Flask API 到正式環境，但發現 requirements.txt 裡寫的是 flask>=2.0。某天 Flask 3.0 發佈了一個 breaking change，導致正式環境爆掉。你要釐清正確的版本管理方式。',
      },
      question: '以下哪種 requirements.txt 的版本指定方式對正式環境（production）來說最安全？',
      options: [
        { id: 'A', text: 'flask\nrequests\npandas', explanation: '不指定版本等於「裝最新版」，每次部署可能裝到不同版本，非常危險。' },
        { id: 'B', text: 'flask>=2.0\nrequests>=2.28\npandas>=1.5', explanation: '只設下限，新的 major version 可能有 breaking change，正式環境不夠安全。' },
        { id: 'C', text: 'flask==3.0.2\nrequests==2.31.0\npandas==2.1.4', explanation: '正確！用 == 鎖定精確版本（pinning），確保每次部署都安裝完全相同的版本。搭配 pip freeze > requirements.txt 生成。' },
        { id: 'D', text: 'flask~=3.0\nrequests~=2.31\npandas~=2.1', explanation: '~= 允許 patch 版本更新（如 3.0.x），在開發環境還行，但正式環境仍有風險。' },
      ],
      correctAnswer: 'C',
      hints: ['正式環境最重要的是「可重現性」', 'pip freeze 會列出所有已安裝套件的精確版本', '== 是最嚴格的版本指定方式'],
      explanation: '版本指定策略：\n- 開發階段：用 ~=（相容版本）或 >=,<（範圍）保持靈活\n- 正式部署：用 == 鎖定精確版本\n- 生成方式：pip freeze > requirements.txt\n\n進階工具：pip-compile（pip-tools）可以自動解析依賴並鎖定版本，類似 npm 的 package-lock.json。',
      frameworkTip: '面試時提到 pip freeze 搭配精確版本鎖定，展示你有正式環境部署經驗。進一步提到 pip-tools 或 Poetry 會讓面試官印象深刻。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-3: 檔案讀寫 txt/csv — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '18-3': [
    {
      id: 4,
      name: '大型 CSV 逐行處理',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '處理 10GB 的交易記錄',
        narrative: '你在 Amazon 的數據團隊，需要處理一個 10GB 的交易記錄 CSV 檔案。直接用 pandas.read_csv() 會把整個檔案載入記憶體，導致 MemoryError。你需要用記憶體效率更高的方式處理。',
      },
      question: '寫一個函式 sum_column(filepath, column_name)，用逐行讀取的方式計算 CSV 中指定欄位的總和，不將整個檔案載入記憶體。\n\n假設 CSV 第一行是標題列，指定欄位的值都是數字。\n\n範例 CSV 內容：\n```\norder_id,amount,category\n1,250.5,電子\n2,89.9,服飾\n3,1200.0,電子\n```\nsum_column("orders.csv", "amount") → 1540.4',
      starterCode: 'import csv\n\ndef sum_column(filepath, column_name):\n    # 用 csv.DictReader 逐行讀取\n    # 不要一次載入整個檔案\n    pass',
      expectedQuery: 'import csv\n\ndef sum_column(filepath, column_name):\n    total = 0\n    with open(filepath, "r", encoding="utf-8") as f:\n        reader = csv.DictReader(f)\n        for row in reader:\n            total += float(row[column_name])\n    return total',
      hints: ['csv.DictReader 會自動用第一行作為 key', 'for row in reader 是逐行讀取，記憶體中同一時間只有一行', '記得把字串轉成 float'],
      explanation: '處理大檔案的核心原則是「逐行處理」而非「全部載入」：\n\n記憶體爆炸寫法：\ndf = pd.read_csv("big.csv")  # 10GB 全載入\n\n記憶體友善寫法：\nwith open("big.csv") as f:\n    reader = csv.DictReader(f)\n    for row in reader:  # 一次只處理一行\n        ...\n\npandas 也有 chunksize 參數可以分批讀取：\nfor chunk in pd.read_csv("big.csv", chunksize=10000):\n    ...',
      frameworkTip: 'Amazon 面試非常看重記憶體效率。當面試官說「檔案很大」，立刻想到逐行處理或 generator。提到 csv.DictReader 和 pandas chunksize 兩種方案會展示你的全面性。',
    },
    {
      id: 5,
      name: '編碼處理 encoding',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '亂碼危機',
        narrative: '你收到一份來自日本供應商的 CSV 檔案，用 Python 讀取時出現 UnicodeDecodeError。你需要理解檔案編碼的概念來解決這個問題。',
      },
      question: '讀取一個可能是 Shift-JIS 編碼的 CSV 檔案，以下哪個方法最穩健？',
      options: [
        { id: 'A', text: 'open("data.csv", "r") 不指定 encoding', explanation: '不指定 encoding 會使用系統預設編碼（通常是 UTF-8 或系統 locale），遇到非 UTF-8 編碼的檔案會報錯。' },
        { id: 'B', text: 'open("data.csv", "r", encoding="utf-8", errors="ignore")', explanation: 'errors="ignore" 會靜默地丟掉無法解碼的字元，導致資料遺失，這在資料處理中很危險。' },
        { id: 'C', text: '先用 chardet 或 charset-normalizer 偵測編碼，再用偵測到的編碼開啟檔案', explanation: '正確！先偵測再讀取是最穩健的做法。chardet.detect() 會回傳偵測到的編碼和信心度，讓你確認後再用正確的編碼讀取。' },
        { id: 'D', text: '用 binary mode open("data.csv", "rb") 讀取，避免所有編碼問題', explanation: 'binary mode 讀到的是 bytes 不是 str，還是需要 decode 才能處理文字內容。' },
      ],
      correctAnswer: 'C',
      hints: ['Python 3 的 str 是 Unicode，讀取時需要正確的 encoding 才能解碼', 'chardet 是一個可以自動偵測檔案編碼的套件', '用錯誤的編碼讀取會得到亂碼或報錯'],
      explanation: '處理未知編碼檔案的最佳實踐：\n\n```python\nimport chardet\n\n# 1. 偵測編碼\nwith open("data.csv", "rb") as f:\n    result = chardet.detect(f.read())\n    encoding = result["encoding"]  # 如 "Shift_JIS"\n\n# 2. 用正確的編碼讀取\nwith open("data.csv", "r", encoding=encoding) as f:\n    content = f.read()\n```\n\n常見編碼：UTF-8（萬用）、Big5（繁體中文）、Shift-JIS（日文）、GBK（簡體中文）。',
      frameworkTip: '面試中遇到檔案處理問題，主動提到 encoding 處理展示你有實務經驗。特別是處理多語言資料時，編碼問題是最常見的 bug 來源之一。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-4: JSON 讀寫 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '18-4': [
    {
      id: 4,
      name: '巢狀 JSON 扁平化',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'HackerRank',
      scenario: {
        title: '將複雜 API 回應轉成表格',
        narrative: '你從第三方 API 取得了深度巢狀的 JSON 資料，需要把它「攤平」成一層 dict，才能轉成 CSV 或存進資料庫的扁平化表格。',
      },
      question: '寫一個函式 flatten_dict(d, parent_key="", sep=".")，把巢狀的 dict 攤平成一層，用 "." 連接 key。\n\n範例：\n```python\ndata = {\n    "user": {\n        "name": "Alice",\n        "address": {\n            "city": "Taipei",\n            "zip": "100"\n        }\n    },\n    "active": True\n}\nflatten_dict(data)\n# → {"user.name": "Alice", "user.address.city": "Taipei", "user.address.zip": "100", "active": True}\n```',
      starterCode: 'def flatten_dict(d, parent_key="", sep="."):\n    # 用遞迴處理巢狀結構\n    # 如果值是 dict，繼續往下攤平\n    # 否則直接加入結果\n    pass',
      expectedQuery: 'def flatten_dict(d, parent_key="", sep="."):\n    items = []\n    for k, v in d.items():\n        new_key = f"{parent_key}{sep}{k}" if parent_key else k\n        if isinstance(v, dict):\n            items.extend(flatten_dict(v, new_key, sep).items())\n        else:\n            items.append((new_key, v))\n    return dict(items)',
      hints: ['這是一個遞迴問題：遇到 dict 值就繼續攤平', '用 parent_key 追蹤完整路徑', 'isinstance(v, dict) 判斷是否需要繼續遞迴'],
      explanation: '攤平巢狀 dict 是資料處理中極常見的操作：\n\n核心邏輯：\n1. 遍歷每個 key-value\n2. 如果 value 是 dict → 遞迴攤平，key 用 sep 連接\n3. 如果 value 不是 dict → 直接加入結果\n\n實務中也可以用 pandas.json_normalize() 來處理，但面試通常要求你手寫遞迴版本。',
      frameworkTip: 'HackerRank 和面試中 flatten dict 是高頻題。重點是展示遞迴思維和 base case 的處理。進階：考慮 list 中巢狀 dict 的情況。',
    },
    {
      id: 5,
      name: 'API 回應解析與錯誤處理',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'HackerRank',
      scenario: {
        title: '安全地從 API 取得資料',
        narrative: '你在串接一個天氣 API，但 API 回應的 JSON 結構不穩定——有時缺少某些欄位，有時 key 名稱不一致。你需要一個安全的解析函式。',
      },
      question: '寫一個函式 safe_get(data, keys, default=None)，安全地從巢狀 dict 中取值。keys 是一個 key 路徑的 list，任何一層 key 不存在時回傳 default。\n\n範例：\n```python\nresponse = {"data": {"weather": {"temp": 25.5}}}\n\nsafe_get(response, ["data", "weather", "temp"])  # → 25.5\nsafe_get(response, ["data", "wind", "speed"])    # → None\nsafe_get(response, ["data", "wind", "speed"], 0) # → 0\n```',
      starterCode: 'def safe_get(data, keys, default=None):\n    # 逐層往下找\n    # 任何一層出錯就回傳 default\n    pass',
      expectedQuery: 'def safe_get(data, keys, default=None):\n    current = data\n    for key in keys:\n        if isinstance(current, dict) and key in current:\n            current = current[key]\n        else:\n            return default\n    return current',
      hints: ['逐層遍歷 keys list，每次往下一層', '用 isinstance(current, dict) 確保當前層是 dict', '任何一層找不到 key 就直接 return default'],
      explanation: '安全取值是處理 API 回應的必備技巧：\n\n危險寫法（可能 KeyError）：\ntemp = response["data"]["weather"]["temp"]\n\n安全寫法：\ntemp = safe_get(response, ["data", "weather", "temp"], 0)\n\nPython 3.8+ 也可以用 walrus operator 搭配 dict.get()：\nif (d := response.get("data")) and (w := d.get("weather")):\n    temp = w.get("temp", 0)',
      frameworkTip: '面試時展示你考慮到 API 回應不穩定的情況，展示防禦性程式設計思維。提到 try/except vs 主動檢查的取捨，會讓面試官知道你有實務經驗。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 18-5: OOP 基礎 class — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '18-5': [
    {
      id: 4,
      name: 'dataclass vs 傳統 class',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '現代 Python 的資料類別',
        narrative: '你在 Google 的 code review 中被要求把傳統的 class 改寫成 dataclass。Senior engineer 說「Python 3.7 以後，純資料類別應該用 @dataclass 裝飾器」。你需要理解為什麼。',
      },
      question: '把以下傳統 class 改寫成 dataclass。dataclass 要自動產生 __init__、__repr__、__eq__，並加上一個自訂的 method。\n\n傳統寫法：\n```python\nclass Product:\n    def __init__(self, name, price, quantity=0):\n        self.name = name\n        self.price = price\n        self.quantity = quantity\n    \n    def total_value(self):\n        return self.price * self.quantity\n```\n\n請用 @dataclass 改寫，並加上 type hints。',
      starterCode: 'from dataclasses import dataclass\n\n# 用 @dataclass 改寫 Product class\n# 保留 total_value method\npass',
      expectedQuery: 'from dataclasses import dataclass\n\n@dataclass\nclass Product:\n    name: str\n    price: float\n    quantity: int = 0\n\n    def total_value(self) -> float:\n        return self.price * self.quantity',
      hints: ['@dataclass 裝飾器會自動生成 __init__、__repr__、__eq__', '欄位定義用 name: type = default_value 格式', '自訂 method 照常寫在 class 裡面'],
      explanation: '@dataclass 的優勢：\n\n1. 自動生成 __init__（不需手寫 self.x = x）\n2. 自動生成 __repr__（好看的字串表示）\n3. 自動生成 __eq__（值比較而非 identity 比較）\n4. 強制 type hints，程式碼更清楚\n5. 支援 frozen=True 建立不可變物件\n\n傳統 class 要手寫 15 行的程式碼，dataclass 只需 5 行。',
      frameworkTip: 'Google 面試中提到 dataclass 展示你熟悉現代 Python。記住 dataclass 是 Python 3.7+ 的功能，它不是要取代所有 class，而是取代「主要用來裝資料」的 class。',
    },
    {
      id: 5,
      name: '__repr__ vs __str__',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '物件的兩種字串表示',
        narrative: '面試官問你：「Python 的 __repr__ 和 __str__ 有什麼差別？什麼時候用哪個？」這是 Google 考 OOP 基礎的經典題。',
      },
      question: '以下程式碼的輸出是什麼？\n\n```python\nclass User:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n    \n    def __repr__(self):\n        return f"User(\'{self.name}\', {self.age})"\n    \n    def __str__(self):\n        return f"{self.name} ({self.age}歲)"\n\nu = User("Alice", 25)\nprint(str(u))\nprint(repr(u))\nprint([u])\n```',
      options: [
        { id: 'A', text: 'Alice (25歲)\nUser(\'Alice\', 25)\nUser(\'Alice\', 25)', explanation: '接近正確，但 list 印出元素時用的是 __repr__，外面會加上 list 的方括號。' },
        { id: 'B', text: 'Alice (25歲)\nUser(\'Alice\', 25)\n[User(\'Alice\', 25)]', explanation: '正確！str() 呼叫 __str__，repr() 呼叫 __repr__。容器（list, dict）印出元素時使用 __repr__ 而非 __str__。' },
        { id: 'C', text: 'User(\'Alice\', 25)\nUser(\'Alice\', 25)\n[User(\'Alice\', 25)]', explanation: 'str(u) 會優先呼叫 __str__，只有在沒有定義 __str__ 時才 fallback 到 __repr__。' },
        { id: 'D', text: 'Alice (25歲)\nAlice (25歲)\n[Alice (25歲)]', explanation: 'repr() 一定呼叫 __repr__，不會去找 __str__。而且 list 中的元素用 __repr__ 顯示。' },
      ],
      correctAnswer: 'B',
      hints: ['str() 呼叫 __str__，repr() 呼叫 __repr__', '如果只定義了 __repr__ 沒有 __str__，str() 會 fallback 到 __repr__', 'list 印出元素時用 __repr__'],
      explanation: '__repr__ vs __str__ 的關鍵差異：\n\n__repr__：給開發者看的，應該要「精確」，最好能 eval() 回來\n- 用途：debug、日誌、容器元素顯示\n- 呼叫方式：repr(obj)、在 REPL 直接打 obj\n\n__str__：給使用者看的，應該要「易讀」\n- 用途：print()、f-string、str()\n- 呼叫方式：str(obj)、print(obj)\n\n重要：如果只能實作一個，優先實作 __repr__，因為 __str__ 會 fallback 到 __repr__。',
      frameworkTip: 'Google 面試中提到「__repr__ 應該要能 eval() 回原物件」這個設計原則，展示你理解 Python 的設計哲學。記住：容器（list, dict）顯示元素時用 __repr__。',
    },
  ],
}
