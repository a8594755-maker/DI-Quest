const world19 = `
# 🐼 Pythonic 思維與資料處理

寫出「像 Python」的程式碼，並用 pandas 處理真實資料。

---

## 19-1：List Comprehension

\`\`\`python
# 基本語法
squares = [x ** 2 for x in range(10)]

# 帶條件篩選
evens = [x for x in range(20) if x % 2 == 0]

# 帶轉換 + 條件
upper_long = [s.upper() for s in names if len(s) > 3]
\`\`\`

---

## 19-2：可讀性與 PEP 8

- 函式/變數：snake_case
- 類別：PascalCase
- 常數：UPPER_SNAKE_CASE
- 一行不超過 79 字元
- import 順序：標準庫 → 第三方 → 自己的

---

## 19-3：Pandas 入門 DataFrame

\`\`\`python
import pandas as pd

df = pd.read_csv("data.csv")
df.head()        # 前 5 行
df.info()        # 欄位型態
df.describe()    # 統計摘要
df.shape         # (行數, 列數)
\`\`\`

---

## 19-4：資料篩選與排序

\`\`\`python
# 條件篩選（注意括號和 &）
result = df[(df["price"] > 100) & (df["category"] == "Electronics")]

# 排序
df.sort_values("price", ascending=False)

# loc（標籤）vs iloc（位置）
df.loc[0:5, ["name", "price"]]
df.iloc[0:5, 0:2]
\`\`\`

---

## 19-5：GroupBy 與聚合

\`\`\`python
# 基本 groupby
df.groupby("category")["price"].mean()

# 多重聚合
df.groupby("category")["price"].agg(["mean", "max", "count"])

# 不同欄位不同聚合
df.groupby("category").agg({"price": "mean", "qty": "sum"})
\`\`\`

---

## 19-6（Boss）：用 Pandas 分析銷售資料

綜合運用：讀取 → 清洗 → 計算 → 分群 → 輸出。
`

export default world19
