const world41_en = `
# World 41: Advanced Execution and Intelligent Routing

> **Objective:** Understand how Workers self-correct, how the system selects AI models, how to detect anomalies at zero cost, and the differences between browser and server execution
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 41-1: Ralph Loop — The Self-Correcting AI Employee

### Regular AI Calls vs Ralph Loop

**A regular AI call** is like ordering food delivery: you place the order, wait for it to arrive, eat. If the dish is wrong, you can only reorder. AI is the same — you call an API once, it gives you a result, and you take what you get.

**Ralph Loop** is different. It's like an actual employee sitting in the office: completes one step → reviews the result → decides it's not good enough and adjusts, then tries again → repeats until satisfied.

In the code (\`ralphLoopAdapter.js\`), the Ralph Loop flow is:

\`\`\`
1. Initialize → create an autonomous agent for the task
2. Agent begins looping:
   a. executeTick(taskId) → advance the task one step
   b. getTaskStatus(taskId) → check progress
   c. Result OK? → markComplete() → stop
   d. Result not OK? → analyze why, adjust strategy, run again
3. Until the task completes or hits a safety limit
\`\`\`

### Three Safety Ropes

What if the AI keeps thinking "not good enough" and loops forever? There are three safety ropes:

**1. Iteration Limit**
\`\`\`
VITE_RALPH_MAX_ITERATIONS = 30 (default)
\`\`\`
If it hasn't finished after 30 iterations, force stop. Prevents infinite loops.

**2. Cost Limit**
\`\`\`
VITE_RALPH_MAX_COST = 5.00 (USD)
\`\`\`
A single task can spend at most $5 in AI call costs. Exceeding it triggers a stop. Prevents bill explosions.

**3. Abort Control (AbortController)**
\`\`\`
abortRalphLoop(taskId)    → stop a specific task
abortAllRalphLoops()      → stop all tasks
\`\`\`
Users or the system can pull the emergency stop at any time.

### When to Use Ralph Loop?

Not every task needs Ralph Loop. Simple queries ("What was last month's revenue?") need just one AI call.

Ralph Loop is for **complex multi-step tasks**:
- "Analyze this data, find problems, propose recommendations, and write a report"
- Such tasks may require: read data → discover anomalies → deep analysis → write report → check report quality → fix formatting
- Each step may need adjustment based on the previous step's results

Ralph Loop is disabled by default (\`VITE_RALPH_LOOP_ENABLED=false\`) because it consumes more resources than single calls.

> **Possible interview follow-up:**
> "How is it different from AutoGPT?"
> The concept is similar, but DI's Ralph Loop has explicit safety limits (cost cap, iteration cap, abort control), and executes within a controlled task framework (with a state machine managing task state) rather than letting AI freely browse the web and do things.

---

## 41-2: Model Routing — Using the Right AI for the Right Job

### Why Can't Every Task Use the Best Model?

The strongest AI models (like Gemini Pro, Claude Opus) are smart but also expensive. If every task uses the strongest model, the bill explodes.

It's like a restaurant not having the head chef chop vegetables — let the apprentice do that; the head chef focuses on the steak.

DI divides AI models into three tiers:

### Three Tiers

| Tier | Plain Explanation | Typical Models | Cost | Best For |
|------|------|---------|------|---------|
| **Tier A** | Head chef | Gemini Pro, Claude Opus, GPT-5.4 | $$$ | Task decomposition, risk assessment, final review |
| **Tier B** | Sous chef | Gemini Flash, Claude Sonnet, DeepSeek Reasoner | $$ | Complex analysis, code generation, reasoning |
| **Tier C** | Apprentice | DeepSeek Chat, Gemini Flash Lite | $ | Summaries, formatting, data cleaning |

### How Does the System Decide Which to Use?

Each task type has a default tier configuration:

\`\`\`
Planning task (planner) → preferred: tier_a, fallback: tier_b
  → Procurement planning needs the strongest reasoning ability

Report generation (report) → preferred: tier_c, fallback: tier_b
  → Writing reports doesn't need top intelligence; cheap is fine

Risk assessment (risk) → preferred: tier_a, fallback: tier_b
  → Risk judgment is critical; can't use the cheapest

Data cleaning (cleaning) → preferred: tier_c, fallback: tier_c
  → Simple format conversion; the cheapest is sufficient
\`\`\`

### Downgrade and Escalation

**Downgrade:** If the tier_a model is too busy or over budget, the system automatically downgrades to tier_b.
**Escalation:** If a task fails or the risk level is high, the system escalates to a higher tier and retries.

\`\`\`
Normal flow: tier_c generates report → success → done
Failure flow: tier_c generates report → fails → escalate to tier_b → success → done
High-risk flow: high risk detected → go directly to tier_a → success → done
\`\`\`

### Multi-Provider Strategy — Don't Put All Eggs in One Basket

DI supports five AI providers: Gemini (Google), DeepSeek, Anthropic (Claude), OpenAI (GPT), and Kimi (Moonshot AI).

Why not use just one?
- **Providers can go down** — If Google's service is out, DeepSeek is still available
- **Different models excel at different things** — DeepSeek Reasoner excels at reasoning, Gemini Flash excels at speed
- **Cost optimization** — Use cheaper providers for cheaper tasks

> **Possible interview follow-up:**
> "How do you track each model's cost?"
> In the model_registry table, each model has cost_per_1k_input and cost_per_1k_output pricing. The system records the token count for each call and calculates the actual cost. Ralph Loop's maxCost limit is also based on this calculation.

---

## 41-3: Signal Radar — Zero-Cost Anomaly Detection

### What Is Signal Radar?

The system automatically scans your data every day, finding anomalies and issues. **Completely without calling any AI models (zero cost)** — purely using statistical rules.

In \`signalRadarEngine.js\`, the system detects four types of anomalies:

### Four Types of Anomaly Detection

**1. Statistical Outliers (Metric Anomalies)**

\`\`\`
Look at each metric's historical rate of change
Calculate mean (mu) and standard deviation (sigma)
If the latest change rate deviates from the mean by more than 2 sigma → alert

Example:
  Past 6 months' revenue month-over-month growth: +3%, +5%, +2%, +4%, +3%, +6%
  Mean = 3.8%, standard deviation = 1.3%
  This month: -15% (deviates by 14.4 standard deviations) → severe anomaly!
\`\`\`

**2. Metric Contradictions**

Certain metrics should move in the same or opposite directions. If they don't, something's wrong:

\`\`\`
Revenue ↑ but gross margin ↓ → Contradiction! (Possibly pushing volume through price cuts)
Inventory ↑ but stockouts also ↑ → Contradiction! (Inventory in the wrong place?)
Costs ↑ but quality ↓ → Contradiction! (Where's the money going?)
\`\`\`

**3. Concentration Risk**

Finding excessive concentration from data and charts:

\`\`\`
"Top 5 customers account for 85% of revenue" → severe concentration risk
  → If one major customer leaves, revenue is cut in half

Pie chart's largest slice is 70%+ → alert
\`\`\`

**4. Stale Insights**

\`\`\`
This analysis was done 30 days ago → alert: data may be outdated
Old vs new analyses of the same issue differ by > 20% → alert: conclusions have changed
\`\`\`

### Why Is It Zero Cost?

Because all detection is local computation: comparing numbers, calculating standard deviations, regex matching text. No AI API calls needed. Each execution completes in milliseconds.

**Signal Radar vs Drift Detection:**
- Drift Detection (World 40) monitors **ML model** health (is the model accurate?)
- Signal Radar monitors **business data** health (is revenue normal? is inventory reasonable?)

> **Possible interview follow-up:**
> "Won't pure rules generate lots of false positives?"
> Yes. That's why Signal Radar has confidence scores. Satisfying both the statistical condition (> 2 sigma) and the absolute condition (> 30% change) gets the highest confidence (0.9). Satisfying only one gets lower confidence (0.6-0.75). The frontend ranks low-confidence signals lower.

---

## 41-4: Browser vs Server Execution

### Default Mode: Browser Execution

By default, Worker tasks run in your browser. The \`orchestrator.js\` tick loop executes in the frontend's JavaScript.

**Advantage:** Simple, no additional server needed.
**Disadvantage:** If you close the browser, the task stops.

### Production Mode: Server Execution

In production, there's an independent **Node.js Task Worker** (\`worker/taskWorker.js\`) running continuously in the background on the server:

\`\`\`
Every 2 seconds: check the database "are there any unclaimed tasks?"
If yes: claim it (compare-and-swap ensures two workers don't grab the same one)
Run up to 3 tasks concurrently
Each task runs a tick loop until complete

Close your browser → task keeps running
Reopen your browser → use run_id to find the latest status
\`\`\`

**Worker Safety Mechanisms:**
- **Heartbeat**: sent every 5 seconds so the system knows it's alive
- **Zombie detection**: if a worker hasn't sent a heartbeat for over 2 minutes → its tasks are released to other workers
- **Graceful shutdown**: on SIGTERM, waits up to 30 seconds for running tasks to complete

**Health check:** The Worker includes its own HTTP server (port 9100) for monitoring systems to check if it's alive.

### Comparing the Two Modes

| | Browser Execution | Server Execution |
|---|----------|----------|
| Close browser | Task stops | Task continues |
| Best for | Demos, development | Production |
| Concurrent tasks | 1 (your browser) | 3 (configurable) |
| Extra deployment needed | No | Yes (run taskWorker.js) |

> **Possible interview follow-up:**
> "Why at most 3 concurrent tasks?"
> Because each task may call the ML API for forecasting and solving, which is CPU and memory intensive. 3 is a tested safe value. Same rationale as the ML API's DI_SOLVER_MAX_CONCURRENT=3.

---

## 41-5: Database Schema and RLS

### Key Tables

DI's Supabase database has 27+ migration files. You don't need to memorize all of them, but you should know the most important tables:

**Worker-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \`ai_employees\` | Worker identity: name, role, status, manager | Worker's "personnel file" |
| \`ai_employee_tasks\` | Tasks: status (todo → in_progress → done), results | Worker's "work log" |
| \`ai_employee_task_memory\` | Cross-conversation memory: keyed by dataset_fingerprint | Worker's "notebook" |

**Model-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \`model_registry\` | AI model registration: provider, tier, cost, context length | AI models' "directory" |
| \`solver_telemetry_events\` | Telemetry for each solve: engine, duration, result | Solver's "health report" |

**Audit-related:**
| Table | What It Stores | Plain Explanation |
|---|--------|------|
| \`di_plan_audit_log\` | Plan audit records: who approved, when, why | Decision "court records" |
| \`analysis_snapshots\` | Analysis snapshots: historical snapshots of time-series data | Data's "periodic photos" |

### RLS — Database-Level Isolation

**Row-Level Security** ensures each user can only see their own company's data.

In plain terms: even if the code has a bug and forgets to add \`WHERE tenant_id = ?\`, the database itself blocks you from seeing others' data.

\`\`\`
-- For example, the ai_employees table's RLS policy:
CREATE POLICY "Users can only see their own workers"
  ON ai_employees
  FOR SELECT
  USING (manager_user_id = auth.uid());

-- Even if you write SELECT * FROM ai_employees (no conditions),
-- the database only returns Workers you manage — you can't see anyone else's.
\`\`\`

### Why Is RLS So Important?

In a multi-tenant system, a single bug could let Company A see Company B's data. That's a **security incident**.

RLS is the **last line of defense**:
- First layer: frontend API calls include tenant_id
- Second layer: API middleware extracts tenant_id and filters queries
- Third layer: **RLS — even if the first two layers both fail, the database itself won't leak data**

> **Possible interview follow-up:**
> "Does RLS affect performance?"
> It does, but the impact is minimal. PostgreSQL's RLS applies filter conditions during query planning, similar to writing WHERE yourself. The important thing is to index the tenant_id column.

---

## 41-6 (Boss): Integration Scenario Question

### Scenario

A Worker receives a task: "Analyze last month's sales data and forecast next quarter's demand."

During execution, the following events occur:
1. Ralph Loop on its 3rd iteration discovers MAPE = 0.28 (threshold 0.15)
2. Signal Radar detects a "revenue ↑ but gross margin ↓" contradiction
3. Model Router downgrades from tier_a to tier_b because the budget is nearly exhausted
4. Drift Monitor shows PSI = 0.31 (threshold 0.2)

### Your Task

1. What problem does each of these four signals represent?
2. Is there a causal relationship between them? (Hint: high PSI may explain high MAPE)
3. What would you recommend? In what order?
4. Will downgrading to tier_b affect result quality? How would you judge?

### Evaluation Criteria

- Can connect signals across four systems (not analyze each independently)
- Finds causality: high PSI → data distribution changed → model predictions worsen → high MAPE
- Handling order: first stop the bleeding (rollback model or upgrade tier) → then investigate root cause (why did PSI increase) → finally fix (retrain model)
- Judgment on downgrade: tier_b may be sufficient for analysis tasks but may compromise quality for forecasting tasks
- Can explain that Signal Radar's contradiction (revenue ↑ gross margin ↓) is likely caused by price-cut promotions and is a separate issue from model degradation
`

export default world41_en
