const world13_en = `
# World 13: ML API Backend Deep Dive

> **Objective:** Understand how the ML API protects itself from misuse, how it handles long-running tasks, and how it monitors system health
> **Related Project:** Decision-Intelligence- (\`src/ml/api/\`)
> **Estimated Study Time:** 3-4 hours

---

## 13-1: JWT Authentication — The Concert Wristband

### Start with a Scenario

You go to a concert. At the entrance, staff verify your ticket and give you a **waterproof wristband**. After that, whether you go to the bathroom, buy a drink, or return to your seat, you just scan the wristband each time — no need to pull out your ticket again.

JWT (JSON Web Token) is that wristband.

### How Does JWT Work in the DI System?

1. **You log in** → Supabase Auth verifies your credentials
2. **Login succeeds** → Supabase issues you a JWT (wristband)
3. **Every subsequent ML API call from your browser** → automatically includes this JWT
4. **ML API receives the request** → first checks if the JWT is authentic (verifies the signature using Supabase's secret); if authentic, it grants access

What information is embedded in the JWT?
- \`sub\` — Who you are (user ID)
- \`role\` — Your role (admin, analyst, viewer)
- \`email\` — Your email

### Why Not Use Sessions?

The traditional approach is "sessions": after you log in, the server remembers your identity, stored in memory or a database. The problems are:

- **ML API is a separate service** from Supabase. If using sessions, the ML API would need to ask Supabase "who is this person?" with every request — an extra network call.
- **JWT is stateless**: the ML API can verify the JWT's authenticity on its own, without asking anyone. Fast, and not dependent on external services.

### Some Paths Don't Require a Wristband

Health check endpoints (\`/healthz\`, \`/readyz\`) don't require JWT. Why? Because they're for monitoring systems, not for users. If health checks also required JWT, the monitoring system would need to log in first — too cumbersome.

During development, you can temporarily disable JWT verification via \`DI_JWT_REQUIRED=false\`. But in production, this **must never be disabled**.

> **Possible interview follow-up:**
> "What are JWT's drawbacks?"
> Once a JWT is issued, it can't be revoked (until it expires). If a user gets suspended, their JWT remains valid until expiration. The solution is to set a short JWT lifespan (e.g., 1 hour), combined with a refresh token mechanism.

---

## 13-2: Multi-Tenancy — The Apartment Building

### What Is Multi-Tenancy?

Imagine an apartment building. Each tenant has their own unit and their own keys. You can't see your neighbor's belongings, and they can't see yours. But you share the same building, the same elevator, and the same management committee.

**Multi-tenancy** means a single system serves multiple companies (tenants), with completely isolated data between them.

### How Does DI Achieve Isolation?

**Layer 1: Request Level**

Every API request carries an \`X-Tenant-ID\` header. The ML API's middleware extracts it at the very beginning and stores it in \`request.state\`. All subsequent database queries automatically include \`WHERE tenant_id = ?\`.

**Layer 2: Database Level**

Supabase uses Row-Level Security (RLS) as a second line of defense. Even if the code has a bug and forgets to add a tenant_id filter, the database itself blocks cross-tenant queries. Like an apartment building that has a main entrance access control in addition to individual door locks — two layers of gates.

**Layer 3: Role Control**

Not everyone in the same company can do the same things. In the code, \`_require_action_role()\` checks whether the actor has permission for a given action:

- **Admin**: Can modify model settings, approve plans
- **Analyst**: Can run forecasts and plans, but can't modify models
- **Viewer**: Can only view results, can't execute any operations

This is called the **Principle of Least Privilege** — each person can only do what they're explicitly permitted to do.

### GovernanceStore — The Rulebook of Who Can Do What

The system has a "governance store" (GovernanceStore) that records all permission rules. Every action requiring permission control is defined as a \`GovernanceAction\`, for example:
- Execute a forecast
- Modify model parameters
- Approve a procurement plan
- Export sensitive data

Every time someone wants to do one of these things, the system checks the GovernanceStore: "Can this role do this?"

> **Possible interview follow-up:**
> "If RLS can already block cross-tenant queries, why also filter by tenant_id at the API layer?"
> Defense in Depth. If you rely on only one layer, a failure in that layer means total exposure. With two layers, an API-layer bug won't leak data (because RLS catches it), and an RLS misconfiguration won't either (because the API layer filters first).

---

## 13-3: Rate Limiting — The Amusement Park Queue

### Why Is Rate Limiting Needed?

Imagine the roller coaster at an amusement park. If there's no queue and no capacity limit, everyone rushes in at once, and either it's overcrowded or the machine breaks.

The ML API is the same. Running a single forecast can take tens of seconds of CPU time. If someone writes a script sending 100 requests per second, the entire API gets overwhelmed and no other users can use it.

### How Does DI Implement Rate Limiting?

**Only limit heavy endpoints:** Not all APIs are rate-limited. Lightweight queries (getting task status, viewing results) aren't limited. Only compute-heavy endpoints are:
- \`/demand-forecast\` — Demand forecasting
- \`/replenishment-plan\` — Procurement planning
- \`/train-model\` — Model training
- \`/backtest\` — Backtesting

**Two implementations, auto-switching:**

| Implementation | When Used | How It Works |
|------|-----------|---------|
| **RedisRateLimiter** | When Redis is available | Uses Redis for distributed counting. Multiple ML API instances share the same counter; rate limiting is global |
| **InProcessRateLimiter** | When Redis is unavailable | Uses in-memory counting. Simple but only limits a single machine |

At startup, the system tries to connect to Redis. If it succeeds, it uses the Redis version; if not, it automatically degrades to the in-memory version. This is called **graceful degradation** — when a dependency is unavailable, instead of crashing, the system continues with a suboptimal alternative.

**Sliding Window Algorithm:**

It doesn't "reset every minute" (which would allow burst requests at minute boundaries). Instead, it truly looks at "how many requests in the past 60 seconds." Fairer and harder to exploit.

### Solver Concurrency Control — Another Kind of Queue

Beyond Rate Limiting, the ML API also has a **Solver Semaphore**:

\`\`\`
DI_SOLVER_MAX_CONCURRENT = 3 (default)
\`\`\`

At most 3 solving tasks can run simultaneously. The 4th request must wait for one of the previous ones to complete.

Why? Because the OR-Tools solver is extremely memory-intensive. If 10 solving tasks run simultaneously, the server could crash from memory exhaustion. 3 is a tested safe value.

> **Possible interview follow-up:**
> "What key is Rate Limiting based on? IP or user?"
> Primarily by user ID from the JWT (if logged in); falls back to IP if there's no JWT. User ID is more precise because people in the same office may share an IP.

---

## 13-4: Async Jobs — Delivery Instead of Dine-In

### Why Is Async Needed?

Back to the restaurant analogy. If you order a dish that takes 3 hours to stew, the waiter can't stand by your table for 3 hours. The normal approach is:

1. You order → the waiter writes it down and gives you a **ticket number**
2. You go about your business (chatting, drinking)
3. When it's ready → the waiter brings it to you

ML computation is the same. A complete planning task (data analysis → forecast → optimization → risk → report) might take several minutes. If you use a synchronous API (you send a request, the server processes it, and only responds when done), the HTTP connection could timeout and the browser might think the system is down.

### DI's Async Design

**Submit task → get a ticket number → periodically check progress → get results**

1. Frontend submits a task → ML API returns a \`run_id\` (ticket number)
2. Task enters the queue; Worker executes in the background
3. Frontend periodically checks the \`run_id\` status (or receives real-time updates via SSE)
4. Once complete, the frontend retrieves results using the \`run_id\`

**Job State Flow:**
\`\`\`
queued → running → succeeded
                → failed
                → canceled
\`\`\`

**Step Pipeline — A Single Task Split into Multiple Steps:**

A complete planning task doesn't run in one shot — it executes multiple steps in order:

\`\`\`
profile → contract → validate → forecast → risk_scan →
bom_explosion → optimize → verify_replay → report
\`\`\`

After each step completes, the result is pushed to the frontend as an artifact. So you don't wait for everything to finish before seeing anything — when the forecast is done, you can already see the forecast chart on the Canvas while the system continues running optimization.

**Two Storage Options:**

| Storage | Scenario | Characteristics |
|------|------|------|
| **PostgresAsyncRunStore** | Production | Persistent; survives restarts |
| **InMemoryAsyncRunStore** | Development/Testing | Fast but lost on restart |

### How Does the Worker Execute Tasks?

The ML API starts an **AsyncRunWorker** (Daemon Thread) in the background at startup:

- Every 2 seconds, it checks the database: "Are there any unclaimed tasks?"
- If yes, it claims one (compare-and-swap to prevent two workers from grabbing the same task)
- Runs up to 3 tasks concurrently (\`DI_SOLVER_MAX_CONCURRENT\`)
- Sends a heartbeat every 5 seconds so the system knows it's alive

If a worker dies (no heartbeat for over 2 minutes), the system releases its claimed tasks for other workers to pick up.

**Protection Mechanisms:**
\`\`\`
DI_MAX_ROWS_PER_SHEET = 2,000,000   # Max 2 million rows per sheet
DI_MAX_SKUS = 5,000                   # Max 5,000 items
DI_SOLVER_MAX_SECONDS = 90            # Max 90 seconds for solving
DI_BOM_MAX_EDGES = 200,000            # Max 200,000 BOM edges
DI_JOB_MAX_ATTEMPTS = 3               # Max 3 retries
\`\`\`

These limits are like an elevator's weight capacity — it's not that the elevator is bad; it's protecting it from being overloaded.

> **Possible interview follow-up:**
> "If a user closes their browser, does the task keep running?"
> Yes. Because the task is executed by the ML API's background worker, which doesn't depend on the browser. The user can close the browser, reopen it, and use the run_id to check the task's latest status. In production, there's also an independent Node.js task worker dedicated to this.

---

## 13-5: Monitoring and Real-Time Push

### Telemetry — The System's Thermometer

How do you know a running system is "healthy"? You can't wait for user complaints. You need **telemetry**.

DI's ML API records telemetry events for every solving run:
- **Which engine was used:** ortools / heuristic
- **How long it took:** 15.3 seconds
- **Result:** success / failure / timeout
- **Optimization objective value:** 42,500 (cost)

These events are stored in the \`solver_telemetry_events\` table. The frontend has an OpsDashboard (\`/ops\`) where you can see:
- Solver timeout rate (if it suddenly spikes, there may be a problem)
- Average solving time (trend over time)
- Failure reason distribution

### SSE (Server-Sent Events) — Real-Time Push

The "periodically check status" approach mentioned earlier is somewhat wasteful. A better approach is **letting the server proactively notify you**.

SSE (Server-Sent Events) does exactly this: the server maintains a connection with your browser and pushes new messages immediately. The difference from WebSocket:

| | SSE | WebSocket |
|---|-----|-----------|
| Direction | One-way (server → browser) | Two-way |
| Complexity | Simple | Complex |
| Firewall traversal | Easy (it's just HTTP) | Sometimes blocked |
| Best for | Server pushes updates for you to view | Two-way conversation |

DI uses SSE to push:
- Agent execution progress ("Running forecast..." "Forecast complete, starting optimization...")
- Step completion notifications
- Errors and warnings

On the frontend, the \`useAgentSSE\` hook subscribes to these events, and the Canvas automatically opens the corresponding widget.

### Prometheus Metrics

If your company has a Grafana monitoring system, the ML API can expose Prometheus-format metrics (via the \`/metrics\` endpoint):
- Request counts and latency
- Error rates
- Currently running tasks

### Sentry — Error Tracking

With the \`SENTRY_DSN\` environment variable configured, the ML API automatically sends unhandled errors to Sentry. This way you don't need to watch logs — Sentry proactively notifies you "there's a new error that occurred 5 times."

> **Possible interview follow-up:**
> "What are the three pillars of Observability? What does DI use for each?"
> **Logs** (structured logging via python-json-logger), **Metrics** (Prometheus, tracking system state), **Traces** (Request ID correlation, tracking a request across services). DI covers all three.

---

## 13-6 (Boss): API Security Architecture Review

### Scenario

Your manager asks:

> "How does Decision Intelligence's ML API protect multi-tenant security? From authentication to authorization to rate limiting, give me a quick security review."

### Your Task

Explain how the following security mechanisms work **in layers** (not independently):

1. **JWT Authentication** — Who are you?
2. **Role Control** — What can you do?
3. **Rate Limiting** — Are you making requests too fast?
4. **Tenant Isolation** — You can only touch your own data
5. **Telemetry** — Everything you do is recorded

### Evaluation Criteria

- Can you explain that these mechanisms are **executed in sequence** (middleware stack order)?
- Do you understand that each mechanism's responsibility doesn't overlap?
- Do you mention graceful degradation (rate limiting fallback when Redis is unavailable)?
- Do you mention defense in depth (API layer + RLS dual protection)?
- Do you mention public path exceptions (health endpoints)?

### Reference Answer Direction

"After a request enters the ML API, it passes through four middleware layers, like clearing four gates:

Gate 1 is **Request ID**: every request gets a unique ID for tracing later.

Gate 2 is **JWT Authentication**: verify who you are. If the JWT is invalid or expired, immediate 401 rejection — it never reaches the next gate. Health check paths are exempt and don't require JWT.

Gate 3 is **Rate Limiting**: verify that your call frequency is within reasonable bounds. If Redis is available, it uses distributed rate limiting (multiple machines share a counter); if not, it degrades to single-machine limiting. Only heavy-computation endpoints are rate-limited.

Gate 4 is **Tenant ID Extraction**: extracts your company ID from the header. All subsequent database queries automatically include this filter. At the database level, RLS provides a second line of defense.

Only after passing all four gates does the request reach the actual business logic (forecasting, planning, etc.). And telemetry data for the entire process (who did what, how long it took, what the result was) is recorded in solver_telemetry_events."
`

export default world13_en
