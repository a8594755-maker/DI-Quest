const world12_en = `
# World 12: Engineering Quality Signals

> **Objective:** Understand how DI ensures code quality, what regression testing is, what Release Gates are, and why Guardrails are especially important for AI systems
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 12-1: The Testing Pyramid — From Parts to the Whole Car

### Understanding Testing Through an Analogy

You bought a new car. What testing did the factory do before shipping it?

1. **Parts inspection (Unit Test)** — Every screw, every light bulb, every brake pad is tested individually. Highest quantity, fastest speed.
2. **Assembly testing (Integration Test)** — After the engine is mounted on the chassis, confirm they work correctly together. Medium quantity.
3. **Full car test drive (E2E Test)** — Someone gets in, starts the car, accelerates, brakes, turns, and drives a complete route. Fewest in number but closest to reality.

This is the "testing pyramid": the base has a large number of unit tests (fast, cheap), and the top has a few E2E tests (slow, expensive, but comprehensive).

### DI's Testing Layers

DI has seven testing layers. Sounds like a lot, but each one has a clear purpose:

| Layer | Tool | What It Tests | Analogy |
|------|------|--------|------|
| **Unit Tests** | Vitest | Individual functions work correctly | Checking every screw |
| **Component Tests** | Vitest | React components render correctly | Checking dashboard assembly |
| **Regression Tests** | Pytest | ML model results haven't degraded | Confirming engine performance hasn't declined |
| **Guardrail Tests** | Vitest/Pytest | AI Worker hasn't exceeded its authority | Confirming airbags work |
| **DW Gate Tests** | Vitest | Digital Worker core flows work correctly | Confirming autopilot is functional |
| **E2E Tests** | Playwright | Can the full user flow be completed? | Full car test drive |
| **v1 Gate Tests** | Playwright | Have v1 release standards been met? | Factory quality certification |

### Frontend vs Backend Test Division

**Frontend tests (JavaScript/Vitest):**
- Domain logic in \`src/domains/\` — e.g., "calculate procurement recommendation" logic
- Utility functions in \`src/utils/\` — e.g., date conversion, number formatting
- Service logic in \`src/services/\` — e.g., intent parsing
- UI components in \`src/components/\` — e.g., charts, tables

**Backend tests (Python/Pytest):**
- ML model prediction results — confirm same data yields same results
- Solver engines — confirm optimization result quality
- API security — confirm unauthorized users can't perform sensitive operations
- Governance rules — confirm governance logic is correct

> **Possible interview follow-up:**
> "If time is limited and you can only choose one type of test, which would you pick?"
> It depends on the product stage. For an MVP/v1, I'd prioritize **E2E smoke tests** — ensure the core flow (upload → forecast → plan → review) works end to end. For a mature product, I'd prioritize **regression tests** — ensure a single code change doesn't degrade model results.

---

## 12-2: Regression Testing — Making Sure Nothing Broke

### What Is Regression Testing?

You fix one bug, and something else breaks. This is called "regression" — software quality has regressed.

**Regression testing prevents this:** after every code change, run a fixed set of tests to confirm that "things that used to work still work."

### What's Special About DI's Regression Testing?

Normal software regression testing is straightforward: input A → expected output B → is the actual output B?

But DI has **ML models**. ML model outputs are floating-point numbers (like 0.15234), not exact strings. You can't say "the prediction must equal 42.57," because each training run may have slight variations.

So DI's regression tests use **quality metrics** instead of exact values:

- **MAPE (Mean Absolute Percentage Error)** — Prediction error percentage. MAPE < 0.15 means error is within 15% — pass.
- **Pinball Loss** — Quantifies the quality of interval predictions
- **Bias** — Whether predictions skew high or low

**Deterministic Fixtures:**

To make results reproducible, test data is fixed (not randomly generated). The Python environment even sets \`PYTHONHASHSEED=0\` to eliminate randomness. Same data + same model → should produce identical results.

### How to Read Regression Results

\`\`\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    }
  ]
}
\`\`\`

This report tells you: 72 tests ran, 70 passed, 2 failed. One failed because the prediction error (MAPE 0.23) exceeded the threshold (0.15).

**What should you think when you see this?**
1. Cannot deploy — there are 2 failures
2. Investigate why MAPE increased — did the data change? Was the model modified?
3. If it can't be fixed quickly, consider alternatives — rollback to the previous version, or temporarily disable that feature

> **Possible interview follow-up:**
> "What does MAPE 0.23 mean? Is it serious?"
> MAPE 0.23 means predictions deviate from actual values by an average of 23%. Whether it's serious depends on the scenario. For convenience store beverage forecasting, 23% might be OK. For precision parts procurement planning, 23% could mean hundreds of thousands in inventory cost differences. DI's threshold is set at 15%, so 23% is judged as a failure.

---

## 12-3: Release Gate — Quality Control Before Shipping

### What Is a Release Gate?

Your car is assembled, but it can't drive out of the factory yet. It must pass a series of quality checks first. **A Release Gate is software's quality control checkpoint — only when everything passes can code be deployed to production.**

### DI's Three Gates

**Gate 1: Artifact Quality Gate**

Checks ML model quality metrics:
- MAPE < threshold
- Test coverage > threshold
- Bias within acceptable range

If any one fails, it doesn't pass.

**Gate 2: Regression Suite**

All regression tests must pass. Compare against the previous version's baseline to confirm no degradation.

**Gate 3: Canary Check**

Before deploying to production, let a small subset of users try it first. If they encounter problems, immediately rollback. Like the canary in a coal mine — if the canary dies, the air is toxic, and people shouldn't enter.

### CI Pipeline Execution Order

\`\`\`
lint → test:run → test:dw-gate → test:v1-gate → build
\`\`\`

Each step's failure blocks subsequent steps. In plain terms:
1. **lint** — Any code formatting issues? (Syntax check)
2. **test:run** — Do basic tests pass?
3. **test:dw-gate** — Are Digital Worker core functions working?
4. **test:v1-gate** — Are v1 release standards met?
5. **build** — Can it be successfully bundled?

### What Does It Look Like in GitHub Actions?

DI's \`.github/workflows/\` has several important CI workflows:

**ml-ci.yml** — ML model tests
- Automatically triggered when anyone modifies code under \`src/ml/\`
- Runs unit tests, drift monitoring, and regression tests
- 20-minute timeout (ML tests take time)
- Uses fixed random seeds: \`PYTHONHASHSEED=0\`, \`OMP_NUM_THREADS=1\` (ensures reproducible results)

**phase4-guardrails.yml** — Governance tests
- Automatically triggered when anyone modifies governance-related code
- Confirms permission controls, model registry, and promotion gates all work correctly

**planning-regression.yml** — Solver regression tests
- Confirms solver results haven't degraded

> **Possible interview follow-up:**
> "If CI passes, does that mean it's safe to deploy?"
> CI passing is a **necessary but not sufficient condition**. CI runs in a simulated environment that may lack production-specific data, traffic, or edge cases. So beyond CI, you also need canary deployments and production monitoring.

---

## 12-4: E2E and Smoke Tests — Full Car Test Drive

### Smoke Test — Can It Start?

The name "Smoke Test" comes from hardware engineering: when a new circuit board is powered on, if it smokes, something's wrong.

DI's Smoke Test (\`e2e/smoke.spec.js\`) performs the most basic checks:
- Can the page load?
- Are the main elements present?
- Are there any JavaScript errors?

**If the smoke test doesn't pass, there's no point running deeper tests.**

### E2E Flow Tests — Simulating User Actions

DI uses Playwright (a browser automation tool) to simulate complete user workflows:

| Test | What It Does |
|------|--------|
| upload flow | Simulates uploading Excel → confirms data is correctly imported |
| chat flow | Simulates typing commands in the chat box → confirms AI responds |
| full flow | Runs the complete Golden Path from upload to forecast to plan to review |
| upload-chat | Uploads then immediately issues a command in the chat box |

### v1 Gate Test — Release Threshold

\`npm run test:v1-gate\` is the strictest test, verifying three core flows:

1. **upload-to-plan** — From upload to plan output, complete chain
2. **revise** — Revision flow (supervisor requests changes → Worker re-executes)
3. **approve-audit** — Approval + audit trail (after approval, can you see the complete history?)

These three tests represent the Golden Path's core. If all three pass, the system's core functionality is working.

### Live Worker Test — Using Real AI

\`npm run test:live\` actually calls LLMs (Gemini/DeepSeek). This is closer to reality than mock tests but also slower and more expensive. Suitable for final confirmation before a production release.

> **Possible interview follow-up:**
> "E2E tests are slow and expensive. Why are they still needed?"
> Because unit tests and integration tests may each pass individually, but fail when combined. For example, chatIntentService correctly parses the intent, ML API correctly runs the forecast, but the frontend Canvas doesn't correctly display the results — this kind of issue can only be caught by E2E tests.

---

## 12-5: Guardrail Tests — AI's Airbag

### Why Do AI Systems Need Special Testing?

Normal software bugs mean "features are broken" — a button doesn't respond, a number is calculated wrong. Users see it, you get a bug report.

AI system problems are more insidious: **AI might do things that "look reasonable but shouldn't have been done."** For example:
- A Worker at A2 level (requires human post-review) auto-executes an operation it shouldn't
- Model accuracy gradually degrades, but because the decline is gradual, nobody notices
- An automation flow bypasses the human review gate

**Guardrail tests ensure these things don't happen.** They don't test "does the feature exist" but "are the limits enforced."

### DI's Guardrail Tests

| Test | What It Verifies |
|------|--------|
| Action Guardrails | Is every Worker action within permitted scope (no exceeding authority)? |
| Governance Controls | Are governance rules correctly enforced (approval flow can't be skipped)? |
| API Guards | Are ML API security checks correct (unauthorized requests blocked)? |
| Promotion Gate | Does model promotion pass quality gates (can't push a bad model to production)? |
| Registry Guards | Are model registry operations compliant (can't arbitrarily delete or modify published models)? |

### Phase 4 Guardrails — The Strictest Gate

\`npm run test:phase4-guardrails\` covers the entire governance system:
- Permission control: unauthorized user attempts a sensitive operation → rejected
- Model lifecycle: model goes from training → validation → production → retirement, with gates at every step
- Retrain trigger: model accuracy drops below threshold → automatically triggers retraining
- Promotion gate: new model must be better than the old one to replace it

### Why Are Guardrails More Important Than Feature Tests?

> **If a feature breaks, users notice. If a guardrail breaks, nobody may discover it — until something goes seriously wrong.**

If the forecasting feature breaks, users say "it doesn't work," and you fix it immediately. But if the autonomy level control logic breaks, the Worker might auto-execute when it shouldn't, and "everything looks normal" — because it did execute, it just shouldn't have.

> **Possible interview follow-up:**
> "How do you ensure AI doesn't do things beyond expectations?"
> Three lines of defense: 1. **Code level** — The state machine ensures tasks can only transition in valid sequences. 2. **Policy level** — ApprovalPolicy defines what actions require human approval; writeback in v1 always does. 3. **Testing level** — Guardrail tests run in every CI cycle, ensuring these restrictions aren't accidentally removed.

---

## 12-6 (Boss): Quality Report

### Scenario

You receive a regression_result.json:

\`\`\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    },
    {
      "test": "test_inventory_risk_threshold",
      "reason": "Risk score 0.82 exceeds safe threshold 0.75"
    }
  ]
}
\`\`\`

### Your Task

1. Would you push this version to production? Why or why not?
2. How would you investigate these two failures?
3. If these two issues can't be fixed quickly, what alternatives do you have?

### Evaluation Criteria

- Clearly states **do not push** (2 failures = Release Gate not passed)
- Can interpret the metrics (MAPE 0.23 means 23% prediction deviation; Risk score 0.82 means the risk metric exceeds the threshold)
- Investigation steps are systematic:
  1. First check if it's a data issue (was the test data modified?)
  2. Then check if it's a code issue (who recently changed the prediction logic? Use git blame)
  3. Finally check if it's an environment issue (Python version? Package versions?)
- Alternatives are practical:
  - **Rollback** — revert to the last passing version
  - **Feature flag** — disable the problematic feature; deploy everything else
  - **Hotfix** — fix only this bug with a minimal repair
`

export default world12_en
