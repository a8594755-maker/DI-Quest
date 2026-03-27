const world16 = `
# 🔄 迴圈與資料結構

學會用迴圈重複執行程式，並認識 Python 最重要的五種資料結構。

---

## 16-1：for 迴圈與 range()

### 基本 for 迴圈

\`\`\`python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
\`\`\`

### range() 三參數

\`range(start, stop, step)\` — stop 不包含！

\`\`\`python
range(5)        # 0, 1, 2, 3, 4
range(2, 6)     # 2, 3, 4, 5
range(0, 10, 2) # 0, 2, 4, 6, 8
range(10, 0, -1)# 10, 9, 8, ..., 1（倒數）
\`\`\`

### enumerate() — 同時取索引和值

\`\`\`python
# ❌ 不 Pythonic
for i in range(len(fruits)):
    print(i, fruits[i])

# ✅ Pythonic
for i, fruit in enumerate(fruits):
    print(i, fruit)

# 可以指定起始索引
for i, fruit in enumerate(fruits, start=1):
    print(i, fruit)  # 從 1 開始
\`\`\`

---

## 16-2：while 迴圈與流程控制

### while 迴圈

\`\`\`python
count = 0
while count < 5:
    print(count)
    count += 1
\`\`\`

### for vs while 選擇

- **for**：已知次數或已知集合 → \`for item in collection\`
- **while**：條件驅動，不知道要跑幾次 → \`while condition\`

### break 與 continue

\`\`\`python
# break — 立刻結束迴圈
for i in range(100):
    if i == 5:
        break       # 只跑到 4
    print(i)

# continue — 跳過這次，繼續下一次
for i in range(10):
    if i % 2 == 0:
        continue    # 跳過偶數
    print(i)        # 只印奇數
\`\`\`

### while True + break 模式

\`\`\`python
while True:
    cmd = input("指令（quit 離開）：")
    if cmd == "quit":
        break
    print(f"你輸入了：{cmd}")
\`\`\`

---

## 16-3：字串操作

### 索引與切片

\`\`\`python
s = "Hello, World!"
s[0]      # 'H'（第一個字元）
s[-1]     # '!'（最後一個字元）
s[7:12]   # 'World'（切片）
s[:5]     # 'Hello'（從頭到第 5 個之前）
s[7:]     # 'World!'（從第 7 個到尾）
s[::-1]   # '!dlroW ,olleH'（反轉）
\`\`\`

### 常用字串方法

| 方法 | 說明 | 範例 |
|------|------|------|
| \`.strip()\` | 去頭尾空白 | \`"  hi  ".strip() → "hi"\` |
| \`.lower()\` / \`.upper()\` | 大小寫 | \`"Hi".lower() → "hi"\` |
| \`.split()\` | 切割 | \`"a,b,c".split(",") → ["a","b","c"]\` |
| \`.join()\` | 合併 | \`",".join(["a","b"]) → "a,b"\` |
| \`.replace()\` | 取代 | \`"hi".replace("hi","hello")\` |
| \`.startswith()\` | 開頭判斷 | \`"hello".startswith("he") → True\` |
| \`.find()\` | 尋找位置 | \`"hello".find("ll") → 2\` |

**字串是不可變的（immutable）** — 所有方法都回傳新字串。

---

## 16-4：List 與 Tuple

### List — 可變的有序集合

\`\`\`python
# 建立
nums = [1, 2, 3, 4, 5]

# 新增
nums.append(6)          # 尾部加 → [1,2,3,4,5,6]
nums.insert(0, 0)       # 指定位置插入

# 刪除
nums.pop()              # 移除最後一個
nums.remove(3)          # 移除第一個值為 3 的

# 排序
nums.sort()             # 原地排序（改原 list）
sorted_nums = sorted(nums)  # 回傳新 list（不改原本）

# 切片
nums[1:3]               # 取第 1~2 個
nums[::2]               # 每隔一個取
\`\`\`

### Tuple — 不可變的有序集合

\`\`\`python
point = (3, 4)          # 座標
rgb = (255, 128, 0)     # 顏色

# 解包（Unpacking）
x, y = point            # x=3, y=4
name, age, city = ("Alice", 25, "Taipei")
\`\`\`

### 何時用 Tuple vs List

- **Tuple**：固定結構、不會修改（座標、設定值、函式回傳多值）
- **List**：會增減元素的動態集合（購物車、待辦事項）

---

## 16-5：Dict 與 Set

### Dict — 鍵值對

\`\`\`python
user = {"name": "Alice", "age": 25, "city": "Taipei"}

# 存取
user["name"]               # "Alice"
user.get("email", "N/A")   # 安全存取，key 不存在回傳預設值

# 新增/修改
user["email"] = "alice@example.com"

# 遍歷
for key, value in user.items():
    print(f"{key}: {value}")

# 常用方法
user.keys()     # dict_keys(["name", "age", "city"])
user.values()   # dict_values(["Alice", 25, "Taipei"])
user.items()    # dict_items([("name","Alice"), ...])
\`\`\`

### Set — 不重複的無序集合

\`\`\`python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

a & b    # {3, 4} — 交集
a | b    # {1,2,3,4,5,6} — 聯集
a - b    # {1, 2} — 差集
a ^ b    # {1,2,5,6} — 對稱差集

# 去重
names = ["Alice", "Bob", "Alice", "Charlie", "Bob"]
unique = list(set(names))  # ["Alice", "Bob", "Charlie"]
\`\`\`

---

## 16-6（Boss）：資料清洗小程式

綜合運用：
- \`for\` 迴圈遍歷 list of dicts
- 字串方法（\`.strip()\`, \`.lower()\`）清洗資料
- \`dict.get()\` 安全累加統計
- \`max()\` 找出最大值
- 條件判斷過濾無效資料
`

export default world16
