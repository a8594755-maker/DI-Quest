const world59_en = `
# World 59: Supply Chain Data Analytics

> **Objective:** Use data to drive supply chain decisions: KPI Dashboards, analytical methods, and AI applications
> **Applicable roles:** Supply Chain Analyst, BI Dashboard design, data interviews
> **Estimated study time:** 4–5 hours

---

## 59-1: Supply Chain KPIs & Dashboards

### The SCOR Model

**SCOR (Supply Chain Operations Reference)** is the world's most widely adopted supply chain performance framework, organized around five core processes:

| Process | Key KPI | Description |
|---------|---------|-------------|
| **Plan** | Forecast Accuracy | How accurate demand forecasts are |
| **Source** | Supplier OTD | Supplier on-time delivery |
| **Make** | Yield Rate | Production quality yield |
| **Deliver** | OTIF | On-Time In-Full delivery |
| **Return** | Return Rate | Rate of returned goods |

**Top-level metrics:**
- Perfect Order Rate
- Cash-to-Cash Cycle Time
- Supply Chain Cost as % of Revenue

### Dashboard Design Principles

**Layered design (Information Architecture):**

| Layer | Audience | Number of KPIs | Content |
|-------|----------|----------------|---------|
| **Executive** | Senior leadership | 5–7 | Red/yellow/green status lights + trends |
| **Operational** | Managers | 10–15 | Drill-down details |
| **Tactical** | Analysts | As needed | Full data exploration |

**Design tips:**
1. **Trends > Numbers** — "Is it getting better or worse?" matters more than "What is the current value?"
2. **Red/Yellow/Green tiers** — Red = immediate action required, Yellow = monitor closely, Green = normal
3. **Context** — Always include Targets and Benchmarks for comparison
4. **5-7 Rule** — No more than 7 KPIs per layer

> **Tools:** Power BI and Tableau are the most widely used dashboard platforms.

### Data-Driven Decision Making

Being data-driven does not mean "only looking at data" — it means "making judgments grounded in data":

\`\`\`
1. Gather quantitative data (historical records, trends, external signals)
2. Layer in qualitative factors (experience, market intelligence, special events)
3. Make the decision and document the rationale
4. Review accuracy after the fact (Forecast Value Added)
\`\`\`

> **Consensus Forecasting:** Use data as the baseline and human judgment for adjustments. But every adjustment should be justified — not just a gut feeling.

---

## 59-2: AI-Driven Supply Chains

### AI Control Tower

Supply Chain Control Towers are the hottest supply chain technology of 2025–2026.

**Three core capabilities:**
1. **Visibility** — End-to-end visibility by integrating ERP + WMS + TMS + external data
2. **Predictive** — Anticipate disruptions and their impact (e.g., detecting an earthquake near a supplier's region)
3. **Prescriptive** — Recommend the best course of action (e.g., which alternative supplier to source from)

**Maturity progression:**
\`\`\`
Reactive (respond after problems occur) → Proactive (anticipate problems)
→ Predictive (quantify impact) → Autonomous (act automatically)
\`\`\`

> 🆕 **2026 keyword: Agentic AI** — Goes beyond recommendations to automatically execute low-risk decisions (e.g., auto-rerouting shipments). BCG data shows Agentic AI accounted for 17% of total AI value in 2025, projected to reach 29% by 2028.

### Digital Supply Chain Twin

**Digital Twin = a virtual replica of your entire supply chain**

It enables simulation of a wide range of what-if scenarios:
- If a Taiwan wafer fab goes offline for 2 weeks, what is the impact?
- If we shift 30% of production capacity from China to Vietnam, how do costs change?
- If ocean freight rates rise 50%, which shipping lanes should we adjust?

**Core value: zero-cost risk simulation.** Test decisions in the virtual world, then act in the real world with confidence.

**Foundation requirements:**
- A unified data layer (ERP + PLM + market intelligence)
- Semantic data model
- Incremental build approach (don't pursue perfection — start, then iterate)

### The Analyst Value Chain

\`\`\`
Data (collect data) → Insight (discover findings)
→ Recommendation (propose action) → Impact Quantification (measure the outcome)
\`\`\`

> **Your competitive edge:** Supply Chain (business knowledge) + Data (analytical skills) + IT (systems understanding) = the most in-demand supply chain talent profile heading into 2030.
`

export default world59_en
