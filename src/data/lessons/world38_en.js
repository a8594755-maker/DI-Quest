const world38_en = `
# World 38: Product Metrics

> The core job of a Product Analyst is measuring product performance with metrics.
> Choosing the right metrics enables correct product decisions.

Product teams ask every day: "Is this feature working?" "What should we prioritize?"
The foundation for answering these questions is product metrics.

---

## 38-1: Activation / Onboarding Metrics

### Defining Activation

\`\`\`
Activation = The moment a user first experiences the product's core value

Activation Moments for different products:
  Slack: Sending the first message
  Dropbox: Uploading the first file
  Spotify: Creating the first playlist
  E-commerce: Completing the first purchase
  SaaS: Completing initial setup and using a core feature
\`\`\`

### Activation Metrics

| Metric | Definition | Calculation |
|--------|-----------|-------------|
| Activation Rate | Percentage of users who complete Activation | Activated Users / Total Sign-ups |
| Time to Value (TTV) | Time from sign-up to Activation | Median or average |
| Setup Completion Rate | Percentage who complete initial setup | Completed Setup / Total Sign-ups |
| Onboarding Drop-off | Drop-off rate at each step | Step completions / Previous step completions |

### Onboarding Funnel Analysis

\`\`\`
Step 1: Sign-up            10,000 (100%)
  ↓
Step 2: Email Verification    7,500 (75%)  ← 25% drop-off
  ↓
Step 3: Profile Setup         6,000 (60%)  ← 20% drop-off
  ↓
Step 4: Feature Tutorial      4,500 (45%)  ← 25% drop-off
  ↓
Step 5: Core Feature Usage    3,000 (30%)  ← 33% drop-off
  ↓
Activated!                    2,000 (20%)  ← 33% drop-off

Activation Rate = 20%
Biggest Drop-off Point: Step 4 → Step 5 (core feature usage)
→ Prioritize improving the core feature onboarding experience
\`\`\`

### Strategies to Improve Activation

\`\`\`
1. Remove Friction
   - Simplify sign-up flow (social login)
   - Defer non-essential field entry
   - Progressive Profiling

2. Guided Experience
   - Interactive Tour
   - Checklist (progress bar)
   - Sample data (let users see value immediately)

3. Personalization
   - Customize onboarding based on user role
   - Recommend the most relevant features

4. Quick Win
   - Let users see results within 5 minutes
   - Provide Templates / Prebuilt setups
\`\`\`

### Interview Question

\`\`\`
Q: A SaaS tool has an Activation Rate of only 15%. How would you improve it?

A:
1. First define Activation: What action represents a user being "activated"?
2. Analyze the Onboarding Funnel: Examine drop-off rates at each step
3. Identify the biggest drop-off point
4. Design improvement plans based on the root cause
5. A/B Test to validate effectiveness

Assuming the biggest drop-off is at the "Feature Tutorial" step:
→ Tutorial may be too long or boring
→ Try: Shorten to 3 steps, add interactive elements, provide skip option
→ Goal: Activation Rate from 15% → 25%
\`\`\`

---

## 38-2: Engagement Metrics

### Core Engagement Metrics

| Metric | Definition | Formula |
|--------|-----------|---------|
| DAU | Daily Active Users | Unique users who logged in/used the product that day |
| WAU | Weekly Active Users | Unique users within 7 days |
| MAU | Monthly Active Users | Unique users within 30 days |
| DAU/MAU | Stickiness | DAU / MAU |
| Session Duration | Time per session | Average time per session |
| Sessions per User | Usage frequency | Sessions per user per day/week |

### DAU/MAU Interpretation

\`\`\`
DAU/MAU = Stickiness

DAU/MAU = 50% → Users use the product 15 days per month on average (excellent)
DAU/MAU = 30% → 9 days per month (good)
DAU/MAU = 10% → 3 days per month (needs improvement)

Industry Benchmarks:
  Social Media: > 50% (Facebook ~65%)
  Messaging Apps: > 60% (LINE ~70%)
  E-commerce: 10-20%
  SaaS Tools: 15-25%
  Media/News: 10-15%
\`\`\`

### Feature Adoption Metrics

\`\`\`
Feature Adoption Rate = Users of the feature / Total active users

Feature Usage Matrix:
┌──────────────┬───────────┬───────────┐
│ Feature      │ Adoption  │ Frequency │
├──────────────┼───────────┼───────────┤
│ Core Search  │ 85%       │ Daily     │  ← Core feature
│ Filters      │ 45%       │ Weekly    │  ← Important support
│ Favorites    │ 25%       │ Weekly    │  ← Can increase promotion
│ Sharing      │ 8%        │ Monthly   │  ← Evaluate keeping/removing
│ Advanced Rpts│ 3%        │ Rarely    │  ← Consider removing
└──────────────┴───────────┴───────────┘
\`\`\`

### Power User Analysis

\`\`\`
User Segmentation (by usage frequency):
  Power Users: Use daily, 10% of users, contribute 60% of engagement
  Regular Users: Use 3-4 times/week, 25% of users
  Casual Users: Use 1-2 times/week, 30% of users
  Dormant Users: Use occasionally, 35% of users

Analysis Focus:
  1. What features do Power Users use? → This is the product's core value
  2. What drives Regular → Power conversion? → Growth lever
  3. Why do Casual → Dormant users churn? → Retention opportunity
\`\`\`

### L7 / L28 Analysis

\`\`\`
L7 = Number of days used in the past 7 days
L28 = Number of days used in the past 28 days

L7 Distribution:
  7 days (daily):   15% ← High stickiness
  5-6 days:         12%
  3-4 days:         20%
  1-2 days:         28%
  0 days:           25% ← Churn risk

Healthy L7 Distribution: U-shaped (both ends high)
  → Users either use it every day or not at all
  → The "occasional use" middle segment is the most unstable
\`\`\`

---

## 38-3: Retention / Churn

### Types of Retention

| Type | Definition | Best For |
|------|-----------|----------|
| Day N Retention | % of users who return on Day N | Apps, Games |
| Week N Retention | % of users who return in Week N | Social, SaaS |
| Bracket Retention | % who return within a time bracket | Low-frequency products |
| Rolling Retention | % who return on any day after Day N | Overall retention trends |

### Retention Curve

\`\`\`
100%
 │╲
 │ ╲
 │  ╲
 │   ╲_______________  ← Good retention (curve flattens)
 │    ╲
 │     ╲
 │      ╲
 │       ╲____________  ← Average retention
 │        ╲
 │         ╲
 │          ╲
 │           ╲  ← Poor retention (continues declining)
 │            ╲
 0──────────────────→ Time
   D1  D7  D14  D30

Industry Benchmarks (Apps):
  D1: 40-50%
  D7: 20-30%
  D30: 10-15%
  D90: 5-10% (if stable here = found PMF)
\`\`\`

### Cohort Analysis

\`\`\`
Group users by sign-up month, track retention per cohort:

         Month 0  Month 1  Month 2  Month 3  Month 4
Jan      100%     45%      30%      25%      22%
Feb      100%     48%      33%      28%      25%
Mar      100%     52%      38%      32%       -
Apr      100%     55%      40%       -        -
May      100%     58%       -        -        -

Observation:
✅ Month 1 retention improving month-over-month (45% → 58%)
→ Indicates onboarding improvements are working!
\`\`\`

### Churn Analysis

\`\`\`
Churn Rate = Churned Users / Users at Start of Period

Real impact of 5% monthly churn:
  Month 1: 1,000 users
  Month 6: 1,000 × (0.95)^5 = 774 users (-23%)
  Month 12: 1,000 × (0.95)^11 = 569 users (-43%)
  → 5% monthly churn looks small, but after a year nearly half are gone!

Revenue Churn vs Logo Churn:
  Logo Churn: Number of customers lost (customer dimension)
  Revenue Churn: Revenue lost (monetary dimension)

  If only small customers churn → High Logo Churn, Low Revenue Churn
  If large customers churn → Low Logo Churn, High Revenue Churn (more dangerous!)
\`\`\`

### Churn Prediction Model

\`\`\`
Pre-churn Behavioral Signals:
┌──────────────────────────┬───────────┐
│ Signal                   │ Risk Level│
├──────────────────────────┼───────────┤
│ Login frequency drops 50%│ Medium    │
│ Core feature usage drops │ High      │
│   to zero                │           │
│ Support complaints       │ High      │
│   increase               │           │
│ No renewal intent before │ High      │
│   contract expiry        │           │
│ NPS score < 0            │ Medium    │
│ Using competitor features│ Very High │
│   (if applicable)        │           │
└──────────────────────────┴───────────┘

Health Score = Σ(Signal × Weight)
  < 40 → Red (High churn risk)
  40-70 → Yellow (Needs attention)
  > 70 → Green (Healthy)
\`\`\`

---

## 38-4: Conversion / Monetization

### Conversion Funnel

\`\`\`
Visit → Sign-up → Activation → Trial → Paid
 100K    10K       5K          2K     500

Conversion Rates:
  Visit → Sign-up: 10%
  Sign-up → Activation: 50%
  Activation → Trial: 40%
  Trial → Paid: 25%
  Overall: 0.5%
\`\`\`

### Key Conversion Metrics

| Metric | Definition | Industry Benchmark |
|--------|-----------|-------------------|
| Free-to-Paid Conversion | Free users converting to paid | SaaS: 2-5% |
| Trial-to-Paid | Trial users converting to paid | 15-30% |
| Cart Conversion | Add-to-cart to payment | E-commerce: 30-40% |
| Upsell Rate | Upgrading to higher plan | 5-10% / year |
| Cross-sell Rate | Purchasing other products | 10-20% |

### ARPU / ARPPU

\`\`\`
ARPU = Average Revenue Per User
     = Total Revenue / Total Users
     (includes free users)

ARPPU = Average Revenue Per Paying User
      = Total Revenue / Paying Users
      (paying users only)

Example:
  Total Users: 100,000
  Paying Users: 5,000 (5%)
  Monthly Revenue: $250,000

  ARPU = $250,000 / 100,000 = $2.5
  ARPPU = $250,000 / 5,000 = $50
\`\`\`

### LTV (Customer Lifetime Value)

\`\`\`
Simple LTV Calculation:
  LTV = ARPU × Average Customer Lifespan
  LTV = ARPU / Churn Rate

Example:
  ARPU = $50/month
  Monthly Churn Rate = 5%
  LTV = $50 / 0.05 = $1,000

Advanced LTV Calculation:
  LTV = (ARPU × Gross Margin) / Churn Rate
  LTV = ($50 × 70%) / 5% = $700

LTV / CAC Ratio:
  > 3: Healthy (profitable)
  1-3: Acceptable (needs optimization)
  < 1: Dangerous (burning money)
\`\`\`

### Pricing Strategy Metrics

\`\`\`
Common SaaS Pricing Models:
┌──────────────┬──────────────┬──────────────┐
│ Pricing Model│ Example      │ Best For     │
├──────────────┼──────────────┼──────────────┤
│ Flat Rate    │ $29/month    │ Simple prods │
│ Tiered       │ Basic/Pro/Ent│ Varied needs │
│ Per Seat     │ $10/user/mo  │ Collab tools │
│ Usage-based  │ $0.01/API cal│ Dev tools    │
│ Freemium     │ Free + Paid  │ Mass market  │
└──────────────┴──────────────┴──────────────┘
\`\`\`

---

## 38-5: Metric Frameworks (AARRR, North Star)

### AARRR (Pirate Metrics)

\`\`\`
A - Acquisition
    Where do users come from?
    Metrics: New Users, CAC, Channel Conversion Rate

A - Activation
    Do users experience the product's value?
    Metrics: Activation Rate, Time to Value

R - Retention
    Do users come back?
    Metrics: D1/D7/D30 Retention, DAU/MAU

R - Revenue
    Do users pay?
    Metrics: ARPU, LTV, Conversion Rate

R - Referral
    Do users recommend others?
    Metrics: NPS, Viral Coefficient, Referral Rate
\`\`\`

### AARRR Dashboard Example

\`\`\`
┌─────────────┬──────────┬──────────┬──────────┐
│ Stage       │ This Mo  │ Last Mo  │ Change   │
├─────────────┼──────────┼──────────┼──────────┤
│ Acquisition │ 15,000   │ 12,000   │ +25% ✅  │
│ Activation  │ 4,500    │ 3,000    │ +50% ✅  │
│ Retention   │ 2,250    │ 1,800    │ +25% ✅  │
│ Revenue     │ $112,500 │ $81,000  │ +39% ✅  │
│ Referral    │ 675      │ 450      │ +50% ✅  │
└─────────────┴──────────┴──────────┴──────────┘
\`\`\`

### North Star Metric

\`\`\`
North Star Metric = The single metric that best reflects the product's core value

Characteristics:
1. Represents the core value users receive
2. Highly correlated with long-term revenue
3. The entire company can align around it

North Star by Product:
┌──────────────┬──────────────────────────┐
│ Product      │ North Star Metric        │
├──────────────┼──────────────────────────┤
│ Airbnb       │ Nights booked            │
│ Spotify      │ Time spent listening     │
│ Slack        │ Daily messages sent      │
│ Shopify      │ Merchant GMV             │
│ Netflix      │ Monthly viewing hours    │
│ Facebook     │ DAU                      │
│ Uber         │ Weekly rides completed   │
└──────────────┴──────────────────────────┘
\`\`\`

### Building a Metric Tree

\`\`\`
North Star: Monthly Completed Orders

Monthly Orders
├── Active Buyers
│   ├── New Buyers (Acquisition)
│   │   ├── Paid traffic
│   │   ├── Organic traffic
│   │   └── Referral traffic
│   └── Returning Buyers (Retention)
│       ├── Push notification reach rate
│       └── Email open rate
├── Orders per Buyer (Frequency)
│   ├── Product catalog breadth
│   ├── Recommendation accuracy
│   └── Promotions
└── Order Completion Rate (Conversion)
    ├── Search success rate
    ├── Checkout conversion rate
    └── Payment success rate
\`\`\`

### Input Metrics vs Output Metrics

\`\`\`
Output Metrics (Result metrics):
  Revenue, DAU, Retention Rate
  → Tell you "how things turned out" but can't be directly improved

Input Metrics (Driver metrics):
  Onboarding completion rate, Feature usage frequency, Notification reach rate
  → Tell you "what to improve" and are directly actionable

A good metric system = Output + Input
  Output: Monthly revenue growth 10%
  Input: Activation Rate from 20% → 35%
         Checkout conversion from 25% → 35%
         Referral rate from 5% → 10%
\`\`\`

---

## 38-6: Product Metrics Case Study

### Case: Designing a Metric System for a Music Streaming App

\`\`\`
Background:
You are a Product Analyst for a music streaming app (similar to Spotify).
The product has a free tier (with ads) and a paid tier ($9.99/month).
MAU: 5 million, paid user ratio: 8%.
\`\`\`

### Step 1: Define the North Star

\`\`\`
North Star Metric: Monthly Listening Hours
  Why?
  - Reflects the core value users get from the product
  - More listening hours → Better retention → Higher paid conversion
  - Drives both ad revenue (free tier) and subscription revenue (paid tier)
\`\`\`

### Step 2: Establish AARRR Metrics

\`\`\`
Acquisition:
  - New user sign-ups: 50K/month
  - CAC: $5 (paid ads), $0 (organic)
  - Channel distribution: Organic 60%, Paid 25%, Referral 15%

Activation:
  - Activation definition: Listen to ≥ 3 songs within 7 days
  - Activation Rate: 55%
  - Time to Value: 2 days (median)

Retention:
  - D1 Retention: 60%
  - D7 Retention: 40%
  - D30 Retention: 25%
  - DAU/MAU: 35%

Revenue:
  - Free-to-Paid Conversion: 8%
  - ARPU: $2.5/month (including free users)
  - ARPPU: $9.99/month
  - LTV: $120 (paid users average 12 months retention)
  - Ad Revenue per Free User: $0.8/month

Referral:
  - NPS: 35
  - Viral Coefficient: 0.3 (each user brings 0.3 new users)
  - Referral Rate: 5%
\`\`\`

### Step 3: Identify the Biggest Lever

\`\`\`
Analyzing improvement potential at each stage:

                 Current  Benchmark  Gap     Potential Impact
Activation       55%      65%        10%     +25K MAU
D30 Retention    25%      30%        5%      +125K MAU
Free-to-Paid     8%       12%        4%      +$800K annual revenue
DAU/MAU          35%      40%        5%      +50K listening hrs/day

Conclusion:
1. Biggest lever = Activation (impacts all downstream metrics)
2. Secondary lever = Free-to-Paid (directly impacts revenue)
\`\`\`

### Step 4: Design Improvement Plans

\`\`\`
Plan 1: Improve Activation (Target 55% → 65%)
  - On first login, use AI to recommend 10 songs (based on taste preferences)
  - Auto-create a "Daily Mix" playlist
  - 3 days without return → Push notification "New songs you might like"
  Expected Impact: Activation +10% → Downstream Retention and Revenue improve accordingly

Plan 2: Increase Free-to-Paid (Target 8% → 12%)
  - Free Premium trial for 7 days (currently only 3 days)
  - Push upgrade prompts to high-frequency users
  - Annual plan ($7.99/month vs $9.99/month)
  Expected Impact: 100K additional paid users per year, +$3.6M annual revenue

Plan 3: Improve DAU/MAU (Target 35% → 40%)
  - Daily personalized recommendation push
  - Add Podcast content (expand use cases)
  - Social features (see what friends are listening to)
\`\`\`

### Step 5: Track & Iterate

\`\`\`
Weekly Metrics Dashboard:
┌──────────────────┬──────┬──────┬──────┐
│ Metric           │Target│Actual│Status│
├──────────────────┼──────┼──────┼──────┤
│ Monthly Listening │ 8M hr│ 7.5M │ ⚠️  │
│   Hours (NSM)    │      │      │      │
│ New User Sign-ups│ 55K  │ 52K  │ ⚠️  │
│ Activation Rate  │ 65%  │ 60%  │ 📈   │
│ D30 Retention    │ 30%  │ 27%  │ 📈   │
│ Free-to-Paid     │ 12%  │ 9.5% │ 📈   │
│ ARPU             │ $3.0 │ $2.7 │ ⚠️  │
│ NPS              │ 40   │ 37   │ 📈   │
└──────────────────┴──────┴──────┴──────┘
\`\`\`

### Interview Verbal Response

\`\`\`
"I would choose 'Monthly Listening Hours' as the North Star Metric,
 because it directly reflects the core value users get from the product.

 After analyzing the AARRR funnel, I believe the biggest improvement lever is Activation.
 The current Activation Rate is only 55%, below the industry benchmark of 65%.
 If we can raise it to 65%, downstream Retention and Revenue will both improve.

 The specific plan is to use AI to recommend personalized playlists
 upon a new user's first login, helping users experience the product's value faster.
 Additionally, push notifications within 3 days would re-engage users who haven't returned.

 I would design an A/B Test to validate the effect,
 using Activation Rate as the primary metric
 and D7 Retention as the secondary metric, ensuring the improvement is not just short-term."
\`\`\`

---

## Key Takeaways - World 38 Cheat Sheet

### Product Metrics Quick Reference

\`\`\`
Activation:
  Activation Rate, Time to Value, Setup Completion
  Key: Help users experience core value as quickly as possible

Engagement:
  DAU / MAU / DAU÷MAU (Stickiness)
  Feature Adoption, Session Duration
  L7 / L28 Distribution

Retention:
  Day N Retention, Cohort Analysis
  Retention Curve: Look for "does it flatten"
  5% monthly churn → 43% user loss in one year

Conversion / Monetization:
  Free-to-Paid, ARPU / ARPPU, LTV
  LTV / CAC > 3 = Healthy

AARRR:
  Acquisition → Activation → Retention → Revenue → Referral
  Find the biggest drop-off → Biggest improvement lever

North Star Metric:
  Single metric reflecting core value
  Spotify = Listening hours
  E-commerce = Order count
  SaaS = Active usage volume

Input vs Output:
  Output = Results (Revenue, DAU) → Shows performance
  Input = Drivers (Activation Rate) → Actionable
\`\`\`

### Interview Answer Framework

\`\`\`
1. Define North Star (Why this metric?)
2. Decompose with AARRR funnel
3. Find the biggest gap (vs industry benchmarks)
4. Propose improvement plan (specific, quantifiable)
5. Explain validation approach (A/B Test, tracking metrics)
\`\`\`
`;

export default world38_en;
