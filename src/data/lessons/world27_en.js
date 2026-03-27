const world27_en = `
# World 27: Requirements Analysis

> Requirements analysis is the most essential skill for a Business Analyst. Figuring out "what exactly needs to be done" matters more than "how to do it."
> This chapter teaches you how to extract clear, actionable requirements from ambiguous business needs.

The most common interview questions: "How do you confirm requirements?" "How do you handle requirement conflicts?"
This chapter gives you a systematic approach to answering these questions.

---

## 27-1: Business Requirements vs User Requirements

### Fundamental Differences Between the Two

| Aspect | Business Requirements | User Requirements |
|--------|----------------------|-------------------|
| Perspective | Enterprise / Management | End Users |
| Focus | ROI, Market Share, Efficiency | Usability, Features, Experience |
| Expression | Goal-oriented (Increase conversion rate by 20%) | Behavior-oriented (I want one-click checkout) |
| Decision Maker | C-level, Product Owner | User Research, UX Team |
| Priority | Strategic Level | Execution Level |

### Business Requirements Example

\`\`\`
Objective: Reduce customer service costs by 30%
Background: Currently handling 10,000 customer service calls per month, average handling time 8 minutes
Expectation: Automate 40% of common issues through a self-service system
KPIs: Number of service calls, average handling time, customer satisfaction
Timeline: MVP by Q3, full launch by Q4
\`\`\`

### User Requirements Example

\`\`\`
As an online shopping customer,
I want to check my order delivery status on the website,
So that I don't need to call customer service to ask.

Acceptance Criteria:
- Can look up by entering the order number
- Shows estimated delivery time
- Proactive notification for delivery exceptions
- Page load time < 2 seconds
\`\`\`

### The Relationship: Top-Down Decomposition

\`\`\`
Business Goal
  ↓ Why?
Business Requirement
  ↓ What?
User Requirement
  ↓ How?
Functional Requirement
  ↓ Spec
Technical Specification
\`\`\`

### Interview Focus

> "Describe an experience where you translated a business objective into specific requirements."

Answer Framework:
1. Business Context and Objectives
2. Analysis You Performed (Gap Analysis)
3. How You Decomposed into User Requirements (Decomposition)
4. Final Deliverables and Impact

---

## 27-2: Functional vs Non-Functional Requirements

### Functional Requirements (FR)

Behaviors and features the system "must perform."

| Category | Example |
|----------|---------|
| User Management | Users can register an account using email |
| Search | Supports keyword search, filtering, and sorting |
| Transaction Processing | Supports credit card and mobile payment checkout |
| Notification System | Sends email notification when order status changes |
| Reporting | Admins can export monthly sales reports (CSV) |

### Non-Functional Requirements (NFR)

Quality Attributes of the system.

| NFR Category | Definition | Measurement | Example |
|-------------|-----------|-------------|---------|
| Performance | Response speed | Response Time | Page load < 2 seconds |
| Scalability | Expansion capability | Concurrent Users | Support 10,000 simultaneous users |
| Availability | Uptime | Uptime % | 99.9% uptime (SLA) |
| Security | Protection | Compliance | PCI DSS compliant |
| Usability | Ease of use | Task Completion Rate | New users complete registration within 5 minutes |
| Maintainability | Ease of maintenance | MTTR | Average repair time < 4 hours |
| Compatibility | Cross-platform support | Browser/OS Support | Support Chrome, Safari, Edge |

### FURPS+ Framework

\`\`\`
F — Functionality
U — Usability
R — Reliability
P — Performance
S — Supportability
+ — Design constraints, Implementation, Interface, Physical
\`\`\`

### Common Mistakes

- ❌ Only writing functional requirements, ignoring non-functional ones
- ❌ NFR too vague: "System should be fast" → ✅ "API response time p95 < 500ms"
- ❌ Not defining measurement criteria
- ❌ Writing solutions as requirements: "Use Redis for caching" → ✅ "Repeated query response time < 100ms"

### Practice Question

> "Design a shopping cart feature for an e-commerce platform. List the FR and NFR."

Functional Requirements:
- Add / Remove items
- Modify quantity
- Display subtotal and grand total
- Save cart (cross-device sync for logged-in users)
- Apply coupons

Non-Functional Requirements:
- Cart operation response < 500ms
- Support 5,000 concurrent operations
- Cart data retained for 30 days
- Responsive design for mobile and desktop

---

## 27-3: Requirements Elicitation Techniques

### Common Elicitation Methods

| Method | Best For | Pros | Cons |
|--------|----------|------|------|
| Interview | Deep requirement understanding | Flexible, in-depth | Time-consuming, subjective bias |
| Workshop | Multi-party consensus | Efficient, interactive | Requires facilitation skills |
| Survey | Large-scale user feedback | Scalable, quantifiable | Low response rate, lacks depth |
| Observation | Understanding actual usage behavior | Authentic, objective | Hawthorne effect |
| Document Analysis | Understanding existing processes | Non-intrusive | May be outdated |
| Prototyping | Validating requirement understanding | Intuitive, fast feedback | May be mistaken for final product |

### Interview Technique — SPIN Framework

\`\`\`
S — Situation: What is the current process?
P — Problem: What is the biggest pain point?
I — Implication: What impact does this problem cause?
N — Need-payoff: If resolved, what benefits would it bring?
\`\`\`

### Interview Question Examples

\`\`\`
Situation:
"Can you describe your current process for handling returns?"
"How many returns do you process per day?"

Problem:
"Which step in this process takes the most time?"
"Where do errors occur most frequently?"

Implication:
"What consequences do these errors lead to? Customer complaints? Refund delays?"
"How much does this problem cost per month?"

Need-payoff:
"If the return process could be automated, how much time do you think it would save?"
"What kind of solution would be most helpful to you?"
\`\`\`

### Workshop Facilitation Techniques

\`\`\`
1. Agenda Setting
2. Ice Breaker
3. As-Is Process Analysis
4. Pain Point Brainstorming
5. MoSCoW Prioritization
6. Consensus Building
7. Action Items
\`\`\`

### Requirements Elicitation Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| Ask open-ended questions | Ask leading questions |
| Record original wording | Interpret meaning yourself |
| Confirm understanding (Paraphrase) | Assume you understand |
| Ask "Why" to get to root cause | Only capture surface requirements |
| Distinguish requirements vs solutions | Confuse the two |

---

## 27-4: Writing User Stories

### Standard User Story Format

\`\`\`
As a [role],
I want to [action],
So that [value/purpose].
\`\`\`

### INVEST Principles

| Principle | Description | Counter-Example |
|-----------|-------------|-----------------|
| **I**ndependent | Stories don't depend on each other | "Must complete A before doing B" |
| **N**egotiable | Details are negotiable | Over-specified technical solution |
| **V**aluable | Valuable to the user | "Create Database Schema" |
| **E**stimable | Effort can be estimated | "Improve system performance" |
| **S**mall | Completable within one Sprint | "Redesign the entire system" |
| **T**estable | Completion is verifiable | "Make users happier" |

### User Story Example (E-Commerce Returns)

\`\`\`
Epic: Return Management System

Story 1:
As a customer,
I want to submit a return request online,
So that I don't need to call customer service.

Story 2:
As a customer service agent,
I want to see the complete history of return requests,
So that I can quickly resolve customer issues.

Story 3:
As an operations manager,
I want to see trend reports on return rates,
So that I can identify problematic products and take action.
\`\`\`

### User Story Mapping

\`\`\`
         Activity
    ┌────────────┬────────────┬──────────────┐
    │ Browse     │ Place      │ After-sales  │   ← Backbone
    │ Products   │ Order      │ Service      │
    ├────────────┼────────────┼──────────────┤
    │ Search     │ Add to Cart│ Track Order  │   ← MVP (Release 1)
    │ Filter     │ Enter      │ Request      │
    │            │ Address    │ Return       │
    ├────────────┼────────────┼──────────────┤
    │ Recommend  │ Coupons    │ Refund       │   ← Release 2
    │ Favorites  │ Installment│ Tracking     │
    │            │ Payment    │ Exchange     │
    ├────────────┼────────────┼──────────────┤
    │ Compare    │ Subscribe  │ Reviews      │   ← Release 3
    │ Social     │ Gift Cards │ Live Chat    │
    │ Share      │            │ Support      │
    └────────────┴────────────┴──────────────┘
\`\`\`

### Techniques for Splitting User Stories

\`\`\`
Splitting Dimensions:
1. By workflow steps
2. By business rules
3. By data types
4. By operations (CRUD)
5. By user roles
6. By platform (Web / Mobile / API)
\`\`\`

---

## 27-5: Writing Acceptance Criteria

### What Are Acceptance Criteria?

The "definition of done" for a User Story. The Story is only complete when all these conditions are met.

### Format 1: Given-When-Then (BDD Style)

\`\`\`
Given [precondition],
When [user action],
Then [expected result].
\`\`\`

### Example: Online Return Request

\`\`\`
AC 1: Successful Return Submission
Given the customer is logged in and has a completed order,
When the customer selects that order and clicks "Request Return",
Then the system displays a return form with return reason options.

AC 2: Return Deadline Validation
Given the order was completed more than 7 days ago,
When the customer attempts to request a return,
Then the system displays a "Return period has expired" message.

AC 3: Return Status Notification
Given the customer has submitted a return request,
When the return status changes from "Processing" to "Approved",
Then the system sends an email notification informing the customer that the return is approved.

AC 4: Partial Return
Given the order contains multiple items,
When the customer selects only some items for return,
Then the system calculates the refund amount only for the selected items.
\`\`\`

### Format 2: Checklist Style

\`\`\`
Story: Customer can search for products

Acceptance Criteria:
☐ Search box appears at the top of the page
☐ Entering keywords and pressing Enter or clicking the search button triggers the search
☐ Search results display within 2 seconds
☐ Shows "No matching products found" message when there are no results
☐ Search results can be sorted by price, rating, listing date
☐ Search keywords are highlighted in the results
☐ Supports both Chinese and English search
\`\`\`

### Common Mistakes in Writing AC

| Mistake | Correction |
|---------|-----------|
| Too vague: "System works properly" | Describe expected behavior specifically |
| Too technical: "POST /api/returns returns 201" | Use business language |
| Missing edge cases | Consider errors, null values, extreme cases |
| Missing non-functional requirements | Include performance and security conditions |
| Only writing the Happy Path | Include exception handling scenarios |

### Definition of Done (DoD) vs Acceptance Criteria

| Aspect | Acceptance Criteria | Definition of Done |
|--------|--------------------|--------------------|
| Scope | Specific Story | All Stories |
| Content | Business conditions | Quality standards |
| Example | Returns allowed within 7 days | Code Review passed |
| Defined By | PO + BA | Team consensus |

---

## 27-6: Complete Requirements Document in Practice

### Case Study: Ride-Hailing Platform Requirements Analysis

#### 1. Business Requirements

\`\`\`
Project Name: GoRide Ride-Hailing Platform
Business Objectives:
- Reach 5,000 rides per day within 6 months
- Average driver pickup time < 3 minutes
- Rider satisfaction > 4.5 / 5.0
- First-year revenue target: $1.6M
\`\`\`

#### 2. Stakeholder Map

\`\`\`
High Power / High Interest → Manage Closely: CEO, Product Owner, Investors
High Power / Low Interest → Keep Satisfied: Regulatory bodies, Partner fleets
Low Power / High Interest → Keep Informed: Drivers, Riders, Customer service
Low Power / Low Interest → Monitor: Media, Competitors
\`\`\`

#### 3. User Stories (Core Epics)

\`\`\`
Epic 1: Rider Booking
- US-001: Rider can enter a destination and view estimated fare
- US-002: Rider can choose a vehicle type (Economy / Comfort / Business)
- US-003: Rider can track the driver's location in real time
- US-004: Rider can rate the ride after completion

Epic 2: Driver Acceptance
- US-010: Driver can toggle online/offline status for accepting rides
- US-011: Driver must accept or decline a ride request within 30 seconds
- US-012: Driver can view daily earnings summary

Epic 3: Fare Calculation and Payment
- US-020: System automatically calculates fare based on distance + time
- US-021: Supports credit card and mobile payment
- US-022: Automatic charge upon trip completion with receipt sent
\`\`\`

#### 4. Key Acceptance Criteria

\`\`\`
US-001 Acceptance Criteria:

Given the rider has entered a pickup location and destination,
When the system finishes calculating the route,
Then it displays the estimated fare range (±15%) and estimated time.

Given surge pricing is active (dynamic pricing in effect),
When the rider views the estimated fare,
Then it displays the surge multiplier and a comparison with the base price.

Given the entered address cannot be recognized,
When the rider submits the destination,
Then it displays a list of suggested addresses to choose from.
\`\`\`

#### 5. Non-Functional Requirements

\`\`\`
NFR-001: Ride request response time < 2 seconds (p95)
NFR-002: System availability 99.95% (monthly downtime < 22 minutes)
NFR-003: Support 50,000 concurrent online users
NFR-004: Location update frequency every 3 seconds
NFR-005: Payment data encryption (AES-256)
NFR-006: Compliant with data protection regulations (GDPR / local privacy laws)
\`\`\`

#### 6. Requirements Traceability Matrix

| Req ID | Description | Source | Priority | Status | Test Cases |
|--------|------------|--------|----------|--------|-----------|
| US-001 | Rider views estimated fare | Stakeholder Workshop | Must | In Progress | TC-001, TC-002 |
| US-002 | Choose vehicle type | User Research | Must | Backlog | TC-003 |
| US-003 | Real-time driver tracking | User Research | Must | Backlog | TC-004, TC-005 |
| NFR-001 | Response time < 2 seconds | SLA Agreement | Must | Backlog | TC-P01 |

---

## Cheat Sheet: Requirements Analysis Quick Reference

### Requirements Analysis Process

\`\`\`
1. Understand business context → Business Requirements
2. Identify stakeholders → Stakeholder Analysis
3. Elicit requirements → Interviews, Workshops, Surveys
4. Write User Stories → As a / I want / So that
5. Define Acceptance Criteria → Given / When / Then
6. Distinguish FR vs NFR → FURPS+ Framework
7. Build traceability matrix → Traceability Matrix
8. Confirm and sign off → Review & Sign-off
\`\`\`

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| How do you elicit requirements? | SPIN interviews, Workshops, Document analysis |
| FR vs NFR difference? | FR = what the system does; NFR = system quality attributes |
| User Story format? | As a / I want / So that + INVEST |
| How to handle requirement conflicts? | MoSCoW prioritization + Stakeholder negotiation |
| How to ensure requirement completeness? | Traceability Matrix + Review Sessions |

### MoSCoW Prioritization

\`\`\`
Must have    — Cannot go live without it (60% of effort)
Should have  — Important but not essential (20%)
Could have   — Nice to have (15%)
Won't have   — Not doing this time (5%, recorded in Backlog)
\`\`\`
`;

export default world27_en;
