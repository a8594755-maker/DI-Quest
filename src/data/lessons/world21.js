const world21 = `
# 🗄️ 資料庫與 Backend 基礎

用 Python 連接資料庫、建 API，從腳本升級到服務。

---

## 21-1：Python + SQLite

\`\`\`python
import sqlite3

conn = sqlite3.connect("mydb.db")
cursor = conn.cursor()

# 參數化查詢（防 SQL injection）
cursor.execute("SELECT * FROM users WHERE name = ?", (name,))
rows = cursor.fetchall()

conn.close()
\`\`\`

---

## 21-2：CRUD 操作

| 操作 | SQL | HTTP |
|------|-----|------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT |
| Delete | DELETE | DELETE |

重點：寫入操作後要 \`conn.commit()\`。

---

## 21-3：ORM 概念

ORM 把資料表映射成 Python class：
- 程式碼更直覺
- 自動防 SQL injection
- 簡單 CRUD 用 ORM，複雜查詢用原生 SQL

---

## 21-4：Flask/FastAPI 入門

\`\`\`python
from fastapi import FastAPI

app = FastAPI()

@app.get("/users/{user_id}")
def get_user(user_id: int):
    return {"user_id": user_id}

@app.post("/users", status_code=201)
def create_user(user: UserCreate):
    # 建立使用者邏輯
    return {"id": new_id, **user.dict()}
\`\`\`

---

## 21-5：建立 RESTful API

RESTful 原則：
- URL = 名詞（資源）
- HTTP 方法 = 動詞（動作）
- 常用狀態碼：200, 201, 204, 400, 404, 422, 500

---

## 21-6（Boss）：設計待辦事項 CRUD API

綜合運用：Schema 設計 + FastAPI 路由 + SQLite + 錯誤處理。
`

export default world21
