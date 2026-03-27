const world15_en = `
# 🐍 Python Basic Syntax and Conditional Statements

Welcome to the world of Python! This World will take you from zero to mastering Python's most fundamental syntax.

---

## 15-1: Variables and Data Types

### Four Basic Types

Python has four most commonly used basic types:

| Type | Description | Example |
|------|-------------|---------|
| \`int\` | Integer | \`42\`, \`-7\`, \`0\` |
| \`float\` | Floating-point number | \`3.14\`, \`-0.5\`, \`1.0\` |
| \`str\` | String | \`"hello"\`, \`'world'\` |
| \`bool\` | Boolean | \`True\`, \`False\` |

### Variable Assignment

Python doesn't require type declarations — just assign directly:

\`\`\`python
name = "Alice"      # str
age = 25            # int
height = 1.68       # float
is_student = True   # bool
\`\`\`

### type() — Check the Type

\`\`\`python
print(type(42))        # <class 'int'>
print(type("hello"))   # <class 'str'>
print(type(True))      # <class 'bool'>
\`\`\`

### Naming Rules

- Can only use letters, digits, and underscores
- Cannot start with a digit
- Cannot be a reserved keyword (if, for, class, etc.)
- **Convention: use snake_case** (lowercase with underscores)

\`\`\`python
# ✅ Good naming
total_amount = 100
user_name = "Alice"

# ❌ Invalid
2nd_place = "Bob"   # Starts with a digit
my-score = 90       # Hyphen not allowed
class = "A"         # Reserved keyword
\`\`\`

---

## 15-2: Input/Output and String Formatting

### print() — Output

\`\`\`python
print("Hello, World!")
print("Name:", name, "Age:", age)   # Multiple values separated by commas
\`\`\`

### input() — Input

**Key point: input() always returns a str!**

\`\`\`python
name = input("Your name: ")             # Returns str
age = int(input("Your age: "))          # Use int() to convert
price = float(input("Price: "))         # Or float()
\`\`\`

### f-string Formatting (Python 3.6+)

\`\`\`python
name = "Alice"
age = 25
print(f"{name} is {age} years old")  # Alice is 25 years old
print(f"Next year {age + 1}")        # Expressions allowed inside braces
print(f"{'Python':>10}")             # Right-aligned, 10 characters wide
print(f"{3.14159:.2f}")              # Two decimal places → 3.14
\`\`\`

---

## 15-3: Operators and Expressions

### Arithmetic Operators

| Operator | Description | Example |
|----------|-------------|---------|
| \`+\` | Addition | \`3 + 2 → 5\` |
| \`-\` | Subtraction | \`3 - 2 → 1\` |
| \`*\` | Multiplication | \`3 * 2 → 6\` |
| \`/\` | Division (returns float) | \`7 / 2 → 3.5\` |
| \`//\` | Floor division | \`7 // 2 → 3\` |
| \`%\` | Modulo | \`7 % 2 → 1\` |
| \`**\` | Exponentiation | \`2 ** 3 → 8\` |

### Comparison Operators

\`==\`, \`!=\`, \`>\`, \`<\`, \`>=\`, \`<=\`

**Note the difference between == and is:**
- \`==\` compares values (equality)
- \`is\` compares identity / memory address (identity)
- Convention: use \`is\` when comparing with None, use \`==\` for everything else

### Logical Operators

\`and\`, \`or\`, \`not\`

\`\`\`python
x = 5
print(x > 0 and x < 10)   # True (both must be True)
print(x > 0 or x > 100)   # True (only one needs to be True)
print(not (x > 0))         # False (negation)
\`\`\`

---

## 15-4: Conditional Statements if/elif/else

### Basic Structure

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

print(f"Grade: {grade}")  # Grade: B
\`\`\`

**Note: The order of elif matters!** Start with the strictest condition.

### Nesting vs Guard Clause

\`\`\`python
# ❌ Too deeply nested
if user:
    if user.is_active:
        if user.has_permission:
            do_action()

# ✅ Guard Clause (early return)
if not user: return
if not user.is_active: return
if not user.has_permission: return
do_action()
\`\`\`

---

## 15-5: Advanced Conditional Statements

### Truthy and Falsy

In Python, these values are considered **False** (Falsy) in if conditions:

\`None\`, \`False\`, \`0\`, \`0.0\`, \`""\`, \`[]\`, \`{}\`, \`set()\`

All other values are **Truthy**.

\`\`\`python
# Pythonic style
if my_list:          # Better than if len(my_list) > 0
    process(my_list)

if name:             # Better than if name != ""
    greet(name)
\`\`\`

### Short-circuit Evaluation

\`\`\`python
# and: if left is Falsy → returns left, right side not evaluated
result = None and expensive_function()  # result = None

# or: if left is Truthy → returns left, right side not evaluated
name = user_input or "Anonymous"  # If user_input is empty, use default
\`\`\`

### Ternary Expression

\`\`\`python
status = "Adult" if age >= 18 else "Minor"
\`\`\`

---

## 15-6 (Boss): Simple Calculator

Combine all the concepts above to build a four-operation calculator:
- \`input()\` to get user input
- \`float()\` for type conversion
- \`if/elif/else\` to determine the operator
- \`try/except\` for error handling
- \`f-string\` for formatted output
`;

export default world15_en;
