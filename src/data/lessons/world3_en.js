const world3_en = `
# World 3: Data Analysis Thinking

> Learn to analyze data using structured methods, digging from surface-level observations down to root causes. This is the core competency tested in Case Study interviews.

In interviews, what interviewers most want to see isn't how many tools you know, but whether your **analytical thinking is clear and structured**.
World 3 teaches you the five most important analytical methods, which can cover approximately 80% of interview scenarios.

---

## 3-1: Trend Analysis

### What Is Trend Analysis?

Trend Analysis is observing how a metric changes over time to determine whether it represents a **real problem** or **normal fluctuation**.

### Why Is It Important?

A common interview opener is: "A certain metric dropped by X%. What do you think?"
Your first reaction should NOT be to immediately search for causes — instead, first confirm: **Is this decline real?**

### Key Questions for Evaluating Trends

1. **Time Range**: Looking at 1 day vs 30 days vs 1 year can lead to completely different conclusions
2. **Seasonality**: Weekends, month-end, holidays all affect data
3. **Base Effect**: An unusually high or low baseline last year can distort YoY comparisons
4. **One-time Events**: Promotions, system outages, media coverage, etc.
5. **Statistical Significance**: Small sample fluctuations do not equal trends

### How to Answer in Interviews

> "Before analyzing causes, I would first look at the historical trend of this metric. Was the decline sudden or gradual? Are there seasonal factors? How does it compare to the same period last year? This helps me confirm whether this is a real problem worth investigating."

### Common Traps

- Panicking at a number decline without first examining context
- Looking only at absolute values, not ratios (e.g., orders down 10%, but traffic also down 12%)
- Ignoring external factors (competitor activity, market conditions, policy changes)

---

## 3-2: Funnel Analysis

### What Is a Funnel?

A funnel breaks the user's end-to-end journey into a series of steps, showing how many people drop off at each step.

### Classic Funnel Examples

**E-commerce Shopping Funnel:**
- Browse product page → 100%
- Add to cart → 30%
- Begin checkout → 15%
- Complete payment → 8%

**SaaS Registration Funnel:**
- Visit Landing Page → 100%
- Click "Free Trial" → 12%
- Complete registration → 8%
- Complete Onboarding → 5%
- Become a paying user → 1.5%

### Steps for Analyzing a Funnel

1. **Draw the complete funnel**: From the user's first touchpoint to the final goal
2. **Calculate the conversion rate at each step**: Which step has the most drop-off?
3. **Find the biggest drop-off**: This is the most worthwhile area to improve
4. **Segment the funnel**: What does the funnel look like for different user groups?
5. **Check time trends**: Has the recent drop-off become worse than before?

### Interview Tips

When the interviewer asks "Why did conversion decline?", your first step is always:
> "I would first break conversion into each step of the funnel and identify which step has the biggest drop-off."

### Advanced Concepts

- **Micro-conversion**: Small conversion steps between major milestones
- **Time-to-convert**: How long it takes users to complete the funnel
- **Repeat funnel**: The funnel for repeat purchases and renewals differs from the first purchase

---

## 3-3: Segmentation

### Why Segment?

Because **averages lie**.

Example: Overall retention is 40%, which looks okay. But when you slice it:
- Users from organic search: retention 55%
- Users from paid ads: retention 20%

The overall 40% is just a blended result of two groups. The real problem is the poor quality of users from paid ads.

### Common Segmentation Dimensions

| Dimension | Examples |
|-----------|---------|
| Behavior | High-frequency vs low-frequency users, Feature A users vs Feature B users |
| Source | Organic vs Paid, Referral vs Direct |
| Demographics | Region, language, company size (B2B) |
| Time | New users vs veteran users, different registration months |
| Plan | Free vs Paid, Basic vs Pro |

### Steps for Segmentation Analysis

1. First examine overall data to confirm there's a problem
2. Choose a dimension you hypothesize is most likely relevant and slice the data
3. Compare performance differences across segments
4. If differences are large → Investigate that segment deeper
5. If differences are small → Try a different dimension

### Golden Interview Phrase

> "Is this problem across the board, or concentrated in a specific segment? I would first slice by [dimension] to find out."

### Simpson's Paradox

A counterintuitive statistical phenomenon: Every subgroup is improving, yet the overall metric is deteriorating.
The reason: The proportion of subgroups has changed.

Example: School A has a higher acceptance rate than School B in every department, but School A's overall acceptance rate is lower than School B's.
This is because more students at School A applied to departments with lower acceptance rates.

Mentioning this concept in an interview earns bonus points.

---

## 3-4: Cohort Analysis

### What Is a Cohort?

A cohort groups users by "time of joining" and tracks how each group's behavior changes over time.

### Why Not Just Look at the Overall?

Because overall data blends users at different stages:
- Veteran users who joined 3 months ago (already very familiar with the product)
- New users who joined last week (still exploring)

Mixing them together when looking at retention, usage, and other metrics masks the true trend.

### How to Read a Cohort Table

|  | Week 0 | Week 1 | Week 2 | Week 3 | Week 4 |
|--|--------|--------|--------|--------|--------|
| Jan cohort | 100% | 45% | 38% | 35% | 34% |
| Feb cohort | 100% | 42% | 33% | 30% | 28% |
| Mar cohort | 100% | 38% | 28% | 24% | — |

From this table, you can see: retention for newer cohorts is declining month over month, indicating the recent user experience is deteriorating.

### Applications of Cohort Analysis

1. **Retention Tracking**: Is retention for each month's new users improving?
2. **Revenue per Cohort**: How does LTV differ for users who joined at different times?
3. **Feature Impact**: Is there a difference in cohort performance before and after a feature launch?
4. **Marketing Effectiveness**: Comparing the quality of users brought by different campaigns

### Interview Tip

> "Looking at overall retention directly can be diluted by user base growth. I recommend using cohort analysis, grouping by registration month, to see whether each cohort's retention curve is improving or deteriorating."

---

## 3-5: Root Cause Thinking

### What Is a Root Cause?

A root cause is the deepest underlying reason for a problem. The "symptoms" you see on the surface are often not the real problem.

### The 5 Whys Method

Ask "Why" five times in succession:

1. Why did conversion decline? → Checkout page bounce rate increased
2. Why did bounce rate increase? → Page load speed slowed down
3. Why did loading slow down? → A new third-party payment SDK was added
4. Why does the SDK slow things down? → It synchronously loads 3MB of JavaScript
5. Why is it loaded synchronously? → Lazy loading wasn't implemented

→ Root cause: The new payment SDK wasn't configured with lazy loading

### The MECE Principle

When listing possible causes, ensure they are MECE (Mutually Exclusive, Collectively Exhaustive):
- **Mutually Exclusive**: No overlap between causes
- **Collectively Exhaustive**: All possible causes are listed

### Issue Tree

Expand the problem like a tree:

Metric decline →
- Numerator issue (target behavior decreased)
  - New users' target behavior decreased
  - Existing users' target behavior decreased
- Denominator issue (base changed)
  - Traffic source changed
  - User composition changed

### Application in Interviews

When the interviewer asks "A metric dropped — how would you investigate?", demonstrate your root cause thinking:

1. **Confirm the problem**: How much did it drop? When did it start?
2. **Decompose the structure**: Use an issue tree or MECE to list possible causes
3. **Eliminate hypotheses**: Use data to verify or rule out each one
4. **Find the root cause**: The deepest, actionable cause
5. **Provide recommendations**: Solutions targeting the root cause

> "I wouldn't guess causes directly. I would first list possible causes in a MECE manner, then use data to eliminate them one by one to find the true root cause."

---

## 3-6: Boss — Complete Data Investigation

The Boss challenge strings together all five skills:

1. First use **Trend Analysis** to confirm the problem is real
2. Use **Funnel Analysis** to find which step the problem occurs at
3. Use **Segmentation** to see if it's concentrated in a specific group
4. Use **Cohort Analysis** to track time trends
5. Use **Root Cause Thinking** to dig down to the deepest reason

This is the complete answer framework for "A metric dropped — how would you investigate?" in interviews. Practice until you can naturally string these five steps together, and you'll be well-prepared for interviews.

---

## Chapter Summary

| Skill | Core Question | Golden Interview Phrase |
|-------|--------------|------------------------|
| Trend Analysis | Is this a real problem? | "I would first look at the historical trend and seasonality" |
| Funnel Analysis | Which step has the problem? | "I would break it into a funnel and find the biggest drop-off" |
| Segmentation | Who is most affected? | "I would slice by segment to investigate" |
| Cohort Analysis | Is the problem worsening? | "I would use cohort analysis to track trends" |
| Root Cause | What is the deepest cause? | "I would list hypotheses using MECE and eliminate them one by one" |
`;
export default world3_en;
