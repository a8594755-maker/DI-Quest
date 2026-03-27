const world58_en = `
# World 58: ERP & System Processes

> **Goal:** Understand how enterprise systems such as ERP, WMS, TMS, and MRP support supply chain operations
> **Applicable Scenarios:** Business IT, ERP implementation, system process interviews
> **Estimated Study Time:** 4–5 hours

---

## 58-1: ERP Fundamentals & Modules

### What is ERP?

The core idea of **ERP (Enterprise Resource Planning)** is "one database, many modules." All departments operate on the same system, with data synchronized in real time.

**Core Value = Single Source of Truth**

| Module | Abbreviation | Function |
|--------|--------------|----------|
| Financial Accounting | FI | General ledger, accounts receivable/payable |
| Controlling | CO | Cost centers, profit centers |
| Materials Management | MM | Procurement, inventory management |
| Sales & Distribution | SD | Orders, shipping, invoicing |
| Production Planning | PP | Production planning, MRP |
| Warehouse Management | WM | Warehouse operations management |

> **Leading ERP Systems:** SAP S/4HANA (preferred for large enterprises), Oracle ERP Cloud, Microsoft Dynamics 365, NetSuite (for SMEs)

### Master Data

Master Data is the foundation of ERP. **GIGO — Garbage In, Garbage Out.**

| Type | Content | Impact |
|------|---------|--------|
| **Material Master** | Item number, description, unit of measure, storage location | All inventory and procurement transactions |
| **Customer Master** | Name, address, payment terms | All sales orders |
| **Vendor Master** | Supplier information, purchasing conditions | All purchase orders |
| **BOM** | Bill of materials for a product | MRP calculation |
| **Routing** | Production steps and labor time | Production scheduling and costing |

> **Statistic:** 60% of ERP implementation issues stem from poor Master Data quality. Data Governance is an ongoing, long-term effort.

### MRP (Material Requirements Planning)

MRP is the core planning engine for manufacturing.

**MRP Logic:**
\`\`\`
1. MPS (Master Production Schedule) determines what to produce
2. BOM Explosion breaks down material requirements (gross requirements)
3. Deduct on-hand inventory and in-transit quantities (net requirements)
4. Back-calculate order timing based on Lead Time (planned orders)
\`\`\`

**Formula:** Net Requirements = Gross Requirements − On-Hand Inventory − In-Transit Quantity

> **Key Point:** MRP doesn't just calculate "how much to buy" — it also calculates "when to place the order" by back-scheduling from the Lead Time.

---

## 58-2: The Supply Chain Systems Ecosystem

### System Architecture

\`\`\`
ERP (Core Backbone)
├── WMS (Warehouse Management System) — storage locations, picking, inventory tracking
├── TMS (Transportation Management System) — route planning, carriers, freight costs
├── MES (Manufacturing Execution System) — real-time production monitoring
└── SCP (Supply Chain Planning) — demand planning, supply planning
\`\`\`

| System | Manages | Leading Products |
|--------|---------|-----------------|
| **WMS** | Internal warehouse operations | Manhattan, Blue Yonder, SAP EWM |
| **TMS** | Transportation outside the warehouse | Oracle TMS, SAP TM, project44 |
| **MES** | Factory production execution | Siemens, Rockwell |

### Order-to-Cash (O2C)

The end-to-end process on the sales side:

\`\`\`
Sales Order → Credit Check → Pick/Pack/Ship → Invoice → Payment
\`\`\`

**Key Control Points:**
- **Credit Check:** Insufficient credit limit → Credit Block → Manual approval required
- **ATP Check:** Available-to-Promise commitment
- **Three-Way Match:** Cross-checking PO + Receipt + Invoice

> In SAP: VA01 (create order) → VL01N (outbound delivery) → VF01 (billing) → F-28 (payment receipt)

### Keys to a Successful ERP Implementation

**The Three-P Rule: People > Process > Platform**

| Factor | Importance | Common Issues |
|--------|------------|---------------|
| **People** | Highest | User resistance, insufficient training |
| **Process** | High | Processes not redesigned |
| **Platform** | Medium | Excessive customization |

> **Statistic:** 70% of ERP implementation failures are caused by inadequate Change Management — it's not a technology problem, it's a people problem.

**Best Practices:**
1. Thorough user training (teach both the "how" and the "why")
2. Key User program (seed users in each department)
3. Management sponsorship and leading by example
4. Fast response to user issues
5. Regular Health Checks and continuous improvement

> SAP adage: "SAP is not an IT project, it's a business transformation."
`

export default world58_en
