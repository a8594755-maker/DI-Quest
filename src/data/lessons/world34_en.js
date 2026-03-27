const world34_en = `
# World 34: Project Management Basics

> Whether you're a Business Engineer or a Product Analyst, you will be involved in projects.
> Understanding the fundamentals of project management demonstrates your ability to "execute and deliver" in interviews.

Great analysis and planning are meaningless without the ability to manage execution.
This chapter teaches you the complete project management fundamentals from scope definition to Sprint Planning.

---

## 34-1: Scope Definition

### The Iron Triangle

\`\`\`
        Scope
         /      \\
        /  Quality \\
       /            \\
      /              \\
  Time ————————————— Cost
\`\`\`

**Core Concept**: All three cannot be optimized simultaneously — changing one inevitably impacts the other two.

### Scope Definition Tool: WBS (Work Breakdown Structure)

\`\`\`
E-commerce Platform Revamp
├── 1. Frontend Revamp
│   ├── 1.1 Homepage Redesign
│   ├── 1.2 Product Page Revamp
│   └── 1.3 Shopping Cart UX Optimization
├── 2. Backend Development
│   ├── 2.1 Search Engine Upgrade
│   ├── 2.2 Payment Module Integration
│   └── 2.3 API Performance Optimization
├── 3. Testing
│   ├── 3.1 SIT
│   └── 3.2 UAT
└── 4. Go-Live
    ├── 4.1 Data Migration
    └── 4.2 Production Deployment
\`\`\`

### In Scope vs Out of Scope

| In Scope | Out of Scope |
|----------|-------------|
| Frontend UI revamp | Mobile app development |
| Existing payment method integration | Cryptocurrency payment support |
| Primary language interface | Multi-language support |
| Existing member migration | Social login integration |

### Scope Creep

\`\`\`
Common Scenarios:
Client: "Since we're already making changes, can you add feature XXX?"
Manager: "This should be simple, just add it real quick."

How to Handle:
1. Assess impact (time, cost, risk)
2. Follow the formal change process (Change Request)
3. Use data to communicate: "Adding this feature requires 2 extra weeks and $50K"
4. Offer alternatives: "We can build a simplified version first and enhance it in a later release"
\`\`\`

### SMART Goals

| Element | Description | Good Example | Bad Example |
|---------|-------------|-------------|-------------|
| Specific | Well-defined | Reduce checkout steps from 5 to 3 | Improve user experience |
| Measurable | Quantifiable | Increase cart conversion rate by 15% | Increase conversion rate |
| Achievable | Realistic | Feasible based on historical data | 10x monthly revenue |
| Relevant | Aligned | Consistent with company Q2 goals | Unrelated to business direction |
| Time-bound | Has a deadline | Complete by 2026/Q2 | Do it when we have time |

---

## 34-2: Timeline & Milestones

### Gantt Chart Basics

\`\`\`
Task              | W1 | W2 | W3 | W4 | W5 | W6 | W7 | W8 |
──────────────────┼────┼────┼────┼────┼────┼────┼────┼────┤
Requirements      |████|    |    |    |    |    |    |    |
UI Design         |    |████|████|    |    |    |    |    |
Frontend Dev      |    |    |████|████|████|    |    |    |
Backend Dev       |    |    |████|████|████|    |    |    |
SIT Testing       |    |    |    |    |    |████|    |    |
UAT Testing       |    |    |    |    |    |    |████|    |
Go-Live Deploy    |    |    |    |    |    |    |    |████|
                  M1                  M2        M3   M4
M1: Requirements Freeze  M2: Dev Complete  M3: UAT Passed  M4: Go-Live
\`\`\`

### Milestone Setting Principles

- A milestone is a **verifiable completion point**, not an ongoing activity
- There should be a milestone every 2-4 weeks (too long loses control)
- Each milestone must have a clear Deliverable

### Critical Path Method

\`\`\`
A(3 days) → C(5 days) → E(2 days)
                                    ↘
                                      G(3 days) → Complete
                                    ↗
B(2 days) → D(4 days) → F(3 days)

Critical Path: A → C → E → G = 13 days
Non-critical Path: B → D → F → G = 12 days

→ Minimum project completion time = 13 days
→ Path B-D-F has 1 day of Buffer (float)
\`\`\`

### Estimation Methods

| Method | Approach | Best For |
|--------|----------|----------|
| Expert Judgment | Ask experienced people | Similar past projects |
| Analogous | Reference similar projects | When historical data exists |
| Three-point | (Optimistic + 4×Most Likely + Pessimistic) / 6 | High uncertainty |
| Planning Poker | Team members estimate independently, discuss differences | Agile teams |
| T-shirt Sizing | S / M / L / XL quick classification | Early rough estimates |

### Estimation Example: Three-point

\`\`\`
Task: Payment Module Integration
  Optimistic (O): 5 days
  Most Likely (M): 8 days
  Pessimistic (P): 15 days

  Expected Time = (5 + 4×8 + 15) / 6 = 8.7 days
  Standard Deviation = (15 - 5) / 6 = 1.67 days

  → Estimated 8-10 days to complete (including buffer)
\`\`\`

### Buffer Management

\`\`\`
Total Timeline = Actual Estimate + Buffer
Buffer Guidelines:
  - Low-risk tasks: +10-15%
  - Medium-risk tasks: +20-30%
  - High-risk / Never done before: +50%

Note: Don't add buffer to every individual task (it inflates)
Recommendation: Add a single unified buffer at the project level
\`\`\`

---

## 34-3: Risk Management

### Risk Matrix

\`\`\`
Impact ↑
  High │ Medium   │ High     │ Very High│
       │ Monitor  │ Plan     │ Act Now  │
  Med  │ Low      │ Medium   │ High     │
       │ Accept   │ Monitor  │ Plan     │
  Low  │ Very Low │ Low      │ Medium   │
       │ Ignore   │ Accept   │ Monitor  │
       └──────────┴──────────┴──────────┘
        Low        Med        High    → Probability
\`\`\`

### Risk Register

| Risk ID | Risk Description | Probability | Impact | Level | Mitigation Strategy | Owner |
|---------|-----------------|-------------|--------|-------|-------------------|-------|
| R-001 | Key engineer leaves | Med | High | High | Documentation + backup staffing | PM |
| R-002 | Third-party API instability | High | Med | High | Prepare fallback plan | Tech Lead |
| R-003 | Frequent requirement changes | High | High | Very High | Requirements freeze + CR process | PM |
| R-004 | Test environment delay | Med | Med | Med | Request environment early | DevOps |
| R-005 | User resistance to new system | Med | High | High | Training + phased rollout | BA |

### Four Risk Response Strategies

| Strategy | Description | Example |
|----------|-------------|---------|
| Avoid | Change plans to eliminate risk | Don't use unstable technology |
| Mitigate | Reduce probability or impact | Add code review to reduce bugs |
| Transfer | Shift risk to someone else | Outsource, buy insurance |
| Accept | Acknowledge risk, prepare response | Accept low-impact risks directly |

### RAID Log

\`\`\`
R - Risks: Bad things that might happen
A - Assumptions: Things we assume to be true
I - Issues: Bad things that have already happened
D - Dependencies: Things we rely on externally

Examples:
Risk: Third-party payment API may go down during major sales events
Assumption: Business will finalize requirements by 3/15
Issue: Test environment went down yesterday, UAT paused today
Dependency: Database migration requires DBA team support
\`\`\`

---

## 34-4: Priority & Trade-offs

### MoSCoW Method

| Level | Description | Suggested Ratio |
|-------|-------------|----------------|
| **Must Have** | Cannot go live without it | 60% |
| **Should Have** | Important but not essential | 20% |
| **Could Have** | Nice to have, okay without | 15% |
| **Won't Have** | Not doing this time | 5% |

### Example: E-commerce Revamp MoSCoW

\`\`\`
Must Have:
  ✅ Product browsing and search
  ✅ Shopping cart and checkout
  ✅ Member login
  ✅ Order management

Should Have:
  📌 Product recommendations
  📌 Wishlist
  📌 Order tracking

Could Have:
  💡 Social sharing
  💡 Product comparison
  💡 Personalized homepage

Won't Have (this time):
  ❌ Live shopping
  ❌ AR try-on
  ❌ Cross-border logistics
\`\`\`

### Eisenhower Matrix (Urgent-Important Matrix)

\`\`\`
             Urgent            Not Urgent
        ┌─────────────┬─────────────┐
Import- │ DO           │ SCHEDULE     │
ant     │ Handle now   │ Plan it      │
        │ System crash │ Architecture │
        ├─────────────┼─────────────┤
Not     │ DELEGATE     │ ELIMINATE    │
Import- │ Delegate     │ Don't do it  │
ant     │ Routine rpts │ Too many mtgs│
        └─────────────┴─────────────┘
\`\`\`

### Trade-off Conversation Example

\`\`\`
Scenario: Client requests additional features but won't delay the launch date

Wrong Answer: "Okay, we'll figure it out." (work overtime to death)

Correct Answer:
"I understand the importance of this feature. Let me explain the current situation:
  - Adding this feature requires an additional 3 weeks of development + 1 week of testing
  - If we keep the original launch date, we have three options:
    1. Remove [other Should Have features] to free up time
    2. Launch core features first, schedule this feature for Phase 2 (1 month post-launch)
    3. Add 2 more developers (requires additional budget of $XXK)
  - I recommend Option 2, because..."
\`\`\`

---

## 34-5: Agile / Scrum Fundamentals

### Waterfall vs Agile

| Aspect | Waterfall | Agile |
|--------|-----------|-------|
| Process | Linear, sequential | Iterative, cyclical |
| Requirements | Fixed upfront | Continuously adjusted |
| Delivery | Single final delivery | Delivered each Sprint |
| Changes | High cost, resistant to change | Embraces change |
| Documentation | Comprehensive docs | Just enough |
| Best For | Well-defined requirements | Ambiguous, rapidly changing needs |

### Scrum Framework

\`\`\`
Product Backlog
      ↓
Sprint Planning → Sprint Backlog
      ↓
Sprint (2-4 weeks)
  ├── Daily Standup (15 minutes daily)
  ├── Development & Testing
  └── Sprint Review (demo results)
      ↓
Sprint Retrospective (reflect & improve)
      ↓
Next Sprint...
\`\`\`

### Scrum Roles

| Role | Responsibility | Analogy |
|------|---------------|---------|
| Product Owner (PO) | Decides what to build, prioritizes | Boss / Business representative |
| Scrum Master (SM) | Ensures smooth process, removes blockers | Coach / Facilitator |
| Development Team | Actually builds the product | Players |

### Scrum Artifacts

| Artifact | Description |
|----------|-------------|
| Product Backlog | List of all pending items (managed by PO) |
| Sprint Backlog | Items committed for this Sprint (Team commitment) |
| Increment | Deliverable output at Sprint end |

### User Story Format

\`\`\`
As a [role],
I want to [do something],
So that [why / value].

Example:
As an e-commerce member,
I want to pay by credit card,
So that I can quickly complete my purchase.

Acceptance Criteria:
  - Supports Visa, Mastercard, JCB
  - Displays order confirmation page after successful payment
  - Displays error message with retry option on payment failure
  - Transaction records saved in the order system
\`\`\`

### Story Point Estimation

\`\`\`
Fibonacci Sequence: 1, 2, 3, 5, 8, 13, 21

1 point = Very simple, a few hours
3 points = Regular task, 1-2 days
5 points = Somewhat complex, 2-3 days
8 points = Complex, about a week
13 points = Very complex, may need to be split
21 points = Too large, must be split

Team Velocity:
  Sprint 1: Completed 30 points
  Sprint 2: Completed 35 points
  Sprint 3: Completed 28 points
  Average Velocity = 31 points / Sprint
\`\`\`

---

## 34-6: Sprint Planning in Practice

### Sprint Planning Process

\`\`\`
1. PO explains Sprint Goal (5 minutes)
   ↓
2. PO presents priority items (20 minutes)
   ↓
3. Team estimates Story Points (30 minutes)
   ↓
4. Team commits to Sprint Backlog (15 minutes)
   ↓
5. Break down into specific Tasks (20 minutes)
\`\`\`

### Sprint Planning Example

\`\`\`
Sprint #5 Planning
Sprint Goal: Complete checkout flow revamp
Sprint Duration: 2 weeks (10 working days)
Team Velocity: ~30 points

Sprint Backlog:
┌────────────────────────────┬────────┬────────┐
│ User Story                 │ Points │ Owner  │
├────────────────────────────┼────────┼────────┤
│ Credit card payment flow   │ 8      │ Alice  │
│ Checkout page UI revamp    │ 5      │ Bob    │
│ Order confirmation email   │ 3      │ Carol  │
│ Payment failure handling   │ 5      │ Alice  │
│ Checkout page RWD          │ 5      │ Bob    │
│ Payment security check     │ 3      │ Dave   │
├────────────────────────────┼────────┼────────┤
│ Total                      │ 29     │        │
└────────────────────────────┴────────┴────────┘
\`\`\`

### Daily Standup Template

\`\`\`
Each person 2 minutes, answer three questions:
1. What did you complete yesterday?
2. What do you plan to do today?
3. Are there any blockers?

Example:
"Yesterday I completed the credit card payment frontend form.
 Today I plan to integrate the payment API.
 I'm currently blocked by incomplete third-party API documentation.
 I need the PM to help contact their technical team."
\`\`\`

### Sprint Retrospective Framework

\`\`\`
Three Questions:
1. What went well?
   - Daily standup was efficient
   - Discovered API integration issue early

2. What didn't go well?
   - Mid-sprint requirement changes caused rework
   - Unstable test environment

3. Action items (specific improvement actions)
   - Send formal email to confirm requirements after sign-off → Owner: PM
   - Set up automated environment health checks → Owner: DevOps
\`\`\`

### Kanban Board

\`\`\`
┌──────────┬──────────┬──────────┬──────────┐
│ To Do    │ In Prog  │ Review   │ Done     │
├──────────┼──────────┼──────────┼──────────┤
│ 📋 Story5│ 🔧 Story1│ 👀 Story3│ ✅ Story4│
│ 📋 Story6│ 🔧 Story2│          │ ✅ Story7│
│          │          │          │          │
└──────────┴──────────┴──────────┴──────────┘
WIP Limit:      3         2
\`\`\`

### Interview Practice Question

**Q: Your project is behind schedule. What do you do?**

\`\`\`
Answer Framework:
1. Analyze the Cause
   - Which tasks are delayed? Why?
   - Was it inaccurate estimation? Or unexpected risks?

2. Assess the Impact
   - How much delay? Impact on subsequent milestones?
   - Does it affect other teams?

3. Propose Solutions (Trade-off Thinking)
   - Option A: Reduce Scope (remove Should Have features)
   - Option B: Delay the launch date (if acceptable)
   - Option C: Add resources (but consider ramp-up time)
   - Option D: Parallelize work (adjust task dependencies)

4. Communicate
   - Proactively, transparently, with data
   - Come with solutions, not just problems
\`\`\`

---

## Key Takeaways - World 34 Cheat Sheet

### Project Management Core Concepts

\`\`\`
Iron Triangle: Scope / Time / Cost (all three are interdependent)

WBS: Tree structure that breaks large tasks into smaller ones
MoSCoW: Must / Should / Could / Won't (requirement prioritization)
Critical Path: The path that determines the minimum project completion time

Risk Management Four Strategies: Avoid / Mitigate / Transfer / Accept

Scrum Three Roles: PO / SM / Team
Scrum Three Artifacts: Product Backlog / Sprint Backlog / Increment
Scrum Four Ceremonies: Planning / Daily / Review / Retro

User Story: As a [who], I want [what], So that [why]
Story Point: Relative complexity estimated using Fibonacci sequence
Velocity: Number of points a team can complete per Sprint

Scope Creep Prevention:
  Follow formal CR process → Assess impact → Communicate with data

Handling Project Delays:
  Analyze cause → Assess impact → Propose solutions → Communicate proactively
\`\`\`

### Universal Interview Framework

\`\`\`
For any project management question:
1. Define goals (SMART)
2. Break down tasks (WBS)
3. Prioritize (MoSCoW)
4. Estimate timeline (Three-point / Planning Poker)
5. Identify risks (Risk Matrix)
6. Communicate continuously (Daily / Weekly)
7. Continuously improve (Retro)
\`\`\`
`;

export default world34_en;
