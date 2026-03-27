const world29_en = `
# World 29: Business Document Writing

> A good BA doesn't just analyze — they must also know how to "write." Your documents are your deliverables and a reflection of your professionalism.

Common interview questions: "Have you written a BRD?" "What do your requirements documents look like?"
This chapter teaches you how to write professional, clear, and impactful business documents.

---

## 29-1: BRD Structure and Writing

### What Is a BRD (Business Requirements Document)?

A BRD describes project requirements from a business perspective, answering "What" and "Why," not "How."

### Standard BRD Structure

\`\`\`
1. Document Control
   - Version history, author, reviewers, status

2. Executive Summary
   - Entire project summarized in one page

3. Business Objectives
   - SMART goals, KPIs, success metrics

4. Current State Analysis
   - Existing processes, pain points, gaps

5. Scope
   - In Scope / Out of Scope

6. Business Requirements
   - Requirements list, priorities, sources

7. Stakeholders
   - Stakeholder Map, RACI

8. Assumptions & Constraints
   - Assumptions, technical limitations, regulatory constraints

9. Dependencies
   - External systems, third parties, other projects

10. Risks
    - Risk assessment, mitigation strategies

11. Timeline
    - Milestones, phase planning

12. Appendix
    - Glossary, references, process diagrams
\`\`\`

### BRD Writing Principles

| Principle | Description | Example |
|-----------|-------------|---------|
| Clear | Avoid ambiguous language | ❌ "ASAP" → ✅ "Within 2 weeks" |
| Complete | Cover all aspects | Include Happy Path + Edge Cases |
| Consistent | Uniform terminology | Use "customer" throughout, don't mix with "user/client" |
| Concise | Don't be verbose | One sentence per requirement, details in sub-items |
| Correct | Verified information | Cite data sources, stakeholder confirmation |
| Traceable | Every requirement has an ID | BR-001, BR-002... |

### BRD vs PRD vs FRD

| Aspect | BRD | PRD | FRD |
|--------|-----|-----|-----|
| Author | BA | PM / PO | BA / SA |
| Audience | Management, Sponsor | Dev team, Designers | Dev, QA |
| Content | Why + What (business) | What (product) | How (functional details) |
| Abstraction | High | Medium | Low |
| Includes technical detail? | No | Partial | Yes |

---

## 29-2: FRD Writing

### FRD (Functional Requirements Document) Structure

\`\`\`
1. Introduction
   - Purpose, scope, audience

2. System Overview
   - System architecture, context diagram

3. Functional Requirements
   - Modular listing of each feature

4. User Interface Requirements
   - Screen specifications, wireframe references

5. Data Requirements
   - Data fields, formats, validation rules

6. Integration Requirements
   - API specifications, data flows

7. Non-Functional Requirements
   - Performance, security, availability

8. Business Rules
   - Calculation logic, conditional logic

9. Glossary
   - Technical term definitions
\`\`\`

### Functional Requirement Writing Example

\`\`\`
FR-001: User Registration

Description: The system shall allow new users to register an account via email.

Preconditions:
- User does not already have an account

Input Fields:
| Field | Type | Required | Validation Rules |
|-------|------|----------|-----------------|
| Email | String | Yes | Valid email format |
| Password | String | Yes | Minimum 8 characters, uppercase + lowercase + number |
| Name | String | Yes | 2-50 characters |
| Phone | String | No | Local mobile format (e.g., +1-xxx-xxx-xxxx) |

Processing Logic:
1. Verify if the email already exists
2. If exists, display error message ERR-001
3. Encrypt and store the password (bcrypt, cost factor 12)
4. Send a verification email to the user
5. Account is activated after the user clicks the verification link

Output:
- Success: Redirect to welcome page, display "Registration successful, please check your email for verification"
- Failure: Display corresponding error message

Error Codes:
| Code | Message | Trigger Condition |
|------|---------|------------------|
| ERR-001 | This email is already registered | Duplicate email |
| ERR-002 | Password strength insufficient | Does not meet rules |
| ERR-003 | Verification email failed to send | Email service error |
\`\`\`

### Business Rules Writing Example

\`\`\`
BR-001: Order Discount Calculation

Rules:
IF order amount >= 3,000 AND membership level = 'Gold'
THEN discount = 15%
ELSE IF order amount >= 3,000 AND membership level = 'Silver'
THEN discount = 10%
ELSE IF order amount >= 1,000
THEN discount = 5%
ELSE
THEN discount = 0%

Notes:
- Discount cannot be combined with other coupons
- Post-discount amount rounded to nearest whole number
- Maximum discount capped at $15
\`\`\`

### Decision Table

| Condition | Rule 1 | Rule 2 | Rule 3 | Rule 4 |
|-----------|--------|--------|--------|--------|
| Amount >= 3,000 | Y | Y | N | N |
| Amount >= 1,000 | Y | Y | Y | N |
| Gold Member | Y | N | - | - |
| **Discount** | **15%** | **10%** | **5%** | **0%** |

---

## 29-3: Meeting Minutes Writing

### Meeting Minutes Template

\`\`\`
Meeting Minutes

Date: 2026-03-15
Time: 14:00 - 15:30
Location: Online (Google Meet)
Facilitator: Alex Wang (BA)
Note-taker: Alex Wang (BA)

Attendees:
- VP Lee (Sponsor)
- Manager Chen (Sales Dept.)
- Engineer Zhang (Tech Lead)

Absent:
- Supervisor Lin (Customer Service) — Notified in advance

Topic 1: CRM Project Phase 2 Requirements Confirmation
Discussion:
- Sales department raised the need for a customer segmentation report feature
- Engineering estimated 3 weeks of development time
- Decided to classify the report feature as Phase 2 Must-have

Topic 2: API Integration Progress
Discussion:
- Third-party payment API documentation has been obtained
- Test environment expected to be set up next week
- Risk: Slow response from the vendor may affect timeline

Action Items:
| # | Item | Owner | Deadline | Status |
|---|------|-------|----------|--------|
| 1 | Complete customer segmentation report PRD | Alex Wang | 03/22 | New |
| 2 | Set up API test environment | Engineer Zhang | 03/20 | In Progress |
| 3 | Follow up on customer service dept requirements | Alex Wang | 03/18 | New |

Next Meeting: 2026-03-22 14:00
\`\`\`

### The 5C Principles for Meeting Minutes

\`\`\`
C — Clear: Who said what, what was decided
C — Concise: Record key points, not the process
C — Complete: All Action Items have owners and deadlines
C — Correct: Send for confirmation afterwards, within 24 hours
C — Consistent: Fixed format for easy search and retrieval
\`\`\`

### Efficient Note-Taking Tips

\`\`\`
Before the meeting:
- Prepare and distribute the agenda in advance
- Confirm attendees
- Prepare materials for discussion

During the meeting:
- Record "decisions" rather than "discussion process"
- Immediately confirm Action Item owners and deadlines
- Mark disputed points with "[To Be Confirmed]"

After the meeting:
- Distribute minutes within 24 hours
- Subject format: [Meeting Minutes] Project Name - Date - Topic
- Ask attendees to confirm if anything was missed
\`\`\`

---

## 29-4: Status Update Writing

### Weekly Report Template (RAG Status)

\`\`\`
Project Weekly Report — CRM Phase 2
Date: 2026-03-15 ~ 03-21
Author: Alex Wang

Overall Status: Yellow (at risk but manageable)

┌──────────────────────────────────────┐
│ Completed This Week                  │
│ ✅ Completed customer segmentation   │
│    report requirements spec          │
│ ✅ Completed API test environment    │
│    setup                             │
│ ✅ Conducted UAT Round 1             │
│    (passed 15/20 test cases)         │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ Next Week Plan                       │
│ - Fix 5 failed UAT test cases        │
│ - Begin Phase 2 UI design            │
│ - Third-party payment API            │
│   integration testing                │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ Risks & Issues                       │
│ RED: Payment API vendor response     │
│   delayed by 3 days                  │
│   → Impact: Integration timeline     │
│     may slip 1 week                  │
│   → Mitigation: Escalated contact to │
│     vendor management level          │
│                                      │
│ YELLOW: UAT found report calculation │
│   logic issue                        │
│   → Impact: Needs extra 2 days to fix│
│   → Mitigation: Assigned engineer    │
│     for priority resolution          │
└──────────────────────────────────────┘

Progress Tracking:
| Module | Planned | Actual | Status |
|--------|---------|--------|--------|
| Requirements Analysis | 100% | 100% | Green |
| UI Design | 60% | 55% | Yellow |
| Backend Development | 80% | 75% | Yellow |
| API Integration | 50% | 30% | Red |
| Testing | 40% | 35% | Yellow |

Decision Needed:
1. Should we activate the backup plan for the payment API delay (switch to Vendor B)?
\`\`\`

### RAG Status Definitions

| Color | Status | Meaning | Action |
|-------|--------|---------|--------|
| Green | On Track | Proceeding as planned | Continue monitoring |
| Yellow | At Risk | There are risks but mitigation plans exist | Monitor and execute mitigation |
| Red | Off Track | Intervention or decisions needed | Escalate |

### Characteristics of a Good Status Update

\`\`\`
1. Lead with the conclusion (Green / Yellow / Red)
2. Use facts and numbers (passed 15/20 cases, not "mostly done")
3. Risks should include mitigation plans (don't just raise problems)
4. Items needing decisions should be clearly flagged
5. Consistent format for quick scanning
\`\`\`

---

## 29-5: Executive Summary Writing

### Purpose of an Executive Summary

Enable senior executives to understand the core content of the entire document within 2 minutes.

### Structure: SCQA Framework

\`\`\`
S — Situation: Current state of affairs
C — Complication: Challenges encountered
Q — Question: What question needs to be answered
A — Answer: Recommended solution
\`\`\`

### Example 1: Project Proposal

\`\`\`
Executive Summary

Situation:
The customer service department currently handles 12,000 calls per month,
with an average handling time of 8.5 minutes and annual staff costs of $600K.
45% of incoming calls are repetitive issues (order inquiries, return processes).

Complication:
With 30% business growth, call volume is expected to increase to 15,600/month,
but the staffing budget is only increasing by 10%. Customer wait time has risen
from 2 minutes to 5 minutes, and customer satisfaction has dropped 15%.

Answer:
Implement an intelligent customer service system (Chatbot + self-service portal),
expected to automatically handle 40% of repetitive issues.

Expected Benefits:
- Customer service costs reduced by $180K/year (30%)
- Average wait time reduced to under 2 minutes
- Customer satisfaction improved to 4.5/5.0
- Payback period: 8 months

Investment Required:
- System development: $120K
- Annual operations: $25K
- Implementation period: 6 months
\`\`\`

### Example 2: Analysis Report Summary

\`\`\`
Executive Summary

This report analyzes user churn data for 2025 Q4.

Key Findings:
1. Monthly churn rate increased from 3.2% to 4.8% (50% quarter-over-quarter increase)
2. Churn concentrated among new users registered 30-60 days (62% of total churn)
3. Primary cause: Poor onboarding experience (cited by 78% of users in survey)

Recommended Actions:
1. Redesign onboarding flow (estimated impact: reduce new user churn by 30%)
2. Add automated follow-up emails at Day 7 and Day 14
3. Build a gamified "new user quest" mechanism

Estimated ROI:
- Recover 350 churned users per month
- Annual revenue increase of $1.26M (based on ARPU of $300)
\`\`\`

### Executive Summary Writing Principles

\`\`\`
1. Length: No more than 1 page (250-400 words)
2. Standalone: Understandable without reading the full document
3. Conclusion first: State the conclusion in the first paragraph
4. Data-driven: Avoid vague descriptions
5. Action-oriented: Clearly tell the reader "So What"
6. Jargon-free: Avoid technical terminology
\`\`\`

### Common Mistakes

| ❌ Mistake | ✅ Correction |
|-----------|-------------|
| Treating Introduction as Executive Summary | Summary is the conclusion; Introduction is the background |
| Too many technical details | Only keep business impact |
| No numbers | Include quantitative data |
| No action recommendations | Clearly list Next Steps |
| Too long (over 2 pages) | Trim to 1 page |

---

## 29-6: Complete BRD Case Study

### Case: E-Commerce Platform Loyalty Program

\`\`\`
╔══════════════════════════════════════╗
║   Business Requirements Document    ║
║   E-Commerce Loyalty Program        ║
║   Version: 1.0                      ║
║   Author: Alex Wang (Business       ║
║           Analyst)                  ║
║   Date: 2026-03-15                  ║
║   Status: Draft                     ║
╚══════════════════════════════════════╝
\`\`\`

#### 1. Executive Summary

The company faces rising customer churn (quarterly churn rate 4.8%) and stagnant average order value.
The recommendation is to introduce a loyalty program (points-based), targeting a 25% reduction in churn
within 6 months and a 15% increase in repeat purchase rate, with an estimated annual revenue increase of $800K.

#### 2. Business Objectives

| Objective | KPI | Target | Timeline |
|-----------|-----|--------|----------|
| Reduce churn | Monthly Churn Rate | From 4.8% to 3.6% | 6 months |
| Increase repeat purchases | Repeat Purchase Rate | From 35% to 50% | 6 months |
| Increase average order value | AOV | From $28 to $33 | 12 months |
| Grow membership | Active Members | Reach 50,000 | 12 months |

#### 3. Current State Analysis

\`\`\`
Current State:
- No membership tier system; all customers receive the same promotions
- Promotions rely on sitewide discounts, compressing margins
- Customer data scattered across 3 systems (EC platform, CRM, CS system)
- Lack of customer lifecycle management

Pain Points:
- Cannot identify high-value customers (Top 20% contribute 65% of revenue)
- Customer acquisition cost (CAC) increasing 25% year-over-year
- Customers have no loyalty, high price sensitivity
\`\`\`

#### 4. Scope

\`\`\`
In Scope:
✅ Membership tier system (Bronze, Silver, Gold, Diamond)
✅ Points accumulation and redemption mechanism
✅ Member-exclusive offers
✅ Member Dashboard
✅ Points inquiry and transaction history
✅ Integration with existing EC platform

Out of Scope:
❌ Physical store POS integration (Phase 2)
❌ Cross-brand co-branded points (Phase 3)
❌ Social sharing rewards (Phase 2)
❌ Gamification features (Phase 2)
\`\`\`

#### 5. Business Requirements

| ID | Description | Priority | Source |
|----|-------------|----------|--------|
| BR-001 | System auto-upgrades/downgrades membership tier based on spending | Must | Sponsor |
| BR-002 | $1 spent = 1 point; points redeemable toward purchases | Must | Sales |
| BR-003 | Different tiers receive different discount rates | Must | Sales |
| BR-004 | Points expire after 12 months (rolling) | Should | Finance |
| BR-005 | Members receive double points during their birthday month | Should | Marketing |
| BR-006 | Provide members with exclusive early access to purchases | Could | Marketing |
| BR-007 | Referral reward of 300 points for friend signup | Could | Growth Team |

#### 6. Membership Tier Rules

| Tier | Annual Spending Threshold | Discount | Points Multiplier | Exclusive Benefits |
|------|--------------------------|----------|-------------------|-------------------|
| Bronze | $0+ | 0% | 1x | Basic member pricing |
| Silver | $330+ | 3% | 1.5x | Free shipping, birthday gift |
| Gold | $1,000+ | 5% | 2x | Priority CS, early access |
| Diamond | $2,600+ | 8% | 3x | Personal advisor, VIP events |

#### 7. Assumptions & Constraints

\`\`\`
Assumptions:
- Existing EC platform supports API integration
- Finance system can handle points liability accounting
- Customers are willing to provide personal data in exchange for benefits

Constraints:
- Budget cap of $160K (including first-year operations)
- Must launch before 2026 Q3
- Must comply with data privacy regulations
- Points redemption rate requires Finance department approval
\`\`\`

#### 8. Risk Assessment

| Risk | Impact | Probability | Severity | Mitigation Strategy |
|------|--------|------------|----------|-------------------|
| Points cost too high | Profit decline | Medium | High | Set redemption caps, monitor points issuance volume |
| System integration delay | Launch postponement | Medium | Medium | Conduct POC early, set milestones |
| Low user engagement | ROI below target | Low | High | Onboarding guidance, promotional campaigns |
| Competitor follow-up | Differentiation lost | Medium | Medium | Continuous iteration, enhance experience |

#### 9. Success Metrics

\`\`\`
Post-launch tracking metrics:
- Member registration rate (Target: 10,000 in first month)
- Points utilization rate (Target: > 60%)
- Member revenue contribution share (Target: > 70%)
- Tier upgrade rate (Target: 20% of members upgrade within 6 months)
- NPS score (Target: > 40)
\`\`\`

---

## Cheat Sheet: Business Document Writing Quick Reference

### Document Type Quick Reference

\`\`\`
BRD → "Why to do it" and "What to do" (business level)
PRD → "What to do" and "How to do it" (product level)
FRD → "How to do it" (functional details)
SRS → "How to do it" (technical specifications)
\`\`\`

### Golden Rules of Writing

\`\`\`
1. Know your audience (Write for your audience)
2. Lead with the conclusion (Bottom Line Up Front)
3. Use numbers (Quantify everything)
4. One concept per paragraph (One idea per paragraph)
5. Use active voice
6. Avoid vague terms ("fast," "many," "as much as possible" → specific numbers)
\`\`\`

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| What does a BRD include? | Objectives, current state, scope, requirements, risks, timeline |
| BRD vs PRD? | BRD focuses on business Why/What; PRD focuses on product What/How |
| How to ensure document quality? | Peer Review + Stakeholder Sign-off |
| How to handle requirement changes? | Change Request + Impact Analysis + CCB |
| How to write an Executive Summary? | SCQA framework, within one page, supported by numbers |
`;

export default world29_en;
