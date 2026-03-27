const world17_en = `
# ⚙️ Functions and Error Handling

Functions are the basic unit of code reuse, and error handling makes your programs more robust.

---

## 17-1: Function Basics — def

### Defining and Calling

\`\`\`python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")  # "Hello, Alice!"
\`\`\`

### return vs print

- **return**: Passes a value back to the caller, can be stored in a variable
- **print**: Outputs to the screen, returns None

\`\`\`python
def add_return(a, b):
    return a + b          # Caller receives 8

def add_print(a, b):
    print(a + b)          # Prints 8, but caller receives None
\`\`\`

---

## 17-2: Advanced Parameters

### Default Parameter Values

\`\`\`python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("Alice")          # "Hello, Alice!"
greet("Alice", "Hi")    # "Hi, Alice!"
\`\`\`

### *args and **kwargs

\`\`\`python
def log(message, *args, **kwargs):
    print(f"[LOG] {message}")
    print(f"  args: {args}")       # tuple
    print(f"  kwargs: {kwargs}")   # dict

log("error", 1, 2, level="high")
\`\`\`

---

## 17-3: Scope and Built-in Functions

### The LEGB Rule

Python looks up variables in this order: Local → Enclosing → Global → Built-in

\`\`\`python
x = 10              # Global
def foo():
    x = 20          # Local
    print(x)        # 20
foo()
print(x)            # 10 (Global unchanged)
\`\`\`

### Common Built-in Functions

| Function | Description | Example |
|----------|-------------|---------|
| \`sorted()\` | Sort (returns new list) | \`sorted([3,1,2]) → [1,2,3]\` |
| \`sum()\` | Sum | \`sum([1,2,3]) → 6\` |
| \`min()/max()\` | Minimum/Maximum | \`max([3,1,2]) → 3\` |
| \`zip()\` | Pair up | \`list(zip([1,2], ["a","b"]))\` |
| \`map()\` | Map | \`list(map(str, [1,2]))\` |
| \`filter()\` | Filter | \`list(filter(lambda x: x>2, [1,2,3]))\` |

---

## 17-4: Error Types and Debugging

### Common Errors

| Error | Cause |
|-------|-------|
| \`SyntaxError\` | Syntax error (missing colon, quotes) |
| \`TypeError\` | Type mismatch |
| \`NameError\` | Variable not defined |
| \`ValueError\` | Invalid value |
| \`KeyError\` | Dict key doesn't exist |
| \`IndexError\` | Index out of range |

### Reading a Traceback

Look at the last line first (error type), then check the bottom-most line number (error location).

---

## 17-5: try/except and Defensive Programming

\`\`\`python
try:
    num = int(input("Number: "))
except ValueError:
    print("Please enter a valid number")
else:
    print(f"Success: {num}")
finally:
    print("Done")
\`\`\`

### Best Practices

1. Only catch exceptions you know how to handle
2. Never use bare except
3. Keep the try block as small as possible
4. Use raise to re-raise exceptions upward

---

## 17-6 (Boss): Data Validation Function Suite

Combine function design, parameters, return values, try/except, and raise.
`;

export default world17_en;
