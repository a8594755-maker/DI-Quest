// ── World 20 額外挑戰（APIs & Web Requests 面試題）──────────────────
// 這些挑戰會被 append 到 World 20 對應的 quest 中

export const w20Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-1: JSON & API concepts — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '20-1': [
    {
      id: 3,
      name: 'RESTful 設計原則',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'RESTful API 動詞語義',
        narrative: '你在 Amazon 面試中被問到 API 設計。面試官給了你一個電商平台的使用者訂單系統，要你選出正確的 HTTP method 對應。理解 REST 動詞語義是後端與資料工程面試的基礎。',
      },
      question: '一個電商平台的訂單 API，以下哪組 HTTP method 對應是正確的？\n\n1. 查詢所有訂單\n2. 建立新訂單\n3. 更新訂單地址\n4. 取消（刪除）訂單',
      options: [
        { id: 'A', text: '1.GET /orders  2.POST /orders  3.PUT /orders/{id}  4.DELETE /orders/{id}', explanation: '正確！GET 用於讀取、POST 用於建立、PUT 用於完整更新、DELETE 用於刪除。這是 RESTful API 的標準設計。' },
        { id: 'B', text: '1.POST /getOrders  2.POST /createOrder  3.POST /updateOrder  4.POST /deleteOrder', explanation: '這是 RPC 風格，不是 RESTful。RESTful 用 HTTP method 區分操作，不把動作放在 URL 中。' },
        { id: 'C', text: '1.GET /orders  2.PUT /orders  3.PATCH /orders/{id}  4.GET /orders/{id}/delete', explanation: 'PUT 用於更新而非建立，用 GET 做刪除操作違反 HTTP 語義（GET 應該是冪等且無副作用的）。' },
        { id: 'D', text: '1.GET /orders  2.POST /orders  3.POST /orders/{id}  4.PUT /orders/{id}/cancel', explanation: '用 POST 做更新不夠精確，PUT 不應該用於非冪等的取消操作。' },
      ],
      correctAnswer: 'A',
      hints: ['RESTful 設計：URL 代表資源（名詞），HTTP method 代表操作（動詞）', 'GET=讀取, POST=建立, PUT=完整更新, PATCH=部分更新, DELETE=刪除', 'GET 和 PUT 是冪等的（多次呼叫結果一樣），POST 不是'],
      explanation: 'RESTful API 設計四大原則：\n1. URL 用名詞代表資源：/orders, /users\n2. HTTP method 代表操作：GET（讀取）, POST（建立）, PUT（完整更新）, PATCH（部分更新）, DELETE（刪除）\n3. GET 和 DELETE 是冪等的\n4. POST 不是冪等的（每次呼叫可能建立新資源）\n\n面試常見追問：PUT vs PATCH？PUT 替換整個資源，PATCH 只更新部分欄位。',
      frameworkTip: '面試時被問到 API 設計，先說「我會用 RESTful 風格」，然後快速列出 GET/POST/PUT/DELETE 對應的 CRUD 操作。接著提到冪等性（idempotency）會讓面試官對你刮目相看。',
    },
    {
      id: 4,
      name: 'HTTP 狀態碼語義',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'API 回應狀態碼',
        narrative: '你在開發一個 API 串接腳本，呼叫合作夥伴的訂單 API 時收到了不同的 HTTP 狀態碼。你需要根據狀態碼決定如何處理回應——是重試、修正請求、還是回報問題。',
      },
      question: '你的腳本呼叫 API 時遇到以下狀態碼，哪一個配對的處理策略是正確的？\n\n- 200：請求成功\n- 401：認證失敗\n- 429：請求太頻繁\n- 503：服務暫時不可用',
      options: [
        { id: 'A', text: '200→處理資料, 401→重試, 429→等待後重試, 503→等待後重試', explanation: '401 是認證問題，重試不會解決。需要檢查 API key 或 token 是否正確。' },
        { id: 'B', text: '200→處理資料, 401→檢查 token, 429→立刻重試, 503→等待後重試', explanation: '429 表示 rate limit，立刻重試只會再次被限制。應該等待（通常讀取 Retry-After header）再重試。' },
        { id: 'C', text: '200→處理資料, 401→檢查 token, 429→等待後重試, 503→等待後重試', explanation: '正確！200 系列是成功，401 是認證問題需要修正 credentials，429 是 rate limit 需要退避重試，503 是暫時性錯誤可以重試。' },
        { id: 'D', text: '200→處理資料, 401→檢查 token, 429→等待後重試, 503→放棄', explanation: '503 是「暫時」不可用，通常等待後重試即可，不需要直接放棄。' },
      ],
      correctAnswer: 'C',
      hints: ['2xx = 成功, 4xx = 客戶端錯誤, 5xx = 伺服器錯誤', '401 vs 403：401 是「未認證」，403 是「已認證但無權限」', '429 通常伴隨 Retry-After header 告訴你等多久'],
      explanation: 'HTTP 狀態碼分類：\n- 2xx 成功：200 OK, 201 Created, 204 No Content\n- 4xx 客戶端錯誤：400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests\n- 5xx 伺服器錯誤：500 Internal Error, 502 Bad Gateway, 503 Service Unavailable\n\n處理策略：4xx 通常不重試（除了 429），5xx 通常可以重試。',
      frameworkTip: '面試時被問到 API 錯誤處理，先分類（4xx vs 5xx），再說明策略：4xx 修正請求，5xx 重試。特別提到 429 的 exponential backoff 策略，展示你有生產環境經驗。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-2: requests GET — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '20-2': [
    {
      id: 4,
      name: 'API 分頁自動爬取',
      type: 'code',
      difficulty: 'hard',
      sourceTag: '實戰',
      scenario: {
        title: '自動爬取所有分頁資料',
        narrative: '你在一家電商公司負責每天從供應商 API 拉取所有商品資料。API 每頁只回傳 100 筆，且使用 next_page token 機制。你需要寫一個自動爬取所有頁面的腳本。',
      },
      question: '完成 fetch_all_products() 函式，使用 while 迴圈搭配 next_page token 自動爬取所有分頁。\n\nAPI 回傳格式：\n```json\n{\n  "data": [{"id": 1, "name": "商品A"}, ...],\n  "next_page": "token_abc123"  // null 表示最後一頁\n}\n```\n\n範例：\nfetch_all_products("https://api.example.com/products")\n→ 回傳所有商品的 list',
      starterCode: 'import requests\n\ndef fetch_all_products(base_url):\n    all_products = []\n    next_page = None\n    \n    while True:\n        # 1. 組合 URL 參數（如果有 next_page token）\n        # 2. 發送 GET 請求\n        # 3. 把 data 加入 all_products\n        # 4. 檢查是否還有下一頁\n        pass\n    \n    return all_products',
      expectedQuery: 'import requests\n\ndef fetch_all_products(base_url):\n    all_products = []\n    next_page = None\n    \n    while True:\n        params = {}\n        if next_page:\n            params["page_token"] = next_page\n        \n        response = requests.get(base_url, params=params)\n        response.raise_for_status()\n        data = response.json()\n        \n        all_products.extend(data["data"])\n        \n        next_page = data.get("next_page")\n        if not next_page:\n            break\n    \n    return all_products',
      testCases: [
        { input: 'pages = [{"data": [1, 2], "next_page": "t1"}, {"data": [3], "next_page": None}]\ncall_idx = {"i": 0}\nclass FakeResp:\n    def raise_for_status(self): pass\n    def __init__(self, d): self.d = d\n    def json(self): return self.d\nimport types\ndef fake_get(url, params=None):\n    r = FakeResp(pages[call_idx["i"]])\n    call_idx["i"] += 1\n    return r\nimport requests\nrequests.get = fake_get\nfetch_all_products("http://test")' },
      ],
      hints: ['用 params dict 傳遞 page_token', '用 extend() 而非 append() 來合併 list', 'data.get("next_page") 在 key 不存在時回傳 None'],
      explanation: '分頁爬取的標準模式：\n1. while True 無限迴圈\n2. 每次帶上 next_page token（第一頁不帶）\n3. 把當頁資料 extend 到結果 list\n4. 檢查 next_page 是否為 None/null，是就 break\n\n這個 pattern 在實務中非常常見，幾乎所有大型 API（GitHub, Stripe, Shopify）都用類似的分頁機制。',
      frameworkTip: '面試時提到 API 分頁，說明你知道兩種常見模式：offset/limit（適合小資料集）和 cursor/token（適合大資料集，避免跳頁問題）。這展示你有處理真實 API 的經驗。',
    },
    {
      id: 5,
      name: 'Rate Limit 處理',
      type: 'code',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: '優雅處理 API 限流',
        narrative: '你在批次呼叫合作夥伴的 API 時頻繁遇到 429 Too Many Requests 錯誤。你的主管要求你加上 rate limit 處理邏輯，讓腳本能自動等待並重試。',
      },
      question: '完成 safe_request() 函式，當收到 429 狀態碼時，讀取 Retry-After header 的秒數並等待後重試。最多重試 3 次。\n\n範例：\nsafe_request("https://api.example.com/data")\n→ 自動處理 429，成功時回傳 response.json()',
      starterCode: 'import requests\nimport time\n\ndef safe_request(url, max_retries=3):\n    for attempt in range(max_retries):\n        response = requests.get(url)\n        \n        if response.status_code == 200:\n            return response.json()\n        elif response.status_code == 429:\n            # 讀取 Retry-After header，預設等 1 秒\n            # 等待後繼續迴圈重試\n            pass\n        else:\n            response.raise_for_status()\n    \n    raise Exception(f"仍然被限流，已重試 {max_retries} 次")',
      expectedQuery: 'import requests\nimport time\n\ndef safe_request(url, max_retries=3):\n    for attempt in range(max_retries):\n        response = requests.get(url)\n        \n        if response.status_code == 200:\n            return response.json()\n        elif response.status_code == 429:\n            wait_time = int(response.headers.get("Retry-After", 1))\n            print(f"Rate limited. Waiting {wait_time}s (attempt {attempt + 1}/{max_retries})")\n            time.sleep(wait_time)\n        else:\n            response.raise_for_status()\n    \n    raise Exception(f"仍然被限流，已重試 {max_retries} 次")',
      testCases: [
        { input: 'class FakeResp:\n    def __init__(self, code, data=None, headers=None):\n        self.status_code = code\n        self._data = data\n        self.headers = headers or {}\n    def json(self): return self._data\n    def raise_for_status(self): pass\nimport requests, time\nrequests.get = lambda url: FakeResp(200, {"result": "ok"})\ntime.sleep = lambda s: None\nsafe_request("http://test")' },
      ],
      hints: ['response.headers.get("Retry-After", 1) 讀取等待秒數', 'time.sleep(wait_time) 暫停執行', '429 不需要 raise_for_status，等待後重試即可'],
      explanation: 'Rate limit 處理模式：\n1. 檢查 status_code 是否為 429\n2. 讀取 Retry-After header（API 告訴你要等多久）\n3. time.sleep() 等待指定秒數\n4. 自動重試，設定最大重試次數\n\n進階做法：用 exponential backoff（指數退避），每次等待時間加倍。',
      frameworkTip: '面試時提到 rate limiting，除了說明基本的重試機制，提到 Retry-After header 和 exponential backoff 會展示你有生產環境的 API 串接經驗。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-3: POST & authentication — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '20-3': [
    {
      id: 3,
      name: 'OAuth2 流程理解',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'OAuth2 認證流程',
        narrative: '你在 Uber 面試中被問到如何設計一個第三方登入系統。面試官想了解你對 OAuth2 授權流程的掌握程度——這是現代 API 認證的業界標準。',
      },
      question: '一個 Web 應用程式要讓使用者用 Google 帳號登入，使用 OAuth2 Authorization Code Flow。以下哪個流程順序是正確的？',
      options: [
        { id: 'A', text: '使用者點登入 → 前端直接拿 access_token → 呼叫 Google API', explanation: '這是 Implicit Flow（已不推薦），不是 Authorization Code Flow。Authorization Code Flow 多了一步用 code 換 token。' },
        { id: 'B', text: '使用者點登入 → 導向 Google 授權頁 → 使用者同意 → Google 回傳 authorization code → 後端用 code + client_secret 換 access_token → 用 token 呼叫 API', explanation: '正確！Authorization Code Flow 的完整步驟。code 透過前端傳遞（可被攔截），但 access_token 只在後端用 client_secret 換取，確保安全。' },
        { id: 'C', text: '後端直接用 client_id + client_secret 取得 access_token → 呼叫 Google API', explanation: '這是 Client Credentials Flow，用於 server-to-server 通訊，不涉及使用者授權。' },
        { id: 'D', text: '使用者輸入 Google 帳密到你的 App → 你用帳密換 token → 呼叫 API', explanation: '這是 Resource Owner Password Flow（已廢棄），讓第三方 App 看到使用者密碼是嚴重的安全風險。' },
      ],
      correctAnswer: 'B',
      hints: ['Authorization Code Flow 有兩步交換：先拿 code，再用 code 換 token', 'code 是短期的、一次性的；access_token 才是用來呼叫 API 的', 'client_secret 只存在後端，絕不暴露給前端'],
      explanation: 'OAuth2 Authorization Code Flow：\n1. 前端導向授權伺服器（如 Google）\n2. 使用者同意授權\n3. Google 回傳 authorization code 到你的 redirect_uri\n4. 後端用 code + client_id + client_secret 向 Google 換 access_token\n5. 用 access_token 呼叫 API\n\n為什麼要多一步？因為 code 透過瀏覽器傳遞（可能被攔截），但 token 只在後端安全地交換。',
      frameworkTip: '面試時被問到 OAuth2，先畫出 Authorization Code Flow 的流程圖，再解釋為什麼要有「code 換 token」這一步（安全性）。提到 PKCE 擴展展示你知道最新安全實踐。',
    },
    {
      id: 4,
      name: 'Bearer Token 使用模式',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'API Token 認證實作',
        narrative: '你在做一個內部工具，需要呼叫公司的 REST API。API 要求在 Header 中帶上 Bearer Token。你需要封裝一個帶認證的 API client 類別，方便團隊其他人使用。',
      },
      question: '完成 ApiClient 類別，讓它能自動在每個請求中帶上 Bearer Token。要支援 GET 和 POST 方法。\n\n範例：\n```python\nclient = ApiClient("https://api.company.com", "my_secret_token")\nusers = client.get("/users")\nclient.post("/users", {"name": "Alice"})\n```',
      starterCode: 'import requests\n\nclass ApiClient:\n    def __init__(self, base_url, token):\n        self.base_url = base_url\n        # 設定帶有 Bearer Token 的 headers\n        self.headers = {}\n    \n    def get(self, endpoint, params=None):\n        # 發送帶認證的 GET 請求\n        pass\n    \n    def post(self, endpoint, data=None):\n        # 發送帶認證的 POST 請求\n        pass',
      expectedQuery: 'import requests\n\nclass ApiClient:\n    def __init__(self, base_url, token):\n        self.base_url = base_url\n        self.headers = {\n            "Authorization": f"Bearer {token}",\n            "Content-Type": "application/json"\n        }\n    \n    def get(self, endpoint, params=None):\n        response = requests.get(\n            f"{self.base_url}{endpoint}",\n            headers=self.headers,\n            params=params\n        )\n        response.raise_for_status()\n        return response.json()\n    \n    def post(self, endpoint, data=None):\n        response = requests.post(\n            f"{self.base_url}{endpoint}",\n            headers=self.headers,\n            json=data\n        )\n        response.raise_for_status()\n        return response.json()',
      testCases: [
        { input: 'client = ApiClient("https://api.example.com", "tok123")\nclient.headers["Authorization"]' },
        { input: 'client = ApiClient("https://api.test.com", "abc")\nclient.base_url + "/users"' },
      ],
      hints: ['Authorization header 格式："Bearer your_token_here"', '用 f-string 組合 base_url + endpoint', 'POST 用 json=data 自動序列化 dict 為 JSON'],
      explanation: 'Bearer Token 認證模式：\n- 在 HTTP Header 加上 Authorization: Bearer <token>\n- 這是 OAuth2 最常見的 token 使用方式\n- 封裝成 class 的好處：統一管理認證、base_url、錯誤處理\n\n進階做法：用 requests.Session() 可以持久化 headers，減少重複設定。',
      frameworkTip: '面試時展示你會封裝 API client class，而不是到處重複寫 headers，說明你懂得 DRY 原則和程式碼復用。提到 requests.Session() 的效能優勢（連線重用）更加分。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-4: batch processing scripts — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '20-4': [
    {
      id: 4,
      name: 'async/await 基礎概念',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Python 非同步程式設計',
        narrative: '你在 Meta 面試中被問到 Python 的非同步程式設計。面試官想知道你是否理解 async/await 的核心概念——這對處理大量 API 請求的批次腳本至關重要。Python 3.11+ 大幅改善了 asyncio 的效能和錯誤訊息。',
      },
      question: '關於 Python 的 async/await，以下哪個說法是正確的？',
      options: [
        { id: 'A', text: 'async 函式會自動在新的 thread 中執行，所以可以真正平行處理', explanation: 'asyncio 是單執行緒的！它用 event loop 在一個 thread 中切換任務，不是多執行緒。' },
        { id: 'B', text: 'await 會暫停當前 coroutine 的執行，讓 event loop 去處理其他任務，等 I/O 完成後再回來繼續', explanation: '正確！await 的本質是「把控制權交還給 event loop」。當一個 coroutine 在等待 I/O（如 API 回應），event loop 可以去執行其他 coroutine。這就是 concurrency（並發）而非 parallelism（平行）。' },
        { id: 'C', text: 'asyncio.gather() 會把多個任務分配到不同的 CPU 核心上執行', explanation: 'asyncio 是單執行緒的，不使用多核心。要用多核心需要 multiprocessing 模組。' },
        { id: 'D', text: '任何函式加上 async 關鍵字就會變快，因為它啟用了非同步 I/O', explanation: '加 async 只是讓函式變成 coroutine，不會自動變快。需要搭配 await 和非同步 I/O 操作才有效。CPU 密集型任務用 async 反而可能更慢。' },
      ],
      correctAnswer: 'B',
      hints: ['asyncio 是單執行緒的 cooperative multitasking', 'await 是 coroutine 的「讓出控制權」點', '適合 I/O 密集型任務（API 呼叫、檔案讀寫），不適合 CPU 密集型'],
      explanation: 'Python async/await 核心概念：\n- async def 定義 coroutine（協程）\n- await 暫停當前 coroutine，讓 event loop 處理其他任務\n- 單執行緒 + event loop = concurrency（不是 parallelism）\n- 適合場景：大量 API 呼叫、資料庫查詢等 I/O 等待\n\nPython 3.11+ 改善：更好的錯誤訊息、TaskGroup（取代 gather 的結構化並發）、效能提升約 10-60%。',
      frameworkTip: '面試時區分 concurrency vs parallelism 是關鍵：asyncio 是 concurrency（一個人同時處理多件事），multiprocessing 是 parallelism（多人各做一件事）。這個區別是 Meta 常考的概念題。',
    },
    {
      id: 5,
      name: 'asyncio.gather 並發請求',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: '並發 API 請求加速批次處理',
        narrative: '你的團隊每天需要從 50 個不同的 API endpoint 拉取資料。同步呼叫需要 5 分鐘，主管要求你用非同步方式加速。你需要用 asyncio.gather 來並發執行所有請求。',
      },
      question: '完成 fetch_all_endpoints() 函式，使用 asyncio + aiohttp 並發呼叫多個 API endpoint。\n\n範例：\n```python\nurls = [\n    "https://api.example.com/sales",\n    "https://api.example.com/users",\n    "https://api.example.com/products"\n]\nresults = asyncio.run(fetch_all_endpoints(urls))\n# → [sales_data, users_data, products_data]\n```',
      starterCode: 'import asyncio\nimport aiohttp\n\nasync def fetch_one(session, url):\n    # 用 aiohttp 發送單一 GET 請求\n    pass\n\nasync def fetch_all_endpoints(urls):\n    # 用 asyncio.gather 並發呼叫所有 URL\n    pass',
      expectedQuery: 'import asyncio\nimport aiohttp\n\nasync def fetch_one(session, url):\n    async with session.get(url) as response:\n        response.raise_for_status()\n        return await response.json()\n\nasync def fetch_all_endpoints(urls):\n    async with aiohttp.ClientSession() as session:\n        tasks = [fetch_one(session, url) for url in urls]\n        results = await asyncio.gather(*tasks)\n        return list(results)',
      testCases: [
        { input: 'import asyncio\nclass FakeResp:\n    def raise_for_status(self): pass\n    async def json(self): return {"ok": True}\n    async def __aenter__(self): return self\n    async def __aexit__(self, *a): pass\nclass FakeSession:\n    def get(self, url): return FakeResp()\n    async def __aenter__(self): return self\n    async def __aexit__(self, *a): pass\nimport aiohttp\naiohttp.ClientSession = FakeSession\nasyncio.run(fetch_all_endpoints(["http://a", "http://b"]))' },
      ],
      hints: ['aiohttp 用 async with session.get(url) as response 發送請求', '用 list comprehension 建立 task 列表', 'asyncio.gather(*tasks) 接受多個 coroutine 並發執行'],
      explanation: 'asyncio.gather 並發模式：\n1. 建立 aiohttp.ClientSession（共用連線池）\n2. 用 list comprehension 建立所有 coroutine task\n3. await asyncio.gather(*tasks) 並發執行\n4. 回傳結果的順序與輸入順序一致\n\n效能對比：同步 50 個請求（每個 1 秒）= 50 秒，asyncio.gather = 約 1 秒（所有請求同時進行）。',
      frameworkTip: '面試時提到並發請求，先解釋為什麼用 asyncio 而非 threading（GIL 限制下，I/O 密集型任務 asyncio 更輕量且易管理）。然後畫出 event loop 的運作方式，展示你真正理解底層機制。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-5: auto report generation — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '20-5': [
    {
      id: 3,
      name: 'Exponential Backoff 重試策略',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '指數退避重試裝飾器',
        narrative: '你在 Amazon 面試中被要求實作一個 retry decorator。在分散式系統中，API 可能因為暫時性錯誤而失敗。Exponential backoff 是業界標準的重試策略——每次重試等待時間加倍，避免同時大量重試壓垮伺服器。',
      },
      question: '寫一個 retry_with_backoff 裝飾器，功能：\n1. 最多重試 max_retries 次\n2. 每次重試等待時間加倍（1s, 2s, 4s, 8s...）\n3. 只在指定的例外類型時重試\n4. 超過重試次數後拋出最後一個例外\n\n範例：\n```python\n@retry_with_backoff(max_retries=3, exceptions=(ConnectionError, TimeoutError))\ndef call_api():\n    response = requests.get("https://api.example.com/data")\n    response.raise_for_status()\n    return response.json()\n```',
      starterCode: 'import time\nimport functools\n\ndef retry_with_backoff(max_retries=3, exceptions=(Exception,)):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            # 實作 exponential backoff 重試邏輯\n            pass\n        return wrapper\n    return decorator',
      expectedQuery: 'import time\nimport functools\n\ndef retry_with_backoff(max_retries=3, exceptions=(Exception,)):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            for attempt in range(max_retries):\n                try:\n                    return func(*args, **kwargs)\n                except exceptions as e:\n                    if attempt == max_retries - 1:\n                        raise\n                    wait_time = 2 ** attempt\n                    print(f"Attempt {attempt + 1} failed: {e}. Retrying in {wait_time}s...")\n                    time.sleep(wait_time)\n        return wrapper\n    return decorator',
      testCases: [
        { input: 'import time\ntime.sleep = lambda s: None\n@retry_with_backoff(max_retries=1)\ndef ok():\n    return 42\nok()' },
        { input: 'import time\ntime.sleep = lambda s: None\ncounter = {"n": 0}\n@retry_with_backoff(max_retries=3, exceptions=(ValueError,))\ndef flaky():\n    counter["n"] += 1\n    if counter["n"] < 3:\n        raise ValueError("fail")\n    return "done"\nflaky()' },
      ],
      hints: ['用三層巢狀函式：外層接參數、中層接函式、內層是 wrapper', 'wait_time = 2 ** attempt 產生 1, 2, 4, 8... 的等待時間', '最後一次重試失敗後用 raise（不帶參數）重新拋出原始例外'],
      explanation: 'Exponential backoff 重試模式：\n- 等待時間：2^0=1s, 2^1=2s, 2^2=4s, 2^3=8s...\n- 為什麼加倍？避免多個 client 同時重試（thundering herd problem）\n- functools.wraps 保留原函式的 __name__ 和 __doc__\n- raise 不帶參數：重新拋出當前捕獲的例外\n\n進階做法：加上 jitter（隨機延遲），如 wait_time = 2**attempt + random.uniform(0, 1)',
      frameworkTip: '這是 Amazon 的經典面試題。答題時先畫出等待時間的序列（1, 2, 4, 8s），解釋為什麼要用指數增長而不是固定間隔。提到 jitter（隨機抖動）避免 thundering herd 會讓面試官非常滿意。',
    },
    {
      id: 4,
      name: 'HTTP 狀態碼決策邏輯',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '智慧 API 回應處理器',
        narrative: '你在建立一個自動化報表系統，需要從多個 API 拉取資料。不同的 HTTP 狀態碼需要不同的處理策略：有些要重試、有些要記錄錯誤、有些要直接跳過。你需要寫一個統一的回應處理函式。',
      },
      question: '完成 handle_response() 函式，根據 HTTP 狀態碼決定處理策略：\n\n- 200-299：成功，回傳 {"status": "success", "data": response.json()}\n- 401/403：認證問題，回傳 {"status": "auth_error", "message": "..."}\n- 429：限流，回傳 {"status": "retry", "wait_seconds": Retry-After header 值}\n- 500-599：伺服器錯誤，回傳 {"status": "retry", "wait_seconds": 5}\n- 其他：回傳 {"status": "error", "code": status_code}',
      starterCode: 'def handle_response(response):\n    code = response.status_code\n    \n    # 根據狀態碼決定處理策略\n    pass',
      expectedQuery: 'def handle_response(response):\n    code = response.status_code\n    \n    if 200 <= code <= 299:\n        return {"status": "success", "data": response.json()}\n    elif code in (401, 403):\n        return {"status": "auth_error", "message": f"Authentication failed with status {code}"}\n    elif code == 429:\n        wait = int(response.headers.get("Retry-After", 1))\n        return {"status": "retry", "wait_seconds": wait}\n    elif 500 <= code <= 599:\n        return {"status": "retry", "wait_seconds": 5}\n    else:\n        return {"status": "error", "code": code}',
      testCases: [
        { input: 'class R:\n    def __init__(self, code, data=None, headers=None):\n        self.status_code = code\n        self._data = data\n        self.headers = headers or {}\n    def json(self): return self._data\nhandle_response(R(200, {"ok": True}))' },
        { input: 'class R:\n    def __init__(self, code, data=None, headers=None):\n        self.status_code = code\n        self._data = data\n        self.headers = headers or {}\n    def json(self): return self._data\nhandle_response(R(429, headers={"Retry-After": "5"}))' },
        { input: 'class R:\n    def __init__(self, code, data=None, headers=None):\n        self.status_code = code\n        self._data = data\n        self.headers = headers or {}\n    def json(self): return self._data\nhandle_response(R(500))' },
      ],
      hints: ['用 200 <= code <= 299 檢查 2xx 範圍', '用 in (401, 403) 檢查多個特定值', 'response.headers.get("Retry-After", 1) 讀取 header 並提供預設值'],
      explanation: 'API 回應處理的最佳實踐：\n1. 用範圍檢查（200-299）而非只檢查 200\n2. 區分「可重試」和「不可重試」的錯誤\n3. 429 讀取 Retry-After header\n4. 5xx 通常是暫時性錯誤，可以重試\n5. 4xx（除了 429）通常需要修正請求，不該盲目重試\n\n這種決策模式可以搭配前面的 exponential backoff 使用。',
      frameworkTip: '面試時展示你對 HTTP 狀態碼的分類思維：2xx 成功、4xx 客戶端問題（通常不重試）、5xx 伺服器問題（可重試）、429 是特殊的 4xx（需要重試）。這種系統性思考方式會讓面試官印象深刻。',
    },
  ],
}
