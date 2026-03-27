const world20 = `
# 🤖 API 與自動化腳本

學會用 Python 呼叫 API 和寫自動化腳本。

---

## 20-1：JSON 與 API 概念

- REST API 用 HTTP 方法操作資源
- GET（讀取）、POST（建立）、PUT（更新）、DELETE（刪除）
- 狀態碼：2xx 成功、4xx 客戶端錯誤、5xx 伺服器錯誤

---

## 20-2：requests GET

\`\`\`python
import requests

resp = requests.get("https://api.example.com/data", params={"page": 1})
if resp.status_code == 200:
    data = resp.json()
\`\`\`

---

## 20-3：POST 與認證

\`\`\`python
import os

headers = {"Authorization": f"Bearer {os.environ['API_KEY']}"}
resp = requests.post(url, json={"name": "Alice"}, headers=headers)
\`\`\`

---

## 20-4：批次處理腳本

\`\`\`python
from glob import glob
import pandas as pd

files = glob("data/*.csv")
dfs = [pd.read_csv(f) for f in files]
combined = pd.concat(dfs, ignore_index=True)
\`\`\`

---

## 20-5：自動報表生成

\`\`\`python
with pd.ExcelWriter("report.xlsx") as writer:
    summary.to_excel(writer, sheet_name="Summary")
    details.to_excel(writer, sheet_name="Details")
\`\`\`

---

## 20-6（Boss）：設計 API 資料蒐集腳本

綜合運用：分頁處理、rate limit、錯誤處理、logging。
`

export default world20
