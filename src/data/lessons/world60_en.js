const world60_en = `
# World 60: Process Improvement & Operations Management

> **Goal:** From Process Mapping to Lean/Six Sigma — learn to identify problems and improve processes
> **Use cases:** Operations, Process Improvement, interview questions like "How do you improve a process?"
> **Estimated study time:** 4–5 hours

---

## 60-1: Process Analysis Tools

### Process Mapping

The first step to improvement: **map out the process.**

After drawing each step, label it with one of three types:
- **VA (Value-Added)** — activities the customer is willing to pay for (e.g., assembling a product)
- **BNVA (Business Non-Value-Added)** — no added value but necessary (e.g., quality inspection)
- **NVA (Non-Value-Added)** — pure waste (e.g., waiting 3 hours for approval)

> **Surprising fact:** In a typical process, actual value-added time usually accounts for only **5–10%** of total time. The rest is waiting, transport, and rework.

**Value Stream Mapping (VSM):** An advanced version of process mapping that clearly shows the time, wait time, and inventory at each step — making waste immediately visible.

### Root Cause Analysis

#### 5 Whys

Ask "Why?" five times to trace from symptom to root cause:

\`\`\`
Problem: Rising shipment error rate
Why 1: Pickers are grabbing the wrong items ← symptom
Why 2: Two new products have very similar packaging
Why 3: Warehouse identification needs were not considered during design
Why 4: The packaging design process did not include the warehouse team
Why 5: The company has no cross-functional design review process ← root cause!
\`\`\`

> **Principle:** The root cause is usually a process or system issue, not a people issue. "Pickers aren't paying attention" is not a root cause.

#### Fishbone Diagram

Analyze potential causes across 6 dimensions: **Man / Machine / Method / Material / Measurement / Environment**

#### Pareto Chart

Use the 80/20 rule to identify the most significant causes — typically 20% of causes are responsible for 80% of problems.

### The 7 Wastes of Lean (TIMWOOD)

| Waste | Full Name | Example | How to Eliminate |
|-------|-----------|---------|-----------------|
| **T** Transport | Transport | Unnecessary movement routes | Improve layout |
| **I** Inventory | Inventory | Backlog of unprocessed returns | JIT, Kanban |
| **M** Motion | Motion | Pickers repeatedly walking the same route | Batch Picking |
| **W** Waiting | Waiting | Waiting 3 hours for approval | Automated approval rules |
| **O** Over-production | Over-production | Producing more than ordered | Pull system |
| **O** Over-processing | Over-processing | Inspecting twice redundantly | Consolidate checkpoints |
| **D** Defects | Defects | Defective items requiring rework | Poka-Yoke error-proofing |

> Some add **S = Skills waste** (underutilizing talent), making it **TIMWOODS**.

---

## 60-2: KPI Design & Continuous Improvement

### Designing SMART KPIs

Good KPIs should follow the SMART criteria:

| Letter | Principle | Bad Example | Good Example |
|--------|-----------|-------------|--------------|
| **S** | Specific | Improve efficiency | Reduce order processing time to 4 hours |
| **M** | Measurable | Improve quality | Reduce defect rate to below 0.5% |
| **A** | Achievable | Zero defects | Reduce from 3% to 1% |
| **R** | Relevant | Track weather | Track OTIF |
| **T** | Time-bound | Improve as soon as possible | Achieve by Q3 |

**6 Elements of a KPI:** What (what to measure) + How (how to calculate) + Target (goal value) + When (deadline) + Who (owner) + Source (data source)

### DMAIC (Six Sigma Improvement Methodology)

\`\`\`
D = Define   (define the problem and objectives)
M = Measure  (collect data to establish a baseline)
A = Analyze  (use data to identify root causes)
I = Improve  (implement improvement solutions)
C = Control  (establish monitoring to sustain gains)
\`\`\`

> **C (Control) is most often neglected** — many projects complete improvements with no follow-up, and problems gradually creep back. Use a Control Chart to monitor continuously.

### Combining Lean and Six Sigma

- **Lean:** Eliminate waste (do the right things)
- **Six Sigma:** Reduce variation (do things right)
- **Combined:** Processes that are both fast and consistent

### Universal Interview Framework

When an interviewer asks: "What would you do in your first 90 days?"

\`\`\`
Days 1–30 (Understand & Measure):
- Break down the problem into its component metrics
- Interview key stakeholders
- Establish a baseline

Days 30–60 (Analyze & Plan):
- Use Pareto to identify the top 3 root causes
- Design improvement solutions
- Quantify expected ROI

Days 60–90 (Execute Quick Wins):
- Start with Quick Wins (low cost, high impact)
- Build a Dashboard to track progress
- Show early results to build credibility
\`\`\`
`

export default world60_en
