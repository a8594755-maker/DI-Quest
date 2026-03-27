const world31_en = `
# World 31: BI Tools and Dashboards

> Data by itself has no value. Data that can "tell a story" does. Dashboards are the core medium through which BAs present insights to stakeholders.

This chapter teaches you how to design impactful dashboards, rather than simply stacking charts together.

---

## 31-1: Dashboard Design Principles

### The Purpose of a Dashboard

\`\`\`
Dashboard ≠ Report

Report: Answers "What happened?" → Retrospective
Dashboard: Answers "How are things right now? What action should be taken?" → Action-oriented
\`\`\`

### Dashboard Classification

| Type | Purpose | Update Frequency | Audience | Example |
|------|---------|-----------------|----------|---------|
| Strategic | Long-term trends, goal tracking | Monthly/Quarterly | C-level | Annual KPI Dashboard |
| Operational | Daily monitoring, real-time status | Real-time/Daily | Operations team | Order Processing Dashboard |
| Analytical | Deep analysis, insight exploration | On demand | Analysts | User Behavior Analysis |
| Tactical | Mid-term tracking, project progress | Weekly | Mid-level managers | Sprint Dashboard |

### Five Core Design Principles

\`\`\`
1. One Dashboard, One Purpose
   ❌ Cramming all KPIs onto one page
   ✅ "This dashboard helps role X make decision Y"

2. The 5-Second Rule
   → Within 5 seconds of seeing the dashboard, you know if things are good or bad
   → Use color and large fonts to highlight key numbers

3. Information Hierarchy
   → Level 1: Most important KPIs (largest, top position)
   → Level 2: Supporting sub-dimensions
   → Level 3: Detail data (interactive drill-down)

4. Reduce Cognitive Load
   → Maximum 7±2 charts
   → Consistent colors and fonts
   → Avoid 3D charts and excessive decoration

5. Design for Action
   → Every metric has a corresponding action implication
   → Include target lines / alert thresholds
   → Anomalies should be obvious at a glance
\`\`\`

### Common Layout Patterns

\`\`\`
Pattern 1: Z-Pattern (Most Common)
┌────────────┬────────────┬────────────┐
│   KPI 1    │   KPI 2    │   KPI 3    │  ← Core numbers
├────────────┴────────────┴────────────┤
│          Main Trend Chart             │  ← Primary chart
├──────────────────┬───────────────────┤
│  Sub-dimension 1  │  Sub-dimension 2  │  ← Supporting
├──────────────────┴───────────────────┤
│              Detail Table             │  ← Details
└──────────────────────────────────────┘

Pattern 2: Focal Point
┌──────────────────────────────────────┐
│           Core Large Number           │
├──────────────────────────────────────┤
│             Trend Chart               │
├────────────┬─────────┬───────────────┤
│ Dimension 1│ Dim. 2  │  Dimension 3  │
└────────────┴─────────┴───────────────┘

Pattern 3: Left Filter, Right Chart
┌─────────┬────────────────────────────┐
│ Filters  │                            │
│ ──────  │       Main Chart Area       │
│ Time     │                            │
│ Region   ├──────────┬─────────────────┤
│ Category │  Chart 2  │     Chart 3     │
│ ...     │          │                 │
└─────────┴──────────┴─────────────────┘
\`\`\`

### Color Principles

\`\`\`
1. Semantic Colors
   - Green = Positive / On target
   - Red = Negative / Warning
   - Yellow = Caution / Approaching threshold
   - Gray = Neutral / Background

2. Brand Color Palette
   - 1-2 primary colors, 2-3 secondary colors
   - Avoid more than 5 colors

3. Data Color Scales
   - Gradient: Represents magnitude (light → dark)
   - Categorical: Represents different categories (distinct from each other)

4. Accessibility Design
   - Don't rely solely on color to convey information
   - Add text labels or patterns
   - Consider colorblind-friendly palettes
\`\`\`

---

## 31-2: KPI Visualization

### KPI Card Design

\`\`\`
A Good KPI Card Contains:
┌─────────────────────────┐
│ Monthly Revenue          │  ← Title
│                          │
│     $2.4M                │  ← Current value (large font)
│     ▲ 12% vs last month  │  ← Change rate (with direction)
│     Target: $2.5M        │  ← Target value
│     ━━━━━━━━━━━━━▓░░     │  ← Progress bar (96%)
└─────────────────────────┘

Elements:
1. Metric name (clear, unambiguous)
2. Current value (largest font)
3. Comparison baseline (vs prior period, vs target, vs budget)
4. Trend direction (up/down arrows)
5. Visual cue (progress bar, Sparkline, RAG color)
\`\`\`

### Common KPIs and Visualization Methods

| KPI | Best Visualization | Description |
|-----|-------------------|-------------|
| Revenue / GMV | KPI Card + Line Chart | Big number + trend |
| Conversion Rate | Funnel Chart | Step-by-step conversion |
| Customer Satisfaction | Gauge Chart | Dashboard-style |
| Market Share | Pie / Donut Chart | Proportion |
| Goal Achievement Rate | Bullet Chart | Actual vs target |
| Department Performance | Horizontal Bar | Ranking comparison |
| Monthly Trend | Line Chart | Time series |
| Category Distribution | Treemap | Hierarchical proportion |

### Bullet Chart

\`\`\`
Best visualization for performance target tracking:

Revenue  ████████████████████▓░░░░░  $2.4M / $2.5M (96%)
Orders   ████████████████████████▓░  4,800 / 5,000 (96%)
NPS      ██████████████████████████  45 / 40 (113%) ✓
Churn    ████████████▓░░░░░░░░░░░░░  4.8% / 3.5% (Warning!)

Components:
- Black bar = Actual value
- Gray zones = Ranges (Poor / Fair / Good)
- Marker line = Target value
\`\`\`

### Sparkline (Mini Trend Chart)

\`\`\`
Small trend charts embedded in KPI Cards or tables.

Revenue: $2.4M  ╱╲╱──╱╲╱╱╲──╱  ▲12%
Orders:  4,800  ──╱╲──╱╲╱──╱╲  ▲8%
AOV:     $500   ╲──╱──╱──╱╲╲─  ▼3%

Use case: Display both current value and trend in limited space
\`\`\`

---

## 31-3: Chart Selection Guide

### Choose Charts Based on "What You Want to Express"

| Purpose | Recommended Chart | Description |
|---------|------------------|-------------|
| Compare values | Bar Chart | Compare values across categories |
| Time trend | Line Chart | Changes over time |
| Composition | Pie / Donut / Stacked Bar | Parts of a whole |
| Correlation | Scatter Plot | Relationship between two variables |
| Distribution | Histogram / Box Plot | Data spread |
| Geographic distribution | Map / Choropleth | Geographic differences |
| Process conversion | Funnel / Sankey | Flow between steps |
| Ranking | Horizontal Bar | Sorted high to low |
| Target tracking | Bullet / Gauge | Actual vs target |
| Hierarchical proportion | Treemap / Sunburst | Multi-level size comparison |

### Chart Do's & Don'ts

\`\`\`
✅ Do:
- Start Y-axis from 0 (Bar Chart)
- Use consistent time intervals
- Label data source and last updated time
- Add data labels directly on the chart (reduce Legend dependency)
- Sort (Bar Chart from largest to smallest)

❌ Don't:
- Use 3D charts (distorts proportions)
- Pie Chart with more than 5 categories
- Dual Y-axis (easily misleading)
- Excessive gridlines and borders
- Use area to represent length (area perception is inaccurate)
- Truncate Y-axis to exaggerate differences
\`\`\`

### Common Mistakes with Examples

\`\`\`
Mistake 1: Pie Chart with 12 categories
→ Fix: Show only Top 5, combine the rest into "Other"

Mistake 2: Bar Chart Y-axis starting at 95%
→ Fix: Start from 0%, or use a Line Chart to emphasize change

Mistake 3: Line Chart used for non-time-series categorical data
→ Fix: Use a Bar Chart instead

Mistake 4: Area chart comparing absolute values
→ Fix: Use a Bar Chart or Stacked Chart

Mistake 5: Rainbow color scheme
→ Fix: Use monochrome gradient or brand colors
\`\`\`

### Chart Selection Decision Tree

\`\`\`
What do you want to express?
├── Comparison
│   ├── Different categories → Bar Chart
│   ├── Over time → Line Chart
│   └── Ranking → Horizontal Bar (sorted)
├── Composition
│   ├── Simple proportion (≤5 categories) → Donut Chart
│   ├── Composition change over time → Stacked Bar / 100% Stacked Bar
│   └── Multi-level → Treemap
├── Trend
│   ├── Single metric → Line Chart
│   ├── Multiple metric comparison → Multi-line Chart
│   └── With range → Area Chart
├── Correlation
│   ├── Two variables → Scatter Plot
│   └── Three variables → Bubble Chart
└── Distribution
    ├── Single variable → Histogram
    └── Multiple group comparison → Box Plot
\`\`\`

---

## 31-4: Data Storytelling

### Three Elements of Data Storytelling

\`\`\`
        Data
       ╱    ╲
      ╱      ╲
 Narrative ── Visuals

Data: Accurate data and analysis
Narrative: Clear storyline and insights
Visuals: Appropriate visualization

All three are indispensable.
\`\`\`

### Story Structure: SBI Framework

\`\`\`
S — Situation: Set the context
B — Behavior/Finding: Present the data
I — Impact/Action: Explain the implications and recommendations

Example:
S: "Last month, our revenue target was $3M."
B: "We achieved $2.4M, a 20% shortfall.
    Further analysis reveals a 35% decline in the electronics category,
    primarily due to flagship product stockout."
I: "Recommend pre-stocking 2 weeks earlier and pushing
    alternative product recommendations during stockouts.
    Estimated recovery: $300K."
\`\`\`

### Pyramid Principle

\`\`\`
         Core Argument
        ╱    │    ╲
  Point 1   Point 2   Point 3
   ╱  ╲    ╱  ╲    ╱  ╲
 Data Data Data Data Data Data

Top-down logical structure:
1. State the conclusion first (So What)
2. Provide 3 supporting points
3. Each point backed by data

Example:
Conclusion: Recommend investing $500K in a smart recommendation system
├── Point 1: Can increase conversion rate by 15% (A/B Test data)
├── Point 2: Projected annual revenue increase of $2M (Model estimate)
└── Point 3: 8-month payback period (ROI analysis)
\`\`\`

### Using Annotations to Highlight Key Points

\`\`\`
Add text annotations directly on the chart:

Revenue Trend Chart:
$3M ┤
    │                        ╱── "New product launch
    │                    ╱──╱     drove 30% growth"
$2M ┤              ╱────╱
    │         ╱───╱
    │    ╱───╱
$1M ┤───╱── "Competitor promotion
    │        caused Q2 decline"
    ├────┬────┬────┬────┬────
    Q1   Q2   Q3   Q4   Q1

Key points:
- Annotate important turning points directly
- Explain "why" not just "what"
- Guide the reader's attention
\`\`\`

### Presentation Techniques

\`\`\`
1. Open with a number
   "Last month we lost 350 customers."

2. Progressive reveal
   Start with blank chart → Add baseline → Add actual values → Add trend

3. Contrast method
   "Our competitor's conversion rate is 5%, ours is only 2.8%."

4. Make it tangible
   "$500K in losses equals throwing away $1,370 every day."

5. Close with a call to action
   "If we act now, we can recover $300K by Q3."
\`\`\`

---

## 31-5: Dashboards for Different Audiences

### Audience Analysis Framework

| Aspect | CEO | VP/Director | Manager | Analyst |
|--------|-----|------------|---------|---------|
| Focus | Overall performance, strategy | Department performance, trends | Daily operations, anomalies | Details, root cause |
| Time Range | Year/Quarter | Month/Quarter | Week/Day | Real-time |
| Interactivity | Low (one-page summary) | Medium (filterable) | High (drill-down) | Highest (exploratory) |
| Chart Complexity | Simple | Medium | Medium | Advanced |
| Update Frequency | Monthly/Quarterly | Weekly/Monthly | Daily/Weekly | Real-time |

### CEO Dashboard Example

\`\`\`
One page is sufficient, maximum 4-6 metrics:

┌────────┬────────┬────────┬────────┐
│Revenue │ Profit │ Growth │  NPS   │
│ $12M   │ $2.4M  │ +15%   │  42    │
│ ▲8%    │ ▲5%    │ Target │ ▲3 pts │
│        │        │ +20%   │        │
├────────┴────────┴────────┴────────┤
│       Revenue vs Target (Monthly)  │
│       ━━━━━━━━━━━━━━━━━━━━━━━━    │
├───────────────────┬────────────────┤
│  Revenue by BU    │  Top Risks     │
│  ████ Product A   │  RED: Supply   │
│  ███  Product B   │  YELLOW: Talent│
│  ██   Product C   │  GREEN: Market │
└───────────────────┴────────────────┘

Design highlights:
- No interaction needed (readable even as a screenshot)
- Key numbers prominent (large font + color)
- Target comparison included
- Risk alerts visible
\`\`\`

### Operations Dashboard Example

\`\`\`
Real-time monitoring, highly interactive:

Filters: Date Range | Region | Category | Channel

┌─────────────────────────────────────┐
│ Today Real-time:                     │
│ Orders 1,247  │  GMV $1.2M │Returns 23│
├─────────────────────────────────────┤
│ Order Processing Status              │
│ ■■■■■■■■■■□□  Processing: 85%        │
│ Pending: 52  Processing: 180         │
│ Completed: 1015                      │
├──────────────────┬──────────────────┤
│ Orders by Region  │   Alerts         │
│ (Bar Chart)      │   RED: Warehouse  │
│                  │     A delayed     │
│                  │   RED: Payment    │
│                  │     failure rate↑ │
│                  │   YELLOW: Low     │
│                  │     stock P-301   │
├──────────────────┴──────────────────┤
│ Last 24-Hour Order Trend (Line)      │
└─────────────────────────────────────┘

Design highlights:
- Auto-refreshing (real-time or every 5 minutes)
- Alerts are prominent
- Drill-down to details (click to see individual orders)
- Includes operational recommendations (not just numbers)
\`\`\`

### Product Manager Dashboard Example

\`\`\`
Feature Usage Analysis:

┌────────┬────────┬────────┬────────┐
│ DAU    │ WAU    │Retention│Feature │
│ 12,000 │ 35,000 │ 42%    │Adoption│
│ ▲5%    │ ▲3%    │ ▼2%    │ 68%    │
├────────┴────────┴────────┴────────┤
│ User Funnel                        │
│ Visit → Sign Up → Activate → Pay  │
│ 100%    25%       15%        8%    │
├───────────────────┬────────────────┤
│ Feature Usage     │ Cohort         │
│ (Heatmap)        │ Retention      │
│                  │ (Color Matrix) │
└───────────────────┴────────────────┘
\`\`\`

---

## 31-6: Executive Dashboard Complete Case Study

### Case: SaaS Company Monthly Executive Dashboard

#### Design Process

\`\`\`
Step 1: Confirm audience and purpose
- Audience: CEO, CFO, VP Sales, VP Product
- Frequency: Monthly Board Meeting
- Purpose: Track overall company health, identify areas needing intervention

Step 2: Select KPIs
- North Star Metric: MRR (Monthly Recurring Revenue)
- Financial: MRR, ARR, Burn Rate, Runway
- Growth: New MRR, Expansion MRR, Churn MRR
- Customer: Customer Count, CAC, LTV, Churn Rate
- Product: DAU, Feature Adoption, NPS
- Team: Headcount, Hiring Pipeline

Step 3: Design Layout
Step 4: Select tool (Tableau / Power BI / Looker)
Step 5: Set up data connections
Step 6: Review & Iterate
\`\`\`

#### Dashboard Design

\`\`\`
╔══════════════════════════════════════════════╗
║  SaaS Monthly Dashboard — March 2026        ║
╠══════════════════════════════════════════════╣
║                                              ║
║  MRR         ARR          Net Revenue        ║
║  $450K       $5.4M        Retention          ║
║  ▲ 8%        ▲ 8%         108%  ✅           ║
║                                              ║
║  ─── MRR Bridge ────────────────────────     ║
║  Starting MRR:     $417K                     ║
║  + New:            $28K   ████                ║
║  + Expansion:      $15K   ██                  ║
║  - Contraction:    -$5K   █                   ║
║  - Churn:          -$5K   █                   ║
║  = Ending MRR:     $450K                     ║
║                                              ║
║  ─── Customer Metrics ──────────────────     ║
║  Total Customers: 380  │  CAC: $2,500        ║
║  New This Month: 25    │  LTV: $18,000       ║
║  Churned: 8            │  LTV/CAC: 7.2x ✅   ║
║                                              ║
║  ─── Cohort Retention ──────────────────     ║
║       M1    M2    M3    M6    M12            ║
║  Jan  95%   88%   82%   70%   58%            ║
║  Feb  93%   85%   80%   ...                  ║
║  Mar  94%   87%   ...                        ║
║                                              ║
║  ─── Key Actions Needed ────────────────     ║
║  RED: Churn rate increased from 1.8% to 2.1% ║
║     → Root cause: Enterprise segment         ║
║     → Action: Schedule QBR with top 20       ║
║  YELLOW: CAC up 15% due to paid channel cost ║
║     → Action: Optimize ad spend              ║
║  GREEN: NPS improved from 38 to 42           ║
║     → Continue current CS initiatives        ║
╚══════════════════════════════════════════════╝
\`\`\`

#### Key Design Decision Rationale

\`\`\`
1. MRR Bridge (Waterfall Chart)
   Why: CEO cares most about "where MRR comes from and where it goes"
   More insightful than a simple MRR number

2. LTV/CAC Ratio
   Why: The most important health metric for SaaS
   >3x = Healthy, >5x = Excellent

3. Cohort Retention
   Why: More revealing than overall Churn Rate
   Are newer cohorts performing better or worse?

4. Key Actions
   Why: A dashboard isn't just numbers; it tells the audience "So What"
   Every red flag has a corresponding recommended action
\`\`\`

#### Common BI Tool Comparison

| Tool | Best For | Learning Curve | Cost |
|------|----------|---------------|------|
| Tableau | Enterprise analytics, exploratory | Medium | High ($70/user/mo) |
| Power BI | Microsoft ecosystem, reporting | Medium-Low | Low ($10/user/mo) |
| Looker | Data-driven culture, big data | High | High (enterprise pricing) |
| Metabase | Small teams, quick setup | Low | Free (open source) / Low |
| Google Data Studio | Marketing analytics, free | Low | Free |
| Excel / Google Sheets | Ad-hoc analysis, small reports | Low | Low |

---

## Cheat Sheet: BI and Dashboard Quick Reference

### Dashboard Design Checklist

\`\`\`
☐ Confirm audience and purpose
☐ Select 5-7 core KPIs
☐ Each KPI has a target/benchmark comparison
☐ Appropriate chart types
☐ Consistent colors and fonts
☐ Anomalies prominently highlighted
☐ Data source and last updated time
☐ Action recommendations (So What)
☐ Mobile Responsive (if applicable)
☐ Stakeholder Review & Feedback
\`\`\`

### Chart Selection Quick Reference

\`\`\`
Comparison → Bar Chart
Trend → Line Chart
Proportion → Donut (≤5 categories)
Ranking → Horizontal Bar
Target → Bullet Chart
Conversion → Funnel
Correlation → Scatter
Distribution → Histogram
\`\`\`

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| How to design a Dashboard? | Audience → Purpose → KPIs → Layout → Charts → Iterate |
| Tableau vs Power BI? | Tableau: stronger exploration; Power BI: MS ecosystem integration |
| What is Data Storytelling? | Data + Narrative + Visuals, all three are indispensable |
| Maximum charts on a Dashboard? | 7±2; too many dilutes attention |
| How to choose a chart? | Based on what you want to express (comparison/trend/proportion/distribution) |
| What makes a good KPI? | SMART + Actionable + Has target comparison |
`;

export default world31_en;
