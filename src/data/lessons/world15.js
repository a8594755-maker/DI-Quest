const world15 = `
# 🐍 Python 基本語法與條件判斷

歡迎來到 Python 的世界！這個 World 會帶你從零開始，學會 Python 最基礎的語法。

---

## 15-1：變數與資料型態

### 四大基本型態

Python 有四個最常用的基本型態：

| 型態 | 說明 | 範例 |
|------|------|------|
| \`int\` | 整數 | \`42\`, \`-7\`, \`0\` |
| \`float\` | 浮點數 | \`3.14\`, \`-0.5\`, \`1.0\` |
| \`str\` | 字串 | \`"hello"\`, \`'world'\` |
| \`bool\` | 布林 | \`True\`, \`False\` |

### 變數賦值

Python 不需要宣告型態，直接賦值即可：

\`\`\`python
name = "Alice"      # str
age = 25            # int
height = 1.68       # float
is_student = True   # bool
\`\`\`

### type() 查看型態

\`\`\`python
print(type(42))        # <class 'int'>
print(type("hello"))   # <class 'str'>
print(type(True))      # <class 'bool'>
\`\`\`

### 命名規則

- 只能用字母、數字、底線
- 不能以數字開頭
- 不能是保留字（if, for, class 等）
- **慣例用 snake_case**（小寫加底線）

\`\`\`python
# ✅ 好的命名
total_amount = 100
user_name = "Alice"

# ❌ 不合法
2nd_place = "Bob"   # 數字開頭
my-score = 90       # 連字號
class = "A"         # 保留字
\`\`\`

---

## 15-2：Input/Output 與字串格式化

### print() 輸出

\`\`\`python
print("Hello, World!")
print("Name:", name, "Age:", age)   # 多個值用逗號分隔
\`\`\`

### input() 輸入

**重點：input() 永遠回傳 str！**

\`\`\`python
name = input("你的名字：")           # 回傳 str
age = int(input("你幾歲："))         # 要用 int() 轉型
price = float(input("價格："))       # 或 float()
\`\`\`

### f-string 格式化（Python 3.6+）

\`\`\`python
name = "Alice"
age = 25
print(f"{name} is {age} years old")  # Alice is 25 years old
print(f"明年 {age + 1} 歲")          # 大括號裡可以放運算式
print(f"{'Python':>10}")             # 靠右對齊，佔 10 格
print(f"{3.14159:.2f}")              # 保留兩位小數 → 3.14
\`\`\`

---

## 15-3：運算子與表達式

### 算術運算子

| 運算子 | 說明 | 範例 |
|--------|------|------|
| \`+\` | 加 | \`3 + 2 → 5\` |
| \`-\` | 減 | \`3 - 2 → 1\` |
| \`*\` | 乘 | \`3 * 2 → 6\` |
| \`/\` | 除（回傳 float） | \`7 / 2 → 3.5\` |
| \`//\` | 整數除法 | \`7 // 2 → 3\` |
| \`%\` | 取餘數 | \`7 % 2 → 1\` |
| \`**\` | 次方 | \`2 ** 3 → 8\` |

### 比較運算子

\`==\`, \`!=\`, \`>\`, \`<\`, \`>=\`, \`<=\`

**注意 == 和 is 的差別：**
- \`==\` 比較值（equality）
- \`is\` 比較身份/記憶體位置（identity）
- 慣例：跟 None 比較用 \`is\`，其他用 \`==\`

### 邏輯運算子

\`and\`, \`or\`, \`not\`

\`\`\`python
x = 5
print(x > 0 and x < 10)   # True（兩個都要 True）
print(x > 0 or x > 100)   # True（一個 True 就行）
print(not (x > 0))         # False（反轉）
\`\`\`

---

## 15-4：條件判斷 if/elif/else

### 基本結構

\`\`\`python
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"成績：{grade}")  # 成績：B
\`\`\`

**注意：elif 的順序很重要！** 從最嚴格的條件開始。

### 巢狀 vs Guard Clause

\`\`\`python
# ❌ 巢狀太深
if user:
    if user.is_active:
        if user.has_permission:
            do_action()

# ✅ Guard Clause（提前返回）
if not user: return
if not user.is_active: return
if not user.has_permission: return
do_action()
\`\`\`

---

## 15-5：條件判斷進階

### Truthy 與 Falsy

Python 中這些值在 if 條件中視為 **False**（Falsy）：

\`None\`, \`False\`, \`0\`, \`0.0\`, \`""\`, \`[]\`, \`{}\`, \`set()\`

所有其他值都是 **Truthy**。

\`\`\`python
# Pythonic 寫法
if my_list:          # 比 if len(my_list) > 0 好
    process(my_list)

if name:             # 比 if name != "" 好
    greet(name)
\`\`\`

### 短路求值（Short-circuit Evaluation）

\`\`\`python
# and：左邊 Falsy → 回傳左邊，不執行右邊
result = None and expensive_function()  # result = None

# or：左邊 Truthy → 回傳左邊，不執行右邊
name = user_input or "Anonymous"  # 如果 user_input 是空的，用預設值
\`\`\`

### 三元運算式

\`\`\`python
status = "成年" if age >= 18 else "未成年"
\`\`\`

---

## 15-6（Boss）：簡易計算器

綜合運用以上所有概念，寫一個四則運算計算器：
- \`input()\` 取得輸入
- \`float()\` 轉型
- \`if/elif/else\` 判斷運算子
- \`try/except\` 處理錯誤
- \`f-string\` 格式化輸出
`

export default world15
