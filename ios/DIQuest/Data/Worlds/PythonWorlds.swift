import Foundation

enum PythonWorlds {
    static let worlds: [World] = [
        World(
            id: 15,
            name: "Python 基本語法與條件判斷",
            emoji: "🐍",
            description: "變數、資料型態、運算子與 if/elif/else 條件判斷",
            quests: [
                Quest(
                    id: "15-1",
                    name: "變數與資料型態",
                    description: "認識 Python 的基本建材：int, float, str, bool",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "辨識資料型態",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是正確的型態判斷？",
                            scenario: 
                            Challenge.Scenario(
                                title: "認識 Python 型態",
                                narrative: "你剛開始學 Python，打開 Python 互動式環境，輸入了幾個值。你需要判斷它們的型態。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "type(3.14) 回傳 int", explanation: "3.14 有小數點，是 float 不是 int。"),
                                Challenge.Option(id: "B", text: "type(\"123\") 回傳 str", explanation: "正確！用引號包起來的都是字串（str），即使內容看起來像數字。"),
                                Challenge.Option(id: "C", text: "type(True) 回傳 str", explanation: "True 是布林值（bool），不是字串。"),
                                Challenge.Option(id: "D", text: "type(None) 回傳 int", explanation: "None 是 NoneType，代表「沒有值」，不是整數。"),
                            ],
                            correctAnswer: "B",
                            hints: ["用引號包起來的值，不管內容是什麼，都是字串"],
                            explanation: "Python 四大基本型態：int（整數）、float（浮點數）、str（字串）、bool（布林）。用 type() 可以查看任何值的型態。",
                            frameworkTip: "記住：引號 = 字串，小數點 = float，True/False = bool，整數 = int。"
                        ),
                        Challenge(
                            id: 2,
                            name: "變數命名規則",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是合法的 Python 變數名稱？",
                            scenario: 
                            Challenge.Scenario(
                                title: "合法的變數名稱",
                                narrative: "你要為計算結果取一個變數名稱，但 Python 對命名有規則。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "2nd_place", explanation: "不能以數字開頭。"),
                                Challenge.Option(id: "B", text: "my-score", explanation: "不能用連字號（-），Python 會以為你在做減法。"),
                                Challenge.Option(id: "C", text: "total_amount", explanation: "正確！底線分隔（snake_case）是 Python 的命名慣例。"),
                                Challenge.Option(id: "D", text: "class", explanation: "class 是 Python 保留字（keyword），不能當變數名。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Python 變數名只能用字母、數字、底線，且不能以數字開頭"],
                            explanation: "Python 變數命名規則：(1) 只能用字母、數字、底線 (2) 不能以數字開頭 (3) 不能是保留字。慣例用 snake_case（小寫加底線）。",
                            frameworkTip: "Python 命名慣例：變數和函式用 snake_case，類別用 PascalCase。"
                        ),
                        Challenge(
                            id: 3,
                            name: "型態轉換",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "執行 \"42\" + 8 會發生什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "型態轉換陷阱",
                                narrative: "你從使用者輸入拿到一個字串 \"42\"，需要做數學運算。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "得到 50", explanation: "Python 不會自動把字串轉成數字來運算。"),
                                Challenge.Option(id: "B", text: "得到 \"428\"", explanation: "Python 不能用 + 連接字串和整數，會報錯。"),
                                Challenge.Option(id: "C", text: "TypeError：不能把 str 和 int 相加", explanation: "正確！Python 是強型態語言，不同型態不能直接運算，需要先用 int() 或 str() 轉換。"),
                                Challenge.Option(id: "D", text: "得到 \"50\"", explanation: "Python 不會自動轉換型態。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Python 不會自動幫你轉型態，字串 + 整數會報錯"],
                            explanation: "Python 是強型態語言：str + int 會報 TypeError。解法：int(\"42\") + 8 = 50 或 \"42\" + str(8) = \"428\"。",
                            frameworkTip: "處理使用者輸入時，永遠記得 input() 回傳的是 str，要做數學運算必須先轉型。"
                        ),
                        Challenge(
                            id: 4,
                            name: "變數操作與型態轉換",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 calc_revenue(price_str, qty_str)，將字串轉成數字後計算總營收，並回傳格式化的字串，例如 \"Total: $1500.00\"。如果輸入無法轉換，回傳 \"Invalid input\"。",
                            scenario: 
                            Challenge.Scenario(
                                title: "業績資料處理",
                                narrative: "你收到一份業績資料，但所有數值都是字串格式。你需要寫一個函式來轉換並計算。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 try/except 處理轉換失敗", "用 f-string 的 :.2f 格式化小數點"],
                            explanation: "這題整合了型態轉換（str → float/int）、錯誤處理（try/except）和 f-string 格式化（:.2f）。實務上處理外部資料時，型態轉換和驗證是必要步驟。",
                            frameworkTip: "資料處理三步驟：轉換型態 → 計算 → 格式化輸出。每步都可能出錯，要防禦。",
                            starterCode: """
                                def calc_revenue(price_str, qty_str):
                                    # 將字串轉成數字，計算 price * qty
                                    # 回傳格式化字串 "Total: $XXX.XX"
                                    # 無法轉換時回傳 "Invalid input"
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
                            question: "以下程式碼的輸出是什麼？\n\n```python\nclass MyInt(int):\n    pass\n\nx = MyInt(42)\nprint(type(x) == int)\nprint(isinstance(x, int))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "型態檢查的正確方式",
                                narrative: "你在 code review 時看到同事用 type(x) == int 來檢查型態，但 senior engineer 說這樣不好。你需要理解為什麼。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "True, True", explanation: "type(x) 回傳 MyInt，不是 int，所以第一個是 False。"),
                                Challenge.Option(id: "B", text: "False, True", explanation: "正確！type() 嚴格比對，不考慮繼承；isinstance() 會檢查繼承鏈，MyInt 繼承自 int 所以是 True。"),
                                Challenge.Option(id: "C", text: "True, False", explanation: "isinstance 檢查的是「是否為該型態或其子類別」。"),
                                Challenge.Option(id: "D", text: "False, False", explanation: "MyInt 繼承自 int，isinstance 會回傳 True。"),
                            ],
                            correctAnswer: "B",
                            hints: ["type() 只檢查精確型態，isinstance() 會考慮繼承關係", "MyInt 是 int 的子類別"],
                            explanation: "type(x) == int 只在 x 「精確是」int 時為 True。isinstance(x, int) 則會沿著繼承鏈檢查（MRO），MyInt → int → object，所以回傳 True。實務中幾乎都應該用 isinstance()。",
                            frameworkTip: "面試時提到型態檢查，說「用 isinstance 而非 type 比對」會讓面試官知道你理解 Python 的繼承機制。這是 Google 常考的基礎題。"
                        ),
                        Challenge(
                            id: 6,
                            name: "可變預設參數陷阱",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下程式碼執行後，result 的值是什麼？\n\n```python\ndef append_to(item, lst=[]):\n    lst.append(item)\n    return lst\n\nresult1 = append_to(1)\nresult2 = append_to(2)\nresult = result2\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 最經典的陷阱",
                                narrative: "面試官給你看了一段程式碼，問你輸出是什麼。這是 Python 面試中最著名的陷阱題之一。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[2]", explanation: "預設的 list 在函式定義時只建立一次，後續呼叫共用同一個 list。"),
                                Challenge.Option(id: "B", text: "[1, 2]", explanation: "正確！Python 的預設參數在函式定義時就被建立，且只建立一次。後續呼叫如果沒傳 lst，都是操作同一個 list 物件。"),
                                Challenge.Option(id: "C", text: "[1]", explanation: "第二次呼叫 append_to(2) 也會在同一個 list 上操作。"),
                                Challenge.Option(id: "D", text: "報錯 TypeError", explanation: "這段程式碼語法完全正確，不會報錯。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Python 預設參數只在函式定義時評估一次", "可變物件（list, dict）作為預設值會跨呼叫共享"],
                            explanation: "這是 Python 最經典的陷阱：mutable default argument。解法是用 None 當預設值：\n\ndef append_to(item, lst=None):\n    if lst is None:\n        lst = []\n    lst.append(item)\n    return lst",
                            frameworkTip: "面試時如果被問到 Python 的「gotcha」或「常見錯誤」，這題幾乎必考。記住：永遠不要用可變物件（list, dict, set）當函式預設值。"
                        ),
                    ]
                ),
                Quest(
                    id: "15-2",
                    name: "Input/Output 與字串格式化",
                    description: "學會用 print、input 和 f-string",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "print 與 f-string",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪種寫法最 Pythonic？",
                            scenario: 
                            Challenge.Scenario(
                                title: "格式化輸出",
                                narrative: "你有兩個變數 name = \"Alice\" 和 age = 25，想印出 \"Alice is 25 years old\"。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "print(\"Alice\" + \" is \" + \"25\" + \" years old\")", explanation: "可以跑，但硬編碼了值，沒有用到變數。"),
                                Challenge.Option(id: "B", text: "print(f\"{name} is {age} years old\")", explanation: "正確！f-string（Python 3.6+）是最簡潔直覺的格式化方式。"),
                                Challenge.Option(id: "C", text: "print(name + \" is \" + age + \" years old\")", explanation: "age 是 int，不能直接跟 str 用 + 串接，會報 TypeError。"),
                                Challenge.Option(id: "D", text: "print(\"%s is %d years old\" % (name, age))", explanation: "可以跑，但這是舊式 %-formatting，現在推薦用 f-string。"),
                            ],
                            correctAnswer: "B",
                            hints: ["f-string 用 f\"...\" 開頭，大括號 {} 裡放變數名"],
                            explanation: "f-string 是 Python 3.6+ 推薦的字串格式化方式：f\"{變數}\" 直接嵌入值，可讀性最好。",
                            frameworkTip: "字串格式化演進：% → .format() → f-string。新程式碼一律用 f-string。"
                        ),
                        Challenge(
                            id: 2,
                            name: "input() 的回傳型態",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "age 的值是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "使用者輸入",
                                narrative: "你寫了 age = input(\"你幾歲？\")，使用者輸入了 25。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "整數 25", explanation: "input() 永遠回傳字串，不會自動轉型。"),
                                Challenge.Option(id: "B", text: "字串 \"25\"", explanation: "正確！input() 永遠回傳 str，即使使用者輸入的看起來是數字。"),
                                Challenge.Option(id: "C", text: "浮點數 25.0", explanation: "input() 不會回傳 float。"),
                                Challenge.Option(id: "D", text: "None", explanation: "input() 會等待使用者輸入並回傳該值（字串型態）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["input() 的回傳值永遠是字串"],
                            explanation: "input() 永遠回傳 str。要做數學運算，記得用 int() 或 float() 轉換：age = int(input(\"你幾歲？\"))",
                            frameworkTip: "安全的 input 處理模式：取得 → 轉型 → 驗證 → 使用。"
                        ),
                        Challenge(
                            id: 3,
                            name: "格式化業績報告",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 format_report(name, sales, target)，回傳格式化字串。包含：名字、銷售額（千分位逗號）、達成率（百分比，一位小數）、以及評等（>=100% 為 \"Exceeded\"，>=80% 為 \"On Track\"，否則 \"Needs Improvement\"）。範例輸出：\n\"Report: Alice | Sales: $12,500 | Achievement: 125.0% | Rating: Exceeded\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "業績摘要生成",
                                narrative: "你是產品分析師，需要自動生成每位業務的業績摘要。主管要求固定格式的文字報告。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["f-string 的 :, 可以加千分位逗號", "達成率 = sales / target * 100", "用 if/elif/else 判斷評等"],
                            explanation: "這題練習 f-string 進階格式化：:, 加千分位、:.1f 一位小數、以及在 f-string 中嵌入變數。實務上自動生成報告是常見需求。",
                            frameworkTip: "f-string 格式化速查：{x:,} 千分位、{x:.2f} 兩位小數、{x:.1%} 百分比。",
                            starterCode: """
                                def format_report(name, sales, target):
                                    # 計算達成率 = sales / target * 100
                                    # 根據達成率決定評等
                                    # 回傳格式化字串
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
                            name: "f-string 進階格式化",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 format_report(name, revenue, growth)，回傳格式化的字串。name 左對齊 15 字元，revenue 右對齊 12 字元且有千分位逗號，growth 顯示為百分比（一位小數）。\n\n範例：format_report(\"January\", 1234567.89, 0.156) → \"January         $1,234,567.89  +15.6%\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "財務報表格式化",
                                narrative: "你在一家新創公司的財務團隊，需要產出一份格式整齊的月營收報表。每個數字要千分位分隔、對齊，百分比要精確到一位小數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["f-string 格式：{value:<15} 左對齊 15 字元", "{value:>12,.2f} 右對齊 12 字元 + 千分位 + 2 位小數", "{value:.1%} 自動乘 100 並加 % 號"],
                            explanation: "f-string 的格式化語法：\n- :<15 左對齊，:>12 右對齊\n- , 千分位分隔符號\n- .2f 兩位小數\n- .1% 自動 ×100 並顯示一位小數百分比\n這些在產生報表或對齊輸出時非常實用。",
                            frameworkTip: "面試中展示你會用 f-string 的進階格式化（對齊、千分位、百分比），會讓面試官知道你不只會基礎語法，也懂得用 Python 產生 professional 的輸出。",
                            starterCode: """
                                def format_report(name, revenue, growth):
                                    # name: 左對齊 15 字元
                                    # revenue: 右對齊 12 字元，千分位逗號，小數點兩位
                                    # growth: 百分比，一位小數，正數加 + 號
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
                            name: "print 進階參數",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下程式碼的輸出是什麼？\n\n```python\nprint(\"A\", \"B\", \"C\", sep=\" -> \", end=\" !\\n\")\nprint(\"D\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "print 的隱藏功能",
                                narrative: "你要在一行中印出多個值，用特定的分隔符號，而且不要自動換行。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A B C !\nD", explanation: "sep 會替換掉預設的空格分隔。"),
                                Challenge.Option(id: "B", text: "A -> B -> C !\nD", explanation: "正確！sep 設定多個值之間的分隔符號（預設空格），end 設定結尾字元（預設 \\n）。"),
                                Challenge.Option(id: "C", text: "A -> B -> C\n !\nD", explanation: "! 不會換行後才印出，end 是直接接在最後。"),
                                Challenge.Option(id: "D", text: "ABC -> !\nD", explanation: "sep 是放在多個值「之間」，不是放在最後。"),
                            ],
                            correctAnswer: "B",
                            hints: ["sep 設定多個參數之間的分隔符", "end 設定印完後的結尾（預設是換行 \\n）"],
                            explanation: "print() 的兩個實用參數：sep（separator，多個值之間的分隔符，預設空格）和 end（印完後的結尾，預設 \\n 換行）。",
                            frameworkTip: "雖然 print 的 sep/end 參數在面試中不常直接考，但了解它們能幫你快速 debug 和格式化輸出，展示你對 Python 內建函式的掌握度。"
                        ),
                    ]
                ),
                Quest(
                    id: "15-3",
                    name: "運算子與表達式",
                    description: "算術、比較、邏輯運算子與優先順序",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "整數除法與餘數",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "17 // 5 的結果是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "除法運算子",
                                narrative: "Python 有三種除法相關的運算子：/、//、%。你需要搞清楚它們的差別。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "3.4", explanation: "3.4 是 17 / 5 的結果（普通除法），不是整數除法。"),
                                Challenge.Option(id: "B", text: "3", explanation: "正確！// 是整數除法（floor division），只取商，捨棄餘數。"),
                                Challenge.Option(id: "C", text: "2", explanation: "17 ÷ 5 = 3 餘 2，商是 3 不是 2。"),
                                Challenge.Option(id: "D", text: "4", explanation: "// 是無條件捨去，不是四捨五入。"),
                            ],
                            correctAnswer: "B",
                            hints: ["// 是「地板除法」，無條件捨去小數部分"],
                            explanation: "/ 普通除法（回傳 float）、// 整數除法（無條件捨去）、% 取餘數。17 / 5 = 3.4、17 // 5 = 3、17 % 5 = 2。",
                            frameworkTip: "常用組合：total // page_size 算頁數，total % page_size 算最後一頁剩幾筆。"
                        ),
                        Challenge(
                            id: 2,
                            name: "比較運算子",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "a == b 和 a is b 的結果分別是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "== 與 is 的差別",
                                narrative: "你在比較兩個變數：a = [1, 2, 3] 和 b = [1, 2, 3]。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "都是 True", explanation: "== 比較值（相等），is 比較身份（同一個物件）。兩個獨立的 list 值相等但不是同一個物件。"),
                                Challenge.Option(id: "B", text: "都是 False", explanation: "a == b 比較的是值，兩個 list 內容相同，所以是 True。"),
                                Challenge.Option(id: "C", text: "a == b 是 True，a is b 是 False", explanation: "正確！== 比較值（內容相同 → True），is 比較記憶體位置（兩個獨立物件 → False）。"),
                                Challenge.Option(id: "D", text: "a == b 是 False，a is b 是 True", explanation: "反了。== 比較值，is 比較身份。"),
                            ],
                            correctAnswer: "C",
                            hints: ["== 比較「值是否相等」，is 比較「是否是同一個物件」"],
                            explanation: "== 比較值（equality），is 比較身份（identity）。通常用 == 比較值，只有在跟 None 比較時才用 is：if x is None。",
                            frameworkTip: "經驗法則：99% 的情況用 ==。唯一常用 is 的場景：x is None。"
                        ),
                        Challenge(
                            id: 3,
                            name: "短路求值",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下程式碼的輸出是什麼？\n\n```python\na = \"\" or \"default\"\nb = \"hello\" or \"world\"\nc = 0 and \"yes\"\nd = 1 and \"yes\"\nprint(a, b, c, d)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "短路求值的實際應用",
                                narrative: "你在看一段 Python 程式碼，發現一些用 or 和 and 做預設值的寫法。你需要理解短路求值（short-circuit evaluation）的規則。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "default hello 0 yes", explanation: "正確！or 回傳第一個 truthy 值或最後一個值；and 在第一個 falsy 時停下並回傳它，否則回傳最後一個值。"),
                                Challenge.Option(id: "B", text: "True True False True", explanation: "or 和 and 不是回傳 True/False，而是回傳實際的值。"),
                                Challenge.Option(id: "C", text: "default world 0 1", explanation: "or 在找到第一個 truthy 值時就停下，不會繼續到 \"world\"。"),
                                Challenge.Option(id: "D", text: "\"\" hello False yes", explanation: "or 在第一個值是 falsy 時會繼續看第二個值。"),
                            ],
                            correctAnswer: "A",
                            hints: ["or 回傳第一個 truthy 值（不是 True/False）", "and 在遇到 falsy 值時停下並回傳它", "空字串 \"\" 和 0 都是 falsy"],
                            explanation: "Python 的短路求值：\n- x or y：如果 x 是 truthy，回傳 x；否則回傳 y\n- x and y：如果 x 是 falsy，回傳 x；否則回傳 y\n\n常見用法：name = user_input or \"Anonymous\"（提供預設值）",
                            frameworkTip: "短路求值在實務中很常用，像是 config.get(\"key\") or default_value。面試時展示你懂這種 Pythonic 寫法。"
                        ),
                        Challenge(
                            id: 4,
                            name: "整數除法與取餘",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 format_time(seconds)，把秒數轉換成 \"Xh Ym Zs\" 格式。\n\n範例：format_time(3661) → \"1h 1m 1s\"\nformat_time(90) → \"0h 1m 30s\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "時間轉換工具",
                                narrative: "你在開發一個專案管理工具，需要把秒數轉換成「X 小時 Y 分 Z 秒」的格式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["1 小時 = 3600 秒", "// 是整數除法，% 是取餘數", "先算小時，再從剩餘秒數算分鐘"],
                            explanation: "整數除法 // 和取餘 % 是處理時間轉換、進位制轉換等問題的基本工具。\n- hours = seconds // 3600\n- minutes = (seconds % 3600) // 60\n- secs = seconds % 60",
                            frameworkTip: "時間轉換是面試和 LeetCode 的常見基礎題。記住 // 和 % 的組合用法：// 取商，% 取餘。",
                            starterCode: """
                                def format_time(seconds):
                                    # 用 // 和 % 拆解成時、分、秒
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
                    name: "條件判斷 if/elif/else",
                    description: "基本的條件分支與巢狀條件",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 if 結構",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪段程式碼的邏輯是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "if/elif/else",
                                narrative: "你要根據分數判定等級：>= 90 是 A，>= 80 是 B，>= 70 是 C，其他是 F。score = 85。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "if score >= 70: grade = \"C\"\\nelif score >= 80: grade = \"B\"\\nelif score >= 90: grade = \"A\"", explanation: "順序錯了！85 >= 70 為 True，會直接得到 C。elif 的順序要從嚴格到寬鬆。"),
                                Challenge.Option(id: "B", text: "if score >= 90: grade = \"A\"\\nelif score >= 80: grade = \"B\"\\nelif score >= 70: grade = \"C\"\\nelse: grade = \"F\"", explanation: "正確！從最嚴格的條件開始判斷，85 不 >= 90，接著判斷 >= 80 → True → B。"),
                                Challenge.Option(id: "C", text: "if score >= 90: grade = \"A\"\\nif score >= 80: grade = \"B\"\\nif score >= 70: grade = \"C\"", explanation: "用了三個獨立的 if 而非 elif，85 會同時滿足 >= 80 和 >= 70，最後得到 C 而非 B。"),
                                Challenge.Option(id: "D", text: "if score == 90: grade = \"A\"\\nelif score == 80: grade = \"B\"", explanation: "== 只匹配精確值，85 不等於任何一個，會漏掉大部分情況。"),
                            ],
                            correctAnswer: "B",
                            hints: ["elif 的順序很重要：先檢查最嚴格的條件", "注意 if vs elif：多個 if 是獨立判斷，elif 是互斥分支"],
                            explanation: "if/elif/else 是互斥分支 — 只會執行第一個為 True 的分支。順序要從嚴格到寬鬆，否則寬鬆的條件會先攔截。",
                            frameworkTip: "elif 陷阱：順序很重要！永遠從最嚴格的條件開始。"
                        ),
                        Challenge(
                            id: 3,
                            name: "客戶分級函式",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 classify_customer(total_spent, days_registered)，根據以下規則回傳客戶等級：\n- \"VIP\": 消費 >= 50000 且註冊 >= 365 天\n- \"Gold\": 消費 >= 20000 或 註冊 >= 730 天\n- \"Silver\": 消費 >= 5000\n- \"Bronze\": 其他\n注意：VIP 條件要用 and，Gold 條件要用 or。",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶分級系統",
                                narrative: "電商公司要根據客戶的消費金額和註冊天數自動分級，以決定折扣和服務等級。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["VIP 要同時滿足兩個條件（and）", "Gold 只需滿足其中一個條件（or）", "elif 順序從嚴格到寬鬆"],
                            explanation: "這題練習 if/elif/else 搭配 and/or。關鍵是 VIP 用 and（兩個條件都要滿足），Gold 用 or（任一條件即可）。elif 的順序也很重要：先判斷最嚴格的 VIP。",
                            frameworkTip: "條件判斷設計：先列出所有等級和條件，確認互斥性，再從嚴格到寬鬆排列。",
                            starterCode: """
                                def classify_customer(total_spent, days_registered):
                                    # 根據消費金額和註冊天數分級
                                    # VIP: spent >= 50000 AND days >= 365
                                    # Gold: spent >= 20000 OR days >= 730
                                    # Silver: spent >= 5000
                                    # Bronze: 其他
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
                            name: "巢狀條件 vs 平坦結構",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪種寫法通常更推薦？",
                            scenario: 
                            Challenge.Scenario(
                                title: "程式碼可讀性",
                                narrative: "以下兩段程式碼功能相同，但寫法不同：\n\n寫法 A（巢狀）:\nif user:\n  if user.is_active:\n    if user.has_permission:\n      do_action()\n\n寫法 B（Guard Clause）:\nif not user: return\nif not user.is_active: return\nif not user.has_permission: return\ndo_action()",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "寫法 A — 巢狀 if 邏輯更清楚", explanation: "巢狀越深，可讀性越差。超過 2-3 層就很難追蹤。"),
                                Challenge.Option(id: "B", text: "寫法 B — Guard Clause 減少巢狀，更易讀", explanation: "正確！Guard Clause（提前返回）減少巢狀層數，讓主邏輯保持在最低縮排層。"),
                                Challenge.Option(id: "C", text: "兩種一樣好", explanation: "功能相同，但可讀性差很多。扁平結構通常更好維護。"),
                                Challenge.Option(id: "D", text: "都不好，應該用 try/except", explanation: "這不是錯誤處理的場景，而是條件檢查。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Python 之禪（Zen of Python）：Flat is better than nested"],
                            explanation: "Guard Clause 是一種設計模式：在函式開頭先排除不合格的情況，讓主邏輯保持在最低縮排層。這是 Python 社群推薦的風格。",
                            frameworkTip: "Zen of Python: Flat is better than nested. 盡量減少巢狀層數。"
                        ),
                        Challenge(
                            id: 3,
                            name: "FizzBuzz",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 fizzbuzz(n)，回傳一個 list：\n- 如果數字能被 3 和 5 整除，放 \"FizzBuzz\"\n- 如果只能被 3 整除，放 \"Fizz\"\n- 如果只能被 5 整除，放 \"Buzz\"\n- 否則放數字本身（字串）\n\n範例：fizzbuzz(5) → [\"1\", \"2\", \"Fizz\", \"4\", \"Buzz\"]",
                            scenario: 
                            Challenge.Scenario(
                                title: "FizzBuzz — 史上最經典面試題",
                                narrative: "這是程式面試中最經典的入門題，Google、Meta、Amazon 都曾用過它來篩選候選人。規則很簡單，但能測試你對條件判斷順序的理解。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先判斷「同時被 3 和 5 整除」，因為如果先判斷 3 就不會進到 FizzBuzz", "用 % 取餘數，等於 0 表示整除", "數字要轉成字串 str(i)"],
                            explanation: "FizzBuzz 看似簡單，但考點是：條件順序很重要！必須先判斷 3 AND 5，再判斷單獨的 3 或 5。如果順序反了，15 會被歸類為 \"Fizz\" 而非 \"FizzBuzz\"。",
                            frameworkTip: "FizzBuzz 面試時，先說明你的判斷順序邏輯（最嚴格的條件放最前），再寫程式碼。這展示你有思考過 edge case。",
                            starterCode: """
                                def fizzbuzz(n):
                                    result = []
                                    for i in range(1, n + 1):
                                        # 判斷條件的順序很重要！
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
                            name: "成績等級轉換",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 grade(score)，根據分數回傳等級：\n- 90-100: \"A\"\n- 80-89: \"B\"\n- 70-79: \"C\"\n- 60-69: \"D\"\n- 0-59: \"F\"\n- 其他（負數或超過 100）: \"Invalid\"\n\n範例：grade(85) → \"B\"，grade(-1) → \"Invalid\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "多條件分級",
                                narrative: "你在做一個學生成績管理系統，需要把分數轉換成等級。這類分級問題在面試中很常見，考的是 elif 鏈的設計。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先處理無效輸入（邊界檢查）", "elif 從高到低判斷，每個條件自然排除了更高的分數", "注意邊界值 90, 80, 70, 60"],
                            explanation: "多條件分級的最佳實踐：(1) 先處理無效輸入 (2) 用 elif 鏈從高到低判斷，因為前面的條件已經排除了更高的值 (3) 不需要寫 score >= 80 and score < 90，因為 elif 的串接已經保證了這一點。",
                            frameworkTip: "面試中遇到分級問題，先處理 edge case（無效輸入），再從最嚴格的條件開始。這展示你的防禦性程式設計思維。",
                            starterCode: """
                                def grade(score):
                                    # 注意邊界值和無效輸入
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
                    name: "條件判斷進階",
                    description: "and/or/not、複合條件、truthy/falsy",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Truthy 與 Falsy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個值在 if 條件中是 Truthy（視為 True）？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 的真假值",
                                narrative: "在 Python 中，不只 True/False 有真假值。很多值在 if 條件中會被當作 True 或 False。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "空字串 \"\"", explanation: "空字串是 Falsy。"),
                                Challenge.Option(id: "B", text: "數字 0", explanation: "0 是 Falsy。"),
                                Challenge.Option(id: "C", text: "空列表 []", explanation: "空容器（list, dict, set）都是 Falsy。"),
                                Challenge.Option(id: "D", text: "字串 \"0\"", explanation: "正確！非空字串都是 Truthy，即使內容是 \"0\" 或 \"False\"。"),
                            ],
                            correctAnswer: "D",
                            hints: ["Falsy 值：None, False, 0, 0.0, \"\", [], {}, set()。其他都是 Truthy。"],
                            explanation: "Python 的 Falsy 值：None, False, 0, 0.0, \"\"（空字串）, []（空 list）, {}（空 dict）, set()。所有其他值都是 Truthy。",
                            frameworkTip: "善用 Truthy/Falsy 簡化程式：if my_list: 比 if len(my_list) > 0: 更 Pythonic。"
                        ),
                        Challenge(
                            id: 2,
                            name: "短路求值",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "當 name = None 時，result 的值是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "and/or 的短路行為",
                                narrative: "考慮這段程式碼：\nresult = name and name.upper()\n其中 name 可能是 None 或一個字串。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "AttributeError（因為 None 沒有 .upper()）", explanation: "and 有短路機制：左邊為 Falsy 時，不會執行右邊。"),
                                Challenge.Option(id: "B", text: "None", explanation: "正確！name 是 None（Falsy），and 短路直接返回左邊的值 None，不會執行 name.upper()。"),
                                Challenge.Option(id: "C", text: "False", explanation: "and 返回的是原始值，不是 True/False。"),
                                Challenge.Option(id: "D", text: "空字串 \"\"", explanation: "None 就是 None，不會變成空字串。"),
                            ],
                            correctAnswer: "B",
                            hints: ["and 短路：左邊 Falsy → 直接返回左邊值，不執行右邊"],
                            explanation: "Python 的 and/or 會短路求值且返回原始值（不是 True/False）。and：左邊 Falsy → 返回左邊；左邊 Truthy → 返回右邊。or 則相反。",
                            frameworkTip: "常用模式：value = user_input or \"default\"（如果 user_input 是 Falsy，用預設值）"
                        ),
                        Challenge(
                            id: 3,
                            name: "is vs == 陷阱",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下程式碼的輸出是什麼？\n\n```python\na = 256\nb = 256\nprint(a is b)\n\nc = 257\nd = 257\nprint(c is d)\n\ne = [1, 2, 3]\nf = [1, 2, 3]\nprint(e == f)\nprint(e is f)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 身份 vs 相等",
                                narrative: "這是 Google 和 Meta 面試中非常喜歡考的 Python 語言特性題。很多有經驗的開發者都會踩到這個坑。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "True, True, True, True", explanation: "c is d 的結果取決於 Python 的 integer caching，257 超出快取範圍。"),
                                Challenge.Option(id: "B", text: "True, False, True, False", explanation: "正確！Python 快取 -5 到 256 的整數（integer interning），所以 256 is 256 為 True，但 257 is 257 為 False（不同物件）。兩個 list 內容相同（==）但不是同一個物件（is）。"),
                                Challenge.Option(id: "C", text: "True, True, True, False", explanation: "257 超出了 Python 的整數快取範圍（-5 到 256）。"),
                                Challenge.Option(id: "D", text: "False, False, True, False", explanation: "256 在 Python 的整數快取範圍內（-5 到 256），所以 a is b 為 True。"),
                            ],
                            correctAnswer: "B",
                            hints: ["is 比較的是記憶體位址（identity），== 比較的是值（equality）", "Python 會快取 -5 到 256 之間的整數", "兩個獨立建立的 list 是不同的物件"],
                            explanation: "is 和 == 的關鍵區別：\n- == 比較值是否相等\n- is 比較是否為同一個物件（記憶體位址）\n\nPython 的 integer interning：-5 到 256 之間的整數會被快取，所以 a = 256; b = 256 時 a is b 為 True。但 257 超出範圍，每次建立新物件。\n\n注意：在互動式環境 vs 腳本中結果可能不同。",
                            frameworkTip: "面試時記住：比較值用 ==，比較 None 用 is。永遠用 x is None 而不是 x == None，這是 PEP 8 的規定。"
                        ),
                        Challenge(
                            id: 4,
                            name: "Truthy/Falsy 完整列表",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個選項列出的值在 if 判斷中都會被視為 False（falsy）？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 中什麼是「假」？",
                                narrative: "Meta 面試中常考：在 if 判斷中，哪些值會被當作 False？這對寫出簡潔的 Python 程式碼至關重要。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "0, \"\", [], {}, None, False", explanation: "正確！這六個是 Python 中最常見的 falsy 值。還有 0.0, 0j, set(), tuple(), range(0) 等。"),
                                Challenge.Option(id: "B", text: "0, \"\", [], {}, None, \"False\"", explanation: "\"False\" 是一個非空字串，它是 truthy！"),
                                Challenge.Option(id: "C", text: "0, \" \", [], {}, None, False", explanation: "\" \"（含空格的字串）是 truthy！只有 \"\"（空字串）才是 falsy。"),
                                Challenge.Option(id: "D", text: "0, \"\", [0], {}, None, False", explanation: "[0] 是包含一個元素的 list，它是 truthy！只有 []（空 list）才是 falsy。"),
                            ],
                            correctAnswer: "A",
                            hints: ["空的容器（list, dict, set, tuple）都是 falsy", "非空字串都是 truthy，即使內容是 \"0\" 或 \"False\"", "數字 0（包括 0, 0.0, 0j）是 falsy"],
                            explanation: "Python 的 falsy 值：\n- None\n- False\n- 數字零：0, 0.0, 0j\n- 空序列：\"\", [], ()\n- 空集合：{}, set()\n- 空 range：range(0)\n\n其他所有值都是 truthy。這讓你可以寫 if my_list: 而不是 if len(my_list) > 0:",
                            frameworkTip: "面試中寫 if not data: 比 if data == [] or data == None: 更 Pythonic。展示你理解 truthy/falsy 概念。"
                        ),
                    ]
                ),
                Quest(
                    id: "15-6",
                    name: "簡易計算器（Boss）",
                    description: "綜合運用變數、運算子、條件判斷",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 寫一個四則運算計算器",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "四則運算計算器",
                                narrative: "你的第一個 Python 專案：寫一個簡易四則運算計算器。\n\n使用者輸入兩個數字和一個運算子（+、-、*、/），程式計算並輸出結果。\n\n需要處理的邊界情況：\n- 除以零\n- 無效的運算子\n- 輸入不是數字",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先處理輸入，再處理運算，最後處理輸出", "記得 input() 回傳的是字串，要用 float() 轉換"],
                            explanation: "這個計算器涵蓋了 World 15 的所有概念：變數、型態轉換、input/output、f-string、運算子、if/elif/else、基本錯誤處理。",
                            frameworkTip: "程式設計基本流程：Input → Process → Output。先搞定資料流，再處理邊界情況。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 16,
            name: "迴圈與資料結構",
            emoji: "🔄",
            description: "for/while 迴圈與 string、list、tuple、dict、set",
            quests: [
                Quest(
                    id: "16-1",
                    name: "for 迴圈與 range()",
                    description: "基本迭代、range 三參數、enumerate",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "range() 三參數",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個 range() 可以產生 0, 2, 4, 6, 8？",
                            scenario: 
                            Challenge.Scenario(
                                title: "range() 的用法",
                                narrative: "你想用 for 迴圈印出 0, 2, 4, 6, 8。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "range(0, 8, 2)", explanation: "range 的終點是「不包含」的，8 不會被包含，所以只到 6。"),
                                Challenge.Option(id: "B", text: "range(0, 9, 2)", explanation: "正確！range(start, stop, step)：從 0 開始，每次 +2，到 9 之前停止 → 0, 2, 4, 6, 8。"),
                                Challenge.Option(id: "C", text: "range(0, 10, 2)", explanation: "也可以！0, 2, 4, 6, 8（10 不包含）。但 range(0, 9, 2) 更精確。兩者結果相同。"),
                                Challenge.Option(id: "D", text: "range(2, 8)", explanation: "這會產生 2, 3, 4, 5, 6, 7，不是偶數序列。"),
                            ],
                            correctAnswer: "B",
                            hints: ["range(start, stop, step) — stop 是不包含的（exclusive）"],
                            explanation: "range(start, stop, step)：start 包含、stop 不包含、step 是間隔。range(0, 9, 2) → 0, 2, 4, 6, 8。",
                            frameworkTip: "記住 range 的 stop 是 exclusive（不包含）。想要 0~n，用 range(n+1)。"
                        ),
                        Challenge(
                            id: 2,
                            name: "enumerate 的用途",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最 Pythonic 的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "同時取得索引和值",
                                narrative: "你有一個 list fruits = [\"apple\", \"banana\", \"cherry\"]，想同時印出索引和值。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "for i in range(len(fruits)):\\n    print(i, fruits[i])", explanation: "可以跑，但不 Pythonic。用 range(len(...)) 是 Python 新手常見模式。"),
                                Challenge.Option(id: "B", text: "for i, fruit in enumerate(fruits):\\n    print(i, fruit)", explanation: "正確！enumerate() 同時回傳索引和值，是 Python 的慣用寫法。"),
                                Challenge.Option(id: "C", text: "i = 0\\nfor fruit in fruits:\\n    print(i, fruit)\\n    i += 1", explanation: "手動計數器太冗長，enumerate 就是為了取代這種模式。"),
                                Challenge.Option(id: "D", text: "for fruit in fruits:\\n    print(fruits.index(fruit), fruit)", explanation: ".index() 每次都要搜尋整個 list，效率差且有重複值問題。"),
                            ],
                            correctAnswer: "B",
                            hints: ["enumerate() 是 Python 內建函式，專門用來同時取得索引和值"],
                            explanation: "enumerate() 回傳 (index, value) 的 tuple。避免用 range(len(...)) 這種 C 語言風格的寫法。",
                            frameworkTip: "看到 for i in range(len(x)) 就想到可以用 enumerate(x) 替代。"
                        ),
                        Challenge(
                            id: 3,
                            name: "生成月份報表",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 monthly_summary(revenues)，接收一個 12 個元素的 list（1~12月營收），回傳一個 list of strings，格式為 \"Month X: $YYY\"。同時在最後加一個 \"Total: $ZZZ\"。用 enumerate 取得月份編號。",
                            scenario: 
                            Challenge.Scenario(
                                title: "月份營收摘要",
                                narrative: "你需要用迴圈生成 12 個月的營收摘要。每月營收資料以 list 形式提供。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["enumerate(revenues, 1) 可以讓索引從 1 開始", "用 sum() 計算總和", "用 append 把字串加到結果 list"],
                            explanation: "這題練習 for 迴圈搭配 enumerate（start=1 讓月份從 1 開始）、f-string 格式化、list 操作（append）和內建函式 sum()。",
                            frameworkTip: "enumerate 的第二個參數可以指定起始值：enumerate(items, start=1)。",
                            starterCode: """
                                def monthly_summary(revenues):
                                    # 用 enumerate 迭代 revenues
                                    # 生成 "Month X: $YYY" 格式的字串
                                    # 最後加上 "Total: $ZZZ"
                                    # 回傳完整的 list
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
                            name: "Contains Duplicate（LeetCode #217）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 contains_duplicate(nums)，如果陣列中有任何值出現超過一次就回傳 True，否則回傳 False。\n\n要求：使用 set 來達到 O(n) 時間複雜度。\n\n```python\n# 範例\ncontains_duplicate([1, 2, 3, 1])  # → True\ncontains_duplicate([1, 2, 3, 4])  # → False\ncontains_duplicate([])            # → False\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商平台重複訂單偵測",
                                narrative: "你在一家電商公司的後端團隊，發現有時候同一個訂單 ID 會因為網路重試而被送出多次。你需要寫一個快速偵測重複值的工具。這是 LeetCode #217，面試入門必考題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["set() 會自動移除重複值", "如果 set 的長度比原始 list 短，代表有重複", "一行就能解決！"],
                            explanation: "最簡潔的解法：len(nums) != len(set(nums))。\n\nset 會移除重複值，所以如果有重複，set 長度會比原本短。\n\n另一種面試常見寫法（用 for 迴圈）：\ndef contains_duplicate(nums):\n    seen = set()\n    for num in nums:\n        if num in seen:\n            return True\n        seen.add(num)\n    return False\n\n這種寫法的好處是可以在找到第一個重複時就提前 return，不需要遍歷整個陣列。",
                            frameworkTip: "面試時先說「暴力法是用兩層 for 迴圈，O(n²)」，再說「但用 set 可以做到 O(n)」。展示你會分析時間複雜度並優化。這是 Blind 75 的第一題，必須秒殺。",
                            starterCode: """
                                def contains_duplicate(nums):
                                    # 提示：set 不允許重複元素
                                    # 比較 set 長度和原始 list 長度
                                    pass
                            """,
                            expectedQuery: """
                                def contains_duplicate(nums):
                                    return len(nums) != len(set(nums))
                            """
                        ),
                        Challenge(
                            id: 5,
                            name: "range 步長應用",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 tiered_pricing(units)，根據用量計算總費用：\n- 0-99 units：每 unit $10\n- 100-499 units：每 unit $8\n- 500+ units：每 unit $5\n\n同時，回傳一個 list，包含每 100 units 的累計費用（用 range 步長 100 來遍歷）。\n\n```python\n# 範例\ntiered_pricing(250)\n# → (2200, [1000, 1800, 2200])\n# 前 100 units: 100*10 = 1000\n# 100-199: 100*8 = 800, 累計 1800\n# 200-249: 50*8 = 400, 累計 2200\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 定價階梯分析",
                                narrative: "你在一家 SaaS 公司做定價策略分析。需要根據不同用量區間計算階梯價格，每個區間的步長不同。這考驗你對 range 函式第三個參數的理解。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["range(0, units, 100) 會產生 0, 100, 200, 300...", "min(100, units - start) 處理最後一組不滿 100 的情況", "用 start 的值判斷落在哪個價格區間"],
                            explanation: "range(start, stop, step) 的第三個參數 step 讓你可以跳著遍歷。這在分段計算、取樣、批次處理等場景非常實用。\n\nmin(100, units - start) 是處理「最後一批不足一組」的經典技巧，面試中很常見。",
                            frameworkTip: "面試中遇到分段計算題，先畫出區間圖，再用 range + step 分組處理。提到 min() 來處理邊界情況會加分。",
                            starterCode: """
                                def tiered_pricing(units):
                                    total = 0
                                    milestones = []
                                    # 用 range(0, units, 100) 每 100 個一組計算
                                    # 每個區間判斷適用的價格
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
                    name: "while 迴圈與流程控制",
                    description: "while 迴圈、break、continue",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "while vs for",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這種情況應該用哪種迴圈？",
                            scenario: 
                            Challenge.Scenario(
                                title: "選擇正確的迴圈",
                                narrative: "你需要重複某個操作，但不知道要重複幾次（直到使用者輸入 \"quit\"）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "for 迴圈 — 因為 for 比較常用", explanation: "for 適合已知次數的迭代，不知道次數時不適合。"),
                                Challenge.Option(id: "B", text: "while 迴圈 — 因為不知道要跑幾次", explanation: "正確！while 適合「條件驅動」的迴圈 — 重複直到某條件不滿足。"),
                                Challenge.Option(id: "C", text: "遞迴（recursion）", explanation: "遞迴也可以，但對這種簡單場景太複雜了。"),
                                Challenge.Option(id: "D", text: "for 和 while 完全相同", explanation: "語義不同：for 是「對每個元素做某事」，while 是「只要條件成立就重複」。"),
                            ],
                            correctAnswer: "B",
                            hints: ["for = 已知次數/已知集合。while = 條件驅動，不知道要跑幾次。"],
                            explanation: "for 迴圈：迭代已知的集合或次數。while 迴圈：重複直到條件不滿足。不知道要跑幾次 → while。",
                            frameworkTip: "選擇迴圈：知道要跑幾次 → for。不知道 → while。"
                        ),
                        Challenge(
                            id: 2,
                            name: "break 與 continue",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這段程式碼會印出什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "流程控制",
                                narrative: "以下程式碼：\nfor i in range(10):\n    if i == 3: continue\n    if i == 7: break\n    print(i)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "0 1 2 3 4 5 6 7", explanation: "continue 會跳過 3，break 會在 7 時停止（不印 7）。"),
                                Challenge.Option(id: "B", text: "0 1 2 4 5 6", explanation: "正確！continue 跳過 i=3（不印），break 在 i=7 時結束迴圈（不印 7），所以印 0,1,2,4,5,6。"),
                                Challenge.Option(id: "C", text: "0 1 2 4 5 6 7", explanation: "break 會在印出 7 之前就結束迴圈。"),
                                Challenge.Option(id: "D", text: "0 1 2", explanation: "continue 只跳過當次迭代，不會結束迴圈。跳過 3 後繼續跑 4, 5, 6。"),
                            ],
                            correctAnswer: "B",
                            hints: ["continue = 跳過這次，繼續下一次。break = 立刻結束整個迴圈。"],
                            explanation: "continue 跳過當前迭代的剩餘程式碼，繼續下一次迭代。break 立刻終止整個迴圈。兩者的作用範圍不同。",
                            frameworkTip: "continue = skip this one. break = stop everything."
                        ),
                        Challenge(
                            id: 3,
                            name: "Valid Parentheses（LeetCode #20）",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 is_valid(s)，判斷字串中的括號是否有效。有效條件：\n1. 左括號必須用相同類型的右括號閉合\n2. 左括號必須以正確的順序閉合\n\n```python\n# 範例\nis_valid(\"()\")      # → True\nis_valid(\"()[]{}\")   # → True\nis_valid(\"(]\")       # → False\nis_valid(\"([)]\")     # → False\nis_valid(\"{[]}\")     # → True\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "API 請求格式驗證",
                                narrative: "你在開發一個 API gateway，需要驗證傳入的 JSON query 格式是否正確——所有的括號都必須正確配對。這是 LeetCode #20，Blind 75 必考題，也是 stack 資料結構的入門經典。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["遇到左括號就 push 進 stack", "遇到右括號就檢查 stack 頂端是否為對應的左括號", "最後 stack 必須為空才算有效", "stack[-1] 可以看 stack 最頂端的元素"],
                            explanation: "這題的核心概念是 Stack（堆疊）：\n1. 遇到左括號 → push 進 stack\n2. 遇到右括號 → 檢查 stack 頂端是否為配對的左括號\n   - 是 → pop 出來\n   - 不是 → 回傳 False\n3. 結束時 stack 必須為空\n\n用 dict 存配對關係是很 Pythonic 的做法。Python 的 list 天然就是 stack：append() = push, pop() = pop, [-1] = peek。",
                            frameworkTip: "這是面試中 Stack 題的入門必考。面試時先說「這是 stack 的經典應用」，再解釋 LIFO（後進先出）的概念。Blind 75 中排名前五的高頻題。",
                            starterCode: """
                                def is_valid(s):
                                    # 提示：用 list 當 stack（後進先出）
                                    # 用 dict 存括號的配對關係
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
                            name: "break/continue 實戰",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下程式碼的輸出是什麼？\n\n```python\nlogs = [\"INFO: start\", \"WARN: slow\", \"ERROR: timeout\",\n        \"INFO: retry\", \"ERROR: crash\"]\n\nerrors = []\nfor log in logs:\n    if \"WARN\" in log:\n        continue\n    if \"ERROR\" in log:\n        errors.append(log)\n        if len(errors) >= 1:\n            break\n    print(f\"Processing: {log}\")\n\nprint(f\"Found: {errors}\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "日誌分析中的流程控制",
                                narrative: "你在分析伺服器日誌，需要找出第一個錯誤訊息，同時跳過某些不重要的 warning。這考驗你對 break 和 continue 的精確理解。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Processing: INFO: start\nProcessing: INFO: retry\nFound: ['ERROR: timeout', 'ERROR: crash']", explanation: "break 在找到第一個 ERROR 後就跳出迴圈了，不會繼續到 retry 和 crash。"),
                                Challenge.Option(id: "B", text: "Processing: INFO: start\nFound: ['ERROR: timeout']", explanation: "正確！continue 跳過 WARN，遇到第一個 ERROR 後 break 跳出整個迴圈。注意 break 發生在 print 之前，所以 ERROR 那行不會被 print。"),
                                Challenge.Option(id: "C", text: "Processing: INFO: start\nProcessing: ERROR: timeout\nFound: ['ERROR: timeout']", explanation: "break 在 if 區塊內，執行 break 後不會執行後面的 print。"),
                                Challenge.Option(id: "D", text: "Processing: INFO: start\nProcessing: INFO: retry\nFound: ['ERROR: timeout']", explanation: "break 在第一個 ERROR 就跳出了，不會到達 INFO: retry。"),
                            ],
                            correctAnswer: "B",
                            hints: ["continue 跳過當前迭代的剩餘部分，進入下一次迭代", "break 立即跳出整個迴圈", "break 在 if 區塊內，所以後面的 print 不會執行"],
                            explanation: "- continue：跳過當前迭代的剩餘程式碼，直接進入下一次迭代\n- break：完全跳出整個迴圈\n\n執行流程：\n1. \"INFO: start\" → 不符合 WARN/ERROR → print\n2. \"WARN: slow\" → continue 跳過\n3. \"ERROR: timeout\" → append → len >= 1 → break 跳出（不執行 print）\n\n注意：break 後的 print(f\"Found:...\") 不在迴圈內，所以會執行。",
                            frameworkTip: "面試時遇到 break/continue 的追蹤題，逐行走過程式碼（dry run）是最穩的方法。面試官看的是你的 trace 能力。"
                        ),
                        Challenge(
                            id: 5,
                            name: "while + 哨兵值模式",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 process_commands(commands)，接收一個指令列表，模擬逐一處理：\n- 遇到 \"quit\" 就停止（不處理 quit 本身）\n- 跳過空字串 \"\"\n- 其他指令加入結果 list 並轉大寫\n\n```python\n# 範例\nprocess_commands([\"hello\", \"\", \"help\", \"quit\", \"extra\"])\n# → [\"HELLO\", \"HELP\"]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "客服聊天機器人指令解析",
                                narrative: "你在開發一個客服聊天機器人的指令解析器。機器人需要持續讀取使用者輸入，直到收到「結束」指令。這是 while 迴圈搭配哨兵值（sentinel value）的經典模式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["while i < len(commands) 控制迴圈", "記得在 continue 之前就 i += 1，否則會無限迴圈", "break 會完全跳出 while 迴圈"],
                            explanation: "這是 while + break + continue 的綜合應用。關鍵注意事項：\n\n1. i += 1 必須放在 continue 之前！如果放在最後，continue 會跳過 i += 1 導致無限迴圈\n2. break 用於遇到終止條件時跳出\n3. continue 用於跳過不需要處理的項目\n\n這個「先遞增再判斷」的模式在實務中很常見。",
                            frameworkTip: "面試中 while + continue 的陷阱題很常見。記住黃金規則：計數器的遞增要放在 continue 之前。如果用 for 迴圈就不會有這個問題。",
                            starterCode: """
                                def process_commands(commands):
                                    result = []
                                    i = 0
                                    # 用 while 迴圈遍歷 commands
                                    # 遇到 "quit" → break
                                    # 遇到 "" → continue（記得先 i += 1）
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
                    name: "字串操作",
                    description: "索引、切片、常用方法",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "字串切片",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的切片語法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "String Slicing",
                                narrative: "s = \"Hello, World!\"，你想取出 \"World\"。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "s[7:12]", explanation: "正確！s[7] 是 W，s[12] 是 \"!\"（不包含），所以 s[7:12] = \"World\"。"),
                                Challenge.Option(id: "B", text: "s[7:11]", explanation: "s[7:11] = \"Worl\"，少了 d。記住 stop 是 exclusive。"),
                                Challenge.Option(id: "C", text: "s[6:12]", explanation: "s[6] 是空格，會得到 \" World\"。"),
                                Challenge.Option(id: "D", text: "s[7:13]", explanation: "s[7:13] = \"World!\"，多了驚嘆號。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Python 索引從 0 開始。切片 [start:stop] 包含 start，不包含 stop。"],
                            explanation: "字串切片 s[start:stop]：包含 start 位置，不包含 stop 位置。可以用負數索引（-1 是最後一個字元）。",
                            frameworkTip: "切片三參數：s[start:stop:step]。s[::-1] 可以反轉字串。"
                        ),
                        Challenge(
                            id: 2,
                            name: "常用字串方法",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪行程式碼能正確清理成 \"alice@example.com\"？",
                            scenario: 
                            Challenge.Scenario(
                                title: "字串清理",
                                narrative: "你收到使用者輸入 email = \"  Alice@Example.COM  \"，需要清理格式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "email.strip().lower()", explanation: "正確！strip() 去除前後空白，lower() 轉小寫。方法可以串接（method chaining）。"),
                                Challenge.Option(id: "B", text: "email.lower().strip()", explanation: "結果一樣，但慣例是先 strip 再 lower。兩種順序都行。（此選項也算正確）"),
                                Challenge.Option(id: "C", text: "email.replace(\" \", \"\").lower()", explanation: "replace(\" \", \"\") 會移除所有空格，包括 email 中間的（如果有的話）。strip() 只移除頭尾。"),
                                Challenge.Option(id: "D", text: "email.trim().lowercase()", explanation: "Python 沒有 trim() 和 lowercase()。是 strip() 和 lower()。"),
                            ],
                            correctAnswer: "A",
                            hints: ["strip() = 去除頭尾空白，lower() = 轉小寫"],
                            explanation: "常用字串方法：strip()（去頭尾空白）、lower()/upper()（大小寫）、split()（切割）、join()（合併）、replace()（取代）。",
                            frameworkTip: "字串是不可變的（immutable）— 所有方法都回傳新字串，不會改原本的。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Valid Palindrome（LeetCode #125）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 is_palindrome(s)，判斷字串是否為有效回文。只考慮字母和數字，忽略大小寫。\n\n```python\n# 範例\nis_palindrome(\"A man, a plan, a canal: Panama\")  # → True\nis_palindrome(\"race a car\")                       # → False\nis_palindrome(\"\")                                  # → True（空字串算回文）\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "社群平台用戶名驗證",
                                narrative: "你在一家社群平台工作，產品經理想做一個趣味功能：偵測使用者的暱稱是否是回文（palindrome）。但要忽略大小寫和非字母數字字元。這是 LeetCode #125，字串處理的經典入門。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["c.isalnum() 判斷字元是否為字母或數字", "s[::-1] 可以反轉字串", "\"\".join() 把字元串接起來", "先清理再比較，兩步驟"],
                            explanation: "解題步驟：\n1. 用 isalnum() 過濾非字母數字字元\n2. 用 lower() 統一小寫\n3. 用切片 [::-1] 反轉字串\n4. 比較原始和反轉是否相同\n\n一行解法：cleaned == cleaned[::-1]\n\n進階面試追問：如何用雙指標（two-pointer）做到 O(1) 空間？\ndef is_palindrome(s):\n    l, r = 0, len(s) - 1\n    while l < r:\n        while l < r and not s[l].isalnum(): l += 1\n        while l < r and not s[r].isalnum(): r -= 1\n        if s[l].lower() != s[r].lower(): return False\n        l += 1; r -= 1\n    return True",
                            frameworkTip: "面試先用 [::-1] 寫出簡潔解，再主動說「如果要 O(1) 空間，可以用 two-pointer」。展示你知道多種解法和 trade-off。",
                            starterCode: """
                                def is_palindrome(s):
                                    # 1. 濾掉非字母數字字元
                                    # 2. 轉小寫
                                    # 3. 比較正向和反向是否相同
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
                            name: "字串壓縮",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 compress(s)，將連續重複的字元壓縮成「字元+次數」的格式。如果壓縮後沒有更短，回傳原字串。\n\n```python\n# 範例\ncompress(\"aabcccccaaa\")  # → \"a2b1c5a3\"\ncompress(\"abc\")          # → \"abc\"（壓縮後 \"a1b1c1\" 更長，回傳原字串）\ncompress(\"\")             # → \"\"\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "數據分析日誌壓縮",
                                narrative: "你在一家數據分析公司，需要壓縮重複的日誌字元來節省儲存空間。這是 Amazon 面試中常見的字串處理題，考驗你對迴圈和計數的掌握。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["比較 s[i] 和 s[i-1] 來偵測字元變化", "迴圈結束後別忘了處理最後一組字元", "最後比較壓縮後和原始字串的長度"],
                            explanation: "這題的重點：\n1. 遍歷字串，追蹤當前字元和連續出現次數\n2. 當遇到不同字元時，把「字元+次數」加入結果\n3. 迴圈結束後要處理最後一組（容易遺漏的 edge case）\n4. 比較壓縮後長度，決定回傳哪個\n\n用 list + join 而非字串串接，因為 Python 字串不可變，每次 + 都會建立新物件，用 list 再 join 效率更好。",
                            frameworkTip: "面試時提到「用 list 收集結果再 join，而非字串 + 串接」會讓面試官知道你理解 Python 字串的不可變性和效能考量。",
                            starterCode: """
                                def compress(s):
                                    if not s:
                                        return s
                                    result = []
                                    count = 1
                                    # 遍歷字串，比較相鄰字元
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
                    name: "List 與 Tuple",
                    description: "CRUD 操作、切片、排序、解包",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "List 操作",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "執行 nums.append(9) 後再執行 nums.sort()，nums 的值是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "List 基本操作",
                                narrative: "你有一個 list：nums = [3, 1, 4, 1, 5]",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[1, 1, 3, 4, 5, 9]", explanation: "正確！append(9) 加到尾部 → [3,1,4,1,5,9]，sort() 原地排序 → [1,1,3,4,5,9]。"),
                                Challenge.Option(id: "B", text: "[3, 1, 4, 1, 5, 9]", explanation: "sort() 會改變原 list 的順序。"),
                                Challenge.Option(id: "C", text: "[9, 5, 4, 3, 1, 1]", explanation: "這是降序排列，sort() 預設是升序。降序要用 sort(reverse=True)。"),
                                Challenge.Option(id: "D", text: "[1, 1, 3, 4, 5]", explanation: "append(9) 已經加了 9 進去。"),
                            ],
                            correctAnswer: "A",
                            hints: ["append() 加到尾部，sort() 原地升序排列（都會修改原 list）"],
                            explanation: "list 是可變的（mutable）。append() 加元素、sort() 排序都是原地操作（in-place），會修改原 list。sorted() 則回傳新 list。",
                            frameworkTip: "原地操作 vs 回傳新值：list.sort() 改原本，sorted(list) 不改原本。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Tuple 的用途",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "回傳座標應該用 tuple 還是 list？為什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Tuple vs List",
                                narrative: "你在設計一個函式，要回傳一個座標 (x, y)。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "List — 因為 list 功能比較多", explanation: "功能多不代表適合。座標不應該被修改。"),
                                Challenge.Option(id: "B", text: "Tuple — 因為座標是不可變的固定結構", explanation: "正確！Tuple 是不可變的（immutable），適合表示不應被修改的固定結構，如座標、日期、設定值。"),
                                Challenge.Option(id: "C", text: "都可以，沒差別", explanation: "語義上有差：tuple 表示「固定結構」，list 表示「可變集合」。"),
                                Challenge.Option(id: "D", text: "Dict — 用 {\"x\": 1, \"y\": 2}", explanation: "Dict 適合有名稱的屬性，座標用 tuple 更簡潔。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Tuple = 不可變、固定結構。List = 可變、動態集合。"],
                            explanation: "Tuple 語義：「這組值不該被改」。常用於函式回傳多個值、字典的 key、不可變的資料記錄。",
                            frameworkTip: "選擇依據：會增減元素 → list。固定結構不變 → tuple。"
                        ),
                        Challenge(
                            id: 3,
                            name: "處理員工薪資清單",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 analyze_salaries(salaries)，接收一個薪資 list（整數），回傳一個 dict 包含：\n- \"count\": 員工人數\n- \"avg\": 平均薪資（四捨五入到整數）\n- \"max\": 最高薪資\n- \"min\": 最低薪資\n- \"above_avg\": 薪資高於平均的人數\n- \"sorted\": 從高到低排序的薪資 list（不改原 list）",
                            scenario: 
                            Challenge.Scenario(
                                title: "薪資資料處理",
                                narrative: "HR 給你一份員工薪資 list，需要你做基本的資料分析和排序。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 sum()/len() 算平均", "用 sorted() 而非 .sort() 避免修改原 list", "sum(1 for ...) 可以計數滿足條件的元素"],
                            explanation: "這題練習 list 的內建函式（sum、len、max、min）、sorted 排序（reverse=True 降序）、generator expression 計數，以及用 dict 組織多個回傳值。",
                            frameworkTip: "sorted() 回傳新 list 不改原本。.sort() 原地修改回傳 None。需要保留原資料用 sorted()。",
                            starterCode: """
                                def analyze_salaries(salaries):
                                    # 計算各項統計數據
                                    # 回傳包含所有統計的 dict
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
                            name: "Two Sum（LeetCode #1）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 two_sum(nums, target)，找出陣列中兩個數字的索引，使它們的和等於 target。\n\n假設每個輸入恰好有一個解，且同一個元素不能使用兩次。\n\n```python\n# 範例\ntwo_sum([2, 7, 11, 15], 9)   # → [0, 1]（因為 nums[0] + nums[1] = 9）\ntwo_sum([3, 2, 4], 6)         # → [1, 2]\ntwo_sum([3, 3], 6)            # → [0, 1]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商購物車湊單功能",
                                narrative: "你在一家電商平台做促銷功能：找出購物車中哪兩個商品的價格加起來剛好等於優惠門檻。這是 LeetCode #1 Two Sum，程式面試史上被考最多次的題目，沒有之一。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["暴力法：兩層 for 迴圈 O(n²)。最佳解：用 dict O(n)", "對每個數字 num，它的「互補數」是 target - num", "dict 的 key 是數字，value 是索引", "enumerate() 同時取得索引和值"],
                            explanation: "Two Sum 的 O(n) 解法核心概念：\n1. 遍歷陣列，對每個數字 num 計算互補數 complement = target - num\n2. 檢查 complement 是否在 seen dict 中\n   - 是 → 找到答案，回傳兩個索引\n   - 否 → 把 num 和它的索引存入 seen\n\n為什麼用 dict？因為 dict 的查找是 O(1)，所以整體是 O(n)。\n\n這是 hash table 最經典的應用場景。",
                            frameworkTip: "這是 LeetCode 第一題，也是面試史上考最多的題。面試時先說暴力法 O(n²)，再優化到 O(n) hash table 解法。用 enumerate 而非 range(len()) 更 Pythonic。",
                            starterCode: """
                                def two_sum(nums, target):
                                    # 提示：用 dict 記錄「已看過的數字 → 索引」
                                    # 對每個數字，檢查 target - 數字 是否在 dict 中
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
                            name: "Best Time to Buy and Sell Stock（LeetCode #121）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 max_profit(prices)，回傳能獲得的最大利潤。你只能買一次、賣一次，且必須先買後賣。如果無法獲利，回傳 0。\n\n```python\n# 範例\nmax_profit([7, 1, 5, 3, 6, 4])  # → 5（第 2 天買 $1，第 5 天賣 $6）\nmax_profit([7, 6, 4, 3, 1])     # → 0（股價一直跌，不交易）\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "股票交易最佳時機分析",
                                narrative: "你在一家金融科技新創做量化分析。老闆給你一組歷史股價數據，要你找出「哪天買、哪天賣」能獲得最大利潤。這是 LeetCode #121，Blind 75 中的高頻題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["不需要記錄「哪天買哪天賣」，只需要追蹤最低價和最大利潤", "遍歷時，每個價格要嘛更新最低價，要嘛計算利潤", "一次遍歷 O(n) 就能解決"],
                            explanation: "這題的巧妙之處：不需要兩層迴圈比較所有組合。\n\n核心思路：\n1. 維護 min_price = 目前為止的最低買入價\n2. 維護 profit = 目前為止的最大利潤\n3. 對每個價格：\n   - 如果比 min_price 低 → 更新 min_price\n   - 否則 → 計算利潤 price - min_price，更新 profit\n\n這是 greedy（貪心）演算法的經典應用：在每個時間點做出最優的局部決策。",
                            frameworkTip: "面試時解這題，先說「暴力法是 O(n²) 雙重迴圈」，再說「但可以用 greedy 做到 O(n)：追蹤最低買入價」。面試官最想聽到的是你的優化思路。",
                            starterCode: """
                                def max_profit(prices):
                                    # 追蹤「目前為止的最低價」和「最大利潤」
                                    # 遍歷價格，每天計算：如果今天賣，利潤是多少？
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
                            name: "List 切片與 Tuple 不可變性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下程式碼的輸出是什麼？\n\n```python\noriginal = [1, 2, [3, 4]]\nshallow = original[:]\nshallow[0] = 99\nshallow[2][0] = 99\n\nprint(original)\nprint(type((1,)))\nprint(type((1)))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料管線中的安全考量",
                                narrative: "你在建構一個數據分析管線，需要確保某些設定值不會被意外修改。理解 list 和 tuple 的差異在實務中非常重要。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[1, 2, [99, 4]]\n<class 'tuple'>\n<class 'int'>", explanation: "正確！[:] 是淺拷貝：第一層獨立，但巢狀物件（list）共享引用。(1,) 是 tuple，(1) 只是加了括號的 int。"),
                                Challenge.Option(id: "B", text: "[99, 2, [99, 4]]\n<class 'tuple'>\n<class 'tuple'>", explanation: "淺拷貝後，修改 shallow[0] 不會影響 original[0]。(1) 不是 tuple，是 int。"),
                                Challenge.Option(id: "C", text: "[1, 2, [3, 4]]\n<class 'tuple'>\n<class 'int'>", explanation: "淺拷貝的巢狀物件是共享引用，所以 shallow[2][0] = 99 會影響 original[2][0]。"),
                                Challenge.Option(id: "D", text: "[1, 2, [99, 4]]\n<class 'tuple'>\n<class 'tuple'>", explanation: "(1) 缺少逗號，Python 把它當成普通括號而非 tuple。"),
                            ],
                            correctAnswer: "A",
                            hints: ["[:] 是淺拷貝（shallow copy），只複製第一層", "巢狀的 list 還是共享同一個參照", "建立 tuple 的關鍵是逗號，不是括號"],
                            explanation: "兩個重要概念：\n\n1. 淺拷貝 vs 深拷貝：\n   - original[:] 或 list(original) 是淺拷貝\n   - 第一層是獨立副本，但巢狀物件共享引用\n   - 需要完整獨立副本時用 import copy; copy.deepcopy()\n\n2. Tuple 的建立：\n   - 關鍵是逗號，不是括號\n   - (1,) → tuple\n   - (1) → int（括號被當作數學運算的括號）\n   - 1, → 也是 tuple",
                            frameworkTip: "面試中「淺拷貝 vs 深拷貝」是 Python 高頻考點。記住：[:] 和 list() 都是淺拷貝。如果面試官追問如何深拷貝，答 copy.deepcopy()。"
                        ),
                    ]
                ),
                Quest(
                    id: "16-5",
                    name: "Dict 與 Set",
                    description: "key-value 操作、遍歷、集合運算",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Dict 基本操作",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪種方式最安全？",
                            scenario: 
                            Challenge.Scenario(
                                title: "字典操作",
                                narrative: "你有一個字典：scores = {\"Alice\": 90, \"Bob\": 85}。你想安全地取得 \"Charlie\" 的分數（可能不存在）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "scores[\"Charlie\"]", explanation: "如果 key 不存在會拋出 KeyError。"),
                                Challenge.Option(id: "B", text: "scores.get(\"Charlie\", 0)", explanation: "正確！.get() 在 key 不存在時回傳預設值（這裡是 0），不會報錯。"),
                                Challenge.Option(id: "C", text: "scores.find(\"Charlie\")", explanation: "dict 沒有 .find() 方法。"),
                                Challenge.Option(id: "D", text: "scores.Charlie", explanation: "dict 不能用點語法存取，那是物件屬性的語法。"),
                            ],
                            correctAnswer: "B",
                            hints: [".get(key, default) 是安全存取 dict 的標準方式"],
                            explanation: "dict.get(key, default) 在 key 不存在時回傳 default，避免 KeyError。是比 dict[key] 更安全的存取方式。",
                            frameworkTip: "存取 dict 的三種方式：dict[key]（可能報錯）、dict.get(key)（安全）、key in dict（先檢查）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Set 集合運算",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "a & b 的結果是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "集合運算",
                                narrative: "a = {1, 2, 3, 4}\nb = {3, 4, 5, 6}\n你想找出兩個集合共有的元素。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "{1, 2, 3, 4, 5, 6}", explanation: "這是聯集（union），用 a | b。"),
                                Challenge.Option(id: "B", text: "{3, 4}", explanation: "正確！& 是交集（intersection），回傳兩個集合都有的元素。"),
                                Challenge.Option(id: "C", text: "{1, 2}", explanation: "這是差集 a - b（a 有但 b 沒有）。"),
                                Challenge.Option(id: "D", text: "{1, 2, 5, 6}", explanation: "這是對稱差集 a ^ b（只在其中一個集合出現的元素）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["& = 交集、| = 聯集、- = 差集、^ = 對稱差集"],
                            explanation: "Set 四種運算：& 交集（都有）、| 聯集（合併）、- 差集（我有你沒有）、^ 對稱差集（只在一方）。",
                            frameworkTip: "Set 適合去重和集合運算。list(set(my_list)) 可以快速去除重複元素。"
                        ),
                        Challenge(
                            id: 3,
                            name: "統計銷售資料",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 aggregate_sales(records)，接收 list of dicts（每個 dict 有 \"product\", \"qty\", \"price\" 三個 key），回傳一個 dict，key 是產品名，value 是另一個 dict 包含 \"total_qty\" 和 \"total_revenue\"。\n例如：{\"Apple\": {\"total_qty\": 10, \"total_revenue\": 300}}",
                            scenario: 
                            Challenge.Scenario(
                                title: "銷售 Dict 統計",
                                narrative: "你有多筆銷售記錄（list of dicts），需要統計每個產品的總銷量和總營收。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先檢查 product 是否已在 result 中，沒有就初始化", "用 dict 嵌套 dict 組織結果", "營收 = qty * price"],
                            explanation: "這題練習用 dict 累加統計資料，是資料分析中最常見的模式。key 是分組依據（產品），value 是統計結果。這個模式在沒有 pandas 時非常實用。",
                            frameworkTip: "Dict 累加模式：先檢查 key 存在否 → 不存在就初始化 → 存在就累加。也可以用 defaultdict 簡化。",
                            starterCode: """
                                def aggregate_sales(records):
                                    # 用 dict 累加每個產品的數量和營收
                                    # records 範例: [{"product": "Apple", "qty": 5, "price": 30}, ...]
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
                            name: "字元頻率統計",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 char_frequency(s)，回傳字串中每個字元的出現次數（dict），並找出出現最多次的字元。\n\n```python\n# 範例\nchar_frequency(\"hello\")\n# → ({\"h\": 1, \"e\": 1, \"l\": 2, \"o\": 1}, \"l\")\n\nchar_frequency(\"aabbcc\")\n# → ({\"a\": 2, \"b\": 2, \"c\": 2}, \"a\")  # 出現次數相同時回傳第一個\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商搜尋關鍵字分析",
                                narrative: "你在電商平台的搜尋團隊，需要分析使用者搜尋關鍵字中每個字元出現的頻率，找出最常出現的字元來優化搜尋建議。這是 dict 最基礎也最重要的應用。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["dict.get(key, default) 在 key 不存在時回傳 default", "max(dict, key=dict.get) 可以找出值最大的 key", "也可以用 collections.Counter，但面試通常要你手寫"],
                            explanation: "字元計數的三種寫法：\n\n1. 手動計數（面試必會）：\n   freq[c] = freq.get(c, 0) + 1\n\n2. defaultdict：\n   from collections import defaultdict\n   freq = defaultdict(int)\n   freq[c] += 1\n\n3. Counter（最簡潔）：\n   from collections import Counter\n   freq = Counter(s)\n\n面試時先寫手動版，再提 Counter 加分。\nmax(freq, key=freq.get) 是找 dict 中值最大的 key 的慣用寫法。",
                            frameworkTip: "字元計數是 dict 最基本的應用，幾乎所有 hash table 題目的基礎。面試時用 dict.get(key, 0) 而非 if key in dict 會更簡潔。提到 Counter 可以加分。",
                            starterCode: """
                                def char_frequency(s):
                                    freq = {}
                                    # 遍歷字串，用 dict 計數
                                    # 找出出現最多次的字元
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
                            name: "Valid Anagram（LeetCode #242）",
                            type: .code,
                            difficulty: .easy,
                            question: "寫一個函式 is_anagram(s, t)，判斷 t 是否為 s 的 anagram（字母異位詞）。\n\nAnagram = 兩個字串使用完全相同的字母，只是排列順序不同。\n\n```python\n# 範例\nis_anagram(\"anagram\", \"nagaram\")  # → True\nis_anagram(\"rat\", \"car\")          # → False\nis_anagram(\"\", \"\")                 # → True\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 平台重複內容偵測",
                                narrative: "你在一個內容管理 SaaS 平台，需要偵測是否有人用相同的字元重新排列來建立看似不同的內容（anagram）。這是 LeetCode #242，hash table 的經典應用。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["如果兩個字串長度不同，一定不是 anagram", "用一個 dict：遍歷 s 時 +1，遍歷 t 時 -1", "如果任何計數變成負數，代表 t 有 s 沒有的字元", "最簡潔解：sorted(s) == sorted(t)，但是 O(n log n)"],
                            explanation: "三種解法比較：\n\n1. 排序法（最簡潔）：sorted(s) == sorted(t)\n   - 時間 O(n log n)，空間 O(n)\n\n2. 雙 dict 比較：分別計數再比較\n   - 時間 O(n)，空間 O(n)\n\n3. 單 dict（最佳）：s 的字元 +1，t 的字元 -1\n   - 時間 O(n)，空間 O(1)（字母只有 26 個）\n   - 如果最後所有值為 0，就是 anagram\n\n面試中先寫排序法展示快速解題能力，再優化到 hash table 解法。",
                            frameworkTip: "面試時這題的 follow-up 常問：「如果輸入包含 Unicode 字元呢？」答案：hash table 解法不受影響，但排序法的比較可能需要注意 locale。展示你考慮了擴展性。",
                            starterCode: """
                                def is_anagram(s, t):
                                    # 方法：比較兩個字串的字元頻率是否相同
                                    # 用 dict 分別統計兩個字串的字元頻率
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
                            name: "Set 集合運算",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下程式碼的輸出是什麼？\n\n```python\nbought_a = {\"Alice\", \"Bob\", \"Carol\", \"Dave\"}\nbought_b = {\"Bob\", \"Carol\", \"Eve\", \"Frank\"}\n\nboth = bought_a & bought_b\nonly_a = bought_a - bought_b\neither = bought_a | bought_b\nnot_both = bought_a ^ bought_b\n\nprint(len(both), len(only_a), len(either), len(not_both))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "用戶行為交叉分析",
                                narrative: "你在做用戶行為分析：找出「同時購買 A 和 B 的用戶」、「只購買 A 的用戶」、「購買 A 或 B 的所有用戶」。這正是 Set 集合運算的完美應用場景。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "2 2 6 4", explanation: "正確！& 交集 {Bob, Carol}=2，- 差集 {Alice, Dave}=2，| 聯集 6 人（不重複），^ 對稱差集 {Alice, Dave, Eve, Frank}=4。"),
                                Challenge.Option(id: "B", text: "2 2 8 4", explanation: "聯集 | 會去除重複，Bob 和 Carol 只算一次。"),
                                Challenge.Option(id: "C", text: "2 4 6 4", explanation: "差集 bought_a - bought_b 只包含「在 A 但不在 B」的元素。"),
                                Challenge.Option(id: "D", text: "2 2 6 2", explanation: "對稱差集 ^ 是「在 A 或 B 但不同時在兩者」，包含 Alice, Dave, Eve, Frank。"),
                            ],
                            correctAnswer: "A",
                            hints: ["& 交集：同時在兩個 set 中的元素", "- 差集：在 A 中但不在 B 中", "| 聯集：在 A 或 B 中（去重）", "^ 對稱差集：在 A 或 B 中，但不同時在兩者"],
                            explanation: "Python Set 四大運算：\n- A & B（交集 intersection）：同時存在於兩個集合\n- A - B（差集 difference）：只在 A 不在 B\n- A | B（聯集 union）：在任一集合中（去重）\n- A ^ B（對稱差集 symmetric_difference）：只在其中一個集合中\n\n等價的方法：\n- A.intersection(B)\n- A.difference(B)\n- A.union(B)\n- A.symmetric_difference(B)",
                            frameworkTip: "面試中遇到「找出兩個列表的共同元素」或「找出不重複的元素」，立刻想到 Set。用 set 運算比 for 迴圈更 Pythonic，時間複雜度也更好（O(n) vs O(n²)）。"
                        ),
                    ]
                ),
                Quest(
                    id: "16-6",
                    name: "資料清洗小程式（Boss）",
                    description: "用迴圈 + dict 統計清洗資料集",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 統計與清洗",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "銷售資料統計",
                                narrative: "你收到一份銷售資料（list of dicts）：\n\nsales = [\n    {\"product\": \"Apple\", \"qty\": 5, \"price\": 30},\n    {\"product\": \"Banana\", \"qty\": 3, \"price\": 15},\n    {\"product\": \"apple\", \"qty\": 2, \"price\": 30},\n    {\"product\": \"Cherry\", \"qty\": None, \"price\": 50},\n    {\"product\": \"Banana\", \"qty\": 7, \"price\": 15},\n    {\"product\": \"\", \"qty\": 4, \"price\": 20},\n]\n\n資料有幾個問題：產品名大小寫不一致、有空名稱、有 None 數量。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 dict.get(key, 0) 來安全地累加", "記得先清洗再統計：strip() + lower()"],
                            explanation: "這個題目整合了：for 迴圈、dict 操作（get、items）、字串方法（strip、lower）、條件過濾（continue）、max() 函式。",
                            frameworkTip: "資料處理三步驟：Clean → Transform → Aggregate。先清洗，再轉換，最後統計。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 17,
            name: "函式與錯誤處理",
            emoji: "⚙️",
            description: "def、參數、scope、內建函式、try/except",
            quests: [
                Quest(
                    id: "17-1",
                    name: "函式基礎 def",
                    description: "定義函式、參數、return",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "函式定義",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個定義是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "第一個函式",
                                narrative: "你想寫一個函式 greet(name)，回傳 \"Hello, {name}!\"。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "function greet(name):\n    return f\"Hello, {name}!\"", explanation: "Python 用 def 不是 function。function 是 JavaScript 的語法。"),
                                Challenge.Option(id: "B", text: "def greet(name):\n    return f\"Hello, {name}!\"", explanation: "正確！Python 用 def 定義函式，冒號 + 縮排是函式主體。"),
                                Challenge.Option(id: "C", text: "def greet(name)\n    return f\"Hello, {name}!\"", explanation: "缺少冒號！def 語句結尾必須有冒號。"),
                                Challenge.Option(id: "D", text: "def greet(name):\n    print(f\"Hello, {name}!\")", explanation: "print 是輸出到螢幕，不是回傳值。需求是「回傳」，應該用 return。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Python 用 def 定義函式，注意冒號和縮排"],
                            explanation: "def 函式名(參數): 是 Python 函式定義的語法。return 回傳值（沒有 return 則回傳 None）。print 只是輸出，不是回傳。",
                            frameworkTip: "return vs print：return 把值傳給呼叫者，print 把值印到螢幕。大部分情況該用 return。"
                        ),
                        Challenge(
                            id: 2,
                            name: "return 的行為",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "add(3, 5) 的回傳值是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "return 與 None",
                                narrative: "你定義了一個函式但忘了寫 return：\ndef add(a, b):\n    result = a + b",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "8", explanation: "result 計算了 8，但沒有 return 把它傳出來。"),
                                Challenge.Option(id: "B", text: "None", explanation: "正確！沒有 return 語句的函式自動回傳 None。"),
                                Challenge.Option(id: "C", text: "報錯", explanation: "不會報錯，只是回傳 None。"),
                                Challenge.Option(id: "D", text: "0", explanation: "沒有 return 不會回傳 0，而是 None。"),
                            ],
                            correctAnswer: "B",
                            hints: ["沒有 return 的函式回傳 None"],
                            explanation: "Python 函式沒有 return 時自動回傳 None。這是一個常見的 bug 來源：你以為函式有回傳值，但其實是 None。",
                            frameworkTip: "寫完函式後檢查：每個分支都有 return 嗎？忘記 return 是最常見的 bug 之一。"
                        ),
                        Challenge(
                            id: 3,
                            name: "設計折扣計算函式",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 calculate_discount(price, member_level=\"normal\", coupon_percent=0, is_holiday=False)：\n- member_level 折扣：normal=0%, silver=5%, gold=10%, vip=15%\n- coupon_percent: 額外折扣百分比（0-50）\n- is_holiday: 節日再打 9 折\n- 折扣疊加方式：先算會員折扣，再算 coupon，最後算節日\n- 回傳最終價格（四捨五入到小數點後兩位）\n- 如果 coupon_percent 不在 0-50 範圍，raise ValueError",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商折扣引擎",
                                narrative: "電商平台需要一個折扣計算函式，根據不同條件組合計算最終價格。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 dict 儲存會員折扣對應表", "折扣疊加：依序乘以 (1 - 折扣率)", "用 raise ValueError 處理不合法的 coupon"],
                            explanation: "這題練習函式設計的多個面向：預設參數、dict 查找、連續計算、input 驗證（raise ValueError）、四捨五入。",
                            frameworkTip: "商業邏輯函式設計：先驗證輸入 → 查表取參數 → 按順序計算 → 格式化回傳。",
                            starterCode: """
                                def calculate_discount(price, member_level="normal", coupon_percent=0, is_holiday=False):
                                    # 定義會員折扣 dict
                                    # 依序套用折扣
                                    # 驗證 coupon_percent 範圍
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
                            name: "資料清洗工具函式",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 clean_record(record)，接收一個 dict，執行以下清洗：\n- 所有字串值去除前後空白（strip）\n- key 為 \"email\" 的值轉小寫\n- key 為 \"phone\" 的值移除所有非數字字元\n- key 為 \"age\" 的值轉成 int（轉換失敗設為 None）\n回傳清洗後的新 dict（不改原 dict）。",
                            scenario: 
                            Challenge.Scenario(
                                title: "批次資料清洗",
                                narrative: "你需要寫一組工具函式來清洗從 CSV 匯入的髒資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 dict.items() 迭代所有 key-value", "用 \"\".join(c for c in s if c.isdigit()) 過濾非數字", "用 try/except 安全轉型"],
                            explanation: "這題綜合了 dict 操作、字串方法（strip/lower）、generator expression 過濾字元、try/except 安全轉型。這是實務中非常常見的資料清洗模式。",
                            frameworkTip: "清洗函式設計原則：不改原資料（建新 dict）、處理所有邊界情況、每種欄位有對應的清洗邏輯。",
                            starterCode: """
                                def clean_record(record):
                                    # 建立新 dict 避免修改原本的
                                    # 逐一處理每個 key-value
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
                            question: "以下哪個函式是「純函式」（Pure Function）？\n\n```python\ntotal = 0\n\ndef func_a(price, tax_rate):\n    global total\n    total += price * (1 + tax_rate)\n    return total\n\ndef func_b(price, tax_rate):\n    return price * (1 + tax_rate)\n\ndef func_c(price, tax_rate):\n    result = price * (1 + tax_rate)\n    print(f\"計算結果：{result}\")\n    return result\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "純函式 vs 副作用",
                                narrative: "你在 Google 面試中被問到函式式程式設計的核心概念。面試官給你看了三段程式碼，要你判斷哪個是「純函式」，以及為什麼這在大型系統中很重要。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "func_a", explanation: "func_a 修改了全域變數 total，這是典型的副作用（side effect）。"),
                                Challenge.Option(id: "B", text: "func_b", explanation: "正確！func_b 只依賴輸入參數，不修改外部狀態，相同輸入永遠產生相同輸出。這就是純函式的定義。"),
                                Challenge.Option(id: "C", text: "func_c", explanation: "func_c 雖然回傳正確結果，但 print() 是 I/O 操作，屬於副作用。"),
                                Challenge.Option(id: "D", text: "func_a 和 func_c 都是", explanation: "兩者都有副作用：func_a 修改全域變數，func_c 執行 I/O 操作。"),
                            ],
                            correctAnswer: "B",
                            hints: ["純函式的兩個條件：(1) 相同輸入永遠回傳相同輸出 (2) 不產生副作用", "副作用包括：修改全域變數、I/O 操作、修改可變參數"],
                            explanation: "純函式（Pure Function）必須滿足：\n1. 確定性：相同輸入 → 相同輸出\n2. 無副作用：不修改外部狀態、不做 I/O\n\n純函式的好處：容易測試、可平行化、可快取結果（memoization）。在 Google 等大公司，純函式是 code review 的重要準則。",
                            frameworkTip: "面試時提到純函式，連結到「可測試性」和「可預測性」。Google 特別重視這點，因為大型分散式系統需要可靠的函式行為。"
                        ),
                        Challenge(
                            id: 6,
                            name: "First-Class Functions",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 apply_discount(price, discount_func)，接受價格和一個折扣函式作為參數，回傳折扣後的價格。\n\n然後寫兩個折扣函式：\n- percent_off(rate) 回傳一個函式，該函式將價格乘以 (1 - rate)\n- fixed_off(amount) 回傳一個函式，該函式將價格減去 amount（最低為 0）\n\n範例：\napply_discount(100, percent_off(0.2)) → 80.0\napply_discount(50, fixed_off(30)) → 20\napply_discount(10, fixed_off(30)) → 0",
                            scenario: 
                            Challenge.Scenario(
                                title: "函式作為一等公民",
                                narrative: "你在開發一個電商平台的促銷引擎。不同的促銷活動有不同的折扣邏輯，你需要用「函式作為參數」的方式來設計一個靈活的定價系統，而不是寫一堆 if/else。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Python 中函式是一等公民，可以當作參數傳遞", "percent_off 和 fixed_off 需要回傳一個「函式」，不是回傳一個值", "用 max(0, ...) 確保價格不會變成負數"],
                            explanation: "這題展示了 Python 的「一等函式」（First-Class Functions）特性：\n- 函式可以作為參數傳遞\n- 函式可以作為回傳值\n- 函式可以存在變數中\n\npercent_off 和 fixed_off 是「高階函式」（Higher-Order Functions）——它們回傳函式。這種模式在策略模式（Strategy Pattern）中非常常見。",
                            frameworkTip: "面試時展示你會用函式作為參數，面試官會認為你理解函式式程式設計。提到「策略模式」或「高階函式」這些關鍵字會加分。",
                            starterCode: """
                                def apply_discount(price, discount_func):
                                    # 把 discount_func 當作函式來呼叫
                                    pass

                                def percent_off(rate):
                                    # 回傳一個折扣函式
                                    pass

                                def fixed_off(amount):
                                    # 回傳一個折扣函式
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
                    name: "參數進階",
                    description: "預設值、*args、**kwargs",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "預設參數",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "greet(\"Alice\") 的結果是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "函式預設值",
                                narrative: "你定義了：\ndef greet(name, greeting=\"Hello\"):\n    return f\"{greeting}, {name}!\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "報錯 — 缺少 greeting 參數", explanation: "greeting 有預設值，可以不傳。"),
                                Challenge.Option(id: "B", text: "\"Hello, Alice!\"", explanation: "正確！greeting 使用預設值 \"Hello\"。"),
                                Challenge.Option(id: "C", text: "\"None, Alice!\"", explanation: "預設值是 \"Hello\" 不是 None。"),
                                Challenge.Option(id: "D", text: "\"Alice, Hello!\"", explanation: "順序不對，是 {greeting}, {name}。"),
                            ],
                            correctAnswer: "B",
                            hints: ["有預設值的參數可以省略，會自動使用預設值"],
                            explanation: "預設參數讓函式更靈活：必要參數放前面，可選參數（有預設值）放後面。",
                            frameworkTip: "預設值陷阱：不要用可變物件（list, dict）作預設值！用 None 代替。"
                        ),
                        Challenge(
                            id: 2,
                            name: "*args 與 **kwargs",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個呼叫是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "可變參數",
                                narrative: "你看到一個函式定義：\ndef log(message, *args, **kwargs):\n    pass",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "log(\"error\", 1, 2, 3, level=\"high\")", explanation: "正確！\"error\" → message，1,2,3 → args，level=\"high\" → kwargs。"),
                                Challenge.Option(id: "B", text: "log(level=\"high\", \"error\")", explanation: "關鍵字引數不能在位置引數前面。"),
                                Challenge.Option(id: "C", text: "log()", explanation: "message 是必要參數，不能省略。"),
                                Challenge.Option(id: "D", text: "log(\"error\", *[1,2], **\"level\")", explanation: "**後面要接 dict，不能接字串。"),
                            ],
                            correctAnswer: "A",
                            hints: ["*args 收集多餘的位置引數成 tuple，**kwargs 收集多餘的關鍵字引數成 dict"],
                            explanation: "*args 把多餘的位置引數收集成 tuple，**kwargs 把多餘的關鍵字引數收集成 dict。順序：普通參數 → *args → **kwargs。",
                            frameworkTip: "常用場景：包裝函式（wrapper）和裝飾器（decorator）會用 *args, **kwargs 傳遞任意參數。"
                        ),
                        Challenge(
                            id: 3,
                            name: "彈性 Logger 函式",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 smart_log(*args, **kwargs)：\n- 將所有 args 用 \" | \" 連接成訊息字串\n- 如果 kwargs 有 level，在訊息前加上 \"[LEVEL] \"（大寫）\n- 如果 kwargs 有 timestamp，在最前面加上 timestamp + \" \"\n- 回傳最終的 log 字串\n\n範例：\nsmart_log(\"User login\", \"id=123\") → \"User login | id=123\"\nsmart_log(\"Error\", \"DB timeout\", level=\"warning\") → \"[WARNING] Error | DB timeout\"\nsmart_log(\"Sale\", amount=\"$500\", level=\"info\", timestamp=\"2024-01-15\") → \"2024-01-15 [INFO] Sale\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "用 *args/**kwargs 建構彈性 Logger",
                                narrative: "你在 Amazon 的後端團隊，需要設計一個靈活的 logging 函式。不同的微服務需要記錄不同格式的 log，你要用 *args 和 **kwargs 來打造一個通用的 logger。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 \" | \".join() 連接 args", "用 kwargs.get(\"level\") 安全取值", "注意組合順序：timestamp 在最前面，level 在訊息前面"],
                            explanation: "*args 收集位置參數成 tuple，**kwargs 收集關鍵字參數成 dict。這種設計讓函式能接受任意數量和類型的參數，非常適合 logging、事件系統等需要彈性的場景。",
                            frameworkTip: "面試時如果被問到 *args/**kwargs 的實際應用，log 系統和裝飾器（decorator）是最好的例子。Amazon 特別重視可擴展的系統設計。",
                            starterCode: """
                                def smart_log(*args, **kwargs):
                                    # 1. 用 " | " 連接所有 args
                                    # 2. 檢查 kwargs 中的 level 和 timestamp
                                    # 3. 組合最終字串
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
                            name: "函式簽名設計原則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個函式定義會引發 SyntaxError？\n\n```python\n# A\ndef func_a(a, b=10, *args, **kwargs):\n    pass\n\n# B\ndef func_b(a, *args, b=10, **kwargs):\n    pass\n\n# C\ndef func_c(a, **kwargs, *args):\n    pass\n\n# D\ndef func_d(*, key, value=\"default\"):\n    pass\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "函式參數設計的最佳實踐",
                                narrative: "你在 Amazon 的 code review 中，資深工程師指出一個函式的參數設計有問題。你需要理解 Python 函式簽名的最佳實踐和參數順序規則。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "func_a", explanation: "func_a 的參數順序合法：一般參數 → 預設值參數 → *args → **kwargs。"),
                                Challenge.Option(id: "B", text: "func_b", explanation: "func_b 合法！*args 後面的 b=10 變成 keyword-only 參數，只能用 func_b(1, 2, 3, b=20) 來傳。"),
                                Challenge.Option(id: "C", text: "func_c", explanation: "正確！**kwargs 必須在最後面，不能放在 *args 前面。Python 規定參數順序是：一般 → 預設值 → *args → keyword-only → **kwargs。"),
                                Challenge.Option(id: "D", text: "func_d", explanation: "func_d 合法！* 後面的參數都是 keyword-only，必須用名字傳遞。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Python 參數順序：positional → default → *args → keyword-only → **kwargs", "**kwargs 永遠在最後", "* 單獨出現表示後面的參數都是 keyword-only"],
                            explanation: "Python 函式參數的合法順序：\n1. 一般位置參數（a, b）\n2. 有預設值的參數（c=10）\n3. *args（收集額外位置參數）\n4. keyword-only 參數（*args 之後的參數）\n5. **kwargs（必須最後）\n\n特別注意：func_b 中 *args 後面的 b=10 自動成為 keyword-only 參數。",
                            frameworkTip: "面試時能正確解釋 keyword-only 參數（PEP 3102）和參數順序規則，展示你對 Python 的深入理解。Amazon 重視清晰的 API 設計。"
                        ),
                    ]
                ),
                Quest(
                    id: "17-3",
                    name: "作用域與內建函式",
                    description: "LEGB 規則、map/filter/sorted/zip",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "LEGB 作用域",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "輸出結果是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "變數作用域",
                                narrative: "以下程式碼：\nx = 10\ndef foo():\n    x = 20\n    print(x)\nfoo()\nprint(x)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "20 然後 20", explanation: "函式內的 x 是 local 變數，不會影響外面的 x。"),
                                Challenge.Option(id: "B", text: "20 然後 10", explanation: "正確！函式內 x=20 是 local 變數（L），函式外 x=10 是 global 變數（G）。兩個 x 互不影響。"),
                                Challenge.Option(id: "C", text: "10 然後 10", explanation: "函式內有 x=20，會用 local 的值。"),
                                Challenge.Option(id: "D", text: "報錯", explanation: "不會報錯，兩個 x 在不同的作用域。"),
                            ],
                            correctAnswer: "B",
                            hints: ["LEGB：Local → Enclosing → Global → Built-in，Python 從內到外找變數"],
                            explanation: "LEGB 規則：Python 查找變數的順序是 Local → Enclosing（巢狀函式）→ Global → Built-in。函式內賦值會建立 local 變數。",
                            frameworkTip: "避免在函式內用 global 修改全域變數。如果需要共享狀態，用參數和回傳值。"
                        ),
                        Challenge(
                            id: 2,
                            name: "常用內建函式",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個表達式回傳 [1, 1, 3, 4, 5, 9]？",
                            scenario: 
                            Challenge.Scenario(
                                title: "內建函式",
                                narrative: "你有一個 list：nums = [3, 1, 4, 1, 5, 9]",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "nums.sort()", explanation: ".sort() 原地排序並回傳 None，不是回傳排序後的 list。"),
                                Challenge.Option(id: "B", text: "sorted(nums)", explanation: "正確！sorted() 回傳新的排序 list，不修改原本的。"),
                                Challenge.Option(id: "C", text: "list(reversed(nums))", explanation: "reversed() 是反轉，不是排序。"),
                                Challenge.Option(id: "D", text: "nums.order()", explanation: "list 沒有 .order() 方法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["sorted() 回傳新 list，.sort() 原地修改回傳 None"],
                            explanation: "常用內建函式：sorted()（排序）、len()（長度）、sum()（加總）、min()/max()（最小/最大）、zip()（配對）、map()（映射）、filter()（篩選）。",
                            frameworkTip: "記住 sorted() vs .sort() 的差別：需要保留原 list 用 sorted()，不需要用 .sort()。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Closure 經典面試題",
                            type: .code,
                            difficulty: .hard,
                            question: "用閉包（Closure）實作一個計數器工廠函式 make_counter(start=0)：\n- 回傳一個函式 counter()\n- 每次呼叫 counter() 時，回傳目前的計數值並加 1\n- start 參數設定起始值\n\n範例：\ncounter = make_counter()\ncounter() → 0\ncounter() → 1\ncounter() → 2\n\ncounter_from_10 = make_counter(10)\ncounter_from_10() → 10\ncounter_from_10() → 11",
                            scenario: 
                            Challenge.Scenario(
                                title: "閉包（Closure）— 計數器",
                                narrative: "這是 Google 和 Meta 面試中的經典題。面試官要你不使用 class，只用函式來實作一個計數器。這考的是對閉包（Closure）的理解——內層函式「記住」外層函式的變數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["閉包 = 內層函式 + 它「記住」的外層變數", "需要用 nonlocal 關鍵字才能在內層函式中修改外層變數", "先保存目前值，再遞增，最後回傳保存的值"],
                            explanation: "閉包（Closure）是函式式程式設計的核心概念：\n- 內層函式 counter() 「記住」了外層的 count 變數\n- 即使 make_counter() 已經執行完畢，count 仍然存在\n- nonlocal 宣告讓內層函式能修改（而非遮蔽）外層變數\n\n閉包是裝飾器（decorator）的基礎，理解閉包才能理解裝飾器。",
                            frameworkTip: "面試時被問到閉包，先畫出作用域鏈（LEGB），再解釋 nonlocal 的作用。提到閉包是裝飾器的基礎會讓面試官印象深刻。",
                            starterCode: """
                                def make_counter(start=0):
                                    # 提示：需要用 nonlocal 關鍵字
                                    # 讓內層函式能修改外層變數
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
                            question: "以下程式碼的輸出是什麼？\n\n```python\nx = \"global\"\n\ndef outer():\n    x = \"outer\"\n    def inner():\n        nonlocal x\n        x = \"inner\"\n    inner()\n    print(\"outer:\", x)\n\nouter()\nprint(\"global:\", x)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "global 與 nonlocal 的差異",
                                narrative: "面試官問你 Python 的作用域規則（LEGB）以及 global 和 nonlocal 的區別。這是理解閉包和裝飾器的基礎。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "outer: inner\nglobal: inner", explanation: "nonlocal 只影響外層函式的變數，不影響全域變數。"),
                                Challenge.Option(id: "B", text: "outer: inner\nglobal: global", explanation: "正確！nonlocal 讓 inner() 修改了 outer() 的 x（變成 \"inner\"），但全域的 x 不受影響，仍然是 \"global\"。"),
                                Challenge.Option(id: "C", text: "outer: outer\nglobal: global", explanation: "nonlocal 會讓 inner() 中的 x = \"inner\" 修改到 outer() 的 x。"),
                                Challenge.Option(id: "D", text: "outer: outer\nglobal: inner", explanation: "nonlocal 修改的是外層函式的變數，不是全域變數。要修改全域的要用 global。"),
                            ],
                            correctAnswer: "B",
                            hints: ["nonlocal 只向上找到最近的外層函式的變數", "global 直接找全域變數", "Python 作用域規則：LEGB（Local → Enclosing → Global → Built-in）"],
                            explanation: "Python 作用域規則 LEGB：\n- Local：函式內部\n- Enclosing：外層函式（閉包）\n- Global：模組層級\n- Built-in：Python 內建\n\nnonlocal 讓變數綁定到 Enclosing scope，global 讓變數綁定到 Global scope。兩者互不影響。",
                            frameworkTip: "面試時能清楚解釋 LEGB 規則和 nonlocal vs global 的差異，是 Python 進階能力的指標。Google 面試特別愛考這類語言機制題。"
                        ),
                    ]
                ),
                Quest(
                    id: "17-4",
                    name: "錯誤類型與除錯",
                    description: "SyntaxError、TypeError、traceback 閱讀",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "辨識錯誤類型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這會產生什麼類型的錯誤？",
                            scenario: 
                            Challenge.Scenario(
                                title: "常見錯誤",
                                narrative: "你執行 print(\"Hello World) 但忘了關引號。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SyntaxError", explanation: "正確！缺少引號是語法錯誤，Python 在執行之前就會發現。"),
                                Challenge.Option(id: "B", text: "TypeError", explanation: "TypeError 是型態不匹配的執行時錯誤。語法錯誤是在解析階段就抓到的。"),
                                Challenge.Option(id: "C", text: "NameError", explanation: "NameError 是使用未定義的變數。這裡是語法問題。"),
                                Challenge.Option(id: "D", text: "ValueError", explanation: "ValueError 是值不合法。這裡是語法問題。"),
                            ],
                            correctAnswer: "A",
                            hints: ["SyntaxError = 程式碼結構錯誤（Python 看不懂你寫的）"],
                            explanation: "常見錯誤類型：SyntaxError（語法錯）、TypeError（型態不匹配）、NameError（變數未定義）、ValueError（值不合法）、IndexError（索引超界）、KeyError（key 不存在）。",
                            frameworkTip: "除錯第一步：看錯誤類型和最後一行訊息。SyntaxError 看箭頭位置，其他看 Traceback。"
                        ),
                        Challenge(
                            id: 2,
                            name: "閱讀 Traceback",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "錯誤發生在哪裡？原因是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Traceback 閱讀",
                                narrative: "你看到以下錯誤訊息：\nTraceback (most recent call last):\n  File \"main.py\", line 10, in <module>\n    result = calculate(data)\n  File \"main.py\", line 5, in calculate\n    return data[key]\nKeyError: 'price'",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "第 10 行，data 變數未定義", explanation: "第 10 行是呼叫者，錯誤在 calculate 函式內。"),
                                Challenge.Option(id: "B", text: "第 5 行，字典 data 中沒有 \"price\" 這個 key", explanation: "正確！Traceback 從上到下是呼叫鏈，最後一個是實際錯誤位置。KeyError 表示 dict 中沒有該 key。"),
                                Challenge.Option(id: "C", text: "第 5 行，data 是 None", explanation: "如果 data 是 None，會報 TypeError，不是 KeyError。"),
                                Challenge.Option(id: "D", text: "第 10 行，calculate 函式未定義", explanation: "如果未定義會報 NameError，不是 KeyError。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Traceback 從上到下讀：最上面是起點，最下面是錯誤位置。最後一行是錯誤類型和訊息。"],
                            explanation: "閱讀 Traceback：(1) 最後一行看錯誤類型和訊息 (2) 從下往上看呼叫鏈 (3) 找到你的程式碼（不是 library）中最接近底部的那行。",
                            frameworkTip: "Traceback 閱讀法：先看最後一行（錯誤類型），再看最底部的檔案行號（錯誤位置）。"
                        ),
                        Challenge(
                            id: 3,
                            name: "常見 Exception 類型辨識",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下四段程式碼分別會引發什麼例外？\n\n```python\n# 片段 1\ndata = {\"name\": \"Alice\"}\nprint(data[\"age\"])\n\n# 片段 2\nnumbers = [1, 2, 3]\nprint(numbers[5])\n\n# 片段 3\nage = int(\"twenty\")\n\n# 片段 4\nresult = None\nprint(result.upper())\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "例外類型快速辨識",
                                narrative: "你在一家電商公司做 on-call 輪值，系統在凌晨 3 點噴出一堆錯誤 log。你需要快速判斷錯誤類型才能找到正確的修復方式。理解 Python 的例外類型是高效除錯的基礎。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "KeyError, IndexError, ValueError, AttributeError", explanation: "正確！字典缺 key → KeyError；list 超出範圍 → IndexError；無法轉換型態 → ValueError；物件沒有該屬性/方法 → AttributeError。"),
                                Challenge.Option(id: "B", text: "ValueError, IndexError, TypeError, AttributeError", explanation: "存取字典不存在的 key 是 KeyError，不是 ValueError。"),
                                Challenge.Option(id: "C", text: "KeyError, IndexError, TypeError, NameError", explanation: "片段 3 是 ValueError（值無法轉換），不是 TypeError。片段 4 是 AttributeError。"),
                                Challenge.Option(id: "D", text: "KeyError, ValueError, ValueError, TypeError", explanation: "片段 2 是 IndexError（索引超出範圍）。片段 4 的 None 沒有 .upper() 方法，是 AttributeError。"),
                            ],
                            correctAnswer: "A",
                            hints: ["KeyError：字典中找不到指定的 key", "IndexError：序列的索引超出範圍", "ValueError：值的型態正確但內容不合法", "AttributeError：物件沒有指定的屬性或方法"],
                            explanation: "Python 最常見的四種例外：\n- KeyError：存取字典中不存在的 key（用 .get() 避免）\n- IndexError：list/tuple 索引超出範圍\n- ValueError：值的格式或內容不合法（如 int(\"abc\")）\n- AttributeError：物件沒有該方法或屬性（如 None.upper()）\n\n快速辨識例外類型是高效除錯的第一步。",
                            frameworkTip: "面試中被問到除錯能力時，能準確說出例外類型和對應的防禦方式（dict.get()、邊界檢查、try/except），展示你的實戰經驗。"
                        ),
                        Challenge(
                            id: 4,
                            name: "自定義 Exception",
                            type: .code,
                            difficulty: .medium,
                            question: "建立一個訂單系統的例外層級：\n1. OrderError(Exception)：基礎訂單例外，接受 message 和 order_id\n2. InsufficientStockError(OrderError)：庫存不足，額外接受 product 和 requested 數量\n3. 寫一個函式 process_order(order_id, product, quantity, stock)：\n   - 如果 stock < quantity，引發 InsufficientStockError\n   - 否則回傳 f\"Order {order_id}: {quantity}x {product} confirmed\"\n\n範例：\nprocess_order(\"A001\", \"Laptop\", 5, 3) → 引發 InsufficientStockError\nprocess_order(\"A002\", \"Mouse\", 2, 10) → \"Order A002: 2x Mouse confirmed\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "建立業務專用的例外類別",
                                narrative: "你在設計一個訂單處理系統，需要定義專屬的例外類別來區分不同的業務錯誤。使用內建的 ValueError 或 RuntimeError 不夠明確，客製化例外能讓錯誤處理更精準。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["自定義例外要繼承自 Exception 或其子類別", "用 super().__init__(message) 初始化父類別", "用 raise 引發例外，不是 return"],
                            explanation: "自定義例外的最佳實踐：\n1. 繼承自 Exception（不是 BaseException）\n2. 用 super().__init__() 正確初始化父類別\n3. 加入額外屬性（order_id, product 等）方便後續處理\n4. 建立例外層級（OrderError → InsufficientStockError）方便分層捕捉\n\n這讓 except OrderError 能捕捉所有訂單相關錯誤，except InsufficientStockError 只捕捉庫存不足。",
                            frameworkTip: "面試時展示自定義例外層級（而非用通用的 ValueError），說明「可以用 except 父類別捕捉所有子類別」，這展示你理解 Python 的例外繼承機制。",
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
                    name: "try/except 與防禦式程式",
                    description: "多重 except、raise、finally",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本 try/except",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪段程式碼最正確？",
                            scenario: 
                            Challenge.Scenario(
                                title: "安全的型態轉換",
                                narrative: "你要把使用者輸入轉成整數，但使用者可能輸入非數字。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "try:\n    num = int(input(\"數字：\"))\nexcept:\n    print(\"錯誤\")", explanation: "裸 except 會捕捉所有錯誤（包括 KeyboardInterrupt），太廣了。"),
                                Challenge.Option(id: "B", text: "try:\n    num = int(input(\"數字：\"))\nexcept ValueError:\n    print(\"請輸入有效的數字\")", explanation: "正確！只捕捉 ValueError（int() 轉換失敗），其他錯誤正常拋出。"),
                                Challenge.Option(id: "C", text: "num = int(input(\"數字：\")) or 0", explanation: "or 不能防止 ValueError。如果 int() 失敗，程式直接崩潰。"),
                                Challenge.Option(id: "D", text: "if input(\"數字：\").isdigit():\n    num = int(input(\"數字：\"))", explanation: "呼叫了兩次 input()，使用者要輸入兩次。邏輯有問題。"),
                            ],
                            correctAnswer: "B",
                            hints: ["永遠指定具體的 exception 類型，不要用裸 except"],
                            explanation: "try/except 最佳實踐：(1) 只包裹可能出錯的最小程式碼 (2) 指定具體的 exception 類型 (3) 給有意義的錯誤訊息。",
                            frameworkTip: "黃金規則：catch specific exceptions。裸 except 是反模式（anti-pattern）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "raise 自定義例外",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如何在 age < 0 時拋出有意義的錯誤？",
                            scenario: 
                            Challenge.Scenario(
                                title: "主動拋出例外",
                                narrative: "你寫了一個函式，要求 age 必須 >= 0。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "return \"error\"", explanation: "回傳字串不是正確的錯誤處理方式，呼叫者可能忽略。"),
                                Challenge.Option(id: "B", text: "raise ValueError(f\"age 不能為負數：{age}\")", explanation: "正確！raise 主動拋出例外，ValueError 適合「值不合法」的情況。"),
                                Challenge.Option(id: "C", text: "print(\"age 不能為負數\")", explanation: "print 只是輸出，程式會繼續執行，不會阻止錯誤的值被使用。"),
                                Challenge.Option(id: "D", text: "exit(1)", explanation: "exit() 會終止整個程式。應該讓呼叫者決定如何處理錯誤。"),
                            ],
                            correctAnswer: "B",
                            hints: ["raise 讓函式把錯誤傳給呼叫者處理，而不是自己處理"],
                            explanation: "raise 主動拋出例外，讓呼叫者用 try/except 處理。這比回傳錯誤碼或 print 更清楚、更難被忽略。",
                            frameworkTip: "函式設計原則：檢查輸入有效性 → 無效就 raise → 讓呼叫者 try/except。"
                        ),
                        Challenge(
                            id: 3,
                            name: "安全的資料解析器",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 safe_parse(raw_data)，根據輸入類型回傳解析結果：\n- 如果是 dict，直接回傳\n- 如果是字串且能解析為 JSON，回傳解析後的 dict/list\n- 如果是逗號分隔的字串（不是 JSON），回傳 split 後的 list（每個元素 strip 空白）\n- 如果是 int 或 float，回傳 {\"value\": raw_data}\n- 其他情況 raise TypeError(\"Unsupported data type\")\n任何解析錯誤都應被捕捉並嘗試下一種方式。",
                            scenario: 
                            Challenge.Scenario(
                                title: "多格式資料解析",
                                narrative: "你的系統接收來自不同來源的資料，格式可能是 JSON 字串、逗號分隔字串、或數字。需要一個穩健的解析器。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 isinstance() 判斷型態", "字串先嘗試 json.loads()，JSONDecodeError 表示不是 JSON", "用 list comprehension + strip() 處理逗號分隔"],
                            explanation: "這題練習防禦性程式設計：用 isinstance 檢查型態、try/except 嘗試解析、以及多種資料格式的處理。實務上接收外部資料時，這種彈性解析器很實用。",
                            frameworkTip: "防禦性解析模式：先嘗試最嚴格的格式（JSON）→ 失敗退回寬鬆格式（CSV）→ 都不行就報錯。",
                            starterCode: """
                                import json

                                def safe_parse(raw_data):
                                    # 判斷輸入類型並解析
                                    # 注意：字串要先嘗試 JSON，失敗再當逗號分隔
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
                            name: "@timer 裝飾器",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個 @timer 裝飾器，測量被裝飾函式的執行時間：\n- 用 time.time() 計算開始和結束時間\n- 印出 \"{函式名稱} took {秒數:.4f}s\"\n- 回傳原函式的回傳值\n- 用 functools.wraps 保留原函式的 metadata\n\n範例：\n@timer\ndef slow_add(a, b):\n    time.sleep(0.1)\n    return a + b\n\nresult = slow_add(1, 2)  # 印出 \"slow_add took 0.10xxs\"\nprint(result)  # 3",
                            scenario: 
                            Challenge.Scenario(
                                title: "裝飾器三經典之一：計時器",
                                narrative: "Meta 面試中，裝飾器（Decorator）是必考題。面試官請你寫一個 @timer 裝飾器來測量函式執行時間。這是最基礎的裝飾器應用，也是理解進階裝飾器的起點。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["裝飾器是一個接受函式、回傳函式的函式", "wrapper 要用 *args, **kwargs 接受任意參數", "functools.wraps(func) 保留原函式的 __name__ 等屬性", "不要忘記 return result"],
                            explanation: "裝飾器的本質是：\n@timer\ndef f(): ... \n等同於 f = timer(f)\n\n結構：\n1. timer(func) 接受原函式\n2. 定義 wrapper(*args, **kwargs) 包裝邏輯\n3. wrapper 內部呼叫 func(*args, **kwargs)\n4. 回傳 wrapper\n\nfunctools.wraps 很重要，沒有它 f.__name__ 會變成 \"wrapper\"，debug 時會很困擾。",
                            frameworkTip: "面試時寫裝飾器，一定要記得 @functools.wraps 和 return result。這兩個常見錯誤是面試官特別會注意的細節。",
                            starterCode: """
                                import time
                                import functools

                                def timer(func):
                                    # 寫一個 wrapper 函式
                                    # 記錄開始時間 → 執行原函式 → 記錄結束時間 → 印出耗時
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
                            name: "@retry 裝飾器",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個 @retry(max_attempts=3) 裝飾器：\n- 如果函式拋出例外，自動重試最多 max_attempts 次\n- 每次重試之間等待 1 秒（用 time.sleep）\n- 如果所有重試都失敗，拋出最後一次的例外\n- 用 functools.wraps 保留 metadata\n\n範例：\n@retry(max_attempts=3)\ndef unstable_api():\n    import random\n    if random.random() < 0.7:\n        raise ConnectionError(\"API timeout\")\n    return \"success\"",
                            scenario: 
                            Challenge.Scenario(
                                title: "裝飾器三經典之二：自動重試",
                                narrative: "你在 Meta 的基礎設施團隊，API 呼叫偶爾會因為網路不穩定而失敗。你需要寫一個 @retry 裝飾器，讓函式在失敗時自動重試。這在微服務架構中是不可或缺的防禦機制。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["帶參數的裝飾器需要三層：retry(params) → decorator(func) → wrapper(*args, **kwargs)", "用 for loop 控制重試次數", "用 try/except 捕捉例外，最後一次失敗時 raise", "最後一次重試後不需要 sleep"],
                            explanation: "帶參數的裝飾器有三層：\n1. retry(max_attempts) — 接受裝飾器的參數\n2. decorator(func) — 接受被裝飾的函式\n3. wrapper(*args, **kwargs) — 實際的包裝邏輯\n\n@retry(max_attempts=3) 等同於：\ndecorator = retry(max_attempts=3)\nf = decorator(f)\n\n重試模式在生產環境中極為常見，特別是處理網路請求、資料庫連線等不穩定操作。",
                            frameworkTip: "面試時寫出帶參數的裝飾器（三層巢狀），是 Python 中高級能力的標誌。如果還能提到「指數退避」（exponential backoff）策略，會額外加分。",
                            starterCode: """
                                import time
                                import functools

                                def retry(max_attempts=3):
                                    # 注意：這是一個「帶參數的裝飾器」
                                    # 需要三層巢狀函式
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
                            name: "Memoization 概念",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下關於 memoization 的描述，哪一個是正確的？\n\n```python\nfrom functools import lru_cache\n\n@lru_cache(maxsize=128)\ndef fib(n):\n    if n < 2:\n        return n\n    return fib(n-1) + fib(n-2)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "記憶化（Memoization）加速遞迴",
                                narrative: "Meta 面試中，面試官給你一個遞迴的費氏數列函式，問你為什麼執行 fib(40) 要等很久。你需要解釋 memoization 的概念，以及 Python 內建的解決方案。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "@lru_cache 會將函式的結果存在資料庫中，永久保存", explanation: "lru_cache 是存在記憶體中，程式結束後就消失了。"),
                                Challenge.Option(id: "B", text: "@lru_cache 將 fib(40) 從 O(2^n) 優化到 O(n)，因為每個 fib(k) 只計算一次，結果被快取在記憶體中", explanation: "正確！沒有 cache 時，fib(40) 會重複計算超過 10 億次。有了 cache，fib(0) 到 fib(40) 各只算一次，總共 41 次計算。"),
                                Challenge.Option(id: "C", text: "maxsize=128 表示最多快取 128 秒的計算結果", explanation: "maxsize 是快取的「條目數量」，不是時間。超過 128 個不同的輸入時，最久沒用的會被移除（LRU = Least Recently Used）。"),
                                Challenge.Option(id: "D", text: "@lru_cache 只能用在遞迴函式上，一般函式不能用", explanation: "lru_cache 可以用在任何純函式上，只要輸入是 hashable 的（不能是 list 或 dict）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Memoization = 記住已經算過的結果，避免重複計算", "LRU = Least Recently Used，最近最少使用的會被移除", "關鍵限制：函式參數必須是 hashable 的"],
                            explanation: "Memoization（記憶化）的核心思想：\n- 用空間換時間，快取函式結果\n- Python 內建 @functools.lru_cache\n- fib(40) 從 O(2^n) ≈ 10 億次 → O(n) = 40 次\n\n使用限制：\n1. 函式必須是純函式（相同輸入 → 相同輸出）\n2. 參數必須是 hashable（不能傳 list 或 dict）\n3. maxsize=None 表示無限快取，maxsize=128 是預設值",
                            frameworkTip: "面試時先解釋為什麼遞迴 fib 慢（重複子問題），再提出 memoization 解法，最後提到 Python 的 @lru_cache。這展示了從問題分析到解決方案的完整思路。"
                        ),
                    ]
                ),
                Quest(
                    id: "17-6",
                    name: "資料驗證函式組（Boss）",
                    description: "設計一組驗證使用者輸入的函式",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 設計資料驗證器",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "使用者註冊驗證",
                                narrative: "你要為一個使用者註冊表單寫驗證函式。需要驗證：\n- 使用者名：3-20 字元，只能含字母和數字\n- Email：必須包含 @ 和 .\n- 年齡：18-120 的整數\n- 密碼：至少 8 字元，至少含一個大寫字母和一個數字",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["每個函式回傳 (bool, str) 讓呼叫者知道是否合法以及為什麼不合法", "用 any() 配合 generator 檢查密碼條件"],
                            explanation: "好的驗證函式設計：(1) 每個函式只負責一種驗證 (2) 統一的回傳格式 (3) 具體的錯誤訊息 (4) 整合函式收集所有錯誤。",
                            frameworkTip: "驗證設計模式：每個欄位一個函式 → 統一回傳格式 → 整合函式收集所有錯誤。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 18,
            name: "模組、檔案與物件導向",
            emoji: "📦",
            description: "import、pip、檔案讀寫、class 與 OOP 基礎",
            quests: [
                Quest(
                    id: "18-1",
                    name: "import 與標準函式庫",
                    description: "認識 import、from、as 和常用標準庫",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "import 語法",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪種 import 方式最推薦？",
                            scenario: 
                            Challenge.Scenario(
                                title: "匯入模組",
                                narrative: "你想使用 datetime 模組取得今天的日期。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "from datetime import *", explanation: "import * 會把所有名稱倒進命名空間，容易衝突，不推薦。"),
                                Challenge.Option(id: "B", text: "from datetime import datetime", explanation: "正確！只匯入需要的類別，清楚明確。"),
                                Challenge.Option(id: "C", text: "import datetime as dt", explanation: "也可以，但如果只需要 datetime 類別，from import 更直接。"),
                                Challenge.Option(id: "D", text: "require(\"datetime\")", explanation: "require 是 JavaScript/Node.js 的語法，Python 用 import。"),
                            ],
                            correctAnswer: "B",
                            hints: ["from X import Y 只匯入需要的部分，比 import * 更清楚"],
                            explanation: "import 三種方式：import module（全部匯入）、from module import name（部分匯入）、import module as alias（別名）。PEP 8 不推薦 import *。",
                            frameworkTip: "import 最佳實踐：標準庫 → 第三方 → 自己的模組，每組之間空一行。"
                        ),
                        Challenge(
                            id: 2,
                            name: "常用標準庫",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "應該用哪個標準庫？",
                            scenario: 
                            Challenge.Scenario(
                                title: "標準函式庫",
                                narrative: "你需要產生一個 1-100 的隨機數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "import math", explanation: "math 是數學運算（三角函數、對數等），不是隨機數。"),
                                Challenge.Option(id: "B", text: "import random", explanation: "正確！random.randint(1, 100) 產生 1-100 的隨機整數。"),
                                Challenge.Option(id: "C", text: "import os", explanation: "os 是作業系統操作（檔案路徑、環境變數等）。"),
                                Challenge.Option(id: "D", text: "import sys", explanation: "sys 是 Python 解釋器操作（命令列引數、路徑等）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["random 模組提供各種隨機數生成功能"],
                            explanation: "常用標準庫：os（檔案系統）、datetime（日期時間）、json（JSON 處理）、random（隨機數）、math（數學）、pathlib（路徑）、csv（CSV 檔案）。",
                            frameworkTip: "標準庫是寶藏！先找標準庫有沒有，再考慮第三方套件。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Counter 詞頻統計",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 top_keywords(reviews, n)，接收一個評論字串 list 和數字 n，回傳出現次數最多的前 n 個單字及其次數。單字全部轉小寫，忽略大小寫差異。\n\n範例：\n```python\nreviews = [\"Great battery life\", \"Battery is amazing\", \"great screen\"]\ntop_keywords(reviews, 2)\n# → [(\"battery\", 2), (\"great\", 2)]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "商品評論關鍵字分析",
                                narrative: "你在 Amazon 的商品分析團隊，需要快速找出顧客評論中出現最頻繁的關鍵字，以了解使用者最常抱怨或稱讚的面向。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 str.lower().split() 拆解每則評論", "Counter 可以直接傳入 list 來統計", "Counter.most_common(n) 回傳前 n 個最頻繁的 (元素, 次數) tuple"],
                            explanation: "collections.Counter 是 Python 最實用的計數工具：\n- Counter(iterable) 自動統計每個元素出現的次數\n- .most_common(n) 回傳前 n 個最頻繁的元素\n- 底層是 dict 的子類別，支援所有 dict 操作\n\n這在文本分析、日誌統計等場景中非常常用。",
                            frameworkTip: "Amazon 面試非常喜歡考 Counter，尤其是 Top K 頻率問題。記住 Counter.most_common(n) 的時間複雜度是 O(n log k)，比自己排序更高效。",
                            starterCode: """
                                from collections import Counter

                                def top_keywords(reviews, n):
                                    # 1. 把所有評論拆成單字，全部轉小寫
                                    # 2. 用 Counter 統計詞頻
                                    # 3. 回傳前 n 個最常出現的
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
                            name: "defaultdict 資料分組",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 group_orders(orders)，接收一個訂單 list（每個訂單是 (category, product) tuple），回傳一個 dict，key 是類別，value 是該類別所有商品的 list。\n\n範例：\n```python\norders = [(\"電子\", \"手機\"), (\"服飾\", \"T恤\"), (\"電子\", \"耳機\"), (\"服飾\", \"外套\")]\ngroup_orders(orders)\n# → {\"電子\": [\"手機\", \"耳機\"], \"服飾\": [\"T恤\", \"外套\"]}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂單按類別分組",
                                narrative: "你在處理電商平台的訂單資料，需要把訂單按商品類別分組。用普通 dict 要先檢查 key 是否存在，但 defaultdict 可以讓程式碼更簡潔。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["defaultdict(list) 讓每個新 key 自動初始化為空 list", "直接 grouped[key].append(value)，不需要先檢查 key 是否存在", "最後用 dict() 轉回普通 dict"],
                            explanation: "defaultdict 的核心價值是省去「先檢查 key 是否存在」的步驟：\n\n普通 dict 寫法：\nif key not in d:\n    d[key] = []\nd[key].append(value)\n\ndefaultdict 寫法：\nd[key].append(value)  # 自動初始化\n\n常見的 factory function：list, int, set, lambda: default_value",
                            frameworkTip: "Amazon 面試中分組問題幾乎必出。用 defaultdict 比 dict.setdefault() 更 Pythonic，也比手動初始化更簡潔。面試時主動提到 defaultdict 會加分。",
                            starterCode: """
                                from collections import defaultdict

                                def group_orders(orders):
                                    # 用 defaultdict(list) 來自動初始化空 list
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
                    name: "pip 與第三方套件",
                    description: "pip install、requirements.txt、venv",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "pip 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的安裝指令是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "安裝套件",
                                narrative: "你要安裝 requests 套件來呼叫 API。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "python install requests", explanation: "Python 不是套件管理器，要用 pip。"),
                                Challenge.Option(id: "B", text: "pip install requests", explanation: "正確！pip 是 Python 的套件管理器。"),
                                Challenge.Option(id: "C", text: "npm install requests", explanation: "npm 是 JavaScript 的套件管理器。"),
                                Challenge.Option(id: "D", text: "import requests", explanation: "import 是在程式碼中使用，不是安裝。要先安裝才能 import。"),
                            ],
                            correctAnswer: "B",
                            hints: ["pip = Python 的套件管理器"],
                            explanation: "pip install 安裝套件，pip freeze > requirements.txt 匯出依賴清單。團隊協作時共享 requirements.txt 確保環境一致。",
                            frameworkTip: "新專案第一步：建 venv → pip install → pip freeze > requirements.txt。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Virtual Environment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如何解決版本衝突？",
                            scenario: 
                            Challenge.Scenario(
                                title: "為什麼要用 venv",
                                narrative: "專案 A 需要 requests 2.x，專案 B 需要 requests 3.x。兩個裝在同一台電腦上。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "每次切換專案就重新安裝對的版本", explanation: "太麻煩且容易出錯。"),
                                Challenge.Option(id: "B", text: "用 venv 為每個專案建立獨立的虛擬環境", explanation: "正確！venv 建立隔離的 Python 環境，每個專案有自己的套件版本。"),
                                Challenge.Option(id: "C", text: "用 Docker", explanation: "Docker 可以但太重。對 Python 專案來說 venv 就夠了。"),
                                Challenge.Option(id: "D", text: "不同版本改不同名字 import", explanation: "不實際，套件的內部依賴也可能衝突。"),
                            ],
                            correctAnswer: "B",
                            hints: ["venv = 每個專案一個獨立的 Python 環境"],
                            explanation: "python -m venv .venv 建立虛擬環境。source .venv/bin/activate 啟用（Mac/Linux）。每個專案獨立的套件不互相干擾。",
                            frameworkTip: "專案隔離是基本功：venv 隔離 Python 套件，.env 隔離環境變數。"
                        ),
                        Challenge(
                            id: 3,
                            name: "虛擬環境管理",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "關於 Python 虛擬環境，以下哪個說法是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "venv vs conda 選擇",
                                narrative: "你加入一個數據分析團隊，前任工程師離職前沒留文件。你發現專案裡同時有 environment.yml 和 requirements.txt，需要釐清該用哪個工具管理環境。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "venv 可以管理不同版本的 Python 直譯器，conda 只能管理套件", explanation: "正好相反！venv 只能用當前 Python 版本建立環境，conda 可以指定不同 Python 版本。"),
                                Challenge.Option(id: "B", text: "conda 可以同時管理 Python 版本和非 Python 的系統依賴（如 CUDA、MKL），venv 只管理 Python 套件", explanation: "正確！conda 是跨語言的套件管理器，能安裝 C/C++ library、CUDA toolkit 等；venv 是 Python 內建的，只管理 Python 套件。"),
                                Challenge.Option(id: "C", text: "venv 和 conda 功能完全相同，選哪個都一樣", explanation: "venv 是輕量級的 Python 內建工具，conda 是完整的套件和環境管理系統，功能差異很大。"),
                                Challenge.Option(id: "D", text: "正式專案中不應該使用虛擬環境，直接安裝在系統 Python 更穩定", explanation: "不使用虛擬環境會導致不同專案間的套件版本衝突，這是非常不好的實踐。"),
                            ],
                            correctAnswer: "B",
                            hints: ["想想哪個工具能處理非 Python 的依賴", "venv 是 Python 標準函式庫的一部分", "conda 來自 Anaconda 生態系"],
                            explanation: "venv vs conda 的核心差異：\n\nvenv（Python 內建）：\n- 輕量、快速、不需額外安裝\n- 只管理 Python 套件\n- 適合純 Python 專案\n\nconda（Anaconda/Miniconda）：\n- 可管理 Python 版本 + 非 Python 依賴\n- 適合數據科學（需要 CUDA、MKL 等）\n- 有自己的套件倉庫 conda-forge",
                            frameworkTip: "實務中的選擇原則：Web 開發用 venv + pip，數據科學用 conda。面試時展示你知道兩者差異，說明你有實際專案經驗。"
                        ),
                        Challenge(
                            id: 4,
                            name: "requirements.txt 最佳實踐",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪種 requirements.txt 的版本指定方式對正式環境（production）來說最安全？",
                            scenario: 
                            Challenge.Scenario(
                                title: "套件版本鎖定的重要性",
                                narrative: "你的團隊部署了一個 Flask API 到正式環境，但發現 requirements.txt 裡寫的是 flask>=2.0。某天 Flask 3.0 發佈了一個 breaking change，導致正式環境爆掉。你要釐清正確的版本管理方式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "flask\nrequests\npandas", explanation: "不指定版本等於「裝最新版」，每次部署可能裝到不同版本，非常危險。"),
                                Challenge.Option(id: "B", text: "flask>=2.0\nrequests>=2.28\npandas>=1.5", explanation: "只設下限，新的 major version 可能有 breaking change，正式環境不夠安全。"),
                                Challenge.Option(id: "C", text: "flask==3.0.2\nrequests==2.31.0\npandas==2.1.4", explanation: "正確！用 == 鎖定精確版本（pinning），確保每次部署都安裝完全相同的版本。搭配 pip freeze > requirements.txt 生成。"),
                                Challenge.Option(id: "D", text: "flask~=3.0\nrequests~=2.31\npandas~=2.1", explanation: "~= 允許 patch 版本更新（如 3.0.x），在開發環境還行，但正式環境仍有風險。"),
                            ],
                            correctAnswer: "C",
                            hints: ["正式環境最重要的是「可重現性」", "pip freeze 會列出所有已安裝套件的精確版本", "== 是最嚴格的版本指定方式"],
                            explanation: "版本指定策略：\n- 開發階段：用 ~=（相容版本）或 >=,<（範圍）保持靈活\n- 正式部署：用 == 鎖定精確版本\n- 生成方式：pip freeze > requirements.txt\n\n進階工具：pip-compile（pip-tools）可以自動解析依賴並鎖定版本，類似 npm 的 package-lock.json。",
                            frameworkTip: "面試時提到 pip freeze 搭配精確版本鎖定，展示你有正式環境部署經驗。進一步提到 pip-tools 或 Poetry 會讓面試官印象深刻。"
                        ),
                    ]
                ),
                Quest(
                    id: "18-3",
                    name: "檔案讀寫 txt/csv",
                    description: "open()、with、csv 模組",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "with open 語法",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪種方式最推薦？",
                            scenario: 
                            Challenge.Scenario(
                                title: "讀取檔案",
                                narrative: "你想讀取 data.txt 的全部內容。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "f = open(\"data.txt\")\ndata = f.read()\nf.close()", explanation: "可以，但如果中間出錯，f.close() 不會被呼叫，導致資源洩漏。"),
                                Challenge.Option(id: "B", text: "with open(\"data.txt\") as f:\n    data = f.read()", explanation: "正確！with 語句自動處理 close()，即使出錯也會正確關閉檔案。"),
                                Challenge.Option(id: "C", text: "data = open(\"data.txt\").read()", explanation: "沒有 close()，檔案不會被正確關閉。"),
                                Challenge.Option(id: "D", text: "import file\ndata = file.read(\"data.txt\")", explanation: "Python 沒有 file 模組。用內建的 open()。"),
                            ],
                            correctAnswer: "B",
                            hints: ["with 語句 = 自動資源管理（context manager），確保檔案會被關閉"],
                            explanation: "with open() as f: 是 Python 讀寫檔案的標準模式。with 結束時自動 close()，不管是否出錯。",
                            frameworkTip: "所有需要 close() 的資源都應該用 with 管理：檔案、資料庫連線、網路連線。"
                        ),
                        Challenge(
                            id: 2,
                            name: "CSV 讀取",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "應該用哪個類別？",
                            scenario: 
                            Challenge.Scenario(
                                title: "讀取 CSV",
                                narrative: "你有一個 sales.csv 檔案，想把每一行讀成 dict。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "csv.reader — 回傳每行是 list", explanation: "csv.reader 回傳 list of list，沒有欄位名。"),
                                Challenge.Option(id: "B", text: "csv.DictReader — 回傳每行是 dict", explanation: "正確！DictReader 用第一行作 key，每行變成 dict，存取更方便。"),
                                Challenge.Option(id: "C", text: "json.load — 通用讀取", explanation: "json.load 是讀 JSON 不是 CSV。"),
                                Challenge.Option(id: "D", text: "pandas.read_csv — pandas 比較好", explanation: "pandas 功能更強，但如果只是簡單讀取，csv 模組更輕量。"),
                            ],
                            correctAnswer: "B",
                            hints: ["DictReader 讓你用 row[\"column_name\"] 存取，比 row[0] 更直覺"],
                            explanation: "csv.DictReader 用第一行作 key，回傳 dict。適合結構化的 CSV。csv.reader 回傳 list，適合簡單的資料。",
                            frameworkTip: "小檔案用 csv 模組，大檔案或需要分析用 pandas。選擇工具的原則：夠用就好。"
                        ),
                        Challenge(
                            id: 3,
                            name: "讀取 CSV 並統計",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 parse_csv_sales(csv_string)，接收 CSV 格式的字串（第一行是 header：department,product,amount），回傳一個 dict，key 是部門名，value 是該部門的總 amount。用 csv 模組的 DictReader 和 io.StringIO 解析字串。",
                            scenario: 
                            Challenge.Scenario(
                                title: "CSV 銷售統計",
                                narrative: "你收到一個 CSV 格式的字串（模擬檔案內容），需要解析並統計每個部門的總銷售額。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["io.StringIO(s) 把字串變成 file-like 物件，可以傳給 csv.DictReader", "CSV 讀出來的值都是字串，amount 要轉 float", "用 dict.get(key, 0) 安全累加"],
                            explanation: "這題練習 csv.DictReader 搭配 io.StringIO（在記憶體中模擬檔案）、型態轉換、dict 累加。這個模式在處理 API 回傳的 CSV 資料時很實用。",
                            frameworkTip: "io.StringIO 讓你不需要實際檔案就能測試 CSV 解析。是寫測試時的好幫手。",
                            starterCode: """
                                import csv
                                import io

                                def parse_csv_sales(csv_string):
                                    # 用 io.StringIO 把字串變成 file-like 物件
                                    # 用 csv.DictReader 讀取
                                    # 統計每個 department 的 amount 總和
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
                            name: "大型 CSV 逐行處理",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 sum_column(filepath, column_name)，用逐行讀取的方式計算 CSV 中指定欄位的總和，不將整個檔案載入記憶體。\n\n假設 CSV 第一行是標題列，指定欄位的值都是數字。\n\n範例 CSV 內容：\n```\norder_id,amount,category\n1,250.5,電子\n2,89.9,服飾\n3,1200.0,電子\n```\nsum_column(\"orders.csv\", \"amount\") → 1540.4",
                            scenario: 
                            Challenge.Scenario(
                                title: "處理 10GB 的交易記錄",
                                narrative: "你在 Amazon 的數據團隊，需要處理一個 10GB 的交易記錄 CSV 檔案。直接用 pandas.read_csv() 會把整個檔案載入記憶體，導致 MemoryError。你需要用記憶體效率更高的方式處理。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["csv.DictReader 會自動用第一行作為 key", "for row in reader 是逐行讀取，記憶體中同一時間只有一行", "記得把字串轉成 float"],
                            explanation: "處理大檔案的核心原則是「逐行處理」而非「全部載入」：\n\n記憶體爆炸寫法：\ndf = pd.read_csv(\"big.csv\")  # 10GB 全載入\n\n記憶體友善寫法：\nwith open(\"big.csv\") as f:\n    reader = csv.DictReader(f)\n    for row in reader:  # 一次只處理一行\n        ...\n\npandas 也有 chunksize 參數可以分批讀取：\nfor chunk in pd.read_csv(\"big.csv\", chunksize=10000):\n    ...",
                            frameworkTip: "Amazon 面試非常看重記憶體效率。當面試官說「檔案很大」，立刻想到逐行處理或 generator。提到 csv.DictReader 和 pandas chunksize 兩種方案會展示你的全面性。",
                            starterCode: """
                                import csv

                                def sum_column(filepath, column_name):
                                    # 用 csv.DictReader 逐行讀取
                                    # 不要一次載入整個檔案
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
                            name: "編碼處理 encoding",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "讀取一個可能是 Shift-JIS 編碼的 CSV 檔案，以下哪個方法最穩健？",
                            scenario: 
                            Challenge.Scenario(
                                title: "亂碼危機",
                                narrative: "你收到一份來自日本供應商的 CSV 檔案，用 Python 讀取時出現 UnicodeDecodeError。你需要理解檔案編碼的概念來解決這個問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "open(\"data.csv\", \"r\") 不指定 encoding", explanation: "不指定 encoding 會使用系統預設編碼（通常是 UTF-8 或系統 locale），遇到非 UTF-8 編碼的檔案會報錯。"),
                                Challenge.Option(id: "B", text: "open(\"data.csv\", \"r\", encoding=\"utf-8\", errors=\"ignore\")", explanation: "errors=\"ignore\" 會靜默地丟掉無法解碼的字元，導致資料遺失，這在資料處理中很危險。"),
                                Challenge.Option(id: "C", text: "先用 chardet 或 charset-normalizer 偵測編碼，再用偵測到的編碼開啟檔案", explanation: "正確！先偵測再讀取是最穩健的做法。chardet.detect() 會回傳偵測到的編碼和信心度，讓你確認後再用正確的編碼讀取。"),
                                Challenge.Option(id: "D", text: "用 binary mode open(\"data.csv\", \"rb\") 讀取，避免所有編碼問題", explanation: "binary mode 讀到的是 bytes 不是 str，還是需要 decode 才能處理文字內容。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Python 3 的 str 是 Unicode，讀取時需要正確的 encoding 才能解碼", "chardet 是一個可以自動偵測檔案編碼的套件", "用錯誤的編碼讀取會得到亂碼或報錯"],
                            explanation: "處理未知編碼檔案的最佳實踐：\n\n```python\nimport chardet\n\n# 1. 偵測編碼\nwith open(\"data.csv\", \"rb\") as f:\n    result = chardet.detect(f.read())\n    encoding = result[\"encoding\"]  # 如 \"Shift_JIS\"\n\n# 2. 用正確的編碼讀取\nwith open(\"data.csv\", \"r\", encoding=encoding) as f:\n    content = f.read()\n```\n\n常見編碼：UTF-8（萬用）、Big5（繁體中文）、Shift-JIS（日文）、GBK（簡體中文）。",
                            frameworkTip: "面試中遇到檔案處理問題，主動提到 encoding 處理展示你有實務經驗。特別是處理多語言資料時，編碼問題是最常見的 bug 來源之一。"
                        ),
                    ]
                ),
                Quest(
                    id: "18-4",
                    name: "JSON 讀寫",
                    description: "json.load/dump、巢狀結構",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "JSON 操作",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "JSON 讀寫",
                                narrative: "你要把一個 dict 寫入 JSON 檔案。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "with open(\"data.json\", \"w\") as f:\n    json.dump(data, f)", explanation: "正確！json.dump() 把 Python 物件寫入檔案。"),
                                Challenge.Option(id: "B", text: "with open(\"data.json\", \"w\") as f:\n    f.write(data)", explanation: "data 是 dict，不能直接 write。要先轉成 JSON 字串。"),
                                Challenge.Option(id: "C", text: "json.save(data, \"data.json\")", explanation: "json 模組沒有 save() 函式。是 dump()。"),
                                Challenge.Option(id: "D", text: "with open(\"data.json\") as f:\n    json.dump(data, f)", explanation: "少了 \"w\" 模式。預設是 \"r\"（讀取），寫入要用 \"w\"。"),
                            ],
                            correctAnswer: "A",
                            hints: ["json.dump(物件, 檔案) 寫入檔案，json.dumps(物件) 轉成字串"],
                            explanation: "json 四個核心函式：load（檔案→Python）、loads（字串→Python）、dump（Python→檔案）、dumps（Python→字串）。",
                            frameworkTip: "記憶法：load/dump 是檔案操作，加 s 是字串操作。s = string。"
                        ),
                        Challenge(
                            id: 2,
                            name: "巢狀 JSON 存取",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如何取得 Alice 的第二個分數？",
                            scenario: 
                            Challenge.Scenario(
                                title: "巢狀結構",
                                narrative: "你有一個 JSON：\ndata = {\"users\": [{\"name\": \"Alice\", \"scores\": [90, 85, 92]}]}",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "data.users[0].scores[1]", explanation: "Python dict 不能用點語法存取。要用 [\"key\"]。"),
                                Challenge.Option(id: "B", text: "data[\"users\"][0][\"scores\"][1]", explanation: "正確！逐層用 [\"key\"] 和 [index] 存取巢狀結構。"),
                                Challenge.Option(id: "C", text: "data.get(\"users.0.scores.1\")", explanation: ".get() 不支援巢狀路徑語法。"),
                                Challenge.Option(id: "D", text: "data[\"users\"][\"scores\"][1]", explanation: "缺少 [0]。users 是一個 list，要先指定索引。"),
                            ],
                            correctAnswer: "B",
                            hints: ["dict 用 [\"key\"]，list 用 [index]，一層一層存取"],
                            explanation: "巢狀 JSON 存取：dict 用 [\"key\"]，list 用 [index]。安全存取可以用 try/except 或逐層 .get()。",
                            frameworkTip: "處理巢狀 JSON 時，先印出結構（json.dumps(data, indent=2)）搞清楚層級。"
                        ),
                        Challenge(
                            id: 3,
                            name: "JSON 資料轉換器",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 transform_api_data(api_response)，接收一個 dict（API 回應），格式：\n{\"results\": [{\"user_name\": \"alice_chen\", \"total_score\": 95, \"is_active\": true}]}\n轉換成你的系統格式：\n[{\"name\": \"Alice Chen\", \"score\": 95, \"status\": \"active\"}]\n規則：\n- user_name 用底線分割，每個字首字母大寫，用空格合併\n- total_score 改名為 score\n- is_active 為 true 則 status = \"active\"，否則 \"inactive\"\n- 如果 results 不存在，回傳空 list",
                            scenario: 
                            Challenge.Scenario(
                                title: "API 資料轉換",
                                narrative: "你從 API 拿到的 JSON 格式和你的系統不同，需要轉換。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: [".get(\"results\", []) 安全取值", "split(\"_\") 切割 + capitalize() 首字母大寫 + \" \".join() 合併", "三元運算式：x if condition else y"],
                            explanation: "這題練習 JSON/dict 資料轉換：安全取值（.get）、字串處理（split/capitalize/join）、條件表達式、以及建構新的 dict。API 資料轉換是後端開發的日常。",
                            frameworkTip: "API 資料轉換模式：取出 → 映射欄位 → 轉換值 → 組裝新結構。",
                            starterCode: """
                                def transform_api_data(api_response):
                                    # 取出 results（可能不存在）
                                    # 轉換每筆資料的格式
                                    # 回傳轉換後的 list
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
                            name: "巢狀 JSON 扁平化",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 flatten_dict(d, parent_key=\"\", sep=\".\")，把巢狀的 dict 攤平成一層，用 \".\" 連接 key。\n\n範例：\n```python\ndata = {\n    \"user\": {\n        \"name\": \"Alice\",\n        \"address\": {\n            \"city\": \"Taipei\",\n            \"zip\": \"100\"\n        }\n    },\n    \"active\": True\n}\nflatten_dict(data)\n# → {\"user.name\": \"Alice\", \"user.address.city\": \"Taipei\", \"user.address.zip\": \"100\", \"active\": True}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "將複雜 API 回應轉成表格",
                                narrative: "你從第三方 API 取得了深度巢狀的 JSON 資料，需要把它「攤平」成一層 dict，才能轉成 CSV 或存進資料庫的扁平化表格。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["這是一個遞迴問題：遇到 dict 值就繼續攤平", "用 parent_key 追蹤完整路徑", "isinstance(v, dict) 判斷是否需要繼續遞迴"],
                            explanation: "攤平巢狀 dict 是資料處理中極常見的操作：\n\n核心邏輯：\n1. 遍歷每個 key-value\n2. 如果 value 是 dict → 遞迴攤平，key 用 sep 連接\n3. 如果 value 不是 dict → 直接加入結果\n\n實務中也可以用 pandas.json_normalize() 來處理，但面試通常要求你手寫遞迴版本。",
                            frameworkTip: "HackerRank 和面試中 flatten dict 是高頻題。重點是展示遞迴思維和 base case 的處理。進階：考慮 list 中巢狀 dict 的情況。",
                            starterCode: """
                                def flatten_dict(d, parent_key="", sep="."):
                                    # 用遞迴處理巢狀結構
                                    # 如果值是 dict，繼續往下攤平
                                    # 否則直接加入結果
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
                            name: "API 回應解析與錯誤處理",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 safe_get(data, keys, default=None)，安全地從巢狀 dict 中取值。keys 是一個 key 路徑的 list，任何一層 key 不存在時回傳 default。\n\n範例：\n```python\nresponse = {\"data\": {\"weather\": {\"temp\": 25.5}}}\n\nsafe_get(response, [\"data\", \"weather\", \"temp\"])  # → 25.5\nsafe_get(response, [\"data\", \"wind\", \"speed\"])    # → None\nsafe_get(response, [\"data\", \"wind\", \"speed\"], 0) # → 0\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "安全地從 API 取得資料",
                                narrative: "你在串接一個天氣 API，但 API 回應的 JSON 結構不穩定——有時缺少某些欄位，有時 key 名稱不一致。你需要一個安全的解析函式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["逐層遍歷 keys list，每次往下一層", "用 isinstance(current, dict) 確保當前層是 dict", "任何一層找不到 key 就直接 return default"],
                            explanation: "安全取值是處理 API 回應的必備技巧：\n\n危險寫法（可能 KeyError）：\ntemp = response[\"data\"][\"weather\"][\"temp\"]\n\n安全寫法：\ntemp = safe_get(response, [\"data\", \"weather\", \"temp\"], 0)\n\nPython 3.8+ 也可以用 walrus operator 搭配 dict.get()：\nif (d := response.get(\"data\")) and (w := d.get(\"weather\")):\n    temp = w.get(\"temp\", 0)",
                            frameworkTip: "面試時展示你考慮到 API 回應不穩定的情況，展示防禦性程式設計思維。提到 try/except vs 主動檢查的取捨，會讓面試官知道你有實務經驗。",
                            starterCode: """
                                def safe_get(data, keys, default=None):
                                    # 逐層往下找
                                    # 任何一層出錯就回傳 default
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
                    name: "OOP 基礎 class",
                    description: "__init__、self、方法、屬性",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "class 定義",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的定義是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "第一個 class",
                                narrative: "你要定義一個 User 類別，每個使用者有 name 和 email。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class User:\n    def __init__(self, name, email):\n        self.name = name\n        self.email = email", explanation: "正確！__init__ 是建構子，self 是實例自身的參考。"),
                                Challenge.Option(id: "B", text: "class User:\n    name = \"\"\n    email = \"\"", explanation: "這是類別屬性（所有實例共享），不是實例屬性。每個使用者應該有自己的名字。"),
                                Challenge.Option(id: "C", text: "def User(name, email):\n    return {\"name\": name, \"email\": email}", explanation: "這是函式回傳 dict，不是 class。無法加方法和繼承。"),
                                Challenge.Option(id: "D", text: "class User:\n    def init(self, name, email):\n        self.name = name", explanation: "建構子必須叫 __init__（前後各兩個底線），不是 init。"),
                            ],
                            correctAnswer: "A",
                            hints: ["__init__ 是 Python 的建構子，self 是必要的第一個參數"],
                            explanation: "__init__ 在建立實例時自動呼叫。self 代表實例自身，Python 不像 Java 會自動綁定 this，必須顯式寫 self。",
                            frameworkTip: "Python class 三件事：__init__ 初始化、self 參考自身、方法的第一個參數永遠是 self。"
                        ),
                        Challenge(
                            id: 2,
                            name: "方法與屬性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新增方法",
                                narrative: "你想在 User class 加一個 greet() 方法。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class User:\n    def greet():\n        return f\"Hi, I am {name}\"", explanation: "方法必須有 self 參數，且用 self.name 存取屬性。"),
                                Challenge.Option(id: "B", text: "class User:\n    def greet(self):\n        return f\"Hi, I am {self.name}\"", explanation: "正確！方法的第一個參數是 self，透過 self.name 存取實例屬性。"),
                                Challenge.Option(id: "C", text: "class User:\n    greet = lambda: f\"Hi, I am {self.name}\"", explanation: "lambda 無法存取 self（除非作為參數），且不適合用在 class 方法上。"),
                                Challenge.Option(id: "D", text: "def User.greet(self):\n    return f\"Hi, I am {self.name}\"", explanation: "Python 不能用 class.method 的方式在外面定義方法。方法必須在 class 內部定義。"),
                            ],
                            correctAnswer: "B",
                            hints: ["class 方法的第一個參數永遠是 self"],
                            explanation: "實例方法必須有 self 作為第一個參數。透過 self 存取實例的屬性和其他方法。呼叫時不需要傳 self，Python 自動處理。",
                            frameworkTip: "記住：定義方法時寫 self，呼叫方法時不寫。user.greet() 而非 user.greet(user)。"
                        ),
                        Challenge(
                            id: 3,
                            name: "設計 Inventory 類別",
                            type: .code,
                            difficulty: .hard,
                            question: "設計一個 Inventory class：\n- __init__(self): 初始化空的 items dict\n- add_item(self, name, qty, price): 如果商品已存在就累加 qty，否則新增。price 以最新的為準。\n- remove_item(self, name, qty): 減少庫存。如果 qty 不夠，raise ValueError(\"Insufficient stock for {name}\")\n- get_value(self): 回傳庫存總價值（所有商品的 qty * price 之和）\n- get_summary(self): 回傳 list of dicts，每個 dict 有 name, qty, price, value，按 value 降序排列",
                            scenario: 
                            Challenge.Scenario(
                                title: "庫存管理系統",
                                narrative: "倉庫需要一個簡單的庫存管理系統來追蹤商品的進出貨。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 dict 的 dict 儲存：self.items = {\"Apple\": {\"qty\": 10, \"price\": 30}}", "庫存為 0 時可以刪除該 key", "sorted 的 key 參數可以用 lambda"],
                            explanation: "這題練習完整的 class 設計：__init__ 初始化、方法互相獨立、raise 錯誤處理、dict 嵌套操作、sorted + lambda 排序。這是 OOP 基礎的綜合練習。",
                            frameworkTip: "Class 設計原則：每個方法職責單一、狀態保存在 self 中、錯誤情況用 raise 處理。",
                            starterCode: """
                                class Inventory:
                                    def __init__(self):
                                        # 初始化 items dict
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
                            name: "dataclass vs 傳統 class",
                            type: .code,
                            difficulty: .medium,
                            question: "把以下傳統 class 改寫成 dataclass。dataclass 要自動產生 __init__、__repr__、__eq__，並加上一個自訂的 method。\n\n傳統寫法：\n```python\nclass Product:\n    def __init__(self, name, price, quantity=0):\n        self.name = name\n        self.price = price\n        self.quantity = quantity\n    \n    def total_value(self):\n        return self.price * self.quantity\n```\n\n請用 @dataclass 改寫，並加上 type hints。",
                            scenario: 
                            Challenge.Scenario(
                                title: "現代 Python 的資料類別",
                                narrative: "你在 Google 的 code review 中被要求把傳統的 class 改寫成 dataclass。Senior engineer 說「Python 3.7 以後，純資料類別應該用 @dataclass 裝飾器」。你需要理解為什麼。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["@dataclass 裝飾器會自動生成 __init__、__repr__、__eq__", "欄位定義用 name: type = default_value 格式", "自訂 method 照常寫在 class 裡面"],
                            explanation: "@dataclass 的優勢：\n\n1. 自動生成 __init__（不需手寫 self.x = x）\n2. 自動生成 __repr__（好看的字串表示）\n3. 自動生成 __eq__（值比較而非 identity 比較）\n4. 強制 type hints，程式碼更清楚\n5. 支援 frozen=True 建立不可變物件\n\n傳統 class 要手寫 15 行的程式碼，dataclass 只需 5 行。",
                            frameworkTip: "Google 面試中提到 dataclass 展示你熟悉現代 Python。記住 dataclass 是 Python 3.7+ 的功能，它不是要取代所有 class，而是取代「主要用來裝資料」的 class。",
                            starterCode: """
                                from dataclasses import dataclass

                                # 用 @dataclass 改寫 Product class
                                # 保留 total_value method
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
                            question: "以下程式碼的輸出是什麼？\n\n```python\nclass User:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n    \n    def __repr__(self):\n        return f\"User('{self.name}', {self.age})\"\n    \n    def __str__(self):\n        return f\"{self.name} ({self.age}歲)\"\n\nu = User(\"Alice\", 25)\nprint(str(u))\nprint(repr(u))\nprint([u])\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "物件的兩種字串表示",
                                narrative: "面試官問你：「Python 的 __repr__ 和 __str__ 有什麼差別？什麼時候用哪個？」這是 Google 考 OOP 基礎的經典題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Alice (25歲)\nUser('Alice', 25)\nUser('Alice', 25)", explanation: "接近正確，但 list 印出元素時用的是 __repr__，外面會加上 list 的方括號。"),
                                Challenge.Option(id: "B", text: "Alice (25歲)\nUser('Alice', 25)\n[User('Alice', 25)]", explanation: "正確！str() 呼叫 __str__，repr() 呼叫 __repr__。容器（list, dict）印出元素時使用 __repr__ 而非 __str__。"),
                                Challenge.Option(id: "C", text: "User('Alice', 25)\nUser('Alice', 25)\n[User('Alice', 25)]", explanation: "str(u) 會優先呼叫 __str__，只有在沒有定義 __str__ 時才 fallback 到 __repr__。"),
                                Challenge.Option(id: "D", text: "Alice (25歲)\nAlice (25歲)\n[Alice (25歲)]", explanation: "repr() 一定呼叫 __repr__，不會去找 __str__。而且 list 中的元素用 __repr__ 顯示。"),
                            ],
                            correctAnswer: "B",
                            hints: ["str() 呼叫 __str__，repr() 呼叫 __repr__", "如果只定義了 __repr__ 沒有 __str__，str() 會 fallback 到 __repr__", "list 印出元素時用 __repr__"],
                            explanation: "__repr__ vs __str__ 的關鍵差異：\n\n__repr__：給開發者看的，應該要「精確」，最好能 eval() 回來\n- 用途：debug、日誌、容器元素顯示\n- 呼叫方式：repr(obj)、在 REPL 直接打 obj\n\n__str__：給使用者看的，應該要「易讀」\n- 用途：print()、f-string、str()\n- 呼叫方式：str(obj)、print(obj)\n\n重要：如果只能實作一個，優先實作 __repr__，因為 __str__ 會 fallback 到 __repr__。",
                            frameworkTip: "Google 面試中提到「__repr__ 應該要能 eval() 回原物件」這個設計原則，展示你理解 Python 的設計哲學。記住：容器（list, dict）顯示元素時用 __repr__。"
                        ),
                    ]
                ),
                Quest(
                    id: "18-6",
                    name: "Config Reader（Boss）",
                    description: "設計一個讀取 JSON 設定檔的 class",
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
                                title: "設定檔管理器",
                                narrative: "你的團隊有一個 JSON 設定檔 config.json：\n{\n    \"app_name\": \"MyApp\",\n    \"version\": \"1.0.0\",\n    \"database\": {\n        \"host\": \"localhost\",\n        \"port\": 5432,\n        \"name\": \"mydb\"\n    },\n    \"features\": {\n        \"dark_mode\": true,\n        \"notifications\": false\n    }\n}\n\n你需要設計一個 ConfigReader class 來管理設定。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 split(\".\") 把 \"database.host\" 拆成 [\"database\", \"host\"]", "遍歷 keys 逐層深入 dict"],
                            explanation: "這個 class 整合了：OOP（class/init/self）、檔案讀寫（open/with）、JSON 操作、巢狀 dict 操作、錯誤處理。",
                            frameworkTip: "Class 設計原則：一個 class 做一件事。ConfigReader 只負責設定檔的 CRUD。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 19,
            name: "Pythonic 思維與資料處理",
            emoji: "🐼",
            description: "List comprehension、PEP 8、pandas 資料處理",
            quests: [
                Quest(
                    id: "19-1",
                    name: "List Comprehension",
                    description: "語法、條件篩選、巢狀",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "基本語法",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是正確的 list comprehension？",
                            scenario: 
                            Challenge.Scenario(
                                title: "List Comprehension",
                                narrative: "你有 nums = [1, 2, 3, 4, 5]，想產生每個元素的平方。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[x ** 2 for x in nums]", explanation: "正確！這是最基本的 list comprehension 語法：[表達式 for 變數 in 可迭代物件]。"),
                                Challenge.Option(id: "B", text: "[for x in nums: x ** 2]", explanation: "語法錯誤。表達式要放在 for 前面，且不用冒號。"),
                                Challenge.Option(id: "C", text: "nums.map(x => x ** 2)", explanation: "這是 JavaScript 語法，不是 Python。"),
                                Challenge.Option(id: "D", text: "[x ** 2 in nums]", explanation: "缺少 for 關鍵字。"),
                            ],
                            correctAnswer: "A",
                            hints: ["格式：[表達式 for 變數 in 可迭代物件]"],
                            explanation: "List comprehension 是 Python 最 Pythonic 的特色之一。比 for 迴圈 + append 更簡潔、更快。",
                            frameworkTip: "看到 for + append 模式就想到可以用 list comprehension 替代。"
                        ),
                        Challenge(
                            id: 2,
                            name: "帶條件的 comprehension",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "條件篩選",
                                narrative: "你想從 nums = [1, 2, 3, 4, 5, 6, 7, 8] 中取出偶數的平方。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "[x ** 2 for x in nums if x % 2 == 0]", explanation: "正確！if 放在最後面，用來篩選元素。結果：[4, 16, 36, 64]。"),
                                Challenge.Option(id: "B", text: "[x ** 2 if x % 2 == 0 for x in nums]", explanation: "if 在 for 前面是三元運算式，不是篩選。語法錯誤。"),
                                Challenge.Option(id: "C", text: "[x ** 2 for x in nums where x % 2 == 0]", explanation: "Python 沒有 where 關鍵字（那是 SQL）。用 if。"),
                                Challenge.Option(id: "D", text: "[x ** 2 for x in nums].filter(even)", explanation: "Python list 沒有 .filter() 方法。"),
                            ],
                            correctAnswer: "A",
                            hints: ["篩選條件放最後：[表達式 for x in 集合 if 條件]"],
                            explanation: "帶條件的 list comprehension：[表達式 for x in 集合 if 條件]。if 放最後面是篩選，放在表達式位置是三元運算。",
                            frameworkTip: "可讀性原則：如果 comprehension 超過一行，改用普通 for 迴圈。"
                        ),
                        Challenge(
                            id: 3,
                            name: "List Comprehension 資料轉換",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 process_employees(employees)，接收 list of dicts（每個有 \"name\", \"department\", \"salary\" 欄位），用 list comprehension 完成以下操作，回傳結果 list：\n1. 過濾掉 salary 為 None 或 <= 0 的記錄\n2. 每筆轉換為新 dict：{\"name\": 全大寫, \"dept\": 取 department 前 3 字元, \"annual\": salary * 12}\n用一行 list comprehension 完成。",
                            scenario: 
                            Challenge.Scenario(
                                title: "報表資料預處理",
                                narrative: "你需要用 list comprehension 快速清洗和轉換一份員工資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["list comprehension 的 if 條件放在最後面", "字串切片 [:3] 取前三個字元", "在 comprehension 裡可以建構新的 dict"],
                            explanation: "這題練習 list comprehension 的進階用法：同時做篩選（if）和轉換（表達式中建構新 dict）。一行完成 filter + map 是 Python 的強項。",
                            frameworkTip: "List comprehension 替代 filter + map：[transform(x) for x in items if condition(x)]。",
                            starterCode: """
                                def process_employees(employees):
                                    # 用一行 list comprehension 完成篩選和轉換
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
                            name: "Dict Comprehension 統計",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 build_lookup(products)，接收 list of dicts（每個有 \"id\", \"name\", \"price\", \"category\"），用 dict comprehension 回傳：\n1. 一個以 id 為 key、整個 product dict 為 value 的查找表\n2. 但只包含 price > 0 的商品\n再寫一個函式 category_prices(products)，用 dict comprehension 回傳：\n每個 category 的平均 price（提示：可能需要先分組再算平均）。",
                            scenario: 
                            Challenge.Scenario(
                                title: "快速建立查找表",
                                narrative: "你需要把一個商品列表轉換成方便查找的格式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["dict comprehension: {key_expr: value_expr for item in iterable if condition}", "setdefault 可以在 key 不存在時自動建立預設值", "分兩步：先分組收集，再用 comprehension 算平均"],
                            explanation: "這題練習 dict comprehension 和 setdefault。build_lookup 展示了一行建立查找表的能力。category_prices 展示了先分組再聚合的模式。",
                            frameworkTip: "Dict comprehension 適合一對一映射。多對一的聚合（如 groupby）通常需要先用迴圈分組。",
                            starterCode: """
                                def build_lookup(products):
                                    # dict comprehension: {id: product_dict}
                                    # 過濾 price > 0
                                    pass

                                def category_prices(products):
                                    # 先用普通方式分組，再用 dict comprehension 算平均
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
                            name: "巢狀 List Comprehension",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 flatten_filter(matrix, threshold)，用巢狀 list comprehension 把二維 list 攤平，並只保留大於 threshold 的值，結果要排序。\n\n範例：\nflatten_filter([[10, 200, 30], [400, 5, 60]], 50) → [60, 200, 400]",
                            scenario: 
                            Challenge.Scenario(
                                title: "交易資料矩陣轉換",
                                narrative: "你在 Meta 的商務分析團隊，收到一份巢狀的交易資料，需要將二維矩陣攤平成一維 list，同時篩選出高於閾值的交易金額。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["巢狀 list comprehension 的順序：外層 for 在前，內層 for 在後", "篩選條件 if 放在最後面", "最後用 sorted() 排序"],
                            explanation: "巢狀 list comprehension 的閱讀順序：\n[expression for outer in outer_list for inner in outer_list if condition]\n\n等價於：\nresult = []\nfor row in matrix:\n    for x in row:\n        if x > threshold:\n            result.append(x)\n\n這是面試中常考的 Python 技巧，展示你能用簡潔的方式處理巢狀資料。",
                            frameworkTip: "面試時先用 for 迴圈寫出邏輯，確認正確後再改寫成 list comprehension。這展示你的思考過程清晰有條理。",
                            starterCode: """
                                def flatten_filter(matrix, threshold):
                                    # 用巢狀 list comprehension 攤平並篩選
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
                            question: "以下兩段程式碼的主要差異是什麼？\n\n```python\n# 方式 A\ntotal_a = sum([x**2 for x in range(10_000_000)])\n\n# 方式 B\ntotal_b = sum(x**2 for x in range(10_000_000))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "記憶體效能的關鍵差異",
                                narrative: "Meta 面試官問你：處理一千萬筆用戶行為數據時，list comprehension 和 generator expression 在記憶體上有什麼差異？這是區分 junior 和 senior 的經典題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "結果不同，方式 B 會出錯", explanation: "兩者的計算結果完全相同，只是記憶體使用方式不同。"),
                                Challenge.Option(id: "B", text: "結果相同，但方式 A 會先建立完整 list 佔用大量記憶體，方式 B 使用 generator 逐一產生值幾乎不佔記憶體", explanation: "正確！List comprehension [x**2 for ...] 會在記憶體中建立一個包含一千萬個元素的 list。Generator expression (x**2 for ...) 則是惰性求值（lazy evaluation），一次只產生一個值，記憶體使用量接近 O(1)。"),
                                Challenge.Option(id: "C", text: "結果相同，方式 B 比較快但記憶體用量一樣", explanation: "Generator 的主要優勢正是在記憶體，而非速度。"),
                                Challenge.Option(id: "D", text: "方式 B 是語法錯誤，sum() 裡不能放 generator", explanation: "sum() 可以直接接受 generator expression，而且這是推薦的寫法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["[] 建立完整 list，() 建立 generator", "generator 是惰性求值（lazy evaluation）", "當你只需要遍歷一次且不需要索引時，generator 更好"],
                            explanation: "List comprehension vs Generator expression：\n- [x for x in iterable]：一次建立完整 list，佔用 O(n) 記憶體\n- (x for x in iterable)：惰性求值，一次只產生一個值，佔用 O(1) 記憶體\n\n當你只需要遍歷一次（如 sum、max、min、any、all），用 generator 更省記憶體。當你需要多次存取或切片，才用 list。",
                            frameworkTip: "面試時提到「處理大量數據時我會用 generator expression 而非 list comprehension 來節省記憶體」，展示你有 scalability 的意識。這是 Meta 和 Google 非常看重的能力。"
                        ),
                        Challenge(
                            id: 7,
                            name: "Dict & Set Comprehension",
                            type: .code,
                            difficulty: .medium,
                            question: "給定一組訂單 orders = [(customer, amount), ...]，寫兩個函式：\n1. total_by_customer(orders) — 回傳 dict，key 是客戶名，value 是總消費\n2. vip_customers(totals) — 回傳 set，包含消費高於平均值的客戶名\n\n範例：\norders = [(\"Alice\", 100), (\"Bob\", 200), (\"Alice\", 150), (\"Bob\", 50)]\ntotals = total_by_customer(orders) → {\"Alice\": 250, \"Bob\": 250}\nvip_customers({\"Alice\": 250, \"Bob\": 100, \"Carol\": 50}) → {\"Alice\", \"Bob\"}",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶消費數據快速整理",
                                narrative: "你在分析電商平台的訂單數據，需要快速建立每位客戶的消費總額字典，並找出消費超過平均值的 VIP 客戶集合。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["dict comprehension: {key: value for ... if ...}", "set comprehension: {value for ... if ...}", "先計算平均值，再用 comprehension 篩選"],
                            explanation: "Dict comprehension {k: v for ...} 和 set comprehension {v for ...} 是 list comprehension 的延伸：\n- Dict: {customer: total for customer in customers}\n- Set: {customer for customer, amount in totals.items() if amount > avg}\n\n這些工具讓你用一行程式碼完成複雜的資料轉換。",
                            frameworkTip: "面試時展示你能靈活運用 dict/set comprehension，而不只是 list comprehension，會讓面試官知道你對 Python 資料結構有全面的掌握。",
                            starterCode: """
                                def total_by_customer(orders):
                                    # 提示：先用一般方法累加，或用 dict comprehension + sum
                                    pass

                                def vip_customers(totals):
                                    # 用 set comprehension 找出高於平均的客戶
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
                    name: "可讀性與 PEP 8",
                    description: "命名慣例、程式碼風格",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "PEP 8 命名慣例",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪組命名完全符合 PEP 8？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 命名規範",
                                narrative: "你在 code review 中看到同事的命名方式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "函式: calculateTotal, 類別: user_model", explanation: "函式應該用 snake_case，類別應該用 PascalCase。兩個都反了。"),
                                Challenge.Option(id: "B", text: "函式: calculate_total, 類別: UserModel, 常數: MAX_RETRIES", explanation: "正確！函式/變數用 snake_case，類別用 PascalCase，常數用 UPPER_SNAKE_CASE。"),
                                Challenge.Option(id: "C", text: "函式: CalculateTotal, 類別: userModel", explanation: "函式用了 PascalCase（應該給類別），類別用了 camelCase。"),
                                Challenge.Option(id: "D", text: "全部用 camelCase：calculateTotal, userModel, maxRetries", explanation: "camelCase 是 JavaScript/Java 的慣例，不是 Python 的。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Python: snake_case 給函式和變數，PascalCase 給類別"],
                            explanation: "PEP 8 命名：snake_case（函式、變數、方法）、PascalCase（類別）、UPPER_SNAKE_CASE（常數）。",
                            frameworkTip: "命名是程式碼可讀性的第一步。好的名字讓你不需要看註解就能理解程式碼。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Zen of Python",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個不是 Zen of Python 的原則？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 之禪",
                                narrative: "在 Python 中執行 import this 會顯示 Python 之禪（Zen of Python）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Beautiful is better than ugly", explanation: "這是 Zen of Python 的第一條。"),
                                Challenge.Option(id: "B", text: "Explicit is better than implicit", explanation: "這是 Zen of Python 的原則：明確勝於隱晦。"),
                                Challenge.Option(id: "C", text: "Performance is better than readability", explanation: "正確！Zen of Python 強調可讀性（Readability counts），不是效能優先。"),
                                Challenge.Option(id: "D", text: "Flat is better than nested", explanation: "這是 Zen of Python 的原則：扁平勝於巢狀。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Zen of Python 強調簡潔、可讀、明確"],
                            explanation: "Python 之禪的核心精神：可讀性重要、明確勝於隱晦、簡單勝於複雜、扁平勝於巢狀。效能很重要，但不應犧牲可讀性。",
                            frameworkTip: "寫 Python 時先追求可讀性，只在確認效能瓶頸後才優化。Premature optimization is the root of all evil。"
                        ),
                        Challenge(
                            id: 3,
                            name: "程式碼重構練習",
                            type: .code,
                            difficulty: .medium,
                            question: "將以下程式碼重構為符合 PEP 8 規範的版本。要求：\n1. 修正命名（變數用 snake_case，常數用 UPPER_CASE）\n2. 添加適當的空格和空行\n3. 用更 Pythonic 的寫法改寫\n\n```python\ndef CalcStats(Data,minVal=0):\n  filteredData=[x for x in Data if x>=minVal]\n  N=len(filteredData)\n  if N==0:return None\n  Mean=sum(filteredData)/N\n  Variance=sum([(x-Mean)**2 for x in filteredData])/N\n  return {\"mean\":Mean,\"variance\":Variance,\"count\":N}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "修正不合規範的程式碼",
                                narrative: "你加入了一個資料分析團隊，前任工程師留下了一段功能正確但風格糟糕的程式碼。你的主管要求你重構它，使其符合 PEP 8 規範並提升可讀性。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["PEP 8：函式名和變數名用 snake_case", "運算子（=, ==, >=, **, /）前後要有空格", "return 不要跟 if 放在同一行，應該換行加縮排"],
                            explanation: "PEP 8 重點重構項目：\n1. 命名：CalcStats → calc_stats, filteredData → filtered_data\n2. 空格：x>=minVal → x >= min_val\n3. 縮排：if 後的 return 應該換行\n4. 空行：邏輯區塊之間加空行提升可讀性\n5. Docstring：函式開頭加說明文字\n6. 小優化：sum([(x-Mean)**2 ...]) 的 [] 可省略，用 generator 更省記憶體",
                            frameworkTip: "在 code review 或結對程式設計面試中，主動提出 PEP 8 修改建議展示你的程式碼品質意識。好的命名習慣是區分新手和有經驗工程師的重要指標。",
                            starterCode: """
                                # 重構以下程式碼，使其符合 PEP 8 規範
                                # 1. 函式和變數名用 snake_case
                                # 2. 運算子前後加空格
                                # 3. 適當的空行分隔邏輯區塊

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
                            name: "命名慣例與可讀性",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據 PEP 8 規範，以下哪組命名方式全部正確？\n\n```python\n# A 組\nMAX_RETRY_COUNT = 3\ndef calculate_revenue(raw_data):\n    total_amount = sum(raw_data)\n\n# B 組  \nMaxRetryCount = 3\ndef CalculateRevenue(rawData):\n    TotalAmount = sum(rawData)\n\n# C 組\nmax_retry_count = 3\ndef calculate_revenue(RawData):\n    total_amount = sum(RawData)\n\n# D 組\nMAX_RETRY_COUNT = 3\ndef Calculate_Revenue(raw_data):\n    total_amount = sum(raw_data)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 命名慣例速查",
                                narrative: "新進的 data analyst 問你 Python 的命名規範。作為團隊的 Python 導師，你需要清楚解釋不同場景該用什麼命名方式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A 組", explanation: "正確！常數用 UPPER_SNAKE_CASE，函式和變數用 lower_snake_case，這是 PEP 8 的標準命名規範。"),
                                Challenge.Option(id: "B", text: "B 組", explanation: "PascalCase 是給 class 用的，不適用於函式和變數。camelCase (rawData) 是 Java/JS 的慣例，Python 不用。"),
                                Challenge.Option(id: "C", text: "C 組", explanation: "常數 max_retry_count 應該用 UPPER_SNAKE_CASE 表示它是常數。參數 RawData 應該用 snake_case。"),
                                Challenge.Option(id: "D", text: "D 組", explanation: "函式名 Calculate_Revenue 混合了 PascalCase 和 snake_case，應該全部用 snake_case。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Python 變數和函式：snake_case", "常數：UPPER_SNAKE_CASE", "類別名稱：PascalCase（但這題沒考）"],
                            explanation: "PEP 8 命名規範：\n- 常數：UPPER_SNAKE_CASE（如 MAX_RETRY_COUNT）\n- 函式/方法：lower_snake_case（如 calculate_revenue）\n- 變數/參數：lower_snake_case（如 raw_data）\n- 類別：PascalCase（如 DataProcessor）\n- 私有屬性：前綴底線 _private_var\n\n遵循這些規範讓程式碼一眼就能看出變數的用途和範圍。",
                            frameworkTip: "面試或工作中，一致的命名慣例是程式碼品質的第一印象。在 code review 中提到 PEP 8 展示你重視程式碼的可維護性。"
                        ),
                    ]
                ),
                Quest(
                    id: "19-3",
                    name: "Pandas 入門 DataFrame",
                    description: "Series、DataFrame、讀 CSV、dtypes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DataFrame 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個可以看到前 5 行資料？",
                            scenario: 
                            Challenge.Scenario(
                                title: "認識 DataFrame",
                                narrative: "你用 pandas 讀取了一個 CSV 檔案：\nimport pandas as pd\ndf = pd.read_csv(\"sales.csv\")",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.head()", explanation: "正確！head() 預設顯示前 5 行。head(10) 顯示前 10 行。"),
                                Challenge.Option(id: "B", text: "df.first(5)", explanation: "DataFrame 沒有 first() 方法。是 head()。"),
                                Challenge.Option(id: "C", text: "df[0:5]", explanation: "可以，但 head() 更 Pythonic 且語義更清楚。"),
                                Challenge.Option(id: "D", text: "df.preview()", explanation: "DataFrame 沒有 preview() 方法。"),
                            ],
                            correctAnswer: "A",
                            hints: ["head() = 前 N 行，tail() = 後 N 行，info() = 欄位資訊，describe() = 統計摘要"],
                            explanation: "DataFrame 探索四件套：head()（看資料）、info()（看欄位型態）、describe()（看統計）、shape（看行列數）。",
                            frameworkTip: "拿到新資料第一步：df.head()、df.info()、df.describe()、df.shape。"
                        ),
                        Challenge(
                            id: 2,
                            name: "dtypes 與型態",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如何正確轉換型態？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料型態問題",
                                narrative: "你發現 df[\"price\"] 的 dtype 是 object（字串），但你需要做數學運算。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df[\"price\"] = int(df[\"price\"])", explanation: "int() 不能直接用在整個 Series 上。"),
                                Challenge.Option(id: "B", text: "df[\"price\"] = df[\"price\"].astype(float)", explanation: "正確！astype() 是 pandas 的型態轉換方法。"),
                                Challenge.Option(id: "C", text: "df[\"price\"] = float(df[\"price\"])", explanation: "float() 不能用在 Series 上。"),
                                Challenge.Option(id: "D", text: "df[\"price\"].convert(float)", explanation: "Series 沒有 convert() 方法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["pandas 用 .astype() 轉型態，可以處理整個 Series"],
                            explanation: ".astype(float) 把整個 Series 轉成 float。如果有無法轉換的值，用 pd.to_numeric(df[\"price\"], errors=\"coerce\") 更安全（會把錯誤值變成 NaN）。",
                            frameworkTip: "讀完 CSV 後先檢查 dtypes。數字欄位是 object？可能有非數字的值混在裡面。"
                        ),
                        Challenge(
                            id: 3,
                            name: "建立 DataFrame 並分析",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 analyze_sales(data)，接收 list of dicts（每個有 \"product\", \"region\", \"revenue\"），用 pandas 完成：\n1. 建立 DataFrame\n2. 新增 \"rank\" 欄位：根據 revenue 由大到小的排名（1 = 最高）\n3. 新增 \"above_median\" 欄位：revenue > 中位數為 True，否則 False\n4. 回傳處理後的 DataFrame",
                            scenario: 
                            Challenge.Scenario(
                                title: "從 dict 建立 DataFrame",
                                narrative: "你有一組銷售資料，需要用 pandas 做基本分析。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["pd.DataFrame(list_of_dicts) 直接建立 DataFrame", ".rank(ascending=False) 降序排名", ".median() 計算中位數"],
                            explanation: "這題練習 pandas 基本操作：從 dict 建立 DataFrame、新增計算欄位（rank、條件判斷）。rank() 和 median() 是資料分析中常用的方法。",
                            frameworkTip: "pandas 新增欄位：df[\"new_col\"] = 表達式。表達式可以用現有欄位做計算。",
                            starterCode: """
                                import pandas as pd

                                def analyze_sales(data):
                                    # 建立 DataFrame
                                    # 新增 rank 和 above_median 欄位
                                    # 回傳 DataFrame
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
                            name: "DataFrame Merge（Join 操作）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "給定以下兩個 DataFrame：\n\n```python\nimport pandas as pd\n\norders = pd.DataFrame({\n    \"order_id\": [1, 2, 3, 4],\n    \"customer_id\": [101, 102, 103, 999],\n    \"amount\": [50, 30, 70, 20]\n})\n\ncustomers = pd.DataFrame({\n    \"customer_id\": [101, 102, 103, 104],\n    \"name\": [\"Alice\", \"Bob\", \"Carol\", \"Dave\"]\n})\n\nresult = orders.merge(customers, on=\"customer_id\", how=\"left\")\n```\n\nresult 有幾列？customer_id=999 那列的 name 欄位值是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Left Join vs Inner Join — 面試高頻題",
                                narrative: "你在分析電商平台數據，有兩張表：orders（訂單）和 customers（客戶）。面試官要你用 Pandas 合併這兩張表，並解釋不同 join 方式的差異。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "4 列，name 欄位為 NaN", explanation: "正確！left join 保留左表（orders）的所有列。customer_id=999 在 customers 表中找不到對應，所以 name 為 NaN。customer_id=104 的 Dave 不會出現，因為他在左表中沒有訂單。"),
                                Challenge.Option(id: "B", text: "3 列，customer_id=999 那列被刪除", explanation: "這是 inner join 的行為，不是 left join。left join 會保留左表的所有列。"),
                                Challenge.Option(id: "C", text: "5 列，包含 Dave 的列", explanation: "這是 outer join 的行為。left join 只保留左表的所有列，不會加入右表獨有的列。"),
                                Challenge.Option(id: "D", text: "4 列，name 欄位為空字串 \"\"", explanation: "找不到匹配時，Pandas 用 NaN（而非空字串）來表示缺失值。"),
                            ],
                            correctAnswer: "A",
                            hints: ["left join 保留左表所有列", "找不到匹配的欄位會填入 NaN", "inner join 只保留兩邊都有的列"],
                            explanation: "Pandas merge 的四種 join 方式：\n- inner（預設）：只保留兩邊都有匹配的列\n- left：保留左表所有列，右表無匹配的填 NaN\n- right：保留右表所有列，左表無匹配的填 NaN\n- outer：保留兩邊所有列，無匹配的填 NaN\n\n等價於 SQL 的 INNER/LEFT/RIGHT/FULL OUTER JOIN。",
                            frameworkTip: "面試時畫一個 Venn diagram 來解釋 join 類型，left join = 左圈全部 + 交集部分。這展示你對 SQL 和 Pandas 的共通概念有深入理解。StrataScratch 上超過 30% 的題目涉及 merge/join 操作。"
                        ),
                        Challenge(
                            id: 5,
                            name: "loc vs iloc 陷阱",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下程式碼的輸出是什麼？\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame(\n    {\"product\": [\"A\", \"B\", \"C\", \"D\", \"E\"]},\n    index=[10, 20, 30, 40, 50]\n)\n\nprint(len(df.loc[10:30]))\nprint(len(df.iloc[0:2]))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "loc 和 iloc 的致命差異",
                                narrative: "你在 StrataScratch 上練習 Pandas 題目，發現很多人在 loc 和 iloc 的使用上犯錯。這道題考的是兩者在切片行為上的關鍵差異。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "3, 2", explanation: "正確！loc 用標籤切片時「包含」結尾（10, 20, 30 共 3 列）。iloc 用位置切片時「不包含」結尾（位置 0, 1 共 2 列），跟 Python 的 list 切片一致。"),
                                Challenge.Option(id: "B", text: "2, 2", explanation: "loc 的切片包含結尾（inclusive），不像 Python 的一般切片。"),
                                Challenge.Option(id: "C", text: "3, 3", explanation: "iloc 的切片跟 Python list 一樣，不包含結尾。"),
                                Challenge.Option(id: "D", text: "報錯 KeyError", explanation: "10, 20, 30 都是有效的 index 標籤，不會報錯。"),
                            ],
                            correctAnswer: "A",
                            hints: ["loc 用標籤（label），切片包含結尾", "iloc 用整數位置（integer location），切片不包含結尾", "這是 Pandas 最容易混淆的點之一"],
                            explanation: "loc vs iloc 的關鍵差異：\n- df.loc[start:end]：用標籤索引，切片「包含」end（inclusive）\n- df.iloc[start:end]：用位置索引，切片「不包含」end（exclusive），跟 Python list/range 一致\n\n記憶口訣：loc = label + inclusive，iloc = integer + exclusive（跟 Python 慣例一致）。",
                            frameworkTip: "面試時明確說出「loc 用標籤且包含結尾，iloc 用位置且不包含結尾」這個關鍵差異。這是 Pandas 面試中最常見的陷阱題之一，答對能立刻建立你的可信度。"
                        ),
                        Challenge(
                            id: 6,
                            name: "DataFrame 建立與基本操作",
                            type: .code,
                            difficulty: .medium,
                            question: "完成以下任務：\n1. 從 sales_data 建立 DataFrame\n2. 新增 total 欄位 = quantity * price\n3. 將 sales_df 和 categories_df 用 inner merge 合併\n4. 回傳合併後的 DataFrame\n\n```python\nsales_data = {\n    \"product_id\": [1, 2, 3],\n    \"quantity\": [10, 5, 8],\n    \"price\": [100, 200, 150]\n}\ncategories_data = {\n    \"product_id\": [1, 2, 4],\n    \"category\": [\"Electronics\", \"Clothing\", \"Food\"]\n}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "銷售數據快速分析",
                                narrative: "你在一家零售公司的資料團隊，需要從原始字典數據建立 DataFrame，進行欄位計算，並用 merge 合併產品類別資訊。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["pd.DataFrame(dict) 從字典建立 DataFrame", "df[\"new_col\"] = df[\"col1\"] * df[\"col2\"] 新增計算欄位", "df1.merge(df2, on=\"key\", how=\"inner\") 內連結"],
                            explanation: "Pandas 基本操作流程：\n1. pd.DataFrame(dict) 從字典建立表格\n2. df[\"new_col\"] = 運算式 新增欄位\n3. df1.merge(df2, on=\"key\", how=\"inner\") 合併表格\n\ninner merge 只保留 product_id 在兩張表都有的列（1 和 2），product_id=3 和 4 會被排除。",
                            frameworkTip: "面試中處理 Pandas 題目時，先說明你的資料處理流程（建立 → 計算 → 合併 → 篩選），再逐步實作。展示你有結構化的分析思維。",
                            starterCode: """
                                import pandas as pd

                                def process_sales(sales_data, categories_data):
                                    # 1. 建立 DataFrame
                                    # 2. 新增 total 欄位
                                    # 3. inner merge
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
                    name: "資料篩選與排序",
                    description: "loc/iloc、條件篩選、sort_values",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "loc vs iloc",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "loc 和 iloc 的差別是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料存取",
                                narrative: "你有一個 DataFrame，想用不同方式存取資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "loc 用標籤（label）存取，iloc 用位置（integer）存取", explanation: "正確！loc 用行/列的名稱，iloc 用數字索引。"),
                                Challenge.Option(id: "B", text: "loc 只能存取行，iloc 只能存取列", explanation: "兩者都可以存取行和列。"),
                                Challenge.Option(id: "C", text: "loc 比 iloc 快", explanation: "速度差異不大，選擇依據是語義而非速度。"),
                                Challenge.Option(id: "D", text: "沒有差別，可以互換", explanation: "當索引不是 0, 1, 2... 的數字時，兩者結果不同。"),
                            ],
                            correctAnswer: "A",
                            hints: ["loc = label-based, iloc = integer-based"],
                            explanation: "df.loc[行標籤, 列名] 用名稱存取。df.iloc[行號, 列號] 用位置存取。條件篩選用 loc 或直接 df[條件]。",
                            frameworkTip: "最常用的篩選方式：df[df[\"column\"] > value]。loc 用在需要同時指定行和列的時候。"
                        ),
                        Challenge(
                            id: 2,
                            name: "條件篩選",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "篩選資料",
                                narrative: "你想找出 price > 100 且 category == \"Electronics\" 的商品。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df[df[\"price\"] > 100 and df[\"category\"] == \"Electronics\"]", explanation: "pandas 不能用 Python 的 and，要用 & 且每個條件要加括號。"),
                                Challenge.Option(id: "B", text: "df[(df[\"price\"] > 100) & (df[\"category\"] == \"Electronics\")]", explanation: "正確！pandas 用 & 代替 and，| 代替 or，每個條件必須加括號。"),
                                Challenge.Option(id: "C", text: "df.filter(price > 100, category == \"Electronics\")", explanation: "DataFrame.filter() 不是這樣用的。"),
                                Challenge.Option(id: "D", text: "df.where(price > 100).where(category == \"Electronics\")", explanation: ".where() 的語義不同，且不能直接用變數名。"),
                            ],
                            correctAnswer: "B",
                            hints: ["pandas 條件篩選：& 代替 and，| 代替 or，每個條件加括號"],
                            explanation: "pandas 條件篩選的三個規則：(1) 用 & 不用 and (2) 用 | 不用 or (3) 每個條件加括號。這是因為 Python 的運算子優先順序。",
                            frameworkTip: "忘記加括號是最常見的 pandas 錯誤。看到 & 或 | 就記得加括號。"
                        ),
                        Challenge(
                            id: 3,
                            name: "DataFrame 篩選與轉換",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 high_value_analysis(df)，接收一個 DataFrame（欄位：customer_id, order_date, amount, category），完成：\n1. 篩選 amount >= 1000 的訂單\n2. 按 customer_id 分組，計算每人的訂單數和總金額\n3. 只保留訂單數 >= 3 的客戶（高價值客戶）\n4. 按總金額降序排列\n5. 回傳結果 DataFrame（欄位：customer_id, order_count, total_amount）",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂單資料分析",
                                narrative: "你是 Product Analyst，需要從訂單資料中找出高價值客戶的購買模式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先篩選再分組，減少資料量", ".agg() 可以同時做多種聚合並命名", "reset_index() 把 groupby 的 key 變回普通欄位"],
                            explanation: "這題練習完整的 pandas 分析流程：篩選 → 分組 → 聚合 → 再篩選 → 排序。agg() 搭配命名是 pandas 現代化的聚合寫法。",
                            frameworkTip: "分析流程：Filter → GroupBy → Aggregate → Filter → Sort。像漏斗一樣逐步收斂資料。",
                            starterCode: """
                                import pandas as pd

                                def high_value_analysis(df):
                                    # 1. 篩選高額訂單
                                    # 2. 分組統計
                                    # 3. 篩選高價值客戶
                                    # 4. 排序
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
                            name: "多條件篩選與 apply",
                            type: .code,
                            difficulty: .medium,
                            question: "完成以下任務：\n1. 篩選出 sessions > 5 且 purchases > 0 的用戶\n2. 用 apply 對每列計算 engagement_score = sessions * 0.3 + purchases * 0.7\n3. 按 engagement_score 降序排列\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    \"user_id\": [1, 2, 3, 4, 5],\n    \"sessions\": [10, 3, 8, 15, 2],\n    \"purchases\": [2, 0, 5, 1, 3]\n})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "用戶行為數據分析",
                                narrative: "你在 Meta 的 Growth 團隊，需要從用戶活動數據中篩選出符合多個條件的高價值用戶，並用自定義函式計算每位用戶的參與度分數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["多條件篩選用 & 連接，每個條件要加括號", "apply(func, axis=1) 對每一列（row）執行函式", "sort_values(\"col\", ascending=False) 降序排列"],
                            explanation: "Pandas 多條件篩選語法：\n- df[(cond1) & (cond2)]：AND 條件\n- df[(cond1) | (cond2)]：OR 條件\n- 每個條件必須加括號！\n\napply(func, axis=1) 對每一列執行自定義函式，axis=0 則是對每一欄。sort_values 的 ascending=False 表示降序。",
                            frameworkTip: "面試時提到 apply 時，順便說明「對於簡單運算，向量化操作比 apply 更快」。這展示你有效能意識，面試官會加分。",
                            starterCode: """
                                import pandas as pd

                                def analyze_users(df):
                                    # 1. 多條件篩選
                                    # 2. 用 apply 計算 engagement_score
                                    # 3. 降序排列
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
                            name: "apply vs 向量化操作效能比較",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下三種方式都是計算 BMI（體重/身高平方），哪個效能最好？假設 DataFrame 有 100 萬列。\n\n```python\n# 方式 A：for 迴圈\nfor i in range(len(df)):\n    df.loc[i, \"bmi\"] = df.loc[i, \"weight\"] / df.loc[i, \"height\"]**2\n\n# 方式 B：apply\ndf[\"bmi\"] = df.apply(lambda row: row[\"weight\"] / row[\"height\"]**2, axis=1)\n\n# 方式 C：向量化\ndf[\"bmi\"] = df[\"weight\"] / df[\"height\"]**2\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "效能陷阱：為什麼你的程式碼慢 100 倍？",
                                narrative: "Meta 面試官給你看兩段功能相同的 Pandas 程式碼，問你哪個效能更好。這是區分會用 Pandas 和「真正懂」Pandas 的關鍵面試題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A 最快，因為直接操作記憶體", explanation: "for 迴圈 + df.loc 是最慢的方式，每次迭代都有大量 Python 物件開銷。"),
                                Challenge.Option(id: "B", text: "B 最快，因為 apply 是 Pandas 內建優化", explanation: "apply 實際上還是 Python 層級的迴圈，只是語法比較簡潔，並沒有真正向量化。"),
                                Challenge.Option(id: "C", text: "C 最快，向量化操作直接呼叫底層 C/NumPy 引擎", explanation: "正確！向量化操作在 C/NumPy 層級批量處理，避免了 Python 迴圈的開銷。效能差距：C 約比 A 快 100-1000 倍，比 B 快 10-100 倍。"),
                                Challenge.Option(id: "D", text: "三者效能相同，只是寫法不同", explanation: "效能差距非常大，尤其在大數據量（百萬列以上）時。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Pandas 底層使用 NumPy，NumPy 的運算是在 C 層級執行的", "apply 看起來像向量化但其實不是", "for 迴圈在 Pandas 中幾乎總是最慢的方式"],
                            explanation: "Pandas 效能金字塔（從快到慢）：\n1. 向量化操作（NumPy/C 層級）：df[\"a\"] + df[\"b\"]\n2. apply（Python 層級迴圈，語法簡潔但不快）\n3. itertuples()（比 iterrows 快）\n4. iterrows()（很慢）\n5. for + df.loc/iloc（最慢）\n\n規則：能用向量化就不要用 apply，能用 apply 就不要用 for 迴圈。",
                            frameworkTip: "面試時主動提到「我會優先用向量化操作而非 apply 或 for 迴圈」，並解釋為什麼（C/NumPy 底層 vs Python 迴圈），這是 Meta 和 Google 資料科學面試的加分項。"
                        ),
                        Challenge(
                            id: 6,
                            name: "複合排序與 nlargest",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 top_campaigns(df, n)：\n1. 計算 ROI 欄位 = (revenue - cost) / cost\n2. 篩選出 ROI > 0 的廣告活動\n3. 按 ROI 降序排列，ROI 相同時按 cost 升序排列\n4. 回傳前 n 筆\n\n範例 DataFrame 有 campaign, cost, revenue 三個欄位。",
                            scenario: 
                            Challenge.Scenario(
                                title: "廣告投放 ROI 分析",
                                narrative: "你在分析 Meta 的廣告投放數據，需要找出 ROI 最高的前 N 個廣告活動，並處理同 ROI 時按花費升序排列的情況。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["sort_values 可接受 list 做多欄排序", "ascending 也可以是 list，對應每個排序欄位的方向", "head(n) 取前 n 筆，等效於 nlargest 但更靈活"],
                            explanation: "Pandas 複合排序語法：\nsort_values([\"col1\", \"col2\"], ascending=[False, True])\n\n這表示先按 col1 降序，col1 相同時按 col2 升序。ascending 參數接受一個 list，對應每個排序欄位的方向。\n\nnlargest(n, \"col\") 適合單欄取最大的 n 筆，但複合排序時用 sort_values + head 更靈活。",
                            frameworkTip: "面試中遇到排序題，記得考慮 tie-breaking（平手時的排序規則）。主動提出這一點展示你的嚴謹度。",
                            starterCode: """
                                import pandas as pd

                                def top_campaigns(df, n):
                                    # 1. 計算 ROI
                                    # 2. 篩選 ROI > 0
                                    # 3. 複合排序
                                    # 4. 取前 n 筆
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
                    name: "GroupBy 與聚合",
                    description: "groupby、agg、pivot_table",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "groupby 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "分組統計",
                                narrative: "你想統計每個 category 的平均 price。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.groupby(\"category\")[\"price\"].mean()", explanation: "正確！先 groupby 分組，再選欄位，最後聚合。"),
                                Challenge.Option(id: "B", text: "df[\"price\"].groupby(\"category\").mean()", explanation: "Series 不能直接 groupby 字串，要在 DataFrame 層級 groupby。"),
                                Challenge.Option(id: "C", text: "df.group(\"category\").avg(\"price\")", explanation: "沒有 group() 和 avg()，是 groupby() 和 mean()。"),
                                Challenge.Option(id: "D", text: "df.mean(groupby=\"category\")", explanation: "mean() 沒有 groupby 參數。"),
                            ],
                            correctAnswer: "A",
                            hints: ["pandas 聚合三步驟：groupby → 選欄位 → 聚合函式"],
                            explanation: "groupby 三步驟：(1) df.groupby(\"分組欄位\") (2) 選要計算的欄位 (3) 套用聚合函式（mean, sum, count, min, max）。",
                            frameworkTip: "把 groupby 想成 SQL 的 GROUP BY：先分組，再對每組做計算。"
                        ),
                        Challenge(
                            id: 2,
                            name: "agg 多重聚合",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的寫法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "多種統計",
                                narrative: "你想同時計算每個 category 的 price 的平均值、最大值和計數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.groupby(\"category\")[\"price\"].agg([\"mean\", \"max\", \"count\"])", explanation: "正確！agg() 接受聚合函式的列表，一次計算多個統計值。"),
                                Challenge.Option(id: "B", text: "df.groupby(\"category\")[\"price\"].mean().max().count()", explanation: "串接會依序執行，不是同時計算三個。"),
                                Challenge.Option(id: "C", text: "df.groupby(\"category\").aggregate(\"price\", \"mean\", \"max\")", explanation: "aggregate 的參數格式不對。"),
                                Challenge.Option(id: "D", text: "df.groupby(\"category\").describe()[\"price\"]", explanation: "describe() 會計算更多統計值，但無法自訂要哪些。"),
                            ],
                            correctAnswer: "A",
                            hints: ["agg() 可以接受 list（同一欄位多種聚合）或 dict（不同欄位不同聚合）"],
                            explanation: "agg() 是最靈活的聚合方式：list 模式 agg([\"mean\", \"sum\"])，dict 模式 agg({\"price\": \"mean\", \"qty\": \"sum\"})。",
                            frameworkTip: "需要多欄位不同聚合時用 dict：.agg({\"price\": \"mean\", \"qty\": \"sum\", \"id\": \"count\"})。"
                        ),
                        Challenge(
                            id: 3,
                            name: "pivot_table 樞紐分析",
                            type: .code,
                            difficulty: .hard,
                            question: "給定銷售數據 DataFrame（欄位：region, quarter, product, revenue），用 pivot_table 建立：\n- 列（index）：region\n- 欄（columns）：quarter\n- 值（values）：revenue 的總和\n- 用 0 填充缺失值\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    \"region\": [\"North\", \"North\", \"South\", \"South\", \"North\", \"South\"],\n    \"quarter\": [\"Q1\", \"Q2\", \"Q1\", \"Q2\", \"Q1\", \"Q3\"],\n    \"product\": [\"A\", \"B\", \"A\", \"A\", \"B\", \"A\"],\n    \"revenue\": [100, 200, 150, 300, 50, 250]\n})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "銷售數據樞紐分析 — Google 面試題",
                                narrative: "Google 面試官要你用 Pandas 的 pivot_table 做一個跨維度的銷售分析，類似 Excel 的樞紐分析表但用程式碼實現。這考的是你能否快速做資料重塑（reshaping）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["pd.pivot_table() 的核心參數：index, columns, values, aggfunc", "fill_value=0 把 NaN 填成 0", "aggfunc 可以是 \"sum\", \"mean\", \"count\" 等"],
                            explanation: "pd.pivot_table 是 Pandas 最強大的資料重塑工具：\n- index：分組的列標籤（相當於 SQL GROUP BY）\n- columns：展開成欄的維度\n- values：要聚合的數值欄位\n- aggfunc：聚合函式（sum, mean, count, etc.）\n- fill_value：填充缺失值\n\n結果是一個交叉表，每個 cell 是該 region + quarter 組合的 revenue 總和。",
                            frameworkTip: "面試時把 pivot_table 比喻成 Excel 的樞紐分析表，但更靈活。提到你可以同時對多個 values 用不同的 aggfunc，這展示你的進階 Pandas 能力。",
                            starterCode: """
                                import pandas as pd

                                def create_pivot(df):
                                    # 用 pivot_table 建立樞紐分析表
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
                            name: "groupby + agg 多重聚合",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 customer_summary(df)：\n1. 按 customer_id 分組\n2. 同時計算 amount 的 count, sum, mean, max\n3. 將欄位重新命名為 txn_count, total_amount, avg_amount, max_amount\n4. 按 total_amount 降序排列\n5. 重設 index\n\nDataFrame 有 customer_id, amount, date 三個欄位。",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶行為多維度分析 — Meta/Google 高頻題",
                                narrative: "你在面試中被要求對客戶交易數據做多維度的聚合分析：同時計算每個客戶的交易次數、總金額、平均金額和最大單筆交易。這是 Meta 和 Google 資料分析面試的高頻題型。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["agg() 可用 named aggregation：agg(新欄名=\"聚合函式\")", "這種語法同時完成聚合和重命名", "reset_index() 把 groupby 的 key 變回普通欄位"],
                            explanation: "Pandas Named Aggregation 語法（推薦寫法）：\ndf.groupby(\"key\")[\"col\"].agg(\n    new_name1=\"func1\",\n    new_name2=\"func2\"\n)\n\n優點：一步完成聚合和重命名，比先 agg 再 rename 更簡潔。\n\n也可以對不同欄位做不同聚合：\ndf.groupby(\"key\").agg(\n    total=(\"amount\", \"sum\"),\n    avg_qty=(\"quantity\", \"mean\")\n)",
                            frameworkTip: "面試時展示 named aggregation 語法而不是 agg({\"col\": [\"sum\", \"mean\"]}) 再 rename，這展示你知道 Pandas 的最新最佳實踐。Google 面試特別看重程式碼的簡潔性和可讀性。",
                            starterCode: """
                                import pandas as pd

                                def customer_summary(df):
                                    # groupby + agg 多重聚合
                                    # 重命名欄位
                                    # 排序 + reset_index
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
                            name: "groupby + transform 實戰",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下程式碼的目的是計算每筆交易佔該客戶總消費的百分比。哪段程式碼能正確執行？\n\n```python\n# 方式 A\ndf[\"pct\"] = df.groupby(\"customer_id\")[\"amount\"].transform(\"sum\")\ndf[\"pct\"] = df[\"amount\"] / df[\"pct\"]\n\n# 方式 B\ndf[\"pct\"] = df[\"amount\"] / df.groupby(\"customer_id\")[\"amount\"].agg(\"sum\")\n\n# 方式 C\ntotals = df.groupby(\"customer_id\")[\"amount\"].sum()\ndf[\"pct\"] = df[\"amount\"] / df[\"customer_id\"].map(totals)\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "transform vs agg — 面試陷阱",
                                narrative: "Google 面試官問你：我想在原始 DataFrame 中新增一欄「該客戶的交易佔比」，你應該用 agg 還是 transform？這題考的是你對 groupby 回傳結構的理解。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只有方式 A 正確", explanation: "方式 A 和方式 C 都能正確執行。"),
                                Challenge.Option(id: "B", text: "方式 A 和 C 正確，方式 B 會出錯或結果不對", explanation: "正確！transform 回傳與原 DataFrame 同樣長度的 Series（每列對應其分組的聚合值），可直接運算。agg 回傳的 Series 長度等於分組數，直接除會因 index 不對齊導致大量 NaN。方式 C 用 map 手動對齊也能正確執行。"),
                                Challenge.Option(id: "C", text: "三種都正確，只是寫法不同", explanation: "方式 B 的 agg 結果 index 是 customer_id，與原 DataFrame 的 index（行號）不對齊。"),
                                Challenge.Option(id: "D", text: "只有方式 C 正確", explanation: "方式 A 的 transform 也能正確執行。"),
                            ],
                            correctAnswer: "B",
                            hints: ["transform 回傳與原 DataFrame 同長度的結果", "agg 回傳的結果長度等於分組數", "index 不對齊會導致運算產生 NaN"],
                            explanation: "transform vs agg 的關鍵差異：\n- agg()：回傳每個分組的聚合值，結果的 index 是分組的 key，長度 = 分組數\n- transform()：回傳與原 DataFrame 同長度的結果，每列填入其所屬分組的聚合值\n\n當你需要把聚合結果「廣播」回原 DataFrame 時（如計算佔比、偏差），用 transform。\n當你只需要分組摘要時，用 agg。",
                            frameworkTip: "面試時明確區分 transform 和 agg 的使用場景：「需要保持原始 DataFrame 行數用 transform，需要摘要用 agg」。這是 Google 資料科學面試的高頻考點。"
                        ),
                    ]
                ),
                Quest(
                    id: "19-6",
                    name: "銷售資料分析（Boss）",
                    description: "用 Pandas 完成完整的資料分析",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Pandas 銷售分析",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "月度銷售報告",
                                narrative: "你是 Product Analyst，收到一份 CSV：\n\ncolumns: order_id, date, product, category, qty, unit_price, customer_id, region\n\n主管要求：\n1. 每月營收趨勢\n2. 各品類佔比\n3. 各地區 Top 3 產品\n4. 客戶分群（高/中/低消費）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先 df.info() 了解資料結構", "用 pd.to_datetime 處理日期欄位"],
                            explanation: "完整的資料分析流程：讀取 → 檢查 → 清洗 → 轉換 → 聚合 → 分群 → 輸出。",
                            frameworkTip: "分析報告結構：Overview → Trends → Breakdown → Segments → Recommendations。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 20,
            name: "API 與自動化腳本",
            emoji: "🤖",
            description: "JSON、requests、批次處理、自動報表",
            quests: [
                Quest(
                    id: "20-1",
                    name: "JSON 與 API 概念",
                    description: "REST、endpoint、request/response",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "REST API 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "REST API 最準確的描述是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "什麼是 API",
                                narrative: "你的主管說：「我們需要從外部系統拿資料，用他們的 API。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "一種程式語言", explanation: "API 不是程式語言，是介面/協議。"),
                                Challenge.Option(id: "B", text: "透過 HTTP 請求存取遠端資料或功能的標準化介面", explanation: "正確！REST API 用 HTTP 方法（GET/POST/PUT/DELETE）操作資源。"),
                                Challenge.Option(id: "C", text: "一種資料庫", explanation: "API 不是資料庫，但可以用來存取資料庫中的資料。"),
                                Challenge.Option(id: "D", text: "只有前端工程師才需要知道的東西", explanation: "後端、資料分析師、Business IT 都需要用 API。"),
                            ],
                            correctAnswer: "B",
                            hints: ["API = Application Programming Interface，程式和程式之間溝通的介面"],
                            explanation: "REST API 用 HTTP 方法對應操作：GET（讀取）、POST（建立）、PUT（更新）、DELETE（刪除）。URL 代表資源。",
                            frameworkTip: "API 思維：把遠端服務想像成一個函式庫 — URL 是函式名，HTTP 方法是動作，JSON 是參數和回傳值。"
                        ),
                        Challenge(
                            id: 2,
                            name: "HTTP 狀態碼",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "404 代表什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Status Code",
                                narrative: "你呼叫 API 後收到 status code 404。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "請求成功", explanation: "成功是 200。"),
                                Challenge.Option(id: "B", text: "伺服器錯誤", explanation: "伺服器錯誤是 5xx（如 500）。"),
                                Challenge.Option(id: "C", text: "找不到資源（Not Found）", explanation: "正確！404 = 你請求的 URL/資源不存在。"),
                                Challenge.Option(id: "D", text: "沒有權限", explanation: "沒有權限是 401（未認證）或 403（禁止存取）。"),
                            ],
                            correctAnswer: "C",
                            hints: ["2xx = 成功、3xx = 重定向、4xx = 客戶端錯誤、5xx = 伺服器錯誤"],
                            explanation: "常見狀態碼：200（成功）、201（已建立）、400（請求格式錯誤）、401（未認證）、403（禁止）、404（找不到）、500（伺服器錯誤）。",
                            frameworkTip: "處理 API 回應時，先檢查 status code 再讀 body。非 2xx 都應該處理。"
                        ),
                        Challenge(
                            id: 3,
                            name: "RESTful 設計原則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "一個電商平台的訂單 API，以下哪組 HTTP method 對應是正確的？\n\n1. 查詢所有訂單\n2. 建立新訂單\n3. 更新訂單地址\n4. 取消（刪除）訂單",
                            scenario: 
                            Challenge.Scenario(
                                title: "RESTful API 動詞語義",
                                narrative: "你在 Amazon 面試中被問到 API 設計。面試官給了你一個電商平台的使用者訂單系統，要你選出正確的 HTTP method 對應。理解 REST 動詞語義是後端與資料工程面試的基礎。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1.GET /orders  2.POST /orders  3.PUT /orders/{id}  4.DELETE /orders/{id}", explanation: "正確！GET 用於讀取、POST 用於建立、PUT 用於完整更新、DELETE 用於刪除。這是 RESTful API 的標準設計。"),
                                Challenge.Option(id: "B", text: "1.POST /getOrders  2.POST /createOrder  3.POST /updateOrder  4.POST /deleteOrder", explanation: "這是 RPC 風格，不是 RESTful。RESTful 用 HTTP method 區分操作，不把動作放在 URL 中。"),
                                Challenge.Option(id: "C", text: "1.GET /orders  2.PUT /orders  3.PATCH /orders/{id}  4.GET /orders/{id}/delete", explanation: "PUT 用於更新而非建立，用 GET 做刪除操作違反 HTTP 語義（GET 應該是冪等且無副作用的）。"),
                                Challenge.Option(id: "D", text: "1.GET /orders  2.POST /orders  3.POST /orders/{id}  4.PUT /orders/{id}/cancel", explanation: "用 POST 做更新不夠精確，PUT 不應該用於非冪等的取消操作。"),
                            ],
                            correctAnswer: "A",
                            hints: ["RESTful 設計：URL 代表資源（名詞），HTTP method 代表操作（動詞）", "GET=讀取, POST=建立, PUT=完整更新, PATCH=部分更新, DELETE=刪除", "GET 和 PUT 是冪等的（多次呼叫結果一樣），POST 不是"],
                            explanation: "RESTful API 設計四大原則：\n1. URL 用名詞代表資源：/orders, /users\n2. HTTP method 代表操作：GET（讀取）, POST（建立）, PUT（完整更新）, PATCH（部分更新）, DELETE（刪除）\n3. GET 和 DELETE 是冪等的\n4. POST 不是冪等的（每次呼叫可能建立新資源）\n\n面試常見追問：PUT vs PATCH？PUT 替換整個資源，PATCH 只更新部分欄位。",
                            frameworkTip: "面試時被問到 API 設計，先說「我會用 RESTful 風格」，然後快速列出 GET/POST/PUT/DELETE 對應的 CRUD 操作。接著提到冪等性（idempotency）會讓面試官對你刮目相看。"
                        ),
                        Challenge(
                            id: 4,
                            name: "HTTP 狀態碼語義",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你的腳本呼叫 API 時遇到以下狀態碼，哪一個配對的處理策略是正確的？\n\n- 200：請求成功\n- 401：認證失敗\n- 429：請求太頻繁\n- 503：服務暫時不可用",
                            scenario: 
                            Challenge.Scenario(
                                title: "API 回應狀態碼",
                                narrative: "你在開發一個 API 串接腳本，呼叫合作夥伴的訂單 API 時收到了不同的 HTTP 狀態碼。你需要根據狀態碼決定如何處理回應——是重試、修正請求、還是回報問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "200→處理資料, 401→重試, 429→等待後重試, 503→等待後重試", explanation: "401 是認證問題，重試不會解決。需要檢查 API key 或 token 是否正確。"),
                                Challenge.Option(id: "B", text: "200→處理資料, 401→檢查 token, 429→立刻重試, 503→等待後重試", explanation: "429 表示 rate limit，立刻重試只會再次被限制。應該等待（通常讀取 Retry-After header）再重試。"),
                                Challenge.Option(id: "C", text: "200→處理資料, 401→檢查 token, 429→等待後重試, 503→等待後重試", explanation: "正確！200 系列是成功，401 是認證問題需要修正 credentials，429 是 rate limit 需要退避重試，503 是暫時性錯誤可以重試。"),
                                Challenge.Option(id: "D", text: "200→處理資料, 401→檢查 token, 429→等待後重試, 503→放棄", explanation: "503 是「暫時」不可用，通常等待後重試即可，不需要直接放棄。"),
                            ],
                            correctAnswer: "C",
                            hints: ["2xx = 成功, 4xx = 客戶端錯誤, 5xx = 伺服器錯誤", "401 vs 403：401 是「未認證」，403 是「已認證但無權限」", "429 通常伴隨 Retry-After header 告訴你等多久"],
                            explanation: "HTTP 狀態碼分類：\n- 2xx 成功：200 OK, 201 Created, 204 No Content\n- 4xx 客戶端錯誤：400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests\n- 5xx 伺服器錯誤：500 Internal Error, 502 Bad Gateway, 503 Service Unavailable\n\n處理策略：4xx 通常不重試（除了 429），5xx 通常可以重試。",
                            frameworkTip: "面試時被問到 API 錯誤處理，先分類（4xx vs 5xx），再說明策略：4xx 修正請求，5xx 重試。特別提到 429 的 exponential backoff 策略，展示你有生產環境經驗。"
                        ),
                    ]
                ),
                Quest(
                    id: "20-2",
                    name: "requests GET",
                    description: "params、status code、json()",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "GET 請求",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是正確的 GET 請求？",
                            scenario: 
                            Challenge.Scenario(
                                title: "用 requests 呼叫 API",
                                narrative: "你要從一個公開 API 取得天氣資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "response = requests.get(\"https://api.example.com/weather\", params={\"city\": \"Taipei\"})", explanation: "正確！requests.get() 發送 GET 請求，params 自動加到 URL query string。"),
                                Challenge.Option(id: "B", text: "response = requests.get(\"https://api.example.com/weather\", body={\"city\": \"Taipei\"})", explanation: "GET 請求不用 body，用 params。body 是 POST 才用的。"),
                                Challenge.Option(id: "C", text: "response = requests.fetch(\"https://api.example.com/weather\")", explanation: "requests 沒有 fetch() 方法。fetch 是 JavaScript 的。"),
                                Challenge.Option(id: "D", text: "response = requests.get(\"https://api.example.com/weather?city=Taipei\")", explanation: "可以，但用 params 字典更乾淨、更安全（自動編碼特殊字元）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["requests.get(url, params={}) — params 會自動加到 URL 的 query string"],
                            explanation: "requests.get() 回傳 Response 物件。常用屬性：.status_code、.json()、.text、.headers。",
                            frameworkTip: "永遠檢查 response.status_code 後再用 response.json()。非 200 可能沒有有效的 JSON body。"
                        ),
                        Challenge(
                            id: 2,
                            name: "處理回應",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最安全的做法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "解析 API 回應",
                                narrative: "你收到一個 JSON 回應，想安全地取出巢狀資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "data = response.json()\ntemp = data[\"weather\"][\"temperature\"]", explanation: "如果 \"weather\" 或 \"temperature\" 不存在會拋出 KeyError。"),
                                Challenge.Option(id: "B", text: "if response.status_code == 200:\n    data = response.json()\n    temp = data.get(\"weather\", {}).get(\"temperature\")", explanation: "正確！先檢查 status code，再用 .get() 安全存取巢狀資料。"),
                                Challenge.Option(id: "C", text: "data = response.text\ntemp = data[\"weather\"][\"temperature\"]", explanation: ".text 是字串，不能用 dict 語法存取。要先 json.loads()。"),
                                Challenge.Option(id: "D", text: "data = response.json()\ntemp = data.temperature", explanation: "dict 不能用點語法存取。要用 [\"key\"] 或 .get(\"key\")。"),
                            ],
                            correctAnswer: "B",
                            hints: ["先檢查 status code → 再解析 JSON → 用 .get() 安全存取"],
                            explanation: "API 回應處理三步驟：(1) 檢查 status_code (2) 解析 JSON (3) 安全存取資料（用 .get() 防止 KeyError）。",
                            frameworkTip: "防禦性 API 呼叫模式：try/except + status check + .get()。"
                        ),
                        Challenge(
                            id: 3,
                            name: "寫一個 API 客戶端函式",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 fetch_weather(city, api_key)，模擬呼叫天氣 API：\n- URL: \"https://api.weather.example.com/current\"\n- 參數: {\"city\": city, \"units\": \"metric\"}\n- Header: {\"X-API-Key\": api_key}\n- 成功時回傳 dict: {\"city\": city, \"temp\": 回應中的 main.temp, \"description\": weather[0].description}\n- API 錯誤時回傳 dict: {\"error\": 狀態碼或錯誤訊息}\n注意：用 try/except 處理網路錯誤，用 .get() 安全取值。\n（提示：寫出完整邏輯，即使無法實際呼叫 API）",
                            scenario: 
                            Challenge.Scenario(
                                title: "天氣 API 封裝",
                                narrative: "你要把 API 呼叫封裝成一個容易使用的函式，讓團隊其他人直接呼叫。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["requests.get() 的 timeout 參數很重要，避免程式卡住", "巢狀 .get() 安全取值：data.get(\"main\", {}).get(\"temp\")", "用 requests.RequestException 捕捉所有 requests 相關錯誤"],
                            explanation: "這題練習封裝 API 呼叫的標準模式：設定參數/headers → 發送請求 → 檢查狀態 → 安全解析 → 錯誤處理。這是實務中最常見的 API 客戶端模式。",
                            frameworkTip: "API 封裝函式的四要素：設定（params/headers）、請求（get/post）、解析（json/get）、錯誤處理（try/except）。",
                            starterCode: """
                                import requests

                                def fetch_weather(city, api_key):
                                    url = "https://api.weather.example.com/current"
                                    # 設定 params 和 headers
                                    # 發送 GET 請求
                                    # 處理回應和錯誤
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
                            name: "API 分頁自動爬取",
                            type: .code,
                            difficulty: .hard,
                            question: "完成 fetch_all_products() 函式，使用 while 迴圈搭配 next_page token 自動爬取所有分頁。\n\nAPI 回傳格式：\n```json\n{\n  \"data\": [{\"id\": 1, \"name\": \"商品A\"}, ...],\n  \"next_page\": \"token_abc123\"  // null 表示最後一頁\n}\n```\n\n範例：\nfetch_all_products(\"https://api.example.com/products\")\n→ 回傳所有商品的 list",
                            scenario: 
                            Challenge.Scenario(
                                title: "自動爬取所有分頁資料",
                                narrative: "你在一家電商公司負責每天從供應商 API 拉取所有商品資料。API 每頁只回傳 100 筆，且使用 next_page token 機制。你需要寫一個自動爬取所有頁面的腳本。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 params dict 傳遞 page_token", "用 extend() 而非 append() 來合併 list", "data.get(\"next_page\") 在 key 不存在時回傳 None"],
                            explanation: "分頁爬取的標準模式：\n1. while True 無限迴圈\n2. 每次帶上 next_page token（第一頁不帶）\n3. 把當頁資料 extend 到結果 list\n4. 檢查 next_page 是否為 None/null，是就 break\n\n這個 pattern 在實務中非常常見，幾乎所有大型 API（GitHub, Stripe, Shopify）都用類似的分頁機制。",
                            frameworkTip: "面試時提到 API 分頁，說明你知道兩種常見模式：offset/limit（適合小資料集）和 cursor/token（適合大資料集，避免跳頁問題）。這展示你有處理真實 API 的經驗。",
                            starterCode: """
                                import requests

                                def fetch_all_products(base_url):
                                    all_products = []
                                    next_page = None

                                    while True:
                                        # 1. 組合 URL 參數（如果有 next_page token）
                                        # 2. 發送 GET 請求
                                        # 3. 把 data 加入 all_products
                                        # 4. 檢查是否還有下一頁
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
                            name: "Rate Limit 處理",
                            type: .code,
                            difficulty: .medium,
                            question: "完成 safe_request() 函式，當收到 429 狀態碼時，讀取 Retry-After header 的秒數並等待後重試。最多重試 3 次。\n\n範例：\nsafe_request(\"https://api.example.com/data\")\n→ 自動處理 429，成功時回傳 response.json()",
                            scenario: 
                            Challenge.Scenario(
                                title: "優雅處理 API 限流",
                                narrative: "你在批次呼叫合作夥伴的 API 時頻繁遇到 429 Too Many Requests 錯誤。你的主管要求你加上 rate limit 處理邏輯，讓腳本能自動等待並重試。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["response.headers.get(\"Retry-After\", 1) 讀取等待秒數", "time.sleep(wait_time) 暫停執行", "429 不需要 raise_for_status，等待後重試即可"],
                            explanation: "Rate limit 處理模式：\n1. 檢查 status_code 是否為 429\n2. 讀取 Retry-After header（API 告訴你要等多久）\n3. time.sleep() 等待指定秒數\n4. 自動重試，設定最大重試次數\n\n進階做法：用 exponential backoff（指數退避），每次等待時間加倍。",
                            frameworkTip: "面試時提到 rate limiting，除了說明基本的重試機制，提到 Retry-After header 和 exponential backoff 會展示你有生產環境的 API 串接經驗。",
                            starterCode: """
                                import requests
                                import time

                                def safe_request(url, max_retries=3):
                                    for attempt in range(max_retries):
                                        response = requests.get(url)

                                        if response.status_code == 200:
                                            return response.json()
                                        elif response.status_code == 429:
                                            # 讀取 Retry-After header，預設等 1 秒
                                            # 等待後繼續迴圈重試
                                            pass
                                        else:
                                            response.raise_for_status()

                                    raise Exception(f"仍然被限流，已重試 {max_retries} 次")
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

                                    raise Exception(f"仍然被限流，已重試 {max_retries} 次")
                            """
                        ),
                    ]
                ),
                Quest(
                    id: "20-3",
                    name: "POST 與認證",
                    description: "headers、API key、token",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "POST 請求",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的 POST 請求是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "發送資料到 API",
                                narrative: "你要透過 API 建立一個新使用者。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "requests.post(url, json={\"name\": \"Alice\", \"email\": \"alice@example.com\"})", explanation: "正確！json= 參數自動序列化並設定 Content-Type: application/json。"),
                                Challenge.Option(id: "B", text: "requests.get(url, json={\"name\": \"Alice\"})", explanation: "建立資源應該用 POST 不是 GET。GET 用於讀取。"),
                                Challenge.Option(id: "C", text: "requests.post(url, body={\"name\": \"Alice\"})", explanation: "requests 沒有 body 參數。用 json=（JSON）或 data=（表單）。"),
                                Challenge.Option(id: "D", text: "requests.post(url, {\"name\": \"Alice\"})", explanation: "位置引數會被當成 data（表單格式），不是 JSON。要明確用 json= 關鍵字引數。"),
                            ],
                            correctAnswer: "A",
                            hints: ["json= 會自動設定 Content-Type 和序列化。data= 是表單格式。"],
                            explanation: "POST 請求用 json= 傳 JSON 資料，requests 會自動設定 Content-Type: application/json 並序列化。data= 是表單格式（application/x-www-form-urlencoded）。",
                            frameworkTip: "GET = 讀取、POST = 建立、PUT = 完整更新、PATCH = 部分更新、DELETE = 刪除。"
                        ),
                        Challenge(
                            id: 2,
                            name: "API 認證",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最安全的做法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Key 認證",
                                narrative: "你要呼叫一個需要 API key 的服務。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把 API key 直接寫在程式碼裡", explanation: "不安全！如果程式碼進了 Git，API key 就洩漏了。"),
                                Challenge.Option(id: "B", text: "用環境變數儲存 API key，程式碼中用 os.environ 讀取", explanation: "正確！API key 存環境變數或 .env 檔案（加入 .gitignore），不進版本控制。"),
                                Challenge.Option(id: "C", text: "寫在 README 裡方便團隊使用", explanation: "README 通常會進 Git，不適合放 secret。"),
                                Challenge.Option(id: "D", text: "每次手動輸入", explanation: "不實際，且自動化腳本無法互動輸入。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Secret 永遠不進版本控制。用環境變數或 .env + .gitignore。"],
                            explanation: "安全的 API key 管理：存在環境變數 → 用 os.environ.get(\"API_KEY\") 讀取 → .env 檔案加入 .gitignore。可以用 python-dotenv 套件簡化。",
                            frameworkTip: "一旦 secret 進了 Git 歷史，即使刪除也留在記錄中。預防 > 補救。"
                        ),
                        Challenge(
                            id: 3,
                            name: "OAuth2 流程理解",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "一個 Web 應用程式要讓使用者用 Google 帳號登入，使用 OAuth2 Authorization Code Flow。以下哪個流程順序是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "OAuth2 認證流程",
                                narrative: "你在 Uber 面試中被問到如何設計一個第三方登入系統。面試官想了解你對 OAuth2 授權流程的掌握程度——這是現代 API 認證的業界標準。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "使用者點登入 → 前端直接拿 access_token → 呼叫 Google API", explanation: "這是 Implicit Flow（已不推薦），不是 Authorization Code Flow。Authorization Code Flow 多了一步用 code 換 token。"),
                                Challenge.Option(id: "B", text: "使用者點登入 → 導向 Google 授權頁 → 使用者同意 → Google 回傳 authorization code → 後端用 code + client_secret 換 access_token → 用 token 呼叫 API", explanation: "正確！Authorization Code Flow 的完整步驟。code 透過前端傳遞（可被攔截），但 access_token 只在後端用 client_secret 換取，確保安全。"),
                                Challenge.Option(id: "C", text: "後端直接用 client_id + client_secret 取得 access_token → 呼叫 Google API", explanation: "這是 Client Credentials Flow，用於 server-to-server 通訊，不涉及使用者授權。"),
                                Challenge.Option(id: "D", text: "使用者輸入 Google 帳密到你的 App → 你用帳密換 token → 呼叫 API", explanation: "這是 Resource Owner Password Flow（已廢棄），讓第三方 App 看到使用者密碼是嚴重的安全風險。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Authorization Code Flow 有兩步交換：先拿 code，再用 code 換 token", "code 是短期的、一次性的；access_token 才是用來呼叫 API 的", "client_secret 只存在後端，絕不暴露給前端"],
                            explanation: "OAuth2 Authorization Code Flow：\n1. 前端導向授權伺服器（如 Google）\n2. 使用者同意授權\n3. Google 回傳 authorization code 到你的 redirect_uri\n4. 後端用 code + client_id + client_secret 向 Google 換 access_token\n5. 用 access_token 呼叫 API\n\n為什麼要多一步？因為 code 透過瀏覽器傳遞（可能被攔截），但 token 只在後端安全地交換。",
                            frameworkTip: "面試時被問到 OAuth2，先畫出 Authorization Code Flow 的流程圖，再解釋為什麼要有「code 換 token」這一步（安全性）。提到 PKCE 擴展展示你知道最新安全實踐。"
                        ),
                        Challenge(
                            id: 4,
                            name: "Bearer Token 使用模式",
                            type: .code,
                            difficulty: .medium,
                            question: "完成 ApiClient 類別，讓它能自動在每個請求中帶上 Bearer Token。要支援 GET 和 POST 方法。\n\n範例：\n```python\nclient = ApiClient(\"https://api.company.com\", \"my_secret_token\")\nusers = client.get(\"/users\")\nclient.post(\"/users\", {\"name\": \"Alice\"})\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "API Token 認證實作",
                                narrative: "你在做一個內部工具，需要呼叫公司的 REST API。API 要求在 Header 中帶上 Bearer Token。你需要封裝一個帶認證的 API client 類別，方便團隊其他人使用。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Authorization header 格式：\"Bearer your_token_here\"", "用 f-string 組合 base_url + endpoint", "POST 用 json=data 自動序列化 dict 為 JSON"],
                            explanation: "Bearer Token 認證模式：\n- 在 HTTP Header 加上 Authorization: Bearer <token>\n- 這是 OAuth2 最常見的 token 使用方式\n- 封裝成 class 的好處：統一管理認證、base_url、錯誤處理\n\n進階做法：用 requests.Session() 可以持久化 headers，減少重複設定。",
                            frameworkTip: "面試時展示你會封裝 API client class，而不是到處重複寫 headers，說明你懂得 DRY 原則和程式碼復用。提到 requests.Session() 的效能優勢（連線重用）更加分。",
                            starterCode: """
                                import requests

                                class ApiClient:
                                    def __init__(self, base_url, token):
                                        self.base_url = base_url
                                        # 設定帶有 Bearer Token 的 headers
                                        self.headers = {}

                                    def get(self, endpoint, params=None):
                                        # 發送帶認證的 GET 請求
                                        pass

                                    def post(self, endpoint, data=None):
                                        # 發送帶認證的 POST 請求
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
                    name: "批次處理腳本",
                    description: "glob、os.listdir、多檔案處理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "檔案批次處理",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最 Pythonic 的做法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "處理多個 CSV",
                                narrative: "你的資料夾有 100 個 CSV 檔案，需要全部讀取合併。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "手動列出 100 個檔案名", explanation: "不現實且無法維護。"),
                                Challenge.Option(id: "B", text: "from glob import glob\nfiles = glob(\"data/*.csv\")\nfor f in files:\n    df = pd.read_csv(f)", explanation: "正確！glob 用萬用字元 * 匹配檔案路徑，適合批次處理。"),
                                Challenge.Option(id: "C", text: "os.system(\"cat data/*.csv > combined.csv\")", explanation: "不安全且不跨平台。用 Python 處理更可靠。"),
                                Challenge.Option(id: "D", text: "for i in range(100):\n    pd.read_csv(f\"data/file_{i}.csv\")", explanation: "假設檔名有固定格式，但實際檔名可能不是這樣。"),
                            ],
                            correctAnswer: "B",
                            hints: ["glob(\"pattern\") 回傳匹配的檔案路徑 list"],
                            explanation: "glob 模式：* 匹配任意字元，** 匹配任意深度目錄。pathlib.Path().glob() 是更現代的選擇。",
                            frameworkTip: "批次處理模式：找檔案（glob）→ 迭代處理（for）→ 收集結果（list/concat）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "合併多個 DataFrame",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最有效率的做法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "合併 CSV 檔案",
                                narrative: "你用 glob 找到了 100 個結構相同的 CSV，要合併成一個 DataFrame。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df = pd.DataFrame()\nfor f in files:\n    df = df.append(pd.read_csv(f))", explanation: ".append() 每次都複製整個 DataFrame，100 次就複製 100 次，非常慢。"),
                                Challenge.Option(id: "B", text: "dfs = [pd.read_csv(f) for f in files]\ndf = pd.concat(dfs, ignore_index=True)", explanation: "正確！先用 list comprehension 讀取所有 CSV，再一次 concat。效率高很多。"),
                                Challenge.Option(id: "C", text: "df = pd.read_csv(files)", explanation: "read_csv 不接受 list，只能讀一個檔案。"),
                                Challenge.Option(id: "D", text: "df = pd.merge(files)", explanation: "merge 是合併不同結構的表，不是堆疊相同結構的。"),
                            ],
                            correctAnswer: "B",
                            hints: ["先收集到 list，最後一次 concat。避免在迴圈裡 append。"],
                            explanation: "pd.concat 一次合併比迴圈 append 快得多。收集到 list → 一次 concat 是 pandas 的最佳實踐。",
                            frameworkTip: "pandas 效能原則：避免在迴圈中修改 DataFrame。收集結果 → 一次操作。"
                        ),
                        Challenge(
                            id: 3,
                            name: "批次 API 資料處理",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 process_api_pages(pages_data)，接收一個 list of dicts（模擬多頁 API 回應），每個 dict 格式：{\"page\": 1, \"data\": [{\"id\": 1, \"name\": \"...\", \"value\": 100}]}。\n完成以下操作：\n1. 合併所有頁面的 data 成一個 list\n2. 去除 id 重複的記錄（保留第一次出現的）\n3. 按 value 降序排列\n4. 回傳 dict: {\"total_records\": 總筆數, \"total_value\": value 總和, \"top_3\": 前三筆的 name list, \"data\": 完整資料}",
                            scenario: 
                            Challenge.Scenario(
                                title: "多頁資料蒐集",
                                narrative: "你需要從分頁 API 收集所有資料並處理成報表格式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 extend 合併多個 list", "用 set 追蹤已出現的 id 來去重", "sorted + lambda 排序，[:3] 取前三"],
                            explanation: "這題模擬真實的 API 資料處理流程：合併分頁 → 去重 → 排序 → 聚合。用 set 追蹤 id 去重是常見且高效的模式。",
                            frameworkTip: "批次資料處理流程：Collect（合併）→ Deduplicate（去重）→ Sort（排序）→ Aggregate（聚合）。",
                            starterCode: """
                                def process_api_pages(pages_data):
                                    # 1. 合併所有頁面的 data
                                    # 2. 去除 id 重複
                                    # 3. 排序
                                    # 4. 組裝結果
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
                            name: "async/await 基礎概念",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "關於 Python 的 async/await，以下哪個說法是正確的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Python 非同步程式設計",
                                narrative: "你在 Meta 面試中被問到 Python 的非同步程式設計。面試官想知道你是否理解 async/await 的核心概念——這對處理大量 API 請求的批次腳本至關重要。Python 3.11+ 大幅改善了 asyncio 的效能和錯誤訊息。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "async 函式會自動在新的 thread 中執行，所以可以真正平行處理", explanation: "asyncio 是單執行緒的！它用 event loop 在一個 thread 中切換任務，不是多執行緒。"),
                                Challenge.Option(id: "B", text: "await 會暫停當前 coroutine 的執行，讓 event loop 去處理其他任務，等 I/O 完成後再回來繼續", explanation: "正確！await 的本質是「把控制權交還給 event loop」。當一個 coroutine 在等待 I/O（如 API 回應），event loop 可以去執行其他 coroutine。這就是 concurrency（並發）而非 parallelism（平行）。"),
                                Challenge.Option(id: "C", text: "asyncio.gather() 會把多個任務分配到不同的 CPU 核心上執行", explanation: "asyncio 是單執行緒的，不使用多核心。要用多核心需要 multiprocessing 模組。"),
                                Challenge.Option(id: "D", text: "任何函式加上 async 關鍵字就會變快，因為它啟用了非同步 I/O", explanation: "加 async 只是讓函式變成 coroutine，不會自動變快。需要搭配 await 和非同步 I/O 操作才有效。CPU 密集型任務用 async 反而可能更慢。"),
                            ],
                            correctAnswer: "B",
                            hints: ["asyncio 是單執行緒的 cooperative multitasking", "await 是 coroutine 的「讓出控制權」點", "適合 I/O 密集型任務（API 呼叫、檔案讀寫），不適合 CPU 密集型"],
                            explanation: "Python async/await 核心概念：\n- async def 定義 coroutine（協程）\n- await 暫停當前 coroutine，讓 event loop 處理其他任務\n- 單執行緒 + event loop = concurrency（不是 parallelism）\n- 適合場景：大量 API 呼叫、資料庫查詢等 I/O 等待\n\nPython 3.11+ 改善：更好的錯誤訊息、TaskGroup（取代 gather 的結構化並發）、效能提升約 10-60%。",
                            frameworkTip: "面試時區分 concurrency vs parallelism 是關鍵：asyncio 是 concurrency（一個人同時處理多件事），multiprocessing 是 parallelism（多人各做一件事）。這個區別是 Meta 常考的概念題。"
                        ),
                        Challenge(
                            id: 5,
                            name: "asyncio.gather 並發請求",
                            type: .code,
                            difficulty: .hard,
                            question: "完成 fetch_all_endpoints() 函式，使用 asyncio + aiohttp 並發呼叫多個 API endpoint。\n\n範例：\n```python\nurls = [\n    \"https://api.example.com/sales\",\n    \"https://api.example.com/users\",\n    \"https://api.example.com/products\"\n]\nresults = asyncio.run(fetch_all_endpoints(urls))\n# → [sales_data, users_data, products_data]\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "並發 API 請求加速批次處理",
                                narrative: "你的團隊每天需要從 50 個不同的 API endpoint 拉取資料。同步呼叫需要 5 分鐘，主管要求你用非同步方式加速。你需要用 asyncio.gather 來並發執行所有請求。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["aiohttp 用 async with session.get(url) as response 發送請求", "用 list comprehension 建立 task 列表", "asyncio.gather(*tasks) 接受多個 coroutine 並發執行"],
                            explanation: "asyncio.gather 並發模式：\n1. 建立 aiohttp.ClientSession（共用連線池）\n2. 用 list comprehension 建立所有 coroutine task\n3. await asyncio.gather(*tasks) 並發執行\n4. 回傳結果的順序與輸入順序一致\n\n效能對比：同步 50 個請求（每個 1 秒）= 50 秒，asyncio.gather = 約 1 秒（所有請求同時進行）。",
                            frameworkTip: "面試時提到並發請求，先解釋為什麼用 asyncio 而非 threading（GIL 限制下，I/O 密集型任務 asyncio 更輕量且易管理）。然後畫出 event loop 的運作方式，展示你真正理解底層機制。",
                            starterCode: """
                                import asyncio
                                import aiohttp

                                async def fetch_one(session, url):
                                    # 用 aiohttp 發送單一 GET 請求
                                    pass

                                async def fetch_all_endpoints(urls):
                                    # 用 asyncio.gather 並發呼叫所有 URL
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
                    name: "自動報表生成",
                    description: "讀資料 + 計算 + 輸出",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "報表自動化流程",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "自動化報表的正確流程是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "每日報表",
                                narrative: "你需要每天自動產生銷售報表。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "手動打開 Excel → 複製貼上 → 存檔", explanation: "這不是自動化。"),
                                Challenge.Option(id: "B", text: "讀取資料源 → 計算指標 → 格式化 → 輸出檔案", explanation: "正確！自動化報表的標準流程：Input → Process → Output。"),
                                Challenge.Option(id: "C", text: "直接把原始資料寄給主管", explanation: "主管要的是整理過的 insight，不是原始資料。"),
                                Challenge.Option(id: "D", text: "只計算不輸出", explanation: "報表的目的是給人看，必須有輸出。"),
                            ],
                            correctAnswer: "B",
                            hints: ["自動化 = 讓程式做重複的工作"],
                            explanation: "報表自動化：(1) 讀取資料（CSV/DB/API）(2) 清洗和計算 (3) 格式化輸出（CSV/Excel/PDF）(4) 可選：自動發送（email/Slack）。",
                            frameworkTip: "自動化的 ROI：如果一個任務每天花 30 分鐘，花 2 小時寫腳本，4 天就回本。"
                        ),
                        Challenge(
                            id: 2,
                            name: "輸出 Excel",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如何用 pandas 輸出多 sheet 的 Excel？",
                            scenario: 
                            Challenge.Scenario(
                                title: "輸出格式",
                                narrative: "主管要 Excel 格式的報表（多個 sheet）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "df.to_excel(\"report.xlsx\")", explanation: "只能輸出一個 sheet。多 sheet 需要 ExcelWriter。"),
                                Challenge.Option(id: "B", text: "with pd.ExcelWriter(\"report.xlsx\") as writer:\n    df1.to_excel(writer, sheet_name=\"Summary\")\n    df2.to_excel(writer, sheet_name=\"Details\")", explanation: "正確！ExcelWriter 搭配 with 可以輸出多個 sheet 到同一個 Excel 檔案。"),
                                Challenge.Option(id: "C", text: "pd.to_excel([df1, df2], \"report.xlsx\")", explanation: "pd.to_excel 不能接受 list。"),
                                Challenge.Option(id: "D", text: "df1.to_excel(\"report.xlsx\")\ndf2.to_excel(\"report.xlsx\")", explanation: "第二個會覆蓋第一個。"),
                            ],
                            correctAnswer: "B",
                            hints: ["ExcelWriter 是 pandas 的多 sheet Excel 寫入工具"],
                            explanation: "pd.ExcelWriter 搭配 with 語句，可以把多個 DataFrame 寫入同一個 Excel 的不同 sheet。需要安裝 openpyxl 套件。",
                            frameworkTip: "輸出格式選擇：給程式用 → CSV/JSON。給人看 → Excel。給報告 → PDF。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Exponential Backoff 重試策略",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個 retry_with_backoff 裝飾器，功能：\n1. 最多重試 max_retries 次\n2. 每次重試等待時間加倍（1s, 2s, 4s, 8s...）\n3. 只在指定的例外類型時重試\n4. 超過重試次數後拋出最後一個例外\n\n範例：\n```python\n@retry_with_backoff(max_retries=3, exceptions=(ConnectionError, TimeoutError))\ndef call_api():\n    response = requests.get(\"https://api.example.com/data\")\n    response.raise_for_status()\n    return response.json()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "指數退避重試裝飾器",
                                narrative: "你在 Amazon 面試中被要求實作一個 retry decorator。在分散式系統中，API 可能因為暫時性錯誤而失敗。Exponential backoff 是業界標準的重試策略——每次重試等待時間加倍，避免同時大量重試壓垮伺服器。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用三層巢狀函式：外層接參數、中層接函式、內層是 wrapper", "wait_time = 2 ** attempt 產生 1, 2, 4, 8... 的等待時間", "最後一次重試失敗後用 raise（不帶參數）重新拋出原始例外"],
                            explanation: "Exponential backoff 重試模式：\n- 等待時間：2^0=1s, 2^1=2s, 2^2=4s, 2^3=8s...\n- 為什麼加倍？避免多個 client 同時重試（thundering herd problem）\n- functools.wraps 保留原函式的 __name__ 和 __doc__\n- raise 不帶參數：重新拋出當前捕獲的例外\n\n進階做法：加上 jitter（隨機延遲），如 wait_time = 2**attempt + random.uniform(0, 1)",
                            frameworkTip: "這是 Amazon 的經典面試題。答題時先畫出等待時間的序列（1, 2, 4, 8s），解釋為什麼要用指數增長而不是固定間隔。提到 jitter（隨機抖動）避免 thundering herd 會讓面試官非常滿意。",
                            starterCode: """
                                import time
                                import functools

                                def retry_with_backoff(max_retries=3, exceptions=(Exception,)):
                                    def decorator(func):
                                        @functools.wraps(func)
                                        def wrapper(*args, **kwargs):
                                            # 實作 exponential backoff 重試邏輯
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
                            name: "HTTP 狀態碼決策邏輯",
                            type: .code,
                            difficulty: .medium,
                            question: "完成 handle_response() 函式，根據 HTTP 狀態碼決定處理策略：\n\n- 200-299：成功，回傳 {\"status\": \"success\", \"data\": response.json()}\n- 401/403：認證問題，回傳 {\"status\": \"auth_error\", \"message\": \"...\"}\n- 429：限流，回傳 {\"status\": \"retry\", \"wait_seconds\": Retry-After header 值}\n- 500-599：伺服器錯誤，回傳 {\"status\": \"retry\", \"wait_seconds\": 5}\n- 其他：回傳 {\"status\": \"error\", \"code\": status_code}",
                            scenario: 
                            Challenge.Scenario(
                                title: "智慧 API 回應處理器",
                                narrative: "你在建立一個自動化報表系統，需要從多個 API 拉取資料。不同的 HTTP 狀態碼需要不同的處理策略：有些要重試、有些要記錄錯誤、有些要直接跳過。你需要寫一個統一的回應處理函式。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 200 <= code <= 299 檢查 2xx 範圍", "用 in (401, 403) 檢查多個特定值", "response.headers.get(\"Retry-After\", 1) 讀取 header 並提供預設值"],
                            explanation: "API 回應處理的最佳實踐：\n1. 用範圍檢查（200-299）而非只檢查 200\n2. 區分「可重試」和「不可重試」的錯誤\n3. 429 讀取 Retry-After header\n4. 5xx 通常是暫時性錯誤，可以重試\n5. 4xx（除了 429）通常需要修正請求，不該盲目重試\n\n這種決策模式可以搭配前面的 exponential backoff 使用。",
                            frameworkTip: "面試時展示你對 HTTP 狀態碼的分類思維：2xx 成功、4xx 客戶端問題（通常不重試）、5xx 伺服器問題（可重試）、429 是特殊的 4xx（需要重試）。這種系統性思考方式會讓面試官印象深刻。",
                            starterCode: """
                                def handle_response(response):
                                    code = response.status_code

                                    # 根據狀態碼決定處理策略
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
                    name: "API 資料蒐集腳本（Boss）",
                    description: "設計完整的 API 資料蒐集流程",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: API 資料蒐集",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "自動蒐集 API 資料",
                                narrative: "你需要每天從一個 REST API 蒐集產品價格資料。API 規格：\n- GET /products?page=1&per_page=50（分頁）\n- 回應：{\"data\": [...], \"total_pages\": 10}\n- 需要 API key 認證（Header: X-API-Key）\n- Rate limit: 每分鐘 60 次\n\n你需要：蒐集所有頁面的資料，存成 CSV，處理錯誤。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["分頁邏輯：先拿第一頁知道 total_pages，再迴圈到最後一頁", "用 time.sleep(1) 簡單地控制頻率"],
                            explanation: "實戰 API 腳本的關鍵：分頁處理、rate limit、錯誤處理、有意義的 log。",
                            frameworkTip: "API 腳本三原則：Respect rate limits、Handle errors gracefully、Log everything。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 21,
            name: "資料庫與 Backend 基礎",
            emoji: "🗄️",
            description: "Python 連接 SQLite、CRUD、Flask/FastAPI 入門",
            quests: [
                Quest(
                    id: "21-1",
                    name: "Python + SQLite",
                    description: "sqlite3 模組、connect、cursor",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "sqlite3 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的連接方式是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "連接資料庫",
                                narrative: "你要用 Python 連接一個 SQLite 資料庫。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "import sqlite3\nconn = sqlite3.connect(\"mydb.db\")\ncursor = conn.cursor()", explanation: "正確！connect 建立連線，cursor 用來執行 SQL。"),
                                Challenge.Option(id: "B", text: "import sql\ndb = sql.open(\"mydb.db\")", explanation: "Python 沒有 sql 模組。是 sqlite3。"),
                                Challenge.Option(id: "C", text: "from database import connect\nconn = connect(\"mydb.db\")", explanation: "沒有 database 模組。"),
                                Challenge.Option(id: "D", text: "import sqlite3\nconn = sqlite3.open(\"mydb.db\")", explanation: "是 connect() 不是 open()。"),
                            ],
                            correctAnswer: "A",
                            hints: ["sqlite3 是 Python 內建模組，不需要 pip install"],
                            explanation: "sqlite3 是 Python 內建模組。流程：connect → cursor → execute → fetchall → close。推薦用 with 語句自動管理連線。",
                            frameworkTip: "開發和測試用 SQLite（輕量、無需安裝），生產用 PostgreSQL 或 MySQL。"
                        ),
                        Challenge(
                            id: 2,
                            name: "參數化查詢",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪種方式最安全？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SQL Injection 防護",
                                narrative: "你要根據使用者輸入查詢資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "cursor.execute(f\"SELECT * FROM users WHERE name = '{name}'\")", explanation: "危險！直接拼接字串容易被 SQL injection 攻擊。"),
                                Challenge.Option(id: "B", text: "cursor.execute(\"SELECT * FROM users WHERE name = ?\", (name,))", explanation: "正確！用 ? 佔位符和 tuple 傳參數，sqlite3 會自動處理跳脫。"),
                                Challenge.Option(id: "C", text: "cursor.execute(\"SELECT * FROM users WHERE name = \" + name)", explanation: "跟 A 一樣危險，字串拼接。"),
                                Challenge.Option(id: "D", text: "cursor.execute(\"SELECT * FROM users\").filter(name=name)", explanation: "cursor 沒有 filter 方法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["永遠用參數化查詢（? 佔位符），不要拼接字串"],
                            explanation: "參數化查詢用 ? 佔位符，sqlite3 自動處理特殊字元跳脫。這是防止 SQL injection 的標準做法。",
                            frameworkTip: "安全規則：任何來自使用者的輸入都不能直接拼進 SQL 字串。"
                        ),
                        Challenge(
                            id: 3,
                            name: "建立資料表並查詢",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 setup_and_query(products)，接收 list of tuples（name, category, price）：\n1. 建立 in-memory SQLite 資料庫（\":memory:\"）\n2. 建立 products 表（id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, category TEXT, price REAL）\n3. 插入所有資料\n4. 查詢：每個 category 的平均 price，按平均 price 降序\n5. 回傳查詢結果為 list of dicts：[{\"category\": \"...\", \"avg_price\": ...}]",
                            scenario: 
                            Challenge.Scenario(
                                title: "產品資料庫",
                                narrative: "你需要用 SQLite 建立一個產品資料庫，並寫查詢函式來分析資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["\":memory:\" 建立不存在於硬碟的暫時資料庫", "executemany 可以一次插入多筆資料", "SQL 的 GROUP BY + AVG 做分組平均"],
                            explanation: "這題練習 SQLite 的完整流程：connect → CREATE TABLE → INSERT（executemany 批次插入）→ SELECT（GROUP BY + AVG）→ 結果轉換。in-memory 資料庫適合測試和小量資料分析。",
                            frameworkTip: "開發測試用 \":memory:\" 資料庫，不需要清理檔案。生產環境用檔案型資料庫。",
                            starterCode: """
                                import sqlite3

                                def setup_and_query(products):
                                    # 建立 in-memory 資料庫
                                    # 建表、插入資料
                                    # 查詢每個 category 的平均 price
                                    # 回傳 list of dicts
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
                            name: "安全 CRUD 函式",
                            type: .code,
                            difficulty: .hard,
                            question: "寫一個函式 search_products(conn, filters)，接收 SQLite 連線和篩選條件 dict（可能的 key：category, min_price, max_price），動態建立 WHERE 子句並回傳結果。\n例如：filters={\"category\": \"Electronics\", \"min_price\": 100} 應生成 WHERE category = ? AND price >= ?\n所有條件都可選（filters 可能是空 dict）。回傳 list of dicts。",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料庫 CRUD 封裝",
                                narrative: "你要封裝一組安全的 CRUD 函式供團隊使用，確保所有查詢都是參數化的。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["動態建立 conditions list 和 params list", "用 \" AND \".join(conditions) 合併條件", "sqlite3.Row 讓你可以用 dict(row) 轉換結果"],
                            explanation: "這題練習動態 SQL 建構的安全模式：分別收集 conditions 和 params，最後用 JOIN 合併。配合參數化查詢（?）確保安全。sqlite3.Row 讓結果可以像 dict 一樣存取。",
                            frameworkTip: "動態 SQL 安全模式：永遠用 ? 佔位符，永遠不拼接使用者輸入。用 list 收集條件再 JOIN。",
                            starterCode: """
                                import sqlite3

                                def search_products(conn, filters):
                                    # 動態建立 SQL WHERE 子句
                                    # 使用參數化查詢（? 佔位符）
                                    # 回傳 list of dicts
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
                            name: "SQL Injection 攻擊與防禦",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪段程式碼能正確防禦 SQL Injection？\n\n```python\n# 寫法 A — 字串拼接\ncursor.execute(\"SELECT * FROM users WHERE name = '\" + user_input + \"'\")\n\n# 寫法 B — f-string\ncursor.execute(f\"SELECT * FROM users WHERE name = '{user_input}'\")\n\n# 寫法 C — 參數化查詢\ncursor.execute(\"SELECT * FROM users WHERE name = ?\", (user_input,))\n\n# 寫法 D — 手動過濾引號\nsafe = user_input.replace(\"'\", \"\")\ncursor.execute(f\"SELECT * FROM users WHERE name = '{safe}'\")\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "SQL Injection — 最危險的安全漏洞",
                                narrative: "你在 Google 面試中被問到一段資料庫查詢程式碼。面試官要你指出安全漏洞，並說明正確的防禦方式。這是每個後端工程師必須掌握的基礎安全知識。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "寫法 A（字串拼接）", explanation: "字串拼接是 SQL Injection 的典型漏洞。攻擊者輸入 ' OR 1=1 -- 就能繞過驗證。"),
                                Challenge.Option(id: "B", text: "寫法 B（f-string）", explanation: "f-string 本質上跟字串拼接一樣，同樣存在 SQL Injection 風險。"),
                                Challenge.Option(id: "C", text: "寫法 C（參數化查詢）", explanation: "正確！參數化查詢（Parameterized Query）讓資料庫引擎自動處理跳脫字元，使用者輸入永遠被視為「資料」而非「SQL 指令」，從根本上防禦 SQL Injection。"),
                                Challenge.Option(id: "D", text: "寫法 D（手動過濾引號）", explanation: "手動過濾不可靠，攻擊者可以用 Unicode 編碼、雙重跳脫等方式繞過。永遠不要自己做 SQL 消毒。"),
                            ],
                            correctAnswer: "C",
                            hints: ["SQL Injection 的核心問題是使用者輸入被當作 SQL 指令執行", "參數化查詢用 ? 或 %s 作為佔位符", "手動過濾永遠不夠安全"],
                            explanation: "SQL Injection 是 OWASP Top 10 第一名的安全漏洞。防禦方式只有一個正確答案：參數化查詢（Parameterized Query）。\n\n```python\n# 正確寫法\ncursor.execute(\"SELECT * FROM users WHERE name = ?\", (user_input,))\n\n# PostgreSQL/MySQL 用 %s\ncursor.execute(\"SELECT * FROM users WHERE name = %s\", (user_input,))\n```\n\n資料庫會將參數視為「純資料」，即使輸入包含 SQL 語法也不會被執行。",
                            frameworkTip: "面試中被問到資料庫安全，第一時間說「參數化查詢」。如果能補充 OWASP Top 10 和 ORM 自動防禦（如 SQLAlchemy），會大幅加分。Google 非常重視安全意識。"
                        ),
                        Challenge(
                            id: 6,
                            name: "連線的 Context Manager",
                            type: .code,
                            difficulty: .medium,
                            question: "完成以下函式，使用 context manager（with 語句）安全地執行 SQLite 操作。函式要：\n1. 用 with 開啟連線\n2. 建立 orders 資料表（id, product, amount）\n3. 插入一筆訂單\n4. 確保連線自動關閉\n\n```python\nimport sqlite3\n\ndef create_order(db_path, product, amount):\n    # 用 with 管理連線，確保自動 commit 和關閉\n    pass\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料庫連線的資源管理",
                                narrative: "你在開發一個電商平台的訂單系統。資深工程師告訴你，資料庫連線必須用 context manager 管理，否則連線洩漏會導致伺服器在高流量時當機。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["sqlite3.connect() 支援 with 語句", "with 區塊結束時會自動處理連線", "記得用參數化查詢防止 SQL Injection"],
                            explanation: "Context Manager（with 語句）確保資源在使用完畢後自動釋放：\n\n```python\nwith sqlite3.connect(db_path) as conn:\n    # conn 在 with 區塊結束時自動處理\n    # 如果沒有例外，自動 commit\n    # 如果有例外，自動 rollback\n```\n\n不用 with 的話，忘記 conn.close() 會導致連線洩漏。",
                            frameworkTip: "面試時展示你懂得用 context manager 管理資源（檔案、連線、鎖），說明你理解 Python 的資源管理最佳實踐。這在 Google 和 Amazon 面試中是加分項。",
                            starterCode: """
                                import sqlite3

                                def create_order(db_path, product, amount):
                                    # 用 with 管理連線，確保自動 commit 和關閉
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
                    name: "CRUD 操作",
                    description: "INSERT/SELECT/UPDATE/DELETE",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CRUD 對應",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "CRUD 四個字母分別代表什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "CRUD 概念",
                                narrative: "CRUD 是資料操作的四個基本動作。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Create, Read, Update, Delete", explanation: "正確！對應 SQL 的 INSERT, SELECT, UPDATE, DELETE。"),
                                Challenge.Option(id: "B", text: "Connect, Read, Upload, Download", explanation: "不對。CRUD 是資料操作，不是網路操作。"),
                                Challenge.Option(id: "C", text: "Create, Remove, Update, Destroy", explanation: "R 是 Read，D 是 Delete。"),
                                Challenge.Option(id: "D", text: "Copy, Read, Update, Drop", explanation: "C 是 Create，D 是 Delete。"),
                            ],
                            correctAnswer: "A",
                            hints: ["CRUD 對應 HTTP 方法：POST/GET/PUT/DELETE"],
                            explanation: "CRUD → SQL：Create=INSERT, Read=SELECT, Update=UPDATE, Delete=DELETE。CRUD → HTTP：Create=POST, Read=GET, Update=PUT, Delete=DELETE。",
                            frameworkTip: "幾乎所有應用程式的核心都是 CRUD。理解 CRUD 就理解了資料流。"
                        ),
                        Challenge(
                            id: 2,
                            name: "commit 的重要性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最可能的原因是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料沒存到",
                                narrative: "你執行了 INSERT 但關閉程式後資料消失了。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SQL 語法錯誤", explanation: "語法錯誤會報錯，不會「執行成功但資料消失」。"),
                                Challenge.Option(id: "B", text: "忘了呼叫 conn.commit()", explanation: "正確！sqlite3 預設不自動提交。INSERT/UPDATE/DELETE 後必須 commit() 才會真正寫入。"),
                                Challenge.Option(id: "C", text: "資料庫檔案損壞", explanation: "可能但不常見。忘記 commit 是最常見的原因。"),
                                Challenge.Option(id: "D", text: "cursor 沒有關閉", explanation: "cursor 不關閉不會導致資料丟失。"),
                            ],
                            correctAnswer: "B",
                            hints: ["寫入操作（INSERT/UPDATE/DELETE）需要 commit 才會生效"],
                            explanation: "資料庫的 transaction 機制：修改操作在 commit 前都可以 rollback。忘記 commit 是初學者最常見的 bug。",
                            frameworkTip: "模式：execute → commit → 驗證。或用 with conn: 自動 commit。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Transaction 與 ACID 原則",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "在正確使用資料庫 Transaction 的情況下，以下程式碼執行到一半時伺服器當機，會發生什麼？\n\n```python\nconn = sqlite3.connect(\"bank.db\")\ncursor = conn.cursor()\ntry:\n    cursor.execute(\"UPDATE accounts SET balance = balance - 1000 WHERE id = 1\")  # 扣款\n    # ← 伺服器在這裡當機\n    cursor.execute(\"UPDATE accounts SET balance = balance + 1000 WHERE id = 2\")  # 入帳\n    conn.commit()\nexcept:\n    conn.rollback()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "伺服器當機時資料會怎樣？",
                                narrative: "你在一家支付公司面試。面試官問你：「如果使用者正在轉帳，從 A 帳戶扣款後、還沒加到 B 帳戶時伺服器當機了，會發生什麼事？」這是考 Transaction 和 ACID 的核心問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A 帳戶被扣 1000，B 帳戶沒收到錢（資料不一致）", explanation: "如果使用 Transaction，在 commit 之前的所有操作都不會被永久寫入。"),
                                Challenge.Option(id: "B", text: "兩個帳戶餘額都不變（Transaction 自動 rollback）", explanation: "正確！這就是 ACID 中 Atomicity（原子性）的保證。Transaction 要嘛全部成功（commit），要嘛全部失敗（rollback）。伺服器當機時沒有 commit，所以所有變更都會被回滾。"),
                                Challenge.Option(id: "C", text: "取決於作業系統是否有將資料寫入磁碟", explanation: "ACID 的 Durability 保證只有 commit 後的資料才會被持久化。未 commit 的資料不會保留。"),
                                Challenge.Option(id: "D", text: "需要手動執行 rollback 才能回復", explanation: "資料庫重啟後會自動回滾未 commit 的 transaction，不需手動處理。"),
                            ],
                            correctAnswer: "B",
                            hints: ["ACID 中的 A 代表 Atomicity（原子性）", "Transaction 在 commit 之前的所有操作都是暫時的", "資料庫當機重啟後會自動回滾未完成的 transaction"],
                            explanation: "ACID 四大原則：\n- **Atomicity（原子性）**：Transaction 中的操作要嘛全部成功，要嘛全部失敗\n- **Consistency（一致性）**：Transaction 結束後資料庫必須處於合法狀態\n- **Isolation（隔離性）**：並行的 Transaction 彼此不干擾\n- **Durability（持久性）**：commit 後的資料永久保存，即使系統當機\n\n銀行轉帳是解釋 Atomicity 的經典案例。",
                            frameworkTip: "面試時被問到 ACID，用銀行轉帳的例子來解釋最清楚。特別強調 Atomicity：「Transaction 就像一個原子操作，不可分割」。這是資料庫面試必考題。"
                        ),
                        Challenge(
                            id: 4,
                            name: "批次操作效率",
                            type: .code,
                            difficulty: .medium,
                            question: "將以下逐筆插入的低效寫法，改寫為使用 executemany() 的批次操作。\n\n```python\n# 原始低效寫法（每筆都 commit）\nfor product in products:\n    cursor.execute(\"INSERT INTO products (name, price) VALUES (?, ?)\",\n                   (product[\"name\"], product[\"price\"]))\n    conn.commit()  # 每筆都 commit，效能極差\n```\n\n改寫成高效的批次操作：",
                            scenario: 
                            Challenge.Scenario(
                                title: "批次匯入 10 萬筆資料",
                                narrative: "你在電商公司負責商品資料匯入。同事寫了一個迴圈逐筆 INSERT，匯入 10 萬筆商品要花 45 分鐘。你需要用批次操作將時間縮短到 10 秒內。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["executemany() 接收一個 SQL 和一個參數 list", "用 list comprehension 轉換資料格式", "只在所有資料插入後 commit 一次"],
                            explanation: "批次操作的效能差異：\n\n```python\n# 慢：N 次 execute + N 次 commit = N 次磁碟 I/O\nfor item in data:\n    cursor.execute(sql, item)\n    conn.commit()\n\n# 快：1 次 executemany + 1 次 commit = 1 次磁碟 I/O\ncursor.executemany(sql, data_list)\nconn.commit()\n```\n\n效能差距可達 100-1000 倍，因為每次 commit 都涉及磁碟寫入。",
                            frameworkTip: "面試時提到資料庫效能優化，「批次操作 + 減少 commit 次數」是最基本也最有效的方法。展示你理解 I/O 是效能瓶頸。",
                            starterCode: """
                                import sqlite3

                                def batch_insert(db_path, products):
                                    # products = [{"name": "商品A", "price": 100}, ...]
                                    # 用 executemany 批次插入，最後只 commit 一次
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
                    name: "ORM 概念",
                    description: "SQLAlchemy 基礎概念",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ORM vs 原生 SQL",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "ORM 的主要優勢是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "選擇資料存取方式",
                                narrative: "團隊在討論用原生 SQL 還是 ORM（SQLAlchemy）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "效能比原生 SQL 好", explanation: "ORM 通常比原生 SQL 慢（有抽象層的開銷）。"),
                                Challenge.Option(id: "B", text: "用 Python 物件操作資料庫，程式碼更容易維護", explanation: "正確！ORM 把資料表映射成 Python class，操作更直覺，也自動處理 SQL injection。"),
                                Challenge.Option(id: "C", text: "不需要資料庫", explanation: "ORM 仍然需要資料庫，只是用 Python 語法代替 SQL。"),
                                Challenge.Option(id: "D", text: "支援更多資料庫功能", explanation: "原生 SQL 通常能存取更多資料庫特定功能。ORM 有時無法表達複雜查詢。"),
                            ],
                            correctAnswer: "B",
                            hints: ["ORM = Object-Relational Mapping，用物件操作資料庫"],
                            explanation: "ORM 優勢：程式碼可讀性、自動防 SQL injection、資料庫無關（換 DB 不改程式碼）。劣勢：效能損耗、複雜查詢不方便。",
                            frameworkTip: "簡單 CRUD 用 ORM，複雜分析查詢用原生 SQL。兩者可以混用。"
                        ),
                        Challenge(
                            id: 2,
                            name: "N+1 查詢問題",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下 SQLAlchemy ORM 程式碼會產生多少次 SQL 查詢？\n\n```python\n# Model 定義\nclass Order(Base):\n    id = Column(Integer, primary_key=True)\n    customer_id = Column(Integer, ForeignKey(\"customers.id\"))\n    customer = relationship(\"Customer\")  # Lazy Loading（預設）\n\n# 查詢程式碼\norders = session.query(Order).all()  # 查詢 1：取得所有訂單\nfor order in orders:                  # 100 筆訂單\n    print(order.customer.name)        # 每次存取都觸發一次查詢\n```\n\n假設有 100 筆訂單，總共會產生幾次 SQL 查詢？",
                            scenario: 
                            Challenge.Scenario(
                                title: "N+1 Query — ORM 效能殺手",
                                narrative: "你在 Google 面試中被問到：「你的 API 回應一個訂單列表頁面要 3 秒，資料庫有 100 筆訂單。你用 ORM 寫的程式碼看起來很簡潔，問題可能出在哪？」這是考 N+1 查詢問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1 次（ORM 會自動優化）", explanation: "Lazy Loading 模式下，ORM 不會自動載入關聯資料，每次存取都會觸發額外查詢。"),
                                Challenge.Option(id: "B", text: "2 次（一次查訂單，一次查所有客戶）", explanation: "這是 Eager Loading 的行為，但預設是 Lazy Loading。"),
                                Challenge.Option(id: "C", text: "101 次（1 + N，這就是 N+1 問題）", explanation: "正確！第 1 次查詢取得所有訂單，然後每筆訂單存取 customer 時各觸發 1 次查詢，共 1 + 100 = 101 次。這就是 N+1 查詢問題。"),
                                Challenge.Option(id: "D", text: "100 次（每筆訂單一次）", explanation: "別忘了第一次取得所有訂單的查詢，總共是 1 + N 次。"),
                            ],
                            correctAnswer: "C",
                            hints: ["預設的 Lazy Loading 在存取關聯物件時才查詢", "第一次 .all() 是 1 次查詢", "迴圈中每次 .customer 又各觸發 1 次"],
                            explanation: "N+1 查詢問題：\n- 1 次查詢取得主要資料（N 筆）\n- N 次查詢取得每筆的關聯資料\n- 總共 N+1 次查詢\n\n解決方案 — Eager Loading：\n```python\n# joinedload：用 JOIN 一次查完（1 次查詢）\norders = session.query(Order).options(\n    joinedload(Order.customer)\n).all()\n\n# subqueryload：用子查詢（2 次查詢）\norders = session.query(Order).options(\n    subqueryload(Order.customer)\n).all()\n```",
                            frameworkTip: "面試時被問到 ORM 效能問題，第一個想到的就是 N+1。能說出「用 Eager Loading（joinedload / subqueryload）解決」並解釋 Lazy vs Eager 的差異，在 Google 面試中會非常加分。"
                        ),
                        Challenge(
                            id: 3,
                            name: "ORM 查詢優化",
                            type: .code,
                            difficulty: .medium,
                            question: "以下 SQLAlchemy 查詢效能很差，請改寫成更高效的版本。\n\n```python\n# 低效寫法：取出所有資料再用 Python 過濾\nall_products = session.query(Product).all()\nexpensive = [p for p in all_products if p.price > 100]\nsorted_products = sorted(expensive, key=lambda p: p.price, reverse=True)\ntop_10 = sorted_products[:10]\n```\n\n改寫為在資料庫層面完成過濾、排序和分頁：",
                            scenario: 
                            Challenge.Scenario(
                                title: "ORM 查詢效能調校",
                                narrative: "你在一家 SaaS 公司做後端工程師，Dashboard 頁面載入時間從 200ms 慢到 5 秒。DBA 告訴你問題出在 ORM 的查詢方式。你需要優化以下 ORM 查詢。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 .filter() 取代 Python 的 list comprehension 過濾", "用 .order_by() 取代 Python 的 sorted()", "用 .limit() 取代 Python 的 slice [:10]"],
                            explanation: "資料庫 vs Python 處理的效能差異：\n\n```python\n# 差：從資料庫取出 10 萬筆，用 Python 過濾\nall_data = session.query(Product).all()  # 10 萬筆全部傳輸\nfiltered = [x for x in all_data if x.price > 100]  # Python 過濾\n\n# 好：讓資料庫只回傳需要的 10 筆\nsession.query(Product)\\\n    .filter(Product.price > 100)\\\n    .order_by(Product.price.desc())\\\n    .limit(10)\\\n    .all()  # 只傳輸 10 筆\n```\n\n資料庫有索引優化，處理過濾和排序比 Python 快幾個數量級。",
                            frameworkTip: "面試中的效能優化題，核心原則是「讓資料庫做它擅長的事」。提到 filter/order_by/limit 推到 SQL 層，展示你理解 ORM 不是用來取代 SQL 而是抽象 SQL。",
                            starterCode: """
                                # 用 SQLAlchemy ORM 的 filter, order_by, limit
                                # 讓資料庫做過濾和排序，而不是 Python
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
                    name: "Flask/FastAPI 入門",
                    description: "route、request/response、JSON API",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "框架選擇",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個框架最適合建立 REST API？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Web 框架",
                                narrative: "你要用 Python 建一個簡單的 REST API。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Django — 全功能 Web 框架", explanation: "Django 功能很多但對簡單 API 來說太重了。"),
                                Challenge.Option(id: "B", text: "FastAPI — 專為 API 設計，高效能、自動文件", explanation: "正確！FastAPI 輕量、高效能、自動生成 API 文件（Swagger），非常適合 REST API。"),
                                Challenge.Option(id: "C", text: "pandas — 資料分析套件", explanation: "pandas 是資料處理不是 Web 框架。"),
                                Challenge.Option(id: "D", text: "requests — HTTP 客戶端", explanation: "requests 是呼叫 API 的客戶端，不是建立 API 的框架。"),
                            ],
                            correctAnswer: "B",
                            hints: ["FastAPI 和 Flask 都適合建 API，FastAPI 更新且效能更好"],
                            explanation: "FastAPI：自動型別驗證、自動 API 文件、async 支援、高效能。Flask：更成熟、社群大、套件多。兩者都適合初學者。",
                            frameworkTip: "新專案推薦 FastAPI，維護舊專案可能遇到 Flask。兩者概念相通。"
                        ),
                        Challenge(
                            id: 2,
                            name: "基本路由",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "當存取 /users/42 時，回應是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "FastAPI 路由",
                                narrative: "你看到以下程式碼：\n@app.get(\"/users/{user_id}\")\ndef get_user(user_id: int):\n    return {\"user_id\": user_id}",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "{\"user_id\": \"42\"}", explanation: "FastAPI 會根據型別提示自動轉換。user_id: int 會把 \"42\" 轉成 42。"),
                                Challenge.Option(id: "B", text: "{\"user_id\": 42}", explanation: "正確！FastAPI 根據 user_id: int 自動把路徑參數轉成整數。"),
                                Challenge.Option(id: "C", text: "404 Not Found", explanation: "路由匹配 /users/{user_id}，42 會被捕捉。"),
                                Challenge.Option(id: "D", text: "報錯", explanation: "FastAPI 會自動處理型別轉換。"),
                            ],
                            correctAnswer: "B",
                            hints: ["FastAPI 用型別提示自動驗證和轉換參數"],
                            explanation: "FastAPI 的型別提示不只是文件，還有實際功能：自動驗證（如果傳 \"abc\" 給 int 參數會回 422）、自動轉換、自動生成文件。",
                            frameworkTip: "FastAPI 的核心理念：用 Python 型別提示驅動一切（驗證、文件、序列化）。"
                        ),
                        Challenge(
                            id: 3,
                            name: "實作 Flask API 端點",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個 Flask 路由函式 get_employees()，掛在 GET /api/employees 上：\n- 接受 query parameters: department（可選）、page（預設 1）、per_page（預設 10）\n- 從一個全域 list EMPLOYEES（list of dicts）中篩選\n- 回傳 JSON: {\"data\": 分頁後的員工列表, \"total\": 總筆數, \"page\": 當前頁, \"per_page\": 每頁筆數}\n（只需寫路由函式，假設 app 和 EMPLOYEES 已存在）",
                            scenario: 
                            Challenge.Scenario(
                                title: "員工查詢 API",
                                narrative: "你要用 Flask 建立一個簡單的員工查詢 API，支援按部門篩選和分頁。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["request.args.get(\"key\", default, type=int) 安全取得 query parameter", "分頁公式：start = (page - 1) * per_page", "用 list slicing [start:end] 取得當前頁的資料"],
                            explanation: "這題練習 Flask 路由的基本功：取得 query parameters（request.args.get）、資料篩選（list comprehension）、分頁邏輯、JSON 回應（jsonify）。",
                            frameworkTip: "API 分頁標準回應：包含 data、total、page、per_page。讓前端知道還有多少資料。",
                            starterCode: """
                                from flask import Flask, request, jsonify

                                # 假設 app = Flask(__name__) 已建立
                                # 假設 EMPLOYEES = [{"id": 1, "name": "...", "department": "..."}] 已存在

                                @app.route("/api/employees", methods=["GET"])
                                def get_employees():
                                    # 取得 query parameters
                                    # 篩選和分頁
                                    # 回傳 JSON
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
                            name: "FastAPI 依賴注入與 Pydantic 驗證",
                            type: .code,
                            difficulty: .hard,
                            question: "用 FastAPI + Pydantic 完成一個建立使用者的 API，需求：\n1. 用 Pydantic BaseModel 定義 UserCreate schema（name: str, email: str, age: int）\n2. age 必須 >= 0 且 <= 150\n3. email 必須包含 @\n4. 用依賴注入取得資料庫 session",
                            scenario: 
                            Challenge.Scenario(
                                title: "FastAPI 的殺手功能（2024 採用率 +141%）",
                                narrative: "你在一家新創公司面試。技術長說他們剛從 Flask 遷移到 FastAPI，最大的原因就是 Pydantic 自動驗證和依賴注入。他要你用 FastAPI 寫一個帶驗證的 API。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Pydantic 的 @validator 裝飾器用來自訂驗證邏輯", "依賴注入用 Depends() 和 yield 模式", "FastAPI 會自動將驗證錯誤轉為 422 回應"],
                            explanation: "FastAPI 的兩大殺手功能：\n\n**Pydantic 驗證**：自動將 request body 轉為型別安全的物件，驗證失敗自動回傳 422 錯誤。\n\n**依賴注入**：用 Depends() 注入 DB session、認證、設定等。yield 模式確保資源清理：\n```python\ndef get_db():\n    db = SessionLocal()\n    try:\n        yield db      # 注入到 endpoint\n    finally:\n        db.close()    # endpoint 結束後自動清理\n```",
                            frameworkTip: "FastAPI 在 2024 年採用率成長 141%，已經超越 Flask 成為 Python Web 框架首選。面試時展示你會 Pydantic 驗證 + 依賴注入，說明你跟得上現代 Python 生態系。",
                            starterCode: """
                                from fastapi import FastAPI, Depends
                                from pydantic import BaseModel, validator

                                app = FastAPI()

                                # 1. 定義 Pydantic schema
                                class UserCreate(BaseModel):
                                    pass  # 定義欄位和驗證

                                # 2. 依賴注入：取得 DB session
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
                            name: "async def vs def 的差異",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "在 FastAPI 中，以下哪個說法是正確的？\n\n```python\n# 寫法 A\n@app.get(\"/users\")\ndef get_users(db = Depends(get_db)):\n    return db.query(User).all()\n\n# 寫法 B\n@app.get(\"/users\")\nasync def get_users(db = Depends(get_db)):\n    return db.query(User).all()\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "FastAPI 中何時用 async？",
                                narrative: "你在團隊 code review 時，有人把所有 FastAPI endpoint 都改成 async def，結果效能反而變差了。你需要理解什麼時候該用 async def，什麼時候該用普通 def。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "寫法 B 一定比較快，因為 async 就是比較快", explanation: "async 不是魔法加速器。如果函式內部都是同步 I/O（如傳統 ORM），async def 反而可能更慢。"),
                                Challenge.Option(id: "B", text: "寫法 A 較好，因為 SQLAlchemy 同步 ORM 搭配普通 def 時，FastAPI 會自動放到線程池執行，不阻塞事件迴圈", explanation: "正確！FastAPI 對普通 def 會自動用線程池（threadpool）處理，不會阻塞主事件迴圈。但如果用 async def 卻呼叫同步阻塞的 I/O（如傳統 SQLAlchemy），會阻塞事件迴圈，導致整體效能下降。"),
                                Challenge.Option(id: "C", text: "兩者完全相同，FastAPI 會自動處理", explanation: "FastAPI 對 def 和 async def 的處理機制不同。def 跑在線程池，async def 跑在事件迴圈。"),
                                Challenge.Option(id: "D", text: "應該永遠用 async def，這是 FastAPI 的最佳實踐", explanation: "async def 只在搭配 async I/O（如 httpx, asyncpg）時才有優勢。"),
                            ],
                            correctAnswer: "B",
                            hints: ["FastAPI 對 def 和 async def 的處理方式不同", "同步阻塞 I/O 放在 async def 中會阻塞事件迴圈", "FastAPI 會自動把普通 def 放到線程池"],
                            explanation: "FastAPI 的執行模型：\n\n- **def（同步）**：FastAPI 自動放到線程池（threadpool）執行，不阻塞事件迴圈。適合傳統 ORM、檔案 I/O 等同步操作。\n\n- **async def（非同步）**：直接在事件迴圈（event loop）中執行。必須搭配 async I/O（await httpx.get(), await asyncpg.fetch()），否則會阻塞事件迴圈。\n\n規則：沒有 await 就不要用 async def。",
                            frameworkTip: "面試時能區分 async def vs def 在 FastAPI 中的差異，展示你理解 Python 的 asyncio 執行模型，這是很多候選人搞不清楚的進階知識。"
                        ),
                    ]
                ),
                Quest(
                    id: "21-5",
                    name: "建立 RESTful API",
                    description: "GET/POST endpoint、狀態碼",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "RESTful 設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組端點最符合 RESTful 設計？",
                            scenario: 
                            Challenge.Scenario(
                                title: "API 設計",
                                narrative: "你要設計一個管理書籍的 API。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GET /getBooks, POST /createBook, POST /deleteBook", explanation: "動詞放在 URL 裡不符合 REST。REST 用 HTTP 方法表示動作。"),
                                Challenge.Option(id: "B", text: "GET /books, POST /books, GET /books/{id}, DELETE /books/{id}", explanation: "正確！RESTful：URL 是名詞（資源），HTTP 方法是動詞（動作）。"),
                                Challenge.Option(id: "C", text: "GET /api/v1/book/list, POST /api/v1/book/add", explanation: "動詞（list, add）不應該在 URL 裡。"),
                                Challenge.Option(id: "D", text: "POST /books/get, POST /books/delete", explanation: "所有操作都用 POST 不符合 REST。不同動作用不同 HTTP 方法。"),
                            ],
                            correctAnswer: "B",
                            hints: ["REST 原則：URL = 名詞（資源），HTTP 方法 = 動詞（動作）"],
                            explanation: "RESTful API 設計：GET /resources（列表）、POST /resources（建立）、GET /resources/{id}（單一）、PUT /resources/{id}（更新）、DELETE /resources/{id}（刪除）。",
                            frameworkTip: "REST 設計口訣：URL 只有名詞，HTTP 方法決定動作。"
                        ),
                        Challenge(
                            id: 2,
                            name: "回應狀態碼",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "應該回傳什麼狀態碼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "HTTP 狀態碼",
                                narrative: "你的 POST /books 端點成功建立了一本新書。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "200 OK", explanation: "200 是通用成功，但建立資源有更精確的狀態碼。"),
                                Challenge.Option(id: "B", text: "201 Created", explanation: "正確！201 表示資源已成功建立。比 200 更精確。"),
                                Challenge.Option(id: "C", text: "204 No Content", explanation: "204 用於成功但沒有回應內容（如 DELETE）。建立資源通常會回傳新資源。"),
                                Challenge.Option(id: "D", text: "301 Moved", explanation: "301 是重定向，跟建立資源無關。"),
                            ],
                            correctAnswer: "B",
                            hints: ["201 Created 是建立資源成功的標準狀態碼"],
                            explanation: "常用狀態碼：200（成功）、201（已建立）、204（無內容）、400（請求錯誤）、404（找不到）、422（驗證失敗）、500（伺服器錯誤）。",
                            frameworkTip: "選擇最精確的狀態碼。200 是 fallback，但 201、204 等更能表達意圖。"
                        ),
                        Challenge(
                            id: 3,
                            name: "HTTP 狀態碼選擇邏輯",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "設計一個 PUT /products/{id} 的更新商品 API，以下四種錯誤情境分別應該回傳什麼狀態碼？\n\n1. 客戶端傳了 JSON 但缺少必填欄位 price\n2. 商品 ID 不存在\n3. 客戶端傳了 price: \"abc\"（型別錯誤）\n4. 更新時資料庫連線失敗",
                            scenario: 
                            Challenge.Scenario(
                                title: "RESTful API 錯誤處理標準",
                                narrative: "你在 Amazon 面試中設計一個商品管理 API。面試官要你處理各種錯誤情境，並選擇正確的 HTTP 狀態碼。「選錯狀態碼代表你不理解 HTTP 協議，」面試官說。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1→400, 2→404, 3→400, 4→500", explanation: "情境 3 中 price: \"abc\" 是格式/型別驗證錯誤，更準確的是 422（Unprocessable Entity）。"),
                                Challenge.Option(id: "B", text: "1→422, 2→404, 3→422, 4→500", explanation: "正確！\n- 422（Unprocessable Entity）：請求格式正確但語意錯誤（缺欄位、型別錯誤）\n- 404（Not Found）：資源不存在\n- 500（Internal Server Error）：伺服器端錯誤（DB 掛了）"),
                                Challenge.Option(id: "C", text: "1→400, 2→404, 3→422, 4→503", explanation: "缺少必填欄位也是語意錯誤，應用 422。503 是服務暫時不可用，資料庫錯誤通常用 500。"),
                                Challenge.Option(id: "D", text: "1→400, 2→400, 3→400, 4→500", explanation: "商品不存在應該用 404，不是 400。400 是請求格式錯誤，404 是資源不存在。"),
                            ],
                            correctAnswer: "B",
                            hints: ["400 Bad Request：請求格式/語法錯誤（如 JSON 解析失敗）", "404 Not Found：請求的資源不存在", "422 Unprocessable Entity：請求格式正確但語意/驗證錯誤", "500 Internal Server Error：伺服器端的非預期錯誤"],
                            explanation: "HTTP 狀態碼選擇指南：\n\n**4xx 客戶端錯誤**\n- 400 Bad Request：請求語法錯誤（JSON 格式錯誤、缺少 Content-Type）\n- 401 Unauthorized：未認證（沒登入）\n- 403 Forbidden：已認證但沒權限\n- 404 Not Found：資源不存在\n- 409 Conflict：衝突（如重複建立）\n- 422 Unprocessable Entity：語意錯誤（欄位驗證失敗）\n\n**5xx 伺服器錯誤**\n- 500 Internal Server Error：通用伺服器錯誤\n- 503 Service Unavailable：服務維護中",
                            frameworkTip: "面試中設計 API 時，正確選擇 HTTP 狀態碼是展示你理解 REST 規範的關鍵。特別注意 400 vs 422 的區別 — 很多資深工程師都搞混。Amazon 特別重視 API 設計的規範性。"
                        ),
                        Challenge(
                            id: 4,
                            name: "API 回應格式設計",
                            type: .code,
                            difficulty: .medium,
                            question: "設計一個統一的 API 回應格式函式，支援成功和錯誤兩種情況。\n\n成功回應範例：\n```json\n{\"success\": true, \"data\": {\"id\": 1, \"name\": \"Product\"}, \"error\": null}\n```\n\n錯誤回應範例：\n```json\n{\"success\": false, \"data\": null, \"error\": {\"code\": \"NOT_FOUND\", \"message\": \"Product not found\"}}\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "統一 API 回應格式",
                                narrative: "你在設計一個 RESTful API，CTO 要求所有 API 回應必須使用統一的格式，包含 success 狀態、data 資料和 error 錯誤訊息。前端工程師才能有一致的處理邏輯。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 JSONResponse 可以同時設定 status_code 和 content", "成功時 error 為 null，錯誤時 data 為 null", "錯誤物件包含 code（機器讀）和 message（人讀）"],
                            explanation: "統一 API 回應格式的好處：\n\n1. **前端一致處理**：前端只需檢查 success 欄位\n2. **錯誤可機器解析**：error.code 讓前端可以根據錯誤類型做不同處理\n3. **除錯友善**：error.message 提供人類可讀的錯誤描述\n\n```python\n# 前端處理邏輯\nif response.success:\n    render(response.data)\nelse:\n    showError(response.error.message)\n```\n\n這是 Google、Amazon、Stripe 等公司的 API 設計標準做法。",
                            frameworkTip: "面試時設計 API，提出統一回應格式會讓面試官知道你有實際專案經驗。特別是 error 物件包含 code 和 message 的設計，展示你考慮到前端和後端的協作需求。Amazon 的 Leadership Principle \"Customer Obsession\" 就體現在這種為前端（你的客戶）設計友善介面的思維。",
                            starterCode: """
                                from fastapi.responses import JSONResponse

                                def success_response(data, status_code=200):
                                    # 回傳統一的成功格式
                                    pass

                                def error_response(code, message, status_code=400):
                                    # 回傳統一的錯誤格式
                                    pass

                                # 使用範例
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
                    name: "待辦事項 API（Boss）",
                    description: "設計完整的 CRUD API",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: Todo API 設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "待辦事項 API",
                                narrative: "你要用 FastAPI + SQLite 設計一個待辦事項（Todo）API。\n\n功能需求：\n- 建立待辦事項（title, description, due_date）\n- 列出所有待辦（支援篩選：status, 排序：due_date）\n- 取得單一待辦\n- 更新待辦（修改 title、status）\n- 刪除待辦",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先設計 schema → 再定義 endpoint → 最後實作邏輯", "用 Pydantic BaseModel 定義請求體結構"],
                            explanation: "這個 API 涵蓋了完整的 CRUD：建立、列表（含篩選）、單一查詢、更新、刪除。加上適當的狀態碼和錯誤處理。",
                            frameworkTip: "API 設計順序：Schema → Endpoints → Logic → Error Handling → Testing。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 22,
            name: "商業流程工具開發",
            emoji: "🏗️",
            description: "表單處理、workflow 自動化、internal tool 思維",
            quests: [
                Quest(
                    id: "22-1",
                    name: "需求分析與規格",
                    description: "User Story、功能清單、MVP",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "User Story 格式",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的 User Story 格式是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "撰寫需求",
                                narrative: "你要為一個內部請假系統寫需求規格。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "系統要有請假功能", explanation: "太模糊，沒有說明誰、做什麼、為什麼。"),
                                Challenge.Option(id: "B", text: "身為員工，我想要提交請假申請，以便主管可以審批", explanation: "正確！User Story 格式：As a [角色], I want to [行動], so that [目的]。"),
                                Challenge.Option(id: "C", text: "用 Python + SQLite 做一個請假 API", explanation: "這是技術方案，不是需求。需求應該跟技術無關。"),
                                Challenge.Option(id: "D", text: "CREATE TABLE leaves (id, employee_id, ...)", explanation: "這是實作細節，不是需求。"),
                            ],
                            correctAnswer: "B",
                            hints: ["User Story = As a [who], I want to [what], so that [why]"],
                            explanation: "User Story 描述使用者需求，不包含技術細節。好的 User Story 有驗收標準（Acceptance Criteria），定義「做完」的標準。",
                            frameworkTip: "User Story 三要素：角色（誰用）+ 行動（做什麼）+ 價值（為什麼）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "MVP 思維",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "MVP 應該包含什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "最小可行產品",
                                narrative: "主管想要一個「完整的」請假系統，但你只有兩週。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有功能都做，但每個都只做 80%", explanation: "80% 完成的功能等於 0% — 使用者無法使用不完整的功能。"),
                                Challenge.Option(id: "B", text: "核心流程完整可用（提交 + 審批 + 查詢），其他功能先不做", explanation: "正確！MVP = 核心流程完整可用。先讓使用者能跑完一個完整循環，再迭代加功能。"),
                                Challenge.Option(id: "C", text: "先做漂亮的 UI，功能之後再加", explanation: "UI 不能替代功能。MVP 重功能，UI 可以簡單。"),
                                Challenge.Option(id: "D", text: "先寫完整文件，再開始開發", explanation: "過度文件化會延遲交付。MVP 階段只需要夠用的文件。"),
                            ],
                            correctAnswer: "B",
                            hints: ["MVP = 最小但完整的核心流程。「小」但「可用」。"],
                            explanation: "MVP 不是半成品，而是功能最少但完整可用的版本。核心循環能跑通，使用者能從頭到尾完成一個任務。",
                            frameworkTip: "MVP 決策法：這個功能不做，核心流程能跑嗎？能 → 先不做。不能 → 必須做。"
                        ),
                        Challenge(
                            id: 3,
                            name: "User Story 格式撰寫",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "產品經理想要一個「批次匯出訂單報表」功能。以下哪個 User Story 最符合標準格式且包含有效的驗收標準（Acceptance Criteria）？",
                            scenario: 
                            Challenge.Scenario(
                                title: "User Story 與驗收標準",
                                narrative: "你加入了一間電商公司的內部工具團隊，PM 要求你用 User Story 格式撰寫新功能的需求。你需要理解標準的 User Story 格式以及如何定義有效的 Acceptance Criteria。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "As a 營運主管, I want to 批次匯出過去 30 天的訂單報表為 CSV, so that 我可以每週向管理層報告銷售趨勢。\nAC1: 可選擇日期範圍（預設 30 天）\nAC2: 匯出格式支援 CSV 和 Excel\nAC3: 超過 10,000 筆時改用背景處理並 email 通知", explanation: "正確！完整的 As a / I want / So that 格式，清楚說明角色、功能、商業價值。AC 具體可驗證，且考慮了大量資料的 edge case。"),
                                Challenge.Option(id: "B", text: "需要一個匯出訂單的功能，要支援 CSV。", explanation: "太簡略，沒有角色、沒有商業價值、沒有驗收標準，無法作為開發依據。"),
                                Challenge.Option(id: "C", text: "As a user, I want to 匯出報表, so that 我需要它。\nAC: 功能正常運作", explanation: "角色太模糊（user 是誰？），商業價值不明確（「我需要它」不是價值），AC 無法驗證。"),
                                Challenge.Option(id: "D", text: "As a 營運主管, I want to 用 React 和 Node.js 做一個匯出按鈕, so that 報表可以下載。\nAC: 用 pandas 處理 CSV", explanation: "User Story 不應該包含技術實作細節（React、Node.js、pandas），應該聚焦在使用者需求和商業價值。"),
                            ],
                            correctAnswer: "A",
                            hints: ["User Story 標準格式：As a [角色], I want [功能], so that [商業價值]", "Acceptance Criteria 必須是具體、可驗證的條件", "User Story 應該聚焦需求，不包含技術實作"],
                            explanation: "User Story 三要素：\n1. 角色（Who）：具體的使用者角色，不是模糊的 \"user\"\n2. 功能（What）：使用者想要達成的目標\n3. 價值（Why）：這個功能帶來的商業價值\n\nAcceptance Criteria（驗收標準）的 INVEST 原則：必須是 Independent、Negotiable、Valuable、Estimable、Small、Testable。",
                            frameworkTip: "面試時談需求分析，展示你會用 User Story 格式且理解 Acceptance Criteria 的重要性。提到 INVEST 原則會加分，這表示你知道如何拆分出好的 Story。"
                        ),
                        Challenge(
                            id: 4,
                            name: "需求優先級排序（MoSCoW）",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下是 4 個需求，哪個分類最合理？\n\n1. 客戶基本資料的 CRUD 功能\n2. 深色模式 UI 主題\n3. 串接 email 自動發送跟進提醒\n4. 匯出客戶清單為 CSV\n\n用 MoSCoW 分類：Must have / Should have / Could have / Won't have (this time)",
                            scenario: 
                            Challenge.Scenario(
                                title: "MoSCoW 優先級排序法",
                                narrative: "你的團隊正在開發一套內部 CRM 工具，Sprint planning 時有 8 個需求但只有 2 週的開發時間。PM 請你用 MoSCoW 方法來排列優先級，決定哪些功能先做。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Must: 1（CRUD）, Should: 4（匯出 CSV）, Could: 3（email 提醒）, Won't: 2（深色模式）", explanation: "正確！CRUD 是核心功能沒有它系統無法使用（Must）。匯出 CSV 很實用但不阻擋上線（Should）。Email 提醒是加值功能（Could）。深色模式是 nice-to-have，MVP 階段可以先不做（Won't this time）。"),
                                Challenge.Option(id: "B", text: "Must: 1, 3, 4, Should: 2", explanation: "把太多功能放在 Must 會導致 scope creep。MoSCoW 的原則是 Must 只放「沒有它系統無法上線」的功能。"),
                                Challenge.Option(id: "C", text: "Must: 2（深色模式）, Should: 1（CRUD）, Could: 3, Won't: 4", explanation: "深色模式不是核心功能，CRUD 才是。沒有 CRUD，CRM 系統根本無法使用。"),
                                Challenge.Option(id: "D", text: "Must: 1, 4, Should: 2, 3", explanation: "匯出 CSV 雖然實用但不阻擋上線，不應該是 Must。深色模式更不是 Should 等級。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Must have = 沒有它系統無法上線", "Should have = 重要但不阻擋上線", "Could have = nice-to-have 加值功能", "Won't have = 這次不做，未來再考慮"],
                            explanation: "MoSCoW 方法是需求優先級排序的經典框架：\n- Must have（必須有）：核心功能，缺少就無法上線\n- Should have（應該有）：重要功能，不影響上線但會影響體驗\n- Could have（可以有）：加值功能，有時間就做\n- Won't have this time（這次不做）：記錄下來但明確延後\n\n關鍵原則：Must 通常不超過需求總量的 60%。",
                            frameworkTip: "面試時被問到「如何決定功能優先級」，提到 MoSCoW 並解釋每個層級的判斷標準。進階回答可以補充 RICE scoring（Reach, Impact, Confidence, Effort）作為量化輔助。"
                        ),
                    ]
                ),
                Quest(
                    id: "22-2",
                    name: "表單處理",
                    description: "input 驗證、資料收集、錯誤回饋",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "表單驗證",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "表單驗證應該在哪裡做？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Input Validation",
                                narrative: "使用者提交請假表單，你需要驗證輸入。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只在前端驗證", explanation: "前端驗證可以被繞過（直接呼叫 API）。不安全。"),
                                Challenge.Option(id: "B", text: "只在後端驗證", explanation: "安全但使用者體驗差 — 要提交後才知道有錯。"),
                                Challenge.Option(id: "C", text: "前端和後端都驗證", explanation: "正確！前端驗證提升體驗（即時回饋），後端驗證確保安全（不信任前端）。"),
                                Challenge.Option(id: "D", text: "不需要驗證，信任使用者", explanation: "永遠不要信任使用者輸入。"),
                            ],
                            correctAnswer: "C",
                            hints: ["前端驗證 = UX，後端驗證 = Security。兩者都需要。"],
                            explanation: "前端驗證：即時回饋、減少無效請求。後端驗證：安全防線、資料完整性。永遠要有後端驗證，前端驗證是加分。",
                            frameworkTip: "驗證原則：前端驗證是為了 UX，後端驗證是為了 Security。不能只靠前端。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Pydantic 驗證",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 Pydantic model 最完整？",
                            scenario: 
                            Challenge.Scenario(
                                title: "用 Pydantic 驗證",
                                narrative: "你用 FastAPI + Pydantic 定義請假申請的資料模型。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "class LeaveRequest(BaseModel):\n    days: int", explanation: "太簡略，缺少必要欄位。"),
                                Challenge.Option(id: "B", text: "class LeaveRequest(BaseModel):\n    employee_id: int\n    start_date: date\n    end_date: date\n    reason: str\n    leave_type: str", explanation: "正確！包含必要欄位，Pydantic 會自動驗證型態。可以加 validator 做更多檢查。"),
                                Challenge.Option(id: "C", text: "leave_request = {\"employee_id\": 1, \"days\": 3}", explanation: "這是 dict，沒有型態驗證。Pydantic model 會自動檢查。"),
                                Challenge.Option(id: "D", text: "class LeaveRequest:\n    def __init__(self, **kwargs):\n        self.data = kwargs", explanation: "普通 class 不會自動驗證型態。Pydantic BaseModel 才會。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Pydantic BaseModel 自動驗證型態、自動生成 JSON schema"],
                            explanation: "Pydantic model 定義了資料的「形狀」和「規則」。FastAPI 會自動用它驗證請求體，錯誤時回 422。",
                            frameworkTip: "用 Pydantic 定義所有 API 的輸入和輸出。型別提示 = 自動驗證 + 自動文件。"
                        ),
                        Challenge(
                            id: 3,
                            name: "表單驗證引擎",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 validate_form(data, rules)：\n- data: dict（表單資料，如 {\"name\": \"Alice\", \"age\": \"25\", \"email\": \"alice@test.com\"}）\n- rules: dict of lists（驗證規則，如 {\"name\": [\"required\", \"min:2\"], \"age\": [\"required\", \"numeric\", \"range:18-65\"], \"email\": [\"required\", \"contains:@\"]}）\n- 支援的規則：required（不可為空）、min:N（最少 N 字元）、numeric（必須是數字）、range:A-B（數值範圍）、contains:X（必須包含 X）\n- 回傳 dict: {\"valid\": bool, \"errors\": {\"field_name\": [\"error messages\"]}}",
                            scenario: 
                            Challenge.Scenario(
                                title: "通用表單驗證器",
                                narrative: "你要設計一個可以複用的表單驗證引擎，支援多種驗證規則。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 rule.startswith(\"min:\") 判斷帶參數的規則", "rule.split(\":\")[1] 取出規則的參數", "每個欄位的錯誤收集到 list，只有有錯時才加入 errors dict"],
                            explanation: "這題練習設計可擴展的驗證引擎：規則用字串表示（易於設定）、支援帶參數的規則（min:2）、收集所有欄位的所有錯誤。這是 internal tool 中常見的模式。",
                            frameworkTip: "驗證引擎設計：規則可配置 → 引擎解析規則 → 逐一套用 → 收集所有錯誤。不要遇到第一個錯就停。",
                            starterCode: """
                                def validate_form(data, rules):
                                    errors = {}
                                    # 對每個欄位套用其規則
                                    # 收集錯誤訊息
                                    # 回傳結果
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
                            name: "表單驗證策略：前端 vs 後端",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "為什麼「只在前端做表單驗證」是一個嚴重的安全問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "永遠不要只信任前端驗證",
                                narrative: "你在開發一個員工請假系統的表單。Junior 工程師只在前端用 JavaScript 做了輸入驗證（例如檢查日期格式、請假天數上限），認為這樣就夠了。Tech Lead 在 code review 時指出了嚴重的安全問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "因為前端驗證可以被完全繞過——使用者可以用 DevTools 修改 JavaScript、用 Postman 直接發 API 請求、或用 curl 繞過瀏覽器。後端必須獨立做驗證。", explanation: "正確！前端驗證只是為了使用者體驗（即時回饋），真正的安全防線必須在後端。任何人都可以繞過前端直接對後端發請求。"),
                                Challenge.Option(id: "B", text: "因為前端驗證速度太慢，會影響使用者體驗。", explanation: "前端驗證其實比後端更快（不需要網路請求），所以速度不是問題。"),
                                Challenge.Option(id: "C", text: "因為前端驗證不支援正則表達式。", explanation: "JavaScript 完全支援正則表達式，這不是問題所在。"),
                                Challenge.Option(id: "D", text: "因為前端驗證在手機上不起作用。", explanation: "前端 JavaScript 驗證在手機瀏覽器上同樣有效。"),
                            ],
                            correctAnswer: "A",
                            hints: ["想想看：如果不用瀏覽器，能不能直接對伺服器送請求？", "Postman、curl 等工具可以繞過所有前端邏輯", "前端驗證的目的是 UX，不是安全"],
                            explanation: "表單驗證的黃金原則：前端驗證為了 UX，後端驗證為了安全。\n\n正確做法是「雙重驗證」：\n1. 前端驗證：即時回饋使用者（例如欄位格式錯誤馬上提示）\n2. 後端驗證：安全防線（驗證所有輸入、防止 SQL Injection、XSS 等）\n\n常見攻擊方式：\n- 用 DevTools 修改或刪除前端驗證邏輯\n- 用 Postman / curl 直接發送 API 請求\n- 用 Burp Suite 攔截並修改請求內容",
                            frameworkTip: "面試時談到表單處理，務必提到「Never trust the client」原則。說明前端驗證是為了 UX、後端驗證是為了 Security，這會展示你的安全意識，是面試官非常看重的。"
                        ),
                        Challenge(
                            id: 5,
                            name: "輸入清理（Input Sanitization）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪段程式碼有 SQL Injection 風險？\n\n```python\n# 寫法 A\nquery = f\"SELECT * FROM tickets WHERE title LIKE '%{user_input}%'\"\ncursor.execute(query)\n\n# 寫法 B\nquery = \"SELECT * FROM tickets WHERE title LIKE %s\"\ncursor.execute(query, (f\"%{user_input}%\",))\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "防禦惡意輸入",
                                narrative: "你在開發內部工單系統的搜尋功能。使用者輸入搜尋關鍵字後，系統會用這個輸入去查詢資料庫。資安團隊在滲透測試時發現了漏洞。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "寫法 A 有風險，寫法 B 安全。因為寫法 A 直接把使用者輸入拼接到 SQL 字串中，攻擊者可以注入惡意 SQL。寫法 B 使用參數化查詢（Parameterized Query），資料庫會自動轉義特殊字元。", explanation: "正確！參數化查詢是防止 SQL Injection 的標準做法。user_input 如果是 '; DROP TABLE tickets; -- 就會直接刪除整個資料表。"),
                                Challenge.Option(id: "B", text: "兩者都安全，因為都用了 cursor.execute()。", explanation: "cursor.execute() 本身不保證安全，關鍵是有沒有用參數化查詢。"),
                                Challenge.Option(id: "C", text: "兩者都有風險，應該改用 ORM。", explanation: "寫法 B 的參數化查詢已經是安全的。ORM 確實更方便，但參數化查詢本身就能防止 SQL Injection。"),
                                Challenge.Option(id: "D", text: "寫法 B 有風險，因為用了 %s 佔位符。", explanation: "%s 在這裡不是字串格式化，而是資料庫驅動的參數佔位符，會被安全地處理。"),
                            ],
                            correctAnswer: "A",
                            hints: ["f-string 或字串拼接直接把使用者輸入放入 SQL 是非常危險的", "參數化查詢用 %s 或 ? 作為佔位符，由資料庫驅動處理轉義", "OWASP Top 10 中 Injection 一直是最常見的安全漏洞之一"],
                            explanation: "Input Sanitization 的核心模式：\n\n1. 參數化查詢（Parameterized Query）：防止 SQL Injection\n2. HTML 轉義（Escaping）：防止 XSS（跨站腳本攻擊）\n3. 白名單驗證（Whitelist）：只允許已知安全的輸入格式\n4. 長度限制：防止 Buffer Overflow 和 DoS\n\n記住：永遠不要用字串拼接或 f-string 來組合 SQL 查詢。",
                            frameworkTip: "面試時提到 Input Sanitization，說出「參數化查詢」和「OWASP Top 10」會展示你有安全意識。如果能進一步提到 ORM（如 SQLAlchemy、Django ORM）如何自動處理這些問題，會更加分。"
                        ),
                    ]
                ),
                Quest(
                    id: "22-3",
                    name: "Workflow 自動化",
                    description: "狀態機、審批流程、通知",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "狀態機設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個狀態轉換是不合理的？",
                            scenario: 
                            Challenge.Scenario(
                                title: "請假審批流程",
                                narrative: "請假申請有多個狀態：draft → submitted → approved/rejected。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "draft → submitted（員工提交）", explanation: "合理。員工填完表後提交。"),
                                Challenge.Option(id: "B", text: "submitted → approved（主管批准）", explanation: "合理。主管審批通過。"),
                                Challenge.Option(id: "C", text: "approved → draft（回到草稿）", explanation: "正確！已批准的不應該回到草稿。如果要修改，應該建立新申請或有專門的「撤回」狀態。"),
                                Challenge.Option(id: "D", text: "submitted → rejected（主管駁回）", explanation: "合理。主管可以駁回申請。"),
                            ],
                            correctAnswer: "C",
                            hints: ["狀態機的轉換要有業務意義。approved 回到 draft 違反了審批邏輯。"],
                            explanation: "狀態機設計原則：(1) 每個狀態轉換要有明確的觸發條件 (2) 避免不合理的回退 (3) 終態（approved/rejected）通常不可逆。",
                            frameworkTip: "設計狀態機時先畫圖：圓圈是狀態，箭頭是轉換，箭頭上標註「誰」在「什麼條件下」觸發。"
                        ),
                        Challenge(
                            id: 2,
                            name: "自動化觸發",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這個自動化最適合在哪裡實現？",
                            scenario: 
                            Challenge.Scenario(
                                title: "審批通知",
                                narrative: "員工提交請假後，主管應該自動收到通知。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "前端 JavaScript 直接發 email", explanation: "前端不應該有 email 伺服器的憑證。"),
                                Challenge.Option(id: "B", text: "後端在狀態變更時觸發通知", explanation: "正確！後端在 submitted 狀態變更時，觸發通知邏輯（email/Slack/webhook）。"),
                                Challenge.Option(id: "C", text: "讓員工自己通知主管", explanation: "手動通知會被遺忘，且不是自動化。"),
                                Challenge.Option(id: "D", text: "用 cron job 每小時檢查一次", explanation: "延遲太大。應該在事件發生時即時觸發。"),
                            ],
                            correctAnswer: "B",
                            hints: ["事件驅動：狀態變更 → 觸發動作。不要用輪詢。"],
                            explanation: "自動化通知應該是事件驅動的：狀態從 draft 變成 submitted 時，觸發通知。後端是最合適的位置（有伺服器資源和憑證）。",
                            frameworkTip: "自動化三問：什麼事件觸發？觸發什麼動作？失敗怎麼處理？"
                        ),
                        Challenge(
                            id: 3,
                            name: "審批流程狀態機",
                            type: .code,
                            difficulty: .hard,
                            question: "設計一個 WorkflowEngine class：\n- __init__(self, transitions): 接收合法的狀態轉換 dict，格式 {\"current_state\": {\"action\": \"next_state\"}}，例如 {\"draft\": {\"submit\": \"pending\"}, \"pending\": {\"approve\": \"approved\", \"reject\": \"rejected\"}}\n- __init__ 也初始化 history list 記錄所有操作\n- transition(self, current_state, action): 執行狀態轉換，回傳新狀態。如果轉換不合法，raise ValueError\n- get_available_actions(self, state): 回傳該狀態可用的動作 list\n- get_history(self): 回傳操作歷史 list of dicts: [{\"from\": \"draft\", \"action\": \"submit\", \"to\": \"pending\"}]",
                            scenario: 
                            Challenge.Scenario(
                                title: "請假審批 Workflow",
                                narrative: "你需要實作一個狀態機來管理請假申請的審批流程。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["transitions 是 dict 的 dict：外層 key 是狀態，內層 key 是動作，value 是下一個狀態", "不合法的轉換 = 狀態或動作不在 transitions 中", "history 記錄每次轉換的 from/action/to"],
                            explanation: "這題實作了一個簡單的狀態機引擎。狀態機是 workflow 自動化的核心：定義合法的轉換 → 執行轉換時驗證 → 記錄歷史。這個模式適用於任何審批、訂單、任務管理系統。",
                            frameworkTip: "狀態機設計三要素：States（狀態集合）、Transitions（轉換規則）、History（操作記錄）。",
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
                            name: "自動化排程報表",
                            type: .code,
                            difficulty: .medium,
                            question: "寫一個函式 generate_report(records, config)：\n- records: list of dicts（原始資料）\n- config: dict，包含：\n  - \"group_by\": 分組欄位名（str）\n  - \"metrics\": list of dicts，每個有 \"field\"（欄位名）和 \"agg\"（\"sum\"/\"avg\"/\"count\"/\"max\"/\"min\"）\n  - \"sort_by\": 排序欄位（可選）\n  - \"top_n\": 只回傳前 N 筆（可選）\n回傳 list of dicts，每個 dict 有 group_by 欄位和所有 metrics 的結果。",
                            scenario: 
                            Challenge.Scenario(
                                title: "每日報表生成器",
                                narrative: "你要設計一個報表生成器，能根據設定自動產生不同格式的報表。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["用 setdefault 分組", "結果欄位名用 f\"{field}_{agg}\" 表示聚合方式", "排序和截取是可選操作，先檢查 config 中有沒有"],
                            explanation: "這題設計了一個設定驅動的報表引擎：分組 → 聚合（支援多種函式）→ 排序 → 截取。這個模式讓同一份程式碼可以透過不同 config 產生不同報表。",
                            frameworkTip: "設定驅動開發：把邏輯和設定分離。同一個引擎 + 不同設定 = 不同報表。改設定不改程式碼。",
                            starterCode: """
                                def generate_report(records, config):
                                    # 1. 按 group_by 分組
                                    # 2. 對每組計算 metrics
                                    # 3. 排序和截取
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
                            name: "背景任務處理（Async Task Queue）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪種架構最適合處理這種「耗時但不需要即時回應」的任務？",
                            scenario: 
                            Challenge.Scenario(
                                title: "同步 vs 非同步任務處理",
                                narrative: "Netflix 的內部工具需要每天產出數百份分析報表。當使用者點擊「產出報表」按鈕，系統需要從多個資料來源撈取數據、運算、生成 PDF，整個過程需要 3-5 分鐘。如果用同步處理，使用者會看到瀏覽器一直轉圈。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "使用 Celery + Redis 的非同步任務佇列（Task Queue）：API 收到請求後立即回傳 task_id，將任務推入 Redis queue，Celery worker 在背景處理，完成後更新狀態或發送通知。", explanation: "正確！這是業界標準架構。Celery 是 Python 最常用的分散式任務佇列，Redis 作為 Message Broker。使用者不需要等待，可以透過 task_id 查詢進度。"),
                                Challenge.Option(id: "B", text: "增加 API server 的 timeout 到 10 分鐘，讓使用者等待同步處理完成。", explanation: "同步等待 3-5 分鐘會造成極差的使用者體驗，且佔用伺服器連線資源，大量請求會導致伺服器崩潰。"),
                                Challenge.Option(id: "C", text: "用 JavaScript 的 setTimeout 在前端設定延遲，每隔 1 秒重試請求。", explanation: "前端 setTimeout 不能解決後端的處理時間問題，而且頻繁重試會增加伺服器負擔。"),
                                Challenge.Option(id: "D", text: "用 WebSocket 建立長連接，讓伺服器同步處理並透過 WebSocket 回傳結果。", explanation: "WebSocket 適合即時通訊，但核心問題是處理時間太長佔用伺服器資源。需要把任務移到背景 worker 處理。"),
                            ],
                            correctAnswer: "A",
                            hints: ["耗時任務應該在背景處理，不要阻塞 API 回應", "Task Queue 的核心概念：Producer（API）推入任務，Consumer（Worker）取出執行", "Redis 可以作為 Message Broker（訊息中介）"],
                            explanation: "Celery + Redis 架構：\n\n1. Producer（API Server）：收到請求 → 建立 task → 推入 Redis Queue → 立即回傳 task_id\n2. Message Broker（Redis）：暫存任務，確保任務不遺失\n3. Consumer（Celery Worker）：從 Queue 取出任務 → 執行 → 更新結果\n\n何時用同步 vs 非同步：\n- 同步：回應時間 < 500ms 的操作（讀取資料、簡單計算）\n- 非同步：回應時間 > 幾秒的操作（報表生成、大量 email 發送、影片轉碼）",
                            frameworkTip: "面試時被問到「如何處理耗時任務」，說出 Task Queue 架構（Celery + Redis / RabbitMQ）是標準答案。進階回答可以提到 retry 機制、dead letter queue、idempotency（冪等性），這些都是 Netflix 等大公司面試常問的延伸問題。"
                        ),
                        Challenge(
                            id: 6,
                            name: "排程任務（Job Scheduling）",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "在 Python Web 應用中，以下哪種排程方案最可靠且適合生產環境？",
                            scenario: 
                            Challenge.Scenario(
                                title: "定時排程的工具選擇",
                                narrative: "你的團隊需要設定多個定期執行的任務：每天凌晨 2 點同步外部 API 資料、每週一早上 9 點寄出週報 email、每小時檢查一次系統健康狀態。你需要選擇合適的排程方案。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用 while True + time.sleep() 在主程式中實作定時迴圈", explanation: "這種方式會阻塞主程式，且如果程式崩潰任務就停了，沒有重試機制，完全不適合生產環境。"),
                                Challenge.Option(id: "B", text: "用 Celery Beat 搭配 Celery Worker：Celery Beat 負責按排程時間派發任務到 Queue，Worker 負責執行。支援 crontab 語法定義排程。", explanation: "正確！Celery Beat 是 Celery 生態系的排程器，與 Task Queue 無縫整合。支援 crontab 語法、可靠性高、支援分散式部署。"),
                                Challenge.Option(id: "C", text: "用 Linux crontab 直接排程 Python 腳本", explanation: "crontab 可以用，但與應用程式分離，難以管理和監控。且無法享受 Celery 的 retry、logging、監控等功能。適合簡單場景，不適合複雜的生產環境。"),
                                Challenge.Option(id: "D", text: "用 JavaScript 的 setInterval 在前端定時觸發 API 呼叫", explanation: "前端排程完全不可靠——使用者關掉瀏覽器任務就停了。排程任務必須在伺服器端執行。"),
                            ],
                            correctAnswer: "B",
                            hints: ["生產環境的排程需要可靠性、可監控、可重試", "Celery Beat 是 Celery 的排程元件，與 Task Queue 天然整合", "crontab 語法：分 時 日 月 週"],
                            explanation: "Job Scheduling 方案比較：\n\n1. Celery Beat：適合 Python Web 應用，與 Task Queue 整合，支援 crontab 語法\n2. Linux Crontab：適合簡單的獨立腳本，輕量但功能有限\n3. APScheduler：Python 的排程庫，適合中小型應用\n4. Airflow：適合複雜的 DAG（有向無環圖）工作流程\n\ncrontab 語法範例：\n- \"0 2 * * *\"：每天凌晨 2 點\n- \"0 9 * * 1\"：每週一早上 9 點\n- \"0 * * * *\"：每小時整點",
                            frameworkTip: "面試時聊到排程任務，區分「一次性非同步任務」和「定時排程任務」很重要。一次性用 Celery task，定時用 Celery Beat。如果能提到 crontab 語法，表示你有實際操作經驗。"
                        ),
                    ]
                ),
                Quest(
                    id: "22-4",
                    name: "內部工具架構",
                    description: "前後端分離、API 設計、資料流",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "前後端分離",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "前後端分離的主要好處是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "架構選擇",
                                narrative: "你要開發一個內部工具。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "程式碼更少", explanation: "前後端分離通常程式碼更多，但各自更清楚。"),
                                Challenge.Option(id: "B", text: "前端和後端可以獨立開發、測試、部署", explanation: "正確！分離讓團隊可以平行開發，也可以獨立替換（如換前端框架不影響後端）。"),
                                Challenge.Option(id: "C", text: "不需要 API", explanation: "前後端分離正是透過 API 溝通。"),
                                Challenge.Option(id: "D", text: "載入速度一定更快", explanation: "不一定。取決於實作方式。"),
                            ],
                            correctAnswer: "B",
                            hints: ["分離 = 解耦。前端和後端各自獨立，透過 API 溝通。"],
                            explanation: "前後端分離：前端（React/Vue）+ 後端（FastAPI/Flask）+ API（JSON）。好處：獨立開發、獨立部署、可以有多個前端（Web + Mobile）共用同一個 API。",
                            frameworkTip: "Internal tool 架構：FastAPI backend + React/Retool frontend + SQLite/PostgreSQL database。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Docker Compose 多服務架構",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下 docker-compose.yml 設定中，哪個選項正確描述了各服務的角色與它們之間的關係？\n\n```yaml\nservices:\n  frontend:\n    build: ./frontend\n    ports: [\"3000:3000\"]\n    depends_on: [backend]\n  backend:\n    build: ./backend\n    ports: [\"5000:5000\"]\n    depends_on: [db, redis]\n    environment:\n      DATABASE_URL: postgresql://db:5432/app\n      REDIS_URL: redis://redis:6379\n  db:\n    image: postgres:15\n    volumes: [pgdata:/var/lib/postgresql/data]\n  redis:\n    image: redis:7-alpine\nvolumes:\n  pgdata:\n```",
                            scenario: 
                            Challenge.Scenario(
                                title: "Docker Compose 多服務協作",
                                narrative: "你的團隊要部署一個內部分析平台，包含 React 前端、Flask 後端 API、PostgreSQL 資料庫、Redis 快取。Tech Lead 要求用 Docker Compose 來管理這些服務。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "啟動順序是 db, redis → backend → frontend。服務之間用服務名稱（db, redis）作為 hostname 互相通訊。volumes 確保資料庫資料在容器重啟後不遺失。", explanation: "正確！depends_on 定義啟動順序。Docker Compose 自動建立內部網路，服務名稱就是 hostname。Named volume（pgdata）實現資料持久化。"),
                                Challenge.Option(id: "B", text: "所有服務同時啟動，depends_on 只是標示關係不影響順序。", explanation: "depends_on 確實會影響啟動順序，讓依賴的服務先啟動（但不保證服務「ready」）。"),
                                Challenge.Option(id: "C", text: "服務之間必須用 IP 位址通訊，不能用服務名稱。", explanation: "Docker Compose 會自動建立網路，服務名稱會被解析為容器的 IP，所以可以直接用服務名稱作為 hostname。"),
                                Challenge.Option(id: "D", text: "volumes 是用來共享程式碼的，不是持久化資料。", explanation: "volumes 有多種用途，這裡的 named volume（pgdata）主要是為了資料持久化，確保容器刪除後資料庫資料還在。"),
                            ],
                            correctAnswer: "A",
                            hints: ["depends_on 定義服務啟動的先後順序", "Docker Compose 會自動建立內部 DNS，讓服務用名稱互相找到對方", "Named volume 讓資料在容器生命週期之外持久保存"],
                            explanation: "Docker Compose 核心概念：\n\n1. 服務（Services）：每個服務是一個容器，可以 build 自訂 image 或用現有 image\n2. 網路（Networks）：Compose 自動建立 bridge 網路，服務名 = hostname\n3. 卷（Volumes）：Named volume 實現資料持久化\n4. 依賴（depends_on）：控制啟動順序（注意：不等待服務 ready，只等容器啟動）\n5. 環境變數：透過 environment 注入設定，避免 hardcode\n\n典型的四層架構：Frontend → Backend API → Database + Cache",
                            frameworkTip: "面試時被問到 Docker Compose，重點說明你理解「服務編排」的概念：多個容器如何協作、如何通訊、如何持久化資料。提到 depends_on 的限制（只等容器啟動不等 ready）和解法（healthcheck）會展示你有實際使用經驗。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Microservice vs Monolith",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下關於 Monolith（單體架構）和 Microservice（微服務架構）的描述，哪個最正確？",
                            scenario: 
                            Challenge.Scenario(
                                title: "架構選擇的 Trade-off",
                                narrative: "你的公司要重建一套內部工具平台，CTO 問你：「應該用微服務架構還是單體架構？」這是系統設計面試中最經典的架構決策題之一。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "微服務一定比單體好，所有公司都應該採用微服務。", explanation: "這是常見的迷思。微服務增加了大量的營運複雜度（服務發現、分散式追蹤、資料一致性），小團隊用微服務反而會更慢。"),
                                Challenge.Option(id: "B", text: "應該從 Monolith 開始，當團隊和系統成長到一定規模後，再逐步拆分成 Microservice。拆分的時機是當 Monolith 的部署衝突、團隊溝通成本、和獨立擴展需求成為瓶頸時。", explanation: "正確！這是 Martin Fowler 提出的 \"Monolith First\" 策略。先用 Monolith 快速迭代，當出現明確的拆分理由時再逐步遷移。Netflix、Amazon 都是從 Monolith 起步的。"),
                                Challenge.Option(id: "C", text: "單體架構已經過時，新專案不應該再用。", explanation: "很多成功的公司仍然在用 Monolith（例如 Shopify 的核心系統）。架構選擇取決於團隊規模和業務需求。"),
                                Challenge.Option(id: "D", text: "微服務的主要好處是程式碼更少，更容易理解。", explanation: "微服務的單個服務確實較小，但整個系統的總複雜度更高（分散式系統的挑戰：網路延遲、資料一致性、服務發現等）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["沒有「最好」的架構，只有「最適合」的架構", "微服務帶來的複雜度：服務發現、分散式追蹤、資料一致性、網路延遲", "考慮團隊規模：5 人團隊用微服務可能過度工程化"],
                            explanation: "Monolith vs Microservice：\n\nMonolith 優點：\n- 開發簡單、部署方便\n- 適合小團隊快速迭代\n- 沒有分散式系統的複雜度\n\nMicroservice 優點：\n- 獨立部署、獨立擴展\n- 團隊自治（每個團隊負責自己的服務）\n- 技術棧靈活（不同服務可用不同語言）\n\n拆分時機：\n- 部署衝突（多個團隊改同一個 codebase）\n- 擴展需求（某個模組需要獨立擴展）\n- 團隊成長到 20+ 人",
                            frameworkTip: "面試時聊架構選擇，最重要的是展示「trade-off 思維」而非一味推崇某種架構。提到 \"Monolith First\" 策略、說明何時拆分、以及微服務帶來的額外複雜度，會讓面試官知道你有深度思考。"
                        ),
                    ]
                ),
                Quest(
                    id: "22-5",
                    name: "部署與維護概念",
                    description: "Docker 基礎、.env、logging",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Docker 基礎概念",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Docker 解決什麼問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "為什麼用 Docker",
                                narrative: "你的工具在你的電腦上能跑，但同事的電腦不行。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓程式跑得更快", explanation: "Docker 不是為了效能，有時甚至會慢一點。"),
                                Challenge.Option(id: "B", text: "確保在任何環境都能以相同方式運行（環境一致性）", explanation: "正確！Docker 把應用和依賴打包成容器，消除「在我的電腦上能跑」的問題。"),
                                Challenge.Option(id: "C", text: "不需要安裝 Python", explanation: "Docker 容器裡還是需要 Python，只是不用在主機上裝。"),
                                Challenge.Option(id: "D", text: "自動修復 bug", explanation: "Docker 不修 bug，只確保環境一致。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Docker = 把你的應用和環境打包在一起，到處都能跑"],
                            explanation: "Docker 核心概念：Dockerfile（建構指令）→ Image（打包好的映像）→ Container（運行中的實例）。確保開發、測試、生產環境一致。",
                            frameworkTip: "Docker 新手只需會三個指令：docker build、docker run、docker-compose up。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Logging 重要性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "為什麼生產環境要用 logging 而非 print？",
                            scenario: 
                            Challenge.Scenario(
                                title: "生產環境除錯",
                                narrative: "你的工具部署到生產環境後出了 bug，但你看不到 print() 的輸出。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "logging 跑得比 print 快", explanation: "速度不是主要原因。"),
                                Challenge.Option(id: "B", text: "logging 有級別（DEBUG/INFO/WARNING/ERROR）、可以寫入檔案、可以格式化", explanation: "正確！logging 可以控制級別、輸出到檔案、加上時間戳，比 print 專業得多。"),
                                Challenge.Option(id: "C", text: "print 在 Python 3 中被移除了", explanation: "print 沒有被移除。"),
                                Challenge.Option(id: "D", text: "logging 比較好看", explanation: "不只是外觀，是功能差異。"),
                            ],
                            correctAnswer: "B",
                            hints: ["print 適合開發除錯，logging 適合生產環境"],
                            explanation: "logging 優勢：級別控制（可以只看 ERROR）、輸出到檔案、帶時間戳、可以配置格式。import logging; logging.info(\"message\")。",
                            frameworkTip: "開發用 print，部署前改成 logging。好的 log 讓你不用看程式碼就能找到問題。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Logging Levels（日誌等級）",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 logging level 分配最合理？\n\n1. 使用者成功登入系統\n2. 資料庫連線池即將耗盡（使用率 85%）\n3. API 請求的詳細參數和回應內容\n4. 支付處理失敗，無法扣款\n5. 整個資料庫叢集無法連線",
                            scenario: 
                            Challenge.Scenario(
                                title: "DEBUG / INFO / WARNING / ERROR / CRITICAL",
                                narrative: "Uber 的內部工具平台每天處理數百萬筆交易。SRE 團隊發現 log 檔案太大（一天超過 500GB），需要重新規劃 logging 策略。你需要理解不同 log level 的用途，才能在生產環境中做出正確的 logging 決策。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "1→INFO, 2→WARNING, 3→DEBUG, 4→ERROR, 5→CRITICAL", explanation: "正確！INFO 記錄正常業務事件，WARNING 是潛在問題的預警，DEBUG 是開發時的詳細資訊，ERROR 是需要處理的錯誤，CRITICAL 是系統級的嚴重故障。"),
                                Challenge.Option(id: "B", text: "1→DEBUG, 2→INFO, 3→INFO, 4→WARNING, 5→ERROR", explanation: "使用者登入是正常業務事件（INFO），不是 DEBUG。支付失敗應該是 ERROR 而非 WARNING。資料庫叢集掛掉是 CRITICAL 等級。"),
                                Challenge.Option(id: "C", text: "全部用 INFO 就好，這樣最簡單。", explanation: "所有都用同一個 level 會導致無法快速篩選出重要的問題，log 也會非常大。"),
                                Challenge.Option(id: "D", text: "1→WARNING, 2→ERROR, 3→INFO, 4→CRITICAL, 5→CRITICAL", explanation: "成功登入是正常事件不是 WARNING。連線池 85% 是預警不是 ERROR。API 詳細參數應該是 DEBUG 而非 INFO（在生產環境會產生太多 log）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["DEBUG：開發除錯用的詳細資訊，生產環境通常關閉", "INFO：正常的業務事件（使用者登入、訂單建立）", "WARNING：潛在問題但系統仍正常運作", "ERROR：功能失敗但系統整體還在運行", "CRITICAL：系統級故障，需要立即處理"],
                            explanation: "Python Logging Levels（嚴重程度由低到高）：\n\n1. DEBUG (10)：開發除錯資訊，生產環境關閉\n2. INFO (20)：正常業務事件記錄\n3. WARNING (30)：潛在問題預警，系統仍正常\n4. ERROR (40)：功能層級的錯誤\n5. CRITICAL (50)：系統層級的嚴重故障\n\n生產環境最佳實踐：\n- 設定 level 為 INFO 或 WARNING\n- 使用 Structured Logging（JSON 格式）方便搜尋和分析\n- 搭配 ELK Stack（Elasticsearch + Logstash + Kibana）或 Datadog 做集中式日誌管理",
                            frameworkTip: "面試時被問到 logging，說出五個等級的用途並舉例是基本分。進階回答：提到 Structured Logging（用 JSON 格式而非純文字）和集中式日誌管理（ELK / Datadog），展示你理解大規模系統的 observability。"
                        ),
                        Challenge(
                            id: 4,
                            name: "監控指標（Monitoring Metrics）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪組監控指標和告警策略最適合一個內部 Web 應用？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Latency, Error Rate, Throughput",
                                narrative: "Uber 的內部調度系統上線後，SRE 團隊需要設定監控和告警。主管問你：「我們應該監控哪些指標？告警閾值怎麼設？」這是 Uber 面試中經常出現的系統運維問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只監控 CPU 和記憶體使用率，超過 80% 就告警。", explanation: "基礎設施指標很重要但不夠。CPU 80% 不一定代表有問題（可能是正常的批次處理），需要搭配應用層指標。"),
                                Challenge.Option(id: "B", text: "RED 方法：Rate（每秒請求數 / 吞吐量）、Errors（錯誤率）、Duration（延遲 / 回應時間）。搭配 P50/P95/P99 百分位數來衡量延遲，而非只看平均值。", explanation: "正確！RED 方法是 Google SRE 推薦的服務監控框架。用百分位數而非平均值，因為平均值會掩蓋長尾問題（例如 1% 的請求需要 10 秒但平均只有 200ms）。"),
                                Challenge.Option(id: "C", text: "只監控錯誤率，只要沒有錯誤就表示系統正常。", explanation: "錯誤率為 0 不代表系統正常——可能延遲已經高到無法使用，或吞吐量驟降（可能是上游服務掛了）。"),
                                Challenge.Option(id: "D", text: "監控所有可能的指標（100+ 個），全部設定告警。", explanation: "過多的告警會導致 Alert Fatigue（告警疲勞），團隊會開始忽略告警。應該聚焦在最關鍵的指標。"),
                            ],
                            correctAnswer: "B",
                            hints: ["RED 方法：Rate（速率）、Errors（錯誤）、Duration（延遲）", "P95 延遲 = 95% 的請求在這個時間內完成", "平均延遲會掩蓋長尾問題"],
                            explanation: "監控的 RED 方法（適用於服務端）：\n\n1. Rate（吞吐量）：每秒處理多少請求？驟降可能代表上游出問題\n2. Errors（錯誤率）：多少比例的請求失敗？通常告警閾值設在 1-5%\n3. Duration（延遲）：用百分位數衡量\n   - P50：中位數，代表「一般」使用者的體驗\n   - P95：95% 的請求在此時間內完成\n   - P99：抓出最慢的 1% 請求（長尾問題）\n\n為什麼不用平均值？\n假設 99 個請求是 100ms，1 個請求是 10,000ms\n平均值 = 199ms（看起來正常），但 P99 = 10,000ms（有嚴重問題）\n\n另一個常用框架 USE（適用於基礎設施）：Utilization, Saturation, Errors",
                            frameworkTip: "面試時被問到監控，說出 RED 方法（服務端）和 USE 方法（基礎設施）會展示你的 SRE 知識。特別強調「用 P95/P99 而非平均值」來衡量延遲，這是面試官非常喜歡聽到的觀點。提到 Alert Fatigue 的問題也是加分項。"
                        ),
                    ]
                ),
                Quest(
                    id: "22-6",
                    name: "請假申請系統（Boss）",
                    description: "設計完整的 internal tool",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 設計請假系統",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "請假申請系統設計",
                                narrative: "你被要求為公司設計一個請假申請系統。\n\n需求：\n- 員工提交請假（日期範圍、類型、原因）\n- 主管審批（批准/駁回）\n- 員工查詢自己的請假記錄\n- 主管查看待審批清單\n- 狀態通知（提交/批准/駁回時通知）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先畫狀態機圖，再設計 API 和 schema", "MVP 只做核心循環：提交 → 審批 → 查看結果"],
                            explanation: "設計 internal tool 的完整流程：需求分析 → 資料模型 → API → 狀態管理 → 權限 → 通知 → MVP 規劃。",
                            frameworkTip: "Internal tool 設計框架：Data Model → API → State Machine → Permissions → Notifications → MVP Scope。"
                        ),
                    ]
                ),
            ]
        ),
    ]
}
