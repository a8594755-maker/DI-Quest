const world9_en = `
# World 9: Understanding the Digital Worker Product

> **Objective:** After completing this lesson, you should be able to explain in your own words what Decision Intelligence is, how it differs from ChatGPT, and what the core workflow looks like
> **Related Project:** Decision-Intelligence- (Digital Worker Platform)
> **Estimated Study Time:** 3-4 hours

---

## 9-1: Product Positioning — It's Not a Chatbot

### Start with a Scenario

Imagine you are the supply chain manager at a manufacturing company. At the end of every month, you need to:

1. Compile this month's sales data
2. Forecast demand for the next quarter
3. Create a procurement plan based on the forecast (what to buy, how much, from whom)
4. Assess risks (will a supplier be delayed? will raw material prices increase?)
5. Write a report for your supervisor to review
6. Only after your supervisor approves can you actually place purchase orders

This entire process might take an analyst 2-3 days to complete.

Now ask yourself: **If you wanted an AI to help, would you use ChatGPT?**

ChatGPT can answer "what is safety stock" or help you write formulas, but it **cannot**:
- Read your sales data on its own
- Run a forecasting model to calculate next quarter's demand
- Generate a complete procurement plan for you
- Allow your supervisor to review and approve within the system

**Decision Intelligence was designed to solve exactly this problem.** It's not a chatbot where you ask questions and it gives answers. It's a **digital employee** that you can assign tasks to.

### Chatbot vs Digital Worker: What's the Real Difference?

A simple analogy:

- **ChatGPT** is like a very smart **consultant**. You ask questions, it gives answers. But you still do the work yourself.
- **Digital Worker** is like a **new hire**. You assign tasks to it, it completes the work and submits a report. You review and approve before it actually executes.

Specific differences:

| What You Care About | How ChatGPT Does It | How Digital Worker Does It |
|-----------|---------------|---------------------|
| I want to know next quarter's demand | You ask, it gives you an estimate | You assign a task, it reads your data, runs a forecasting model, and produces a complete report |
| I want to create a procurement plan | You ask how to do it, it teaches you the steps | It directly calculates the procurement plan for you; you review and execute with one click |
| How do I know if it's correct? | You judge for yourself | The system records a complete decision trail — you can see the logic behind every step |
| Will it act recklessly? | No permission controls | Autonomy level control (A1-A4); critical operations require your approval |
| Is there a record of what it does? | Just chat history | Full audit trail — who did what, when, and why |

### Technical Positioning of the Product

In one sentence: **Decision Intelligence is a Digital Worker Platform that enables enterprises to deploy manageable, auditable AI digital employees to execute analytics and decision-making workflows.**

More specifically:
- **Product Type:** Digital Worker Platform (not a Chatbot, not a BI tool, not RPA)
- **v1 Focus:** Analytics Digital Worker — specializing in data analysis, demand forecasting, procurement planning, and risk assessment
- **Tech Stack:** React frontend + Supabase backend + FastAPI ML API
- **Core Differentiators:** Task-driven, role-based, with review processes and trust mechanisms

> **Possible interview follow-ups:**
> - "How is it different from RPA?" — RPA follows fixed scripts to repeat predetermined steps; Digital Worker understands intent and makes judgments
> - "How is it different from BI tools?" — BI tools display data for humans to make decisions; Digital Worker analyzes data and proposes recommendations
> - "Why not just use the ChatGPT API?" — Because enterprises need permission controls, audit trails, and review processes, none of which the ChatGPT API provides

---

## 9-2: Core Workflow (Golden Path)

### Walking Through a Story

Mei is a supply chain specialist at an electronic components company. She needs to do demand forecasting and procurement planning every month. She used to spend three days with Excel; now she uses the DI system:

**Step 1: Upload Data**

Mei opens the \`/workspace\` page (this is the single most important page in the entire system — more on this later). She drags this month's sales report (Excel) into the chat panel.

The system automatically begins "reading" the data: this column is the product ID, this one is sales volume, this one is the date... Just like a new employee receiving a report and first figuring out what each column means.

**Step 2: Worker Receives the Task**

Mei types in the chat box: "Forecast Q2 demand and create a procurement plan."

The system doesn't simply pass this sentence to an AI model. It first "understands the intent" — are you asking for a forecast or a plan? In the code, \`chatIntentService.js\` parses Mei's message into a structured command:

\`\`\`
What Mei said → chatIntentService parses → { intent: 'RUN_PLAN', confidence: 0.95 }
\`\`\`

Then the system decomposes the task into a series of steps: analyze data → forecast demand → calculate procurement plan → assess risks → generate report.

**Step 3: Execute the Workflow**

The Worker executes step by step. As each step completes, the Canvas on the right automatically displays results:

- Forecast complete → forecast chart appears (ForecastWidget)
- Plan complete → procurement plan table appears (PlanTableWidget)
- Risk assessment complete → risk warnings appear (RiskWidget)

Mei can see what the Worker is doing and which step it's on. This is not a black box — the logic behind every step is transparent.

**Step 4: Review**

After the Worker finishes, the task enters a "waiting for review" state. Mei's supervisor sees a **Decision Brief** on the \`/employees/review\` page:

- Recommends purchasing 2,150 components across 5 items
- Estimated savings of $42,500
- One high-risk warning: Supplier A's lead time may exceed 30 days

The supervisor can choose: Approve, Request Revision, or Reject.

**Step 5: Approval**

After the supervisor completes the review, they click "Approve" on the \`/employees/approvals\` page. Only then does the system mark the procurement plan as "ready to execute."

Importantly: **Nothing actually happens until approval.** This is the "Human-in-the-Loop" design.

**Step 6: Audit Trail**

At any point afterward, Mei or her supervisor can review the complete history of this task: who initiated it, how the Worker analyzed it, what data was used at each step, and why it made its recommendations. This is the audit trail.

### Six-Step Summary

| Step | What | Where | Plain Explanation |
|------|--------|---------|---------|
| 1. Upload | Upload data | \`/workspace\` | Drag your Excel into the system |
| 2. Assign | Worker receives task | \`/workspace\` chat box | Tell your AI employee what you need done |
| 3. Execute | Forecast + Plan + Risk | \`/workspace\` Canvas | AI employee works away while you watch progress |
| 4. Review | Supervisor examines results | \`/employees/review\` | Supervisor reads the report and confirms everything looks good |
| 5. Approve | Supervisor approves execution | \`/employees/approvals\` | Supervisor signs off; only then can the plan be executed |
| 6. Trace | View historical records | \`/employees/review\` | You can always go back and review the complete process |

> **Why is this workflow so important?**
> When an interviewer asks "how does DI work," don't just recite six step names. Walk through Mei's story, and the interviewer will see that you truly understand the product.

---

## 9-3: Feature Modules — What Can You Do in the System

### Don't Memorize 27 Routes — Just Remember 5 Core Pages

The DI system has many pages, but you only need to understand 5 core ones:

**1. /workspace — Unified Workspace (The Most Important Page)**

This is the system's "living room." Eating, watching TV, chatting — everything happens here. Specifically:
- The left side is the **chat panel**: where you converse with the AI Worker
- The right side is the **Canvas**: Worker outputs (charts, tables, reports) automatically appear here
- You upload data, assign tasks, and view results all in this page

Some legacy routes (like \`/plan\`, \`/chat\`) all redirect to \`/workspace\`. This design is called **route convergence** — consolidating scattered features into a single page to reduce the user's cognitive load. It's like having an open-plan living space instead of separate rooms for the living room, dining room, and study — everything in one place is more convenient.

**2. / — Home Page (Command Center)**

The first screen you see after logging in. It functions as a **dashboard**:
- Your pending tasks
- Recent Worker activity
- Key metrics (KPIs)

**3. /employees — Workers Hub (AI Employee Management)**

Where you manage your AI employees. It has several sub-tabs:
- **Tasks** — Task board: status of all tasks (to-do, in progress, waiting for review, done)
- **Review** — Review page: supervisors view Worker outputs here
- **Workers** — Employee list: create new AI employees, set roles and permissions
- **Config** — Settings: Worker templates, tools, policies

**4. /forecast — Forecast Studio**

A dedicated page for viewing forecast results. Model training, forecast charts, and historical comparisons all live here.

**5. /risk — Risk Center**

Risk dashboard, exception handling, and What-if analysis ("What if the supplier delays by 2 weeks?").

### Other Pages (Good to Know)

- \`/digital-twin\` — Digital Twin (system simulation)
- \`/scenarios\` — Scenario comparison
- \`/insights\` — AI automatically scans data for anomalies and trends
- \`/sandbox\` — Simulated ERP environment for testing
- \`/settings\` — System settings

> **Possible interview follow-up:**
> "Why cram so many features into /workspace? Won't it be too complex?"
> Good question. It's a trade-off. The benefit of convergence is that users don't have to jump between pages; the downside is that a single page becomes complex. DI uses query params to switch sub-features (\`?widget=forecast\`, \`?widget=risk\`), allowing one page to display different content while keeping the URL structure simple.

---

## 9-4: Core Concepts of the Digital Worker

### Autonomy Levels — Managing AI Like Onboarding a New Hire

You just hired a new employee. On their first day, would you let them make decisions on their own? No. You'd supervise their every step, confirming they got it right before letting them continue.

After three months? If they're doing well, you start letting them handle routine matters on their own — only important decisions need your review.

After a year? They're experienced. They handle most things independently, and you just need to glance at the results.

**DI's autonomy levels are the digital version of this concept.** The system defines five levels (A0-A4):

| Level | Plain Explanation | Actual Behavior |
|------|---------|---------|
| **A0 Manual** | Can't do anything on its own | Every action requires human approval |
| **A1 Assisted** | Like an intern | AI proposes suggestions; humans decide whether to act |
| **A2 Supervised** | Like a probationary employee | AI acts first; humans review afterward |
| **A3 Autonomous** | Like a full-time employee | Handles routine work independently; only notifies supervisor for exceptions |
| **A4 Trusted** | Like a senior employee | Fully autonomous; system only logs, never blocks |

### How Does the System Determine the Level?

It's not manually set (though you can manually adjust it). The system automatically suggests a level based on the Worker's historical performance. In the code, \`workerPerformanceService.js\` calculates a metric called **first_pass_acceptance_rate** — the percentage of times the Worker's initial output was approved by the supervisor without requiring changes.

The logic works like this:
- Completed **20+ tasks** with **85%+** first-pass approval rate → suggest upgrading to **A4**
- Completed **10+ tasks** with **70%+** first-pass approval rate → suggest upgrading to **A3**
- Completed **5+ tasks** with **50%+** first-pass approval rate → suggest upgrading to **A2**
- Below 50% → remain at **A1**

This calculation is also **per task type**. The same Worker might be proficient at forecasting (A4) but still learning risk assessment (A2). The system tracks each type separately.

### Trust Doesn't Only Go Up

Supervisors can downgrade at any time. If a Worker starts making mistakes in a particular task type (e.g., recent forecasts have had large deviations), the system lowers its autonomy level. Just like in real life — if an employee's performance declines, the supervisor tightens oversight.

### Approval Policies — What Actions Require Human Approval?

Not all actions carry the same risk. In \`reviewContract.js\`, three types of actions have different approval policies:

| Action | Risk Level | v1 Policy |
|------|---------|----------|
| **Export (export reports)** | Low — only produces a file, doesn't change any system | A2 and above can do it automatically |
| **Notify (send notifications)** | Medium — sends emails to others | A3 and above can do it automatically |
| **Writeback (write to ERP)** | High — actually changes data in the production system | **Always requires human approval**; v1 does not allow auto-execution |

Why does Writeback always require approval? Because it affects real business operations. If the AI automatically placed an incorrect purchase order, it could cause losses of tens of thousands of dollars. So in v1, this gate is locked shut.

> **Possible interview follow-up:**
> "If v2 were to open up automatic approval for Writeback, how would you design it?"
> You could reference the existing threshold mechanism: set monetary thresholds (e.g., auto-approve under $10,000), scope thresholds (e.g., auto-approve under 50 line items), and risk level thresholds (auto-approve low risk). Multiple conditions must be met simultaneously for auto-approval; if any one exceeds the threshold, human approval is required.

---

## 9-5: What Does the Worker Produce? Three Deliverables

When a Worker completes a task, it doesn't just throw a wall of text at you. It produces three structured deliverables:

### 1. Decision Brief — For the Supervisor

This is a one-page summary that lets the supervisor quickly understand:
- **What the recommendation is:** "Recommend purchasing 2,150 components across 5 items, estimated savings of $42,500"
- **Business impact:** Cost changes, service level impact, number of orders affected
- **Risk warnings:** "Supplier A's lead time may exceed 30 days"
- **Confidence level:** 0.82 (82%, meaning the system is fairly confident in this recommendation)
- **Assumptions:** "Assumes demand maintains stable seasonality; lead times remain at current averages"

### 2. Evidence Pack — For Auditing

This is a complete record of "how it was calculated":
- **What data was used:** "Used ds-001 demand history (1,200 records), data cutoff 3/25"
- **What models were used:** "Prophet v1.2 for forecasting, Gurobi 11.0 for optimization"
- **Calculation logic:** "Used a 90-day window for ARIMA forecasting, plus MOQ constraints for solving"
- **Scenario comparison:** "Do nothing → service level 89%, 42 stockouts; follow recommendation → service level 92%, 5 stockouts"

Why is this needed? Because enterprise decisions require traceability. If someone asks three months later "why did we buy so much?", the Evidence Pack is the answer.

### 3. Writeback Payload — For the ERP

If the plan is approved, this document tells the system what to "write" to the ERP (Enterprise Resource Planning system):
- **What operation to perform:** Create a purchase requisition
- **Specific content:** Material MAT-001, quantity 500, delivery date 4/15, Supplier SUPP-A
- **Deduplication mechanism:** Every writeback has an idempotency key to prevent duplicate execution

> **Why three separate deliverables?**
> Because different people look at different things. Supervisors read the Decision Brief (the go/no-go decision), auditors review the Evidence Pack (the record of how it was done), and the system reads the Writeback Payload (what data to change). This is an embodiment of separation of concerns.

---

## 9-6 (Boss): Product Pitch

### Scenario

You're interviewing at a company that builds enterprise SaaS. The interviewer asks:

> "Can you explain in 1-2 minutes what Decision Intelligence is? Assume I'm a non-technical business executive."

### Your Task

Answer this question in clear, concise language. Your answer should include:

1. **What the product is** (one-sentence positioning)
2. **How it differs from typical AI tools** (core differentiator)
3. **Core workflow** (simplified Golden Path)
4. **Why enterprises need it** (value proposition)

### Evaluation Criteria

- Does it clearly distinguish Digital Worker from general AI tools?
- Does it mention task-driven operation, audit trails, trust progression, and other core concepts?
- Can it be explained in non-technical language?
- Does it mention the actual workflow (not just abstract concepts)?

### Reference Answer (Non-Technical Version)

"Decision Intelligence is a **digital employee platform**. In simple terms, it lets an enterprise have an AI employee that handles data analysis and decision planning.

Unlike ChatGPT, it's not about asking questions and getting answers. Instead, you assign tasks — for example, 'forecast next quarter's demand and create a procurement plan.' It reads your data on its own, runs models, calculates the plan, assesses risks, and then submits a report for your review. If you're satisfied, you approve it; if not, you ask it to revise.

What makes it special is the **trust mechanism**. At first, everything it does requires your approval, just like a new hire. As it performs well and you gradually let go, it can handle more and more on its own. But important decisions — like actually placing a purchase order — always require your sign-off.

Why do enterprises need this? Because much of today's analysis work is repetitive: running the same reports every month, making similar forecasts. Let AI handle those so people can focus on judgment and decision-making. And the entire process has complete records, so there's nothing to worry about during an audit."

### Reference Answer (Technical Version, If the Interviewer Wants to Go Deeper)

"Technically, the system uses a four-layer architecture: React frontend for the UI, Supabase for the database and authentication, Edge Functions as the proxy layer for AI models (preventing API key exposure on the frontend), and a FastAPI ML API for forecasting and optimization.

Worker task execution is based on a state machine design: \`todo → in_progress → waiting_review → done\`. Each step produces artifacts (deliverables) that are pushed to the frontend's Canvas widgets via an event bus.

Autonomy levels (A0-A4) are automatically calculated based on the first_pass_acceptance_rate — if the first-submission approval rate exceeds 85% with 20+ completed tasks, the system suggests upgrading to A4. Approval policies are separated by action type: export is more lenient, writeback is the strictest — v1 always requires manual approval."
`

export default world9_en
