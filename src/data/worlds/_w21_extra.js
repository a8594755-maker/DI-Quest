// ── World 21 額外挑戰（資料庫與 Web 框架面試題）──────────────────
// 這些挑戰會被 append 到 World 21 對應的 quest 中

export const w21Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 21-1: Python + SQLite — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '21-1': [
    {
      id: 5,
      name: 'SQL Injection 攻擊與防禦',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'SQL Injection — 最危險的安全漏洞',
        narrative: '你在 Google 面試中被問到一段資料庫查詢程式碼。面試官要你指出安全漏洞，並說明正確的防禦方式。這是每個後端工程師必須掌握的基礎安全知識。',
      },
      question: '以下哪段程式碼能正確防禦 SQL Injection？\n\n```python\n# 寫法 A — 字串拼接\ncursor.execute("SELECT * FROM users WHERE name = \'" + user_input + "\'")\n\n# 寫法 B — f-string\ncursor.execute(f"SELECT * FROM users WHERE name = \'{user_input}\'")\n\n# 寫法 C — 參數化查詢\ncursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))\n\n# 寫法 D — 手動過濾引號\nsafe = user_input.replace("\'", "")\ncursor.execute(f"SELECT * FROM users WHERE name = \'{safe}\'")\n```',
      options: [
        { id: 'A', text: '寫法 A（字串拼接）', explanation: '字串拼接是 SQL Injection 的典型漏洞。攻擊者輸入 \' OR 1=1 -- 就能繞過驗證。' },
        { id: 'B', text: '寫法 B（f-string）', explanation: 'f-string 本質上跟字串拼接一樣，同樣存在 SQL Injection 風險。' },
        { id: 'C', text: '寫法 C（參數化查詢）', explanation: '正確！參數化查詢（Parameterized Query）讓資料庫引擎自動處理跳脫字元，使用者輸入永遠被視為「資料」而非「SQL 指令」，從根本上防禦 SQL Injection。' },
        { id: 'D', text: '寫法 D（手動過濾引號）', explanation: '手動過濾不可靠，攻擊者可以用 Unicode 編碼、雙重跳脫等方式繞過。永遠不要自己做 SQL 消毒。' },
      ],
      correctAnswer: 'C',
      hints: ['SQL Injection 的核心問題是使用者輸入被當作 SQL 指令執行', '參數化查詢用 ? 或 %s 作為佔位符', '手動過濾永遠不夠安全'],
      explanation: 'SQL Injection 是 OWASP Top 10 第一名的安全漏洞。防禦方式只有一個正確答案：參數化查詢（Parameterized Query）。\n\n```python\n# 正確寫法\ncursor.execute("SELECT * FROM users WHERE name = ?", (user_input,))\n\n# PostgreSQL/MySQL 用 %s\ncursor.execute("SELECT * FROM users WHERE name = %s", (user_input,))\n```\n\n資料庫會將參數視為「純資料」，即使輸入包含 SQL 語法也不會被執行。',
      frameworkTip: '面試中被問到資料庫安全，第一時間說「參數化查詢」。如果能補充 OWASP Top 10 和 ORM 自動防禦（如 SQLAlchemy），會大幅加分。Google 非常重視安全意識。',
    },
    {
      id: 6,
      name: '連線的 Context Manager',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: '資料庫連線的資源管理',
        narrative: '你在開發一個電商平台的訂單系統。資深工程師告訴你，資料庫連線必須用 context manager 管理，否則連線洩漏會導致伺服器在高流量時當機。',
      },
      question: '完成以下函式，使用 context manager（with 語句）安全地執行 SQLite 操作。函式要：\n1. 用 with 開啟連線\n2. 建立 orders 資料表（id, product, amount）\n3. 插入一筆訂單\n4. 確保連線自動關閉\n\n```python\nimport sqlite3\n\ndef create_order(db_path, product, amount):\n    # 用 with 管理連線，確保自動 commit 和關閉\n    pass\n```',
      starterCode: 'import sqlite3\n\ndef create_order(db_path, product, amount):\n    # 用 with 管理連線，確保自動 commit 和關閉\n    pass',
      expectedQuery: 'import sqlite3\n\ndef create_order(db_path, product, amount):\n    with sqlite3.connect(db_path) as conn:\n        cursor = conn.cursor()\n        cursor.execute("""\n            CREATE TABLE IF NOT EXISTS orders (\n                id INTEGER PRIMARY KEY AUTOINCREMENT,\n                product TEXT NOT NULL,\n                amount REAL NOT NULL\n            )\n        """)\n        cursor.execute(\n            "INSERT INTO orders (product, amount) VALUES (?, ?)",\n            (product, amount)\n        )\n        conn.commit()',
      testCases: [
        { input: 'import sqlite3\ncreate_order(":memory:", "Laptop", 999.99)\nwith sqlite3.connect(":memory:") as c:\n    create_order(":memory:", "Mouse", 29.99)\n"ok"' },
      ],
      hints: ['sqlite3.connect() 支援 with 語句', 'with 區塊結束時會自動處理連線', '記得用參數化查詢防止 SQL Injection'],
      explanation: 'Context Manager（with 語句）確保資源在使用完畢後自動釋放：\n\n```python\nwith sqlite3.connect(db_path) as conn:\n    # conn 在 with 區塊結束時自動處理\n    # 如果沒有例外，自動 commit\n    # 如果有例外，自動 rollback\n```\n\n不用 with 的話，忘記 conn.close() 會導致連線洩漏。',
      frameworkTip: '面試時展示你懂得用 context manager 管理資源（檔案、連線、鎖），說明你理解 Python 的資源管理最佳實踐。這在 Google 和 Amazon 面試中是加分項。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 21-2: CRUD 操作 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '21-2': [
    {
      id: 3,
      name: 'Transaction 與 ACID 原則',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: '實戰',
      scenario: {
        title: '伺服器當機時資料會怎樣？',
        narrative: '你在一家支付公司面試。面試官問你：「如果使用者正在轉帳，從 A 帳戶扣款後、還沒加到 B 帳戶時伺服器當機了，會發生什麼事？」這是考 Transaction 和 ACID 的核心問題。',
      },
      question: '在正確使用資料庫 Transaction 的情況下，以下程式碼執行到一半時伺服器當機，會發生什麼？\n\n```python\nconn = sqlite3.connect("bank.db")\ncursor = conn.cursor()\ntry:\n    cursor.execute("UPDATE accounts SET balance = balance - 1000 WHERE id = 1")  # 扣款\n    # ← 伺服器在這裡當機\n    cursor.execute("UPDATE accounts SET balance = balance + 1000 WHERE id = 2")  # 入帳\n    conn.commit()\nexcept:\n    conn.rollback()\n```',
      options: [
        { id: 'A', text: 'A 帳戶被扣 1000，B 帳戶沒收到錢（資料不一致）', explanation: '如果使用 Transaction，在 commit 之前的所有操作都不會被永久寫入。' },
        { id: 'B', text: '兩個帳戶餘額都不變（Transaction 自動 rollback）', explanation: '正確！這就是 ACID 中 Atomicity（原子性）的保證。Transaction 要嘛全部成功（commit），要嘛全部失敗（rollback）。伺服器當機時沒有 commit，所以所有變更都會被回滾。' },
        { id: 'C', text: '取決於作業系統是否有將資料寫入磁碟', explanation: 'ACID 的 Durability 保證只有 commit 後的資料才會被持久化。未 commit 的資料不會保留。' },
        { id: 'D', text: '需要手動執行 rollback 才能回復', explanation: '資料庫重啟後會自動回滾未 commit 的 transaction，不需手動處理。' },
      ],
      correctAnswer: 'B',
      hints: ['ACID 中的 A 代表 Atomicity（原子性）', 'Transaction 在 commit 之前的所有操作都是暫時的', '資料庫當機重啟後會自動回滾未完成的 transaction'],
      explanation: 'ACID 四大原則：\n- **Atomicity（原子性）**：Transaction 中的操作要嘛全部成功，要嘛全部失敗\n- **Consistency（一致性）**：Transaction 結束後資料庫必須處於合法狀態\n- **Isolation（隔離性）**：並行的 Transaction 彼此不干擾\n- **Durability（持久性）**：commit 後的資料永久保存，即使系統當機\n\n銀行轉帳是解釋 Atomicity 的經典案例。',
      frameworkTip: '面試時被問到 ACID，用銀行轉帳的例子來解釋最清楚。特別強調 Atomicity：「Transaction 就像一個原子操作，不可分割」。這是資料庫面試必考題。',
    },
    {
      id: 4,
      name: '批次操作效率',
      type: 'code',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: '批次匯入 10 萬筆資料',
        narrative: '你在電商公司負責商品資料匯入。同事寫了一個迴圈逐筆 INSERT，匯入 10 萬筆商品要花 45 分鐘。你需要用批次操作將時間縮短到 10 秒內。',
      },
      question: '將以下逐筆插入的低效寫法，改寫為使用 executemany() 的批次操作。\n\n```python\n# 原始低效寫法（每筆都 commit）\nfor product in products:\n    cursor.execute("INSERT INTO products (name, price) VALUES (?, ?)",\n                   (product["name"], product["price"]))\n    conn.commit()  # 每筆都 commit，效能極差\n```\n\n改寫成高效的批次操作：',
      starterCode: 'import sqlite3\n\ndef batch_insert(db_path, products):\n    # products = [{"name": "商品A", "price": 100}, ...]\n    # 用 executemany 批次插入，最後只 commit 一次\n    pass',
      expectedQuery: 'import sqlite3\n\ndef batch_insert(db_path, products):\n    with sqlite3.connect(db_path) as conn:\n        cursor = conn.cursor()\n        cursor.executemany(\n            "INSERT INTO products (name, price) VALUES (?, ?)",\n            [(p["name"], p["price"]) for p in products]\n        )\n        conn.commit()',
      testCases: [
        { input: 'import sqlite3\ndb = ":memory:"\nwith sqlite3.connect(db) as c:\n    c.execute("CREATE TABLE products (name TEXT, price REAL)")\nbatch_insert(db, [{"name": "A", "price": 10}, {"name": "B", "price": 20}])\n"ok"' },
      ],
      hints: ['executemany() 接收一個 SQL 和一個參數 list', '用 list comprehension 轉換資料格式', '只在所有資料插入後 commit 一次'],
      explanation: '批次操作的效能差異：\n\n```python\n# 慢：N 次 execute + N 次 commit = N 次磁碟 I/O\nfor item in data:\n    cursor.execute(sql, item)\n    conn.commit()\n\n# 快：1 次 executemany + 1 次 commit = 1 次磁碟 I/O\ncursor.executemany(sql, data_list)\nconn.commit()\n```\n\n效能差距可達 100-1000 倍，因為每次 commit 都涉及磁碟寫入。',
      frameworkTip: '面試時提到資料庫效能優化，「批次操作 + 減少 commit 次數」是最基本也最有效的方法。展示你理解 I/O 是效能瓶頸。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 21-3: ORM 概念 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '21-3': [
    {
      id: 2,
      name: 'N+1 查詢問題',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'N+1 Query — ORM 效能殺手',
        narrative: '你在 Google 面試中被問到：「你的 API 回應一個訂單列表頁面要 3 秒，資料庫有 100 筆訂單。你用 ORM 寫的程式碼看起來很簡潔，問題可能出在哪？」這是考 N+1 查詢問題。',
      },
      question: '以下 SQLAlchemy ORM 程式碼會產生多少次 SQL 查詢？\n\n```python\n# Model 定義\nclass Order(Base):\n    id = Column(Integer, primary_key=True)\n    customer_id = Column(Integer, ForeignKey("customers.id"))\n    customer = relationship("Customer")  # Lazy Loading（預設）\n\n# 查詢程式碼\norders = session.query(Order).all()  # 查詢 1：取得所有訂單\nfor order in orders:                  # 100 筆訂單\n    print(order.customer.name)        # 每次存取都觸發一次查詢\n```\n\n假設有 100 筆訂單，總共會產生幾次 SQL 查詢？',
      options: [
        { id: 'A', text: '1 次（ORM 會自動優化）', explanation: 'Lazy Loading 模式下，ORM 不會自動載入關聯資料，每次存取都會觸發額外查詢。' },
        { id: 'B', text: '2 次（一次查訂單，一次查所有客戶）', explanation: '這是 Eager Loading 的行為，但預設是 Lazy Loading。' },
        { id: 'C', text: '101 次（1 + N，這就是 N+1 問題）', explanation: '正確！第 1 次查詢取得所有訂單，然後每筆訂單存取 customer 時各觸發 1 次查詢，共 1 + 100 = 101 次。這就是 N+1 查詢問題。' },
        { id: 'D', text: '100 次（每筆訂單一次）', explanation: '別忘了第一次取得所有訂單的查詢，總共是 1 + N 次。' },
      ],
      correctAnswer: 'C',
      hints: ['預設的 Lazy Loading 在存取關聯物件時才查詢', '第一次 .all() 是 1 次查詢', '迴圈中每次 .customer 又各觸發 1 次'],
      explanation: 'N+1 查詢問題：\n- 1 次查詢取得主要資料（N 筆）\n- N 次查詢取得每筆的關聯資料\n- 總共 N+1 次查詢\n\n解決方案 — Eager Loading：\n```python\n# joinedload：用 JOIN 一次查完（1 次查詢）\norders = session.query(Order).options(\n    joinedload(Order.customer)\n).all()\n\n# subqueryload：用子查詢（2 次查詢）\norders = session.query(Order).options(\n    subqueryload(Order.customer)\n).all()\n```',
      frameworkTip: '面試時被問到 ORM 效能問題，第一個想到的就是 N+1。能說出「用 Eager Loading（joinedload / subqueryload）解決」並解釋 Lazy vs Eager 的差異，在 Google 面試中會非常加分。',
    },
    {
      id: 3,
      name: 'ORM 查詢優化',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Google Interview',
      scenario: {
        title: 'ORM 查詢效能調校',
        narrative: '你在一家 SaaS 公司做後端工程師，Dashboard 頁面載入時間從 200ms 慢到 5 秒。DBA 告訴你問題出在 ORM 的查詢方式。你需要優化以下 ORM 查詢。',
      },
      question: '以下 SQLAlchemy 查詢效能很差，請改寫成更高效的版本。\n\n```python\n# 低效寫法：取出所有資料再用 Python 過濾\nall_products = session.query(Product).all()\nexpensive = [p for p in all_products if p.price > 100]\nsorted_products = sorted(expensive, key=lambda p: p.price, reverse=True)\ntop_10 = sorted_products[:10]\n```\n\n改寫為在資料庫層面完成過濾、排序和分頁：',
      starterCode: '# 用 SQLAlchemy ORM 的 filter, order_by, limit\n# 讓資料庫做過濾和排序，而不是 Python\ndef get_top_expensive(session):\n    pass',
      expectedQuery: 'def get_top_expensive(session):\n    return session.query(Product)\\\n        .filter(Product.price > 100)\\\n        .order_by(Product.price.desc())\\\n        .limit(10)\\\n        .all()',
      testCases: [
        { input: 'class FakeQuery:\n    def __init__(self): self._chain = []\n    def query(self, model): return self\n    def filter(self, cond): return self\n    def order_by(self, col): return self\n    def limit(self, n): self._n = n; return self\n    def all(self): return [f"item_{i}" for i in range(self._n)]\nclass Product:\n    class price:\n        @staticmethod\n        def desc(): return "desc"\n    price_val = 0\n    def __gt__(self, other): return True\nsession = FakeQuery()\nlen(get_top_expensive(session))' },
      ],
      hints: ['用 .filter() 取代 Python 的 list comprehension 過濾', '用 .order_by() 取代 Python 的 sorted()', '用 .limit() 取代 Python 的 slice [:10]'],
      explanation: '資料庫 vs Python 處理的效能差異：\n\n```python\n# 差：從資料庫取出 10 萬筆，用 Python 過濾\nall_data = session.query(Product).all()  # 10 萬筆全部傳輸\nfiltered = [x for x in all_data if x.price > 100]  # Python 過濾\n\n# 好：讓資料庫只回傳需要的 10 筆\nsession.query(Product)\\\n    .filter(Product.price > 100)\\\n    .order_by(Product.price.desc())\\\n    .limit(10)\\\n    .all()  # 只傳輸 10 筆\n```\n\n資料庫有索引優化，處理過濾和排序比 Python 快幾個數量級。',
      frameworkTip: '面試中的效能優化題，核心原則是「讓資料庫做它擅長的事」。提到 filter/order_by/limit 推到 SQL 層，展示你理解 ORM 不是用來取代 SQL 而是抽象 SQL。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 21-4: Flask/FastAPI 入門 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '21-4': [
    {
      id: 4,
      name: 'FastAPI 依賴注入與 Pydantic 驗證',
      type: 'code',
      difficulty: 'hard',
      sourceTag: 'FastAPI 實戰',
      scenario: {
        title: 'FastAPI 的殺手功能（2024 採用率 +141%）',
        narrative: '你在一家新創公司面試。技術長說他們剛從 Flask 遷移到 FastAPI，最大的原因就是 Pydantic 自動驗證和依賴注入。他要你用 FastAPI 寫一個帶驗證的 API。',
      },
      question: '用 FastAPI + Pydantic 完成一個建立使用者的 API，需求：\n1. 用 Pydantic BaseModel 定義 UserCreate schema（name: str, email: str, age: int）\n2. age 必須 >= 0 且 <= 150\n3. email 必須包含 @\n4. 用依賴注入取得資料庫 session',
      starterCode: 'from fastapi import FastAPI, Depends\nfrom pydantic import BaseModel, validator\n\napp = FastAPI()\n\n# 1. 定義 Pydantic schema\nclass UserCreate(BaseModel):\n    pass  # 定義欄位和驗證\n\n# 2. 依賴注入：取得 DB session\ndef get_db():\n    pass  # yield db session\n\n# 3. API endpoint\n@app.post("/users")\ndef create_user(user: UserCreate, db = Depends(get_db)):\n    pass',
      expectedQuery: 'from fastapi import FastAPI, Depends\nfrom pydantic import BaseModel, validator\n\napp = FastAPI()\n\nclass UserCreate(BaseModel):\n    name: str\n    email: str\n    age: int\n\n    @validator("age")\n    def age_must_be_valid(cls, v):\n        if v < 0 or v > 150:\n            raise ValueError("Age must be between 0 and 150")\n        return v\n\n    @validator("email")\n    def email_must_contain_at(cls, v):\n        if "@" not in v:\n            raise ValueError("Invalid email format")\n        return v\n\ndef get_db():\n    db = SessionLocal()\n    try:\n        yield db\n    finally:\n        db.close()\n\n@app.post("/users")\ndef create_user(user: UserCreate, db = Depends(get_db)):\n    db_user = User(name=user.name, email=user.email, age=user.age)\n    db.add(db_user)\n    db.commit()\n    return {"id": db_user.id, "name": db_user.name}',
      testCases: [
        { input: 'u = UserCreate(name="Alice", email="alice@test.com", age=25)\nu.name' },
        { input: 'try:\n    UserCreate(name="Bob", email="invalid", age=25)\nexcept Exception:\n    "validation_error"' },
        { input: 'try:\n    UserCreate(name="Carol", email="c@test.com", age=-1)\nexcept Exception:\n    "age_error"' },
      ],
      hints: ['Pydantic 的 @validator 裝飾器用來自訂驗證邏輯', '依賴注入用 Depends() 和 yield 模式', 'FastAPI 會自動將驗證錯誤轉為 422 回應'],
      explanation: 'FastAPI 的兩大殺手功能：\n\n**Pydantic 驗證**：自動將 request body 轉為型別安全的物件，驗證失敗自動回傳 422 錯誤。\n\n**依賴注入**：用 Depends() 注入 DB session、認證、設定等。yield 模式確保資源清理：\n```python\ndef get_db():\n    db = SessionLocal()\n    try:\n        yield db      # 注入到 endpoint\n    finally:\n        db.close()    # endpoint 結束後自動清理\n```',
      frameworkTip: 'FastAPI 在 2024 年採用率成長 141%，已經超越 Flask 成為 Python Web 框架首選。面試時展示你會 Pydantic 驗證 + 依賴注入，說明你跟得上現代 Python 生態系。',
    },
    {
      id: 5,
      name: 'async def vs def 的差異',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'FastAPI 實戰',
      scenario: {
        title: 'FastAPI 中何時用 async？',
        narrative: '你在團隊 code review 時，有人把所有 FastAPI endpoint 都改成 async def，結果效能反而變差了。你需要理解什麼時候該用 async def，什麼時候該用普通 def。',
      },
      question: '在 FastAPI 中，以下哪個說法是正確的？\n\n```python\n# 寫法 A\n@app.get("/users")\ndef get_users(db = Depends(get_db)):\n    return db.query(User).all()\n\n# 寫法 B\n@app.get("/users")\nasync def get_users(db = Depends(get_db)):\n    return db.query(User).all()\n```',
      options: [
        { id: 'A', text: '寫法 B 一定比較快，因為 async 就是比較快', explanation: 'async 不是魔法加速器。如果函式內部都是同步 I/O（如傳統 ORM），async def 反而可能更慢。' },
        { id: 'B', text: '寫法 A 較好，因為 SQLAlchemy 同步 ORM 搭配普通 def 時，FastAPI 會自動放到線程池執行，不阻塞事件迴圈', explanation: '正確！FastAPI 對普通 def 會自動用線程池（threadpool）處理，不會阻塞主事件迴圈。但如果用 async def 卻呼叫同步阻塞的 I/O（如傳統 SQLAlchemy），會阻塞事件迴圈，導致整體效能下降。' },
        { id: 'C', text: '兩者完全相同，FastAPI 會自動處理', explanation: 'FastAPI 對 def 和 async def 的處理機制不同。def 跑在線程池，async def 跑在事件迴圈。' },
        { id: 'D', text: '應該永遠用 async def，這是 FastAPI 的最佳實踐', explanation: 'async def 只在搭配 async I/O（如 httpx, asyncpg）時才有優勢。' },
      ],
      correctAnswer: 'B',
      hints: ['FastAPI 對 def 和 async def 的處理方式不同', '同步阻塞 I/O 放在 async def 中會阻塞事件迴圈', 'FastAPI 會自動把普通 def 放到線程池'],
      explanation: 'FastAPI 的執行模型：\n\n- **def（同步）**：FastAPI 自動放到線程池（threadpool）執行，不阻塞事件迴圈。適合傳統 ORM、檔案 I/O 等同步操作。\n\n- **async def（非同步）**：直接在事件迴圈（event loop）中執行。必須搭配 async I/O（await httpx.get(), await asyncpg.fetch()），否則會阻塞事件迴圈。\n\n規則：沒有 await 就不要用 async def。',
      frameworkTip: '面試時能區分 async def vs def 在 FastAPI 中的差異，展示你理解 Python 的 asyncio 執行模型，這是很多候選人搞不清楚的進階知識。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 21-5: 建構 RESTful API — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '21-5': [
    {
      id: 3,
      name: 'HTTP 狀態碼選擇邏輯',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: 'RESTful API 錯誤處理標準',
        narrative: '你在 Amazon 面試中設計一個商品管理 API。面試官要你處理各種錯誤情境，並選擇正確的 HTTP 狀態碼。「選錯狀態碼代表你不理解 HTTP 協議，」面試官說。',
      },
      question: '設計一個 PUT /products/{id} 的更新商品 API，以下四種錯誤情境分別應該回傳什麼狀態碼？\n\n1. 客戶端傳了 JSON 但缺少必填欄位 price\n2. 商品 ID 不存在\n3. 客戶端傳了 price: "abc"（型別錯誤）\n4. 更新時資料庫連線失敗',
      options: [
        { id: 'A', text: '1→400, 2→404, 3→400, 4→500', explanation: '情境 3 中 price: "abc" 是格式/型別驗證錯誤，更準確的是 422（Unprocessable Entity）。' },
        { id: 'B', text: '1→422, 2→404, 3→422, 4→500', explanation: '正確！\n- 422（Unprocessable Entity）：請求格式正確但語意錯誤（缺欄位、型別錯誤）\n- 404（Not Found）：資源不存在\n- 500（Internal Server Error）：伺服器端錯誤（DB 掛了）' },
        { id: 'C', text: '1→400, 2→404, 3→422, 4→503', explanation: '缺少必填欄位也是語意錯誤，應用 422。503 是服務暫時不可用，資料庫錯誤通常用 500。' },
        { id: 'D', text: '1→400, 2→400, 3→400, 4→500', explanation: '商品不存在應該用 404，不是 400。400 是請求格式錯誤，404 是資源不存在。' },
      ],
      correctAnswer: 'B',
      hints: ['400 Bad Request：請求格式/語法錯誤（如 JSON 解析失敗）', '404 Not Found：請求的資源不存在', '422 Unprocessable Entity：請求格式正確但語意/驗證錯誤', '500 Internal Server Error：伺服器端的非預期錯誤'],
      explanation: 'HTTP 狀態碼選擇指南：\n\n**4xx 客戶端錯誤**\n- 400 Bad Request：請求語法錯誤（JSON 格式錯誤、缺少 Content-Type）\n- 401 Unauthorized：未認證（沒登入）\n- 403 Forbidden：已認證但沒權限\n- 404 Not Found：資源不存在\n- 409 Conflict：衝突（如重複建立）\n- 422 Unprocessable Entity：語意錯誤（欄位驗證失敗）\n\n**5xx 伺服器錯誤**\n- 500 Internal Server Error：通用伺服器錯誤\n- 503 Service Unavailable：服務維護中',
      frameworkTip: '面試中設計 API 時，正確選擇 HTTP 狀態碼是展示你理解 REST 規範的關鍵。特別注意 400 vs 422 的區別 — 很多資深工程師都搞混。Amazon 特別重視 API 設計的規範性。',
    },
    {
      id: 4,
      name: 'API 回應格式設計',
      type: 'code',
      difficulty: 'medium',
      sourceTag: 'Amazon Interview',
      scenario: {
        title: '統一 API 回應格式',
        narrative: '你在設計一個 RESTful API，CTO 要求所有 API 回應必須使用統一的格式，包含 success 狀態、data 資料和 error 錯誤訊息。前端工程師才能有一致的處理邏輯。',
      },
      question: '設計一個統一的 API 回應格式函式，支援成功和錯誤兩種情況。\n\n成功回應範例：\n```json\n{"success": true, "data": {"id": 1, "name": "Product"}, "error": null}\n```\n\n錯誤回應範例：\n```json\n{"success": false, "data": null, "error": {"code": "NOT_FOUND", "message": "Product not found"}}\n```',
      starterCode: 'from fastapi.responses import JSONResponse\n\ndef success_response(data, status_code=200):\n    # 回傳統一的成功格式\n    pass\n\ndef error_response(code, message, status_code=400):\n    # 回傳統一的錯誤格式\n    pass\n\n# 使用範例\n@app.get("/products/{product_id}")\ndef get_product(product_id: int):\n    product = db.query(Product).get(product_id)\n    if not product:\n        return error_response("NOT_FOUND", "Product not found", 404)\n    return success_response({"id": product.id, "name": product.name})',
      expectedQuery: 'from fastapi.responses import JSONResponse\n\ndef success_response(data, status_code=200):\n    return JSONResponse(\n        status_code=status_code,\n        content={\n            "success": True,\n            "data": data,\n            "error": None\n        }\n    )\n\ndef error_response(code, message, status_code=400):\n    return JSONResponse(\n        status_code=status_code,\n        content={\n            "success": False,\n            "data": None,\n            "error": {\n                "code": code,\n                "message": message\n            }\n        }\n    )',
      testCases: [
        { input: 'class JSONResponse:\n    def __init__(self, status_code, content): self.status_code = status_code; self.body = content\nr = success_response({"id": 1})\nr.body["success"]' },
        { input: 'class JSONResponse:\n    def __init__(self, status_code, content): self.status_code = status_code; self.body = content\nr = error_response("NOT_FOUND", "Not found", 404)\nr.body["error"]["code"]' },
      ],
      hints: ['用 JSONResponse 可以同時設定 status_code 和 content', '成功時 error 為 null，錯誤時 data 為 null', '錯誤物件包含 code（機器讀）和 message（人讀）'],
      explanation: '統一 API 回應格式的好處：\n\n1. **前端一致處理**：前端只需檢查 success 欄位\n2. **錯誤可機器解析**：error.code 讓前端可以根據錯誤類型做不同處理\n3. **除錯友善**：error.message 提供人類可讀的錯誤描述\n\n```python\n# 前端處理邏輯\nif response.success:\n    render(response.data)\nelse:\n    showError(response.error.message)\n```\n\n這是 Google、Amazon、Stripe 等公司的 API 設計標準做法。',
      frameworkTip: '面試時設計 API，提出統一回應格式會讓面試官知道你有實際專案經驗。特別是 error 物件包含 code 和 message 的設計，展示你考慮到前端和後端的協作需求。Amazon 的 Leadership Principle "Customer Obsession" 就體現在這種為前端（你的客戶）設計友善介面的思維。',
    },
  ],
}
