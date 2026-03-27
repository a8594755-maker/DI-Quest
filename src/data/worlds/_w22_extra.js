// ── World 22 額外挑戰（Internal Tools Architecture 面試題）──────────────────
// 這些挑戰會被 append 到 World 22 對應的 quest 中

export const w22Extra = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-1: 需求分析與規格書 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '22-1': [
    {
      id: 3,
      name: 'User Story 格式撰寫',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: 'User Story 與驗收標準',
        narrative: '你加入了一間電商公司的內部工具團隊，PM 要求你用 User Story 格式撰寫新功能的需求。你需要理解標準的 User Story 格式以及如何定義有效的 Acceptance Criteria。',
      },
      question: '產品經理想要一個「批次匯出訂單報表」功能。以下哪個 User Story 最符合標準格式且包含有效的驗收標準（Acceptance Criteria）？',
      options: [
        { id: 'A', text: 'As a 營運主管, I want to 批次匯出過去 30 天的訂單報表為 CSV, so that 我可以每週向管理層報告銷售趨勢。\nAC1: 可選擇日期範圍（預設 30 天）\nAC2: 匯出格式支援 CSV 和 Excel\nAC3: 超過 10,000 筆時改用背景處理並 email 通知', explanation: '正確！完整的 As a / I want / So that 格式，清楚說明角色、功能、商業價值。AC 具體可驗證，且考慮了大量資料的 edge case。' },
        { id: 'B', text: '需要一個匯出訂單的功能，要支援 CSV。', explanation: '太簡略，沒有角色、沒有商業價值、沒有驗收標準，無法作為開發依據。' },
        { id: 'C', text: 'As a user, I want to 匯出報表, so that 我需要它。\nAC: 功能正常運作', explanation: '角色太模糊（user 是誰？），商業價值不明確（「我需要它」不是價值），AC 無法驗證。' },
        { id: 'D', text: 'As a 營運主管, I want to 用 React 和 Node.js 做一個匯出按鈕, so that 報表可以下載。\nAC: 用 pandas 處理 CSV', explanation: 'User Story 不應該包含技術實作細節（React、Node.js、pandas），應該聚焦在使用者需求和商業價值。' },
      ],
      correctAnswer: 'A',
      hints: ['User Story 標準格式：As a [角色], I want [功能], so that [商業價值]', 'Acceptance Criteria 必須是具體、可驗證的條件', 'User Story 應該聚焦需求，不包含技術實作'],
      explanation: 'User Story 三要素：\n1. 角色（Who）：具體的使用者角色，不是模糊的 "user"\n2. 功能（What）：使用者想要達成的目標\n3. 價值（Why）：這個功能帶來的商業價值\n\nAcceptance Criteria（驗收標準）的 INVEST 原則：必須是 Independent、Negotiable、Valuable、Estimable、Small、Testable。',
      frameworkTip: '面試時談需求分析，展示你會用 User Story 格式且理解 Acceptance Criteria 的重要性。提到 INVEST 原則會加分，這表示你知道如何拆分出好的 Story。',
    },
    {
      id: 4,
      name: '需求優先級排序（MoSCoW）',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: 'MoSCoW 優先級排序法',
        narrative: '你的團隊正在開發一套內部 CRM 工具，Sprint planning 時有 8 個需求但只有 2 週的開發時間。PM 請你用 MoSCoW 方法來排列優先級，決定哪些功能先做。',
      },
      question: '以下是 4 個需求，哪個分類最合理？\n\n1. 客戶基本資料的 CRUD 功能\n2. 深色模式 UI 主題\n3. 串接 email 自動發送跟進提醒\n4. 匯出客戶清單為 CSV\n\n用 MoSCoW 分類：Must have / Should have / Could have / Won\'t have (this time)',
      options: [
        { id: 'A', text: 'Must: 1（CRUD）, Should: 4（匯出 CSV）, Could: 3（email 提醒）, Won\'t: 2（深色模式）', explanation: '正確！CRUD 是核心功能沒有它系統無法使用（Must）。匯出 CSV 很實用但不阻擋上線（Should）。Email 提醒是加值功能（Could）。深色模式是 nice-to-have，MVP 階段可以先不做（Won\'t this time）。' },
        { id: 'B', text: 'Must: 1, 3, 4, Should: 2', explanation: '把太多功能放在 Must 會導致 scope creep。MoSCoW 的原則是 Must 只放「沒有它系統無法上線」的功能。' },
        { id: 'C', text: 'Must: 2（深色模式）, Should: 1（CRUD）, Could: 3, Won\'t: 4', explanation: '深色模式不是核心功能，CRUD 才是。沒有 CRUD，CRM 系統根本無法使用。' },
        { id: 'D', text: 'Must: 1, 4, Should: 2, 3', explanation: '匯出 CSV 雖然實用但不阻擋上線，不應該是 Must。深色模式更不是 Should 等級。' },
      ],
      correctAnswer: 'A',
      hints: ['Must have = 沒有它系統無法上線', 'Should have = 重要但不阻擋上線', 'Could have = nice-to-have 加值功能', 'Won\'t have = 這次不做，未來再考慮'],
      explanation: 'MoSCoW 方法是需求優先級排序的經典框架：\n- Must have（必須有）：核心功能，缺少就無法上線\n- Should have（應該有）：重要功能，不影響上線但會影響體驗\n- Could have（可以有）：加值功能，有時間就做\n- Won\'t have this time（這次不做）：記錄下來但明確延後\n\n關鍵原則：Must 通常不超過需求總量的 60%。',
      frameworkTip: '面試時被問到「如何決定功能優先級」，提到 MoSCoW 並解釋每個層級的判斷標準。進階回答可以補充 RICE scoring（Reach, Impact, Confidence, Effort）作為量化輔助。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-2: 表單處理 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '22-2': [
    {
      id: 4,
      name: '表單驗證策略：前端 vs 後端',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: '實戰',
      scenario: {
        title: '永遠不要只信任前端驗證',
        narrative: '你在開發一個員工請假系統的表單。Junior 工程師只在前端用 JavaScript 做了輸入驗證（例如檢查日期格式、請假天數上限），認為這樣就夠了。Tech Lead 在 code review 時指出了嚴重的安全問題。',
      },
      question: '為什麼「只在前端做表單驗證」是一個嚴重的安全問題？',
      options: [
        { id: 'A', text: '因為前端驗證可以被完全繞過——使用者可以用 DevTools 修改 JavaScript、用 Postman 直接發 API 請求、或用 curl 繞過瀏覽器。後端必須獨立做驗證。', explanation: '正確！前端驗證只是為了使用者體驗（即時回饋），真正的安全防線必須在後端。任何人都可以繞過前端直接對後端發請求。' },
        { id: 'B', text: '因為前端驗證速度太慢，會影響使用者體驗。', explanation: '前端驗證其實比後端更快（不需要網路請求），所以速度不是問題。' },
        { id: 'C', text: '因為前端驗證不支援正則表達式。', explanation: 'JavaScript 完全支援正則表達式，這不是問題所在。' },
        { id: 'D', text: '因為前端驗證在手機上不起作用。', explanation: '前端 JavaScript 驗證在手機瀏覽器上同樣有效。' },
      ],
      correctAnswer: 'A',
      hints: ['想想看：如果不用瀏覽器，能不能直接對伺服器送請求？', 'Postman、curl 等工具可以繞過所有前端邏輯', '前端驗證的目的是 UX，不是安全'],
      explanation: '表單驗證的黃金原則：前端驗證為了 UX，後端驗證為了安全。\n\n正確做法是「雙重驗證」：\n1. 前端驗證：即時回饋使用者（例如欄位格式錯誤馬上提示）\n2. 後端驗證：安全防線（驗證所有輸入、防止 SQL Injection、XSS 等）\n\n常見攻擊方式：\n- 用 DevTools 修改或刪除前端驗證邏輯\n- 用 Postman / curl 直接發送 API 請求\n- 用 Burp Suite 攔截並修改請求內容',
      frameworkTip: '面試時談到表單處理，務必提到「Never trust the client」原則。說明前端驗證是為了 UX、後端驗證是為了 Security，這會展示你的安全意識，是面試官非常看重的。',
    },
    {
      id: 5,
      name: '輸入清理（Input Sanitization）',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: '實戰',
      scenario: {
        title: '防禦惡意輸入',
        narrative: '你在開發內部工單系統的搜尋功能。使用者輸入搜尋關鍵字後，系統會用這個輸入去查詢資料庫。資安團隊在滲透測試時發現了漏洞。',
      },
      question: '以下哪段程式碼有 SQL Injection 風險？\n\n```python\n# 寫法 A\nquery = f"SELECT * FROM tickets WHERE title LIKE \'%{user_input}%\'"\ncursor.execute(query)\n\n# 寫法 B\nquery = "SELECT * FROM tickets WHERE title LIKE %s"\ncursor.execute(query, (f"%{user_input}%",))\n```',
      options: [
        { id: 'A', text: '寫法 A 有風險，寫法 B 安全。因為寫法 A 直接把使用者輸入拼接到 SQL 字串中，攻擊者可以注入惡意 SQL。寫法 B 使用參數化查詢（Parameterized Query），資料庫會自動轉義特殊字元。', explanation: '正確！參數化查詢是防止 SQL Injection 的標準做法。user_input 如果是 \'; DROP TABLE tickets; -- 就會直接刪除整個資料表。' },
        { id: 'B', text: '兩者都安全，因為都用了 cursor.execute()。', explanation: 'cursor.execute() 本身不保證安全，關鍵是有沒有用參數化查詢。' },
        { id: 'C', text: '兩者都有風險，應該改用 ORM。', explanation: '寫法 B 的參數化查詢已經是安全的。ORM 確實更方便，但參數化查詢本身就能防止 SQL Injection。' },
        { id: 'D', text: '寫法 B 有風險，因為用了 %s 佔位符。', explanation: '%s 在這裡不是字串格式化，而是資料庫驅動的參數佔位符，會被安全地處理。' },
      ],
      correctAnswer: 'A',
      hints: ['f-string 或字串拼接直接把使用者輸入放入 SQL 是非常危險的', '參數化查詢用 %s 或 ? 作為佔位符，由資料庫驅動處理轉義', 'OWASP Top 10 中 Injection 一直是最常見的安全漏洞之一'],
      explanation: 'Input Sanitization 的核心模式：\n\n1. 參數化查詢（Parameterized Query）：防止 SQL Injection\n2. HTML 轉義（Escaping）：防止 XSS（跨站腳本攻擊）\n3. 白名單驗證（Whitelist）：只允許已知安全的輸入格式\n4. 長度限制：防止 Buffer Overflow 和 DoS\n\n記住：永遠不要用字串拼接或 f-string 來組合 SQL 查詢。',
      frameworkTip: '面試時提到 Input Sanitization，說出「參數化查詢」和「OWASP Top 10」會展示你有安全意識。如果能進一步提到 ORM（如 SQLAlchemy、Django ORM）如何自動處理這些問題，會更加分。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-3: 工作流程自動化 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '22-3': [
    {
      id: 5,
      name: '背景任務處理（Async Task Queue）',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Netflix Interview',
      scenario: {
        title: '同步 vs 非同步任務處理',
        narrative: 'Netflix 的內部工具需要每天產出數百份分析報表。當使用者點擊「產出報表」按鈕，系統需要從多個資料來源撈取數據、運算、生成 PDF，整個過程需要 3-5 分鐘。如果用同步處理，使用者會看到瀏覽器一直轉圈。',
      },
      question: '以下哪種架構最適合處理這種「耗時但不需要即時回應」的任務？',
      options: [
        { id: 'A', text: '使用 Celery + Redis 的非同步任務佇列（Task Queue）：API 收到請求後立即回傳 task_id，將任務推入 Redis queue，Celery worker 在背景處理，完成後更新狀態或發送通知。', explanation: '正確！這是業界標準架構。Celery 是 Python 最常用的分散式任務佇列，Redis 作為 Message Broker。使用者不需要等待，可以透過 task_id 查詢進度。' },
        { id: 'B', text: '增加 API server 的 timeout 到 10 分鐘，讓使用者等待同步處理完成。', explanation: '同步等待 3-5 分鐘會造成極差的使用者體驗，且佔用伺服器連線資源，大量請求會導致伺服器崩潰。' },
        { id: 'C', text: '用 JavaScript 的 setTimeout 在前端設定延遲，每隔 1 秒重試請求。', explanation: '前端 setTimeout 不能解決後端的處理時間問題，而且頻繁重試會增加伺服器負擔。' },
        { id: 'D', text: '用 WebSocket 建立長連接，讓伺服器同步處理並透過 WebSocket 回傳結果。', explanation: 'WebSocket 適合即時通訊，但核心問題是處理時間太長佔用伺服器資源。需要把任務移到背景 worker 處理。' },
      ],
      correctAnswer: 'A',
      hints: ['耗時任務應該在背景處理，不要阻塞 API 回應', 'Task Queue 的核心概念：Producer（API）推入任務，Consumer（Worker）取出執行', 'Redis 可以作為 Message Broker（訊息中介）'],
      explanation: 'Celery + Redis 架構：\n\n1. Producer（API Server）：收到請求 → 建立 task → 推入 Redis Queue → 立即回傳 task_id\n2. Message Broker（Redis）：暫存任務，確保任務不遺失\n3. Consumer（Celery Worker）：從 Queue 取出任務 → 執行 → 更新結果\n\n何時用同步 vs 非同步：\n- 同步：回應時間 < 500ms 的操作（讀取資料、簡單計算）\n- 非同步：回應時間 > 幾秒的操作（報表生成、大量 email 發送、影片轉碼）',
      frameworkTip: '面試時被問到「如何處理耗時任務」，說出 Task Queue 架構（Celery + Redis / RabbitMQ）是標準答案。進階回答可以提到 retry 機制、dead letter queue、idempotency（冪等性），這些都是 Netflix 等大公司面試常問的延伸問題。',
    },
    {
      id: 6,
      name: '排程任務（Job Scheduling）',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Netflix Interview',
      scenario: {
        title: '定時排程的工具選擇',
        narrative: '你的團隊需要設定多個定期執行的任務：每天凌晨 2 點同步外部 API 資料、每週一早上 9 點寄出週報 email、每小時檢查一次系統健康狀態。你需要選擇合適的排程方案。',
      },
      question: '在 Python Web 應用中，以下哪種排程方案最可靠且適合生產環境？',
      options: [
        { id: 'A', text: '用 while True + time.sleep() 在主程式中實作定時迴圈', explanation: '這種方式會阻塞主程式，且如果程式崩潰任務就停了，沒有重試機制，完全不適合生產環境。' },
        { id: 'B', text: '用 Celery Beat 搭配 Celery Worker：Celery Beat 負責按排程時間派發任務到 Queue，Worker 負責執行。支援 crontab 語法定義排程。', explanation: '正確！Celery Beat 是 Celery 生態系的排程器，與 Task Queue 無縫整合。支援 crontab 語法、可靠性高、支援分散式部署。' },
        { id: 'C', text: '用 Linux crontab 直接排程 Python 腳本', explanation: 'crontab 可以用，但與應用程式分離，難以管理和監控。且無法享受 Celery 的 retry、logging、監控等功能。適合簡單場景，不適合複雜的生產環境。' },
        { id: 'D', text: '用 JavaScript 的 setInterval 在前端定時觸發 API 呼叫', explanation: '前端排程完全不可靠——使用者關掉瀏覽器任務就停了。排程任務必須在伺服器端執行。' },
      ],
      correctAnswer: 'B',
      hints: ['生產環境的排程需要可靠性、可監控、可重試', 'Celery Beat 是 Celery 的排程元件，與 Task Queue 天然整合', 'crontab 語法：分 時 日 月 週'],
      explanation: 'Job Scheduling 方案比較：\n\n1. Celery Beat：適合 Python Web 應用，與 Task Queue 整合，支援 crontab 語法\n2. Linux Crontab：適合簡單的獨立腳本，輕量但功能有限\n3. APScheduler：Python 的排程庫，適合中小型應用\n4. Airflow：適合複雜的 DAG（有向無環圖）工作流程\n\ncrontab 語法範例：\n- "0 2 * * *"：每天凌晨 2 點\n- "0 9 * * 1"：每週一早上 9 點\n- "0 * * * *"：每小時整點',
      frameworkTip: '面試時聊到排程任務，區分「一次性非同步任務」和「定時排程任務」很重要。一次性用 Celery task，定時用 Celery Beat。如果能提到 crontab 語法，表示你有實際操作經驗。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-4: 內部工具架構 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '22-4': [
    {
      id: 2,
      name: 'Docker Compose 多服務架構',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'System Design',
      scenario: {
        title: 'Docker Compose 多服務協作',
        narrative: '你的團隊要部署一個內部分析平台，包含 React 前端、Flask 後端 API、PostgreSQL 資料庫、Redis 快取。Tech Lead 要求用 Docker Compose 來管理這些服務。',
      },
      question: '以下 docker-compose.yml 設定中，哪個選項正確描述了各服務的角色與它們之間的關係？\n\n```yaml\nservices:\n  frontend:\n    build: ./frontend\n    ports: ["3000:3000"]\n    depends_on: [backend]\n  backend:\n    build: ./backend\n    ports: ["5000:5000"]\n    depends_on: [db, redis]\n    environment:\n      DATABASE_URL: postgresql://db:5432/app\n      REDIS_URL: redis://redis:6379\n  db:\n    image: postgres:15\n    volumes: [pgdata:/var/lib/postgresql/data]\n  redis:\n    image: redis:7-alpine\nvolumes:\n  pgdata:\n```',
      options: [
        { id: 'A', text: '啟動順序是 db, redis → backend → frontend。服務之間用服務名稱（db, redis）作為 hostname 互相通訊。volumes 確保資料庫資料在容器重啟後不遺失。', explanation: '正確！depends_on 定義啟動順序。Docker Compose 自動建立內部網路，服務名稱就是 hostname。Named volume（pgdata）實現資料持久化。' },
        { id: 'B', text: '所有服務同時啟動，depends_on 只是標示關係不影響順序。', explanation: 'depends_on 確實會影響啟動順序，讓依賴的服務先啟動（但不保證服務「ready」）。' },
        { id: 'C', text: '服務之間必須用 IP 位址通訊，不能用服務名稱。', explanation: 'Docker Compose 會自動建立網路，服務名稱會被解析為容器的 IP，所以可以直接用服務名稱作為 hostname。' },
        { id: 'D', text: 'volumes 是用來共享程式碼的，不是持久化資料。', explanation: 'volumes 有多種用途，這裡的 named volume（pgdata）主要是為了資料持久化，確保容器刪除後資料庫資料還在。' },
      ],
      correctAnswer: 'A',
      hints: ['depends_on 定義服務啟動的先後順序', 'Docker Compose 會自動建立內部 DNS，讓服務用名稱互相找到對方', 'Named volume 讓資料在容器生命週期之外持久保存'],
      explanation: 'Docker Compose 核心概念：\n\n1. 服務（Services）：每個服務是一個容器，可以 build 自訂 image 或用現有 image\n2. 網路（Networks）：Compose 自動建立 bridge 網路，服務名 = hostname\n3. 卷（Volumes）：Named volume 實現資料持久化\n4. 依賴（depends_on）：控制啟動順序（注意：不等待服務 ready，只等容器啟動）\n5. 環境變數：透過 environment 注入設定，避免 hardcode\n\n典型的四層架構：Frontend → Backend API → Database + Cache',
      frameworkTip: '面試時被問到 Docker Compose，重點說明你理解「服務編排」的概念：多個容器如何協作、如何通訊、如何持久化資料。提到 depends_on 的限制（只等容器啟動不等 ready）和解法（healthcheck）會展示你有實際使用經驗。',
    },
    {
      id: 3,
      name: 'Microservice vs Monolith',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'System Design',
      scenario: {
        title: '架構選擇的 Trade-off',
        narrative: '你的公司要重建一套內部工具平台，CTO 問你：「應該用微服務架構還是單體架構？」這是系統設計面試中最經典的架構決策題之一。',
      },
      question: '以下關於 Monolith（單體架構）和 Microservice（微服務架構）的描述，哪個最正確？',
      options: [
        { id: 'A', text: '微服務一定比單體好，所有公司都應該採用微服務。', explanation: '這是常見的迷思。微服務增加了大量的營運複雜度（服務發現、分散式追蹤、資料一致性），小團隊用微服務反而會更慢。' },
        { id: 'B', text: '應該從 Monolith 開始，當團隊和系統成長到一定規模後，再逐步拆分成 Microservice。拆分的時機是當 Monolith 的部署衝突、團隊溝通成本、和獨立擴展需求成為瓶頸時。', explanation: '正確！這是 Martin Fowler 提出的 "Monolith First" 策略。先用 Monolith 快速迭代，當出現明確的拆分理由時再逐步遷移。Netflix、Amazon 都是從 Monolith 起步的。' },
        { id: 'C', text: '單體架構已經過時，新專案不應該再用。', explanation: '很多成功的公司仍然在用 Monolith（例如 Shopify 的核心系統）。架構選擇取決於團隊規模和業務需求。' },
        { id: 'D', text: '微服務的主要好處是程式碼更少，更容易理解。', explanation: '微服務的單個服務確實較小，但整個系統的總複雜度更高（分散式系統的挑戰：網路延遲、資料一致性、服務發現等）。' },
      ],
      correctAnswer: 'B',
      hints: ['沒有「最好」的架構，只有「最適合」的架構', '微服務帶來的複雜度：服務發現、分散式追蹤、資料一致性、網路延遲', '考慮團隊規模：5 人團隊用微服務可能過度工程化'],
      explanation: 'Monolith vs Microservice：\n\nMonolith 優點：\n- 開發簡單、部署方便\n- 適合小團隊快速迭代\n- 沒有分散式系統的複雜度\n\nMicroservice 優點：\n- 獨立部署、獨立擴展\n- 團隊自治（每個團隊負責自己的服務）\n- 技術棧靈活（不同服務可用不同語言）\n\n拆分時機：\n- 部署衝突（多個團隊改同一個 codebase）\n- 擴展需求（某個模組需要獨立擴展）\n- 團隊成長到 20+ 人',
      frameworkTip: '面試時聊架構選擇，最重要的是展示「trade-off 思維」而非一味推崇某種架構。提到 "Monolith First" 策略、說明何時拆分、以及微服務帶來的額外複雜度，會讓面試官知道你有深度思考。',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-5: 部署與維運 — 新增 2 題
  // ══════════════════════════════════════════════════════════════════
  '22-5': [
    {
      id: 3,
      name: 'Logging Levels（日誌等級）',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'DEBUG / INFO / WARNING / ERROR / CRITICAL',
        narrative: 'Uber 的內部工具平台每天處理數百萬筆交易。SRE 團隊發現 log 檔案太大（一天超過 500GB），需要重新規劃 logging 策略。你需要理解不同 log level 的用途，才能在生產環境中做出正確的 logging 決策。',
      },
      question: '以下哪個 logging level 分配最合理？\n\n1. 使用者成功登入系統\n2. 資料庫連線池即將耗盡（使用率 85%）\n3. API 請求的詳細參數和回應內容\n4. 支付處理失敗，無法扣款\n5. 整個資料庫叢集無法連線',
      options: [
        { id: 'A', text: '1→INFO, 2→WARNING, 3→DEBUG, 4→ERROR, 5→CRITICAL', explanation: '正確！INFO 記錄正常業務事件，WARNING 是潛在問題的預警，DEBUG 是開發時的詳細資訊，ERROR 是需要處理的錯誤，CRITICAL 是系統級的嚴重故障。' },
        { id: 'B', text: '1→DEBUG, 2→INFO, 3→INFO, 4→WARNING, 5→ERROR', explanation: '使用者登入是正常業務事件（INFO），不是 DEBUG。支付失敗應該是 ERROR 而非 WARNING。資料庫叢集掛掉是 CRITICAL 等級。' },
        { id: 'C', text: '全部用 INFO 就好，這樣最簡單。', explanation: '所有都用同一個 level 會導致無法快速篩選出重要的問題，log 也會非常大。' },
        { id: 'D', text: '1→WARNING, 2→ERROR, 3→INFO, 4→CRITICAL, 5→CRITICAL', explanation: '成功登入是正常事件不是 WARNING。連線池 85% 是預警不是 ERROR。API 詳細參數應該是 DEBUG 而非 INFO（在生產環境會產生太多 log）。' },
      ],
      correctAnswer: 'A',
      hints: ['DEBUG：開發除錯用的詳細資訊，生產環境通常關閉', 'INFO：正常的業務事件（使用者登入、訂單建立）', 'WARNING：潛在問題但系統仍正常運作', 'ERROR：功能失敗但系統整體還在運行', 'CRITICAL：系統級故障，需要立即處理'],
      explanation: 'Python Logging Levels（嚴重程度由低到高）：\n\n1. DEBUG (10)：開發除錯資訊，生產環境關閉\n2. INFO (20)：正常業務事件記錄\n3. WARNING (30)：潛在問題預警，系統仍正常\n4. ERROR (40)：功能層級的錯誤\n5. CRITICAL (50)：系統層級的嚴重故障\n\n生產環境最佳實踐：\n- 設定 level 為 INFO 或 WARNING\n- 使用 Structured Logging（JSON 格式）方便搜尋和分析\n- 搭配 ELK Stack（Elasticsearch + Logstash + Kibana）或 Datadog 做集中式日誌管理',
      frameworkTip: '面試時被問到 logging，說出五個等級的用途並舉例是基本分。進階回答：提到 Structured Logging（用 JSON 格式而非純文字）和集中式日誌管理（ELK / Datadog），展示你理解大規模系統的 observability。',
    },
    {
      id: 4,
      name: '監控指標（Monitoring Metrics）',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'Latency, Error Rate, Throughput',
        narrative: 'Uber 的內部調度系統上線後，SRE 團隊需要設定監控和告警。主管問你：「我們應該監控哪些指標？告警閾值怎麼設？」這是 Uber 面試中經常出現的系統運維問題。',
      },
      question: '以下哪組監控指標和告警策略最適合一個內部 Web 應用？',
      options: [
        { id: 'A', text: '只監控 CPU 和記憶體使用率，超過 80% 就告警。', explanation: '基礎設施指標很重要但不夠。CPU 80% 不一定代表有問題（可能是正常的批次處理），需要搭配應用層指標。' },
        { id: 'B', text: 'RED 方法：Rate（每秒請求數 / 吞吐量）、Errors（錯誤率）、Duration（延遲 / 回應時間）。搭配 P50/P95/P99 百分位數來衡量延遲，而非只看平均值。', explanation: '正確！RED 方法是 Google SRE 推薦的服務監控框架。用百分位數而非平均值，因為平均值會掩蓋長尾問題（例如 1% 的請求需要 10 秒但平均只有 200ms）。' },
        { id: 'C', text: '只監控錯誤率，只要沒有錯誤就表示系統正常。', explanation: '錯誤率為 0 不代表系統正常——可能延遲已經高到無法使用，或吞吐量驟降（可能是上游服務掛了）。' },
        { id: 'D', text: '監控所有可能的指標（100+ 個），全部設定告警。', explanation: '過多的告警會導致 Alert Fatigue（告警疲勞），團隊會開始忽略告警。應該聚焦在最關鍵的指標。' },
      ],
      correctAnswer: 'B',
      hints: ['RED 方法：Rate（速率）、Errors（錯誤）、Duration（延遲）', 'P95 延遲 = 95% 的請求在這個時間內完成', '平均延遲會掩蓋長尾問題'],
      explanation: '監控的 RED 方法（適用於服務端）：\n\n1. Rate（吞吐量）：每秒處理多少請求？驟降可能代表上游出問題\n2. Errors（錯誤率）：多少比例的請求失敗？通常告警閾值設在 1-5%\n3. Duration（延遲）：用百分位數衡量\n   - P50：中位數，代表「一般」使用者的體驗\n   - P95：95% 的請求在此時間內完成\n   - P99：抓出最慢的 1% 請求（長尾問題）\n\n為什麼不用平均值？\n假設 99 個請求是 100ms，1 個請求是 10,000ms\n平均值 = 199ms（看起來正常），但 P99 = 10,000ms（有嚴重問題）\n\n另一個常用框架 USE（適用於基礎設施）：Utilization, Saturation, Errors',
      frameworkTip: '面試時被問到監控，說出 RED 方法（服務端）和 USE 方法（基礎設施）會展示你的 SRE 知識。特別強調「用 P95/P99 而非平均值」來衡量延遲，這是面試官非常喜歡聽到的觀點。提到 Alert Fatigue 的問題也是加分項。',
    },
  ],
}
