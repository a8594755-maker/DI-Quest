const world8_en = `
# World 8: Recommendation & Mock Interview

> Combine all the skills you've learned into a complete framework for answering interview Case Studies. This is your final exam.

The biggest challenge in Case Study interviews isn't "you don't know" — it's "you don't know where to start."
This chapter gives you a universal framework and six classic question types. Practice until you can answer naturally and fluently.

---

## Case Answer Framework

The universal answer framework for Case Study interviews:

### Goal → Metrics → Flow → Segment → Recommend → Validate

| Step | What to Do | Example |
|------|-----------|---------|
| **Goal** | Confirm the problem and objective | "Let me confirm — our objective is to identify the cause of the GMV decline?" |
| **Metrics** | Define and decompose metrics | "GMV = Orders × AOV. I'll first check which factor has a greater impact" |
| **Flow** | Map the process/funnel | "I'll look at conversion rates from Traffic → Browse → Add to Cart → Checkout" |
| **Segment** | Slice by dimensions | "I'll break it down by channel, user group, and category to find where the problem is concentrated" |
| **Recommend** | Propose recommendations | "Based on the analysis, I recommend prioritizing improvement of X, which should lift Y%" |
| **Validate** | Explain validation method | "I would use an A/B test to validate this recommendation" |

---

## 8-1: What to Do When a KPI Drops

This is the highest-frequency interview question type. The interviewer will say: "A certain metric dropped by X%. How would you investigate?"

### Answer Structure

1. **Confirm the problem**: How much did it drop? When did it start? How does it compare to historical data?
2. **Decompose the metric**: Break the large metric into sub-metrics (e.g., Revenue = Users × ARPU)
3. **Trend analysis**: Was it sudden or gradual? Is there seasonality?
4. **Segmentation**: Slice by different dimensions — where is the problem concentrated?
5. **Root cause**: List hypotheses and use data to eliminate them one by one
6. **Recommended actions**: Propose improvement plans targeting the root cause

### Interview Tips

- Don't guess causes from the start. Use data to narrow the scope first.
- First rule out external factors (seasonality, market changes, competitors)
- Use MECE to list hypotheses: numerator issue vs denominator issue

---

## 8-2: Is the Feature Successful?

The interviewer will ask: "This feature has launched. How do you determine whether it's successful?"

### Answer Structure

1. **Return to the goal**: What problem was this feature solving?
2. **Define success**: What is the primary metric? What are the guardrails?
3. **Adoption analysis**: How many people used it? (Discoverability → Usability → Value)
4. **Impact analysis**: What is the effect on core metrics?
5. **Trade-offs**: Are there side effects? Is there cannibalization?
6. **Recommendation**: Continue investing / Adjust direction / Discontinue

### Interview Tips

- Don't just look at usage. Usage ≠ Value.
- Watch for selection bias: users who adopted the feature performing better may not be because of the feature.
- Consider short-term vs long-term trade-offs.

---

## 8-3: How to Improve a Process

The interviewer will give you an inefficient process and ask how to improve it.

### Answer Structure

1. **Process Mapping**: Draw each step of the current process
2. **Quantify time**: Processing time and wait time for each step
3. **Find the Bottleneck**: The step with the longest wait time
4. **Improvement Plan**:
   - Remove unnecessary steps
   - Convert sequential to parallel
   - Convert manual to automated
   - Convert centralized to distributed
5. **Permissions and Audit**: Security considerations after improvements
6. **Exception Handling**: How to handle non-happy-path scenarios

### Interview Tips

- Don't rush to suggest "automate everything." First analyze which steps are suitable.
- Remember to quantify expected improvements (from X days down to Y days)
- Consider the cost and risk of changes

---

## 8-4: Dashboard Design

The interviewer will ask: "Design a dashboard for me."

### Answer Structure

1. **Confirm the Audience**: Who will view it? CEO vs PM vs Ops?
2. **Confirm Key Questions**: What questions should the dashboard answer?
3. **Select Metrics**: Cover Revenue / Growth / Retention / Efficiency
4. **Design Layers**:
   - Layer 1: 3-5 core numbers + trends
   - Layer 2: Trend charts
   - Layer 3: Drill-down by segment
5. **Action Triggers**: What numbers indicate that action should be taken?

### Interview Tips

- Don't pile on too many metrics. Less is more.
- Select metrics based on the audience (CEO sees strategy, PM sees product, Ops sees efficiency)
- Every metric should have "so what?" actionability

---

## 8-5: User Segmentation

The interviewer will ask: "How would you do user segmentation?"

### Answer Structure

1. **Confirm the purpose**: What is segmentation for? (Personalized recommendations? Marketing? Pricing?)
2. **Choose dimensions**:
   - Behavioral dimensions (usage frequency, depth, feature preferences)
   - Value dimensions (LTV, payment status)
   - Source dimensions (acquisition channel)
3. **Describe each group**: Use personas (name + behavioral traits + needs)
4. **Design strategies**: Differentiated strategies for each group
5. **Validate effectiveness**: Is the segmentation strategy better than a one-size-fits-all approach?

### Interview Tips

- Behavioral segmentation > Demographic segmentation (age and gender don't always provide differentiation)
- Each group should have an actionable strategy — don't just segment and stop
- Don't create too many segments (3-5 is most practical)

---

## 8-6: Boss — Full Mock Interview

The final Boss is a complete mock interview Case Study that requires you to combine all previous skills:

1. **Problem Decomposition** (World 1) — Understand what the problem is
2. **Metric Definition** (World 2) — Determine what to measure
3. **Data Analysis** (World 3) — Determine what methods to use for analysis
4. **Data Literacy** (World 4) — Determine what data is needed and how to find it
5. **Product Thinking** (World 5) — View from the user and product perspective
6. **Process Analysis** (World 6) — Identify process bottlenecks and improvements
7. **Experiment Validation** (World 7) — Determine how to validate your recommendations

When you can fluently walk through this framework, your interview preparation is complete.

---

## Final Interview Reminders

### Do's ✓

- Confirm the problem before analyzing (don't rush to answer)
- Use a structured framework to answer (Goal → Metrics → Flow → Segment → Recommend → Validate)
- Proactively state your hypotheses and validation methods
- Consider multiple stakeholders (don't look at just one angle)
- Be honest: "I'm not sure about this, but here's how I would investigate"

### Don'ts ✗

- Don't guess causes from the start
- Don't look at only a single metric
- Don't ignore guardrail metrics
- Don't treat correlation as causation
- Don't propose improvements without explaining how to validate them

---

## Chapter Summary

| Question Type | Framework | Golden Interview Phrase |
|--------------|-----------|------------------------|
| KPI dropped | Confirm → Decompose → Trend → Segment → Root Cause | "I would first decompose the metric, then segment to find where the problem is concentrated" |
| Feature evaluation | Goal → Metrics → Adoption → Impact → Trade-offs | "Define success first, then look at data while monitoring guardrails" |
| Process improvement | Map → Quantify → Bottleneck → Automate → Exception | "First quantify time per step, find the step with the longest wait time" |
| Dashboard | Audience → Questions → Metrics → Layers → Actions | "Select metrics based on the audience's core questions, no more than 5" |
| Segmentation | Purpose → Dimensions → Persona → Strategy → Validate | "Behavioral segmentation provides more differentiation than demographics" |
| Mock interview | Goal → Metrics → Flow → Segment → Recommend → Validate | "Let me use the Case Answer Framework to respond" |
`;
export default world8_en;
