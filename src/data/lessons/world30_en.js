const world30_en = `
# World 30: Excel Data Analysis

> Excel is the most commonly used tool for BAs, and it is frequently tested in interviews. You don't need to master VBA, but you should be able to quickly produce insightful analyses.

This chapter focuses on the most practical Excel skills for interviews and daily work, from formulas to Pivot Tables to Scenario Analysis.

---

## 30-1: VLOOKUP / INDEX-MATCH

### VLOOKUP Basics

\`\`\`
=VLOOKUP(lookup_value, table_array, col_index_num, range_lookup)
=VLOOKUP(A2, Sheet2!A:D, 3, FALSE)
\`\`\`

| Parameter | Description | Common Values |
|-----------|-------------|---------------|
| lookup_value | The value to look up | A2 (Product ID) |
| table_array | The range to search in | Sheet2!A:D |
| col_index_num | Which column to return | 3 (third column) |
| range_lookup | Exact or approximate | FALSE (exact match) |

### VLOOKUP Example: Merging Sales and Product Data

\`\`\`
Sales Table (Sheet1):
| OrderID | ProductID | Qty | Product Name (VLOOKUP) |
|---------|-----------|-----|------------------------|
| 001     | P-101     | 5   | =VLOOKUP(B2, Products!A:C, 2, FALSE) |
| 002     | P-203     | 3   | =VLOOKUP(B3, Products!A:C, 2, FALSE) |

Products Sheet:
| ProductID | Product Name | Unit Price |
|-----------|-------------|-----------|
| P-101     | Mouse       | 12        |
| P-203     | Keyboard    | 30        |
\`\`\`

### VLOOKUP Limitations

\`\`\`
❌ Can only look up to the right (lookup value must be in the leftmost column)
❌ col_index_num breaks when columns are inserted/deleted
❌ Poor performance with large datasets
❌ Multi-criteria lookup is difficult
\`\`\`

### INDEX-MATCH: A More Powerful Alternative

\`\`\`
=INDEX(return_range, MATCH(lookup_value, lookup_range, 0))
=INDEX(C:C, MATCH(A2, B:B, 0))
\`\`\`

### INDEX-MATCH Advantages

| Feature | VLOOKUP | INDEX-MATCH |
|---------|---------|-------------|
| Look up to the left | ❌ | ✅ |
| Unaffected by column insertion | ❌ | ✅ |
| Performance with large data | Slow | Fast |
| Multi-criteria lookup | Difficult | Easy (with arrays) |
| Horizontal lookup | Needs HLOOKUP | Same formula set |

### Multi-Criteria Lookup

\`\`\`
Scenario: Look up salary based on "Department" + "Job Level"

Method 1: Helper Column
Add a column in the salary table = Department & Job Level
=VLOOKUP(A2&B2, Helper!A:C, 3, FALSE)

Method 2: INDEX-MATCH Array Formula (Ctrl+Shift+Enter)
=INDEX(SalaryRange, MATCH(1, (DeptRange=A2)*(LevelRange=B2), 0))

Method 3: XLOOKUP (Excel 365+)
=XLOOKUP(A2, LookupRange, ReturnRange, "Not Found")
\`\`\`

### XLOOKUP (Newer Excel)

\`\`\`
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])

Advantages:
- Can look up to the left
- Built-in default value when not found
- Supports wildcard search
- More intuitive syntax

Example:
=XLOOKUP(A2, Products!A:A, Products!C:C, "Not Found")
\`\`\`

---

## 30-2: Pivot Table Analysis

### When to Use a Pivot Table?

\`\`\`
When you need to:
- Quickly summarize large datasets
- Multi-dimensional cross-analysis
- Dynamically switch analysis perspectives
- Create management reports
\`\`\`

### Steps to Create a Pivot Table

\`\`\`
1. Select the data range (ensure it has a header row)
2. Insert → PivotTable
3. Choose placement (new worksheet / existing location)
4. Drag fields into four areas:
   - Rows: Analysis dimension
   - Columns: Cross-dimension
   - Values: Numbers to calculate
   - Filters: Global filter
\`\`\`

### Example: Sales Data Analysis

\`\`\`
Raw Data:
| Date | Region | Category | Sales Rep | Amount | Quantity |
|------|--------|----------|-----------|--------|----------|
| 1/1  | North  | Computer | Alice     | 35000  | 2        |
| 1/1  | South  | Phone    | Bob       | 28000  | 4        |
| 1/2  | North  | Phone    | Alice     | 14000  | 2        |
| ...  | ...    | ...      | ...       | ...    | ...      |

Pivot Table Setup 1: Sales by Region and Category
Rows: Region
Columns: Category
Values: Sum of Amount

Result:
| Region | Computer | Phone | Accessories | Total |
|--------|----------|-------|-------------|-------|
| North  | 850K     | 620K  | 180K        | 1.65M |
| Central| 520K     | 480K  | 150K        | 1.15M |
| South  | 680K     | 590K  | 210K        | 1.48M |
| Total  | 2.05M    | 1.69M | 540K        | 4.28M |
\`\`\`

### Advanced Pivot Table Techniques

\`\`\`
1. Value Field Settings:
   - Sum, Count, Average
   - Show Values As → % of Grand Total
   - Show Values As → % of Column Total
   - Show Values As → Running Total

2. Group Feature:
   - Date grouping: By month/quarter/year
   - Numeric grouping: Amount tiers (0-1000, 1001-5000...)

3. Calculated Field:
   - Average order value = Amount / Quantity
   - Profit margin = (Amount - Cost) / Amount

4. Slicer:
   - Visual filter buttons
   - Can link multiple Pivot Tables
\`\`\`

### Common Pivot Table Interview Questions

\`\`\`
Q: Given order data, how do you find the Top 5 customers?
A: Pivot Table → Rows: Customer → Values: Sum of Amount
   → Sort Descending → Take top 5

Q: How do you analyze monthly trends?
A: Pivot Table → Rows: Date (Group by Month)
   → Values: Sum of Amount
   → Insert Line Chart

Q: How do you do RFM analysis?
A: Recency: MAX(Date) per Customer
   Frequency: COUNT(Orders) per Customer
   Monetary: SUM(Amount) per Customer
   → Score each dimension on a 1-5 scale → Cross-segment
\`\`\`

---

## 30-3: Commonly Used Formulas and Functions

### Conditional Statistical Functions

\`\`\`
COUNTIF — Conditional Count
=COUNTIF(A:A, "North")                    → Count of North region entries
=COUNTIFS(A:A, "North", B:B, ">10000")    → North region AND amount > 10000

SUMIF — Conditional Sum
=SUMIF(A:A, "North", C:C)                 → Total amount for North
=SUMIFS(C:C, A:A, "North", B:B, "Computer") → North + Computer amount

AVERAGEIF — Conditional Average
=AVERAGEIF(A:A, "North", C:C)             → Average amount for North
\`\`\`

### Text Functions

\`\`\`
LEFT / RIGHT / MID — Extract Substrings
=LEFT(A2, 3)                → First 3 characters
=RIGHT(A2, 4)               → Last 4 characters
=MID(A2, 3, 5)              → 5 characters starting from position 3

CONCATENATE / TEXTJOIN — Combine Strings
=A2 & " - " & B2            → Combine two columns
=TEXTJOIN(", ", TRUE, A2:A10)  → Join range with commas

TRIM / CLEAN — Remove Whitespace and Special Characters
=TRIM(A2)                   → Remove leading/trailing spaces
=CLEAN(A2)                  → Remove non-printable characters

TEXT — Formatting
=TEXT(A2, "YYYY-MM-DD")     → Format date
=TEXT(A2, "#,##0")           → Add thousands separator
\`\`\`

### Logical Functions

\`\`\`
IF — Conditional Logic
=IF(A2>=60, "Pass", "Fail")

Nested IF (not recommended beyond 3 levels)
=IF(A2>=90, "A", IF(A2>=80, "B", IF(A2>=60, "C", "F")))

IFS (Excel 2019+, more readable)
=IFS(A2>=90, "A", A2>=80, "B", A2>=60, "C", TRUE, "F")

IFERROR — Error Handling
=IFERROR(VLOOKUP(...), "Not Found")

AND / OR
=IF(AND(A2>0, B2>0), "Both Positive", "Not Both")
=IF(OR(A2="VIP", B2>10000), "Priority", "Normal")
\`\`\`

### Date Functions

\`\`\`
TODAY() / NOW() — Current date/time
DATEDIF — Date difference
=DATEDIF(A2, B2, "D")    → Difference in days
=DATEDIF(A2, B2, "M")    → Difference in months
=DATEDIF(A2, B2, "Y")    → Difference in years

EOMONTH — End of month date
=EOMONTH(A2, 0)          → Last day of current month
=EOMONTH(A2, -1)         → Last day of previous month

WEEKDAY — Day of the week
=WEEKDAY(A2, 2)          → 1=Mon, 7=Sun

NETWORKDAYS — Working days count
=NETWORKDAYS(A2, B2)     → Working days between two dates
\`\`\`

### Statistical Functions

\`\`\`
RANK — Ranking
=RANK(A2, A:A, 0)        → Rank from largest to smallest

PERCENTILE — Percentile value
=PERCENTILE(A:A, 0.9)    → P90

STDEV — Standard deviation
=STDEV(A:A)              → Sample standard deviation

LARGE / SMALL — Nth largest/smallest
=LARGE(A:A, 3)           → 3rd largest value
\`\`\`

---

## 30-4: Data Cleaning Techniques

### Common Dirty Data Issues

| Issue | Example | Solution |
|-------|---------|---------|
| Extra whitespace | " New York " | TRIM() |
| Inconsistent casing | "new york" vs "New York" | UPPER/LOWER/PROPER |
| Inconsistent date formats | "2026/3/1" vs "03-01-2026" | TEXT() or format settings |
| Duplicate data | Same order appearing twice | Remove Duplicates |
| Null values | Missing region field | Filter → Blanks → Fill |
| Outliers | Amount = -999 | Conditional Formatting + Filter |
| Merged cells | Region spanning three rows | Unmerge + Fill Down |

### Data Cleaning Workflow

\`\`\`
Step 1: Back up the original data (always back up first!)

Step 2: Assess data quality
- Total records: COUNTA()
- Null count: COUNTBLANK()
- Duplicate count: COUNTIF() > 1
- Max/Min values: MAX(), MIN()

Step 3: Standardize
- Remove whitespace: TRIM()
- Standardize casing: PROPER()
- Standardize date format: TEXT()

Step 4: Handle missing values
- Delete (when data is sufficient)
- Impute median (numeric)
- Impute mode (categorical)
- Mark as Unknown

Step 5: Deduplicate
- Data → Remove Duplicates
- Or use COUNTIF to flag, then handle manually

Step 6: Validate
- Spot-check samples
- Cross-reference with original data
- Check if summary numbers are reasonable
\`\`\`

### Useful Cleaning Formulas

\`\`\`
Remove all whitespace (including non-breaking spaces):
=SUBSTITUTE(SUBSTITUTE(TRIM(A2), CHAR(160), ""), " ", "")

Extract numbers:
=SUMPRODUCT(MID(0&A2, LARGE(INDEX(ISNUMBER(--MID(A2,
ROW($1:$99), 1))*ROW($1:$99), 0), ROW($1:$99))+1, 1)*10^
ROW($1:$99)/10)

Standardize phone format:
=TEXT(SUBSTITUTE(SUBSTITUTE(A2, "-", ""), " ", ""), "0000-000-000")
\`\`\`

### Conditional Formatting for Anomaly Detection

\`\`\`
1. Select the data range
2. Home → Conditional Formatting → New Rule
3. Common rules:
   - Highlight blanks in yellow
   - Highlight negatives in red
   - Highlight duplicates in orange
   - Highlight values beyond 3 standard deviations in red (outliers)
\`\`\`

---

## 30-5: Scenario Analysis

### What Is Scenario Analysis?

\`\`\`
Building models in Excel to test outcomes under different assumptions.
Commonly used by BAs for:
- Project investment evaluation
- Pricing strategy analysis
- Risk assessment
- Budget planning
\`\`\`

### Method 1: Data Table

\`\`\`
Scenario: Analyze revenue under different price and volume combinations

Base Model:
Unit Price = $100 (Cell B1)
Volume = 1,000 (Cell B2)
Revenue = Price x Volume = $100,000 (Cell B3, =B1*B2)

Data Table Setup:
     |  $80   | $100  | $120  | $150
-----+--------+-------+-------+------
 800 | 64,000 |80,000 |96,000 |120,000
1000 | 80,000 |100,000|120,000|150,000
1200 | 96,000 |120,000|144,000|180,000
1500 |120,000 |150,000|180,000|225,000

Steps: Data → What-If Analysis → Data Table
Row Input = B1 (Price)
Column Input = B2 (Volume)
\`\`\`

### Method 2: Scenario Manager

\`\`\`
Scenario Settings:

Best Case (Optimistic):
- Growth rate = 20%
- Customer churn rate = 2%
- Average order value = $1,200

Base Case:
- Growth rate = 10%
- Customer churn rate = 5%
- Average order value = $1,000

Worst Case (Pessimistic):
- Growth rate = 3%
- Customer churn rate = 10%
- Average order value = $800

Steps: Data → What-If Analysis → Scenario Manager → Add
\`\`\`

### Method 3: Goal Seek

\`\`\`
Question: How much volume is needed to reach $500K revenue?

Setup:
Set Cell = Revenue (B3)
To Value = 500,000
By Changing Cell = Volume (B2)

Steps: Data → What-If Analysis → Goal Seek
Result: Volume needs to be 5,000 units
\`\`\`

### Sensitivity Analysis

\`\`\`
Test the impact of each variable changing ±10%, ±20% on the result:

| Variable | -20% | -10% | Base | +10% | +20% | Sensitivity |
|----------|------|------|------|------|------|-------------|
| Price    | $80K | $90K |$100K |$110K |$120K | High        |
| Volume   | $80K | $90K |$100K |$110K |$120K | High        |
| Cost     | $120K| $110K|$100K | $90K | $80K | Medium      |
| Discount | $105K| $102K|$100K | $98K | $95K | Low         |

→ Price and volume have the highest sensitivity on revenue
→ Discount rate has relatively low impact
\`\`\`

### Interview Practice: ROI Calculation

\`\`\`
Project Investment Evaluation Model:

Investment Costs:
- System development: $500K
- Annual operations: $100K
- Training: $50K
- Total investment (3 years): $500K + $100K x 3 + $50K = $850K

Expected Benefits:
- Annual labor cost savings: $200K
- Annual revenue contribution: $150K
- Annual total benefit: $350K

ROI Calculation:
= (3-year total benefits - 3-year total costs) / 3-year total costs
= ($350K x 3 - $850K) / $850K
= $200K / $850K
= 23.5%

Payback Period:
= Total investment / Annual benefit
= $850K / $350K
= 2.43 years
\`\`\`

---

## 30-6: Complete Analysis Case Study

### Case: E-Commerce Monthly Performance Analysis

#### Task Description

\`\`\`
You receive monthly sales data from an e-commerce platform (5,000 orders).
You need to present the following analysis results at tomorrow's management meeting:
1. Revenue and share by category
2. Top 10 best-selling products
3. Conversion rate comparison by channel
4. Customer RFM segmentation
5. Next month revenue forecast
\`\`\`

#### Step 1: Data Cleaning

\`\`\`
Checklist:
☐ Total record count is correct (5,000)
☐ Check for duplicate orders (COUNTIF on Order ID > 1)
☐ Date range is correct (1st to last day of month)
☐ No negative or abnormal values in amount
☐ No null values in region/category fields
☐ Data types are correct (amount is numeric, not text)
\`\`\`

#### Step 2: Pivot Table Analysis

\`\`\`
Analysis 1: Revenue by Category
Rows: Category
Values: Sum of Amount, Count of OrderID
Show Values As: % of Grand Total

Result:
| Category    | Revenue | Share | Orders | AOV    |
|-------------|---------|-------|--------|--------|
| Electronics | $2.1M   | 35%   | 800    | $2,625 |
| Apparel     | $1.5M   | 25%   | 1,500  | $1,000 |
| Food        | $1.2M   | 20%   | 1,800  | $667   |
| Home        | $0.8M   | 13%   | 600    | $1,333 |
| Other       | $0.4M   | 7%    | 300    | $1,333 |
\`\`\`

#### Step 3: RFM Analysis

\`\`\`
Calculate RFM Scores:

R (Recency) = TODAY() - Last Purchase Date
  → Score 1-5: 1-7 days=5, 8-14=4, 15-30=3, 31-60=2, >60=1

F (Frequency) = Purchase Count
  → Score 1-5: >10=5, 7-10=4, 4-6=3, 2-3=2, 1=1

M (Monetary) = Total Spending
  → Score 1-5: Use PERCENTILE to divide into 5 equal parts

RFM Segmentation:
| RFM Score | Segment Name | Count | Strategy |
|-----------|-------------|-------|----------|
| 5-5-5 | Champions | 120 | Exclusive offers, VIP treatment |
| 4-4-4 ~ 5-5-4 | Loyal | 350 | Tier upgrade rewards, early access |
| 3-3-3 ~ 4-4-3 | Potential | 580 | Promotional push, cross-selling |
| 2-2-2 ~ 3-3-2 | At Risk | 420 | Win-back offers, surveys |
| 1-1-1 ~ 2-2-1 | Lost | 280 | Deep discounts or deprioritize |
\`\`\`

#### Step 4: Dashboard Presentation

\`\`\`
Page 1: Overview
- This month's revenue vs last month (Card + trend arrow)
- Order count vs last month
- Average order value vs last month
- Daily revenue trend (Line Chart)

Page 2: Category Analysis
- Category revenue share (Pie Chart)
- Category monthly trend (Stacked Bar)
- Top 10 products (Horizontal Bar)

Page 3: Customer Analysis
- RFM segment distribution (Donut Chart)
- New vs returning customer revenue share
- Customer geographic distribution (Map/Bar)
\`\`\`

---

## Cheat Sheet: Excel Analysis Quick Reference

### Must-Know Keyboard Shortcuts

| Shortcut | Function |
|----------|----------|
| Ctrl+T | Create Table |
| Alt+N+V | Insert Pivot Table |
| Ctrl+Shift+L | Add Filter |
| F4 | Toggle Absolute/Relative Reference |
| Ctrl+; | Insert Today's Date |
| Ctrl+Shift+1 | Number Format (thousands separator) |
| Alt+= | AutoSUM |
| Ctrl+D | Fill Down |

### Formula Quick Reference

\`\`\`
Lookup: VLOOKUP → INDEX-MATCH → XLOOKUP
Conditional Stats: COUNTIFS, SUMIFS, AVERAGEIFS
Text: LEFT, RIGHT, MID, TRIM, TEXT
Logic: IF, IFS, IFERROR, AND, OR
Date: TODAY, DATEDIF, EOMONTH, NETWORKDAYS
Statistics: RANK, PERCENTILE, STDEV
\`\`\`

### Common Excel Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| VLOOKUP vs INDEX-MATCH? | INDEX-MATCH is more flexible, supports left lookup |
| How to handle large datasets? | Pivot Table + Filter + Structured Tables |
| How to do Scenario Analysis? | Data Table / Scenario Manager / Goal Seek |
| How to clean data? | TRIM + Dedup + Conditional Formatting + Validation |
| How to present analysis results? | Pivot Chart + Dashboard + Executive Summary |
`;

export default world30_en;
