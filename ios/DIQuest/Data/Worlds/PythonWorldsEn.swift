import Foundation

enum PythonWorldsEn {
    static let worlds: [World] = [
        World(
            id: 15,
            name: "Python Basic Syntax & Conditionals",
            emoji: "🐍",
            description: "Variables, data types, operators, and if/elif/else conditional statements",
            quests: [
                Quest(
                    id: "15-1",
                    name: "Variables & Data Types",
                    description: "Learn the building blocks of Python: int, float, str, bool",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Data Types",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is a correct type identification?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Understanding Python Types",
                                narrative: "You just started learning Python. You open the Python interactive shell and enter a few values. You need to determine their types.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "type(3.14) returns int", explanation: "3.14 has a decimal point, so it is a float, not an int."),
                                Challenge.Option(id: "B", text: "type(\"123\") returns str", explanation: "Correct! Anything enclosed in quotes is a string (str), even if the content looks like a number."),
                                Challenge.Option(id: "C", text: "type(True) returns str", explanation: "True is a boolean (bool), not a string."),
                                Challenge.Option(id: "D", text: "type(None) returns int", explanation: "None is NoneType, representing \"no value\" — it is not an integer."),
                            ],
                            correctAnswer: "B",
                            hints: ["Any value enclosed in quotes is a string, regardless of its content"],
                            explanation: "Python has four basic types: int (integer), float (floating-point number), str (string), bool (boolean). Use type() to check the type of any value.",
                            frameworkTip: "Remember: quotes = string, decimal point = float, True/False = bool, whole number = int."
                        ),
                        Challenge(
                            id: 2,
                            name: "Variable Naming Rules",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is a valid Python variable name?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Valid Variable Names",
                                narrative: "You want to name a variable for a calculation result, but Python has naming rules.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "2nd_place", explanation: "Cannot start with a digit."),
                                Challenge.Option(id: "B", text: "my-score", explanation: "Cannot use hyphens (-). Python will interpret it as subtraction."),
                                Challenge.Option(id: "C", text: "total_amount", explanation: "Correct! Underscore-separated naming (snake_case) is the Python naming convention."),
                                Challenge.Option(id: "D", text: "class", explanation: "class is a Python reserved keyword and cannot be used as a variable name."),
                            ],
                            correctAnswer: "C",
                            hints: ["Python variable names can only contain letters, digits, and underscores, and cannot start with a digit"],
                            explanation: "Python variable naming rules: (1) Only letters, digits, and underscores (2) Cannot start with a digit (3) Cannot be a reserved keyword. Convention is snake_case (lowercase with underscores).",
                            frameworkTip: "Python naming conventions: variables and functions use snake_case, classes use PascalCase."
                        ),
                        Challenge(
                            id: 3,
                            name: "Type Conversion",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What happens when you execute \"42\" + 8?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Type Conversion Pitfalls",
                                narrative: "You received a string \"42\" from user input and need to perform arithmetic.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Returns 50", explanation: "Python does not automatically convert strings to numbers for arithmetic."),
                                Challenge.Option(id: "B", text: "Returns \"428\"", explanation: "Python cannot use + to concatenate a string and an integer — it will raise an error."),
                                Challenge.Option(id: "C", text: "TypeError: cannot add str and int", explanation: "Correct! Python is a strongly-typed language. Different types cannot be directly combined — you need to convert first using int() or str()."),
                                Challenge.Option(id: "D", text: "Returns \"50\"", explanation: "Python does not automatically convert types."),
                            ],
                            correctAnswer: "C",
                            hints: ["Python will not auto-convert types for you — string + integer raises an error"],
                            explanation: "Python is strongly typed: str + int raises TypeError. Solutions: int(\"42\") + 8 = 50 or \"42\" + str(8) = \"428\".",
                            frameworkTip: "When handling user input, always remember that input() returns a str. You must convert before doing arithmetic."
                        ),
                        Challenge(
                            id: 4,
                            name: "Variable Operations & Type Conversion",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function calc_revenue(price_str, qty_str) that converts strings to numbers, calculates total revenue, and returns a formatted string like \"Total: $1500.00\". If the input cannot be converted, return \"Invalid input\".",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Data Processing",
                                narrative: "You received sales data, but all values are in string format. You need to write a function to convert and calculate.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use try/except to handle conversion failures", "Use f-string with :.2f to format decimal places"],
                            explanation: "This exercise integrates type conversion (str to float/int), error handling (try/except), and f-string formatting (:.2f). In practice, type conversion and validation are essential steps when processing external data.",
                            frameworkTip: "Three steps of data processing: convert types, calculate, format output. Each step can fail, so add safeguards.",
                            starterCode: """
                                def calc_revenue(price_str, qty_str):
                                    # Convert strings to numbers, calculate price * qty
                                    # Return formatted string "Total: $XXX.XX"
                                    # Return "Invalid input" if conversion fails
                                    pass
                            """,
                            expectedQuery: """
                                def calc_revenue(price_str, qty_str):
                                    try:
                                        price = float(price_str)
                                        qty = int(qty_str)
                                        total = price * qty
                                        return f"Total: ${total:.2f}"
                                    except (ValueError, TypeError):
                                        return "Invalid input"
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "isinstance vs type",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nclass MyInt(int):\n    pass\n\nx = MyInt(42)\nprint(type(x) == int)\nprint(isinstance(x, int))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Right Way to Check Types",
                                narrative: "During a code review, you see a colleague using type(x) == int to check types, but a senior engineer says this is wrong. You need to understand why.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "True, True", explanation: "type(x) returns MyInt, not int, so the first one is False."),
                                Challenge.Option(id: "B", text: "False, True", explanation: "Correct! type() does strict comparison without considering inheritance; isinstance() checks the inheritance chain, and MyInt inherits from int so it returns True."),
                                Challenge.Option(id: "C", text: "True, False", explanation: "isinstance checks \"is it this type or a subclass of it\"."),
                                Challenge.Option(id: "D", text: "False, False", explanation: "MyInt inherits from int, so isinstance returns True."),
                            ],
                            correctAnswer: "B",
                            hints: ["type() only checks exact type, isinstance() considers inheritance", "MyInt is a subclass of int"],
                            explanation: "type(x) == int is True only when x is \"exactly\" int. isinstance(x, int) walks the MRO chain (MyInt → int → object), so it returns True. In practice, you should almost always use isinstance().",
                            frameworkTip: "In interviews, saying \"use isinstance instead of type comparison\" shows you understand Python's inheritance model. This is a common Google interview question."
                        ),
                        Challenge(
                            id: 6,
                            name: "Mutable Default Argument Trap",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "After running this code, what is the value of result?\n\n```python\ndef append_to(item, lst=[]):\n    lst.append(item)\n    return lst\n\nresult1 = append_to(1)\nresult2 = append_to(2)\nresult = result2\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python's Most Famous Gotcha",
                                narrative: "An interviewer shows you a piece of code and asks what the output is. This is one of the most famous trap questions in Python interviews.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[2]", explanation: "The default list is created only once when the function is defined, and subsequent calls share the same list."),
                                Challenge.Option(id: "B", text: "[1, 2]", explanation: "Correct! Python's default arguments are created when the function is defined, and only once. Subsequent calls without passing lst operate on the same list object."),
                                Challenge.Option(id: "C", text: "[1]", explanation: "The second call append_to(2) also operates on the same list."),
                                Challenge.Option(id: "D", text: "TypeError", explanation: "This code is syntactically correct and will not raise an error."),
                            ],
                            correctAnswer: "B",
                            hints: ["Python default arguments are evaluated only once at function definition time", "Mutable objects (list, dict) as defaults are shared across calls"],
                            explanation: "This is Python's most famous gotcha: mutable default argument. The fix is to use None as default:\n\ndef append_to(item, lst=None):\n    if lst is None:\n        lst = []\n    lst.append(item)\n    return lst",
                            frameworkTip: "When asked about Python \"gotchas\" or \"common mistakes\" in interviews, this is almost always expected. Remember: never use mutable objects (list, dict, set) as function default values."
                        ),
                    ]
                ),
                Quest(
                    id: "15-2",
                    name: "Input/Output & String Formatting",
                    description: "Learn to use print, input, and f-strings",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "print & f-string",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which approach is most Pythonic?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Formatted Output",
                                narrative: "You have two variables name = \"Alice\" and age = 25, and want to print \"Alice is 25 years old\".",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "print(\"Alice\" + \" is \" + \"25\" + \" years old\")", explanation: "This works but hardcodes the values instead of using variables."),
                                Challenge.Option(id: "B", text: "print(f\"{name} is {age} years old\")", explanation: "Correct! f-strings (Python 3.6+) are the most concise and intuitive formatting method."),
                                Challenge.Option(id: "C", text: "print(name + \" is \" + age + \" years old\")", explanation: "age is an int and cannot be directly concatenated with str using + — this raises TypeError."),
                                Challenge.Option(id: "D", text: "print(\"%s is %d years old\" % (name, age))", explanation: "This works but uses old-style %-formatting. f-strings are now recommended."),
                            ],
                            correctAnswer: "B",
                            hints: ["f-strings start with f\"...\", and variable names go inside curly braces {}"],
                            explanation: "f-strings are the recommended string formatting method in Python 3.6+: f\"{variable}\" directly embeds values for the best readability.",
                            frameworkTip: "String formatting evolution: % → .format() → f-string. Always use f-strings for new code."
                        ),
                        Challenge(
                            id: 2,
                            name: "Return Type of input()",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the value of age?",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Input",
                                narrative: "You wrote age = input(\"How old are you?\"), and the user entered 25.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Integer 25", explanation: "input() always returns a string — it does not auto-convert."),
                                Challenge.Option(id: "B", text: "String \"25\"", explanation: "Correct! input() always returns str, even if the user enters something that looks like a number."),
                                Challenge.Option(id: "C", text: "Float 25.0", explanation: "input() does not return float."),
                                Challenge.Option(id: "D", text: "None", explanation: "input() waits for user input and returns that value (as a string)."),
                            ],
                            correctAnswer: "B",
                            hints: ["The return value of input() is always a string"],
                            explanation: "input() always returns str. To do arithmetic, remember to convert: age = int(input(\"How old are you?\"))",
                            frameworkTip: "Safe input handling pattern: get → convert → validate → use."
                        ),
                        Challenge(
                            id: 3,
                            name: "Formatting a Sales Report",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function format_report(name, sales, target) that returns a formatted string including: name, sales amount (with thousands separator), achievement rate (percentage with one decimal), and rating (>= 100% is \"Exceeded\", >= 80% is \"On Track\", otherwise \"Needs Improvement\"). Example output:\n\"Report: Alice | Sales: $12,500 | Achievement: 125.0% | Rating: Exceeded\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Summary Generation",
                                narrative: "You are a product analyst and need to automatically generate a performance summary for each salesperson. Your manager requires a fixed-format text report.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["f-string :, adds thousands separator", "Achievement = sales / target * 100", "Use if/elif/else to determine the rating"],
                            explanation: "This exercise practices advanced f-string formatting: :, for thousands separator, :.1f for one decimal place, and embedding variables in f-strings. Automatically generating reports is a common practical requirement.",
                            frameworkTip: "f-string formatting cheat sheet: {x:,} thousands, {x:.2f} two decimals, {x:.1%} percentage.",
                            starterCode: """
                                def format_report(name, sales, target):
                                    # Calculate achievement = sales / target * 100
                                    # Determine rating based on achievement
                                    # Return formatted string
                                    pass
                            """,
                            expectedQuery: """
                                def format_report(name, sales, target):
                                    achievement = sales / target * 100
                                    if achievement >= 100:
                                        rating = "Exceeded"
                                    elif achievement >= 80:
                                        rating = "On Track"
                                    else:
                                        rating = "Needs Improvement"
                                    return f"Report: {name} | Sales: ${sales:,} | Achievement: {achievement:.1f}% | Rating: {rating}"
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Advanced f-string Formatting",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function format_report(name, revenue, growth) that returns a formatted string. name is left-aligned in 15 chars, revenue is right-aligned in 12 chars with thousands separators, growth is shown as percentage (1 decimal).\n\nExample: format_report(\"January\", 1234567.89, 0.156) → \"January         $1,234,567.89  +15.6%\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Financial Report Formatting",
                                narrative: "You're on the finance team at a startup and need to produce a neatly formatted monthly revenue report. Numbers need thousands separators, alignment, and percentages need one decimal place.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["f-string format: {value:<15} left-align 15 chars", "{value:>12,.2f} right-align 12 chars + thousands + 2 decimals", "{value:.1%} auto-multiplies by 100 and adds %"],
                            explanation: "f-string formatting syntax:\n- :<15 left-align, :>12 right-align\n- , thousands separator\n- .2f two decimal places\n- .1% auto ×100 with one decimal percentage\nVery useful for report generation and aligned output.",
                            frameworkTip: "Showing advanced f-string formatting (alignment, thousands, percentages) in interviews demonstrates you know more than basic syntax and can produce professional output.",
                            starterCode: """
                                def format_report(name, revenue, growth):
                                    # name: left-align 15 chars
                                    # revenue: right-align 12 chars, thousands comma, 2 decimals
                                    # growth: percentage, 1 decimal, + sign for positive
                                    pass
                            """,
                            expectedQuery: """
                                def format_report(name, revenue, growth):
                                    sign = "+" if growth >= 0 else ""
                                    return f"{name:<15} ${revenue:>12,.2f}  {sign}{growth:.1%}"
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "print Advanced Parameters",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the output of this code?\n\n```python\nprint(\"A\", \"B\", \"C\", sep=\" -> \", end=\" !\\n\")\nprint(\"D\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Hidden Features of print",
                                narrative: "You need to print multiple values on one line with a specific separator and no automatic newline.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A B C !\nD", explanation: "sep replaces the default space separator."),
                                Challenge.Option(id: "B", text: "A -> B -> C !\nD", explanation: "Correct! sep sets the separator between values (default: space), end sets the ending character (default: \\n)."),
                                Challenge.Option(id: "C", text: "A -> B -> C\n !\nD", explanation: "! does not print on a new line, end is appended directly after the last value."),
                                Challenge.Option(id: "D", text: "ABC -> !\nD", explanation: "sep is placed \"between\" multiple values, not at the end."),
                            ],
                            correctAnswer: "B",
                            hints: ["sep sets the separator between multiple arguments", "end sets the ending after printing (default is newline \\n)"],
                            explanation: "Two useful print() parameters: sep (separator between values, default: space) and end (ending after print, default: \\n newline).",
                            frameworkTip: "While print's sep/end parameters are rarely directly tested in interviews, knowing them helps with quick debugging and formatting, showing your mastery of Python built-in functions."
                        ),
                    ]
                ),
                Quest(
                    id: "15-3",
                    name: "Operators & Expressions",
                    description: "Arithmetic, comparison, logical operators, and precedence",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Integer Division & Remainder",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the result of 17 // 5?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Division Operators",
                                narrative: "Python has three division-related operators: /, //, %. You need to understand their differences.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "3.4", explanation: "3.4 is the result of 17 / 5 (regular division), not integer division."),
                                Challenge.Option(id: "B", text: "3", explanation: "Correct! // is integer division (floor division) — it keeps only the quotient and discards the remainder."),
                                Challenge.Option(id: "C", text: "2", explanation: "17 ÷ 5 = 3 remainder 2. The quotient is 3, not 2."),
                                Challenge.Option(id: "D", text: "4", explanation: "// floors down, it does not round."),
                            ],
                            correctAnswer: "B",
                            hints: ["// is \"floor division\" — it truncates the decimal part"],
                            explanation: "/ regular division (returns float), // integer division (floors down), % modulo (remainder). 17 / 5 = 3.4, 17 // 5 = 3, 17 % 5 = 2.",
                            frameworkTip: "Common combo: total // page_size for page count, total % page_size for remaining items on the last page."
                        ),
                        Challenge(
                            id: 2,
                            name: "Comparison Operators",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What are the results of a == b and a is b, respectively?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Difference Between == and is",
                                narrative: "You are comparing two variables: a = [1, 2, 3] and b = [1, 2, 3].",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Both True", explanation: "== compares values (equality), is compares identity (same object). Two separate lists have equal values but are not the same object."),
                                Challenge.Option(id: "B", text: "Both False", explanation: "a == b compares values — both lists have the same content, so it is True."),
                                Challenge.Option(id: "C", text: "a == b is True, a is b is False", explanation: "Correct! == compares values (same content → True), is compares memory address (two separate objects → False)."),
                                Challenge.Option(id: "D", text: "a == b is False, a is b is True", explanation: "Reversed. == compares values, is compares identity."),
                            ],
                            correctAnswer: "C",
                            hints: ["== compares \"whether values are equal\", is compares \"whether it is the same object\""],
                            explanation: "== compares values (equality), is compares identity. Usually use == to compare values. Only use is when comparing with None: if x is None.",
                            frameworkTip: "Rule of thumb: use == 99% of the time. The only common use of is: x is None."
                        ),
                        Challenge(
                            id: 3,
                            name: "Short-Circuit Evaluation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\na = \"\" or \"default\"\nb = \"hello\" or \"world\"\nc = 0 and \"yes\"\nd = 1 and \"yes\"\nprint(a, b, c, d)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Practical Short-Circuit Evaluation",
                                narrative: "You're reading Python code that uses or and and for default values. You need to understand short-circuit evaluation rules.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "default hello 0 yes", explanation: "Correct! or returns the first truthy value or the last value; and stops at the first falsy value and returns it, otherwise returns the last value."),
                                Challenge.Option(id: "B", text: "True True False True", explanation: "or and and don't return True/False, they return the actual values."),
                                Challenge.Option(id: "C", text: "default world 0 1", explanation: "or stops when it finds the first truthy value, so it won't continue to \"world\"."),
                                Challenge.Option(id: "D", text: "\"\" hello False yes", explanation: "or continues to the second value when the first is falsy."),
                            ],
                            correctAnswer: "A",
                            hints: ["or returns the first truthy value (not True/False)", "and stops at the first falsy value and returns it", "Empty string \"\" and 0 are both falsy"],
                            explanation: "Python short-circuit evaluation:\n- x or y: if x is truthy, returns x; otherwise returns y\n- x and y: if x is falsy, returns x; otherwise returns y\n\nCommon usage: name = user_input or \"Anonymous\" (providing defaults)",
                            frameworkTip: "Short-circuit evaluation is commonly used in practice, like config.get(\"key\") or default_value. Show you know this Pythonic pattern in interviews."
                        ),
                        Challenge(
                            id: 4,
                            name: "Integer Division & Modulo",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function format_time(seconds) that converts seconds to \"Xh Ym Zs\" format.\n\nExample: format_time(3661) → \"1h 1m 1s\"\nformat_time(90) → \"0h 1m 30s\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Time Conversion Tool",
                                narrative: "You're building a project management tool and need to convert seconds into \"X hours Y minutes Z seconds\" format.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["1 hour = 3600 seconds", "// is integer division, % is modulo", "Calculate hours first, then minutes from remaining seconds"],
                            explanation: "Integer division // and modulo % are fundamental tools for time conversion, base conversion, etc.\n- hours = seconds // 3600\n- minutes = (seconds % 3600) // 60\n- secs = seconds % 60",
                            frameworkTip: "Time conversion is a common basic problem in interviews and LeetCode. Remember the // and % combo: // gets quotient, % gets remainder.",
                            starterCode: """
                                def format_time(seconds):
                                    # Use // and % to decompose into hours, minutes, seconds
                                    pass
                            """,
                            expectedQuery: """
                                def format_time(seconds):
                                    h = seconds // 3600
                                    m = (seconds % 3600) // 60
                                    s = seconds % 60
                                    return f"{h}h {m}m {s}s"
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "15-4",
                    name: "Conditional Statements if/elif/else",
                    description: "Basic conditional branching and nested conditions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic if Structure",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which code block has the correct logic?",
                            scenario: 
                            Challenge.Scenario(
                                title: "if/elif/else",
                                narrative: "You need to assign a grade based on a score: >= 90 is A, >= 80 is B, >= 70 is C, otherwise F. score = 85.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "if score >= 70: grade = \"C\"\\nelif score >= 80: grade = \"B\"\\nelif score >= 90: grade = \"A\"", explanation: "Wrong order! 85 >= 70 is True, so it would immediately get C. elif conditions should go from strictest to most lenient."),
                                Challenge.Option(id: "B", text: "if score >= 90: grade = \"A\"\\nelif score >= 80: grade = \"B\"\\nelif score >= 70: grade = \"C\"\\nelse: grade = \"F\"", explanation: "Correct! Start with the strictest condition. 85 is not >= 90, then checks >= 80 → True → B."),
                                Challenge.Option(id: "C", text: "if score >= 90: grade = \"A\"\\nif score >= 80: grade = \"B\"\\nif score >= 70: grade = \"C\"", explanation: "Uses three independent if statements instead of elif. 85 satisfies both >= 80 and >= 70, ending up with C instead of B."),
                                Challenge.Option(id: "D", text: "if score == 90: grade = \"A\"\\nelif score == 80: grade = \"B\"", explanation: "== only matches exact values. 85 does not equal any of them, missing most cases."),
                            ],
                            correctAnswer: "B",
                            hints: ["elif order matters: check the strictest condition first", "Note if vs elif: multiple if statements are independent checks, elif creates mutually exclusive branches"],
                            explanation: "if/elif/else creates mutually exclusive branches — only the first True branch executes. Order from strictest to most lenient, otherwise lenient conditions will intercept first.",
                            frameworkTip: "elif pitfall: order matters! Always start with the strictest condition."
                        ),
                        Challenge(
                            id: 3,
                            name: "Customer Classification Function",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function classify_customer(total_spent, days_registered) that returns the customer tier based on these rules:\n- \"VIP\": spent >= 50000 AND registered >= 365 days\n- \"Gold\": spent >= 20000 OR registered >= 730 days\n- \"Silver\": spent >= 5000\n- \"Bronze\": all others\nNote: VIP condition uses and, Gold condition uses or.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Tier System",
                                narrative: "An e-commerce company needs to automatically classify customers based on their spending and registration days to determine discounts and service levels.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["VIP requires both conditions to be met (and)", "Gold only requires one condition to be met (or)", "elif order goes from strictest to most lenient"],
                            explanation: "This exercise practices if/elif/else with and/or. The key is that VIP uses and (both conditions must be met), while Gold uses or (either condition suffices). The elif order is also important: check the strictest VIP condition first.",
                            frameworkTip: "Conditional logic design: list all tiers and conditions, verify mutual exclusivity, then arrange from strictest to most lenient.",
                            starterCode: """
                                def classify_customer(total_spent, days_registered):
                                    # Classify based on spending and registration days
                                    # VIP: spent >= 50000 AND days >= 365
                                    # Gold: spent >= 20000 OR days >= 730
                                    # Silver: spent >= 5000
                                    # Bronze: all others
                                    pass
                            """,
                            expectedQuery: """
                                def classify_customer(total_spent, days_registered):
                                    if total_spent >= 50000 and days_registered >= 365:
                                        return "VIP"
                                    elif total_spent >= 20000 or days_registered >= 730:
                                        return "Gold"
                                    elif total_spent >= 5000:
                                        return "Silver"
                                    else:
                                        return "Bronze"
                            """
                        ),
                        Challenge(
                            id: 2,
                            name: "Nested Conditions vs Flat Structure",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which approach is generally recommended?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Code Readability",
                                narrative: "The following two code blocks do the same thing but are written differently:\n\nApproach A (nested):\nif user:\n  if user.is_active:\n    if user.has_permission:\n      do_action()\n\nApproach B (Guard Clause):\nif not user: return\nif not user.is_active: return\nif not user.has_permission: return\ndo_action()",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Approach A — nested if is clearer in logic", explanation: "Deeper nesting makes code harder to read. Beyond 2-3 levels, it becomes very difficult to follow."),
                                Challenge.Option(id: "B", text: "Approach B — Guard Clauses reduce nesting and improve readability", explanation: "Correct! Guard Clauses (early returns) reduce nesting levels, keeping the main logic at the lowest indentation level."),
                                Challenge.Option(id: "C", text: "Both are equally good", explanation: "Functionally identical, but readability differs greatly. Flat structures are usually easier to maintain."),
                                Challenge.Option(id: "D", text: "Neither — should use try/except", explanation: "This is not an error handling scenario — it is conditional checking."),
                            ],
                            correctAnswer: "B",
                            hints: ["The Zen of Python: Flat is better than nested"],
                            explanation: "Guard Clause is a design pattern: eliminate invalid cases at the beginning of a function, keeping the main logic at the lowest indentation level. This is the recommended style in the Python community.",
                            frameworkTip: "Zen of Python: Flat is better than nested. Minimize nesting levels whenever possible."
                        ),
                        Challenge(
                            id: 3,
                            name: "FizzBuzz",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function fizzbuzz(n) that returns a list:\n- If divisible by both 3 and 5, put \"FizzBuzz\"\n- If only divisible by 3, put \"Fizz\"\n- If only divisible by 5, put \"Buzz\"\n- Otherwise put the number itself (as string)\n\nExample: fizzbuzz(5) → [\"1\", \"2\", \"Fizz\", \"4\", \"Buzz\"]",
                            scenario: 
                            Challenge.Scenario(
                                title: "FizzBuzz — The Most Classic Interview Question",
                                narrative: "This is the most classic entry-level interview question. Google, Meta, and Amazon have all used it to screen candidates. The rules are simple, but it tests your understanding of condition ordering.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Check \"divisible by both 3 and 5\" first, because checking 3 alone first would prevent reaching FizzBuzz", "Use % modulo, equals 0 means divisible", "Numbers need to be converted to string with str(i)"],
                            explanation: "FizzBuzz seems simple, but the key is: condition order matters! You must check 3 AND 5 first, then individual 3 or 5. If reversed, 15 would be classified as \"Fizz\" instead of \"FizzBuzz\".",
                            frameworkTip: "In FizzBuzz interviews, first explain your condition ordering logic (strictest condition first), then write code. This shows you think about edge cases.",
                            starterCode: """
                                def fizzbuzz(n):
                                    result = []
                                    for i in range(1, n + 1):
                                        # The order of conditions matters!
                                        pass
                                    return result
                            """,
                            expectedQuery: """
                                def fizzbuzz(n):
                                    result = []
                                    for i in range(1, n + 1):
                                        if i % 3 == 0 and i % 5 == 0:
                                            result.append("FizzBuzz")
                                        elif i % 3 == 0:
                                            result.append("Fizz")
                                        elif i % 5 == 0:
                                            result.append("Buzz")
                                        else:
                                            result.append(str(i))
                                    return result
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Grade Converter",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function grade(score) that returns a letter grade:\n- 90-100: \"A\"\n- 80-89: \"B\"\n- 70-79: \"C\"\n- 60-69: \"D\"\n- 0-59: \"F\"\n- Other (negative or over 100): \"Invalid\"\n\nExample: grade(85) → \"B\", grade(-1) → \"Invalid\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Condition Grading",
                                narrative: "You're building a student grade management system that converts scores to letter grades. This type of grading problem is common in interviews, testing elif chain design.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Handle invalid input first (boundary check)", "elif from high to low, each condition naturally excludes higher scores", "Watch boundary values 90, 80, 70, 60"],
                            explanation: "Best practices for multi-condition grading: (1) Handle invalid input first (2) Use elif chain from high to low, since previous conditions already excluded higher values (3) No need to write score >= 80 and score < 90 since elif chaining guarantees this.",
                            frameworkTip: "In grading interviews, handle edge cases (invalid input) first, then start from the strictest condition. This shows defensive programming thinking.",
                            starterCode: """
                                def grade(score):
                                    # Watch for boundary values and invalid input
                                    pass
                            """,
                            expectedQuery: """
                                def grade(score):
                                    if score < 0 or score > 100:
                                        return "Invalid"
                                    elif score >= 90:
                                        return "A"
                                    elif score >= 80:
                                        return "B"
                                    elif score >= 70:
                                        return "C"
                                    elif score >= 60:
                                        return "D"
                                    else:
                                        return "F"
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "15-5",
                    name: "Advanced Conditionals",
                    description: "and/or/not, compound conditions, truthy/falsy",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Truthy & Falsy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following values is Truthy (treated as True) in an if condition?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python Truthiness",
                                narrative: "In Python, not just True/False have truth values. Many values are treated as True or False in if conditions.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Empty string \"\"", explanation: "Empty string is Falsy."),
                                Challenge.Option(id: "B", text: "Number 0", explanation: "0 is Falsy."),
                                Challenge.Option(id: "C", text: "Empty list []", explanation: "Empty containers (list, dict, set) are all Falsy."),
                                Challenge.Option(id: "D", text: "String \"0\"", explanation: "Correct! Non-empty strings are always Truthy, even if the content is \"0\" or \"False\"."),
                            ],
                            correctAnswer: "D",
                            hints: ["Falsy values: None, False, 0, 0.0, \"\", [], {}, set(). Everything else is Truthy."],
                            explanation: "Python Falsy values: None, False, 0, 0.0, \"\" (empty string), [] (empty list), {} (empty dict), set(). All other values are Truthy.",
                            frameworkTip: "Leverage Truthy/Falsy to simplify code: if my_list: is more Pythonic than if len(my_list) > 0:"
                        ),
                        Challenge(
                            id: 2,
                            name: "Short-Circuit Evaluation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "When name = None, what is the value of result?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Short-Circuit Behavior of and/or",
                                narrative: "Consider this code:\nresult = name and name.upper()\nwhere name might be None or a string.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "AttributeError (because None has no .upper())", explanation: "and short-circuits: when the left side is Falsy, the right side is not evaluated."),
                                Challenge.Option(id: "B", text: "None", explanation: "Correct! name is None (Falsy), so and short-circuits and returns the left-side value None without evaluating name.upper()."),
                                Challenge.Option(id: "C", text: "False", explanation: "and returns the original value, not True/False."),
                                Challenge.Option(id: "D", text: "Empty string \"\"", explanation: "None remains None — it does not become an empty string."),
                            ],
                            correctAnswer: "B",
                            hints: ["and short-circuit: left side Falsy → returns left value immediately, right side not evaluated"],
                            explanation: "Python's and/or short-circuit and return the original value (not True/False). and: left Falsy → return left; left Truthy → return right. or is the opposite.",
                            frameworkTip: "Common pattern: value = user_input or \"default\" (if user_input is Falsy, use the default value)"
                        ),
                        Challenge(
                            id: 3,
                            name: "is vs == Trap",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the output of this code?\n\n```python\na = 256\nb = 256\nprint(a is b)\n\nc = 257\nd = 257\nprint(c is d)\n\ne = [1, 2, 3]\nf = [1, 2, 3]\nprint(e == f)\nprint(e is f)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python Identity vs Equality",
                                narrative: "This is a Python language feature question that Google and Meta love to ask in interviews. Many experienced developers fall into this trap.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "True, True, True, True", explanation: "c is d depends on Python's integer caching, 257 is outside the cache range."),
                                Challenge.Option(id: "B", text: "True, False, True, False", explanation: "Correct! Python caches integers from -5 to 256 (integer interning), so 256 is 256 is True, but 257 is 257 is False (different objects). Two lists with same content (==) are not the same object (is)."),
                                Challenge.Option(id: "C", text: "True, True, True, False", explanation: "257 is outside Python's integer cache range (-5 to 256)."),
                                Challenge.Option(id: "D", text: "False, False, True, False", explanation: "256 is within Python's integer cache range (-5 to 256), so a is b is True."),
                            ],
                            correctAnswer: "B",
                            hints: ["is compares memory address (identity), == compares value (equality)", "Python caches integers between -5 and 256", "Two independently created lists are different objects"],
                            explanation: "Key difference between is and ==:\n- == compares if values are equal\n- is compares if they are the same object (memory address)\n\nPython integer interning: integers between -5 and 256 are cached, so a = 256; b = 256 makes a is b True. But 257 is out of range, creating new objects each time.\n\nNote: results may differ in interactive vs script mode.",
                            frameworkTip: "In interviews: use == for value comparison, use is for None comparison. Always use x is None instead of x == None — this is PEP 8 standard."
                        ),
                        Challenge(
                            id: 4,
                            name: "Truthy/Falsy Complete List",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which option lists values that are ALL treated as False (falsy) in an if statement?",
                            scenario: 
                            Challenge.Scenario(
                                title: "What is \"False\" in Python?",
                                narrative: "Meta interviews frequently ask: in an if statement, which values are treated as False? This is crucial for writing concise Python code.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "0, \"\", [], {}, None, False", explanation: "Correct! These six are the most common falsy values in Python. Also 0.0, 0j, set(), tuple(), range(0), etc."),
                                Challenge.Option(id: "B", text: "0, \"\", [], {}, None, \"False\"", explanation: "\"False\" is a non-empty string, it is truthy!"),
                                Challenge.Option(id: "C", text: "0, \" \", [], {}, None, False", explanation: "\" \" (string with space) is truthy! Only \"\" (empty string) is falsy."),
                                Challenge.Option(id: "D", text: "0, \"\", [0], {}, None, False", explanation: "[0] is a list with one element, it is truthy! Only [] (empty list) is falsy."),
                            ],
                            correctAnswer: "A",
                            hints: ["Empty containers (list, dict, set, tuple) are all falsy", "Non-empty strings are truthy, even if content is \"0\" or \"False\"", "Numeric zero (including 0, 0.0, 0j) is falsy"],
                            explanation: "Python falsy values:\n- None\n- False\n- Numeric zero: 0, 0.0, 0j\n- Empty sequences: \"\", [], ()\n- Empty collections: {}, set()\n- Empty range: range(0)\n\nEverything else is truthy. This lets you write if my_list: instead of if len(my_list) > 0:",
                            frameworkTip: "Writing if not data: instead of if data == [] or data == None: is more Pythonic in interviews. Show you understand the truthy/falsy concept."
                        ),
                    ]
                ),
                Quest(
                    id: "15-6",
                    name: "Simple Calculator (Boss)",
                    description: "Combine variables, operators, and conditionals",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Build a Four-Operation Calculator",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Four-Operation Calculator",
                                narrative: "Your first Python project: build a simple four-operation calculator.\n\nThe user enters two numbers and an operator (+, -, *, /), and the program calculates and outputs the result.\n\nEdge cases to handle:\n- Division by zero\n- Invalid operator\n- Non-numeric input",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Handle input first, then operations, then output", "Remember input() returns a string — use float() to convert"],
                            explanation: "This calculator covers all concepts from World 15: variables, type conversion, input/output, f-strings, operators, if/elif/else, and basic error handling.",
                            frameworkTip: "Fundamental programming flow: Input → Process → Output. Get the data flow right first, then handle edge cases."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 16,
            name: "Loops & Data Structures",
            emoji: "🔄",
            description: "for/while loops with string, list, tuple, dict, and set",
            quests: [
                Quest(
                    id: "16-1",
                    name: "for Loops & range()",
                    description: "Basic iteration, range with three parameters, enumerate",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "range() Three Parameters",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which range() produces 0, 2, 4, 6, 8?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Usage of range()",
                                narrative: "You want to use a for loop to print 0, 2, 4, 6, 8.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "range(0, 8, 2)", explanation: "The stop value in range is exclusive — 8 will not be included, so it only goes up to 6."),
                                Challenge.Option(id: "B", text: "range(0, 9, 2)", explanation: "Correct! range(start, stop, step): starts at 0, increments by 2, stops before 9 → 0, 2, 4, 6, 8."),
                                Challenge.Option(id: "C", text: "range(0, 10, 2)", explanation: "Also works! 0, 2, 4, 6, 8 (10 is excluded). But range(0, 9, 2) is more precise. Both yield the same result."),
                                Challenge.Option(id: "D", text: "range(2, 8)", explanation: "This produces 2, 3, 4, 5, 6, 7 — not an even number sequence."),
                            ],
                            correctAnswer: "B",
                            hints: ["range(start, stop, step) — stop is exclusive (not included)"],
                            explanation: "range(start, stop, step): start is inclusive, stop is exclusive, step is the interval. range(0, 9, 2) → 0, 2, 4, 6, 8.",
                            frameworkTip: "Remember that stop in range is exclusive. To get 0 through n, use range(n+1)."
                        ),
                        Challenge(
                            id: 2,
                            name: "Purpose of enumerate",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most Pythonic approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Getting Both Index and Value",
                                narrative: "You have a list fruits = [\"apple\", \"banana\", \"cherry\"] and want to print both the index and value.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "for i in range(len(fruits)):\\n    print(i, fruits[i])", explanation: "This works but is not Pythonic. Using range(len(...)) is a common beginner pattern."),
                                Challenge.Option(id: "B", text: "for i, fruit in enumerate(fruits):\\n    print(i, fruit)", explanation: "Correct! enumerate() returns both the index and value simultaneously — this is the idiomatic Python approach."),
                                Challenge.Option(id: "C", text: "i = 0\\nfor fruit in fruits:\\n    print(i, fruit)\\n    i += 1", explanation: "A manual counter is too verbose. enumerate was designed to replace this pattern."),
                                Challenge.Option(id: "D", text: "for fruit in fruits:\\n    print(fruits.index(fruit), fruit)", explanation: ".index() searches the entire list each time — inefficient and has issues with duplicate values."),
                            ],
                            correctAnswer: "B",
                            hints: ["enumerate() is a built-in Python function specifically for getting both index and value"],
                            explanation: "enumerate() returns (index, value) tuples. Avoid the C-style pattern of for i in range(len(x)).",
                            frameworkTip: "Whenever you see for i in range(len(x)), think about replacing it with enumerate(x)."
                        ),
                        Challenge(
                            id: 3,
                            name: "Generating Monthly Reports",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function monthly_summary(revenues) that takes a list of 12 elements (revenue for months 1-12) and returns a list of strings formatted as \"Month X: $YYY\". Also append a \"Total: $ZZZ\" at the end. Use enumerate to get the month number.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly Revenue Summary",
                                narrative: "You need to use a loop to generate revenue summaries for 12 months. Monthly revenue data is provided as a list.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["enumerate(revenues, 1) starts the index at 1", "Use sum() to calculate the total", "Use append to add strings to the result list"],
                            explanation: "This exercise practices for loops with enumerate (start=1 for months starting at 1), f-string formatting, list operations (append), and the built-in sum() function.",
                            frameworkTip: "The second argument of enumerate sets the start value: enumerate(items, start=1).",
                            starterCode: """
                                def monthly_summary(revenues):
                                    # Use enumerate to iterate over revenues
                                    # Generate "Month X: $YYY" formatted strings
                                    # Append "Total: $ZZZ" at the end
                                    # Return the complete list
                                    pass
                            """,
                            expectedQuery: """
                                def monthly_summary(revenues):
                                    result = []
                                    for i, rev in enumerate(revenues, 1):
                                        result.append(f"Month {i}: ${rev}")
                                    result.append(f"Total: ${sum(revenues)}")
                                    return result
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Contains Duplicate (LeetCode #217)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function contains_duplicate(nums) that returns True if any value appears more than once in the array, otherwise False.\n\nRequirement: Use a set to achieve O(n) time complexity.\n\n```python\n# Examples\ncontains_duplicate([1, 2, 3, 1])  # → True\ncontains_duplicate([1, 2, 3, 4])  # → False\ncontains_duplicate([])            # → False\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce Duplicate Order Detection",
                                narrative: "You're on the backend team at an e-commerce company. Sometimes the same order ID gets submitted multiple times due to network retries. You need to build a fast duplicate detection tool. This is LeetCode #217, a must-know entry-level interview question.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["set() automatically removes duplicates", "If the set is shorter than the original list, there are duplicates", "This can be solved in one line!"],
                            explanation: "The most concise solution: len(nums) != len(set(nums)).\n\nA set removes duplicates, so if there are any, the set will be shorter.\n\nAnother common interview approach (using a for loop):\ndef contains_duplicate(nums):\n    seen = set()\n    for num in nums:\n        if num in seen:\n            return True\n        seen.add(num)\n    return False\n\nThis approach can return early when the first duplicate is found, without traversing the entire array.",
                            frameworkTip: "In interviews, first mention \"brute force uses nested for loops, O(n^2)\", then say \"but using a set achieves O(n)\". Show you can analyze time complexity and optimize. This is the first problem in Blind 75 — you must solve it instantly.",
                            starterCode: """
                                def contains_duplicate(nums):
                                    # Hint: sets don't allow duplicates
                                    # Compare set length vs original list length
                                    pass
                            """,
                            expectedQuery: """
                                def contains_duplicate(nums):
                                    return len(nums) != len(set(nums))
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "range Step Applications",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function tiered_pricing(units) that calculates total cost based on usage:\n- 0-99 units: $10 per unit\n- 100-499 units: $8 per unit\n- 500+ units: $5 per unit\n\nAlso return a list of cumulative costs at every 100-unit milestone (use range with step 100).\n\n```python\n# Example\ntiered_pricing(250)\n# → (2200, [1000, 1800, 2200])\n# First 100 units: 100*10 = 1000\n# 100-199: 100*8 = 800, cumulative 1800\n# 200-249: 50*8 = 400, cumulative 2200\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Tiered Pricing Analysis",
                                narrative: "You're doing pricing strategy analysis at a SaaS company. You need to calculate tiered pricing based on different usage brackets, each with different step sizes. This tests your understanding of range's third parameter.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["range(0, units, 100) generates 0, 100, 200, 300...", "min(100, units - start) handles the last group that may be less than 100", "Use the start value to determine which price bracket applies"],
                            explanation: "The third parameter of range(start, stop, step) lets you iterate in steps. This is very useful for segmented calculations, sampling, and batch processing.\n\nmin(100, units - start) is a classic technique for handling \"the last batch that isn't a full group\" — very common in interviews.",
                            frameworkTip: "When you encounter segmented calculation problems in interviews, first draw the interval diagram, then use range + step to process in groups. Mentioning min() for boundary handling earns extra points.",
                            starterCode: """
                                def tiered_pricing(units):
                                    total = 0
                                    milestones = []
                                    # Use range(0, units, 100) to process in groups of 100
                                    # Determine the applicable price for each bracket
                                    pass
                            """,
                            expectedQuery: """
                                def tiered_pricing(units):
                                    total = 0
                                    milestones = []
                                    for start in range(0, units, 100):
                                        chunk = min(100, units - start)
                                        if start < 100:
                                            total += chunk * 10
                                        elif start < 500:
                                            total += chunk * 8
                                        else:
                                            total += chunk * 5
                                        milestones.append(total)
                                    return (total, milestones)
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "16-2",
                    name: "while Loops & Flow Control",
                    description: "while loops, break, continue",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "while vs for",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which loop should be used in this situation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choosing the Right Loop",
                                narrative: "You need to repeat an operation but do not know how many times (until the user enters \"quit\").",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "for loop — because for is more commonly used", explanation: "for is suitable for a known number of iterations — not appropriate when the count is unknown."),
                                Challenge.Option(id: "B", text: "while loop — because the number of iterations is unknown", explanation: "Correct! while is suitable for \"condition-driven\" loops — repeat until a condition is no longer met."),
                                Challenge.Option(id: "C", text: "Recursion", explanation: "Recursion works but is overly complex for this simple scenario."),
                                Challenge.Option(id: "D", text: "for and while are exactly the same", explanation: "They have different semantics: for means \"do something for each element\", while means \"repeat as long as the condition holds\"."),
                            ],
                            correctAnswer: "B",
                            hints: ["for = known count/known collection. while = condition-driven, unknown count."],
                            explanation: "for loop: iterates over a known collection or count. while loop: repeats until a condition becomes false. Unknown iteration count → while.",
                            frameworkTip: "Choosing a loop: know the count → for. Do not know → while."
                        ),
                        Challenge(
                            id: 2,
                            name: "break & continue",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What does this code print?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Flow Control",
                                narrative: "The following code:\nfor i in range(10):\n    if i == 3: continue\n    if i == 7: break\n    print(i)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "0 1 2 3 4 5 6 7", explanation: "continue skips 3, and break stops at 7 (without printing 7)."),
                                Challenge.Option(id: "B", text: "0 1 2 4 5 6", explanation: "Correct! continue skips i=3 (not printed), break ends the loop at i=7 (7 not printed), so it prints 0,1,2,4,5,6."),
                                Challenge.Option(id: "C", text: "0 1 2 4 5 6 7", explanation: "break exits before printing 7."),
                                Challenge.Option(id: "D", text: "0 1 2", explanation: "continue only skips the current iteration — it does not end the loop. After skipping 3, it continues with 4, 5, 6."),
                            ],
                            correctAnswer: "B",
                            hints: ["continue = skip this one, move to next. break = stop the entire loop immediately."],
                            explanation: "continue skips the remaining code in the current iteration and moves to the next. break immediately terminates the entire loop. Their scopes differ.",
                            frameworkTip: "continue = skip this one. break = stop everything."
                        ),
                        Challenge(
                            id: 3,
                            name: "Valid Parentheses (LeetCode #20)",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function is_valid(s) that determines if brackets in a string are valid. Valid conditions:\n1. Open brackets must be closed by the same type of bracket\n2. Open brackets must be closed in the correct order\n\n```python\n# Examples\nis_valid(\"()\")      # → True\nis_valid(\"()[]{}\")   # → True\nis_valid(\"(]\")       # → False\nis_valid(\"([)]\")     # → False\nis_valid(\"{[]}\")     # → True\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Request Format Validation",
                                narrative: "You're developing an API gateway and need to validate that incoming JSON query formats are correct — all brackets must be properly matched. This is LeetCode #20, a Blind 75 must-know, and the classic introduction to the stack data structure.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Push opening brackets onto the stack", "For closing brackets, check if the stack top matches", "The stack must be empty at the end for validity", "stack[-1] peeks at the top element"],
                            explanation: "The core concept is Stack:\n1. Opening bracket → push onto stack\n2. Closing bracket → check if stack top is the matching opening bracket\n   - Yes → pop it\n   - No → return False\n3. Stack must be empty at the end\n\nUsing a dict for pair mapping is very Pythonic. Python's list is a natural stack: append() = push, pop() = pop, [-1] = peek.",
                            frameworkTip: "This is THE entry-level Stack interview question. Start by saying \"this is a classic stack application\", then explain the LIFO (last-in, first-out) concept. Top 5 most frequently asked in Blind 75.",
                            starterCode: """
                                def is_valid(s):
                                    # Hint: use a list as a stack (last-in, first-out)
                                    # Use a dict for bracket pair mapping
                                    stack = []
                                    pairs = {")": "(", "]": "[", "}": "{"}
                                    pass
                            """,
                            expectedQuery: """
                                def is_valid(s):
                                    stack = []
                                    pairs = {")": "(", "]": "[", "}": "{"}
                                    for char in s:
                                        if char in pairs:
                                            if not stack or stack[-1] != pairs[char]:
                                                return False
                                            stack.pop()
                                        else:
                                            stack.append(char)
                                    return len(stack) == 0
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "break/continue in Practice",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nlogs = [\"INFO: start\", \"WARN: slow\", \"ERROR: timeout\",\n        \"INFO: retry\", \"ERROR: crash\"]\n\nerrors = []\nfor log in logs:\n    if \"WARN\" in log:\n        continue\n    if \"ERROR\" in log:\n        errors.append(log)\n        if len(errors) >= 1:\n            break\n    print(f\"Processing: {log}\")\n\nprint(f\"Found: {errors}\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Flow Control in Log Analysis",
                                narrative: "You're analyzing server logs and need to find the first error message while skipping unimportant warnings. This tests your precise understanding of break and continue.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Processing: INFO: start\nProcessing: INFO: retry\nFound: ['ERROR: timeout', 'ERROR: crash']", explanation: "break exits the loop after the first ERROR is found, so it never reaches retry or crash."),
                                Challenge.Option(id: "B", text: "Processing: INFO: start\nFound: ['ERROR: timeout']", explanation: "Correct! continue skips WARN, and break exits the entire loop after the first ERROR. Note that break occurs before print, so the ERROR line is not printed."),
                                Challenge.Option(id: "C", text: "Processing: INFO: start\nProcessing: ERROR: timeout\nFound: ['ERROR: timeout']", explanation: "break is inside the if block, so the print after it does not execute."),
                                Challenge.Option(id: "D", text: "Processing: INFO: start\nProcessing: INFO: retry\nFound: ['ERROR: timeout']", explanation: "break exits at the first ERROR, never reaching INFO: retry."),
                            ],
                            correctAnswer: "B",
                            hints: ["continue skips the rest of the current iteration and moves to the next", "break exits the entire loop immediately", "break is inside the if block, so the subsequent print does not execute"],
                            explanation: "- continue: skips remaining code in current iteration, jumps to next iteration\n- break: exits the entire loop completely\n\nExecution flow:\n1. \"INFO: start\" → doesn't match WARN/ERROR → print\n2. \"WARN: slow\" → continue skips\n3. \"ERROR: timeout\" → append → len >= 1 → break exits (print not reached)\n\nNote: print(f\"Found:...\") is outside the loop, so it still executes.",
                            frameworkTip: "When facing break/continue trace questions in interviews, stepping through the code line by line (dry run) is the most reliable approach. Interviewers are testing your trace ability."
                        ),
                        Challenge(
                            id: 5,
                            name: "while + Sentinel Value Pattern",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function process_commands(commands) that takes a list of commands and processes them one by one:\n- Stop when encountering \"quit\" (don't process quit itself)\n- Skip empty strings \"\"\n- Add other commands to result list in uppercase\n\n```python\n# Example\nprocess_commands([\"hello\", \"\", \"help\", \"quit\", \"extra\"])\n# → [\"HELLO\", \"HELP\"]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Customer Service Chatbot Command Parser",
                                narrative: "You're developing a command parser for a customer service chatbot. The bot needs to process user inputs continuously until it receives a \"quit\" command. This is the classic while loop with sentinel value pattern.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["while i < len(commands) controls the loop", "Remember to increment i += 1 before continue, or you'll get an infinite loop", "break exits the while loop entirely"],
                            explanation: "This combines while + break + continue. Key points:\n\n1. i += 1 must come before continue! If placed at the end, continue would skip i += 1 causing an infinite loop\n2. break exits when the termination condition is met\n3. continue skips items that don't need processing\n\nThis \"increment first, then check\" pattern is very common in practice.",
                            frameworkTip: "while + continue trap questions are common in interviews. Remember the golden rule: increment the counter before continue. Using a for loop avoids this issue entirely.",
                            starterCode: """
                                def process_commands(commands):
                                    result = []
                                    i = 0
                                    # Use while loop to iterate through commands
                                    # "quit" → break
                                    # "" → continue (remember to i += 1 first)
                                    pass
                            """,
                            expectedQuery: """
                                def process_commands(commands):
                                    result = []
                                    i = 0
                                    while i < len(commands):
                                        cmd = commands[i]
                                        i += 1
                                        if cmd == "quit":
                                            break
                                        if cmd == "":
                                            continue
                                        result.append(cmd.upper())
                                    return result
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "16-3",
                    name: "String Operations",
                    description: "Indexing, slicing, common methods",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "String Slicing",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct slicing syntax?",
                            scenario: 
                            Challenge.Scenario(
                                title: "String Slicing",
                                narrative: "s = \"Hello, World!\" and you want to extract \"World\".",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "s[7:12]", explanation: "Correct! s[7] is W, s[12] is \"!\" (excluded), so s[7:12] = \"World\"."),
                                Challenge.Option(id: "B", text: "s[7:11]", explanation: "s[7:11] = \"Worl\" — missing the d. Remember stop is exclusive."),
                                Challenge.Option(id: "C", text: "s[6:12]", explanation: "s[6] is a space, resulting in \" World\"."),
                                Challenge.Option(id: "D", text: "s[7:13]", explanation: "s[7:13] = \"World!\" — includes the exclamation mark."),
                            ],
                            correctAnswer: "A",
                            hints: ["Python indexing starts at 0. Slicing [start:stop] includes start but excludes stop."],
                            explanation: "String slicing s[start:stop]: includes the start position, excludes the stop position. Negative indices are also supported (-1 is the last character).",
                            frameworkTip: "Slicing with three parameters: s[start:stop:step]. s[::-1] reverses the string."
                        ),
                        Challenge(
                            id: 2,
                            name: "Common String Methods",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which line of code correctly cleans it to \"alice@example.com\"?",
                            scenario: 
                            Challenge.Scenario(
                                title: "String Cleanup",
                                narrative: "You received user input email = \"  Alice@Example.COM  \" and need to clean up the format.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "email.strip().lower()", explanation: "Correct! strip() removes leading/trailing whitespace, lower() converts to lowercase. Methods can be chained."),
                                Challenge.Option(id: "B", text: "email.lower().strip()", explanation: "Same result, but convention is to strip first then lower. Both orderings work. (This option is also correct.)"),
                                Challenge.Option(id: "C", text: "email.replace(\" \", \"\").lower()", explanation: "replace(\" \", \"\") removes ALL spaces, including any in the middle of the email. strip() only removes leading/trailing."),
                                Challenge.Option(id: "D", text: "email.trim().lowercase()", explanation: "Python does not have trim() or lowercase(). The methods are strip() and lower()."),
                            ],
                            correctAnswer: "A",
                            hints: ["strip() = remove leading/trailing whitespace, lower() = convert to lowercase"],
                            explanation: "Common string methods: strip() (remove leading/trailing whitespace), lower()/upper() (case conversion), split() (split), join() (join), replace() (replace).",
                            frameworkTip: "Strings are immutable — all methods return a new string without modifying the original."
                        ),
                        Challenge(
                            id: 3,
                            name: "Valid Palindrome (LeetCode #125)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function is_palindrome(s) that checks if a string is a valid palindrome. Consider only alphanumeric characters and ignore case.\n\n```python\n# Examples\nis_palindrome(\"A man, a plan, a canal: Panama\")  # → True\nis_palindrome(\"race a car\")                       # → False\nis_palindrome(\"\")                                  # → True (empty string is palindrome)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Social Platform Username Validation",
                                narrative: "You work at a social media platform and the PM wants a fun feature: detecting if a user's nickname is a palindrome. But you need to ignore case and non-alphanumeric characters. This is LeetCode #125, a classic string processing starter.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["c.isalnum() checks if a character is alphanumeric", "s[::-1] reverses a string", "\"\".join() concatenates characters", "Clean first, then compare — two steps"],
                            explanation: "Solution steps:\n1. Use isalnum() to filter non-alphanumeric characters\n2. Use lower() to normalize case\n3. Use slicing [::-1] to reverse the string\n4. Compare original and reversed\n\nOne-liner: cleaned == cleaned[::-1]\n\nAdvanced interview follow-up: How to achieve O(1) space with two pointers?\ndef is_palindrome(s):\n    l, r = 0, len(s) - 1\n    while l < r:\n        while l < r and not s[l].isalnum(): l += 1\n        while l < r and not s[r].isalnum(): r -= 1\n        if s[l].lower() != s[r].lower(): return False\n        l += 1; r -= 1\n    return True",
                            frameworkTip: "In interviews, first write the concise [::-1] solution, then proactively say \"for O(1) space, we can use two pointers\". Show you know multiple approaches and trade-offs.",
                            starterCode: """
                                def is_palindrome(s):
                                    # 1. Filter out non-alphanumeric characters
                                    # 2. Convert to lowercase
                                    # 3. Compare forward and reversed
                                    pass
                            """,
                            expectedQuery: """
                                def is_palindrome(s):
                                    cleaned = "".join(c.lower() for c in s if c.isalnum())
                                    return cleaned == cleaned[::-1]
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "String Compression",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function compress(s) that compresses consecutive repeated characters into \"character + count\" format. If the compressed string is not shorter, return the original.\n\n```python\n# Examples\ncompress(\"aabcccccaaa\")  # → \"a2b1c5a3\"\ncompress(\"abc\")          # → \"abc\" (compressed \"a1b1c1\" is longer, return original)\ncompress(\"\")             # → \"\"\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Analytics Log Compression",
                                narrative: "You're at a data analytics company and need to compress repetitive log characters to save storage space. This is a common string processing question at Amazon interviews, testing your loop and counting skills.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Compare s[i] and s[i-1] to detect character changes", "Don't forget to handle the last group after the loop ends", "Compare compressed and original string lengths at the end"],
                            explanation: "Key points:\n1. Iterate through the string, tracking current character and consecutive count\n2. When a different character is encountered, add \"char + count\" to result\n3. After the loop, handle the last group (easy-to-miss edge case)\n4. Compare compressed length to decide which to return\n\nUse list + join instead of string concatenation, because Python strings are immutable — each + creates a new object. List then join is more efficient.",
                            frameworkTip: "Mentioning \"use list to collect results then join, instead of string + concatenation\" shows interviewers you understand Python string immutability and performance considerations.",
                            starterCode: """
                                def compress(s):
                                    if not s:
                                        return s
                                    result = []
                                    count = 1
                                    # Iterate through string, compare adjacent characters
                                    pass
                            """,
                            expectedQuery: """
                                def compress(s):
                                    if not s:
                                        return s
                                    result = []
                                    count = 1
                                    for i in range(1, len(s)):
                                        if s[i] == s[i - 1]:
                                            count += 1
                                        else:
                                            result.append(s[i - 1] + str(count))
                                            count = 1
                                    result.append(s[-1] + str(count))
                                    compressed = "".join(result)
                                    return compressed if len(compressed) < len(s) else s
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "16-4",
                    name: "List & Tuple",
                    description: "CRUD operations, slicing, sorting, unpacking",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "List Operations",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "After executing nums.append(9) then nums.sort(), what is the value of nums?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Basic List Operations",
                                narrative: "You have a list: nums = [3, 1, 4, 1, 5]",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[1, 1, 3, 4, 5, 9]", explanation: "Correct! append(9) adds to the end → [3,1,4,1,5,9], sort() sorts in place → [1,1,3,4,5,9]."),
                                Challenge.Option(id: "B", text: "[3, 1, 4, 1, 5, 9]", explanation: "sort() changes the order of the original list."),
                                Challenge.Option(id: "C", text: "[9, 5, 4, 3, 1, 1]", explanation: "This is descending order. sort() defaults to ascending. Use sort(reverse=True) for descending."),
                                Challenge.Option(id: "D", text: "[1, 1, 3, 4, 5]", explanation: "append(9) already added 9 to the list."),
                            ],
                            correctAnswer: "A",
                            hints: ["append() adds to the end, sort() sorts in ascending order in place (both modify the original list)"],
                            explanation: "Lists are mutable. append() adds elements and sort() sorts — both are in-place operations that modify the original list. sorted() returns a new list instead.",
                            frameworkTip: "In-place vs new value: list.sort() modifies the original, sorted(list) does not."
                        ),
                        Challenge(
                            id: 2,
                            name: "Purpose of Tuples",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Should you use a tuple or a list for the coordinate? Why?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Tuple vs List",
                                narrative: "You are designing a function that returns a coordinate (x, y).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "List — because list has more features", explanation: "More features does not mean more appropriate. Coordinates should not be modified."),
                                Challenge.Option(id: "B", text: "Tuple — because coordinates are immutable fixed structures", explanation: "Correct! Tuples are immutable, making them suitable for representing fixed structures that should not be modified, such as coordinates, dates, and configuration values."),
                                Challenge.Option(id: "C", text: "Either works, no difference", explanation: "Semantically different: tuple represents \"fixed structure\", list represents \"mutable collection\"."),
                                Challenge.Option(id: "D", text: "Dict — use {\"x\": 1, \"y\": 2}", explanation: "Dict is suitable for named attributes. A tuple is more concise for coordinates."),
                            ],
                            correctAnswer: "B",
                            hints: ["Tuple = immutable, fixed structure. List = mutable, dynamic collection."],
                            explanation: "Tuple semantics: \"these values should not change\". Commonly used for function return values, dictionary keys, and immutable data records.",
                            frameworkTip: "Decision criteria: will elements be added/removed → list. Fixed structure that never changes → tuple."
                        ),
                        Challenge(
                            id: 3,
                            name: "Processing Employee Salary List",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function analyze_salaries(salaries) that takes a salary list (integers) and returns a dict containing:\n- \"count\": number of employees\n- \"avg\": average salary (rounded to integer)\n- \"max\": highest salary\n- \"min\": lowest salary\n- \"above_avg\": count of employees with salary above average\n- \"sorted\": salary list sorted from high to low (without modifying the original list)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Salary Data Processing",
                                narrative: "HR gives you a list of employee salaries, and you need to perform basic data analysis and sorting.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use sum()/len() to calculate average", "Use sorted() instead of .sort() to avoid modifying the original list", "sum(1 for ...) can count elements that meet a condition"],
                            explanation: "This exercise practices list built-in functions (sum, len, max, min), sorted with reverse=True for descending order, generator expressions for counting, and using dict to organize multiple return values.",
                            frameworkTip: "sorted() returns a new list without modifying the original. .sort() modifies in place and returns None. Use sorted() when you need to preserve the original data.",
                            starterCode: """
                                def analyze_salaries(salaries):
                                    # Calculate various statistics
                                    # Return dict with all statistics
                                    pass
                            """,
                            expectedQuery: """
                                def analyze_salaries(salaries):
                                    avg = round(sum(salaries) / len(salaries))
                                    return {
                                        "count": len(salaries),
                                        "avg": avg,
                                        "max": max(salaries),
                                        "min": min(salaries),
                                        "above_avg": sum(1 for s in salaries if s > avg),
                                        "sorted": sorted(salaries, reverse=True),
                                    }
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Two Sum (LeetCode #1)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function two_sum(nums, target) that finds two numbers in the array whose indices sum to target.\n\nAssume each input has exactly one solution and the same element cannot be used twice.\n\n```python\n# Examples\ntwo_sum([2, 7, 11, 15], 9)   # → [0, 1] (nums[0] + nums[1] = 9)\ntwo_sum([3, 2, 4], 6)         # → [1, 2]\ntwo_sum([3, 3], 6)            # → [0, 1]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce Cart Bundle Feature",
                                narrative: "You're building a promotion feature at an e-commerce platform: find which two items in the cart add up exactly to the discount threshold. This is LeetCode #1 Two Sum, THE most frequently asked question in programming interview history, bar none.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Brute force: nested for loops O(n^2). Optimal: dict O(n)", "For each number num, its \"complement\" is target - num", "Dict key is the number, value is the index", "enumerate() gives both index and value"],
                            explanation: "Two Sum O(n) solution core concept:\n1. Iterate through array, for each num calculate complement = target - num\n2. Check if complement exists in seen dict\n   - Yes → found the answer, return both indices\n   - No → store num and its index in seen\n\nWhy dict? Because dict lookup is O(1), making the overall solution O(n).\n\nThis is THE most classic application of hash tables.",
                            frameworkTip: "This is LeetCode problem #1 and the most asked interview question ever. Start with brute force O(n^2), then optimize to O(n) hash table. Using enumerate instead of range(len()) is more Pythonic.",
                            starterCode: """
                                def two_sum(nums, target):
                                    # Hint: use dict to store "seen number → index"
                                    # For each number, check if target - number exists in dict
                                    seen = {}
                                    pass
                            """,
                            expectedQuery: """
                                def two_sum(nums, target):
                                    seen = {}
                                    for i, num in enumerate(nums):
                                        complement = target - num
                                        if complement in seen:
                                            return [seen[complement], i]
                                        seen[num] = i
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Best Time to Buy and Sell Stock (LeetCode #121)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function max_profit(prices) that returns the maximum profit achievable. You can only buy once and sell once, and must buy before selling. Return 0 if no profit is possible.\n\n```python\n# Examples\nmax_profit([7, 1, 5, 3, 6, 4])  # → 5 (buy day 2 at $1, sell day 5 at $6)\nmax_profit([7, 6, 4, 3, 1])     # → 0 (price keeps dropping, no trade)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Stock Trading Optimal Timing Analysis",
                                narrative: "You're doing quantitative analysis at a fintech startup. Your boss gives you historical stock price data and asks you to find the best day to buy and sell for maximum profit. This is LeetCode #121, a high-frequency Blind 75 problem.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["No need to track which day to buy/sell, just track min price and max profit", "For each price, either update min price or calculate profit", "One pass O(n) is sufficient"],
                            explanation: "The elegance of this problem: no need for nested loops comparing all pairs.\n\nCore idea:\n1. Maintain min_price = lowest buy price so far\n2. Maintain profit = maximum profit so far\n3. For each price:\n   - If lower than min_price → update min_price\n   - Otherwise → calculate profit price - min_price, update profit\n\nThis is a classic application of greedy algorithm: making the optimal local decision at each point.",
                            frameworkTip: "When solving this in interviews, first say \"brute force is O(n^2) nested loops\", then say \"but we can use greedy for O(n): track the minimum buy price\". Interviewers want to hear your optimization thought process.",
                            starterCode: """
                                def max_profit(prices):
                                    # Track "lowest price so far" and "maximum profit"
                                    # For each price, calculate: if I sell today, what's the profit?
                                    pass
                            """,
                            expectedQuery: """
                                def max_profit(prices):
                                    if not prices:
                                        return 0
                                    min_price = prices[0]
                                    profit = 0
                                    for price in prices[1:]:
                                        if price < min_price:
                                            min_price = price
                                        else:
                                            profit = max(profit, price - min_price)
                                    return profit
                            """
                        ),
                        Challenge(
                            id: 6,
                            name: "List Slicing & Tuple Immutability",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\noriginal = [1, 2, [3, 4]]\nshallow = original[:]\nshallow[0] = 99\nshallow[2][0] = 99\n\nprint(original)\nprint(type((1,)))\nprint(type((1)))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Safety Considerations in Data Pipelines",
                                narrative: "You're building a data analysis pipeline and need to ensure certain configuration values can't be accidentally modified. Understanding the difference between list and tuple is crucial in practice.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[1, 2, [99, 4]]\n<class 'tuple'>\n<class 'int'>", explanation: "Correct! [:] is a shallow copy: first level is independent, but nested objects (list) share references. (1,) is a tuple, (1) is just an int with parentheses."),
                                Challenge.Option(id: "B", text: "[99, 2, [99, 4]]\n<class 'tuple'>\n<class 'tuple'>", explanation: "After shallow copy, modifying shallow[0] does not affect original[0]. (1) is not a tuple, it's an int."),
                                Challenge.Option(id: "C", text: "[1, 2, [3, 4]]\n<class 'tuple'>\n<class 'int'>", explanation: "Nested objects in shallow copies share references, so shallow[2][0] = 99 affects original[2][0]."),
                                Challenge.Option(id: "D", text: "[1, 2, [99, 4]]\n<class 'tuple'>\n<class 'tuple'>", explanation: "(1) is missing the comma, Python treats it as regular parentheses, not a tuple."),
                            ],
                            correctAnswer: "A",
                            hints: ["[:] is a shallow copy — only copies the first level", "Nested lists still share the same reference", "The key to creating a tuple is the comma, not the parentheses"],
                            explanation: "Two important concepts:\n\n1. Shallow vs Deep Copy:\n   - original[:] or list(original) is a shallow copy\n   - First level is an independent copy, but nested objects share references\n   - For fully independent copies: import copy; copy.deepcopy()\n\n2. Tuple Creation:\n   - The key is the comma, not the parentheses\n   - (1,) → tuple\n   - (1) → int (parentheses treated as math grouping)\n   - 1, → also a tuple",
                            frameworkTip: "\"Shallow vs deep copy\" is a high-frequency Python interview topic. Remember: [:] and list() are both shallow copies. If the interviewer asks about deep copying, answer copy.deepcopy()."
                        ),
                    ]
                ),
                Quest(
                    id: "16-5",
                    name: "Dict & Set",
                    description: "Key-value operations, iteration, set operations",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Dict Basic Operations",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which approach is the safest?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Dictionary Operations",
                                narrative: "You have a dictionary: scores = {\"Alice\": 90, \"Bob\": 85}. You want to safely get \"Charlie\"'s score (which may not exist).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "scores[\"Charlie\"]", explanation: "If the key does not exist, it raises KeyError."),
                                Challenge.Option(id: "B", text: "scores.get(\"Charlie\", 0)", explanation: "Correct! .get() returns the default value (here 0) when the key does not exist, without raising an error."),
                                Challenge.Option(id: "C", text: "scores.find(\"Charlie\")", explanation: "dict does not have a .find() method."),
                                Challenge.Option(id: "D", text: "scores.Charlie", explanation: "dict cannot use dot notation — that is for object attributes."),
                            ],
                            correctAnswer: "B",
                            hints: [".get(key, default) is the standard safe way to access dict values"],
                            explanation: "dict.get(key, default) returns the default when the key does not exist, avoiding KeyError. It is a safer alternative to dict[key].",
                            frameworkTip: "Three ways to access dict: dict[key] (may raise error), dict.get(key) (safe), key in dict (check first)."
                        ),
                        Challenge(
                            id: 2,
                            name: "Set Operations",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the result of a & b?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Set Operations",
                                narrative: "a = {1, 2, 3, 4}\nb = {3, 4, 5, 6}\nYou want to find the elements common to both sets.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "{1, 2, 3, 4, 5, 6}", explanation: "This is the union, using a | b."),
                                Challenge.Option(id: "B", text: "{3, 4}", explanation: "Correct! & is intersection, returning elements present in both sets."),
                                Challenge.Option(id: "C", text: "{1, 2}", explanation: "This is the difference a - b (elements in a but not in b)."),
                                Challenge.Option(id: "D", text: "{1, 2, 5, 6}", explanation: "This is the symmetric difference a ^ b (elements in only one of the sets)."),
                            ],
                            correctAnswer: "B",
                            hints: ["& = intersection, | = union, - = difference, ^ = symmetric difference"],
                            explanation: "Four set operations: & intersection (in both), | union (combined), - difference (in mine but not yours), ^ symmetric difference (in only one).",
                            frameworkTip: "Sets are great for deduplication and set operations. list(set(my_list)) quickly removes duplicates."
                        ),
                        Challenge(
                            id: 3,
                            name: "Aggregating Sales Data",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function aggregate_sales(records) that takes a list of dicts (each with \"product\", \"qty\", \"price\" keys) and returns a dict with product name as key and another dict with \"total_qty\" and \"total_revenue\" as value.\nExample: {\"Apple\": {\"total_qty\": 10, \"total_revenue\": 300}}",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Dict Aggregation",
                                narrative: "You have multiple sales records (list of dicts) and need to aggregate total quantity and revenue per product.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Check if product already exists in result — if not, initialize it", "Use nested dicts to organize results", "Revenue = qty * price"],
                            explanation: "This exercise practices using dicts to accumulate statistics — the most common pattern in data analysis. The key is the grouping criterion (product), and the value is the aggregated result. This pattern is very useful when pandas is not available.",
                            frameworkTip: "Dict accumulation pattern: check if key exists → if not, initialize → if yes, accumulate. You can also use defaultdict to simplify.",
                            starterCode: """
                                def aggregate_sales(records):
                                    # Use dict to accumulate qty and revenue per product
                                    # records example: [{"product": "Apple", "qty": 5, "price": 30}, ...]
                                    pass
                            """,
                            expectedQuery: """
                                def aggregate_sales(records):
                                    result = {}
                                    for r in records:
                                        product = r["product"]
                                        if product not in result:
                                            result[product] = {"total_qty": 0, "total_revenue": 0}
                                        result[product]["total_qty"] += r["qty"]
                                        result[product]["total_revenue"] += r["qty"] * r["price"]
                                    return result
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Character Frequency Counting",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function char_frequency(s) that returns the frequency of each character (as a dict) and finds the most frequent character.\n\n```python\n# Examples\nchar_frequency(\"hello\")\n# → ({\"h\": 1, \"e\": 1, \"l\": 2, \"o\": 1}, \"l\")\n\nchar_frequency(\"aabbcc\")\n# → ({\"a\": 2, \"b\": 2, \"c\": 2}, \"a\")  # When tied, return the first one\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce Search Keyword Analysis",
                                narrative: "You're on the search team at an e-commerce platform, analyzing character frequencies in user search keywords to find the most common characters for optimizing search suggestions. This is the most fundamental and important dict application.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["dict.get(key, default) returns default when key doesn't exist", "max(dict, key=dict.get) finds the key with the largest value", "You could also use collections.Counter, but interviews usually want you to write it manually"],
                            explanation: "Three ways to count characters:\n\n1. Manual counting (must-know for interviews):\n   freq[c] = freq.get(c, 0) + 1\n\n2. defaultdict:\n   from collections import defaultdict\n   freq = defaultdict(int)\n   freq[c] += 1\n\n3. Counter (most concise):\n   from collections import Counter\n   freq = Counter(s)\n\nWrite the manual version first in interviews, then mention Counter for bonus points.\nmax(freq, key=freq.get) is the idiomatic way to find the key with the largest value in a dict.",
                            frameworkTip: "Character counting is the most basic dict application and the foundation of nearly all hash table problems. Using dict.get(key, 0) instead of if key in dict is more concise. Mentioning Counter earns bonus points.",
                            starterCode: """
                                def char_frequency(s):
                                    freq = {}
                                    # Iterate through string, count with dict
                                    # Find the most frequent character
                                    pass
                            """,
                            expectedQuery: """
                                def char_frequency(s):
                                    freq = {}
                                    for c in s:
                                        freq[c] = freq.get(c, 0) + 1
                                    max_char = max(freq, key=freq.get) if freq else ""
                                    return (freq, max_char)
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Valid Anagram (LeetCode #242)",
                            type: .code,
                            difficulty: .easy,
                            question: "Write a function is_anagram(s, t) that determines if t is an anagram of s.\n\nAnagram = two strings use exactly the same letters, just in different order.\n\n```python\n# Examples\nis_anagram(\"anagram\", \"nagaram\")  # → True\nis_anagram(\"rat\", \"car\")          # → False\nis_anagram(\"\", \"\")                 # → True\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Platform Duplicate Content Detection",
                                narrative: "You're at a content management SaaS platform and need to detect if someone rearranges the same characters to create seemingly different content (anagram). This is LeetCode #242, a classic hash table application.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["If the two strings differ in length, they can't be anagrams", "Use one dict: +1 when iterating s, -1 when iterating t", "If any count goes negative, t has a character s doesn't", "Simplest solution: sorted(s) == sorted(t), but that's O(n log n)"],
                            explanation: "Three approaches compared:\n\n1. Sorting (simplest): sorted(s) == sorted(t)\n   - Time O(n log n), Space O(n)\n\n2. Two dicts: count each separately, then compare\n   - Time O(n), Space O(n)\n\n3. Single dict (optimal): +1 for s chars, -1 for t chars\n   - Time O(n), Space O(1) (only 26 letters)\n   - If all values are 0 at the end, it's an anagram\n\nIn interviews, write the sorting solution first to show quick problem-solving, then optimize to hash table.",
                            frameworkTip: "A common follow-up for this problem: \"What if the input contains Unicode characters?\" Answer: the hash table approach is unaffected, but sorting may need locale considerations. Show you think about extensibility.",
                            starterCode: """
                                def is_anagram(s, t):
                                    # Approach: compare character frequencies of both strings
                                    # Use dict to count character frequencies for each string
                                    pass
                            """,
                            expectedQuery: """
                                def is_anagram(s, t):
                                    if len(s) != len(t):
                                        return False
                                    freq = {}
                                    for c in s:
                                        freq[c] = freq.get(c, 0) + 1
                                    for c in t:
                                        freq[c] = freq.get(c, 0) - 1
                                        if freq[c] < 0:
                                            return False
                                    return True
                            """
                        ),
                        Challenge(
                            id: 6,
                            name: "Set Operations",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nbought_a = {\"Alice\", \"Bob\", \"Carol\", \"Dave\"}\nbought_b = {\"Bob\", \"Carol\", \"Eve\", \"Frank\"}\n\nboth = bought_a & bought_b\nonly_a = bought_a - bought_b\neither = bought_a | bought_b\nnot_both = bought_a ^ bought_b\n\nprint(len(both), len(only_a), len(either), len(not_both))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Behavior Cross-Analysis",
                                narrative: "You're doing user behavior analysis: finding \"users who bought both A and B\", \"users who only bought A\", \"all users who bought A or B\". This is the perfect use case for Set operations.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "2 2 6 4", explanation: "Correct! & intersection {Bob, Carol}=2, - difference {Alice, Dave}=2, | union 6 people (no duplicates), ^ symmetric difference {Alice, Dave, Eve, Frank}=4."),
                                Challenge.Option(id: "B", text: "2 2 8 4", explanation: "Union | removes duplicates, Bob and Carol are counted only once."),
                                Challenge.Option(id: "C", text: "2 4 6 4", explanation: "Difference bought_a - bought_b only includes elements \"in A but not in B\"."),
                                Challenge.Option(id: "D", text: "2 2 6 2", explanation: "Symmetric difference ^ includes \"in A or B but not in both\", which is Alice, Dave, Eve, Frank."),
                            ],
                            correctAnswer: "A",
                            hints: ["& intersection: elements in both sets", "- difference: in A but not in B", "| union: in either set (deduplicated)", "^ symmetric difference: in one set but not both"],
                            explanation: "Python Set four major operations:\n- A & B (intersection): exists in both sets\n- A - B (difference): only in A, not in B\n- A | B (union): in either set (deduplicated)\n- A ^ B (symmetric_difference): in only one of the sets\n\nEquivalent methods:\n- A.intersection(B)\n- A.difference(B)\n- A.union(B)\n- A.symmetric_difference(B)",
                            frameworkTip: "When you encounter \"find common elements of two lists\" or \"find unique elements\" in interviews, immediately think Set. Set operations are more Pythonic than for loops and have better time complexity (O(n) vs O(n^2))."
                        ),
                    ]
                ),
                Quest(
                    id: "16-6",
                    name: "Data Cleaning Script (Boss)",
                    description: "Clean a dataset using loops + dict aggregation",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Aggregate & Clean",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Data Aggregation",
                                narrative: "You received sales data (list of dicts):\n\nsales = [\n    {\"product\": \"Apple\", \"qty\": 5, \"price\": 30},\n    {\"product\": \"Banana\", \"qty\": 3, \"price\": 15},\n    {\"product\": \"apple\", \"qty\": 2, \"price\": 30},\n    {\"product\": \"Cherry\", \"qty\": None, \"price\": 50},\n    {\"product\": \"Banana\", \"qty\": 7, \"price\": 15},\n    {\"product\": \"\", \"qty\": 4, \"price\": 20},\n]\n\nThe data has several issues: inconsistent product name casing, empty names, and None quantities.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use dict.get(key, 0) for safe accumulation", "Remember to clean before aggregating: strip() + lower()"],
                            explanation: "This problem integrates: for loops, dict operations (get, items), string methods (strip, lower), conditional filtering (continue), and the max() function.",
                            frameworkTip: "Three steps of data processing: Clean → Transform → Aggregate. Clean first, then transform, then aggregate."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 17,
            name: "Functions & Error Handling",
            emoji: "⚙️",
            description: "def, parameters, scope, built-in functions, try/except",
            quests: [
                Quest(
                    id: "17-1",
                    name: "Function Basics: def",
                    description: "Defining functions, parameters, return",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Function Definition",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which definition is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Your First Function",
                                narrative: "You want to write a function greet(name) that returns \"Hello, {name}!\".",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "function greet(name):\n    return f\"Hello, {name}!\"", explanation: "Python uses def, not function. function is JavaScript syntax."),
                                Challenge.Option(id: "B", text: "def greet(name):\n    return f\"Hello, {name}!\"", explanation: "Correct! Python uses def to define functions, with a colon + indentation for the function body."),
                                Challenge.Option(id: "C", text: "def greet(name)\n    return f\"Hello, {name}!\"", explanation: "Missing the colon! The def statement must end with a colon."),
                                Challenge.Option(id: "D", text: "def greet(name):\n    print(f\"Hello, {name}!\")", explanation: "print outputs to the screen — it does not return a value. The requirement is to \"return\", so use return."),
                            ],
                            correctAnswer: "B",
                            hints: ["Python uses def to define functions — note the colon and indentation"],
                            explanation: "def function_name(parameters): is the Python function definition syntax. return sends a value back (no return means it returns None). print only outputs — it does not return.",
                            frameworkTip: "return vs print: return sends the value to the caller, print displays the value on screen. Use return in most cases."
                        ),
                        Challenge(
                            id: 2,
                            name: "Behavior of return",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What does add(3, 5) return?",
                            scenario: 
                            Challenge.Scenario(
                                title: "return and None",
                                narrative: "You defined a function but forgot to write return:\ndef add(a, b):\n    result = a + b",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "8", explanation: "result was calculated as 8, but there is no return to send it back."),
                                Challenge.Option(id: "B", text: "None", explanation: "Correct! A function without a return statement automatically returns None."),
                                Challenge.Option(id: "C", text: "Raises an error", explanation: "It will not raise an error — it just returns None."),
                                Challenge.Option(id: "D", text: "0", explanation: "Without return, it does not return 0 — it returns None."),
                            ],
                            correctAnswer: "B",
                            hints: ["A function without return returns None"],
                            explanation: "Python functions automatically return None when there is no return statement. This is a common source of bugs: you think the function has a return value, but it is actually None.",
                            frameworkTip: "After writing a function, check: does every branch have a return? Forgetting return is one of the most common bugs."
                        ),
                        Challenge(
                            id: 3,
                            name: "Designing a Discount Calculator",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function calculate_discount(price, member_level=\"normal\", coupon_percent=0, is_holiday=False):\n- member_level discounts: normal=0%, silver=5%, gold=10%, vip=15%\n- coupon_percent: additional discount percentage (0-50)\n- is_holiday: holiday gives an extra 10% off\n- Discounts stack: apply member discount first, then coupon, then holiday\n- Return the final price (rounded to two decimal places)\n- If coupon_percent is not in the 0-50 range, raise ValueError",
                            scenario: 
                            Challenge.Scenario(
                                title: "E-Commerce Discount Engine",
                                narrative: "An e-commerce platform needs a discount calculation function that computes the final price based on various condition combinations.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use a dict to store the member discount mapping", "Stacking discounts: multiply by (1 - discount_rate) in sequence", "Use raise ValueError for invalid coupon values"],
                            explanation: "This exercise practices multiple aspects of function design: default parameters, dict lookup, sequential calculations, input validation (raise ValueError), and rounding.",
                            frameworkTip: "Business logic function design: validate input → look up parameters → calculate in order → format and return.",
                            starterCode: """
                                def calculate_discount(price, member_level="normal", coupon_percent=0, is_holiday=False):
                                    # Define member discount dict
                                    # Apply discounts in order
                                    # Validate coupon_percent range
                                    pass
                            """,
                            expectedQuery: """
                                def calculate_discount(price, member_level="normal", coupon_percent=0, is_holiday=False):
                                    if coupon_percent < 0 or coupon_percent > 50:
                                        raise ValueError("Coupon percent must be between 0 and 50")
                                    member_discounts = {"normal": 0, "silver": 5, "gold": 10, "vip": 15}
                                    discount = member_discounts.get(member_level, 0)
                                    final = price * (1 - discount / 100)
                                    final = final * (1 - coupon_percent / 100)
                                    if is_holiday:
                                        final = final * 0.9
                                    return round(final, 2)
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Data Cleaning Utility Functions",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function clean_record(record) that takes a dict and performs the following cleaning:\n- Strip leading/trailing whitespace from all string values\n- Convert \"email\" values to lowercase\n- Remove all non-digit characters from \"phone\" values\n- Convert \"age\" values to int (set to None if conversion fails)\nReturn a new cleaned dict (do not modify the original).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Batch Data Cleaning",
                                narrative: "You need to write utility functions to clean dirty data imported from CSV.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use dict.items() to iterate over all key-value pairs", "Use \"\".join(c for c in s if c.isdigit()) to filter non-digit characters", "Use try/except for safe type conversion"],
                            explanation: "This exercise combines dict operations, string methods (strip/lower), generator expressions for character filtering, and try/except for safe type conversion. This is a very common data cleaning pattern in practice.",
                            frameworkTip: "Cleaning function design principles: do not modify original data (create new dict), handle all edge cases, each field type has its own cleaning logic.",
                            starterCode: """
                                def clean_record(record):
                                    # Create a new dict to avoid modifying the original
                                    # Process each key-value pair
                                    pass
                            """,
                            expectedQuery: """
                                def clean_record(record):
                                    cleaned = {}
                                    for key, value in record.items():
                                        if isinstance(value, str):
                                            value = value.strip()
                                        if key == "email" and isinstance(value, str):
                                            value = value.lower()
                                        elif key == "phone" and isinstance(value, str):
                                            value = "".join(c for c in value if c.isdigit())
                                        elif key == "age":
                                            try:
                                                value = int(value)
                                            except (ValueError, TypeError):
                                                value = None
                                        cleaned[key] = value
                                    return cleaned
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Pure Function vs Side Effects",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is a \"Pure Function\"?\n\n```python\ntotal = 0\n\ndef func_a(price, tax_rate):\n    global total\n    total += price * (1 + tax_rate)\n    return total\n\ndef func_b(price, tax_rate):\n    return price * (1 + tax_rate)\n\ndef func_c(price, tax_rate):\n    result = price * (1 + tax_rate)\n    print(f\"Result: {result}\")\n    return result\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Pure Functions vs Side Effects",
                                narrative: "In a Google interview, you're asked about core functional programming concepts. The interviewer shows you three code snippets and asks which one is a \"pure function\" and why it matters in large-scale systems.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "func_a", explanation: "func_a modifies the global variable total, which is a classic side effect."),
                                Challenge.Option(id: "B", text: "func_b", explanation: "Correct! func_b only depends on its input parameters, does not modify external state, and always produces the same output for the same input. This is the definition of a pure function."),
                                Challenge.Option(id: "C", text: "func_c", explanation: "func_c returns the correct result, but print() is an I/O operation, which counts as a side effect."),
                                Challenge.Option(id: "D", text: "Both func_a and func_c", explanation: "Both have side effects: func_a modifies a global variable, func_c performs I/O."),
                            ],
                            correctAnswer: "B",
                            hints: ["Two conditions for pure functions: (1) same input always returns same output (2) no side effects", "Side effects include: modifying global variables, I/O operations, mutating mutable arguments"],
                            explanation: "A Pure Function must satisfy:\n1. Deterministic: same input → same output\n2. No side effects: no external state modification, no I/O\n\nBenefits: easy to test, parallelizable, cacheable (memoization). At companies like Google, pure functions are an important code review guideline.",
                            frameworkTip: "When discussing pure functions in interviews, connect to \"testability\" and \"predictability\". Google values this especially because large distributed systems need reliable function behavior."
                        ),
                        Challenge(
                            id: 6,
                            name: "First-Class Functions",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function apply_discount(price, discount_func) that takes a price and a discount function as arguments and returns the discounted price.\n\nThen write two discount functions:\n- percent_off(rate) returns a function that multiplies price by (1 - rate)\n- fixed_off(amount) returns a function that subtracts amount from price (minimum 0)\n\nExamples:\napply_discount(100, percent_off(0.2)) → 80.0\napply_discount(50, fixed_off(30)) → 20\napply_discount(10, fixed_off(30)) → 0",
                            scenario: 
                            Challenge.Scenario(
                                title: "Functions as First-Class Citizens",
                                narrative: "You're building a promotion engine for an e-commerce platform. Different promotions have different discount logic. Instead of writing a chain of if/else statements, you need to design a flexible pricing system by passing functions as arguments.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["In Python, functions are first-class citizens and can be passed as arguments", "percent_off and fixed_off need to return a \"function\", not a value", "Use max(0, ...) to ensure price doesn't go negative"],
                            explanation: "This demonstrates Python's \"First-Class Functions\" feature:\n- Functions can be passed as arguments\n- Functions can be returned as values\n- Functions can be stored in variables\n\npercent_off and fixed_off are \"Higher-Order Functions\" — they return functions. This pattern is very common in the Strategy Pattern.",
                            frameworkTip: "Showing you can pass functions as arguments tells interviewers you understand functional programming. Mentioning \"Strategy Pattern\" or \"Higher-Order Functions\" earns bonus points.",
                            starterCode: """
                                def apply_discount(price, discount_func):
                                    # Call discount_func as a function
                                    pass

                                def percent_off(rate):
                                    # Return a discount function
                                    pass

                                def fixed_off(amount):
                                    # Return a discount function
                                    pass
                            """,
                            expectedQuery: """
                                def apply_discount(price, discount_func):
                                    return discount_func(price)

                                def percent_off(rate):
                                    def discount(price):
                                        return price * (1 - rate)
                                    return discount

                                def fixed_off(amount):
                                    def discount(price):
                                        return max(0, price - amount)
                                    return discount
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "17-2",
                    name: "Advanced Parameters",
                    description: "Default values, *args, **kwargs",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Default Parameters",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the result of greet(\"Alice\")?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Function Default Values",
                                narrative: "You defined:\ndef greet(name, greeting=\"Hello\"):\n    return f\"{greeting}, {name}!\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Error — missing greeting parameter", explanation: "greeting has a default value, so it can be omitted."),
                                Challenge.Option(id: "B", text: "\"Hello, Alice!\"", explanation: "Correct! greeting uses the default value \"Hello\"."),
                                Challenge.Option(id: "C", text: "\"None, Alice!\"", explanation: "The default value is \"Hello\", not None."),
                                Challenge.Option(id: "D", text: "\"Alice, Hello!\"", explanation: "Wrong order — it is {greeting}, {name}."),
                            ],
                            correctAnswer: "B",
                            hints: ["Parameters with default values can be omitted — the default is used automatically"],
                            explanation: "Default parameters make functions more flexible: required parameters come first, optional parameters (with defaults) come last.",
                            frameworkTip: "Default value pitfall: never use mutable objects (list, dict) as defaults! Use None instead."
                        ),
                        Challenge(
                            id: 2,
                            name: "*args & **kwargs",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following calls is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Variable Arguments",
                                narrative: "You see a function definition:\ndef log(message, *args, **kwargs):\n    pass",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "log(\"error\", 1, 2, 3, level=\"high\")", explanation: "Correct! \"error\" → message, 1,2,3 → args, level=\"high\" → kwargs."),
                                Challenge.Option(id: "B", text: "log(level=\"high\", \"error\")", explanation: "Keyword arguments cannot come before positional arguments."),
                                Challenge.Option(id: "C", text: "log()", explanation: "message is a required parameter and cannot be omitted."),
                                Challenge.Option(id: "D", text: "log(\"error\", *[1,2], **\"level\")", explanation: "** must be followed by a dict, not a string."),
                            ],
                            correctAnswer: "A",
                            hints: ["*args collects extra positional arguments into a tuple, **kwargs collects extra keyword arguments into a dict"],
                            explanation: "*args collects extra positional arguments into a tuple, **kwargs collects extra keyword arguments into a dict. Order: regular parameters → *args → **kwargs.",
                            frameworkTip: "Common use case: wrapper functions and decorators use *args, **kwargs to pass arbitrary arguments."
                        ),
                        Challenge(
                            id: 3,
                            name: "Flexible Logger Function",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function smart_log(*args, **kwargs):\n- Join all args with \" | \" into a message string\n- If kwargs has level, prepend \"[LEVEL] \" (uppercase) to the message\n- If kwargs has timestamp, prepend timestamp + \" \" at the very beginning\n- Return the final log string\n\nExamples:\nsmart_log(\"User login\", \"id=123\") → \"User login | id=123\"\nsmart_log(\"Error\", \"DB timeout\", level=\"warning\") → \"[WARNING] Error | DB timeout\"\nsmart_log(\"Sale\", amount=\"$500\", level=\"info\", timestamp=\"2024-01-15\") → \"2024-01-15 [INFO] Sale\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Building a Flexible Logger with *args/**kwargs",
                                narrative: "You're on Amazon's backend team and need to design a flexible logging function. Different microservices need different log formats, so you'll use *args and **kwargs to build a universal logger.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use \" | \".join() to connect args", "Use kwargs.get(\"level\") for safe access", "Watch the composition order: timestamp first, then level before message"],
                            explanation: "*args collects positional arguments into a tuple, **kwargs collects keyword arguments into a dict. This design lets a function accept any number and type of arguments, perfect for logging, event systems, and other flexible scenarios.",
                            frameworkTip: "When asked about practical uses of *args/**kwargs in interviews, logging systems and decorators are the best examples. Amazon values extensible system design.",
                            starterCode: """
                                def smart_log(*args, **kwargs):
                                    # 1. Join all args with " | "
                                    # 2. Check kwargs for level and timestamp
                                    # 3. Compose the final string
                                    pass
                            """,
                            expectedQuery: """
                                def smart_log(*args, **kwargs):
                                    message = " | ".join(str(a) for a in args)
                                    level = kwargs.get("level")
                                    timestamp = kwargs.get("timestamp")
                                    if level:
                                        message = f"[{level.upper()}] {message}"
                                    if timestamp:
                                        message = f"{timestamp} {message}"
                                    return message
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Function Signature Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which function definition will raise a SyntaxError?\n\n```python\n# A\ndef func_a(a, b=10, *args, **kwargs):\n    pass\n\n# B\ndef func_b(a, *args, b=10, **kwargs):\n    pass\n\n# C\ndef func_c(a, **kwargs, *args):\n    pass\n\n# D\ndef func_d(*, key, value=\"default\"):\n    pass\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Function Parameter Design Best Practices",
                                narrative: "During an Amazon code review, a senior engineer points out a function's parameter design is flawed. You need to understand Python function signature best practices and parameter ordering rules.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "func_a", explanation: "func_a has valid parameter order: regular → default → *args → **kwargs."),
                                Challenge.Option(id: "B", text: "func_b", explanation: "func_b is valid! b=10 after *args becomes a keyword-only parameter, callable only with func_b(1, 2, 3, b=20)."),
                                Challenge.Option(id: "C", text: "func_c", explanation: "Correct! **kwargs must come last, it cannot appear before *args. Python requires parameter order: regular → default → *args → keyword-only → **kwargs."),
                                Challenge.Option(id: "D", text: "func_d", explanation: "func_d is valid! Parameters after bare * are keyword-only, they must be passed by name."),
                            ],
                            correctAnswer: "C",
                            hints: ["Python parameter order: positional → default → *args → keyword-only → **kwargs", "**kwargs must always be last", "A bare * means all following parameters are keyword-only"],
                            explanation: "Valid Python function parameter order:\n1. Regular positional parameters (a, b)\n2. Parameters with defaults (c=10)\n3. *args (collects extra positional args)\n4. Keyword-only parameters (after *args)\n5. **kwargs (must be last)\n\nNote: In func_b, b=10 after *args automatically becomes a keyword-only parameter.",
                            frameworkTip: "Being able to explain keyword-only parameters (PEP 3102) and parameter ordering rules in interviews shows deep Python understanding. Amazon values clean API design."
                        ),
                    ]
                ),
                Quest(
                    id: "17-3",
                    name: "Scope & Built-in Functions",
                    description: "LEGB rule, map/filter/sorted/zip",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "LEGB Scope",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Variable Scope",
                                narrative: "The following code:\nx = 10\ndef foo():\n    x = 20\n    print(x)\nfoo()\nprint(x)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "20 then 20", explanation: "The x inside the function is a local variable — it does not affect the outer x."),
                                Challenge.Option(id: "B", text: "20 then 10", explanation: "Correct! x=20 inside the function is a local variable (L), and x=10 outside is a global variable (G). The two x values do not affect each other."),
                                Challenge.Option(id: "C", text: "10 then 10", explanation: "The function has x=20, so it uses the local value."),
                                Challenge.Option(id: "D", text: "Error", explanation: "No error — the two x variables are in different scopes."),
                            ],
                            correctAnswer: "B",
                            hints: ["LEGB: Local → Enclosing → Global → Built-in — Python looks for variables from inside out"],
                            explanation: "LEGB rule: Python looks up variables in the order Local → Enclosing (nested functions) → Global → Built-in. Assignment inside a function creates a local variable.",
                            frameworkTip: "Avoid using global to modify global variables inside functions. Use parameters and return values to share state."
                        ),
                        Challenge(
                            id: 2,
                            name: "Common Built-in Functions",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which expression returns [1, 1, 3, 4, 5, 9]?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Built-in Functions",
                                narrative: "You have a list: nums = [3, 1, 4, 1, 5, 9]",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "nums.sort()", explanation: ".sort() sorts in place and returns None — it does not return the sorted list."),
                                Challenge.Option(id: "B", text: "sorted(nums)", explanation: "Correct! sorted() returns a new sorted list without modifying the original."),
                                Challenge.Option(id: "C", text: "list(reversed(nums))", explanation: "reversed() reverses the order — it does not sort."),
                                Challenge.Option(id: "D", text: "nums.order()", explanation: "list has no .order() method."),
                            ],
                            correctAnswer: "B",
                            hints: ["sorted() returns a new list, .sort() modifies in place and returns None"],
                            explanation: "Common built-in functions: sorted() (sort), len() (length), sum() (total), min()/max() (minimum/maximum), zip() (pair up), map() (map), filter() (filter).",
                            frameworkTip: "Remember the difference between sorted() and .sort(): use sorted() to preserve the original list, use .sort() when you do not need to."
                        ),
                        Challenge(
                            id: 3,
                            name: "Closure Interview Classic",
                            type: .code,
                            difficulty: .hard,
                            question: "Implement a counter factory function make_counter(start=0) using closures:\n- Returns a function counter()\n- Each call to counter() returns the current count value and increments by 1\n- The start parameter sets the initial value\n\nExamples:\ncounter = make_counter()\ncounter() → 0\ncounter() → 1\ncounter() → 2\n\ncounter_from_10 = make_counter(10)\ncounter_from_10() → 10\ncounter_from_10() → 11",
                            scenario: 
                            Challenge.Scenario(
                                title: "Closure — The Counter",
                                narrative: "This is a classic Google and Meta interview question. The interviewer asks you to implement a counter using only functions, no classes. It tests your understanding of closures — an inner function \"remembering\" the outer function's variables.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Closure = inner function + the outer variables it \"remembers\"", "You need the nonlocal keyword to modify (not shadow) the outer variable", "Save the current value, increment, then return the saved value"],
                            explanation: "Closure is a core concept in functional programming:\n- The inner function counter() \"remembers\" the outer count variable\n- Even after make_counter() has finished executing, count still exists\n- The nonlocal declaration lets the inner function modify (rather than shadow) the outer variable\n\nClosures are the foundation of decorators — understanding closures is prerequisite to understanding decorators.",
                            frameworkTip: "When asked about closures in interviews, first draw the scope chain (LEGB), then explain nonlocal's role. Mentioning that closures are the foundation of decorators will impress interviewers.",
                            starterCode: """
                                def make_counter(start=0):
                                    # Hint: you need the nonlocal keyword
                                    # to let the inner function modify the outer variable
                                    pass
                            """,
                            expectedQuery: """
                                def make_counter(start=0):
                                    count = start
                                    def counter():
                                        nonlocal count
                                        current = count
                                        count += 1
                                        return current
                                    return counter
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "global vs nonlocal",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nx = \"global\"\n\ndef outer():\n    x = \"outer\"\n    def inner():\n        nonlocal x\n        x = \"inner\"\n    inner()\n    print(\"outer:\", x)\n\nouter()\nprint(\"global:\", x)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Difference Between global and nonlocal",
                                narrative: "The interviewer asks about Python's scope rules (LEGB) and the difference between global and nonlocal. This is foundational for understanding closures and decorators.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "outer: inner\nglobal: inner", explanation: "nonlocal only affects the enclosing function's variable, not the global variable."),
                                Challenge.Option(id: "B", text: "outer: inner\nglobal: global", explanation: "Correct! nonlocal makes inner() modify outer()'s x (changed to \"inner\"), but the global x is unaffected and remains \"global\"."),
                                Challenge.Option(id: "C", text: "outer: outer\nglobal: global", explanation: "nonlocal causes x = \"inner\" inside inner() to modify outer()'s x."),
                                Challenge.Option(id: "D", text: "outer: outer\nglobal: inner", explanation: "nonlocal modifies the enclosing function's variable, not the global one. Use global to modify the global variable."),
                            ],
                            correctAnswer: "B",
                            hints: ["nonlocal looks up to the nearest enclosing function's variable", "global goes directly to the global variable", "Python scope rules: LEGB (Local → Enclosing → Global → Built-in)"],
                            explanation: "Python scope rules LEGB:\n- Local: inside the function\n- Enclosing: outer function (closure)\n- Global: module level\n- Built-in: Python built-ins\n\nnonlocal binds to the Enclosing scope, global binds to the Global scope. They do not affect each other.",
                            frameworkTip: "Being able to clearly explain the LEGB rule and the difference between nonlocal vs global is an indicator of advanced Python skills. Google interviews especially love testing language mechanics."
                        ),
                    ]
                ),
                Quest(
                    id: "17-4",
                    name: "Error Types & Debugging",
                    description: "SyntaxError, TypeError, reading tracebacks",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Identifying Error Types",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What type of error does this produce?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Common Errors",
                                narrative: "You run print(\"Hello World) but forgot the closing quote.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SyntaxError", explanation: "Correct! A missing quote is a syntax error — Python catches it before execution."),
                                Challenge.Option(id: "B", text: "TypeError", explanation: "TypeError is a type mismatch runtime error. Syntax errors are caught during the parsing phase."),
                                Challenge.Option(id: "C", text: "NameError", explanation: "NameError occurs when using an undefined variable. This is a syntax issue."),
                                Challenge.Option(id: "D", text: "ValueError", explanation: "ValueError occurs when a value is invalid. This is a syntax issue."),
                            ],
                            correctAnswer: "A",
                            hints: ["SyntaxError = code structure error (Python cannot understand what you wrote)"],
                            explanation: "Common error types: SyntaxError (syntax mistake), TypeError (type mismatch), NameError (undefined variable), ValueError (invalid value), IndexError (index out of range), KeyError (key not found).",
                            frameworkTip: "First debugging step: look at the error type and the last line of the message. For SyntaxError, look at the arrow position. For others, read the Traceback."
                        ),
                        Challenge(
                            id: 2,
                            name: "Reading Tracebacks",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Where did the error occur? What is the cause?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Reading Tracebacks",
                                narrative: "You see the following error message:\nTraceback (most recent call last):\n  File \"main.py\", line 10, in <module>\n    result = calculate(data)\n  File \"main.py\", line 5, in calculate\n    return data[key]\nKeyError: 'price'",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Line 10, data variable is undefined", explanation: "Line 10 is the caller — the actual error is inside the calculate function."),
                                Challenge.Option(id: "B", text: "Line 5, the dictionary data does not have the key \"price\"", explanation: "Correct! Traceback reads top to bottom as the call chain. The last entry is the actual error location. KeyError means the dict does not have that key."),
                                Challenge.Option(id: "C", text: "Line 5, data is None", explanation: "If data were None, it would raise TypeError, not KeyError."),
                                Challenge.Option(id: "D", text: "Line 10, calculate function is undefined", explanation: "If undefined, it would raise NameError, not KeyError."),
                            ],
                            correctAnswer: "B",
                            hints: ["Read Traceback top to bottom: the top is the starting point, the bottom is the error location. The last line is the error type and message."],
                            explanation: "Reading Tracebacks: (1) Look at the last line for error type and message (2) Read the call chain from bottom to top (3) Find the line in your code (not library code) closest to the bottom.",
                            frameworkTip: "Traceback reading method: first look at the last line (error type), then the bottom-most file and line number (error location)."
                        ),
                        Challenge(
                            id: 3,
                            name: "Common Exception Type Identification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What exception does each of these four code snippets raise?\n\n```python\n# Snippet 1\ndata = {\"name\": \"Alice\"}\nprint(data[\"age\"])\n\n# Snippet 2\nnumbers = [1, 2, 3]\nprint(numbers[5])\n\n# Snippet 3\nage = int(\"twenty\")\n\n# Snippet 4\nresult = None\nprint(result.upper())\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Quick Exception Type Identification",
                                narrative: "You're on-call at an e-commerce company and the system is throwing errors at 3 AM. You need to quickly identify exception types to find the right fix. Understanding Python's exception types is the foundation of efficient debugging.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "KeyError, IndexError, ValueError, AttributeError", explanation: "Correct! Missing dict key → KeyError; list out of range → IndexError; invalid type conversion → ValueError; object lacks attribute/method → AttributeError."),
                                Challenge.Option(id: "B", text: "ValueError, IndexError, TypeError, AttributeError", explanation: "Accessing a non-existent dict key is KeyError, not ValueError."),
                                Challenge.Option(id: "C", text: "KeyError, IndexError, TypeError, NameError", explanation: "Snippet 3 is ValueError (value cannot be converted), not TypeError. Snippet 4 is AttributeError."),
                                Challenge.Option(id: "D", text: "KeyError, ValueError, ValueError, TypeError", explanation: "Snippet 2 is IndexError (index out of range). Snippet 4 where None lacks .upper() is AttributeError."),
                            ],
                            correctAnswer: "A",
                            hints: ["KeyError: key not found in dict", "IndexError: sequence index out of range", "ValueError: correct type but invalid content", "AttributeError: object lacks the specified attribute or method"],
                            explanation: "The four most common Python exceptions:\n- KeyError: accessing a non-existent dict key (use .get() to avoid)\n- IndexError: list/tuple index out of range\n- ValueError: invalid value format or content (e.g., int(\"abc\"))\n- AttributeError: object lacks the method or attribute (e.g., None.upper())\n\nQuick exception type identification is the first step to efficient debugging.",
                            frameworkTip: "When asked about debugging skills in interviews, accurately naming exception types and their defenses (dict.get(), bounds checking, try/except) demonstrates real-world experience."
                        ),
                        Challenge(
                            id: 4,
                            name: "Custom Exceptions",
                            type: .code,
                            difficulty: .medium,
                            question: "Build an order system exception hierarchy:\n1. OrderError(Exception): base order exception, accepts message and order_id\n2. InsufficientStockError(OrderError): stock shortage, additionally accepts product and requested quantity\n3. Write a function process_order(order_id, product, quantity, stock):\n   - If stock < quantity, raise InsufficientStockError\n   - Otherwise return f\"Order {order_id}: {quantity}x {product} confirmed\"\n\nExamples:\nprocess_order(\"A001\", \"Laptop\", 5, 3) → raises InsufficientStockError\nprocess_order(\"A002\", \"Mouse\", 2, 10) → \"Order A002: 2x Mouse confirmed\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Building Business-Specific Exception Classes",
                                narrative: "You're designing an order processing system and need custom exception classes to distinguish different business errors. Using generic ValueError or RuntimeError isn't specific enough — custom exceptions enable more precise error handling.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Custom exceptions should inherit from Exception or its subclass", "Use super().__init__(message) to initialize the parent class", "Use raise to throw exceptions, not return"],
                            explanation: "Custom exception best practices:\n1. Inherit from Exception (not BaseException)\n2. Use super().__init__() to properly initialize parent class\n3. Add extra attributes (order_id, product, etc.) for downstream handling\n4. Build exception hierarchies (OrderError → InsufficientStockError) for layered catching\n\nThis lets except OrderError catch all order-related errors, while except InsufficientStockError catches only stock shortages.",
                            frameworkTip: "Showing custom exception hierarchies (instead of generic ValueError) and explaining \"except parent catches all children\" demonstrates understanding of Python's exception inheritance.",
                            starterCode: """
                                class OrderError(Exception):
                                    def __init__(self, message, order_id):
                                        pass

                                class InsufficientStockError(OrderError):
                                    def __init__(self, order_id, product, requested, available):
                                        pass

                                def process_order(order_id, product, quantity, stock):
                                    pass
                            """,
                            expectedQuery: """
                                class OrderError(Exception):
                                    def __init__(self, message, order_id):
                                        super().__init__(message)
                                        self.order_id = order_id

                                class InsufficientStockError(OrderError):
                                    def __init__(self, order_id, product, requested, available):
                                        message = f"Insufficient stock for {product}: requested {requested}, available {available}"
                                        super().__init__(message, order_id)
                                        self.product = product
                                        self.requested = requested
                                        self.available = available

                                def process_order(order_id, product, quantity, stock):
                                    if stock < quantity:
                                        raise InsufficientStockError(order_id, product, quantity, stock)
                                    return f"Order {order_id}: {quantity}x {product} confirmed"
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "17-5",
                    name: "try/except & Defensive Programming",
                    description: "Multiple except, raise, finally",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic try/except",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which code block is most correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Safe Type Conversion",
                                narrative: "You want to convert user input to an integer, but the user might enter non-numeric text.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "try:\n    num = int(input(\"Number: \"))\nexcept:\n    print(\"Error\")", explanation: "A bare except catches all errors (including KeyboardInterrupt) — too broad."),
                                Challenge.Option(id: "B", text: "try:\n    num = int(input(\"Number: \"))\nexcept ValueError:\n    print(\"Please enter a valid number\")", explanation: "Correct! Only catches ValueError (int() conversion failure), letting other errors propagate normally."),
                                Challenge.Option(id: "C", text: "num = int(input(\"Number: \")) or 0", explanation: "or cannot prevent ValueError. If int() fails, the program crashes."),
                                Challenge.Option(id: "D", text: "if input(\"Number: \").isdigit():\n    num = int(input(\"Number: \"))", explanation: "Calls input() twice — the user has to enter the value twice. Logic is flawed."),
                            ],
                            correctAnswer: "B",
                            hints: ["Always specify a specific exception type — never use a bare except"],
                            explanation: "try/except best practices: (1) Only wrap the smallest code block that might fail (2) Specify the exact exception type (3) Provide a meaningful error message.",
                            frameworkTip: "Golden rule: catch specific exceptions. A bare except is an anti-pattern."
                        ),
                        Challenge(
                            id: 2,
                            name: "raise Custom Exceptions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you raise a meaningful error when age < 0?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Raising Exceptions",
                                narrative: "You wrote a function that requires age >= 0.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "return \"error\"", explanation: "Returning a string is not proper error handling — the caller might ignore it."),
                                Challenge.Option(id: "B", text: "raise ValueError(f\"age cannot be negative: {age}\")", explanation: "Correct! raise explicitly raises an exception. ValueError is appropriate for \"invalid value\" situations."),
                                Challenge.Option(id: "C", text: "print(\"age cannot be negative\")", explanation: "print only outputs — the program continues running and does not prevent the invalid value from being used."),
                                Challenge.Option(id: "D", text: "exit(1)", explanation: "exit() terminates the entire program. You should let the caller decide how to handle the error."),
                            ],
                            correctAnswer: "B",
                            hints: ["raise lets the function pass the error to the caller for handling, rather than handling it itself"],
                            explanation: "raise explicitly raises an exception, letting the caller handle it with try/except. This is clearer and harder to ignore than returning error codes or using print.",
                            frameworkTip: "Function design principle: validate input → invalid inputs get raise → let the caller try/except."
                        ),
                        Challenge(
                            id: 3,
                            name: "Safe Data Parser",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function safe_parse(raw_data) that returns parsed results based on input type:\n- If dict, return directly\n- If string and parseable as JSON, return the parsed dict/list\n- If comma-separated string (not JSON), return the split list (strip whitespace from each element)\n- If int or float, return {\"value\": raw_data}\n- Otherwise, raise TypeError(\"Unsupported data type\")\nAny parsing errors should be caught and the next format should be attempted.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Format Data Parser",
                                narrative: "Your system receives data from different sources in varying formats. You need a robust parser.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use isinstance() to check types", "Try json.loads() first for strings — JSONDecodeError means it is not JSON", "Use list comprehension + strip() for comma-separated processing"],
                            explanation: "This exercise practices defensive programming: using isinstance to check types, try/except for parsing attempts, and handling multiple data formats. In practice, this kind of flexible parser is useful when receiving external data.",
                            frameworkTip: "Defensive parsing pattern: try the strictest format first (JSON) → fall back to a looser format (CSV) → raise an error if all fail.",
                            starterCode: """
                                import json

                                def safe_parse(raw_data):
                                    # Determine input type and parse
                                    # Note: try JSON first for strings, fall back to comma-separated
                                    pass
                            """,
                            expectedQuery: """
                                import json

                                def safe_parse(raw_data):
                                    if isinstance(raw_data, dict):
                                        return raw_data
                                    if isinstance(raw_data, str):
                                        try:
                                            return json.loads(raw_data)
                                        except json.JSONDecodeError:
                                            return [item.strip() for item in raw_data.split(",")]
                                    if isinstance(raw_data, (int, float)):
                                        return {"value": raw_data}
                                    raise TypeError("Unsupported data type")
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "@timer Decorator",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a @timer decorator that measures the execution time of the decorated function:\n- Use time.time() to calculate start and end times\n- Print \"{function_name} took {seconds:.4f}s\"\n- Return the original function's return value\n- Use functools.wraps to preserve the original function's metadata\n\nExample:\n@timer\ndef slow_add(a, b):\n    time.sleep(0.1)\n    return a + b\n\nresult = slow_add(1, 2)  # prints \"slow_add took 0.10xxs\"\nprint(result)  # 3",
                            scenario: 
                            Challenge.Scenario(
                                title: "Decorator Classic Trio #1: Timer",
                                narrative: "In Meta interviews, decorators are a must-know topic. The interviewer asks you to write a @timer decorator that measures function execution time. This is the most basic decorator application and the starting point for understanding advanced decorators.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["A decorator is a function that takes a function and returns a function", "wrapper must use *args, **kwargs to accept any arguments", "functools.wraps(func) preserves __name__ and other attributes", "Don't forget to return result"],
                            explanation: "The essence of a decorator:\n@timer\ndef f(): ...\nis equivalent to f = timer(f)\n\nStructure:\n1. timer(func) receives the original function\n2. Define wrapper(*args, **kwargs) with wrapping logic\n3. wrapper calls func(*args, **kwargs) internally\n4. Return wrapper\n\nfunctools.wraps is important — without it, f.__name__ becomes \"wrapper\", which is confusing during debugging.",
                            frameworkTip: "When writing decorators in interviews, always remember @functools.wraps and return result. These two common mistakes are details interviewers specifically watch for.",
                            starterCode: """
                                import time
                                import functools

                                def timer(func):
                                    # Write a wrapper function
                                    # Record start time → execute original function → record end time → print elapsed
                                    pass
                            """,
                            expectedQuery: """
                                import time
                                import functools

                                def timer(func):
                                    @functools.wraps(func)
                                    def wrapper(*args, **kwargs):
                                        start = time.time()
                                        result = func(*args, **kwargs)
                                        end = time.time()
                                        print(f"{func.__name__} took {end - start:.4f}s")
                                        return result
                                    return wrapper
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "@retry Decorator",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a @retry(max_attempts=3) decorator:\n- If the function raises an exception, automatically retry up to max_attempts times\n- Wait 1 second between retries (use time.sleep)\n- If all retries fail, raise the last exception\n- Use functools.wraps to preserve metadata\n\nExample:\n@retry(max_attempts=3)\ndef unstable_api():\n    import random\n    if random.random() < 0.7:\n        raise ConnectionError(\"API timeout\")\n    return \"success\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "Decorator Classic Trio #2: Auto-Retry",
                                narrative: "You're on Meta's infrastructure team. API calls occasionally fail due to network instability. You need to write a @retry decorator that automatically retries failed functions. This is an essential defense mechanism in microservice architectures.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Decorator with parameters needs three levels: retry(params) → decorator(func) → wrapper(*args, **kwargs)", "Use a for loop to control retry count", "Use try/except to catch exceptions, raise on final failure", "No sleep needed after the last retry"],
                            explanation: "A decorator with parameters has three layers:\n1. retry(max_attempts) — receives the decorator's parameters\n2. decorator(func) — receives the decorated function\n3. wrapper(*args, **kwargs) — the actual wrapping logic\n\n@retry(max_attempts=3) is equivalent to:\ndecorator = retry(max_attempts=3)\nf = decorator(f)\n\nThe retry pattern is extremely common in production, especially for network requests, database connections, and other unstable operations.",
                            frameworkTip: "Writing a decorator with parameters (three-level nesting) in an interview is a hallmark of intermediate-to-advanced Python skills. Mentioning \"exponential backoff\" strategy earns bonus points.",
                            starterCode: """
                                import time
                                import functools

                                def retry(max_attempts=3):
                                    # Note: this is a "decorator with parameters"
                                    # Requires three levels of nested functions
                                    pass
                            """,
                            expectedQuery: """
                                import time
                                import functools

                                def retry(max_attempts=3):
                                    def decorator(func):
                                        @functools.wraps(func)
                                        def wrapper(*args, **kwargs):
                                            last_exception = None
                                            for attempt in range(max_attempts):
                                                try:
                                                    return func(*args, **kwargs)
                                                except Exception as e:
                                                    last_exception = e
                                                    if attempt < max_attempts - 1:
                                                        time.sleep(1)
                                            raise last_exception
                                        return wrapper
                                    return decorator
                            """
                        ),
                        Challenge(
                            id: 6,
                            name: "Memoization Concept",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which statement about memoization is correct?\n\n```python\nfrom functools import lru_cache\n\n@lru_cache(maxsize=128)\ndef fib(n):\n    if n < 2:\n        return n\n    return fib(n-1) + fib(n-2)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Memoization for Speeding Up Recursion",
                                narrative: "In a Meta interview, the interviewer gives you a recursive Fibonacci function and asks why fib(40) takes forever. You need to explain the memoization concept and Python's built-in solution.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "@lru_cache stores function results in a database permanently", explanation: "lru_cache stores results in memory, they disappear when the program ends."),
                                Challenge.Option(id: "B", text: "@lru_cache optimizes fib(40) from O(2^n) to O(n), because each fib(k) is computed only once and results are cached in memory", explanation: "Correct! Without cache, fib(40) repeats over 1 billion computations. With cache, fib(0) through fib(40) are each computed only once — 41 total computations."),
                                Challenge.Option(id: "C", text: "maxsize=128 means cache results for at most 128 seconds", explanation: "maxsize is the number of cached \"entries\", not time. When more than 128 different inputs are cached, the least recently used is evicted (LRU = Least Recently Used)."),
                                Challenge.Option(id: "D", text: "@lru_cache can only be used with recursive functions", explanation: "lru_cache can be used with any pure function, as long as inputs are hashable (cannot be list or dict)."),
                            ],
                            correctAnswer: "B",
                            hints: ["Memoization = remember previously computed results to avoid redundant computation", "LRU = Least Recently Used, the least recently used entries are evicted", "Key constraint: function parameters must be hashable"],
                            explanation: "The core idea of memoization:\n- Trade space for time by caching function results\n- Python has built-in @functools.lru_cache\n- fib(40) goes from O(2^n) ≈ 1 billion → O(n) = 40 computations\n\nConstraints:\n1. Function must be pure (same input → same output)\n2. Parameters must be hashable (no list or dict)\n3. maxsize=None means unlimited cache, maxsize=128 is the default",
                            frameworkTip: "In interviews, first explain why recursive fib is slow (overlapping subproblems), then propose memoization, then mention Python's @lru_cache. This shows a complete thought process from problem analysis to solution."
                        ),
                    ]
                ),
                Quest(
                    id: "17-6",
                    name: "Data Validation Function Suite (Boss)",
                    description: "Design a set of user input validation functions",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Design a Data Validator",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Registration Validation",
                                narrative: "You need to write validation functions for a user registration form. Validate:\n- Username: 3-20 characters, only letters and digits\n- Email: must contain @ and .\n- Age: integer between 18-120\n- Password: at least 8 characters, at least one uppercase letter and one digit",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Each function returns (bool, str) so the caller knows whether it is valid and why not", "Use any() with a generator to check password conditions"],
                            explanation: "Good validation function design: (1) Each function handles only one type of validation (2) Uniform return format (3) Specific error messages (4) An integration function that collects all errors.",
                            frameworkTip: "Validation design pattern: one function per field → uniform return format → integration function collects all errors."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 18,
            name: "Modules, Files & OOP",
            emoji: "📦",
            description: "import, pip, file I/O, class and OOP basics",
            quests: [
                Quest(
                    id: "18-1",
                    name: "import & Standard Library",
                    description: "Understanding import, from, as, and common standard libraries",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "import Syntax",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which import method is most recommended?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Importing Modules",
                                narrative: "You want to use the datetime module to get today's date.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "from datetime import *", explanation: "import * dumps all names into the namespace, easily causing conflicts — not recommended."),
                                Challenge.Option(id: "B", text: "from datetime import datetime", explanation: "Correct! Only imports the needed class, clear and explicit."),
                                Challenge.Option(id: "C", text: "import datetime as dt", explanation: "Also acceptable, but if you only need the datetime class, from import is more direct."),
                                Challenge.Option(id: "D", text: "require(\"datetime\")", explanation: "require is JavaScript/Node.js syntax. Python uses import."),
                            ],
                            correctAnswer: "B",
                            hints: ["from X import Y only imports what you need — clearer than import *"],
                            explanation: "Three import methods: import module (import all), from module import name (import specific), import module as alias (alias). PEP 8 discourages import *.",
                            frameworkTip: "import best practice: standard library → third-party → your own modules, with a blank line between each group."
                        ),
                        Challenge(
                            id: 2,
                            name: "Common Standard Libraries",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which standard library should you use?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Standard Library",
                                narrative: "You need to generate a random number between 1 and 100.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "import math", explanation: "math is for mathematical operations (trigonometry, logarithms, etc.), not random numbers."),
                                Challenge.Option(id: "B", text: "import random", explanation: "Correct! random.randint(1, 100) generates a random integer between 1 and 100."),
                                Challenge.Option(id: "C", text: "import os", explanation: "os is for operating system operations (file paths, environment variables, etc.)."),
                                Challenge.Option(id: "D", text: "import sys", explanation: "sys is for Python interpreter operations (command-line arguments, paths, etc.)."),
                            ],
                            correctAnswer: "B",
                            hints: ["The random module provides various random number generation functions"],
                            explanation: "Common standard libraries: os (filesystem), datetime (date/time), json (JSON processing), random (random numbers), math (mathematics), pathlib (paths), csv (CSV files).",
                            frameworkTip: "The standard library is a treasure trove! Check if the standard library has what you need before considering third-party packages."
                        ),
                        Challenge(
                            id: 3,
                            name: "Counter Word Frequency",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function top_keywords(reviews, n) that takes a list of review strings and a number n, and returns the top n most frequent words with their counts. Convert all words to lowercase.\n\nExample:\n```python\nreviews = [\"Great battery life\", \"Battery is amazing\", \"great screen\"]\ntop_keywords(reviews, 2)\n# → [(\"battery\", 2), (\"great\", 2)]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Product Review Keyword Analysis",
                                narrative: "You are on Amazon's product analytics team and need to quickly identify the most frequently mentioned keywords in customer reviews to understand what users praise or complain about most.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use str.lower().split() to break each review into words", "Counter can take a list directly to count elements", "Counter.most_common(n) returns the top n as (element, count) tuples"],
                            explanation: "collections.Counter is Python's most practical counting tool:\n- Counter(iterable) automatically counts occurrences of each element\n- .most_common(n) returns the top n most frequent elements\n- It's a dict subclass, supporting all dict operations\n\nWidely used in text analysis, log statistics, and similar scenarios.",
                            frameworkTip: "Amazon interviews love Counter questions, especially Top K frequency problems. Remember that Counter.most_common(n) has O(n log k) time complexity, more efficient than manual sorting.",
                            starterCode: """
                                from collections import Counter

                                def top_keywords(reviews, n):
                                    # 1. Split all reviews into words, convert to lowercase
                                    # 2. Use Counter to count word frequencies
                                    # 3. Return the top n most common
                                    pass
                            """,
                            expectedQuery: """
                                from collections import Counter

                                def top_keywords(reviews, n):
                                    words = []
                                    for review in reviews:
                                        words.extend(review.lower().split())
                                    counter = Counter(words)
                                    return counter.most_common(n)
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "defaultdict Grouping",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function group_orders(orders) that takes a list of orders (each order is a (category, product) tuple) and returns a dict where keys are categories and values are lists of products in that category.\n\nExample:\n```python\norders = [(\"Electronics\", \"Phone\"), (\"Clothing\", \"T-shirt\"), (\"Electronics\", \"Earbuds\"), (\"Clothing\", \"Jacket\")]\ngroup_orders(orders)\n# → {\"Electronics\": [\"Phone\", \"Earbuds\"], \"Clothing\": [\"T-shirt\", \"Jacket\"]}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Group Orders by Category",
                                narrative: "You are processing order data for an e-commerce platform and need to group orders by product category. With a regular dict you'd need to check if the key exists first, but defaultdict makes the code much cleaner.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["defaultdict(list) auto-initializes each new key with an empty list", "Just do grouped[key].append(value) without checking if key exists", "Convert back to regular dict with dict() at the end"],
                            explanation: "defaultdict's core value is eliminating the \"check if key exists first\" step:\n\nRegular dict approach:\nif key not in d:\n    d[key] = []\nd[key].append(value)\n\ndefaultdict approach:\nd[key].append(value)  # auto-initializes\n\nCommon factory functions: list, int, set, lambda: default_value",
                            frameworkTip: "Grouping problems are almost guaranteed in Amazon interviews. Using defaultdict is more Pythonic than dict.setdefault() and cleaner than manual initialization. Proactively mentioning defaultdict earns bonus points.",
                            starterCode: """
                                from collections import defaultdict

                                def group_orders(orders):
                                    # Use defaultdict(list) to auto-initialize empty lists
                                    pass
                            """,
                            expectedQuery: """
                                from collections import defaultdict

                                def group_orders(orders):
                                    grouped = defaultdict(list)
                                    for category, product in orders:
                                        grouped[category].append(product)
                                    return dict(grouped)
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "18-2",
                    name: "pip & Third-Party Packages",
                    description: "pip install, requirements.txt, venv",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "pip Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct installation command?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Installing Packages",
                                narrative: "You want to install the requests package to call APIs.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "python install requests", explanation: "Python is not a package manager — use pip."),
                                Challenge.Option(id: "B", text: "pip install requests", explanation: "Correct! pip is Python's package manager."),
                                Challenge.Option(id: "C", text: "npm install requests", explanation: "npm is JavaScript's package manager."),
                                Challenge.Option(id: "D", text: "import requests", explanation: "import is for using packages in code — not installing them. You must install before importing."),
                            ],
                            correctAnswer: "B",
                            hints: ["pip = Python's package manager"],
                            explanation: "pip install installs packages, pip freeze > requirements.txt exports the dependency list. Teams share requirements.txt to ensure consistent environments.",
                            frameworkTip: "First step for new projects: create venv → pip install → pip freeze > requirements.txt."
                        ),
                        Challenge(
                            id: 2,
                            name: "Virtual Environment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you resolve the version conflict?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Why Use venv",
                                narrative: "Project A needs requests 2.x, Project B needs requests 3.x. Both are on the same computer.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Reinstall the correct version every time you switch projects", explanation: "Too cumbersome and error-prone."),
                                Challenge.Option(id: "B", text: "Use venv to create an isolated virtual environment for each project", explanation: "Correct! venv creates isolated Python environments — each project has its own package versions."),
                                Challenge.Option(id: "C", text: "Use Docker", explanation: "Docker works but is too heavyweight. For Python projects, venv is sufficient."),
                                Challenge.Option(id: "D", text: "Rename different versions when importing", explanation: "Not practical — internal dependencies of packages can also conflict."),
                            ],
                            correctAnswer: "B",
                            hints: ["venv = one isolated Python environment per project"],
                            explanation: "python -m venv .venv creates a virtual environment. source .venv/bin/activate activates it (Mac/Linux). Each project has independent packages that do not interfere with each other.",
                            frameworkTip: "Project isolation is fundamental: venv isolates Python packages, .env isolates environment variables."
                        ),
                        Challenge(
                            id: 3,
                            name: "Virtual Environment Management",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which statement about Python virtual environments is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "venv vs conda",
                                narrative: "You join a data analytics team and the previous engineer left without documentation. You find both an environment.yml and a requirements.txt in the project. You need to figure out which tool to use for environment management.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "venv can manage different Python interpreter versions, while conda can only manage packages", explanation: "It's the opposite! venv can only create environments with the current Python version, while conda can specify different Python versions."),
                                Challenge.Option(id: "B", text: "conda can manage both Python versions and non-Python system dependencies (like CUDA, MKL), while venv only manages Python packages", explanation: "Correct! conda is a cross-language package manager that can install C/C++ libraries, CUDA toolkit, etc. venv is Python's built-in tool that only manages Python packages."),
                                Challenge.Option(id: "C", text: "venv and conda are functionally identical; it doesn't matter which one you choose", explanation: "venv is a lightweight Python built-in tool, while conda is a full package and environment management system with significant differences."),
                                Challenge.Option(id: "D", text: "Production projects should not use virtual environments; installing directly to system Python is more stable", explanation: "Not using virtual environments leads to package version conflicts between projects, which is very bad practice."),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about which tool can handle non-Python dependencies", "venv is part of the Python standard library", "conda comes from the Anaconda ecosystem"],
                            explanation: "Core differences between venv and conda:\n\nvenv (Python built-in):\n- Lightweight, fast, no extra installation needed\n- Only manages Python packages\n- Best for pure Python projects\n\nconda (Anaconda/Miniconda):\n- Can manage Python versions + non-Python dependencies\n- Best for data science (needs CUDA, MKL, etc.)\n- Has its own package repository: conda-forge",
                            frameworkTip: "Practical rule of thumb: use venv + pip for web development, conda for data science. Showing you know the difference in an interview demonstrates real-world project experience."
                        ),
                        Challenge(
                            id: 4,
                            name: "requirements.txt Best Practices",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which requirements.txt version specification is safest for a production environment?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Importance of Version Pinning",
                                narrative: "Your team deployed a Flask API to production, but the requirements.txt only specified flask>=2.0. One day Flask 3.0 was released with a breaking change, causing the production environment to crash. You need to understand the correct approach to version management.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "flask\nrequests\npandas", explanation: "Not specifying versions means \"install latest,\" which could install different versions on each deployment — very dangerous."),
                                Challenge.Option(id: "B", text: "flask>=2.0\nrequests>=2.28\npandas>=1.5", explanation: "Only setting a lower bound means a new major version with breaking changes could be installed. Not safe enough for production."),
                                Challenge.Option(id: "C", text: "flask==3.0.2\nrequests==2.31.0\npandas==2.1.4", explanation: "Correct! Using == to pin exact versions (pinning) ensures every deployment installs exactly the same versions. Generate with pip freeze > requirements.txt."),
                                Challenge.Option(id: "D", text: "flask~=3.0\nrequests~=2.31\npandas~=2.1", explanation: "~= allows patch version updates (e.g., 3.0.x), which is acceptable for development but still risky for production."),
                            ],
                            correctAnswer: "C",
                            hints: ["Reproducibility is the top priority in production", "pip freeze lists all installed packages with exact versions", "== is the strictest version specifier"],
                            explanation: "Version specification strategies:\n- Development: use ~= (compatible release) or >=,< (range) for flexibility\n- Production: use == to pin exact versions\n- Generate with: pip freeze > requirements.txt\n\nAdvanced tools: pip-compile (pip-tools) can automatically resolve dependencies and lock versions, similar to npm's package-lock.json.",
                            frameworkTip: "Mentioning pip freeze with exact version pinning in an interview shows you have production deployment experience. Going further to mention pip-tools or Poetry will impress interviewers."
                        ),
                    ]
                ),
                Quest(
                    id: "18-3",
                    name: "File I/O: txt/csv",
                    description: "open(), with, csv module",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "with open Syntax",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which approach is most recommended?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Reading a File",
                                narrative: "You want to read the entire contents of data.txt.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "f = open(\"data.txt\")\ndata = f.read()\nf.close()", explanation: "Works, but if an error occurs in between, f.close() will not be called, causing a resource leak."),
                                Challenge.Option(id: "B", text: "with open(\"data.txt\") as f:\n    data = f.read()", explanation: "Correct! The with statement automatically handles close(), even if an error occurs."),
                                Challenge.Option(id: "C", text: "data = open(\"data.txt\").read()", explanation: "No close() — the file will not be properly closed."),
                                Challenge.Option(id: "D", text: "import file\ndata = file.read(\"data.txt\")", explanation: "Python has no file module. Use the built-in open()."),
                            ],
                            correctAnswer: "B",
                            hints: ["with statement = automatic resource management (context manager), ensures the file is closed"],
                            explanation: "with open() as f: is the standard pattern for reading/writing files in Python. with automatically closes the file when the block ends, regardless of errors.",
                            frameworkTip: "All resources that need close() should be managed with with: files, database connections, network connections."
                        ),
                        Challenge(
                            id: 2,
                            name: "CSV Reading",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which class should you use?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Reading CSV",
                                narrative: "You have a sales.csv file and want to read each row as a dict.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "csv.reader — returns each row as a list", explanation: "csv.reader returns list of lists, without field names."),
                                Challenge.Option(id: "B", text: "csv.DictReader — returns each row as a dict", explanation: "Correct! DictReader uses the first row as keys, turning each row into a dict for more convenient access."),
                                Challenge.Option(id: "C", text: "json.load — universal reader", explanation: "json.load reads JSON, not CSV."),
                                Challenge.Option(id: "D", text: "pandas.read_csv — pandas is better", explanation: "pandas is more powerful, but for simple reading, the csv module is more lightweight."),
                            ],
                            correctAnswer: "B",
                            hints: ["DictReader lets you use row[\"column_name\"] for access, more intuitive than row[0]"],
                            explanation: "csv.DictReader uses the first row as keys and returns dicts. Suitable for structured CSV. csv.reader returns lists, suitable for simple data.",
                            frameworkTip: "Use the csv module for small files, pandas for large files or when analysis is needed. Tool selection principle: use what is sufficient."
                        ),
                        Challenge(
                            id: 3,
                            name: "Reading CSV & Aggregating",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function parse_csv_sales(csv_string) that takes a CSV-format string (first row is header: department,product,amount) and returns a dict with department name as key and total amount as value. Use csv module's DictReader and io.StringIO to parse the string.",
                            scenario: 
                            Challenge.Scenario(
                                title: "CSV Sales Aggregation",
                                narrative: "You received a CSV-format string (simulating file content) and need to parse and aggregate total sales by department.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["io.StringIO(s) turns a string into a file-like object that can be passed to csv.DictReader", "CSV values are all strings — amount needs to be converted to float", "Use dict.get(key, 0) for safe accumulation"],
                            explanation: "This exercise practices csv.DictReader with io.StringIO (simulating a file in memory), type conversion, and dict accumulation. This pattern is useful when processing CSV data returned from APIs.",
                            frameworkTip: "io.StringIO lets you test CSV parsing without an actual file. It is a great helper for writing tests.",
                            starterCode: """
                                import csv
                                import io

                                def parse_csv_sales(csv_string):
                                    # Use io.StringIO to turn string into file-like object
                                    # Use csv.DictReader to read
                                    # Aggregate amount totals per department
                                    pass
                            """,
                            expectedQuery: """
                                import csv
                                import io

                                def parse_csv_sales(csv_string):
                                    reader = csv.DictReader(io.StringIO(csv_string))
                                    totals = {}
                                    for row in reader:
                                        dept = row["department"]
                                        amount = float(row["amount"])
                                        totals[dept] = totals.get(dept, 0) + amount
                                    return totals
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Large CSV Line-by-Line Processing",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function sum_column(filepath, column_name) that calculates the sum of a specified column in a CSV file using line-by-line reading, without loading the entire file into memory.\n\nAssume the first row is a header and the specified column contains numbers.\n\nExample CSV:\n```\norder_id,amount,category\n1,250.5,Electronics\n2,89.9,Clothing\n3,1200.0,Electronics\n```\nsum_column(\"orders.csv\", \"amount\") → 1540.4",
                            scenario: 
                            Challenge.Scenario(
                                title: "Processing 10GB of Transaction Records",
                                narrative: "You are on Amazon's data team and need to process a 10GB CSV file of transaction records. Using pandas.read_csv() directly would load the entire file into memory, causing a MemoryError. You need a more memory-efficient approach.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["csv.DictReader automatically uses the first row as keys", "for row in reader reads line by line — only one row in memory at a time", "Remember to convert string values to float"],
                            explanation: "The core principle for large files is \"process line by line\" not \"load everything\":\n\nMemory-exploding approach:\ndf = pd.read_csv(\"big.csv\")  # loads all 10GB\n\nMemory-friendly approach:\nwith open(\"big.csv\") as f:\n    reader = csv.DictReader(f)\n    for row in reader:  # one row at a time\n        ...\n\npandas also has a chunksize parameter for batch reading:\nfor chunk in pd.read_csv(\"big.csv\", chunksize=10000):\n    ...",
                            frameworkTip: "Amazon interviews heavily value memory efficiency. When an interviewer says \"the file is large,\" immediately think of line-by-line processing or generators. Mentioning both csv.DictReader and pandas chunksize demonstrates breadth.",
                            starterCode: """
                                import csv

                                def sum_column(filepath, column_name):
                                    # Use csv.DictReader for line-by-line reading
                                    # Do NOT load the entire file at once
                                    pass
                            """,
                            expectedQuery: """
                                import csv

                                def sum_column(filepath, column_name):
                                    total = 0
                                    with open(filepath, "r", encoding="utf-8") as f:
                                        reader = csv.DictReader(f)
                                        for row in reader:
                                            total += float(row[column_name])
                                    return total
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Encoding Handling",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most robust approach to read a CSV file that might be encoded in Shift-JIS?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Encoding Crisis",
                                narrative: "You receive a CSV file from a Japanese supplier and get a UnicodeDecodeError when reading it with Python. You need to understand file encoding concepts to solve this problem.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "open(\"data.csv\", \"r\") without specifying encoding", explanation: "Without specifying encoding, Python uses the system default (usually UTF-8 or system locale), which will raise an error for non-UTF-8 files."),
                                Challenge.Option(id: "B", text: "open(\"data.csv\", \"r\", encoding=\"utf-8\", errors=\"ignore\")", explanation: "errors=\"ignore\" silently drops characters that can't be decoded, causing data loss — very dangerous in data processing."),
                                Challenge.Option(id: "C", text: "First detect encoding using chardet or charset-normalizer, then open the file with the detected encoding", explanation: "Correct! Detect-then-read is the most robust approach. chardet.detect() returns the detected encoding and a confidence score, letting you verify before reading with the correct encoding."),
                                Challenge.Option(id: "D", text: "Read in binary mode with open(\"data.csv\", \"rb\") to avoid all encoding issues", explanation: "Binary mode returns bytes not str — you still need to decode to process text content."),
                            ],
                            correctAnswer: "C",
                            hints: ["Python 3's str is Unicode; reading requires the correct encoding to decode", "chardet is a library that auto-detects file encoding", "Reading with the wrong encoding produces garbled text or errors"],
                            explanation: "Best practice for files with unknown encoding:\n\n```python\nimport chardet\n\n# 1. Detect encoding\nwith open(\"data.csv\", \"rb\") as f:\n    result = chardet.detect(f.read())\n    encoding = result[\"encoding\"]  # e.g., \"Shift_JIS\"\n\n# 2. Read with correct encoding\nwith open(\"data.csv\", \"r\", encoding=encoding) as f:\n    content = f.read()\n```\n\nCommon encodings: UTF-8 (universal), Big5 (Traditional Chinese), Shift-JIS (Japanese), GBK (Simplified Chinese).",
                            frameworkTip: "Proactively mentioning encoding handling in file processing questions shows practical experience. Encoding issues are one of the most common bug sources when dealing with multilingual data."
                        ),
                    ]
                ),
                Quest(
                    id: "18-4",
                    name: "JSON Read/Write",
                    description: "json.load/dump, nested structures",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "JSON Operations",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "JSON Read/Write",
                                narrative: "You want to write a dict to a JSON file.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "with open(\"data.json\", \"w\") as f:\n    json.dump(data, f)", explanation: "Correct! json.dump() writes a Python object to a file."),
                                Challenge.Option(id: "B", text: "with open(\"data.json\", \"w\") as f:\n    f.write(data)", explanation: "data is a dict — you cannot write it directly. It must be converted to a JSON string first."),
                                Challenge.Option(id: "C", text: "json.save(data, \"data.json\")", explanation: "The json module has no save() function. It is dump()."),
                                Challenge.Option(id: "D", text: "with open(\"data.json\") as f:\n    json.dump(data, f)", explanation: "Missing \"w\" mode. The default is \"r\" (read) — writing requires \"w\"."),
                            ],
                            correctAnswer: "A",
                            hints: ["json.dump(object, file) writes to file, json.dumps(object) converts to string"],
                            explanation: "Four core json functions: load (file→Python), loads (string→Python), dump (Python→file), dumps (Python→string).",
                            frameworkTip: "Memory trick: load/dump are file operations, adding s is for string operations. s = string."
                        ),
                        Challenge(
                            id: 2,
                            name: "Nested JSON Access",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you get Alice's second score?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Nested Structures",
                                narrative: "You have JSON data:\ndata = {\"users\": [{\"name\": \"Alice\", \"scores\": [90, 85, 92]}]}",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "data.users[0].scores[1]", explanation: "Python dicts cannot use dot notation. Use [\"key\"]."),
                                Challenge.Option(id: "B", text: "data[\"users\"][0][\"scores\"][1]", explanation: "Correct! Access nested structures layer by layer using [\"key\"] and [index]."),
                                Challenge.Option(id: "C", text: "data.get(\"users.0.scores.1\")", explanation: ".get() does not support nested path syntax."),
                                Challenge.Option(id: "D", text: "data[\"users\"][\"scores\"][1]", explanation: "Missing [0]. users is a list — you must specify the index first."),
                            ],
                            correctAnswer: "B",
                            hints: ["dicts use [\"key\"], lists use [index] — access layer by layer"],
                            explanation: "Nested JSON access: dicts use [\"key\"], lists use [index]. For safe access, use try/except or chained .get() calls.",
                            frameworkTip: "When working with nested JSON, print the structure first (json.dumps(data, indent=2)) to understand the hierarchy."
                        ),
                        Challenge(
                            id: 3,
                            name: "JSON Data Transformer",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function transform_api_data(api_response) that takes a dict (API response) in this format:\n{\"results\": [{\"user_name\": \"alice_chen\", \"total_score\": 95, \"is_active\": true}]}\nand transforms it to your system format:\n[{\"name\": \"Alice Chen\", \"score\": 95, \"status\": \"active\"}]\nRules:\n- user_name: split by underscore, capitalize first letter of each word, join with spaces\n- total_score: rename to score\n- is_active: true → status = \"active\", false → \"inactive\"\n- If results does not exist, return empty list",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Data Transformation",
                                narrative: "The JSON format from the API differs from your system — you need to transform it.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: [".get(\"results\", []) for safe access", "split(\"_\") to split + capitalize() for first letter + \" \".join() to combine", "Ternary expression: x if condition else y"],
                            explanation: "This exercise practices JSON/dict data transformation: safe access (.get), string processing (split/capitalize/join), conditional expressions, and building new dicts. API data transformation is a daily task in backend development.",
                            frameworkTip: "API data transformation pattern: extract → map fields → transform values → assemble new structure.",
                            starterCode: """
                                def transform_api_data(api_response):
                                    # Extract results (may not exist)
                                    # Transform each record format
                                    # Return the transformed list
                                    pass
                            """,
                            expectedQuery: """
                                def transform_api_data(api_response):
                                    results = api_response.get("results", [])
                                    transformed = []
                                    for item in results:
                                        name = " ".join(word.capitalize() for word in item["user_name"].split("_"))
                                        transformed.append({
                                            "name": name,
                                            "score": item["total_score"],
                                            "status": "active" if item["is_active"] else "inactive",
                                        })
                                    return transformed
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Flatten Nested JSON",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function flatten_dict(d, parent_key=\"\", sep=\".\") that flattens a nested dict into a single level, joining keys with \".\".\n\nExample:\n```python\ndata = {\n    \"user\": {\n        \"name\": \"Alice\",\n        \"address\": {\n            \"city\": \"Taipei\",\n            \"zip\": \"100\"\n        }\n    },\n    \"active\": True\n}\nflatten_dict(data)\n# → {\"user.name\": \"Alice\", \"user.address.city\": \"Taipei\", \"user.address.zip\": \"100\", \"active\": True}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Convert Complex API Response to Table",
                                narrative: "You received deeply nested JSON data from a third-party API and need to \"flatten\" it into a single-level dict so it can be converted to CSV or stored in a flat database table.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["This is a recursion problem: recurse when the value is a dict", "Use parent_key to track the full path", "isinstance(v, dict) determines whether to continue recursing"],
                            explanation: "Flattening nested dicts is an extremely common data processing operation:\n\nCore logic:\n1. Iterate over each key-value pair\n2. If value is a dict → recursively flatten, joining keys with sep\n3. If value is not a dict → add directly to result\n\nIn practice, you can also use pandas.json_normalize(), but interviews usually require you to write the recursive version.",
                            frameworkTip: "Flatten dict is a high-frequency question on HackerRank and in interviews. The key is demonstrating recursive thinking and proper base case handling. Advanced: consider handling dicts nested inside lists.",
                            starterCode: """
                                def flatten_dict(d, parent_key="", sep="."):
                                    # Use recursion to handle nested structures
                                    # If a value is a dict, keep flattening
                                    # Otherwise, add it to the result
                                    pass
                            """,
                            expectedQuery: """
                                def flatten_dict(d, parent_key="", sep="."):
                                    items = []
                                    for k, v in d.items():
                                        new_key = f"{parent_key}{sep}{k}" if parent_key else k
                                        if isinstance(v, dict):
                                            items.extend(flatten_dict(v, new_key, sep).items())
                                        else:
                                            items.append((new_key, v))
                                    return dict(items)
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "API Response Parsing with Error Handling",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function safe_get(data, keys, default=None) that safely retrieves values from a nested dict. keys is a list of key paths, and if any key along the way doesn't exist, return default.\n\nExample:\n```python\nresponse = {\"data\": {\"weather\": {\"temp\": 25.5}}}\n\nsafe_get(response, [\"data\", \"weather\", \"temp\"])  # → 25.5\nsafe_get(response, [\"data\", \"wind\", \"speed\"])    # → None\nsafe_get(response, [\"data\", \"wind\", \"speed\"], 0) # → 0\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Safely Extract Data from APIs",
                                narrative: "You are integrating a weather API, but the JSON response structure is unstable — sometimes fields are missing, sometimes key names are inconsistent. You need a safe parsing function.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Iterate through the keys list, going one level deeper each time", "Use isinstance(current, dict) to ensure the current level is a dict", "Return default immediately if any key is not found"],
                            explanation: "Safe value retrieval is essential for API response handling:\n\nDangerous approach (may raise KeyError):\ntemp = response[\"data\"][\"weather\"][\"temp\"]\n\nSafe approach:\ntemp = safe_get(response, [\"data\", \"weather\", \"temp\"], 0)\n\nPython 3.8+ also supports the walrus operator with dict.get():\nif (d := response.get(\"data\")) and (w := d.get(\"weather\")):\n    temp = w.get(\"temp\", 0)",
                            frameworkTip: "Showing that you consider unstable API responses demonstrates defensive programming thinking. Discussing the trade-offs between try/except vs proactive checking shows practical experience.",
                            starterCode: """
                                def safe_get(data, keys, default=None):
                                    # Traverse level by level
                                    # Return default if any level fails
                                    pass
                            """,
                            expectedQuery: """
                                def safe_get(data, keys, default=None):
                                    current = data
                                    for key in keys:
                                        if isinstance(current, dict) and key in current:
                                            current = current[key]
                                        else:
                                            return default
                                    return current
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "18-5",
                    name: "OOP Basics: class",
                    description: "__init__, self, methods, attributes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "class Definition",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct definition?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Your First class",
                                narrative: "You want to define a User class where each user has a name and email.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class User:\n    def __init__(self, name, email):\n        self.name = name\n        self.email = email", explanation: "Correct! __init__ is the constructor, and self is a reference to the instance itself."),
                                Challenge.Option(id: "B", text: "class User:\n    name = \"\"\n    email = \"\"", explanation: "These are class attributes (shared by all instances), not instance attributes. Each user should have their own name."),
                                Challenge.Option(id: "C", text: "def User(name, email):\n    return {\"name\": name, \"email\": email}", explanation: "This is a function returning a dict, not a class. You cannot add methods or use inheritance."),
                                Challenge.Option(id: "D", text: "class User:\n    def init(self, name, email):\n        self.name = name", explanation: "The constructor must be called __init__ (double underscores on each side), not init."),
                            ],
                            correctAnswer: "A",
                            hints: ["__init__ is Python's constructor, self is a required first parameter"],
                            explanation: "__init__ is automatically called when creating an instance. self represents the instance itself. Unlike Java which automatically binds this, Python requires explicit self.",
                            frameworkTip: "Three things about Python classes: __init__ for initialization, self to reference the instance, and methods always take self as the first parameter."
                        ),
                        Challenge(
                            id: 2,
                            name: "Methods & Attributes",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct way to write it?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Adding a Method",
                                narrative: "You want to add a greet() method to the User class.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class User:\n    def greet():\n        return f\"Hi, I am {name}\"", explanation: "Methods must have a self parameter, and use self.name to access attributes."),
                                Challenge.Option(id: "B", text: "class User:\n    def greet(self):\n        return f\"Hi, I am {self.name}\"", explanation: "Correct! The first parameter of a method is self, and instance attributes are accessed via self.name."),
                                Challenge.Option(id: "C", text: "class User:\n    greet = lambda: f\"Hi, I am {self.name}\"", explanation: "lambda cannot access self (unless it is a parameter), and is not suitable for class methods."),
                                Challenge.Option(id: "D", text: "def User.greet(self):\n    return f\"Hi, I am {self.name}\"", explanation: "Python cannot define methods outside the class using class.method syntax. Methods must be defined inside the class."),
                            ],
                            correctAnswer: "B",
                            hints: ["The first parameter of a class method is always self"],
                            explanation: "Instance methods must have self as the first parameter. Access instance attributes and other methods through self. When calling, you do not pass self — Python handles it automatically.",
                            frameworkTip: "Remember: include self when defining methods, omit it when calling. user.greet() not user.greet(user)."
                        ),
                        Challenge(
                            id: 3,
                            name: "Designing an Inventory Class",
                            type: .code,
                            difficulty: .hard,
                            question: "Design an Inventory class:\n- __init__(self): initialize an empty items dict\n- add_item(self, name, qty, price): if product exists, add to qty; otherwise create new. price updates to the latest.\n- remove_item(self, name, qty): reduce stock. If qty is insufficient, raise ValueError(\"Insufficient stock for {name}\")\n- get_value(self): return total inventory value (sum of qty * price for all items)\n- get_summary(self): return list of dicts, each with name, qty, price, value, sorted by value descending",
                            scenario: 
                            Challenge.Scenario(
                                title: "Inventory Management System",
                                narrative: "A warehouse needs a simple inventory management system to track product inflows and outflows.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use nested dicts: self.items = {\"Apple\": {\"qty\": 10, \"price\": 30}}", "Delete the key when stock reaches 0", "sorted's key parameter can use lambda"],
                            explanation: "This exercise practices complete class design: __init__ initialization, independent methods, raise for error handling, nested dict operations, and sorted + lambda for sorting. This is a comprehensive OOP basics exercise.",
                            frameworkTip: "Class design principles: each method has a single responsibility, state is stored in self, error cases use raise.",
                            starterCode: """
                                class Inventory:
                                    def __init__(self):
                                        # Initialize items dict
                                        pass

                                    def add_item(self, name, qty, price):
                                        pass

                                    def remove_item(self, name, qty):
                                        pass

                                    def get_value(self):
                                        pass

                                    def get_summary(self):
                                        pass
                            """,
                            expectedQuery: """
                                class Inventory:
                                    def __init__(self):
                                        self.items = {}

                                    def add_item(self, name, qty, price):
                                        if name in self.items:
                                            self.items[name]["qty"] += qty
                                            self.items[name]["price"] = price
                                        else:
                                            self.items[name] = {"qty": qty, "price": price}

                                    def remove_item(self, name, qty):
                                        if name not in self.items or self.items[name]["qty"] < qty:
                                            raise ValueError(f"Insufficient stock for {name}")
                                        self.items[name]["qty"] -= qty
                                        if self.items[name]["qty"] == 0:
                                            del self.items[name]

                                    def get_value(self):
                                        return sum(item["qty"] * item["price"] for item in self.items.values())

                                    def get_summary(self):
                                        summary = []
                                        for name, item in self.items.items():
                                            value = item["qty"] * item["price"]
                                            summary.append({"name": name, "qty": item["qty"], "price": item["price"], "value": value})
                                        return sorted(summary, key=lambda x: x["value"], reverse=True)
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "dataclass vs Traditional class",
                            type: .code,
                            difficulty: .medium,
                            question: "Rewrite the following traditional class as a dataclass. The dataclass should auto-generate __init__, __repr__, __eq__, and include a custom method.\n\nTraditional approach:\n```python\nclass Product:\n    def __init__(self, name, price, quantity=0):\n        self.name = name\n        self.price = price\n        self.quantity = quantity\n    \n    def total_value(self):\n        return self.price * self.quantity\n```\n\nRewrite using @dataclass with type hints.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Modern Python Data Classes",
                                narrative: "During a code review at Google, you are asked to rewrite a traditional class as a dataclass. A senior engineer says \"After Python 3.7, pure data classes should use the @dataclass decorator.\" You need to understand why.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The @dataclass decorator auto-generates __init__, __repr__, __eq__", "Define fields with name: type = default_value syntax", "Custom methods are written normally inside the class"],
                            explanation: "@dataclass advantages:\n\n1. Auto-generates __init__ (no more self.x = x boilerplate)\n2. Auto-generates __repr__ (readable string representation)\n3. Auto-generates __eq__ (value comparison instead of identity)\n4. Enforces type hints, making code clearer\n5. Supports frozen=True for immutable objects\n\nA traditional class takes 15 lines; a dataclass takes just 5.",
                            frameworkTip: "Mentioning dataclass in a Google interview shows you know modern Python. Remember: dataclass is a Python 3.7+ feature. It's not meant to replace all classes — just classes that primarily hold data.",
                            starterCode: """
                                from dataclasses import dataclass

                                # Rewrite Product class using @dataclass
                                # Keep the total_value method
                                pass
                            """,
                            expectedQuery: """
                                from dataclasses import dataclass

                                @dataclass
                                class Product:
                                    name: str
                                    price: float
                                    quantity: int = 0

                                    def total_value(self) -> float:
                                        return self.price * self.quantity
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "__repr__ vs __str__",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nclass User:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n    \n    def __repr__(self):\n        return f\"User('{self.name}', {self.age})\"\n    \n    def __str__(self):\n        return f\"{self.name} (age {self.age})\"\n\nu = User(\"Alice\", 25)\nprint(str(u))\nprint(repr(u))\nprint([u])\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Two String Representations of Objects",
                                narrative: "An interviewer asks: \"What is the difference between __repr__ and __str__ in Python? When should you use which?\" This is a classic Google OOP fundamentals question.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Alice (age 25)\nUser('Alice', 25)\nUser('Alice', 25)", explanation: "Close, but when a list prints its elements, it uses __repr__ and wraps them in square brackets."),
                                Challenge.Option(id: "B", text: "Alice (age 25)\nUser('Alice', 25)\n[User('Alice', 25)]", explanation: "Correct! str() calls __str__, repr() calls __repr__. Containers (list, dict) display their elements using __repr__, not __str__."),
                                Challenge.Option(id: "C", text: "User('Alice', 25)\nUser('Alice', 25)\n[User('Alice', 25)]", explanation: "str(u) will prefer __str__ when defined. It only falls back to __repr__ when __str__ is not defined."),
                                Challenge.Option(id: "D", text: "Alice (age 25)\nAlice (age 25)\n[Alice (age 25)]", explanation: "repr() always calls __repr__, never __str__. And list elements are displayed using __repr__."),
                            ],
                            correctAnswer: "B",
                            hints: ["str() calls __str__, repr() calls __repr__", "If only __repr__ is defined (no __str__), str() falls back to __repr__", "Lists use __repr__ when displaying their elements"],
                            explanation: "Key differences between __repr__ and __str__:\n\n__repr__: for developers, should be \"precise,\" ideally eval()-able back to the object\n- Use: debugging, logging, container element display\n- Called by: repr(obj), typing obj in REPL\n\n__str__: for end users, should be \"readable\"\n- Use: print(), f-strings, str()\n- Called by: str(obj), print(obj)\n\nImportant: if you can only implement one, prioritize __repr__ because __str__ falls back to __repr__.",
                            frameworkTip: "Mentioning that \"__repr__ should ideally be eval()-able back to the original object\" in a Google interview shows you understand Python's design philosophy. Remember: containers (list, dict) display elements using __repr__."
                        ),
                    ]
                ),
                Quest(
                    id: "18-6",
                    name: "Config Reader (Boss)",
                    description: "Design a class to read JSON config files",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Config Reader Class",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Configuration File Manager",
                                narrative: "Your team has a JSON config file config.json:\n{\n    \"app_name\": \"MyApp\",\n    \"version\": \"1.0.0\",\n    \"database\": {\n        \"host\": \"localhost\",\n        \"port\": 5432,\n        \"name\": \"mydb\"\n    },\n    \"features\": {\n        \"dark_mode\": true,\n        \"notifications\": false\n    }\n}\n\nYou need to design a ConfigReader class to manage the configuration.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use split(\".\") to break \"database.host\" into [\"database\", \"host\"]", "Traverse keys to go deeper into the dict layer by layer"],
                            explanation: "This class integrates: OOP (class/init/self), file I/O (open/with), JSON operations, nested dict operations, and error handling.",
                            frameworkTip: "Class design principle: one class does one thing. ConfigReader is only responsible for config file CRUD."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 19,
            name: "Pythonic Thinking & Data Processing",
            emoji: "🐼",
            description: "List comprehension, PEP 8, pandas data processing",
            quests: [
                Quest(
                    id: "19-1",
                    name: "List Comprehension",
                    description: "Syntax, conditional filtering, nesting",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Basic Syntax",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which is the correct list comprehension?",
                            scenario: 
                            Challenge.Scenario(
                                title: "List Comprehension",
                                narrative: "You have nums = [1, 2, 3, 4, 5] and want to produce the square of each element.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[x ** 2 for x in nums]", explanation: "Correct! This is the most basic list comprehension syntax: [expression for variable in iterable]."),
                                Challenge.Option(id: "B", text: "[for x in nums: x ** 2]", explanation: "Syntax error. The expression goes before for, and no colon is needed."),
                                Challenge.Option(id: "C", text: "nums.map(x => x ** 2)", explanation: "This is JavaScript syntax, not Python."),
                                Challenge.Option(id: "D", text: "[x ** 2 in nums]", explanation: "Missing the for keyword."),
                            ],
                            correctAnswer: "A",
                            hints: ["Format: [expression for variable in iterable]"],
                            explanation: "List comprehension is one of the most Pythonic features. It is more concise and faster than a for loop + append.",
                            frameworkTip: "When you see a for + append pattern, think about replacing it with a list comprehension."
                        ),
                        Challenge(
                            id: 2,
                            name: "Comprehension with Conditions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Conditional Filtering",
                                narrative: "You want to get the squares of even numbers from nums = [1, 2, 3, 4, 5, 6, 7, 8].",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[x ** 2 for x in nums if x % 2 == 0]", explanation: "Correct! The if goes at the end to filter elements. Result: [4, 16, 36, 64]."),
                                Challenge.Option(id: "B", text: "[x ** 2 if x % 2 == 0 for x in nums]", explanation: "if before for is a ternary expression, not a filter. Syntax error."),
                                Challenge.Option(id: "C", text: "[x ** 2 for x in nums where x % 2 == 0]", explanation: "Python has no where keyword (that is SQL). Use if."),
                                Challenge.Option(id: "D", text: "[x ** 2 for x in nums].filter(even)", explanation: "Python lists have no .filter() method."),
                            ],
                            correctAnswer: "A",
                            hints: ["Filter condition goes at the end: [expression for x in collection if condition]"],
                            explanation: "List comprehension with condition: [expression for x in collection if condition]. if at the end is for filtering; if in the expression position is a ternary operation.",
                            frameworkTip: "Readability rule: if the comprehension exceeds one line, switch to a regular for loop."
                        ),
                        Challenge(
                            id: 3,
                            name: "List Comprehension Data Transformation",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function process_employees(employees) that takes a list of dicts (each with \"name\", \"department\", \"salary\" fields). Use list comprehension to:\n1. Filter out records where salary is None or <= 0\n2. Transform each into a new dict: {\"name\": uppercase, \"dept\": first 3 chars of department, \"annual\": salary * 12}\nComplete it in one list comprehension.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Report Data Preprocessing",
                                narrative: "You need to use list comprehension to quickly clean and transform employee data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The if condition in list comprehension goes at the end", "String slicing [:3] takes the first three characters", "You can construct new dicts inside the comprehension"],
                            explanation: "This exercise practices advanced list comprehension: simultaneous filtering (if) and transformation (building new dicts in the expression). Doing filter + map in one line is a Python strength.",
                            frameworkTip: "List comprehension replaces filter + map: [transform(x) for x in items if condition(x)].",
                            starterCode: """
                                def process_employees(employees):
                                    # Use one list comprehension for filtering and transformation
                                    pass
                            """,
                            expectedQuery: """
                                def process_employees(employees):
                                    return [
                                        {"name": e["name"].upper(), "dept": e["department"][:3], "annual": e["salary"] * 12}
                                        for e in employees
                                        if e["salary"] is not None and e["salary"] > 0
                                    ]
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Dict Comprehension Aggregation",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function build_lookup(products) that takes a list of dicts (each with \"id\", \"name\", \"price\", \"category\"). Use dict comprehension to return:\n1. A lookup table with id as key and the entire product dict as value\n2. Only include products where price > 0\nAlso write a function category_prices(products) that uses dict comprehension to return:\nThe average price for each category (hint: you may need to group first, then average).",
                            scenario: 
                            Challenge.Scenario(
                                title: "Building Lookup Tables",
                                narrative: "You need to convert a product list into a format convenient for lookups.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["dict comprehension: {key_expr: value_expr for item in iterable if condition}", "setdefault automatically creates a default value when the key does not exist", "Two steps: group and collect first, then use comprehension for averages"],
                            explanation: "This exercise practices dict comprehension and setdefault. build_lookup demonstrates building a lookup table in one line. category_prices demonstrates the group-then-aggregate pattern.",
                            frameworkTip: "Dict comprehension suits one-to-one mappings. Many-to-one aggregations (like groupby) usually need a loop for grouping first.",
                            starterCode: """
                                def build_lookup(products):
                                    # dict comprehension: {id: product_dict}
                                    # Filter price > 0
                                    pass

                                def category_prices(products):
                                    # Group first using a regular approach, then use dict comprehension for averages
                                    pass
                            """,
                            expectedQuery: """
                                def build_lookup(products):
                                    return {p["id"]: p for p in products if p["price"] > 0}

                                def category_prices(products):
                                    groups = {}
                                    for p in products:
                                        groups.setdefault(p["category"], []).append(p["price"])
                                    return {cat: round(sum(prices) / len(prices), 2) for cat, prices in groups.items()}
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Nested List Comprehension",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function flatten_filter(matrix, threshold) that uses nested list comprehension to flatten a 2D list, keeping only values greater than threshold, sorted in ascending order.\n\nExample:\nflatten_filter([[10, 200, 30], [400, 5, 60]], 50) → [60, 200, 400]",
                            scenario: 
                            Challenge.Scenario(
                                title: "Transaction Data Matrix Transformation",
                                narrative: "You're on Meta's business analytics team and received nested transaction data. You need to flatten a 2D matrix into a 1D list while filtering out values below a threshold.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Nested list comprehension order: outer for first, inner for second", "The if condition goes at the end", "Use sorted() to sort the result"],
                            explanation: "Nested list comprehension reading order:\n[expression for outer in outer_list for inner in inner_list if condition]\n\nEquivalent to:\nresult = []\nfor row in matrix:\n    for x in row:\n        if x > threshold:\n            result.append(x)\n\nThis is a commonly tested Python technique in interviews, showing you can concisely handle nested data.",
                            frameworkTip: "In interviews, first write the logic using for loops, verify correctness, then refactor into list comprehension. This shows your thought process is clear and structured.",
                            starterCode: """
                                def flatten_filter(matrix, threshold):
                                    # Use nested list comprehension to flatten and filter
                                    pass
                            """,
                            expectedQuery: """
                                def flatten_filter(matrix, threshold):
                                    return sorted([x for row in matrix for x in row if x > threshold])
                            """
                        ),
                        Challenge(
                            id: 6,
                            name: "Generator vs List Comprehension",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the main difference between these two code snippets?\n\n```python\n# Approach A\ntotal_a = sum([x**2 for x in range(10_000_000)])\n\n# Approach B\ntotal_b = sum(x**2 for x in range(10_000_000))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Critical Memory Difference",
                                narrative: "A Meta interviewer asks: when processing 10 million user behavior records, what's the memory difference between list comprehension and generator expression? This is a classic question that separates junior from senior engineers.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Different results — Approach B will error", explanation: "Both produce exactly the same result; only memory usage differs."),
                                Challenge.Option(id: "B", text: "Same result, but A creates a full list in memory while B uses a generator that produces values one at a time with near-zero memory", explanation: "Correct! List comprehension [x**2 for ...] builds a list of 10 million elements in memory. Generator expression (x**2 for ...) uses lazy evaluation, producing one value at a time with ~O(1) memory usage."),
                                Challenge.Option(id: "C", text: "Same result, B is faster but uses the same memory", explanation: "The main advantage of generators is memory efficiency, not speed."),
                                Challenge.Option(id: "D", text: "B is a syntax error — sum() cannot take a generator", explanation: "sum() can directly accept a generator expression, and this is actually the recommended approach."),
                            ],
                            correctAnswer: "B",
                            hints: ["[] creates a full list, () creates a generator", "Generator uses lazy evaluation", "When you only need to iterate once without indexing, generator is better"],
                            explanation: "List comprehension vs Generator expression:\n- [x for x in iterable]: builds the complete list at once, O(n) memory\n- (x for x in iterable): lazy evaluation, produces one value at a time, O(1) memory\n\nWhen you only need to iterate once (sum, max, min, any, all), use a generator to save memory. Use a list when you need multiple accesses or slicing.",
                            frameworkTip: "Mentioning \"I use generator expressions instead of list comprehensions when processing large datasets to save memory\" shows scalability awareness — something Meta and Google highly value."
                        ),
                        Challenge(
                            id: 7,
                            name: "Dict & Set Comprehension",
                            type: .code,
                            difficulty: .medium,
                            question: "Given orders = [(customer, amount), ...], write two functions:\n1. total_by_customer(orders) — return a dict with customer name as key, total spending as value\n2. vip_customers(totals) — return a set of customer names who spent above average\n\nExample:\norders = [(\"Alice\", 100), (\"Bob\", 200), (\"Alice\", 150), (\"Bob\", 50)]\ntotals = total_by_customer(orders) → {\"Alice\": 250, \"Bob\": 250}\nvip_customers({\"Alice\": 250, \"Bob\": 100, \"Carol\": 50}) → {\"Alice\", \"Bob\"}",
                            scenario: 
                            Challenge.Scenario(
                                title: "Quick Customer Spending Analysis",
                                narrative: "You're analyzing e-commerce order data and need to quickly build a dictionary of each customer's total spending, then find the set of VIP customers who spent above average.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Dict comprehension: {key: value for ... if ...}", "Set comprehension: {value for ... if ...}", "Calculate the average first, then filter with comprehension"],
                            explanation: "Dict comprehension {k: v for ...} and set comprehension {v for ...} extend list comprehension:\n- Dict: {customer: total for customer in customers}\n- Set: {customer for customer, amount in totals.items() if amount > avg}\n\nThese tools let you complete complex data transformations in a single line.",
                            frameworkTip: "Showing you can flexibly use dict/set comprehension — not just list comprehension — tells the interviewer you have a comprehensive grasp of Python data structures.",
                            starterCode: """
                                def total_by_customer(orders):
                                    # Hint: accumulate using dict comprehension + sum
                                    pass

                                def vip_customers(totals):
                                    # Use set comprehension to find above-average customers
                                    pass
                            """,
                            expectedQuery: """
                                def total_by_customer(orders):
                                    customers = set(c for c, _ in orders)
                                    return {c: sum(a for cu, a in orders if cu == c) for c in customers}

                                def vip_customers(totals):
                                    avg = sum(totals.values()) / len(totals)
                                    return {c for c, v in totals.items() if v > avg}
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "19-2",
                    name: "Readability & PEP 8",
                    description: "Naming conventions, code style",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "PEP 8 Naming Conventions",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which set of names fully follows PEP 8?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python Naming Standards",
                                narrative: "You notice your colleague's naming style during a code review.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "function: calculateTotal, class: user_model", explanation: "Functions should use snake_case, classes should use PascalCase. Both are reversed."),
                                Challenge.Option(id: "B", text: "function: calculate_total, class: UserModel, constant: MAX_RETRIES", explanation: "Correct! Functions/variables use snake_case, classes use PascalCase, constants use UPPER_SNAKE_CASE."),
                                Challenge.Option(id: "C", text: "function: CalculateTotal, class: userModel", explanation: "Function uses PascalCase (should be for classes), class uses camelCase."),
                                Challenge.Option(id: "D", text: "All camelCase: calculateTotal, userModel, maxRetries", explanation: "camelCase is a JavaScript/Java convention, not Python."),
                            ],
                            correctAnswer: "B",
                            hints: ["Python: snake_case for functions and variables, PascalCase for classes"],
                            explanation: "PEP 8 naming: snake_case (functions, variables, methods), PascalCase (classes), UPPER_SNAKE_CASE (constants).",
                            frameworkTip: "Naming is the first step of code readability. Good names let you understand code without reading comments."
                        ),
                        Challenge(
                            id: 2,
                            name: "Zen of Python",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is NOT a Zen of Python principle?",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Zen of Python",
                                narrative: "Running import this in Python displays the Zen of Python.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Beautiful is better than ugly", explanation: "This is the first line of the Zen of Python."),
                                Challenge.Option(id: "B", text: "Explicit is better than implicit", explanation: "This is a Zen of Python principle: explicit is better than implicit."),
                                Challenge.Option(id: "C", text: "Performance is better than readability", explanation: "Correct! The Zen of Python emphasizes readability (Readability counts), not performance-first."),
                                Challenge.Option(id: "D", text: "Flat is better than nested", explanation: "This is a Zen of Python principle: flat is better than nested."),
                            ],
                            correctAnswer: "C",
                            hints: ["The Zen of Python emphasizes simplicity, readability, and explicitness"],
                            explanation: "Core spirit of the Zen of Python: readability counts, explicit is better than implicit, simple is better than complex, flat is better than nested. Performance matters, but not at the cost of readability.",
                            frameworkTip: "When writing Python, prioritize readability first. Only optimize after confirming a performance bottleneck. Premature optimization is the root of all evil."
                        ),
                        Challenge(
                            id: 3,
                            name: "Code Refactoring Exercise",
                            type: .code,
                            difficulty: .medium,
                            question: "Refactor the following code to comply with PEP 8. Requirements:\n1. Fix naming (variables use snake_case, constants use UPPER_CASE)\n2. Add proper spacing and blank lines\n3. Use more Pythonic idioms\n\n```python\ndef CalcStats(Data,minVal=0):\n  filteredData=[x for x in Data if x>=minVal]\n  N=len(filteredData)\n  if N==0:return None\n  Mean=sum(filteredData)/N\n  Variance=sum([(x-Mean)**2 for x in filteredData])/N\n  return {\"mean\":Mean,\"variance\":Variance,\"count\":N}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Fix Non-Compliant Code",
                                narrative: "You joined a data analytics team and the previous engineer left behind code that works correctly but has terrible style. Your manager asks you to refactor it to comply with PEP 8 and improve readability.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["PEP 8: function and variable names use snake_case", "Add spaces around operators (=, ==, >=, **, /)", "Don't put return on the same line as if — use a new line with indentation"],
                            explanation: "Key PEP 8 refactoring items:\n1. Naming: CalcStats → calc_stats, filteredData → filtered_data\n2. Spacing: x>=minVal → x >= min_val\n3. Indentation: return after if should be on a new line\n4. Blank lines: add between logical blocks for readability\n5. Docstring: add a description at the function start\n6. Minor optimization: remove [] in sum([(x-Mean)**2 ...]) to use a generator instead",
                            frameworkTip: "In code review or pair programming interviews, proactively suggesting PEP 8 improvements shows your code quality awareness. Good naming habits are a key differentiator between beginners and experienced engineers.",
                            starterCode: """
                                # Refactor the code to comply with PEP 8
                                # 1. Function and variable names use snake_case
                                # 2. Add spaces around operators
                                # 3. Use blank lines to separate logical blocks

                                def calc_stats(data, min_val=0):
                                    pass
                            """,
                            expectedQuery: """
                                def calc_stats(data, min_val=0):
                                    \"""Calculate basic statistics for filtered data.\"""
                                    filtered_data = [x for x in data if x >= min_val]
                                    n = len(filtered_data)

                                    if n == 0:
                                        return None

                                    mean = sum(filtered_data) / n
                                    variance = sum((x - mean) ** 2 for x in filtered_data) / n

                                    return {"mean": mean, "variance": variance, "count": n}
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Naming Conventions & Readability",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "According to PEP 8, which group of naming conventions is entirely correct?\n\n```python\n# Group A\nMAX_RETRY_COUNT = 3\ndef calculate_revenue(raw_data):\n    total_amount = sum(raw_data)\n\n# Group B  \nMaxRetryCount = 3\ndef CalculateRevenue(rawData):\n    TotalAmount = sum(rawData)\n\n# Group C\nmax_retry_count = 3\ndef calculate_revenue(RawData):\n    total_amount = sum(RawData)\n\n# Group D\nMAX_RETRY_COUNT = 3\ndef Calculate_Revenue(raw_data):\n    total_amount = sum(raw_data)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python Naming Convention Quick Reference",
                                narrative: "A new data analyst on your team asks about Python naming conventions. As the team's Python mentor, you need to clearly explain which naming style to use in different scenarios.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Group A", explanation: "Correct! Constants use UPPER_SNAKE_CASE, functions and variables use lower_snake_case — this is the PEP 8 standard."),
                                Challenge.Option(id: "B", text: "Group B", explanation: "PascalCase is for classes, not functions or variables. camelCase (rawData) is a Java/JS convention, not used in Python."),
                                Challenge.Option(id: "C", text: "Group C", explanation: "The constant max_retry_count should use UPPER_SNAKE_CASE. The parameter RawData should use snake_case."),
                                Challenge.Option(id: "D", text: "Group D", explanation: "The function name Calculate_Revenue mixes PascalCase and snake_case — it should be entirely snake_case."),
                            ],
                            correctAnswer: "A",
                            hints: ["Python variables and functions: snake_case", "Constants: UPPER_SNAKE_CASE", "Class names: PascalCase (not tested here)"],
                            explanation: "PEP 8 naming conventions:\n- Constants: UPPER_SNAKE_CASE (e.g., MAX_RETRY_COUNT)\n- Functions/methods: lower_snake_case (e.g., calculate_revenue)\n- Variables/parameters: lower_snake_case (e.g., raw_data)\n- Classes: PascalCase (e.g., DataProcessor)\n- Private attributes: leading underscore _private_var\n\nFollowing these conventions makes it immediately clear what each identifier represents.",
                            frameworkTip: "In interviews and at work, consistent naming conventions are the first impression of code quality. Mentioning PEP 8 in code reviews shows you value code maintainability."
                        ),
                    ]
                ),
                Quest(
                    id: "19-3",
                    name: "Pandas Intro: DataFrame",
                    description: "Series, DataFrame, reading CSV, dtypes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DataFrame Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which shows the first 5 rows?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Understanding DataFrame",
                                narrative: "You read a CSV file with pandas:\nimport pandas as pd\ndf = pd.read_csv(\"sales.csv\")",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.head()", explanation: "Correct! head() shows the first 5 rows by default. head(10) shows the first 10."),
                                Challenge.Option(id: "B", text: "df.first(5)", explanation: "DataFrame has no first() method. Use head()."),
                                Challenge.Option(id: "C", text: "df[0:5]", explanation: "Works, but head() is more Pythonic and semantically clearer."),
                                Challenge.Option(id: "D", text: "df.preview()", explanation: "DataFrame has no preview() method."),
                            ],
                            correctAnswer: "A",
                            hints: ["head() = first N rows, tail() = last N rows, info() = column info, describe() = statistical summary"],
                            explanation: "DataFrame exploration essentials: head() (view data), info() (view column types), describe() (view statistics), shape (view row/column counts).",
                            frameworkTip: "First steps with new data: df.head(), df.info(), df.describe(), df.shape."
                        ),
                        Challenge(
                            id: 2,
                            name: "dtypes & Types",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you correctly convert the type?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data Type Issues",
                                narrative: "You discover that df[\"price\"] has dtype object (string), but you need to do arithmetic.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df[\"price\"] = int(df[\"price\"])", explanation: "int() cannot be used directly on an entire Series."),
                                Challenge.Option(id: "B", text: "df[\"price\"] = df[\"price\"].astype(float)", explanation: "Correct! astype() is pandas' type conversion method."),
                                Challenge.Option(id: "C", text: "df[\"price\"] = float(df[\"price\"])", explanation: "float() cannot be used on a Series."),
                                Challenge.Option(id: "D", text: "df[\"price\"].convert(float)", explanation: "Series has no convert() method."),
                            ],
                            correctAnswer: "B",
                            hints: ["pandas uses .astype() for type conversion — it can handle an entire Series"],
                            explanation: ".astype(float) converts an entire Series to float. If there are values that cannot be converted, pd.to_numeric(df[\"price\"], errors=\"coerce\") is safer (converts errors to NaN).",
                            frameworkTip: "After reading CSV, check dtypes first. Numeric column showing as object? There might be non-numeric values mixed in."
                        ),
                        Challenge(
                            id: 3,
                            name: "Building & Analyzing DataFrames",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function analyze_sales(data) that takes a list of dicts (each with \"product\", \"region\", \"revenue\") and uses pandas to:\n1. Create a DataFrame\n2. Add a \"rank\" column: ranking by revenue descending (1 = highest)\n3. Add an \"above_median\" column: True if revenue > median, else False\n4. Return the processed DataFrame",
                            scenario: 
                            Challenge.Scenario(
                                title: "Creating DataFrame from Dict",
                                narrative: "You have sales data and need to do basic analysis with pandas.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["pd.DataFrame(list_of_dicts) creates a DataFrame directly", ".rank(ascending=False) for descending ranking", ".median() calculates the median"],
                            explanation: "This exercise practices basic pandas operations: creating DataFrames from dicts, adding calculated columns (rank, conditional), rank() and median() are commonly used in data analysis.",
                            frameworkTip: "Adding pandas columns: df[\"new_col\"] = expression. The expression can use existing columns for calculations.",
                            starterCode: """
                                import pandas as pd

                                def analyze_sales(data):
                                    # Create DataFrame
                                    # Add rank and above_median columns
                                    # Return DataFrame
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def analyze_sales(data):
                                    df = pd.DataFrame(data)
                                    df["rank"] = df["revenue"].rank(ascending=False).astype(int)
                                    df["above_median"] = df["revenue"] > df["revenue"].median()
                                    return df
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "DataFrame Merge (Join Operations)",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Given these two DataFrames:\n\n```python\nimport pandas as pd\n\norders = pd.DataFrame({\n    \"order_id\": [1, 2, 3, 4],\n    \"customer_id\": [101, 102, 103, 999],\n    \"amount\": [50, 30, 70, 20]\n})\n\ncustomers = pd.DataFrame({\n    \"customer_id\": [101, 102, 103, 104],\n    \"name\": [\"Alice\", \"Bob\", \"Carol\", \"Dave\"]\n})\n\nresult = orders.merge(customers, on=\"customer_id\", how=\"left\")\n```\n\nHow many rows does result have? What is the name value for customer_id=999?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Left Join vs Inner Join — High-Frequency Interview Question",
                                narrative: "You're analyzing e-commerce data with two tables: orders and customers. The interviewer asks you to merge them using Pandas and explain the differences between join types.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "4 rows, name is NaN", explanation: "Correct! Left join keeps all rows from the left table (orders). customer_id=999 has no match in customers, so name is NaN. Dave (customer_id=104) won't appear since he has no orders in the left table."),
                                Challenge.Option(id: "B", text: "3 rows, the customer_id=999 row is dropped", explanation: "That's inner join behavior, not left join. Left join keeps all rows from the left table."),
                                Challenge.Option(id: "C", text: "5 rows, including Dave's row", explanation: "That's outer join behavior. Left join only keeps all rows from the left table, not unique rows from the right."),
                                Challenge.Option(id: "D", text: "4 rows, name is empty string \"\"", explanation: "When no match is found, Pandas uses NaN (not empty string) to represent missing values."),
                            ],
                            correctAnswer: "A",
                            hints: ["Left join keeps all rows from the left table", "Unmatched fields are filled with NaN", "Inner join only keeps rows with matches on both sides"],
                            explanation: "Four types of Pandas merge joins:\n- inner (default): only keeps rows with matches on both sides\n- left: keeps all left table rows, fills NaN for unmatched right columns\n- right: keeps all right table rows, fills NaN for unmatched left columns\n- outer: keeps all rows from both sides, fills NaN for unmatched\n\nEquivalent to SQL INNER/LEFT/RIGHT/FULL OUTER JOIN.",
                            frameworkTip: "In interviews, draw a Venn diagram to explain join types — left join = entire left circle + intersection. This shows deep understanding of concepts shared between SQL and Pandas. Over 30% of StrataScratch problems involve merge/join operations."
                        ),
                        Challenge(
                            id: 5,
                            name: "loc vs iloc Trap",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the output of this code?\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame(\n    {\"product\": [\"A\", \"B\", \"C\", \"D\", \"E\"]},\n    index=[10, 20, 30, 40, 50]\n)\n\nprint(len(df.loc[10:30]))\nprint(len(df.iloc[0:2]))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "The Fatal Difference Between loc and iloc",
                                narrative: "While practicing Pandas problems on StrataScratch, you notice many people make mistakes with loc and iloc. This question tests the critical difference in their slicing behavior.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "3, 2", explanation: "Correct! loc uses label-based slicing that INCLUDES the endpoint (10, 20, 30 = 3 rows). iloc uses position-based slicing that EXCLUDES the endpoint (positions 0, 1 = 2 rows), consistent with Python list slicing."),
                                Challenge.Option(id: "B", text: "2, 2", explanation: "loc slicing is inclusive of the endpoint, unlike standard Python slicing."),
                                Challenge.Option(id: "C", text: "3, 3", explanation: "iloc slicing follows Python list conventions — it excludes the endpoint."),
                                Challenge.Option(id: "D", text: "Raises KeyError", explanation: "10, 20, 30 are all valid index labels, so no error occurs."),
                            ],
                            correctAnswer: "A",
                            hints: ["loc uses labels, slicing is inclusive of endpoint", "iloc uses integer positions, slicing excludes endpoint", "This is one of the most confusing aspects of Pandas"],
                            explanation: "Key difference between loc and iloc:\n- df.loc[start:end]: label-based indexing, slice INCLUDES end (inclusive)\n- df.iloc[start:end]: position-based indexing, slice EXCLUDES end (exclusive), consistent with Python list/range\n\nMnemonic: loc = label + inclusive, iloc = integer + exclusive (follows Python convention).",
                            frameworkTip: "In interviews, clearly state \"loc uses labels and includes the endpoint, iloc uses positions and excludes the endpoint.\" This is one of the most common Pandas trap questions — getting it right immediately establishes credibility."
                        ),
                        Challenge(
                            id: 6,
                            name: "DataFrame Creation & Basic Operations",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the following tasks:\n1. Create a DataFrame from sales_data\n2. Add a total column = quantity * price\n3. Inner merge sales_df with categories_df\n4. Return the merged DataFrame\n\n```python\nsales_data = {\n    \"product_id\": [1, 2, 3],\n    \"quantity\": [10, 5, 8],\n    \"price\": [100, 200, 150]\n}\ncategories_data = {\n    \"product_id\": [1, 2, 4],\n    \"category\": [\"Electronics\", \"Clothing\", \"Food\"]\n}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Quick Sales Data Analysis",
                                narrative: "You're on a retail company's data team and need to create a DataFrame from raw dictionary data, perform column calculations, and merge product category information.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["pd.DataFrame(dict) creates a DataFrame from a dictionary", "df[\"new_col\"] = df[\"col1\"] * df[\"col2\"] adds a computed column", "df1.merge(df2, on=\"key\", how=\"inner\") for inner join"],
                            explanation: "Standard Pandas workflow:\n1. pd.DataFrame(dict) to create a table\n2. df[\"new_col\"] = expression to add columns\n3. df1.merge(df2, on=\"key\", how=\"inner\") to join tables\n\nInner merge only keeps rows where product_id exists in both tables (1 and 2); product_id=3 and 4 are excluded.",
                            frameworkTip: "When tackling Pandas problems in interviews, first explain your data processing pipeline (create → compute → merge → filter), then implement step by step. This shows structured analytical thinking.",
                            starterCode: """
                                import pandas as pd

                                def process_sales(sales_data, categories_data):
                                    # 1. Create DataFrames
                                    # 2. Add total column
                                    # 3. Inner merge
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def process_sales(sales_data, categories_data):
                                    sales_df = pd.DataFrame(sales_data)
                                    categories_df = pd.DataFrame(categories_data)
                                    sales_df["total"] = sales_df["quantity"] * sales_df["price"]
                                    result = sales_df.merge(categories_df, on="product_id", how="inner")
                                    return result
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "19-4",
                    name: "Filtering & Sorting",
                    description: "loc/iloc, conditional filtering, sort_values",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "loc vs iloc",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the difference between loc and iloc?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data Access",
                                narrative: "You have a DataFrame and want to access data in different ways.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "loc uses labels, iloc uses integer positions", explanation: "Correct! loc uses row/column names, iloc uses numeric indices."),
                                Challenge.Option(id: "B", text: "loc only accesses rows, iloc only accesses columns", explanation: "Both can access rows and columns."),
                                Challenge.Option(id: "C", text: "loc is faster than iloc", explanation: "Speed difference is negligible — choose based on semantics, not speed."),
                                Challenge.Option(id: "D", text: "No difference, they are interchangeable", explanation: "When the index is not 0, 1, 2... numbers, the two give different results."),
                            ],
                            correctAnswer: "A",
                            hints: ["loc = label-based, iloc = integer-based"],
                            explanation: "df.loc[row_label, column_name] accesses by name. df.iloc[row_number, column_number] accesses by position. Conditional filtering uses loc or directly df[condition].",
                            frameworkTip: "Most common filtering: df[df[\"column\"] > value]. Use loc when you need to specify both rows and columns."
                        ),
                        Challenge(
                            id: 2,
                            name: "Conditional Filtering",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Filtering Data",
                                narrative: "You want to find products where price > 100 and category == \"Electronics\".",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df[df[\"price\"] > 100 and df[\"category\"] == \"Electronics\"]", explanation: "pandas cannot use Python's and — use & and parentheses around each condition."),
                                Challenge.Option(id: "B", text: "df[(df[\"price\"] > 100) & (df[\"category\"] == \"Electronics\")]", explanation: "Correct! pandas uses & instead of and, | instead of or, and each condition must be in parentheses."),
                                Challenge.Option(id: "C", text: "df.filter(price > 100, category == \"Electronics\")", explanation: "DataFrame.filter() does not work this way."),
                                Challenge.Option(id: "D", text: "df.where(price > 100).where(category == \"Electronics\")", explanation: ".where() has different semantics, and you cannot use variable names directly."),
                            ],
                            correctAnswer: "B",
                            hints: ["pandas conditional filtering: & instead of and, | instead of or, parentheses around each condition"],
                            explanation: "Three rules for pandas conditional filtering: (1) Use & not and (2) Use | not or (3) Parentheses around each condition. This is due to Python operator precedence.",
                            frameworkTip: "Forgetting parentheses is the most common pandas error. Whenever you see & or |, add parentheses."
                        ),
                        Challenge(
                            id: 3,
                            name: "DataFrame Filtering & Transformation",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function high_value_analysis(df) that takes a DataFrame (columns: customer_id, order_date, amount, category) and:\n1. Filter orders where amount >= 1000\n2. Group by customer_id, calculate order count and total amount per person\n3. Keep only customers with order_count >= 3 (high-value customers)\n4. Sort by total_amount descending\n5. Return the result DataFrame (columns: customer_id, order_count, total_amount)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Order Data Analysis",
                                narrative: "You are a Product Analyst and need to find purchase patterns of high-value customers from order data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Filter first then group to reduce data volume", ".agg() can do multiple aggregations with naming simultaneously", "reset_index() converts groupby keys back to regular columns"],
                            explanation: "This exercise practices the complete pandas analysis pipeline: filter → group → aggregate → filter again → sort. agg() with naming is the modern pandas aggregation approach.",
                            frameworkTip: "Analysis pipeline: Filter → GroupBy → Aggregate → Filter → Sort. Like a funnel, progressively narrowing the data.",
                            starterCode: """
                                import pandas as pd

                                def high_value_analysis(df):
                                    # 1. Filter high-amount orders
                                    # 2. Group and aggregate
                                    # 3. Filter high-value customers
                                    # 4. Sort
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def high_value_analysis(df):
                                    high_orders = df[df["amount"] >= 1000]
                                    grouped = high_orders.groupby("customer_id").agg(
                                        order_count=("amount", "count"),
                                        total_amount=("amount", "sum")
                                    ).reset_index()
                                    result = grouped[grouped["order_count"] >= 3]
                                    return result.sort_values("total_amount", ascending=False).reset_index(drop=True)
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Multi-Condition Filtering & apply",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the following tasks:\n1. Filter users with sessions > 5 AND purchases > 0\n2. Use apply to calculate engagement_score = sessions * 0.3 + purchases * 0.7 for each row\n3. Sort by engagement_score in descending order\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    \"user_id\": [1, 2, 3, 4, 5],\n    \"sessions\": [10, 3, 8, 15, 2],\n    \"purchases\": [2, 0, 5, 1, 3]\n})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Behavior Data Analysis",
                                narrative: "You're on Meta's Growth team and need to filter high-value users meeting multiple conditions from user activity data, then calculate an engagement score using a custom function.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Multi-condition filtering uses & to connect conditions, each wrapped in parentheses", "apply(func, axis=1) applies the function to each row", "sort_values(\"col\", ascending=False) for descending order"],
                            explanation: "Pandas multi-condition filtering syntax:\n- df[(cond1) & (cond2)]: AND conditions\n- df[(cond1) | (cond2)]: OR conditions\n- Each condition MUST be wrapped in parentheses!\n\napply(func, axis=1) applies a custom function to each row; axis=0 applies to each column. sort_values with ascending=False means descending order.",
                            frameworkTip: "When mentioning apply in interviews, add that \"for simple operations, vectorized operations are faster than apply.\" This shows performance awareness and earns bonus points.",
                            starterCode: """
                                import pandas as pd

                                def analyze_users(df):
                                    # 1. Multi-condition filter
                                    # 2. Use apply to calculate engagement_score
                                    # 3. Sort descending
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def analyze_users(df):
                                    filtered = df[(df["sessions"] > 5) & (df["purchases"] > 0)]
                                    filtered = filtered.copy()
                                    filtered["engagement_score"] = filtered.apply(
                                        lambda row: row["sessions"] * 0.3 + row["purchases"] * 0.7, axis=1
                                    )
                                    return filtered.sort_values("engagement_score", ascending=False)
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "apply vs Vectorized Operations Performance",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "All three approaches calculate BMI (weight / height squared). Which performs best with 1 million rows?\n\n```python\n# Approach A: for loop\nfor i in range(len(df)):\n    df.loc[i, \"bmi\"] = df.loc[i, \"weight\"] / df.loc[i, \"height\"]**2\n\n# Approach B: apply\ndf[\"bmi\"] = df.apply(lambda row: row[\"weight\"] / row[\"height\"]**2, axis=1)\n\n# Approach C: vectorized\ndf[\"bmi\"] = df[\"weight\"] / df[\"height\"]**2\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Performance Trap: Why Is Your Code 100x Slower?",
                                narrative: "A Meta interviewer shows you two functionally identical Pandas code snippets and asks which performs better. This is the key interview question that separates those who \"use\" Pandas from those who truly \"understand\" it.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A is fastest — it directly manipulates memory", explanation: "for loop + df.loc is the slowest approach due to massive Python object overhead per iteration."),
                                Challenge.Option(id: "B", text: "B is fastest — apply is a Pandas built-in optimization", explanation: "apply is still a Python-level loop under the hood — it's just syntactically cleaner, not truly vectorized."),
                                Challenge.Option(id: "C", text: "C is fastest — vectorized operations use the underlying C/NumPy engine", explanation: "Correct! Vectorized operations process data in bulk at the C/NumPy level, avoiding Python loop overhead. Performance gap: C is ~100-1000x faster than A, ~10-100x faster than B."),
                                Challenge.Option(id: "D", text: "All three perform equally — just different syntax", explanation: "The performance gap is enormous, especially with large datasets (millions of rows)."),
                            ],
                            correctAnswer: "C",
                            hints: ["Pandas uses NumPy under the hood, and NumPy operations execute at the C level", "apply looks vectorized but actually isn't", "for loops in Pandas are almost always the slowest approach"],
                            explanation: "Pandas performance pyramid (fastest to slowest):\n1. Vectorized operations (NumPy/C level): df[\"a\"] + df[\"b\"]\n2. apply (Python-level loop, clean syntax but not fast)\n3. itertuples() (faster than iterrows)\n4. iterrows() (slow)\n5. for + df.loc/iloc (slowest)\n\nRule: use vectorized over apply, use apply over for loops.",
                            frameworkTip: "Proactively stating \"I prioritize vectorized operations over apply or for loops\" and explaining why (C/NumPy engine vs Python loops) is a strong signal in Meta and Google data science interviews."
                        ),
                        Challenge(
                            id: 6,
                            name: "Compound Sorting & nlargest",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function top_campaigns(df, n):\n1. Calculate ROI column = (revenue - cost) / cost\n2. Filter campaigns with ROI > 0\n3. Sort by ROI descending, then by cost ascending for ties\n4. Return top n rows\n\nThe DataFrame has campaign, cost, and revenue columns.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Ad Campaign ROI Analysis",
                                narrative: "You're analyzing Meta's ad campaign data and need to find the top N campaigns by ROI, with tie-breaking by cost in ascending order when ROI values are equal.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["sort_values accepts a list for multi-column sorting", "ascending can also be a list, one value per sort column", "head(n) gets the top n rows — more flexible than nlargest for compound sorts"],
                            explanation: "Pandas compound sorting syntax:\nsort_values([\"col1\", \"col2\"], ascending=[False, True])\n\nThis sorts by col1 descending first, then by col2 ascending for ties. The ascending parameter accepts a list corresponding to each sort column.\n\nnlargest(n, \"col\") is good for single-column top-n, but sort_values + head is more flexible for compound sorting.",
                            frameworkTip: "When facing sorting problems in interviews, remember to consider tie-breaking rules. Proactively raising this point demonstrates thoroughness.",
                            starterCode: """
                                import pandas as pd

                                def top_campaigns(df, n):
                                    # 1. Calculate ROI
                                    # 2. Filter ROI > 0
                                    # 3. Compound sort
                                    # 4. Return top n
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def top_campaigns(df, n):
                                    df = df.copy()
                                    df["roi"] = (df["revenue"] - df["cost"]) / df["cost"]
                                    profitable = df[df["roi"] > 0]
                                    sorted_df = profitable.sort_values(
                                        ["roi", "cost"], ascending=[False, True]
                                    )
                                    return sorted_df.head(n)
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "19-5",
                    name: "GroupBy & Aggregation",
                    description: "groupby, agg, pivot_table",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "groupby Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Group Statistics",
                                narrative: "You want to calculate the average price per category.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.groupby(\"category\")[\"price\"].mean()", explanation: "Correct! First groupby to group, then select the column, then aggregate."),
                                Challenge.Option(id: "B", text: "df[\"price\"].groupby(\"category\").mean()", explanation: "A Series cannot directly groupby a string — groupby must be at the DataFrame level."),
                                Challenge.Option(id: "C", text: "df.group(\"category\").avg(\"price\")", explanation: "No group() or avg() — they are groupby() and mean()."),
                                Challenge.Option(id: "D", text: "df.mean(groupby=\"category\")", explanation: "mean() does not have a groupby parameter."),
                            ],
                            correctAnswer: "A",
                            hints: ["pandas aggregation in three steps: groupby → select column → aggregation function"],
                            explanation: "groupby three steps: (1) df.groupby(\"group_column\") (2) Select the column to calculate (3) Apply aggregation function (mean, sum, count, min, max).",
                            frameworkTip: "Think of groupby as SQL's GROUP BY: group first, then calculate per group."
                        ),
                        Challenge(
                            id: 2,
                            name: "agg Multiple Aggregations",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multiple Statistics",
                                narrative: "You want to calculate the mean, max, and count of price per category simultaneously.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.groupby(\"category\")[\"price\"].agg([\"mean\", \"max\", \"count\"])", explanation: "Correct! agg() accepts a list of aggregation functions and computes them all at once."),
                                Challenge.Option(id: "B", text: "df.groupby(\"category\")[\"price\"].mean().max().count()", explanation: "Chaining executes sequentially, not simultaneously calculating all three."),
                                Challenge.Option(id: "C", text: "df.groupby(\"category\").aggregate(\"price\", \"mean\", \"max\")", explanation: "Incorrect parameter format for aggregate."),
                                Challenge.Option(id: "D", text: "df.groupby(\"category\").describe()[\"price\"]", explanation: "describe() computes more statistics, but you cannot customize which ones."),
                            ],
                            correctAnswer: "A",
                            hints: ["agg() can accept a list (multiple aggregations on same column) or dict (different aggregations on different columns)"],
                            explanation: "agg() is the most flexible aggregation method: list mode agg([\"mean\", \"sum\"]), dict mode agg({\"price\": \"mean\", \"qty\": \"sum\"}).",
                            frameworkTip: "When you need different aggregations for different columns, use dict: .agg({\"price\": \"mean\", \"qty\": \"sum\", \"id\": \"count\"})."
                        ),
                        Challenge(
                            id: 3,
                            name: "pivot_table Pivot Analysis",
                            type: .code,
                            difficulty: .hard,
                            question: "Given a sales DataFrame (columns: region, quarter, product, revenue), use pivot_table to create:\n- Rows (index): region\n- Columns: quarter\n- Values: sum of revenue\n- Fill missing values with 0\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    \"region\": [\"North\", \"North\", \"South\", \"South\", \"North\", \"South\"],\n    \"quarter\": [\"Q1\", \"Q2\", \"Q1\", \"Q2\", \"Q1\", \"Q3\"],\n    \"product\": [\"A\", \"B\", \"A\", \"A\", \"B\", \"A\"],\n    \"revenue\": [100, 200, 150, 300, 50, 250]\n})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sales Data Pivot Analysis — Google Interview",
                                narrative: "A Google interviewer asks you to use Pandas pivot_table for cross-dimensional sales analysis — like Excel's pivot table but implemented in code. This tests whether you can quickly reshape data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Core parameters of pd.pivot_table(): index, columns, values, aggfunc", "fill_value=0 replaces NaN with 0", "aggfunc can be \"sum\", \"mean\", \"count\", etc."],
                            explanation: "pd.pivot_table is Pandas' most powerful data reshaping tool:\n- index: row grouping labels (like SQL GROUP BY)\n- columns: dimension to spread into columns\n- values: numeric column to aggregate\n- aggfunc: aggregation function (sum, mean, count, etc.)\n- fill_value: fill missing values\n\nThe result is a cross-tabulation where each cell is the revenue sum for that region + quarter combination.",
                            frameworkTip: "In interviews, compare pivot_table to Excel's pivot table but more flexible. Mention you can apply different aggfuncs to multiple values simultaneously — this demonstrates advanced Pandas skills.",
                            starterCode: """
                                import pandas as pd

                                def create_pivot(df):
                                    # Use pivot_table to create a pivot analysis table
                                    # index=region, columns=quarter, values=revenue, aggfunc=sum
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def create_pivot(df):
                                    return pd.pivot_table(
                                        df,
                                        index="region",
                                        columns="quarter",
                                        values="revenue",
                                        aggfunc="sum",
                                        fill_value=0
                                    )
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "groupby + agg Multiple Aggregations",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function customer_summary(df):\n1. Group by customer_id\n2. Simultaneously calculate count, sum, mean, max of amount\n3. Rename columns to txn_count, total_amount, avg_amount, max_amount\n4. Sort by total_amount descending\n5. Reset index\n\nThe DataFrame has customer_id, amount, and date columns.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Dimensional Customer Analysis — Meta/Google High-Frequency",
                                narrative: "In an interview, you're asked to perform multi-dimensional aggregation on customer transaction data: simultaneously calculate each customer's transaction count, total amount, average amount, and max single transaction. This is a high-frequency question type at Meta and Google.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["agg() supports named aggregation: agg(new_name=\"agg_func\")", "This syntax handles aggregation and renaming in one step", "reset_index() converts the groupby key back to a regular column"],
                            explanation: "Pandas Named Aggregation syntax (recommended):\ndf.groupby(\"key\")[\"col\"].agg(\n    new_name1=\"func1\",\n    new_name2=\"func2\"\n)\n\nAdvantage: aggregation and renaming in one step, cleaner than agg then rename.\n\nYou can also aggregate different columns differently:\ndf.groupby(\"key\").agg(\n    total=(\"amount\", \"sum\"),\n    avg_qty=(\"quantity\", \"mean\")\n)",
                            frameworkTip: "Using named aggregation syntax instead of agg({\"col\": [\"sum\", \"mean\"]}) then rename shows you know Pandas best practices. Google interviews especially value code conciseness and readability.",
                            starterCode: """
                                import pandas as pd

                                def customer_summary(df):
                                    # groupby + agg multiple aggregations
                                    # Rename columns
                                    # Sort + reset_index
                                    pass
                            """,
                            expectedQuery: """
                                import pandas as pd

                                def customer_summary(df):
                                    summary = df.groupby("customer_id")["amount"].agg(
                                        txn_count="count",
                                        total_amount="sum",
                                        avg_amount="mean",
                                        max_amount="max"
                                    ).sort_values("total_amount", ascending=False).reset_index()
                                    return summary
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "groupby + transform in Practice",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "The goal is to calculate each transaction's percentage of the customer's total spending. Which code works correctly?\n\n```python\n# Approach A\ndf[\"pct\"] = df.groupby(\"customer_id\")[\"amount\"].transform(\"sum\")\ndf[\"pct\"] = df[\"amount\"] / df[\"pct\"]\n\n# Approach B\ndf[\"pct\"] = df[\"amount\"] / df.groupby(\"customer_id\")[\"amount\"].agg(\"sum\")\n\n# Approach C\ntotals = df.groupby(\"customer_id\")[\"amount\"].sum()\ndf[\"pct\"] = df[\"amount\"] / df[\"customer_id\"].map(totals)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "transform vs agg — Interview Trap",
                                narrative: "A Google interviewer asks: I want to add a column showing each transaction's percentage of that customer's total spending. Should you use agg or transform? This tests your understanding of groupby return structures.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Only Approach A is correct", explanation: "Both Approach A and C work correctly."),
                                Challenge.Option(id: "B", text: "A and C are correct; B will error or give wrong results", explanation: "Correct! transform returns a Series with the same length as the original DataFrame (each row gets its group's aggregated value), enabling direct arithmetic. agg returns a Series with length equal to the number of groups — dividing directly causes index misalignment and produces NaN values. Approach C uses map to manually align and also works correctly."),
                                Challenge.Option(id: "C", text: "All three are correct, just different syntax", explanation: "Approach B's agg result has customer_id as its index, which doesn't align with the original DataFrame's index (row numbers)."),
                                Challenge.Option(id: "D", text: "Only Approach C is correct", explanation: "Approach A with transform also works correctly."),
                            ],
                            correctAnswer: "B",
                            hints: ["transform returns results with the same length as the original DataFrame", "agg returns results with length equal to the number of groups", "Index misalignment causes arithmetic operations to produce NaN"],
                            explanation: "Key difference between transform and agg:\n- agg(): returns one aggregated value per group; result index = group keys, length = number of groups\n- transform(): returns results with the same length as the original DataFrame; each row gets its group's aggregated value\n\nUse transform when you need to \"broadcast\" aggregated results back to the original DataFrame (e.g., percentages, deviations).\nUse agg when you only need group summaries.",
                            frameworkTip: "In interviews, clearly distinguish transform and agg use cases: \"Use transform to keep original row count, use agg for summaries.\" This is a high-frequency topic in Google data science interviews."
                        ),
                    ]
                ),
                Quest(
                    id: "19-6",
                    name: "Sales Data Analysis (Boss)",
                    description: "Complete data analysis with Pandas",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Pandas Sales Analysis",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Monthly Sales Report",
                                narrative: "You are a Product Analyst and received a CSV:\n\ncolumns: order_id, date, product, category, qty, unit_price, customer_id, region\n\nYour manager requires:\n1. Monthly revenue trends\n2. Category breakdowns\n3. Top 3 products per region\n4. Customer segmentation (high/medium/low spending)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Start with df.info() to understand the data structure", "Use pd.to_datetime to handle the date column"],
                            explanation: "Complete data analysis pipeline: read → check → clean → transform → aggregate → segment → output.",
                            frameworkTip: "Analysis report structure: Overview → Trends → Breakdown → Segments → Recommendations."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 20,
            name: "APIs & Automation Scripts",
            emoji: "🤖",
            description: "JSON, requests, batch processing, automated reports",
            quests: [
                Quest(
                    id: "20-1",
                    name: "JSON & API Concepts",
                    description: "REST, endpoints, request/response",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "REST API Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most accurate description of a REST API?",
                            scenario: 
                            Challenge.Scenario(
                                title: "What Is an API",
                                narrative: "Your manager says: \"We need to get data from an external system using their API.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A programming language", explanation: "An API is not a programming language — it is an interface/protocol."),
                                Challenge.Option(id: "B", text: "A standardized interface for accessing remote data or functionality via HTTP requests", explanation: "Correct! REST APIs use HTTP methods (GET/POST/PUT/DELETE) to operate on resources."),
                                Challenge.Option(id: "C", text: "A database", explanation: "An API is not a database, but it can be used to access data in a database."),
                                Challenge.Option(id: "D", text: "Something only frontend engineers need to know", explanation: "Backend developers, data analysts, and Business IT all need to use APIs."),
                            ],
                            correctAnswer: "B",
                            hints: ["API = Application Programming Interface — an interface for programs to communicate with each other"],
                            explanation: "REST APIs map HTTP methods to operations: GET (read), POST (create), PUT (update), DELETE (delete). URLs represent resources.",
                            frameworkTip: "API mindset: think of a remote service as a function library — URLs are function names, HTTP methods are actions, JSON is parameters and return values."
                        ),
                        Challenge(
                            id: 2,
                            name: "HTTP Status Codes",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What does 404 mean?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Status Code",
                                narrative: "You called an API and received status code 404.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Request successful", explanation: "Success is 200."),
                                Challenge.Option(id: "B", text: "Server error", explanation: "Server errors are 5xx (e.g., 500)."),
                                Challenge.Option(id: "C", text: "Resource not found (Not Found)", explanation: "Correct! 404 = the URL/resource you requested does not exist."),
                                Challenge.Option(id: "D", text: "No permission", explanation: "No permission is 401 (unauthorized) or 403 (forbidden)."),
                            ],
                            correctAnswer: "C",
                            hints: ["2xx = success, 3xx = redirect, 4xx = client error, 5xx = server error"],
                            explanation: "Common status codes: 200 (success), 201 (created), 400 (bad request), 401 (unauthorized), 403 (forbidden), 404 (not found), 500 (server error).",
                            frameworkTip: "When handling API responses, check the status code before reading the body. Non-2xx should all be handled."
                        ),
                        Challenge(
                            id: 3,
                            name: "RESTful Design Principles",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "For an e-commerce order API, which set of HTTP method mappings is correct?\n\n1. Retrieve all orders\n2. Create a new order\n3. Update an order's address\n4. Cancel (delete) an order",
                            scenario: 
                            Challenge.Scenario(
                                title: "RESTful API Verb Semantics",
                                narrative: "You are in an Amazon interview and asked about API design. The interviewer presents an e-commerce order system and asks you to identify the correct HTTP method mappings. Understanding REST verb semantics is foundational for backend and data engineering interviews.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1.GET /orders  2.POST /orders  3.PUT /orders/{id}  4.DELETE /orders/{id}", explanation: "Correct! GET for reading, POST for creating, PUT for full update, DELETE for removal. This is standard RESTful API design."),
                                Challenge.Option(id: "B", text: "1.POST /getOrders  2.POST /createOrder  3.POST /updateOrder  4.POST /deleteOrder", explanation: "This is RPC style, not RESTful. RESTful APIs use HTTP methods to distinguish operations, not verbs in URLs."),
                                Challenge.Option(id: "C", text: "1.GET /orders  2.PUT /orders  3.PATCH /orders/{id}  4.GET /orders/{id}/delete", explanation: "PUT is for updating not creating, and using GET for deletion violates HTTP semantics (GET should be idempotent with no side effects)."),
                                Challenge.Option(id: "D", text: "1.GET /orders  2.POST /orders  3.POST /orders/{id}  4.PUT /orders/{id}/cancel", explanation: "Using POST for updates is imprecise, and PUT should not be used for non-idempotent cancel operations."),
                            ],
                            correctAnswer: "A",
                            hints: ["RESTful design: URLs represent resources (nouns), HTTP methods represent actions (verbs)", "GET=read, POST=create, PUT=full update, PATCH=partial update, DELETE=remove", "GET and PUT are idempotent (same result on repeated calls), POST is not"],
                            explanation: "Four key RESTful API design principles:\n1. URLs use nouns for resources: /orders, /users\n2. HTTP methods represent operations: GET (read), POST (create), PUT (full update), PATCH (partial update), DELETE (remove)\n3. GET and DELETE are idempotent\n4. POST is not idempotent (each call may create a new resource)\n\nCommon follow-up: PUT vs PATCH? PUT replaces the entire resource, PATCH updates only specific fields.",
                            frameworkTip: "When asked about API design in an interview, start with \"I'd use RESTful conventions,\" then quickly map GET/POST/PUT/DELETE to CRUD operations. Mentioning idempotency will impress the interviewer."
                        ),
                        Challenge(
                            id: 4,
                            name: "HTTP Status Code Semantics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Your script encounters the following status codes when calling an API. Which pairing of handling strategies is correct?\n\n- 200: Request succeeded\n- 401: Authentication failed\n- 429: Too many requests\n- 503: Service temporarily unavailable",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Response Status Codes",
                                narrative: "You are developing an API integration script and receiving different HTTP status codes from a partner's order API. You need to decide how to handle each response — retry, fix the request, or escalate the issue.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "200→Process data, 401→Retry, 429→Wait then retry, 503→Wait then retry", explanation: "401 is an authentication issue — retrying won't fix it. You need to check if your API key or token is correct."),
                                Challenge.Option(id: "B", text: "200→Process data, 401→Check token, 429→Retry immediately, 503→Wait then retry", explanation: "429 means rate limit — retrying immediately will just trigger it again. You should wait (typically reading the Retry-After header) before retrying."),
                                Challenge.Option(id: "C", text: "200→Process data, 401→Check token, 429→Wait then retry, 503→Wait then retry", explanation: "Correct! 2xx means success, 401 is an auth issue requiring credential fixes, 429 is rate limiting requiring backoff retry, 503 is a transient error worth retrying."),
                                Challenge.Option(id: "D", text: "200→Process data, 401→Check token, 429→Wait then retry, 503→Give up", explanation: "503 means \"temporarily\" unavailable — waiting and retrying usually works. No need to give up immediately."),
                            ],
                            correctAnswer: "C",
                            hints: ["2xx = success, 4xx = client error, 5xx = server error", "401 vs 403: 401 is \"unauthenticated,\" 403 is \"authenticated but unauthorized\"", "429 usually comes with a Retry-After header telling you how long to wait"],
                            explanation: "HTTP status code categories:\n- 2xx Success: 200 OK, 201 Created, 204 No Content\n- 4xx Client Error: 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests\n- 5xx Server Error: 500 Internal Error, 502 Bad Gateway, 503 Service Unavailable\n\nHandling strategy: 4xx generally don't retry (except 429), 5xx generally can retry.",
                            frameworkTip: "When asked about API error handling in an interview, first categorize (4xx vs 5xx), then explain the strategy: 4xx fix the request, 5xx retry. Specifically mentioning exponential backoff for 429 shows production experience."
                        ),
                    ]
                ),
                Quest(
                    id: "20-2",
                    name: "requests GET",
                    description: "params, status code, json()",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "GET Request",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which is the correct GET request?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Calling an API with requests",
                                narrative: "You want to get weather data from a public API.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "response = requests.get(\"https://api.example.com/weather\", params={\"city\": \"Taipei\"})", explanation: "Correct! requests.get() sends a GET request, and params is automatically appended to the URL query string."),
                                Challenge.Option(id: "B", text: "response = requests.get(\"https://api.example.com/weather\", body={\"city\": \"Taipei\"})", explanation: "GET requests do not use body — use params. body is for POST."),
                                Challenge.Option(id: "C", text: "response = requests.fetch(\"https://api.example.com/weather\")", explanation: "requests has no fetch() method. fetch is JavaScript."),
                                Challenge.Option(id: "D", text: "response = requests.get(\"https://api.example.com/weather?city=Taipei\")", explanation: "Works, but using the params dict is cleaner and safer (automatically encodes special characters)."),
                            ],
                            correctAnswer: "A",
                            hints: ["requests.get(url, params={}) — params are automatically appended to the URL query string"],
                            explanation: "requests.get() returns a Response object. Common attributes: .status_code, .json(), .text, .headers.",
                            frameworkTip: "Always check response.status_code before using response.json(). Non-200 responses may not have a valid JSON body."
                        ),
                        Challenge(
                            id: 2,
                            name: "Handling Responses",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the safest approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Parsing API Responses",
                                narrative: "You received a JSON response and want to safely extract nested data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "data = response.json()\ntemp = data[\"weather\"][\"temperature\"]", explanation: "If \"weather\" or \"temperature\" does not exist, it raises KeyError."),
                                Challenge.Option(id: "B", text: "if response.status_code == 200:\n    data = response.json()\n    temp = data.get(\"weather\", {}).get(\"temperature\")", explanation: "Correct! Check status code first, then use .get() for safe nested access."),
                                Challenge.Option(id: "C", text: "data = response.text\ntemp = data[\"weather\"][\"temperature\"]", explanation: ".text is a string — you cannot use dict syntax. You need json.loads() first."),
                                Challenge.Option(id: "D", text: "data = response.json()\ntemp = data.temperature", explanation: "dicts cannot use dot notation. Use [\"key\"] or .get(\"key\")."),
                            ],
                            correctAnswer: "B",
                            hints: ["Check status code first → parse JSON → use .get() for safe access"],
                            explanation: "Three steps for API response handling: (1) Check status_code (2) Parse JSON (3) Access data safely (use .get() to prevent KeyError).",
                            frameworkTip: "Defensive API call pattern: try/except + status check + .get()."
                        ),
                        Challenge(
                            id: 3,
                            name: "Writing an API Client Function",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function fetch_weather(city, api_key) that simulates calling a weather API:\n- URL: \"https://api.weather.example.com/current\"\n- Params: {\"city\": city, \"units\": \"metric\"}\n- Header: {\"X-API-Key\": api_key}\n- On success, return dict: {\"city\": city, \"temp\": main.temp from response, \"description\": weather[0].description}\n- On API error, return dict: {\"error\": status code or error message}\nNote: Use try/except for network errors and .get() for safe access.\n(Hint: Write the complete logic even though the API cannot actually be called)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Weather API Wrapper",
                                narrative: "You want to wrap an API call into an easy-to-use function for your team.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The timeout parameter in requests.get() is important to prevent the program from hanging", "Nested .get() for safe access: data.get(\"main\", {}).get(\"temp\")", "Use requests.RequestException to catch all requests-related errors"],
                            explanation: "This exercise practices the standard pattern for wrapping API calls: set params/headers → send request → check status → parse safely → handle errors. This is the most common API client pattern in practice.",
                            frameworkTip: "Four elements of API wrapper functions: setup (params/headers), request (get/post), parsing (json/get), error handling (try/except).",
                            starterCode: """
                                import requests

                                def fetch_weather(city, api_key):
                                    url = "https://api.weather.example.com/current"
                                    # Set params and headers
                                    # Send GET request
                                    # Handle response and errors
                                    pass
                            """,
                            expectedQuery: """
                                import requests

                                def fetch_weather(city, api_key):
                                    url = "https://api.weather.example.com/current"
                                    params = {"city": city, "units": "metric"}
                                    headers = {"X-API-Key": api_key}
                                    try:
                                        response = requests.get(url, params=params, headers=headers, timeout=10)
                                        if response.status_code != 200:
                                            return {"error": f"API returned status {response.status_code}"}
                                        data = response.json()
                                        return {
                                            "city": city,
                                            "temp": data.get("main", {}).get("temp"),
                                            "description": data.get("weather", [{}])[0].get("description", "N/A"),
                                        }
                                    except requests.RequestException as e:
                                        return {"error": str(e)}
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "API Pagination Auto-Crawling",
                            type: .code,
                            difficulty: .hard,
                            question: "Complete the fetch_all_products() function using a while loop with next_page token to automatically crawl all pages.\n\nAPI response format:\n```json\n{\n  \"data\": [{\"id\": 1, \"name\": \"Product A\"}, ...],\n  \"next_page\": \"token_abc123\"  // null means last page\n}\n```\n\nExample:\nfetch_all_products(\"https://api.example.com/products\")\n→ Returns a list of all products",
                            scenario: 
                            Challenge.Scenario(
                                title: "Auto-Fetch All Paginated Data",
                                narrative: "You work at an e-commerce company and need to pull all product data daily from a supplier API. The API returns only 100 records per page and uses a next_page token mechanism. You need to write a script that automatically crawls all pages.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use a params dict to pass page_token", "Use extend() instead of append() to merge lists", "data.get(\"next_page\") returns None when the key doesn't exist"],
                            explanation: "Standard pagination crawling pattern:\n1. while True infinite loop\n2. Include next_page token each time (skip for first page)\n3. extend() current page data into the result list\n4. Check if next_page is None/null — if so, break\n\nThis pattern is extremely common in practice. Nearly all major APIs (GitHub, Stripe, Shopify) use similar pagination mechanisms.",
                            frameworkTip: "When discussing API pagination in an interview, mention that you know two common patterns: offset/limit (good for small datasets) and cursor/token (good for large datasets, avoids page-skipping issues). This shows real-world API experience.",
                            starterCode: """
                                import requests

                                def fetch_all_products(base_url):
                                    all_products = []
                                    next_page = None

                                    while True:
                                        # 1. Build URL params (include next_page token if available)
                                        # 2. Send GET request
                                        # 3. Add data to all_products
                                        # 4. Check if there's a next page
                                        pass

                                    return all_products
                            """,
                            expectedQuery: """
                                import requests

                                def fetch_all_products(base_url):
                                    all_products = []
                                    next_page = None

                                    while True:
                                        params = {}
                                        if next_page:
                                            params["page_token"] = next_page

                                        response = requests.get(base_url, params=params)
                                        response.raise_for_status()
                                        data = response.json()

                                        all_products.extend(data["data"])

                                        next_page = data.get("next_page")
                                        if not next_page:
                                            break

                                    return all_products
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Rate Limit Handling",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the safe_request() function. When receiving a 429 status code, read the Retry-After header for wait seconds and retry. Maximum 3 retries.\n\nExample:\nsafe_request(\"https://api.example.com/data\")\n→ Automatically handles 429, returns response.json() on success",
                            scenario: 
                            Challenge.Scenario(
                                title: "Graceful API Rate Limit Handling",
                                narrative: "You are frequently hitting 429 Too Many Requests errors when batch-calling a partner API. Your manager asks you to add rate limit handling logic so the script automatically waits and retries.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["response.headers.get(\"Retry-After\", 1) reads the wait seconds", "time.sleep(wait_time) pauses execution", "429 doesn't need raise_for_status — just wait and retry"],
                            explanation: "Rate limit handling pattern:\n1. Check if status_code is 429\n2. Read the Retry-After header (the API tells you how long to wait)\n3. time.sleep() for the specified seconds\n4. Automatically retry, with a maximum retry count\n\nAdvanced approach: Use exponential backoff, doubling the wait time each retry.",
                            frameworkTip: "When discussing rate limiting in an interview, beyond basic retry mechanics, mentioning Retry-After headers and exponential backoff demonstrates production API integration experience.",
                            starterCode: """
                                import requests
                                import time

                                def safe_request(url, max_retries=3):
                                    for attempt in range(max_retries):
                                        response = requests.get(url)

                                        if response.status_code == 200:
                                            return response.json()
                                        elif response.status_code == 429:
                                            # Read Retry-After header, default to 1 second
                                            # Wait and then continue the loop to retry
                                            pass
                                        else:
                                            response.raise_for_status()

                                    raise Exception(f"Still rate limited after {max_retries} retries")
                            """,
                            expectedQuery: """
                                import requests
                                import time

                                def safe_request(url, max_retries=3):
                                    for attempt in range(max_retries):
                                        response = requests.get(url)

                                        if response.status_code == 200:
                                            return response.json()
                                        elif response.status_code == 429:
                                            wait_time = int(response.headers.get("Retry-After", 1))
                                            print(f"Rate limited. Waiting {wait_time}s (attempt {attempt + 1}/{max_retries})")
                                            time.sleep(wait_time)
                                        else:
                                            response.raise_for_status()

                                    raise Exception(f"Still rate limited after {max_retries} retries")
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "20-3",
                    name: "POST & Authentication",
                    description: "headers, API key, token",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "POST Request",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct POST request?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sending Data to an API",
                                narrative: "You want to create a new user via API.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "requests.post(url, json={\"name\": \"Alice\", \"email\": \"alice@example.com\"})", explanation: "Correct! The json= parameter automatically serializes and sets Content-Type: application/json."),
                                Challenge.Option(id: "B", text: "requests.get(url, json={\"name\": \"Alice\"})", explanation: "Creating a resource should use POST, not GET. GET is for reading."),
                                Challenge.Option(id: "C", text: "requests.post(url, body={\"name\": \"Alice\"})", explanation: "requests has no body parameter. Use json= (JSON) or data= (form)."),
                                Challenge.Option(id: "D", text: "requests.post(url, {\"name\": \"Alice\"})", explanation: "Positional argument is treated as data (form format), not JSON. Use the json= keyword argument explicitly."),
                            ],
                            correctAnswer: "A",
                            hints: ["json= automatically sets Content-Type and serializes. data= is for form format."],
                            explanation: "POST requests use json= to send JSON data — requests automatically sets Content-Type: application/json and serializes. data= is for form format (application/x-www-form-urlencoded).",
                            frameworkTip: "GET = read, POST = create, PUT = full update, PATCH = partial update, DELETE = delete."
                        ),
                        Challenge(
                            id: 2,
                            name: "API Authentication",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the safest approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Key Authentication",
                                narrative: "You need to call a service that requires an API key.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Hardcode the API key directly in the source code", explanation: "Unsafe! If the code goes into Git, the API key is leaked."),
                                Challenge.Option(id: "B", text: "Store the API key in environment variables and read with os.environ in code", explanation: "Correct! Store API keys in environment variables or .env files (added to .gitignore) — never in version control."),
                                Challenge.Option(id: "C", text: "Put it in the README for team convenience", explanation: "README usually goes into Git — not suitable for secrets."),
                                Challenge.Option(id: "D", text: "Manually enter it each time", explanation: "Not practical, and automated scripts cannot handle interactive input."),
                            ],
                            correctAnswer: "B",
                            hints: ["Secrets should never go into version control. Use environment variables or .env + .gitignore."],
                            explanation: "Safe API key management: store in environment variables → read with os.environ.get(\"API_KEY\") → add .env file to .gitignore. You can use the python-dotenv package to simplify this.",
                            frameworkTip: "Once a secret enters Git history, it remains even after deletion. Prevention > remediation."
                        ),
                        Challenge(
                            id: 3,
                            name: "OAuth2 Flow Understanding",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "A web application wants to let users sign in with their Google account using the OAuth2 Authorization Code Flow. Which flow sequence is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "OAuth2 Authentication Flow",
                                narrative: "You are in an Uber interview and asked about designing a third-party login system. The interviewer wants to assess your understanding of the OAuth2 authorization flow — the industry standard for modern API authentication.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "User clicks login → Frontend directly gets access_token → Calls Google API", explanation: "This is the Implicit Flow (no longer recommended), not the Authorization Code Flow. The Auth Code Flow has an additional step of exchanging a code for a token."),
                                Challenge.Option(id: "B", text: "User clicks login → Redirect to Google auth page → User consents → Google returns authorization code → Backend exchanges code + client_secret for access_token → Uses token to call API", explanation: "Correct! The complete Authorization Code Flow. The code passes through the frontend (could be intercepted), but the access_token is only exchanged on the backend using client_secret, ensuring security."),
                                Challenge.Option(id: "C", text: "Backend directly uses client_id + client_secret to get access_token → Calls Google API", explanation: "This is the Client Credentials Flow, used for server-to-server communication without user authorization."),
                                Challenge.Option(id: "D", text: "User enters Google credentials into your app → You exchange credentials for token → Call API", explanation: "This is the Resource Owner Password Flow (deprecated). Letting a third-party app see user passwords is a serious security risk."),
                            ],
                            correctAnswer: "B",
                            hints: ["Authorization Code Flow has two exchanges: first get the code, then exchange code for token", "The code is short-lived and single-use; the access_token is what calls the API", "client_secret only lives on the backend — never expose it to the frontend"],
                            explanation: "OAuth2 Authorization Code Flow:\n1. Frontend redirects to the authorization server (e.g., Google)\n2. User consents to authorization\n3. Google returns an authorization code to your redirect_uri\n4. Backend exchanges code + client_id + client_secret with Google for an access_token\n5. Uses access_token to call APIs\n\nWhy the extra step? The code passes through the browser (could be intercepted), but the token is only exchanged securely on the backend.",
                            frameworkTip: "When asked about OAuth2 in an interview, first draw the Authorization Code Flow diagram, then explain why the \"code-for-token\" exchange step exists (security). Mentioning the PKCE extension shows you know current security best practices."
                        ),
                        Challenge(
                            id: 4,
                            name: "Bearer Token Usage Patterns",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the ApiClient class so it automatically includes a Bearer Token in every request. Support both GET and POST methods.\n\nExample:\n```python\nclient = ApiClient(\"https://api.company.com\", \"my_secret_token\")\nusers = client.get(\"/users\")\nclient.post(\"/users\", {\"name\": \"Alice\"})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Token Authentication Implementation",
                                narrative: "You are building an internal tool that needs to call your company's REST API. The API requires a Bearer Token in the header. You need to build an authenticated API client class for your team to use.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Authorization header format: \"Bearer your_token_here\"", "Use f-string to combine base_url + endpoint", "POST uses json=data to automatically serialize dict to JSON"],
                            explanation: "Bearer Token authentication pattern:\n- Add Authorization: Bearer <token> to HTTP headers\n- This is the most common token usage in OAuth2\n- Benefits of wrapping in a class: centralized auth management, base_url, error handling\n\nAdvanced: Using requests.Session() can persist headers, reducing repetitive setup.",
                            frameworkTip: "In an interview, showing that you encapsulate API client classes instead of repeating headers everywhere demonstrates DRY principles and code reuse. Mentioning requests.Session() performance benefits (connection reuse) earns extra points.",
                            starterCode: """
                                import requests

                                class ApiClient:
                                    def __init__(self, base_url, token):
                                        self.base_url = base_url
                                        # Set up headers with Bearer Token
                                        self.headers = {}

                                    def get(self, endpoint, params=None):
                                        # Send authenticated GET request
                                        pass

                                    def post(self, endpoint, data=None):
                                        # Send authenticated POST request
                                        pass
                            """,
                            expectedQuery: """
                                import requests

                                class ApiClient:
                                    def __init__(self, base_url, token):
                                        self.base_url = base_url
                                        self.headers = {
                                            "Authorization": f"Bearer {token}",
                                            "Content-Type": "application/json"
                                        }

                                    def get(self, endpoint, params=None):
                                        response = requests.get(
                                            f"{self.base_url}{endpoint}",
                                            headers=self.headers,
                                            params=params
                                        )
                                        response.raise_for_status()
                                        return response.json()

                                    def post(self, endpoint, data=None):
                                        response = requests.post(
                                            f"{self.base_url}{endpoint}",
                                            headers=self.headers,
                                            json=data
                                        )
                                        response.raise_for_status()
                                        return response.json()
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "20-4",
                    name: "Batch Processing Scripts",
                    description: "glob, os.listdir, multi-file processing",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "File Batch Processing",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most Pythonic approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Processing Multiple CSVs",
                                narrative: "Your folder has 100 CSV files that all need to be read and merged.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Manually list all 100 file names", explanation: "Not realistic and unmaintainable."),
                                Challenge.Option(id: "B", text: "from glob import glob\nfiles = glob(\"data/*.csv\")\nfor f in files:\n    df = pd.read_csv(f)", explanation: "Correct! glob uses wildcards * to match file paths — perfect for batch processing."),
                                Challenge.Option(id: "C", text: "os.system(\"cat data/*.csv > combined.csv\")", explanation: "Not safe and not cross-platform. Using Python is more reliable."),
                                Challenge.Option(id: "D", text: "for i in range(100):\n    pd.read_csv(f\"data/file_{i}.csv\")", explanation: "Assumes a fixed filename format, but actual filenames might differ."),
                            ],
                            correctAnswer: "B",
                            hints: ["glob(\"pattern\") returns a list of matching file paths"],
                            explanation: "glob patterns: * matches any characters, ** matches any depth of directories. pathlib.Path().glob() is a more modern alternative.",
                            frameworkTip: "Batch processing pattern: find files (glob) → iterate and process (for) → collect results (list/concat)."
                        ),
                        Challenge(
                            id: 2,
                            name: "Merging Multiple DataFrames",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most efficient approach?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Merging CSV Files",
                                narrative: "You used glob to find 100 CSVs with the same structure and want to merge them into one DataFrame.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df = pd.DataFrame()\nfor f in files:\n    df = df.append(pd.read_csv(f))", explanation: ".append() copies the entire DataFrame each time. 100 times means 100 copies — very slow."),
                                Challenge.Option(id: "B", text: "dfs = [pd.read_csv(f) for f in files]\ndf = pd.concat(dfs, ignore_index=True)", explanation: "Correct! Read all CSVs into a list with list comprehension, then concat once. Much more efficient."),
                                Challenge.Option(id: "C", text: "df = pd.read_csv(files)", explanation: "read_csv does not accept a list — it can only read one file."),
                                Challenge.Option(id: "D", text: "df = pd.merge(files)", explanation: "merge is for joining tables with different structures, not stacking same-structure ones."),
                            ],
                            correctAnswer: "B",
                            hints: ["Collect into a list first, then concat once. Avoid appending in a loop."],
                            explanation: "pd.concat in one call is much faster than looping with append. Collect into a list → concat once is a pandas best practice.",
                            frameworkTip: "pandas performance principle: avoid modifying DataFrames in loops. Collect results → one operation."
                        ),
                        Challenge(
                            id: 3,
                            name: "Batch API Data Processing",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function process_api_pages(pages_data) that takes a list of dicts (simulating multi-page API responses), each in the format: {\"page\": 1, \"data\": [{\"id\": 1, \"name\": \"...\", \"value\": 100}]}.\nComplete the following:\n1. Merge all pages' data into one list\n2. Remove records with duplicate ids (keep the first occurrence)\n3. Sort by value descending\n4. Return dict: {\"total_records\": total count, \"total_value\": sum of values, \"top_3\": name list of top 3, \"data\": complete data}",
                            scenario: 
                            Challenge.Scenario(
                                title: "Multi-Page Data Collection",
                                narrative: "You need to collect all data from a paginated API and process it into a report format.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use extend to merge multiple lists", "Use a set to track seen ids for deduplication", "sorted + lambda for sorting, [:3] for top three"],
                            explanation: "This exercise simulates a real API data processing pipeline: merge pages → deduplicate → sort → aggregate. Using a set to track ids for deduplication is a common and efficient pattern.",
                            frameworkTip: "Batch data processing pipeline: Collect (merge) → Deduplicate → Sort → Aggregate.",
                            starterCode: """
                                def process_api_pages(pages_data):
                                    # 1. Merge all pages' data
                                    # 2. Remove duplicate ids
                                    # 3. Sort
                                    # 4. Assemble result
                                    pass
                            """,
                            expectedQuery: """
                                def process_api_pages(pages_data):
                                    all_data = []
                                    for page in pages_data:
                                        all_data.extend(page.get("data", []))
                                    seen_ids = set()
                                    unique_data = []
                                    for item in all_data:
                                        if item["id"] not in seen_ids:
                                            seen_ids.add(item["id"])
                                            unique_data.append(item)
                                    sorted_data = sorted(unique_data, key=lambda x: x["value"], reverse=True)
                                    return {
                                        "total_records": len(sorted_data),
                                        "total_value": sum(item["value"] for item in sorted_data),
                                        "top_3": [item["name"] for item in sorted_data[:3]],
                                        "data": sorted_data,
                                    }
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "async/await Fundamentals",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Regarding Python's async/await, which statement is correct?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python Asynchronous Programming",
                                narrative: "You are in a Meta interview and asked about Python's asynchronous programming. The interviewer wants to know if you understand the core concepts of async/await — essential for batch scripts handling large volumes of API requests. Python 3.11+ significantly improved asyncio performance and error messages.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "async functions automatically run in a new thread, enabling true parallel execution", explanation: "asyncio is single-threaded! It uses an event loop to switch between tasks in one thread — it's not multi-threaded."),
                                Challenge.Option(id: "B", text: "await pauses the current coroutine's execution, letting the event loop process other tasks, and resumes when the I/O operation completes", explanation: "Correct! The essence of await is \"yielding control back to the event loop.\" When a coroutine is waiting for I/O (like an API response), the event loop can execute other coroutines. This is concurrency, not parallelism."),
                                Challenge.Option(id: "C", text: "asyncio.gather() distributes tasks across different CPU cores for execution", explanation: "asyncio is single-threaded and doesn't use multiple cores. For multi-core execution, you need the multiprocessing module."),
                                Challenge.Option(id: "D", text: "Adding the async keyword to any function makes it faster because it enables asynchronous I/O", explanation: "Adding async only makes the function a coroutine — it doesn't automatically speed things up. You need await and async I/O operations for benefits. CPU-bound tasks may actually run slower with async."),
                            ],
                            correctAnswer: "B",
                            hints: ["asyncio is single-threaded cooperative multitasking", "await is the \"yield control\" point for coroutines", "Best for I/O-bound tasks (API calls, file I/O), not CPU-bound tasks"],
                            explanation: "Python async/await core concepts:\n- async def defines a coroutine\n- await pauses the current coroutine, letting the event loop handle other tasks\n- Single thread + event loop = concurrency (not parallelism)\n- Ideal for: bulk API calls, database queries, and other I/O-bound waits\n\nPython 3.11+ improvements: better error messages, TaskGroup (structured concurrency replacing gather), 10-60% performance gains.",
                            frameworkTip: "Distinguishing concurrency vs parallelism is key in interviews: asyncio is concurrency (one person juggling multiple tasks), multiprocessing is parallelism (multiple people each doing one task). This distinction is a frequently tested concept at Meta."
                        ),
                        Challenge(
                            id: 5,
                            name: "Concurrent Requests with asyncio.gather",
                            type: .code,
                            difficulty: .hard,
                            question: "Complete the fetch_all_endpoints() function using asyncio + aiohttp to concurrently call multiple API endpoints.\n\nExample:\n```python\nurls = [\n    \"https://api.example.com/sales\",\n    \"https://api.example.com/users\",\n    \"https://api.example.com/products\"\n]\nresults = asyncio.run(fetch_all_endpoints(urls))\n# → [sales_data, users_data, products_data]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Speed Up Batch Processing with Concurrent API Requests",
                                narrative: "Your team needs to pull data daily from 50 different API endpoints. Synchronous calls take 5 minutes. Your manager asks you to speed things up using async. You need to use asyncio.gather to concurrently execute all requests.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["aiohttp uses async with session.get(url) as response to send requests", "Use list comprehension to build the task list", "asyncio.gather(*tasks) accepts multiple coroutines for concurrent execution"],
                            explanation: "asyncio.gather concurrency pattern:\n1. Create an aiohttp.ClientSession (shared connection pool)\n2. Use list comprehension to build all coroutine tasks\n3. await asyncio.gather(*tasks) for concurrent execution\n4. Results are returned in the same order as the input\n\nPerformance comparison: 50 synchronous requests (1 second each) = 50 seconds. asyncio.gather = approximately 1 second (all requests run simultaneously).",
                            frameworkTip: "When discussing concurrent requests in an interview, explain why you'd choose asyncio over threading (under the GIL, asyncio is more lightweight and manageable for I/O-bound tasks). Then describe how the event loop works to show you truly understand the underlying mechanism.",
                            starterCode: """
                                import asyncio
                                import aiohttp

                                async def fetch_one(session, url):
                                    # Send a single GET request with aiohttp
                                    pass

                                async def fetch_all_endpoints(urls):
                                    # Use asyncio.gather to concurrently call all URLs
                                    pass
                            """,
                            expectedQuery: """
                                import asyncio
                                import aiohttp

                                async def fetch_one(session, url):
                                    async with session.get(url) as response:
                                        response.raise_for_status()
                                        return await response.json()

                                async def fetch_all_endpoints(urls):
                                    async with aiohttp.ClientSession() as session:
                                        tasks = [fetch_one(session, url) for url in urls]
                                        results = await asyncio.gather(*tasks)
                                        return list(results)
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "20-5",
                    name: "Automated Report Generation",
                    description: "Read data + calculate + output",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Report Automation Workflow",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct automation workflow?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Reports",
                                narrative: "You need to automatically generate sales reports every day.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Manually open Excel → copy and paste → save", explanation: "This is not automation."),
                                Challenge.Option(id: "B", text: "Read data source → calculate metrics → format → output file", explanation: "Correct! The standard automated report workflow: Input → Process → Output."),
                                Challenge.Option(id: "C", text: "Send raw data directly to the manager", explanation: "Managers want organized insights, not raw data."),
                                Challenge.Option(id: "D", text: "Only calculate without output", explanation: "The purpose of a report is for people to read — there must be output."),
                            ],
                            correctAnswer: "B",
                            hints: ["Automation = letting the program do repetitive work"],
                            explanation: "Report automation: (1) Read data (CSV/DB/API) (2) Clean and calculate (3) Format output (CSV/Excel/PDF) (4) Optional: auto-send (email/Slack).",
                            frameworkTip: "ROI of automation: if a task takes 30 minutes daily, spending 2 hours writing a script pays off in 4 days."
                        ),
                        Challenge(
                            id: 2,
                            name: "Outputting Excel",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How do you output multi-sheet Excel with pandas?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Output Format",
                                narrative: "Your manager wants an Excel report with multiple sheets.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.to_excel(\"report.xlsx\")", explanation: "Only outputs one sheet. Multiple sheets need ExcelWriter."),
                                Challenge.Option(id: "B", text: "with pd.ExcelWriter(\"report.xlsx\") as writer:\n    df1.to_excel(writer, sheet_name=\"Summary\")\n    df2.to_excel(writer, sheet_name=\"Details\")", explanation: "Correct! ExcelWriter with with can output multiple sheets to the same Excel file."),
                                Challenge.Option(id: "C", text: "pd.to_excel([df1, df2], \"report.xlsx\")", explanation: "pd.to_excel cannot accept a list."),
                                Challenge.Option(id: "D", text: "df1.to_excel(\"report.xlsx\")\ndf2.to_excel(\"report.xlsx\")", explanation: "The second overwrites the first."),
                            ],
                            correctAnswer: "B",
                            hints: ["ExcelWriter is pandas' multi-sheet Excel writing tool"],
                            explanation: "pd.ExcelWriter with the with statement can write multiple DataFrames to different sheets in the same Excel file. Requires the openpyxl package.",
                            frameworkTip: "Output format selection: for programs → CSV/JSON. For humans → Excel. For reports → PDF."
                        ),
                        Challenge(
                            id: 3,
                            name: "Exponential Backoff Retry Strategy",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a retry_with_backoff decorator with the following behavior:\n1. Retry up to max_retries times\n2. Double the wait time each retry (1s, 2s, 4s, 8s...)\n3. Only retry on specified exception types\n4. Raise the last exception after exceeding max retries\n\nExample:\n```python\n@retry_with_backoff(max_retries=3, exceptions=(ConnectionError, TimeoutError))\ndef call_api():\n    response = requests.get(\"https://api.example.com/data\")\n    response.raise_for_status()\n    return response.json()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Exponential Backoff Retry Decorator",
                                narrative: "You are in an Amazon interview and asked to implement a retry decorator. In distributed systems, APIs may fail due to transient errors. Exponential backoff is the industry-standard retry strategy — doubling wait time between retries to avoid overwhelming the server with simultaneous retries.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use three nested functions: outer takes params, middle takes function, inner is the wrapper", "wait_time = 2 ** attempt produces 1, 2, 4, 8... wait times", "After the last retry fails, use bare raise to re-raise the original exception"],
                            explanation: "Exponential backoff retry pattern:\n- Wait times: 2^0=1s, 2^1=2s, 2^2=4s, 2^3=8s...\n- Why exponential? Avoids multiple clients retrying simultaneously (thundering herd problem)\n- functools.wraps preserves the original function's __name__ and __doc__\n- Bare raise: re-raises the currently caught exception\n\nAdvanced: Add jitter (random delay), e.g., wait_time = 2**attempt + random.uniform(0, 1)",
                            frameworkTip: "This is a classic Amazon interview question. Start by drawing the wait time sequence (1, 2, 4, 8s), then explain why exponential growth beats fixed intervals. Mentioning jitter to prevent thundering herd will strongly impress the interviewer.",
                            starterCode: """
                                import time
                                import functools

                                def retry_with_backoff(max_retries=3, exceptions=(Exception,)):
                                    def decorator(func):
                                        @functools.wraps(func)
                                        def wrapper(*args, **kwargs):
                                            # Implement exponential backoff retry logic
                                            pass
                                        return wrapper
                                    return decorator
                            """,
                            expectedQuery: """
                                import time
                                import functools

                                def retry_with_backoff(max_retries=3, exceptions=(Exception,)):
                                    def decorator(func):
                                        @functools.wraps(func)
                                        def wrapper(*args, **kwargs):
                                            for attempt in range(max_retries):
                                                try:
                                                    return func(*args, **kwargs)
                                                except exceptions as e:
                                                    if attempt == max_retries - 1:
                                                        raise
                                                    wait_time = 2 ** attempt
                                                    print(f"Attempt {attempt + 1} failed: {e}. Retrying in {wait_time}s...")
                                                    time.sleep(wait_time)
                                        return wrapper
                                    return decorator
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "HTTP Status Code Decision Logic",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the handle_response() function to decide handling strategy based on HTTP status codes:\n\n- 200-299: Success, return {\"status\": \"success\", \"data\": response.json()}\n- 401/403: Auth issue, return {\"status\": \"auth_error\", \"message\": \"...\"}\n- 429: Rate limited, return {\"status\": \"retry\", \"wait_seconds\": Retry-After header value}\n- 500-599: Server error, return {\"status\": \"retry\", \"wait_seconds\": 5}\n- Other: return {\"status\": \"error\", \"code\": status_code}",
                            scenario: 
                            Challenge.Scenario(
                                title: "Smart API Response Handler",
                                narrative: "You are building an automated reporting system that pulls data from multiple APIs. Different HTTP status codes require different handling strategies: some need retries, some need error logging, and some should be skipped entirely. You need a unified response handler.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use 200 <= code <= 299 to check the 2xx range", "Use in (401, 403) to check multiple specific values", "response.headers.get(\"Retry-After\", 1) reads the header with a default value"],
                            explanation: "API response handling best practices:\n1. Use range checks (200-299) instead of just checking for 200\n2. Distinguish \"retryable\" from \"non-retryable\" errors\n3. 429 reads the Retry-After header\n4. 5xx are usually transient errors — safe to retry\n5. 4xx (except 429) usually need request fixes — don't blindly retry\n\nThis decision pattern can be combined with the exponential backoff strategy from earlier.",
                            frameworkTip: "In an interview, demonstrate systematic thinking about HTTP status codes: 2xx success, 4xx client issues (usually don't retry), 5xx server issues (can retry), 429 is a special 4xx (needs retry). This systematic approach will impress the interviewer.",
                            starterCode: """
                                def handle_response(response):
                                    code = response.status_code

                                    # Decide handling strategy based on status code
                                    pass
                            """,
                            expectedQuery: """
                                def handle_response(response):
                                    code = response.status_code

                                    if 200 <= code <= 299:
                                        return {"status": "success", "data": response.json()}
                                    elif code in (401, 403):
                                        return {"status": "auth_error", "message": f"Authentication failed with status {code}"}
                                    elif code == 429:
                                        wait = int(response.headers.get("Retry-After", 1))
                                        return {"status": "retry", "wait_seconds": wait}
                                    elif 500 <= code <= 599:
                                        return {"status": "retry", "wait_seconds": 5}
                                    else:
                                        return {"status": "error", "code": code}
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "20-6",
                    name: "API Data Collection Script (Boss)",
                    description: "Design a complete API data collection pipeline",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: API Data Collection",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Automated API Data Collection",
                                narrative: "You need to collect product pricing data from a REST API daily. API spec:\n- GET /products?page=1&per_page=50 (paginated)\n- Response: {\"data\": [...], \"total_pages\": 10}\n- Requires API key authentication (Header: X-API-Key)\n- Rate limit: 60 requests per minute\n\nYou need to: collect all pages of data, save as CSV, handle errors.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Pagination logic: fetch page 1 first to get total_pages, then loop to the last page", "Use time.sleep(1) for simple rate limiting"],
                            explanation: "Key elements of a production API script: pagination handling, rate limiting, error handling, meaningful logging.",
                            frameworkTip: "Three principles for API scripts: Respect rate limits, Handle errors gracefully, Log everything."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 21,
            name: "Database & Backend Basics",
            emoji: "🗄️",
            description: "Python with SQLite, CRUD, Flask/FastAPI introduction",
            quests: [
                Quest(
                    id: "21-1",
                    name: "Python + SQLite",
                    description: "sqlite3 module, connect, cursor",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "sqlite3 Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct connection method?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Connecting to a Database",
                                narrative: "You want to connect to a SQLite database using Python.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "import sqlite3\nconn = sqlite3.connect(\"mydb.db\")\ncursor = conn.cursor()", explanation: "Correct! connect establishes the connection, cursor is used to execute SQL."),
                                Challenge.Option(id: "B", text: "import sql\ndb = sql.open(\"mydb.db\")", explanation: "Python has no sql module. It is sqlite3."),
                                Challenge.Option(id: "C", text: "from database import connect\nconn = connect(\"mydb.db\")", explanation: "There is no database module."),
                                Challenge.Option(id: "D", text: "import sqlite3\nconn = sqlite3.open(\"mydb.db\")", explanation: "It is connect(), not open()."),
                            ],
                            correctAnswer: "A",
                            hints: ["sqlite3 is a Python built-in module — no pip install needed"],
                            explanation: "sqlite3 is a Python built-in module. The flow: connect → cursor → execute → fetchall → close. Using with statement for automatic connection management is recommended.",
                            frameworkTip: "Use SQLite for development and testing (lightweight, no installation). Use PostgreSQL or MySQL for production."
                        ),
                        Challenge(
                            id: 2,
                            name: "Parameterized Queries",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which approach is safest?",
                            scenario: 
                            Challenge.Scenario(
                                title: "SQL Injection Prevention",
                                narrative: "You want to query data based on user input.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "cursor.execute(f\"SELECT * FROM users WHERE name = '{name}'\")", explanation: "Dangerous! String concatenation is vulnerable to SQL injection attacks."),
                                Challenge.Option(id: "B", text: "cursor.execute(\"SELECT * FROM users WHERE name = ?\", (name,))", explanation: "Correct! Using ? placeholders with a tuple for parameters — sqlite3 automatically handles escaping."),
                                Challenge.Option(id: "C", text: "cursor.execute(\"SELECT * FROM users WHERE name = \" + name)", explanation: "Same danger as A — string concatenation."),
                                Challenge.Option(id: "D", text: "cursor.execute(\"SELECT * FROM users\").filter(name=name)", explanation: "cursor has no filter method."),
                            ],
                            correctAnswer: "B",
                            hints: ["Always use parameterized queries (? placeholders) — never concatenate strings"],
                            explanation: "Parameterized queries use ? placeholders — sqlite3 automatically handles special character escaping. This is the standard practice for preventing SQL injection.",
                            frameworkTip: "Safety rule: any input from users must never be concatenated directly into SQL strings."
                        ),
                        Challenge(
                            id: 3,
                            name: "Creating Tables & Querying",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function setup_and_query(products) that takes a list of tuples (name, category, price):\n1. Create an in-memory SQLite database (\":memory:\")\n2. Create a products table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, category TEXT, price REAL)\n3. Insert all data\n4. Query: average price per category, sorted by average price descending\n5. Return results as list of dicts: [{\"category\": \"...\", \"avg_price\": ...}]",
                            scenario: 
                            Challenge.Scenario(
                                title: "Product Database",
                                narrative: "You need to create a product database using SQLite and write query functions to analyze the data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["\":memory:\" creates a temporary database that does not exist on disk", "executemany can insert multiple records at once", "SQL GROUP BY + AVG for grouped averages"],
                            explanation: "This exercise practices the complete SQLite flow: connect → CREATE TABLE → INSERT (executemany for batch insert) → SELECT (GROUP BY + AVG) → result conversion. In-memory databases are great for testing and small-scale data analysis.",
                            frameworkTip: "Use \":memory:\" database for development testing — no file cleanup needed. Use file-based databases for production.",
                            starterCode: """
                                import sqlite3

                                def setup_and_query(products):
                                    # Create in-memory database
                                    # Create table, insert data
                                    # Query average price per category
                                    # Return list of dicts
                                    pass
                            """,
                            expectedQuery: """
                                import sqlite3

                                def setup_and_query(products):
                                    conn = sqlite3.connect(":memory:")
                                    conn.execute(\"""CREATE TABLE products (
                                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                                        name TEXT, category TEXT, price REAL
                                    )\""")
                                    conn.executemany("INSERT INTO products (name, category, price) VALUES (?, ?, ?)", products)
                                    conn.commit()
                                    cursor = conn.execute(\"""
                                        SELECT category, ROUND(AVG(price), 2) as avg_price
                                        FROM products
                                        GROUP BY category
                                        ORDER BY avg_price DESC
                                    \""")
                                    result = [{"category": row[0], "avg_price": row[1]} for row in cursor.fetchall()]
                                    conn.close()
                                    return result
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Safe CRUD Functions",
                            type: .code,
                            difficulty: .hard,
                            question: "Write a function search_products(conn, filters) that takes a SQLite connection and a filter dict (possible keys: category, min_price, max_price). Dynamically build the WHERE clause and return results.\nExample: filters={\"category\": \"Electronics\", \"min_price\": 100} should generate WHERE category = ? AND price >= ?\nAll conditions are optional (filters may be an empty dict). Return list of dicts.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Database CRUD Wrapper",
                                narrative: "You need to wrap a set of safe CRUD functions for your team, ensuring all queries are parameterized.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Dynamically build conditions list and params list", "Use \" AND \".join(conditions) to combine conditions", "sqlite3.Row lets you convert results with dict(row)"],
                            explanation: "This exercise practices the safe pattern for dynamic SQL construction: collect conditions and params separately, then JOIN them. Combined with parameterized queries (?), this ensures safety. sqlite3.Row enables dict-like result access.",
                            frameworkTip: "Safe dynamic SQL pattern: always use ? placeholders, never concatenate user input. Use lists to collect conditions, then JOIN.",
                            starterCode: """
                                import sqlite3

                                def search_products(conn, filters):
                                    # Dynamically build SQL WHERE clause
                                    # Use parameterized queries (? placeholders)
                                    # Return list of dicts
                                    pass
                            """,
                            expectedQuery: """
                                import sqlite3

                                def search_products(conn, filters):
                                    query = "SELECT * FROM products"
                                    conditions = []
                                    params = []
                                    if "category" in filters:
                                        conditions.append("category = ?")
                                        params.append(filters["category"])
                                    if "min_price" in filters:
                                        conditions.append("price >= ?")
                                        params.append(filters["min_price"])
                                    if "max_price" in filters:
                                        conditions.append("price <= ?")
                                        params.append(filters["max_price"])
                                    if conditions:
                                        query += " WHERE " + " AND ".join(conditions)
                                    conn.row_factory = sqlite3.Row
                                    rows = conn.execute(query, params).fetchall()
                                    return [dict(row) for row in rows]
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "SQL Injection Attack & Defense",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which of the following code snippets correctly prevents SQL Injection?\n\n```python\n# Approach A — String concatenation\ncursor.execute(\"SELECT * FROM users WHERE name = '\" + user_input + \"'\")\n\n# Approach B — f-string\ncursor.execute(f\"SELECT * FROM users WHERE name = '{user_input}'\")\n\n# Approach C — Parameterized query\ncursor.execute(\"SELECT * FROM users WHERE name = ?\", (user_input,))\n\n# Approach D — Manual quote filtering\nsafe = user_input.replace(\"'\", \"\")\ncursor.execute(f\"SELECT * FROM users WHERE name = '{safe}'\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SQL Injection — The Most Dangerous Security Vulnerability",
                                narrative: "In a Google interview, you are shown a database query snippet. The interviewer asks you to identify the security vulnerability and explain the correct defense. This is foundational security knowledge every backend engineer must master.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Approach A (String concatenation)", explanation: "String concatenation is the classic SQL Injection vulnerability. An attacker can input ' OR 1=1 -- to bypass authentication."),
                                Challenge.Option(id: "B", text: "Approach B (f-string)", explanation: "f-strings are essentially the same as string concatenation and carry the same SQL Injection risk."),
                                Challenge.Option(id: "C", text: "Approach C (Parameterized query)", explanation: "Correct! Parameterized queries let the database engine handle escaping automatically. User input is always treated as \"data\" rather than \"SQL commands\", fundamentally preventing SQL Injection."),
                                Challenge.Option(id: "D", text: "Approach D (Manual quote filtering)", explanation: "Manual filtering is unreliable. Attackers can bypass it using Unicode encoding, double escaping, and other techniques. Never sanitize SQL yourself."),
                            ],
                            correctAnswer: "C",
                            hints: ["The core issue with SQL Injection is user input being executed as SQL commands", "Parameterized queries use ? or %s as placeholders", "Manual filtering is never secure enough"],
                            explanation: "SQL Injection is the #1 vulnerability in the OWASP Top 10. There is only one correct defense: Parameterized Queries.\n\n```python\n# Correct approach\ncursor.execute(\"SELECT * FROM users WHERE name = ?\", (user_input,))\n\n# PostgreSQL/MySQL uses %s\ncursor.execute(\"SELECT * FROM users WHERE name = %s\", (user_input,))\n```\n\nThe database treats parameters as \"pure data\" — even if the input contains SQL syntax, it will not be executed.",
                            frameworkTip: "When asked about database security in interviews, say \"parameterized queries\" immediately. Bonus points if you mention OWASP Top 10 and ORM auto-protection (e.g., SQLAlchemy). Google places high value on security awareness."
                        ),
                        Challenge(
                            id: 6,
                            name: "Connection Context Manager",
                            type: .code,
                            difficulty: .medium,
                            question: "Complete the following function using a context manager (with statement) to safely execute SQLite operations. The function should:\n1. Open a connection with \"with\"\n2. Create an orders table (id, product, amount)\n3. Insert one order\n4. Ensure the connection is automatically closed\n\n```python\nimport sqlite3\n\ndef create_order(db_path, product, amount):\n    # Use with to manage connection, ensure auto commit and close\n    pass\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Database Connection Resource Management",
                                narrative: "You are developing an order system for an e-commerce platform. A senior engineer tells you that database connections must be managed with context managers, otherwise connection leaks will crash the server under high traffic.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["sqlite3.connect() supports the with statement", "The with block automatically handles the connection when it exits", "Remember to use parameterized queries to prevent SQL Injection"],
                            explanation: "Context Managers (with statement) ensure resources are automatically released after use:\n\n```python\nwith sqlite3.connect(db_path) as conn:\n    # conn is automatically handled when with block exits\n    # If no exception, auto commit\n    # If exception occurs, auto rollback\n```\n\nWithout \"with\", forgetting conn.close() causes connection leaks.",
                            frameworkTip: "Showing you use context managers for resource management (files, connections, locks) in interviews demonstrates you understand Python resource management best practices. This is a plus in Google and Amazon interviews.",
                            starterCode: """
                                import sqlite3

                                def create_order(db_path, product, amount):
                                    # Use with to manage connection, ensure auto commit and close
                                    pass
                            """,
                            expectedQuery: """
                                import sqlite3

                                def create_order(db_path, product, amount):
                                    with sqlite3.connect(db_path) as conn:
                                        cursor = conn.cursor()
                                        cursor.execute(\"""
                                            CREATE TABLE IF NOT EXISTS orders (
                                                id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                product TEXT NOT NULL,
                                                amount REAL NOT NULL
                                            )
                                        \""")
                                        cursor.execute(
                                            "INSERT INTO orders (product, amount) VALUES (?, ?)",
                                            (product, amount)
                                        )
                                        conn.commit()
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "21-2",
                    name: "CRUD Operations",
                    description: "INSERT/SELECT/UPDATE/DELETE",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CRUD Mapping",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What do the four letters in CRUD stand for?",
                            scenario: 
                            Challenge.Scenario(
                                title: "CRUD Concepts",
                                narrative: "CRUD represents the four basic data operations.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Create, Read, Update, Delete", explanation: "Correct! These correspond to SQL's INSERT, SELECT, UPDATE, DELETE."),
                                Challenge.Option(id: "B", text: "Connect, Read, Upload, Download", explanation: "Incorrect. CRUD is about data operations, not network operations."),
                                Challenge.Option(id: "C", text: "Create, Remove, Update, Destroy", explanation: "R is Read, D is Delete."),
                                Challenge.Option(id: "D", text: "Copy, Read, Update, Drop", explanation: "C is Create, D is Delete."),
                            ],
                            correctAnswer: "A",
                            hints: ["CRUD maps to HTTP methods: POST/GET/PUT/DELETE"],
                            explanation: "CRUD → SQL: Create=INSERT, Read=SELECT, Update=UPDATE, Delete=DELETE. CRUD → HTTP: Create=POST, Read=GET, Update=PUT, Delete=DELETE.",
                            frameworkTip: "Nearly all applications revolve around CRUD. Understanding CRUD means understanding data flow."
                        ),
                        Challenge(
                            id: 2,
                            name: "Importance of commit",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the most likely cause?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Data Not Saved",
                                narrative: "You executed INSERT but the data disappeared after closing the program.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SQL syntax error", explanation: "A syntax error would raise an error, not \"execute successfully but data disappears\"."),
                                Challenge.Option(id: "B", text: "Forgot to call conn.commit()", explanation: "Correct! sqlite3 does not auto-commit by default. You must call commit() after INSERT/UPDATE/DELETE for changes to be persisted."),
                                Challenge.Option(id: "C", text: "Database file corrupted", explanation: "Possible but uncommon. Forgetting commit is the most common cause."),
                                Challenge.Option(id: "D", text: "cursor was not closed", explanation: "Not closing the cursor does not cause data loss."),
                            ],
                            correctAnswer: "B",
                            hints: ["Write operations (INSERT/UPDATE/DELETE) require commit to take effect"],
                            explanation: "Database transaction mechanism: modifications can be rolled back before commit. Forgetting commit is the most common beginner bug.",
                            frameworkTip: "Pattern: execute → commit → verify. Or use with conn: for automatic commit."
                        ),
                        Challenge(
                            id: 3,
                            name: "Transactions & ACID Principles",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "With proper database Transaction usage, what happens when the server crashes midway through this code?\n\n```python\nconn = sqlite3.connect(\"bank.db\")\ncursor = conn.cursor()\ntry:\n    cursor.execute(\"UPDATE accounts SET balance = balance - 1000 WHERE id = 1\")  # Debit\n    # ← Server crashes here\n    cursor.execute(\"UPDATE accounts SET balance = balance + 1000 WHERE id = 2\")  # Credit\n    conn.commit()\nexcept:\n    conn.rollback()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "What Happens to Data When the Server Crashes?",
                                narrative: "You are interviewing at a payment company. The interviewer asks: \"If a user is transferring money, and the server crashes after debiting Account A but before crediting Account B, what happens?\" This is a core question about Transactions and ACID.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Account A loses 1000, Account B receives nothing (data inconsistency)", explanation: "With Transactions, no operations are permanently written before commit."),
                                Challenge.Option(id: "B", text: "Both account balances remain unchanged (Transaction auto-rollback)", explanation: "Correct! This is the guarantee of Atomicity in ACID. A Transaction either fully succeeds (commit) or fully fails (rollback). Since there was no commit when the server crashed, all changes are rolled back."),
                                Challenge.Option(id: "C", text: "Depends on whether the OS flushed data to disk", explanation: "ACID Durability guarantees only committed data is persisted. Uncommitted data is not preserved."),
                                Challenge.Option(id: "D", text: "Requires manual rollback to recover", explanation: "The database automatically rolls back uncommitted transactions on restart, no manual action needed."),
                            ],
                            correctAnswer: "B",
                            hints: ["A in ACID stands for Atomicity", "All operations before commit are temporary", "The database auto-rolls back incomplete transactions on restart"],
                            explanation: "The four ACID principles:\n- **Atomicity**: Operations in a Transaction either all succeed or all fail\n- **Consistency**: The database must be in a valid state after a Transaction\n- **Isolation**: Concurrent Transactions do not interfere with each other\n- **Durability**: Committed data is permanently saved, even if the system crashes\n\nBank transfers are the classic example for explaining Atomicity.",
                            frameworkTip: "When asked about ACID in interviews, use the bank transfer example — it is the clearest explanation. Emphasize Atomicity: \"A Transaction is like an atomic operation, indivisible.\" This is a must-know database interview topic."
                        ),
                        Challenge(
                            id: 4,
                            name: "Batch Operations Efficiency",
                            type: .code,
                            difficulty: .medium,
                            question: "Rewrite the following inefficient row-by-row insert using executemany() for batch operations.\n\n```python\n# Original inefficient approach (commits each row)\nfor product in products:\n    cursor.execute(\"INSERT INTO products (name, price) VALUES (?, ?)\",\n                   (product[\"name\"], product[\"price\"]))\n    conn.commit()  # Committing each row is extremely slow\n```\n\nRewrite as an efficient batch operation:",
                            scenario: 
                            Challenge.Scenario(
                                title: "Bulk Importing 100,000 Records",
                                narrative: "You are responsible for product data imports at an e-commerce company. A colleague wrote a loop that INSERTs one record at a time — importing 100,000 products takes 45 minutes. You need to use batch operations to bring it down to under 10 seconds.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["executemany() takes one SQL statement and a list of parameters", "Use list comprehension to transform the data format", "Only commit once after all data is inserted"],
                            explanation: "Performance difference with batch operations:\n\n```python\n# Slow: N executes + N commits = N disk I/O operations\nfor item in data:\n    cursor.execute(sql, item)\n    conn.commit()\n\n# Fast: 1 executemany + 1 commit = 1 disk I/O operation\ncursor.executemany(sql, data_list)\nconn.commit()\n```\n\nThe performance gap can be 100-1000x because each commit involves disk writes.",
                            frameworkTip: "When discussing database performance optimization in interviews, \"batch operations + reducing commit count\" is the most basic and effective method. Show you understand I/O is the performance bottleneck.",
                            starterCode: """
                                import sqlite3

                                def batch_insert(db_path, products):
                                    # products = [{"name": "Product A", "price": 100}, ...]
                                    # Use executemany for batch insert, commit only once at the end
                                    pass
                            """,
                            expectedQuery: """
                                import sqlite3

                                def batch_insert(db_path, products):
                                    with sqlite3.connect(db_path) as conn:
                                        cursor = conn.cursor()
                                        cursor.executemany(
                                            "INSERT INTO products (name, price) VALUES (?, ?)",
                                            [(p["name"], p["price"]) for p in products]
                                        )
                                        conn.commit()
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "21-3",
                    name: "ORM Concepts",
                    description: "SQLAlchemy basic concepts",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ORM vs Raw SQL",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main advantage of ORM?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choosing Data Access Method",
                                narrative: "The team is debating whether to use raw SQL or ORM (SQLAlchemy).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Better performance than raw SQL", explanation: "ORM is usually slower than raw SQL (abstraction layer overhead)."),
                                Challenge.Option(id: "B", text: "Manipulate databases with Python objects — code is easier to maintain", explanation: "Correct! ORM maps database tables to Python classes, making operations more intuitive. It also automatically prevents SQL injection."),
                                Challenge.Option(id: "C", text: "No database needed", explanation: "ORM still requires a database — it just uses Python syntax instead of SQL."),
                                Challenge.Option(id: "D", text: "Supports more database features", explanation: "Raw SQL can usually access more database-specific features. ORM sometimes cannot express complex queries."),
                            ],
                            correctAnswer: "B",
                            hints: ["ORM = Object-Relational Mapping — manipulate databases with objects"],
                            explanation: "ORM advantages: code readability, automatic SQL injection prevention, database-agnostic (switch DB without changing code). Disadvantages: performance overhead, complex queries are inconvenient.",
                            frameworkTip: "Use ORM for simple CRUD, raw SQL for complex analytical queries. Both can be mixed."
                        ),
                        Challenge(
                            id: 2,
                            name: "N+1 Query Problem",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "How many SQL queries will this SQLAlchemy ORM code generate?\n\n```python\n# Model definition\nclass Order(Base):\n    id = Column(Integer, primary_key=True)\n    customer_id = Column(Integer, ForeignKey(\"customers.id\"))\n    customer = relationship(\"Customer\")  # Lazy Loading (default)\n\n# Query code\norders = session.query(Order).all()  # Query 1: get all orders\nfor order in orders:                  # 100 orders\n    print(order.customer.name)        # Each access triggers a query\n```\n\nAssuming 100 orders, how many total SQL queries are generated?",
                            scenario: 
                            Challenge.Scenario(
                                title: "N+1 Query — The ORM Performance Killer",
                                narrative: "In a Google interview, you are asked: \"Your API takes 3 seconds to respond with an order list page, and the database has 100 orders. Your ORM code looks clean — where might the problem be?\" This is testing the N+1 query problem.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1 query (ORM optimizes automatically)", explanation: "In Lazy Loading mode, the ORM does not automatically load related data — each access triggers an additional query."),
                                Challenge.Option(id: "B", text: "2 queries (one for orders, one for all customers)", explanation: "This would be Eager Loading behavior, but the default is Lazy Loading."),
                                Challenge.Option(id: "C", text: "101 queries (1 + N, this is the N+1 problem)", explanation: "Correct! The first query gets all orders, then accessing customer on each order triggers 1 query each, totaling 1 + 100 = 101 queries. This is the N+1 query problem."),
                                Challenge.Option(id: "D", text: "100 queries (one per order)", explanation: "Don't forget the first query to get all orders — the total is 1 + N."),
                            ],
                            correctAnswer: "C",
                            hints: ["Default Lazy Loading only queries when accessing related objects", "The first .all() is 1 query", "Each .customer access in the loop triggers 1 more query"],
                            explanation: "The N+1 query problem:\n- 1 query to get the main data (N rows)\n- N queries to get each row's related data\n- Total: N+1 queries\n\nSolution — Eager Loading:\n```python\n# joinedload: uses JOIN to fetch everything in 1 query\norders = session.query(Order).options(\n    joinedload(Order.customer)\n).all()\n\n# subqueryload: uses subquery (2 queries)\norders = session.query(Order).options(\n    subqueryload(Order.customer)\n).all()\n```",
                            frameworkTip: "When asked about ORM performance issues in interviews, N+1 should be your first thought. Being able to say \"solve it with Eager Loading (joinedload / subqueryload)\" and explain Lazy vs Eager loading is a major plus in Google interviews."
                        ),
                        Challenge(
                            id: 3,
                            name: "ORM Query Optimization",
                            type: .code,
                            difficulty: .medium,
                            question: "The following SQLAlchemy query has poor performance. Rewrite it to be more efficient.\n\n```python\n# Inefficient: fetch all data then filter in Python\nall_products = session.query(Product).all()\nexpensive = [p for p in all_products if p.price > 100]\nsorted_products = sorted(expensive, key=lambda p: p.price, reverse=True)\ntop_10 = sorted_products[:10]\n```\n\nRewrite to perform filtering, sorting, and pagination at the database level:",
                            scenario: 
                            Challenge.Scenario(
                                title: "ORM Query Performance Tuning",
                                narrative: "You are a backend engineer at a SaaS company, and the Dashboard page load time has slowed from 200ms to 5 seconds. The DBA tells you the problem is in how the ORM queries are written. You need to optimize the following ORM query.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use .filter() instead of Python list comprehension filtering", "Use .order_by() instead of Python's sorted()", "Use .limit() instead of Python's slice [:10]"],
                            explanation: "Performance difference between database vs Python processing:\n\n```python\n# Bad: fetch 100,000 rows from DB, filter in Python\nall_data = session.query(Product).all()  # Transfer all 100K rows\nfiltered = [x for x in all_data if x.price > 100]  # Python filtering\n\n# Good: let the database return only the 10 rows needed\nsession.query(Product)\\\n    .filter(Product.price > 100)\\\n    .order_by(Product.price.desc())\\\n    .limit(10)\\\n    .all()  # Only 10 rows transferred\n```\n\nDatabases have index optimization and handle filtering and sorting orders of magnitude faster than Python.",
                            frameworkTip: "For performance optimization questions in interviews, the core principle is \"let the database do what it does best.\" Mentioning pushing filter/order_by/limit to the SQL layer shows you understand ORMs abstract SQL rather than replace it.",
                            starterCode: """
                                # Use SQLAlchemy ORM's filter, order_by, limit
                                # Let the database handle filtering and sorting, not Python
                                def get_top_expensive(session):
                                    pass
                            """,
                            expectedQuery: """
                                def get_top_expensive(session):
                                    return session.query(Product)\\
                                        .filter(Product.price > 100)\\
                                        .order_by(Product.price.desc())\\
                                        .limit(10)\\
                                        .all()
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "21-4",
                    name: "Flask/FastAPI Introduction",
                    description: "route, request/response, JSON API",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Framework Selection",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which framework is most suitable for building REST APIs?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Web Frameworks",
                                narrative: "You want to build a simple REST API with Python.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Django — full-featured web framework", explanation: "Django has many features but is too heavy for simple APIs."),
                                Challenge.Option(id: "B", text: "FastAPI — designed for APIs, high performance, auto-documentation", explanation: "Correct! FastAPI is lightweight, high-performance, and auto-generates API documentation (Swagger) — ideal for REST APIs."),
                                Challenge.Option(id: "C", text: "pandas — data analysis package", explanation: "pandas is for data processing, not a web framework."),
                                Challenge.Option(id: "D", text: "requests — HTTP client", explanation: "requests is for calling APIs as a client, not building APIs as a framework."),
                            ],
                            correctAnswer: "B",
                            hints: ["Both FastAPI and Flask are suitable for building APIs. FastAPI is newer with better performance."],
                            explanation: "FastAPI: automatic type validation, auto API documentation, async support, high performance. Flask: more mature, larger community, more extensions. Both are beginner-friendly.",
                            frameworkTip: "FastAPI recommended for new projects. You may encounter Flask when maintaining older projects. The concepts are transferable."
                        ),
                        Challenge(
                            id: 2,
                            name: "Basic Routing",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "When accessing /users/42, what is the response?",
                            scenario: 
                            Challenge.Scenario(
                                title: "FastAPI Routing",
                                narrative: "You see the following code:\n@app.get(\"/users/{user_id}\")\ndef get_user(user_id: int):\n    return {\"user_id\": user_id}",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "{\"user_id\": \"42\"}", explanation: "FastAPI automatically converts based on type hints. user_id: int converts \"42\" to 42."),
                                Challenge.Option(id: "B", text: "{\"user_id\": 42}", explanation: "Correct! FastAPI automatically converts the path parameter to an integer based on user_id: int."),
                                Challenge.Option(id: "C", text: "404 Not Found", explanation: "The route matches /users/{user_id} — 42 will be captured."),
                                Challenge.Option(id: "D", text: "Error", explanation: "FastAPI handles type conversion automatically."),
                            ],
                            correctAnswer: "B",
                            hints: ["FastAPI uses type hints for automatic validation and conversion"],
                            explanation: "FastAPI type hints are not just documentation — they have real functionality: auto-validation (passing \"abc\" to an int parameter returns 422), auto-conversion, and auto-documentation generation.",
                            frameworkTip: "FastAPI's core philosophy: use Python type hints to drive everything (validation, documentation, serialization)."
                        ),
                        Challenge(
                            id: 3,
                            name: "Implementing a Flask API Endpoint",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a Flask route function get_employees() mounted on GET /api/employees:\n- Accepts query parameters: department (optional), page (default 1), per_page (default 10)\n- Filters from a global list EMPLOYEES (list of dicts)\n- Returns JSON: {\"data\": paginated employee list, \"total\": total count, \"page\": current page, \"per_page\": items per page}\n(Only write the route function — assume app and EMPLOYEES already exist)",
                            scenario: 
                            Challenge.Scenario(
                                title: "Employee Query API",
                                narrative: "You need to build a simple employee query API with Flask that supports filtering by department and pagination.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["request.args.get(\"key\", default, type=int) safely gets query parameters", "Pagination formula: start = (page - 1) * per_page", "Use list slicing [start:end] to get the current page of data"],
                            explanation: "This exercise practices Flask route basics: getting query parameters (request.args.get), data filtering (list comprehension), pagination logic, and JSON responses (jsonify).",
                            frameworkTip: "Standard API pagination response: include data, total, page, per_page. This lets the frontend know how much data remains.",
                            starterCode: """
                                from flask import Flask, request, jsonify

                                # Assume app = Flask(__name__) is already created
                                # Assume EMPLOYEES = [{"id": 1, "name": "...", "department": "..."}] already exists

                                @app.route("/api/employees", methods=["GET"])
                                def get_employees():
                                    # Get query parameters
                                    # Filter and paginate
                                    # Return JSON
                                    pass
                            """,
                            expectedQuery: """
                                from flask import Flask, request, jsonify

                                @app.route("/api/employees", methods=["GET"])
                                def get_employees():
                                    department = request.args.get("department")
                                    page = request.args.get("page", 1, type=int)
                                    per_page = request.args.get("per_page", 10, type=int)
                                    filtered = EMPLOYEES
                                    if department:
                                        filtered = [e for e in EMPLOYEES if e["department"] == department]
                                    total = len(filtered)
                                    start = (page - 1) * per_page
                                    end = start + per_page
                                    return jsonify({
                                        "data": filtered[start:end],
                                        "total": total,
                                        "page": page,
                                        "per_page": per_page,
                                    })
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "FastAPI Dependency Injection & Pydantic Validation",
                            type: .code,
                            difficulty: .hard,
                            question: "Build a user creation API using FastAPI + Pydantic with these requirements:\n1. Define a UserCreate schema using Pydantic BaseModel (name: str, email: str, age: int)\n2. age must be >= 0 and <= 150\n3. email must contain @\n4. Use dependency injection to get the database session",
                            scenario: 
                            Challenge.Scenario(
                                title: "FastAPI's Killer Features (2024 Adoption +141%)",
                                narrative: "You are interviewing at a startup. The CTO says they just migrated from Flask to FastAPI, primarily for Pydantic auto-validation and dependency injection. They ask you to write a validated API using FastAPI.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Pydantic's @validator decorator is for custom validation logic", "Dependency injection uses Depends() with the yield pattern", "FastAPI automatically converts validation errors to 422 responses"],
                            explanation: "FastAPI's two killer features:\n\n**Pydantic Validation**: Automatically converts request body to type-safe objects. Validation failures auto-return 422 errors.\n\n**Dependency Injection**: Use Depends() to inject DB sessions, auth, config, etc. The yield pattern ensures resource cleanup:\n```python\ndef get_db():\n    db = SessionLocal()\n    try:\n        yield db      # Injected into endpoint\n    finally:\n        db.close()    # Auto-cleanup after endpoint finishes\n```",
                            frameworkTip: "FastAPI adoption grew 141% in 2024, surpassing Flask as the top Python web framework. Showing Pydantic validation + dependency injection in interviews signals you keep up with the modern Python ecosystem.",
                            starterCode: """
                                from fastapi import FastAPI, Depends
                                from pydantic import BaseModel, validator

                                app = FastAPI()

                                # 1. Define Pydantic schema
                                class UserCreate(BaseModel):
                                    pass  # Define fields and validation

                                # 2. Dependency injection: get DB session
                                def get_db():
                                    pass  # yield db session

                                # 3. API endpoint
                                @app.post("/users")
                                def create_user(user: UserCreate, db = Depends(get_db)):
                                    pass
                            """,
                            expectedQuery: """
                                from fastapi import FastAPI, Depends
                                from pydantic import BaseModel, validator

                                app = FastAPI()

                                class UserCreate(BaseModel):
                                    name: str
                                    email: str
                                    age: int

                                    @validator("age")
                                    def age_must_be_valid(cls, v):
                                        if v < 0 or v > 150:
                                            raise ValueError("Age must be between 0 and 150")
                                        return v

                                    @validator("email")
                                    def email_must_contain_at(cls, v):
                                        if "@" not in v:
                                            raise ValueError("Invalid email format")
                                        return v

                                def get_db():
                                    db = SessionLocal()
                                    try:
                                        yield db
                                    finally:
                                        db.close()

                                @app.post("/users")
                                def create_user(user: UserCreate, db = Depends(get_db)):
                                    db_user = User(name=user.name, email=user.email, age=user.age)
                                    db.add(db_user)
                                    db.commit()
                                    return {"id": db_user.id, "name": db_user.name}
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "async def vs def Difference",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "In FastAPI, which statement is correct?\n\n```python\n# Approach A\n@app.get(\"/users\")\ndef get_users(db = Depends(get_db)):\n    return db.query(User).all()\n\n# Approach B\n@app.get(\"/users\")\nasync def get_users(db = Depends(get_db)):\n    return db.query(User).all()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "When to Use async in FastAPI?",
                                narrative: "During a team code review, someone changed all FastAPI endpoints to async def, but performance actually got worse. You need to understand when to use async def versus regular def.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Approach B is always faster because async is always faster", explanation: "async is not a magic speed boost. If the function body is all synchronous I/O (like traditional ORM), async def can actually be slower."),
                                Challenge.Option(id: "B", text: "Approach A is better because with synchronous SQLAlchemy ORM + regular def, FastAPI automatically runs it in a thread pool without blocking the event loop", explanation: "Correct! FastAPI automatically uses a threadpool for regular def functions, preventing event loop blocking. But using async def with synchronous blocking I/O (like traditional SQLAlchemy) blocks the event loop, degrading overall performance."),
                                Challenge.Option(id: "C", text: "Both are exactly the same, FastAPI handles it automatically", explanation: "FastAPI handles def and async def differently. def runs in a threadpool, async def runs on the event loop."),
                                Challenge.Option(id: "D", text: "You should always use async def, it is FastAPI best practice", explanation: "async def only has advantages when paired with async I/O (like httpx, asyncpg)."),
                            ],
                            correctAnswer: "B",
                            hints: ["FastAPI handles def and async def differently", "Synchronous blocking I/O inside async def blocks the event loop", "FastAPI automatically puts regular def into a thread pool"],
                            explanation: "FastAPI's execution model:\n\n- **def (synchronous)**: FastAPI automatically runs it in a threadpool, not blocking the event loop. Suitable for traditional ORM, file I/O, and other synchronous operations.\n\n- **async def (asynchronous)**: Runs directly on the event loop. Must be paired with async I/O (await httpx.get(), await asyncpg.fetch()), otherwise it blocks the event loop.\n\nRule: if there is no await, do not use async def.",
                            frameworkTip: "Being able to distinguish async def vs def in FastAPI during interviews shows you understand Python's asyncio execution model — advanced knowledge that many candidates get confused about."
                        ),
                    ]
                ),
                Quest(
                    id: "21-5",
                    name: "Building RESTful APIs",
                    description: "GET/POST endpoints, status codes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "RESTful Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which set of endpoints best follows RESTful design?",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Design",
                                narrative: "You are designing an API for managing books.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GET /getBooks, POST /createBook, POST /deleteBook", explanation: "Verbs in URLs do not follow REST. REST uses HTTP methods for actions."),
                                Challenge.Option(id: "B", text: "GET /books, POST /books, GET /books/{id}, DELETE /books/{id}", explanation: "Correct! RESTful: URLs are nouns (resources), HTTP methods are verbs (actions)."),
                                Challenge.Option(id: "C", text: "GET /api/v1/book/list, POST /api/v1/book/add", explanation: "Verbs (list, add) should not be in the URL."),
                                Challenge.Option(id: "D", text: "POST /books/get, POST /books/delete", explanation: "Using POST for all operations does not follow REST. Different actions use different HTTP methods."),
                            ],
                            correctAnswer: "B",
                            hints: ["REST principle: URL = nouns (resources), HTTP method = verbs (actions)"],
                            explanation: "RESTful API design: GET /resources (list), POST /resources (create), GET /resources/{id} (single), PUT /resources/{id} (update), DELETE /resources/{id} (delete).",
                            frameworkTip: "REST design mantra: URLs contain only nouns, HTTP methods determine the action."
                        ),
                        Challenge(
                            id: 2,
                            name: "Response Status Codes",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What status code should it return?",
                            scenario: 
                            Challenge.Scenario(
                                title: "HTTP Status Codes",
                                narrative: "Your POST /books endpoint successfully created a new book.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "200 OK", explanation: "200 is generic success, but there is a more precise status code for resource creation."),
                                Challenge.Option(id: "B", text: "201 Created", explanation: "Correct! 201 indicates the resource was successfully created. More precise than 200."),
                                Challenge.Option(id: "C", text: "204 No Content", explanation: "204 is for success with no response body (e.g., DELETE). Resource creation usually returns the new resource."),
                                Challenge.Option(id: "D", text: "301 Moved", explanation: "301 is a redirect — unrelated to resource creation."),
                            ],
                            correctAnswer: "B",
                            hints: ["201 Created is the standard status code for successful resource creation"],
                            explanation: "Common status codes: 200 (success), 201 (created), 204 (no content), 400 (bad request), 404 (not found), 422 (validation failed), 500 (server error).",
                            frameworkTip: "Choose the most precise status code. 200 is a fallback, but 201, 204, etc. better express intent."
                        ),
                        Challenge(
                            id: 3,
                            name: "HTTP Status Code Selection Logic",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "You are designing a PUT /products/{id} update product API. What status codes should these four error scenarios return?\n\n1. Client sends JSON but is missing the required field \"price\"\n2. Product ID does not exist\n3. Client sends price: \"abc\" (type error)\n4. Database connection fails during update",
                            scenario: 
                            Challenge.Scenario(
                                title: "RESTful API Error Handling Standards",
                                narrative: "In an Amazon interview, you are designing a product management API. The interviewer asks you to handle various error scenarios and choose the correct HTTP status codes. \"Choosing the wrong status code means you don't understand the HTTP protocol,\" the interviewer says.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1→400, 2→404, 3→400, 4→500", explanation: "In scenario 3, price: \"abc\" is a format/type validation error — 422 (Unprocessable Entity) is more accurate."),
                                Challenge.Option(id: "B", text: "1→422, 2→404, 3→422, 4→500", explanation: "Correct!\n- 422 (Unprocessable Entity): Request format is valid but semantically wrong (missing fields, type errors)\n- 404 (Not Found): Resource does not exist\n- 500 (Internal Server Error): Server-side error (DB is down)"),
                                Challenge.Option(id: "C", text: "1→400, 2→404, 3→422, 4→503", explanation: "Missing a required field is also a semantic error, should use 422. 503 is for service temporarily unavailable, database errors typically use 500."),
                                Challenge.Option(id: "D", text: "1→400, 2→400, 3→400, 4→500", explanation: "Product not found should use 404, not 400. 400 is for malformed requests, 404 is for missing resources."),
                            ],
                            correctAnswer: "B",
                            hints: ["400 Bad Request: Request format/syntax error (e.g., JSON parse failure)", "404 Not Found: Requested resource does not exist", "422 Unprocessable Entity: Valid format but semantic/validation error", "500 Internal Server Error: Unexpected server-side error"],
                            explanation: "HTTP Status Code Selection Guide:\n\n**4xx Client Errors**\n- 400 Bad Request: Syntax error (malformed JSON, missing Content-Type)\n- 401 Unauthorized: Not authenticated (not logged in)\n- 403 Forbidden: Authenticated but no permission\n- 404 Not Found: Resource does not exist\n- 409 Conflict: Conflict (e.g., duplicate creation)\n- 422 Unprocessable Entity: Semantic error (field validation failure)\n\n**5xx Server Errors**\n- 500 Internal Server Error: Generic server error\n- 503 Service Unavailable: Service under maintenance",
                            frameworkTip: "Choosing correct HTTP status codes when designing APIs in interviews is key to showing you understand REST specifications. Pay special attention to the 400 vs 422 distinction — many senior engineers confuse these. Amazon particularly values API design rigor."
                        ),
                        Challenge(
                            id: 4,
                            name: "API Response Format Design",
                            type: .code,
                            difficulty: .medium,
                            question: "Design unified API response format functions supporting both success and error cases.\n\nSuccess response example:\n```json\n{\"success\": true, \"data\": {\"id\": 1, \"name\": \"Product\"}, \"error\": null}\n```\n\nError response example:\n```json\n{\"success\": false, \"data\": null, \"error\": {\"code\": \"NOT_FOUND\", \"message\": \"Product not found\"}}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Unified API Response Format",
                                narrative: "You are designing a RESTful API. The CTO requires all API responses to use a unified format containing a success status, data payload, and error message. This allows frontend engineers to have consistent handling logic.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["JSONResponse lets you set both status_code and content", "Success has error as null, error has data as null", "Error object contains code (machine-readable) and message (human-readable)"],
                            explanation: "Benefits of a unified API response format:\n\n1. **Consistent frontend handling**: Frontend only needs to check the success field\n2. **Machine-parseable errors**: error.code lets frontend handle different error types differently\n3. **Debug-friendly**: error.message provides human-readable error descriptions\n\n```python\n# Frontend handling logic\nif response.success:\n    render(response.data)\nelse:\n    showError(response.error.message)\n```\n\nThis is standard practice at Google, Amazon, Stripe, and other major companies.",
                            frameworkTip: "Proposing a unified response format when designing APIs in interviews shows real-world project experience. The error object with both code and message demonstrates you think about frontend-backend collaboration. Amazon's Leadership Principle \"Customer Obsession\" is reflected in designing friendly interfaces for the frontend (your customer).",
                            starterCode: """
                                from fastapi.responses import JSONResponse

                                def success_response(data, status_code=200):
                                    # Return unified success format
                                    pass

                                def error_response(code, message, status_code=400):
                                    # Return unified error format
                                    pass

                                # Usage example
                                @app.get("/products/{product_id}")
                                def get_product(product_id: int):
                                    product = db.query(Product).get(product_id)
                                    if not product:
                                        return error_response("NOT_FOUND", "Product not found", 404)
                                    return success_response({"id": product.id, "name": product.name})
                            """,
                            expectedQuery: """
                                from fastapi.responses import JSONResponse

                                def success_response(data, status_code=200):
                                    return JSONResponse(
                                        status_code=status_code,
                                        content={
                                            "success": True,
                                            "data": data,
                                            "error": None
                                        }
                                    )

                                def error_response(code, message, status_code=400):
                                    return JSONResponse(
                                        status_code=status_code,
                                        content={
                                            "success": False,
                                            "data": None,
                                            "error": {
                                                "code": code,
                                                "message": message
                                            }
                                        }
                                    )
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "21-6",
                    name: "Todo API (Boss)",
                    description: "Design a complete CRUD API",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Todo API Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Todo API",
                                narrative: "You need to design a Todo API using FastAPI + SQLite.\n\nFeature requirements:\n- Create todo items (title, description, due_date)\n- List all todos (support filtering by status, sorting by due_date)\n- Get a single todo\n- Update a todo (modify title, status)\n- Delete a todo",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Design in order: schema → endpoints → logic", "Use Pydantic BaseModel to define request body structure"],
                            explanation: "This API covers complete CRUD: create, list (with filtering), single query, update, and delete. Plus appropriate status codes and error handling.",
                            frameworkTip: "API design order: Schema → Endpoints → Logic → Error Handling → Testing."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 22,
            name: "Business Process Tool Development",
            emoji: "🏗️",
            description: "Form processing, workflow automation, internal tool thinking",
            quests: [
                Quest(
                    id: "22-1",
                    name: "Requirements Analysis & Specification",
                    description: "User Stories, feature lists, MVP",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "User Story Format",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct User Story format?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Writing Requirements",
                                narrative: "You need to write requirements for an internal leave request system.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The system should have a leave feature", explanation: "Too vague — does not specify who, what, or why."),
                                Challenge.Option(id: "B", text: "As an employee, I want to submit a leave request so that my manager can approve it", explanation: "Correct! User Story format: As a [role], I want to [action], so that [purpose]."),
                                Challenge.Option(id: "C", text: "Build a leave API with Python + SQLite", explanation: "This is a technical solution, not a requirement. Requirements should be technology-agnostic."),
                                Challenge.Option(id: "D", text: "CREATE TABLE leaves (id, employee_id, ...)", explanation: "This is implementation detail, not a requirement."),
                            ],
                            correctAnswer: "B",
                            hints: ["User Story = As a [who], I want to [what], so that [why]"],
                            explanation: "User Stories describe user needs without technical details. Good User Stories have Acceptance Criteria that define what \"done\" means.",
                            frameworkTip: "Three elements of a User Story: role (who uses it) + action (what they do) + value (why they do it)."
                        ),
                        Challenge(
                            id: 2,
                            name: "MVP Thinking",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What should the MVP include?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Minimum Viable Product",
                                narrative: "Your manager wants a \"complete\" leave system, but you only have two weeks.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "All features, but each only 80% complete", explanation: "An 80% complete feature is effectively 0% — users cannot use incomplete features."),
                                Challenge.Option(id: "B", text: "Core flow fully functional (submit + approve + query), other features deferred", explanation: "Correct! MVP = core flow fully functional. Let users complete one full cycle first, then iterate to add features."),
                                Challenge.Option(id: "C", text: "Build a beautiful UI first, add features later", explanation: "UI cannot replace functionality. MVP prioritizes functionality — UI can be simple."),
                                Challenge.Option(id: "D", text: "Write complete documentation first, then start development", explanation: "Over-documentation delays delivery. MVP stage only needs sufficient documentation."),
                            ],
                            correctAnswer: "B",
                            hints: ["MVP = minimal but complete core flow. \"Small\" but \"usable\"."],
                            explanation: "MVP is not a half-finished product — it is a version with minimal features that is fully usable. The core cycle works end-to-end, and users can complete a task from start to finish.",
                            frameworkTip: "MVP decision method: can the core flow work without this feature? Yes → defer it. No → must include it."
                        ),
                        Challenge(
                            id: 3,
                            name: "Writing User Stories",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "The product manager wants a \"batch export order report\" feature. Which User Story best follows the standard format and includes valid Acceptance Criteria?",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Stories & Acceptance Criteria",
                                narrative: "You just joined the internal tools team at an e-commerce company. The PM asks you to write requirements for a new feature using the User Story format. You need to understand the standard format and how to define effective Acceptance Criteria.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "As an Operations Manager, I want to batch export the last 30 days of order reports as CSV, so that I can report weekly sales trends to leadership.\nAC1: Date range is selectable (default 30 days)\nAC2: Export supports CSV and Excel formats\nAC3: Over 10,000 rows triggers background processing with email notification", explanation: "Correct! Complete As a / I want / So that format with clear role, feature, and business value. ACs are specific, verifiable, and account for edge cases with large datasets."),
                                Challenge.Option(id: "B", text: "Need an order export feature that supports CSV.", explanation: "Too brief — no role, no business value, no acceptance criteria. Not actionable for development."),
                                Challenge.Option(id: "C", text: "As a user, I want to export reports, so that I need it.\nAC: Feature works correctly", explanation: "Role is too vague (which user?), business value is unclear (\"I need it\" is not a value), and AC is not verifiable."),
                                Challenge.Option(id: "D", text: "As an Operations Manager, I want to build an export button with React and Node.js, so that reports can be downloaded.\nAC: Use pandas to process CSV", explanation: "User Stories should not include technical implementation details (React, Node.js, pandas). They should focus on user needs and business value."),
                            ],
                            correctAnswer: "A",
                            hints: ["Standard User Story format: As a [role], I want [feature], so that [business value]", "Acceptance Criteria must be specific and verifiable conditions", "User Stories should focus on requirements, not technical implementation"],
                            explanation: "Three elements of a User Story:\n1. Role (Who): A specific user role, not a vague \"user\"\n2. Feature (What): The goal the user wants to achieve\n3. Value (Why): The business value this feature delivers\n\nAcceptance Criteria follow the INVEST principle: Independent, Negotiable, Valuable, Estimable, Small, Testable.",
                            frameworkTip: "In interviews about requirements analysis, demonstrate you can write proper User Stories and understand the importance of Acceptance Criteria. Mentioning the INVEST principle is a bonus — it shows you know how to break down good Stories."
                        ),
                        Challenge(
                            id: 4,
                            name: "Requirement Prioritization (MoSCoW)",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Here are 4 requirements. Which MoSCoW classification is most reasonable?\n\n1. CRUD operations for customer profiles\n2. Dark mode UI theme\n3. Email integration for automated follow-up reminders\n4. Export customer list as CSV\n\nClassify using: Must have / Should have / Could have / Won't have (this time)",
                            scenario: 
                            Challenge.Scenario(
                                title: "MoSCoW Prioritization Method",
                                narrative: "Your team is building an internal CRM tool. During sprint planning, there are 8 requirements but only 2 weeks of development time. The PM asks you to prioritize using the MoSCoW method to decide what gets built first.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Must: 1 (CRUD), Should: 4 (CSV export), Could: 3 (email reminders), Won't: 2 (dark mode)", explanation: "Correct! CRUD is the core functionality — the system cannot function without it (Must). CSV export is useful but does not block launch (Should). Email reminders are a value-add (Could). Dark mode is nice-to-have and can wait for post-MVP (Won't this time)."),
                                Challenge.Option(id: "B", text: "Must: 1, 3, 4, Should: 2", explanation: "Putting too many features in Must leads to scope creep. The MoSCoW principle is that Must only includes features without which the system cannot launch."),
                                Challenge.Option(id: "C", text: "Must: 2 (dark mode), Should: 1 (CRUD), Could: 3, Won't: 4", explanation: "Dark mode is not a core feature — CRUD is. Without CRUD, the CRM system is completely unusable."),
                                Challenge.Option(id: "D", text: "Must: 1, 4, Should: 2, 3", explanation: "CSV export is useful but does not block launch, so it should not be Must. Dark mode is not even Should-level priority."),
                            ],
                            correctAnswer: "A",
                            hints: ["Must have = system cannot launch without it", "Should have = important but does not block launch", "Could have = nice-to-have value-add feature", "Won't have = not doing this time, consider for future"],
                            explanation: "MoSCoW is a classic requirement prioritization framework:\n- Must have: Core functionality, cannot launch without it\n- Should have: Important features, don't block launch but affect experience\n- Could have: Value-add features, build if time permits\n- Won't have this time: Documented but explicitly deferred\n\nKey principle: Must typically should not exceed 60% of total requirements.",
                            frameworkTip: "When asked \"how do you prioritize features\" in interviews, mention MoSCoW and explain each tier's criteria. For an advanced answer, supplement with RICE scoring (Reach, Impact, Confidence, Effort) as a quantitative aid."
                        ),
                    ]
                ),
                Quest(
                    id: "22-2",
                    name: "Form Processing",
                    description: "Input validation, data collection, error feedback",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Form Validation",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Where should form validation be done?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Input Validation",
                                narrative: "A user submits a leave request form, and you need to validate the input.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Frontend only", explanation: "Frontend validation can be bypassed (by calling the API directly). Not secure."),
                                Challenge.Option(id: "B", text: "Backend only", explanation: "Secure but poor UX — users only find out about errors after submission."),
                                Challenge.Option(id: "C", text: "Both frontend and backend", explanation: "Correct! Frontend validation improves UX (instant feedback), backend validation ensures security (never trust the frontend)."),
                                Challenge.Option(id: "D", text: "No validation needed — trust the users", explanation: "Never trust user input."),
                            ],
                            correctAnswer: "C",
                            hints: ["Frontend validation = UX, Backend validation = Security. Both are needed."],
                            explanation: "Frontend validation: instant feedback, reduces invalid requests. Backend validation: security barrier, data integrity. Always have backend validation; frontend is a bonus.",
                            frameworkTip: "Validation principle: frontend validation is for UX, backend validation is for Security. You cannot rely on frontend alone."
                        ),
                        Challenge(
                            id: 2,
                            name: "Pydantic Validation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which Pydantic model is most complete?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Using Pydantic for Validation",
                                narrative: "You are using FastAPI + Pydantic to define the data model for leave requests.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class LeaveRequest(BaseModel):\n    days: int", explanation: "Too minimal — missing necessary fields."),
                                Challenge.Option(id: "B", text: "class LeaveRequest(BaseModel):\n    employee_id: int\n    start_date: date\n    end_date: date\n    reason: str\n    leave_type: str", explanation: "Correct! Contains all necessary fields, and Pydantic automatically validates types. You can add validators for more checks."),
                                Challenge.Option(id: "C", text: "leave_request = {\"employee_id\": 1, \"days\": 3}", explanation: "This is a dict with no type validation. Pydantic models automatically check types."),
                                Challenge.Option(id: "D", text: "class LeaveRequest:\n    def __init__(self, **kwargs):\n        self.data = kwargs", explanation: "A regular class does not automatically validate types. Only Pydantic BaseModel does."),
                            ],
                            correctAnswer: "B",
                            hints: ["Pydantic BaseModel automatically validates types and generates JSON schema"],
                            explanation: "Pydantic models define the \"shape\" and \"rules\" of data. FastAPI automatically uses them to validate request bodies, returning 422 on errors.",
                            frameworkTip: "Use Pydantic to define all API inputs and outputs. Type hints = auto validation + auto documentation."
                        ),
                        Challenge(
                            id: 3,
                            name: "Form Validation Engine",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function validate_form(data, rules):\n- data: dict (form data, e.g., {\"name\": \"Alice\", \"age\": \"25\", \"email\": \"alice@test.com\"})\n- rules: dict of lists (validation rules, e.g., {\"name\": [\"required\", \"min:2\"], \"age\": [\"required\", \"numeric\", \"range:18-65\"], \"email\": [\"required\", \"contains:@\"]})\n- Supported rules: required (not empty), min:N (at least N characters), numeric (must be a number), range:A-B (numeric range), contains:X (must contain X)\n- Return dict: {\"valid\": bool, \"errors\": {\"field_name\": [\"error messages\"]}}",
                            scenario: 
                            Challenge.Scenario(
                                title: "Generic Form Validator",
                                narrative: "You need to design a reusable form validation engine that supports multiple validation rules.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use rule.startswith(\"min:\") to identify parameterized rules", "rule.split(\":\")[1] extracts the rule parameter", "Collect errors per field into a list; only add to errors dict if there are errors"],
                            explanation: "This exercise designs an extensible validation engine: rules are represented as strings (easy to configure), supports parameterized rules (min:2), and collects all errors for all fields. This is a common pattern in internal tools.",
                            frameworkTip: "Validation engine design: configurable rules → engine parses rules → applies one by one → collects all errors. Do not stop at the first error.",
                            starterCode: """
                                def validate_form(data, rules):
                                    errors = {}
                                    # Apply rules to each field
                                    # Collect error messages
                                    # Return result
                                    pass
                            """,
                            expectedQuery: """
                                def validate_form(data, rules):
                                    errors = {}
                                    for field, field_rules in rules.items():
                                        field_errors = []
                                        value = data.get(field, "")
                                        for rule in field_rules:
                                            if rule == "required" and not value:
                                                field_errors.append(f"{field} is required")
                                            elif rule.startswith("min:"):
                                                min_len = int(rule.split(":")[1])
                                                if len(str(value)) < min_len:
                                                    field_errors.append(f"{field} must be at least {min_len} characters")
                                            elif rule == "numeric":
                                                try:
                                                    float(value)
                                                except (ValueError, TypeError):
                                                    field_errors.append(f"{field} must be numeric")
                                            elif rule.startswith("range:"):
                                                bounds = rule.split(":")[1].split("-")
                                                try:
                                                    num = float(value)
                                                    if num < float(bounds[0]) or num > float(bounds[1]):
                                                        field_errors.append(f"{field} must be between {bounds[0]} and {bounds[1]}")
                                                except (ValueError, TypeError):
                                                    pass
                                            elif rule.startswith("contains:"):
                                                char = rule.split(":")[1]
                                                if char not in str(value):
                                                    field_errors.append(f"{field} must contain {char}")
                                        if field_errors:
                                            errors[field] = field_errors
                                    return {"valid": len(errors) == 0, "errors": errors}
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Form Validation: Frontend vs Backend",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Why is \"only doing form validation on the frontend\" a serious security problem?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Never Trust Frontend Validation Alone",
                                narrative: "You are building a leave request form for employees. A junior engineer only added JavaScript validation on the frontend (checking date formats, max leave days), thinking that was sufficient. The Tech Lead flagged a serious security issue during code review.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Because frontend validation can be completely bypassed — users can modify JavaScript via DevTools, send API requests directly with Postman, or use curl to bypass the browser entirely. The backend must validate independently.", explanation: "Correct! Frontend validation is only for user experience (instant feedback). The real security layer must be on the backend. Anyone can bypass the frontend and send requests directly to the backend."),
                                Challenge.Option(id: "B", text: "Because frontend validation is too slow and hurts user experience.", explanation: "Frontend validation is actually faster than backend (no network request needed), so speed is not the issue."),
                                Challenge.Option(id: "C", text: "Because frontend validation does not support regular expressions.", explanation: "JavaScript fully supports regular expressions — that is not the problem."),
                                Challenge.Option(id: "D", text: "Because frontend validation does not work on mobile devices.", explanation: "Frontend JavaScript validation works the same on mobile browsers."),
                            ],
                            correctAnswer: "A",
                            hints: ["Think about it: can you send requests to the server without using a browser?", "Tools like Postman and curl bypass all frontend logic", "Frontend validation is for UX, not security"],
                            explanation: "The golden rule of form validation: Frontend validation is for UX, backend validation is for security.\n\nThe correct approach is \"dual validation\":\n1. Frontend validation: Instant user feedback (e.g., field format errors show immediately)\n2. Backend validation: Security layer (validate all inputs, prevent SQL Injection, XSS, etc.)\n\nCommon attack methods:\n- Using DevTools to modify or remove frontend validation logic\n- Using Postman / curl to send API requests directly\n- Using Burp Suite to intercept and modify request content",
                            frameworkTip: "When discussing form processing in interviews, always mention the \"Never trust the client\" principle. Explaining that frontend validation is for UX while backend validation is for security demonstrates security awareness — something interviewers value highly."
                        ),
                        Challenge(
                            id: 5,
                            name: "Input Sanitization Patterns",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which code snippet has a SQL Injection risk?\n\n```python\n# Approach A\nquery = f\"SELECT * FROM tickets WHERE title LIKE '%{user_input}%'\"\ncursor.execute(query)\n\n# Approach B\nquery = \"SELECT * FROM tickets WHERE title LIKE %s\"\ncursor.execute(query, (f\"%{user_input}%\",))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Defending Against Malicious Input",
                                narrative: "You are building a search feature for an internal ticketing system. When users enter search keywords, the system uses that input to query the database. The security team found a vulnerability during penetration testing.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Approach A is vulnerable, Approach B is safe. Approach A directly concatenates user input into the SQL string, allowing attackers to inject malicious SQL. Approach B uses parameterized queries, where the database driver automatically escapes special characters.", explanation: "Correct! Parameterized queries are the standard defense against SQL Injection. If user_input is '; DROP TABLE tickets; -- it would delete the entire table with Approach A."),
                                Challenge.Option(id: "B", text: "Both are safe because they both use cursor.execute().", explanation: "cursor.execute() itself does not guarantee safety — what matters is whether parameterized queries are used."),
                                Challenge.Option(id: "C", text: "Both are vulnerable — you should use an ORM instead.", explanation: "Approach B's parameterized query is already safe. ORMs are more convenient, but parameterized queries alone can prevent SQL Injection."),
                                Challenge.Option(id: "D", text: "Approach B is vulnerable because it uses the %s placeholder.", explanation: "The %s here is not Python string formatting — it is the database driver's parameter placeholder, which is processed safely."),
                            ],
                            correctAnswer: "A",
                            hints: ["Using f-strings or string concatenation to insert user input into SQL is very dangerous", "Parameterized queries use %s or ? as placeholders, handled safely by the database driver", "Injection has consistently been one of the most common vulnerabilities in the OWASP Top 10"],
                            explanation: "Core patterns of Input Sanitization:\n\n1. Parameterized Queries: Prevent SQL Injection\n2. HTML Escaping: Prevent XSS (Cross-Site Scripting)\n3. Whitelist Validation: Only allow known-safe input formats\n4. Length Limits: Prevent Buffer Overflow and DoS\n\nRemember: Never use string concatenation or f-strings to build SQL queries.",
                            frameworkTip: "When discussing Input Sanitization in interviews, mentioning \"parameterized queries\" and \"OWASP Top 10\" demonstrates security awareness. Bonus points if you can further explain how ORMs (like SQLAlchemy or Django ORM) handle these issues automatically."
                        ),
                    ]
                ),
                Quest(
                    id: "22-3",
                    name: "Workflow Automation",
                    description: "State machines, approval processes, notifications",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "State Machine Design",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which state transition is unreasonable?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Leave Approval Process",
                                narrative: "A leave request has multiple states: draft → submitted → approved/rejected.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "draft → submitted (employee submits)", explanation: "Reasonable. Employee fills out the form and submits."),
                                Challenge.Option(id: "B", text: "submitted → approved (manager approves)", explanation: "Reasonable. Manager approves the request."),
                                Challenge.Option(id: "C", text: "approved → draft (back to draft)", explanation: "Correct! An approved request should not go back to draft. If modification is needed, a new request should be created or a dedicated \"withdrawn\" state should exist."),
                                Challenge.Option(id: "D", text: "submitted → rejected (manager rejects)", explanation: "Reasonable. Manager can reject the request."),
                            ],
                            correctAnswer: "C",
                            hints: ["State machine transitions must have business meaning. approved back to draft violates approval logic."],
                            explanation: "State machine design principles: (1) Each transition must have a clear trigger condition (2) Avoid unreasonable rollbacks (3) Terminal states (approved/rejected) are usually irreversible.",
                            frameworkTip: "When designing a state machine, draw a diagram first: circles are states, arrows are transitions, label arrows with \"who\" triggers \"under what condition\"."
                        ),
                        Challenge(
                            id: 2,
                            name: "Automation Triggers",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Where is the best place to implement this automation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Approval Notifications",
                                narrative: "After an employee submits leave, the manager should automatically receive a notification.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Frontend JavaScript sends email directly", explanation: "The frontend should not have email server credentials."),
                                Challenge.Option(id: "B", text: "Backend triggers notification on state change", explanation: "Correct! The backend triggers notification logic (email/Slack/webhook) when the state changes to submitted."),
                                Challenge.Option(id: "C", text: "Let the employee notify the manager themselves", explanation: "Manual notification will be forgotten — this is not automation."),
                                Challenge.Option(id: "D", text: "Use a cron job to check every hour", explanation: "Too much delay. Should trigger immediately when the event occurs."),
                            ],
                            correctAnswer: "B",
                            hints: ["Event-driven: state change → trigger action. Do not use polling."],
                            explanation: "Automated notifications should be event-driven: when the state changes from draft to submitted, trigger the notification. The backend is the most appropriate place (has server resources and credentials).",
                            frameworkTip: "Three questions for automation: What event triggers it? What action is triggered? How are failures handled?"
                        ),
                        Challenge(
                            id: 3,
                            name: "Approval Workflow State Machine",
                            type: .code,
                            difficulty: .hard,
                            question: "Design a WorkflowEngine class:\n- __init__(self, transitions): accepts a dict of valid state transitions, format {\"current_state\": {\"action\": \"next_state\"}}, e.g., {\"draft\": {\"submit\": \"pending\"}, \"pending\": {\"approve\": \"approved\", \"reject\": \"rejected\"}}\n- __init__ also initializes a history list to record all operations\n- transition(self, current_state, action): executes a state transition, returns the new state. Raises ValueError if invalid.\n- get_available_actions(self, state): returns a list of available actions for that state\n- get_history(self): returns operation history as list of dicts: [{\"from\": \"draft\", \"action\": \"submit\", \"to\": \"pending\"}]",
                            scenario: 
                            Challenge.Scenario(
                                title: "Leave Approval Workflow",
                                narrative: "You need to implement a state machine to manage the leave request approval workflow.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["transitions is a dict of dicts: outer key is state, inner key is action, value is the next state", "Invalid transition = state or action not in transitions", "history records from/action/to for each transition"],
                            explanation: "This exercise implements a simple state machine engine. State machines are the core of workflow automation: define valid transitions → validate during execution → record history. This pattern applies to any approval, order, or task management system.",
                            frameworkTip: "Three elements of state machine design: States (set of states), Transitions (transition rules), History (operation log).",
                            starterCode: """
                                class WorkflowEngine:
                                    def __init__(self, transitions):
                                        pass

                                    def transition(self, current_state, action):
                                        pass

                                    def get_available_actions(self, state):
                                        pass

                                    def get_history(self):
                                        pass
                            """,
                            expectedQuery: """
                                class WorkflowEngine:
                                    def __init__(self, transitions):
                                        self.transitions = transitions
                                        self.history = []

                                    def transition(self, current_state, action):
                                        if current_state not in self.transitions:
                                            raise ValueError(f"Invalid state: {current_state}")
                                        if action not in self.transitions[current_state]:
                                            raise ValueError(f"Action '{action}' not allowed in state '{current_state}'")
                                        next_state = self.transitions[current_state][action]
                                        self.history.append({"from": current_state, "action": action, "to": next_state})
                                        return next_state

                                    def get_available_actions(self, state):
                                        return list(self.transitions.get(state, {}).keys())

                                    def get_history(self):
                                        return self.history
                            """
                        ),
                        Challenge(
                            id: 4,
                            name: "Automated Report Scheduler",
                            type: .code,
                            difficulty: .medium,
                            question: "Write a function generate_report(records, config):\n- records: list of dicts (raw data)\n- config: dict containing:\n  - \"group_by\": grouping field name (str)\n  - \"metrics\": list of dicts, each with \"field\" (field name) and \"agg\" (\"sum\"/\"avg\"/\"count\"/\"max\"/\"min\")\n  - \"sort_by\": sorting field (optional)\n  - \"top_n\": return only top N results (optional)\nReturn list of dicts, each with the group_by field and all metrics results.",
                            scenario: 
                            Challenge.Scenario(
                                title: "Daily Report Generator",
                                narrative: "You need to design a report generator that automatically produces reports in different formats based on configuration.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Use setdefault for grouping", "Name result fields as f\"{field}_{agg}\" to indicate the aggregation method", "Sort and truncate are optional — check if they exist in config first"],
                            explanation: "This exercise designs a configuration-driven report engine: group → aggregate (supports multiple functions) → sort → truncate. This pattern lets the same code produce different reports through different configs.",
                            frameworkTip: "Configuration-driven development: separate logic from configuration. Same engine + different config = different reports. Change config, not code.",
                            starterCode: """
                                def generate_report(records, config):
                                    # 1. Group by group_by field
                                    # 2. Calculate metrics for each group
                                    # 3. Sort and truncate
                                    pass
                            """,
                            expectedQuery: """
                                def generate_report(records, config):
                                    group_by = config["group_by"]
                                    groups = {}
                                    for r in records:
                                        key = r[group_by]
                                        groups.setdefault(key, []).append(r)
                                    result = []
                                    for key, items in groups.items():
                                        row = {group_by: key}
                                        for metric in config["metrics"]:
                                            field = metric["field"]
                                            agg = metric["agg"]
                                            values = [item[field] for item in items if item.get(field) is not None]
                                            if agg == "sum":
                                                row[f"{field}_{agg}"] = sum(values)
                                            elif agg == "avg":
                                                row[f"{field}_{agg}"] = round(sum(values) / len(values), 2) if values else 0
                                            elif agg == "count":
                                                row[f"{field}_{agg}"] = len(values)
                                            elif agg == "max":
                                                row[f"{field}_{agg}"] = max(values) if values else None
                                            elif agg == "min":
                                                row[f"{field}_{agg}"] = min(values) if values else None
                                        result.append(row)
                                    if "sort_by" in config:
                                        result.sort(key=lambda x: x.get(config["sort_by"], 0), reverse=True)
                                    if "top_n" in config:
                                        result = result[:config["top_n"]]
                                    return result
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "Background Task Processing (Async Task Queue)",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which architecture is best suited for handling these \"time-consuming but not needing immediate response\" tasks?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sync vs Async Task Processing",
                                narrative: "Netflix's internal tools need to generate hundreds of analytics reports daily. When a user clicks \"Generate Report,\" the system must pull data from multiple sources, run computations, and create a PDF — a process that takes 3-5 minutes. With synchronous processing, the user would see a loading spinner the entire time.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use a Celery + Redis async task queue: The API receives the request, immediately returns a task_id, pushes the task to the Redis queue, and a Celery worker processes it in the background. Once complete, it updates the status or sends a notification.", explanation: "Correct! This is the industry-standard architecture. Celery is Python's most popular distributed task queue, with Redis as the Message Broker. Users don't need to wait — they can check progress via the task_id."),
                                Challenge.Option(id: "B", text: "Increase the API server timeout to 10 minutes so users can wait for synchronous processing to complete.", explanation: "Waiting synchronously for 3-5 minutes creates terrible UX, ties up server connection resources, and would crash the server under heavy load."),
                                Challenge.Option(id: "C", text: "Use JavaScript setTimeout on the frontend to retry the request every second.", explanation: "Frontend setTimeout cannot solve the backend processing time problem, and frequent retries increase server load."),
                                Challenge.Option(id: "D", text: "Use WebSocket for a long-lived connection so the server can process synchronously and return results via WebSocket.", explanation: "WebSocket is great for real-time communication, but the core problem is that long processing times tie up server resources. The task needs to be moved to a background worker."),
                            ],
                            correctAnswer: "A",
                            hints: ["Time-consuming tasks should be processed in the background, not blocking the API response", "Task Queue core concept: Producer (API) pushes tasks, Consumer (Worker) pulls and executes", "Redis can serve as a Message Broker"],
                            explanation: "Celery + Redis Architecture:\n\n1. Producer (API Server): Receives request → creates task → pushes to Redis Queue → immediately returns task_id\n2. Message Broker (Redis): Stores tasks temporarily, ensures no tasks are lost\n3. Consumer (Celery Worker): Pulls tasks from Queue → executes → updates results\n\nWhen to use sync vs async:\n- Sync: Operations with response time < 500ms (reading data, simple calculations)\n- Async: Operations with response time > a few seconds (report generation, bulk email sending, video transcoding)",
                            frameworkTip: "When asked \"how do you handle time-consuming tasks\" in interviews, mentioning the Task Queue architecture (Celery + Redis / RabbitMQ) is the standard answer. Advanced responses can mention retry mechanisms, dead letter queues, and idempotency — topics frequently explored in Netflix and other big tech interviews."
                        ),
                        Challenge(
                            id: 6,
                            name: "Job Scheduling",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "In a Python web application, which scheduling solution is most reliable and production-ready?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Choosing the Right Scheduling Tool",
                                narrative: "Your team needs to set up several recurring tasks: sync external API data at 2 AM daily, send weekly report emails every Monday at 9 AM, and check system health every hour. You need to choose the right scheduling solution.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Use while True + time.sleep() to implement a timing loop in the main program", explanation: "This approach blocks the main program, and if the process crashes the tasks stop entirely. No retry mechanism — completely unsuitable for production."),
                                Challenge.Option(id: "B", text: "Use Celery Beat with Celery Workers: Celery Beat dispatches tasks to the Queue on schedule, Workers execute them. Supports crontab syntax for defining schedules.", explanation: "Correct! Celery Beat is the scheduler component of the Celery ecosystem, seamlessly integrated with the Task Queue. It supports crontab syntax, is highly reliable, and supports distributed deployment."),
                                Challenge.Option(id: "C", text: "Use Linux crontab to schedule Python scripts directly", explanation: "Crontab works but is decoupled from the application, making it harder to manage and monitor. It also lacks Celery's retry, logging, and monitoring capabilities. Suitable for simple scenarios but not complex production environments."),
                                Challenge.Option(id: "D", text: "Use JavaScript setInterval on the frontend to trigger API calls on a timer", explanation: "Frontend scheduling is completely unreliable — if the user closes the browser, the tasks stop. Scheduled tasks must run on the server side."),
                            ],
                            correctAnswer: "B",
                            hints: ["Production scheduling needs reliability, observability, and retry capability", "Celery Beat is Celery's scheduling component, naturally integrated with the Task Queue", "crontab syntax: minute hour day month weekday"],
                            explanation: "Job Scheduling solutions comparison:\n\n1. Celery Beat: Best for Python web apps, integrated with Task Queue, supports crontab syntax\n2. Linux Crontab: Good for simple standalone scripts, lightweight but limited\n3. APScheduler: Python scheduling library, suitable for small-to-medium apps\n4. Airflow: Best for complex DAG (Directed Acyclic Graph) workflows\n\ncrontab syntax examples:\n- \"0 2 * * *\": Every day at 2 AM\n- \"0 9 * * 1\": Every Monday at 9 AM\n- \"0 * * * *\": Every hour on the hour",
                            frameworkTip: "When discussing scheduled tasks in interviews, it is important to distinguish between \"one-off async tasks\" and \"recurring scheduled tasks.\" Use Celery tasks for one-off jobs and Celery Beat for scheduled ones. Being able to write crontab syntax shows hands-on experience."
                        ),
                    ]
                ),
                Quest(
                    id: "22-4",
                    name: "Internal Tool Architecture",
                    description: "Frontend-backend separation, API design, data flow",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Frontend-Backend Separation",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the main benefit of frontend-backend separation?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Architecture Choice",
                                narrative: "You are developing an internal tool.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Less code", explanation: "Frontend-backend separation usually means more code, but each part is clearer."),
                                Challenge.Option(id: "B", text: "Frontend and backend can be developed, tested, and deployed independently", explanation: "Correct! Separation allows teams to work in parallel and independently replace parts (e.g., switch frontend framework without affecting backend)."),
                                Challenge.Option(id: "C", text: "No API needed", explanation: "Frontend-backend separation communicates precisely through APIs."),
                                Challenge.Option(id: "D", text: "Loading is always faster", explanation: "Not necessarily. Depends on the implementation."),
                            ],
                            correctAnswer: "B",
                            hints: ["Separation = decoupling. Frontend and backend are independent, communicating via API."],
                            explanation: "Frontend-backend separation: frontend (React/Vue) + backend (FastAPI/Flask) + API (JSON). Benefits: independent development, independent deployment, multiple frontends (Web + Mobile) can share the same API.",
                            frameworkTip: "Internal tool architecture: FastAPI backend + React/Retool frontend + SQLite/PostgreSQL database."
                        ),
                        Challenge(
                            id: 2,
                            name: "Docker Compose Multi-Service Architecture",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "In the following docker-compose.yml configuration, which option correctly describes each service's role and the relationships between them?\n\n```yaml\nservices:\n  frontend:\n    build: ./frontend\n    ports: [\"3000:3000\"]\n    depends_on: [backend]\n  backend:\n    build: ./backend\n    ports: [\"5000:5000\"]\n    depends_on: [db, redis]\n    environment:\n      DATABASE_URL: postgresql://db:5432/app\n      REDIS_URL: redis://redis:6379\n  db:\n    image: postgres:15\n    volumes: [pgdata:/var/lib/postgresql/data]\n  redis:\n    image: redis:7-alpine\nvolumes:\n  pgdata:\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Docker Compose Multi-Service Orchestration",
                                narrative: "Your team is deploying an internal analytics platform consisting of a React frontend, Flask backend API, PostgreSQL database, and Redis cache. The Tech Lead requires Docker Compose to manage all these services.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Startup order is db, redis → backend → frontend. Services communicate using service names (db, redis) as hostnames. Volumes ensure database data persists across container restarts.", explanation: "Correct! depends_on defines startup order. Docker Compose automatically creates an internal network where service names serve as hostnames. The named volume (pgdata) provides data persistence."),
                                Challenge.Option(id: "B", text: "All services start simultaneously — depends_on only marks relationships without affecting order.", explanation: "depends_on does affect startup order, ensuring dependent services start first (though it does not guarantee the service is \"ready\")."),
                                Challenge.Option(id: "C", text: "Services must communicate using IP addresses — service names cannot be used.", explanation: "Docker Compose automatically creates a network where service names resolve to container IPs, so you can use service names directly as hostnames."),
                                Challenge.Option(id: "D", text: "Volumes are for sharing code between containers, not for data persistence.", explanation: "Volumes have multiple uses. The named volume (pgdata) here is primarily for data persistence, ensuring database data survives container deletion."),
                            ],
                            correctAnswer: "A",
                            hints: ["depends_on defines the startup order of services", "Docker Compose automatically creates internal DNS so services can discover each other by name", "Named volumes persist data beyond the container lifecycle"],
                            explanation: "Docker Compose core concepts:\n\n1. Services: Each service is a container — can build a custom image or use an existing one\n2. Networks: Compose auto-creates a bridge network where service name = hostname\n3. Volumes: Named volumes provide data persistence\n4. Dependencies (depends_on): Controls startup order (note: waits for container start, not service readiness)\n5. Environment variables: Injected via environment to avoid hardcoding\n\nTypical four-tier architecture: Frontend → Backend API → Database + Cache",
                            frameworkTip: "When asked about Docker Compose in interviews, focus on explaining \"service orchestration\": how multiple containers collaborate, communicate, and persist data. Mentioning the limitation of depends_on (waits for container start, not readiness) and the solution (healthcheck) shows real-world experience."
                        ),
                        Challenge(
                            id: 3,
                            name: "Microservice vs Monolith",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which statement about Monolith and Microservice architectures is most accurate?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Architecture Trade-offs",
                                narrative: "Your company is rebuilding an internal tools platform. The CTO asks: \"Should we use microservices or a monolith?\" This is one of the most classic architecture decision questions in system design interviews.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Microservices are always better than monoliths — every company should adopt microservices.", explanation: "This is a common myth. Microservices add significant operational complexity (service discovery, distributed tracing, data consistency). Small teams using microservices often move slower."),
                                Challenge.Option(id: "B", text: "Start with a Monolith, then gradually decompose into Microservices as the team and system grow. The right time to split is when deployment conflicts, team communication overhead, and independent scaling needs become bottlenecks.", explanation: "Correct! This is Martin Fowler's \"Monolith First\" strategy. Start with a Monolith for fast iteration, then migrate incrementally when there are clear reasons to split. Netflix and Amazon both started as monoliths."),
                                Challenge.Option(id: "C", text: "Monolith architecture is outdated — new projects should never use it.", explanation: "Many successful companies still use monoliths (e.g., Shopify's core system). Architecture choice depends on team size and business needs."),
                                Challenge.Option(id: "D", text: "The main benefit of microservices is less code, making it easier to understand.", explanation: "Individual microservices are smaller, but the total system complexity is higher (distributed system challenges: network latency, data consistency, service discovery, etc.)."),
                            ],
                            correctAnswer: "B",
                            hints: ["There is no \"best\" architecture — only the \"most suitable\" one", "Microservice complexity: service discovery, distributed tracing, data consistency, network latency", "Consider team size: a 5-person team using microservices may be over-engineering"],
                            explanation: "Monolith vs Microservice:\n\nMonolith advantages:\n- Simple to develop and deploy\n- Great for small teams iterating quickly\n- No distributed system complexity\n\nMicroservice advantages:\n- Independent deployment and scaling\n- Team autonomy (each team owns their service)\n- Technology flexibility (different services can use different languages)\n\nWhen to split:\n- Deployment conflicts (multiple teams modifying the same codebase)\n- Scaling needs (a specific module needs independent scaling)\n- Team grows beyond 20+ people",
                            frameworkTip: "When discussing architecture choices in interviews, the most important thing is demonstrating \"trade-off thinking\" rather than blindly advocating for one architecture. Mentioning the \"Monolith First\" strategy, explaining when to split, and describing the additional complexity microservices bring shows depth of thought."
                        ),
                    ]
                ),
                Quest(
                    id: "22-5",
                    name: "Deployment & Maintenance Concepts",
                    description: "Docker basics, .env, logging",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Docker Basic Concepts",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What problem does Docker solve?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Why Use Docker",
                                narrative: "Your tool runs on your computer but not on your colleague's.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Makes programs run faster", explanation: "Docker is not for performance — it may even be slightly slower."),
                                Challenge.Option(id: "B", text: "Ensures consistent execution across any environment (environment consistency)", explanation: "Correct! Docker packages the application and its dependencies into a container, eliminating \"it works on my machine\" problems."),
                                Challenge.Option(id: "C", text: "No need to install Python", explanation: "Docker containers still need Python — it just does not need to be installed on the host."),
                                Challenge.Option(id: "D", text: "Automatically fixes bugs", explanation: "Docker does not fix bugs — it only ensures environment consistency."),
                            ],
                            correctAnswer: "B",
                            hints: ["Docker = package your application and environment together, runs anywhere"],
                            explanation: "Docker core concepts: Dockerfile (build instructions) → Image (packaged image) → Container (running instance). Ensures consistency across development, testing, and production environments.",
                            frameworkTip: "Docker beginners only need three commands: docker build, docker run, docker-compose up."
                        ),
                        Challenge(
                            id: 2,
                            name: "Importance of Logging",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Why should production use logging instead of print?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Production Debugging",
                                narrative: "Your tool was deployed to production and has a bug, but you cannot see print() output.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "logging runs faster than print", explanation: "Speed is not the main reason."),
                                Challenge.Option(id: "B", text: "logging has levels (DEBUG/INFO/WARNING/ERROR), can write to files, and can be formatted", explanation: "Correct! logging can control levels, output to files, and add timestamps — much more professional than print."),
                                Challenge.Option(id: "C", text: "print was removed in Python 3", explanation: "print was not removed."),
                                Challenge.Option(id: "D", text: "logging looks better", explanation: "It is not just appearance — it is functional differences."),
                            ],
                            correctAnswer: "B",
                            hints: ["print is for development debugging, logging is for production environments"],
                            explanation: "logging advantages: level control (can view only ERRORs), file output, timestamps, configurable formats. import logging; logging.info(\"message\").",
                            frameworkTip: "Use print during development, switch to logging before deployment. Good logs let you find problems without reading code."
                        ),
                        Challenge(
                            id: 3,
                            name: "Logging Levels",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which logging level assignment is most appropriate?\n\n1. User successfully logs into the system\n2. Database connection pool nearing exhaustion (85% utilization)\n3. Detailed API request parameters and response content\n4. Payment processing failed — unable to charge\n5. Entire database cluster is unreachable",
                            scenario: 
                            Challenge.Scenario(
                                title: "DEBUG / INFO / WARNING / ERROR / CRITICAL",
                                narrative: "Uber's internal tools platform processes millions of transactions daily. The SRE team found that log files are too large (over 500GB per day) and needs to redesign the logging strategy. You need to understand the purpose of different log levels to make correct logging decisions in production.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1→INFO, 2→WARNING, 3→DEBUG, 4→ERROR, 5→CRITICAL", explanation: "Correct! INFO records normal business events, WARNING is an early alert for potential issues, DEBUG is detailed info for development, ERROR is a failure that needs attention, CRITICAL is a system-level severe outage."),
                                Challenge.Option(id: "B", text: "1→DEBUG, 2→INFO, 3→INFO, 4→WARNING, 5→ERROR", explanation: "User login is a normal business event (INFO), not DEBUG. Payment failure should be ERROR, not WARNING. Database cluster down is CRITICAL level."),
                                Challenge.Option(id: "C", text: "Use INFO for everything — that is simplest.", explanation: "Using a single level for everything makes it impossible to quickly filter for critical issues, and logs become massive."),
                                Challenge.Option(id: "D", text: "1→WARNING, 2→ERROR, 3→INFO, 4→CRITICAL, 5→CRITICAL", explanation: "Successful login is a normal event, not WARNING. Connection pool at 85% is an early warning, not ERROR. Detailed API parameters should be DEBUG, not INFO (too verbose for production)."),
                            ],
                            correctAnswer: "A",
                            hints: ["DEBUG: Detailed info for development debugging, usually disabled in production", "INFO: Normal business events (user login, order creation)", "WARNING: Potential issues but system still functioning", "ERROR: Feature-level failure but system overall still running", "CRITICAL: System-level outage requiring immediate action"],
                            explanation: "Python Logging Levels (severity low to high):\n\n1. DEBUG (10): Development debugging info, disabled in production\n2. INFO (20): Normal business event logging\n3. WARNING (30): Potential issue early warnings, system still operational\n4. ERROR (40): Feature-level errors\n5. CRITICAL (50): System-level severe outages\n\nProduction best practices:\n- Set level to INFO or WARNING\n- Use Structured Logging (JSON format) for easier searching and analysis\n- Pair with ELK Stack (Elasticsearch + Logstash + Kibana) or Datadog for centralized log management",
                            frameworkTip: "When asked about logging in interviews, naming all five levels with examples is the baseline. Advanced answer: mention Structured Logging (JSON format instead of plain text) and centralized log management (ELK / Datadog) to demonstrate understanding of observability at scale."
                        ),
                        Challenge(
                            id: 4,
                            name: "Monitoring Metrics",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which set of monitoring metrics and alerting strategy is most appropriate for an internal web application?",
                            scenario: 
                            Challenge.Scenario(
                                title: "Latency, Error Rate, Throughput",
                                narrative: "After launching Uber's internal dispatch system, the SRE team needs to set up monitoring and alerting. Your manager asks: \"What metrics should we monitor? How should we set alert thresholds?\" This is a common operations question in Uber interviews.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Only monitor CPU and memory usage — alert when they exceed 80%.", explanation: "Infrastructure metrics are important but insufficient. 80% CPU does not necessarily indicate a problem (could be normal batch processing). Application-level metrics are also needed."),
                                Challenge.Option(id: "B", text: "RED method: Rate (requests per second / throughput), Errors (error rate), Duration (latency / response time). Use P50/P95/P99 percentiles to measure latency instead of just averages.", explanation: "Correct! The RED method is recommended by Google SRE for service monitoring. Percentiles are preferred over averages because averages mask long-tail issues (e.g., 1% of requests take 10 seconds but the average is only 200ms)."),
                                Challenge.Option(id: "C", text: "Only monitor error rate — as long as there are no errors, the system is healthy.", explanation: "Zero error rate does not mean the system is healthy — latency could be so high the service is unusable, or throughput may have dropped (possibly due to an upstream failure)."),
                                Challenge.Option(id: "D", text: "Monitor every possible metric (100+) and set alerts on all of them.", explanation: "Too many alerts cause Alert Fatigue, leading teams to start ignoring alerts. Focus on the most critical metrics."),
                            ],
                            correctAnswer: "B",
                            hints: ["RED method: Rate, Errors, Duration", "P95 latency = 95% of requests complete within this time", "Average latency masks long-tail problems"],
                            explanation: "The RED method for monitoring (service-level):\n\n1. Rate (throughput): How many requests per second? A sudden drop may indicate upstream issues\n2. Errors (error rate): What percentage of requests fail? Alert thresholds typically set at 1-5%\n3. Duration (latency): Measured using percentiles\n   - P50: Median, represents the \"typical\" user experience\n   - P95: 95% of requests complete within this time\n   - P99: Catches the slowest 1% of requests (long-tail issues)\n\nWhy not averages?\nIf 99 requests take 100ms and 1 request takes 10,000ms:\nAverage = 199ms (looks fine), but P99 = 10,000ms (serious problem)\n\nAnother useful framework — USE (infrastructure-level): Utilization, Saturation, Errors",
                            frameworkTip: "When asked about monitoring in interviews, mentioning the RED method (service-level) and USE method (infrastructure-level) demonstrates SRE knowledge. Emphasizing \"use P95/P99 instead of averages\" for latency measurement is a viewpoint interviewers love to hear. Bringing up Alert Fatigue is another bonus point."
                        ),
                    ]
                ),
                Quest(
                    id: "22-6",
                    name: "Leave Request System (Boss)",
                    description: "Design a complete internal tool",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Design a Leave System",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Leave Request System Design",
                                narrative: "You are asked to design a leave request system for your company.\n\nRequirements:\n- Employees submit leave (date range, type, reason)\n- Managers approve (approve/reject)\n- Employees view their leave records\n- Managers view pending approval list\n- Status notifications (notify on submit/approve/reject)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Draw the state machine diagram first, then design API and schema", "MVP only does the core cycle: submit → approve → view result"],
                            explanation: "Complete process for designing an internal tool: requirements analysis → data model → API → state management → permissions → notifications → MVP planning.",
                            frameworkTip: "Internal tool design framework: Data Model → API → State Machine → Permissions → Notifications → MVP Scope."
                        ),
                    ]
                ),
            ]
        ),
    ]
}
