const world40_en = `
# World 40: Closed-Loop Learning System

> **Objective:** Understand how DI detects model degradation, how it automatically retrains models, and how it learns from supervisor feedback
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 40-1: Why Models Degrade

### Start with a Scenario

Your forecasting model had 95% accuracy last month, but this month it suddenly dropped to 80%. The model didn't break — **the world changed**:

- Market trends shifted (a previously stable growth category suddenly declined)
- Suppliers changed (the new supplier has different lead time characteristics)
- Product mix changed (discontinued items are still being forecasted)
- Seasonal patterns changed (this year's peak season came two weeks early)

This is called **drift** — the model was trained on past data, but the current world is different from the past.

### Two Types of Drift

**Data Drift (Input Drift)** — The distribution of input data changed
- Order volumes used to cluster between 100-500; now there are suddenly many 2,000+ orders
- The model hasn't seen this kind of data and doesn't know how to forecast it

**Concept Drift** — The relationship between inputs and outputs changed
- Previously "promotion → sales up 50%," but now the market is saturated, so "promotion → sales up only 10%"
- Same inputs but the output pattern is different

> **Possible interview follow-up:**
> "Which is harder to handle, Data Drift or Concept Drift?"
> Concept Drift is harder. Data Drift can be resolved through retraining (new data distribution reflects the new reality). But Concept Drift may require changing the model architecture or feature engineering, because the old input-output relationship no longer holds.

---

## 40-2: Drift Detection — Three Thermometers

### How Does DI Detect Drift?

In \`drift_monitor.py\`, the system uses three metrics (like three thermometers) to monitor model health:

**1. MAPE Change (Accuracy Thermometer)**

MAPE = Mean Absolute Percentage Error = average prediction deviation percentage.

- Last month's MAPE = 0.12 (12% deviation, normal)
- This month's MAPE = 0.25 (25% deviation, abnormal)
- Difference = +0.13 → exceeds threshold → alert

In plain terms: **"Used to guess pretty accurately, now guessing way off"**

**2. PSI (Input Distribution Thermometer)**

PSI = Population Stability Index. It compares whether "the data distribution during training" and "the current data distribution" are consistent.

- PSI < 0.1 → Distribution stable (normal)
- PSI 0.1-0.2 → Some shift (observe)
- PSI > 0.2 → Significant shift (alert)

In plain terms: **"The shape of the incoming data has changed"**

For example: order volumes used to be \`[100, 200, 150, 300]\`, now they're \`[2000, 3000, 2500, 4000]\`. The data's "shape" is completely different.

**3. Coverage Drop (Confidence Interval Thermometer)**

Predictions don't just give a single number — they also provide a confidence interval (e.g., "predicted 500 units, 90% confident it's between 400-600").

Coverage = the proportion of actual values that fall within the confidence interval.

- Last month's Coverage = 88% (88% of predictions were within the interval — good)
- This month's Coverage = 65% (only 65% — many predictions missed)
- Dropped 23% → exceeds threshold → alert

In plain terms: **"The confidence ranges used to be reliable, now they're frequently wrong"**

### Looking at All Three Together

| Situation | MAPE | PSI | Coverage | Meaning |
|------|------|-----|----------|------|
| Everything normal | Stable | < 0.1 | > 80% | No action needed |
| Input changed | May be unchanged | > 0.2 | May drop | Data source has changed, investigate |
| Model degraded | Rising | May be normal | Dropping | Retraining needed |
| Total collapse | Sharply rising | > 0.2 | Sharply dropping | Emergency! May need to rollback to old model |

> **Possible interview follow-up:**
> "Why three metrics? Isn't one enough?"
> Because they detect different things. MAPE only shows whether results are good, but not why. PSI tells you "did the inputs change." Coverage tells you "are the model's uncertainty estimates still accurate." You need all three together to make the right decision.

---

## 40-3: Retraining Trigger Rules

### Does It Retrain Immediately Upon Detecting Drift?

**No.** There are four rules, plus safety mechanisms to prevent overreaction.

**Four Trigger Rules:**

1. **Accuracy decline** — MAPE exceeds threshold (e.g., > 0.20)
2. **Data distribution shift** — PSI exceeds 0.2
3. **Confidence interval failure** — Coverage drops by more than 15%
4. **Periodic health check** — Automatic evaluation every 30 days (regardless of drift)

**Safety Mechanisms:**

- **Cooldown period** — After triggering a retrain, no further triggers for 7 days. Prevents the death loop of "trained, still not good → trigger again → train again."
- **Dedup** — Duplicate triggers within the same time window count only once.
- **Feature Flag** — The entire closed-loop system has an on/off switch (\`DI_CLOSED_LOOP_ENABLED\`). You can observe before officially enabling it.
- **Severity levels** — Not all triggers are equally serious:
  - High: Multiple metrics exceed thresholds simultaneously → needs immediate attention
  - Medium: Single metric exceeds threshold → add to backlog
  - Low: Approaching threshold but not exceeded → continue monitoring

### What Happens After Triggering?

\`\`\`
1. Evaluate trigger conditions → confirm retraining is actually needed
2. Derive new training parameters (using the latest 90 days of data)
3. Run the retraining
4. Compare new model vs old model metrics
5. New model is better → promotion (upgrade)
6. New model is worse → keep the old model, record the reason
\`\`\`

> **Possible interview follow-up:**
> "What if the new model is worse than the old one?"
> Don't promote it. DI's model lifecycle has a promotion gate — the new model must be better (or at least not worse) than the old model in regression tests before it can replace it. This is the Release Gate concept from World 12 applied to the ML domain.

---

## 40-4: Style Learning — Quietly Learning from Supervisor Feedback

### A Story

Mei's AI Worker produced a procurement report. The supervisor reviewed it and changed the pie chart to a bar chart, then changed "recommend purchasing 2,150 components" to "recommend purchasing in three batches: first batch 800 (4/1), second batch 700 (4/15), third batch 650 (5/1)."

If this kind of modification happens only once, it might be an isolated case. But if the supervisor makes similar modifications 5 consecutive times, the system starts learning.

### Style Learning's Six Stages

**1. Capture Feedback**
Every time a supervisor reviews Worker output, the system records: what was modified, before vs after, and the magnitude of the change.

**2. Extract Style Rules** (feedbackStyleExtractor)
The system extracts rules from modifications:
- "Supervisor prefers bar charts over pie charts" → confidence 0.40 (only 1 occurrence)
- "Supervisor prefers batch delivery over single delivery" → confidence 0.40

**3. Accumulate Confidence**
Each time the same modification pattern appears, confidence increases by +0.05:
- 1st time: 0.40
- 3rd time: 0.50
- 5th time: 0.60
- 7th time: 0.70

**4. Apply to Next Output**
When confidence exceeds 0.50, the Worker automatically applies this style in the next report. The supervisor will notice "hey, I didn't need to change anything this time."

**5. Promote to Company Policy**
When confidence exceeds 0.75 **and** the supervisor confirms, the rule is promoted from "this supervisor's preference" to "company policy." After that, all Workers apply it.

**6. Continuous Evolution**
If the supervisor's preference changes (suddenly starts using pie charts again), confidence decreases and the rule adjusts.

### Relationship to Autonomy Levels

Style Learning affects trust metrics:
- Worker applies a learned style → supervisor doesn't need to edit → first_pass_acceptance_rate increases
- first_pass_acceptance_rate increases → autonomy level upgrades from A2 to A3
- Higher autonomy level → more actions can be auto-executed

**So Style Learning is the engine for autonomy level advancement.** The better it learns → the less the supervisor edits → the higher the trust → the greater the autonomy.

> **Possible interview follow-up:**
> "What if two supervisors have conflicting styles?"
> Style rules are per-Worker. Worker A learns one style from Supervisor X, Worker B learns another from Supervisor Y. Only rules promoted to "company policy" apply across Workers, and promotion requires the supervisor's explicit confirmation.

---

## 40-5: Closed-Loop Orchestration (9-Step Pipeline)

### What Does closedLoopRunner.js Do?

The core of the entire closed-loop system is \`closedLoopRunner.js\`. It's a 9-step automated pipeline:

\`\`\`
Step 1: Feature Flag check
  → DI_CLOSED_LOOP_ENABLED = true?
  → If false → do nothing

Step 2: Create audit record
  → Record "closed-loop evaluation started"
  → Even if nothing triggers later, there's a record

Step 3: Evaluate trigger conditions
  → Read latest drift metrics
  → Check four rules
  → If none triggered → record "all normal" → end

Step 4: Derive new parameters
  → Decide adjustments based on drift type
  → Example: MAPE rising → retrain with latest 90 days of data

Step 5: Record Cooldown
  → Write "last trigger time = now"
  → Won't trigger again for 7 days

Step 6: Store Artifact
  → Save trigger conditions, derived parameters, evaluation results
  → For later auditing and analysis

Step 7: Execute (three modes)
  → dry_run: evaluate only, don't execute
  → manual_approve: evaluate, then wait for supervisor approval before executing
  → auto_run: automatically execute retraining

Step 8: Record results
  → success / failure / skipped

Step 9: End
  → Complete audit trail saved
\`\`\`

### Choosing Among the Three Modes

| Mode | Plain Explanation | Best For |
|------|------|---------|
| **dry_run** | Look but don't act | When first adopting the closed-loop system; observe for a few weeks |
| **manual_approve** | Act but wait for human approval | Normal use; humans retain control |
| **auto_run** | Fully automatic | After running for several months with high confidence |

Most enterprises start with dry_run, observe for a period, then switch to manual_approve, and only then consider auto_run. **This follows the same logic as Worker autonomy levels (A1 → A4).**

> **Possible interview follow-up:**
> "Why not start with auto_run?"
> Because you need to first confirm the closed-loop system's judgment is sound. If it misjudges drift (false positive), it would unnecessarily retrain, wasting compute resources. Start with dry_run to observe "when would it trigger," confirm it's reasonable, then enable automation.

---

## 40-6 (Boss): Model Degradation Diagnosis

### Scenario

The system's drift monitor reports the following data:

\`\`\`
MAPE: 0.12 → 0.25 (up 108%)
PSI: 0.35 (far exceeds 0.2 threshold)
Coverage: 88% → 65% (down 23 percentage points)
Last retraining: 42 days ago
Cooldown status: expired (can trigger)
\`\`\`

### Your Task

1. What does each of these three metrics mean? How severe is the situation?
2. What would you recommend? Retrain immediately? Rollback first?
3. Would you use dry_run, manual_approve, or auto_run? Why?
4. After retraining, how do you confirm the new model is better than the old one?

### Evaluation Criteria

- Correctly interprets all three metrics (MAPE = prediction accuracy is poor, PSI = input distribution changed, Coverage = confidence intervals are failing)
- Judges severity: all three exceeding thresholds = total collapse, requires urgent action
- Handling strategy: first rollback to the last stable model version (stop the bleeding), while simultaneously starting retraining
- Uses manual_approve (situation is serious; full automation isn't appropriate)
- Verification method: use regression tests to compare new model vs old model MAPE and Coverage
`

export default world40_en
