const world14_en = `
# World 14: Boundaries and Limitations

> **Objective:** Understand what the DI system "can't do" and "deliberately doesn't do," and learn to communicate technical limitations maturely
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 2-3 hours

---

## 14-1: Frontend-Only Startup — Looks Like It Works Does Not Mean It Works

### A Common Mistake

You clone the DI repo, run \`npm run dev\`, and the browser opens — wow, the UI appears! Everything looks normal.

**But you've only started the frontend.** The backend (Supabase, ML API) isn't running at all.

### Looks OK vs Actually Works

| State | Frontend Only | Full Startup |
|------|---------|---------|
| Pages open | Yes | Yes |
| Routes navigate | Yes | Yes |
| Buttons clickable | Yes | Yes |
| Login | Fails (Supabase not connected) | Works |
| Upload data | Fails (Storage not connected) | Works |
| Chat with AI | Fails (ai-proxy not connected) | Works |
| Run forecasts | Fails (ML API not connected) | Works |

### Why Is This Worth Mentioning?

Three reasons:

1. **Embarrassment during demos:** If you only run the frontend for a demo, any feature the customer clicks will show "loading" or errors.
2. **Misleads newcomers:** New developers see the UI and think "it's working," then spend half a day debugging.
3. **Testing blind spot:** Frontend unit tests all pass, but that doesn't mean the entire system works.

### The Correct Approach

Use \`./scripts/healthcheck.sh\` as the true readiness signal. It checks whether all four services (Supabase, ML API, AI Proxy, Frontend) are alive. Only when all four show green is the "system available."

> **Possible interview follow-up:**
> "How would you explain this to a non-technical person?"
> "It's like a car — you sit inside and the steering wheel turns, the buttons press, but the engine isn't running. Everything looks normal, but you step on the gas and nothing happens. Our system is the same: the UI opens, but if the backend isn't started, all data-dependent features won't work. That's why we have an 'engine check light' (healthcheck script) to confirm everything is truly ready."

---

## 14-2: SAP Adapter — Can Connect Does Not Mean Plug-and-Play

### An Adapter Is Not a Turnkey Connector

DI has 5 SAP sync Edge Functions:
- \`sync-materials-from-sap\` — Sync material master data
- \`sync-demand-fg-from-sap\` — Sync finished goods demand
- \`sync-inventory-from-sap\` — Sync inventory
- \`sync-bom-from-sap\` — Sync bill of materials
- \`sync-po-open-lines-from-sap\` — Sync purchase orders

But they are **adapters**, not **turnkey connectors**. What's the difference?

Using a plug analogy:
- **Turnkey Connector** is like a universal adapter — you plug it in and it works, no thinking required.
- **Adapter** means you know the plug's specifications and have the adapter blueprint ready, but you still need to wire it up yourself and test the connection.

### Specifically: What's Done vs What Still Needs Doing

| Already Done | Still Needs To Be Done |
|-------------|-------------|
| Data formats defined (contract locked) | Customer's SAP endpoint URL |
| Schema validation logic written | SAP API authentication setup |
| 25+ contract tests | Network connectivity (VPN / private link) |
| Basic error handling framework | Customer-specific field mappings |
| Writeback payload validation | Customer-side integration testing |

### What "Contract Locked" Means

While it's not plug-and-play, the interface is **stable**:
- \`ADAPTER_PAYLOAD_CONTRACT\` defines the outgoing data format
- \`MUTATION_FIELD_TYPES\` defines the type of each field
- \`validateWritebackPayload()\` performs full schema validation

This means: **integration risk lies in "configuration and connectivity," not in "the interface changing."** You don't need to worry about interface changes breaking the integration.

### How to Communicate This Maturely

Bad: "We don't support SAP."
Also bad: "We fully support SAP."

Good: "We have stable SAP adapters with data contracts and validation logic that are complete and tested. Production integration requires some customer-side configuration work — primarily SAP endpoint, authentication, and field mappings. Our contracts are locked and won't change with version updates."

> **Possible interview follow-up:**
> "If a customer says 'we need real-time sync,' how do you respond?"
> "The current sync adapters use batch synchronization, suitable for running daily or every few hours. Real-time sync requires webhooks or Change Data Capture (CDC), which is outside v1 scope. However, the adapter's contract design is extensible."

---

## 14-3: Optional ML Footprint — Deliberate Minimalism

### Why Is Chronos Excluded?

DI's Dockerfile does **not include** Chronos (a zero-shot time series forecasting model) by default. Chronos requires PyTorch, Transformers, and Accelerate — three large packages.

| | With Chronos | Without Chronos |
|---|-----------|-------------|
| Docker image size | ~3-4 GB | ~800 MB |
| Startup time | Longer (loading PyTorch) | Fast |
| Memory requirements | High (PyTorch is memory-hungry) | Normal |
| Deployment cost | High (needs a larger machine) | Low |
| Available forecasting models | Prophet + LightGBM + Chronos | Prophet + LightGBM |

### This Isn't a "Missing Feature" — It's a "Deliberate Choice"

\`DI_CHRONOS_ENABLED=false\` is a **product decision**, not a bug.

The reasoning:
1. Prophet and LightGBM already cover most forecasting scenarios
2. Chronos's advantage is "no training data needed" (zero-shot), but enterprise customers typically **have** training data
3. The 2+ GB image size savings means faster deployment and lower operational costs

If a customer truly needs Chronos (e.g., forecasting for a brand-new product with no historical data), it can be manually enabled: modify the Dockerfile to remove the filter, set \`DI_CHRONOS_ENABLED=true\`.

### Default Value Design Philosophy

> **Good defaults should work for the most common use cases, not cram everything in.**

This principle applies to all software design:
- Default 2 workers (sufficient without wasting memory)
- Default ortools solver (free and good quality)
- Default no Chronos (lean but sufficient)

> **Possible interview follow-up:**
> "If you were designing a new optional feature, how would you decide whether it's opt-in or opt-out?"
> Consider three factors: 1. **Resource impact** — if it significantly increases image size or memory, make it opt-in. 2. **Usage frequency** — if most users don't need it, opt-in. 3. **Risk** — if it could affect stability, opt-in. Chronos checks all three, so it's opt-in.

---

## 14-4: Execution Guardrails — The System's Safety Valves

### Why Set Limits?

Imagine a user uploads a 50-million-row Excel file and asks the system to run a forecast. Without limits:
- Server memory runs out → entire machine crashes
- All other users' requests get stuck
- The solver runs for an hour with no results

**Execution Guardrails are like an elevator's weight limit** — it doesn't mean the elevator is bad; it's protecting it from overload damage.

### DI's Operational Limits

\`\`\`
DI_MAX_ROWS_PER_SHEET = 2,000,000    # Max 2 million rows per sheet
DI_MAX_SKUS = 5,000                    # Max 5,000 SKUs
DI_SOLVER_MAX_SECONDS = 90             # Max 90 seconds for the solver
DI_BOM_MAX_EDGES = 200,000             # Max 200,000 BOM edges
DI_BOM_MAX_DEPTH = 12                  # Max 12 BOM levels deep
DI_FORECAST_MAX_SERIES = 5,000         # Max 5,000 time series for forecasting
DI_FORECAST_TIMEOUT_SECONDS = 90       # Max 90 seconds for forecasting
DI_JOB_MAX_ATTEMPTS = 3               # Max 3 retries for failed tasks
\`\`\`

### Where Do These Numbers Come From?

They're not arbitrary:
- **2 million rows** — Most enterprises' monthly sales data ranges from tens of thousands to hundreds of thousands of rows. 2 million covers 99% of scenarios.
- **5,000 SKUs** — A typical mid-size manufacturer has a few hundred to a few thousand active items.
- **90-second solving** — OR-Tools solves most scenarios within 30 seconds. 90 seconds provides ample buffer. Exceeding 90 seconds usually means the problem is too large and should be split into batches.
- **3 retries** — Transient errors (network timeouts, resource contention) usually resolve with 1-2 retries. If 3 retries fail, it's usually a real problem that shouldn't keep retrying.

### Why Control via Environment Variables?

Because different customers and environments may need different limits:
- **Development environment:** Set smaller (1,000 SKUs, 30-second timeout) — runs faster
- **Production environment:** Can be set larger, but not unlimited
- **Special customers:** If a customer has 10,000 SKUs, you can adjust without changing code

> **Possible interview follow-up:**
> "What if a customer's data exceeds the limits?"
> Don't hard-reject — suggest batching. For example, 10,000 SKUs can be split into 2 batches of 5,000 each. Or discuss raising the limit with the customer, but assess the impact on memory and CPU. The limits are configurable, not hardcoded.

---

## 14-5: The Design Philosophy of "What Not To Do"

### An Honest List of Environment Dependencies

The DI system depends on four external services. Without them, corresponding features won't work:

| Dependency | What Happens Without It | How to Set Up |
|------|------------|---------|
| **Supabase** | Can't log in, can't store data, can't upload files | Set SUPABASE_URL and ANON_KEY |
| **ML API** | Can't run forecasts or plans | Start Docker container or \`python run_ml_api.py\` |
| **AI Provider Secrets** | Can't use AI analysis features | Set API keys via \`supabase secrets set\` |
| **SQL Migrations** | Tables don't exist; all data operations fail | Run all migrations in order |

### Resolved vs Unresolved Boundaries

**Already resolved (works when set up):**
- Startup process → \`start.sh\` one-command startup + preflight checks
- Health monitoring → \`healthcheck.sh\` + API probes + frontend health panel
- ERP contracts → Locked schema + validation + 25+ tests

**Boundaries that still exist (be upfront with customers/interviewers):**
- Partial startup trap — frontend runs but features are incomplete
- SAP integration — adapter, not a turnkey connector
- Chronos — excluded by default, requires manual enablement
- Real-time sync — currently only batch sync is supported

### Documentation Does Not Equal Features

The DI repo has 50+ documents. But be aware:

- **Documents may describe the target state**, not the current state
- **\`docs/archive/\`** contains historical records, not current features
- **KNOWN_LIMITATIONS.md** is usually the most honest document — it tells you "what doesn't work"

When reading documents, check the date and version number first. A spec document from 2 months ago may no longer match the code.

> **Possible interview follow-up:**
> "What do you think is DI's biggest limitation?"
> A mature answer isn't "no limitations" nor a list of complaints. It's: "Currently the biggest limitation is that ERP integration requires customization work. The contracts and validation are stable, but each customer's SAP environment is different and requires individual configuration. This is a v1 design choice — first ensure the core workflow is stable, then make ERP integration turnkey in v2."

---

## 14-6 (Boss): Communicating Limitations

### Scenario

A prospective customer writes:

> "Our company uses SAP S/4HANA. Can Decision Intelligence connect directly to our SAP system? We'd like real-time sync of inventory and demand data."

### Your Task

Write a professional reply. Your response should:
1. **Honestly state limitations** (not a turnkey connector; currently batch sync, not real-time)
2. **Demonstrate technical maturity** (locked contracts, validation logic, 25+ tests)
3. **Explain the integration work required** (endpoint, credentials, field mappings)
4. **Turn limitations into strengths** (stable contracts = reliable integration foundation)
5. **Provide a path forward** (what integration steps are needed, approximate scope of work)

### Evaluation Criteria

- Is it **honest** (doesn't claim "can connect directly, can sync in real-time")
- Is it **professional** (doesn't just say "no" and stop)
- Does it show **technical depth** (mentions contract, validation, adapter — actual implementation details)
- Does it provide a **path forward** (doesn't leave the customer thinking "forget it, can't use it")
- Is the tone appropriate for **customer communication** (confident but not arrogant)

### Reference Answer Direction

"Thank you for your inquiry. Decision Intelligence does support SAP integration — we have 5 dedicated SAP adapters covering materials, demand, inventory, BOM, and purchase order synchronization.

I'd like to set proper expectations on two points:

First, the current integration method is **batch synchronization** (configurable to run hourly or daily), rather than real-time streaming. Batch sync is sufficient for most supply chain planning scenarios since planning is inherently based on accumulated data.

Second, our SAP integration uses **configurable adapters** rather than plug-and-play connectors. This means some configuration work is needed before going live — primarily your SAP endpoint, API authentication, and field mappings. The good news is that our data contracts are locked and thoroughly tested (25+ automated tests), so integration risk lies in configuration, not in interface stability.

If you're interested, I suggest scheduling a technical discussion to understand your SAP environment details and assess the integration scope. Typically, an engineer familiar with the SAP API needs 1-2 weeks to complete setup and testing."
`

export default world14_en
