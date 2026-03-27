const world16_en = `
# 🔄 Loops and Data Structures

Learn to use loops for repeated execution, and get to know Python's five most important data structures.

---

## 16-1: for Loops and range()

### Basic for Loop

\`\`\`python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
\`\`\`

### range() — Three Parameters

\`range(start, stop, step)\` — stop is excluded!

\`\`\`python
range(5)        # 0, 1, 2, 3, 4
range(2, 6)     # 2, 3, 4, 5
range(0, 10, 2) # 0, 2, 4, 6, 8
range(10, 0, -1)# 10, 9, 8, ..., 1 (countdown)
\`\`\`

### enumerate() — Get Index and Value Simultaneously

\`\`\`python
# ❌ Not Pythonic
for i in range(len(fruits)):
    print(i, fruits[i])

# ✅ Pythonic
for i, fruit in enumerate(fruits):
    print(i, fruit)

# You can specify a starting index
for i, fruit in enumerate(fruits, start=1):
    print(i, fruit)  # Starts from 1
\`\`\`

---

## 16-2: while Loops and Flow Control

### while Loop

\`\`\`python
count = 0
while count < 5:
    print(count)
    count += 1
\`\`\`

### Choosing for vs while

- **for**: Known number of iterations or known collection → \`for item in collection\`
- **while**: Condition-driven, unknown number of iterations → \`while condition\`

### break and continue

\`\`\`python
# break — immediately exit the loop
for i in range(100):
    if i == 5:
        break       # Only runs up to 4
    print(i)

# continue — skip this iteration, continue to next
for i in range(10):
    if i % 2 == 0:
        continue    # Skip even numbers
    print(i)        # Only prints odd numbers
\`\`\`

### while True + break Pattern

\`\`\`python
while True:
    cmd = input("Command (quit to exit): ")
    if cmd == "quit":
        break
    print(f"You entered: {cmd}")
\`\`\`

---

## 16-3: String Operations

### Indexing and Slicing

\`\`\`python
s = "Hello, World!"
s[0]      # 'H' (first character)
s[-1]     # '!' (last character)
s[7:12]   # 'World' (slicing)
s[:5]     # 'Hello' (from start to index 5, exclusive)
s[7:]     # 'World!' (from index 7 to end)
s[::-1]   # '!dlroW ,olleH' (reversed)
\`\`\`

### Common String Methods

| Method | Description | Example |
|--------|-------------|---------|
| \`.strip()\` | Remove leading/trailing whitespace | \`"  hi  ".strip() → "hi"\` |
| \`.lower()\` / \`.upper()\` | Case conversion | \`"Hi".lower() → "hi"\` |
| \`.split()\` | Split | \`"a,b,c".split(",") → ["a","b","c"]\` |
| \`.join()\` | Join | \`",".join(["a","b"]) → "a,b"\` |
| \`.replace()\` | Replace | \`"hi".replace("hi","hello")\` |
| \`.startswith()\` | Prefix check | \`"hello".startswith("he") → True\` |
| \`.find()\` | Find position | \`"hello".find("ll") → 2\` |

**Strings are immutable** — all methods return a new string.

---

## 16-4: List and Tuple

### List — Mutable Ordered Collection

\`\`\`python
# Create
nums = [1, 2, 3, 4, 5]

# Add
nums.append(6)          # Append to end → [1,2,3,4,5,6]
nums.insert(0, 0)       # Insert at specific position

# Remove
nums.pop()              # Remove last element
nums.remove(3)          # Remove first occurrence of value 3

# Sort
nums.sort()             # In-place sort (modifies original list)
sorted_nums = sorted(nums)  # Returns new list (original unchanged)

# Slicing
nums[1:3]               # Get elements at index 1 and 2
nums[::2]               # Get every other element
\`\`\`

### Tuple — Immutable Ordered Collection

\`\`\`python
point = (3, 4)          # Coordinates
rgb = (255, 128, 0)     # Color

# Unpacking
x, y = point            # x=3, y=4
name, age, city = ("Alice", 25, "Taipei")
\`\`\`

### When to Use Tuple vs List

- **Tuple**: Fixed structure, won't be modified (coordinates, config values, multiple return values)
- **List**: Dynamic collection where elements are added/removed (shopping cart, to-do list)

---

## 16-5: Dict and Set

### Dict — Key-Value Pairs

\`\`\`python
user = {"name": "Alice", "age": 25, "city": "Taipei"}

# Access
user["name"]               # "Alice"
user.get("email", "N/A")   # Safe access, returns default if key doesn't exist

# Add/Update
user["email"] = "alice@example.com"

# Iterate
for key, value in user.items():
    print(f"{key}: {value}")

# Common methods
user.keys()     # dict_keys(["name", "age", "city"])
user.values()   # dict_values(["Alice", 25, "Taipei"])
user.items()    # dict_items([("name","Alice"), ...])
\`\`\`

### Set — Unordered Collection of Unique Elements

\`\`\`python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

a & b    # {3, 4} — Intersection
a | b    # {1,2,3,4,5,6} — Union
a - b    # {1, 2} — Difference
a ^ b    # {1,2,5,6} — Symmetric difference

# Deduplication
names = ["Alice", "Bob", "Alice", "Charlie", "Bob"]
unique = list(set(names))  # ["Alice", "Bob", "Charlie"]
\`\`\`

---

## 16-6 (Boss): Data Cleaning Script

Combine all concepts:
- \`for\` loop to iterate over a list of dicts
- String methods (\`.strip()\`, \`.lower()\`) for data cleaning
- \`dict.get()\` for safe accumulation of statistics
- \`max()\` to find the maximum value
- Conditional statements to filter invalid data
`;

export default world16_en;
