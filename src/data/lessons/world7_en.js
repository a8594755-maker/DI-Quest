const world7_en = `
# World 7: Experiment & Validation

> Learn to validate your analytical conclusions using scientific methods. Demonstrating in interviews that "I don't just guess — I know how to validate" is what separates junior from senior analysts.

In business analysis, generating hypotheses is only the first step. The real value is: can you design a method to verify whether your hypothesis is correct?
This chapter teaches you A/B testing, hypothesis design, and how to avoid common analytical pitfalls.

---

## 7-1: Hypothesis Design

### What Makes a Good Hypothesis?

A good hypothesis has three components:

1. **Intervention (what change to make)**: Specific and actionable
2. **Expected Outcome (predicted result)**: Measurable with a metric
3. **Rationale (why you believe this)**: Supported by logic or data

### Hypothesis Formula

> If we [make what change], then [what result will occur], because [why we believe this]

### Good Hypotheses vs Bad Hypotheses

| Bad Hypothesis | Good Hypothesis |
|---------------|----------------|
| "Search isn't working well" | "If we add ratings to search results, CTR will increase by 15%, because users can more quickly judge product quality" |
| "Users don't like our app" | "If we simplify onboarding from 5 steps to 2, Day 1 retention will increase by 10%, because currently 60% of users get stuck at step 3" |
| "We should do more marketing" | "If we shift 30% of paid ads budget from Google to TikTok, acquisition cost for users under 25 will decrease by 20%, because our target demographic uses TikTok more frequently" |

### Prioritization Principles for Hypotheses

In interviews, you'll list multiple hypotheses. Criteria for prioritization:

1. **Verifiability**: Hypotheses that can be quickly verified with existing data go first
2. **Impact**: If true, how large is the impact?
3. **Cost**: How many resources are needed for validation?

---

## 7-2: A/B Test Fundamentals

### What Is an A/B Test?

Randomly split users into two groups:
- **Control**: Sees the original version
- **Treatment**: Sees the new version

Compare the performance difference between the two groups to determine whether the new version is truly better.

### Why Randomize?

Because random assignment eliminates **selection bias**. If users self-select, those who like trying new things would choose the new version, making results unreliable.

### A/B Test Design Checklist

1. **Define the hypothesis**: If / Then / Because
2. **Choose metrics**: Primary + Guardrail
3. **Determine split ratio**: Typically 50/50
4. **Calculate sample size**: How many users are needed to detect the effect
5. **Set experiment duration**: At least one full business cycle (typically 1-2 weeks)
6. **Exclude interference**: Are there other changes happening simultaneously?

### Common Mistakes

- **Stopping too early**: Results look good so you end early → Could be random fluctuation
- **Multiple comparisons**: Looking at 20 metrics simultaneously — one will be "significant" by chance → Correction needed
- **Contamination**: Control and Treatment users influence each other
- **Novelty Effect**: Everything new attracts curiosity at first → Wait for the effect to stabilize before judging

---

## 7-3: Metric Selection and Guardrails

### Primary Metric

The metric that directly measures your hypothesis.

Selection criteria:
- Directly related to the hypothesis outcome
- Observable during the experiment period (don't choose a metric that takes 6 months to show results)
- The magnitude of change can be detected

### Guardrail Metrics

Metrics that "must not deteriorate." Ensures improvements don't have side effects.

| Experiment | Primary | Guardrail |
|-----------|---------|-----------|
| Recommend more premium products | Revenue per user | CTR, return rate |
| Simplify registration flow | Registration completion rate | Account quality (bot registration rate) |
| Reduce email notifications | Unsubscribe rate | DAU, purchase rate |

### Interview Tip

Always mention both primary and guardrail together:
> "I would use X to measure the improvement, while monitoring Y to ensure there are no negative impacts."

---

## 7-4: Sample Bias

### What Is Sample Bias?

When your sample doesn't represent the overall population, your conclusions become unreliable.

### Common Types of Bias

| Type | Description | Example |
|------|-------------|---------|
| Selection Bias | Sample isn't randomly selected | Only surveying "current users," ignoring those who churned |
| Survivorship Bias | Only looking at "surviving" cases | Analyzing traits of successful startups while ignoring failures |
| Response Bias | Respondents aren't representative | Satisfaction surveys only get responses from the very satisfied and very dissatisfied |
| Time Bias | Timing isn't representative | A survey conducted during a promotion doesn't represent normal conditions |

### How to Demonstrate This in Interviews

When the interviewer says "data shows X is better than Y," you should ask:
> "Was this comparison based on random assignment or self-selected? If the latter, there may be selection bias."

---

## 7-5: Correlation vs Causation

### Correlation Does Not Equal Causation

When A and B appear together, there are three possibilities:

1. **A causes B**
2. **B causes A** (reverse causation)
3. **C causes both A and B** (confounding variable)

### Classic Examples

- Ice cream sales ↑ and drowning incidents ↑ are correlated → Ice cream doesn't cause drowning; summer is the confounding variable
- Users of a feature have higher retention → It may not be the feature keeping them; active users are inherently more likely to use features

### How to Establish Causation

1. **A/B Test** (strongest): Random assignment eliminates all confounding variables
2. **Natural Experiment**: Find a naturally occurring "split" event
3. **Control Variables**: Statistically control for known confounding variables
4. **Difference-in-Differences**: Compare changes before and after intervention between treatment and control groups

### Golden Interview Phrase

> "This data shows correlation. To confirm causation, I would recommend running an A/B test. If experimentation isn't feasible, we could use regression analysis with control variables."

---

## 7-6: Boss — Experiment Design Case

The Boss challenge tests you on designing a complete validation plan:

1. Convert a business problem into a testable **hypothesis**
2. Select the correct **Primary and Guardrail metrics**
3. Design an **A/B test** (split, sample size, duration)
4. Anticipate potential **biases** and risks
5. Interpret experiment results (including non-significant outcomes)

If you can do all of this, you've achieved the experimental thinking of a senior analyst.

---

## Chapter Summary

| Skill | Core Concept | Golden Interview Phrase |
|-------|-------------|------------------------|
| Hypothesis | If / Then / Because | "My hypothesis is..., and I would use X to validate it" |
| A/B Test | Random split + control group | "I would run an A/B test, 50/50 split, for 2 weeks" |
| Metrics | Primary + Guardrail | "Use X to measure improvement, use Y to ensure no side effects" |
| Sample Bias | Sample doesn't represent the whole | "This comparison has a risk of selection bias" |
| Correlation | Correlation ≠ Causation | "We need an A/B test to confirm causation" |
`;
export default world7_en;
