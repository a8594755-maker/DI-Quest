const world35_en = `
# World 35: Problem-Solving Frameworks

> What interviewers test most often isn't technical detail — it's "how you think about problems."
> Learning structured problem-solving methods will help you handle case interviews and real work situations with confidence.

Problem-solving ability is the core of consulting firm interviews.
But this skill is critical in any business role.

---

## 35-1: MECE Problem Decomposition

### The MECE Principle

**MECE = Mutually Exclusive, Collectively Exhaustive**

\`\`\`
✅ MECE Decomposition:
Revenue Decline Causes
├── Volume Decline
│   ├── New customer decrease
│   └── Existing customer churn
└── Average Order Value Decline
    ├── Increased discounts
    └── Product mix shift

❌ Non-MECE Decomposition:
Revenue Decline Causes
├── Fewer customers (overlaps with below)
├── Marketing not effective (overlaps with above)
├── Competitors stealing customers (only one factor)
└── Bad economy (too vague)
\`\`\`

### Common MECE Decomposition Dimensions

| Decomposition Method | Example |
|---------------------|---------|
| Revenue Formula | Revenue = Customers × Avg Order Value × Purchase Frequency |
| Funnel Decomposition | Impression → Click → Sign-up → Payment → Retention |
| Supply/Demand | Supply side vs Demand side |
| Internal/External | Internal factors vs External factors |
| 3C Analysis | Company / Customer / Competitor |
| 4P Analysis | Product / Price / Place / Promotion |
| Value Chain | Procurement → Production → Logistics → Sales → After-sales |

### Issue Tree Construction Steps

\`\`\`
Step 1: Define the core problem
  "Why did Q1 revenue decline 15% year-over-year?"

Step 2: First-level decomposition (MECE)
  ├── Volume problem?
  └── Price problem?

Step 3: Second-level decomposition
  ├── Volume Problem
  │   ├── New customer acquisition declining?
  │   │   ├── Marketing reach decreasing?
  │   │   └── Conversion rate declining?
  │   └── Existing customer repeat purchases declining?
  │       ├── Customer churn increasing?
  │       └── Purchase frequency declining?
  └── Price Problem
      ├── Product pricing reduced?
      └── Discounts/promotions increased?

Step 4: For each leaf node, find data to validate
\`\`\`

### Interview Practice

\`\`\`
Q: A chain coffee shop's profit has declined. Analyze the causes.

MECE Decomposition:
Profit = Revenue - Cost

Revenue Side:
├── Customer traffic declining?
│   ├── Foot traffic in the area decreasing?
│   ├── Brand attractiveness declining?
│   └── Competitors stealing customers?
└── Average ticket size declining?
    ├── Consumers trading down (buying cheaper items)?
    └── Too many promotions?

Cost Side:
├── Raw material costs rising?
│   ├── Coffee bean prices increasing?
│   └── Milk/packaging costs increasing?
├── Labor costs increasing?
│   ├── Minimum wage increase?
│   └── Improper staffing levels?
└── Rent/operating costs increasing?
\`\`\`

---

## 35-2: Hypothesis Thinking

### What is Hypothesis Thinking?

\`\`\`
Traditional Thinking: Collect all data → Analyze → Conclude
Hypothesis Thinking: Form hypothesis first → Validate with data → Revise or confirm

Advantages:
  ✅ Saves time (no needle-in-a-haystack searching)
  ✅ Clear direction (know what data to look for)
  ✅ Can iterate quickly (wrong? switch hypotheses)
\`\`\`

### Hypothesis Building Process

\`\`\`
1. Problem Definition
   "Why did App DAU (Daily Active Users) drop 20%?"

2. Initial Hypotheses (based on experience and intuition)
   H1: Recent redesign degraded user experience
   H2: Competitor launched new product stealing users
   H3: Seasonal factor (holiday season ended)

3. Design Validation Methods
   H1 → Check retention rate and session duration before/after redesign
   H2 → Investigate recent competitor activity, compare download numbers
   H3 → Compare with same period last year

4. Collect Data to Validate
   H1 → Retention dropped from 45% to 30%, session duration decreased 40%
   → H1 confirmed! Dig deeper: which page has the most drop-off?

5. Refine Hypothesis
   H1a: New homepage design makes core features hard to find
   H1b: New version has slower load times
   → Continue validating with data
\`\`\`

### Hypothesis Tree

\`\`\`
Core Hypothesis: Redesign caused DAU decline
├── H1: UI redesign impacted user experience
│   ├── H1a: Homepage redesign → core feature click rate dropped ✅ Data supports
│   ├── H1b: Load speed slowed → bounce rate increased ❌ Data doesn't support
│   └── H1c: Navigation structure changed → users got lost ✅ Data supports
├── H2: Competitor stole users
│   └── H2a: Competitor download volume during same period → ❌ No significant growth
└── H3: Seasonal factor
    └── H3a: Year-over-year comparison → ❌ Same period last year showed growth
\`\`\`

### Good Hypothesis vs Bad Hypothesis

| Good Hypothesis | Bad Hypothesis |
|----------------|----------------|
| Specific, verifiable | Vague, unverifiable |
| "Conversion dropped because checkout added a step" | "Maybe the UX is bad" |
| Has a clear validation method | No way to find supporting or opposing data |
| Can guide action | Knowing it doesn't tell you what to do |

---

## 35-3: Prioritization Frameworks (ICE / RICE)

### ICE Score

\`\`\`
ICE = Impact × Confidence × Ease

Each rated 1-10
\`\`\`

| Initiative | Impact | Confidence | Ease | ICE Score |
|-----------|--------|-----------|------|-----------|
| Simplify checkout flow | 9 | 8 | 6 | 432 |
| Add recommendation engine | 8 | 5 | 3 | 120 |
| Improve search functionality | 7 | 7 | 7 | 343 |
| Social sharing feature | 5 | 4 | 8 | 160 |

→ Priority: Simplify checkout flow (ICE = 432)

### RICE Score

\`\`\`
RICE = (Reach × Impact × Confidence) / Effort

Reach: How many users affected (per quarter)
Impact: Impact on each user (0.25 / 0.5 / 1 / 2 / 3)
Confidence: Confidence percentage (100% / 80% / 50%)
Effort: Person-months required
\`\`\`

| Initiative | Reach | Impact | Confidence | Effort | RICE |
|-----------|-------|--------|-----------|--------|------|
| Checkout optimization | 10,000 | 3 | 80% | 2 | 12,000 |
| Recommendation engine | 50,000 | 1 | 50% | 6 | 4,167 |
| App push notifications | 30,000 | 0.5 | 80% | 1 | 12,000 |
| Loyalty program | 5,000 | 2 | 50% | 4 | 1,250 |

### 2x2 Matrix Prioritization

\`\`\`
          High Impact
            │
    Quick   │   Big Bets
    Wins    │   Major investment
            │
  ──────────┼──────────
            │
    Don't   │   Money
    Bother  │   Pits
            │   Avoid
            │
          Low Impact
    Low Effort ←───→ High Effort
\`\`\`

### When to Use Which Framework

| Scenario | Recommended Framework |
|----------|---------------------|
| Quick idea screening | ICE (simple, fast) |
| Product feature prioritization | RICE (accounts for user scale) |
| Strategic decisions | 2x2 Matrix (intuitive yet effective) |
| Multi-criteria decisions | Weighted Scoring |

---

## 35-4: Trade-off Analysis

### Trade-off Thinking

\`\`\`
Business decisions rarely have a "best" answer.
Almost all of them involve making trade-offs between options.

Interviewers don't want to see what you chose;
they want to see "how you think about trade-offs."
\`\`\`

### Trade-off Analysis Framework

\`\`\`
Step 1: List options
Step 2: Define evaluation criteria
Step 3: Evaluate each option
Step 4: Weigh trade-offs
Step 5: Make a recommendation with rationale
\`\`\`

### Example: Choosing a CRM System

| Evaluation Criteria | Weight | Salesforce | HubSpot | Custom-built |
|-------------------|--------|-----------|---------|-------------|
| Feature completeness | 30% | 9 (2.7) | 7 (2.1) | 8 (2.4) |
| Implementation cost | 25% | 4 (1.0) | 8 (2.0) | 3 (0.75) |
| Maintenance cost | 20% | 6 (1.2) | 8 (1.6) | 4 (0.8) |
| Customizability | 15% | 7 (1.05) | 5 (0.75) | 10 (1.5) |
| Implementation speed | 10% | 6 (0.6) | 9 (0.9) | 2 (0.2) |
| **Weighted Total** | | **6.55** | **7.35** | **5.65** |

→ Recommendation: HubSpot (best overall, particularly strong in cost and implementation speed)

### Common Trade-off Types

\`\`\`
Speed vs Quality
  Fast launch vs Thorough testing

Cost vs Features
  Cheaper option (fewer features) vs Expensive option (more features)

Standardization vs Customization
  Off-the-shelf software vs Custom-built system

Short-term vs Long-term
  Quick fix vs Root cause resolution

Centralized vs Decentralized
  Unified system vs Department-specific tools
\`\`\`

### Interview Answer Template

\`\`\`
"This is a classic [A] vs [B] trade-off.

  Choosing [A] offers... at the cost of...
  Choosing [B] offers... at the cost of...

  Given [company situation/goals/constraints],
  I would recommend [A/B], because...

  At the same time, to mitigate the downsides, we could..."
\`\`\`

---

## 35-5: Building Recommendations

### Pyramid Principle

\`\`\`
          ┌─────────────┐
          │ Conclusion/  │  ← Lead with conclusion
          │ Recommendation│
          └──────┬──────┘
        ┌────────┼────────┐
   ┌────┴───┐┌───┴────┐┌──┴─────┐
   │ Point 1 ││ Point 2 ││ Point 3 │  ← Supporting arguments
   └────┬───┘└───┬────┘└──┬─────┘
     Evidence  Evidence  Evidence     ← Data/facts
     1.1       2.1       3.1
     Evidence  Evidence  Evidence
     1.2       2.2       3.2
\`\`\`

### SCQA Structure for Recommendations

\`\`\`
S - Situation:
  "Our e-commerce conversion rate has been declining, from 3.2% to 2.1%."

C - Complication:
  "If unchanged, projected Q3 revenue will fall short by $2M."

Q - Question:
  "How can we improve conversion rate without increasing the marketing budget?"

A - Answer:
  "I recommend three approaches:
   1. Simplify checkout flow (estimated +0.5% conversion rate)
   2. Add product recommendations (estimated +0.3% conversion rate)
   3. Optimize mobile experience (estimated +0.3% conversion rate)"
\`\`\`

### Recommendation Strength Levels

| Level | Phrasing | When to Use |
|-------|----------|------------|
| Strong recommendation | "I recommend..." "We should..." | Data is sufficient, risk is low |
| Moderate recommendation | "Worth considering..." "I suggest evaluating..." | Some support but uncertain |
| Advisory recommendation | "Could explore..." "As one option..." | More data needed |

### Action Plan Template

\`\`\`
Recommendation: Simplify checkout flow
Expected Impact: Conversion rate increase of 0.5%

Implementation Plan:
┌──────────┬─────────────────────┬───────┬───────┐
│ Phase    │ Task                │ Timeline│ Owner │
├──────────┼─────────────────────┼───────┼───────┤
│ Phase 1  │ User research + data│ W1-2  │ PA    │
│ Phase 2  │ UI prototype design │ W3    │ UX    │
│ Phase 3  │ A/B Test development│ W4-5  │ Dev   │
│ Phase 4  │ Testing + launch    │ W6    │ PM    │
│ Phase 5  │ Impact tracking     │ W7-10 │ PA    │
└──────────┴─────────────────────┴───────┴───────┘

Success Metrics:
  - Checkout conversion rate ≥ 2.6% (currently 2.1%)
  - Checkout steps reduced from 5 to 3
  - Average checkout time < 2 minutes

Risks & Mitigation:
  - Simplified flow may miss required fields → Conduct user testing to confirm
  - A/B Test results not significant → Extend test period or adjust approach
\`\`\`

---

## 35-6: Complete Case Practice

### Case: Growth Strategy for an Online Education Platform

\`\`\`
Background:
An online education platform (similar to Coursera/Udemy) has stagnated in growth.
MAU has plateaued at 50,000, with a 5% paid conversion rate.
The CEO wants to increase MAU to 80,000 within 6 months.
\`\`\`

### Step 1: Problem Clarification

\`\`\`
Clarifying the Problem:
- Target: MAU 50K → 80K (+60%), 6 months
- Constraints: $500K budget, 15-person team
- Current Channels: Organic traffic 60%, Social 25%, Paid ads 15%
- User Profile: Working professionals aged 25-35, learning new skills
\`\`\`

### Step 2: MECE Decomposition

\`\`\`
MAU = New User Acquisition + Returning Users - Churned Users

New User Acquisition:
├── Paid Channels
│   ├── Google Ads
│   ├── Facebook / IG Ads
│   └── KOL Partnerships
├── Organic Channels
│   ├── SEO (Content Marketing)
│   ├── Word of Mouth
│   └── App Store Ranking
└── Partnership Channels
    ├── Corporate Training Partnerships
    └── School / Institution Partnerships

Returning Users:
├── Push Notifications
├── Email Marketing
└── New Course Launches

Churn Control:
├── Improve Course Quality
├── Community Building
└── Personalized Recommendations
\`\`\`

### Step 3: Hypothesis & Validation

\`\`\`
H1: SEO traffic has significant growth potential (currently low share)
  → Validate: Analyze keyword competition and search volume
  → Result: 200K monthly relevant searches, currently capturing only 5%
  → ✅ Confirmed

H2: Return visit rate is low (users come once and leave)
  → Validate: Analyze 30-day return rate
  → Result: 30-day return rate only 15% (industry average 30%)
  → ✅ Confirmed

H3: Paid advertising ROI is poor
  → Validate: Analyze CAC and LTV
  → Result: CAC $50, LTV $80, ROI is acceptable
  → ❌ Not the main issue
\`\`\`

### Step 4: Prioritization (RICE)

| Initiative | Reach | Impact | Confidence | Effort | RICE |
|-----------|-------|--------|-----------|--------|------|
| SEO content strategy | 10,000 | 2 | 80% | 3 | 5,333 |
| Email return visit campaign | 30,000 | 1 | 80% | 1 | 24,000 |
| Referral reward program | 5,000 | 3 | 50% | 2 | 3,750 |
| Corporate partnership program | 2,000 | 3 | 50% | 4 | 750 |

→ Priority: Email return visits > SEO > Referral rewards > Corporate partnerships

### Step 5: Recommendations

\`\`\`
Recommendation: Focus on two strategies to achieve MAU 80K in 6 months

Strategy 1: Email + Push Return Visit Campaign (Quick Win)
  - Send personalized course recommendations to 35K inactive users
  - Estimated return rate increase to 25% → +5,250 MAU
  - Investment: $50K, launch within 1 month

Strategy 2: SEO Content Marketing (Mid-to-Long Term)
  - Produce 30 high-quality skill articles per month
  - After 6 months, estimated organic traffic doubles → +15,000 MAU
  - Investment: $200K (including content team)

Strategy 3: Referral Reward Program (Supporting)
  - Existing users refer friends, both receive free courses
  - Estimated +2,000 MAU per month
  - Investment: $100K (reward costs)

Estimated Total Growth: 5,250 + 15,000 + 12,000 = 32,250
Target 80K = 50K + 30K → Achievable ✅
\`\`\`

### Step 6: Risks & Tracking

\`\`\`
Risks:
1. SEO results take 3-6 months to materialize
   → Use email return visits as short-term supplement
2. Referral rewards may attract non-target users
   → Set referral conditions (must complete one course to refer)
3. Content quality inconsistency
   → Establish content review process

Tracking Metrics:
  - Weekly: MAU, New Users, Return Rate
  - Monthly: CAC by Channel, SEO Rankings, Referral Conversion Rate
  - Quarterly: LTV, Paid Conversion Rate, NPS
\`\`\`

---

## Key Takeaways - World 35 Cheat Sheet

### Five Steps to Problem Solving

\`\`\`
1. Define the Problem (80% of people go astray at this step)
2. MECE Decomposition (structured, no gaps)
3. Hypothesis Validation (be bold in hypothesizing, careful in verifying)
4. Prioritize (ICE / RICE / 2x2)
5. Recommend Actions (Pyramid / SCQA)

Common MECE Decompositions:
  Revenue = Customers × Avg Order Value × Frequency
  Profit = Revenue - Cost
  Funnel = Impression → Click → Conversion → Retention
  Internal/External = Internal factors vs External factors

Hypothesis Thinking:
  Have a direction first → Find data to validate → Adjust direction
  Don't collect all data before analyzing

Prioritization:
  ICE = Impact × Confidence × Ease
  RICE = (Reach × Impact × Confidence) / Effort
  2x2 = Impact vs Effort

Recommendation Structure:
  SCQA = Situation → Complication → Question → Answer
  Pyramid = Conclusion → Arguments → Evidence
\`\`\`

### Core Interview Reminders

\`\`\`
✅ Clarify the problem before answering (don't jump to solutions)
✅ Use MECE to demonstrate structured thinking
✅ Every argument needs data support
✅ Explicitly state the trade-offs
✅ Give actionable recommendations (not just directions)
❌ Don't list too many options (3-4 is enough)
❌ Don't skip hypotheses and jump to conclusions
❌ Don't ignore risks and constraints
\`\`\`
`;

export default world35_en;
