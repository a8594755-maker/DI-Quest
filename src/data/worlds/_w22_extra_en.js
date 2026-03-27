// ── World 22 Extra Challenges (Internal Tools Architecture Interview Questions) ──
// These challenges will be appended to the corresponding quests in World 22

export const w22ExtraEn = {

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-1: Requirements Analysis & Specs — 2 new challenges
  // ══════════════════════════════════════════════════════════════════
  '22-1': [
    {
      id: 3,
      name: 'Writing User Stories',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'User Stories & Acceptance Criteria',
        narrative: 'You just joined the internal tools team at an e-commerce company. The PM asks you to write requirements for a new feature using the User Story format. You need to understand the standard format and how to define effective Acceptance Criteria.',
      },
      question: 'The product manager wants a "batch export order report" feature. Which User Story best follows the standard format and includes valid Acceptance Criteria?',
      options: [
        { id: 'A', text: 'As an Operations Manager, I want to batch export the last 30 days of order reports as CSV, so that I can report weekly sales trends to leadership.\nAC1: Date range is selectable (default 30 days)\nAC2: Export supports CSV and Excel formats\nAC3: Over 10,000 rows triggers background processing with email notification', explanation: 'Correct! Complete As a / I want / So that format with clear role, feature, and business value. ACs are specific, verifiable, and account for edge cases with large datasets.' },
        { id: 'B', text: 'Need an order export feature that supports CSV.', explanation: 'Too brief — no role, no business value, no acceptance criteria. Not actionable for development.' },
        { id: 'C', text: 'As a user, I want to export reports, so that I need it.\nAC: Feature works correctly', explanation: 'Role is too vague (which user?), business value is unclear ("I need it" is not a value), and AC is not verifiable.' },
        { id: 'D', text: 'As an Operations Manager, I want to build an export button with React and Node.js, so that reports can be downloaded.\nAC: Use pandas to process CSV', explanation: 'User Stories should not include technical implementation details (React, Node.js, pandas). They should focus on user needs and business value.' },
      ],
      correctAnswer: 'A',
      hints: ['Standard User Story format: As a [role], I want [feature], so that [business value]', 'Acceptance Criteria must be specific and verifiable conditions', 'User Stories should focus on requirements, not technical implementation'],
      explanation: 'Three elements of a User Story:\n1. Role (Who): A specific user role, not a vague "user"\n2. Feature (What): The goal the user wants to achieve\n3. Value (Why): The business value this feature delivers\n\nAcceptance Criteria follow the INVEST principle: Independent, Negotiable, Valuable, Estimable, Small, Testable.',
      frameworkTip: 'In interviews about requirements analysis, demonstrate you can write proper User Stories and understand the importance of Acceptance Criteria. Mentioning the INVEST principle is a bonus — it shows you know how to break down good Stories.',
    },
    {
      id: 4,
      name: 'Requirement Prioritization (MoSCoW)',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'MoSCoW Prioritization Method',
        narrative: 'Your team is building an internal CRM tool. During sprint planning, there are 8 requirements but only 2 weeks of development time. The PM asks you to prioritize using the MoSCoW method to decide what gets built first.',
      },
      question: 'Here are 4 requirements. Which MoSCoW classification is most reasonable?\n\n1. CRUD operations for customer profiles\n2. Dark mode UI theme\n3. Email integration for automated follow-up reminders\n4. Export customer list as CSV\n\nClassify using: Must have / Should have / Could have / Won\'t have (this time)',
      options: [
        { id: 'A', text: 'Must: 1 (CRUD), Should: 4 (CSV export), Could: 3 (email reminders), Won\'t: 2 (dark mode)', explanation: 'Correct! CRUD is the core functionality — the system cannot function without it (Must). CSV export is useful but does not block launch (Should). Email reminders are a value-add (Could). Dark mode is nice-to-have and can wait for post-MVP (Won\'t this time).' },
        { id: 'B', text: 'Must: 1, 3, 4, Should: 2', explanation: 'Putting too many features in Must leads to scope creep. The MoSCoW principle is that Must only includes features without which the system cannot launch.' },
        { id: 'C', text: 'Must: 2 (dark mode), Should: 1 (CRUD), Could: 3, Won\'t: 4', explanation: 'Dark mode is not a core feature — CRUD is. Without CRUD, the CRM system is completely unusable.' },
        { id: 'D', text: 'Must: 1, 4, Should: 2, 3', explanation: 'CSV export is useful but does not block launch, so it should not be Must. Dark mode is not even Should-level priority.' },
      ],
      correctAnswer: 'A',
      hints: ['Must have = system cannot launch without it', 'Should have = important but does not block launch', 'Could have = nice-to-have value-add feature', 'Won\'t have = not doing this time, consider for future'],
      explanation: 'MoSCoW is a classic requirement prioritization framework:\n- Must have: Core functionality, cannot launch without it\n- Should have: Important features, don\'t block launch but affect experience\n- Could have: Value-add features, build if time permits\n- Won\'t have this time: Documented but explicitly deferred\n\nKey principle: Must typically should not exceed 60% of total requirements.',
      frameworkTip: 'When asked "how do you prioritize features" in interviews, mention MoSCoW and explain each tier\'s criteria. For an advanced answer, supplement with RICE scoring (Reach, Impact, Confidence, Effort) as a quantitative aid.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-2: Form Processing — 2 new challenges
  // ══════════════════════════════════════════════════════════════════
  '22-2': [
    {
      id: 4,
      name: 'Form Validation: Frontend vs Backend',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Practical',
      scenario: {
        title: 'Never Trust Frontend Validation Alone',
        narrative: 'You are building a leave request form for employees. A junior engineer only added JavaScript validation on the frontend (checking date formats, max leave days), thinking that was sufficient. The Tech Lead flagged a serious security issue during code review.',
      },
      question: 'Why is "only doing form validation on the frontend" a serious security problem?',
      options: [
        { id: 'A', text: 'Because frontend validation can be completely bypassed — users can modify JavaScript via DevTools, send API requests directly with Postman, or use curl to bypass the browser entirely. The backend must validate independently.', explanation: 'Correct! Frontend validation is only for user experience (instant feedback). The real security layer must be on the backend. Anyone can bypass the frontend and send requests directly to the backend.' },
        { id: 'B', text: 'Because frontend validation is too slow and hurts user experience.', explanation: 'Frontend validation is actually faster than backend (no network request needed), so speed is not the issue.' },
        { id: 'C', text: 'Because frontend validation does not support regular expressions.', explanation: 'JavaScript fully supports regular expressions — that is not the problem.' },
        { id: 'D', text: 'Because frontend validation does not work on mobile devices.', explanation: 'Frontend JavaScript validation works the same on mobile browsers.' },
      ],
      correctAnswer: 'A',
      hints: ['Think about it: can you send requests to the server without using a browser?', 'Tools like Postman and curl bypass all frontend logic', 'Frontend validation is for UX, not security'],
      explanation: 'The golden rule of form validation: Frontend validation is for UX, backend validation is for security.\n\nThe correct approach is "dual validation":\n1. Frontend validation: Instant user feedback (e.g., field format errors show immediately)\n2. Backend validation: Security layer (validate all inputs, prevent SQL Injection, XSS, etc.)\n\nCommon attack methods:\n- Using DevTools to modify or remove frontend validation logic\n- Using Postman / curl to send API requests directly\n- Using Burp Suite to intercept and modify request content',
      frameworkTip: 'When discussing form processing in interviews, always mention the "Never trust the client" principle. Explaining that frontend validation is for UX while backend validation is for security demonstrates security awareness — something interviewers value highly.',
    },
    {
      id: 5,
      name: 'Input Sanitization Patterns',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Practical',
      scenario: {
        title: 'Defending Against Malicious Input',
        narrative: 'You are building a search feature for an internal ticketing system. When users enter search keywords, the system uses that input to query the database. The security team found a vulnerability during penetration testing.',
      },
      question: 'Which code snippet has a SQL Injection risk?\n\n```python\n# Approach A\nquery = f"SELECT * FROM tickets WHERE title LIKE \'%{user_input}%\'"\ncursor.execute(query)\n\n# Approach B\nquery = "SELECT * FROM tickets WHERE title LIKE %s"\ncursor.execute(query, (f"%{user_input}%",))\n```',
      options: [
        { id: 'A', text: 'Approach A is vulnerable, Approach B is safe. Approach A directly concatenates user input into the SQL string, allowing attackers to inject malicious SQL. Approach B uses parameterized queries, where the database driver automatically escapes special characters.', explanation: 'Correct! Parameterized queries are the standard defense against SQL Injection. If user_input is \'; DROP TABLE tickets; -- it would delete the entire table with Approach A.' },
        { id: 'B', text: 'Both are safe because they both use cursor.execute().', explanation: 'cursor.execute() itself does not guarantee safety — what matters is whether parameterized queries are used.' },
        { id: 'C', text: 'Both are vulnerable — you should use an ORM instead.', explanation: 'Approach B\'s parameterized query is already safe. ORMs are more convenient, but parameterized queries alone can prevent SQL Injection.' },
        { id: 'D', text: 'Approach B is vulnerable because it uses the %s placeholder.', explanation: 'The %s here is not Python string formatting — it is the database driver\'s parameter placeholder, which is processed safely.' },
      ],
      correctAnswer: 'A',
      hints: ['Using f-strings or string concatenation to insert user input into SQL is very dangerous', 'Parameterized queries use %s or ? as placeholders, handled safely by the database driver', 'Injection has consistently been one of the most common vulnerabilities in the OWASP Top 10'],
      explanation: 'Core patterns of Input Sanitization:\n\n1. Parameterized Queries: Prevent SQL Injection\n2. HTML Escaping: Prevent XSS (Cross-Site Scripting)\n3. Whitelist Validation: Only allow known-safe input formats\n4. Length Limits: Prevent Buffer Overflow and DoS\n\nRemember: Never use string concatenation or f-strings to build SQL queries.',
      frameworkTip: 'When discussing Input Sanitization in interviews, mentioning "parameterized queries" and "OWASP Top 10" demonstrates security awareness. Bonus points if you can further explain how ORMs (like SQLAlchemy or Django ORM) handle these issues automatically.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-3: Workflow Automation — 2 new challenges
  // ══════════════════════════════════════════════════════════════════
  '22-3': [
    {
      id: 5,
      name: 'Background Task Processing (Async Task Queue)',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Netflix Interview',
      scenario: {
        title: 'Sync vs Async Task Processing',
        narrative: 'Netflix\'s internal tools need to generate hundreds of analytics reports daily. When a user clicks "Generate Report," the system must pull data from multiple sources, run computations, and create a PDF — a process that takes 3-5 minutes. With synchronous processing, the user would see a loading spinner the entire time.',
      },
      question: 'Which architecture is best suited for handling these "time-consuming but not needing immediate response" tasks?',
      options: [
        { id: 'A', text: 'Use a Celery + Redis async task queue: The API receives the request, immediately returns a task_id, pushes the task to the Redis queue, and a Celery worker processes it in the background. Once complete, it updates the status or sends a notification.', explanation: 'Correct! This is the industry-standard architecture. Celery is Python\'s most popular distributed task queue, with Redis as the Message Broker. Users don\'t need to wait — they can check progress via the task_id.' },
        { id: 'B', text: 'Increase the API server timeout to 10 minutes so users can wait for synchronous processing to complete.', explanation: 'Waiting synchronously for 3-5 minutes creates terrible UX, ties up server connection resources, and would crash the server under heavy load.' },
        { id: 'C', text: 'Use JavaScript setTimeout on the frontend to retry the request every second.', explanation: 'Frontend setTimeout cannot solve the backend processing time problem, and frequent retries increase server load.' },
        { id: 'D', text: 'Use WebSocket for a long-lived connection so the server can process synchronously and return results via WebSocket.', explanation: 'WebSocket is great for real-time communication, but the core problem is that long processing times tie up server resources. The task needs to be moved to a background worker.' },
      ],
      correctAnswer: 'A',
      hints: ['Time-consuming tasks should be processed in the background, not blocking the API response', 'Task Queue core concept: Producer (API) pushes tasks, Consumer (Worker) pulls and executes', 'Redis can serve as a Message Broker'],
      explanation: 'Celery + Redis Architecture:\n\n1. Producer (API Server): Receives request → creates task → pushes to Redis Queue → immediately returns task_id\n2. Message Broker (Redis): Stores tasks temporarily, ensures no tasks are lost\n3. Consumer (Celery Worker): Pulls tasks from Queue → executes → updates results\n\nWhen to use sync vs async:\n- Sync: Operations with response time < 500ms (reading data, simple calculations)\n- Async: Operations with response time > a few seconds (report generation, bulk email sending, video transcoding)',
      frameworkTip: 'When asked "how do you handle time-consuming tasks" in interviews, mentioning the Task Queue architecture (Celery + Redis / RabbitMQ) is the standard answer. Advanced responses can mention retry mechanisms, dead letter queues, and idempotency — topics frequently explored in Netflix and other big tech interviews.',
    },
    {
      id: 6,
      name: 'Job Scheduling',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Netflix Interview',
      scenario: {
        title: 'Choosing the Right Scheduling Tool',
        narrative: 'Your team needs to set up several recurring tasks: sync external API data at 2 AM daily, send weekly report emails every Monday at 9 AM, and check system health every hour. You need to choose the right scheduling solution.',
      },
      question: 'In a Python web application, which scheduling solution is most reliable and production-ready?',
      options: [
        { id: 'A', text: 'Use while True + time.sleep() to implement a timing loop in the main program', explanation: 'This approach blocks the main program, and if the process crashes the tasks stop entirely. No retry mechanism — completely unsuitable for production.' },
        { id: 'B', text: 'Use Celery Beat with Celery Workers: Celery Beat dispatches tasks to the Queue on schedule, Workers execute them. Supports crontab syntax for defining schedules.', explanation: 'Correct! Celery Beat is the scheduler component of the Celery ecosystem, seamlessly integrated with the Task Queue. It supports crontab syntax, is highly reliable, and supports distributed deployment.' },
        { id: 'C', text: 'Use Linux crontab to schedule Python scripts directly', explanation: 'Crontab works but is decoupled from the application, making it harder to manage and monitor. It also lacks Celery\'s retry, logging, and monitoring capabilities. Suitable for simple scenarios but not complex production environments.' },
        { id: 'D', text: 'Use JavaScript setInterval on the frontend to trigger API calls on a timer', explanation: 'Frontend scheduling is completely unreliable — if the user closes the browser, the tasks stop. Scheduled tasks must run on the server side.' },
      ],
      correctAnswer: 'B',
      hints: ['Production scheduling needs reliability, observability, and retry capability', 'Celery Beat is Celery\'s scheduling component, naturally integrated with the Task Queue', 'crontab syntax: minute hour day month weekday'],
      explanation: 'Job Scheduling solutions comparison:\n\n1. Celery Beat: Best for Python web apps, integrated with Task Queue, supports crontab syntax\n2. Linux Crontab: Good for simple standalone scripts, lightweight but limited\n3. APScheduler: Python scheduling library, suitable for small-to-medium apps\n4. Airflow: Best for complex DAG (Directed Acyclic Graph) workflows\n\ncrontab syntax examples:\n- "0 2 * * *": Every day at 2 AM\n- "0 9 * * 1": Every Monday at 9 AM\n- "0 * * * *": Every hour on the hour',
      frameworkTip: 'When discussing scheduled tasks in interviews, it is important to distinguish between "one-off async tasks" and "recurring scheduled tasks." Use Celery tasks for one-off jobs and Celery Beat for scheduled ones. Being able to write crontab syntax shows hands-on experience.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-4: Internal Tool Architecture — 2 new challenges
  // ══════════════════════════════════════════════════════════════════
  '22-4': [
    {
      id: 2,
      name: 'Docker Compose Multi-Service Architecture',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'System Design',
      scenario: {
        title: 'Docker Compose Multi-Service Orchestration',
        narrative: 'Your team is deploying an internal analytics platform consisting of a React frontend, Flask backend API, PostgreSQL database, and Redis cache. The Tech Lead requires Docker Compose to manage all these services.',
      },
      question: 'In the following docker-compose.yml configuration, which option correctly describes each service\'s role and the relationships between them?\n\n```yaml\nservices:\n  frontend:\n    build: ./frontend\n    ports: ["3000:3000"]\n    depends_on: [backend]\n  backend:\n    build: ./backend\n    ports: ["5000:5000"]\n    depends_on: [db, redis]\n    environment:\n      DATABASE_URL: postgresql://db:5432/app\n      REDIS_URL: redis://redis:6379\n  db:\n    image: postgres:15\n    volumes: [pgdata:/var/lib/postgresql/data]\n  redis:\n    image: redis:7-alpine\nvolumes:\n  pgdata:\n```',
      options: [
        { id: 'A', text: 'Startup order is db, redis → backend → frontend. Services communicate using service names (db, redis) as hostnames. Volumes ensure database data persists across container restarts.', explanation: 'Correct! depends_on defines startup order. Docker Compose automatically creates an internal network where service names serve as hostnames. The named volume (pgdata) provides data persistence.' },
        { id: 'B', text: 'All services start simultaneously — depends_on only marks relationships without affecting order.', explanation: 'depends_on does affect startup order, ensuring dependent services start first (though it does not guarantee the service is "ready").' },
        { id: 'C', text: 'Services must communicate using IP addresses — service names cannot be used.', explanation: 'Docker Compose automatically creates a network where service names resolve to container IPs, so you can use service names directly as hostnames.' },
        { id: 'D', text: 'Volumes are for sharing code between containers, not for data persistence.', explanation: 'Volumes have multiple uses. The named volume (pgdata) here is primarily for data persistence, ensuring database data survives container deletion.' },
      ],
      correctAnswer: 'A',
      hints: ['depends_on defines the startup order of services', 'Docker Compose automatically creates internal DNS so services can discover each other by name', 'Named volumes persist data beyond the container lifecycle'],
      explanation: 'Docker Compose core concepts:\n\n1. Services: Each service is a container — can build a custom image or use an existing one\n2. Networks: Compose auto-creates a bridge network where service name = hostname\n3. Volumes: Named volumes provide data persistence\n4. Dependencies (depends_on): Controls startup order (note: waits for container start, not service readiness)\n5. Environment variables: Injected via environment to avoid hardcoding\n\nTypical four-tier architecture: Frontend → Backend API → Database + Cache',
      frameworkTip: 'When asked about Docker Compose in interviews, focus on explaining "service orchestration": how multiple containers collaborate, communicate, and persist data. Mentioning the limitation of depends_on (waits for container start, not readiness) and the solution (healthcheck) shows real-world experience.',
    },
    {
      id: 3,
      name: 'Microservice vs Monolith',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'System Design',
      scenario: {
        title: 'Architecture Trade-offs',
        narrative: 'Your company is rebuilding an internal tools platform. The CTO asks: "Should we use microservices or a monolith?" This is one of the most classic architecture decision questions in system design interviews.',
      },
      question: 'Which statement about Monolith and Microservice architectures is most accurate?',
      options: [
        { id: 'A', text: 'Microservices are always better than monoliths — every company should adopt microservices.', explanation: 'This is a common myth. Microservices add significant operational complexity (service discovery, distributed tracing, data consistency). Small teams using microservices often move slower.' },
        { id: 'B', text: 'Start with a Monolith, then gradually decompose into Microservices as the team and system grow. The right time to split is when deployment conflicts, team communication overhead, and independent scaling needs become bottlenecks.', explanation: 'Correct! This is Martin Fowler\'s "Monolith First" strategy. Start with a Monolith for fast iteration, then migrate incrementally when there are clear reasons to split. Netflix and Amazon both started as monoliths.' },
        { id: 'C', text: 'Monolith architecture is outdated — new projects should never use it.', explanation: 'Many successful companies still use monoliths (e.g., Shopify\'s core system). Architecture choice depends on team size and business needs.' },
        { id: 'D', text: 'The main benefit of microservices is less code, making it easier to understand.', explanation: 'Individual microservices are smaller, but the total system complexity is higher (distributed system challenges: network latency, data consistency, service discovery, etc.).' },
      ],
      correctAnswer: 'B',
      hints: ['There is no "best" architecture — only the "most suitable" one', 'Microservice complexity: service discovery, distributed tracing, data consistency, network latency', 'Consider team size: a 5-person team using microservices may be over-engineering'],
      explanation: 'Monolith vs Microservice:\n\nMonolith advantages:\n- Simple to develop and deploy\n- Great for small teams iterating quickly\n- No distributed system complexity\n\nMicroservice advantages:\n- Independent deployment and scaling\n- Team autonomy (each team owns their service)\n- Technology flexibility (different services can use different languages)\n\nWhen to split:\n- Deployment conflicts (multiple teams modifying the same codebase)\n- Scaling needs (a specific module needs independent scaling)\n- Team grows beyond 20+ people',
      frameworkTip: 'When discussing architecture choices in interviews, the most important thing is demonstrating "trade-off thinking" rather than blindly advocating for one architecture. Mentioning the "Monolith First" strategy, explaining when to split, and describing the additional complexity microservices bring shows depth of thought.',
    },
  ],

  // ══════════════════════════════════════════════════════════════════
  // Quest 22-5: Deployment & Maintenance — 2 new challenges
  // ══════════════════════════════════════════════════════════════════
  '22-5': [
    {
      id: 3,
      name: 'Logging Levels',
      type: 'multiple-choice',
      difficulty: 'medium',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'DEBUG / INFO / WARNING / ERROR / CRITICAL',
        narrative: 'Uber\'s internal tools platform processes millions of transactions daily. The SRE team found that log files are too large (over 500GB per day) and needs to redesign the logging strategy. You need to understand the purpose of different log levels to make correct logging decisions in production.',
      },
      question: 'Which logging level assignment is most appropriate?\n\n1. User successfully logs into the system\n2. Database connection pool nearing exhaustion (85% utilization)\n3. Detailed API request parameters and response content\n4. Payment processing failed — unable to charge\n5. Entire database cluster is unreachable',
      options: [
        { id: 'A', text: '1→INFO, 2→WARNING, 3→DEBUG, 4→ERROR, 5→CRITICAL', explanation: 'Correct! INFO records normal business events, WARNING is an early alert for potential issues, DEBUG is detailed info for development, ERROR is a failure that needs attention, CRITICAL is a system-level severe outage.' },
        { id: 'B', text: '1→DEBUG, 2→INFO, 3→INFO, 4→WARNING, 5→ERROR', explanation: 'User login is a normal business event (INFO), not DEBUG. Payment failure should be ERROR, not WARNING. Database cluster down is CRITICAL level.' },
        { id: 'C', text: 'Use INFO for everything — that is simplest.', explanation: 'Using a single level for everything makes it impossible to quickly filter for critical issues, and logs become massive.' },
        { id: 'D', text: '1→WARNING, 2→ERROR, 3→INFO, 4→CRITICAL, 5→CRITICAL', explanation: 'Successful login is a normal event, not WARNING. Connection pool at 85% is an early warning, not ERROR. Detailed API parameters should be DEBUG, not INFO (too verbose for production).' },
      ],
      correctAnswer: 'A',
      hints: ['DEBUG: Detailed info for development debugging, usually disabled in production', 'INFO: Normal business events (user login, order creation)', 'WARNING: Potential issues but system still functioning', 'ERROR: Feature-level failure but system overall still running', 'CRITICAL: System-level outage requiring immediate action'],
      explanation: 'Python Logging Levels (severity low to high):\n\n1. DEBUG (10): Development debugging info, disabled in production\n2. INFO (20): Normal business event logging\n3. WARNING (30): Potential issue early warnings, system still operational\n4. ERROR (40): Feature-level errors\n5. CRITICAL (50): System-level severe outages\n\nProduction best practices:\n- Set level to INFO or WARNING\n- Use Structured Logging (JSON format) for easier searching and analysis\n- Pair with ELK Stack (Elasticsearch + Logstash + Kibana) or Datadog for centralized log management',
      frameworkTip: 'When asked about logging in interviews, naming all five levels with examples is the baseline. Advanced answer: mention Structured Logging (JSON format instead of plain text) and centralized log management (ELK / Datadog) to demonstrate understanding of observability at scale.',
    },
    {
      id: 4,
      name: 'Monitoring Metrics',
      type: 'multiple-choice',
      difficulty: 'hard',
      sourceTag: 'Uber Interview',
      scenario: {
        title: 'Latency, Error Rate, Throughput',
        narrative: 'After launching Uber\'s internal dispatch system, the SRE team needs to set up monitoring and alerting. Your manager asks: "What metrics should we monitor? How should we set alert thresholds?" This is a common operations question in Uber interviews.',
      },
      question: 'Which set of monitoring metrics and alerting strategy is most appropriate for an internal web application?',
      options: [
        { id: 'A', text: 'Only monitor CPU and memory usage — alert when they exceed 80%.', explanation: 'Infrastructure metrics are important but insufficient. 80% CPU does not necessarily indicate a problem (could be normal batch processing). Application-level metrics are also needed.' },
        { id: 'B', text: 'RED method: Rate (requests per second / throughput), Errors (error rate), Duration (latency / response time). Use P50/P95/P99 percentiles to measure latency instead of just averages.', explanation: 'Correct! The RED method is recommended by Google SRE for service monitoring. Percentiles are preferred over averages because averages mask long-tail issues (e.g., 1% of requests take 10 seconds but the average is only 200ms).' },
        { id: 'C', text: 'Only monitor error rate — as long as there are no errors, the system is healthy.', explanation: 'Zero error rate does not mean the system is healthy — latency could be so high the service is unusable, or throughput may have dropped (possibly due to an upstream failure).' },
        { id: 'D', text: 'Monitor every possible metric (100+) and set alerts on all of them.', explanation: 'Too many alerts cause Alert Fatigue, leading teams to start ignoring alerts. Focus on the most critical metrics.' },
      ],
      correctAnswer: 'B',
      hints: ['RED method: Rate, Errors, Duration', 'P95 latency = 95% of requests complete within this time', 'Average latency masks long-tail problems'],
      explanation: 'The RED method for monitoring (service-level):\n\n1. Rate (throughput): How many requests per second? A sudden drop may indicate upstream issues\n2. Errors (error rate): What percentage of requests fail? Alert thresholds typically set at 1-5%\n3. Duration (latency): Measured using percentiles\n   - P50: Median, represents the "typical" user experience\n   - P95: 95% of requests complete within this time\n   - P99: Catches the slowest 1% of requests (long-tail issues)\n\nWhy not averages?\nIf 99 requests take 100ms and 1 request takes 10,000ms:\nAverage = 199ms (looks fine), but P99 = 10,000ms (serious problem)\n\nAnother useful framework — USE (infrastructure-level): Utilization, Saturation, Errors',
      frameworkTip: 'When asked about monitoring in interviews, mentioning the RED method (service-level) and USE method (infrastructure-level) demonstrates SRE knowledge. Emphasizing "use P95/P99 instead of averages" for latency measurement is a viewpoint interviewers love to hear. Bringing up Alert Fatigue is another bonus point.',
    },
  ],
}
