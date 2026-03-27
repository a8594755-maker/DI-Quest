const world37_en = `
# World 37: Domain Knowledge

> Technical skills determine whether you can do analysis; domain knowledge determines whether you can produce valuable analysis.
> Business Engineers need to understand different business domains to design truly useful systems.

Interviewers often say: "Technical skills can be learned, but Business Sense is hard to teach."
This chapter helps you build foundational knowledge across common business domains.

---

## 37-1: Operations & Supply Chain

### Supply Chain Basics

\`\`\`
Raw Materials → Manufacturing → Warehousing → Logistics → Retail → Consumer
  ↑                                                              │
  └────────────────── Reverse Logistics (Returns) ←──────────────┘
\`\`\`

### Key Supply Chain Metrics

| Metric | Formula / Description | Target |
|--------|----------------------|--------|
| Inventory Turnover | COGS / Average Inventory | Higher is better |
| Days of Inventory | 365 / Inventory Turnover | Lower is better |
| Fill Rate | Fulfilled Orders / Total Orders | > 95% |
| On-time Delivery | On-time Shipments / Total Shipments | > 98% |
| Order Cycle Time | Time from order placement to delivery | Shorter is better |
| Perfect Order Rate | Perfect Orders / Total Orders | > 90% |

### Inventory Management Models

\`\`\`
EOQ (Economic Order Quantity)
  Q* = √(2DS / H)
  D = Annual demand
  S = Ordering cost per order
  H = Holding cost per unit

Safety Stock = Z × σ × √L
  Z = Z-value for service level (95% → 1.65)
  σ = Demand standard deviation
  L = Lead Time
\`\`\`

### Common Operations Strategies

| Strategy | Description | Best For |
|----------|-------------|----------|
| MTS (Make-to-Stock) | Forecast-based production, maintain inventory | Standard products, stable demand |
| MTO (Make-to-Order) | Produce only when orders are received | Custom products, high-value items |
| JIT (Just-in-Time) | Procure only when needed | Limited space, many components |
| Drop Shipping | Hold no inventory, supplier ships directly | E-commerce, long-tail products |

### Supply Chain Digitization Trends

\`\`\`
Traditional: Excel for inventory → Manual ordering → Paper-based reconciliation
Digital:
  ✅ ERP systems for automatic inventory level management
  ✅ AI-driven demand forecasting (reducing bullwhip effect)
  ✅ IoT for real-time logistics tracking
  ✅ Blockchain for supply chain transparency
  ✅ RPA for automated procurement processes
\`\`\`

---

## 37-2: Finance Basics

### Three Major Financial Statements

| Statement | Question It Answers | Key Items |
|-----------|-------------------|-----------|
| Income Statement | How much did we earn? | Revenue, Costs, Profit |
| Balance Sheet | What do we own? | Assets, Liabilities, Equity |
| Cash Flow Statement | Where does money come from and go? | Operating / Investing / Financing Cash Flows |

### Income Statement Structure

\`\`\`
Revenue                               $10,000,000
- Cost of Goods Sold (COGS)           - $4,000,000
= Gross Profit                         $6,000,000   (Gross Margin 60%)
- Operating Expenses
  - Marketing                         - $1,500,000
  - R&D                               - $2,000,000
  - G&A                               - $1,000,000
= Operating Income                     $1,500,000   (Operating Margin 15%)
- Interest / Taxes                     - $500,000
= Net Income                           $1,000,000   (Net Margin 10%)
\`\`\`

### Common Financial Metrics

| Metric | Formula | Meaning |
|--------|---------|---------|
| Gross Margin | (Revenue - COGS) / Revenue | Product-level profitability |
| Operating Margin | Operating Income / Revenue | Core business profitability |
| Net Margin | Net Income / Revenue | Overall profitability |
| ROI | (Gain - Cost) / Cost | Return on Investment |
| ROE | Net Income / Shareholders' Equity | Return on Equity |
| Burn Rate | Monthly cash consumption | Startup survival metric |
| Runway | Cash / Burn Rate | Months of cash remaining |

### Departmental Budget Structure

\`\`\`
Annual Budget
├── Revenue Budget (Top-line)
│   ├── Product A: $5M (10% growth)
│   ├── Product B: $3M (5% growth)
│   └── New Product C: $2M
├── Cost Budget
│   ├── Personnel: $4.5M (60%)
│   ├── Marketing: $1.5M (20%)
│   ├── IT Infrastructure: $0.75M (10%)
│   └── Other: $0.75M (10%)
└── Capital Expenditure (CapEx)
    ├── New Office: $500K
    └── Equipment: $300K
\`\`\`

### Common Finance Interview Questions

\`\`\`
Q: A new feature requires $500K investment and is projected to add $200K annual revenue. Would you recommend it?

A: More information is needed to decide:
1. Payback period: $500K / $200K = 2.5 years
   → If product lifecycle > 3 years, it's acceptable
2. Opportunity cost: What return could this $500K generate elsewhere?
3. Are there non-financial benefits: Brand value, customer satisfaction?
4. Risk: How confident is the $200K projection?
5. Cash flow: Does the company have sufficient runway?
\`\`\`

---

## 37-3: CRM & Customer Management

### CRM Core Concepts

\`\`\`
CRM = Customer Relationship Management

Purpose: Manage customers through their full lifecycle from "awareness" to "loyalty"

Customer Lifecycle:
Awareness → Acquisition → Activation → Revenue → Retention → Referral
\`\`\`

### CRM System Core Modules

| Module | Function | Users |
|--------|----------|-------|
| Contact Management | Customer profiles, interaction records | Sales, Support |
| Pipeline Management | Sales stage tracking | Sales Team |
| Campaign Management | Marketing campaign tracking | Marketing Team |
| Service Management | Tickets, SLA tracking | Support Team |
| Reporting & Analytics | Sales forecasts, performance analysis | Management |

### Sales Pipeline

\`\`\`
Stage               Count   Value        Conversion
────────────────────────────────────────────────────
Lead (Prospect)      100    $5,000,000   100%
  ↓
Qualified             40    $2,000,000    40%
  ↓
Proposal              20    $1,000,000    50%
  ↓
Negotiation           10      $500,000    50%
  ↓
Closed Won             5      $250,000    50%

Overall Conversion: 5%
Average Deal Size: $50,000
\`\`\`

### Customer Segmentation Methods

\`\`\`
RFM Analysis:
  R (Recency): Time since last purchase
  F (Frequency): Purchase frequency
  M (Monetary): Purchase amount

Customer Segments:
┌──────────────┬──────┬──────┬──────┐
│ Segment      │ R    │ F    │ M    │
├──────────────┼──────┼──────┼──────┤
│ VIP          │ High │ High │ High │
│ Loyal        │ High │ High │ Low  │
│ Dormant      │ Low  │ High │ High │
│ At Risk      │ Low  │ Low  │ High │
│ New          │ High │ Low  │ Low  │
└──────────────┴──────┴──────┴──────┘
\`\`\`

### Customer Success Metrics

| Metric | Description | Good Benchmark |
|--------|-------------|---------------|
| NPS | Net Promoter Score (-100 to 100) | > 30 |
| CSAT | Customer Satisfaction Score | > 80% |
| CES | Customer Effort Score (lower is better) | < 3 |
| Churn Rate | Monthly churn rate | < 5% |
| LTV | Customer Lifetime Value | > 3x CAC |
| Time to Value | Time from sign-up to experiencing value | < 7 days |

---

## 37-4: ERP & Business Processes

### ERP Core Concepts

\`\`\`
ERP = Enterprise Resource Planning

Core Idea: One system to manage all core business processes
           Breaking down information silos between departments
\`\`\`

### ERP Core Modules

\`\`\`
┌────────────────────────────────┐
│           ERP System           │
├────────┬────────┬──────────────┤
│ Finance│   HR   │ Manufacturing│
│ GL/AP/AR│ Payroll│  BOM/MRP    │
│Cost Ctr│ Attend │ Work Orders  │
├────────┼────────┼──────────────┤
│Procure-│ Sales  │  Inventory   │
│  ment  │ SO/Quot│  In/Out Mgmt │
│Supplier│Customer│  Stocktaking │
└────────┴────────┴──────────────┘
\`\`\`

### Common ERP Systems Comparison

| System | Strengths | Best For | Price |
|--------|-----------|----------|-------|
| SAP S/4HANA | Most comprehensive, global standard | Large enterprises | $$$$ |
| Oracle ERP Cloud | Cloud-native, AI-driven | Mid-to-large enterprises | $$$ |
| Microsoft Dynamics 365 | Microsoft ecosystem integration | Mid-size enterprises | $$ |
| NetSuite | Cloud ERP pioneer | SMBs | $$ |
| Odoo | Open source, modular | Small businesses | $ |

### Core Business Processes

\`\`\`
Order-to-Cash (O2C): From order to payment receipt
  Customer Order → Check Inventory → Ship → Invoice → Collect Payment

Procure-to-Pay (P2P): From procurement to payment
  Requisition → Approval → Purchase Order → Receive → Inspect → Pay

Record-to-Report (R2R): From bookkeeping to reporting
  Journal Entry → Post → Adjust → Close → Generate Reports

Plan-to-Produce: From planning to production
  Demand Forecast → MRP Calculation → Production Scheduling → Manufacturing → QC
\`\`\`

### ERP Implementation Challenges

\`\`\`
Common Challenges:
1. Data migration: Inconsistent data formats from legacy systems
2. Process standardization: Different departments do things differently — who compromises?
3. User resistance: "We've always done it this way"
4. Customization vs Standardization: Too much customization → upgrade difficulties
5. Cost overruns: Typically exceeds budget by 50-100%
6. Schedule delays: Average 6-12 months late

Success Factors:
✅ Executive sponsorship
✅ Experienced implementation consultants
✅ Comprehensive training
✅ Phased rollout (avoid big bang approach)
✅ Clear Change Management plan
\`\`\`

---

## 37-5: Cross-Domain Integration

### System Integration Architecture

\`\`\`
┌──────┐   ┌──────┐   ┌──────┐
│ CRM  │   │ ERP  │   │  BI  │
└──┬───┘   └──┬───┘   └──┬───┘
   │          │          │
   └──────────┼──────────┘
              │
        ┌─────┴─────┐
        │Integration│ (API Gateway / ESB / iPaaS)
        │ Platform  │
        └─────┬─────┘
              │
   ┌──────────┼──────────┐
   │          │          │
┌──┴───┐ ┌───┴──┐ ┌────┴──┐
│E-comm│ │ POS  │ │Logist.│
└──────┘ └──────┘ └──────┘
\`\`\`

### Common Cross-Domain Integration Scenarios

| Integration Scenario | Systems Involved | Business Value |
|---------------------|-----------------|---------------|
| Customer 360-degree View | CRM + ERP + Support | Holistic customer understanding |
| Real-time Inventory Query | ERP + E-commerce + POS | Prevent overselling |
| Automated Reporting | ERP + BI + Data Warehouse | Decision support |
| Marketing Automation | CRM + Email + Social | Precision marketing |
| Supply Chain Visibility | ERP + Logistics + IoT | Real-time tracking |

### Data Integration Methods

\`\`\`
1. Batch Integration
   - Scheduled syncs (daily, hourly)
   - Suitable for reporting, non-real-time scenarios
   - ETL: Extract → Transform → Load

2. Real-time Integration
   - API real-time calls
   - Suitable for transactions, inventory, and other real-time scenarios
   - REST API / GraphQL

3. Event-driven Integration
   - Triggered when events occur
   - Suitable for notifications, workflows
   - Message Queue / Webhook
\`\`\`

### Cross-Department Communication Translation

\`\`\`
The same thing, different department terminology:

Sales: "Customer"
IT: "User"
Marketing: "Audience"
Support: "Case"

Sales: "I need to see a report"
IT: "Need a Dashboard"
Finance: "Month-end report"

→ The Business Engineer's value:
   Being the "translator" between different departments
   Communicating in language each department understands
\`\`\`

---

## 37-6: Domain Analysis Practice

### Case: Digital Transformation for a Retail Business

\`\`\`
Background:
A traditional supermarket chain (50 stores) wants to undergo digital transformation.
Currently everything is managed with Excel, no systems in place.
Annual revenue $50M, profit margin 5% ($2.5M).
The CEO wants digital transformation to improve profit margin by 2%.
\`\`\`

### Analysis Framework

\`\`\`
Step 1: Understand Business Processes
  Procurement → Receiving → Shelving → Sales → Checkout → Inventory Management

Step 2: Identify Pain Points
  ┌──────────────┬──────────────────┬──────────────────┐
  │ Process      │ Pain Point       │ Impact           │
  ├──────────────┼──────────────────┼──────────────────┤
  │ Procurement  │ Orders by instinct│ Over/under stock │
  │ Inventory    │ Manual counting  │ Inaccurate data  │
  │ Sales Anlys  │ No POS data      │ Don't know bestsellers│
  │ Membership   │ Paper cards      │ No precision mktg│
  │ Multi-store  │ Separate reports │ Can't compare    │
  └──────────────┴──────────────────┴──────────────────┘

Step 3: Recommended Plan
  Phase 1 (0-6 months): POS + Basic ERP
    - Deploy POS system → Establish sales data foundation
    - Deploy basic ERP → Unified inventory management
    - Investment: $500K, Expected benefit: 30% reduction in inventory waste

  Phase 2 (6-12 months): CRM + Membership System
    - Digital membership + Marketing automation
    - Investment: $300K, Expected benefit: 15% increase in member purchase frequency

  Phase 3 (12-18 months): BI + Advanced Analytics
    - Sales forecasting + Automated replenishment recommendations
    - Investment: $200K, Expected benefit: 50% reduction in stockout rate

Step 4: ROI Calculation
  Inventory waste reduction: $50M × 2% × 30% = $300K
  Member revenue growth: $50M × 20% (member share) × 15% = $1.5M
  Operational efficiency: 50 stores × $10K/year = $500K
  Total benefit: $2.3M / year
  Investment: $1M
  ROI: 130%
\`\`\`

### Interview Verbal Response Example

\`\`\`
"The core problem for this supermarket is the lack of a data foundation.
 I would recommend a three-phase digital transformation:

 First, deploy POS and ERP to establish the data foundation —
 this is a prerequisite for all subsequent analysis.

 Second, implement CRM for membership management,
 because in retail, 20% of loyal customers typically contribute 80% of revenue.

 Third, add BI for advanced analytics,
 such as sales forecasting and automated replenishment.

 Total investment is approximately $1M, with estimated annual benefits of $2.3M,
 achieving payback within the first year."
\`\`\`

---

## Key Takeaways - World 37 Cheat Sheet

### Domain Knowledge Quick Reference

\`\`\`
Supply Chain:
  Raw Materials → Manufacturing → Warehousing → Logistics → Sales
  Key Metrics: Inventory Turnover, Fill Rate, On-time Delivery
  Strategies: MTS / MTO / JIT / Drop Shipping

Three Financial Statements:
  Income Statement → How much we earned
  Balance Sheet → What we own
  Cash Flow Statement → Where money flows
  Key Metrics: Gross Margin, Operating Margin, ROI, Burn Rate

CRM:
  Customer lifecycle management
  Sales Pipeline (Lead → Qualified → Proposal → Close)
  Customer Segmentation: RFM Analysis
  Metrics: NPS, CSAT, LTV, Churn Rate

ERP:
  One system managing all processes
  Core Processes: O2C, P2P, R2R
  Implementation Challenges: Data migration, Process standardization, User resistance
  Common Systems: SAP, Oracle, Dynamics 365

Cross-Domain Integration:
  API / ESB / iPaaS
  Integration Methods: Batch / Real-time / Event-driven
  Business Engineer = Translator between departments
\`\`\`

### Interview Domain Question Framework

\`\`\`
1. Understand business processes (map the flow)
2. Identify pain points (compare efficiency/cost/quality)
3. Recommend solutions (phased approach, quantify benefits)
4. Calculate ROI (investment vs return)
\`\`\`
`;

export default world37_en;
