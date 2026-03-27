const world10_en = `
# World 10: System Architecture Topology

> **Objective:** Understand the DI system's four-layer architecture, why it's layered, and how a request travels from start to finish
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 10-1: Understanding Architecture Through a Single Action

### What Happens Behind the Scenes When You Click "Forecast Q2 Demand"?

Don't think about architecture diagrams yet. Imagine you're a user typing in the DI system's chat box: "Forecast Q2 demand."

From the moment you press Enter to seeing the forecast results, the request passes through **four places**. Using a restaurant analogy:

1. **Frontend (React) = The restaurant seating and menu**
   You're sitting at a table (browser), looking at the menu (UI), and ordering from the server (entering commands).

2. **Supabase = The kitchen's refrigerator and ledger**
   The fridge stores all the ingredients (data in the database). The ledger records all orders (user authentication, task records).

3. **Edge Functions = The waiter**
   You don't walk into the kitchen yourself. The waiter relays your order to the kitchen and brings the finished dish back. Edge Functions work the same way — they're the middleman between frontend and backend, relaying requests on your behalf.

4. **ML API (FastAPI) = The head chef**
   The person who actually cooks. Python forecasting models (Prophet, LightGBM) and optimization solvers (OR-Tools) can only be used in the "kitchen" (Python environment) — they can't be moved to the dining table (browser).

### The Actual Request Flow

Going back to the example — after you press Enter:

\`\`\`
Your browser (frontend)
  → chatIntentService.js parses your message: "This person wants a forecast"
  → Assembles the request, sends it to ML API
  → ML API receives it, calls the Prophet model to run the forecast
  → Forecast results return to the frontend
  → Canvas automatically opens ForecastWidget, displaying the forecast chart
\`\`\`

But if your question requires AI-assisted thinking (e.g., "analyze why last month's sales dropped"), the route is different:

\`\`\`
Your browser (frontend)
  → chatIntentService.js parses: "This person wants AI analysis"
  → Request goes to the Supabase Edge Function ai-proxy
  → ai-proxy calls Gemini/DeepSeek on your behalf (because the API key can't be in the browser)
  → AI response returns to the frontend
  → Displayed in the chat panel
\`\`\`

### Why Can't You Just Use One Server?

You might ask: why four layers? Can't a single program handle everything?

It could, but several problems would arise:

1. **Security:** AI API keys (like GEMINI_API_KEY) cost money. If placed in frontend JavaScript, anyone can open the browser's DevTools and see them. That's like printing your credit card number on the menu.

2. **Technical limitations:** Prophet, OR-Tools — these forecasting and optimization tools are written in Python. Browsers can't run Python. Just like you can't bake a cake in a microwave — different tasks require different tools.

3. **Resource allocation:** ML prediction and solving consume large amounts of CPU and memory. If they share resources with the frontend, one person running a forecast would cause every other user's page to freeze. Separating them allows the frontend and ML API to scale independently.

4. **Deployment flexibility:** Changing a button color on the frontend doesn't require redeploying the entire ML API. Deploy separately — change one part, deploy that part.

> **Possible interview follow-up:**
> "Why not merge Supabase and Edge Functions?"
> Supabase itself is a managed service — you don't manage its servers. Edge Functions are serverless functions provided by Supabase, running on its infrastructure. They're naturally separate. The benefit of Edge Functions is that you don't need to maintain your own Node.js server — just write a function, upload it, and it works.

---

## 10-2: Frontend Service Layer — The Role of a Translator

### Why Does the Frontend Need a Service Layer?

Frontend components (the buttons, tables, and charts you see) shouldn't know API details. Just like a customer doesn't need to know how the kitchen chops vegetables — you just order, and the waiter handles the rest.

The DI frontend's \`src/services/\` directory has 31 subdirectories. You don't need to memorize all of them. What matters is understanding what the Service layer does: **It's the translator between frontend components and backend APIs.**

### Five Most Important Services

**1. chat/ — The translator that listens to you**

When you type anything in the chat box, \`chatIntentService.js\` first analyzes your intent:

- You say "forecast Q2 demand" → it translates to \`{ intent: 'RUN_FORECAST' }\`
- You say "create a procurement plan" → translated to \`{ intent: 'RUN_PLAN' }\`
- You say "good morning" → translated to \`{ intent: 'GREETING' }\` (no need to call an AI model — just reply directly, saving money)

It also has a confidence score. If the score is below 0.7, meaning it's not sure what you want, it will ask you again.

**2. planning/ — The planning engine**

\`chatPlanningService.js\` is the core of procurement planning. It:
- Reads the data you uploaded
- Applies constraints (budget limits, minimum order quantities)
- Calls the ML API's solver for optimization
- Produces plan tables, inventory projections, and cost analyses

**3. aiEmployee/ — The Worker's brain**

\`orchestrator.js\` is the Worker's command center. It manages the task lifecycle:
- Decomposes tasks into steps (profile → forecast → optimize → risk → report)
- Executes step by step
- Checks quality after each step
- Produces artifacts (deliverables) and pushes them to the Canvas

**4. data-prep/ — The data steward**

\`chatDatasetProfilingService.js\` is responsible for "reading" the data you upload:
- Auto-detects column types (numeric, date, text)
- Identifies missing values and outliers
- Suggests column mappings ("Column_A appears to be a product ID")

**5. risk/ — The risk gatekeeper**

\`riskAdjustmentsService.js\` adds risk considerations to plans:
- Supplier reliability scoring
- Safety stock adjustments
- Stockout cost estimation

### Service Layer Design Philosophy

A well-designed Service layer lets components call functionality simply without knowing the complex logic behind it. For example, a component only needs to call \`runForecast(datasetId)\` without knowing that it first validates data, then calls the ML API, then processes the response format.

> **Possible interview follow-up:**
> "Aren't 31 services too many? How do you decide when to split into a new service?"
> This is the "cohesion vs coupling" trade-off. Each service is responsible for a clear domain (forecast, risk, planning), with high internal cohesion. Services minimize dependencies on each other. If a service does too many unrelated things (e.g., forecast service contains risk logic), it should be split out.

---

## 10-3: Supabase Layer — The Refrigerator and Ledger

### What Does Supabase Do in the DI System?

Supabase is a Backend-as-a-Service platform. In plain terms: it handles your backend infrastructure so you don't have to set up your own server. DI uses it for five things:

| Function | Plain Explanation | Analogy |
|------|---------|------|
| **Auth** | Manages user login/logout | Building access card system |
| **PostgreSQL** | Stores all data (sales records, task records, Worker settings) | Refrigerator + filing cabinet |
| **Storage** | Stores user-uploaded files (Excel, CSV) | Storage room |
| **Edge Functions** | Small programs running on Supabase servers | Waiters (detailed below) |
| **RPC** | Remote procedure calls — execute functions in the database | Press a button and the warehouse auto-ships |

### Edge Functions — Why Do We Need a "Middleman"?

Edge Functions are TypeScript programs running on Supabase servers. Their most important role is **acting as a middleman**.

**ai-proxy — The Most Critical Edge Function**

Your browser needs to call Gemini (Google's AI model), but calling Gemini requires an API key. The problem is:

- Frontend JavaScript code is completely public
- If the API key is in the frontend, anyone opening the browser DevTools → Sources can see it
- If someone gets your API key, they can use your money to call Gemini

So DI's approach is: the frontend doesn't call Gemini directly, but instead calls the \`ai-proxy\` Edge Function. ai-proxy runs on Supabase's server, it has the API key (securely stored via \`supabase secrets set\`), it calls Gemini on your behalf, then returns the results to the frontend.

ai-proxy supports multiple AI model providers:
- **Gemini** — Google's model (default advanced model uses gemini-3.1-pro-preview, fast model uses gemini-2.5-flash)
- **DeepSeek** — Open-source large model (includes deepseek-reasoner for reasoning)
- **Anthropic (Claude)** — Anthropic's model
- **OpenAI (GPT)** — OpenAI's model
- **Kimi** — Moonshot AI's model

**Other Edge Functions**

| Function | What It Does | Plain Explanation |
|------|--------|------|
| \`bom-explosion\` | BOM (Bill of Materials) explosion calculation | "Making one chair requires 4 legs + 1 seat + 8 screws" — decomposing a finished product into the quantities of all required parts |
| \`sync-materials-from-sap\` | Sync material data from SAP | Pull the latest material master data from the ERP system |
| \`sync-demand-fg-from-sap\` | Sync demand data from SAP | Pull finished goods sales demand data |
| \`sync-inventory-from-sap\` | Sync inventory data from SAP | Pull current inventory levels |
| \`ai-employee-scheduler\` | Worker task scheduling | Schedule tasks for Workers on a timer |
| \`etl-scheduler\` | Data pipeline scheduling | Run data sync and transformation on a schedule |

### Database Migrations — Moving House in Order

DI's PostgreSQL database has 72+ migration files. What is a migration?

Imagine you're moving into a new house. You wouldn't move all the furniture in at once — you'd do it in order:
1. Sofa first (base schema)
2. Then the dining table (supplier KPI tables)
3. Then install bookshelves (import tracking tables)
4. ...

Each migration is one moving step. They have strict ordering because later ones may depend on earlier ones. For example, the "import tracking table" needs the user table from the "base schema" to set up foreign keys.

If the order is wrong (installing bookshelves before moving the sofa), the database will throw errors (like a bookshelf with no wall to lean against).

> **Possible interview follow-up:**
> "Why use Supabase Edge Functions instead of your own Node.js server?"
> It saves operational overhead. Running your own server means handling scaling, load balancing, SSL certificates, and monitoring. Edge Functions are serverless — you just write code, and Supabase manages the infrastructure. For an early-stage product (v1), this is the right trade-off: spend time on product logic, not on DevOps.

---

## 10-4: ML API — The Head Chef's Kitchen

### Why Do We Need a Standalone ML API?

The ML API is a Python application built with FastAPI, running in a Docker container. Its entry file is \`src/ml/api/main.py\`.

Why not put ML logic in the frontend or Supabase? Three reasons:

1. **Language limitations:** Prophet, LightGBM, OR-Tools are all Python packages. Browsers run JavaScript, Edge Functions run TypeScript/Deno. You can't bake a cake in a microwave — Python tools must run in a Python environment.

2. **Computational demands:** ML prediction and solver computation consume large amounts of CPU and memory. A single solving task might run for 90 seconds. If this computation runs in your browser, your computer's fans will spin wildly and other tabs will freeze.

3. **Deployment flexibility:** When the ML model is updated, you only need to redeploy the ML API Docker container — no need to touch the frontend or Supabase.

### What's Inside the ML API?

**Forecasting Models — More Than One**

DI doesn't rely on a single model for forecasting. It has a "model factory" (ForecasterFactory) supporting multiple models:

| Model | Best For | Plain Explanation |
|------|---------|------|
| **Prophet** | Time series with clear seasonality | Developed by Facebook; excels at capturing cyclical patterns (e.g., Christmas sales spikes) |
| **LightGBM** | Predictions influenced by many external factors | Gradient boosting model that considers many variables (weather, promotions, competitor pricing) |
| **ETS** | Simple, stable time series | Exponential smoothing — like a moving average but smarter |
| **XGBoost** | Similar to LightGBM but more stable | Another gradient boosting model |
| **Chronos** | Zero-shot forecasting (no training needed) | Hugging Face model, but disabled by default because PyTorch is too heavy |

**Solver Engine — Finding the Optimal Solution**

After forecasting demand, you need to calculate the "optimal procurement plan." This is what the optimization solver does: find the lowest-cost plan while satisfying all constraints (budget, minimum order quantities, lead times).

| Engine | Plain Explanation | Availability |
|------|------|--------|
| **heuristic** | Quick estimate, not necessarily optimal | Always available (fallback) |
| **ortools** | Google's optimization toolkit; good quality and fast | Default |
| **gurobi** | Industry's top-tier solver | Requires a commercial license (paid) |
| **cplex** | IBM's solver, on par with Gurobi | Requires a commercial license |

The production environment defaults to \`ortools\` (free and good enough); clients with a Gurobi license can switch.

**Middleware — Security Check Before Entering the Kitchen**

Every request goes through four layers of middleware before reaching the ML API:

1. **JWT Auth** — Verify you're a legitimate user (concert wristband: given at entry, scanned each time you pass through)
2. **Rate Limiting** — Limit call frequency (amusement park queue: don't let too many people ride the roller coaster at once)
3. **Tenant ID** — Confirm which company you belong to (apartment building: make sure you can only enter your own unit)
4. **CORS** — Confirm the request comes from a legitimate website (doorman: only lets residents and registered guests in)

> **Possible interview follow-up:**
> "Why default to ortools instead of heuristic?"
> Heuristic is fast but doesn't necessarily find the optimal solution. ortools uses constraint programming, which can guarantee finding the optimal or near-optimal solution under constraints. For supply chain planning, a 5% optimization gap could mean tens of thousands of dollars in difference.

---

## 10-5: Three Request Flows — A Complete Walkthrough

### Flow 1: AI-Assisted Analysis ("Analyze why sales dropped")

**User story:** Mei types in the chat box: "Analyze why March sales dropped by 15%."

\`\`\`
1. Browser → chatIntentService parses intent
2. Intent is "analyze" → needs AI thinking → calls ai-proxy Edge Function
3. ai-proxy calls Gemini with the API key
4. Gemini analyzes the data and responds
5. Response passes through ai-proxy back to the browser
6. Chat panel displays the analysis results
\`\`\`

**Key point:** The browser never knows Gemini's API key. ai-proxy is the secure middleman.

### Flow 2: Data Upload and Write (Uploading an Excel Report)

**User story:** Mei drags this month's sales report into the workspace.

\`\`\`
1. Browser → file uploaded to Supabase Storage
2. chatDatasetProfilingService reads the file, detects columns
3. Results stored in Supabase PostgreSQL (dataset_profiles table)
4. Import history recorded in import_batches table (audit trail)
5. Frontend displays "Upload complete — detected 12 columns, 3,500 records"
\`\`\`

**Key point:** Data writes require transactionality (all succeed or all fail) and an audit trail, so they go through Supabase.

### Flow 3: Forecasting and Optimization ("Create a procurement plan for me")

**User story:** Mei types in the chat box: "Use this data to create a Q2 procurement plan with a budget cap of 1 million."

\`\`\`
1. Browser → chatIntentService parses: RUN_PLAN
2. chatPlanningService reads data from Supabase
3. Request sent to ML API
4. ML API's orchestrator begins executing steps:
   a. Data validation (confirm correct format)
   b. Demand forecasting (Prophet runs time series)
   c. Optimization solving (ortools calculates the procurement plan)
   d. Risk assessment (supplier scoring, stockout risk)
   e. Report generation (Decision Brief + Evidence Pack)
5. Each step's results return to the frontend → Canvas automatically opens the corresponding Widget
6. Task enters "waiting for review" state
\`\`\`

**Key point:** This is the most complex flow, involving all four architecture layers. ML computation can't happen in the browser, so it must go to the ML API.

### Why Distinguish Three Flows?

Different operations have different requirements:

| Requirement | Flow 1 (AI Analysis) | Flow 2 (Data Write) | Flow 3 (Forecast/Solve) |
|------|-----------------|-----------------|-----------------|
| Needs API key? | Yes (AI model) | No | No (ML API has its own) |
| Needs Python? | No | No | Yes (Prophet, ortools) |
| Needs transactionality? | No | Yes (all-or-nothing) | Yes |
| Time required? | A few seconds | A few seconds | Possibly tens of seconds to minutes |

> **Possible interview follow-up:**
> "If the ML API goes down, can other features still work?"
> Yes. Chat and AI analysis use Flow 1 (doesn't go through ML API), data upload uses Flow 2 (also doesn't go through ML API). Only forecasting and planning features are affected. This is the benefit of a layered architecture — one layer going down doesn't take down the entire system.

---

## 10-6 (Boss): Draw the Architecture

### Scenario

The interviewer asks:

> "Can you draw the Decision Intelligence system architecture? It doesn't need to be fancy — whiteboard level is fine. Then explain each layer's responsibilities."

### Your Task

1. Describe the overall architecture topology (you can describe it in words, as if drawing on a whiteboard)
2. Explain each layer's responsibilities
3. Name 2 specific files or modules per layer and explain their roles
4. Explain at least one of the three main request flows

### Evaluation Criteria

- Correctly describes the four-layer architecture
- Can name specific module names (not just abstract concepts)
- Understands why layers are separated (can articulate the trade-offs)
- Can trace at least one complete request flow

### A Good Whiteboard Answer Looks Like This

"I'll draw four boxes. At the top is the React frontend, where users interact. It has two important parts: chatIntentService, which translates natural language into system commands, and Canvas, which displays Worker outputs in real time.

In the middle there are two boxes. One is Supabase, managing the database, user authentication, and file storage. The other is Edge Functions — the most important being ai-proxy, the secure middleman for frontend AI model calls. API keys are stored only here; the browser never touches them.

At the bottom is the FastAPI ML API, running in a Docker container. It handles demand forecasting (using Prophet) and procurement plan optimization (using ortools). These are Python tools that can only run in a Python environment.

Why four layers? Three reasons: Security — API keys can't be exposed in the frontend; Technical limitations — Python tools can't run in the browser; Scalability — ML computation is resource-intensive and needs to scale independently.

For request flow, take forecasting as an example: user types in the chat box → chatIntentService parses the intent → calls ML API → Prophet runs the forecast → results return → Canvas automatically opens the chart. For AI analysis, it goes through ai-proxy → Gemini. The two paths are separate — if the ML API goes down, AI analysis is unaffected."
`

export default world10_en
