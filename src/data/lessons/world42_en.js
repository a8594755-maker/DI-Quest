const world42_en = `
# World 42: Business Systems

> Business systems are the backbone of organizational operations. ERP, CRM, and Workflow systems determine how companies manage resources, serve customers, and automate processes.
> As a BA, you need to understand these systems' architecture, selection logic, and how to drive successful adoption.

Common interview questions: "What enterprise systems have you worked with?" "How do you evaluate system selection?" "What's the biggest challenge when implementing a new system?"
This chapter gives you systematic mastery of core business systems knowledge.

---

## 42-1: ERP Concepts and Modules

### What is ERP?

ERP (Enterprise Resource Planning) is a platform that integrates core business processes across the enterprise.

\`\`\`
ERP Core Concepts:
Single Source of Truth -- Unified data source
Cross-functional Integration -- Cross-department integration
Real-time Visibility -- Instant operational visibility
Process Standardization -- Standardized workflows
\`\`\`

### Core ERP Modules

| Module | Function | Key Metrics |
|--------|----------|-------------|
| Finance (FI) | General ledger, accounts receivable/payable | DSO, DPO, Cash Cycle |
| Controlling (CO) | Cost center, profit center analysis | Cost Variance, Margin |
| Sales & Distribution (SD) | Order management, pricing, shipping | Order-to-Cash Cycle |
| Materials Management (MM) | Procurement, inventory, MRP | Inventory Turnover |
| Production Planning (PP) | Production scheduling, BOM, capacity | OEE, Throughput |
| Human Capital (HCM) | Payroll, attendance, performance | Headcount, Turnover Rate |

### Common ERP Platform Comparison

| Platform | Target Size | Deployment | Strengths |
|----------|-------------|-----------|-----------|
| SAP S/4HANA | Enterprise | Cloud / On-Premise | Most complete modules, rich industry solutions |
| Oracle Fusion | Enterprise | Cloud | Strong database integration, built-in AI |
| Microsoft Dynamics 365 | Mid-Large | Cloud | Deep Office 365 integration |
| NetSuite | SMB | Cloud-native | Fast implementation, SaaS subscription |
| Odoo | Small / Startup | Cloud / Self-hosted | Open source, modular, low cost |

### ERP Implementation Methodologies

\`\`\`
Big Bang -- Full go-live at once
  Pros: One-step completion, data consistency
  Risks: High risk, entire company affected

Phased Rollout -- Go-live in stages
  Pros: Distributed risk, gradual learning
  Cons: Transition period requires maintaining two systems

Parallel Run -- Run old and new systems simultaneously
  Pros: Fallback available, verifiable
  Cons: Double workload, high cost
\`\`\`

### Interview Focus

> "How would you decide on an ERP implementation strategy?"

Answer Framework:
1. Assess company size and risk tolerance
2. Consider data migration complexity
3. Analyze user readiness (Change Readiness)
4. Recommend strategy with justification

---

## 42-2: CRM System Design

### Three Types of CRM

\`\`\`
Operational CRM -- Automates sales, marketing, and service processes
  -> Salesforce Sales Cloud, HubSpot

Analytical CRM -- Analyzes customer data for behavioral insights
  -> Salesforce Einstein, Power BI integration

Collaborative CRM -- Cross-department customer information sharing
  -> Slack + CRM integration, shared Customer 360 view
\`\`\`

### Core CRM Modules

| Module | Function | BA Focus |
|--------|----------|----------|
| Lead Management | Lead tracking and scoring | Lead Scoring Model design |
| Opportunity Management | Sales pipeline, forecasting | Pipeline Stages definition |
| Contact Management | Customer 360 view | Data integration, dedup logic |
| Campaign Management | Marketing campaign management | ROI tracking, A/B testing |
| Service Management | Service tickets, SLA | Escalation Rules design |
| Analytics & Reporting | Dashboards, predictive analytics | KPI definition, Dashboard design |

### CRM Pipeline Design

\`\`\`
B2B Sales Pipeline Example:

Stage 1: Lead
  -> Entry criteria: Form submission / Event attendance
  -> Conversion benchmark: 30%

Stage 2: Qualified
  -> Entry criteria: BANT confirmed (Budget/Authority/Need/Timeline)
  -> Conversion benchmark: 50%

Stage 3: Proposal
  -> Entry criteria: Quote/proposal submitted
  -> Conversion benchmark: 60%

Stage 4: Negotiation
  -> Entry criteria: Customer response / pricing discussion
  -> Conversion benchmark: 70%

Stage 5: Closed Won / Closed Lost
  -> Win Rate target: 20-30%
\`\`\`

### Salesforce Object Model (BA Must-Know)

\`\`\`
Account (Company)
  +-- Contact (Person)
  +-- Opportunity (Deal)
        +-- Quote
        +-- Product
  +-- Case (Service Ticket)
  +-- Activity (Activity Log)
\`\`\`

### Practice Question

> "How would you design a CRM system for a B2B SaaS company?"

Thinking Framework:
1. Sales process analysis (Pipeline Stages)
2. Customer segmentation (Customer Segmentation)
3. Data integration needs (Marketing + Sales + CS)
4. Automation rules (Lead Assignment, Alerts)
5. Success metrics (Win Rate, CAC, LTV)

---

## 42-3: Workflow & Approval Systems

### Core Workflow Concepts

\`\`\`
Workflow Engine -- Four Elements:

1. Trigger (Activation Condition)
   -> Event-driven: Form submission, status change
   -> Time-driven: Daily schedule, deadline reminder

2. Condition (Decision Logic)
   -> IF-THEN rules, Business Rules
   -> Amount thresholds, role permissions

3. Action (Execution)
   -> Notification, assignment, field update
   -> API call, trigger sub-process

4. Routing (Flow Path)
   -> Sequential (one after another)
   -> Parallel (simultaneous)
   -> Conditional (branching)
\`\`\`

### Common Approval Flow Designs

| Type | Description | Use Case |
|------|------------|----------|
| Linear | A -> B -> C sequential | Simple expense claims, leave requests |
| Parallel | A + B approve simultaneously | Cross-department budget approval |
| Conditional | Different routes by amount/category | Procurement: <$5K manager / >$5K VP |
| Hierarchical | Escalation through org levels | Large enterprise multi-tier approval |
| Round-Robin | Rotating assignment | Support ticket distribution |

### Purchase Approval Flow Design Example

\`\`\`
Purchase Request Approval Flow:

[Requester Submits]
    |
[System Checks Amount]
    +-- < $1,000 -> [Direct Manager] -> [Auto-approve PO]
    +-- $1,000 - $10,000 -> [Direct Manager] -> [Dept Head] -> [Procurement]
    +-- > $10,000 -> [Direct Manager] -> [Dept Head] -> [CFO] -> [Procurement]

Each approval level:
- 48 hours no action -> Auto escalation
- Rejected -> Return to requester for revision
- Approved -> Next level / Generate PO
\`\`\`

### Workflow Platform Comparison

| Platform | Type | Use Case |
|----------|------|----------|
| ServiceNow | Enterprise ITSM | IT service management, enterprise processes |
| Jira + Automation | Dev Teams | Agile workflow, DevOps |
| Power Automate | Microsoft Ecosystem | Office 365 automation |
| Zapier / Make | No-code | Cross-SaaS integration, small teams |
| Camunda / Temporal | Developer Platform | Complex business processes, microservice orchestration |

### Interview Focus

> "Design a leave request approval workflow, considering various edge cases."

Edge cases to consider:
- Manager unavailable (delegate mechanism)
- Cross-year holidays (quota calculation)
- Emergency leave (retroactive approval)
- Consecutive leave > 5 days (requires higher-level approval)

---

## 42-4: Internal Tools Design

### Design Principles for Internal Tools

\`\`\`
Internal Tools Design Thinking:

1. Efficiency First
   -> Minimize clicks, auto-fill fields
   -> Keyboard shortcuts, Batch operations

2. Context-Rich
   -> Show related information on the same screen
   -> Minimize page navigation

3. Error-Proof
   -> Input validation, confirmation dialogs
   -> Undo / Rollback mechanisms

4. Role-Based
   -> Different roles see different features
   -> Permission control + Audit Trail
\`\`\`

### Admin Panel Feature Planning

| Feature Area | Core Functions | BA Focus |
|-------------|---------------|----------|
| User Management | CRUD, role assignment, permissions | RBAC vs ABAC model |
| Content Management | Product/article CRUD, scheduled publishing | Workflow (Draft -> Review -> Publish) |
| Order Management | Search, filter, status update, refunds | State machine design, operation logs |
| Analytics Dashboard | Real-time metrics, trend charts, Alerts | KPI definition, refresh frequency |
| Configuration | Feature Flags, system parameters | Change management, impact scope |
| Audit & Compliance | Operation logs, data export | Retention policy, privacy compliance |

### Build vs Buy Decision Framework

\`\`\`
Build vs Buy Evaluation Matrix:

                    Low Differentiation   High Differentiation
                +---------------------+---------------------+
  High          |   Buy + Customize   |      Build          |
  Complexity    |   (ERP, CRM)        | (Core Competency)   |
                +---------------------+---------------------+
  Low           |   Buy (SaaS)        |   Low-code /        |
  Complexity    |   (HR, Accounting)  |   No-code           |
                +---------------------+---------------------+

Decision Questions:
1. Is it a core competency? -> Yes = Build
2. Are there mature market solutions? -> Yes = Buy
3. Customization needs > 30%? -> Yes = Build
4. Does the team have capacity to maintain? -> No = Buy
\`\`\`

### Internal Tools Technology Trends

| Trend | Description | Representative Tools |
|-------|-------------|---------------------|
| Low-code / No-code | Non-engineers can build apps | Retool, Appsmith, Budibase |
| API-first | Frontend-backend separation, integrable | Headless CMS, Microservices |
| AI-assisted | Natural language queries, auto-classification | Copilot, ChatGPT integration |
| Composable | Modular composition, replaceable | Micro-frontends, Plugin architecture |

### Practice Question

> "The customer service team needs an internal tool for handling refunds. How would you design it?"

Answer Framework:
1. User roles and workflow (CS Agent -> Manager -> Finance)
2. Core features (Search order, request refund, approval, execution)
3. Data integration (Order system, payment system, CRM)
4. Error-proofing (Amount limits, duplicate refund checks)
5. Reporting (Refund trends, processing time)

---

## 42-5: System Adoption & Change Management

### Why Do System Implementations Often Fail?

\`\`\`
System Implementation Failure Reasons:

#1 User Resistance to Change              -- 39%
#2 Lack of Executive Support              -- 33%
#3 Unclear Requirements                   -- 31%
#4 Insufficient Training                  -- 29%
#5 Data Migration Issues                  -- 25%
#6 Underestimated Complexity              -- 23%
\`\`\`

### ADKAR Change Management Model

\`\`\`
A -- Awareness
  -> Why change? What is the current problem?
  -> Methods: Town Hall, Email announcements, FAQ

D -- Desire
  -> Why should I support this change? WIIFM?
  -> Methods: Champion Network, incentive programs

K -- Knowledge
  -> How do I use the new system?
  -> Methods: Training courses, user manuals, video tutorials

A -- Ability
  -> Can I use it in my actual work?
  -> Methods: Sandbox practice, Buddy System, Office Hours

R -- Reinforcement
  -> How do we ensure people don't revert to old ways?
  -> Methods: KPI tracking, Success Stories, decommission old system
\`\`\`

### System Rollout Strategies

| Strategy | Approach | Best For |
|----------|----------|----------|
| Pilot | Trial in one department/location first | High-risk, large-scale implementations |
| Phased | Go-live by module/region in batches | Multi-module ERP, global deployments |
| Big Bang | Full simultaneous switch | Small teams, urgent needs |
| Feature Flag | Gradually enable features | SaaS, online products |

### Training Plan Design

\`\`\`
Training Plan Framework:

1. Tiered Training
   +-- Level 1: Basic operations (All users) -- 2 hours
   +-- Level 2: Advanced features (Power Users) -- 4 hours
   +-- Level 3: Manager reporting (Managers) -- 2 hours

2. Multiple Channels
   +-- Instructor-led training
   +-- Self-paced online videos
   +-- Quick Reference Cards
   +-- Sandbox environment (free practice)

3. Support Mechanisms
   +-- Super Users / Champions (1-2 per department)
   +-- Help Desk (enhanced for first 3 months)
   +-- Office Hours (weekly Q&A sessions)
\`\`\`

### Adoption Measurement Metrics

| Metric | Definition | Target |
|--------|-----------|--------|
| Login Rate | Percentage of account holders who actually log in | > 90% (Month 3) |
| Feature Usage | Usage rate of core features | > 70% |
| Process Compliance | Percentage following the new process | > 85% |
| Support Tickets | System-related support requests | Decreasing monthly |
| User Satisfaction | Satisfaction survey score | > 4.0/5.0 |

### Interview Focus

> "How do you handle user resistance when implementing a new system?"

Answer Framework (ADKAR):
1. **Awareness** -- Help users understand the reason for change
2. **Desire** -- Find WIIFM, establish Champions
3. **Knowledge** -- Provide sufficient training
4. **Ability** -- Offer practice and support
5. **Reinforcement** -- Track, reward, reinforce

---

## 42-6: System Selection Case (Boss)

### Complete System Selection Process

\`\`\`
System Selection Lifecycle:

Phase 1: Define Requirements
  -> Business Requirements Document
  -> Functional / Non-Functional Requirements
  -> Must-have vs Nice-to-have

Phase 2: Market Research
  -> Gartner Magic Quadrant / G2 Reviews
  -> Vendor Shortlist (3-5 candidates)
  -> Initial Screening

Phase 3: RFP / RFI
  -> Request for Information (initial understanding)
  -> Request for Proposal (formal bid invitation)
  -> Scoring Criteria

Phase 4: Vendor Evaluation
  -> Product Demo (live demonstration)
  -> Proof of Concept (small-scale trial)
  -> Reference Check (interview existing customers)

Phase 5: Decision & Negotiation
  -> Total Cost of Ownership (TCO) Analysis
  -> Contract Negotiation
  -> Implementation Plan
\`\`\`

### System Selection Scoring Matrix

\`\`\`
Vendor Scoring Matrix:

Evaluation Dimension  Weight  Vendor A  Vendor B  Vendor C
------------------------------------------------------------
Feature Completeness   30%      8         7         9
Usability              15%      9         6         7
Integration Capability 15%      7         9         8
Scalability            10%      6         8         9
Vendor Stability       10%      9         7         8
TCO (3 years)          15%      7         8         6
Implementation Time     5%      8         7         7
------------------------------------------------------------
Weighted Total        100%     7.8       7.4       7.8
\`\`\`

### TCO (Total Cost of Ownership) Analysis

| Cost Item | One-time Cost | Annual Cost | 3-Year TCO |
|-----------|--------------|-------------|-----------|
| License Fees | $50K | $20K/yr | $110K |
| Implementation Consulting | $80K | -- | $80K |
| Custom Development | $30K | $10K/yr | $60K |
| Data Migration | $20K | -- | $20K |
| Training | $15K | $5K/yr | $30K |
| Operations Staff | -- | $40K/yr | $120K |
| **Total** | **$195K** | **$75K/yr** | **$420K** |

### RFP Core Sections

\`\`\`
RFP Structure:

1. Company Overview
2. Project Background
3. Scope of Work
4. Functional Requirements
5. Non-Functional Requirements
6. Integration Requirements
7. Data Migration Requirements
8. Timeline
9. Pricing Structure
10. Evaluation Criteria
11. Terms & Conditions
\`\`\`

### Ultimate Interview Challenge

> "Your company wants to switch from managing everything in Excel to a proper system. Walk through your end-to-end approach."

End-to-End Answer Framework:
1. Current state analysis (Pain Points, quantify problems)
2. Requirements definition (Stakeholder interviews, FR/NFR)
3. Build vs Buy decision
4. Vendor evaluation (Scoring Matrix)
5. TCO analysis
6. Implementation strategy (Pilot -> Rollout)
7. Change Management (ADKAR)
8. Success Metrics

---

## Cheat Sheet: Business Systems Quick Reference

### System Type Quick Reference

| System | Core Purpose | Primary Users | Key Products |
|--------|-------------|--------------|-------------|
| ERP | Integrate internal operations | Finance, Supply Chain, HR | SAP, Oracle, Dynamics |
| CRM | Manage customer relationships | Sales, Marketing, Service | Salesforce, HubSpot |
| WMS | Warehouse management | Warehouse, Logistics | Manhattan, Blue Yonder |
| ITSM | IT service management | IT Teams | ServiceNow, Jira SM |
| HRM | Human resource management | HR, Employees | Workday, BambooHR |

### High-Frequency Interview Questions Quick Answers

| Question | Key Answer Points |
|----------|------------------|
| What is ERP? | Single platform integrating core processes, Single Source of Truth |
| CRM design focus? | Pipeline Design, Customer 360, Automation Rules |
| Workflow design? | Trigger-Condition-Action-Routing four elements |
| Build vs Buy? | Core competency -> Build / Common needs -> Buy / Customization < 30% -> Buy |
| User resistance? | ADKAR: Awareness -> Desire -> Knowledge -> Ability -> Reinforcement |
| System selection? | Requirements -> RFP -> Vendor Evaluation -> TCO -> Decision |

### Key Framework Quick Reference

\`\`\`
ERP Implementation: Big Bang / Phased / Parallel
CRM Pipeline: Lead -> Qualified -> Proposal -> Negotiation -> Closed
Workflow: Trigger -> Condition -> Action -> Routing
Build vs Buy: Differentiation x Complexity Matrix
Change Management: ADKAR (Awareness-Desire-Knowledge-Ability-Reinforcement)
System Selection: Requirements -> RFP -> Evaluation -> TCO -> Decision
\`\`\`
`;

export default world42_en;
