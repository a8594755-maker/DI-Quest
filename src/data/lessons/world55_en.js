const world55_en = `
# World 55: Demand Forecasting & Inventory Management

> **Objective:** Learn to forecast demand, calculate safety stock, and master inventory decision models such as EOQ
> **Applicable scenarios:** Demand Planning, Inventory Management, supply chain analytics interviews
> **Estimated study time:** 4–5 hours

---

## 55-1: Demand Forecasting Fundamentals

### Forecasting Method Categories

| Category | Approach | When to Use | Representative Methods |
|----------|----------|-------------|------------------------|
| **Quantitative** | Based on historical data | Mature products, stable demand | Moving Average, Exponential Smoothing, ARIMA |
| **Qualitative** | Based on human judgment | New products, limited historical data | Expert Opinion, Delphi Method, Market Research |
| **Causal** | Based on cause-and-effect relationships | Demand driven by external factors | Regression Analysis |

> **Selection principle:** Historical data available → Quantitative; No data → Qualitative; Combining both = Consensus Forecasting (best practice)

### Simple Moving Average (SMA)

SMA(N) = Average of the most recent N periods of data

- **Large N** → More stable but more lagged (suitable for stable demand)
- **Small N** → More sensitive but more volatile (suitable for variable demand)

> **Advanced versions:** Weighted Moving Average (higher weight on recent periods) → Exponential Smoothing (automatically adjusts weights via the α parameter)

### Forecast Accuracy Metrics

| Metric | Formula | Purpose |
|--------|---------|---------|
| **MAE** | Σ\|Forecast − Actual\| / n | Average absolute error, intuitive |
| **MAPE** | Σ(\|Forecast − Actual\| / Actual) / n × 100% | Percentage error, comparable across SKUs |
| **Bias** | Σ(Forecast − Actual) / n | Shows error direction (positive = overforecast, negative = underforecast) |

> 🆕 **2025 Trend:** Forecast Value Added (FVA) — measures whether each forecasting adjustment step actually improves accuracy. AI Demand Sensing combines POS data, social signals, weather, and other external inputs for short-term forecasting.

---

## 55-2: Inventory Control Models

### Safety Stock

**Why do we need Safety Stock?** Because both demand and lead times fluctuate. Stocking only "average demand × average lead time" means a stockout the moment demand spikes or a delivery is delayed.

**Formula concept:**
\`\`\`
Safety Stock = Z × σd × √LT

Z = Z-score corresponding to the desired service level (90% → 1.28, 95% → 1.65, 99% → 2.33)
σd = Standard deviation of demand
LT = Lead Time
\`\`\`

**Reorder Point (ROP):**
\`\`\`
ROP = (Average Daily Demand × Lead Time) + Safety Stock
\`\`\`

### EOQ (Economic Order Quantity)

**Core question:** How much should you order each time? Order too much → high holding cost; order too little → high ordering cost.

**Formula:**
\`\`\`
EOQ = √(2DS/H)

D = Annual demand
S = Cost per order (fixed costs of placing, receiving, and stocking the order)
H = Annual holding cost per unit
\`\`\`

> At the EOQ point, Ordering Cost = Holding Cost, and total cost is minimized.

### ABC-XYZ Analysis

**ABC (classified by value):**
- Class A: Top 20% of SKUs, accounting for 80% of revenue (tight control)
- Class B: Middle 30%, accounting for 15% of revenue (moderate control)
- Class C: Bottom 50%, accounting for 5% of revenue (simplified management)

**XYZ (classified by demand variability):**
- X: Stable demand (CV < 0.5)
- Y: Moderate variability (0.5 < CV < 1.0)
- Z: Highly variable demand (CV > 1.0)

> **Combined strategy:** AX = high-value, stable → precise forecasting, JIT. CZ = low-value, highly variable → higher safety stock or shift to make-to-order.

---

## 55-3: Inventory Strategy & Trade-offs

### Inventory Turnover

\`\`\`
Inventory Turnover = COGS / Average Inventory
Days of Inventory (DOI) = 365 / Turnover
\`\`\`

- High turnover = efficient use of capital, lower warehousing costs
- Low turnover = possible slow-moving items or overstocking
- **Note:** Cross-industry comparisons are not meaningful (grocery stores Turnover 10+ vs. furniture stores 2–3)

### Newsvendor Model

Addresses "one-shot" inventory decisions (e.g., seasonal products):

\`\`\`
Critical Ratio = Cu / (Cu + Co)

Cu = Underage Cost = lost profit + lost customers
Co = Overage Cost = markdown losses + disposal costs
\`\`\`

**Decision rule:** Stock up to the quantity where the cumulative probability of demand ≥ Critical Ratio.

> **If stockout cost > overage cost → lean toward stocking more; otherwise lean toward stocking less.**

### Inventory Improvement Priorities

1. **Fix root causes first** — Update safety stock parameters (many companies haven't revisited these in years)
2. **Rescue Class A items** — Stockouts on high-value SKUs have the greatest revenue impact
3. **Clear dead stock** — Free up warehouse space and working capital
4. **Optimize strategy** — Differentiated management using ABC-XYZ
`

export default world55_en
