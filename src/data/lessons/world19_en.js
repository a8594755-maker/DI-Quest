const world19_en = `
# 🐼 Pythonic Thinking and Data Processing

Write code that feels "like Python," and use pandas to process real-world data.

---

## 19-1: List Comprehension

\`\`\`python
# Basic syntax
squares = [x ** 2 for x in range(10)]

# With conditional filtering
evens = [x for x in range(20) if x % 2 == 0]

# With transformation + condition
upper_long = [s.upper() for s in names if len(s) > 3]
\`\`\`

---

## 19-2: Readability and PEP 8

- Functions/variables: snake_case
- Classes: PascalCase
- Constants: UPPER_SNAKE_CASE
- Max 79 characters per line
- Import order: standard library → third-party → your own

---

## 19-3: Pandas Basics — DataFrame

\`\`\`python
import pandas as pd

df = pd.read_csv("data.csv")
df.head()        # First 5 rows
df.info()        # Column types
df.describe()    # Statistical summary
df.shape         # (rows, columns)
\`\`\`

---

## 19-4: Data Filtering and Sorting

\`\`\`python
# Conditional filtering (note the parentheses and &)
result = df[(df["price"] > 100) & (df["category"] == "Electronics")]

# Sorting
df.sort_values("price", ascending=False)

# loc (label-based) vs iloc (position-based)
df.loc[0:5, ["name", "price"]]
df.iloc[0:5, 0:2]
\`\`\`

---

## 19-5: GroupBy and Aggregation

\`\`\`python
# Basic groupby
df.groupby("category")["price"].mean()

# Multiple aggregations
df.groupby("category")["price"].agg(["mean", "max", "count"])

# Different aggregations for different columns
df.groupby("category").agg({"price": "mean", "qty": "sum"})
\`\`\`

---

## 19-6 (Boss): Analyze Sales Data with Pandas

Combine all concepts: Read → Clean → Calculate → Group → Export.
`;

export default world19_en;
