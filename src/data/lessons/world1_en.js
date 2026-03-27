const world1_en = `
# World 1: Problem Decomposition Fundamentals

> **Goal:** After completing this world, you will be able to decompose vague business problems into structured analytical frameworks and answer any Case Study question with clear reasoning.
> **Target Roles:** Business Analyst, Product Analyst, Data Analyst, Strategy Analyst
> **Estimated Study Time:** 3-4 hours

---

## 1-1: Problem Classification — Business / Product / System

### Why Is Classification the First Step?

When an interviewer throws a problem at you, the first thing that should light up in your mind is: **What type of problem is this?**

Different types of problems require different analytical frameworks, different data, and different stakeholders. If you misclassify from the start, your entire analysis will go off track.

### Three Problem Types

| Type | Core Focus | Common Keywords | Typical Example |
|------|-----------|-----------------|-----------------|
| **Business Problem** | Revenue, cost, market strategy | revenue, growth, market share, pricing | "Our revenue growth is slowing down" |
| **Product Problem** | User experience, features, adoption | conversion, engagement, retention, NPS | "Users aren't using our new feature" |
| **System / Process Problem** | Efficiency, workflow, system stability | SLA, throughput, latency, error rate | "Customer service handling time has increased" |

### How to Judge? Look at "Where the Pain Point Is"

Ask yourself three questions:

1. **Is the way we make money broken?** → Business Problem
2. **Is the user's experience with the product broken?** → Product Problem
3. **Is the way we do things or our system efficiency broken?** → System Problem

### Practical Case Exercises

**Case: "Customer service ticket handling time went from 2 hours to 8 hours"**

- On the surface it looks like a customer service issue, but what is the essence?
- Has the business model changed? No. Is the product broken? Not necessarily. Has the workflow slowed down? Yes.
- → **System / Process Problem**

**Case: "Our app's daily active users dropped by 30%"**

- This problem could have multiple causes, but the core pain point is the interaction between users and the product
- → First classify as **Product Problem**, then decompose further

**Case: "A competitor launched a free version, and our new customer numbers are declining"**

- The pain point is in market competition and pricing strategy
- → **Business Problem**

### Note: Problems Overlap

A single problem may involve multiple types. For example, "customer churn rate is increasing" could be Product (product lacks value), Business (pricing too high), or System (service quality too poor).

**Interview approach:** Start analyzing with the most likely type, then tell the interviewer your reasoning. If you discover it's wrong during analysis, adjust. Interviewers evaluate your thinking process, not whether you guessed correctly from the start.

> 💡 **Framework Tip:** First step in problem classification — determine Business / Product / System, then select the corresponding analytical framework.

---

## 1-2: Steps for Decomposing Problems

### Four Steps for Structured Decomposition

When you receive a problem, don't rush to find answers. Follow these four steps:

#### Step 1: Identify the Metric

Convert the vague problem into a specific number.

- ❌ "Business is bad" → Too vague
- ✅ "Monthly revenue dropped from $500K to $420K, a 16% decline" → Analyzable

#### Step 2: Break Down the Funnel

Almost every business problem can be broken into a funnel.

**Revenue Funnel:**
\`\`\`
Revenue = Traffic × Conversion Rate × Average Order Value × Repeat Rate
\`\`\`

**SaaS User Funnel:**
\`\`\`
Awareness → Acquisition → Activation → Retention → Revenue → Referral (AAARRR)
\`\`\`

**Customer Service Efficiency Funnel:**
\`\`\`
Ticket received → Assignment → Pickup → Investigation → Reply → Closure
\`\`\`

After breaking it into a funnel, find **the step with the biggest drop-off**.

#### Step 3: Generate Hypotheses

Based on funnel data, hypothesize "why there's a drop."

Good hypotheses have three characteristics:
1. **Timing alignment** — The timing of the problem matches a certain change
2. **Logical reasoning** — The cause-and-effect relationship makes sense
3. **Verifiable** — You know what data or method to use for confirmation

#### Step 4: Prioritize & Validate

You may have several hypotheses — validate the most likely one first.

### Practical Case: SaaS Activation Rate Decline

**Problem:** New user 7-day activation rate dropped from 45% to 32%

**Step 1:** Metric = 7-day activation rate, defined as creating the first project within 7 days of registration

**Step 2:** Funnel Decomposition

| Step | Last Month | This Month | Drop |
|------|-----------|------------|------|
| Registration completed | 100% | 100% | — |
| Onboarding completed | 78% | 61% | -17pp |
| First project created | 45% | 32% | -13pp |

The biggest drop-off is at the onboarding step (-17pp).

**Step 3:** Hypotheses
- Hypothesis A: Onboarding was changed from 3 steps to 5 steps 3 weeks ago; the new steps created friction ✅ Timing aligns, logic is sound
- Hypothesis B: New Google Ads brought low-quality traffic ⚠️ Possible, but timing is slightly later
- Hypothesis C: Server outage ❌ Only 2 hours, limited impact

**Step 4:** Validate Hypothesis A first → Compare the completion rate of each step before and after the redesign

> 💡 **Framework Tip:** Four decomposition steps: Metric → Funnel → Hypotheses → Validate. Walk through this process in an interview, and the interviewer will see you have structure.

---

## 1-3: What to Do When Information Is Insufficient

### The Most Common Trap in Interviews

The interviewer asks you: "Our app's user engagement isn't good enough. How would you analyze it?"

**Beginner's reaction:** Jump straight into analysis, listing a bunch of possible causes.

**Expert's reaction:** Ask questions first to turn the vague problem into a clear one.

### Three Must-Ask Questions

No matter what vague problem you encounter, ask these three first:

#### 1. Definition — What is the definition?

"Engagement isn't good enough — what specifically does 'engagement' refer to here? DAU? WAU? Session duration?"

#### 2. Baseline — Compared to what?

"Not good enough compared to last month? Compared to the same period last year? Compared to competitors? Compared to your target?"

#### 3. Scope — How wide is the impact?

"Is it declining across all users, or is a specific segment particularly affected? Is it declining on all platforms, or just mobile?"

### Why Asking Questions Earns You Points

Interviewers deliberately give vague problems to see if you will proactively seek clarity.

- Answering directly → Interviewer thinks you lack rigor
- Asking the right questions → Interviewer thinks you have experience and structure

### What If There's No Data?

The interviewer might follow up: "Assume you don't have any analytics dashboard. You need to give your boss a preliminary assessment tomorrow. What would you do?"

**Qualitative Data Sources:**

| Source | Useful For | Difficulty to Obtain |
|--------|-----------|---------------------|
| Customer service tickets / complaint logs | What problems users are facing | Low |
| App Store / Google Play reviews | What users care about most | Low |
| Sales team feedback | Why customers aren't buying / renewing | Medium |
| Social media mentions | Brand perception and sentiment | Low |
| Using the product yourself (dogfooding) | Experiencing workflow issues | Low |
| Interviewing 3-5 users | Deep understanding of behavior and motivation | Medium |

**Key Principle:** When you don't have quantitative data, use qualitative signals to form hypotheses, then find a way to validate with data.

### Practical Demonstration

**Interviewer:** "Our user retention rate isn't good."

**You:** "I'd like to clarify a few things first —
1. What's the definition of retention? D7, D30, or monthly active?
2. Is it declining compared to previous months, or has it always been at this level?
3. Is it low across all users, or specific to certain cohorts?

If there's no detailed data available right now, I'd start by looking for qualitative signals from customer service tickets and app reviews. If a lot of feedback centers on 'not knowing how to get started,' I'd hypothesize the problem is in onboarding; if it's 'used it for a few weeks and didn't find it useful,' then the problem is in product value."

> 💡 **Framework Tip:** Three tools for vague problems — Definition → Baseline → Scope. Clarify first, then analyze.

---

## 1-4: Impact Analysis of Problems

### Severity Assessment: Three-Dimensional Framework

When facing multiple problems simultaneously (common in interviews), you need a method to prioritize.

\`\`\`
Priority Score = Impact × Urgency × Irreversibility
\`\`\`

| Dimension | High | Low |
|-----------|------|-----|
| **Impact** | Affects a large number of users or significant revenue | Affects few people or small amounts |
| **Urgency** | Problem worsens with every hour of delay | Problem doesn't worsen over time |
| **Irreversibility** | Damage cannot be undone | Can be easily fixed or compensated |

### Practical Case: Three Simultaneous Problems

A fintech company, Monday morning — three problems hit your desk at once:

1. **Landing page conversion dropped** — From 5% to 4.2%
2. **12 transactions were double-charged** — Customers are complaining on Twitter
3. **New feature adoption is only 8%** — Below the expected 20%

Analysis:

| Problem | Impact | Urgency | Irreversibility | Priority |
|---------|--------|---------|-----------------|----------|
| Landing page | Potential revenue decline (Med) | Won't worsen (Low) | Adjustable (Low) | **Third** |
| Double charges | Customer trust + compliance (High) | Ongoing exposure (High) | Already charged (High) | **First** |
| New feature adoption | Wasted resources (Med) | Stable (Low) | Adjustable (Low) | **Second** |

Double charges score highest across all three dimensions and must be addressed first.

### Stakeholder Analysis

After determining problem severity, think clearly: **Who is affected?**

Using the double-charge example:
- **Directly affected:** 12 customers who were double-charged
- **Indirectly affected:** Potential customers who see the Twitter complaints
- **Internally affected:** Engineering team (needs to fix the bug), customer service team (needs to handle complaints), legal team (compliance risk), PR team (public relations crisis)
- **Decision-makers:** CEO / CFO need to know the financial impact and response plan

### Incident Report Structure

When reporting a problem to management, use this structure:

\`\`\`
1. What    — What happened?
2. Scale   — How big is the impact? (How many people, how much money, how long)
3. Why     — What is the root cause?
4. Done    — What actions have already been taken?
5. Need    — What additional resources or decisions are needed?
6. Prevent — How do we prevent it from happening again?
\`\`\`

This structure is also very effective in interviews. When the interviewer asks "How would you report this problem to your boss?", answering with these six points will make you look very professional.

> 💡 **Framework Tip:** Priority = Impact × Urgency × Irreversibility. Handle the irreversible and high-impact issues first.

---

## 1-5: Structured Thinking Exercise

### Adoption Analysis: Three-Layer Model

When a product / tool / feature's usage rate falls below expectations, use these three layers to decompose:

\`\`\`
Awareness → Trial → Value
Do they know about it? → Did they try it? → Is it valuable?
\`\`\`

Each layer has different problems and solutions:

| Layer | Problem | Solution Direction |
|-------|---------|-------------------|
| **Awareness** | Don't know it exists | Promotion, announcements, training |
| **Trial** | Know about it but don't want to try / tried but had a bad experience | Lower barriers, improve onboarding |
| **Value** | Tried it but didn't feel the value | Improve core functionality, find the aha moment |

### Practical Case: The Unused Expense Report System

**Scenario:** A company of 500 people needs expense reimbursement. One month after the new system launched, only 24% have used it.

| Segment | Count | Percentage |
|---------|-------|-----------|
| Continued usage | 75 | 15% |
| Used once then abandoned | 45 | 9% |
| Never used | 380 | 76% |

**Decomposition using the three-layer model:**

- **Awareness:** Survey found 85% know about the new system → Not the main issue
- **Trial:** The main reason 45 people abandoned was "too many steps to upload receipts" → **Primary problem**
- **Value:** Continuing users report "reimbursement went from 2 weeks to 3 days" → Value has been validated

### From Analysis to Recommendations

After completing the analysis, the interviewer will ask: "So what's your recommendation?"

Many people get stuck at this step — they analyze well but can't provide concrete actions.

**Good Recommendation Formula:**

\`\`\`
1. Address the Root Cause — Your recommendation should directly solve the discovered problem
2. Minimum Viable Change — Don't suggest "complete redesign"; propose the smallest change
3. Clear Validation Method — Explain how you'll know if it worked
4. Risks and Limitations — Proactively mention potential risks
\`\`\`

**Using the Expense Report System as an example:**

"Based on the analysis, the problem is concentrated at the Trial Experience layer — the receipt upload process is too complex. My recommendation is:

1. **Change:** Simplify the receipt upload process (e.g., support direct photo upload, reduce manual entry fields)
2. **Validation:** After improvement, invite the 45 people who previously abandoned to retry, and track their completion rate
3. **Promotion:** Use the positive feedback from continuing users (reimbursement went from 2 weeks to 3 days) as social proof
4. **Risk:** Requires engineering resources, estimated 2 weeks of development time. If adoption remains low after simplification, we need to re-examine whether there are other barriers."

> 💡 **Framework Tip:** Adoption three-layer decomposition — Awareness → Trial → Value → then prescribe the right remedy.

---

## 1-6 (Boss): Complete Case Decomposition

### Case Answer Framework

When answering a complete Case in an interview, use this six-step framework:

\`\`\`
Goal → Metrics → Flow → Segment → Recommend → Validate
\`\`\`

#### Step 1: Goal — Confirm the Objective

"Let me first confirm — what is the core objective of this problem? What outcome are we hoping to achieve?"

#### Step 2: Metrics — Define the Metrics

"To measure this objective, what are the most critical metrics? What are the current values? What's the target?"

#### Step 3: Flow — Decompose the Process

"Behind this metric, what does the process look like? Let me break it into several steps to examine."

#### Step 4: Segment — Slice by Groups

"Let me segment by [user type / plan / region / channel] to see whether the problem is widespread or concentrated in a specific segment."

#### Step 5: Recommend — Provide Recommendations

"Based on the analysis, the main problem is in [specific segment] at [specific step]. My recommendation is..."

#### Step 6: Validate — Explain Validation

"I would use [method] to validate whether this recommendation is effective, with the success metric being [target metric]."

### Complete Case Demonstration: Declining Renewal Rate

**Problem:** B2B SaaS annual renewal rate dropped from 85% to 72%

**Step 1: Goal**
"The objective is to identify the root cause of the renewal rate decline and propose a plan to bring the renewal rate back to at least 80%."

**Step 2: Metrics**
"The primary metric is the annual renewal rate, which dropped from 85% to 72% — a 13pp decline. As secondary metrics, I would look at renewal rates by plan, usage patterns, and NPS."

**Step 3: Flow**
"The renewal process is roughly: Use the product → Experience value → Receive renewal reminder → Decide to renew. Each step could lead to churn."

**Step 4: Segment**
After segmentation:

| Plan | Customers | Renewal Rate Change |
|------|-----------|-------------------|
| Starter ($99/yr) | 2,000 | 78% → 61% (-17pp) |
| Professional ($499/yr) | 800 | 88% → 82% (-6pp) |
| Enterprise ($2,999/yr) | 150 | 95% → 93% (-2pp) |

The problem is concentrated in the Starter plan. Further investigation reveals:
- Starter users use only 3 out of 15 features on average
- Non-renewers stopped using the product 60 days before expiration
- 6 months ago, the Gantt Chart feature was moved from Starter to Professional
- Most common customer service inquiry: "Where did the Gantt Chart go?"

**Root Cause:** A core feature was removed from the Starter plan, causing users to lose their reason to stay.

**Step 5: Recommend**
"I have two recommendations, one short-term and one long-term:

Short-term (1-2 weeks): Restore a simplified version of the Gantt Chart to Starter (keep advanced features in Professional as an upsell incentive). Simultaneously, proactively contact Starter customers approaching expiration to inform them of the feature restoration.

Long-term (1-3 months): Build a Health Score early warning system — when a user hasn't logged in for 30 days, automatically trigger CSM outreach instead of waiting until renewal time."

**Step 6: Validate**
"I would track:
- Whether the Starter renewal rate returns to 70%+ in the next quarter
- The usage rate of the simplified Gantt Chart
- The percentage of users who return due to outreach
If the Starter renewal rate doesn't improve, we need to re-examine whether other factors are at play (e.g., competitors' free alternatives)."

---

## Appendix: Essential Framework Quick Reference

### 🔹 Problem Classification

\`\`\`
Business Problem → Affects revenue, strategy, market positioning
Product Problem  → Affects user experience, features, adoption
System Problem   → Affects efficiency, cost, stability
\`\`\`

### 🔹 Four Steps for Problem Decomposition

\`\`\`
1. Metric     — Turn the problem into a number
2. Funnel     — Break into steps, find the biggest drop-off
3. Hypotheses — Generate hypotheses based on timing and logic
4. Validate   — Validate the most likely hypothesis
\`\`\`

### 🔹 Three Tools for Vague Problems

\`\`\`
1. Definition — What is the definition of this metric?
2. Baseline   — Compared to what? (Time / Competitors / Target)
3. Scope      — How wide is the impact? (All users / Specific segment)
\`\`\`

### 🔹 Priority Assessment

\`\`\`
Priority = Impact × Urgency × Irreversibility
Handle first: High-impact, time-sensitive, irreversible problems
\`\`\`

### 🔹 Incident Report Structure

\`\`\`
What → Scale → Why → Done → Need → Prevent
\`\`\`

### 🔹 Adoption Three-Layer Analysis

\`\`\`
Awareness — Do they know? → Promote
Trial     — Did they try?  → Lower barriers
Value     — Is it useful?  → Improve functionality
\`\`\`

### 🔹 Recommendation Formula

\`\`\`
1. Address the Root Cause
2. Minimum Viable Change
3. Clear Validation Method
4. Risks and Limitations
\`\`\`

### 🔹 Case Answer Framework (Boss Must-Know)

\`\`\`
Goal      — Confirm the objective and definition of success
Metrics   — Define key metrics and gaps
Flow      — Decompose the process to find drop-offs
Segment   — Slice by groups to find the biggest problem
Recommend — Propose recommendations addressing the root cause
Validate  — Explain the validation method and success criteria
\`\`\`

**Mnemonic: G-M-F-S-R-V (Goal Metrics Flow Segment Recommend Validate)**

Remember: Interviewers don't evaluate whether your answer is correct — they evaluate whether your **thinking process has structure**. Use frameworks to demonstrate your reasoning, and even if the conclusion isn't perfect, you'll score highly.
`;

export default world1_en;
