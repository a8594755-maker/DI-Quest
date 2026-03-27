const world18_en = `
# 📦 Modules, Files, and Object-Oriented Programming

Learn to organize code (modules), handle external data (files), and create your own data types with classes.

---

## 18-1: import and the Standard Library

### Three Ways to Import

\`\`\`python
import datetime                    # Import the entire module
from datetime import datetime      # Import a specific name only
import datetime as dt              # Alias
\`\`\`

### Common Standard Library Modules

| Module | Purpose |
|--------|---------|
| \`os\` | Operating system operations |
| \`datetime\` | Date and time |
| \`json\` | JSON processing |
| \`csv\` | CSV files |
| \`random\` | Random numbers |
| \`pathlib\` | Path operations |

---

## 18-2: pip and Third-Party Packages

\`\`\`bash
pip install requests              # Install
pip freeze > requirements.txt     # Export dependencies
pip install -r requirements.txt   # Install from list
python -m venv .venv              # Create virtual environment
\`\`\`

---

## 18-3: File I/O — txt/csv

\`\`\`python
# Read a text file (recommended to use with)
with open("data.txt", "r", encoding="utf-8") as f:
    content = f.read()

# Read CSV (each row is a dict)
import csv
with open("data.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"])
\`\`\`

---

## 18-4: JSON Read/Write

Four core functions:
- \`json.load(f)\` — File → Python
- \`json.loads(s)\` — String → Python
- \`json.dump(obj, f)\` — Python → File
- \`json.dumps(obj)\` — Python → String

\`\`\`python
import json

with open("config.json") as f:
    config = json.load(f)

# Safe nested access
host = config.get("database", {}).get("host", "localhost")
\`\`\`

---

## 18-5: OOP Basics — class

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

### Key Points

- \`__init__\` is the constructor
- \`self\` is a reference to the instance itself
- The first parameter of a method is always self
- \`__str__\` defines the output of print()

---

## 18-6 (Boss): Config Reader Class

Combine class, file I/O, JSON, nested dict operations, and error handling.
`;

export default world18_en;
