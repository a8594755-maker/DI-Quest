const world21_en = `
# 🗄️ Databases and Backend Basics

Use Python to connect to databases and build APIs — level up from scripts to services.

---

## 21-1: Python + SQLite

\`\`\`python
import sqlite3

conn = sqlite3.connect("mydb.db")
cursor = conn.cursor()

# Parameterized query (prevents SQL injection)
cursor.execute("SELECT * FROM users WHERE name = ?", (name,))
rows = cursor.fetchall()

conn.close()
\`\`\`

---

## 21-2: CRUD Operations

| Operation | SQL | HTTP |
|-----------|-----|------|
| Create | INSERT | POST |
| Read | SELECT | GET |
| Update | UPDATE | PUT |
| Delete | DELETE | DELETE |

Key point: Always call \`conn.commit()\` after write operations.

---

## 21-3: ORM Concepts

ORM maps database tables to Python classes:
- More intuitive code
- Automatic SQL injection prevention
- Use ORM for simple CRUD, raw SQL for complex queries

---

## 21-4: Flask/FastAPI Introduction

\`\`\`python
from fastapi import FastAPI

app = FastAPI()

@app.get("/users/{user_id}")
def get_user(user_id: int):
    return {"user_id": user_id}

@app.post("/users", status_code=201)
def create_user(user: UserCreate):
    # User creation logic
    return {"id": new_id, **user.dict()}
\`\`\`

---

## 21-5: Building a RESTful API

RESTful principles:
- URL = noun (resource)
- HTTP method = verb (action)
- Common status codes: 200, 201, 204, 400, 404, 422, 500

---

## 21-6 (Boss): Design a To-Do CRUD API

Combine all concepts: Schema design + FastAPI routing + SQLite + error handling.
`;

export default world21_en;
