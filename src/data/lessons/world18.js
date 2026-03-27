const world18 = `
# 📦 模組、檔案與物件導向

學會組織程式碼（模組）、處理外部資料（檔案）、用 class 建立自己的資料型態。

---

## 18-1：import 與標準函式庫

### import 三種方式

\`\`\`python
import datetime                    # 匯入整個模組
from datetime import datetime      # 只匯入特定名稱
import datetime as dt              # 別名
\`\`\`

### 常用標準庫

| 模組 | 用途 |
|------|------|
| \`os\` | 作業系統操作 |
| \`datetime\` | 日期時間 |
| \`json\` | JSON 處理 |
| \`csv\` | CSV 檔案 |
| \`random\` | 隨機數 |
| \`pathlib\` | 路徑操作 |

---

## 18-2：pip 與第三方套件

\`\`\`bash
pip install requests              # 安裝
pip freeze > requirements.txt     # 匯出依賴
pip install -r requirements.txt   # 從清單安裝
python -m venv .venv              # 建立虛擬環境
\`\`\`

---

## 18-3：檔案讀寫 txt/csv

\`\`\`python
# 讀取文字檔（推薦用 with）
with open("data.txt", "r", encoding="utf-8") as f:
    content = f.read()

# CSV 讀取（每行是 dict）
import csv
with open("data.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"])
\`\`\`

---

## 18-4：JSON 讀寫

四個核心函式：
- \`json.load(f)\` — 檔案 → Python
- \`json.loads(s)\` — 字串 → Python
- \`json.dump(obj, f)\` — Python → 檔案
- \`json.dumps(obj)\` — Python → 字串

\`\`\`python
import json

with open("config.json") as f:
    config = json.load(f)

# 巢狀安全存取
host = config.get("database", {}).get("host", "localhost")
\`\`\`

---

## 18-5：OOP 基礎 class

\`\`\`python
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def greet(self):
        return f"Hi, I'm {self.name}"

    def __str__(self):
        return f"User({self.name})"

user = User("Alice", "alice@example.com")
print(user.greet())   # "Hi, I'm Alice"
\`\`\`

### 重點

- \`__init__\` 是建構子
- \`self\` 是實例自身的參考
- 方法第一個參數永遠是 self
- \`__str__\` 定義 print() 的輸出

---

## 18-6（Boss）：Config Reader Class

綜合運用 class、檔案讀寫、JSON、巢狀 dict 操作、錯誤處理。
`

export default world18
