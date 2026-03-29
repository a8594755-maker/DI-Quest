// ── World 20 Extra Challenges (APIs & Web Requests Interview Questions) ──────
// These challenges are appended to the corresponding quests in World 20

export const w20ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-1: JSON & API concepts — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '20-1': [
    {
      id: 3,
      name: 'RESTful Design Principles',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'RESTful API Verb Semantics',
        narrative: 'You are in an Amazon interview and asked about API design. The interviewer presents an e-commerce order system and asks you to identify the correct HTTP method mappings. Understanding REST verb semantics is foundational for backend and data engineering interviews.',
      },
      question: 'For an e-commerce order API, which set of HTTP method mappings is correct?\n\n1. Retrieve all orders\n2. Create a new order\n3. Update an order\'s address\n4. Cancel (delete) an order',
      options: [
        { id: 'A', text: '1.GET /orders  2.POST /orders  3.PUT /orders/{id}  4.DELETE /orders/{id}', explanation: 'Correct! GET for reading, POST for creating, PUT for full update, DELETE for removal. This is standard RESTful API design.' },
        { id: 'B', text: '1.POST /getOrders  2.POST /createOrder  3.POST /updateOrder  4.POST /deleteOrder', explanation: 'This is RPC style, not RESTful. RESTful APIs use HTTP methods to distinguish operations, not verbs in URLs.' },
        { id: 'C', text: '1.GET /orders  2.PUT /orders  3.PATCH /orders/{id}  4.GET /orders/{id}/delete', explanation: 'PUT is for updating not creating, and using GET for deletion violates HTTP semantics (GET should be idempotent with no side effects).' },
        { id: 'D', text: '1.GET /orders  2.POST /orders  3.POST /orders/{id}  4.PUT /orders/{id}/cancel', explanation: 'Using POST for updates is imprecise, and PUT should not be used for non-idempotent cancel operations.' },
      ],
      correctAnswer: 'A',
      hints: ['RESTful design: URLs represent resources (nouns), HTTP methods represent actions (verbs)', 'GET=read, POST=create, PUT=full update, PATCH=partial update, DELETE=remove', 'GET and PUT are idempotent (same result on repeated calls), POST is not'],
      explanation: 'Four key RESTful API design principles:\n1. URLs use nouns for resources: /orders, /users\n2. HTTP methods represent operations: GET (read), POST (create), PUT (full update), PATCH (partial update), DELETE (remove)\n3. GET and DELETE are idempotent\n4. POST is not idempotent (each call may create a new resource)\n\nCommon follow-up: PUT vs PATCH? PUT replaces the entire resource, PATCH updates only specific fields.',
      frameworkTip: 'When asked about API design in an interview, start with "I\'d use RESTful conventions," then quickly map GET/POST/PUT/DELETE to CRUD operations. Mentioning idempotency will impress the interviewer.',
    },
    {
      id: 4,
      name: 'HTTP Status Code Semantics',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'API Response Status Codes',
        narrative: 'You are developing an API integration script and receiving different HTTP status codes from a partner\'s order API. You need to decide how to handle each response — retry, fix the request, or escalate the issue.',
      },
      question: 'Your script encounters the following status codes when calling an API. Which pairing of handling strategies is correct?\n\n- 200: Request succeeded\n- 401: Authentication failed\n- 429: Too many requests\n- 503: Service temporarily unavailable',
      options: [
        { id: 'A', text: '200→Process data, 401→Retry, 429→Wait then retry, 503→Wait then retry', explanation: '401 is an authentication issue — retrying won\'t fix it. You need to check if your API key or token is correct.' },
        { id: 'B', text: '200→Process data, 401→Check token, 429→Retry immediately, 503→Wait then retry', explanation: '429 means rate limit — retrying immediately will just trigger it again. You should wait (typically reading the Retry-After header) before retrying.' },
        { id: 'C', text: '200→Process data, 401→Check token, 429→Wait then retry, 503→Wait then retry', explanation: 'Correct! 2xx means success, 401 is an auth issue requiring credential fixes, 429 is rate limiting requiring backoff retry, 503 is a transient error worth retrying.' },
        { id: 'D', text: '200→Process data, 401→Check token, 429→Wait then retry, 503→Give up', explanation: '503 means "temporarily" unavailable — waiting and retrying usually works. No need to give up immediately.' },
      ],
      correctAnswer: 'C',
      hints: ['2xx = success, 4xx = client error, 5xx = server error', '401 vs 403: 401 is "unauthenticated," 403 is "authenticated but unauthorized"', '429 usually comes with a Retry-After header telling you how long to wait'],
      explanation: 'HTTP status code categories:\n- 2xx Success: 200 OK, 201 Created, 204 No Content\n- 4xx Client Error: 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests\n- 5xx Server Error: 500 Internal Error, 502 Bad Gateway, 503 Service Unavailable\n\nHandling strategy: 4xx generally don\'t retry (except 429), 5xx generally can retry.',
      frameworkTip: 'When asked about API error handling in an interview, first categorize (4xx vs 5xx), then explain the strategy: 4xx fix the request, 5xx retry. Specifically mentioning exponential backoff for 429 shows production experience.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-2: requests GET — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '20-2': [
    {
      id: 4,
      name: 'API Pagination Auto-Crawling',
      type: 'code',
      difficulty: 'hard',
      sourceTag: '實戰',
      scenario: {
        title: 'Auto-Fetch All Paginated Data',
        narrative: 'You work at an e-commerce company and need to pull all product data daily from a supplier API. The API returns only 100 records per page and uses a next_page token mechanism. You need to write a script that automatically crawls all pages.',
      },
      question: 'Complete the fetch_all_products() function using a while loop with next_page token to automatically crawl all pages.\n\nAPI response format:\n```json\n{\n  "data": [{"id": 1, "name": "Product A"}, ...],\n  "next_page": "token_abc123"  // null means last page\n}\n```\n\nExample:\nfetch_all_products("https://api.example.com/products")\n→ Returns a list of all products',
      starterCode: 'import requests\n\ndef fetch_all_products(base_url):\n    all_products = []\n    next_page = None\n    \n    while True:\n        # 1. Build URL params (include next_page token if available)\n        # 2. Send GET request\n        # 3. Add data to all_products\n        # 4. Check if there\'s a next page\n        pass\n    \n    return all_products',
      expectedQuery: 'import requests\n\ndef fetch_all_products(base_url):\n    all_products = []\n    next_page = None\n    \n    while True:\n        params = {}\n        if next_page:\n            params["page_token"] = next_page\n        \n        response = requests.get(base_url, params=params)\n        response.raise_for_status()\n        data = response.json()\n        \n        all_products.extend(data["data"])\n        \n        next_page = data.get("next_page")\n        if not next_page:\n            break\n    \n    return all_products',
      testCases: [
        { input: 'class MockResp:\n    status_code = 200\n    def json(self): return {"data": [{"id": 1}], "next_page": None}\n    def raise_for_status(self): pass\nimport types\ndef mock_get(url, params=None): return MockResp()\nimport requests\nrequests.get = mock_get\nfetch_all_products("http://test.com")' },
      ],
      hints: ['Use a params dict to pass page_token', 'Use extend() instead of append() to merge lists', 'data.get("next_page") returns None when the key doesn\'t exist'],
      explanation: 'Standard pagination crawling pattern:\n1. while True infinite loop\n2. Include next_page token each time (skip for first page)\n3. extend() current page data into the result list\n4. Check if next_page is None/null — if so, break\n\nThis pattern is extremely common in practice. Nearly all major APIs (GitHub, Stripe, Shopify) use similar pagination mechanisms.',
      frameworkTip: 'When discussing API pagination in an interview, mention that you know two common patterns: offset/limit (good for small datasets) and cursor/token (good for large datasets, avoids page-skipping issues). This shows real-world API experience.',
    },
    {
      id: 5,
      name: 'Rate Limit Handling',
      type: 'code',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: 'Graceful API Rate Limit Handling',
        narrative: 'You are frequently hitting 429 Too Many Requests errors when batch-calling a partner API. Your manager asks you to add rate limit handling logic so the script automatically waits and retries.',
      },
      question: 'Complete the safe_request() function. When receiving a 429 status code, read the Retry-After header for wait seconds and retry. Maximum 3 retries.\n\nExample:\nsafe_request("https://api.example.com/data")\n→ Automatically handles 429, returns response.json() on success',
      starterCode: 'import requests\nimport time\n\ndef safe_request(url, max_retries=3):\n    for attempt in range(max_retries):\n        response = requests.get(url)\n        \n        if response.status_code == 200:\n            return response.json()\n        elif response.status_code == 429:\n            # Read Retry-After header, default to 1 second\n            # Wait and then continue the loop to retry\n            pass\n        else:\n            response.raise_for_status()\n    \n    raise Exception(f"Still rate limited after {max_retries} retries")',
      expectedQuery: 'import requests\nimport time\n\ndef safe_request(url, max_retries=3):\n    for attempt in range(max_retries):\n        response = requests.get(url)\n        \n        if response.status_code == 200:\n            return response.json()\n        elif response.status_code == 429:\n            wait_time = int(response.headers.get("Retry-After", 1))\n            print(f"Rate limited. Waiting {wait_time}s (attempt {attempt + 1}/{max_retries})")\n            time.sleep(wait_time)\n        else:\n            response.raise_for_status()\n    \n    raise Exception(f"Still rate limited after {max_retries} retries")',
      testCases: [
        { input: 'class MockResp:\n    status_code = 200\n    def json(self): return {"ok": True}\n    def raise_for_status(self): pass\nimport requests\nrequests.get = lambda url: MockResp()\nsafe_request("http://test.com")' },
      ],
      hints: ['response.headers.get("Retry-After", 1) reads the wait seconds', 'time.sleep(wait_time) pauses execution', '429 doesn\'t need raise_for_status — just wait and retry'],
      explanation: 'Rate limit handling pattern:\n1. Check if status_code is 429\n2. Read the Retry-After header (the API tells you how long to wait)\n3. time.sleep() for the specified seconds\n4. Automatically retry, with a maximum retry count\n\nAdvanced approach: Use exponential backoff, doubling the wait time each retry.',
      frameworkTip: 'When discussing rate limiting in an interview, beyond basic retry mechanics, mentioning Retry-After headers and exponential backoff demonstrates production API integration experience.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-3: POST & authentication — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '20-3': [
    {
      id: 3,
      name: 'OAuth2 Flow Understanding',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'OAuth2 Authentication Flow',
        narrative: 'You are in an Uber interview and asked about designing a third-party login system. The interviewer wants to assess your understanding of the OAuth2 authorization flow — the industry standard for modern API authentication.',
      },
      question: 'A web application wants to let users sign in with their Google account using the OAuth2 Authorization Code Flow. Which flow sequence is correct?',
      options: [
        { id: 'A', text: 'User clicks login → Frontend directly gets access_token → Calls Google API', explanation: 'This is the Implicit Flow (no longer recommended), not the Authorization Code Flow. The Auth Code Flow has an additional step of exchanging a code for a token.' },
        { id: 'B', text: 'User clicks login → Redirect to Google auth page → User consents → Google returns authorization code → Backend exchanges code + client_secret for access_token → Uses token to call API', explanation: 'Correct! The complete Authorization Code Flow. The code passes through the frontend (could be intercepted), but the access_token is only exchanged on the backend using client_secret, ensuring security.' },
        { id: 'C', text: 'Backend directly uses client_id + client_secret to get access_token → Calls Google API', explanation: 'This is the Client Credentials Flow, used for server-to-server communication without user authorization.' },
        { id: 'D', text: 'User enters Google credentials into your app → You exchange credentials for token → Call API', explanation: 'This is the Resource Owner Password Flow (deprecated). Letting a third-party app see user passwords is a serious security risk.' },
      ],
      correctAnswer: 'B',
      hints: ['Authorization Code Flow has two exchanges: first get the code, then exchange code for token', 'The code is short-lived and single-use; the access_token is what calls the API', 'client_secret only lives on the backend — never expose it to the frontend'],
      explanation: 'OAuth2 Authorization Code Flow:\n1. Frontend redirects to the authorization server (e.g., Google)\n2. User consents to authorization\n3. Google returns an authorization code to your redirect_uri\n4. Backend exchanges code + client_id + client_secret with Google for an access_token\n5. Uses access_token to call APIs\n\nWhy the extra step? The code passes through the browser (could be intercepted), but the token is only exchanged securely on the backend.',
      frameworkTip: 'When asked about OAuth2 in an interview, first draw the Authorization Code Flow diagram, then explain why the "code-for-token" exchange step exists (security). Mentioning the PKCE extension shows you know current security best practices.',
    },
    {
      id: 4,
      name: 'Bearer Token Usage Patterns',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'API Token Authentication Implementation',
        narrative: 'You are building an internal tool that needs to call your company\'s REST API. The API requires a Bearer Token in the header. You need to build an authenticated API client class for your team to use.',
      },
      question: 'Complete the ApiClient class so it automatically includes a Bearer Token in every request. Support both GET and POST methods.\n\nExample:\n```python\nclient = ApiClient("https://api.company.com", "my_secret_token")\nusers = client.get("/users")\nclient.post("/users", {"name": "Alice"})\n```',
      starterCode: 'import requests\n\nclass ApiClient:\n    def __init__(self, base_url, token):\n        self.base_url = base_url\n        # Set up headers with Bearer Token\n        self.headers = {}\n    \n    def get(self, endpoint, params=None):\n        # Send authenticated GET request\n        pass\n    \n    def post(self, endpoint, data=None):\n        # Send authenticated POST request\n        pass',
      expectedQuery: 'import requests\n\nclass ApiClient:\n    def __init__(self, base_url, token):\n        self.base_url = base_url\n        self.headers = {\n            "Authorization": f"Bearer {token}",\n            "Content-Type": "application/json"\n        }\n    \n    def get(self, endpoint, params=None):\n        response = requests.get(\n            f"{self.base_url}{endpoint}",\n            headers=self.headers,\n            params=params\n        )\n        response.raise_for_status()\n        return response.json()\n    \n    def post(self, endpoint, data=None):\n        response = requests.post(\n            f"{self.base_url}{endpoint}",\n            headers=self.headers,\n            json=data\n        )\n        response.raise_for_status()\n        return response.json()',
      testCases: [
        { input: 'client = ApiClient("https://api.example.com", "token123")\nclient.headers["Authorization"]' },
        { input: 'client = ApiClient("https://api.example.com", "secret")\nclient.base_url' },
      ],
      hints: ['Authorization header format: "Bearer your_token_here"', 'Use f-string to combine base_url + endpoint', 'POST uses json=data to automatically serialize dict to JSON'],
      explanation: 'Bearer Token authentication pattern:\n- Add Authorization: Bearer <token> to HTTP headers\n- This is the most common token usage in OAuth2\n- Benefits of wrapping in a class: centralized auth management, base_url, error handling\n\nAdvanced: Using requests.Session() can persist headers, reducing repetitive setup.',
      frameworkTip: 'In an interview, showing that you encapsulate API client classes instead of repeating headers everywhere demonstrates DRY principles and code reuse. Mentioning requests.Session() performance benefits (connection reuse) earns extra points.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-4: batch processing scripts — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '20-4': [
    {
      id: 4,
      name: 'async/await Fundamentals',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Python Asynchronous Programming',
        narrative: 'You are in a Meta interview and asked about Python\'s asynchronous programming. The interviewer wants to know if you understand the core concepts of async/await — essential for batch scripts handling large volumes of API requests. Python 3.11+ significantly improved asyncio performance and error messages.',
      },
      question: 'Regarding Python\'s async/await, which statement is correct?',
      options: [
        { id: 'A', text: 'async functions automatically run in a new thread, enabling true parallel execution', explanation: 'asyncio is single-threaded! It uses an event loop to switch between tasks in one thread — it\'s not multi-threaded.' },
        { id: 'B', text: 'await pauses the current coroutine\'s execution, letting the event loop process other tasks, and resumes when the I/O operation completes', explanation: 'Correct! The essence of await is "yielding control back to the event loop." When a coroutine is waiting for I/O (like an API response), the event loop can execute other coroutines. This is concurrency, not parallelism.' },
        { id: 'C', text: 'asyncio.gather() distributes tasks across different CPU cores for execution', explanation: 'asyncio is single-threaded and doesn\'t use multiple cores. For multi-core execution, you need the multiprocessing module.' },
        { id: 'D', text: 'Adding the async keyword to any function makes it faster because it enables asynchronous I/O', explanation: 'Adding async only makes the function a coroutine — it doesn\'t automatically speed things up. You need await and async I/O operations for benefits. CPU-bound tasks may actually run slower with async.' },
      ],
      correctAnswer: 'B',
      hints: ['asyncio is single-threaded cooperative multitasking', 'await is the "yield control" point for coroutines', 'Best for I/O-bound tasks (API calls, file I/O), not CPU-bound tasks'],
      explanation: 'Python async/await core concepts:\n- async def defines a coroutine\n- await pauses the current coroutine, letting the event loop handle other tasks\n- Single thread + event loop = concurrency (not parallelism)\n- Ideal for: bulk API calls, database queries, and other I/O-bound waits\n\nPython 3.11+ improvements: better error messages, TaskGroup (structured concurrency replacing gather), 10-60% performance gains.',
      frameworkTip: 'Distinguishing concurrency vs parallelism is key in interviews: asyncio is concurrency (one person juggling multiple tasks), multiprocessing is parallelism (multiple people each doing one task). This distinction is a frequently tested concept at Meta.',
    },
    {
      id: 5,
      name: 'Concurrent Requests with asyncio.gather',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Meta Interview',
      scenario: {
        title: 'Speed Up Batch Processing with Concurrent API Requests',
        narrative: 'Your team needs to pull data daily from 50 different API endpoints. Synchronous calls take 5 minutes. Your manager asks you to speed things up using async. You need to use asyncio.gather to concurrently execute all requests.',
      },
      question: 'Complete the fetch_all_endpoints() function using asyncio + aiohttp to concurrently call multiple API endpoints.\n\nExample:\n```python\nurls = [\n    "https://api.example.com/sales",\n    "https://api.example.com/users",\n    "https://api.example.com/products"\n]\nresults = asyncio.run(fetch_all_endpoints(urls))\n# → [sales_data, users_data, products_data]\n```',
      starterCode: 'import asyncio\nimport aiohttp\n\nasync def fetch_one(session, url):\n    # Send a single GET request with aiohttp\n    pass\n\nasync def fetch_all_endpoints(urls):\n    # Use asyncio.gather to concurrently call all URLs\n    pass',
      expectedQuery: 'import asyncio\nimport aiohttp\n\nasync def fetch_one(session, url):\n    async with session.get(url) as response:\n        response.raise_for_status()\n        return await response.json()\n\nasync def fetch_all_endpoints(urls):\n    async with aiohttp.ClientSession() as session:\n        tasks = [fetch_one(session, url) for url in urls]\n        results = await asyncio.gather(*tasks)\n        return list(results)',
      testCases: [
        { input: 'import asyncio\nasync def test():\n    return "async works"\nasyncio.get_event_loop().run_until_complete(test())' },
      ],
      hints: ['aiohttp uses async with session.get(url) as response to send requests', 'Use list comprehension to build the task list', 'asyncio.gather(*tasks) accepts multiple coroutines for concurrent execution'],
      explanation: 'asyncio.gather concurrency pattern:\n1. Create an aiohttp.ClientSession (shared connection pool)\n2. Use list comprehension to build all coroutine tasks\n3. await asyncio.gather(*tasks) for concurrent execution\n4. Results are returned in the same order as the input\n\nPerformance comparison: 50 synchronous requests (1 second each) = 50 seconds. asyncio.gather = approximately 1 second (all requests run simultaneously).',
      frameworkTip: 'When discussing concurrent requests in an interview, explain why you\'d choose asyncio over threading (under the GIL, asyncio is more lightweight and manageable for I/O-bound tasks). Then describe how the event loop works to show you truly understand the underlying mechanism.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 20-5: auto report generation — 2 extra challenges
  // ══════════════════════════════════════════════════════════════════
  '20-5': [
    {
      id: 3,
      name: 'Exponential Backoff Retry Strategy',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Exponential Backoff Retry Decorator',
        narrative: 'You are in an Amazon interview and asked to implement a retry decorator. In distributed systems, APIs may fail due to transient errors. Exponential backoff is the industry-standard retry strategy — doubling wait time between retries to avoid overwhelming the server with simultaneous retries.',
      },
      question: 'Write a retry_with_backoff decorator with the following behavior:\n1. Retry up to max_retries times\n2. Double the wait time each retry (1s, 2s, 4s, 8s...)\n3. Only retry on specified exception types\n4. Raise the last exception after exceeding max retries\n\nExample:\n```python\n@retry_with_backoff(max_retries=3, exceptions=(ConnectionError, TimeoutError))\ndef call_api():\n    response = requests.get("https://api.example.com/data")\n    response.raise_for_status()\n    return response.json()\n```',
      starterCode: 'import time\nimport functools\n\ndef retry_with_backoff(max_retries=3, exceptions=(Exception,)):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            # Implement exponential backoff retry logic\n            pass\n        return wrapper\n    return decorator',
      expectedQuery: 'import time\nimport functools\n\ndef retry_with_backoff(max_retries=3, exceptions=(Exception,)):\n    def decorator(func):\n        @functools.wraps(func)\n        def wrapper(*args, **kwargs):\n            for attempt in range(max_retries):\n                try:\n                    return func(*args, **kwargs)\n                except exceptions as e:\n                    if attempt == max_retries - 1:\n                        raise\n                    wait_time = 2 ** attempt\n                    print(f"Attempt {attempt + 1} failed: {e}. Retrying in {wait_time}s...")\n                    time.sleep(wait_time)\n        return wrapper\n    return decorator',
      testCases: [
        { input: '@retry_with_backoff(max_retries=2, exceptions=(ValueError,))\ndef ok_func():\n    return 42\nok_func()' },
        { input: '@retry_with_backoff(max_retries=1, exceptions=(ValueError,))\ndef always_ok():\n    return "success"\nalways_ok()' },
      ],
      hints: ['Use three nested functions: outer takes params, middle takes function, inner is the wrapper', 'wait_time = 2 ** attempt produces 1, 2, 4, 8... wait times', 'After the last retry fails, use bare raise to re-raise the original exception'],
      explanation: 'Exponential backoff retry pattern:\n- Wait times: 2^0=1s, 2^1=2s, 2^2=4s, 2^3=8s...\n- Why exponential? Avoids multiple clients retrying simultaneously (thundering herd problem)\n- functools.wraps preserves the original function\'s __name__ and __doc__\n- Bare raise: re-raises the currently caught exception\n\nAdvanced: Add jitter (random delay), e.g., wait_time = 2**attempt + random.uniform(0, 1)',
      frameworkTip: 'This is a classic Amazon interview question. Start by drawing the wait time sequence (1, 2, 4, 8s), then explain why exponential growth beats fixed intervals. Mentioning jitter to prevent thundering herd will strongly impress the interviewer.',
    },
    {
      id: 4,
      name: 'HTTP Status Code Decision Logic',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'Smart API Response Handler',
        narrative: 'You are building an automated reporting system that pulls data from multiple APIs. Different HTTP status codes require different handling strategies: some need retries, some need error logging, and some should be skipped entirely. You need a unified response handler.',
      },
      question: 'Complete the handle_response() function to decide handling strategy based on HTTP status codes:\n\n- 200-299: Success, return {"status": "success", "data": response.json()}\n- 401/403: Auth issue, return {"status": "auth_error", "message": "..."}\n- 429: Rate limited, return {"status": "retry", "wait_seconds": Retry-After header value}\n- 500-599: Server error, return {"status": "retry", "wait_seconds": 5}\n- Other: return {"status": "error", "code": status_code}',
      starterCode: 'def handle_response(response):\n    code = response.status_code\n    \n    # Decide handling strategy based on status code\n    pass',
      expectedQuery: 'def handle_response(response):\n    code = response.status_code\n    \n    if 200 <= code <= 299:\n        return {"status": "success", "data": response.json()}\n    elif code in (401, 403):\n        return {"status": "auth_error", "message": f"Authentication failed with status {code}"}\n    elif code == 429:\n        wait = int(response.headers.get("Retry-After", 1))\n        return {"status": "retry", "wait_seconds": wait}\n    elif 500 <= code <= 599:\n        return {"status": "retry", "wait_seconds": 5}\n    else:\n        return {"status": "error", "code": code}',
      testCases: [
        { input: 'class R:\n    status_code = 200\n    def json(self): return {"ok": True}\nhandle_response(R())["status"]' },
        { input: 'class R:\n    status_code = 401\n    headers = {}\nhandle_response(R())["status"]' },
        { input: 'class R:\n    status_code = 500\n    headers = {}\nhandle_response(R())' },
      ],
      hints: ['Use 200 <= code <= 299 to check the 2xx range', 'Use in (401, 403) to check multiple specific values', 'response.headers.get("Retry-After", 1) reads the header with a default value'],
      explanation: 'API response handling best practices:\n1. Use range checks (200-299) instead of just checking for 200\n2. Distinguish "retryable" from "non-retryable" errors\n3. 429 reads the Retry-After header\n4. 5xx are usually transient errors — safe to retry\n5. 4xx (except 429) usually need request fixes — don\'t blindly retry\n\nThis decision pattern can be combined with the exponential backoff strategy from earlier.',
      frameworkTip: 'In an interview, demonstrate systematic thinking about HTTP status codes: 2xx success, 4xx client issues (usually don\'t retry), 5xx server issues (can retry), 429 is a special 4xx (needs retry). This systematic approach will impress the interviewer.',
    },
  ],
}
