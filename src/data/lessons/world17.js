const world17 = `
# ⚙️ 函式與錯誤處理

函式是程式碼重用的基本單位，錯誤處理讓你的程式更健壯。

---

## 17-1：函式基礎 def

### 定義與呼叫

\`\`\`python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")  # "Hello, Alice!"
\`\`\`

### return vs print

- **return**：把值傳回給呼叫者，可以存到變數
- **print**：輸出到螢幕，回傳 None

\`\`\`python
def add_return(a, b):
    return a + b          # 呼叫者拿到 8

def add_print(a, b):
    print(a + b)          # 印出 8，但呼叫者拿到 None
\`\`\`

---

## 17-2：參數進階

### 預設值參數

\`\`\`python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("Alice")          # "Hello, Alice!"
greet("Alice", "Hi")    # "Hi, Alice!"
\`\`\`

### *args 和 **kwargs

\`\`\`python
def log(message, *args, **kwargs):
    print(f"[LOG] {message}")
    print(f"  args: {args}")       # tuple
    print(f"  kwargs: {kwargs}")   # dict

log("error", 1, 2, level="high")
\`\`\`

---

## 17-3：作用域與內建函式

### LEGB 規則

Python 查找變數的順序：Local → Enclosing → Global → Built-in

\`\`\`python
x = 10              # Global
def foo():
    x = 20          # Local
    print(x)        # 20
foo()
print(x)            # 10（Global 不變）
\`\`\`

### 常用內建函式

| 函式 | 說明 | 範例 |
|------|------|------|
| \`sorted()\` | 排序（回傳新 list） | \`sorted([3,1,2]) → [1,2,3]\` |
| \`sum()\` | 加總 | \`sum([1,2,3]) → 6\` |
| \`min()/max()\` | 最小/最大 | \`max([3,1,2]) → 3\` |
| \`zip()\` | 配對 | \`list(zip([1,2], ["a","b"]))\` |
| \`map()\` | 映射 | \`list(map(str, [1,2]))\` |
| \`filter()\` | 篩選 | \`list(filter(lambda x: x>2, [1,2,3]))\` |

---

## 17-4：錯誤類型與除錯

### 常見錯誤

| 錯誤 | 原因 |
|------|------|
| \`SyntaxError\` | 語法錯誤（缺冒號、引號） |
| \`TypeError\` | 型態不匹配 |
| \`NameError\` | 變數未定義 |
| \`ValueError\` | 值不合法 |
| \`KeyError\` | dict key 不存在 |
| \`IndexError\` | 索引超界 |

### 閱讀 Traceback

先看最後一行（錯誤類型），再看最底部的行號（錯誤位置）。

---

## 17-5：try/except 與防禦式程式

\`\`\`python
try:
    num = int(input("數字："))
except ValueError:
    print("請輸入有效的數字")
else:
    print(f"成功：{num}")
finally:
    print("完成")
\`\`\`

### 最佳實踐

1. 只 catch 你知道怎麼處理的 exception
2. 不要用裸 except
3. try 區塊越小越好
4. 用 raise 往上拋

---

## 17-6（Boss）：資料驗證函式組

綜合運用函式設計、參數、回傳值、try/except、raise。
`

export default world17
