const world33_en = `
# World 33: Testing & Validation

> Building a product doesn't mean building it right. UAT (User Acceptance Testing) is the last line of defense to ensure deliverables meet requirements.
> Business Engineers and Product Analysts both need to know how to design tests, track defects, and validate requirements.

Before a system goes live, testing is the most effective way to reduce risk.
This chapter teaches you the complete process from UAT concepts to a full test plan.

---

## 33-1: UAT Concepts & Process

### What is UAT?

UAT (User Acceptance Testing) = User Acceptance Testing

- **Purpose**: Confirm that system functionality meets business requirements
- **Performed by**: Business-side users (not engineers)
- **Timing**: After development is complete and internal testing has passed
- **Outcome**: Pass → Go live; Fail → Fix and retest

### UAT vs Other Testing Types

| Test Type | Performed By | Focus | Timing |
|-----------|-------------|-------|--------|
| Unit Test | Engineers | Individual functions / components | During development |
| Integration Test | Engineers | Inter-module integration | Mid-to-late development |
| System Test (SIT) | QA Team | End-to-end system functionality | After development |
| UAT | Business Users | Business scenario compliance | After SIT passes |
| Regression Test | QA / Automation | Confirm existing features are intact | After every change |

### Standard UAT Process

\`\`\`
1. UAT Plan Development
   ↓
2. Test Case Design (based on requirements documents)
   ↓
3. Test Environment Setup (close to production)
   ↓
4. UAT Execution (business users perform testing)
   ↓
5. Defect Logging & Tracking
   ↓
6. Defect Fixing & Regression Testing
   ↓
7. Sign-off Approval
   ↓
8. Go-Live Deployment
\`\`\`

### UAT Entry Criteria

- [ ] All SIT test cases passed
- [ ] Test environment deployed with latest version
- [ ] Test data preparation complete
- [ ] UAT plan approved
- [ ] Participants have completed training

### UAT Exit Criteria

- [ ] All Critical / High defects resolved
- [ ] Test case pass rate ≥ 95%
- [ ] Business owner sign-off obtained
- [ ] Remaining defects have a clear resolution plan

### Common Interview Questions

**Q: Why can't UAT be replaced by other types of testing?**

A: Because other tests verify whether "the system works correctly," while UAT verifies whether "the system meets business expectations."
Engineers may build the feature correctly, but it may not be what the users actually need.

---

## 33-2: Writing Test Cases

### Test Case Structure

| Field | Description | Example |
|-------|-------------|---------|
| Test Case ID | Unique identifier | TC-033-001 |
| Test Item | Feature module being tested | Order Management |
| Preconditions | Required state before execution | Logged in as admin |
| Test Steps | Specific action steps | 1. Click "New Order"... |
| Expected Result | Description of correct behavior | Order created successfully, order number displayed |
| Actual Result | Real result during testing | (Filled during testing) |
| Status | Pass / Fail / Blocked | (Filled during testing) |
| Severity | Critical / High / Medium / Low | Medium |
| Notes | Additional remarks | Requires specific test data |

### Writing Principles

1. **One test case tests one thing**
2. **Steps should be specific enough for anyone to execute**
3. **Expected results must be verifiable** (don't write "normal" — write "displays success message XXX")
4. **Cover both positive and negative scenarios**

### Example: E-commerce Order Feature

\`\`\`
Test Case ID: TC-ORDER-001
Test Item: Create Order
Preconditions: Logged in as regular member, at least 1 item in cart
Test Steps:
  1. Navigate to shopping cart page
  2. Confirm item quantity is 2
  3. Click "Checkout"
  4. Select payment method "Credit Card"
  5. Enter credit card information (test card number)
  6. Click "Confirm Payment"
Expected Result:
  - Displays "Order Created Successfully" message
  - Generates order number (format: ORD-YYYYMMDD-XXXX)
  - Shopping cart is cleared
  - Order confirmation email received
Severity: Critical
\`\`\`

### Negative Test Case

\`\`\`
Test Case ID: TC-ORDER-002
Test Item: Checkout with Empty Cart
Preconditions: Logged in, no items in cart
Test Steps:
  1. Navigate to shopping cart page
  2. Click "Checkout"
Expected Result:
  - Displays "Cart is empty, cannot proceed to checkout" prompt
  - Does not proceed to payment flow
Severity: Medium
\`\`\`

### Boundary Test

\`\`\`
Test Case ID: TC-ORDER-003
Test Item: Order Amount Limit
Preconditions: Logged in, cart total = $999,999
Test Steps:
  1. Add a $1 item (total reaches $1,000,000)
  2. Click "Checkout"
Expected Result:
  - Displays "Single order amount exceeds limit" warning
  - Or processes normally (per business rules)
Severity: High
\`\`\`

### Test Case Coverage Matrix

| Requirement ID | Requirement Description | Corresponding Test Cases | Coverage Status |
|---------------|------------------------|------------------------|----------------|
| REQ-001 | Members can create orders | TC-001, TC-002 | ✅ Covered |
| REQ-002 | Support three payment methods | TC-003, TC-004, TC-005 | ✅ Covered |
| REQ-003 | Alert when out of stock | (Missing) | ❌ Pending |

---

## 33-3: Defect Tracking

### Bug Report Standard Format

| Field | Description |
|-------|-------------|
| Bug ID | Unique identifier |
| Title | Brief description of the issue |
| Severity | Critical / High / Medium / Low |
| Priority | P0 / P1 / P2 / P3 |
| Steps to Reproduce | How to trigger the bug |
| Expected Behavior | What should happen correctly |
| Actual Behavior | Current incorrect behavior |
| Environment Info | Browser, OS, version |
| Screenshots / Videos | Supporting materials |
| Assignee | Person responsible for the fix |

### Severity vs Priority

| | High Priority | Low Priority |
|---|---|---|
| **High Severity** | Homepage won't load (fix immediately) | Data export format error (schedule for next Sprint) |
| **Low Severity** | Font change requested by CEO (political priority) | UI misalignment in rare scenario (queue for processing) |

- **Severity**: Technical impact level (how badly the system is broken)
- **Priority**: Business processing order (how quickly it needs to be fixed)

### Defect Lifecycle

\`\`\`
New
  ↓
Open (Confirmed)
  ↓
Assigned
  ↓
In Progress (Being Fixed)
  ↓
Fixed
  ↓
Verified ←→ Reopened
  ↓
Closed
\`\`\`

### Defect Classification Summary

\`\`\`
Defect Distribution Board:
┌──────────────┬──────────┬────────┬────────┬────────┐
│ Module       │ Critical │ High   │ Medium │ Low    │
├──────────────┼──────────┼────────┼────────┼────────┤
│ Order Mgmt   │ 1        │ 3      │ 5      │ 2      │
│ Member System│ 0        │ 1      │ 3      │ 4      │
│ Reports      │ 0        │ 2      │ 1      │ 1      │
│ Access Control│ 2       │ 1      │ 0      │ 0      │
└──────────────┴──────────┴────────┴────────┴────────┘
\`\`\`

### Common Defect Tracking Tools

| Tool | Strengths | Best For |
|------|-----------|----------|
| Jira | Most comprehensive features | Large teams, enterprises |
| Azure DevOps | Microsoft ecosystem integration | .NET / Azure projects |
| Linear | Modern UI, fast | Startups |
| GitHub Issues | Integrated with code | Open source / small projects |
| Trello | Intuitive Kanban boards | Non-technical teams |

### Interview Scenario Question

**Q: UAT testing found 20 bugs, but the project is due to go live next week. How do you handle this?**

A:
1. Classify by Severity and Priority
2. Critical / P0: Must be fixed before go-live
3. High / P1: Try to fix before go-live
4. Medium / Low: Document as Known Issues, schedule for subsequent releases
5. Communicate residual risks with business stakeholders and reach consensus
6. Develop a post-launch monitoring plan

---

## 33-4: Requirement Validation

### Requirements Traceability Matrix (RTM)

| Req ID | Requirement Description | Design Doc | Dev Module | Test Case | UAT Result |
|--------|------------------------|-----------|-----------|----------|-----------|
| REQ-001 | Member Registration | SD-001 | Auth Module | TC-001~003 | Pass |
| REQ-002 | Product Search | SD-002 | Search Module | TC-010~015 | Pass |
| REQ-003 | Shopping Cart | SD-003 | Cart Module | TC-020~028 | Fail (2 bugs) |
| REQ-004 | Payment Integration | SD-004 | Payment Module | TC-030~035 | Blocked |

### Verification vs Validation

| | Verification | Validation |
|---|---|---|
| Question | Are we building it right? | Are we building the right thing? |
| Timing | During development | After development |
| Methods | Code Review, SIT | UAT, Prototype Testing |
| Performed By | Dev / QA Team | Business Users / Clients |

### Requirement Change Control

\`\`\`
Requirement Change Process:
1. Submit Change Request (CR)
   ↓
2. Impact Analysis
   - Impact on timeline?
   - Impact on cost?
   - Impact on other features?
   ↓
3. Change Control Board (CCB) Review
   ↓
4. Approved → Update requirements docs → Adjust test cases
   Rejected → Document reasons → Notify requester
\`\`\`

### Gap Analysis

\`\`\`
Requirements vs Current State Gap:
┌─────────────────┬──────────────┬──────────────┬────────────┐
│ Feature         │ Requirement  │ Current State│ Gap        │
├─────────────────┼──────────────┼──────────────┼────────────┤
│ Report Export   │ PDF + Excel  │ Excel only   │ Missing PDF│
│ Multi-language  │ EN/CN/JP     │ EN/CN        │ Missing JP │
│ Mobile Support  │ RWD Support  │ Desktop only │ Need to dev│
│ Batch Import    │ 1000 rows/tx │ 500 rows/tx  │ Perf optim │
└─────────────────┴──────────────┴──────────────┴────────────┘
\`\`\`

---

## 33-5: Acceptance Testing Strategy

### Test Strategy Document Outline

\`\`\`
1. Test Objectives & Scope
2. Test Approach
3. Test Environment Requirements
4. Staffing & Schedule
5. Entry / Exit Criteria
6. Risks & Contingency Plans
7. Deliverables Checklist
\`\`\`

### Test Layering Strategy

\`\`\`
            ┌───────────┐
            │  E2E Test │  ← Few, verify core flows
            ├───────────┤
          ┌─┤ UAT Test  ├─┐  ← Business scenario coverage
          │ ├───────────┤ │
        ┌─┤ │ Integration│ ├─┐  ← Inter-module integration
        │ │ ├───────────┤ │ │
      ┌─┤ │ │ Unit Test │ │ ├─┐  ← Many, automated
      │ │ │ └───────────┘ │ │ │
      └─┘ └───────────────┘ └─┘
             Test Pyramid
\`\`\`

### Test Environment Comparison

| Environment | Purpose | Data | Stability |
|-------------|---------|------|-----------|
| DEV | Development testing | Mock data | Low |
| SIT | Integration testing | Test data | Medium |
| UAT | Acceptance testing | Near-real data | High |
| Staging | Pre-launch rehearsal | Anonymized real data | Very High |
| Production | Live environment | Real data | Highest |

### Regression Testing Strategy

- **Full Regression**: Run all tests completely (time-consuming but safest)
- **Risk-based Regression**: Test only affected modules
- **Smoke Test**: Test only core flows (quick check)

### Test Data Preparation

\`\`\`
Data Preparation Checklist:
✅ Normal data (Happy Path)
✅ Boundary values (max, min, null)
✅ Abnormal data (special characters, very long strings, SQL injection tests)
✅ Historical data (cross-year, legacy formats)
✅ Large datasets (for performance testing)
✅ Permission data (accounts with different roles)
\`\`\`

---

## 33-6: Complete UAT Plan

### Scenario: E-commerce Platform Revamp UAT

\`\`\`
Project Name: E-commerce Platform v2.0 Revamp
UAT Period: 2026/04/01 - 2026/04/14 (two weeks)
Participants:
  - Business Representatives: 3 (Customer Service, Marketing, Operations)
  - BA / PM: 1 (Coordination & Support)
  - Dev Support: 2 (On-call fixes)
\`\`\`

### Test Scope

| Module | Feature Items | # Test Cases | Owner |
|--------|--------------|-------------|-------|
| Member System | Registration, Login, Profile | 15 | Alice |
| Product Management | Search, Categories, Product Page | 20 | Bob |
| Shopping Flow | Cart, Checkout, Payment | 25 | Alice |
| Order Management | Order Inquiry, Returns, Refunds | 18 | Carol |
| Reporting System | Sales Reports, Member Reports | 12 | Bob |
| **Total** | | **90** | |

### Schedule

\`\`\`
Week 1 (4/1 - 4/7):
  Day 1-2: Test environment validation, training
  Day 3-5: First round of test execution
  Day 6-7: Defect consolidation, dev fixes

Week 2 (4/8 - 4/14):
  Day 8-10: Regression testing + second round
  Day 11-12: Residual defect assessment
  Day 13: Final confirmation
  Day 14: Sign-off approval
\`\`\`

### UAT Daily Standup Template

\`\`\`
1. What tests were completed yesterday?
2. What tests are planned for today?
3. Are there any blockers?
4. New defect statistics
\`\`\`

### UAT Closure Report Template

\`\`\`
UAT Closure Report
==================
Project: E-commerce Platform v2.0
Test Period: 2026/04/01 - 2026/04/14

Test Results Summary:
- Total Test Cases: 90
- Passed: 85 (94.4%)
- Failed: 3 (fixed and verified)
- Not Executed: 2 (due to environment issues)

Defect Statistics:
- Total Defects: 18
- Critical: 2 (fixed)
- High: 5 (fixed)
- Medium: 7 (5 fixed, 2 listed as Known Issues)
- Low: 4 (deferred to next release)

Residual Risks:
1. Report PDF export occasionally has formatting issues (Medium)
   → Workaround: Use Excel export instead
2. Search performance slow with large datasets (Medium)
   → Planned optimization in v2.1

Conclusion: Recommend go-live ✅
Sign-off: [Business Owner] [PM] [IT Lead]
\`\`\`

### Complete Interview Case

**Q: Design a UAT test plan for a CRM system.**

\`\`\`
Answer Framework:
1. Scope: Customer Management, Opportunity Tracking, Campaign Management, Reports
2. Personnel: Sales Dept 5 people, Marketing 2 people, BA 1 person
3. Timeline: 3 weeks (training + two rounds of testing + sign-off)
4. Key Test Cases:
   - Create Customer → Create Opportunity → Track Progress → Close Deal (core flow)
   - Import 5,000 customer records (performance)
   - Role-based permission checks (security)
5. Exit Criteria: Zero Critical defects, pass rate > 95%
6. Risk: Limited business user availability → Prepare user manuals to reduce learning curve
\`\`\`

---

## Key Takeaways - World 33 Cheat Sheet

### UAT Core Concepts

\`\`\`
UAT = User Acceptance Testing
  Purpose: Confirm system meets "business requirements" (not just "technically correct")
  Timing: After SIT, before go-live
  Performed by: Business-side users

Test Case Three Essentials:
  1. Clear steps (anyone can reproduce)
  2. Expected results (verifiable)
  3. Cover positive + negative scenarios

Bug Report Key Point:
  Severity ≠ Priority
  Severity = Technical impact
  Priority = Business urgency

RTM (Requirements Traceability Matrix):
  Requirement → Design → Development → Testing → Acceptance
  Ensure every requirement has corresponding test cases

UAT Success Factors:
  ✅ Clear Entry / Exit Criteria
  ✅ Near-production test environment
  ✅ Sufficient business user participation
  ✅ Efficient defect tracking process
\`\`\`

### Universal Interview Answer Template

\`\`\`
When asked testing-related questions:
1. First clarify the test objective (what are we validating?)
2. Define test scope and approach
3. Explain personnel, timeline, and environment
4. Propose Entry / Exit Criteria
5. Address risks and contingency measures
\`\`\`
`;

export default world33_en;
