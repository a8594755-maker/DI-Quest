const world4_en = `
# World 4: SQL & Data Literacy

> You may not always need to write SQL in an interview, but you must be able to think in the language of data. Learn to say "I need this table, JOIN it this way, and aggregate like that."

Data literacy isn't about writing code — it's about understanding **where data comes from, what it looks like, and how to use it to answer questions**.
This chapter covers the most commonly tested data concepts in interviews.

---

## 4-1: SQL Query Thinking

### SQL in Interviews Isn't About Writing Code

Most Business Analyst / Product Analyst interviews won't ask you to write perfect SQL on a whiteboard.
What interviewers want to hear is your **query logic**:

1. What question do I need to answer?
2. What data do I need for that answer?
3. Which tables contain that data?
4. How do I connect data from different tables?
5. What calculations are needed?

### Basic SQL Concepts at a Glance

| Concept | Purpose | Plain English |
|---------|---------|---------------|
| SELECT | Choose columns | What data do I want to see? |
| FROM | Choose table | Which table has the data? |
| WHERE | Filter | Only show data matching conditions |
| GROUP BY | Group | Summarize by a dimension |
| ORDER BY | Sort | How should the results be ordered? |
| HAVING | Filter after grouping | Filter after aggregation |
| LIMIT | Limit rows | Only show the top N rows |

### Interview Example

Interviewer asks: "How would you find the paid conversion rate by channel over the past 30 days?"

Your answer:
> "I'd need the users table and the payments table. I'd JOIN them on user_id, use WHERE to filter for the last 30 days, then GROUP BY channel and calculate the number of paying users divided by total users for each channel."

That's sufficient — no need to write out the full syntax.

### Thinking Order Mnemonic

**FROM → WHERE → GROUP BY → SELECT → ORDER BY**

First think "where to get the data" → then "what to filter" → then "how to group" → finally "what to calculate"

---

## 4-2: Event Data vs Transactional Data

### Two Common Data Types

**Event Data**
- Records every user action
- Each row is something that happened at a point in time
- Examples: page_view, button_click, search_query
- Characteristics: high volume, immutable, ordered by time

**Transactional Data**
- Records the state of business entities
- Each row represents the current state of an entity
- Examples: orders, subscriptions, invoices
- Characteristics: gets updated, has a lifecycle (created → paid → shipped)

### Why Do Interviewers Care About This?

Because **different questions require different types of data**:

| Question | Data to Use |
|----------|-------------|
| At which step are users dropping off? | Event data (funnel analysis) |
| What was last month's revenue? | Transactional data (orders table) |
| How long does it take users to complete onboarding? | Event data (time difference) |
| Which plan has the highest renewal rate? | Transactional data (subscriptions table) |

### Common Pitfalls

- Using event data to calculate revenue (events may fire multiple times)
- Using transactional data to measure user behavior (misses users who never transacted)
- Inconsistent event definitions (frontend vs backend events may double-count)

---

## 4-3: JOIN & Aggregation

### The Concept of JOIN

A JOIN connects data from two tables based on a shared column.

Common JOIN types:

| Type | Description | When to Use |
|------|-------------|-------------|
| INNER JOIN | Keeps only matching rows from both sides | "Users who have payment records" |
| LEFT JOIN | Keeps all rows from the left table | "All users, regardless of whether they've paid" |
| FULL JOIN | Keeps all rows from both sides | Comparing two complete sets |

### How to Talk About JOINs in Interviews

Don't just say "I'd use a LEFT JOIN." Instead, say:
> "I need to see all users, including those who haven't made a purchase, so I'd use the users table as the main table and LEFT JOIN to the orders table. Users without purchases will have NULL in the order columns, which lets me calculate the 'purchase rate.'"

### Aggregation

Combining multiple rows into a single summary:

| Function | Purpose | Example |
|----------|---------|---------|
| COUNT | Count rows | How many users per channel |
| SUM | Sum values | Total revenue per region |
| AVG | Average | Average order value |
| MAX / MIN | Maximum / Minimum | Highest single purchase |
| COUNT(DISTINCT) | Count unique values | How many unique users made a purchase |

### Interview Tips

When an interviewer asks "Which is better, A or B?", structure your answer as:
1. Define the metric for "better"
2. Explain how you'd GROUP BY (by A/B)
3. Explain what you'd calculate (AVG, COUNT, etc.)
4. Mention variables to control for (sample size, time range, etc.)

---

## 4-4: Window Functions

### Why Do We Need Window Functions?

Some analytical questions can't be solved with GROUP BY:
- What is each user's **Nth** purchase?
- How much did it **grow compared to the previous** entry?
- What is the **moving average** over the past 7 days?
- What is the **rank** within a group?

### Core Concept

A Window Function performs calculations across a set of related rows without collapsing them.

Common Window Functions:

| Function | Purpose | Interview Application |
|----------|---------|----------------------|
| ROW_NUMBER | Sequential numbering | Each user's Nth purchase |
| RANK | Ranking (with ties) | Sales ranking |
| LAG / LEAD | Compare with previous/next | This month vs last month |
| SUM OVER | Running total | Cumulative revenue trend |
| AVG OVER | Moving average | 7-day average order volume |

### How to Use in Interviews

Interviewer asks: "How would you calculate the number of days from registration to first payment for each user?"

Your answer:
> "I'd use the events table, sort by time for each user, and find the time difference between the registration event and the first payment event. I could use ROW_NUMBER or MIN to find each user's first payment, then subtract the registration timestamp."

### Advanced Applications

- **Retention calculation**: Return rate for each cohort at Day 1, Day 7, Day 30
- **Growth accounting**: Decomposition into new, resurrected, and churned users
- **Percentile analysis**: P50, P90 distribution of session duration

---

## 4-5: Source of Truth

### Why Do Different Reports Show Different Numbers for the Same Question?

In real companies, this is one of the most common issues:
- Marketing says "We had 10,000 new users this month"
- Product says "We had 8,500 new users this month"
- Finance says "We had 7,200 new users this month"

None of the three teams are "wrong" — they just use different definitions:
- Marketing counts "registration completed"
- Product counts "registration + onboarding completed"
- Finance counts "registration + verification + deduplicated accounts"

### The Concept of Source of Truth

Source of Truth means agreeing on which data source and definition to use for a given metric.

### How This Comes Up in Interviews

Interviewers may ask:
- "You discover two reports show different numbers — how do you handle it?"
- "PM and Finance disagree on the revenue figure — what do you do?"

Your answer framework:
1. **Confirm definitions**: What metric definition is each party using?
2. **Confirm sources**: Where does the data come from? What time snapshot?
3. **Confirm calculations**: Are the filters and deduplication logic consistent?
4. **Align on standards**: Propose a definition and calculation method everyone agrees on

### Common Data Quality Issues

| Issue | Example |
|-------|---------|
| Double counting | Same user counted twice (multiple devices) |
| Inconsistent definitions | "Active user" defined differently by each team |
| Timezone issues | UTC vs local time causing different daily report numbers |
| Data latency | 2-hour data delay making short-term numbers inaccurate |
| Survivorship bias | Only looking at retained users, ignoring churned ones |

### Golden Interview Phrase

> "Before starting any analysis, I'd first confirm the metric definitions and data sources with stakeholders. This ensures we're looking at the same data and prevents building the analysis on an incorrect foundation."

---

## 4-6: Boss — Data Analysis Design

The Boss challenge tests your ability to design a complete data analysis plan:

1. **Clarify the question**: What does the stakeholder want to know?
2. **Define metrics**: Which metrics answer the question? Confirm definitions
3. **Inventory the data**: Which tables are needed? How to JOIN them?
4. **Design the analysis**: What calculations? How to segment?
5. **Expected output**: What will the results look like? How to present them?
6. **Caveats**: Data quality, biases, limitations

Being able to walk through all six steps demonstrates solid data analysis literacy.

---

## Chapter Summary

| Skill | What's Tested | What You Need to Do |
|-------|---------------|---------------------|
| SQL Thinking | Query logic | Explain which tables, how to join, how to calculate |
| Event vs Transaction | Data selection | Determine which data type to use for the question |
| JOIN & Aggregation | Combining data | Explain why you chose a specific JOIN type |
| Window Functions | Advanced analysis | Ranking, comparisons, moving averages |
| Source of Truth | Data quality | Identify definition inconsistencies and propose solutions |
`
export default world4_en
