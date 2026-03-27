const world28_en = `
# World 28: Stakeholder Management

> Project success or failure often comes down to "people" issues, not technical problems. Learning to identify, analyze, and manage stakeholders is an essential course for every BA.

Common interview questions: "How do you handle requirement conflicts?" "How do you communicate with people at different levels?"
This chapter provides you with systematic frameworks to answer these questions.

---

## 28-1: Stakeholder Identification

### What Is a Stakeholder?

Any individual or group that is affected by or can influence the project.

### Four Sources for Identification

\`\`\`
1. Organization Chart (Org Chart)
   → Who is the project Sponsor? Who are the decision makers?

2. Process Map
   → Who uses this system? Who provides data? Who receives output?

3. Contracts and Regulations
   → External vendors, regulatory bodies, compliance departments

4. Historical Records
   → Who was involved in the last similar project?
\`\`\`

### Stakeholder Classification

| Category | Description | Examples |
|----------|-------------|----------|
| Primary | Directly uses the system | End users, operators |
| Secondary | Indirectly affected | Management, report readers |
| Key | Has decision-making authority | Sponsor, VP, PO |
| External | Outside the organization | Customers, vendors, regulators |

### Stakeholder Register

| Name | Title | Department | Role | Influence | Interest | Attitude | Communication Frequency |
|------|-------|-----------|------|-----------|----------|----------|------------------------|
| VP Wang | VP Sales | Sales | Sponsor | High | High | Supportive | Weekly |
| Mgr. Li | IT Manager | IT | Technical Lead | Medium | Medium | Neutral | Weekly |
| Sup. Zhang | CS Manager | Customer Service | End User Rep | Low | High | Concerned | Daily |
| Atty. Chen | Legal Counsel | Legal | Advisor | High | Low | Neutral | As needed |

### RACI Matrix

| Task | Product Owner | BA | Dev Lead | QA | Legal |
|------|--------------|-----|---------|-----|-------|
| Requirements Confirmation | A | R | C | I | I |
| Architecture Design | I | C | R/A | C | I |
| Test Plan | I | C | C | R/A | I |
| Go-Live Approval | A | R | R | R | C |
| Compliance Review | I | C | I | I | R/A |

\`\`\`
R = Responsible (performs the work)
A = Accountable (ultimately answerable, only one person)
C = Consulted (two-way communication)
I = Informed (one-way communication)
\`\`\`

---

## 28-2: Power/Interest Grid Analysis

### Four-Quadrant Model

\`\`\`
             High Power
              │
   Keep       │      Manage
   Satisfied  │      Closely
              │
──────────────┼──────────────
              │
   Monitor    │      Keep
              │     Informed
              │
             Low Power
    Low Interest ←──────→ High Interest
\`\`\`

### Strategies for Each Quadrant

| Quadrant | Characteristics | Strategy | Communication Method |
|----------|----------------|----------|---------------------|
| High Power / High Interest | Core decision makers | Close collaboration, regular 1:1 | Weekly face-to-face meetings |
| High Power / Low Interest | Influential but not very engaged | Regular updates, don't disturb | Monthly summary reports |
| Low Power / High Interest | Interested but limited influence | Make them feel heard | Weekly newsletter |
| Low Power / Low Interest | Peripherally related | Minimum communication | As-needed updates |

### Practical Example: CRM System Implementation

\`\`\`
Manage Closely (High Power / High Interest):
- VP of Sales (Sponsor, budget decision maker)
- Product Owner (requirements decision maker)
→ Strategy: Weekly progress meetings, 1:1 alignment before key decisions

Keep Satisfied (High Power / Low Interest):
- CTO (technical review authority)
- CFO (budget approval)
→ Strategy: Monthly reports, proactive notification upon milestone completion

Keep Informed (Low Power / High Interest):
- Sales team (daily CRM users)
- Customer service team (indirectly affected)
→ Strategy: Demo sessions, feedback channels

Monitor (Low Power / Low Interest):
- Administrative department
- External consultants
→ Strategy: Project announcements, contact when needed
\`\`\`

### Salience Model (Advanced Analysis)

Three dimensions: Power, Legitimacy, Urgency

\`\`\`
Number of dimensions held → Classification:
3 dimensions → Definitive Stakeholder (highest priority)
2 dimensions → Expectant Stakeholder (high attention)
1 dimension  → Latent Stakeholder (monitor only)
0 dimensions → Non-Stakeholder
\`\`\`

---

## 28-3: Communication Plan Development

### Communication Plan Template

| Stakeholder | Information Needs | Frequency | Channel | Owner | Format |
|-------------|------------------|-----------|---------|-------|--------|
| Sponsor | Progress, risks, budget | Weekly | 1:1 meeting | PM | Summary slides |
| Dev Team | Requirement details, changes | Daily | Stand-up | BA | Jira updates |
| End Users | Feature introduction, training | By milestone | Workshop | BA | Demo + documentation |
| Management | Milestones, ROI | Monthly | Email | PM | Dashboard |
| Legal | Compliance requirements | As needed | Email | BA | Documentation |

### Communication Channel Selection

| Channel | Best For | Pros | Cons |
|---------|----------|------|------|
| Face-to-face meeting | Important decisions, conflict resolution | Highest bandwidth, immediate feedback | Scheduling difficulty |
| Video conference | Remote teams, regular updates | Convenient, recordable | Easy to lose attention |
| Email | Formal records, notifications | Creates paper trail | Delayed responses |
| Slack/Teams | Quick questions, daily collaboration | Real-time, low barrier | Information fragmentation |
| Confluence/Wiki | Documentation, knowledge base | Structured, searchable | May not stay current |
| Dashboard | Progress tracking, KPIs | Self-service, real-time | Requires setup |

### Upward Communication Techniques

\`\`\`
Principles:
1. Bottom Line Up Front (BLUF)
2. Use data and numbers
3. Present options, not problems
4. Keep it within 5 minutes

Example (reporting to VP):

❌ Poor version:
"We're working on the CRM project and have run into some issues.
The API integration is difficult, the team is short-staffed,
so the timeline might need to be delayed..."

✅ Good version:
"CRM project status: 65% complete, 1 week behind schedule.
Key risk: Third-party API integration delayed.
Recommended options:
A) Add 1 engineer (cost +$5K, timeline unchanged)
B) Reduce scope (Phase 2 reports deferred, saving 2 weeks)
Need your decision on the direction."
\`\`\`

### Communication Matrix Example

\`\`\`
        │ Technical  │ Business  │ Timeline  │ Risk
        │ Details    │ Impact    │ & Budget  │
────────┼────────────┼───────────┼───────────┼──────
Sponsor │   Low      │   High    │   High    │  High
Dev     │   High     │   Low     │   Medium  │  Medium
User    │   Low      │   High    │   Low     │  Low
QA      │   High     │   Low     │   Medium  │  High
\`\`\`

---

## 28-4: Expectation Management

### Core Principles of Expectation Management

\`\`\`
1. Under-promise, Over-deliver
   → Promise 80%, deliver 110%

2. Transparent Communication
   → Bad news should be shared as early as possible

3. Manage Scope Creep
   → Assess the impact of every new requirement

4. Set Clear Boundaries
   → What's in / What's out
\`\`\`

### Scope Creep Management Process

\`\`\`
New requirement raised
    ↓
Impact Assessment
    ↓
┌─────────────────────────────────┐
│ Assessment items:               │
│ • Timeline impact: How many     │
│   days/weeks of delay?          │
│ • Cost impact: Additional       │
│   resources needed?             │
│ • Risk impact: Does it increase │
│   technical risk?               │
│ • Quality impact: Will it       │
│   compromise other features?    │
└─────────────────────────────────┘
    ↓
Submit Change Request
    ↓
CCB (Change Control Board) Review
    ↓
Approve / Reject / Defer
    ↓
Update plan & notify stakeholders
\`\`\`

### Managing Expectations at Different Levels

| Level | Typical Expectations | Management Strategy |
|-------|---------------------|-------------------|
| C-level | On-time delivery, within budget | Regular progress reports, early warnings |
| Mid-level managers | Don't disrupt daily operations | Deployment plan, transition support |
| End users | New system should be better than the old one | Early involvement, training plan |
| IT team | Requirements shouldn't keep changing | Clear change management process |

### Interview Question: "How Do You Handle an Unreasonable Deadline?"

\`\`\`
Answer Framework:

1. Clarify
   "Let me confirm — you need these features completed by X date?"

2. Analyze
   "Based on my assessment, this scope requires Y working days,
    but we only have Z days. The gap is N days."

3. Provide Options
   A) Reduce scope (recommended): Only deliver Must-haves, rest in Phase 2
   B) Add resources: 2 more engineers, but 1-week ramp-up needed
   C) Reduce quality: Skip some testing (not recommended, explain the risks)

4. Recommend
   "I recommend Option A. This way core features can launch on schedule,
    and Phase 2 can be completed in the next Sprint."

5. Document
   Meeting minutes + email confirmation
\`\`\`

---

## 28-5: Conflict Resolution

### Common Conflict Types

| Type | Example | Root Cause |
|------|---------|-----------|
| Requirements conflict | Business wants quick launch vs QA wants thorough testing | Different priorities |
| Resource conflict | Two projects competing for the same engineer | Limited resources |
| Perception conflict | Different understanding of the problem | Information asymmetry |
| Value conflict | Short-term gains vs long-term architecture | Misaligned goals |
| Interpersonal conflict | Personal style differences | Communication issues |

### Thomas-Kilmann Conflict Model

\`\`\`
                High
                │
    Competing   │   Collaborating
    Win-Lose    │   Win-Win
    Assertiveness│
                │   Compromising
                │   Give & Take
                │
    Avoiding    │   Accommodating
    Lose-Lose   │   Lose-Win
                │
                Low──────────────────High
                    Cooperativeness
\`\`\`

### Appropriate Scenarios for Each Strategy

| Strategy | Best For | Example |
|----------|----------|---------|
| Collaborating | Both parties' interests are important | Cross-department requirements integration |
| Competing | Urgent and you're certain you're right | Security vulnerability must be fixed immediately |
| Compromising | Time is limited, need a quick solution | Scope negotiation |
| Accommodating | The other party's issue is more important | Conceding on non-core requirements |
| Avoiding | Issue is unimportant or cool-down needed | Emotionally charged arguments |

### STAR Framework for Conflict Resolution

\`\`\`
Situation: Describe the conflict background
Task: Your role and responsibilities
Action: Specific steps you took
Result: Final outcome and lessons learned
\`\`\`

### Real-World Example: Sales vs Engineering Requirement Conflict

\`\`\`
Situation:
Sales demanded a new discount calculation feature go live within 2 weeks.
Engineering estimated at least 6 weeks (including testing).

Task:
As the BA, I needed to find a solution acceptable to both sides.

Action:
1. Met 1:1 with both sides to understand their real needs
   - Sales: A promotion event at month-end required the discount feature
   - Engineering: The core concern was complex calculation logic requiring thorough testing

2. Analyzed core needs
   - Sales actually needed "the ability to run a promotion at month-end"
   - Engineering was worried about "calculation errors causing financial losses"

3. Proposed a compromise
   - Phase 1 (2 weeks): Fixed discount (15% off sitewide), simple rules
   - Phase 2 (4 weeks later): Flexible discounts (tiered, combo, threshold-based)
   - Extra: Phase 1 includes an admin manual confirmation step to reduce risk

4. Held a three-party meeting to reach consensus

Result:
- Phase 1 launched on schedule, promotion was successful
- Phase 2 full feature launched with zero calculation errors
- Both sides were satisfied with the outcome
\`\`\`

### Conflict Resolution Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Focus on the issue, not the person | Criticize in public settings |
| Support arguments with data | Rely only on feelings or experience |
| Look for common interests | Insist on zero-sum thinking |
| Proactively propose alternatives | Only raise problems without solutions |
| Document consensus and decisions | Make verbal promises without records |

---

## 28-6: Stakeholder Management Strategy Case Study

### Case: Enterprise ERP System Upgrade

#### Background

\`\`\`
Company: Mid-sized manufacturer (500 employees)
Project: Upgrade from legacy ERP to cloud ERP
Budget: $500K
Timeline: 12 months
Impact scope: All departments across the company
\`\`\`

#### Stakeholder Map

\`\`\`
Manage Closely:
┌─────────────────────────────────────┐
│ CEO — Ultimate decision maker       │
│ Concern: ROI, operational disruption│
│ Strategy: Monthly Executive Review  │
│                                     │
│ CFO — Budget controller             │
│ Concern: Cost overrun, unclear ROI  │
│ Strategy: Monthly budget report +   │
│ ROI tracking                        │
│                                     │
│ VP Operations — Most affected dept  │
│ Concern: Production line disruption │
│ Strategy: Weekly progress sync,     │
│ deployment plan in advance          │
└─────────────────────────────────────┘

Keep Satisfied:
┌─────────────────────────────────────┐
│ CTO — Technical decisions           │
│ Strategy: Architecture review       │
│ meetings (by milestone)             │
│                                     │
│ External consulting firm            │
│ Strategy: Contract management,      │
│ periodic reviews                    │
└─────────────────────────────────────┘

Keep Informed:
┌─────────────────────────────────────┐
│ Department heads — Daily usage      │
│ impact                              │
│ Strategy: Monthly Newsletter +      │
│ Q&A Session                         │
│                                     │
│ End users (company-wide)            │
│ Strategy: Training plan + support   │
│ hotline                             │
└─────────────────────────────────────┘

Monitor:
┌─────────────────────────────────────┐
│ External auditors                   │
│ Strategy: Compliance documentation  │
│ on file                             │
└─────────────────────────────────────┘
\`\`\`

#### Communication Plan

| Phase | Audience | Key Message | Channel | Frequency |
|-------|----------|-------------|---------|-----------|
| Initiation | Company-wide | Why change, vision, timeline | All-hands meeting | Once |
| Analysis | Department heads | Requirements confirmation, process changes | Workshop | 2x per department |
| Development | Sponsor | Progress, risks, decisions needed | 1:1 | Weekly |
| Testing | End Users | UAT participation, feedback collection | Training session | Intensive |
| Go-Live | Company-wide | User guide, support channels | Email + video | Before and after launch |

#### Risks and Mitigation

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|------------|-------------------|
| User resistance to change | High | High | Change management, early involvement, Champions program |
| Scope Creep | High | Medium | Strict Change Control Process |
| Key personnel departure | High | Low | Knowledge transfer, documentation, backup staffing |
| Data migration failure | Critical | Medium | Multiple test rounds, rollback plan, parallel operation |

#### Change Management (ADKAR Model)

\`\`\`
A — Awareness: Why do we need to change?
    → Current system maintenance costs increasing 20% annually, cannot support new business
D — Desire: Why should I cooperate?
    → New system makes your work easier, no more manual reconciliation
K — Knowledge: What do I need to learn?
    → Comprehensive training courses and operation manuals provided
A — Ability: Can I do it?
    → 1-month parallel operation period with dedicated support staff
R — Reinforcement: Will the change stick?
    → KPI adjustments, incentive measures, continuous improvement mechanisms
\`\`\`

---

## Cheat Sheet: Stakeholder Management Quick Reference

### Core Tools

\`\`\`
1. Stakeholder Register → Who are the stakeholders?
2. Power/Interest Grid → How to classify them?
3. RACI Matrix → Who is responsible for what?
4. Communication Plan → How to communicate?
5. ADKAR Model → How to drive change?
6. Thomas-Kilmann Model → How to handle conflicts?
\`\`\`

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| How to identify stakeholders? | Org chart + Process map + Contracts + History |
| How to use Power/Interest Grid? | Four-quadrant classification, differentiated communication strategies |
| What is RACI? | Responsible / Accountable / Consulted / Informed |
| How to handle requirement conflicts? | Find common interests + Provide options + Support with data |
| Users resisting change? | ADKAR + Early involvement + Training + Champions |
| How to manage Scope Creep? | Change Request + Impact Assessment + CCB |

### Golden Rules of Communication

\`\`\`
Upward: Lead with conclusions, use numbers, give options
Downward: Start with "Why", listen more, give frequent feedback
External: Professional, concise, keep records
Conflict: Focus on issues not people, find consensus, document decisions
\`\`\`
`;

export default world28_en;
