const world57_en = `
# World 57: Logistics & Warehousing

> **Objectives:** Transportation mode selection, warehouse operations, last-mile delivery, and warehouse automation
> **Applicable scenarios:** Logistics, Warehouse Management, logistics interviews
> **Estimated study time:** 4–5 hours

---

## 57-1: Transportation Modes & Logistics

### The Four Major Transportation Modes

| Mode | Speed | Cost | Best For | Key Characteristics |
|------|-------|------|----------|---------------------|
| **Air** | Fastest | Most expensive | High-value urgent shipments, lightweight goods | High value-to-weight ratio cargo |
| **Ocean** | Slowest | Cheapest | Bulk goods, non-urgent shipments | Backbone of international trade |
| **Rail** | Medium | Medium | Bulk goods, medium-to-long distances | High efficiency for overland transport |
| **Road** | Flexible | Medium | Door-to-door, short-to-medium distances | Essential for last-mile delivery |

> **Intermodal:** Combines the advantages of multiple transportation modes, e.g., ocean + rail + road.

### Incoterms (International Commercial Terms)

Define the risk and cost transfer points between buyer and seller:

| Term | Risk Transfer Point | Seller Responsible Up To |
|------|---------------------|--------------------------|
| **EXW** | Factory/Ex-works | Minimum (buyer handles almost everything) |
| **FOB** | Loaded on vessel | Export customs clearance + loading onto ship |
| **CIF** | Destination port | Export customs clearance + ocean freight + insurance |
| **DDP** | Buyer's door | Maximum (seller handles everything) |

> **Practical guidance:** If you have a strong international freight forwarder → FOB may be more cost-effective. If unfamiliar with the exporting country's logistics → CIF lets the supplier handle it.

### Core Logistics KPIs

| KPI | Definition | Target Example |
|-----|------------|----------------|
| **OTIF** | On-Time In-Full delivery | ≥ 95–98% |
| **Order Accuracy** | Percentage of orders fulfilled correctly | ≥ 99% |
| **Freight Cost/Unit** | Shipping cost per unit | Continuously decreasing |
| **Damage Rate** | Rate of goods damaged in transit | < 0.5% |

> **OTIF is the king of logistics —** "Delivering the right things on time and in full" is the core mission of logistics. Major retailers like Walmart require 98% OTIF and impose direct penalties for falling short.

---

## 57-2: Warehouse Operations & Automation

### The Five Core Warehouse Processes

\`\`\`
Receiving → Put-away → Picking → Packing → Shipping
\`\`\`

**Picking accounts for 55% of warehouse labor costs**, primarily because of travel distance (which takes up 60% of picking time).

### Picking Strategies

| Strategy | Approach | Best For |
|----------|----------|----------|
| **Discrete** | Complete one order fully before starting the next | Few orders, many SKUs per order |
| **Batch** | Consolidate multiple orders and pick simultaneously | Many orders with high SKU overlap |
| **Zone** | Divide warehouse into zones, each with dedicated staff | Large warehouses |
| **Wave** | Process orders in scheduled time-window batches | Operations with fixed delivery windows |
| **Goods-to-Person** | Shelves are brought to the picker | AMR-automated warehouses |

### 2026 Warehouse Automation Trends

1. **AMR (Autonomous Mobile Robots)** — Fastest-growing segment; requires no warehouse retrofit and scales flexibly
2. **Goods-to-Person** — Replaces traditional Person-to-Goods workflows, eliminating walking time
3. **Cobots (Collaborative Robots)** — Work side-by-side with human workers
4. **AI Vision Recognition** — Improves sorting accuracy

> The global warehouse automation market is projected to reach **$90.7 billion by 2034** (CAGR of 15.1%). Key drivers: labor shortages + e-commerce growth + next-day delivery expectations.

### Last-Mile Delivery

**Last-mile delivery accounts for 53% of logistics costs** (Capgemini research) and is the single largest cost challenge.

**Three Key Strategies:**
1. **Micro-Fulfillment Center / Dark Store** — Small warehouses located close to consumers
2. **AI Route Optimization** — Optimizes delivery sequences to reduce empty runs
3. **Self-pickup Points / Smart Lockers** — Solves the "no one home" problem (failed delivery rate drops from 12% to near 0%)

---

## 57-3: Logistics in Practice & OTIF

### OTIF Calculation

\`\`\`
OTIF = Number of orders that are both on-time AND in-full / Total number of orders
\`\`\`

> **Note:** On-time but short-shipped ≠ meets standard. In-full but late ≠ meets standard. Both conditions must be satisfied **simultaneously**.

### Reverse Logistics

The cost of processing returns is **2–3× higher** than forward logistics.

**Best strategy: Prevention > Remediation**
- 40% of returns due to wrong size → AI size recommendation
- 25% due to product appearance mismatch → 360° product photography, AR try-on
- 20% due to damaged goods → Improved packaging
- 15% due to change of mind → Difficult to prevent

> 65% of returns can be prevented at the source (by improving product information).

### Logistics Network Optimization

Key decision factors:
1. Customer distribution and lead-time requirements
2. Warehouse location costs (land, labor, taxes)
3. Transportation costs and coverage area
4. Service level requirements

> **Tool:** Center of Gravity Model to find the optimal warehouse location. New market strategy: start with a 3PL to test the market → validate demand → then build in-house infrastructure.
`

export default world57_en
