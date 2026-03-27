const world20_en = `
# 🤖 APIs and Automation Scripts

Learn to call APIs and write automation scripts with Python.

---

## 20-1: JSON and API Concepts

- REST APIs use HTTP methods to operate on resources
- GET (read), POST (create), PUT (update), DELETE (delete)
- Status codes: 2xx success, 4xx client error, 5xx server error

---

## 20-2: requests GET

\`\`\`python
import requests

resp = requests.get("https://api.example.com/data", params={"page": 1})
if resp.status_code == 200:
    data = resp.json()
\`\`\`

---

## 20-3: POST and Authentication

\`\`\`python
import os

headers = {"Authorization": f"Bearer {os.environ['API_KEY']}"}
resp = requests.post(url, json={"name": "Alice"}, headers=headers)
\`\`\`

---

## 20-4: Batch Processing Scripts

\`\`\`python
from glob import glob
import pandas as pd

files = glob("data/*.csv")
dfs = [pd.read_csv(f) for f in files]
combined = pd.concat(dfs, ignore_index=True)
\`\`\`

---

## 20-5: Automated Report Generation

\`\`\`python
with pd.ExcelWriter("report.xlsx") as writer:
    summary.to_excel(writer, sheet_name="Summary")
    details.to_excel(writer, sheet_name="Details")
\`\`\`

---

## 20-6 (Boss): Design an API Data Collection Script

Combine all concepts: pagination handling, rate limiting, error handling, and logging.
`;

export default world20_en;
