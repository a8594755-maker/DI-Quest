const world39_en = `
# World 39: Negotiation Engine and Simulation System

> **Objective:** Understand how DI uses game theory to help you negotiate with suppliers, and how the simulation system lets you "rehearse" before placing actual orders
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 39-1: What Is CFR — Using AI to Practice Negotiation 10,000 Times

### Start with a Scenario

You're a procurement manager negotiating next year's raw material prices with a supplier. You don't know how eager the other side is to sell (maybe they have excess inventory and urgently need to move it, or maybe they're fully booked and don't need your business). All you know is your own situation: limited budget, tight delivery timeline.

**Should you accept their quote? Counter-offer? Or walk away and find another supplier?**

If you could simulate 10,000 negotiations, trying different strategies each time, then tally up "which strategy yields the best average outcome" — you'd know the optimal strategy.

**CFR+ (Counterfactual Regret Minimization Plus) is the algorithm that does exactly this.**

### CFR+ in Plain Terms

1. **Simulate tens of thousands of negotiations** (default: 50,000)
   - Each time, randomly draw a supplier type (aggressive / cooperative / desperate-to-sell)
   - Play through an entire negotiation (3 rounds: opening → concession → closing)

2. **After each negotiation, calculate "regret"**
   - "Regret" = How much more would I have earned if I had chosen a different action?
   - Example: I chose "counter-offer" and earned +0.3, but if I had chosen "accept" I would've earned +0.5 → regret = 0.2

3. **Adjust the strategy based on regret**
   - High-regret actions → do more of them next time
   - Low-regret actions → do less of them next time
   - The "+" improvement zeros out negative regret, only learning "what to do more of," converging faster

4. **After enough iterations, converge to Nash Equilibrium**
   - In plain terms: no matter how the opponent changes tactics, your strategy won't lose
   - This has mathematical guarantees — it's not ChatGPT's kind of "sounds reasonable" advice

### Why Not Just Use ChatGPT to Negotiate?

ChatGPT can help you brainstorm negotiation talking points, but it has no **mathematical guarantees**. CFR+'s strategy is converged from 50,000 simulations and is optimal in game-theory terms.

> **Possible interview follow-up:**
> "What is Nash Equilibrium?"
> A state where neither side has an incentive to change strategy. I use strategy A, you use strategy B; if I switch to C it won't be better, and if you switch to D it won't be better — then (A, B) is the equilibrium point.

---

## 39-2: Game Tree and Position Buckets

### How Does a Negotiation Become a Decision Tree?

CFR models the negotiation as a **decision tree**:

\`\`\`
Step 0: Chance node — randomly draw supplier type
├── 30% Aggressive
├── 50% Cooperative
└── 20% Desperate-to-sell

Step 1 (Opening round): Buyer chooses
├── Accept → Negotiation ends, calculate payoff
├── Reject → Supplier responds
└── Counter-offer → Supplier responds
    ├── Accept / Reject / Counter → Enter concession round

Step 2 (Concession round): Same structure

Step 3 (Closing round): Reject = walk away
\`\`\`

### Hidden Information — Why CFR Is Needed

If both sides showed their cards, you could just look up the answer in a table. The hard part is that **you don't know the other side's hand**:
- The buyer can't see which supplier type they're facing (aggressive? desperate?)
- The supplier can't see the buyer's bargaining leverage

In the code, "information sets" (info set) represent what each player can see:
- \`B|2|OPENING|\` = Buyer, medium leverage, opening round, no action history
- \`S|COOPERATIVE|OPENING|COUNTER\` = Supplier, cooperative type, opening round, buyer just countered

### Position Buckets — Your Bargaining Power

Your leverage depends on the supply chain risk score, divided into 5 levels:

| Risk Score | Bucket | Level | Plain Explanation |
|---------|--------|------|------|
| 0-39 | 4 | VERY_STRONG | You have many alternative suppliers; you can switch anytime |
| 40-79 | 3 | STRONG | You have the advantage; you can push harder |
| 80-119 | 2 | NEUTRAL | Both sides are evenly matched |
| 120-159 | 1 | WEAK | The supplier has the advantage; you'll need to compromise |
| 160+ | 0 | VERY_WEAK | You're heavily dependent on this supplier; almost no room to negotiate |

The risk score considers four factors: supply concentration (how many alternatives?), lead time criticality (how urgent?), market availability (easy to source?), and inventory urgency (running low?).

**CFR generates a different optimal strategy for each bucket.** Someone with VERY_STRONG leverage can counter-offer boldly; someone with VERY_WEAK leverage should accept more often.

> **Possible interview follow-up:**
> "Why 5 levels instead of a continuous score?"
> CFR needs to generate a strategy for each situation. A continuous score (0-200) = 200 separate strategies — too many. 5 buckets are precise enough and efficient. This is a trade-off between precision and computational efficiency.

---

## 39-3: Complete Negotiation Engine Flow (10-Step Orchestration)

### Real-Time Phase — User Triggers Negotiation

Suppose the solver reports "budget insufficient to achieve 95% service level":

\`\`\`
Step 1: Load base data (solver results, constraints)
Step 2: Detect trigger condition → "Solver infeasible, negotiation needed"
Step 3: Generate 6 standard negotiation options
  → opt_001: Increase budget by 10%
  → opt_002: Relax minimum order quantity (MOQ)
  → opt_003: Allow package size rounding
  → opt_004: Enable rush mode
  → opt_005: Increase safety stock by 20%
  → opt_006: Lower service level target
Step 3.5: CFR weighting
  → Look up game-theory weights for each option
  → Example: In a WEAK position, increasing budget (an acceptance-type action) gets the highest weight
Steps 4-6: Re-run the solver for each option to evaluate impact
  → opt_001: Feasible, cost increases $12K, service level 96%
  → opt_002: Feasible, no cost change, service level 94%
  → ...
Steps 7-8: Use LLM to write the report
  → "Recommend increasing budget by 10%. Reason: (1) This is the only option that achieves 95%
     (2) CFR strategy supports making concessions in a WEAK position"
Step 9: Auto-generate an email draft
Step 10: Return results + save negotiation state (supports multi-round negotiations)
\`\`\`

### How Are Payoffs Calculated?

| Outcome | Buyer Payoff | Explanation |
|------|---------|------|
| Both agree | +0.30 + each successful concession +0.15 | Reaching an agreement is good |
| Buyer walks away | -0.40 | Supply chain disruption costs are high |
| Supplier walks away | -0.20 | Losing the order, but you can find another supplier |

**Walking away is penalized more than accepting unfavorable terms.** Because in supply chain scenarios, the cost of supply disruption typically far exceeds paying a slightly higher price.

> **Possible interview follow-up:**
> "What if CFR is unavailable (first-time use, hasn't been run yet)?"
> Graceful fallback: the 6 options are still generated, the solver still evaluates them — just without CFR weighting. Ranking falls back to pure feasibility → service improvement → cost improvement ordering.

---

## 39-4: Digital Twin — "Rehearse" Before Actually Placing Orders

### What Is a Digital Twin?

You've made a procurement plan, but how do you know it won't have problems in the real world?

**A Digital Twin builds a "clone" of your supply chain in a computer and simulates 365 days to see if problems arise.** Like a flight simulator — you wouldn't fly a real plane the first time.

### Five Simulation Modules

**1. DataGenerator — Generate synthetic demand**
Simulates one year of daily demand volume, including trends, seasonality, random fluctuations, and sudden shocks.

**2. ChaosEngine — Create various disasters**
Randomly generates bad events each day: supplier delays, port strikes, quality issues, demand spikes, raw material shortages.
There's one harsh setting: **if your inventory is already low, the probability of bad events automatically multiplies by 1.5** (Murphy's Law simulation).

**3. InventorySimulator — Simulate daily inventory changes**
Runs a daily cycle: receive goods → deduct defective items → fulfill demand (stockout if insufficient) → calculate costs → should we reorder?

**4. Orchestrator — Connect all modules together**
Links the three modules above and runs a 365-day simulation. Every N days, it also reruns the forecast (simulating how forecasts are periodically updated in real use).

**5. FeedbackLoop — Review results and make recommendations**
Analyzes simulation KPIs. If fill_rate < 95% → recommends increasing safety stock by 25% → feeds back to the solver for recalculation.

> **Possible interview follow-up:**
> "Is simulation reliable?"
> Simulation doesn't predict the future — it tests a plan's resilience. Run the same plan through "normal," "volatile," "disaster," and "peak season" scenarios. If it's OK in "normal" but collapses in "disaster," you know where the risk is.

---

## 39-5: Four Simulation Scenarios and Feedback Loop

### Four Preset Scenarios

| Scenario | Demand | Supplier | Chaos Intensity | Purpose |
|------|------|--------|---------|------|
| **normal** | Low volatility | 98% on-time | Low | Baseline |
| **volatile** | High seasonality, promotions | 85% on-time | High | Real market conditions |
| **disaster** | Surge and crash | 70% on-time | Extreme | Stress test |
| **seasonal** | Q4 +80% | 90% on-time | Medium | Black Friday / Singles' Day |

### How the Feedback Loop Works

\`\`\`
Plan → Simulate 365 days → Check results
                            ↓
          fill_rate = 92% (failing, target 95%)
                            ↓
          FeedbackLoop recommends: safety stock +25%
                            ↓
          Adjust parameters → solver recalculates → new plan
                            ↓
          Simulate again → fill_rate = 97% (passing)
\`\`\`

This is a "closed loop": not just producing one plan and calling it done, but **plan → test → find issues → adjust → retest** until it's robust enough.

---

## 39-6 (Boss): Negotiation Strategy Design

### Scenario

The solver reports "budget insufficient to achieve 95% service level." The system triggers the negotiation engine.

Known:
- Your risk_score = 120 → bucket 1 (WEAK)
- Supplier on-time rate 72% → estimated 60% aggressive, 30% cooperative, 10% desperate
- CFR recommendation (WEAK + OPENING): Accept 55%, Counter 35%, Reject 10%
- Digital Twin simulation result: if no adjustments, fill_rate is only 88%

### Your Task

1. Why does CFR recommend the highest probability for "accept"? How does this relate to your position?
2. How would you rank the 6 options? Why?
3. If you choose to counter-offer, how would you use the simulation results to support your position?

### Evaluation Criteria

- Understands WEAK position = low leverage → high accept probability is rational
- Can combine business logic to rank options
- Can use simulation data (fill_rate 88%) as negotiation evidence
- Understands CFR is a "recommendation," not a "command"
`

export default world39_en
