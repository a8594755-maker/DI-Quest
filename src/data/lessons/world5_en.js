const world5_en = `
# World 5: Product Thinking

> Learn to think about problems from a product manager's perspective. The most common interview questions aren't about technical skills — they test whether you can analyze from both the user and business angles.

Product Thinking is the ability to connect "user needs" with "business objectives."
Whether you're interviewing for Product Analyst, Business Analyst, or PM, these concepts are essential.

---

## 5-1: User Journey Mapping

### What Is a User Journey?

A User Journey is the complete path a user takes from "first contact with the product" to "achieving their goal."

### Why Do Interviews Test This?

Because the root cause of many problems is hidden in a specific step of the user journey.
Drawing out the journey is how you identify where the problem lies.

### How to Draw a User Journey

A good User Journey includes:

1. **Stages**: The major phases the user goes through
2. **Actions**: What the user does at each stage
3. **Touchpoints**: Where the user interacts with the product
4. **Pain Points**: Where the user feels frustrated
5. **Emotions**: The user's emotional highs and lows

### Example: SaaS Product User Journey

| Stage | Action | Touchpoint | Pain Point |
|-------|--------|-----------|-----------|
| Awareness | Google search for a solution | Search results, Blog | Doesn't know the product exists |
| Consideration | Compare different products | Landing page, Reviews | Not sure if it's the right fit |
| Trial | Sign up for free trial | Registration page, Onboarding | Setup is too complex |
| Activation | Complete first core action | In-product guidance | Doesn't know what to do next |
| Retention | Continue using | Email, Notifications | Can't find advanced features |
| Expansion | Upgrade to a paid plan | Pricing page | Pricing isn't transparent |

### How to Use It in Interviews

Interviewer asks: "User activation rate has dropped. How would you analyze it?"

> "I would first draw the user journey from registration to activation, listing the actions and possible pain points at each step. Then I'd use funnel data to identify which step has the biggest drop-off, and segment by user group to see which users are getting stuck."

### Common Mistakes

- Looking only at the "happy path" and ignoring scenarios where users get stuck
- Assuming all users have the same journey (different segments may have very different journeys)
- Looking only at in-product experiences and ignoring out-of-product experiences (customer service, email, word of mouth)

---

## 5-2: Feature Success Evaluation

### How Do You Judge Whether a New Feature Is Successful After Launch?

This is an extremely high-frequency interview question. Interviewers want to see if you can **define success upfront**, rather than rationalizing with data after the fact.

### Evaluation Framework: Before → During → After

**Before (Pre-launch)**:
- What problem is this feature solving?
- What is the definition of success? (Specific metric + target value)
- What are the guardrail metrics? (Metrics that must not deteriorate)

**During (At launch)**:
- What is the feature's adoption rate?
- Are there any technical issues (crashes, loading time)?
- What is user feedback like?

**After (Post-launch)**:
- Did the primary metric meet the target?
- Were guardrail metrics affected?
- Are there differences in response across segments?

### Common Feature Metrics

| Metric | What It Measures | Example |
|--------|-----------------|---------|
| Adoption Rate | How many people used it | 30% of DAU used the new search |
| Usage Frequency | How often users use it | Average 3 times per week |
| Task Completion Rate | Whether users can complete the task | 85% of searches resulted in a click |
| Time-to-value | How quickly users get value | Average 2 minutes to complete a search |
| Retention Impact | Impact on retention | Users' D7 retention +5pp |

### Golden Interview Phrase

> "Before evaluating, I would first return to the feature's original intent — what problem was it solving? Then I'd define the primary metric and guardrails before looking at data."

---

## 5-3: Adoption Problem Diagnosis

### Why Is Nobody Using Your Feature?

When a feature has low adoption, the reason usually lies at one of three levels.

### Discoverability → Usability → Value: Three-Layer Model

1. **Discoverability**: Does the user know this feature exists?
   - Where is the entry point? Is it easy to find?
   - Is there any guidance or notification telling users about it?
   - Analysis method: Look at the feature entry point's impressions and click-through rate

2. **Usability**: The user tried it — but can they complete it smoothly?
   - Is the workflow smooth? Do they get stuck?
   - Are error messages clear?
   - Analysis method: Look at funnel completion rate and error rate

3. **Value**: They completed it — but didn't find it useful?
   - Does the feature solve the user's problem?
   - Did the user get the result they wanted?
   - Analysis method: Look at repeat usage (will they use it a second time?)

### How to Identify Which Layer Has the Problem

| Observation | Most Likely Problem Layer |
|------------|--------------------------|
| Very few people click into the feature | Discoverability |
| Many click but don't complete | Usability |
| Complete but don't use again | Value |
| Used once then left the product | Could be Value, or it may have harmed the overall experience |

### How to Answer in Interviews

Interviewer asks: "We built a new recommendation feature, but only 5% of users are using it. How would you analyze this?"

> "5% adoption could be a problem at three levels. I would first check discoverability — how many people saw the recommendation feature's entry point? What's the click-through rate? If impressions are high but clicks are low, it may be a design issue with the entry point. If they clicked but didn't complete the action, it's a usability problem. If they completed it but didn't use it again, it's a value problem."

---

## 5-4: Usage vs Value

### High Usage Does Not Equal High Value

This is a blind spot for many people.

Examples:
- A "search" feature is heavily used, but users average 5 searches before finding what they want → High usage, low value
- An "auto-backup" feature is rarely actively used, but with it, users don't leave because of data loss → Low usage, high value

### How to Measure Value?

| Method | Use Case | Example |
|--------|----------|---------|
| Outcome-based | Whether the feature achieves the goal | Did users click a result after searching? |
| Comparative | Difference between users vs non-users | Do users who used the feature have higher retention? |
| Counterfactual | What happens without the feature | Did metrics change when the feature was removed? |
| Survey | Ask users directly | NPS, CSAT scores |

### Interview Tip

When the interviewer uses "usage rate" to measure feature success, you can add:

> "Usage rate is a starting point, but I'm more focused on value — did users who used this feature see improvement in their target behavior? For example, did users who searched actually find products and complete purchases more easily?"

### Common Usage Traps

- **Forced usage**: The feature is in the main flow, so users have no choice (high usage but potentially low value)
- **Novelty effect**: Everyone is curious when it first launches, but stops using it after two weeks
- **Power user bias**: A small number of heavy users contribute most of the usage, while most users don't care

---

## 5-5: Discoverability vs Usability vs Value

### Complete Application of the Three-Layer Model

This model applies not only to individual features but also to analysis of the entire product.

### Analysis Tools for Each Layer

**Discoverability Analysis:**
- Impressions and click-through rate (CTR)
- User interviews: "Did you know this feature existed?"
- Heatmaps: Where users are looking on the page
- A/B testing: Comparing different entry point positions

**Usability Analysis:**
- Task completion rate
- Error rate and error types
- Time-on-task (how long it takes to complete a task)
- Funnel drop-off (attrition at each step)
- User testing (watching recordings of user interactions)

**Value Analysis:**
- Repeat usage rate (will they use it a second time?)
- Impact on downstream metrics (effect on subsequent behavior)
- User satisfaction (NPS, CSAT)
- Churn correlation (are users who don't use this feature more likely to churn?)

### Complete Interview Answer Example

Question: "Our reporting feature has been live for three months, but most users are still using Excel. How would you analyze this?"

> "I would analyze using the three-layer model:
>
> First, Discoverability: Do users know the reporting feature exists? I'd look at the feature entry point's impression count and click-through rate. If many people see it but don't click, the messaging may be unclear.
>
> Second, Usability: Can users who click in successfully create a report? I'd look at the funnel — the drop-off at each step from starting to creating to exporting a report.
>
> Finally, Value: Does the completed report meet their needs? I'd compare users who use the reporting feature with those who use Excel — is the former group more efficient? I could also conduct user interviews to understand why they still choose Excel.
>
> The solution will be completely different depending on which layer the problem is at."

---

## 5-6: Boss — Product Analysis Case

The Boss challenge gives you a complete product analysis scenario:

1. Use **User Journey** to map the user's experience
2. Define the feature's **Success Metrics**
3. Use **Discoverability / Usability / Value** to diagnose the problem
4. Distinguish **Usage vs Value**
5. Provide **improvement recommendations** and prioritize them

This is the core question type for Product Analyst interviews. Answering this type of question fluently puts you halfway to interview success.

---

## Chapter Summary

| Skill | Core Concept | Golden Interview Phrase |
|-------|-------------|------------------------|
| User Journey | Map the complete journey to find pain points | "I would first draw the user journey to find pain points" |
| Feature Evaluation | Before / During / After | "Define success first, then look at data" |
| Adoption Diagnosis | Three-layer problem model | "Is it a discoverability, usability, or value problem?" |
| Usage vs Value | Usage rate does not equal value | "I focus more on outcomes, not just usage" |
| Complete Analysis | Connecting the three-layer model | "The solution differs entirely depending on which layer the problem is at" |
`;
export default world5_en;
