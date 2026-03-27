const world2_en = `
# World 2: KPIs and Business Metrics

> **Goal:** After completing this world, you will be able to correctly select metrics, interpret data, identify relationships between metrics, and design dashboards for different roles in an interview setting.
> **Target Roles:** Product Analyst, Business Analyst, Data Analyst, Product Manager
> **Estimated Study Time:** 3-4 days

---

## 2-1: KPI Fundamentals

### What Is a KPI?

KPI (Key Performance Indicator) is a number that answers the question "How are we doing?"

But the emphasis is on **Key**. A company has hundreds of trackable metrics, but KPIs typically number only 3-5. If everything is a KPI, then nothing is a KPI.

**Three Conditions for a KPI:**

| Condition | Description | Counter-example |
|-----------|-------------|-----------------|
| Measurable | Can be expressed as a number | "Good user experience" doesn't count; "NPS > 50" does |
| Actionable | The team can influence it | "GDP growth rate" is beyond a PM's control |
| Aligned | Directly related to company/team goals | Tracking page views when the goal is conversion rate |

---

### Leading vs Lagging Metrics

This is a high-frequency interview topic. The difference:

**Lagging Metrics**
- Reflect "results that have already happened"
- Confirm whether you did well or not
- Examples: Revenue, churn rate, NPS, quarterly sales

**Leading Metrics**
- Predict "likely future outcomes"
- Allow you to act before problems occur
- Examples: Sales pipeline count, activation rate, feature adoption, trial-to-paid conversion

**An analogy to understand:**

> A lagging metric is like "the number on a scale" — you only see it after you've gained weight.
> A leading metric is like "daily calorie intake" — you can adjust before weight increases.

**Practical Case: SaaS Company**

\`\`\`
Goal: Reduce churn rate ← This is a lagging metric

Leading metrics to use:
├── Product usage frequency
│   → Customers who use less are more likely to churn
├── Support ticket volume
│   → Customers with many issues are more likely to be dissatisfied
├── Feature adoption rate
│   → Customers using only basic features are easily replaceable
└── NPS 90 days before contract expiration
    → Low NPS signals non-renewal
\`\`\`

**Interview Tip:** When the interviewer asks "How would you measure the success of X?", providing both leading and lagging metrics shows more depth than giving just one metric.

---

### Guardrail Metrics

A guardrail is "the baseline that must not deteriorate." You pursue improvement in your primary metric, but not at the expense of your guardrail.

**Why Are Guardrails Needed?**

Because almost any metric can be "gamed":
- Want to boost DAU? → Spam push notifications → User experience degrades
- Want to boost conversion rate? → Free shipping + heavy discounts → Attracts deal-seekers, AOV plummets
- Want to reduce cycle time? → Skip quality checks → Error rate spikes

**Principles for Setting Guardrails:**

1. **Metrics that may conflict with the primary metric**: Speed vs quality, growth vs unit economics
2. **User experience metrics**: NPS, complaint rate, return rate
3. **Long-term health metrics**: Retention, LTV, brand trust

**Standard Interview Answer Format:**

> "I would set [X] as the primary metric, with [Y] and [Z] as guardrails, ensuring we don't sacrifice [Y] and [Z] for short-term gains in [X]."

---

## 2-2: Product & User Metrics

### DAU / MAU / WAU and Stickiness Ratio

**Basic Definitions:**

| Metric | Full Name | Definition |
|--------|-----------|-----------|
| DAU | Daily Active Users | Number of unique users with active behavior in one day |
| WAU | Weekly Active Users | Number of unique users with active behavior in one week |
| MAU | Monthly Active Users | Number of unique users with active behavior in one month |

**Key Question: How is "Active" Defined?**

This is a detail commonly probed in interviews. "Active" doesn't necessarily mean "opened the app":

- Social app: Sent or received a message (not just opened)
- E-commerce: Browsed products or placed an order (not just logged in)
- SaaS tool: Performed a core action (e.g., created a report, edited a document)

**Stickiness Ratio = DAU / MAU**

Measures "how often users come back."

\`\`\`
DAU/MAU = 50%  → On average, a monthly active user is active half the days
DAU/MAU = 10%  → Active about 3 days per month
DAU/MAU = 3%   → Active about 1 day per month
\`\`\`

**Benchmarks vary dramatically by category:**

| Category | Typical DAU/MAU | Reason |
|----------|----------------|--------|
| Social/Messaging | 50-65% | Daily chatting is normal |
| Work tools (Slack, Notion) | 25-40% | Used only on workdays |
| E-commerce | 5-15% | People don't buy things every day |
| Finance/Banking | 3-10% | Occasional balance checks |
| Travel | 1-5% | Intensive use only before trips |

**Interview Trap:** The interviewer might give you a finance app with DAU/MAU = 8% and ask "Is this metric good or bad?" The answer isn't "bad" — it's "you need to look at the category benchmark."

---

### Retention and Cohort Analysis

**Retention** answers the question: "Of the new users who came, how many are still using the product after some time?"

**Common retention metrics:**

- **Day 1 Retention**: Of those who came on day 1, how many returned on day 2? (typically 30-50% is good)
- **Day 7 Retention**: How many after one week? (typically 15-25%)
- **Day 30 Retention**: After one month? (typically 5-15%)

**Cohort Analysis**

A cohort is "a group of people who joined during the same time period." Why segment by cohort? Because overall retention can be misleading.

\`\`\`
Example: Overall Day 7 Retention is 20%

But broken down by cohort:
├── January cohort: Day 7 = 25%
├── February cohort: Day 7 = 22%
├── March cohort: Day 7 = 18%
└── April cohort: Day 7 = 12%

The trend is worsening! Looking only at the overall 20%, you'd think it's stable.
\`\`\`

**Classic Retention Curve Shapes:**

\`\`\`
Good retention curve:
100% ──╲
        ╲
         ╲___________  ← Flattens out (found core users)
              ↑
         inflection point

Bad retention curve:
100% ──╲
        ╲
         ╲
          ╲
           ╲________  → 0%  ← Everyone eventually leaves
\`\`\`

---

### Feature Adoption Metrics

To measure whether a new feature has been successfully adopted, use the **Adoption Funnel**:

\`\`\`
Exposed (saw the entry point)
  ↓ Discovery Rate
Clicked (clicked to enter)
  ↓ Activation Rate
Completed (completed first use)
  ↓ Retention Rate
Retained (continued returning to use)
\`\`\`

**Analysis Focus: Find the Biggest Drop-off**

If Exposed → Clicked is low: Feature is too hidden; users can't find it
If Clicked → Completed is low: First-time experience has friction; process is too complex
If Completed → Retained is low: Feature lacks ongoing value; one-time use is enough

**Common interview questions:**
- "How would you evaluate whether a feature is successful?"
- "This feature launched two weeks ago. What data would you look at?"

The standard answer is to draw the adoption funnel and find the bottleneck.

---

### Correlation vs Causation

This is one of the most important concepts in PA/DA interviews.

**Classic Trap:**

> "Users who use Feature X have 30% higher retention than those who don't."
> → Conclusion: Feature X improves retention?

**Not necessarily!** Three possibilities:

1. **X causes Y**: Feature X truly keeps people around
2. **Y causes X**: Power users who would stay anyway are more willing to try new features
3. **Z causes both X and Y**: For example, a marketing campaign simultaneously brought high-quality users (high retention) and feature exposure (high adoption)

**How to Verify Causation?**

| Method | Description | Use Case |
|--------|-------------|----------|
| A/B Test (random assignment) | Randomly show the feature to some users and not others | Most reliable, but requires sufficient traffic |
| PSM (Propensity Score Matching) | Compare users with similar characteristics but different behaviors | When A/B testing isn't possible |
| Natural Experiment | Leverage naturally occurring random events | Post-hoc analysis |
| Diff-in-Diff | Compare differences between treatment and control groups before and after intervention | Large-scale policy or feature rollouts |

**Interview Tip:** Every time you see observational data (non-experimental) claiming "A is better than B," your first instinct should be to ask "Is there selection bias?"

---

## 2-3: Business & Operations Metrics

### Cycle Time

The time from the start of a process to its completion.

**Why Is Cycle Time Important?**
- Customer wait time → Satisfaction
- Capital turnover speed → Cash flow
- Time from problem discovery to fix → Risk management

**Analysis Method: Decompose Each Step**

\`\`\`
Order processing cycle time analysis:

Step                  Avg Time    Target    Gap
Order → Payment       0.5 hr      1 hr      -
Payment → Picking     4 hr        2 hr      +2 hr
Picking → QC          1 hr        1 hr      -
QC → Packaging        6 hr        1 hr      +5 hr  ← bottleneck!
Packaging → Shipping  1.5 hr      2 hr      -

Total                 13 hr       7 hr      +6 hr
\`\`\`

**After finding the bottleneck, the next step is to ask why:**
- Not enough staff? (capacity issue)
- Queue waiting? (queue issue)
- Too much rework? (quality issue)
- Poorly designed process? (process issue)

---

### Throughput and Completion Rate

**Throughput** = Number of items completed per unit of time

\`\`\`
Example: Warehouse processes 500 orders per day
Example: Customer service team replies to 30 tickets per hour
Example: Engineering team completes 45 story points per sprint
\`\`\`

**Completion Rate** = Proportion successfully completed

\`\`\`
Example: Order completion rate = Successfully delivered orders / Total orders = 94%
Example: Form submission rate = People who submitted / People who started filling = 68%
\`\`\`

**Relationship Between Throughput and Cycle Time (Little's Law):**

> **WIP = Throughput × Cycle Time**
>
> WIP (Work in Progress) = Amount of work currently in progress

If cycle time increases but throughput stays the same, WIP is growing (backlog is accumulating).

---

### SLA (Service Level Agreement) and Error Rate

**SLA** is your service commitment to customers or internal stakeholders.

\`\`\`
SLA Example (IT Support):
├── P1 (System outage): Respond within 1 hour, resolve within 4 hours
├── P2 (Feature malfunction): Respond within 4 hours, resolve within 24 hours
└── P3 (General inquiry): Respond within 24 hours, resolve within 72 hours
\`\`\`

**Key SLA Analysis Thinking: Priority × Achievement Rate**

Not all SLA misses are equally severe:
- P3 miss 10% → 45 tickets delayed, limited impact
- P1 miss 27% → 4 system outages unresolved in time, could halt the entire company

**Error Rate**

\`\`\`
Error Rate = Transactions with errors / Total transactions

Common benchmarks:
├── Financial transactions: < 0.01% (very strict)
├── E-commerce orders: < 2%
├── Food delivery orders: < 3%
└── Customer service replies: < 5%
\`\`\`

---

### Cost Per Transaction

How much it costs to complete one transaction.

\`\`\`
Cost Per Transaction = Total operating cost / Total transactions

Example:
Customer service center monthly cost $50,000, handles 10,000 tickets
→ Cost per ticket = $5

After introducing a chatbot:
Monthly cost $55,000 (chatbot costs added), but handles 18,000 tickets
→ Cost per ticket = $3.06 (down 39%)
\`\`\`

**Cost per transaction is one of the core KPIs for Ops teams**, directly impacting unit economics and scalability.

---

## 2-4: How to Define Success Metrics

### Defining Success Metrics for a Project/Feature

Common interview question: "If you were the PM/PA of this project, how would you define success?"

**Three-Step Framework:**

\`\`\`
Step 1: Return to the objective
  → What problem is this project/feature solving?

Step 2: Find the most direct measurement
  → What number represents "the problem is solved"?

Step 3: Add guardrails
  → While achieving the goal, what must not deteriorate?
\`\`\`

**Practical Case: Sales Dashboard Project**

\`\`\`
Goal: Enable the sales team to self-serve reports, eliminating weekly requests to the data team

Step 1: The problem is "the data team is consumed by too many ad-hoc requests"
Step 2: Success metric = Decline in ad-hoc report requests
Step 3: Guardrail = Report quality for the sales team must not decline (avoid incorrect data)

Bad success metrics:
├── DAU → Measures "someone used it," not "problem solved"
├── Revenue increase → Too indirect, influenced by too many factors
└── Satisfaction survey → Subjective, not direct
\`\`\`

---

### Primary Metric vs Proxy Metric

**Primary Metric** = Directly measures whether the goal is achieved
**Proxy Metric** = Indirectly related substitute indicator

\`\`\`
Example 1:
Goal: Improve customer loyalty
Primary: Retention Rate / Repeat Purchase Rate
Proxy: NPS, CSAT

Example 2:
Goal: Improve product users' work efficiency
Primary: Task completion time
Proxy: DAU, session duration

Example 3:
Goal: Reduce customer service costs
Primary: Cost per ticket
Proxy: Chatbot resolution rate, First contact resolution rate
\`\`\`

**When to use a proxy?**
- The primary metric is too slow (e.g., LTV takes 12 months to calculate)
- The primary metric is hard to measure (e.g., "user trust")
- The primary metric is heavily influenced by external factors

**Interview Tip:** If you use a proxy metric, be prepared to explain "why this proxy has a high correlation with the primary metric." Don't take it for granted.

---

### What to Do When Metrics Conflict

When two metrics contradict each other, use the **Primary + Guardrail Framework**:

\`\`\`
Scenario: Food delivery platform

Metric A: Order completion time (faster is better)
Metric B: Order accuracy rate (higher is better)

Rushing delivery → Wrong orders
Ensuring accuracy → Takes more time

Solution:
Primary = Order completion time (optimization direction)
Guardrail = Order accuracy rate ≥ 98% (must not drop below this threshold)
\`\`\`

**Universal interview answer:**

> "When these two metrics conflict, I would set [the harder one to recover] as the guardrail and [the easier one to optimize] as the primary. Because once [the guardrail] deteriorates, the recovery cost is very high."

---

## 2-5: Different Roles Look at Different Metrics

### Each Role's "Metric Worldview"

Different roles focus on completely different metrics because they're responsible for different things.

**CEO / CFO (Revenue & Strategy)**

\`\`\`
Core Metrics:
├── Revenue / MRR / ARR (How much are we earning?)
├── Growth Rate (How fast are we growing?)
├── CAC / LTV / LTV:CAC ratio (Are unit economics healthy?)
├── Gross Margin (What's the gross margin?)
└── Burn Rate / Runway (How long can we keep spending?)

Decision Scenarios:
"Should we enter a new market?" → Look at TAM, CAC, LTV
"Should we raise prices?" → Look at price elasticity, churn rate
"Should we raise funding?" → Look at burn rate, runway
\`\`\`

**Product Manager (Product & Users)**

\`\`\`
Core Metrics:
├── DAU / MAU / Stickiness (Are users active?)
├── Retention (Are users staying?)
├── Feature Adoption (Are people using new features?)
├── Activation Rate (Are new users successfully activating?)
└── NPS / CSAT (Are users satisfied?)

Decision Scenarios:
"Should we build this feature?" → Look at user research + expected retention impact
"Feature is done — was it successful?" → Look at adoption funnel + retention impact
\`\`\`

**Customer Success Manager (Customer Relationships & Renewal)**

\`\`\`
Core Metrics:
├── Customer Health Score (Which customers are at risk?)
├── NPS / CSAT (How do customers feel?)
├── Churn Rate / Renewal Rate (Are customers renewing?)
├── Expansion Revenue (Are existing customers purchasing more?)
└── Time to Value (How quickly do customers start getting value?)

Decision Scenarios:
"Which customers should I proactively contact this week?" → Look at lowest health scores
"Will this customer renew?" → Look at usage trend + NPS + support tickets
\`\`\`

**Operations Manager (Operational Efficiency)**

\`\`\`
Core Metrics:
├── Cycle Time (How long does the process take?)
├── Throughput (How many per day?)
├── SLA Achievement Rate (Are we meeting service commitments?)
├── Error Rate (What's the error rate?)
└── Cost per Transaction (What's the cost per transaction?)

Decision Scenarios:
"Should we hire more people?" → Check if throughput can keep up with demand growth
"Should we change the process?" → Look at cycle time and bottleneck analysis
\`\`\`

---

### Dashboard Design Principles

The core question in dashboard design isn't "what metrics to include" but:

\`\`\`
1. Audience → Who's looking at it?
2. Decision → What decisions do they need to make?
3. Metrics  → What information do they need to make those decisions?
\`\`\`

**Common Mistakes:**

| Mistake | Why It's Bad |
|---------|-------------|
| One dashboard for everyone | Different people need different levels of information; the CEO doesn't need to see every feature's adoption |
| Too many metrics (>10) | Information overload; can't see anything useful |
| Only lagging metrics | By the time you see the problem, it's too late |
| No benchmark / target line | A number without a comparison point is meaningless |

**Good Dashboard Structure:**

\`\`\`
├── 1-2 headline metrics (instant overview of overall status)
├── 3-5 supporting metrics (explain why the headline is good/bad)
├── Trend charts (see direction, not just numbers)
├── Target lines (compare against targets)
└── Drill-down capability (click to see details)
\`\`\`

---

## 2-6 (Boss): Comprehensive Metric Analysis

### Marketplace Health Assessment

Marketplaces are a high-frequency interview scenario (Uber, Airbnb, Shopee, food delivery platforms...).

**Three Facets of a Marketplace:**

\`\`\`
Supply Side                  Demand Side                  Platform
├── Number of suppliers      ├── Number of buyers         ├── GMV
├── Supplier NPS             ├── Buyer activity           ├── Take Rate
├── New supplier onboard     ├── Order frequency          ├── Order completion rate
│   rate                     ├── Search conversion rate   ├── Average match time
└── Supply quality/rating    └── Customer NPS             └── Gross margin
\`\`\`

**All three facets must be viewed together!** Looking only at GMV can be misleading:

\`\`\`
Scenario: GMV grew 15% QoQ, but the CEO feels something is off

Deep analysis:
├── Supply: Suppliers -12.5%, NPS -14pts, new signups -60% → Deteriorating
├── Demand: Buyers +12.5% → Okay
├── Platform: Take rate 8% → 12%, completion rate 94% → 88% → Deteriorating

Conclusion: GMV growth was driven by AOV spikes (a few large orders),
but the supply side is collapsing.
Root cause: Take rate increased too much, suppliers are unhappy → Churn →
Long-term unsustainable.
\`\`\`

---

### How to Diagnose "Headline Metric Looks Good but Fundamentals Are Unhealthy"

This is a classic PA/BA interview question type. The interviewer gives you data that "looks great" and tests whether you can identify the underlying problems.

**Diagnostic Steps:**

\`\`\`
Step 1: Decompose the headline metric
  → Revenue = Users × Orders per User × AOV
  → GMV = Buyers × Orders × AOV
  → Which component is driving growth? Is it a healthy driver?

Step 2: Examine composition
  → Is growth coming from all customers, or concentrated in a few large ones?
  → What's the contribution ratio of new vs existing customers?
  → If you remove the Top 5 customers, does the number still look good?

Step 3: Check leading indicators
  → Even though the lagging metric looks good, are leading metrics showing signs of deterioration?
  → What are the trends in pipeline, activation, retention?

Step 4: Check guardrail metrics
  → Has anything been "sacrificed for a good-looking headline"?
  → Have unit economics, satisfaction, or quality worsened?
\`\`\`

**Common "Looks Good but Unhealthy" Patterns:**

| Pattern | Headline Looks Good | Underlying Problem |
|---------|--------------------|--------------------|
| Client concentration | Revenue +20% | Top 3 clients contribute 70% of revenue; losing one would be devastating |
| Promotion-driven | Order volume +50% | AOV plunges, return rate spikes, repeat purchase rate is very low |
| New users mask churn | MAU flat | New users keep coming in, but old users keep leaving (leaky bucket) |
| Sacrificing supply | GMV +15% | Take rate spikes, supplier churn, platform is long-term unsustainable |
| Short-term behavior | Activation rate +30% | Lowered activation standards, quality drops, subsequent retention is poor |

---

## Cheat Sheet: Common Metrics Quick Reference

### Growth & Revenue Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| MRR / ARR | Monthly / Annual Recurring Revenue | SaaS |
| Revenue Growth Rate | (Current period - Previous period) / Previous period | All companies |
| GMV | Gross Merchandise Value (total platform transaction value) | Marketplace |
| Take Rate | Platform commission / GMV | Marketplace |
| ARPU | Revenue / Active Users | All products |

### User & Product Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| DAU / MAU | Daily / Monthly Active Users | All products |
| Stickiness | DAU / MAU | Product engagement |
| Retention Rate | Users returning on Day N / Users on Day 0 | All products |
| Activation Rate | New users completing core action / Total new users | Onboarding |
| Feature Adoption | Users using the feature / Users exposed to the feature | Feature evaluation |
| NPS | Promoters% - Detractors% (-100 to +100) | Satisfaction |
| CSAT | Satisfied responses / Total responses | Single-interaction satisfaction |

### Unit Economics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| CAC | Customer Acquisition Cost | Growth strategy |
| LTV | Lifetime Value | Customer strategy |
| LTV:CAC Ratio | LTV / CAC (>3 is typically healthy) | Business model validation |
| Payback Period | CAC / Monthly Revenue per Customer | Cash flow planning |
| Gross Margin | (Revenue - COGS) / Revenue | Pricing strategy |

### Retention & Churn

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Churn Rate | Churned customers / Customers at period start | SaaS, subscription |
| Revenue Churn | Churned MRR / Starting MRR | SaaS |
| Net Revenue Retention | (Starting MRR + Expansion - Churn) / Starting MRR | SaaS (>100% means existing customers are expanding) |
| Cohort Retention | Retention of a specific cohort at Day N | Trend analysis |

### Operations Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Cycle Time | Time from process start to completion | Efficiency analysis |
| Throughput | Number completed per unit of time | Capacity analysis |
| SLA Achievement Rate | Tickets meeting SLA / Total tickets | IT, customer service |
| Error Rate | Transactions with errors / Total transactions | Quality control |
| Cost per Transaction | Total cost / Total transactions | Operational efficiency |
| First Contact Resolution | Proportion resolved on first contact | Customer service |

### Marketplace Metrics

| Metric | Formula / Definition | Use Case |
|--------|---------------------|----------|
| Liquidity | Successful matches / Total demand | Supply-demand matching efficiency |
| Time to Match | Time from request to successful match | User experience |
| Supply/Demand Ratio | Supply volume / Demand volume | Supply-demand balance |
| Repeat Rate | Proportion returning for another transaction (view supply and demand sides separately) | Platform stickiness |

---

## Common Interview Questions and Answer Frameworks

**Q: How would you define success metrics for X?**
> 1. Confirm what the objective is
> 2. Find the primary metric that directly measures the objective
> 3. Add guardrail metrics
> 4. Distinguish leading vs lagging

**Q: Is this metric good or bad?**
> 1. Compared to what? (benchmark, historical, target)
> 2. What's the context? (category, market, seasonality)
> 3. What's the trend? (improving vs deteriorating)

**Q: What if two metrics conflict?**
> 1. Choose one as the primary (optimization direction)
> 2. Make the other the guardrail (baseline that cannot be breached)
> 3. Explain why (typically the harder-to-repair metric becomes the guardrail)

**Q: What dashboard would you design?**
> 1. First ask "Who's the audience?"
> 2. Then ask "What decisions do they need to make?"
> 3. Only then select the metrics
`;

export default world2_en;
