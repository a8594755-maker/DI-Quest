import Foundation

enum BusinessAnalysisWorlds {
    static let worlds: [World] = [
        // MARK: - World 1: 問題拆解基礎
        World(
            id: 1,
            name: "問題拆解基礎",
            emoji: "🧩",
            description: "學會把模糊的商業問題拆成可分析的結構",
            quests: [
                Quest(
                    id: "1-1",
                    name: "問題分類：Business / Product / System",
                    description: "面對一個問題，第一步是判斷它屬於哪一類，才能用對分析框架。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "判斷問題類型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這個問題最可能屬於哪一類？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客服團隊的煩惱",
                                narrative: "你是一家 SaaS 公司的 Business Analyst。客服主管跑來找你說：\n\n「最近客戶抱怨變多了，support ticket 處理時間從平均 2 小時變成 8 小時，客戶滿意度從 4.5 分掉到 3.2 分。」\n\n你需要先判斷這是什麼類型的問題，才能決定分析方向。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Business Problem — 商業模式或策略問題", explanation: "這不是商業模式的問題。公司的產品和市場定位沒有改變，問題出在內部營運流程。"),
                                Challenge.Option(id: "B", text: "Product Problem — 產品功能或使用者體驗問題", explanation: "雖然客戶滿意度下降，但根因不在產品本身的功能，而是客服回應速度。"),
                                Challenge.Option(id: "C", text: "System / Process Problem — 流程或系統效率問題", explanation: "正確！處理時間從 2hr 變 8hr，這是典型的流程 bottleneck。需要去分析客服流程哪個環節卡住了。"),
                                Challenge.Option(id: "D", text: "以上皆是，無法區分", explanation: "雖然問題會互相影響，但第一步一定要聚焦。這題的關鍵線索是「處理時間暴增」，指向流程問題。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "注意題目中的關鍵數字：處理時間從 2hr → 8hr。這代表什麼？",
                                "想想看：商業模式有變嗎？產品功能有壞掉嗎？還是做事的方式出了問題？",
                            ],
                            explanation: "問題分類是分析的第一步。Business Problem 影響營收和策略、Product Problem 影響使用者體驗和 adoption、System/Process Problem 影響效率和成本。處理時間暴增是典型的流程問題，要去看 workflow 的每個步驟。",
                            frameworkTip: "問題拆解第一步：先分類 → Business / Product / System，再決定分析方向"
                        ),
                        Challenge(
                            id: 2,
                            name: "影響範圍分析",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "從數據來看，以下哪個判斷最合理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商平台轉換率下降",
                                narrative: "你在一家電商平台擔任 Product Analyst。PM 找你說：\n\n「我們的購物車到結帳的 conversion rate 這個月掉了 20%。」\n\n在開始分析之前，你需要先搞清楚影響範圍。",
                                data: [
                                    ["metric": "Cart-to-Checkout Rate", "last_month": "68%", "this_month": "54%", "change": "-20%"],
                                    ["metric": "Overall Conversion", "last_month": "3.2%", "this_month": "2.8%", "change": "-12.5%"],
                                    ["metric": "Average Order Value", "last_month": "$85", "this_month": "$82", "change": "-3.5%"],
                                    ["metric": "Daily Active Users", "last_month": "125K", "this_month": "128K", "change": "+2.4%"],
                                ],
                                dataCaption: "關鍵指標比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "流量下降導致 conversion 下降", explanation: "DAU 其實微幅上升 (+2.4%)，所以不是流量問題。"),
                                Challenge.Option(id: "B", text: "問題集中在結帳流程，不是整體流量問題", explanation: "正確！DAU 上升但 cart-to-checkout 大幅下降，問題明確在結帳流程那一段。AOV 變化不大，代表購買意願沒太大改變。"),
                                Challenge.Option(id: "C", text: "客戶消費力下降，所以放棄購買", explanation: "AOV 只掉 3.5%，不足以解釋 20% 的 conversion 下降。"),
                                Challenge.Option(id: "D", text: "所有指標都在下降，是全面性問題", explanation: "DAU 其實是上升的。分析數據時要仔細看每個指標的方向。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "比較所有指標的變化方向和幅度，哪個變化最大？",
                                "DAU 是上升的，代表什麼？",
                            ],
                            explanation: "影響範圍分析幫你縮小調查範圍。這裡 DAU 上升排除了流量問題，AOV 變化小排除了消費力問題，所以問題集中在結帳流程本身。下一步應該去看結帳流程的每一步 funnel。",
                            frameworkTip: "先看整體 → 哪個指標變化最大 → 排除不相關因素 → 聚焦問題區域"
                        ),
                        Challenge(
                            id: 3,
                            name: "定義成功標準",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "定義這個內部工具是否成功，最適合的第一步是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "內部工具的困境",
                                narrative: "你加入了一家科技公司的 Business Systems 團隊。主管說：\n\n「我們去年花了半年開發了一套內部 CRM 工具，但現在業務團隊抱怨很多，說不好用。老闆問我們到底有沒有成功，我不知道怎麼回答。」\n\n你需要幫團隊定義「成功」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "看有多少人在用（DAU）", explanation: "使用人數是一個指標，但不是第一步。如果公司只有 50 個業務，DAU 高不代表滿意，低可能是被強迫用。要先搞清楚「成功」對誰來說是什麼。"),
                                Challenge.Option(id: "B", text: "做一份滿意度調查", explanation: "調查很有用，但在做調查之前，你需要先知道要問什麼。先定義成功的維度，再設計調查。"),
                                Challenge.Option(id: "C", text: "回到當初開發這個工具要解決的問題，定義成功的維度", explanation: "正確！先問：這個工具要解決什麼問題？對誰？然後才能定義衡量指標。可能是「縮短業務更新客戶資料的時間」或「提升 pipeline 預測準確度」。"),
                                Challenge.Option(id: "D", text: "比較跟市面上 Salesforce 等工具的功能差異", explanation: "功能比較可以做，但不是定義成功的方式。自建工具和買現成工具的價值衡量方式不同。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "「成功」不是一個固定的東西，要看當初為什麼做。",
                                "想想看：如果你不知道這個工具要解決什麼問題，你怎麼知道它有沒有解決？",
                            ],
                            explanation: "定義成功永遠要回到「為什麼做這件事」。Success metric 必須跟原始目標對齊。如果目標是「讓業務每週省 3 小時更新客戶資料」，那就量這個。使用率和滿意度是 proxy metrics，不是 success metrics。",
                            frameworkTip: "定義成功：目標是什麼 → 成功的維度 → 可衡量的指標 → 現在 vs 目標差距"
                        ),
                    ]
                ),
                Quest(
                    id: "1-2",
                    name: "拆解問題的步驟",
                    description: "學會用結構化的方式把一個大問題拆成可分析的小問題。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "拆解 Activation 下降",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據 funnel 數據，最大的 drop-off 發生在哪一步？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 產品 Activation 下降",
                                narrative: "你是一家 B2B SaaS 公司的 Product Analyst。Growth PM 告訴你：\n\n「新用戶的 7-day activation rate 從上個月的 45% 掉到 32%。」\n\nActivation 的定義是：用戶在註冊後 7 天內完成至少一次核心動作（建立第一個 project）。",
                                data: [
                                    ["step": "註冊完成", "last_month": "100%", "this_month": "100%", "drop": "—"],
                                    ["step": "完成 onboarding", "last_month": "78%", "this_month": "61%", "drop": "-17pp"],
                                    ["step": "建立第一個 project", "last_month": "45%", "this_month": "32%", "drop": "-13pp"],
                                ],
                                dataCaption: "Activation Funnel（註冊後 7 天）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "註冊 → 完成 onboarding（-17pp）", explanation: "正確！從 78% 掉到 61%，差了 17 個百分點，是最大的 drop-off。問題最可能在 onboarding 流程。"),
                                Challenge.Option(id: "B", text: "完成 onboarding → 建立 project（-13pp）", explanation: "這步確實也有下降，但 -13pp 小於 -17pp。要先解決最大的 drop-off。"),
                                Challenge.Option(id: "C", text: "兩步的下降差不多，都要一起處理", explanation: "雖然兩步都下降了，但 prioritization 的原則是先解決影響最大的。-17pp > -13pp。"),
                                Challenge.Option(id: "D", text: "數據不夠，無法判斷", explanation: "這個 funnel 已經清楚顯示了每一步的 drop-off，足以判斷最大的問題在哪。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "看每一步的下降幅度（pp = percentage points）",
                                "哪一步的下降最大，通常就是最值得先調查的",
                            ],
                            explanation: "Funnel analysis 的核心：找到最大的 drop-off → 那就是最值得調查和改善的地方。這裡 onboarding 步驟的 drop-off 最大（-17pp），應該優先分析 onboarding 流程發生了什麼變化。",
                            frameworkTip: "拆解問題：整體指標 → funnel 各步驟 → 找最大 drop-off → 深入調查"
                        ),
                        Challenge(
                            id: 2,
                            name: "提出假設",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個假設最應該優先驗證？",
                            scenario: 
                            Challenge.Scenario(
                                title: "繼續分析 Onboarding Drop-off",
                                narrative: "你發現 onboarding 完成率從 78% 掉到 61%。\n\n你查了一下最近的產品變更紀錄：\n• 3 週前：onboarding 流程從 3 步改成 5 步（新增了「邀請團隊成員」和「連結第三方工具」兩步）\n• 2 週前：marketing 開始投放新的 Google Ads 廣告\n• 1 週前：伺服器有一次 2 小時的 outage\n\n你需要提出最合理的假設。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "伺服器 outage 導致用戶流失", explanation: "Outage 只有 2 小時，而且是 1 週前才發生，但問題已經持續了幾週。影響範圍有限。"),
                                Challenge.Option(id: "B", text: "Onboarding 從 3 步變 5 步，新增步驟造成 friction", explanation: "正確！時間點吻合（3 週前改的，下降也是從那時開始），而且邏輯合理：步驟越多、摩擦越大、完成率越低。這是最應該優先驗證的假設。"),
                                Challenge.Option(id: "C", text: "新的 Google Ads 帶來了品質較低的流量", explanation: "這也是合理假設，但 onboarding 改版的時間點更吻合。而且這個假設需要切 traffic source 才能驗證，相對複雜。"),
                                Challenge.Option(id: "D", text: "競爭對手推出了更好的產品", explanation: "沒有任何資料支持這個假設。提假設要基於已知事實。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看看各個變更的時間點，哪個跟問題出現的時間最吻合？",
                                "假設要基於已知事實，而且要可驗證。",
                            ],
                            explanation: "好的假設有三個特點：(1) 時間點吻合、(2) 邏輯合理（因果關係說得通）、(3) 可以驗證。Onboarding 改版完全符合這三點。驗證方法：比較改版前後的 step-by-step completion rate，看新增的兩步 drop-off 有多高。",
                            frameworkTip: "提假設：列出近期變更 → 比對時間點 → 看因果邏輯 → 選最可驗證的先查"
                        ),
                    ]
                ),
                Quest(
                    id: "1-3",
                    name: "資訊不足時怎麼辦",
                    description: "面試中常遇到資訊不完整的情境，學會問對問題。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "問對問題",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組問題最能幫你釐清問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "模糊的需求",
                                narrative: "面試官問你：\n\n「我們的 app 使用者活躍度不夠好，你會怎麼分析？」\n\n你的第一反應不應該是直接回答，而是先問清楚。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "「活躍度的定義是什麼？」「跟什麼時期比？」「是所有用戶都下降還是特定 segment？」", explanation: "正確！這三個問題分別釐清了：指標定義、比較基準、影響範圍。這是拆解模糊問題的標準套路。"),
                                Challenge.Option(id: "B", text: "「你們有做 A/B test 嗎？」「你們的 tech stack 是什麼？」", explanation: "這些問題太具體了，跳過了最基本的問題定義。你還不知道「活躍度」指的是什麼。"),
                                Challenge.Option(id: "C", text: "「你們 DAU 多少？」「MAU 多少？」", explanation: "直接問數字之前，你應該先確認「活躍度不夠好」是什麼意思。也許面試官說的不是 DAU。"),
                                Challenge.Option(id: "D", text: "「你們有哪些 feature？」「競爭對手是誰？」", explanation: "這些是有用的背景資訊，但不是第一步該問的。先搞清楚問題本身。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "面對模糊問題，先問三件事：定義、比較基準、範圍。",
                            ],
                            explanation: "在面試中，遇到模糊問題時主動釐清是加分的行為。面試官想看你會不會盲目作答。標準釐清框架：(1) 指標怎麼定義？(2) 跟什麼比？(3) 影響範圍多大？這三個問題能把 90% 的模糊問題變清楚。",
                            frameworkTip: "模糊問題處理：定義 → 比較基準 → 影響範圍 → 時間軸 → 再開始分析"
                        ),
                        Challenge(
                            id: 2,
                            name: "缺少數據時的推理",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "在沒有數據工具的情況下，以下哪個方法最務實？",
                            scenario: 
                            Challenge.Scenario(
                                title: "沒有數據的情況",
                                narrative: "面試官接著問：\n\n「假設你沒有任何數據工具，也沒有 analytics dashboard，但老闆明天就要一個初步判斷——我們的用戶是因為 onboarding 問題流失，還是因為產品本身沒有價值。你會怎麼做？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "等拿到數據再分析，沒有數據不應該做判斷", explanation: "在現實中，老闆經常需要快速判斷。能用有限資源做出合理推理是重要能力。"),
                                Challenge.Option(id: "B", text: "看客服 ticket 和用戶回饋，找 qualitative signals", explanation: "正確！客服 ticket、app store reviews、sales team 回饋都是 qualitative data。如果大量抱怨集中在「不知道怎麼開始」，那是 onboarding；如果是「用了幾週覺得沒用」，那是 value。"),
                                Challenge.Option(id: "C", text: "自己用一次產品，親自體驗 onboarding", explanation: "這是有用的方法（dogfooding），但只代表一個人的體驗，不能代表用戶整體。應該搭配其他方法。"),
                                Challenge.Option(id: "D", text: "做一份問卷發給所有用戶", explanation: "問卷需要時間設計和收集，明天要答案的話來不及。而且問卷回覆率通常很低。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "沒有量化數據的時候，還有什麼資訊來源？",
                                "想想看公司裡誰最常直接跟用戶互動？",
                            ],
                            explanation: "在沒有完美數據的情況下做判斷，是 BA/PA 的核心能力之一。Qualitative data（客服紀錄、使用者回饋、sales feedback）是重要的信號來源。面試中展示你知道 quantitative 和 qualitative 都重要，會讓面試官印象深刻。",
                            frameworkTip: "沒有數據時：qualitative signals（客服、回饋、reviews）→ 歸類問題模式 → 形成假設"
                        ),
                    ]
                ),
                Quest(
                    id: "1-4",
                    name: "問題的影響分析",
                    description: "學會評估一個問題的嚴重程度和優先級。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "判斷問題嚴重性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你應該優先處理哪個問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "三個同時出現的問題",
                                narrative: "你是一家 fintech 公司的 BA。週一早上，三個團隊同時來找你：\n\n1. Marketing：「我們的 landing page conversion rate 從 5% 掉到 4.2%」\n2. Operations：「昨天有 12 筆交易被重複扣款，客戶在 Twitter 上抱怨」\n3. Product：「新功能上線一週，adoption rate 只有 8%，低於預期的 20%」",
                                data: [
                                    ["issue": "Landing page conversion", "impact": "潛在營收下降", "urgency": "中", "reversibility": "高"],
                                    ["issue": "重複扣款 bug", "impact": "客戶信任 + 合規風險", "urgency": "極高", "reversibility": "低"],
                                    ["issue": "新功能 adoption 低", "impact": "開發資源浪費", "urgency": "低", "reversibility": "高"],
                                ],
                                dataCaption: "問題比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Landing page conversion — 直接影響營收", explanation: "營收很重要，但 0.8% 的下降不是緊急危機。可以排在第二。"),
                                Challenge.Option(id: "B", text: "重複扣款 bug — 涉及客戶金錢和信任", explanation: "正確！金融產品的重複扣款是最高優先級：(1) 直接損害客戶利益 (2) 合規風險 (3) 已經在社群媒體擴散 (4) 不可逆（已經扣了）。這種問題每多拖一小時，傷害就更大。"),
                                Challenge.Option(id: "C", text: "新功能 adoption — 投入最多資源但效果差", explanation: "這個問題重要但不緊急。功能已經上線了，多觀察幾天不會更糟。"),
                                Challenge.Option(id: "D", text: "三個同時處理，各分配 1/3 時間", explanation: "資源有限時不應該平均分配。應該按嚴重性和緊急性排優先級。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想哪個問題如果不馬上處理，後果最嚴重？",
                                "考慮：impact（影響大小）× urgency（緊急程度）× reversibility（可逆性）",
                            ],
                            explanation: "優先級評估框架：Impact × Urgency × Irreversibility。重複扣款在三個維度都是最高的。在面試中，展示你能在多個問題之間做 trade-off 和 prioritization 是關鍵能力。",
                            frameworkTip: "優先級 = Impact × Urgency × Irreversibility。先處理不可逆且影響大的。"
                        ),
                        Challenge(
                            id: 2,
                            name: "利害關係人分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "在回報給管理層之前，你的分析應該包含哪些要素？",
                            scenario: 
                            Challenge.Scenario(
                                title: "誰被影響了？",
                                narrative: "繼續重複扣款的案例。你已經確認這是最高優先級，現在需要搞清楚影響範圍和利害關係人。\n\n初步調查發現：\n• 12 筆重複扣款，金額從 $50 到 $2,000 不等\n• 其中 3 位客戶已經在 Twitter 上公開抱怨\n• Bug 來自昨天的一次 payment service 更新\n• 目前 bug 已被工程師修復，但重複扣款尚未退還",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只報告 bug 已修復，問題已解決", explanation: "Bug 修復 ≠ 問題解決。還有退款、客戶溝通、防止再發等後續工作。只報告好消息會失去信任。"),
                                Challenge.Option(id: "B", text: "影響範圍（多少人、多少錢）、根因、已採取的行動、還需要什麼", explanation: "正確！完整的 incident report 應該包含：What happened → How many affected → Root cause → Actions taken → What's still needed → Prevention plan。這樣管理層才能做決策。"),
                                Challenge.Option(id: "C", text: "詳細的技術根因分析報告", explanation: "管理層不需要看技術細節。他們需要知道：影響多大、現在怎麼樣了、還需要做什麼。"),
                                Challenge.Option(id: "D", text: "客戶的 Twitter 抱怨截圖", explanation: "這只是問題的一小部分。報告應該是全面的影響分析，不只是社群媒體反應。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "管理層做決策需要什麼資訊？",
                                "想想一個完整的問題報告應該回答哪些問題。",
                            ],
                            explanation: "向管理層報告問題時，用這個結構：(1) What — 發生了什麼 (2) Scale — 影響多大 (3) Why — 根因 (4) Done — 已做了什麼 (5) Need — 還需要什麼 (6) Prevent — 怎麼防止再發。這個框架在面試中也很好用。",
                            frameworkTip: "Incident 報告結構：What → Scale → Why → Done → Need → Prevent"
                        ),
                    ]
                ),
                Quest(
                    id: "1-5",
                    name: "結構化思考練習",
                    description: "把前面學的結合起來，用結構化的方式回答一個完整的 case。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Case: 內部工具 adoption 低",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "用問題拆解的方式，這個案例最合理的拆法是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "沒人用的新工具",
                                narrative: "你是 Business Systems Analyst。公司花了 3 個月開發了一套新的 expense report 系統，取代原本用 Excel + email 的流程。\n\n上線 1 個月後的數據：\n• 公司有 500 人需要報銷\n• 只有 120 人用過新系統（24%）\n• 其中 45 人用了一次就沒再用\n• 剩下的 380 人還在用舊的 Excel 流程\n• 財務部收到大量抱怨說「新系統太複雜」",
                                data: [
                                    ["segment": "用新系統且持續使用", "count": "75", "pct": "15%"],
                                    ["segment": "用過一次就放棄", "count": "45", "pct": "9%"],
                                    ["segment": "從未使用新系統", "count": "380", "pct": "76%"],
                                ],
                                dataCaption: "使用者分布"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "這是 Product Problem：系統太難用 → 直接重新設計 UI", explanation: "「太複雜」只是表面回饋。不知道是真的太複雜，還是沒有教育訓練，還是舊流程太好用。直接重做 UI 風險很大。"),
                                Challenge.Option(id: "B", text: "分三層拆：(1) 知不知道有新系統 (2) 試用體驗如何 (3) 長期使用有沒有價值", explanation: "正確！Adoption 問題經典拆法：Awareness → Trial Experience → Ongoing Value。76% 沒用過可能是不知道、不想用、或不會用。9% 用了就放棄是 trial experience 有問題。只有分開看才能對症下藥。"),
                                Challenge.Option(id: "C", text: "這是 Change Management 問題：強制全公司使用就好了", explanation: "強制使用可以提高使用率，但如果系統真的有問題，只會製造更多抱怨。先搞清楚問題再決定策略。"),
                                Challenge.Option(id: "D", text: "比較新舊系統的功能差異，找出新系統缺什麼", explanation: "功能比較是分析的一部分，但不是拆解問題的方式。你需要先理解不同使用者為什麼不用，再看功能。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "76% 從未使用 vs 9% 用了放棄，這兩群人的問題一樣嗎？",
                                "想想 user adoption 的三個階段：知道 → 試用 → 持續使用",
                            ],
                            explanation: "Adoption 問題的經典拆法：Awareness（知道嗎？）→ Trial（試了嗎？體驗如何？）→ Value（持續用有價值嗎？）。不同階段需要不同的解決方案：Awareness 低要做推廣、Trial 差要改 onboarding、Value 低要改功能。",
                            frameworkTip: "Adoption 三層拆解：Awareness → Trial → Value。不同階段不同解法。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Case: 下一步行動",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "基於調查結果，最合理的建議是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "針對 Expense Report 系統的改善建議",
                                narrative: "你進一步調查後發現：\n\n• Awareness：85% 的人知道有新系統（公告過），所以 awareness 不是主要問題\n• Trial：120 人試用後，45 人放棄的主因是「上傳收據的流程太多步」\n• Value：持續使用的 75 人普遍反映「報銷速度從 2 週縮到 3 天，很棒」\n\n你需要決定下一步。",
                                data: [
                                    ["finding": "Awareness", "status": "不是主因", "detail": "85% 知道有新系統"],
                                    ["finding": "Trial Experience", "status": "主要問題", "detail": "上傳收據流程太複雜"],
                                    ["finding": "Value", "status": "正面", "detail": "持續使用者滿意度高"],
                                ],
                                dataCaption: "調查結果摘要"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全面重新設計系統", explanation: "持續使用者已經很滿意了，全面重設計是 overkill。只需要改善收據上傳那一步。"),
                                Challenge.Option(id: "B", text: "簡化收據上傳流程，然後邀請放棄的 45 人重新試用", explanation: "正確！Root cause 是收據上傳太複雜。解法：(1) 簡化那個流程 (2) 邀請放棄的人再試一次 (3) 用持續使用者的正面回饋做 social proof。針對性修復，而不是全面重來。"),
                                Challenge.Option(id: "C", text: "強制所有人使用，取消 Excel 報銷流程", explanation: "在修好收據上傳問題之前就強制，會讓更多人有不好的體驗。先修再推。"),
                                Challenge.Option(id: "D", text: "做 A/B test 測試不同的 onboarding 流程", explanation: "A/B test 適合不確定原因的時候。這裡原因已經很清楚了（收據上傳太複雜），直接改就好。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "已經找到根因了，建議要對症下藥。",
                                "Value 已經被驗證了（持續使用者滿意），所以問題不在產品價值，在 trial experience。",
                            ],
                            explanation: "好的建議要：(1) 直接對應 root cause (2) 最小化改動範圍 (3) 有明確的驗證方式。這裡只需要改收據上傳流程，然後追蹤放棄者回流率。面試中，展示你能從分析收斂到具體、可執行的建議，是最加分的能力。",
                            frameworkTip: "建議公式：針對 root cause → 最小可行改動 → 明確驗證方式 → 風險和限制"
                        ),
                    ]
                ),
                Quest(
                    id: "1-6",
                    name: "Boss: 完整 Case 拆解",
                    description: "用完整的 case answer framework 回答一個端到端的商業問題。",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Case: 訂閱制產品續約率下降",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "第一步：從數據來看，你會如何定義問題的範圍？",
                            scenario: 
                            Challenge.Scenario(
                                title: "續約率危機",
                                narrative: "你是一家 B2B SaaS 公司的 Product Analyst，產品是專案管理工具（類似 Asana/Monday.com）。\n\nCEO 在 All Hands 上說：「我們的年度續約率從 85% 掉到 72%，如果不改善，明年營收會少 $2M。」\n\n你被指派負責分析這個問題。\n\n公司有三種 plan：\n• Starter（$99/yr，1-5 人）\n• Professional（$499/yr，6-50 人）\n• Enterprise（$2,999/yr，50+ 人）",
                                data: [
                                    ["plan": "Starter", "customers": "2000", "renewal_rate_before": "78%", "renewal_rate_now": "61%", "change": "-17pp"],
                                    ["plan": "Professional", "customers": "800", "renewal_rate_before": "88%", "renewal_rate_now": "82%", "change": "-6pp"],
                                    ["plan": "Enterprise", "customers": "150", "renewal_rate_before": "95%", "renewal_rate_now": "93%", "change": "-2pp"],
                                ],
                                dataCaption: "各 Plan 續約率變化"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有 Plan 都在下降，這是全面性問題", explanation: "雖然所有 plan 都下降了，但幅度差異很大。Starter -17pp vs Enterprise -2pp。聚焦在 Starter 能解決大部分問題。"),
                                Challenge.Option(id: "B", text: "問題主要集中在 Starter plan（-17pp），應該優先分析這個 segment", explanation: "正確！Starter 的下降幅度最大（-17pp），而且客戶數最多（2000 家）。這意味著光是改善 Starter 的續約率就能解決大部分營收缺口。"),
                                Challenge.Option(id: "C", text: "Enterprise 續約率最重要，因為單價最高", explanation: "Enterprise 單價高，但下降只有 -2pp（3 家客戶），影響約 $9K。Starter 下降 -17pp（340 家客戶），影響約 $34K。要看絕對影響。"),
                                Challenge.Option(id: "D", text: "需要更多數據才能判斷", explanation: "目前的數據已經足夠做初步 segmentation。先聚焦最大的問題，再深入分析。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看 drop 幅度和客戶數量的乘積，哪個 segment 的影響最大？",
                            ],
                            explanation: "面試中的 case 拆解第一步：segmentation。切出最受影響的 segment，聚焦分析。這裡 Starter plan 的 drop 最大且客戶最多，是分析的首要目標。",
                            frameworkTip: "Case 第一步：Goal → Metrics → Segmentation → 聚焦最大問題"
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Case: 找出根因",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "根據以上資訊，最可能的 root cause 是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "深入 Starter Plan 分析",
                                narrative: "你聚焦到 Starter plan 後，進一步調查，找到以下資訊：\n\n• Starter 用戶平均只使用產品的 3 個功能（共有 15 個功能）\n• 續約的 Starter 用戶平均在到期前 30 天仍有活躍使用\n• 未續約的 Starter 用戶，平均在到期前 60 天就停止使用了\n• 6 個月前，公司把 Starter plan 的「Gantt Chart」功能移到了 Professional plan\n• 客服紀錄顯示，Starter 用戶最常問的問題是：「Gantt Chart 去哪了？」",
                                data: [
                                    ["metric": "平均使用功能數", "renewed": "5 個", "not_renewed": "2 個"],
                                    ["metric": "最後活躍到到期的天數", "renewed": "持續使用到到期", "not_renewed": "到期前 60 天就停用"],
                                    ["metric": "客服詢問 Top 1", "renewed": "帳務問題", "not_renewed": "Gantt Chart 功能消失"],
                                ],
                                dataCaption: "續約 vs 未續約用戶比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Starter 用戶本來就不夠 engaged，遲早會流失", explanation: "續約的 Starter 用戶使用 5 個功能且持續活躍，代表 Starter 用戶是可以被 retain 的。問題不是天生的。"),
                                Challenge.Option(id: "B", text: "把 Gantt Chart 從 Starter 移走，讓依賴這個功能的用戶失去了關鍵價值", explanation: "正確！所有線索都指向同一個方向：(1) 時間點吻合（6 個月前移走，現在到期不續約）(2) 客服數據支持（最常問的問題）(3) 行為數據支持（未續約者更早停用）。這是典型的「移除功能導致價值流失」。"),
                                Challenge.Option(id: "C", text: "競爭對手的免費工具搶走了小型團隊", explanation: "沒有數據支持競爭對手的假設。而且客服 Top 1 問題是 Gantt Chart，不是「我找到更好的工具」。"),
                                Challenge.Option(id: "D", text: "價格太高，小型團隊負擔不起", explanation: "$99/yr 不算高。而且之前續約率是 78%，價格沒變但續約率掉了，代表問題不在價格。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "注意時間軸：Gantt Chart 何時被移走？續約率何時開始掉？",
                                "客服 Top 1 問題是什麼？",
                            ],
                            explanation: "Root cause analysis 要找到多條線索的交叉點。這裡時間軸、客服數據、使用行為都指向 Gantt Chart 被移走。在面試中，能把多個資料來源串在一起得出結論，是最高分的回答方式。",
                            frameworkTip: "Root cause 驗證：多條線索交叉確認（時間點 + 行為數據 + qualitative feedback）"
                        ),
                        Challenge(
                            id: 3,
                            name: "Boss Case: 提出建議",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你會向管理層提出什麼建議？",
                            scenario: 
                            Challenge.Scenario(
                                title: "怎麼解決續約率問題",
                                narrative: "你已經確認 root cause：Gantt Chart 被移到 Professional plan，導致 Starter 用戶價值流失。\n\n但這不是你一個人能決定的。商業考量如下：\n\n• 營收團隊把 Gantt Chart 移走是為了推動 Starter → Professional 的 upsell\n• 但實際 upsell conversion 只有 3%（預期是 15%）\n• 97% 的 Starter 用戶沒有升級，其中很多直接不續約了\n• Starter plan 佔總客戶數的 68%",
                                data: [
                                    ["scenario": "維持現狀", "starter_renewal": "61%", "upsell_rate": "3%", "revenue_impact": "-$340K/yr"],
                                    ["scenario": "Gantt Chart 放回 Starter", "starter_renewal": "~75%", "upsell_rate": "~1%", "revenue_impact": "+$140K/yr"],
                                    ["scenario": "Gantt Chart 放回 + 新 upsell 策略", "starter_renewal": "~75%", "upsell_rate": "~5%", "revenue_impact": "+$200K/yr"],
                                ],
                                dataCaption: "三種方案的預估影響"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "維持現狀，加強 upsell 推廣力度", explanation: "Upsell 只有 3%（預期 15%），代表 Starter 用戶對升級沒有意願。繼續推只會讓更多人不續約。"),
                                Challenge.Option(id: "B", text: "把 Gantt Chart 放回 Starter，放棄 upsell", explanation: "這解決了續約問題，但 upsell 降到 1%，等於完全放棄了升級收入。有更好的方案。"),
                                Challenge.Option(id: "C", text: "把 Gantt Chart 放回 Starter，同時設計新的 upsell 價值點", explanation: "正確！最佳方案兼顧兩個目標：(1) 放回 Gantt Chart 止血，恢復 Starter 續約率 (2) 用其他功能（如進階報表、API 整合）作為新的 upsell 動機。數據顯示這個方案的 revenue impact 最好。"),
                                Challenge.Option(id: "D", text: "取消 Starter plan，全部併入 Professional", explanation: "這會直接趕走 68% 的客戶。Starter 是 acquisition funnel 的入口，取消它會傷害長期成長。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "看三種方案的 revenue impact，哪個最好？",
                                "好的建議要兼顧短期止血和長期成長。",
                            ],
                            explanation: "面試中提建議的黃金法則：不是非黑即白，要找到兼顧多方利益的方案。這裡「放回 + 新 upsell」既解決了續約問題，又保留了升級的成長空間。最後記得說你會怎麼驗證：追蹤放回後的續約率和新 upsell 的 conversion。",
                            frameworkTip: "Case 最後一步：Recommend → Why this one → Trade-offs → How to validate"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 2: KPI 與商業指標
        World(
            id: 2,
            name: "KPI 與商業指標",
            emoji: "📊",
            description: "學會選對指標、讀懂數據、做出判斷",
            quests: [
                Quest(
                    id: "2-1",
                    name: "KPI 基礎概念",
                    description: "理解 KPI 是什麼、為什麼不同角色看重不同指標。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Leading vs Lagging Metrics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是 leading metric（領先指標），能提前預警營收問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "季度業績回顧",
                                narrative: "你在一家 SaaS 公司參加季度業績回顧會議。以下是報告中的指標：\n\n• Q3 營收：$1.2M（目標 $1.5M，差 20%）\n• 客戶流失率：8%（上季 5%）\n• Sales pipeline 合格線索數：下降 30%\n• 產品 NPS：從 45 降到 38\n\nCEO 想知道為什麼營收沒達標。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Q3 營收 $1.2M", explanation: "營收是 lagging metric（滯後指標），是結果，不是預警信號。看到營收不達標的時候，問題已經發生了。"),
                                Challenge.Option(id: "B", text: "Sales pipeline 合格線索數", explanation: "正確！Pipeline 是典型的 leading metric。線索數下降 → 3-6 個月後成交量下降 → 營收下降。如果在 Q2 就發現 pipeline 下降，Q3 營收問題是可以提前預防的。"),
                                Challenge.Option(id: "C", text: "客戶流失率 8%", explanation: "流失率是 lagging metric，客戶已經離開了才計算出來。但流失的「前兆」（如使用頻率下降）才是 leading metric。"),
                                Challenge.Option(id: "D", text: "NPS 分數 38", explanation: "NPS 比較接近 leading（低 NPS 預示未來可能流失），但它本身不是直接導致營收的因子，而且 NPS 的可操作性較低。Pipeline 更直接。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Leading metric 是能在結果發生之前就發現問題的指標。",
                                "想想哪個指標如果提前發現異常，可以讓你採取行動避免問題？",
                            ],
                            explanation: "Leading metrics 預測未來（pipeline、activation rate、feature adoption），Lagging metrics 反映過去（revenue、churn、NPS）。好的 dashboard 兩者都要有：lagging 確認結果，leading 提前預警。面試中如果能主動區分這兩種指標，面試官會加分。",
                            frameworkTip: "Leading = 可預測、可行動 / Lagging = 反映結果、確認趨勢"
                        ),
                        Challenge(
                            id: 2,
                            name: "Guardrail Metrics",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個策略達到了 primary metric 目標，但 guardrail metrics 告訴你什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Growth Hack 的副作用",
                                narrative: "你在一家電商公司。Growth 團隊推了一個策略：「首次購物免運費」，目標是提升新客轉換率。\n\n結果：\n• 新客轉換率：從 2.5% 提升到 4.8%（成功 ✓）\n• 平均訂單金額：從 $85 降到 $32\n• 退貨率：從 5% 上升到 22%\n• 客戶 30 天回購率：3%（之前新客是 15%）",
                                data: [
                                    ["metric": "新客轉換率", "before": "2.5%", "after": "4.8%", "verdict": "上升"],
                                    ["metric": "平均訂單金額", "before": "$85", "after": "$32", "verdict": "大幅下降"],
                                    ["metric": "退貨率", "before": "5%", "after": "22%", "verdict": "大幅上升"],
                                    ["metric": "30天回購率", "before": "15%", "after": "3%", "verdict": "大幅下降"],
                                ],
                                dataCaption: "免運費策略前後比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "策略很成功，轉換率幾乎翻倍", explanation: "只看 primary metric 會誤判。AOV 和退貨率的惡化代表吸引的是低品質客戶，長期會虧錢。"),
                                Challenge.Option(id: "B", text: "Guardrail metrics 全部惡化，策略雖然達標但帶來了不健康的成長", explanation: "正確！Guardrail metrics 的作用就是防止你「達標但傷害整體」。AOV 暴跌、退貨率暴增、回購率跳水，代表免運費吸引的是薅羊毛的客戶，不是真正的目標客群。這是不健康的成長。"),
                                Challenge.Option(id: "C", text: "退貨率上升是正常的，電商都有這個問題", explanation: "從 5% 到 22% 是 4 倍以上的增長，這不正常。特別是跟免運費策略的時間點完全吻合。"),
                                Challenge.Option(id: "D", text: "需要更多時間觀察，一個月數據不夠", explanation: "Guardrail metrics 的變化已經非常明顯了。在數據這麼清楚的情況下，等待反而是在浪費錢。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Guardrail metrics 是「不能惡化」的底線指標。如果 guardrail 被突破了，策略再成功也要喊停。",
                            ],
                            explanation: "Guardrail metrics 的核心概念：你的 primary metric 可以改善，但不能以犧牲這些指標為代價。常見的 guardrail：AOV、退貨率、客戶品質、unit economics。面試中如果你能主動提到「我會設什麼 guardrail」，代表你有成熟的分析思維。",
                            frameworkTip: "每個改善計畫都要有：Primary Metric（要改善的）+ Guardrail Metrics（不能惡化的）"
                        ),
                    ]
                ),
                Quest(
                    id: "2-2",
                    name: "Product & User Metrics",
                    description: "熟悉 Product Analyst 最常用的使用者指標。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "DAU/MAU 比率解讀",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Finance App 的 DAU/MAU 只有 8%，這代表什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "三款產品的活躍度比較",
                                narrative: "你在一家科技集團擔任 PA，需要比較集團旗下三款產品的用戶黏性。\n\nDAU/MAU 比率（也叫 stickiness ratio）反映的是：每月的活躍用戶中，平均每天有多少比例在使用。",
                                data: [
                                    ["product": "Chat App", "DAU": "5.2M", "MAU": "8M", "DAU/MAU": "65%", "category": "社交通訊"],
                                    ["product": "Project Tool", "DAU": "800K", "MAU": "3.2M", "DAU/MAU": "25%", "category": "工作管理"],
                                    ["product": "Finance App", "DAU": "200K", "MAU": "2.5M", "DAU/MAU": "8%", "category": "個人理財"],
                                ],
                                dataCaption: "三款產品活躍度"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "產品有嚴重問題，使用者不喜歡用", explanation: "不一定。個人理財 app 的使用頻率天生就低——你不會每天查帳戶餘額。低 DAU/MAU 不代表產品差，要看 category benchmark。"),
                                Challenge.Option(id: "B", text: "使用者不需要每天使用，低 stickiness 對這類產品是正常的", explanation: "正確！不同品類的產品有不同的使用頻率。社交 app DAU/MAU > 50% 是正常的，但理財 app 可能 10% 就算不錯。關鍵是跟同品類比較，而不是跨品類。"),
                                Challenge.Option(id: "C", text: "應該加入更多每日通知來提高 DAU", explanation: "強行推通知會導致使用者關閉通知或刪除 app。使用頻率應該由產品價值驅動，不是打擾驅動。"),
                                Challenge.Option(id: "D", text: "MAU 高但 DAU 低，代表使用者只用一次就不再用", explanation: "不是只用一次——MAU 代表一個月內有使用。只是不是每天用。可能是每月用 2-3 次。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "你每天都會開銀行 app 嗎？還是發薪水的時候才看？",
                                "不同類型的產品，有不同的「正常」使用頻率。",
                            ],
                            explanation: "指標解讀的關鍵：context matters。同一個數字在不同 context 下意義完全不同。面試中面試官常常會給你一個指標，看你會不會盲目下結論。正確做法：先問 benchmark 是什麼，再做判斷。",
                            frameworkTip: "解讀指標：先看 category benchmark → 跟同類比較 → 不要跨類比較"
                        ),
                        Challenge(
                            id: 2,
                            name: "Retention 與 Cohort",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "從數據看，你能直接得出「AI 摘要功能提升了 retention」的結論嗎？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新功能的 Retention 分析",
                                narrative: "你在一家 productivity app 公司。PM 上線了一個「AI 摘要」功能，想知道它對 retention 的影響。\n\n你做了一個 cohort 分析，比較「用過 AI 摘要」vs「沒用過」的 30 天 retention。",
                                data: [
                                    ["day": "Day 1", "with_AI": "82%", "without_AI": "75%"],
                                    ["day": "Day 7", "with_AI": "64%", "without_AI": "48%"],
                                    ["day": "Day 14", "with_AI": "55%", "without_AI": "35%"],
                                    ["day": "Day 30", "with_AI": "48%", "without_AI": "22%"],
                                ],
                                dataCaption: "30 天 Retention 比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "可以，用 AI 摘要的用戶 retention 明顯更高", explanation: "相關性 ≠ 因果關係。也許本來就比較 engaged 的用戶才會去用 AI 摘要，所以 retention 高不是 AI 摘要「造成」的，而是這群人本來就不容易流失。"),
                                Challenge.Option(id: "B", text: "不能直接得出因果結論，可能有 selection bias", explanation: "正確！這是 correlation vs causation 的經典陷阱。用 AI 摘要的人可能本來就是 power users，他們的 retention 本來就高。要驗證因果關係，需要做 A/B test（隨機分配）或控制其他變數。"),
                                Challenge.Option(id: "C", text: "不能，因為樣本數不夠", explanation: "題目沒有給樣本數資訊，但問題不在樣本數，而在研究設計（observational vs experimental）。"),
                                Challenge.Option(id: "D", text: "需要看更長期的數據才能判斷", explanation: "更長的數據有幫助，但根本問題是 selection bias，不是觀察時間。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想看：是 AI 摘要讓他們留下來，還是本來就會留下來的人才會去用 AI 摘要？",
                                "Correlation ≠ Causation。怎麼才能驗證因果關係？",
                            ],
                            explanation: "這是 PA 面試的經典考題：correlation vs causation。每次看到「使用 X 功能的用戶表現更好」的數據，第一反應要問：是不是 selection bias？解法：A/B test 隨機分配、PSM（propensity score matching）、或找 natural experiment。",
                            frameworkTip: "看到相關性先問：是 X 導致 Y，還是某個 Z 同時導致了 X 和 Y？"
                        ),
                        Challenge(
                            id: 3,
                            name: "Feature Adoption 評估",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如果你只能改善一個環節來最大化 adoption，你會選哪一步？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新功能上線兩週",
                                narrative: "你的公司推出了一個「smart scheduling」功能。以下是上線兩週的數據：\n\n• 總 MAU：50,000\n• 看到功能入口的用戶：38,000（76%）\n• 點擊進入功能的用戶：8,000（21% of exposed）\n• 完成第一次使用的用戶：3,200（40% of clicked）\n• 第二週回來再用的用戶：1,800（56% of first-time users）",
                                data: [
                                    ["stage": "Exposed（看到入口）", "users": "38,000", "rate": "76% of MAU"],
                                    ["stage": "Clicked（點擊進入）", "users": "8,000", "rate": "21% of exposed"],
                                    ["stage": "Completed（完成首次使用）", "users": "3,200", "rate": "40% of clicked"],
                                    ["stage": "Retained（第二週回用）", "users": "1,800", "rate": "56% of completed"],
                                ],
                                dataCaption: "Smart Scheduling Adoption Funnel"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Exposed → Clicked（21%），提升功能的可發現性", explanation: "21% 的點擊率其實不低。而且提升可發現性通常是 UI 調整，改善空間有限。"),
                                Challenge.Option(id: "B", text: "Clicked → Completed（40%），改善首次使用體驗", explanation: "正確！60% 的人點進來但沒完成第一次使用，代表首次使用體驗有嚴重的 friction。改善這一步能把 3,200 人提升到可能 5,000-6,000 人，而且後續的 retention（56%）已經不錯了，代表用過的人覺得有價值。"),
                                Challenge.Option(id: "C", text: "Completed → Retained（56%），提升回用率", explanation: "56% 的回用率其實相當好。而且最大的流失在前一步（60% 的人沒完成首次使用），應該先解決大的問題。"),
                                Challenge.Option(id: "D", text: "增加 Exposed 比例，讓更多人看到", explanation: "76% 已經很高了，剩下 24% 可能是不常用的用戶。提升空間有限。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看每一步的 drop-off rate，哪一步流失最嚴重？",
                                "改善最大的 drop-off 通常能產生最大的影響。",
                            ],
                            explanation: "Feature adoption funnel 分析的邏輯跟所有 funnel 一樣：找最大 drop-off → 優先改善。這裡 Clicked → Completed 的 60% drop-off 是最大的瓶頸。改善首次使用體驗（如簡化流程、加入引導）能產生最大效果。",
                            frameworkTip: "Feature Adoption Funnel: Exposed → Clicked → Completed → Retained → 找最大 drop-off"
                        ),
                    ]
                ),
                Quest(
                    id: "2-3",
                    name: "Business & Operations Metrics",
                    description: "了解營運和商業指標：cycle time、SLA、throughput 等。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Cycle Time 分析",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "整體 cycle time 是 13 小時（目標 7 小時），最應該先改善哪個步驟？",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂單處理效率",
                                narrative: "你在一家 B2B 電商平台負責 operations analytics。老闆要你分析訂單處理效率。\n\n一筆訂單從下單到出貨的流程：\n下單 → 付款確認 → 倉庫撿貨 → 品質檢查 → 包裝 → 出貨",
                                data: [
                                    ["step": "下單→付款確認", "avg_time": "0.5 hr", "target": "1 hr", "status": "達標"],
                                    ["step": "付款確認→撿貨", "avg_time": "4 hr", "target": "2 hr", "status": "超標"],
                                    ["step": "撿貨→品質檢查", "avg_time": "1 hr", "target": "1 hr", "status": "達標"],
                                    ["step": "品質檢查→包裝", "avg_time": "6 hr", "target": "1 hr", "status": "嚴重超標"],
                                    ["step": "包裝→出貨", "avg_time": "1.5 hr", "target": "2 hr", "status": "達標"],
                                ],
                                dataCaption: "各步驟 Cycle Time（平均）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "付款確認→撿貨（超標 2 小時）", explanation: "超標了 2 小時，是第二大的瓶頸，但不是最嚴重的。"),
                                Challenge.Option(id: "B", text: "品質檢查→包裝（超標 5 小時）", explanation: "正確！這個步驟超標最嚴重（6hr vs 目標 1hr），是整個流程的 bottleneck。改善這一步能把總 cycle time 從 13hr 降到 8hr，接近目標。"),
                                Challenge.Option(id: "C", text: "所有步驟一起改善", explanation: "資源有限，應該先攻最大的瓶頸。品質檢查→包裝這一步佔了超標時間的 83%（5/6 小時）。"),
                                Challenge.Option(id: "D", text: "包裝→出貨，因為是最後一步最影響客戶感受", explanation: "這一步其實是達標的（1.5hr vs 目標 2hr），不需要改善。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "哪個步驟的實際時間和目標差距最大？",
                            ],
                            explanation: "Cycle time 分析的核心：找到 bottleneck（瓶頸）。品質檢查→包裝超標 5 小時，代表可能是排隊等包裝（產能不足）、品質不良率高需要重工、或流程設計有問題。找到 bottleneck 後，下一步是分析根因。",
                            frameworkTip: "流程優化：畫出每一步 → 量時間 → 找 bottleneck → 分析根因 → 改善"
                        ),
                        Challenge(
                            id: 2,
                            name: "SLA 達成率",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "從 SLA 數據來看，最令人擔心的是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "IT Support SLA 分析",
                                narrative: "你是 IT 部門的 BA，負責分析 support ticket 的 SLA 達成率。\n\n公司 SLA 承諾：\n• P1（系統故障）：1 小時內回應，4 小時內解決\n• P2（功能異常）：4 小時內回應，24 小時內解決\n• P3（一般問題）：24 小時內回應，72 小時內解決",
                                data: [
                                    ["priority": "P1", "tickets": "15", "response_sla": "93%", "resolve_sla": "73%"],
                                    ["priority": "P2", "tickets": "120", "response_sla": "88%", "resolve_sla": "82%"],
                                    ["priority": "P3", "tickets": "450", "response_sla": "95%", "resolve_sla": "91%"],
                                ],
                                dataCaption: "上月 SLA 達成率"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "P3 的 ticket 數量最多（450 張）", explanation: "數量多不代表有問題。P3 的 SLA 達成率很好（95% / 91%），代表在控制範圍內。"),
                                Challenge.Option(id: "B", text: "P1 的解決 SLA 只有 73%，代表 27% 的系統故障沒在 4 小時內解決", explanation: "正確！P1 是最高優先級的系統故障，解決率只有 73% 代表每 4 個系統故障就有 1 個超過 4 小時才解決。這對業務影響最大，而且數量雖然只有 15 張，但每一張的影響範圍可能是全公司。"),
                                Challenge.Option(id: "C", text: "P2 的回應 SLA 低於 90%", explanation: "P2 回應率 88% 確實需要關注，但 P1 解決率 73% 更嚴重。系統故障不解決的影響遠大於功能異常慢回覆。"),
                                Challenge.Option(id: "D", text: "整體表現不錯，不用太擔心", explanation: "P1 解決 SLA 73% 是嚴重問題。系統故障每多停一小時，全公司都在等。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "哪個 priority 的後果最嚴重？那個 priority 的達成率是多少？",
                            ],
                            explanation: "SLA 分析要考慮 priority × 達成率。P1 雖然只有 15 張，但每一張都是系統故障，影響可能是上百人無法工作。73% 的解決率代表平均每月有 4 張 P1 超時未解決——這可能代表缺少 on-call 工程師、escalation 流程有問題、或技術債太多。",
                            frameworkTip: "SLA 分析：Priority × Volume × 達成率 → 高 Priority 低達成率是最大風險"
                        ),
                    ]
                ),
                Quest(
                    id: "2-4",
                    name: "Success Metrics 怎麼定",
                    description: "學會為一個專案或功能定義 success metrics。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "為新功能定 Success Metric",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個最適合作為 primary success metric？",
                            scenario: 
                            Challenge.Scenario(
                                title: "設計 Dashboard 的成功指標",
                                narrative: "你公司要開發一個內部 sales dashboard，讓業務團隊追蹤他們的 pipeline 和成交進度。\n\n目標：讓業務團隊每天自己看 dashboard，不再需要每週問 data team 拉報表。\n\nPM 問你：「這個 dashboard 的 success metric 應該是什麼？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Dashboard 的 DAU（每日活躍用戶數）", explanation: "DAU 是一個不錯的指標，但它衡量的是「有人在用」，不是「解決了問題」。有人可能每天打開但沒有得到有用資訊。"),
                                Challenge.Option(id: "B", text: "Data team 收到的 ad-hoc 報表請求數量下降", explanation: "正確！回到原始目標：「不再需要每週問 data team 拉報表」。最直接的 success metric 就是 ad-hoc request 數量是否下降。如果 dashboard 真的有用，業務自己能找到答案，就不會再問 data team。"),
                                Challenge.Option(id: "C", text: "業務團隊的成交率提升", explanation: "成交率受太多因素影響（市場、產品、定價、個人能力），很難歸因到 dashboard。而且這是 lagging metric，要很久才能看到效果。"),
                                Challenge.Option(id: "D", text: "使用者滿意度問卷分數", explanation: "滿意度是 proxy metric，不是 success metric。他們可能覺得 dashboard 很漂亮但不實用。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "回到原始目標：這個 dashboard 要解決什麼問題？",
                                "最好的 success metric 直接衡量「問題有沒有被解決」。",
                            ],
                            explanation: "Success metric 的定義原則：直接衡量目標是否達成。目標是「減少 ad-hoc 報表請求」，success metric 就是「ad-hoc 報表請求數量」。不是 DAU（proxy），不是成交率（太間接），不是滿意度（主觀）。",
                            frameworkTip: "Success Metric = 直接衡量目標達成 / Proxy Metric = 間接相關的指標"
                        ),
                        Challenge(
                            id: 2,
                            name: "指標之間的衝突",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "面對兩個衝突的指標，最好的做法是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "速度 vs 品質",
                                narrative: "你在一家外送平台擔任 BA。公司有兩個核心指標：\n\n1. 訂單完成時間：目標 30 分鐘內送達\n2. 訂單正確率：目標 98% 訂單沒有錯誤\n\n上個月為了衝「完成時間」指標，很多外送員搶快送餐，導致：\n• 平均送達時間從 35 分鐘降到 28 分鐘（達標 ✓）\n• 訂單錯誤率從 2% 升到 7%（不達標 ✗）\n• 客戶投訴增加 3 倍",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "速度比品質重要，繼續保持 28 分鐘", explanation: "7% 錯誤率和 3 倍投訴會傷害客戶忠誠度和品牌。短期速度的提升不值得長期的品質損失。"),
                                Challenge.Option(id: "B", text: "品質比速度重要，回到原來的流程", explanation: "完全回退也不是最優解。如果能找到既不犧牲速度又能維持品質的方法，才是最好的。"),
                                Challenge.Option(id: "C", text: "把訂單正確率設為 guardrail（不能低於 98%），在這個前提下優化速度", explanation: "正確！這就是 guardrail 的正確用法。Primary metric（速度）可以優化，但 guardrail（正確率 ≥ 98%）不能被犧牲。這樣可以避免「為了一個指標傷害另一個」的情況。"),
                                Challenge.Option(id: "D", text: "兩個指標合併成一個綜合分數", explanation: "合併成一個分數會失去可操作性。你需要知道是速度問題還是品質問題，才能改善。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "有沒有一種方式可以同時關注兩個指標，但有優先級？",
                            ],
                            explanation: "當兩個指標衝突時，正確的做法是區分哪個是 primary（可以優化的方向）、哪個是 guardrail（不能惡化的底線）。這是非常重要的面試概念。面試官會問你「如果這兩個指標衝突怎麼辦」，答案就是 guardrail 框架。",
                            frameworkTip: "指標衝突時：選一個做 primary（優化方向），另一個做 guardrail（底線不能破）"
                        ),
                    ]
                ),
                Quest(
                    id: "2-5",
                    name: "不同角色看不同指標",
                    description: "理解 PM、Engineering、Finance、Ops 各看重什麼 KPI。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Dashboard 該給誰看什麼",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Customer Success Manager 最需要看哪三個指標？",
                            scenario: 
                            Challenge.Scenario(
                                title: "設計不同角色的 Dashboard",
                                narrative: "你需要為一家 SaaS 公司設計三個 dashboard，分別給不同角色使用：\n\n• CEO / CFO（管營收和策略）\n• Product Manager（管產品和使用者）\n• Customer Success Manager（管客戶續約和滿意度）\n\n以下是所有可用的指標。",
                                data: [
                                    ["metric": "MRR / ARR", "category": "營收"],
                                    ["metric": "Feature Adoption Rate", "category": "產品"],
                                    ["metric": "NPS / CSAT", "category": "滿意度"],
                                    ["metric": "Customer Health Score", "category": "客戶"],
                                    ["metric": "DAU / WAU / MAU", "category": "活躍度"],
                                    ["metric": "Churn Rate", "category": "流失"],
                                    ["metric": "CAC / LTV", "category": "單位經濟"],
                                    ["metric": "Onboarding Completion Rate", "category": "啟用"],
                                ],
                                dataCaption: "可用指標清單"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "MRR、CAC、Churn Rate", explanation: "MRR 和 CAC 是 finance/exec 指標，CSM 不直接控制這些。CSM 需要的是能幫他判斷「哪個客戶可能要流失」的指標。"),
                                Challenge.Option(id: "B", text: "Customer Health Score、NPS/CSAT、Churn Rate", explanation: "正確！CSM 的工作是「確保客戶成功、續約」。Health Score 告訴他哪個客戶有風險、NPS 告訴他客戶感受、Churn Rate 告訴他整體趨勢。這三個指標直接對應他的 KPI。"),
                                Challenge.Option(id: "C", text: "DAU、Feature Adoption、Onboarding Completion", explanation: "這些更適合 PM。CSM 關心的不是「功能有沒有被用」，而是「客戶有沒有得到價值」。"),
                                Challenge.Option(id: "D", text: "NPS、MRR、Feature Adoption", explanation: "NPS 對，但 MRR 是 exec 指標，Feature Adoption 是 PM 指標。CSM 需要更 actionable 的客戶健康指標。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想 CSM 每天的工作是什麼？他做決策需要什麼資訊？",
                                "Dashboard 不是越多指標越好，而是要給對的人看對的指標。",
                            ],
                            explanation: "設計 dashboard 的核心原則：「這個人需要做什麼決策？他需要什麼資訊來做這個決策？」CEO 要看營收和單位經濟、PM 要看使用者行為和 feature adoption、CSM 要看客戶健康和滿意度。面試中如果被問到「你會設計什麼 dashboard」，先問「給誰看的」。",
                            frameworkTip: "Dashboard 設計：Audience（誰看）→ Decision（做什麼決策）→ Metrics（需要什麼數據）"
                        ),
                    ]
                ),
                Quest(
                    id: "2-6",
                    name: "Boss: 綜合指標分析",
                    description: "面對一個完整的商業情境，選對指標、做出判斷、提出建議。",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Case: Marketplace 健康度",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "CEO 的直覺是對的嗎？GMV 成長但平台「不健康」——數據中的什麼信號支持這個判斷？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketplace 平台健康度診斷",
                                narrative: "你是一家 B2B marketplace 平台的 Product Analyst。平台連接供應商和採購商。\n\nCEO 說：「我們的 GMV（Gross Merchandise Value）上季成長了 15%，但我感覺平台不太健康。幫我做一個完整的診斷。」\n\n你拉了以下數據：",
                                data: [
                                    ["metric": "GMV", "Q2": "$8.5M", "Q3": "$9.8M", "change": "+15%"],
                                    ["metric": "活躍供應商數", "Q2": "320", "Q3": "280", "change": "-12.5%"],
                                    ["metric": "活躍採購商數", "Q2": "1,200", "Q3": "1,350", "change": "+12.5%"],
                                    ["metric": "平均訂單金額", "Q2": "$2,800", "Q3": "$4,200", "change": "+50%"],
                                    ["metric": "新供應商加入數", "Q2": "45", "Q3": "18", "change": "-60%"],
                                    ["metric": "供應商 NPS", "Q2": "42", "Q3": "28", "change": "-14 pts"],
                                    ["metric": "訂單完成率", "Q2": "94%", "Q3": "88%", "change": "-6pp"],
                                    ["metric": "Take Rate", "Q2": "8%", "Q3": "12%", "change": "+4pp"],
                                ],
                                dataCaption: "Q2 vs Q3 核心指標"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "GMV 成長了 15%，平台很健康，CEO 多慮了", explanation: "GMV 是 lagging metric。深入看其他指標會發現問題。"),
                                Challenge.Option(id: "B", text: "供應商數量下降、NPS 暴跌、新供應商加入減少——supply side 在惡化", explanation: "正確！GMV 成長是因為 AOV 暴漲（集中在少數大單），但供應側在惡化：供應商流失（-12.5%）、NPS 暴跌（-14pts）、新供應商加入銳減（-60%）。Take rate 從 8% 漲到 12% 可能是供應商不滿的原因。這是典型的「短期營收好但長期不可持續」。"),
                                Challenge.Option(id: "C", text: "採購商數量在成長（+12.5%），代表需求端很健康", explanation: "需求端成長不代表平台健康。如果供應端持續流失，最終沒有供應商能服務這些採購商。Marketplace 兩邊都要健康。"),
                                Challenge.Option(id: "D", text: "訂單完成率下降是最大問題", explanation: "完成率下降確實是問題，但它是結果（可能因為供應商不夠導致無法履約），不是根因。根因在供應側的惡化。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Marketplace 的健康要看供需兩側。GMV 好不代表兩邊都好。",
                                "看看供應商相關的指標（數量、NPS、新加入），發現了什麼？",
                            ],
                            explanation: "Marketplace 分析要看兩側健康度。這裡 GMV 成長是「假象」——靠少數大單撐起來的成長不可持續。Supply side 的三個指標（數量 -12.5%、NPS -14pts、新加入 -60%）都在惡化，加上 take rate 暴漲，幾乎可以確定：平台對供應商收費太高 → 供應商不滿 → 流失 + 不推薦新供應商加入。",
                            frameworkTip: "Marketplace 健康度：Supply Side + Demand Side + 平台自身指標（take rate, 完成率）都要看"
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Case: 提出改善建議",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你會推薦哪個方案？",
                            scenario: 
                            Challenge.Scenario(
                                title: "怎麼讓 Marketplace 恢復健康",
                                narrative: "你確認了問題：take rate 從 8% 漲到 12%，導致供應商不滿和流失。\n\n但營收團隊的立場是：「提高 take rate 帶來了 $400K 的額外收入，我們不能輕易降回去。」\n\n你需要提出一個平衡營收和平台健康的建議。",
                                data: [
                                    ["option": "降回 8% take rate", "revenue_impact": "-$400K/Q", "supplier_impact": "供應商回流預估 +20%", "risk": "營收短期下降"],
                                    ["option": "維持 12%", "revenue_impact": "+$0", "supplier_impact": "繼續流失，預估再 -15%", "risk": "供應端崩潰"],
                                    ["option": "分層 take rate：小單 8%，大單 12%", "revenue_impact": "-$150K/Q", "supplier_impact": "穩住中小供應商", "risk": "大供應商可能不滿"],
                                ],
                                dataCaption: "三種方案比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "降回 8%：先保住供應商，營收之後再想辦法", explanation: "直接放棄 $400K 太激進。而且已經享受到的收入，管理層不容易接受全部放棄。"),
                                Challenge.Option(id: "B", text: "維持 12%：營收不能掉", explanation: "供應商繼續流失 -15% 會導致供應端崩潰，到時候 GMV 會大幅下降，損失遠超 $400K。"),
                                Challenge.Option(id: "C", text: "分層 take rate：平衡營收和供應商留存", explanation: "正確！分層定價是經典的 marketplace 策略：(1) 保護中小供應商（他們最敏感，用低 take rate 留住）(2) 大供應商的議價能力強但也更依賴平台，12% 可接受 (3) 營收只損失 $150K，遠好過供應端崩潰。這是一個「不完美但最務實」的方案。"),
                                Challenge.Option(id: "D", text: "先做 A/B test 再決定", explanation: "供應商在持續流失中，A/B test 需要時間。而且 take rate 改變會影響供應商信任，不適合做 A/B test。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "有沒有「兩個都要」的方案？不是非黑即白。",
                                "分層定價是 marketplace 的常見策略。",
                            ],
                            explanation: "好的建議不是非黑即白的選擇，而是找到平衡點。分層 take rate 兼顧了：(1) 營收（只損失 $150K vs $400K）(2) 供應商留存（保護最敏感的中小供應商）(3) 可驗證（可以觀察分層後的供應商行為）。面試中能提出這種「pragmatic compromise」的建議，比極端方案更受青睞。",
                            frameworkTip: "Recommendation: 不要非黑即白 → 找 pragmatic middle ground → 說明 trade-offs"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 3: 數據分析思維
        World(
            id: 3,
            name: "數據分析思維",
            emoji: "🔍",
            description: "Funnel、Segmentation、Cohort、Root Cause 分析",
            quests: [
                Quest(
                    id: "3-1",
                    name: "Trend Analysis",
                    description: "如何判斷一個趨勢是真的問題還是噪音",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "辨別真假趨勢",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據數據，VP 的擔憂是否合理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "串流平台的收視警報",
                                narrative: "你是一家串流平台的 Product Analyst。VP of Content 發了一封緊急 email：\n\n「我們的 daily watch time 連續下降三天了，從週三的 45 分鐘掉到週五的 38 分鐘！需要立刻調查！」\n\n你拉出了過去四週的 daily watch time 數據。",
                                data: [
                                    ["day": "週一", "week1": "36", "week2": "37", "week3": "38", "week4": "37"],
                                    ["day": "週二", "week1": "39", "week2": "40", "week3": "41", "week4": "40"],
                                    ["day": "週三", "week1": "44", "week2": "43", "week3": "45", "week4": "44"],
                                    ["day": "週四", "week1": "42", "week2": "41", "week3": "43", "week4": "41"],
                                    ["day": "週五", "week1": "37", "week2": "38", "week3": "38", "week4": "37"],
                                    ["day": "週六", "week1": "52", "week2": "53", "week3": "54", "week4": "53"],
                                    ["day": "週日", "week1": "55", "week2": "54", "week3": "56", "week4": "55"],
                                ],
                                dataCaption: "每日平均觀看時長（分鐘），過去四週"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "合理，連續三天下降是明確的警訊，需要立即調查", explanation: "三天的下降不一定是問題。你需要看更長期的 pattern 才能判斷。"),
                                Challenge.Option(id: "B", text: "不合理，這是正常的週間 seasonality pattern，週三到週五本來就會下降", explanation: "正確！從四週的數據可以看到，每一週都是週三最高、週五最低的 pattern。週末則會反彈到 52-56 分鐘。VP 看到的是正常的 weekly seasonality，不是真正的下降趨勢。"),
                                Challenge.Option(id: "C", text: "不確定，需要再觀察一個月才能判斷", explanation: "其實四週的數據已經足夠看出 weekly pattern。不需要再等一個月。"),
                                Challenge.Option(id: "D", text: "不合理，因為總體數字都在 35-55 之間，變動不大", explanation: "數字的絕對範圍不是重點。重點是這個變動是否是可預期的 seasonal pattern。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "比較每一週的同一天，看看有沒有固定的 pattern。",
                                "週三到週五的走勢在每一週是否一致？",
                            ],
                            explanation: "判斷趨勢的第一步是排除 seasonality（季節性/週期性）。很多指標有天然的週期波動：每週、每月、每季都有固定 pattern。看到短期下降時，先比對歷史同期，確認是正常波動還是真正的異常。",
                            frameworkTip: "趨勢判斷三步：(1) 是否有 seasonality？(2) 跟歷史同期比如何？(3) 排除週期後，趨勢方向是什麼？"
                        ),
                        Challenge(
                            id: 2,
                            name: "基準線與異常偵測",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據數據，「一鍵分帳」新功能是否帶來了顯著的交易量提升？",
                            scenario: 
                            Challenge.Scenario(
                                title: "FinTech 的交易量分析",
                                narrative: "你是一家 FinTech 公司的 Data Analyst。Product Manager 問你：\n\n「上週二的交易量突然比前一天多了 40%，是不是我們上線的新功能帶來的效果？」\n\n新功能是「一鍵分帳」，在上週一下午上線。你拉出了更完整的數據。",
                                data: [
                                    ["date": "3/3 (一)", "transactions": "12,400", "note": "新功能上線 (下午)"],
                                    ["date": "3/4 (二)", "transactions": "17,200", "note": "+39% vs 前日"],
                                    ["date": "3/5 (三)", "transactions": "16,800", "note": ""],
                                    ["date": "3/6 (四)", "transactions": "17,100", "note": ""],
                                    ["date": "3/7 (五)", "transactions": "18,500", "note": "發薪日"],
                                    ["date": "歷史週一平均", "transactions": "12,200", "note": ""],
                                    ["date": "歷史週二平均", "transactions": "16,900", "note": ""],
                                    ["date": "歷史週三平均", "transactions": "16,500", "note": ""],
                                    ["date": "歷史週四平均", "transactions": "16,800", "note": ""],
                                    ["date": "歷史週五平均", "transactions": "17,800", "note": ""],
                                ],
                                dataCaption: "每日交易筆數 vs 歷史平均"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "是的，週二比週一多了 40%，效果很明顯", explanation: "週二本來就比週一交易量高。你需要跟歷史同期比，不是跟前一天比。"),
                                Challenge.Option(id: "B", text: "可能有微小效果，但主要的增長來自正常的 weekday pattern", explanation: "正確！週二的 17,200 只比歷史週二平均 16,900 多了 1.8%，在正常波動範圍內。PM 看到的 +40% 其實是週一到週二的天然差異（週一本來就是最低的一天）。要判斷新功能效果，需要用更嚴謹的方法，例如比對歷史基準線。"),
                                Challenge.Option(id: "C", text: "無法判斷，因為沒有 A/B test 數據", explanation: "A/B test 確實是更好的方法，但從現有數據你已經可以初步判斷——跟歷史基準線比較即可得出結論。"),
                                Challenge.Option(id: "D", text: "週五交易量最高，所以應該等到週五再判斷", explanation: "週五交易量高是因為發薪日效應。判斷新功能效果的正確方法是跟同一天的歷史基準比，不是等到交易量最高的那天。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不要只看「跟前一天比」，要看「跟歷史同一天比」。",
                                "計算一下：上週二 vs 歷史週二平均，差多少百分比？",
                            ],
                            explanation: "分析趨勢時，選對 baseline（基準線）至關重要。跟前一天比和跟歷史同日比，結論可能完全不同。正確的做法：(1) 建立 baseline（歷史同期平均）、(2) 計算實際值 vs baseline 的差異、(3) 判斷差異是否顯著（超出正常波動範圍）。",
                            frameworkTip: "判斷效果的基準：(1) 歷史同期平均 (2) 正常波動範圍 (3) 排除混淆因子（如發薪日、假日）"
                        ),
                        Challenge(
                            id: 3,
                            name: "長期趨勢 vs 短期波動",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如果你是 BA，你會怎麼向 CEO 解釋這個情況？",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂閱制產品的成長焦慮",
                                narrative: "你在一家 B2B SaaS 公司擔任 Business Analyst。CEO 在 all-hands 說：\n\n「我們的 MRR（Monthly Recurring Revenue）這個月只成長了 2%，上個月是 5%，大上個月是 8%。成長在減速，我很擔心。」\n\n你查了更完整的數據。",
                                data: [
                                    ["month": "6月", "mrr": "$820K", "growth": "9%", "new_customers": "45", "churned": "8"],
                                    ["month": "7月", "mrr": "$885K", "growth": "8%", "new_customers": "48", "churned": "10"],
                                    ["month": "8月", "mrr": "$938K", "growth": "6%", "new_customers": "42", "churned": "12"],
                                    ["month": "9月", "mrr": "$985K", "growth": "5%", "new_customers": "40", "churned": "14"],
                                    ["month": "10月", "mrr": "$1.01M", "growth": "3%", "new_customers": "38", "churned": "16"],
                                    ["month": "11月", "mrr": "$1.03M", "growth": "2%", "new_customers": "36", "churned": "18"],
                                ],
                                dataCaption: "MRR 趨勢（過去 6 個月）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "成長率下降是正常的，因為基數變大了，不用擔心", explanation: "基數變大確實會讓成長率自然下降，但這不是唯一因素。你忽略了 churn 持續上升的問題。"),
                                Challenge.Option(id: "B", text: "問題不在 new customer acquisition，而在 churn rate 持續上升。需要同時看新增和流失", explanation: "正確！新客戶數從 45 降到 36（-20%），但 churn 從 8 升到 18（+125%）。成長率下降的主因是 churn 加速，而不只是基數效應。Net growth = new - churn，兩邊都在惡化但 churn 惡化更快。"),
                                Challenge.Option(id: "C", text: "MRR 還是在成長的（正數），所以沒有問題", explanation: "雖然 MRR 還在成長，但成長率如果繼續下降，很快就會變成負成長。更重要的是 churn 趨勢在惡化。"),
                                Challenge.Option(id: "D", text: "需要看競爭對手的數據才能判斷，可能是整個市場都在放緩", explanation: "市場因素當然要看，但從內部數據已經可以看到 churn 惡化的明確趨勢，這是你可以先行動的。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "除了看成長率，還要看成長的「組成」：新增了多少、流失了多少？",
                                "Net growth = New - Churn。兩邊的趨勢分別是什麼？",
                            ],
                            explanation: "看成長指標時，永遠要拆解成「新增」和「流失」兩個方向。Overall growth rate 是個 lagging indicator，它掩蓋了底層的問題。這個 case 中，churn 從 8 升到 18 是最大的警訊——代表產品可能有 retention 問題，需要立即調查。",
                            frameworkTip: "成長拆解：Growth = New + Expansion - Contraction - Churn。看整體之前先拆成組成部分。"
                        ),
                    ]
                ),
                Quest(
                    id: "3-2",
                    name: "Funnel Analysis",
                    description: "把使用者旅程拆成 funnel，找到最大 drop-off",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "找到最大 Drop-off",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "如果你只能改善一個步驟來提升整體轉換率，應該優先改善哪個步驟？",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商結帳流程優化",
                                narrative: "你是一家電商平台的 Product Analyst。PM 想要提升結帳轉換率，請你分析結帳 funnel。\n\n她給了你上個月的數據。",
                                data: [
                                    ["step": "1. 加入購物車", "users": "285,000", "rate": "100%", "step_conversion": "—"],
                                    ["step": "2. 查看購物車", "users": "198,000", "rate": "69.5%", "step_conversion": "69.5%"],
                                    ["step": "3. 點擊結帳", "users": "142,000", "rate": "49.8%", "step_conversion": "71.7%"],
                                    ["step": "4. 填寫地址", "users": "128,000", "rate": "44.9%", "step_conversion": "90.1%"],
                                    ["step": "5. 選擇付款方式", "users": "118,000", "rate": "41.4%", "step_conversion": "92.2%"],
                                    ["step": "6. 確認訂單", "users": "72,000", "rate": "25.3%", "step_conversion": "61.0%"],
                                    ["step": "7. 付款成功", "users": "68,000", "rate": "23.9%", "step_conversion": "94.4%"],
                                ],
                                dataCaption: "結帳 Funnel（上月）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "步驟 1→2：加入購物車到查看購物車（69.5%）", explanation: "雖然絕對 drop-off 人數多，但這一步的轉換率不是最低的。而且「加了購物車但沒看」可能是正常的瀏覽行為。"),
                                Challenge.Option(id: "B", text: "步驟 5→6：選擇付款方式到確認訂單（61.0%）", explanation: "正確！這一步的 step conversion 只有 61%，是 funnel 後段最大的 drop-off。到了選付款方式的用戶已經有很強的購買意圖，卻在最後一步流失了 39%，投報率最高。可能原因：意外的運費、稅金，或結帳頁資訊太複雜。"),
                                Challenge.Option(id: "C", text: "步驟 2→3：查看購物車到點擊結帳（71.7%）", explanation: "這步有不少 drop-off，但很多人「查看購物車」只是在比價或收藏，不一定代表要買。相比之下，已經到付款階段的用戶才是高意圖用戶。"),
                                Challenge.Option(id: "D", text: "步驟 6→7：確認訂單到付款成功（94.4%）", explanation: "這一步轉換率已經很高（94.4%），改善空間有限。那 5.6% 失敗的可能是付款失敗等技術問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看每一步的 step conversion rate，哪一步最低？",
                                "考慮 funnel 位置：越後面的步驟，用戶意圖越強，改善的投報率越高。",
                            ],
                            explanation: "Funnel 分析的 prioritization 要同時考慮：(1) 哪步 drop-off 最大、(2) 用戶意圖強度（越後面越強）、(3) 改善的可行性。步驟 5→6 的 61% conversion 是最明顯的 bottleneck，而且這些用戶已經填了地址、選了付款方式，流失的成本最高。",
                            frameworkTip: "Funnel 優先級：找最大 drop-off → 考慮用戶意圖 → 估算改善空間 → 先改 ROI 最高的"
                        ),
                        Challenge(
                            id: 2,
                            name: "Funnel 拆解與比較",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "從數據中你能得出什麼最重要的 insight？",
                            scenario: 
                            Challenge.Scenario(
                                title: "App vs Web 的結帳差異",
                                narrative: "你進一步分析後，把結帳 funnel 按平台拆開比較。",
                                data: [
                                    ["step": "加入購物車→查看", "app": "75.2%", "web": "62.1%"],
                                    ["step": "查看→點擊結帳", "app": "74.8%", "web": "67.3%"],
                                    ["step": "點擊結帳→填地址", "app": "92.5%", "web": "86.3%"],
                                    ["step": "填地址→選付款", "app": "94.1%", "web": "89.7%"],
                                    ["step": "選付款→確認訂單", "app": "78.3%", "web": "45.2%"],
                                    ["step": "確認→付款成功", "app": "96.1%", "web": "92.0%"],
                                ],
                                dataCaption: "Step Conversion Rate by Platform"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "App 每一步都比 Web 好，所以應該把資源全部投在 App", explanation: "雖然 App 確實每步都較高，但「全部投 App」太極端了。Web 用戶可能是不同的 segment（例如企業採購），不能放棄。"),
                                Challenge.Option(id: "B", text: "Web 的「選付款→確認訂單」只有 45.2%，是最大的問題點。需要深入了解 Web 確認頁有什麼問題", explanation: "正確！Web 的這一步只有 45.2%，比 App 的 78.3% 低了 33 個百分點。這個巨大差距代表 Web 的確認訂單頁面有嚴重問題（可能是版面設計、額外費用顯示方式、或載入速度）。這是改善空間最大的一步。"),
                                Challenge.Option(id: "C", text: "兩個平台的差異在正常範圍內，不需要特別處理", explanation: "45.2% vs 78.3% 相差 33 個百分點，這不是正常範圍。"),
                                Challenge.Option(id: "D", text: "應該在 Web 版加入 App 下載的彈窗，把用戶導去 App 購買", explanation: "用彈窗打斷結帳流程只會讓 conversion 更差。應該先修好 Web 本身的問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "比較 App 和 Web 在同一步的差距，哪一步差距最大？",
                                "差距大的步驟代表有平台特定的問題可以修。",
                            ],
                            explanation: "把 funnel 按維度（平台、地區、用戶類型）拆解比較，能讓你找到平台特定的問題。這裡 Web 的確認訂單步驟只有 45.2%，比 App 低了 33pp，代表 Web 的確認頁面有結構性問題。下一步應該去看 Web 確認頁的 UX、載入時間、和費用呈現方式。",
                            frameworkTip: "拆解 Funnel：整體 → 按維度切分（平台/地區/用戶類型）→ 找差距最大的地方 → 深入調查"
                        ),
                    ]
                ),
                Quest(
                    id: "3-3",
                    name: "Segmentation",
                    description: "切 user segment 找到問題的真正來源",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "找出問題 Segment",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據數據，你會給 Customer Success 主管什麼建議？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 產品的 NPS 下降",
                                narrative: "你是一家 B2B SaaS 公司的 Analyst。Customer Success 主管說：\n\n「我們的整體 NPS 從上季的 42 掉到這季的 35，老闆很不開心。」\n\n你把 NPS 按用戶 segment 拆開來看。",
                                data: [
                                    ["segment": "Enterprise（>500人）", "last_q": "52", "this_q": "50", "change": "-2", "pct_users": "15%"],
                                    ["segment": "Mid-Market（50-500人）", "last_q": "45", "this_q": "44", "change": "-1", "pct_users": "25%"],
                                    ["segment": "SMB（<50人）", "last_q": "38", "this_q": "22", "change": "-16", "pct_users": "40%"],
                                    ["segment": "Free Tier", "last_q": "35", "this_q": "33", "change": "-2", "pct_users": "20%"],
                                ],
                                dataCaption: "NPS by Customer Segment"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有 segment 的 NPS 都在下降，需要全面改善", explanation: "雖然每個 segment 都有下降，但下降幅度差異巨大。SMB 下降了 16 分，其他都只掉 1-2 分。資源應該集中在 SMB。"),
                                Challenge.Option(id: "B", text: "整體 NPS 下降主要是被 SMB segment 拉下來的（-16 分），而且 SMB 佔 40% 用戶。應該優先調查 SMB 用戶最近遇到了什麼問題", explanation: "正確！SMB 的 NPS 從 38 暴跌到 22（-16），而且佔了最大的用戶比例 (40%)。其他 segment 變化很小。所以整體 NPS 下降幾乎完全是 SMB 造成的。需要深入了解 SMB 用戶最近的體驗變化。"),
                                Challenge.Option(id: "C", text: "Enterprise NPS 最高，應該把重心放在 Enterprise 客戶", explanation: "Enterprise NPS 穩定在 50-52，不需要緊急處理。目前最緊急的是 SMB 的大幅下降。"),
                                Challenge.Option(id: "D", text: "Free Tier 的 NPS 最低，應該改善免費用戶體驗", explanation: "Free Tier 的 NPS 下降幅度很小（-2），而且這些用戶不付費。SMB 是付費用戶且下降幅度大得多。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看每個 segment 的 NPS 變化幅度，哪個差異最大？",
                                "同時考慮 segment 的用戶佔比——佔比大的 segment 對整體影響更大。",
                            ],
                            explanation: "Segmentation 的價值在於揭露被整體平均數掩蓋的問題。整體 NPS -7 看起來像是普遍的問題，但拆解後發現 90% 的下降都來自 SMB。這就是 Simpson's Paradox 的概念——整體趨勢可能跟 segment 趨勢相反。永遠要切 segment 看。",
                            frameworkTip: "看到整體指標變化時，永遠先切 segment：用戶類型 / 方案 / 地區 / 平台 / 新舊用戶"
                        ),
                        Challenge(
                            id: 2,
                            name: "多維度切分",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "問題最可能出在哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "繼續分析 SMB 的 NPS 下降",
                                narrative: "你確認問題出在 SMB segment 後，繼續往下切。你把 SMB 用戶按加入時間和使用的方案拆開來看。",
                                data: [
                                    ["segment": "SMB - Basic Plan - 舊用戶（>6個月）", "last_q": "40", "this_q": "38", "change": "-2"],
                                    ["segment": "SMB - Basic Plan - 新用戶（<6個月）", "last_q": "36", "this_q": "34", "change": "-2"],
                                    ["segment": "SMB - Pro Plan - 舊用戶（>6個月）", "last_q": "42", "this_q": "18", "change": "-24"],
                                    ["segment": "SMB - Pro Plan - 新用戶（<6個月）", "last_q": "35", "this_q": "14", "change": "-21"],
                                ],
                                dataCaption: "SMB NPS by Plan & Tenure"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "SMB 新用戶的 onboarding 體驗不好", explanation: "新用戶和舊用戶在 Pro Plan 上都大幅下降，所以不是新用戶特有的問題。"),
                                Challenge.Option(id: "B", text: "SMB Pro Plan 用戶體驗嚴重惡化，不論新舊用戶都受影響。最可能是 Pro Plan 最近有改版或漲價", explanation: "正確！Pro Plan 的新舊用戶 NPS 都暴跌（-24 和 -21），而 Basic Plan 幾乎沒變。這代表問題出在 Pro Plan 本身，而不是用戶的新舊。常見原因：方案功能調整、漲價、或新功能有 bug。"),
                                Challenge.Option(id: "C", text: "所有 SMB 用戶都不滿意，是公司品牌形象的問題", explanation: "Basic Plan 的 NPS 幾乎沒變（-2），所以不是全面性的品牌問題。"),
                                Challenge.Option(id: "D", text: "舊用戶下降更多（-24 vs -21），是忠誠度的問題", explanation: "-24 和 -21 的差異很小，不足以做出這樣的結論。兩者都大幅下降才是重點。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "比較 Basic Plan 和 Pro Plan 的變化，差異在哪？",
                                "如果新舊用戶都受影響，問題最可能出在什麼地方？",
                            ],
                            explanation: "多維度切分讓你能持續 drill down 找到問題根源。從整體 → SMB → Pro Plan，每一層切分都在縮小範圍。最終定位到「SMB Pro Plan」這個特定 segment，下一步就是去查 Pro Plan 最近有什麼變更。",
                            frameworkTip: "多維度切分：一次切一個維度 → 找到差異最大的 → 再切第二個維度 → 直到找到根因"
                        ),
                        Challenge(
                            id: 3,
                            name: "避免 Segmentation 陷阱",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "行銷主管的結論有什麼問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "行銷活動的成效分析",
                                narrative: "你在一家電商公司做 Marketing Analytics。行銷主管很得意地跟你說：\n\n「我們上週的 email campaign 太成功了！收到 email 的用戶平均消費 $85，沒收到的只有 $52。」\n\n你看了一下 campaign 的發送邏輯，發現 email 是發給「過去 30 天有消費記錄」的用戶。",
                                data: [
                                    ["group": "收到 Email", "avg_spend": "$85", "pct_repeat_buyers": "78%", "avg_order_count": "3.2"],
                                    ["group": "沒收到 Email", "avg_spend": "$52", "pct_repeat_buyers": "23%", "avg_order_count": "1.1"],
                                ],
                                dataCaption: "上週消費數據"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "沒有問題，數據清楚顯示 email campaign 有效", explanation: "email 是發給已經活躍的用戶！這些人本來就會消費更多。"),
                                Challenge.Option(id: "B", text: "樣本量可能不夠大", explanation: "這不是樣本量的問題，而是更根本的邏輯問題。"),
                                Challenge.Option(id: "C", text: "Selection bias：email 只發給活躍用戶，這些人本來就消費更多，不能把差異歸因於 email campaign", explanation: "正確！email 只發給「過去 30 天有消費記錄」的用戶，這群人本來就是活躍買家（repeat buyer 比例 78% vs 23%）。即使不發 email，他們的消費也會比較高。這是典型的 selection bias——你的「實驗組」和「對照組」在接受處理之前就已經不一樣了。"),
                                Challenge.Option(id: "D", text: "應該看 conversion rate 而不是平均消費金額", explanation: "不管看什麼指標，只要兩組人本質不同，比較就不公平。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "想想看：email 發給誰？這些人在收到 email 之前就跟其他人不同嗎？",
                                "如果不發 email，這兩組人的消費會一樣嗎？",
                            ],
                            explanation: "Selection bias 是分析中最常見的陷阱之一。當你的「分群條件」本身就跟「你想量的結果」相關時，任何比較都不公平。正確做法：(1) 隨機分組（A/B test），或 (2) 用 matched cohort 控制變因，或 (3) 比較 campaign 前後同一群人的行為變化。",
                            frameworkTip: "分群分析檢查表：(1) 兩組人在分組前是否已有差異？(2) 分群條件本身是否跟結果相關？(3) 能否用隨機分組？"
                        ),
                    ]
                ),
                Quest(
                    id: "3-4",
                    name: "Cohort Analysis",
                    description: "用 cohort 追蹤不同時期用戶的行為差異",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "讀懂 Retention Curve",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "從 cohort 數據中，你能得出什麼結論？",
                            scenario: 
                            Challenge.Scenario(
                                title: "手遊的留存率分析",
                                narrative: "你是一家手遊公司的 Product Analyst。Growth PM 問你：\n\n「我們最近幾個月的新用戶品質怎麼樣？留存率有變好還是變差？」\n\n你拉出了三個月份的 cohort retention 數據。",
                                data: [
                                    ["cohort": "1月 cohort", "d1": "45%", "d7": "22%", "d14": "15%", "d30": "10%"],
                                    ["cohort": "2月 cohort", "d1": "42%", "d7": "18%", "d14": "10%", "d30": "6%"],
                                    ["cohort": "3月 cohort", "d1": "38%", "d7": "14%", "d14": "7%", "d30": "—"],
                                ],
                                dataCaption: "Retention Rate by Cohort"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有 cohort 的留存率都差不多，屬於正常衰減", explanation: "仔細看：D7 從 22% → 18% → 14%，D14 從 15% → 10% → 7%。每個月都在惡化，這不是「差不多」。"),
                                Challenge.Option(id: "B", text: "每個後續 cohort 的留存率都在惡化——越晚加入的用戶留存越差。可能是用戶品質下降或產品體驗有退步", explanation: "正確！每個指標在三個 cohort 中都呈現下降趨勢。D1: 45→42→38，D7: 22→18→14，D14: 15→10→7。這代表新用戶的品質在惡化，或是產品對新用戶的價值在降低。需要調查：是獲客管道變了？還是產品有什麼改變？"),
                                Challenge.Option(id: "C", text: "3月 cohort 的 D30 還沒到，所以無法比較", explanation: "D30 確實還沒到，但 D1、D7、D14 已經可以明確看出趨勢了。不需要等到所有數據都出來才能下結論。"),
                                Challenge.Option(id: "D", text: "1月 cohort 的 D30 只有 10%，留存率太低了，產品有根本問題", explanation: "手遊的 D30 10% 其實不算差。而且這題的重點是 cohort 間的比較，不是絕對數值。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "在同一個時間點（例如 D7），比較不同 cohort 的表現。",
                                "趨勢是往上還是往下？",
                            ],
                            explanation: "Cohort analysis 的核心價值是讓你比較不同時期用戶的行為。看整體 retention 可能被混合效果掩蓋（mixing effect），但 cohort 讓你看到每一批新用戶的真實表現。當 retention curve 逐月惡化時，通常意味著用戶品質下降（獲客管道變了）或產品首次體驗變差了。",
                            frameworkTip: "Cohort 分析三步：(1) 同一指標跨 cohort 比較 (2) 看趨勢方向 (3) 找到惡化的起點"
                        ),
                        Challenge(
                            id: 2,
                            name: "Cohort 比較與假設",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "數據告訴你什麼故事？",
                            scenario: 
                            Challenge.Scenario(
                                title: "找出留存惡化的原因",
                                narrative: "你進一步分析，把 cohort 按獲客管道拆開。",
                                data: [
                                    ["cohort": "1月 - Organic", "d1": "48%", "d7": "25%", "d14": "18%", "users": "30K"],
                                    ["cohort": "1月 - Paid Ads", "d1": "40%", "d7": "17%", "d14": "10%", "users": "20K"],
                                    ["cohort": "2月 - Organic", "d1": "47%", "d7": "24%", "d14": "17%", "users": "25K"],
                                    ["cohort": "2月 - Paid Ads", "d1": "35%", "d7": "11%", "d14": "5%", "users": "35K"],
                                    ["cohort": "3月 - Organic", "d1": "46%", "d7": "23%", "d14": "16%", "users": "22K"],
                                    ["cohort": "3月 - Paid Ads", "d1": "30%", "d7": "8%", "d14": "3%", "users": "40K"],
                                ],
                                dataCaption: "Retention by Cohort & Channel"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Organic 和 Paid 都在惡化，問題出在產品本身", explanation: "Organic 用戶的留存其實非常穩定（D7: 25→24→23）。惡化主要在 Paid Ads。"),
                                Challenge.Option(id: "B", text: "Organic 用戶留存穩定，但 Paid Ads 用戶留存大幅惡化。同時 Paid Ads 的用戶量在增加（20K→35K→40K），稀釋了整體留存率", explanation: "正確！Organic 留存幾乎不變，但 Paid Ads 的 D7 從 17% 跌到 8%，D14 從 10% 跌到 3%。而且 Paid Ads 的用戶比例從 40% 增加到 65%。這代表行銷團隊可能為了衝量而放寬了廣告受眾定位，帶來了更多低品質用戶。"),
                                Challenge.Option(id: "C", text: "Paid Ads 用戶本來就比較差，這是正常的", explanation: "Paid 比 Organic 差是正常的，但 Paid Ads 的留存在三個月內急速惡化（D14: 10%→5%→3%），這不正常。"),
                                Challenge.Option(id: "D", text: "應該完全停止 Paid Ads，只做 Organic", explanation: "不需要完全停止。正確的做法是優化 Paid Ads 的定位和素材，提升用戶品質。完全停止會損失成長。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "分開看 Organic 和 Paid 的留存趨勢。是兩個都在惡化，還是只有一個？",
                                "注意 users 欄位——Paid Ads 的用戶量在增加。這跟整體留存的關係是什麼？",
                            ],
                            explanation: "這是 Simpson's Paradox 的經典案例。整體留存在下降，但不是因為產品變差，而是用戶組成改變了——低留存的 Paid 用戶比例增加，拉低了整體平均值。解決方案不是停止投廣告，而是改善廣告受眾定位（targeting），或加強 Paid 用戶的 onboarding。",
                            frameworkTip: "Cohort + Segmentation：整體惡化時，先按管道/segment 拆 → 找到是「每個 segment 都在惡化」還是「組成比例改變了」"
                        ),
                    ]
                ),
                Quest(
                    id: "3-5",
                    name: "Root Cause Thinking",
                    description: "從表象挖到根因的結構化方法",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "結構化根因分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個分析架構最適合用來拆解 GMV 下降的根因？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Marketplace 的 GMV 下降",
                                narrative: "你是一家雙邊 marketplace 的 Business Analyst。CFO 在季度會議上指出：\n\n「我們的 GMV（Gross Merchandise Value）這個月掉了 15%，怎麼回事？」\n\n你需要建立一個結構化的分析框架來調查根因。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接看 top 10 賣家的銷售額有沒有變化", explanation: "這可能會找到部分答案，但不夠結構化。你可能會 miss 很多其他原因。"),
                                Challenge.Option(id: "B", text: "用公式拆解：GMV = Buyers × Orders per Buyer × AOV，看哪個因子下降最多", explanation: "正確！把一個指標拆解成乘法公式，可以幫你快速定位問題出在哪個因子。如果 Buyers 沒變但 AOV 下降，方向完全不同。找到主要因子後，可以繼續對那個因子做 5 Whys 分析。"),
                                Challenge.Option(id: "C", text: "做一份用戶調查，問用戶為什麼買得少了", explanation: "用戶調查需要時間，而且用戶自己說的原因不一定是真正的原因。你應該先用數據縮小範圍。"),
                                Challenge.Option(id: "D", text: "看競爭對手最近有沒有促銷活動", explanation: "外部因素當然要看，但這不是「分析框架」，只是一個假設。先用結構化方法確認問題在哪，再去驗證假設。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "把一個指標拆成它的「公式」，每個因子就是一個可以調查的方向。",
                                "GMV = ？ × ？ × ？",
                            ],
                            explanation: "結構化根因分析的第一步是「公式拆解」。任何 business metric 都可以拆成乘法或加法公式。GMV = Buyers × Orders/Buyer × AOV。接著看哪個因子變化最大，再對那個因子繼續往下拆，直到找到根因。",
                            frameworkTip: "根因分析第一步：指標公式拆解。Revenue = Users × Conversion × ARPU。找到主要因子後再做 5 Whys。"
                        ),
                        Challenge(
                            id: 2,
                            name: "5 Whys 實戰",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據你目前掌握的資訊，Why 3 最可能的答案是什麼？你會優先調查哪個方向？",
                            scenario: 
                            Challenge.Scenario(
                                title: "繼續追 GMV 下降",
                                narrative: "你用公式拆解後發現：\n\n• Buyers 數量沒太大變化（-2%）\n• Orders per Buyer 也差不多（-1%）\n• AOV（平均訂單金額）從 $78 掉到 $65（-17%）\n\n所以 GMV 下降主要是 AOV 造成的。你繼續用 5 Whys 追下去。\n\nWhy 1: 為什麼 AOV 下降？\n→ 因為高價商品（$100+）的銷售佔比從 35% 降到 20%。\n\nWhy 2: 為什麼高價商品銷售佔比下降？\n→ 因為高價商品的曝光量下降了 40%。\n\nWhy 3: 為什麼高價商品曝光量下降？",
                                data: [
                                    ["category": "高價商品（$100+）", "before": "35% GMV佔比", "after": "20% GMV佔比", "exposure_change": "-40%"],
                                    ["category": "中價商品（$30-99）", "before": "45% GMV佔比", "after": "50% GMV佔比", "exposure_change": "+10%"],
                                    ["category": "低價商品（<$30）", "before": "20% GMV佔比", "after": "30% GMV佔比", "exposure_change": "+25%"],
                                ],
                                dataCaption: "商品價格帶分析"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "消費者口味改變了，偏好便宜的東西", explanation: "這個假設太模糊，而且「消費者口味改變」很難直接驗證。你應該先看可控的內部因素。"),
                                Challenge.Option(id: "B", text: "高價商品的賣家可能流失了，導致供給減少", explanation: "這是一個合理假設，但曝光量下降不一定代表供給減少。商品數量沒變，但曝光下降，更可能是推薦系統或排序的問題。"),
                                Challenge.Option(id: "C", text: "推薦演算法或搜尋排序最近有調整，降低了高價商品的權重", explanation: "正確！曝光量下降 40% 但商品本身沒有減少，最可能的原因是平台的推薦/排序演算法改變了。這是一個可以立即驗證的假設：去問 Search/Recommendation 團隊最近有沒有調整演算法。如果有，這就可能是根因。"),
                                Challenge.Option(id: "D", text: "季節性因素，某些季節本來就賣比較便宜的東西", explanation: "可能性存在，但你應該先排除內部可控因素（如演算法調整），再去看外部因素。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "「曝光量」是平台控制的——什麼因素會影響一個商品被展示的次數？",
                                "如果商品數量沒減少，但曝光量減少了，問題出在「展示機制」而非「供給」。",
                            ],
                            explanation: "5 Whys 的精髓是：每一層的「Why」都要基於數據和邏輯，而不是直覺猜測。這裡的線索是「曝光量下降」——曝光是平台控制的，最可能的原因是推薦/排序機制的改變。Root cause 分析要優先看可控的內部因素，再看外部因素。",
                            frameworkTip: "5 Whys 實戰技巧：(1) 每個 Why 都要有數據支撐 (2) 優先看內部可控因素 (3) 追到可以行動的層級為止"
                        ),
                        Challenge(
                            id: 3,
                            name: "假設樹練習",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你會用什麼方式來快速驗證或排除最多假設？",
                            scenario: 
                            Challenge.Scenario(
                                title: "外送平台的客訴暴增",
                                narrative: "你在一家食物外送平台工作。客服主管告訴你：\n\n「本週的客訴量比上週多了 60%。」\n\n你需要建立一棵假設樹（hypothesis tree）來結構化地調查原因。以下是你初步整理的假設樹：\n\n客訴增加 60%\n├── 供給端（餐廳/外送員）\n│   ├── 餐廳出餐變慢\n│   ├── 外送員不足，配送延遲\n│   └── 餐點品質問題增加\n├── 需求端（訂單/用戶）\n│   ├── 訂單量暴增，超過產能\n│   ├── 新用戶比例增加（不熟悉平台）\n│   └── 促銷活動引來價格敏感客群\n└── 平台端（系統/流程）\n    ├── App 有 bug（訂單錯誤、支付問題）\n    ├── 配送路線演算法異常\n    └── 客服分類方式改變（把以前不算客訴的也算了）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "一個一個假設去驗證，從上到下", explanation: "這太慢了。好的分析師會找到能同時排除多個假設的數據。"),
                                Challenge.Option(id: "B", text: "先看客訴的類別分佈（配送延遲 / 餐點問題 / 系統錯誤等），快速判斷問題集中在哪個大類", explanation: "正確！客訴類別分佈是最高效的第一步。如果 80% 新增客訴都是「配送延遲」，你可以立刻排除餐點品質和系統問題，聚焦在供給端和配送效率。一個數據就能大幅縮小調查範圍。"),
                                Challenge.Option(id: "C", text: "先確認客訴量的增加是不是因為定義改變（最後一個假設）", explanation: "定義改變確實要排除，但不應該是第一步。你應該先看客訴類別分佈，這能同時給你更多資訊。"),
                                Challenge.Option(id: "D", text: "先看訂單量有沒有增加，因為訂單多客訴自然就多", explanation: "這是一個合理的方向，但只能驗證一個假設。看客訴類別分佈能同時告訴你更多東西。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想：什麼數據能一次告訴你最多資訊？",
                                "如果你知道新增客訴都是什麼類型的，你能排除多少假設？",
                            ],
                            explanation: "高效的根因分析要用「最少的步驟排除最多的假設」。客訴類別分佈就像一個 filter——它一次就能告訴你問題出在供給端、需求端還是平台端。這叫做 issue tree prioritization：先做能 narrow down 最多方向的分析。",
                            frameworkTip: "假設樹使用法：(1) 列出所有可能原因 (2) 找能排除最多分支的數據 (3) 逐步收斂到根因"
                        ),
                    ]
                ),
                Quest(
                    id: "3-6",
                    name: "Boss: 完整數據調查",
                    description: "端到端的數據分析 case study",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss Challenge: 指標下降調查（上）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "從這些數據中，你的第一個發現是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "音樂串流平台：MAU 下降之謎",
                                narrative: "你是一家音樂串流平台的 Senior Analyst。CEO 在月會上宣佈：\n\n「我們的 MAU（Monthly Active Users）從上個月的 8.5M 降到 7.8M（-8.2%）。這是我們上市以來第一次 MAU 下降。我需要知道發生了什麼事。」\n\n你拉出了以下數據來開始調查。",
                                data: [
                                    ["metric": "MAU", "last_month": "8.5M", "this_month": "7.8M", "change": "-8.2%"],
                                    ["metric": "DAU", "last_month": "3.2M", "this_month": "3.0M", "change": "-6.3%"],
                                    ["metric": "New Signups", "last_month": "620K", "this_month": "580K", "change": "-6.5%"],
                                    ["metric": "Reactivated Users", "last_month": "180K", "this_month": "170K", "change": "-5.6%"],
                                    ["metric": "Churned Users", "last_month": "350K", "this_month": "890K", "change": "+154%"],
                                    ["metric": "Avg Sessions/User", "last_month": "12.5", "this_month": "12.8", "change": "+2.4%"],
                                    ["metric": "Avg Listen Time/Session", "last_month": "28min", "this_month": "29min", "change": "+3.6%"],
                                ],
                                dataCaption: "核心指標月度比較"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有指標都在下降，是全面性的問題", explanation: "Sessions/User 和 Listen Time 都在上升，所以不是全面性的問題。仔細區分哪些上升哪些下降。"),
                                Challenge.Option(id: "B", text: "MAU 下降主要是 churn 暴增（+154%）造成的，而不是獲取面的問題。留下來的用戶反而更活躍了（sessions 和 listen time 都上升）", explanation: "正確！New signups 和 reactivation 只輕微下降（-5~7%），但 churn 暴增了 154%（350K→890K）。同時活躍用戶的使用指標還在上升。這代表問題不在產品體驗或獲客，而是有一批特定的用戶在集中流失。"),
                                Challenge.Option(id: "C", text: "New Signups 下降 6.5% 是關鍵問題，需要加大行銷投入", explanation: "-6.5% 的下降在正常波動範圍內。Churn +154% 才是真正的異常。"),
                                Challenge.Option(id: "D", text: "使用時間增加代表演算法推薦做得好，MAU 下降不是大問題", explanation: "MAU 下降 8.2% 是很嚴重的問題，不能因為使用時間增加就忽略。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "MAU 的變化 = New + Reactivated - Churned。哪個因子的變化最劇烈？",
                                "活躍用戶的行為指標（sessions, listen time）是上升還是下降？這告訴你什麼？",
                            ],
                            explanation: "分析指標下降時，先拆解公式：MAU = 上月 MAU + New + Reactivated - Churned。New 和 Reactivated 的變化很小，但 Churn 從 350K 暴增到 890K。同時，留下來的用戶使用指標反而變好，代表產品核心體驗沒有惡化。下一步應該深入調查：是什麼用戶在 churn？為什麼？",
                            frameworkTip: "MAU 拆解：MAU = Previous MAU + New + Reactivated - Churned。先找最大的 delta。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Boss Challenge: 指標下降調查（中）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "根據 segment 拆解，你會怎麼繼續調查？",
                            scenario: 
                            Challenge.Scenario(
                                title: "繼續追查：誰在流失？",
                                narrative: "你確認問題出在 churn 暴增後，把 churned users 按 segment 拆開來看。",
                                data: [
                                    ["segment": "Premium（付費）", "last_churn": "45K", "this_churn": "52K", "change": "+16%", "pct_of_total": "5.8%"],
                                    ["segment": "Free - Active >6個月", "last_churn": "85K", "this_churn": "95K", "change": "+12%", "pct_of_total": "10.7%"],
                                    ["segment": "Free - Active 1-6個月", "last_churn": "120K", "this_churn": "143K", "change": "+19%", "pct_of_total": "16.1%"],
                                    ["segment": "Free - Active <1個月", "last_churn": "100K", "this_churn": "600K", "change": "+500%", "pct_of_total": "67.4%"],
                                ],
                                dataCaption: "Churned Users by Segment"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有 segment 的 churn 都增加了，需要全面檢討產品體驗", explanation: "雖然都有增加，但幅度差異巨大。Free <1個月的用戶 churn 暴增 500%，佔了新增 churn 的絕大多數。"),
                                Challenge.Option(id: "B", text: "Premium 用戶的 churn 增加最少（+16%），代表付費用戶是安全的，不用擔心", explanation: "Premium churn +16% 也不少，但確實不是最緊急的問題。重點在 Free <1個月。"),
                                Challenge.Option(id: "C", text: "Churn 暴增集中在「Free - Active <1個月」（+500%，佔 67%）。需要調查這群新用戶是從哪來的，以及他們為什麼這麼快就離開", explanation: "正確！這批新加入不到一個月就流失的用戶佔了 churn 總量的 67%，而且暴增了 500%。這是非常異常的 pattern。最可能的原因：(1) 某個獲客管道帶來了大量低品質用戶 (2) 有 bot/fake signups (3) 某個 referral program 被濫用。下一步：查這些用戶的 acquisition source。"),
                                Challenge.Option(id: "D", text: "應該把重心放在 Free Active 1-6個月的用戶，因為他們是最有可能轉付費的群體", explanation: "這個 segment 的 churn 增加只有 19%，不是目前最緊急的問題。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "哪個 segment 的 churn 增加最劇烈？佔總 churn 的比例是多少？",
                                "新加入不到一個月就離開的用戶大量增加，可能代表什麼？",
                            ],
                            explanation: "這是 drill-down 分析的典型流程：整體 churn ↑ → 按 segment 拆 → 發現問題集中在「Free <1個月」→ 下一步按 acquisition source 拆。每一層都在縮小範圍。這種 pattern（大量新用戶快速流失）通常指向獲客管道品質問題或 fraud。",
                            frameworkTip: "Drill-down 流程：整體異常 → 按維度拆解 → 找到異常 segment → 對該 segment 再拆一層 → 直到可行動"
                        ),
                        Challenge(
                            id: 3,
                            name: "Boss Challenge: 指標下降調查（下）",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪個報告最完整且最有行動力？",
                            scenario: 
                            Challenge.Scenario(
                                title: "真相大白",
                                narrative: "你繼續追查「Free - Active <1個月」的流失用戶，發現了以下線索：\n\n1. 這 60 萬流失用戶中，有 45 萬來自同一個 referral campaign（「邀請好友送 3 個月免費 Premium」）\n2. 這個 campaign 在上個月推出，referral 用戶的平均使用時間只有 2 分鐘\n3. 有些推薦人帳號邀請了 200+ 個好友\n4. 這些被推薦的帳號有很多使用相同 IP 或設備\n\n你需要跟 CEO 報告你的完整調查結論。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "MAU 下降是因為 referral campaign 帶來了太多用戶，建議暫停 campaign", explanation: "這個結論太淺了。你沒有解釋為什麼 referral 帶來的用戶會流失，也沒有建議如何改善。"),
                                Challenge.Option(id: "B", text: "MAU 下降的根因是 referral campaign 被 abuse：有人用假帳號大量註冊來獲取免費 Premium。建議：(1) 暫停 campaign 止血 (2) 清理 fraud 帳號 (3) 重新設計 referral 機制（加驗證、設上限）(4) 排除 fraud 後重新計算真實 MAU", explanation: "正確！這是一份完整的根因分析報告。(1) 清楚指出根因（referral abuse/fraud）、(2) 有數據支撐（45 萬來自同一 campaign、使用時間 2 分鐘、同 IP）、(3) 有短期和長期建議、(4) 建議重新計算「真實」MAU 排除 fraud 影響。"),
                                Challenge.Option(id: "C", text: "我們的 MAU 定義有問題，這些 fraud 帳號不應該算在 MAU 裡。調整定義後 MAU 其實沒有下降", explanation: "雖然排除 fraud 很重要，但你不能只是重新定義指標來「解決」問題。fraud 本身需要被處理，campaign 需要被修正。"),
                                Challenge.Option(id: "D", text: "需要更多數據才能確認是 fraud，不能妄下結論", explanation: "使用時間 2 分鐘、200+ 邀請、同 IP/設備——這已經是非常明確的 fraud pattern。面試中，你需要展示決斷力，不能一直說「需要更多數據」。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "一份好的分析報告要包含：根因、證據、短期和長期建議。",
                                "除了「暫停 campaign」，還需要什麼行動？",
                            ],
                            explanation: "這個 Boss Challenge 展示了完整的數據調查流程：(1) 看整體指標異常 → (2) 拆解公式找主因 → (3) 按 segment 拆找到異常群體 → (4) 深入調查該群體的特徵 → (5) 找到根因 → (6) 提出行動建議。面試中做到這個流程，就能展示結構化分析能力。",
                            frameworkTip: "完整調查報告：指標異常 → 公式拆解 → Segment 分析 → Root Cause → 數據佐證 → 行動建議（短期 + 長期）"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 5: Product Thinking
        World(
            id: 5,
            name: "Product Thinking",
            emoji: "💡",
            description: "User journey、Pain points、Feature 成功評估",
            quests: [
                Quest(
                    id: "5-1",
                    name: "User Journey Mapping",
                    description: "畫出使用者旅程，找到痛點",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別 Journey 階段",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個 User Journey 最完整、最適合分析 trial-to-paid 轉換問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 產品的使用者旅程",
                                narrative: "你是一家 project management 工具的 Product Analyst。PM 說：「我們的 free trial → paid 轉換率只有 2%，遠低於業界平均 5%。」\n\n你需要先畫出 User Journey 才能找到問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "註冊 → 付費", explanation: "太粗了。中間有很多步驟，你不知道用戶卡在哪裡。"),
                                Challenge.Option(id: "B", text: "搜尋/廣告 → Landing Page → 註冊 → Onboarding → 建立第一個專案 → 邀請團隊 → 持續使用 → 付費", explanation: "正確！完整的 journey 包含每一個關鍵步驟。這樣你才能看到用戶在「建立專案」和「邀請團隊」之間是不是有大量流失。"),
                                Challenge.Option(id: "C", text: "註冊 → 用了幾天 → 覺得好不好用 → 付不付費", explanation: "太模糊了。「用了幾天」不是一個具體的行為步驟，你需要更精確的 action。"),
                                Challenge.Option(id: "D", text: "註冊 → 功能 A → 功能 B → 功能 C → 付費", explanation: "功能導向的 journey 不一定符合使用者的實際路徑。應該從使用者「要完成什麼任務」出發。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好的 User Journey 要有具體的 action（動作），不是模糊的感受",
                                "想想使用者從第一次接觸到付費，中間會做哪些「事情」",
                            ],
                            explanation: "User Journey 的目的是把使用者的路徑具體化，這樣你才能在每一步量化轉換率，找到 drop-off 最大的地方。越具體的 journey 越有分析價值。",
                            frameworkTip: "User Journey 要素：Stages（階段）→ Actions（行為）→ Touchpoints（接觸點）→ Pain Points（痛點）"
                        ),
                        Challenge(
                            id: 2,
                            name: "找到 Journey 中的痛點",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "從數據來看，最大的痛點在哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Onboarding 漏斗數據",
                                narrative: "你拿到了 Onboarding 流程的漏斗數據：",
                                data: [
                                    ["step": "1. 完成註冊", "users": "10000", "conversion": "100%"],
                                    ["step": "2. Email 驗證", "users": "7200", "conversion": "72%"],
                                    ["step": "3. 填寫 Profile", "users": "6800", "conversion": "94%"],
                                    ["step": "4. 建立第一個專案", "users": "2100", "conversion": "31%"],
                                    ["step": "5. 邀請第一個隊友", "users": "1800", "conversion": "86%"],
                                    ["step": "6. 完成第一個任務", "users": "1500", "conversion": "83%"],
                                ],
                                dataCaption: "Onboarding 漏斗（過去 30 天）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Email 驗證（28% 流失）", explanation: "Email 驗證流失 28% 確實不少，但不是最大的。繼續看其他步驟。"),
                                Challenge.Option(id: "B", text: "填寫 Profile → 建立第一個專案（69% 流失）", explanation: "正確！從 6,800 到 2,100，流失了 69%。這是整個漏斗中 drop-off 最大的一步。用戶完成了 profile 但不知道怎麼建立專案，或者覺得太複雜。"),
                                Challenge.Option(id: "C", text: "邀請隊友（14% 流失）", explanation: "14% 的流失率在 onboarding 中算正常，不是主要問題。"),
                                Challenge.Option(id: "D", text: "整體都有問題，需要全面改善", explanation: "分析的關鍵是找到最大的槓桿點。資源有限，應該優先解決 drop-off 最大的步驟。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看每一步的 conversion rate，哪一步最低？",
                                "31% 代表什麼？為什麼只有不到 1/3 的人跨過這一步？",
                            ],
                            explanation: "漏斗分析的核心是找到「最大 drop-off」。這裡第 3 步到第 4 步的轉換率只有 31%，遠低於其他步驟。改善這一步的 ROI 最高 — 如果能從 31% 提升到 50%，整個漏斗的最終轉換會顯著改善。",
                            frameworkTip: "找到最大 drop-off 後，下一步是問：「為什麼？」可能是 UX 問題、引導不足、或功能太複雜。"
                        ),
                    ]
                ),
                Quest(
                    id: "5-2",
                    name: "Feature 成功評估",
                    description: "新功能上線後怎麼判斷成不成功",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "定義成功指標",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪組指標最適合評估這個搜尋功能？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新搜尋功能上線",
                                narrative: "你的電商平台剛上線了一個改良版搜尋功能，PM 問你：「怎麼判斷新搜尋有沒有成功？」\n\n新搜尋的目標是：讓用戶更快找到想要的商品。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "DAU 和 MAU", explanation: "DAU/MAU 是產品整體指標，不是搜尋功能的成功指標。搜尋改善不一定直接影響 DAU。"),
                                Challenge.Option(id: "B", text: "搜尋使用次數", explanation: "搜尋次數高可能代表用戶找不到東西所以一直搜。使用次數高不等於成功。"),
                                Challenge.Option(id: "C", text: "Primary: 搜尋後點擊率和購買轉換率 / Guardrail: 頁面載入時間、整體 conversion", explanation: "正確！搜尋後有點擊結果（task completion）和購買轉換（downstream impact）直接衡量「更快找到想要的商品」。Guardrail 確保新功能不會拖慢速度或傷害整體轉換。"),
                                Challenge.Option(id: "D", text: "用戶滿意度調查分數", explanation: "調查是輔助指標，但不能作為唯一判斷。需要搭配行為數據才完整。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "回到功能的目標：「讓用戶更快找到商品」。什麼數據能反映這個目標？",
                                "Guardrail metrics 是「不能變差」的指標",
                            ],
                            explanation: "Feature 評估的核心：先定義成功（Primary metric），再設安全線（Guardrail）。Primary metric 要直接反映功能的目標，Guardrail 確保不會有副作用。",
                            frameworkTip: "面試黃金句：「在評估之前，我會先定義 primary metric 和 guardrail，確保我們知道成功長什麼樣。」"
                        ),
                        Challenge(
                            id: 2,
                            name: "Before / During / After",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個功能算成功嗎？最好的判斷方式是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "通知功能的成效評估",
                                narrative: "你的 SaaS 產品新增了「智慧通知」功能，會在用戶的任務快到期時發 push notification。上線一個月了，你要做成效報告。\n\n數據：\n• 通知開啟率：65%\n• 通知後 1 小時內打開 app 的比例：40%\n• 使用智慧通知的用戶 D7 retention：+8pp（vs 未使用者）\n• 但整體的 notification opt-out rate 從 12% 上升到 18%",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "成功，因為 retention 提升了 8pp", explanation: "retention 提升是好消息，但 opt-out rate 上升是警訊。不能只看好的面。"),
                                Challenge.Option(id: "B", text: "失敗，因為 opt-out rate 上升表示用戶覺得被打擾", explanation: "opt-out 上升確實是問題，但功能有正面影響，不能直接判定失敗。"),
                                Challenge.Option(id: "C", text: "需要更多分析：retention 提升是否有因果關係？opt-out 集中在哪些用戶？", explanation: "正確！(1) Retention 差異可能是 selection bias（主動開通知的用戶本來就比較活躍）。(2) opt-out 如果集中在低活躍用戶，影響可能可接受。需要更深入分析。"),
                                Challenge.Option(id: "D", text: "成功，因為 65% 的開啟率很高", explanation: "開啟率高只代表 discoverability 好，不代表功能有價值。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "correlation ≠ causation：使用功能的用戶 retention 高，不代表是功能造成的",
                                "看到 guardrail metric 變差（opt-out rate）時，不能忽略",
                            ],
                            explanation: "真實的功能評估很少是非黑即白的。好的分析師會：(1) 質疑因果關係（selection bias）(2) 看 guardrail metrics (3) 做 segment 分析。面試中展示這種批判性思維會加分。",
                            frameworkTip: "Feature 評估三階段：Before（定義成功）→ During（監控健康）→ After（全面覆盤）"
                        ),
                    ]
                ),
                Quest(
                    id: "5-3",
                    name: "Adoption 問題診斷",
                    description: "為什麼沒人用你的功能？",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "三層模型診斷",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據 Discoverability → Usability → Value 模型，最大的問題在哪一層？",
                            scenario: 
                            Challenge.Scenario(
                                title: "報表功能沒人用",
                                narrative: "你的 B2B SaaS 產品花了三個月開發了一個「自訂報表」功能，但上線一個月後只有 8% 的客戶使用過。PM 很沮喪。\n\n你拿到了以下數據：",
                                data: [
                                    ["metric": "報表功能入口的曝光次數", "value": "45,000 次/月"],
                                    ["metric": "點擊進入報表功能", "value": "1,200 次/月", "conversion": "2.7%"],
                                    ["metric": "開始建立報表", "value": "900 次", "conversion": "75%"],
                                    ["metric": "成功完成報表", "value": "320 次", "conversion": "36%"],
                                    ["metric": "7 天內再次使用", "value": "180 次", "conversion": "56%"],
                                ],
                                dataCaption: "報表功能漏斗"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Discoverability — 用戶不知道有這個功能", explanation: "入口曝光有 45,000 次，用戶有看到。但點擊率只有 2.7%，這確實是 Discoverability/入口設計的問題。不過要跟其他層一起看。"),
                                Challenge.Option(id: "B", text: "Usability — 用戶用了但用不完", explanation: "完成率 36% 確實偏低，但最大的 drop-off 在第一步。"),
                                Challenge.Option(id: "C", text: "Value — 用完了但覺得沒價值", explanation: "7 天內再次使用 56%，其實不算差。Value 不是最大的問題。"),
                                Challenge.Option(id: "D", text: "Discoverability + Usability 都有問題，但 Discoverability 更嚴重", explanation: "正確！最大的 drop-off 在「看到 → 點擊」（2.7%），代表入口設計或 messaging 有問題。其次是「開始 → 完成」（36%），代表流程有 usability 問題。應該先解決 Discoverability — 讓更多人嘗試。"),
                            ],
                            correctAnswer: "D",
                            hints: [
                                "看漏斗每一步的轉換率，哪一步的 drop-off 最大？",
                                "2.7% 的點擊率意味著什麼？",
                            ],
                            explanation: "三層模型的診斷邏輯：Discoverability（看到但不點 → 入口或 messaging 問題）→ Usability（點了但完不成 → 流程或設計問題）→ Value（完成了但不再用 → 功能不解決問題）。要從漏斗的最上面開始修，因為後面的改善沒有流量也沒用。",
                            frameworkTip: "三層模型的診斷口訣：看到嗎？用得完嗎？會再用嗎？"
                        ),
                        Challenge(
                            id: 2,
                            name: "提出改善方案",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個改善策略最有效率？",
                            scenario: 
                            Challenge.Scenario(
                                title: "續上題：改善報表功能 Adoption",
                                narrative: "你已經診斷出主要問題在 Discoverability（入口點擊率 2.7%）和 Usability（完成率 36%）。現在要提出改善方案。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "重新設計整個報表功能，讓它更強大", explanation: "功能的 Value 層其實還行（56% 再次使用）。重新設計成本高，且不解決真正的問題。"),
                                Challenge.Option(id: "B", text: "先改入口（更明顯的位置 + 更清楚的 CTA），再簡化建立流程（模板、引導步驟）", explanation: "正確！先解決 Discoverability（讓更多人嘗試），再解決 Usability（讓嘗試的人完成）。這是最高 ROI 的順序。"),
                                Challenge.Option(id: "C", text: "發 email 通知所有用戶有這個新功能", explanation: "短期可能有效，但不是長期解法。用戶被通知後點進來如果 usability 也沒改善，反而會有負面印象。"),
                                Challenge.Option(id: "D", text: "做一個教學影片放在功能入口", explanation: "教學影片可以幫助 usability，但如果入口點擊率只有 2.7%，很少人會看到影片。要先解決入口問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "改善的順序應該跟漏斗一致 — 先讓更多人進來，再讓進來的人用得完",
                            ],
                            explanation: "改善 adoption 的優先順序：先 Discoverability → 再 Usability → 最後 Value。就像修水管，要從漏水最嚴重的上游開始修。",
                            frameworkTip: "提改善方案時，面試官看的是你的「排優先級」能力，不是列越多越好。"
                        ),
                    ]
                ),
                Quest(
                    id: "5-4",
                    name: "Usage vs Value",
                    description: "使用率高不代表有價值",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "區分 Usage 和 Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這些數據告訴你什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "搜尋功能的假象",
                                narrative: "你的電商 app 的搜尋功能使用率非常高 — 每個 session 平均搜尋 4.2 次。PM 很開心，覺得搜尋功能做得很好。\n\n但你進一步分析發現：",
                                data: [
                                    ["metric": "平均每 session 搜尋次數", "value": "4.2 次"],
                                    ["metric": "搜尋後有點擊結果的比例", "value": "35%"],
                                    ["metric": "搜尋後完成購買的比例", "value": "8%"],
                                    ["metric": "用搜尋的用戶 vs 用分類瀏覽的用戶購買率", "value": "8% vs 15%"],
                                ],
                                dataCaption: "搜尋功能數據"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "搜尋功能很成功，使用率很高", explanation: "使用率高可能代表用戶找不到東西所以一直搜。要看 outcome，不只看 usage。"),
                                Challenge.Option(id: "B", text: "搜尋功能的 usage 高但 value 低 — 用戶搜了很多次但找不到想要的東西", explanation: "正確！平均搜 4.2 次但只有 35% 點擊結果，代表大部分搜尋沒找到有用的結果。購買率比分類瀏覽更低，代表搜尋反而阻礙了購買。高 usage 在這裡是負面訊號。"),
                                Challenge.Option(id: "C", text: "搜尋購買率 8% 已經很好了", explanation: "要跟其他路徑比較。分類瀏覽的購買率 15% 是搜尋的將近兩倍，代表搜尋功能有問題。"),
                                Challenge.Option(id: "D", text: "需要更多數據才能判斷", explanation: "現有數據已經很有說服力了。搜尋多次但少點擊、少購買、比其他路徑差 — 問題很明確。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "搜尋次數多不一定是好事 — 如果一次就找到，為什麼要搜 4 次？",
                                "比較搜尋 vs 分類瀏覽的購買率，哪個更有效？",
                            ],
                            explanation: "Usage ≠ Value 是產品分析中最重要的概念之一。高 usage 可能代表：(1) 功能好用所以常用（好的）(2) 功能不好用所以重複嘗試（壞的）(3) 被迫使用（中性）。要看 outcome 才能判斷。",
                            frameworkTip: "面試黃金句：「使用率是起點，但我更關注 outcome — 使用者完成了他的目標嗎？」"
                        ),
                        Challenge(
                            id: 2,
                            name: "衡量真正的 Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼評估自動備份功能的價值？",
                            scenario: 
                            Challenge.Scenario(
                                title: "自動備份功能的價值",
                                narrative: "你的雲端文件產品有一個「自動備份」功能。它的使用數據：\n• 手動觸發備份：只有 5% 的用戶每月會做\n• 功能設定頁面訪問：2% 的 MAU\n\n但離開分析顯示：關閉自動備份的用戶，60 天內的 churn rate 是 25%；開啟的用戶是 8%。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "使用率太低（5%），功能不成功，應該移除", explanation: "使用率低不代表沒價值。自動備份的價值是「安全感」，不需要主動使用就能提供。"),
                                Challenge.Option(id: "B", text: "用 comparative method — 比較有無使用的用戶 retention，證明功能有高留存價值", explanation: "正確！這是低 usage 高 value 的經典案例。自動備份像保險 — 你不常用到，但少了它你就會離開。衡量這類功能要看 counterfactual 或 comparative，不是看使用率。"),
                                Challenge.Option(id: "C", text: "做滿意度調查，問用戶覺得備份重不重要", explanation: "調查可以做，但行為數據（retention 差異）比主觀回答更有說服力。"),
                                Challenge.Option(id: "D", text: "把備份功能做得更明顯，提高使用率", explanation: "自動備份本來就不需要主動使用。提高使用率不是正確的目標。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "有些功能的價值不在「被使用」，而在「存在本身」",
                                "比較有/沒有這個功能的用戶行為差異",
                            ],
                            explanation: "衡量 Value 的四種方法：(1) Outcome-based — 用了之後目標行為改善了嗎？(2) Comparative — 有用 vs 沒用的差異 (3) Counterfactual — 移除後會怎樣？(4) Survey — 直接問用戶。低 usage 高 value 的功能在面試中是加分題。",
                            frameworkTip: "面試小技巧：主動提到「usage 和 value 是不同的概念」，展示你有深度思考。"
                        ),
                    ]
                ),
                Quest(
                    id: "5-5",
                    name: "Discoverability vs Usability vs Value",
                    description: "產品問題的三層拆解",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "三層完整分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據三層模型的分析，正確的優先順序是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "報表功能 vs Excel",
                                narrative: "你的 B2B 產品有內建報表功能，但大部分客戶還是在用 Excel。PM 問你：「為什麼？」\n\n你做了以下調查：",
                                data: [
                                    ["finding": "功能入口在設定選單的第三層", "source": "產品分析"],
                                    ["finding": "65% 的用戶不知道有這個功能", "source": "用戶訪談"],
                                    ["finding": "知道的人中，40% 嘗試後覺得操作步驟太多", "source": "漏斗數據"],
                                    ["finding": "成功用完的人中，70% 會再次使用", "source": "行為數據"],
                                    ["finding": "用報表功能的人平均省 2 小時/週", "source": "效率分析"],
                                ],
                                dataCaption: "調查結果"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "先改善 Value（讓報表更有用）", explanation: "70% 再次使用率和省 2 小時/週，Value 層其實沒什麼問題。"),
                                Challenge.Option(id: "B", text: "先改善 Discoverability（讓更多人知道），再改善 Usability（簡化操作）", explanation: "正確！65% 不知道有這個功能 → Discoverability 是最大問題。然後 40% 嘗試後覺得太複雜 → Usability 是第二問題。Value 其實很好（70% 復用、省 2 小時），不需要改。"),
                                Challenge.Option(id: "C", text: "同時改善三層，全面升級", explanation: "資源有限，要有優先級。Value 層不需要改，先集中火力在 Discoverability 和 Usability。"),
                                Challenge.Option(id: "D", text: "先改善 Usability（簡化操作），因為 40% 的流失很嚴重", explanation: "40% 的 usability 流失確實要修，但 65% 不知道有這功能的問題更大。如果沒人進來，改善體驗也沒用。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想像一個漏斗：先要有人「看到」，才能「用」，用了才能「感受到價值」",
                                "哪一層的問題影響最多人？",
                            ],
                            explanation: "三層模型的分析邏輯：從上到下診斷（D → U → V），從上到下修復。先確保用戶知道功能存在，再確保用得順暢，最後才處理價值問題。很多產品功能失敗不是因為沒價值，而是根本沒人知道。",
                            frameworkTip: "完整回答結構：「我會用 Discoverability → Usability → Value 三層來分析，先找到問題在哪一層，再依序改善。」"
                        ),
                    ]
                ),
                Quest(
                    id: "5-6",
                    name: "Boss: 產品分析 Case",
                    description: "完整的產品分析面試題",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 產品分析完整 Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "社交電商 App 的 Referral 功能分析",
                                narrative: "你是一家社交電商 App 的 Product Analyst。這個 App 讓用戶可以分享購物清單給朋友，朋友可以直接購買。\n\n三個月前上線了 Referral 功能：用戶邀請朋友註冊，雙方都得 $10 折扣。\n\n目前數據：\n• 10% 的 MAU 使用了分享功能\n• Referral link 被點擊 50,000 次/月\n• 點擊後註冊率：15%\n• 新用戶 D7 retention：22%（vs 自然用戶的 35%）\n• 每個 referral 用戶的 CAC：$18（vs paid ads 的 $12）\n• 邀請者的 30 天回購率：提升 12%",
                                data: [
                                    ["metric": "MAU 使用分享功能", "value": "10%"],
                                    ["metric": "Referral link 點擊", "value": "50,000/月"],
                                    ["metric": "點擊→註冊轉換率", "value": "15%"],
                                    ["metric": "被推薦用戶 D7 Retention", "value": "22%"],
                                    ["metric": "自然用戶 D7 Retention", "value": "35%"],
                                    ["metric": "Referral CAC", "value": "$18"],
                                    ["metric": "Paid Ads CAC", "value": "$12"],
                                    ["metric": "邀請者 30天回購率提升", "value": "+12%"],
                                ],
                                dataCaption: "Referral 功能數據"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "不要急著判斷成功或失敗，先用框架分析",
                                "想想 referral 用戶為什麼 retention 低 — 他們的動機是什麼？",
                            ],
                            explanation: "產品分析 Case 的核心是展示你的思考深度。不只看數字表面，要挖掘背後的原因，提出有邏輯的改善方案。面試官看的是你的分析框架和思路，不是答案本身。",
                            frameworkTip: "產品分析完整架構：定義成功 → 分層評估 → 診斷問題 → 提出方案 → 排優先級"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 6: Business Process
        World(
            id: 6,
            name: "Business Process",
            emoji: "⚙️",
            description: "Process mapping、Bottleneck、Workflow 優化",
            quests: [
                Quest(
                    id: "6-1",
                    name: "Process Mapping",
                    description: "把商業流程畫出來分析",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別流程要素",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這個流程中，「客服判斷問題類型」屬於什麼要素？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客訴處理流程",
                                narrative: "你加入了一家電商公司的 Operations 團隊。主管要你畫出客訴處理流程圖。目前的流程是：\n\n客戶打電話投訴 → 客服記錄問題 → 客服判斷問題類型 → 如果是物流問題，轉給物流部；如果是產品品質問題，轉給品管部 → 各部門調查 → 回覆客戶 → 確認客戶滿意 → 結案",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "步驟（Action Step）", explanation: "判斷問題類型不是單純的「做事」，而是一個需要做出選擇的點。"),
                                Challenge.Option(id: "B", text: "決策點（Decision Point）", explanation: "正確！「如果是物流問題 → 走 A 路線；如果是品質問題 → 走 B 路線」是一個分支判斷，在流程圖中用菱形表示。"),
                                Challenge.Option(id: "C", text: "等待（Wait State）", explanation: "判斷可能需要一些時間，但核心性質是「做決定」，不是被動等待。"),
                                Challenge.Option(id: "D", text: "觸發事件（Trigger）", explanation: "觸發事件是流程的起點（客戶打電話投訴）。判斷問題類型是流程中間的步驟。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "流程中有「如果...就...」的地方，都是決策點",
                                "想想流程圖的基本圖形：矩形=步驟、菱形=決策、圓形=開始/結束",
                            ],
                            explanation: "Process Map 的核心要素：觸發事件（起點）→ 步驟（動作）→ 決策點（分支）→ 等待（被動等候）→ 結束。識別決策點特別重要，因為每個決策點都是流程可能出錯或延遲的地方。",
                            frameworkTip: "面試中描述流程時，特別點出決策點和負責人：「在這一步需要做判斷，由 X 角色負責。」"
                        ),
                        Challenge(
                            id: 2,
                            name: "畫出完整流程",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你要分析這個流程。以下哪個做法最正確？",
                            scenario: 
                            Challenge.Scenario(
                                title: "採購審批流程",
                                narrative: "公司目前的採購流程：\n\n1. 員工提交採購申請\n2. 部門主管審核\n3. 如果金額 > $5,000，需要 VP 額外核准\n4. 採購部下單\n5. 供應商交貨\n6. 驗收\n7. 財務付款\n\n平均處理時間：12 個工作天。主管覺得太慢。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接建議跳過 VP 審核來加速", explanation: "在理解完整流程和瓶頸之前就建議移除步驟是危險的。VP 審核可能有合規原因。"),
                                Challenge.Option(id: "B", text: "量化每一步的 processing time 和 wait time，找到最慢的環節", explanation: "正確！Process Mapping 的關鍵是量化。知道每一步花多少時間（做事 vs 等待），你才能找到 bottleneck。可能 VP 審核只花 5 分鐘，但「等 VP 看到」要 3 天。"),
                                Challenge.Option(id: "C", text: "直接把整個流程自動化", explanation: "不是所有步驟都適合自動化。需要先分析哪些步驟是瓶頸，哪些適合自動化。"),
                                Challenge.Option(id: "D", text: "問員工覺得哪一步最慢", explanation: "員工的感受是參考之一，但需要用數據驗證。人的感受不一定反映真實的瓶頸。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Processing time 是「實際做事」的時間，Wait time 是「等待」的時間",
                                "大部分流程的慢不在「做事」，而在「等待」",
                            ],
                            explanation: "畫流程圖只是第一步。真正有價值的是量化每一步的時間，特別是區分 processing time（做事時間）和 wait time（等待時間）。這樣你才能找到 bottleneck，提出有數據支撐的改善建議。",
                            frameworkTip: "Process Mapping 三步：(1) 畫出步驟 (2) 標注負責人和時間 (3) 區分做事 vs 等待時間"
                        ),
                    ]
                ),
                Quest(
                    id: "6-2",
                    name: "找 Bottleneck",
                    description: "流程中哪裡最容易卡",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別 Bottleneck",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個流程的 bottleneck 在哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂單處理流程分析",
                                narrative: "你量化了訂單處理流程的每一步時間：",
                                data: [
                                    ["step": "1. 接收訂單", "processing": "即時（自動）", "wait": "0", "total": "0 min"],
                                    ["step": "2. 庫存檢查", "processing": "2 min", "wait": "0", "total": "2 min"],
                                    ["step": "3. 信用審核", "processing": "5 min", "wait": "4 hours", "total": "4h 5min"],
                                    ["step": "4. 揀貨包裝", "processing": "15 min", "wait": "30 min", "total": "45 min"],
                                    ["step": "5. 物流安排", "processing": "3 min", "wait": "10 min", "total": "13 min"],
                                    ["step": "6. 出貨通知", "processing": "即時（自動）", "wait": "0", "total": "0 min"],
                                ],
                                dataCaption: "訂單處理流程時間分析"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "揀貨包裝（processing time 最長：15 min）", explanation: "15 分鐘的 processing time 確實最長，但 total 只有 45 分鐘。Bottleneck 要看 total lead time，不只看 processing time。"),
                                Challenge.Option(id: "B", text: "信用審核（wait time 最長：4 hours）", explanation: "正確！信用審核的 processing 只要 5 分鐘，但等待 4 小時。這 4 小時的等待佔了整個流程 80% 以上的時間。典型的 bottleneck — 問題不在「做事」而在「等待」。"),
                                Challenge.Option(id: "C", text: "物流安排（效率最低）", explanation: "total 只有 13 分鐘，不是瓶頸。"),
                                Challenge.Option(id: "D", text: "沒有明顯的 bottleneck，流程很平衡", explanation: "信用審核的 4 小時等待遠超其他步驟，是非常明顯的 bottleneck。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看 total lead time，不只看 processing time",
                                "哪一步的 wait time 最長？為什麼？",
                            ],
                            explanation: "大部分 bottleneck 的問題出在「等待」而不是「做事」。信用審核本身只要 5 分鐘，但排隊等處理要 4 小時 — 可能是因為只有一個審核員，或審核系統不即時。解法：增加審核人手、提高自動審核比例、或設定低風險訂單免審核。",
                            frameworkTip: "Bottleneck 分析口訣：找到 wait time 最長的那一步，那就是你的 bottleneck。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Bottleneck 類型",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這是什麼類型的 bottleneck？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客服 Ticket 堆積",
                                narrative: "客服 ticket 的平均處理時間從 2 小時變成 8 小時。你調查後發現：\n\n• ticket 量跟上個月差不多\n• 客服人數沒變\n• 但「指派」這一步的等待時間從 15 分鐘變成 5 小時\n• 原因：最近增加了一個規則 — 所有 ticket 必須先經過「L2 技術評估」才能指派，而 L2 只有 2 個人",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "人力瓶頸 — L2 技術人員不夠", explanation: "部分正確，但更精確地說是政策導致的人力瓶頸。"),
                                Challenge.Option(id: "B", text: "系統瓶頸 — 系統處理速度慢", explanation: "不是系統的問題，是流程規則的問題。系統本身沒有變。"),
                                Challenge.Option(id: "C", text: "政策瓶頸 — 新規則創造了不必要的依賴", explanation: "正確！新加的「必須經過 L2 評估」規則，讓所有 ticket 都卡在 2 個 L2 人員身上。解法可能是：只有技術類 ticket 才需要 L2 評估，或訓練更多 L2，或讓 L1 有一定的自主判斷權。"),
                                Challenge.Option(id: "D", text: "資訊瓶頸 — 缺乏足夠資訊做判斷", explanation: "問題不在資訊不足，而在流程規則強制所有 ticket 都經過 L2。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "ticket 量沒變、人數沒變，那什麼變了？",
                                "新規則是不是對「所有」ticket 都必要？",
                            ],
                            explanation: "政策瓶頸常被忽視。很多流程效率問題不是人不夠或系統不好，而是「規則設計」創造了不必要的 bottleneck。解法通常是檢視規則是否對所有情境都必要，區分高風險 vs 低風險的處理路徑。",
                            frameworkTip: "面試時看到流程變慢但量沒變的情況，先問：「最近有什麼流程或規則的變化嗎？」"
                        ),
                    ]
                ),
                Quest(
                    id: "6-3",
                    name: "Automation 決策",
                    description: "哪些步驟該自動化、哪些不該",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "判斷自動化適合度",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪些步驟最適合優先自動化？",
                            scenario: 
                            Challenge.Scenario(
                                title: "採購流程自動化評估",
                                narrative: "你的主管想把採購審批流程自動化。目前流程有 8 個步驟，你需要評估哪些適合自動化：",
                                data: [
                                    ["step": "1. 提交申請", "frequency": "200 次/月", "rule_clarity": "明確", "error_cost": "低"],
                                    ["step": "2. 格式檢查", "frequency": "200 次/月", "rule_clarity": "非常明確", "error_cost": "低"],
                                    ["step": "3. 預算餘額檢查", "frequency": "200 次/月", "rule_clarity": "明確", "error_cost": "中"],
                                    ["step": "4. 供應商選擇", "frequency": "150 次/月", "rule_clarity": "模糊（需經驗判斷）", "error_cost": "高"],
                                    ["step": "5. 主管審核", "frequency": "150 次/月", "rule_clarity": "依情境", "error_cost": "高"],
                                    ["step": "6. 下單給供應商", "frequency": "130 次/月", "rule_clarity": "明確", "error_cost": "中"],
                                    ["step": "7. 驗收確認", "frequency": "120 次/月", "rule_clarity": "部分明確", "error_cost": "高"],
                                    ["step": "8. 付款通知", "frequency": "120 次/月", "rule_clarity": "非常明確", "error_cost": "低"],
                                ],
                                dataCaption: "各步驟自動化評估"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部自動化，省掉所有人工", explanation: "供應商選擇和主管審核需要判斷力，錯誤成本高，不適合完全自動化。"),
                                Challenge.Option(id: "B", text: "格式檢查 + 預算檢查 + 付款通知", explanation: "正確！這三步符合自動化三條件：(1) 頻率高 (2) 規則明確 (3) 錯誤成本低到中。格式檢查和付款通知幾乎零風險，預算檢查是簡單的數值比對。"),
                                Challenge.Option(id: "C", text: "主管審核 — 因為這一步最花時間", explanation: "主管審核需要人的判斷，且錯誤成本高。不適合完全自動化。可以做的是「低金額自動核准 + 高金額人工」。"),
                                Challenge.Option(id: "D", text: "只自動化付款通知就好，風險最低", explanation: "太保守了。格式檢查和預算檢查也完全適合自動化，可以大幅提升效率。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "自動化三要素：頻率高 + 規則明確 + 錯誤成本可控",
                                "需要「經驗判斷」的步驟通常不適合完全自動化",
                            ],
                            explanation: "自動化決策的核心是風險和收益的 trade-off。最適合自動化的是「高頻 + 規則明確 + 低風險」的步驟。需要判斷力的步驟可以做部分自動化（如：低金額自動、高金額人工）。",
                            frameworkTip: "面試答題結構：「我會用三個維度評估：頻率、規則明確度、錯誤成本。優先自動化 high-frequency + clear-rule + low-risk 的步驟。」"
                        ),
                    ]
                ),
                Quest(
                    id: "6-4",
                    name: "Permissions & Audit",
                    description: "權限控制和可追蹤性設計",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "權限設計原則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個權限設計最符合最佳實踐？",
                            scenario: 
                            Challenge.Scenario(
                                title: "費用報銷系統",
                                narrative: "你要設計一個費用報銷系統。目前的問題：\n\n• 有員工自己提交申請、自己核准（separation of duties 違規）\n• 有些人能看到全公司的報銷記錄（最小權限原則違規）\n• 有一筆 $50,000 的報銷被核准了，但找不到是誰核准的（audit trail 缺失）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "每個人只能看到自己的報銷、不能核准自己的申請、所有操作都記錄", explanation: "正確！這三個原則是：(1) 最小權限 — 只看自己的 (2) Separation of Duties — 不能既申請又核准 (3) Audit Trail — 全記錄。這是基本的內控設計。"),
                                Challenge.Option(id: "B", text: "讓主管能看到部門全員的報銷就好", explanation: "主管看部門記錄合理，但沒有解決 separation of duties 和 audit trail 的問題。"),
                                Challenge.Option(id: "C", text: "加一個「超級管理員」可以核准所有金額", explanation: "超級管理員過於集中權限，風險更高。應該用金額分級。"),
                                Challenge.Option(id: "D", text: "所有報銷都要 VP 核准，最安全", explanation: "過度審核會讓流程極慢。應該用分級機制（小額自動、中額主管、大額 VP）。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "三個安全原則：最小權限、職責分離、可追蹤性",
                                "平衡安全性和效率",
                            ],
                            explanation: "權限設計三原則：(1) Least Privilege — 只給需要的最小權限 (2) Separation of Duties — 同一人不能既執行又核准 (3) Audit Trail — 誰在什麼時候做了什麼都要有記錄。這在 SOX 合規和內部審計中非常重要。",
                            frameworkTip: "面試中提到 separation of duties 和 audit trail 會大大加分 — 展示你理解企業治理。"
                        ),
                    ]
                ),
                Quest(
                    id: "6-5",
                    name: "Exception Handling",
                    description: "例外情況的流程設計",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "設計例外處理",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個例外情況的設計方式最合理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "退貨流程的例外情況",
                                narrative: "你設計了一個退貨流程：客戶申請退貨 → 審核資格 → 安排取件 → 收到商品 → 檢查商品 → 退款 → 結案。\n\n但實際運作中遇到很多例外狀況。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "超過退貨期限的一律拒絕，沒有例外", explanation: "太死板。會損失忠實客戶。應該有主管裁量權機制。"),
                                Challenge.Option(id: "B", text: "所有例外都交給客服主管逐一判斷", explanation: "這樣客服主管會變成新的 bottleneck。應該區分高/低頻率和高/低影響的例外。"),
                                Challenge.Option(id: "C", text: "高頻 + 低影響的例外用自動規則處理（如：超期 7 天內自動核准）；低頻 + 高影響的走人工 escalation（如：大量退貨觸發調查）", explanation: "正確！例外處理要分級：常見的小例外用規則自動處理（快且一致），少見的大例外走人工判斷和升級路徑（安全且有彈性）。"),
                                Challenge.Option(id: "D", text: "把所有例外情況寫成規則，完全自動化", explanation: "例外的本質是「預期之外」，你不可能預見所有情況。一定要保留人工判斷的路徑。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "例外處理的設計跟功能的優先級一樣，要考慮頻率和影響",
                                "不是所有例外都需要人工處理，也不是所有例外都能自動化",
                            ],
                            explanation: "例外處理矩陣：高頻+低影響 → 自動規則；低頻+低影響 → 簡單流程；高頻+高影響 → 可能要改核心流程；低頻+高影響 → 人工+escalation。流程設計不只是 happy path，考慮例外才是成熟的設計。",
                            frameworkTip: "面試加分句：「除了正常流程，我還會考慮例外情況的處理路徑和升級機制。」"
                        ),
                    ]
                ),
                Quest(
                    id: "6-6",
                    name: "Boss: 流程改善 Case",
                    description: "完整的流程優化面試題",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 流程優化完整 Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "員工 Onboarding 流程改善",
                                narrative: "你是一家 300 人科技公司的 Business Systems Analyst。HR VP 找你：\n\n「新員工從收到 offer 到第一天能正常工作，平均要 15 個工作天。員工抱怨第一週什麼都做不了。競爭對手的 onboarding 只要 3 天。」\n\n目前流程：\n1. HR 發 offer letter（1 天）\n2. 等員工簽回（3 天等待）\n3. HR 通知 IT 建帳號（1 天）\n4. IT 建立 email + 系統權限（2 天）\n5. HR 通知 Finance 設定薪資（1 天）\n6. Finance 設定薪資和銀行帳戶（2 天）\n7. HR 通知 Manager 準備座位和設備（1 天）\n8. Manager 安排 buddy 和第一週行程（2 天）\n9. 員工到職日（Day 1）\n10. IT 現場協助設定筆電（2 天等待 IT 排班）",
                                data: [
                                    ["step": "HR 發 offer", "processing": "30min", "wait": "0", "responsible": "HR"],
                                    ["step": "等員工簽回", "processing": "0", "wait": "3 days", "responsible": "員工"],
                                    ["step": "通知 IT", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "IT 建帳號", "processing": "1hr", "wait": "1 day", "responsible": "IT"],
                                    ["step": "通知 Finance", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "Finance 設定", "processing": "30min", "wait": "1.5 days", "responsible": "Finance"],
                                    ["step": "通知 Manager", "processing": "10min", "wait": "1 day", "responsible": "HR"],
                                    ["step": "Manager 準備", "processing": "2hr", "wait": "1.5 days", "responsible": "Manager"],
                                    ["step": "員工到職", "processing": "-", "wait": "-", "responsible": "-"],
                                    ["step": "IT 設定筆電", "processing": "1hr", "wait": "1 day", "responsible": "IT"],
                                ],
                                dataCaption: "各步驟時間分析"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "注意 processing time 和 wait time 的差距",
                                "想想哪些步驟可以同時進行而不需要等前一步完成",
                            ],
                            explanation: "流程改善的核心思路：序列化 → 平行化、手動 → 自動化、到場才做 → 提前準備。面試中能完整走過 Process Mapping → Bottleneck → Automation → Permissions → Exception Handling 這個框架，就是 A+ 的回答。",
                            frameworkTip: "流程改善五步：畫出流程 → 找到瓶頸 → 平行化 + 自動化 → 加入權限管控 → 設計例外處理"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 7: Experiment & Validation
        World(
            id: 7,
            name: "Experiment & Validation",
            emoji: "🧪",
            description: "A/B Test、Hypothesis、驗證你的建議",
            quests: [
                Quest(
                    id: "7-1",
                    name: "Hypothesis 設計",
                    description: "怎麼把直覺變成可驗證的假設",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "好的假設 vs 壞的假設",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個假設最好？（可驗證、有指標、有邏輯）",
                            scenario: 
                            Challenge.Scenario(
                                title: "搜尋結果頁改善",
                                narrative: "PM 覺得搜尋結果頁的 conversion 太低。你需要先提出假設，再設計實驗驗證。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "「搜尋結果不好」", explanation: "太模糊。什麼叫「不好」？怎麼衡量？這不是一個可驗證的假設。"),
                                Challenge.Option(id: "B", text: "「如果在搜尋結果中加入商品評分和評論數，用戶會更容易做出購買決策，搜尋後的加購率會提升 10%」", explanation: "正確！這個假設有：(1) 具體的改變（加入評分和評論數）(2) 背後的邏輯（幫助購買決策）(3) 可衡量的預期結果（加購率 +10%）。"),
                                Challenge.Option(id: "C", text: "「用戶不喜歡我們的搜尋」", explanation: "主觀判斷，無法用數據驗證。好的假設需要具體的行為和指標。"),
                                Challenge.Option(id: "D", text: "「改善搜尋演算法會提升轉換率」", explanation: "方向對但太模糊。「改善」是什麼意思？「轉換率」是指什麼轉換？要更具體。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好假設的結構：If we [做什麼改變], then [會發生什麼], because [為什麼]",
                                "假設必須是可用數據驗證的",
                            ],
                            explanation: "好的假設有三個要素：(1) 具體的 intervention（做什麼改變）(2) 預期的 outcome（會發生什麼、衡量指標）(3) 背後的 rationale（為什麼這樣認為）。面試中能提出好的假設，代表你有結構化的思考能力。",
                            frameworkTip: "假設公式：If [intervention], then [outcome], because [rationale]"
                        ),
                        Challenge(
                            id: 2,
                            name: "假設的優先排序",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你會怎麼排優先級來驗證這些假設？",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂閱續約率下降",
                                narrative: "你的 SaaS 產品的月續約率從 92% 掉到 87%。團隊列了 4 個假設：\n\nH1：最近漲價 10% 導致價格敏感的客戶不續約\nH2：競爭對手上線了新功能，客戶被吸走了\nH3：客戶使用量下降（可能是因為核心功能有 bug）\nH4：客服回應時間變長，客戶不滿意",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按直覺覺得最可能的開始", explanation: "直覺不可靠。應該用數據的可取得性和影響力來排序。"),
                                Challenge.Option(id: "B", text: "先驗證最容易用現有數據確認/排除的（H1 漲價和 H3 使用量），再調查需要外部資料的（H2 競爭對手）", explanation: "正確！H1 可以看漲價前後的 churn 對比、price tier 分析；H3 可以看 usage 數據和 bug report。這些都能用內部數據快速驗證。H2 和 H4 需要外部調查或更深入分析，排後面。"),
                                Challenge.Option(id: "C", text: "四個同時驗證，最有效率", explanation: "資源有限，同時做四個分析會分散注意力。應該優先排除最可能和最容易驗證的。"),
                                Challenge.Option(id: "D", text: "先做客戶訪談，直接問他們為什麼不續約", explanation: "訪談是好方法，但需要時間安排。先用內部數據快速排除一些假設，再用訪談深入了解。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "驗證假設要考慮兩個因素：數據可取得性和排除假設的效率",
                                "能用現有數據快速驗證的假設優先",
                            ],
                            explanation: "假設驗證的排序原則：(1) 可快速用內部數據驗證的先做（低成本高效率）(2) 高影響力的優先 (3) 需要外部調查的排後面。先排除容易排除的假設，縮小範圍。",
                            frameworkTip: "面試中列假設後，主動排優先級：「我會先驗證 H1 和 H3，因為這些可以用內部數據快速確認。」"
                        ),
                    ]
                ),
                Quest(
                    id: "7-2",
                    name: "A/B Test 基礎",
                    description: "實驗設計的基本概念",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "A/B Test 設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 A/B test 設計最正確？",
                            scenario: 
                            Challenge.Scenario(
                                title: "結帳頁改版測試",
                                narrative: "PM 要你設計一個 A/B test：把結帳頁從「3 步驟」改成「1 頁」，看轉換率有沒有提升。\n\n目前的結帳轉換率是 65%，PM 希望提升到 70%。DAU 大約 50,000。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把全部流量切到新版，看轉換率有沒有變", explanation: "沒有控制組就無法確認變化是因為新設計還是其他因素（季節、活動等）。"),
                                Challenge.Option(id: "B", text: "50/50 隨機分流，Control 看原版，Treatment 看新版，跑 2 週，看結帳轉換率差異", explanation: "正確！隨機分流確保兩組可比較。50/50 給足夠 sample size。2 週覆蓋完整的週間/週末週期。Primary metric 是結帳轉換率。"),
                                Challenge.Option(id: "C", text: "讓用戶自己選要用哪個版本", explanation: "自選會產生 selection bias — 喜歡嘗試新東西的人可能本來就比較活躍，結果不可信。"),
                                Challenge.Option(id: "D", text: "先給新用戶看新版，老用戶看舊版", explanation: "新用戶和老用戶行為本來就不同，無法判斷是版本差異還是用戶差異造成的結果。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "A/B test 的關鍵：隨機分流 + 控制變量 + 足夠的 sample size",
                                "實驗時間要覆蓋完整的 business cycle",
                            ],
                            explanation: "A/B test 三要素：(1) 隨機分流（消除 selection bias）(2) 控制組 vs 實驗組（唯一差異是你要測的改變）(3) 足夠的樣本量和時間（統計顯著性）。面試中展示你理解這三點就夠了。",
                            frameworkTip: "A/B test 設計清單：定義假設 → 選 metric → 決定分流比例 → 算 sample size → 設定實驗時間"
                        ),
                        Challenge(
                            id: 2,
                            name: "解讀實驗結果",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你會怎麼報告這個結果？",
                            scenario: 
                            Challenge.Scenario(
                                title: "A/B Test 結果出來了",
                                narrative: "結帳頁 A/B test 跑了 2 週，結果如下：",
                                data: [
                                    ["group": "Control（3步驟）", "users": "25000", "conversions": "16250", "rate": "65.0%"],
                                    ["group": "Treatment（1頁）", "users": "25000", "conversions": "16750", "rate": "67.0%"],
                                    ["group": "差異", "users": "-", "conversions": "+500", "rate": "+2.0pp"],
                                ],
                                dataCaption: "A/B Test 結果"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "新版贏了 2%，建議全面上線", explanation: "p-value = 0.08 > 0.05，結果不具統計顯著性。不能確定 2% 的差異是真實的還是隨機波動。"),
                                Challenge.Option(id: "B", text: "結果不顯著（p=0.08），建議延長實驗時間或增加 sample size 再看", explanation: "正確！2% 的提升看起來不錯，但 p-value 沒達到門檻，可能只是隨機波動。建議延長實驗（增加 sample size 來提高 power）。同時也可以看 secondary metrics 做輔助判斷。"),
                                Challenge.Option(id: "C", text: "新版沒有效果，放棄", explanation: "不顯著不等於「沒有效果」，只是現有數據不足以證明。延長實驗可能得到結論。"),
                                Challenge.Option(id: "D", text: "p-value 0.08 很接近 0.05，可以當作顯著", explanation: "隨意放寬門檻是不嚴謹的。如果覺得 0.05 太嚴格，應該在實驗前就設定好門檻，不能事後調整。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "p-value > 0.05 代表結果不具統計顯著性",
                                "不顯著 ≠ 沒效果，可能是 sample size 不夠",
                            ],
                            explanation: "解讀 A/B test 結果的關鍵：(1) 看統計顯著性（p-value）(2) 看效果量（effect size）(3) 看 guardrail metrics 有沒有受影響。不顯著時的正確做法是延長實驗或增加 sample，而不是直接放棄或強行上線。",
                            frameworkTip: "面試黃金句：「這個結果在方向上是正面的，但 p-value 沒有達到顯著水平，我建議延長實驗。」"
                        ),
                    ]
                ),
                Quest(
                    id: "7-3",
                    name: "Metric 選擇與 Guardrail",
                    description: "實驗要看什麼指標",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "選擇實驗指標",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的指標設計是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "推薦演算法 A/B Test",
                                narrative: "你要測試新的商品推薦演算法。新演算法會推薦更多高價商品。\n\nPM 問你：「這個實驗應該看什麼指標？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Primary: 點擊率（CTR）", explanation: "CTR 只衡量「有沒有點」，不衡量最終價值。新演算法推高價商品，點擊率可能反而更低。"),
                                Challenge.Option(id: "B", text: "Primary: Revenue per user / Guardrail: CTR、加購率、退貨率", explanation: "正確！Primary metric 直接衡量商業價值（revenue）。Guardrail 確保：(1) CTR 沒有大幅下降（用戶還會點）(2) 加購率沒有下降 (3) 退貨率沒有上升（不要推用戶不想要的高價商品然後退貨）。"),
                                Challenge.Option(id: "C", text: "Primary: 曝光次數", explanation: "曝光次數衡量的是推薦有沒有被展示，不是推薦有沒有效果。"),
                                Challenge.Option(id: "D", text: "Primary: 退貨率", explanation: "退貨率是 guardrail（不能變差），不是 primary（想要改善的）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Primary metric 要跟實驗的目標直接相關",
                                "Guardrail 是「不能變差」的指標 — 防止有副作用",
                            ],
                            explanation: "Metric 選擇三層：(1) Primary — 直接衡量實驗目標的指標 (2) Secondary — 輔助理解的指標 (3) Guardrail — 不能變差的指標。推薦演算法的 guardrail 特別要注意退貨率 — 推高價商品如果退貨率上升，反而虧錢。",
                            frameworkTip: "永遠同時設 primary 和 guardrail：「我會用 X 衡量是否改善，用 Y 確保沒有副作用。」"
                        ),
                    ]
                ),
                Quest(
                    id: "7-4",
                    name: "Sample Bias",
                    description: "為什麼你的實驗結果可能是錯的",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別偏差",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個結論最大的問題是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新功能的效果評估",
                                narrative: "產品團隊宣布：「使用我們新搜尋功能的用戶，購買率比不使用的高 40%！新功能超成功！」\n\n你身為 analyst 需要評估這個結論。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "40% 的提升太大了，數據可能有錯", explanation: "提升大不一定代表數據錯。問題在於比較方式，不是數字大小。"),
                                Challenge.Option(id: "B", text: "Selection bias — 主動使用新功能的用戶本來就更活躍，購買意願更高", explanation: "正確！這是典型的 selection bias。主動嘗試新功能的人通常是 power users，他們本來就比一般用戶更可能購買。40% 的差異可能大部分不是功能的效果，而是用戶本身的差異。需要用 A/B test 才能確認因果。"),
                                Challenge.Option(id: "C", text: "樣本量可能不夠", explanation: "即使樣本量夠，結論依然有問題 — 因為兩組用戶不是隨機分配的。"),
                                Challenge.Option(id: "D", text: "應該看 retention 而不是購買率", explanation: "指標選擇可以討論，但核心問題是比較方式有偏差，不是指標選錯。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "使用新功能的用戶和不使用的用戶，他們本身就一樣嗎？",
                                "沒有隨機分流的比較，都有 selection bias 的風險",
                            ],
                            explanation: "Selection bias 是最常見的分析陷阱。非隨機的 self-selected group 之間的比較，無法證明因果關係。使用者選擇用新功能 → 他們可能本來就更活躍。只有 A/B test（隨機分流）才能排除這種偏差。",
                            frameworkTip: "面試中聽到「用了 X 的人比沒用的人表現好」→ 立刻想到 selection bias。"
                        ),
                    ]
                ),
                Quest(
                    id: "7-5",
                    name: "Correlation vs Causation",
                    description: "相關不等於因果",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "相關 vs 因果",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個建議有什麼問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客服和留存的關係",
                                narrative: "數據分析顯示：聯繫過客服的用戶，90 天 retention 率是 75%，沒聯繫過的是 60%。\n\n產品主管提議：「我們應該主動鼓勵用戶聯繫客服，這樣可以提升 retention！」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "沒問題，數據很清楚地支持這個建議", explanation: "數據顯示的是相關性，不是因果關係。主動聯繫客服不一定會提升 retention。"),
                                Challenge.Option(id: "B", text: "聯繫客服可能是 engaged 用戶的行為，不是 retention 高的原因。因果方向可能是反的", explanation: "正確！可能是因為用戶本來就很 engaged（重度使用產品），所以遇到問題會聯繫客服而不是直接離開。是 engagement → 聯繫客服 + 高 retention，而不是 聯繫客服 → 高 retention。強迫用戶聯繫客服不會讓不活躍的用戶突然變活躍。"),
                                Challenge.Option(id: "C", text: "75% vs 60% 的差異可能不顯著", explanation: "統計顯著性是一個考量，但更根本的問題是因果關係。"),
                                Challenge.Option(id: "D", text: "客服成本太高，不划算", explanation: "成本是考量之一，但核心問題是「鼓勵聯繫客服」是否真的能提升 retention。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想看：是「聯繫客服」讓人留下來，還是「留下來的人」本來就更可能聯繫客服？",
                                "相關 ≠ 因果。A 和 B 一起出現，不代表 A 導致 B",
                            ],
                            explanation: "Correlation ≠ Causation 的三種可能：(1) A 導致 B (2) B 導致 A（反向因果）(3) C 同時導致 A 和 B（混淆因子）。這裡「用戶 engagement」可能是混淆因子 — 同時導致「聯繫客服」和「高 retention」。",
                            frameworkTip: "面試中聽到「X 的人比非 X 的人表現好」→ 問：「這是因果還是相關？有沒有 confounding variable？」"
                        ),
                    ]
                ),
                Quest(
                    id: "7-6",
                    name: "Boss: 實驗設計 Case",
                    description: "設計一個完整的驗證計畫",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 實驗設計完整 Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "定價策略 A/B Test",
                                narrative: "你是一家 SaaS 公司的 Product Analyst。公司目前有三個方案：\n• Basic: $29/月（60% 用戶）\n• Pro: $79/月（30% 用戶）\n• Enterprise: $199/月（10% 用戶）\n\nCEO 想測試把 Pro 方案從 $79 改成 $99，看會不會增加 ARPU（Average Revenue Per User）。\n\n他問你：「幫我設計一個 A/B test。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "定價 A/B test 有一個特殊風險：如果被用戶發現，會嚴重損害信任",
                                "短期和長期的影響可能完全相反",
                            ],
                            explanation: "定價 A/B test 是面試中的進階題。關鍵是展示你知道定價測試比一般功能測試更敏感 — 有 PR 風險、信任問題、和 short-term vs long-term 的 trade-off。能討論這些就是 senior level 的思維。",
                            frameworkTip: "實驗設計完整架構：假設 → 指標 → 分流 → 風險 → 結果解讀"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 8: Mock Interview
        World(
            id: 8,
            name: "Mock Interview",
            emoji: "🎯",
            description: "綜合練習：模擬面試 Case Study",
            quests: [
                Quest(
                    id: "8-1",
                    name: "KPI 掉了怎麼查",
                    description: "經典面試題型：指標下降的調查流程",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "面試實戰：指標下降",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商 GMV 下降 20%",
                                narrative: "你正在面試一家電商公司的 Business Analyst 職位。面試官問你：\n\n「我們的 GMV（Gross Merchandise Value）上個月比前個月下降了 20%。你會怎麼分析？」\n\n面試官給了你以下數據：",
                                data: [
                                    ["metric": "GMV", "last_month": "$5.2M", "this_month": "$4.16M", "change": "-20%"],
                                    ["metric": "Orders", "last_month": "52,000", "this_month": "48,000", "change": "-7.7%"],
                                    ["metric": "AOV", "last_month": "$100", "this_month": "$86.7", "change": "-13.3%"],
                                    ["metric": "DAU", "last_month": "180K", "this_month": "175K", "change": "-2.8%"],
                                    ["metric": "Conversion Rate", "last_month": "2.9%", "this_month": "2.7%", "change": "-6.9%"],
                                ],
                                dataCaption: "關鍵指標"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "先把 GMV 拆解成 Orders × AOV，看哪個因素影響比較大",
                                "不要一開始就猜原因，先用數據縮小範圍",
                            ],
                            explanation: "「KPI 掉了」是面試最高頻的題型。完美的回答結構：確認問題 → 拆解指標 → Trend 分析 → Segmentation → 提假設 → 驗證計畫 → 建議行動。",
                            frameworkTip: "Case Answer Framework: Goal → Metrics → Flow → Segment → Recommend → Validate"
                        ),
                    ]
                ),
                Quest(
                    id: "8-2",
                    name: "Feature 成功嗎",
                    description: "經典面試題型：功能評估",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "面試實戰：功能評估",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "Instagram Reels 的成功評估",
                                narrative: "面試官問你：\n\n「假設你是 Instagram 的 Product Analyst。Reels 功能上線 6 個月了，怎麼評估它是否成功？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "先想 Reels 為什麼存在 — Instagram 的戰略目標是什麼？",
                                "考慮功能對整體 app 的影響，不只看功能本身",
                            ],
                            explanation: "大公司的功能評估面試題，關鍵是展示你能從戰略角度思考 — 不只看功能的 usage，還要看對整體產品和商業的影響。特別是 cannibalization 和 trade-off 的討論。",
                            frameworkTip: "大功能評估：目標 → Metrics → Adoption × Engagement × Retention → Cannibalization → Trade-offs"
                        ),
                    ]
                ),
                Quest(
                    id: "8-3",
                    name: "流程怎麼改",
                    description: "經典面試題型：流程改善",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "面試實戰：流程改善",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "客服流程改善",
                                narrative: "面試官問你：\n\n「我們的客服 first response time 是 24 小時，目標是降到 4 小時。但我們不想增加客服人手。你怎麼做？」\n\n目前狀況：\n• 每天約 500 張 ticket\n• 15 位客服人員，每人每天處理 25-30 張\n• 60% 是常見問題（退貨、密碼重設、運送查詢）\n• 40% 需要調查才能回覆\n• 沒有自動分類機制，全部由主管手動指派",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "不能增加人手，那就要想辦法減少「需要人工處理」的 ticket 數量",
                                "60% 是常見問題 — 這是自動化的最大機會",
                            ],
                            explanation: "流程改善面試題的核心：在不增加資源的前提下提升效率。通常答案是 (1) 減少不必要的步驟 (2) 自動化重複性工作 (3) 重新分配資源到高價值活動。",
                            frameworkTip: "流程改善答題結構：現狀分析 → Bottleneck → 改善方案 → 量化預期效果 → 風險管理"
                        ),
                    ]
                ),
                Quest(
                    id: "8-4",
                    name: "Dashboard 設計",
                    description: "經典面試題型：設計一個 dashboard",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "面試實戰：Dashboard 設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 產品的 Executive Dashboard",
                                narrative: "面試官問你：\n\n「假設你是一家 B2B SaaS 公司的 analyst，CEO 要你設計一個 executive dashboard，讓他每天早上花 5 分鐘看就知道公司狀況。你會放什麼？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "CEO 只有 5 分鐘，不能放太多數字",
                                "Dashboard 不只是展示數據，更要讓人看了知道該不該做什麼",
                            ],
                            explanation: "Dashboard 設計面試題的關鍵：(1) 站在 audience 的角度（CEO 要什麼？）(2) 有層次（摘要→細節）(3) 有 actionability（什麼數字代表要行動）。不是堆越多指標越好。",
                            frameworkTip: "Dashboard 設計框架：Audience → Key Questions → Metrics → Layout → Action Triggers"
                        ),
                    ]
                ),
                Quest(
                    id: "8-5",
                    name: "User Segmentation",
                    description: "經典面試題型：使用者分群",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "面試實戰：用戶分群",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "音樂串流 App 的用戶分群",
                                narrative: "面試官問你：\n\n「你是一家音樂串流服務（類似 Spotify）的 Product Analyst。你要幫行銷團隊做用戶分群，讓他們能對不同群體做不同的行銷策略。你會怎麼做？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "分群的目的是讓每個群體收到更相關的內容",
                                "行為分群通常比人口統計分群更有效",
                            ],
                            explanation: "用戶分群面試題的核心：(1) 分群要有目的（為了做什麼？）(2) 行為 > 人口統計 (3) 每個群體要有 actionable 的策略 (4) 分群效果要可驗證。",
                            frameworkTip: "分群四步：選維度 → 描述群體 → 設計策略 → 驗證效果"
                        ),
                    ]
                ),
                Quest(
                    id: "8-6",
                    name: "Boss: 完整模擬面試",
                    description: "全套面試模擬（開放式 + AI 評分）",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss: 模擬面試 — 綜合 Case",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "外送平台的完整 Case Study",
                                narrative: "你正在面試一家外送平台（類似 Uber Eats / foodpanda）的 Business Analyst 職位。\n\n面試官給你一個情境：\n\n「我們發現過去三個月，台北市的訂單完成率（Order Completion Rate）從 95% 下降到 88%。所謂『未完成』是指訂單被取消（用戶取消、餐廳取消、或外送員取消）。\n\n這已經影響到用戶體驗和商家關係。CEO 要你在兩週內提出分析和改善方案。」",
                                data: [
                                    ["month": "10月", "total_orders": "850000", "completed": "807500", "completion_rate": "95.0%"],
                                    ["month": "11月", "total_orders": "880000", "completed": "809600", "completion_rate": "92.0%"],
                                    ["month": "12月", "total_orders": "920000", "completed": "809600", "completion_rate": "88.0%"],
                                ],
                                dataCaption: "台北市訂單完成率趨勢"
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "先拆解：誰取消的？什麼時候取消的？哪裡取消的？",
                                "注意訂單量在增加但完成率在降 — 這暗示供需失衡",
                            ],
                            explanation: "這是完整的面試 Case Study。好的回答需要：(1) 結構化拆解 (2) 多方位分析 (3) 有邏輯的假設 (4) 可執行的建議 (5) 有驗證計畫。展示你能把前 7 個 World 學到的技能串在一起。",
                            frameworkTip: "Case Answer Framework: Goal → Metrics → Flow → Segment → Recommend → Validate — 這就是你的面試武器。"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 27: 需求分析
        World(
            id: 27,
            name: "需求分析",
            emoji: "📋",
            description: "學會把商業需求轉化為明確的功能與非功能需求",
            quests: [
                Quest(
                    id: "27-1",
                    name: "Business Requirements vs User Requirements",
                    description: "分辨 BR 和 UR 的差異與層次關係",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "判斷需求層次",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "「讓業務在手機上查看客戶互動紀錄」屬於哪類需求？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新 CRM 系統上線",
                                narrative: "你是 B2B SaaS 公司的 BA。VP of Sales 說：\n\n「我們需要新 CRM，讓業務在手機上即時查看客戶互動紀錄。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Business Requirement", explanation: "BR 是更高層次目標如「提升成交率」。這句已具體到使用者行為。"),
                                Challenge.Option(id: "B", text: "User Requirement", explanation: "正確！從使用者（業務）角度描述想做的事 = UR。"),
                                Challenge.Option(id: "C", text: "Functional Requirement", explanation: "FR 更技術化，如「API 在 500ms 內回傳互動紀錄」。"),
                                Challenge.Option(id: "D", text: "Non-Functional Requirement", explanation: "NFR 是品質屬性，如「uptime 99.9%」。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BR 是「提升營收」層級；UR 是「使用者想做 X」層級",
                            ],
                            explanation: "需求層次：BR（商業目標）→ UR（使用者需要）→ FR/NFR（系統怎麼做）。",
                            frameworkTip: "需求層次：Business → User → Functional / Non-Functional"
                        ),
                        Challenge(
                            id: 2,
                            name: "從 BR 推導 UR",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪組 UR 最能支持「降低退貨率」？",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商退貨率過高",
                                narrative: "CEO：「退貨率從 8% 升到 15%，下季要降回 10% 以下。」這是明確的 BR。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "① 更詳細產品照片 ② 買家評價 ③ AR 預覽", explanation: "正確！幫客戶購買前做更好決定，從源頭減少退貨。"),
                                Challenge.Option(id: "B", text: "① 頁面載入 < 2s ② 查詢 < 200ms ③ CDN 99%", explanation: "這是 NFR 不是 UR。"),
                                Challenge.Option(id: "C", text: "① 限退貨每月 2 次 ② 收手續費 ③ 縮短退貨窗口", explanation: "限制型策略傷害體驗，應解決根因。"),
                                Challenge.Option(id: "D", text: "① 退貨率降 10% ② 處理時間減半 ③ 客服量減 30%", explanation: "這是 KPI 目標不是 UR。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "UR 從使用者角度出發",
                                "根因：買錯→資訊不足",
                            ],
                            explanation: "從 BR 推導 UR：分析根因（退貨→買錯→資訊不足），再從使用者角度設計解法。",
                            frameworkTip: "BR → 分析根因 → 設計 UR → 每個 UR 可追溯回 BR"
                        ),
                    ]
                ),
                Quest(
                    id: "27-2",
                    name: "Functional vs Non-Functional Requirements",
                    description: "區分系統「做什麼」與「做得多好」",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "分辨 FR 與 NFR",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "哪些是 Non-Functional Requirements？",
                            scenario: 
                            Challenge.Scenario(
                                title: "線上銀行轉帳",
                                narrative: "需求清單：\nA. 設定每日轉帳上限\nB. 頁面載入 ≤ 1.5s\nC. 支援 10,000 筆並發\nD. 查看 90 天轉帳紀錄",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A 和 D", explanation: "A 和 D 是系統要「做什麼」= FR。"),
                                Challenge.Option(id: "B", text: "B 和 C", explanation: "正確！B 是效能需求，C 是可擴展性需求 = NFR。"),
                                Challenge.Option(id: "C", text: "A 和 C", explanation: "A 是 FR（功能），C 是 NFR。"),
                                Challenge.Option(id: "D", text: "B 和 D", explanation: "D 是 FR（查看紀錄是功能）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "FR = 做什麼，NFR = 做得多好",
                            ],
                            explanation: "FR 定義行為，NFR 定義品質。常見 NFR：Performance、Scalability、Security、Availability。",
                            frameworkTip: "FR = What / NFR = How well（PASSME: Performance, Availability, Scalability, Security, Maintainability, Extensibility）"
                        ),
                        Challenge(
                            id: 2,
                            name: "NFR 量化",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個 NFR 最符合 SMART 原則？",
                            scenario: 
                            Challenge.Scenario(
                                title: "搜尋功能 NFR",
                                narrative: "技術主管要你把「搜尋要夠快」量化。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "搜尋結果應盡快回應", explanation: "太模糊無法衡量。"),
                                Challenge.Option(id: "B", text: "API P95 ≤ 300ms，頁面載入 ≤ 1.5s，1,000 concurrent users", explanation: "正確！有指標、百分位、負載條件，可測試。"),
                                Challenge.Option(id: "C", text: "搜尋回應 < 1 秒", explanation: "沒指定 P50/P99、API/頁面、負載。"),
                                Challenge.Option(id: "D", text: "用 Elasticsearch，索引延遲 < 5min", explanation: "指定技術方案不應出現在 NFR。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好的 NFR 必須可衡量可測試",
                            ],
                            explanation: "NFR 要精確：什麼指標 + 什麼條件 + 什麼標準。",
                            frameworkTip: "NFR 公式：[指標] 在 [條件] 下 ≤ [數值]"
                        ),
                    ]
                ),
                Quest(
                    id: "27-3",
                    name: "需求蒐集技巧",
                    description: "用對方法從不同 stakeholder 蒐集需求",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "選擇蒐集方法",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最有效的第一步蒐集方法？",
                            scenario: 
                            Challenge.Scenario(
                                title: "入職系統",
                                narrative: "HR 8 人各有不同流程、IT 需配合、新員工反映混亂、主管覺得慢。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "發問卷", explanation: "HR 只 8 人，問卷無法深入。"),
                                Challenge.Option(id: "B", text: "Job Shadowing", explanation: "好但是第二步。"),
                                Challenge.Option(id: "C", text: "跨部門 Workshop", explanation: "正確！多部門同時討論、發現衝突、建立共識。"),
                                Challenge.Option(id: "D", text: "分析 SOP 文件", explanation: "各自不同做法可能沒統一 SOP。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "多部門不同做法 — 什麼方法能同時處理？",
                            ],
                            explanation: "人少跨部門→Workshop；大規模→問卷；流程不清→觀察；有資料→文件分析。",
                            frameworkTip: "人少跨部門→Workshop / 人多→問卷 / 流程不清→觀察"
                        ),
                        Challenge(
                            id: 2,
                            name: "處理矛盾需求",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 怎麼處理矛盾？",
                            scenario: 
                            Challenge.Scenario(
                                title: "需求衝突",
                                narrative: "HR：「要標準化」\n主管A：「工程師和業務不同」\nIT：「帳號開通要 3 天」\nHR：「第一天就要登入」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓高層決定", explanation: "跳過分析。BA 的價值在於先分析再提方案。"),
                                Challenge.Option(id: "B", text: "分析根源找共同目標提兼顧方案", explanation: "正確！標準化+模組化；提前啟動 IT 流程。"),
                                Challenge.Option(id: "C", text: "全部都做", explanation: "矛盾的需求無法全做。"),
                                Challenge.Option(id: "D", text: "以 HR 為主", explanation: "不能忽略其他利害關係人。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "矛盾背後有共同目標",
                            ],
                            explanation: "BA 處理矛盾：找根源→辨識約束 vs 偏好→找共同目標→設計兼顧方案。",
                            frameworkTip: "識別衝突 → 分析根因 → 找共同目標 → 兼顧方案"
                        ),
                    ]
                ),
                Quest(
                    id: "27-4",
                    name: "User Stories 撰寫",
                    description: "用 INVEST 原則寫高品質 User Stories",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "INVEST 檢驗",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "違反了哪些 INVEST 原則？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Story 品質",
                                narrative: "Story：「As a user, I want the system to be improved, so that it works better.」\nINVEST = Independent, Negotiable, Valuable, Estimable, Small, Testable",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Independent", explanation: "太模糊看不出依賴。"),
                                Challenge.Option(id: "B", text: "Valuable + Estimable + Testable", explanation: "正確！「improved」「better」無法定義價值、估算、測試。"),
                                Challenge.Option(id: "C", text: "Small", explanation: "太模糊連大小都無法判斷。"),
                                Challenge.Option(id: "D", text: "Negotiable", explanation: "太模糊反而什麼都能談。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "「improved」是警示詞 — 無法衡量",
                            ],
                            explanation: "改善版：「As a 業務, I want to see 客戶近 30 天互動紀錄, so that I can prepare before meetings.」",
                            frameworkTip: "INVEST：I 獨立 / N 可協商 / V 有價值 / E 可估算 / S 夠小 / T 可測試"
                        ),
                        Challenge(
                            id: 2,
                            name: "拆解 Epic",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪種拆法最符合 INVEST？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Epic 拆解",
                                narrative: "Epic：「建立客戶自助入口」含：查訂單、退貨、更新個資、發票管理",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按技術層：前端/後端/DB/測試", explanation: "違反 Valuable — 只做前端用戶得不到價值。"),
                                Challenge.Option(id: "B", text: "按功能：查訂單/退貨/更新個資/發票", explanation: "正確！每個獨立、有價值、可估算、可測試。"),
                                Challenge.Option(id: "C", text: "按 Sprint 百分比", explanation: "無意義。50% 前後端什麼都不能用。"),
                                Challenge.Option(id: "D", text: "不拆放一個 Sprint", explanation: "四大功能無法一個 Sprint 完成。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "每個 Story 完成後使用者應獲得可用功能",
                            ],
                            explanation: "按功能拆（垂直切片）確保每個 Story end-to-end 可用。",
                            frameworkTip: "按使用者功能拆（垂直切片），不按技術層拆（水平切片）"
                        ),
                    ]
                ),
                Quest(
                    id: "27-5",
                    name: "Acceptance Criteria 撰寫",
                    description: "用 Given-When-Then 寫可驗證的驗收條件",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Given-When-Then",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個 AC 最好？",
                            scenario: 
                            Challenge.Scenario(
                                title: "退貨功能 AC",
                                narrative: "Story：「As a 客戶, I want to submit a return request online.」\nPM 要求 Given-When-Then。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Given 已登入, When 點退貨, Then 處理退貨", explanation: "太模糊。"),
                                Challenge.Option(id: "B", text: "Given 14天內已完成訂單, When 選訂單提交原因, Then 建立申請+狀態變處理中+確認email", explanation: "正確！有前置條件、觸發、可驗證結果。"),
                                Challenge.Option(id: "C", text: "退貨要好用快速無 bug", explanation: "不是 AC。"),
                                Challenge.Option(id: "D", text: "Given 任何客戶, When 退貨, Then 成功", explanation: "缺限制條件。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Given 定義前置條件",
                                "Then 要 QA 能直接測試",
                            ],
                            explanation: "Given 設場景限制、When 定義動作、Then 描述可驗證結果。",
                            frameworkTip: "AC：Given 前提清楚？→ When 動作明確？→ Then 可驗證？"
                        ),
                        Challenge(
                            id: 2,
                            name: "Edge Case AC",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "哪組 Edge Case AC 最完整？",
                            scenario: 
                            Challenge.Scenario(
                                title: "邊界案例",
                                narrative: "QA Lead：「什麼時候退貨應被拒絕？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "超 14 天不能退 + 已退不能再退", explanation: "兩個邊界不夠完整。"),
                                Challenge.Option(id: "B", text: "① 超期→顯示期限訊息 ② 已退→顯示已申請 ③ 不可退商品→僅顯示可退品 ④ 系統錯誤→保留已填資料", explanation: "正確！涵蓋時間、重複、部分可退、系統異常。"),
                                Challenge.Option(id: "C", text: "全部顯示「失敗請聯繫客服」", explanation: "差的 UX。"),
                                Challenge.Option(id: "D", text: "超期+金額>$1000需審核+理由50字", explanation: "混入不合理限制。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Edge case：超限制、重複、部分適用、系統異常",
                            ],
                            explanation: "完整 AC 涵蓋：業務規則、資料狀態、系統異常、使用者錯誤。",
                            frameworkTip: "Edge Case 四象限：業務規則 / 資料狀態 / 系統異常 / 使用者錯誤"
                        ),
                    ]
                ),
                Quest(
                    id: "27-6",
                    name: "完整需求文件實作",
                    description: "整合所有技能撰寫完整需求文件",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：完整需求文件",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "線上預約系統",
                                narrative: "連鎖診所 BA。電話預約每天 200 通，30% 無人接聽。要建立線上預約系統。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "從 BR 出發",
                                "不同角色的 Story",
                            ],
                            explanation: "完整需求文件串連 BR → Stories → AC → NFR → Edge Cases。",
                            frameworkTip: "BR → Stories (INVEST) → AC (GWT) → NFR (SMART) → Edge Cases"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 28: 利害關係人管理
        World(
            id: 28,
            name: "利害關係人管理",
            emoji: "🤝",
            description: "學會辨識、分析和管理不同利害關係人的期待與影響力",
            quests: [
                Quest(
                    id: "28-1",
                    name: "利害關係人識別",
                    description: "找出專案中所有需要管理的 stakeholder",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "辨識 Sponsor",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "誰最可能是 Project Sponsor？",
                            scenario: 
                            Challenge.Scenario(
                                title: "ERP 升級",
                                narrative: "你負責 ERP 升級。相關人員：\n• CFO（出資者）\n• IT Director（技術實施）\n• 倉庫主管（每天用 ERP）\n• 外部 ERP 顧問",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "IT Director", explanation: "IT 是執行方，Sponsor 是出資和授權的人。"),
                                Challenge.Option(id: "B", text: "CFO", explanation: "正確！Sponsor 有權力和預算推動專案。"),
                                Challenge.Option(id: "C", text: "倉庫主管", explanation: "是重要 end user，但沒有最終決策權。"),
                                Challenge.Option(id: "D", text: "外部顧問", explanation: "顧問是外部資源，不擁有決策權。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sponsor = 出錢 + 有權推動/終止專案",
                            ],
                            explanation: "Stakeholder 角色：Sponsor（出資授權）、SME（專業知識）、End User（使用者）、Decision Maker。",
                            frameworkTip: "Stakeholder 角色：Sponsor / Decision Maker / SME / End User / Influencer"
                        ),
                        Challenge(
                            id: 2,
                            name: "遺漏的 Stakeholder",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這說明什麼常見錯誤？",
                            scenario: 
                            Challenge.Scenario(
                                title: "意外問題",
                                narrative: "ERP 專案兩個月後：\n1. 財務部抱怨報表格式跟銀行不同\n2. 法務說沒符合稅務法規\n3. 外部審計需要審計追蹤功能",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "沒做 Power/Interest Grid", explanation: "漏掉 stakeholder，Grid 也沒用。"),
                                Challenge.Option(id: "B", text: "只關注直接使用者，忽略間接利害關係人和外部約束方", explanation: "正確！財務/法務/審計不每天用系統但有合規需求。"),
                                Challenge.Option(id: "C", text: "訪談不夠", explanation: "根因是沒辨識到這些人。"),
                                Challenge.Option(id: "D", text: "範圍不清", explanation: "根本問題是 stakeholder 分析不完整。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "哪些人不直接用系統但會被影響？",
                            ],
                            explanation: "三圈模型：(1) 直接使用者 (2) 間接利害關係人 (3) 外部約束方。",
                            frameworkTip: "Stakeholder 三圈：直接使用者 → 間接影響者 → 外部約束方"
                        ),
                    ]
                ),
                Quest(
                    id: "28-2",
                    name: "Power/Interest Grid 分析",
                    description: "用二維矩陣決定管理策略",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "定位 Stakeholder",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "CFO 的管理策略？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Grid 分類",
                                narrative: "| Stakeholder | Power | Interest |\n|---|---|---|\n| CFO | 高 | 低 |\n| 倉庫主管 | 低 | 高 |\n| IT Director | 高 | 高 |\n| 客服 | 低 | 低 |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Manage Closely", explanation: "CFO Interest 低，不需密切管理。"),
                                Challenge.Option(id: "B", text: "Keep Satisfied", explanation: "正確！高權力低興趣，定期 executive summary 即可。"),
                                Challenge.Option(id: "C", text: "Keep Informed", explanation: "這是倉庫主管的策略。"),
                                Challenge.Option(id: "D", text: "Monitor", explanation: "這是客服的策略。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Power = 能做決定？Interest = 關心細節？",
                            ],
                            explanation: "Grid 四象限：H/H→密切管理、H/L→保持滿意、L/H→充分溝通、L/L→監控。",
                            frameworkTip: "高權高利→密切管理 / 高權低利→保持滿意 / 低權高利→充分溝通 / 低權低利→監控"
                        ),
                        Challenge(
                            id: 2,
                            name: "Grid 動態調整",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼調整溝通策略？",
                            scenario: 
                            Challenge.Scenario(
                                title: "象限變動",
                                narrative: "CFO 突然 High Interest：預算超支 20%、董事會質疑 ROI。要求每週 1-on-1。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "維持月度報告", explanation: "情況已變，頻率不夠。"),
                                Challenge.Option(id: "B", text: "每天發 email", explanation: "過度溝通，高管時間寶貴。"),
                                Challenge.Option(id: "C", text: "每週 executive briefing + 主動提成本控制方案", explanation: "正確！提高頻率、提供關心的資訊、展示掌控力。"),
                                Challenge.Option(id: "D", text: "請 PM 對接", explanation: "危機時推人會降低信任。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "Grid 是動態的，隨事件改變",
                            ],
                            explanation: "事件會改變 stakeholder 的 interest。BA 要持續監控並調整。",
                            frameworkTip: "Grid 動態：定期重新評估 → 事件驅動調整"
                        ),
                    ]
                ),
                Quest(
                    id: "28-3",
                    name: "溝通計畫制定",
                    description: "設計有效的溝通計畫",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "溝通計畫問題",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最大問題是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "溝通矩陣",
                                narrative: "| 對象 | 頻率 | 方式 |\n|---|---|---|\n| CFO | 每月 | Email |\n| IT | 每天 | 站會 |\n| 倉庫主管 | 需要時 | 電話 |\n| 採購 | 上線前 | 培訓 |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CFO 頻率太低", explanation: "Keep Satisfied 每月可接受。"),
                                Challenge.Option(id: "B", text: "倉庫主管是 High Interest 每日使用者，「需要時」會讓他覺得被忽略", explanation: "正確！高關注的 stakeholder 不能被動式溝通。"),
                                Challenge.Option(id: "C", text: "採購應更早參與", explanation: "是好建議但不是最大問題。"),
                                Challenge.Option(id: "D", text: "IT 不需每天開會", explanation: "敏捷專案每日站會是常見的。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "High Interest 的人最怕「被遺忘」",
                            ],
                            explanation: "溝通計畫要跟 Grid 對齊。High Interest 需定期主動溝通。",
                            frameworkTip: "溝通 5W：Who / When / What / How / Why"
                        ),
                        Challenge(
                            id: 2,
                            name: "壞消息傳達",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "最專業的報告方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "向上管理",
                                narrative: "專案延遲 3 週，下週向 CFO 和 VP 報告。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "先好消息最後輕描淡寫", explanation: "藏壞消息會失去信任。"),
                                Challenge.Option(id: "B", text: "開門見山→原因→補救方案→請求決策", explanation: "正確！直接說事實、解釋原因、提出解法、請求支援。"),
                                Challenge.Option(id: "C", text: "先道歉再列細節", explanation: "高管要「問題影響解法」不是細節。"),
                                Challenge.Option(id: "D", text: "等有完整方案再報", explanation: "延遲報壞消息最危險。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "壞消息+解決方案 遠勝於 藏壞消息",
                            ],
                            explanation: "向上管理：不隱瞞、帶方案報問題、明確需要什麼決策。",
                            frameworkTip: "壞消息結構：事實→影響→原因→方案→請求"
                        ),
                    ]
                ),
                Quest(
                    id: "28-4",
                    name: "期望管理",
                    description: "管理期待避免「驚喜」",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "範圍變更",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的回應？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Scope Creep",
                                narrative: "CFO：「既然升級，順便加 BI 報表？」原本沒有 BI 範圍。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "「沒問題加進去」", explanation: "Scope creep。不調整時間資源會延遲。"),
                                Challenge.Option(id: "B", text: "「讓我評估影響，下週提供 impact analysis 供決策」", explanation: "正確！認可需求→承諾分析→讓 Sponsor 基於資訊決策。"),
                                Challenge.Option(id: "C", text: "「不在範圍不能加」", explanation: "直接拒絕 Sponsor 不明智。"),
                                Challenge.Option(id: "D", text: "「問 IT Director」", explanation: "踢球不專業。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA = 幫助決策不是替人決策",
                            ],
                            explanation: "用 impact analysis 讓 stakeholder 基於完整資訊決策。",
                            frameworkTip: "範圍變更：認可需求 → 分析影響 → 提供選項 → 決策者選"
                        ),
                        Challenge(
                            id: 2,
                            name: "設定合理期望",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "怎麼管理期望？",
                            scenario: 
                            Challenge.Scenario(
                                title: "時間壓力",
                                narrative: "CEO 要 3 個月上線。你評估至少 6 個月。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "答應 3 個月加班趕", explanation: "答應做不到的事最危險。"),
                                Challenge.Option(id: "B", text: "分階段：Q3 核心模組（80% 價值），Q4 進階功能", explanation: "正確！Reframe：3 個月得到 80% 價值。MVP 思維。"),
                                Challenge.Option(id: "C", text: "直說做不到要 6 個月", explanation: "不附替代方案不專業。"),
                                Challenge.Option(id: "D", text: "讓 PM 去談", explanation: "逃避不會讓問題消失。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Reframe：把「不行」變成「更好的做法」",
                            ],
                            explanation: "不說 No 而是 Reframe：提替代方案讓決策者看到更好的路。",
                            frameworkTip: "期望 Reframe：不是「做不到」而是「更好做法是…」+ 數據"
                        ),
                    ]
                ),
                Quest(
                    id: "28-5",
                    name: "衝突解決",
                    description: "處理 stakeholder 之間的衝突",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "利益衝突",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "部門衝突",
                                narrative: "CRM 需求：\n• 業務部：「追蹤個人業績排名」\n• 業務員：「不想讓同事看我的客戶」\n• 管理層：「要完整 pipeline 可見度」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按管理層需求", explanation: "忽略業務員隱私會導致系統抵制。"),
                                Challenge.Option(id: "B", text: "分層權限：業務看自己、主管看團隊、VP 看全部", explanation: "正確！RBAC 解決利益衝突，每方看需要的資訊。"),
                                Challenge.Option(id: "C", text: "投票決定", explanation: "投票解決不了根本問題。"),
                                Challenge.Option(id: "D", text: "不做排名", explanation: "迴避不是解決。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "技術方案常能解決人的衝突",
                            ],
                            explanation: "BA 解決衝突不是選邊站，而是找技術/流程方案兼顧各方。",
                            frameworkTip: "衝突解決：理解各方 → 找共同目標 → 技術/流程兼顧"
                        ),
                        Challenge(
                            id: 2,
                            name: "預算爭奪",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "BA 的角色？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資源競爭",
                                narrative: "行銷要 $200K Marketing Automation，客服要 $150K Help Desk 升級。預算只有 $200K。CEO 要你分析。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "選一個推薦", explanation: "BA 不直接做決定。"),
                                Challenge.Option(id: "B", text: "ROI 分析+策略對齊分析，呈現 trade-off 讓 CEO 做 informed decision", explanation: "正確！中立分析者，用數據把主觀爭論變客觀比較。"),
                                Challenge.Option(id: "C", text: "建議都做但縮減", explanation: "可能是選項之一但不應是唯一建議。"),
                                Challenge.Option(id: "D", text: "讓兩部門自己協調", explanation: "逃避分析責任。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 的價值是「分析和呈現」不是「做決定」",
                            ],
                            explanation: "BA 在衝突中：中立分析者，用數據讓決策者基於事實選擇。",
                            frameworkTip: "BA 在衝突中：收集需求 → 量化分析 → 呈現 trade-off → 決策者選"
                        ),
                    ]
                ),
                Quest(
                    id: "28-6",
                    name: "利害關係人管理策略案例",
                    description: "綜合運用管理技巧",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：策略設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "數位轉型",
                                narrative: "傳統製造公司 BA，負責 ERP+CRM 轉型。\nStakeholders：CEO（推動）、CFO（質疑 ROI）、工廠主管（怕被取代）、IT（人手不足）、一線員工（抗拒）、外部顧問。\n預算 $500K，12 個月。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "不同人「怕什麼」不同",
                                "抗拒通常是怕失去控制或能力不足",
                            ],
                            explanation: "完整管理：分析(Grid)→溝通計畫→衝突預防→Change Management。",
                            frameworkTip: "Stakeholder 管理 = Grid + 溝通 + 衝突處理 + Change Management (ADKAR)"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 29: 商業文件撰寫
        World(
            id: 29,
            name: "商業文件撰寫",
            emoji: "📝",
            description: "掌握 BRD、FRD、會議紀錄等商業文件的撰寫技巧",
            quests: [
                Quest(
                    id: "29-1",
                    name: "BRD 結構與撰寫",
                    description: "學會撰寫 Business Requirements Document",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "BRD 核心章節",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "BRD 最核心的章節是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BRD 結構",
                                narrative: "你要為電商會員忠誠計畫撰寫 BRD。主管說 BRD 要讓非技術決策者看懂。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Technical Architecture", explanation: "技術架構放 Technical Design Doc，不是 BRD。"),
                                Challenge.Option(id: "B", text: "Business Objectives + Scope + Stakeholders + Success Metrics", explanation: "正確！為什麼做→做什麼/不做什麼→誰相關→怎麼衡量成功。"),
                                Challenge.Option(id: "C", text: "Database Schema 和 API Endpoints", explanation: "技術細節屬 FRD 或 Tech Spec。"),
                                Challenge.Option(id: "D", text: "Test Cases 和 UAT Plan", explanation: "測試文件不在 BRD 範圍。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BRD = Business，面向非技術決策者",
                            ],
                            explanation: "BRD 是「為什麼做」和「做什麼」，不是「怎麼做」。讀者是商業決策者。",
                            frameworkTip: "BRD：Background → Objectives → Scope (In/Out) → Stakeholders → Requirements → Metrics → Timeline"
                        ),
                        Challenge(
                            id: 2,
                            name: "Scope In/Out",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼定義 Scope？",
                            scenario: 
                            Challenge.Scenario(
                                title: "範圍定義",
                                narrative: "會員忠誠計畫 BRD。PM 想第一版含：積點、等級、推薦獎勵、個人化推薦、社群功能。你評估 6 個月時限只能做其中一部分。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部放 In-Scope 再看能做多少", explanation: "沒有明確邊界會導致 scope creep。"),
                                Challenge.Option(id: "B", text: "In-Scope：積點+等級（核心價值）；Out-of-Scope：推薦獎勵+個人化+社群（Phase 2）", explanation: "正確！先交付核心價值（積點+等級），其他放 Phase 2。明確寫 Out-of-Scope 防止 scope creep。"),
                                Challenge.Option(id: "C", text: "只寫 In-Scope 不寫 Out-of-Scope", explanation: "不寫 Out-of-Scope 會讓人以為「沒提到的也包含」。"),
                                Challenge.Option(id: "D", text: "讓 PM 自己決定範圍", explanation: "BA 應協助分析並提建議。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Out-of-Scope 跟 In-Scope 一樣重要",
                                "先交付核心價值 = MVP 思維",
                            ],
                            explanation: "Scope 定義要明確寫 In 和 Out。Out-of-Scope 不是「不做」而是「不在這個版本做」。",
                            frameworkTip: "Scope = In-Scope（做什麼）+ Out-of-Scope（不做什麼）+ Assumptions（假設）"
                        ),
                    ]
                ),
                Quest(
                    id: "29-2",
                    name: "FRD 撰寫",
                    description: "把需求轉化成技術可實施的 FRD",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "FRD vs BRD",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下描述最正確的是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "文件差異",
                                narrative: "新人問你：「BRD 和 FRD 有什麼不同？什麼時候寫哪個？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "BRD 和 FRD 是同一份文件的不同名稱", explanation: "完全不同。BRD 面向商業，FRD 面向技術。"),
                                Challenge.Option(id: "B", text: "BRD 定義「為什麼做+做什麼」（面向決策者），FRD 定義「系統怎麼做」（面向開發團隊）", explanation: "正確！BRD 先寫確保商業方向正確，FRD 後寫把需求翻譯成技術規格。"),
                                Challenge.Option(id: "C", text: "FRD 先寫，BRD 後寫", explanation: "順序相反。先確認商業需求（BRD）再寫技術規格（FRD）。"),
                                Challenge.Option(id: "D", text: "小專案不需要 BRD 直接寫 FRD", explanation: "即使小專案也需要釐清「為什麼做」。可以簡化但不能跳過。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BRD 的讀者是誰？FRD 的讀者是誰？",
                            ],
                            explanation: "BRD → FRD 的流程：商業目標 → 使用者需求 → 功能規格 → 技術實施。",
                            frameworkTip: "BRD（Why+What，給決策者）→ FRD（How，給開發者）"
                        ),
                        Challenge(
                            id: 2,
                            name: "FRD 細節程度",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個版本適合放在 FRD？",
                            scenario: 
                            Challenge.Scenario(
                                title: "積點系統 FRD",
                                narrative: "你在寫積點系統的 FRD。BRD 說「客戶消費可累積點數」。你需要在 FRD 中定義具體規則。\n\n以下是你寫的兩個版本：\nV1：「客戶消費時獲得點數」\nV2：「每消費 $1 NTD 獲得 1 點。點數在交易完成後即時入帳。單筆消費 < $100 不累點。點數有效期 12 個月，從獲得日起算。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "V1 — 簡潔明瞭", explanation: "V1 太模糊。開發者不知道：多少消費得多少點？什麼時候入帳？有沒有最低消費？有效期？"),
                                Challenge.Option(id: "B", text: "V2 — 有具體規則和邊界條件", explanation: "正確！FRD 要具體到開發者能直接實作。V2 定義了計算規則、觸發時機、最低門檻、有效期。"),
                                Challenge.Option(id: "C", text: "兩個都太簡單，FRD 要寫程式碼", explanation: "FRD 寫邏輯規則不是程式碼。程式碼是開發者的事。"),
                                Challenge.Option(id: "D", text: "V1 放 FRD，V2 放 Tech Spec", explanation: "V2 的內容正是 FRD 該有的。Tech Spec 會更技術化（API 設計、DB schema）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "FRD 要回答開發者的問題：多少？什麼時候？什麼條件？",
                            ],
                            explanation: "FRD 的黃金標準：開發者讀完後不需要再問 BA 任何問題就能開始寫 code。",
                            frameworkTip: "FRD 檢查：開發者讀完能直接實作嗎？如果還要問問題，就不夠具體。"
                        ),
                    ]
                ),
                Quest(
                    id: "29-3",
                    name: "會議紀錄撰寫",
                    description: "寫出有效的會議紀錄和 Action Items",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "會議紀錄要素",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "會議紀錄最重要的元素是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "需求會議紀錄",
                                narrative: "你剛開完需求討論會議。PM 要你 30 分鐘內發出會議紀錄。會議中討論了很多但也有跑題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "逐字稿 — 記錄每個人說的每句話", explanation: "逐字稿太冗長沒人看。重點是決策和行動。"),
                                Challenge.Option(id: "B", text: "Decisions（決策）+ Action Items（待辦，含負責人和截止日）+ Open Issues（待解決）", explanation: "正確！三個核心：做了什麼決定、誰要做什麼、還有什麼沒解決。"),
                                Challenge.Option(id: "C", text: "出席名單和會議時間", explanation: "這些是基本資訊但不是最重要的。沒有 action items 的會議紀錄是沒用的。"),
                                Challenge.Option(id: "D", text: "完整的討論過程", explanation: "討論過程可以摘要但不是重點。重點是結論和行動。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "會議紀錄的讀者想知道：決定了什麼？我要做什麼？",
                            ],
                            explanation: "會議紀錄核心三元素：Decisions（避免重複討論）、Action Items（確保後續跟進）、Open Issues（明確待解決事項）。",
                            frameworkTip: "會議紀錄 = Decisions + Action Items (Who/What/When) + Open Issues"
                        ),
                        Challenge(
                            id: 2,
                            name: "Action Items 品質",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪些是好的 Action Items？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Action Item 品質",
                                narrative: "你寫的 action items：\n\n① 「研究一下競品」—PM\n② 「John 在 3/15 前提供 API 文件（含 endpoint 清單和 rate limit 規格）」\n③ 「大家想一想下一步」\n④ 「Sarah 在 3/12 前完成使用者訪談（5 位客戶），產出訪談摘要」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "① 和 ③", explanation: "①沒有截止日和具體交付物，③沒有負責人。都不合格。"),
                                Challenge.Option(id: "B", text: "② 和 ④", explanation: "正確！兩者都有：負責人（Who）+ 具體交付物（What）+ 截止日（When）。"),
                                Challenge.Option(id: "C", text: "只有 ②", explanation: "④ 也很好：有負責人、截止日、具體交付物。"),
                                Challenge.Option(id: "D", text: "全部都可以", explanation: "① 和 ③ 太模糊無法追蹤。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好的 AI = Who + What (具體交付物) + When (截止日)",
                            ],
                            explanation: "模糊的 action item 不會被執行。必須具體到能追蹤：誰、做什麼、什麼時候完成。",
                            frameworkTip: "Action Item 公式：[Who] 在 [When] 前完成 [What（具體交付物）]"
                        ),
                    ]
                ),
                Quest(
                    id: "29-4",
                    name: "Status Update 撰寫",
                    description: "寫清楚的進度報告",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "RAG Status",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "各項 RAG 狀態最正確的是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "週報 RAG",
                                narrative: "你的專案週報用 RAG（Red/Amber/Green）狀態：\n\n• Schedule: 延遲 2 天（原計畫 3/15 完成，預計 3/17）\n• Budget: 花了預算的 45%，進度 40%\n• Scope: 需求沒有變更\n• Quality: UAT 發現 3 個 critical bugs",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Schedule🟢 Budget🟢 Scope🟢 Quality🟢", explanation: "忽略了延遲、預算偏差、和 critical bugs。太樂觀。"),
                                Challenge.Option(id: "B", text: "Schedule🟡 Budget🟡 Scope🟢 Quality🔴", explanation: "正確！Schedule 輕微延遲=Amber、Budget 花費超前進度=Amber、Scope 無變更=Green、3 個 critical bugs=Red。"),
                                Challenge.Option(id: "C", text: "全部🔴", explanation: "過度悲觀。Scope 沒問題、Schedule 只延遲 2 天。"),
                                Challenge.Option(id: "D", text: "Schedule🔴 Budget🟢 Scope🟢 Quality🟡", explanation: "2 天延遲不算 Red（通常>1 週才 Red）。3 個 critical bugs 比 Amber 嚴重。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "RAG 要客觀：Green=正常、Amber=有風險、Red=有問題需介入",
                            ],
                            explanation: "RAG 狀態要客觀反映現實。太樂觀會失去信任，太悲觀會造成恐慌。",
                            frameworkTip: "RAG：🟢正常 / 🟡有風險需關注 / 🔴有問題需介入"
                        ),
                        Challenge(
                            id: 2,
                            name: "狀態報告結構",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個格式更適合 Steering Committee？",
                            scenario: 
                            Challenge.Scenario(
                                title: "週報結構",
                                narrative: "你每週五要交一份 Status Update 給 Steering Committee。以下是兩種格式：\n\nA: 「本週做了很多事，開了 5 場會、寫了 3 份文件、跟 IT 確認了架構...」\n\nB: 「Summary: UAT Phase 1 完成 80%。\nAchievements: ① 完成 15/20 test cases ② 修復 2 critical bugs。\nRisks: 3 個 critical bugs 待修，若 3/17 前未修復將影響上線時間。\nNext Week: ① 修復剩餘 bugs ② 開始 Phase 2 testing。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A — 詳細展示工作量", explanation: "高管不關心你多忙，關心的是「進度如何、有什麼風險、需要什麼決策」。"),
                                Challenge.Option(id: "B", text: "B — 摘要+成果+風險+下週計畫", explanation: "正確！結構化報告讓讀者 30 秒內掌握狀況。高管看重結果和風險，不是過程。"),
                                Challenge.Option(id: "C", text: "兩者結合更好", explanation: "A 的細節對 Steering Committee 太多了。"),
                                Challenge.Option(id: "D", text: "口頭報告即可不需文字", explanation: "文字紀錄很重要：可追溯、可分享給缺席者。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "讀者是高管：30 秒內要能掌握狀況",
                            ],
                            explanation: "狀態報告要結構化：Summary→Achievements→Risks→Next Steps。讓讀者快速抓重點。",
                            frameworkTip: "週報結構：Summary → Achievements → Risks/Issues → Next Week Plan"
                        ),
                    ]
                ),
                Quest(
                    id: "29-5",
                    name: "Executive Summary 撰寫",
                    description: "用 SCQA 寫出有說服力的摘要",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SCQA 框架",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 SCQA 最有說服力？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Executive Summary",
                                narrative: "你要為「建立客戶自助服務入口」專案寫 Executive Summary 給 C-Level 看。\n\n你用 SCQA 框架：\nS (Situation): 現況\nC (Complication): 問題\nQ (Question): 關鍵問題\nA (Answer): 建議方案",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "S: 我們想做自助入口 C: 需要預算 Q: 可以嗎 A: 請核准", explanation: "沒有商業理由。「我們想做」不是說服理由。"),
                                Challenge.Option(id: "B", text: "S: 每月 8,000 通客服電話，70% 是查訂單/退貨等可自助完成 C: 每通成本 $15，年花 $144 萬在可自動化的服務上 Q: 如何降低客服成本同時提升體驗 A: 建自助入口，預估年省 $100 萬+客戶滿意度提升", explanation: "正確！有數據（8000通、$15/通、$144萬）、有痛點（成本高）、有解法（自助入口）、有預期效果（省$100萬）。"),
                                Challenge.Option(id: "C", text: "S: 競爭對手都有自助入口 C: 我們沒有 Q: 要不要做 A: 建議做", explanation: "太薄弱。「別人有所以我們要有」不是好的商業論述。"),
                                Challenge.Option(id: "D", text: "S: 技術可行 C: 需要 6 個月開發 Q: 用什麼技術 A: React + Node.js", explanation: "給 C-Level 看技術方案是錯的受眾。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "C-Level 看重：商業影響、ROI、風險",
                            ],
                            explanation: "SCQA 讓 Executive Summary 有邏輯和說服力。關鍵是用數據量化問題和效益。",
                            frameworkTip: "SCQA：Situation（現況）→ Complication（痛點）→ Question（關鍵問題）→ Answer（建議+預期效果）"
                        ),
                        Challenge(
                            id: 2,
                            name: "摘要的長度",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "3 頁的 Executive Summary 有什麼問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "摘要長度",
                                narrative: "你的 BRD 有 20 頁。主管要你加一頁 Executive Summary。你寫了 3 頁。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "沒問題，內容完整最重要", explanation: "Executive 沒時間看 3 頁摘要。如果摘要比正文短不了多少，就失去摘要的意義。"),
                                Challenge.Option(id: "B", text: "太長。Executive Summary 應該 1 頁以內，讓讀者 2 分鐘內掌握重點", explanation: "正確！Summary 的目的是讓忙碌的高管快速決定：(1) 我需要知道什麼 (2) 需要我做什麼決定。超過 1 頁就不是 Summary。"),
                                Challenge.Option(id: "C", text: "應該更長，加更多細節", explanation: "方向相反。摘要要精簡。"),
                                Challenge.Option(id: "D", text: "長度無所謂，格式對就好", explanation: "長度是 Executive Summary 的核心約束。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "「Executive」代表讀者很忙",
                                "Summary 的價值 = 用最少文字傳達最多資訊",
                            ],
                            explanation: "Executive Summary 的黃金法則：1 頁。如果需要更多細節，放在正文的對應章節。",
                            frameworkTip: "Executive Summary = 1 頁（最大挑戰是「砍什麼」而不是「加什麼」）"
                        ),
                    ]
                ),
                Quest(
                    id: "29-6",
                    name: "完整 BRD 案例",
                    description: "撰寫完整的商業需求文件",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：完整 BRD",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商會員忠誠計畫",
                                narrative: "你是電商平台 BA。公司回購率 15%（業界平均 30%），CEO 要在半年內推出會員忠誠計畫。你需要撰寫 BRD。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "先量化問題再提方案",
                                "明確 In/Out Scope",
                            ],
                            explanation: "完整 BRD 讓所有人對齊：為什麼做、做什麼、怎麼衡量成功、有什麼風險。",
                            frameworkTip: "BRD = SCQA + Objectives + Scope + Requirements + Metrics + Risks"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 30: Excel 數據分析
        World(
            id: 30,
            name: "Excel 數據分析",
            emoji: "📊",
            description: "用 Excel 進行商業數據分析：公式、Pivot Table、情境分析",
            quests: [
                Quest(
                    id: "30-1",
                    name: "VLOOKUP / INDEX-MATCH",
                    description: "跨表查詢資料的核心技巧",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "VLOOKUP 限制",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "VLOOKUP 最大的限制是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "跨表查詢",
                                narrative: "你有兩張 Excel 表：\n• 訂單表（Order ID, Customer ID, Amount）\n• 客戶表（Customer ID, Name, Region）\n\n你要在訂單表中帶出客戶名稱。同事建議用 VLOOKUP。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "不能處理數字", explanation: "VLOOKUP 可以處理數字。"),
                                Challenge.Option(id: "B", text: "查詢欄位必須在查詢範圍的最左欄", explanation: "正確！VLOOKUP 只能「向右找」。如果 Customer ID 不在最左邊就查不到。INDEX-MATCH 沒有這個限制。"),
                                Challenge.Option(id: "C", text: "不能跨 Sheet", explanation: "VLOOKUP 可以跨 Sheet。"),
                                Challenge.Option(id: "D", text: "只能精確匹配", explanation: "VLOOKUP 可以做近似匹配（第四個參數 TRUE/FALSE）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "VLOOKUP 的 V = Vertical，只能往右找",
                            ],
                            explanation: "VLOOKUP 限制：查詢值必須在最左欄。INDEX-MATCH 更靈活：INDEX(回傳範圍, MATCH(查詢值, 查詢範圍, 0))，可以往任何方向查。",
                            frameworkTip: "VLOOKUP 往右找 / INDEX-MATCH 任意方向 / XLOOKUP（新版 Excel）最靈活"
                        ),
                        Challenge(
                            id: 2,
                            name: "INDEX-MATCH 實戰",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的 INDEX-MATCH 公式是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "反向查詢",
                                narrative: "你有產品表：\n| Product ID | Name | Category | Price |\n|---|---|---|---|\n| P001 | Widget A | Electronics | $50 |\n| P002 | Gadget B | Home | $30 |\n\n你需要根據 Product Name 查 Product ID（Name 在 ID 的右邊）。VLOOKUP 做不到。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=INDEX(ID欄, MATCH(\"Widget A\", Name欄, 0))", explanation: "正確！MATCH 在 Name 欄找到 \"Widget A\" 的行號，INDEX 用這個行號回傳 ID 欄的值。"),
                                Challenge.Option(id: "B", text: "=VLOOKUP(\"Widget A\", 整個表, 1, FALSE)", explanation: "VLOOKUP 查詢值必須在最左欄，但 Name 不在最左欄。"),
                                Challenge.Option(id: "C", text: "=INDEX(Name欄, MATCH(\"Widget A\", ID欄, 0))", explanation: "查詢範圍和回傳範圍寫反了。MATCH 應在 Name 欄找，INDEX 應回傳 ID 欄。"),
                                Challenge.Option(id: "D", text: "=MATCH(\"Widget A\", Name欄, 0)", explanation: "MATCH 只回傳行號（數字），不是 Product ID 的值。需要搭配 INDEX。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "INDEX(要回傳什麼, 第幾行)",
                                "MATCH(找什麼, 在哪找, 0=精確)",
                            ],
                            explanation: "INDEX-MATCH 兩步驟：MATCH 找位置、INDEX 取值。比 VLOOKUP 靈活因為查詢和回傳範圍可以分開指定。",
                            frameworkTip: "INDEX-MATCH 公式：=INDEX(回傳欄, MATCH(查詢值, 查詢欄, 0))"
                        ),
                    ]
                ),
                Quest(
                    id: "30-2",
                    name: "Pivot Table 樞紐分析",
                    description: "快速彙總和分析大量資料",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Pivot 設計",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Pivot Table 怎麼設定？",
                            scenario: 
                            Challenge.Scenario(
                                title: "銷售分析",
                                narrative: "你有一年的銷售資料（10,000 筆）：Date, Region, Product, Sales Rep, Amount。\n\n主管問：「每個區域每季的銷售額是多少？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Rows: Date, Columns: Region, Values: Sum of Amount", explanation: "如果用原始 Date 當 Row，會有 365 行太細了。需要先 group by 季度。"),
                                Challenge.Option(id: "B", text: "Rows: Region, Columns: Quarter (grouped from Date), Values: Sum of Amount", explanation: "正確！Region 放 Row、Date group by Quarter 放 Column、Amount 用 Sum。一目了然。"),
                                Challenge.Option(id: "C", text: "Rows: Product, Columns: Sales Rep, Values: Sum of Amount", explanation: "這會回答「每個產品每個業務的銷售」，不是主管問的。"),
                                Challenge.Option(id: "D", text: "Rows: Region, Values: Count of Amount", explanation: "Count 算的是「幾筆」不是「多少錢」。而且沒有季度維度。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "先想「主管要看什麼」再設計 Pivot",
                                "Date 可以 group by 月/季/年",
                            ],
                            explanation: "Pivot Table 設計從問題出發：「每個區域」= Row，「每季」= Column (grouped)，「銷售額」= Sum of Values。",
                            frameworkTip: "Pivot 設計：問題的「每個 X」= Rows，「每個 Y」= Columns，「什麼數字」= Values + 聚合方式"
                        ),
                        Challenge(
                            id: 2,
                            name: "Pivot 進階分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最適合的分析方式是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "業績分析",
                                narrative: "Pivot 結果顯示：\n\n| Region | Q1 | Q2 | Q3 | Q4 |\n|---|---|---|---|---|\n| 北部 | $500K | $520K | $480K | $600K |\n| 中部 | $300K | $310K | $290K | $280K |\n| 南部 | $200K | $180K | $350K | $400K |\n\n主管問：「哪個區域成長最快？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "看 Q4 金額最大的區域", explanation: "Q4 最大是北部（$600K），但那可能只是基數大。成長看的是變化率。"),
                                Challenge.Option(id: "B", text: "計算每個區域 Q1 到 Q4 的成長率", explanation: "正確！北部: (600-500)/500=20%、中部: (280-300)/300=-7%、南部: (400-200)/200=100%。南部成長最快（+100%）。"),
                                Challenge.Option(id: "C", text: "看總額最大的區域", explanation: "總額最大只代表「最大」不代表「成長最快」。"),
                                Challenge.Option(id: "D", text: "看每季平均", explanation: "平均會掩蓋趨勢。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "「成長最快」= 變化率，不是絕對值",
                                "成長率 = (末-初)/初",
                            ],
                            explanation: "「最大」和「成長最快」是不同問題。分析時要區分絕對值 vs 變化率。南部從 $200K → $400K 成長 100%。",
                            frameworkTip: "數據分析：先確認問題是問「最大值」還是「最大變化率」"
                        ),
                    ]
                ),
                Quest(
                    id: "30-3",
                    name: "常用公式與函數",
                    description: "條件統計、邏輯函數、文字處理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "條件統計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "應該用什麼公式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "COUNTIFS/SUMIFS",
                                narrative: "你有客服 ticket 資料：\n| Ticket ID | Category | Priority | Resolution Time (hr) |\n\n主管問：「高優先級（Priority = High）的 Bug 類 ticket 平均解決時間是多少？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=AVERAGE(Resolution Time)", explanation: "這會算所有 ticket 的平均，沒有篩選條件。"),
                                Challenge.Option(id: "B", text: "=AVERAGEIFS(Resolution Time, Priority, \"High\", Category, \"Bug\")", explanation: "正確！AVERAGEIFS 可以同時設多個條件。只計算 Priority=High AND Category=Bug 的平均。"),
                                Challenge.Option(id: "C", text: "=SUMIF(Priority, \"High\", Resolution Time)", explanation: "SUMIF 只能一個條件，而且算的是「總和」不是「平均」。"),
                                Challenge.Option(id: "D", text: "先 Filter 再 AVERAGE", explanation: "可以但不夠效率。如果資料更新了還要重新 filter。AVERAGEIFS 是動態的。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "多條件 = 用 IFS 系列函數",
                                "AVERAGEIFS, COUNTIFS, SUMIFS 都支援多條件",
                            ],
                            explanation: "IFS 系列函數（SUMIFS, COUNTIFS, AVERAGEIFS）支援多條件統計，是 BA 最常用的 Excel 函數。",
                            frameworkTip: "統計函數：SUMIFS（條件加總）/ COUNTIFS（條件計數）/ AVERAGEIFS（條件平均）"
                        ),
                        Challenge(
                            id: 2,
                            name: "邏輯函數",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最佳公式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "IF 巢狀",
                                narrative: "你要根據客戶年消費額分級：\n• >= $100K → VIP\n• >= $50K → Gold\n• >= $10K → Silver\n• < $10K → Basic",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=IF(A1>=100000,\"VIP\",IF(A1>=50000,\"Gold\",IF(A1>=10000,\"Silver\",\"Basic\")))", explanation: "正確！巢狀 IF 從最大值往下判斷。順序很重要：先判斷 VIP 再 Gold 再 Silver 最後 Basic。"),
                                Challenge.Option(id: "B", text: "=IF(A1>=10000,\"Silver\",IF(A1>=50000,\"Gold\",IF(A1>=100000,\"VIP\",\"Basic\")))", explanation: "順序錯！$100K 的客戶會先被判定為 Silver（因為也 >= $10K）。IF 要從最大值開始判斷。"),
                                Challenge.Option(id: "C", text: "四個獨立的 IF 公式", explanation: "四個獨立 IF 會衝突：$100K 客戶同時符合所有條件。"),
                                Challenge.Option(id: "D", text: "=VLOOKUP(A1, 級距表, 2, TRUE)", explanation: "近似匹配 VLOOKUP 也可以做到，但級距表要從小到大排列。不如 IF 直覺。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "巢狀 IF 順序很重要：從最嚴格的條件開始",
                            ],
                            explanation: "巢狀 IF 要從最大/最嚴格的條件開始判斷。新版 Excel 可用 IFS 函數更清楚。",
                            frameworkTip: "巢狀 IF 順序：從最嚴格→最寬鬆（或用 IFS / SWITCH 更清楚）"
                        ),
                    ]
                ),
                Quest(
                    id: "30-4",
                    name: "資料清理技巧",
                    description: "處理髒資料：重複、空值、格式不一",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "識別髒資料",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最應該先處理的是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料品質",
                                narrative: "你收到一份客戶資料，快速掃描發現：\n\n• 姓名欄：「John Smith」「john smith」「 John Smith 」（前後有空格）\n• 日期欄：「2024/3/15」「Mar 15, 2024」「15-03-2024」\n• 金額欄：「$1,000」「1000」「1,000.00」\n• Email 欄：有 15% 空值",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "空值 — 補齊所有缺失的 email", explanation: "空值需要處理但不一定最急。日期和金額的格式不一致會導致計算錯誤。"),
                                Challenge.Option(id: "B", text: "日期和金額格式統一 — 因為格式不一致會導致排序、計算、篩選全部出錯", explanation: "正確！格式不一致的數值/日期欄位會讓所有後續分析出錯。Excel 可能把文字格式的日期當成字串，計算會是錯的。"),
                                Challenge.Option(id: "C", text: "姓名大小寫 — 因為最容易修", explanation: "容易修不代表最重要。姓名大小寫通常不影響分析。"),
                                Challenge.Option(id: "D", text: "全部同時處理", explanation: "有優先級比較好。先處理會影響計算正確性的問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "什麼問題會讓後續分析「算出錯的結果」？",
                            ],
                            explanation: "資料清理優先級：(1) 會導致計算錯誤的（格式不一致）(2) 會影響分析結果的（重複值）(3) 美觀問題（大小寫、空格）。",
                            frameworkTip: "清理優先級：影響計算正確性 > 影響分析結果 > 美觀/一致性"
                        ),
                        Challenge(
                            id: 2,
                            name: "清理工具",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "一個公式解決所有問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "清理步驟",
                                narrative: "客戶名稱欄有多種問題：\n• 前後空格：「 Apple Inc 」\n• 大小寫不一：「apple inc」「APPLE INC」\n• 多餘空格：「Apple  Inc」（兩個空格）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "=TRIM(A1)", explanation: "TRIM 去前後空格和多餘空格，但不處理大小寫。"),
                                Challenge.Option(id: "B", text: "=UPPER(A1)", explanation: "UPPER 統一大寫，但不處理空格。"),
                                Challenge.Option(id: "C", text: "=PROPER(TRIM(A1))", explanation: "正確！TRIM 先去空格，PROPER 再把每個單字首字母大寫。「 apple  inc 」→「Apple Inc」。"),
                                Challenge.Option(id: "D", text: "=SUBSTITUTE(A1,\" \",\"\")", explanation: "這會移除所有空格：「AppleInc」，不是我們要的。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "函數可以巢狀：由內到外執行",
                                "TRIM 處理空格，PROPER 處理大小寫",
                            ],
                            explanation: "公式巢狀是資料清理的利器。TRIM→PROPER 是經典組合。更複雜的可加 SUBSTITUTE。",
                            frameworkTip: "清理名稱：=PROPER(TRIM(cell)) / 清理數字：去除 $ 和 , → VALUE()"
                        ),
                    ]
                ),
                Quest(
                    id: "30-5",
                    name: "Scenario Analysis 情境分析",
                    description: "用 Excel 做 What-If 分析",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What-If 分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "降價 20% 後的月營收是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "定價分析",
                                narrative: "你是電商 BA，要分析不同定價對營收的影響：\n\n目前：單價 $100，月銷量 1,000 件，營收 $100K\n\n市場研究顯示：價格每降 10%，銷量增加 15%。\n\n主管問：「降價 10% 和 20% 對營收的影響？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "$80K（$80 × 1,000）", explanation: "忘了考慮銷量增加。降價會帶來更多銷量。"),
                                Challenge.Option(id: "B", text: "$104K（$80 × 1,300）", explanation: "正確！單價 $100→$80（降 20%），銷量 1,000→1,300（增 30%，因為每降 10% 增 15%，降 20% 增 30%）。$80 × 1,300 = $104K。營收反而增加了！"),
                                Challenge.Option(id: "C", text: "$115K（$100 × 1,150）", explanation: "沒有降價。"),
                                Challenge.Option(id: "D", text: "$92K（$80 × 1,150）", explanation: "銷量增加算錯了。降 20% 應該增加 30%。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "降 20% = 降 10% × 2 次，銷量增加 15% × 2 = 30%",
                                "營收 = 單價 × 銷量",
                            ],
                            explanation: "Scenario Analysis 的價值：直覺可能認為降價=少賺，但量化分析後發現降價反而增收。這就是 data-driven decision making。",
                            frameworkTip: "What-If 分析：改變一個變數 → 看對結果的影響 → 比較多個情境"
                        ),
                        Challenge(
                            id: 2,
                            name: "Sensitivity 分析",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Sensitivity Analysis 最核心的目的是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "敏感度分析",
                                narrative: "繼續定價分析。你建了 Excel 模型但主管質疑：「你怎麼知道降 10% 就增 15% 銷量？這個假設可靠嗎？」\n\n你決定做 Sensitivity Analysis：測試不同的「價格彈性」假設。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "找出最精確的預測數字", explanation: "Sensitivity Analysis 不是要找精確數字，而是要了解假設改變時結果會怎麼變。"),
                                Challenge.Option(id: "B", text: "測試「假設錯了」的情況下，結論是否仍然成立", explanation: "正確！如果「降 10% 增 15% 銷量」改成「降 10% 增 10% 銷量」，結論會變嗎？如果在多數假設下結論都成立，決策就更有信心。"),
                                Challenge.Option(id: "C", text: "讓 Excel 模型更複雜", explanation: "複雜不等於更好。Sensitivity Analysis 是測試穩健性。"),
                                Challenge.Option(id: "D", text: "給主管看我們做了很多分析", explanation: "目的是提供決策信心，不是展示工作量。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sensitivity = 「如果我的假設錯了呢？」",
                                "好的分析要能承受假設的變化",
                            ],
                            explanation: "Sensitivity Analysis 是問「如果假設錯了，結論還成立嗎？」如果結論在多數情境下都成立，就是 robust 的建議。",
                            frameworkTip: "Sensitivity Analysis：Best Case / Base Case / Worst Case — 結論在哪些情境下成立？"
                        ),
                    ]
                ),
                Quest(
                    id: "30-6",
                    name: "完整分析案例",
                    description: "用 Excel 完成完整的商業分析",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：Excel 分析",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商月度業績",
                                narrative: "你是電商 BA，收到上個月的銷售資料（5,000 筆訂單）。CFO 要你在明天的月會上報告：\n\n「上個月業績如何？有什麼趨勢？有什麼建議？」\n\n你有的欄位：Order Date, Customer ID, Product Category, Region, Amount, Discount, Shipping Cost。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "從「CFO 想知道什麼」出發設計分析",
                                "比較很重要：vs 上月、vs 去年同期",
                            ],
                            explanation: "完整的 Excel 分析：從商業問題出發 → 設計 Pivot → 計算指標 → 視覺化 → 洞察和建議。",
                            frameworkTip: "分析流程：商業問題 → 資料準備 → Pivot/指標 → 圖表 → 洞察 → 建議"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 31: BI 工具與 Dashboard
        World(
            id: 31,
            name: "BI 工具與 Dashboard",
            emoji: "📈",
            description: "設計有效的 Dashboard 和資料視覺化，讓數據說話",
            quests: [
                Quest(
                    id: "31-1",
                    name: "Dashboard 設計原則",
                    description: "設計讓人看得懂、能行動的 Dashboard",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "設計目標",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "PM 的回答有什麼問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Dashboard 目的",
                                narrative: "PM 要你設計一個產品 Dashboard。你問：「這個 Dashboard 要給誰看？他們看完要做什麼？」\n\nPM 說：「給所有人看，越多資訊越好。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "沒問題，資訊越多越好", explanation: "資訊越多反而越沒人看。沒有焦點的 Dashboard 是無效的。"),
                                Challenge.Option(id: "B", text: "「給所有人」= 沒有明確受眾，「越多越好」= 沒有焦點。好的 Dashboard 要有明確的受眾和目的。", explanation: "正確！Dashboard 設計第一步：Who（誰看）→ Why（他們要做什麼決策）→ What（需要什麼資訊）。不同受眾需要不同的 Dashboard。"),
                                Challenge.Option(id: "C", text: "應該只給高管看", explanation: "不一定只給高管。重點是要有明確的受眾。"),
                                Challenge.Option(id: "D", text: "應該先選 BI 工具再設計", explanation: "工具是最後選的。先確定需求和設計。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Dashboard 設計從「誰看」開始",
                                "不同角色需要不同層級的資訊",
                            ],
                            explanation: "Dashboard 設計三問：(1) 誰是受眾？(2) 他們需要做什麼決策？(3) 需要什麼資訊來做決策？",
                            frameworkTip: "Dashboard 設計：Audience → Decision → Metrics → Layout → Action Triggers"
                        ),
                        Challenge(
                            id: 2,
                            name: "資訊層次",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼改善？",
                            scenario: 
                            Challenge.Scenario(
                                title: "層次設計",
                                narrative: "你設計了一個 Executive Dashboard 放了 25 個指標。CEO 說：「太多了，我不知道要看哪裡。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "字體放大讓每個指標更顯眼", explanation: "不是視覺問題，是資訊架構問題。25 個指標太多了。"),
                                Challenge.Option(id: "B", text: "分層設計：第一層 4-6 個關鍵指標 + 異常警示，第二層可下鑽看細節", explanation: "正確！認知負荷原則：人一次能處理 5-7 個資訊。第一層給結論，需要深入時再下鑽。"),
                                Challenge.Option(id: "C", text: "把 25 個分成 5 頁", explanation: "分頁只是把問題分散，CEO 還是要看 25 個指標。"),
                                Challenge.Option(id: "D", text: "讓 CEO 自己選要看哪些", explanation: "CEO 不應該花時間配置 Dashboard。BA 應該知道什麼最重要。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "人一次能處理 5-7 個資訊",
                                "分層：摘要→細節→原始資料",
                            ],
                            explanation: "好的 Dashboard 是金字塔結構：頂層 KPI（一眼看出好不好）→ 中層趨勢（怎麼變的）→ 底層明細（為什麼）。",
                            frameworkTip: "Dashboard 金字塔：L1 KPI Cards → L2 趨勢圖 → L3 可下鑽明細"
                        ),
                    ]
                ),
                Quest(
                    id: "31-2",
                    name: "KPI 視覺化",
                    description: "選擇正確的方式呈現 KPI",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "KPI Card 設計",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "哪個設計最好？",
                            scenario: 
                            Challenge.Scenario(
                                title: "KPI 呈現",
                                narrative: "你要在 Dashboard 上顯示「本月營收 $2.5M」。以下是四種設計：\n\nA: 只顯示 $2.5M\nB: $2.5M + 上月 $2.3M\nC: $2.5M ↑8.7% vs 上月 + 綠色箭頭\nD: $2.5M ↑8.7% vs 上月 + 目標達成率 96% + 迷你趨勢圖",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A — 簡潔", explanation: "太少資訊。$2.5M 是好是壞？沒有比較基準無法判斷。"),
                                Challenge.Option(id: "B", text: "B — 有比較", explanation: "有比較但需要讀者自己算變化率。"),
                                Challenge.Option(id: "C", text: "C — 有比較和變化率", explanation: "不錯但缺少目標對比。知道成長了，但有沒有達標？"),
                                Challenge.Option(id: "D", text: "D — 有比較、變化率、目標、趨勢", explanation: "正確！完整的 KPI Card：數值+變化+目標+趨勢。讀者一眼就知道：現在多少、好不好、有沒有達標、趨勢往哪走。"),
                            ],
                            correctAnswer: "D",
                            hints: [
                                "好的 KPI 要能回答：多少？好不好？達標嗎？趨勢？",
                            ],
                            explanation: "KPI Card 四要素：Current Value + Change vs Previous + Target Achievement + Trend。讓讀者不需要思考就能判斷。",
                            frameworkTip: "KPI Card = 數值 + 變化率 + 目標達成 + 迷你趨勢圖"
                        ),
                        Challenge(
                            id: 2,
                            name: "顏色與警示",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的改善方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "異常警示",
                                narrative: "你的 Dashboard 有 6 個 KPI。目前全部都用藍色。主管說：「我看不出哪些需要注意。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "每個 KPI 用不同顏色", explanation: "太花俏。彩色不代表有意義。顏色應該傳達資訊，不是裝飾。"),
                                Challenge.Option(id: "B", text: "根據達標狀況用語意色彩：達標→綠、接近→黃、未達→紅", explanation: "正確！紅黃綠是通用的語意色彩。讀者一眼就知道哪裡需要注意。配合閾值設定：>100%→綠、80-100%→黃、<80%→紅。"),
                                Challenge.Option(id: "C", text: "全部用紅色更醒目", explanation: "全紅色會造成「哭狼效應」。如果什麼都紅，就沒有什麼是特別需要注意的。"),
                                Challenge.Option(id: "D", text: "加 emoji 表示好壞", explanation: "Emoji 在正式 Dashboard 中不太專業。語意色彩更通用。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "顏色要傳達資訊，不是裝飾",
                                "紅黃綠是通用的「需要注意」信號",
                            ],
                            explanation: "語意色彩（Semantic Colors）讓 Dashboard 自己說話。關鍵是定義明確的閾值，而不是主觀判斷。",
                            frameworkTip: "顏色規則：🟢達標 🟡接近（需關注）🔴未達（需行動）— 閾值要事先定義"
                        ),
                    ]
                ),
                Quest(
                    id: "31-3",
                    name: "圖表選擇指南",
                    description: "根據資料和目的選擇正確的圖表",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "選擇圖表類型",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下配對哪個最正確？",
                            scenario: 
                            Challenge.Scenario(
                                title: "圖表選擇",
                                narrative: "你有以下資料要視覺化：\n\n① 過去 12 個月的月營收趨勢\n② 各產品類別的營收佔比\n③ 不同區域的業績排名\n④ 營收和客戶數的相關性",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "① 圓餅圖 ② 折線圖 ③ 散佈圖 ④ 長條圖", explanation: "幾乎全反了。圓餅圖看佔比不看趨勢。"),
                                Challenge.Option(id: "B", text: "① 折線圖 ② 圓餅/環形圖 ③ 橫條圖 ④ 散佈圖", explanation: "正確！趨勢→折線、佔比→圓餅/環形、排名→橫條、相關性→散佈。"),
                                Challenge.Option(id: "C", text: "全部用長條圖", explanation: "長條圖萬能但不是最佳選擇。不同目的要用不同圖表。"),
                                Challenge.Option(id: "D", text: "① 面積圖 ② 長條圖 ③ 折線圖 ④ 圓餅圖", explanation: "③ 排名用折線不直覺，④ 相關性用圓餅完全不對。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想要表達什麼決定用什麼圖表",
                            ],
                            explanation: "圖表選擇指南：趨勢→折線、佔比→圓餅/Treemap、比較→長條、排名→橫條、相關→散佈、分佈→直方圖。",
                            frameworkTip: "看趨勢→折線 / 看佔比→圓餅 / 看比較→長條 / 看排名→橫條 / 看相關→散佈"
                        ),
                        Challenge(
                            id: 2,
                            name: "圖表陷阱",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的改善方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "圓餅圖陷阱",
                                narrative: "同事做了一張圓餅圖顯示 8 個產品類別的營收佔比。圖表看起來很擁擠，標籤重疊，3 個類別佔比都在 5% 左右很難分辨。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把圓餅圖放大", explanation: "放大不解決根本問題：8 個 slice 太多，小比例難分辨。"),
                                Challenge.Option(id: "B", text: "改用橫條圖排序，或把 < 10% 的合併為「其他」", explanation: "正確！圓餅圖適合 3-5 個 slice。超過就改用橫條圖（更好比較），或合併小類為「其他」。"),
                                Challenge.Option(id: "C", text: "加 3D 效果讓圖表更好看", explanation: "3D 圓餅圖是最常見的視覺化錯誤之一。3D 會扭曲比例，讓前面的 slice 看起來比較大。"),
                                Challenge.Option(id: "D", text: "用不同的顏色區分", explanation: "8 個不同顏色反而更混亂。問題不在顏色而在結構。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "圓餅圖 slice > 5 就很難讀",
                                "橫條圖排序比圓餅圖更容易比較",
                            ],
                            explanation: "圓餅圖規則：不超過 5 個 slice、避免 3D、slice 之間差異要大。否則改用橫條圖或 Treemap。",
                            frameworkTip: "圓餅圖：≤5 slice / 差異大 / 不用 3D。否則→橫條圖"
                        ),
                    ]
                ),
                Quest(
                    id: "31-4",
                    name: "Data Storytelling 數據敘事",
                    description: "讓數據說出有意義的故事",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "數據敘事",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個是 Data Storytelling？",
                            scenario: 
                            Challenge.Scenario(
                                title: "報告技巧",
                                narrative: "你分析完數據，發現「南部 Q3 營收暴增 80%」。你可以選擇兩種呈現方式：\n\nA: 「南部 Q3 營收 $350K，QoQ +80%。」\n\nB: 「南部 Q3 營收暴增 80%（$195K → $350K），主要來自新開設的 3 家分店。如果 Q4 維持這個成長軌跡，南部全年營收將首次超越中部（$1.13M vs $1.18M），建議增加南部行銷預算。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A — 用數據說話就好", explanation: "A 只有事實沒有故事。讀者要自己想「所以呢？」。"),
                                Challenge.Option(id: "B", text: "B — 有事實、有原因、有未來推測、有建議", explanation: "正確！Data Storytelling = What happened（事實）+ Why（原因）+ So what（影響）+ Now what（建議）。B 把數據變成了可行動的洞察。"),
                                Challenge.Option(id: "C", text: "兩個都是", explanation: "A 是 Data Reporting（報告數字），B 是 Data Storytelling（講故事）。"),
                                Challenge.Option(id: "D", text: "都不是，要有圖表才算", explanation: "圖表是工具不是必要條件。有邏輯的敘事比漂亮的圖表更重要。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Data Reporting = 告訴你發生了什麼",
                                "Data Storytelling = 告訴你為什麼重要、該怎麼做",
                            ],
                            explanation: "Data Storytelling 把數據從「知道」變成「行動」。核心結構：What → Why → So What → Now What。",
                            frameworkTip: "Data Storytelling：What happened → Why → So what (impact) → Now what (action)"
                        ),
                        Challenge(
                            id: 2,
                            name: "避免誤導",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你應該怎麼做？",
                            scenario: 
                            Challenge.Scenario(
                                title: "圖表誤導",
                                narrative: "行銷主管給你一張圖表，Y 軸從 $98K 開始（不是 $0），顯示營收從 $100K 漲到 $105K。視覺上看起來暴漲了 50%，但實際只漲了 5%。\n\n他要你放進月報。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接放進月報", explanation: "這是視覺上的誤導。Y 軸不從 0 開始會誇大變化。BA 要確保資訊的誠實呈現。"),
                                Challenge.Option(id: "B", text: "修正 Y 軸從 0 開始，或在圖表標題/註解中明確標示漲幅是 5%", explanation: "正確！兩個合理做法：(1) Y 軸從 0 開始顯示真實比例 (2) 如果需要放大趨勢，在標題明確寫「漲 5%」讓讀者知道真實幅度。"),
                                Challenge.Option(id: "C", text: "拒絕放圖表", explanation: "不需要拒絕，只需要修正讓它誠實。"),
                                Challenge.Option(id: "D", text: "跟行銷主管說這是他的問題", explanation: "BA 的責任包括確保資料呈現的準確性。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Y 軸不從 0 開始會誇大變化",
                                "BA 的責任：確保資訊誠實呈現",
                            ],
                            explanation: "視覺化的誠信很重要。常見誤導：截斷 Y 軸、不同比例的雙軸圖、cherry-picking 時間範圍。BA 要確保圖表不誤導決策。",
                            frameworkTip: "視覺化誠信：Y 軸從 0 / 標示變化率 / 不 cherry-pick / 標明資料來源"
                        ),
                    ]
                ),
                Quest(
                    id: "31-5",
                    name: "針對不同受眾的 Dashboard",
                    description: "為不同角色設計不同的 Dashboard",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "受眾分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個「大一統」Dashboard 最大的問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "三種受眾",
                                narrative: "你被要求為以下三個角色設計 Dashboard：\n\n• CEO：每天 5 分鐘看公司整體狀況\n• 行銷主管：追蹤行銷活動效果\n• 客服主管：監控客服團隊效率\n\n你設計了一個包含所有指標的大 Dashboard。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "太多指標", explanation: "這是結果不是根因。"),
                                Challenge.Option(id: "B", text: "不同角色需要不同層級的資訊和不同的 action trigger", explanation: "正確！CEO 看 high-level KPI（營收、成長率）。行銷主管看 campaign 細節（CTR、CAC、ROI）。客服主管看 operational 指標（response time、CSAT）。一個 Dashboard 不可能同時服務所有人。"),
                                Challenge.Option(id: "C", text: "需要更好的 BI 工具", explanation: "工具不是問題，設計思維才是。"),
                                Challenge.Option(id: "D", text: "沒問題，一個就夠", explanation: "一個 Dashboard 試圖服務所有人 = 沒有服務好任何人。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "CEO 看的 vs 主管看的 vs 執行者看的完全不同",
                            ],
                            explanation: "Dashboard 層次：Strategic（CEO，月/季度）→ Tactical（主管，週）→ Operational（執行者，每日/即時）。",
                            frameworkTip: "Dashboard 三層：Strategic（高管/KPI）→ Tactical（主管/趨勢）→ Operational（執行者/即時）"
                        ),
                        Challenge(
                            id: 2,
                            name: "自助分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的解決方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "互動式 Dashboard",
                                narrative: "行銷主管用了你的 Dashboard 一週後說：「我常常想看不同時間範圍和不同 campaign 的數據，但每次都要找你幫忙改。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把所有可能的組合都做成不同頁面", explanation: "組合太多不可能全做。而且維護成本很高。"),
                                Challenge.Option(id: "B", text: "加入 Filter（篩選器）：時間範圍、Campaign、Channel 等，讓使用者自助探索", explanation: "正確！互動式 Dashboard 讓使用者自行篩選，減少對 BA 的依賴。關鍵是選對 filter 維度（使用者最常問的切角）。"),
                                Challenge.Option(id: "C", text: "教她用 SQL 自己查", explanation: "行銷主管不一定會 SQL。Dashboard 的目的就是讓非技術人員自助。"),
                                Challenge.Option(id: "D", text: "每週定期提供不同角度的報告", explanation: "定期報告無法滿足臨時的分析需求。自助是更好的做法。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好的 Dashboard = 回答已知問題 + 支援探索新問題",
                            ],
                            explanation: "Dashboard 兩個價值：(1) 監控（固定 KPI）(2) 探索（互動式篩選）。Filter 設計要基於使用者最常問的問題。",
                            frameworkTip: "Dashboard = 固定 KPI（監控）+ 互動 Filter（探索）"
                        ),
                    ]
                ),
                Quest(
                    id: "31-6",
                    name: "Executive Dashboard 完整案例",
                    description: "設計完整的 Executive Dashboard",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：Dashboard 設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS Executive Dashboard",
                                narrative: "你是 B2B SaaS 公司的 BA。CEO 要你設計 Executive Dashboard，讓他每天花 5 分鐘就知道公司狀況。\n\n公司有：$5M ARR、200 家企業客戶、月 churn 2%、NPS 45。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "CEO 只有 5 分鐘",
                                "Dashboard 不只展示數據更要觸發行動",
                            ],
                            explanation: "Executive Dashboard：少即是多。5-6 個 KPI + 清楚的 action trigger。CEO 看完要知道：公司狀況好不好、需不需要做什麼。",
                            frameworkTip: "Executive Dashboard = 5-6 KPIs + Trend + Action Triggers + Drill-down"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 32: 系統分析基礎
        World(
            id: 32,
            name: "系統分析基礎",
            emoji: "🔧",
            description: "BA 必備的系統思維：Workflow、Database、API、整合點",
            quests: [
                Quest(
                    id: "32-1",
                    name: "系統工作流程分析",
                    description: "理解系統的運作流程和資料流向",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "流程圖閱讀",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "流程圖中最重要但常被遺漏的是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商訂單流程",
                                narrative: "你在分析電商訂單流程：\n\n客戶下單 → 付款驗證 → 庫存檢查 → 出貨 → 配送 → 完成\n\n每個步驟如果失敗都有不同的處理方式。你需要畫系統流程圖。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "每步的處理時間", explanation: "時間重要但不是流程圖的核心。"),
                                Challenge.Option(id: "B", text: "例外處理（Exception Handling）— 每步失敗時怎麼辦", explanation: "正確！Happy path 容易畫，但系統 80% 的複雜度在例外處理：付款失敗怎辦？庫存不足怎辦？配送失敗怎辦？"),
                                Challenge.Option(id: "C", text: "負責人", explanation: "負責人重要但流程圖主要是系統行為。"),
                                Challenge.Option(id: "D", text: "顏色和樣式", explanation: "視覺很重要但不是「最常被遺漏」的。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Happy path 只是冰山一角",
                                "系統複雜度 80% 在例外處理",
                            ],
                            explanation: "BA 畫流程圖要同時考慮 Happy Path 和 Exception Path。每個步驟都問：「如果失敗了呢？」",
                            frameworkTip: "流程圖 = Happy Path + Exception Paths + Retry/Rollback 策略"
                        ),
                        Challenge(
                            id: 2,
                            name: "系統邊界",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Context Diagram 最核心的目的是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "系統邊界圖",
                                narrative: "你要為新的訂單管理系統畫 Context Diagram（系統邊界圖）。系統需要跟以下外部系統互動：\n\n• 金流系統（付款處理）\n• 物流 API（查運費、追蹤配送）\n• ERP（庫存同步）\n• CRM（客戶資料）\n• 通知服務（Email/SMS）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "展示系統內部的技術架構", explanation: "內部架構是系統架構圖，不是 Context Diagram。"),
                                Challenge.Option(id: "B", text: "明確「系統邊界」— 什麼在系統內、什麼在系統外、交換什麼資料", explanation: "正確！Context Diagram 回答：(1) 我們的系統做什麼 (2) 跟誰互動 (3) 交換什麼資料。這幫助定義 scope 和整合需求。"),
                                Challenge.Option(id: "C", text: "列出所有 API", explanation: "API 清單是整合設計的細節，不是 Context Diagram 層級。"),
                                Challenge.Option(id: "D", text: "展示使用者介面", explanation: "UI 是前端設計，不是系統邊界。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Context = 上下文/環境",
                                "系統邊界 = Inside vs Outside",
                            ],
                            explanation: "Context Diagram 是 BA 最重要的系統分析工具之一。它明確了：系統做什麼（不做什麼）、跟誰互動、資料流向。",
                            frameworkTip: "Context Diagram：中心 = 我們的系統 / 周圍 = 外部系統和使用者 / 箭頭 = 資料流"
                        ),
                    ]
                ),
                Quest(
                    id: "32-2",
                    name: "資料庫基礎（給 BA 的版本）",
                    description: "理解資料如何儲存和關聯",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Entity 關係",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Customer 和 Order 的關係是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "ER 圖",
                                narrative: "你在分析電商系統的資料模型。有以下 Entity：\n\n• Customer（客戶）\n• Order（訂單）\n• Product（產品）\n• Order_Item（訂單明細）\n\n一個客戶可以有多筆訂單，一筆訂單可以包含多個產品。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "One-to-One（一對一）", explanation: "一個客戶只能有一筆訂單？不合理。"),
                                Challenge.Option(id: "B", text: "One-to-Many（一對多）", explanation: "正確！一個 Customer 可以有多筆 Order（1:N）。在資料庫中，Order 表會有一個 customer_id 欄位指向 Customer。"),
                                Challenge.Option(id: "C", text: "Many-to-Many（多對多）", explanation: "一筆訂單屬於多個客戶？不合理。Order 和 Product 才是多對多（透過 Order_Item）。"),
                                Challenge.Option(id: "D", text: "沒有關係", explanation: "客戶和訂單明顯有關聯。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "一個客戶可以下多筆訂單，但一筆訂單只屬於一個客戶",
                            ],
                            explanation: "資料關係三種：1:1、1:N、M:N。BA 需要理解這些關係來設計需求和驗證資料完整性。M:N 通常需要中間表（如 Order_Item）。",
                            frameworkTip: "資料關係：1:1（護照）/ 1:N（客戶→訂單）/ M:N（訂單↔產品，透過中間表）"
                        ),
                        Challenge(
                            id: 2,
                            name: "資料完整性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這些問題分別對應什麼資料完整性規則？",
                            scenario: 
                            Challenge.Scenario(
                                title: "資料問題",
                                narrative: "系統上線後發現問題：\n\n• 有些 Order 的 customer_id 指向不存在的 Customer\n• 刪除 Customer 後，他的 Order 變成「孤兒資料」\n• Product 價格可以輸入負數\n\n這些問題導致報表出錯。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都是 Bug，要工程師修", explanation: "是 Bug 但更根本的問題是缺乏資料完整性規則。"),
                                Challenge.Option(id: "B", text: "① 參照完整性（Foreign Key）② 刪除規則（CASCADE/RESTRICT）③ 域完整性（Check Constraint）", explanation: "正確！① FK 確保 customer_id 必須存在 ② 刪除規則決定主記錄刪除時從屬記錄怎麼處理 ③ Check 限制值域（price > 0）。BA 在需求中應定義這些規則。"),
                                Challenge.Option(id: "C", text: "全部都是前端驗證問題", explanation: "前端驗證是一道防線，但資料庫層面的約束才是最後的保證。"),
                                Challenge.Option(id: "D", text: "設計問題不是 BA 的責任", explanation: "BA 定義資料規則是核心職責之一。什麼資料可以為空？什麼關係必須存在？刪除時如何處理？"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 要定義：什麼資料必須存在？什麼值合法？刪除時怎麼處理？",
                            ],
                            explanation: "BA 需要在需求中定義資料規則：參照完整性（FK）、域完整性（值域限制）、刪除行為（CASCADE vs RESTRICT）。不要把這些全留給工程師。",
                            frameworkTip: "資料規則 BA 要定義：必填/選填、值域、關聯、刪除行為"
                        ),
                    ]
                ),
                Quest(
                    id: "32-3",
                    name: "API 基礎概念",
                    description: "理解系統間如何透過 API 溝通",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "API 概念",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個比喻最能解釋 API？",
                            scenario: 
                            Challenge.Scenario(
                                title: "什麼是 API",
                                narrative: "你跟 PM 解釋為什麼新系統需要跟物流商的系統整合。PM 問：「API 是什麼？為什麼不能手動處理？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "API 像是兩個系統之間的翻譯員，讓不同語言的系統可以互相溝通", explanation: "還可以但不夠精確。API 更像是「點餐窗口」而不是翻譯。"),
                                Challenge.Option(id: "B", text: "API 像餐廳的菜單和點餐窗口 — 你（系統 A）看菜單（API 文件）知道能點什麼，透過窗口（API endpoint）下單，廚房（系統 B）處理後送餐（回應）", explanation: "正確！這個比喻涵蓋了 API 的核心：文件（菜單）、請求（點餐）、處理（廚房）、回應（送餐）。你不需要知道廚房怎麼運作，只需要知道能點什麼。"),
                                Challenge.Option(id: "C", text: "API 是資料庫", explanation: "完全不同。API 是系統間的溝通介面，資料庫是儲存資料的。"),
                                Challenge.Option(id: "D", text: "API 是一種程式語言", explanation: "API 不是程式語言，是系統間的溝通協議和介面。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "API = Application Programming Interface = 系統間的「溝通介面」",
                            ],
                            explanation: "API 的核心概念：定義了系統之間「能交換什麼資料、用什麼方式」。BA 需要理解 API 來定義整合需求。",
                            frameworkTip: "API = 菜單（文件）+ 點餐窗口（Endpoint）+ 訂單格式（Request）+ 送餐（Response）"
                        ),
                        Challenge(
                            id: 2,
                            name: "REST API 基礎",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 最需要確認的問題是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "HTTP 方法",
                                narrative: "開發者跟你討論 API 設計。他說：\n\n「我們的訂單 API 有四個 endpoint：\n• GET /orders — 查詢訂單\n• POST /orders — 建立新訂單\n• PUT /orders/{id} — 更新訂單\n• DELETE /orders/{id} — 刪除訂單」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用什麼程式語言開發", explanation: "程式語言是開發決策，BA 不需要管。"),
                                Challenge.Option(id: "B", text: "DELETE 訂單時的業務規則 — 什麼情況下可以刪除？已出貨的訂單能刪嗎？刪除後相關資料（付款、物流）如何處理？", explanation: "正確！技術上 DELETE 很簡單，但業務規則很複雜。BA 需要定義：什麼狀態下能刪？軟刪還是硬刪？cascade 影響什麼？"),
                                Challenge.Option(id: "C", text: "伺服器的容量", explanation: "基礎設施是 DevOps 的工作。"),
                                Challenge.Option(id: "D", text: "API 的 URL 命名", explanation: "URL 命名是開發慣例，BA 不需要糾結。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "技術容易做但業務規則難定義",
                                "BA 的價值在於定義「什麼情況下可以/不可以」",
                            ],
                            explanation: "BA 在 API 設計中的角色：定義業務規則。技術團隊知道怎麼做 DELETE，但 BA 要定義什麼時候可以 DELETE、影響什麼、例外處理。",
                            frameworkTip: "BA 在 API 設計中：定義業務規則 / 資料驗證規則 / 錯誤處理 / 權限"
                        ),
                    ]
                ),
                Quest(
                    id: "32-4",
                    name: "系統整合點分析",
                    description: "分析系統之間的整合需求",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "整合模式",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個選項更適合？為什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "即時 vs 批次",
                                narrative: "新訂單管理系統需要跟 ERP 同步庫存資料。有兩個選項：\n\nA. 即時同步（Real-time）：每次下單時呼叫 ERP API 查庫存\nB. 批次同步（Batch）：每小時從 ERP 匯入最新庫存到本地\n\n系統每天約 5,000 筆訂單。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "即時 — 資料永遠最新", explanation: "即時最準確但成本高：5000次/天的 API 呼叫、ERP 如果慢會拖慢下單、ERP 掛了就無法下單。"),
                                Challenge.Option(id: "B", text: "批次 — 效能好且解耦", explanation: "批次效能好但有時間差：最多 1 小時的庫存延遲，可能超賣。"),
                                Challenge.Option(id: "C", text: "混合：高熱銷商品即時查，其他批次同步 + 下單時最終確認", explanation: "正確！混合策略：大部分用批次（效能好、解耦），熱銷品即時查（避免超賣），最終都要有庫存確認機制。兼顧效能和準確性。"),
                                Challenge.Option(id: "D", text: "不需要同步，手動管理", explanation: "每天 5000 單手動管理不現實。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "不是二選一，可以混合",
                                "考慮：效能、準確性、耦合度、失敗處理",
                            ],
                            explanation: "整合設計要權衡多個因素：資料即時性、系統耦合度、效能、失敗處理。混合策略常常是最務實的答案。",
                            frameworkTip: "整合模式選擇：即時（準確但耦合）/ 批次（解耦但延遲）/ 混合（兼顧）"
                        ),
                        Challenge(
                            id: 2,
                            name: "失敗處理",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "BA 應該為這個情境定義什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "整合失敗",
                                narrative: "訂單系統呼叫金流 API 扣款，但金流回應逾時（Timeout）。你不知道扣款到底有沒有成功。\n\n如果直接告訴客戶「付款失敗」，但其實錢已經扣了怎麼辦？\n如果直接告訴客戶「付款成功」，但其實沒扣到怎麼辦？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "告訴開發者修好 timeout 問題", explanation: "Timeout 是必然會發生的。不是 bug 而是需要處理的情境。"),
                                Challenge.Option(id: "B", text: "定義 Timeout 處理流程：先保留訂單為「付款確認中」狀態、背景查詢金流確認結果、確認後更新狀態並通知客戶", explanation: "正確！BA 要定義不確定狀態的處理流程。關鍵是引入中間狀態（「確認中」）讓系統有時間釐清，而不是在不確定的情況下做出承諾。"),
                                Challenge.Option(id: "C", text: "加大 timeout 時間", explanation: "可以減少但無法消除 timeout。而且太長的 timeout 會讓客戶等太久。"),
                                Challenge.Option(id: "D", text: "這是技術問題不是 BA 的事", explanation: "處理流程（使用者看到什麼、系統做什麼）完全是 BA 的事。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不確定的情況→用中間狀態處理",
                                "BA 定義使用者體驗和業務流程，開發者實作",
                            ],
                            explanation: "Timeout 和失敗是整合中必然的情境。BA 要定義：中間狀態、重試邏輯、最終一致性、使用者通知。最危險的是在不確定狀態下做出確定的承諾。",
                            frameworkTip: "整合失敗處理：中間狀態 → 背景確認 → 最終一致 → 通知使用者"
                        ),
                    ]
                ),
                Quest(
                    id: "32-5",
                    name: "認證、角色與權限",
                    description: "定義誰能做什麼",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "AuthN vs AuthZ",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "「登入」和「看權限」分別屬於什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "認證與授權",
                                narrative: "新系統有以下需求：\n\n• 用戶要先登入（帳號密碼 or SSO）\n• 一般員工只能看自己的資料\n• 主管能看整個團隊的資料\n• 管理員可以修改系統設定",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "都是 Authentication", explanation: "Authentication 只是驗證身份（你是誰），不管你能做什麼。"),
                                Challenge.Option(id: "B", text: "登入 = Authentication（你是誰），權限 = Authorization（你能做什麼）", explanation: "正確！AuthN 驗證身份、AuthZ 控制權限。兩者是獨立的概念：你可以成功登入（AuthN 通過）但沒有某個功能的權限（AuthZ 失敗）。"),
                                Challenge.Option(id: "C", text: "都是 Authorization", explanation: "Authorization 是權限控制，登入身份驗證是 Authentication。"),
                                Challenge.Option(id: "D", text: "跟 BA 無關", explanation: "BA 需要定義：誰能存取什麼、角色有哪些、每個角色的權限。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Authentication = 你是誰",
                                "Authorization = 你能做什麼",
                            ],
                            explanation: "AuthN 和 AuthZ 是兩個不同層次。BA 通常需要定義：角色清單、每個角色的權限矩陣、特殊規則（如資料隔離）。",
                            frameworkTip: "AuthN（你是誰）→ AuthZ（你能做什麼）→ RBAC（角色-權限矩陣）"
                        ),
                        Challenge(
                            id: 2,
                            name: "RBAC 設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下權限矩陣哪個最合理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "權限矩陣",
                                narrative: "你要設計 CRM 系統的權限。角色：\n\n• Sales Rep（業務）\n• Sales Manager（主管）\n• Admin（管理員）\n\n功能：查看客戶、編輯客戶、查看報表、匯出資料、管理使用者",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "三個角色都有所有權限", explanation: "完全沒有權限控制。Sales Rep 不應該能管理使用者。"),
                                Challenge.Option(id: "B", text: "Rep: 查看+編輯(自己的), Manager: 查看+編輯(團隊)+報表, Admin: 全部", explanation: "正確！最小權限原則：每個角色只有完成工作所需的最小權限。Rep 只看自己的、Manager 看團隊、Admin 才有管理權。"),
                                Challenge.Option(id: "C", text: "Rep 沒有任何權限", explanation: "業務是主要使用者，完全沒權限系統就沒用了。"),
                                Challenge.Option(id: "D", text: "只有 Admin 有權限，其他人看不到", explanation: "這讓系統無法使用。權限是分級的不是全有或全無。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "最小權限原則：只給完成工作需要的權限",
                                "注意資料隔離：Rep 只看自己的",
                            ],
                            explanation: "RBAC 設計核心：最小權限原則。BA 需要產出權限矩陣（角色 × 功能 × 操作），並定義資料範圍（自己的、團隊的、全部的）。",
                            frameworkTip: "RBAC 矩陣：角色 × 功能 × CRUD + 資料範圍（自己/團隊/全部）"
                        ),
                    ]
                ),
                Quest(
                    id: "32-6",
                    name: "系統分析綜合案例",
                    description: "完整的系統分析練習",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：系統分析",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "線上預約系統",
                                narrative: "你要設計一個線上預約系統（餐廳/診所/美髮都適用）。系統需要跟以下外部系統整合：\n• 行事曆（Google Calendar/Outlook）\n• 簡訊服務（提醒通知）\n• 金流（預收訂金）\n• 現有 POS 系統（同步客戶資料）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Context Diagram 先畫系統邊界",
                                "想想每個整合點失敗時怎麼辦",
                            ],
                            explanation: "系統分析 = 邊界(Context) + 資料(Entity) + 整合(API) + 安全(權限) + 例外處理。",
                            frameworkTip: "系統分析五面向：邊界 / 資料模型 / 整合 / 安全 / 例外處理"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 33: Agile BA 實戰
        World(
            id: 33,
            name: "Agile BA 實戰",
            emoji: "🏃",
            description: "在敏捷環境中發揮 BA 價值：Scrum、User Story、Backlog",
            quests: [
                Quest(
                    id: "33-1",
                    name: "Agile 核心觀念",
                    description: "理解敏捷宣言和 BA 在敏捷中的角色",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Agile vs Waterfall",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Agile 中 BA 的角色有什麼不同？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA 角色差異",
                                narrative: "你從 Waterfall 專案轉到 Scrum 團隊。以前你花 3 個月寫完整 BRD 再交給開發。現在 Scrum Master 說：「我們不需要完整 BRD，用 User Stories 就好。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "BA 在 Agile 中不需要了", explanation: "BA 在 Agile 中更重要，只是工作方式不同。"),
                                Challenge.Option(id: "B", text: "從「前期寫完整文件」變成「持續釐清需求、拆分 Story、跟團隊協作」", explanation: "正確！Agile BA 不是不做分析，而是持續地、迭代地做分析。從大文件變成小而精的 User Stories，從一次交付變成每個 Sprint 都交付價值。"),
                                Challenge.Option(id: "C", text: "只寫 User Story 不做分析", explanation: "User Story 是分析的產出之一。BA 還是要做 stakeholder 分析、流程分析、資料分析等。"),
                                Challenge.Option(id: "D", text: "完全不需要文件", explanation: "Agile 不是「不要文件」而是「剛好夠用的文件」。User Story + AC 就是輕量化的需求文件。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Agile 不是「不分析」而是「持續分析」",
                                "BA 從 gatekeeper 變成 facilitator",
                            ],
                            explanation: "Agile BA：持續分析（不是前期全做完）、輕量文件（Story + AC）、跟團隊協作（不是丟文件過牆）。",
                            frameworkTip: "Waterfall BA: 前期分析→文件→交付 / Agile BA: 持續分析→Story→每 Sprint 交付"
                        ),
                        Challenge(
                            id: 2,
                            name: "Sprint 中的 BA",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最有效的時間分配是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Sprint 時間分配",
                                narrative: "你在 2 週的 Sprint 中。團隊在開發 Sprint N 的 Stories。\n\n你應該把時間花在哪裡？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "100% 支援當前 Sprint N 的開發", explanation: "只關注當前 Sprint 會讓下個 Sprint 沒有準備好的 Stories。"),
                                Challenge.Option(id: "B", text: "50% 支援 Sprint N（回答問題、驗收）+ 50% 準備 Sprint N+1 和 N+2 的 Stories", explanation: "正確！Agile BA 要「領先一到兩個 Sprint」。當前 Sprint 回答開發問題+做 UAT，同時準備未來 Sprint 的 Stories 確保 Backlog 是 ready 的。"),
                                Challenge.Option(id: "C", text: "100% 準備未來的 Stories", explanation: "忽略當前 Sprint 會讓開發團隊卡住（需求不清楚時找不到人問）。"),
                                Challenge.Option(id: "D", text: "等 Sprint 結束再開始準備", explanation: "太晚了。Sprint Planning 時如果 Stories 沒準備好，團隊就無法有效規劃。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 要「領先 1-2 個 Sprint」",
                                "同時支援「現在」和「準備未來」",
                            ],
                            explanation: "Agile BA 的時間管理：支援當前 Sprint（釐清問題、驗收）+ 準備未來 Sprint（分析、寫 Story、Refinement）。",
                            frameworkTip: "BA Sprint 時間：50% 當前（支援+驗收）+ 50% 未來（分析+準備 Stories）"
                        ),
                    ]
                ),
                Quest(
                    id: "33-2",
                    name: "User Story 進階",
                    description: "寫出高品質的 User Story",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Story 拆分",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的拆分方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "大 Story 拆分",
                                narrative: "你有一個大 Story：「As a 客戶 I want to 完成購物結帳 so that 我能收到商品。」\n\n開發者估計要 20 點（超過一個 Sprint）。你需要拆分。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按技術層拆：前端、後端、資料庫", explanation: "技術層拆分不是好做法。每個 Story 應該都交付使用者價值，前端 Story 無法獨立使用。"),
                                Challenge.Option(id: "B", text: "按使用者價值拆：① 選擇配送方式 ② 輸入付款資訊 ③ 確認訂單+付款 ④ 收到確認通知", explanation: "正確！每個拆分後的 Story 都是使用者可以感受到的功能片段。垂直切片（Vertical Slice）：每個 Story 都包含前端+後端+資料庫，可以獨立測試和展示。"),
                                Challenge.Option(id: "C", text: "按頁面拆：結帳頁、確認頁、感謝頁", explanation: "比技術層好但仍然不理想。「結帳頁」可能包含太多功能。"),
                                Challenge.Option(id: "D", text: "不拆，下個 Sprint 繼續做", explanation: "跨 Sprint 的 Story 會造成計劃困難和風險。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "好的拆分 = 每個 Story 都能獨立交付使用者價值",
                                "Vertical Slice 包含所有技術層",
                            ],
                            explanation: "Story 拆分原則：按使用者價值（不是技術層）拆分，每個 Story 是 Vertical Slice，可以獨立測試和 demo。",
                            frameworkTip: "Story 拆分：按使用者價值 > 按 Workflow 步驟 > 按業務規則 > 按資料操作（CRUD）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Acceptance Criteria",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這些 AC 缺了什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "AC 品質",
                                narrative: "Story：「As a 客戶 I want to 用信用卡付款 so that 我能完成訂單」\n\n你寫了以下 AC：\nAC1: 可以輸入信用卡號\nAC2: 付款成功時顯示確認\nAC3: 付款失敗時顯示錯誤",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "夠了，簡潔明瞭", explanation: "太模糊。「可以輸入」沒有定義格式驗證、安全性等。開發者會有很多問題。"),
                                Challenge.Option(id: "B", text: "缺少具體的 Given-When-Then、邊界條件、安全需求", explanation: "正確！好的 AC 應該是：\n• Given 客戶在結帳頁 When 輸入卡號 Then 即時驗證格式（16位數字）\n• Given 卡號有效 When 按付款 Then 3D Secure 驗證 → 成功扣款 → 顯示訂單號\n• Given 餘額不足 When 付款 Then 顯示「餘額不足」+建議換卡\n• 卡號不儲存在我方伺服器（PCI-DSS）"),
                                Challenge.Option(id: "C", text: "需要加更多 Happy Path 情境", explanation: "Happy Path 已經有了。缺的是 Edge Case 和 NFR。"),
                                Challenge.Option(id: "D", text: "不需要 AC，開發者知道怎麼做", explanation: "沒有 AC 的 Story 是不 ready 的。AC 是「怎麼算做完」的定義。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "AC 要具體到可以直接變成測試案例",
                                "別忘了邊界條件和安全需求",
                            ],
                            explanation: "AC 的黃金標準：開發者讀完能寫 code，QA 讀完能寫測試案例。缺少具體情境的 AC 會導致開發理解不一致。",
                            frameworkTip: "AC 品質檢查：能直接變成測試案例嗎？有 Happy Path + Edge Case + NFR 嗎？"
                        ),
                    ]
                ),
                Quest(
                    id: "33-3",
                    name: "Backlog Refinement",
                    description: "維護健康的 Product Backlog",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Refinement 目的",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根本問題是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Backlog 問題",
                                narrative: "你的 Product Backlog 有 200 個 Stories。Sprint Planning 時團隊抱怨：\n• 「這些 Story 我看不懂」\n• 「這個 Story 太大了估不了」\n• 「AC 不清楚，做出來你又說不對」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Stories 太多", explanation: "數量不是問題，品質才是。"),
                                Challenge.Option(id: "B", text: "缺乏 Backlog Refinement — Stories 沒有被持續地釐清、拆分、估算", explanation: "正確！Refinement 的目的是確保 Sprint Planning 時，頂部的 Stories 都是 Ready 的：夠小、夠清楚、有 AC、團隊理解。"),
                                Challenge.Option(id: "C", text: "開發者不夠資深", explanation: "不是能力問題，是需求準備度問題。"),
                                Challenge.Option(id: "D", text: "需要更好的工具", explanation: "工具不解決需求品質問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sprint Planning 不是釐清需求的時間",
                                "Refinement 讓 Stories 變 Ready",
                            ],
                            explanation: "Backlog Refinement 是持續的過程：釐清需求、拆分大 Story、寫 AC、估算。目標是 Sprint Planning 時頂部 Stories 已經 Ready。",
                            frameworkTip: "Definition of Ready：Story 小到一個 Sprint 內做完 + AC 明確 + 團隊理解 + 無 blocker"
                        ),
                        Challenge(
                            id: 2,
                            name: "優先級排序",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最實用的排序方法？",
                            scenario: 
                            Challenge.Scenario(
                                title: "MoSCoW",
                                narrative: "你有 30 個 Stories 要在 3 個 Sprint 內完成。PO 說全部都是 P1。你需要幫助排序。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按 Story 編號順序", explanation: "編號跟優先級無關。"),
                                Challenge.Option(id: "B", text: "MoSCoW + Value/Effort 矩陣：先分 Must/Should/Could/Won't，再在 Must 中用 Value/Effort 排序", explanation: "正確！MoSCoW 先做大分類（砍掉 Won't 和 Could），再在 Must 和 Should 中用 Value/Effort 找「高價值低成本」的先做。"),
                                Challenge.Option(id: "C", text: "讓開發者決定", explanation: "開發者決定技術順序，PO/BA 決定商業優先級。"),
                                Challenge.Option(id: "D", text: "全部平行開發", explanation: "資源有限不可能全部平行。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不是所有 P1 都一樣重要",
                                "先篩選（MoSCoW）再排序（Value/Effort）",
                            ],
                            explanation: "優先級排序兩步驟：(1) MoSCoW 分類先砍掉「不做的」(2) 在「做的」中用 Value/Effort 矩陣找最佳順序。",
                            frameworkTip: "MoSCoW → Must 中用 Value÷Effort 排序 → 高價值低成本的先做"
                        ),
                    ]
                ),
                Quest(
                    id: "33-4",
                    name: "Sprint 儀式中的 BA",
                    description: "在各個 Scrum 儀式中發揮 BA 價值",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Sprint Planning 中的 BA",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 應該怎麼做？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Planning 會議",
                                narrative: "Sprint Planning 中，開發者對一個 Story 有疑問：「如果客戶在付款後 30 分鐘內取消訂單，要自動退款還是手動？退到原支付方式還是錢包？」\n\nPO 不確定答案。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "說「我去確認，下個 Sprint 再做這個 Story」", explanation: "延到下個 Sprint 太慢了。而且如果能當場或快速解決，就不該延遲。"),
                                Challenge.Option(id: "B", text: "提供分析：列出選項（自動退/手動退、退原路/退錢包）、各自的影響、建議。讓 PO 當場做 informed decision", explanation: "正確！BA 的準備工作應該在 Refinement 時就預判這些問題。如果沒有，至少能快速列出選項讓 PO 決定。BA = 問題預判 + 選項分析。"),
                                Challenge.Option(id: "C", text: "說「全部自動退」自己做決定", explanation: "BA 不替 PO 做商業決定。"),
                                Challenge.Option(id: "D", text: "記下來，會後再說", explanation: "如果 Planning 不解決，Story 就不是 Ready 的，不應該被拉入 Sprint。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 的準備 = 預判開發會問的問題",
                                "Planning 時 BA 是「即時分析師」",
                            ],
                            explanation: "Sprint Planning 中 BA 的價值：(1) 預先準備好可能的疑問 (2) 快速提供選項分析 (3) 幫助 PO 做即時決策。",
                            frameworkTip: "BA 在 Planning：預判問題 → 準備選項 → 輔助 PO 即時決策"
                        ),
                        Challenge(
                            id: 2,
                            name: "Sprint Review 中的 BA",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個問題的根因最可能是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Review 會議",
                                narrative: "Sprint Review 中，stakeholder 看完 demo 後說：\n\n「這不是我要的！我要的是 A 功能但你們做了 B 功能。」\n\n開發者說：「我們是照 Story 做的。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "開發者沒看清需求", explanation: "如果照 Story 做，開發者沒錯。問題在更上游。"),
                                Challenge.Option(id: "B", text: "Story 和 AC 沒有跟 stakeholder 確認，或 stakeholder 沒參與 Refinement", explanation: "正確！最常見的原因：BA/PO 自己理解需求後寫 Story，但沒有跟 stakeholder 確認。Review 時才發現認知差異。解法：Refinement 時邀請 stakeholder 或至少確認 AC。"),
                                Challenge.Option(id: "C", text: "Scrum 流程有問題", explanation: "流程是對的，但執行中缺少了需求確認環節。"),
                                Challenge.Option(id: "D", text: "Stakeholder 自己沒說清楚", explanation: "可能是原因之一，但 BA 的職責就是確保需求被正確理解。不能怪使用者「沒說清楚」。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "需求的「電話遊戲」：每經過一手都可能失真",
                                "BA 的職責：確保 Story 反映真正的需求",
                            ],
                            explanation: "Review 中的意外 = Refinement 時的漏洞。解法：BA 在寫 Story 後跟 stakeholder 確認，或邀請 stakeholder 參與 Refinement。",
                            frameworkTip: "防止 Review 意外：Story → 跟 stakeholder 確認 AC → 開發 → Review"
                        ),
                    ]
                ),
                Quest(
                    id: "33-5",
                    name: "跨團隊協作",
                    description: "在多團隊敏捷環境中協作",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "依賴管理",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "BA 怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "團隊依賴",
                                narrative: "你的功能需要 Team A（前端）、Team B（後端 API）、Team C（資料團隊）配合。\n\nTeam B 說他們的 API 要兩個 Sprint 後才能完成。你的 PO 要求一個 Sprint 內上線。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "跟 PO 說做不到", explanation: "太快放棄。先看有沒有替代方案。"),
                                Challenge.Option(id: "B", text: "分析依賴、提出解耦方案（如用 mock API 先做前端+integration test，API ready 後再接）+ 調整上線範圍", explanation: "正確！BA 的價值：(1) 明確依賴地圖 (2) 提出解耦方案（mock/stub）(3) 建議 MVP 範圍讓部分功能先上線。不是「做不到」而是「怎麼最快交付最多價值」。"),
                                Challenge.Option(id: "C", text: "催 Team B 加快", explanation: "可以溝通但不能強迫其他團隊改變優先級。"),
                                Challenge.Option(id: "D", text: "等 API 好再開始", explanation: "浪費一到兩個 Sprint 的時間。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "依賴 ≠ 阻塞。有很多解耦方式",
                                "Mock API 讓團隊可以平行開發",
                            ],
                            explanation: "跨團隊依賴處理：(1) 畫依賴地圖 (2) 識別 critical path (3) 用 mock/contract 解耦 (4) 調整上線策略。",
                            frameworkTip: "依賴處理：識別 → 解耦（mock/contract）→ 平行開發 → 整合測試"
                        ),
                        Challenge(
                            id: 2,
                            name: "需求對齊",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼預防這個問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "多團隊對齊",
                                narrative: "三個團隊各自開發不同模組，但在 integration 時發現：\n• Team A 的「訂單狀態」有 5 個值\n• Team B 的「訂單狀態」有 8 個值\n• Team C 用的狀態名稱完全不同",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓每個團隊自己決定", explanation: "各自決定就是問題的根因。"),
                                Challenge.Option(id: "B", text: "BA 建立共用的 Domain Model（包含統一的狀態定義、資料格式、術語表），各團隊開發時參照", explanation: "正確！BA 在多團隊環境中的獨特價值：建立「共同語言」。統一的 Domain Model / Data Dictionary / API Contract 確保各團隊對齊。"),
                                Challenge.Option(id: "C", text: "上線後再統一", explanation: "上線後統一的成本遠高於事前定義。"),
                                Challenge.Option(id: "D", text: "開更多會議對齊", explanation: "會議是手段不是目的。有文件化的 Domain Model 更有效。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "多團隊的最大風險：對同一個概念有不同理解",
                                "BA = 共同語言的守護者",
                            ],
                            explanation: "BA 在多團隊環境中：建立和維護共用的 Domain Model、Data Dictionary、API Contract。確保「訂單」在每個團隊的意思相同。",
                            frameworkTip: "多團隊對齊：Domain Model + Data Dictionary + API Contract + 定期 Sync"
                        ),
                    ]
                ),
                Quest(
                    id: "33-6",
                    name: "Agile BA 綜合案例",
                    description: "在敏捷環境中完整發揮 BA 價值",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：Agile BA 規劃",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "新產品開發",
                                narrative: "你是新的 SaaS 專案管理工具的 BA。Scrum 團隊 7 人（PO、SM、3 Dev、1 QA、1 BA 就是你）。\n\n第一個 MVP 要在 6 個 Sprint（12 週）內上線。主要功能：任務管理、看板、時間追蹤。\n\nPO 已經收集了 50 個 Feature Requests。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "Sprint 0 是 BA 最忙的時候",
                                "Story Mapping 幫助看全貌",
                            ],
                            explanation: "Agile BA 的系統性準備：Persona → Story Map → MoSCoW → Backlog → DoR → Domain Model。前期投資讓後續 Sprint 更順暢。",
                            frameworkTip: "Sprint 0 BA：Persona + Story Map + MoSCoW + DoR + Domain Model + 前 2 Sprint Stories Ready"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 34: 流程改善
        World(
            id: 34,
            name: "流程改善",
            emoji: "🔄",
            description: "分析和優化商業流程，消除浪費提升效率",
            quests: [
                Quest(
                    id: "34-1",
                    name: "As-Is 流程分析",
                    description: "分析現有流程找出問題",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "流程瓶頸",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最大的瓶頸在哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "訂單處理流程",
                                narrative: "電商訂單處理流程和平均時間：\n\n下單(1分鐘)→人工審核(4小時)→揀貨(30分鐘)→包裝(15分鐘)→出貨(交給物流)\n\n客戶從下單到出貨平均要 6 小時。客訴主要是「太慢」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "揀貨 — 30 分鐘太長", explanation: "30 分鐘在整體 6 小時中只佔 8%。不是瓶頸。"),
                                Challenge.Option(id: "B", text: "人工審核 — 4 小時佔整體 67%", explanation: "正確！4 小時 / 6 小時 = 67%。這是最大的瓶頸。如果能把審核從 4 小時降到 30 分鐘，整體時間從 6 小時降到 2.25 小時，改善 62.5%。"),
                                Challenge.Option(id: "C", text: "包裝 — 可以更快", explanation: "15 分鐘只佔 4%。優化空間最小。"),
                                Challenge.Option(id: "D", text: "出貨 — 交給物流的等待時間", explanation: "物流時間不在我們控制範圍內。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "瓶頸 = 佔整體時間最大比例的步驟",
                                "改善瓶頸的 ROI 最高",
                            ],
                            explanation: "瓶頸分析：找到佔時間/成本最大比例的步驟。改善瓶頸的 ROI 遠高於優化非瓶頸步驟。",
                            frameworkTip: "瓶頸分析：量化每步時間 → 找佔比最大的 → 優先改善 → 重新量化"
                        ),
                        Challenge(
                            id: 2,
                            name: "浪費識別",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以上對應 Lean 的哪些浪費類型？",
                            scenario: 
                            Challenge.Scenario(
                                title: "八大浪費",
                                narrative: "觀察客服團隊一天的工作：\n\n• 客服接到電話後要開 3 個系統查客戶資料（5 分鐘/次）\n• 查完後手動把資訊從系統 A 複製到系統 B（2 分鐘/次）\n• 每天有 20% 的來電是重複問同一個問題（查訂單狀態）\n• 客服主管每天花 2 小時手動統計報表",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都是「等待」浪費", explanation: "等待只是其中一種。這裡有多種浪費類型。"),
                                Challenge.Option(id: "B", text: "開 3 系統=動作浪費、複製貼上=過度處理、重複來電=缺陷/返工、手動報表=過度處理", explanation: "正確！Lean 八大浪費（DOWNTIME）：D-Defects、O-Overproduction、W-Waiting、N-Non-utilized talent、T-Transportation、I-Inventory、M-Motion、E-Extra processing。"),
                                Challenge.Option(id: "C", text: "全部都是技術問題不是流程問題", explanation: "看起來像技術問題但根因是流程設計。系統整合、自動化、自助服務都是流程改善方案。"),
                                Challenge.Option(id: "D", text: "這些都是正常工作", explanation: "「正常」不代表沒有浪費。很多浪費已經被習慣了。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "浪費 = 不為客戶創造價值的活動",
                                "DOWNTIME 是八大浪費的記憶口訣",
                            ],
                            explanation: "Lean 八大浪費（DOWNTIME）：識別浪費是流程改善的第一步。關鍵問題：「這個步驟有為客戶創造價值嗎？」",
                            frameworkTip: "DOWNTIME：Defects / Overproduction / Waiting / Non-utilized talent / Transportation / Inventory / Motion / Extra processing"
                        ),
                    ]
                ),
                Quest(
                    id: "34-2",
                    name: "To-Be 流程設計",
                    description: "設計改善後的目標流程",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "自動化決策",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最佳的 To-Be 設計？",
                            scenario: 
                            Challenge.Scenario(
                                title: "審核自動化",
                                narrative: "回到訂單審核瓶頸。你分析 1000 筆訂單的審核紀錄：\n\n• 85% 的訂單直接通過（金額<$5000、非高風險商品、老客戶）\n• 10% 需要簡單確認（金額$5000-$20000）\n• 5% 需要深度審核（金額>$20000、新客戶+高風險）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部自動化", explanation: "高風險訂單全自動化會有欺詐風險。"),
                                Challenge.Option(id: "B", text: "85% 自動通過（規則引擎）+ 10% 簡化審核（快速確認）+ 5% 人工深度審核", explanation: "正確！分層策略：低風險自動化（省最多時間）、中風險簡化（快速確認清單）、高風險保留人工（風險控制）。4小時→大部分訂單即時處理。"),
                                Challenge.Option(id: "C", text: "增加審核人員", explanation: "加人是治標不治本。85% 的訂單根本不需要人審核。"),
                                Challenge.Option(id: "D", text: "取消審核", explanation: "完全取消審核會有欺詐和合規風險。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "80/20 法則：80% 的改善來自處理最大量的那群",
                                "自動化+人工是最務實的組合",
                            ],
                            explanation: "流程自動化的最佳實踐：不是「全自動化 or 不自動化」而是分層：簡單的自動化、複雜的簡化、關鍵的保留人工。",
                            frameworkTip: "自動化分層：高量低風險→全自動 / 中量中風險→半自動 / 低量高風險→人工"
                        ),
                        Challenge(
                            id: 2,
                            name: "流程簡化",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最好的簡化方式？",
                            scenario: 
                            Challenge.Scenario(
                                title: "審批流程簡化",
                                narrative: "現有請購流程：\n\n申請→主管簽核→部門經理簽核→財務審核→採購執行\n\n不論金額大小都走同一流程。一支 $50 的滑鼠要跟 $50,000 的伺服器走一樣的 4 層審核，平均 5 天。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "取消所有審核", explanation: "完全取消沒有內控。"),
                                Challenge.Option(id: "B", text: "按金額分層：<$500 主管直接核准、$500-$10K 加部門經理、>$10K 走完整流程", explanation: "正確！金額分層是最常見的審批優化。$50 滑鼠 1 層審核 1 天完成，$50K 伺服器 4 層審核 5 天合理。"),
                                Challenge.Option(id: "C", text: "加更多審核者加快速度", explanation: "加人不會加快，反而增加等待。"),
                                Challenge.Option(id: "D", text: "全部改成 email 審核", explanation: "管道改變不解決流程冗長問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不是所有請求都需要相同的審核強度",
                                "風險跟金額成正比",
                            ],
                            explanation: "流程簡化核心原則：審核強度要跟風險成正比。低風險交易不需要跟高風險走一樣的流程。",
                            frameworkTip: "審批簡化：按金額/風險分層 → 低風險簡化 → 高風險保留"
                        ),
                    ]
                ),
                Quest(
                    id: "34-3",
                    name: "Value Stream Mapping",
                    description: "用價值流圖分析端到端流程",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Value vs Non-Value",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪些是 Non-Value-Added 活動？",
                            scenario: 
                            Challenge.Scenario(
                                title: "活動分類",
                                narrative: "保險理賠流程：\n\n① 客戶填寫理賠表（15分鐘）\n② 收件人員登記到系統（10分鐘）\n③ 等待分配審核員（2天）\n④ 審核員調查（1天）\n⑤ 主管覆核（半天）\n⑥ 財務撥款（1天）\n⑦ 通知客戶（10分鐘）\n\n總計約 5 天。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都有價值", explanation: "有些步驟是必要的但不為客戶創造價值。"),
                                Challenge.Option(id: "B", text: "② 登記（可自動化）和 ③ 等待分配（純等待無價值）是 Non-Value-Added", explanation: "正確！② 手動登記可以自動化（客戶線上填寫直接進系統）。③ 等待分配是純粹的浪費（2天/5天=40%）。④ 審核是必要的 VA。⑤ 覆核可能是 Necessary Non-VA（合規需要但客戶不關心）。"),
                                Challenge.Option(id: "C", text: "全部都是 Non-Value", explanation: "審核和撥款是客戶需要的價值活動。"),
                                Challenge.Option(id: "D", text: "只有 ③ 等待是浪費", explanation: "② 手動登記如果可以自動化也是浪費。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "VA = 客戶願意付錢的活動",
                                "NVA = 等待、搬運、重複",
                                "Necessary NVA = 合規必要但客戶不在乎",
                            ],
                            explanation: "Value Stream Mapping 三分類：VA（增值）、NVA（浪費，要消除）、Necessary NVA（必要但不增值，要最小化）。",
                            frameworkTip: "VSM 三分類：VA（保留+優化）/ Necessary NVA（最小化）/ NVA（消除）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Lead Time vs Process Time",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這個數據說明什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "效率比",
                                narrative: "繼續理賠流程分析：\n\n• Lead Time（從客戶提交到收到理賠）：5 天 = 120 小時\n• Process Time（實際在處理的時間加總）：15min+10min+8hr+4hr+10min = 約 12.5 小時\n• 等待時間：120 - 12.5 = 107.5 小時",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "效率很高", explanation: "Process Time 只佔 Lead Time 的 10%。90% 的時間在等待。"),
                                Challenge.Option(id: "B", text: "Process Cycle Efficiency 只有 10%（12.5/120），90% 是等待。最大的改善空間在消除等待", explanation: "正確！PCE = Process Time / Lead Time。10% 是很低的效率。改善重點不是加快每個步驟（已經夠快了），而是消除步驟之間的等待時間。"),
                                Challenge.Option(id: "C", text: "需要加快每個步驟", explanation: "步驟本身不慢（12.5小時 for 理賠調查是合理的）。問題在等待。"),
                                Challenge.Option(id: "D", text: "數據不夠不能判斷", explanation: "Lead Time 和 Process Time 的對比已經很清楚了。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "PCE = 實際處理時間 / 端到端時間",
                                "大部分流程的 PCE 都很低（10-30%）",
                            ],
                            explanation: "Process Cycle Efficiency 揭示了一個驚人事實：大部分流程中，實際在處理的時間只佔 10-30%，其餘都是等待。改善方向：消除等待。",
                            frameworkTip: "PCE = Process Time / Lead Time。目標：從 10% → 30%+。改善重點：消除等待和交接。"
                        ),
                    ]
                ),
                Quest(
                    id: "34-4",
                    name: "Root Cause Analysis",
                    description: "用結構化方法找到問題根因",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "5 Whys",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why 5 最可能的根因是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "問題根因",
                                narrative: "問題：客戶投訴增加 30%\n\nWhy 1: 客服回覆太慢 → Why 2: 客服人員不夠 → Why 3: 離職率高 → Why 4: 工作壓力大 → Why 5: ？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "薪水太低", explanation: "可能是原因之一，但跟「工作壓力大」更直接相關的根因是什麼？"),
                                Challenge.Option(id: "B", text: "系統不好用，處理一個 ticket 要很長時間，導致積壓越來越多", explanation: "正確！系統效率低 → 處理慢 → 積壓多 → 壓力大 → 離職 → 人更少 → 更慢。這是惡性循環。根因是系統效率，不是「人不夠」。加人只是暫時解法。"),
                                Challenge.Option(id: "C", text: "客戶太多", explanation: "客戶多是好事。問題是處理效率。"),
                                Challenge.Option(id: "D", text: "管理不善", explanation: "太模糊不是具體根因。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "5 Whys 的目的是找到「可以改善的系統性根因」",
                                "加人是治標，改系統是治本",
                            ],
                            explanation: "5 Whys 幫助跳過表面症狀找到根因。關鍵：每個 Why 都要有因果關係，最終的根因應該是可以改善的系統性問題。",
                            frameworkTip: "5 Whys 規則：每個 Why 有因果關係 → 根因是可改善的系統性問題"
                        ),
                        Challenge(
                            id: 2,
                            name: "魚骨圖",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下原因分別屬於哪個分類？\n① 開發者沒有寫單元測試\n② 測試環境跟生產環境不同\n③ 需求變更太頻繁",
                            scenario: 
                            Challenge.Scenario(
                                title: "Ishikawa Diagram",
                                narrative: "你要用魚骨圖分析「系統上線後 bug 太多」的原因。魚骨圖的六大類別（6M）：\n\n• Man（人）\n• Machine（設備/工具）\n• Method（方法/流程）\n• Material（材料/資料）\n• Measurement（衡量）\n• Mother Nature（環境）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "①人 ②機器 ③方法", explanation: "①不只是「人」的問題，也是「方法」的問題（沒有測試的流程/規範）。"),
                                Challenge.Option(id: "B", text: "①方法（沒有強制測試的流程）②環境（環境不一致）③材料（需求品質不穩定）", explanation: "正確！①看起來是人的問題，但根因是沒有流程強制要求（Method）。②測試環境問題屬 Mother Nature/環境。③需求是開發的「材料」，品質不穩定屬 Material。"),
                                Challenge.Option(id: "C", text: "全部都是人的問題", explanation: "歸因於人太簡單。要找系統性原因。"),
                                Challenge.Option(id: "D", text: "全部都是方法問題", explanation: "②是環境問題，③是材料/輸入品質問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "6M 分類幫助全面思考",
                                "不要只歸因於「人」，要找系統性原因",
                            ],
                            explanation: "魚骨圖的價值：強迫你從 6 個維度全面思考原因。避免只歸因於「人不好」而忽略系統性問題。",
                            frameworkTip: "魚骨圖 6M：Man / Machine / Method / Material / Measurement / Mother Nature"
                        ),
                    ]
                ),
                Quest(
                    id: "34-5",
                    name: "改善方案評估",
                    description: "評估和選擇最佳改善方案",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Quick Win 識別",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "應該先做哪個？",
                            scenario: 
                            Challenge.Scenario(
                                title: "改善矩陣",
                                narrative: "你找到 8 個改善機會。用 Impact/Effort 矩陣分類：\n\n| 改善 | Impact | Effort |\n|---|---|---|\n| A. 自動化審核規則 | 高 | 中 |\n| B. 系統整合（3系統→1系統）| 高 | 高 |\n| C. 加客服 FAQ 頁面 | 中 | 低 |\n| D. 重寫整個系統 | 高 | 很高 |",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "D — Impact 最高", explanation: "Effort 很高（可能 6-12 個月），不適合先做。"),
                                Challenge.Option(id: "B", text: "C（Quick Win）→ A（High Value）→ B（Major Project）→ D（考慮 ROI）", explanation: "正確！C 是 Quick Win（低成本中效果，1-2 週可見成果）→ 建立信心後做 A（中成本高效果，核心改善）→ 再做 B（需要較多資源但價值高）→ D 需要 business case 證明 ROI。"),
                                Challenge.Option(id: "C", text: "A — 最好的 Impact/Effort 比", explanation: "A 是好選擇但 C 更快見效。先用 Quick Win 建立信心很重要。"),
                                Challenge.Option(id: "D", text: "全部同時做", explanation: "資源有限不可能全做。要有順序。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Quick Win 建立信心 → 大改善有了支持",
                                "Impact/Effort 比最高的先做",
                            ],
                            explanation: "改善順序：Quick Win 先行（建立信心和動力）→ High Value 項目（核心改善）→ Major Project（需要資源和支持）。",
                            frameworkTip: "改善順序：Quick Win（低努力中效果）→ High Value（中努力高效果）→ Major（高努力高效果）"
                        ),
                        Challenge(
                            id: 2,
                            name: "ROI 計算",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "這個方案的 Payback Period 大約是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "自動化 ROI",
                                narrative: "自動化審核方案：\n• 開發成本：$150K（一次性）\n• 維護成本：$30K/年\n• 預期節省：每年省 2 個 FTE（$120K/人/年 = $240K/年）\n• 預計 6 個月開發",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "6 個月", explanation: "沒有考慮開發期間沒有節省。"),
                                Challenge.Option(id: "B", text: "約 10-11 個月：開發 6 個月（$0 節省）+ 上線後每月淨節省 $17.5K（$240K-$30K=210K/年÷12），回收 $150K 要約 8.6 個月 → 6+4.6 ≈ 10-11 個月", explanation: "正確！Payback = 開發期（6個月）+ 投資回收（$150K ÷ $17.5K/月 ≈ 8.6個月）≈ 14.6 個月。第二年開始每年淨賺 $210K。"),
                                Challenge.Option(id: "C", text: "2 年", explanation: "太長了。淨節省 $210K/年，$150K 不到一年就回收。"),
                                Challenge.Option(id: "D", text: "無法計算", explanation: "有足夠數據可以估算。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Payback = 投資 ÷ 每期淨節省",
                                "別忘了開發期間沒有節省",
                            ],
                            explanation: "ROI 分析要考慮：一次性成本、持續成本、預期節省、時間。Payback Period 讓決策者知道多久回本。",
                            frameworkTip: "Payback Period = 開發期 + (一次成本 ÷ 每月淨節省)"
                        ),
                    ]
                ),
                Quest(
                    id: "34-6",
                    name: "流程改善案例",
                    description: "完整的流程改善專案",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：端到端流程改善",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶退貨流程",
                                narrative: "電商退貨流程：客戶申請→客服審核(1天)→寄回商品(3天)→倉庫驗收(2天)→財務退款(3天)→通知客戶(1天)\n\n總計 10 天。業界平均 5 天。客戶滿意度因退貨體驗低於競爭對手。\n\n年退貨量 5 萬件，每件處理成本 $15。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "先量化每步的時間和成本",
                                "找出哪些步驟可以自動化或平行化",
                            ],
                            explanation: "端到端流程改善：As-Is(量化)→Root Cause→To-Be(設計)→量化效果→實施優先級。",
                            frameworkTip: "流程改善：As-Is → 瓶頸+浪費 → Root Cause → To-Be → 量化效果 → Quick Win 先行"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 35: UAT 與品質保證
        World(
            id: 35,
            name: "UAT 與品質保證",
            emoji: "✅",
            description: "規劃和執行 User Acceptance Testing，確保交付品質",
            quests: [
                Quest(
                    id: "35-1",
                    name: "UAT 規劃",
                    description: "設計有效的 UAT 策略和計畫",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "UAT 目的",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "為什麼需要 UAT？",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT vs QA",
                                narrative: "開發團隊已經做了單元測試和 QA 測試。PM 問：「QA 都測過了，為什麼還要 UAT？浪費時間。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "重複測試確保品質", explanation: "UAT 不是重複 QA 的測試。測的東西不同。"),
                                Challenge.Option(id: "B", text: "QA 測「系統是否照規格運作」，UAT 測「系統是否解決使用者的實際問題」", explanation: "正確！QA = Verification（做對了嗎？），UAT = Validation（做對的東西了嗎？）。QA 可能通過但 UAT 失敗，因為「照規格做」不代表「使用者滿意」。"),
                                Challenge.Option(id: "C", text: "讓使用者找 bug", explanation: "UAT 的目的不是找 bug（那是 QA 的事），而是確認系統符合使用者期望。"),
                                Challenge.Option(id: "D", text: "法規要求", explanation: "某些產業有法規要求但這不是 UAT 的核心目的。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Verification = 做對了嗎（規格）",
                                "Validation = 做對的東西了嗎（需求）",
                            ],
                            explanation: "QA（Verification）確保系統照規格運作。UAT（Validation）確保系統解決真正的商業問題。兩者都需要。",
                            frameworkTip: "QA = Verification（Build the thing right）/ UAT = Validation（Build the right thing）"
                        ),
                        Challenge(
                            id: 2,
                            name: "UAT 計畫",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 UAT 計畫最完整？",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT 準備",
                                narrative: "你要規劃 UAT。上線前 3 週。需要決定：誰來測、測什麼、怎麼測、多長時間。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "請使用者隨便用用看，有問題回報", explanation: "沒有結構的測試會遺漏關鍵場景。而且「隨便用」使用者不知道要測什麼。"),
                                Challenge.Option(id: "B", text: "定義 UAT 範圍+測試案例+測試者（含角色代表）+環境+時間表+通過標準+缺陷處理流程", explanation: "正確！完整的 UAT 計畫：Scope（測什麼）→ Test Cases（怎麼測）→ Testers（誰測，要有各角色代表）→ Environment（測試環境）→ Timeline → Exit Criteria（通過標準）→ Defect Process。"),
                                Challenge.Option(id: "C", text: "寫一份 100 頁的測試計畫", explanation: "太重了。UAT 計畫要務實。關鍵是覆蓋核心業務流程。"),
                                Challenge.Option(id: "D", text: "讓 QA 團隊代替使用者測", explanation: "QA 不能代替使用者。UAT 的價值在於真正的使用者用真實的思維測試。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "UAT 計畫的核心：誰測、測什麼、怎麼算通過",
                            ],
                            explanation: "UAT 計畫要回答：Scope + Test Cases + Testers + Environment + Timeline + Exit Criteria + Defect Process。",
                            frameworkTip: "UAT 計畫 7 要素：範圍 / 測試案例 / 測試者 / 環境 / 時程 / 通過標準 / 缺陷流程"
                        ),
                    ]
                ),
                Quest(
                    id: "35-2",
                    name: "Test Case 設計",
                    description: "設計覆蓋核心業務流程的測試案例",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "業務場景測試",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這些 test cases 缺了什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "測試案例覆蓋",
                                narrative: "你為電商結帳流程寫了 5 個 UAT test cases：\n\n1. 正常結帳成功\n2. 信用卡付款成功\n3. 超商取貨付款成功\n4. 使用折扣碼結帳\n5. 購買單一商品結帳",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "夠了，5 個足以覆蓋", explanation: "只有 Happy Path。缺少異常場景和邊界條件。"),
                                Challenge.Option(id: "B", text: "缺少異常場景：付款失敗、庫存不足、折扣碼過期、購物車修改後結帳、同時購買多商品等", explanation: "正確！UAT 要覆蓋：Happy Path + 異常場景 + 邊界條件 + 常見使用者行為。使用者在真實環境中會遇到各種非正常情況。"),
                                Challenge.Option(id: "C", text: "需要更多 Happy Path", explanation: "不是 Happy Path 不夠，是缺少非正常情境。"),
                                Challenge.Option(id: "D", text: "需要性能測試", explanation: "性能測試通常不在 UAT 範圍（那是 Performance Testing）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "使用者在真實環境中會遇到「非正常」情況",
                                "Happy Path 只是 test cases 的 20%",
                            ],
                            explanation: "UAT Test Case 設計：Happy Path（正常流程）+ Alternative Path（其他合法路徑）+ Exception Path（異常情況）+ Edge Cases（邊界條件）。",
                            frameworkTip: "Test Case 覆蓋：Happy Path + Alternative + Exception + Edge Case + 跨功能"
                        ),
                        Challenge(
                            id: 2,
                            name: "Test Case 格式",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪個更適合 UAT？",
                            scenario: 
                            Challenge.Scenario(
                                title: "測試案例品質",
                                narrative: "兩個 test case 版本：\n\nV1: 「測試結帳功能」\n\nV2: 「TC-001: 使用信用卡正常結帳\n前提：已登入+購物車有1件商品($500)\n步驟：1.點結帳 2.選信用卡 3.輸入卡號 4.點付款\n預期：顯示訂單確認頁+訂單號+扣款$500+收到Email確認」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "V1 — 簡潔給使用者自由度", explanation: "太模糊。使用者不知道要測什麼、怎麼判斷通過。"),
                                Challenge.Option(id: "B", text: "V2 — 有前提、步驟、預期結果，使用者能照做且判斷通過/失敗", explanation: "正確！好的 UAT Test Case：Test ID + 前提條件 + 清楚步驟 + 明確的預期結果。使用者不需要猜測。"),
                                Challenge.Option(id: "C", text: "兩個結合", explanation: "V1 太模糊不能用。V2 已經足夠完整。"),
                                Challenge.Option(id: "D", text: "不需要 test case，使用者自己探索", explanation: "探索式測試可以補充但不能替代結構化的 test cases。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "使用者不是測試專家，需要清楚的指引",
                                "Test Case 要能判斷 Pass/Fail",
                            ],
                            explanation: "UAT Test Case = 前提 + 步驟 + 預期結果。讓非技術使用者也能執行和判斷。",
                            frameworkTip: "Test Case 格式：ID + 前提條件 + 步驟（1,2,3…）+ 預期結果 + 實際結果 + Pass/Fail"
                        ),
                    ]
                ),
                Quest(
                    id: "35-3",
                    name: "缺陷管理",
                    description: "有效追蹤和管理 UAT 缺陷",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Bug 分類",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "嚴重度排序？",
                            scenario: 
                            Challenge.Scenario(
                                title: "缺陷嚴重度",
                                narrative: "UAT 發現以下問題：\n\n① 點「付款」沒反應（無法完成訂單）\n② 確認頁的 Logo 位置偏右 2 pixel\n③ 折扣碼輸入大寫無效（只接受小寫）\n④ 所有訂單的金額都多算了 $10",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都是 Critical", explanation: "Logo 位移不是 Critical。要區分嚴重度才能有效排優先級。"),
                                Challenge.Option(id: "B", text: "④ Critical（金額錯誤影響所有訂單）> ① Critical（核心功能失效）> ③ Major（影響使用但有 workaround）> ② Minor（純美觀）", explanation: "正確！④ 最嚴重因為影響所有訂單且涉及金額。① 核心功能失效。③ 有 workaround（用小寫）但影響體驗。② 純粹視覺。"),
                                Challenge.Option(id: "C", text: "① > ② > ③ > ④", explanation: "④ 金額錯誤影響所有人且涉及金錢，比 ① 更嚴重。"),
                                Challenge.Option(id: "D", text: "都不嚴重，上線後再修", explanation: "④ 和 ① 是 showstopper，不能帶著上線。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "嚴重度看：影響範圍 × 影響程度",
                                "金額錯誤涉及法律和信任問題",
                            ],
                            explanation: "缺陷嚴重度：Critical（無法使用/數據錯誤）> Major（功能受限但有 workaround）> Minor（不影響功能的問題）> Cosmetic（純視覺）。",
                            frameworkTip: "嚴重度：Critical（擋住上線）> Major（嚴重但有 workaround）> Minor（小問題）> Cosmetic（美觀）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Go/No-Go 決策",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你的建議？",
                            scenario: 
                            Challenge.Scenario(
                                title: "上線決策",
                                narrative: "UAT 結束。結果：\n\n• 50 個 test cases：45 Pass、5 Fail\n• 5 個 Fail 中：0 Critical、2 Major（有 workaround）、3 Minor\n• 上線日期是下週一，延遲一週會損失 $50K 營收\n• 2 個 Major bugs 修復需要 3 天",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "不能上線，要 100% Pass", explanation: "追求 100% 不切實際。0 Critical + 有 workaround = 可以有條件上線。"),
                                Challenge.Option(id: "B", text: "建議有條件上線：0 Critical 符合 Exit Criteria、2 Major 有 workaround 且 3 天內 hotfix、上線後密切監控", explanation: "正確！Go/No-Go 不是非黑即白。有條件上線：(1) 無 Critical (2) Major 有 workaround + hotfix 計畫 (3) 上線後監控。記錄風險讓 stakeholder 做 informed decision。"),
                                Challenge.Option(id: "C", text: "直接上線忽略所有 bug", explanation: "不能忽略。要有修復計畫。"),
                                Challenge.Option(id: "D", text: "延遲兩週確保完美", explanation: "損失 $100K 且 bugs 都不是 Critical。代價太高。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Go/No-Go 是風險決策不是完美主義",
                                "有條件上線 = 上線 + 修復計畫 + 監控",
                            ],
                            explanation: "Go/No-Go 決策：BA 的角色是呈現事實和風險，讓 stakeholder 做 informed decision。「有條件上線」是常見且合理的選擇。",
                            frameworkTip: "Go/No-Go：0 Critical = 可考慮上線 / Major 有 workaround + hotfix 計畫 / 記錄風險"
                        ),
                    ]
                ),
                Quest(
                    id: "35-4",
                    name: "Exit Criteria 設計",
                    description: "定義明確的 UAT 通過標準",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Exit Criteria",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最務實的 Exit Criteria？",
                            scenario: 
                            Challenge.Scenario(
                                title: "通過標準",
                                narrative: "你需要在 UAT 開始前定義 Exit Criteria（通過標準）。PO 說：「全部通過才能上線。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "100% test cases 通過", explanation: "太嚴格。實務上很少 100% 通過。重要的是 Critical 和 Major 處理。"),
                                Challenge.Option(id: "B", text: "95%+ test cases 通過 + 0 open Critical + 所有 Major 有 workaround 或修復計畫 + 核心業務流程全部通過", explanation: "正確！務實的 Exit Criteria：覆蓋率門檻 + 嚴重度門檻 + 核心流程門檻。允許 Minor 和 Cosmetic 在上線後修復。"),
                                Challenge.Option(id: "C", text: "沒有標準，PO 感覺可以就上", explanation: "沒有客觀標準會導致爭議和風險。"),
                                Challenge.Option(id: "D", text: "只要核心流程通過", explanation: "太寬鬆。需要量化的門檻。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Exit Criteria 要在 UAT 開始前定義",
                                "要務實但有明確標準",
                            ],
                            explanation: "Exit Criteria 在 UAT 開始前定義，避免上線時的主觀爭議。好的 EC 是量化的、分級的、務實的。",
                            frameworkTip: "Exit Criteria = 通過率門檻 + 嚴重度門檻 + 核心流程門檻 + 修復計畫要求"
                        ),
                        Challenge(
                            id: 2,
                            name: "簽核流程",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "UAT 簽核",
                                narrative: "UAT 結束。你準備 UAT Sign-off 文件。業務主管猶豫不決：「萬一上線出問題我要負責嗎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "說「不會有問題」", explanation: "不能承諾沒有問題。要誠實呈現風險。"),
                                Challenge.Option(id: "B", text: "準備清楚的 Sign-off 文件：UAT 結果摘要+已知問題和處理計畫+剩餘風險+上線後監控計畫，讓主管基於完整資訊決策", explanation: "正確！Sign-off 不是「保證沒問題」而是「確認已知狀況可接受」。BA 要提供完整資訊讓簽核者做 informed decision。"),
                                Challenge.Option(id: "C", text: "請 PM 去處理", explanation: "踢球不專業。UAT 結果呈現是 BA 的職責。"),
                                Challenge.Option(id: "D", text: "不需要簽核直接上線", explanation: "正式的 Sign-off 是風險管理和責任明確的重要步驟。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Sign-off = 確認已知狀況可接受，不是保證沒問題",
                                "BA 的職責：提供完整資訊",
                            ],
                            explanation: "UAT Sign-off 文件：測試結果摘要 + 已知問題 + 處理計畫 + 剩餘風險 + 監控計畫。讓簽核者做 informed decision。",
                            frameworkTip: "Sign-off 文件：結果摘要 + 已知問題 + 修復計畫 + 剩餘風險 + 監控計畫"
                        ),
                    ]
                ),
                Quest(
                    id: "35-5",
                    name: "Regression 與回歸測試",
                    description: "確保修改不影響既有功能",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "回歸測試範圍",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "回歸測試應該測什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "變更影響",
                                narrative: "上線後發現 bug：折扣計算錯誤。開發修好後，你需要決定回歸測試範圍。\n\n修改涉及：折扣計算模組。相關功能：結帳、購物車、訂單摘要、發票、報表。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只測折扣計算", explanation: "修改可能影響其他用到折扣金額的功能。"),
                                Challenge.Option(id: "B", text: "測折扣計算 + 所有跟金額相關的功能（結帳、訂單摘要、發票、報表）", explanation: "正確！回歸測試要覆蓋：直接修改的功能 + 上下游相關功能。折扣金額改了，所有顯示或使用金額的地方都要驗證。"),
                                Challenge.Option(id: "C", text: "重新測所有功能", explanation: "太廣了。時間不允許且不需要。只測受影響的範圍。"),
                                Challenge.Option(id: "D", text: "不需要回歸測試", explanation: "修改後不做回歸測試是很大的風險。「修一個壞兩個」太常見了。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "影響分析：這個修改會影響哪些上下游功能？",
                                "回歸測試 = 確保修改不壞其他東西",
                            ],
                            explanation: "回歸測試範圍 = 直接修改 + 上下游影響。BA 的價值：做 Impact Analysis 確定回歸範圍，不遺漏也不過度。",
                            frameworkTip: "回歸範圍：直接修改 + 上下游功能 + 共用模組。BA 做 Impact Analysis 決定範圍。"
                        ),
                        Challenge(
                            id: 2,
                            name: "自動化測試策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 應該建議什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "測試金字塔",
                                narrative: "你的系統每次更新都要做回歸測試。手動測試需要 3 天（50 個 test cases）。每兩週一次更新。團隊開始覺得手動回歸太花時間。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "不測了，直接上", explanation: "風險太高。"),
                                Challenge.Option(id: "B", text: "建議自動化核心業務流程的回歸測試，減少手動時間。BA 的角色：定義哪些場景最重要需要自動化", explanation: "正確！BA 的角色不是寫自動化腳本，而是定義「哪些場景最重要」。核心業務流程（如結帳、付款、退款）優先自動化。目標：3 天手動 → 1 天自動 + 1 天手動（新功能和複雜場景）。"),
                                Challenge.Option(id: "C", text: "全部自動化", explanation: "全部自動化成本高且有些場景不適合（如 UI 體驗）。"),
                                Challenge.Option(id: "D", text: "減少 test cases", explanation: "減少測試會增加風險。應該是用自動化提高效率不是減少覆蓋。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 定義「測什麼」，QA/Dev 決定「怎麼自動化」",
                                "核心流程優先自動化",
                            ],
                            explanation: "BA 在測試自動化中的角色：定義業務優先級。哪些場景最常跑？最關鍵？最適合自動化？BA 不需要寫腳本但需要提供 test case 和優先級。",
                            frameworkTip: "自動化優先級：核心業務流程 > 高頻場景 > Regression 重複案例 > Edge Cases"
                        ),
                    ]
                ),
                Quest(
                    id: "35-6",
                    name: "UAT 完整案例",
                    description: "規劃完整的 UAT",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：UAT 規劃",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "新會員系統 UAT",
                                narrative: "電商新會員忠誠計畫即將上線。功能：積點、等級、兌換、會員價。\n\n上線日期 4 週後。你需要規劃 UAT。\n利害關係人：行銷部（積點規則）、客服（會員查詢）、財務（積點成本）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "不同部門測不同功能",
                                "時間表要包含修復和回歸時間",
                            ],
                            explanation: "完整 UAT 規劃：範圍 → Test Cases → Exit Criteria → 時間表 → 缺陷流程 → Sign-off。",
                            frameworkTip: "UAT 規劃 = 範圍 + Test Cases + Exit Criteria + Timeline + Defect Process + Sign-off"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 36: 商業分析框架
        World(
            id: 36,
            name: "商業分析框架",
            emoji: "🧠",
            description: "掌握 SWOT、Porter、PESTLE 等策略分析框架",
            quests: [
                Quest(
                    id: "36-1",
                    name: "SWOT 分析",
                    description: "識別優勢劣勢機會威脅",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SWOT 分類",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "分類最正確的是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SWOT 分析",
                                narrative: "你是電商公司 BA。主管要你做 SWOT 分析。公司現況：\n\n• 自有倉庫出貨快（平均 24hr）\n• 技術團隊只有 5 人\n• 東南亞電商市場快速成長\n• 大型平台（Shopee、Momo）正在降價搶市場",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都是 Threats", explanation: "出貨快是優勢，東南亞成長是機會。"),
                                Challenge.Option(id: "B", text: "S: 出貨快 / W: 技術團隊小 / O: 東南亞市場 / T: 大平台降價", explanation: "正確！S/W 是內部因素（我們能控制的），O/T 是外部因素（環境趨勢）。出貨速度是內部強項，技術團隊規模是內部弱點，東南亞是外部機會，平台降價是外部威脅。"),
                                Challenge.Option(id: "C", text: "S: 東南亞市場 / W: 大平台降價", explanation: "S/W 是內部因素，不是外部的。"),
                                Challenge.Option(id: "D", text: "沒辦法分類需要更多資訊", explanation: "資訊已經足夠做初步分類。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "S/W = 內部（我們的）",
                                "O/T = 外部（環境的）",
                            ],
                            explanation: "SWOT 核心：內部（Strengths/Weaknesses）vs 外部（Opportunities/Threats）。分析後的重點是策略：用 S 抓 O、用 S 對抗 T、改善 W、避免 W+T。",
                            frameworkTip: "SWOT：S/W 看內部（人才/技術/資源）/ O/T 看外部（市場/競爭/趨勢）"
                        ),
                        Challenge(
                            id: 2,
                            name: "SWOT 轉策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最佳的 SO 策略（用 Strength 抓 Opportunity）是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SWOT 策略",
                                narrative: "繼續上題的 SWOT：\nS: 出貨快、客戶忠誠度高\nW: 技術團隊小、產品線窄\nO: 東南亞市場、訂閱制趨勢\nT: 大平台降價、人才搶手",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "降價對抗大平台", explanation: "降價是用 W 對抗 T。不是 SO 策略。"),
                                Challenge.Option(id: "B", text: "利用出貨速度優勢+高忠誠客戶群推出東南亞訂閱制服務", explanation: "正確！SO 策略：用「出貨快」+ 「客戶忠誠」的優勢，抓住「東南亞市場」+「訂閱制」的機會。出貨快讓訂閱制體驗好，忠誠客戶是首批訂閱者。"),
                                Challenge.Option(id: "C", text: "招更多工程師", explanation: "這是改善 W 不是 SO 策略。"),
                                Challenge.Option(id: "D", text: "什麼都不做", explanation: "浪費了明確的 SO 機會。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "SO = 用我們的強項抓外部機會",
                                "S+O 的交集就是最佳策略",
                            ],
                            explanation: "SWOT 矩陣四種策略：SO（用S抓O）、ST（用S對抗T）、WO（改善W抓O）、WT（改善W避免T）。SO 是最主動的策略。",
                            frameworkTip: "SWOT 策略矩陣：SO（進攻）/ WO（改善）/ ST（防禦）/ WT（撤退/轉型）"
                        ),
                    ]
                ),
                Quest(
                    id: "36-2",
                    name: "Porter Five Forces",
                    description: "分析產業競爭力量",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "五力分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "目前最大的競爭壓力來自哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "產業分析",
                                narrative: "你分析台灣外送平台市場（Uber Eats、foodpanda）：\n\n• 新進入者：Line 正考慮進入外送市場\n• 替代品：自取、超市即食、自煮\n• 供應商（餐廳）：有些頂級餐廳拒絕上平台\n• 買方（消費者）：價格敏感，比較外送費\n• 現有競爭：兩強補貼搶市場",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "新進入者（Line）", explanation: "Line 還在考慮，威脅尚未實現。"),
                                Challenge.Option(id: "B", text: "現有競爭者之間的補貼戰 + 買方的高價格敏感度", explanation: "正確！兩強補貼戰（現有競爭激烈）+ 消費者只看價格（買方議價力高）= 雙重壓力導致利潤被壓縮。這解釋了為什麼外送平台很難獲利。"),
                                Challenge.Option(id: "C", text: "替代品", explanation: "自取和自煮一直存在，不是新的壓力。"),
                                Challenge.Option(id: "D", text: "供應商", explanation: "頂級餐廳拒絕是損失但不是最大壓力。大部分餐廳願意上平台。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "五力分析：找到最大的壓力點",
                                "利潤被壓縮通常是競爭+買方雙重壓力",
                            ],
                            explanation: "Porter Five Forces 幫助理解產業結構。外送市場的利潤困境：高競爭 + 高買方議價力 = 低利潤。策略方向：差異化（不只是低價競爭）。",
                            frameworkTip: "Five Forces：新進入者 / 替代品 / 供應商議價 / 買方議價 / 現有競爭。最大壓力 = 獲利障礙。"
                        ),
                        Challenge(
                            id: 2,
                            name: "策略建議",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "最有策略性的建議？",
                            scenario: 
                            Challenge.Scenario(
                                title: "競爭策略",
                                narrative: "基於五力分析，你要為外送平台建議策略。\n\n問題：\n• 補貼戰不可持續\n• 消費者只看價格\n• 餐廳抽成 25-35% 引發不滿\n• Line 可能進入（有 1,200 萬用戶基礎）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "繼續補貼搶市場", explanation: "不可持續。燒完錢怎麼辦？"),
                                Challenge.Option(id: "B", text: "建立轉換成本：會員制（月費送免外送費）+ 獨家餐廳 + 數據個人化推薦。降低買方議價力+提高進入障礙", explanation: "正確！策略核心：建立 moat（護城河）。會員制 → 降低價格敏感度。獨家餐廳 → 供應商鎖定。數據推薦 → 使用者體驗差異化。Line 進入也搶不走付費會員。"),
                                Challenge.Option(id: "C", text: "降低餐廳抽成", explanation: "短期討好餐廳但利潤更低。不是策略性解法。"),
                                Challenge.Option(id: "D", text: "退出市場", explanation: "市場仍在成長，退出太早。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Porter 的核心：建立可持續的競爭優勢",
                                "轉換成本 = 讓客戶離開的代價",
                            ],
                            explanation: "Five Forces 的策略回應：建立護城河（moat）降低各方壓力。會員制（降低買方議價力）、獨家內容（提高進入障礙）、差異化體驗（降低替代品威脅）。",
                            frameworkTip: "策略回應五力：建立轉換成本 + 差異化 + 獨家供應 + 規模效益 + 創新"
                        ),
                    ]
                ),
                Quest(
                    id: "36-3",
                    name: "PESTLE 分析",
                    description: "分析宏觀環境因素",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "PESTLE 分類",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "正確的 PESTLE 分類？",
                            scenario: 
                            Challenge.Scenario(
                                title: "PESTLE 因素",
                                narrative: "你在評估一家金融科技公司的外部環境：\n\n• 政府推動電子支付政策\n• GDP 成長趨緩\n• Z 世代偏好行動支付\n• AI 技術快速發展\n• 個資保護法更嚴格\n• 綠色金融趨勢",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都是 T（Technology）", explanation: "只有 AI 是 Technology。政策是 Political，GDP 是 Economic。"),
                                Challenge.Option(id: "B", text: "P: 電子支付政策 / E: GDP 趨緩 / S: Z 世代偏好 / T: AI 技術 / L: 個資保護法 / E(Environment): 綠色金融", explanation: "正確！PESTLE 六維度：Political（政策）、Economic（經濟）、Social（社會/人口）、Technological（技術）、Legal（法律）、Environmental（環境）。"),
                                Challenge.Option(id: "C", text: "太多因素無法分類", explanation: "PESTLE 就是為了系統化分類外部因素。"),
                                Challenge.Option(id: "D", text: "P 和 L 是一樣的", explanation: "Political 是政策方向（可能變），Legal 是已立法的規範（必須遵守）。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "PESTLE = Political / Economic / Social / Technological / Legal / Environmental",
                            ],
                            explanation: "PESTLE 確保你不會遺漏任何宏觀環境因素。每個維度都可能帶來機會或威脅，連結到 SWOT 的 O/T。",
                            frameworkTip: "PESTLE → SWOT 的 O/T。政策變化 = 機會或威脅？技術趨勢 = 機會或威脅？"
                        ),
                        Challenge(
                            id: 2,
                            name: "PESTLE 應用",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 應該做什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "影響評估",
                                narrative: "個資保護法更嚴格（PESTLE 的 L）。\n\n你的公司收集大量使用者行為數據做個人化推薦。新法規要求：明確同意、資料最小化、刪除權。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "這是法務的事", explanation: "BA 需要分析法規對產品和流程的影響。"),
                                Challenge.Option(id: "B", text: "Impact Analysis：分析法規對現有功能的影響→列出需要修改的功能（同意機制、資料收集範圍、刪除功能）→評估成本和時間→提出合規計畫", explanation: "正確！BA 的價值：把法規要求翻譯成具體的系統和流程變更。法務說「要合規」，BA 定義「怎麼在系統中實現合規」。"),
                                Challenge.Option(id: "C", text: "停止收集數據", explanation: "太極端。可以在合規的前提下繼續收集。"),
                                Challenge.Option(id: "D", text: "等法規正式實施再處理", explanation: "法規通常有過渡期，提早準備才來得及。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 的價值：把外部要求翻譯成系統和流程變更",
                                "PESTLE 分析後的行動比分析本身更重要",
                            ],
                            explanation: "PESTLE 分析的目的不是分析本身，而是觸發行動。BA 把外部變化翻譯成具體的需求和行動計畫。",
                            frameworkTip: "PESTLE → Impact Analysis → 需要變更的功能/流程 → 行動計畫"
                        ),
                    ]
                ),
                Quest(
                    id: "36-4",
                    name: "Business Model Canvas",
                    description: "用一頁描述商業模式",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "BMC 九宮格",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Netflix 的 Value Proposition 最核心的是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BMC 分析",
                                narrative: "你在分析 Netflix 的商業模式。CEO 要你用 Business Model Canvas 一頁呈現。\n\nBMC 九宮格：\n1. Customer Segments\n2. Value Propositions\n3. Channels\n4. Customer Relationships\n5. Revenue Streams\n6. Key Resources\n7. Key Activities\n8. Key Partnerships\n9. Cost Structure",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "便宜", explanation: "比電影院便宜但不是最核心的價值。有更便宜的盜版但人還是選 Netflix。"),
                                Challenge.Option(id: "B", text: "隨時隨地看無限內容+個人化推薦+原創內容", explanation: "正確！三層價值：便利性（隨時看）+ 選擇權（無限內容）+ 發現性（推薦演算法幫你找到想看的）+ 獨家性（只在 Netflix 有的原創）。"),
                                Challenge.Option(id: "C", text: "有很多影片", explanation: "「很多」不是差異化。其他平台也有很多。關鍵是推薦和原創。"),
                                Challenge.Option(id: "D", text: "畫質好", explanation: "畫質是基本要求不是核心價值。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Value Proposition = 客戶為什麼選你而不是競爭對手",
                                "不只是功能，是價值",
                            ],
                            explanation: "Value Proposition 是 BMC 的核心。它回答：客戶為什麼付錢給你？你解決了什麼問題或提供了什麼價值？",
                            frameworkTip: "Value Proposition = 解決什麼問題 + 提供什麼價值 + 為什麼選你而不是別人"
                        ),
                        Challenge(
                            id: 2,
                            name: "BMC 一致性",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "這個 BMC 最大的問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BMC 問題",
                                narrative: "一家新創的 BMC：\n\nCustomer: 企業客戶（B2B）\nValue Prop: 低價 SaaS\nChannels: 社群媒體廣告\nRevenue: 月訂閱 $99/月\nKey Resources: 3 人工程團隊\nCost Structure: 高額 Google Ads 費用",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "價格太低", explanation: "可能是問題但不是 BMC 結構問題。"),
                                Challenge.Option(id: "B", text: "Channel 跟 Customer 不一致 — B2B 企業客戶很少透過社群媒體廣告購買 SaaS。應該用內容行銷/Sales/合作夥伴", explanation: "正確！BMC 的九宮格要內部一致。B2B 客戶決策者不會因為 Facebook 廣告就買 SaaS。正確的 Channel：LinkedIn + 內容行銷 + Sales team + 產業活動。同時 Cost Structure 的高額 Google Ads 也跟 B2B 不匹配。"),
                                Challenge.Option(id: "C", text: "團隊太小", explanation: "3 人團隊如果是 MVP 階段是可以的。"),
                                Challenge.Option(id: "D", text: "沒有合作夥伴", explanation: "是一個問題但不是「最大的」結構性問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BMC 九宮格要互相呼應",
                                "Channel 要配合 Customer Segment",
                            ],
                            explanation: "BMC 的價值在於檢查一致性。每個宮格不是獨立的，而是互相關聯。Channel 配 Customer、Revenue 配 Value Prop、Cost 配 Key Activities。",
                            frameworkTip: "BMC 一致性檢查：Channel 配 Customer / Revenue 配 Value Prop / Cost 配 Activities"
                        ),
                    ]
                ),
                Quest(
                    id: "36-5",
                    name: "Cost-Benefit Analysis",
                    description: "量化方案的成本和效益",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CBA 基礎",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "3 年 NPV（不考慮折現）哪個方案更好？",
                            scenario: 
                            Challenge.Scenario(
                                title: "方案比較",
                                narrative: "兩個方案解決客服效率問題：\n\n方案 A：Chatbot\n• 開發成本：$200K\n• 年維護：$50K\n• 預期減少 40% 客服電話（省 $300K/年）\n\n方案 B：客服系統升級\n• 升級成本：$100K\n• 年維護：$30K\n• 預期提升效率 25%（省 $180K/年）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "方案 A：總投資 $350K、總節省 $900K、淨收益 $550K", explanation: "計算：$200K + $50K×3 = $350K 成本，$300K×3 = $900K 節省。淨收益 $550K。"),
                                Challenge.Option(id: "B", text: "方案 B：總投資 $190K、總節省 $540K、淨收益 $350K", explanation: "計算正確但方案 A 淨收益更高。"),
                                Challenge.Option(id: "C", text: "方案 A 淨收益 $550K > 方案 B $350K，但方案 B 的 ROI 更高（184% vs 157%）。建議看公司有多少預算", explanation: "正確！方案 A 賺更多但要投更多。方案 B 投入少 ROI 高。預算充足選 A，預算有限選 B。BA 應該呈現兩個維度讓決策者選。"),
                                Challenge.Option(id: "D", text: "無法比較", explanation: "數據充分可以比較。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "CBA 不只比較淨收益，還要比較 ROI",
                                "同樣的錢投在 ROI 更高的地方",
                            ],
                            explanation: "CBA 要看多個維度：淨收益（絕對值）、ROI（相對值）、Payback Period（回收期）。不同維度可能指向不同結論，BA 要呈現完整圖片。",
                            frameworkTip: "CBA 三維度：淨收益（賺多少）/ ROI（投報率）/ Payback（多快回本）"
                        ),
                        Challenge(
                            id: 2,
                            name: "隱形成本",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "這說明了什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "完整成本",
                                narrative: "Chatbot 方案被核准了。你在做更詳細的成本分析時發現：\n\n除了開發和維護費用，還有：\n• 訓練 chatbot 需要 3 個月的客服主管時間（$30K 機會成本）\n• 客戶因為 chatbot 體驗差而流失的風險（估計 2% 客戶流失 = $100K/年）\n• IT 團隊維護和模型更新的隱形工時\n• 組織變革的成本（客服團隊 restructuring）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "不應該做 Chatbot", explanation: "不一定。但要把隱形成本納入計算重新評估。"),
                                Challenge.Option(id: "B", text: "CBA 要包含顯性成本和隱性成本。初始分析常低估成本因為只看直接費用", explanation: "正確！CBA 常見錯誤：只看直接成本（開發+維護），忽略間接成本（機會成本、風險成本、組織變革成本）。BA 的價值：讓決策者看到完整的成本圖片。"),
                                Challenge.Option(id: "C", text: "所有成本都無法預測", explanation: "可以估算。重要的是承認不確定性並提供範圍（最佳/最可能/最差）。"),
                                Challenge.Option(id: "D", text: "這些都不重要", explanation: "客戶流失 $100K/年很重要。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看得見的成本只是冰山一角",
                                "BA 要幫助看到完整的成本圖片",
                            ],
                            explanation: "完整的 CBA 包含：直接成本 + 間接成本（機會成本、風險成本、組織變革）+ 不可量化的因素（員工士氣、品牌影響）。",
                            frameworkTip: "成本完整性：直接成本 + 機會成本 + 風險成本 + 組織變革成本 + 維護成本"
                        ),
                    ]
                ),
                Quest(
                    id: "36-6",
                    name: "策略分析綜合案例",
                    description: "用多個框架分析商業問題",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：策略分析報告",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "市場進入分析",
                                narrative: "你是台灣中型電商公司的 BA。CEO 考慮進入東南亞市場（越南或泰國）。\n\n公司現況：台灣市佔 5%、年營收 $50M、技術團隊 30 人、物流自有倉庫。\n\n競爭對手 Shopee、Lazada 已在東南亞。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "多個框架互相補充，不是獨立使用",
                                "建議要具體可行不能太空泛",
                            ],
                            explanation: "策略分析不是「用一個框架」而是「多框架互相驗證和補充」。PESTLE→機會/威脅→SWOT→策略→BMC→行動計畫。",
                            frameworkTip: "策略分析流程：PESTLE(環境) → Five Forces(產業) → SWOT(我們) → 策略選擇 → BMC(商業模式)"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 37: BA 職涯發展
        World(
            id: 37,
            name: "BA 職涯發展",
            emoji: "🚀",
            description: "規劃 BA 職涯路徑、面試準備、持續學習",
            quests: [
                Quest(
                    id: "37-1",
                    name: "BA 職涯路徑",
                    description: "了解 BA 的不同職涯方向",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "職涯方向",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "BA 的職涯發展路徑有哪些？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA 職涯",
                                narrative: "你當了 3 年 BA，開始思考下一步。主管說 BA 有很多發展方向，不只是「資深 BA」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "只能一直當 BA", explanation: "BA 的技能組合讓你有很多發展方向。"),
                                Challenge.Option(id: "B", text: "專家路線（Senior/Lead BA）、管理路線（BA Manager）、轉型路線（Product Manager/Consultant/Data Analyst）", explanation: "正確！三大方向：(1) 深耕 BA 成為 domain expert (2) 帶團隊做 BA Manager (3) 利用 BA 技能轉型到 PM、顧問、數據分析等。BA 的核心技能（分析、溝通、文件）在很多角色都有價值。"),
                                Challenge.Option(id: "C", text: "只能轉技術", explanation: "BA 不一定要轉技術。商業方向（PM、顧問）也是好選擇。"),
                                Challenge.Option(id: "D", text: "只能轉管理", explanation: "管理只是選項之一。專家路線也很有價值。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 的核心技能在很多角色都有價值",
                                "不一定要「往上」，可以「往旁」發展",
                            ],
                            explanation: "BA 職涯三大路徑：專家（深耕領域）、管理（帶團隊）、轉型（PM/顧問/數據）。關鍵是了解自己的興趣和優勢。",
                            frameworkTip: "BA 職涯：專家路線（Lead BA/Domain Expert）/ 管理路線（BA Manager）/ 轉型路線（PM/Consultant/Data）"
                        ),
                        Challenge(
                            id: 2,
                            name: "BA vs PM",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 和 PM 最核心的差異是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "角色差異",
                                narrative: "你考慮從 BA 轉 PM。朋友說：「BA 和 PM 不是一樣嗎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "一樣，只是公司叫法不同", explanation: "有重疊但核心職責不同。"),
                                Challenge.Option(id: "B", text: "BA 專注「分析和定義需求」（What to build），PM 專注「產品策略和優先級」（What to build + Why + When）", explanation: "正確！BA 深入分析需求和可行性。PM 還要負責產品願景、roadmap、優先級、Go-to-Market。PM 的視角更廣（商業+使用者+技術），BA 的分析更深（需求+流程+資料）。"),
                                Challenge.Option(id: "C", text: "PM 比 BA 高級", explanation: "不是高低問題。是不同的專業方向。"),
                                Challenge.Option(id: "D", text: "BA 偏技術，PM 偏商業", explanation: "BA 也很商業。差異不在技術/商業而在職責範圍。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 深入分析，PM 廣泛策略",
                                "兩者互補不是替代",
                            ],
                            explanation: "BA 和 PM 互補：BA 的深度分析能力讓 PM 做更好的決策。從 BA 轉 PM 需要加強：產品策略、數據驅動決策、Go-to-Market。",
                            frameworkTip: "BA → PM 需要加強：產品願景 / Roadmap 規劃 / 數據驅動決策 / Go-to-Market 策略"
                        ),
                    ]
                ),
                Quest(
                    id: "37-2",
                    name: "BA 面試準備",
                    description: "準備 BA 面試的常見題型",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "情境題",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "用什麼框架回答最好？",
                            scenario: 
                            Challenge.Scenario(
                                title: "面試情境",
                                narrative: "面試官問：「你遇過 stakeholder 之間需求衝突的情況嗎？你怎麼處理的？」\n\n你有一個經驗：業務部要「快速上線」但法務要「完整合規」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接說結果", explanation: "缺少過程。面試官想知道你怎麼思考和行動。"),
                                Challenge.Option(id: "B", text: "STAR 框架：Situation（背景）→ Task（你的職責）→ Action（你做了什麼）→ Result（結果和學到什麼）", explanation: "正確！STAR 讓回答有結構。S: 業務和法務需求衝突。T: BA 負責找到平衡方案。A: 分別訪談理解核心需求→找到分階段上線方案（核心功能先上+合規功能同步開發）。R: 按時上線+法務滿意+建立跨部門溝通機制。"),
                                Challenge.Option(id: "C", text: "說「我讓他們自己溝通」", explanation: "面試官想看你的主動性和問題解決能力。"),
                                Challenge.Option(id: "D", text: "詳細說 30 分鐘", explanation: "太長。STAR 讓你在 2-3 分鐘內說完重點。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "STAR 讓回答有結構和重點",
                                "2-3 分鐘說完，結果要量化",
                            ],
                            explanation: "STAR 是行為面試的標準框架。關鍵：Action 要具體（你做了什麼，不是團隊做了什麼），Result 要量化或有具體影響。",
                            frameworkTip: "STAR：Situation（30秒）→ Task（15秒）→ Action（1-2分鐘，具體你做了什麼）→ Result（30秒，量化）"
                        ),
                        Challenge(
                            id: 2,
                            name: "案例分析題",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "最好的分析結構是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "面試案例",
                                narrative: "面試官給你一個 case：「公司想推出外送服務（類似 Uber Eats），你是 BA，如何開始分析？」\n\n你有 10 分鐘準備。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接列功能清單", explanation: "太跳步了。沒有先理解商業目標和使用者就列功能是 BA 的大忌。"),
                                Challenge.Option(id: "B", text: "由外到內：商業目標（為什麼做）→ 使用者分析（誰用/痛點）→ 競品分析 → 核心功能定義 → MVP 範圍 → 風險", explanation: "正確！展示系統性思維：(1) Why: 商業目標和 KPI (2) Who: 使用者 persona 和痛點 (3) What: 競品已有什麼 (4) How: 核心功能和 MVP (5) Risk: 技術/商業/法規風險。面試官看的是你的思考過程不是答案。"),
                                Challenge.Option(id: "C", text: "先問面試官更多問題", explanation: "問一些關鍵問題是好的（如預算、時間），但不能只問不分析。"),
                                Challenge.Option(id: "D", text: "畫 UI mockup", explanation: "UI 是最後的事。先理解需求再畫 UI。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "面試看的是思考過程不是正確答案",
                                "由外到內：Why → Who → What → How → Risk",
                            ],
                            explanation: "案例分析展示 BA 的系統性思維。關鍵不是「正確答案」而是「結構化的分析過程」。面試官看你怎麼拆解問題。",
                            frameworkTip: "案例分析結構：Why（目標）→ Who（使用者）→ What（範圍）→ How（方案）→ Risk（風險）"
                        ),
                    ]
                ),
                Quest(
                    id: "37-3",
                    name: "BA Portfolio 作品集",
                    description: "展示你的 BA 能力",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "作品集內容",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼準備最好？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Portfolio",
                                narrative: "你要準備 BA 作品集用於面試。你有以下可以展示的東西：\n\n• 寫過的 BRD（含公司機密資訊）\n• 流程圖和 wireframe\n• Stakeholder 分析文件\n• 專案成果數據\n• 你自己做的 side project 分析",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接拿公司文件", explanation: "公司文件有機密資訊和版權問題。不能直接使用。"),
                                Challenge.Option(id: "B", text: "把公司案例去識別化（Anonymize）+ side project 展示完整分析過程 + 用「我做了什麼、影響是什麼」的結構呈現", explanation: "正確！去識別化保護機密，side project 展示你的主動性和完整能力。每個作品用 Context→你的貢獻→影響/結果 的結構呈現。面試官想看你能做什麼，不是公司做了什麼。"),
                                Challenge.Option(id: "C", text: "只放 side project", explanation: "Side project 好但缺少真實專案經驗的展示。去識別化的真實案例更有說服力。"),
                                Challenge.Option(id: "D", text: "不需要作品集，面試回答就好", explanation: "有作品集的候選人比只有口述的更有說服力。Show, don't tell。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "去識別化：改公司名、改數字、改產品名",
                                "Show, don't tell — 展示比口述更有說服力",
                            ],
                            explanation: "BA Portfolio 結構：3-5 個案例，每個用 Context → Contribution → Impact。混合真實案例（去識別化）和 side project。",
                            frameworkTip: "Portfolio 結構：Context（背景）→ Your Contribution（你做了什麼）→ Impact（結果/數據）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Side Project 示範",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "什麼樣的 side project 最能展示 BA 能力？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Side Project",
                                narrative: "你想做一個 BA side project 放在作品集中。你沒有真實客戶。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "分析一個知名 App 的功能", explanation: "太淺了。只是描述功能不是分析。"),
                                Challenge.Option(id: "B", text: "選一個真實問題，做完整的 BA 交付物：Stakeholder 分析→需求訪談（模擬）→BRD→User Stories + AC→流程圖→Wireframe→UAT Plan", explanation: "正確！展示端到端的 BA 能力。例如：「分析 Uber Eats 的退貨流程優化」→做 As-Is/To-Be 流程圖→寫 User Stories→設計 wireframe。每個步驟都展示不同的 BA 技能。"),
                                Challenge.Option(id: "C", text: "寫一份很長的文件", explanation: "長不等於好。重點是結構和品質。"),
                                Challenge.Option(id: "D", text: "做一個技術專案", explanation: "BA 的 side project 應該展示分析能力不是技術能力。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "展示端到端能力比展示單一技能更有說服力",
                                "用真實的問題（公開資訊）做分析",
                            ],
                            explanation: "BA Side Project 最佳做法：選公開的真實問題（如 App 的使用者痛點），做完整的 BA 分析和交付物。展示你能從問題到解法的全過程。",
                            frameworkTip: "Side Project = 真實問題 + 完整 BA 交付物（BRD/Stories/流程圖/Wireframe/UAT）"
                        ),
                    ]
                ),
                Quest(
                    id: "37-4",
                    name: "持續學習策略",
                    description: "保持 BA 技能的競爭力",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "學習領域",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "BA 最值得投資的學習方向？",
                            scenario: 
                            Challenge.Scenario(
                                title: "技能發展",
                                narrative: "你想提升 BA 競爭力。市場上 BA 職缺越來越多要求「技術背景」或「數據分析能力」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "學程式設計成為全端工程師", explanation: "過度投資。BA 不需要成為工程師，但需要理解技術概念。"),
                                Challenge.Option(id: "B", text: "SQL + 資料分析 + API 概念 + 產業知識。能跟技術團隊對話、能自己查資料驗證假設", explanation: "正確！BA 的技術技能目標：(1) SQL 讓你能自己查資料不用等工程師 (2) 資料分析讓你能用數據支持建議 (3) API 概念讓你能跟技術團隊有效溝通 (4) 產業知識讓你成為 domain expert。"),
                                Challenge.Option(id: "C", text: "考越多認證越好", explanation: "認證有價值但不是最重要的。實作能力 > 證書。"),
                                Challenge.Option(id: "D", text: "BA 已經很全面不需要學新東西", explanation: "市場在變。AI、數據分析、API 經濟都在影響 BA 的角色。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "目標不是成為技術專家而是「能對話」",
                                "SQL 是 BA 最實用的技術技能",
                            ],
                            explanation: "BA 技術能力目標：能跟工程師有效溝通（API/DB 概念）+ 能自己做基礎數據分析（SQL/Excel/BI）+ 產業深度知識。",
                            frameworkTip: "BA 技能投資：SQL（必學）+ 資料分析（高價值）+ API 概念（有效溝通）+ 產業知識（domain expert）"
                        ),
                        Challenge(
                            id: 2,
                            name: "AI 對 BA 的影響",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "AI 時代 BA 最不可被取代的能力是？",
                            scenario: 
                            Challenge.Scenario(
                                title: "AI 時代的 BA",
                                narrative: "ChatGPT 等 AI 工具興起。有人說「AI 會取代 BA」。你開始思考 AI 對 BA 角色的影響。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "文件撰寫", explanation: "AI 可以輔助文件撰寫。這不是最不可取代的。"),
                                Challenge.Option(id: "B", text: "理解商業脈絡、管理利害關係人關係、在模糊中做判斷、促進跨團隊對齊", explanation: "正確！AI 擅長：資料分析、文件生成、模式識別。AI 不擅長：理解組織政治、在不完整資訊中做判斷、建立人際信任、促進對齊。BA 的價值越來越在「人」的部分。"),
                                Challenge.Option(id: "C", text: "Excel 公式", explanation: "AI 比人更擅長公式。"),
                                Challenge.Option(id: "D", text: "畫流程圖", explanation: "AI 可以輔助畫流程圖。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "AI 擅長處理資訊，人擅長處理關係",
                                "BA 的價值越來越在「人」的面向",
                            ],
                            explanation: "AI 時代的 BA：用 AI 提升效率（文件、分析、初稿），把更多時間花在 AI 不擅長的事（stakeholder 管理、判斷、對齊）。BA + AI = 超級 BA。",
                            frameworkTip: "AI 時代 BA：AI 做資料/文件/初稿 → BA 做判斷/關係/對齊 = 效率 × 品質"
                        ),
                    ]
                ),
                Quest(
                    id: "37-5",
                    name: "BA 認證指南",
                    description: "了解 BA 相關認證的價值",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "認證選擇",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "對 3 年經驗的 BA 最有價值的認證組合？",
                            scenario: 
                            Challenge.Scenario(
                                title: "BA 認證",
                                narrative: "你考慮考 BA 認證。常見的有：\n• CBAP（IIBA — 資深 BA）\n• PMI-PBA（PMI — PM 機構的 BA 認證）\n• CSPO/CSM（Scrum Alliance — 敏捷認證）\n• AWS/Azure 認證（雲端技術）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部都考", explanation: "認證需要時間和金錢。選對自己職涯方向最有價值的。"),
                                Challenge.Option(id: "B", text: "CBAP 或 PMI-PBA（證明 BA 專業）+ CSPO（如果走 Agile/PM 方向）", explanation: "正確！CBAP/PMI-PBA 是 BA 的黃金認證。如果想往 Agile PM 發展加 CSPO。技術認證對 BA 來說 ROI 較低（除非走技術 BA 方向）。"),
                                Challenge.Option(id: "C", text: "只考技術認證", explanation: "BA 的核心認證（CBAP/PMI-PBA）比技術認證更對口。"),
                                Challenge.Option(id: "D", text: "不需要認證", explanation: "認證不是必要但有幫助：(1) 系統化學習 (2) 履歷加分 (3) 薪資談判籌碼。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "認證跟職涯方向對齊",
                                "CBAP/PMI-PBA 是 BA 的標準認證",
                            ],
                            explanation: "認證選擇要跟職涯方向對齊。BA 方向：CBAP/PMI-PBA。Agile 方向：CSPO/SAFe。數據方向：Google Data Analytics。",
                            frameworkTip: "認證選擇：BA 專業（CBAP/PBA）+ 方向性認證（Agile/Data/Domain）"
                        ),
                        Challenge(
                            id: 2,
                            name: "經驗 vs 認證",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "誰更可能被錄取？",
                            scenario: 
                            Challenge.Scenario(
                                title: "面試評估",
                                narrative: "你是面試官，兩個候選人：\n\nA: 5 年經驗、3 張認證（CBAP+PMP+CSPO）、能清楚描述專案經驗和方法論\nB: 3 年經驗、0 張認證、但有作品集展示完整的分析流程，面試中展現優秀的思維能力",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "A — 認證多經驗久", explanation: "認證多是加分但不是決定性因素。"),
                                Challenge.Option(id: "B", text: "取決於職位需求，但通常 B 的表現（展示能力）比 A 的資歷（紙上談兵）更有說服力", explanation: "正確！實際能力 > 認證數量。B 的作品集和面試表現直接展示了能力。A 的認證證明他讀過書考過試但不一定能做好工作。當然，A 如果面試也表現很好，那是最強組合。"),
                                Challenge.Option(id: "C", text: "看薪資要求", explanation: "薪資是次要因素。能力匹配最重要。"),
                                Challenge.Option(id: "D", text: "都不錄取", explanation: "兩個都是好候選人。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Show > Tell",
                                "認證是門檻不是決定因素",
                            ],
                            explanation: "面試評估優先級：展示的能力 > 認證數量 > 年資。認證是敲門磚，但進門後看的是你能做什麼。",
                            frameworkTip: "面試評估：能力展示 > 認證 > 年資。最強組合 = 認證 + 能力展示 + 經驗"
                        ),
                    ]
                ),
                Quest(
                    id: "37-6",
                    name: "BA 職涯規劃案例",
                    description: "制定個人職涯發展計畫",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：職涯計畫",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "3 年職涯規劃",
                                narrative: "你是 2 年經驗的 Junior BA，在電商公司工作。你想在 3 年內成為 Senior BA 或轉型 PM。\n\n現有技能：需求分析、User Story、Jira、基礎 Excel、溝通能力。\n缺少：SQL、BI 工具、產業深度知識、領導經驗。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "每年有明確的技能目標",
                                "不只「學」還要「用」和「展示」",
                            ],
                            explanation: "職涯規劃不是空想。每年有明確技能目標+認證+作品+在工作中主動創造實踐機會。Learn → Apply → Showcase。",
                            frameworkTip: "職涯規劃 = 年度技能目標 + 認證計畫 + 作品策略 + 機會創造"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 38: BA 綜合實戰
        World(
            id: 38,
            name: "BA 綜合實戰",
            emoji: "🏆",
            description: "綜合運用所有 BA 技能，完成端到端的商業分析",
            quests: [
                Quest(
                    id: "38-1",
                    name: "需求引導工作坊",
                    description: "規劃和引導需求引導工作坊",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "工作坊設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最有效的工作坊設計？",
                            scenario: 
                            Challenge.Scenario(
                                title: "需求工作坊",
                                narrative: "你要辦一場 3 小時的需求引導工作坊。參加者：行銷（3人）、客服（2人）、IT（2人）、PM（1人）。\n\n目的：定義新的客戶回饋系統需求。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓大家自由討論 3 小時", explanation: "沒有結構的討論會失控。聲音大的人主導，內向的人沒發言機會。"),
                                Challenge.Option(id: "B", text: "開場（目標對齊 15min）→ 個人 brainstorm（靜默寫便條紙 10min）→ 分組討論（40min）→ 全體匯報排序（30min）→ 使用者旅程 mapping（60min）→ 優先級投票（20min）→ 總結 action items（15min）", explanation: "正確！結構化工作坊：先靜後動（避免 groupthink）、先發散後收斂、混合個人和團體活動、有明確的輸出（使用者旅程+優先級清單）。"),
                                Challenge.Option(id: "C", text: "做 PPT 簡報 2 小時然後 Q&A 1 小時", explanation: "這是報告不是工作坊。工作坊的重點是「共創」不是「報告」。"),
                                Challenge.Option(id: "D", text: "一對一訪談每個人", explanation: "訪談有價值但工作坊的優勢是讓跨部門的人一起討論、碰撞、對齊。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "先靜後動：避免 groupthink",
                                "先發散後收斂：先不限制，再排優先級",
                            ],
                            explanation: "有效工作坊設計：開場對齊 → 個人思考（避免從眾）→ 小組討論 → 全體匯報 → 收斂排序 → Action Items。",
                            frameworkTip: "工作坊結構：對齊目標 → 個人(靜) → 小組(動) → 全體(收斂) → 投票排序 → Action Items"
                        ),
                        Challenge(
                            id: 2,
                            name: "引導技巧",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "BA（引導者）怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "工作坊挑戰",
                                narrative: "工作坊進行中。問題：\n\n• IT Director 一直打斷別人說「技術做不到」\n• 行銷的新人完全不發言\n• 討論從客戶回饋系統偏到了「公司文化問題」\n• 時間只剩 1 小時但才完成一半",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "隨便讓他們討論", explanation: "放任會讓工作坊失控且沒有產出。"),
                                Challenge.Option(id: "B", text: "①私下跟 IT Director 說「先記下技術限制，收斂時再討論」②直接問新人「你的客戶經驗很寶貴，你覺得呢？」③用 parking lot 記下離題議題回到主題④調整後半段節奏，把剩餘內容精簡或安排 follow-up", explanation: "正確！引導者的四個技巧：(1) 管理強勢者（建設性地重新導向）(2) 鼓勵安靜者（直接邀請+肯定價值）(3) Parking Lot（記下但不現在討論）(4) 時間管理（靈活調整）。"),
                                Challenge.Option(id: "C", text: "延長工作坊", explanation: "延長會讓參加者疲勞且失去注意力。更好的做法是精簡或 follow-up。"),
                                Challenge.Option(id: "D", text: "取消工作坊下次再辦", explanation: "太浪費大家的時間。可以調整但不應該取消。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "引導者的職責：確保每個人都有發言機會、保持議題焦點、管理時間",
                            ],
                            explanation: "BA 作為引導者的核心技巧：管理動態（強勢/安靜）、保持焦點（Parking Lot）、時間管理（靈活調整）、確保產出。",
                            frameworkTip: "引導技巧：管理強勢者 + 鼓勵安靜者 + Parking Lot + 時間管理 + 確保產出"
                        ),
                    ]
                ),
                Quest(
                    id: "38-2",
                    name: "跨部門需求整合",
                    description: "整合不同部門的需求",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "需求衝突",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "部門需求衝突",
                                narrative: "新 CRM 系統需求收集完成。各部門需求：\n\n行銷：「要即時看到每個 campaign 的 ROI」\n業務：「要手機上查客戶互動紀錄」\n客服：「要一站式看到客戶所有 ticket」\n財務：「要自動產生月報」\nIT：「要跟現有系統整合且維護成本低」\n\n預算只夠做其中 60%。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓各部門主管投票", explanation: "投票可能變成部門權力鬥爭而不是基於價值判斷。"),
                                Challenge.Option(id: "B", text: "用 Value/Effort 矩陣分析每個需求 → MoSCoW 分類 → 跟各部門確認 Must Have → 在預算內優化組合 → 呈現 trade-off 讓 Steering Committee 決定", explanation: "正確！BA 的角色：(1) 量化每個需求的價值和成本 (2) 用 MoSCoW 分類 (3) 明確呈現 trade-off（選 A 就不能選 B）(4) 讓決策者基於完整資訊決定。不替人做決定，而是讓決定更好。"),
                                Challenge.Option(id: "C", text: "按部門重要性排序", explanation: "主觀且會引發部門間矛盾。"),
                                Challenge.Option(id: "D", text: "全部都做但範圍縮減", explanation: "什麼都做=什麼都做不好。要有取捨。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "BA 不做決定，而是幫助做更好的決定",
                                "用數據把主觀爭論變客觀比較",
                            ],
                            explanation: "BA 整合需求：量化價值→分類優先級→明確 trade-off→讓決策者做 informed decision。",
                            frameworkTip: "需求整合：量化 Value/Effort → MoSCoW → 呈現 Trade-off → 決策者選"
                        ),
                        Challenge(
                            id: 2,
                            name: "需求追溯",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼預防這個問題？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Traceability",
                                narrative: "專案進行到一半，CEO 問：「為什麼我們在做這個功能？這跟商業目標有什麼關係？」\n\n你發現很多功能已經「脫離」了原始的商業目標。有些功能是某個 stakeholder 隨口提的，沒有人質疑就被加進來了。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "不讓 stakeholder 提需求", explanation: "不切實際且不合理。"),
                                Challenge.Option(id: "B", text: "建立 Requirements Traceability Matrix：每個功能都追溯到商業目標。如果一個功能追溯不到任何商業目標，就質疑它的必要性", explanation: "正確！RTM：Business Goal → Requirement → Feature → Test Case。每個功能都要能回答「這為什麼存在？」追溯不到商業目標的功能就是 scope creep。"),
                                Challenge.Option(id: "C", text: "全部砍掉重來", explanation: "太極端。用 RTM 篩選。"),
                                Challenge.Option(id: "D", text: "這是 PM 的問題", explanation: "BA 的職責包括確保需求跟商業目標對齊。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "每個功能都要能回答「為什麼做？」",
                                "追溯不到目標的功能 = 潛在的 scope creep",
                            ],
                            explanation: "Requirements Traceability Matrix 是 BA 的重要工具。它確保：每個功能都有理由（追溯到目標）、沒有遺漏（目標都有功能對應）。",
                            frameworkTip: "RTM：Business Goal → Requirement → Feature → Test Case。每個功能要追溯到目標。"
                        ),
                    ]
                ),
                Quest(
                    id: "38-3",
                    name: "數據驅動決策",
                    description: "用數據支持商業決策",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "假設驗證",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 應該怎麼呈現？",
                            scenario: 
                            Challenge.Scenario(
                                title: "數據 vs 直覺",
                                narrative: "行銷主管說：「我們的客戶大部分是年輕人，所以應該把行銷預算全部投在社群媒體。」\n\n你查了 CRM 資料，發現：\n• 25-34 歲：35%（最大群體）\n• 35-44 歲：30%\n• 45-54 歲：20%\n• 其他：15%\n\n而且 35-44 歲的客戶 AOV（平均訂單金額）是 25-34 歲的 2 倍。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "同意主管的判斷", explanation: "數據不支持「大部分是年輕人」的說法。35 歲以上佔 65%。"),
                                Challenge.Option(id: "B", text: "用數據呈現：25-34 歲是最大單一群體但只佔 35%。35+ 佔 65% 且 AOV 更高。建議行銷預算按客群價值分配，不只看人數", explanation: "正確！BA 用數據挑戰直覺。「最大群體」≠「大部分」。而且價值不只看人數，還要看 AOV。35-44 歲人少但 AOV 高，可能是更高價值的行銷投資對象。"),
                                Challenge.Option(id: "C", text: "不投社群媒體", explanation: "不是「不投」而是「不全部投」。要按數據分配。"),
                                Challenge.Option(id: "D", text: "數據不重要，主管最了解市場", explanation: "直覺可能是對的但需要數據驗證。BA 的價值就是用數據輔助決策。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "數據驅動 ≠ 否定直覺，而是用數據驗證和補充直覺",
                                "看「價值」不只看「數量」",
                            ],
                            explanation: "BA 用數據輔助決策：呈現完整圖片（不只人數還有 AOV）、挑戰假設（「大部分」真的是大部分嗎？）、提供分析建議。",
                            frameworkTip: "數據驅動：假設 → 用數據驗證 → 呈現完整圖片 → 建議（不替人做決定）"
                        ),
                        Challenge(
                            id: 2,
                            name: "A/B 測試設計",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "BA 怎麼說服 PM？",
                            scenario: 
                            Challenge.Scenario(
                                title: "A/B 測試",
                                narrative: "PM 想改結帳頁面設計。設計師做了新版本。PM 要直接上線。你建議先做 A/B 測試。\n\nPM 說：「新設計明顯更好看，不需要測試。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接同意上線", explanation: "「好看」不等於「轉換率高」。太多案例證明「更好看」的設計反而降低轉換率。"),
                                Challenge.Option(id: "B", text: "用過去的案例說明「好看 ≠ 好用」，建議 A/B 測試：流量各 50%、跑 2 週、看轉換率而非「好不好看」。如果新版確實更好，數據會證明", explanation: "正確！BA 的價值：(1) 用案例說明為什麼需要測試 (2) 設計測試方案（分流、時間、指標）(3) 讓數據說話。如果新設計真的好，A/B 測試只會確認這一點。"),
                                Challenge.Option(id: "C", text: "拒絕改設計", explanation: "不是拒絕改而是用科學方法驗證改的效果。"),
                                Challenge.Option(id: "D", text: "讓使用者投票", explanation: "使用者投票偏好不等於實際行為。A/B 測試看的是實際轉換率。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "「好看」是主觀的，轉換率是客觀的",
                                "A/B 測試是最公正的裁判",
                            ],
                            explanation: "A/B 測試是 data-driven decision making 的典範。BA 的角色：設計測試（分流+指標+時間）、分析結果、提出建議。讓數據說話。",
                            frameworkTip: "A/B 測試：假設 → 設計（分流/指標/時間）→ 執行 → 分析 → 決策"
                        ),
                    ]
                ),
                Quest(
                    id: "38-4",
                    name: "變更管理",
                    description: "管理專案範圍和需求變更",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "變更控制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "BA 怎麼處理？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Change Request",
                                narrative: "專案已進行 60%。VP of Sales 突然說：「我要加一個 AI 推薦引擎，競爭對手上週推出了。」\n\n這個功能不在原始範圍。開發估計要 3 個月額外時間。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "直接加進去", explanation: "Scope creep。沒有評估影響就加進去會導致延遲和預算超支。"),
                                Challenge.Option(id: "B", text: "走 Change Request 流程：記錄需求→Impact Analysis（時間/成本/風險/對現有功能的影響）→呈現選項（A.加+延遲 B.替換掉某功能 C.Phase 2）→Change Board 決定", explanation: "正確！Change Request 流程確保：(1) 每個變更都被評估 (2) 影響被量化 (3) 決策有據可依 (4) 不是拒絕而是管理。VP 的需求可能是對的，但需要在了解全貌後做決定。"),
                                Challenge.Option(id: "C", text: "說「不在範圍」拒絕", explanation: "直接拒絕高管不明智。要用流程管理。"),
                                Challenge.Option(id: "D", text: "讓 PM 處理", explanation: "BA 應該做 Impact Analysis，PM 做決策。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Change Request 不是「不做」而是「經過評估再決定」",
                                "BA 的角色：Impact Analysis",
                            ],
                            explanation: "Change Management：記錄→分析影響→呈現選項→決策。BA 的核心輸出是 Impact Analysis，讓決策者在完整資訊下選擇。",
                            frameworkTip: "Change Request：記錄 → Impact Analysis → 呈現選項 → Change Board 決定 → 更新文件"
                        ),
                        Challenge(
                            id: 2,
                            name: "範圍蔓延預防",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "怎麼預防未來的 scope creep？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Scope Creep 預防",
                                narrative: "你的專案已經第三次 scope creep 了。每次都是「小功能」：\n\n1. 「順便加個匯出 PDF」\n2. 「加一個通知功能應該很快」\n3. 「UI 改一下顏色和字體」\n\n加總起來已經增加了 3 週的工作量。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "拒絕所有新需求", explanation: "太極端。有些變更是合理的。"),
                                Challenge.Option(id: "B", text: "建立機制：①明確的 Scope 文件（In/Out）②任何變更都走 CR 流程（即使「小」的）③累計影響追蹤（小的加起來可能很大）④定期跟 stakeholder review scope", explanation: "正確！Scope creep 的根因是「沒有門檻」。建立 CR 流程讓每個變更都被看見和評估。累計追蹤讓 stakeholder 看到「小事情加起來的影響」。"),
                                Challenge.Option(id: "C", text: "加更多 buffer", explanation: "Buffer 會被吃掉。問題不是時間不夠而是缺乏變更管理。"),
                                Challenge.Option(id: "D", text: "跟客戶說做不到", explanation: "不是做不到而是需要管理。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "「小」的 scope creep 最危險因為不被重視",
                                "累計追蹤讓小事情變得可見",
                            ],
                            explanation: "Scope creep 預防：明確 In/Out → CR 流程（連小的也走）→ 累計影響追蹤 → 定期 review。關鍵是讓每個變更都「可見」。",
                            frameworkTip: "防 Scope Creep：明確 In/Out + CR 流程 + 累計追蹤 + 定期 Review"
                        ),
                    ]
                ),
                Quest(
                    id: "38-5",
                    name: "專案後回顧",
                    description: "從專案中學習改進",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Retrospective",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "為什麼需要 Retrospective？",
                            scenario: 
                            Challenge.Scenario(
                                title: "專案回顧",
                                narrative: "專案上線了。PM 說：「上線了就好，不需要回顧。趕快做下一個。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "找人究責", explanation: "Retrospective 不是責備大會。是學習和改進。"),
                                Challenge.Option(id: "B", text: "從成功和失敗中學習，避免下一個專案重複犯同樣的錯。如果不回顧，組織永遠在重複同樣的錯誤", explanation: "正確！Retrospective 的目的：(1) 記錄 What went well（複製成功）(2) What didn't go well（避免重複）(3) Action items（具體改善）。不做回顧的組織會在不同專案中重複相同的問題。"),
                                Challenge.Option(id: "C", text: "只有 Agile 才需要", explanation: "任何專案都應該回顧。Agile 每個 Sprint 回顧，Waterfall 專案結束時回顧。"),
                                Challenge.Option(id: "D", text: "太浪費時間", explanation: "2 小時的回顧可能為下一個專案省 2 週的問題。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不回顧 = 不學習 = 重複犯錯",
                                "Retrospective 不是責備而是學習",
                            ],
                            explanation: "Retrospective 是組織學習的關鍵。BA 可以引導 retro：收集 feedback → 分類（What went well/didn't/lessons）→ 定義 action items → 追蹤改善。",
                            frameworkTip: "Retro：What went well / What didn't / What to improve + 具體 Action Items"
                        ),
                        Challenge(
                            id: 2,
                            name: "Lessons Learned",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "為什麼 Retro 的教訓沒有被學到？",
                            scenario: 
                            Challenge.Scenario(
                                title: "經驗傳承",
                                narrative: "Retrospective 產出了很好的 lessons learned。但你發現去年的專案也做了 retro，結論幾乎一模一樣：「需求不清楚」「溝通不足」「測試時間不夠」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "同事不聽", explanation: "不是態度問題。是流程問題。"),
                                Challenge.Option(id: "B", text: "缺少「把 lesson 變成具體行動並追蹤」的機制。Retro 不能只是「列出教訓」，要有具體的 action items + owner + deadline + 追蹤", explanation: "正確！Retro 最常見的失敗：有教訓沒行動。「需求不清楚」→ Action: 下個專案引入 Definition of Ready + BA 在 Sprint 0 做前期分析 + Owner: BA Lead + 在 Q2 專案實施。沒有 action 的 lesson 是空話。"),
                                Challenge.Option(id: "C", text: "Retro 沒用", explanation: "Retro 很有用，但要有 follow-through。"),
                                Challenge.Option(id: "D", text: "問題本來就無法解決", explanation: "這些問題都有解法。問題是沒有把解法落實。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Lesson without Action = 空話",
                                "每個 lesson 要有：Action + Owner + Deadline",
                            ],
                            explanation: "Retro 的價值不在「列出教訓」而在「改變行為」。每個 lesson 要轉成 action item（具體做什麼、誰負責、什麼時候完成）並追蹤。",
                            frameworkTip: "Lessons Learned 落地：Lesson → 具體 Action → Owner → Deadline → 下個專案追蹤"
                        ),
                    ]
                ),
                Quest(
                    id: "38-6",
                    name: "BA 終極挑戰",
                    description: "端到端的商業分析綜合挑戰",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：端到端 BA 案例",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "數位轉型專案",
                                narrative: "你是一家傳統零售公司（10 家實體店、年營收 $30M）的 BA。CEO 決定做數位轉型：建立電商平台+會員系統+數據分析能力。\n\n預算 $500K、12 個月。團隊：PM×1、BA×1（你）、Dev×4、QA×1、Designer×1。\n\n挑戰：員工抗拒數位化、IT 基礎設施老舊、沒有數位人才、競爭對手已經線上化。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "MVP 的關鍵是「能獨立產生價值的最小範圍」",
                                "數位轉型最大的挑戰通常是人不是技術",
                            ],
                            explanation: "端到端 BA = Stakeholder 管理 + 需求分析 + MVP 定義 + Stories + 風險管理 + Metrics + 計畫。BA 是專案的「腦」：連結商業目標和技術實現。",
                            frameworkTip: "端到端 BA：Stakeholder → 需求 → MVP → Stories → 風險 → Metrics → 計畫"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 42: Business Systems
        World(
            id: 42,
            name: "Business Systems",
            emoji: "🏗️",
            description: "理解企業系統（ERP/CRM/Workflow）的架構與選型策略",
            quests: [
                Quest(
                    id: "42-1",
                    name: "ERP 概念與模組",
                    description: "理解 ERP 核心模組與導入策略",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ERP 核心價值",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "導入 ERP 最核心的價值是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "ERP 導入評估",
                                narrative: "你加入一家中型製造公司（年營收 $50M、200 人）擔任 BA。公司目前用 Excel 管理財務、用 Email 追蹤訂單、用紙本管理庫存。CEO 問你：「我們需要 ERP 嗎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "讓公司看起來更專業", explanation: "專業形象是附帶好處，不是核心價值。"),
                                Challenge.Option(id: "B", text: "建立 Single Source of Truth，整合跨部門資料，消除資訊孤島", explanation: "正確！ERP 最核心的價值是「一套系統、一份資料」。當財務、銷售、庫存都在同一平台，訂單進來自動更新庫存→觸發採購→計入營收。不再需要人工核對 Excel。"),
                                Challenge.Option(id: "C", text: "取代所有現有軟體", explanation: "ERP 不一定取代所有軟體。有些專業系統（如 CRM、BI）可能更適合特定需求。"),
                                Challenge.Option(id: "D", text: "自動化所有流程", explanation: "ERP 能自動化很多流程，但不是「所有」。核心價值是資料整合，自動化是延伸好處。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "想想 Excel 管理最大的問題是什麼",
                                "資訊孤島（Data Silos）是中型企業的痛點",
                            ],
                            explanation: "ERP 核心價值 = Single Source of Truth。解決的痛點是：資料散落在各部門的 Excel/系統中、版本不一致、需要人工核對、決策依據不可靠。",
                            frameworkTip: "ERP 價值公式：Single Source of Truth + 跨部門整合 + 流程標準化 + 即時可視化"
                        ),
                        Challenge(
                            id: 2,
                            name: "ERP 導入策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你會建議哪種導入策略？",
                            scenario: 
                            Challenge.Scenario(
                                title: "導入方式選擇",
                                narrative: "你的公司決定導入 SAP S/4HANA。需要上線的模組：Finance（FI）、Sales（SD）、Inventory（MM）。\n\n公司現況：\n• 5 個辦公室、3 個倉庫\n• 月底結帳是最關鍵的業務流程\n• 員工平均年齡 45 歲，對新系統有抗拒",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Big Bang：所有模組、所有據點同時上線", explanation: "風險太高。員工抗拒 + 月底結帳關鍵流程不容出錯。一旦失敗，全公司癱瘓。"),
                                Challenge.Option(id: "B", text: "Phased Rollout：先上 FI 模組（1 個辦公室）→ 穩定後加 SD/MM → 逐步推廣到所有據點", explanation: "正確！考量因素：(1) 員工抗拒→小範圍先試，累積成功案例 (2) 月底結帳關鍵→先穩定 FI 模組再擴展 (3) Phased 降低風險，每階段都有 lessons learned。"),
                                Challenge.Option(id: "C", text: "Parallel Run：新舊系統同時運行 6 個月", explanation: "Parallel Run 可以用在關鍵模組（如 FI），但不適合作為整體策略——雙倍工作量會讓本來就抗拒的員工更不滿。"),
                                Challenge.Option(id: "D", text: "直接客製一套新系統", explanation: "SAP 已經選好了。問題是導入策略不是技術選型。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "高抗拒環境適合小步快跑",
                                "關鍵業務流程要特別保護",
                            ],
                            explanation: "Phased Rollout 是高風險環境的最佳策略：小範圍驗證→累積信心→逐步擴展。特別適合：員工抗拒高、關鍵流程不容中斷、需要 lessons learned 的場景。",
                            frameworkTip: "導入策略選擇：高風險/大規模→Phased / 小團隊/急迫→Big Bang / 關鍵流程→加 Parallel Run"
                        ),
                    ]
                ),
                Quest(
                    id: "42-2",
                    name: "CRM 系統設計",
                    description: "設計銷售管線和客戶 360 視圖",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CRM Pipeline 設計",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Pipeline Stage 設計的首要原則是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "SaaS 公司 CRM",
                                narrative: "你在一家 B2B SaaS 公司（年費 $10K-$100K/客戶）。銷售團隊有 15 人，目前用 Excel 追蹤客戶。VP of Sales 找你設計 Salesforce CRM。\n\n他說：「我需要看到每個業務的 Pipeline，預測這季能簽多少單。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "越多 Stage 越好，越精細越好", explanation: "Stage 太多會讓業務覺得繁瑣不願更新。通常 5-7 個 Stage 最適合。"),
                                Challenge.Option(id: "B", text: "每個 Stage 要有明確的「進入條件」和「可驗證的客戶行為」", explanation: "正確！好的 Pipeline = 每個 Stage 代表一個客觀、可驗證的里程碑。例如「Qualified」不是業務「覺得」有機會，而是客戶確認了 Budget + Authority + Need + Timeline（BANT）。這樣預測才準確。"),
                                Challenge.Option(id: "C", text: "按公司內部流程設計", explanation: "應該按「客戶購買旅程」設計，不是按公司內部流程。"),
                                Challenge.Option(id: "D", text: "直接用 Salesforce 預設的 Stage", explanation: "預設 Stage 是通用的，需要根據公司的銷售流程客製化。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Pipeline 的目的是「準確預測營收」",
                                "主觀判斷 vs 客觀驗證",
                            ],
                            explanation: "Pipeline Stage 設計的黃金原則：每個 Stage 都有明確的進入條件（Entry Criteria），基於客戶的可驗證行為（Verifiable Outcome），而不是業務的主觀判斷。",
                            frameworkTip: "Pipeline Stage = 客戶行為里程碑（不是內部流程步驟）+ BANT 做 Qualification"
                        ),
                        Challenge(
                            id: 2,
                            name: "Customer 360",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "解決這個問題的關鍵是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶資料整合",
                                narrative: "公司有三套系統：\n• Marketing: HubSpot（追蹤網站行為、Email 開信率）\n• Sales: Salesforce（客戶聯絡紀錄、商機）\n• Support: Zendesk（客服工單、滿意度）\n\n問題：銷售打電話給客戶時，不知道客戶剛提了一張投訴工單。行銷發 Email 給已經要解約的客戶。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把所有功能都搬到 Salesforce", explanation: "不現實。每個系統都有其專長。HubSpot 的行銷自動化、Zendesk 的客服功能很難在 Salesforce 完全複製。"),
                                Challenge.Option(id: "B", text: "建立 Customer 360 視圖：整合三套系統的資料，讓每個團隊都能看到客戶全貌", explanation: "正確！Customer 360 = 在任何一個系統中都能看到客戶在其他系統的關鍵資訊。實作方式：API 整合 + 統一客戶 ID + 即時同步關鍵欄位（如：最近工單狀態、合約到期日、行銷互動）。"),
                                Challenge.Option(id: "C", text: "每週寄一份客戶報表給所有團隊", explanation: "太慢了。業務打電話時需要「即時」看到客戶狀態，不是每週。"),
                                Challenge.Option(id: "D", text: "讓客服團隊手動通知銷售團隊", explanation: "人工通知不可靠、不可規模化。會漏、會延遲。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "跨系統的資料孤島是常見問題",
                                "整合不等於合併，可以保留各系統優勢",
                            ],
                            explanation: "Customer 360 是 CRM 策略的核心：不是把所有系統合併，而是透過 API 整合讓資料流通。關鍵是：統一客戶 ID + 即時同步 + 每個接觸點都能看到全貌。",
                            frameworkTip: "Customer 360 = 統一 ID + API 整合 + 即時同步關鍵欄位 + 每個 Touchpoint 可見"
                        ),
                        Challenge(
                            id: 3,
                            name: "CRM 自動化規則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你會怎麼設計 Lead Assignment 自動化？",
                            scenario: 
                            Challenge.Scenario(
                                title: "Lead Assignment",
                                narrative: "公司每月有 500 個 Inbound Leads（來自網站、活動、推薦）。目前由 VP of Sales 手動分配給業務。\n\n問題：\n• 分配不均（有些業務太多、有些太少）\n• 回覆太慢（平均 48 小時，業界標準 < 1 小時）\n• 沒有 follow-up 追蹤機制",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "按字母順序輪流分配", explanation: "太簡單。沒考慮 Lead 品質、業務專長、區域等因素。"),
                                Challenge.Option(id: "B", text: "Lead Scoring + Round-Robin + SLA Alert：先評分分級，再根據區域/產品線自動分配，設定回覆 SLA", explanation: "正確！三層自動化：(1) Lead Scoring：根據公司規模、職稱、網站行為自動評分 (2) Assignment Rules：按區域/產品線/業務產能 Round-Robin 分配 (3) SLA：1小時未回覆→Alert主管，4小時未回覆→自動重新分配。"),
                                Challenge.Option(id: "C", text: "全部交給 AI 自動處理", explanation: "AI 可以輔助 Lead Scoring，但 Assignment Rules 需要根據公司的銷售策略設計，不是純 AI 能決定的。"),
                                Challenge.Option(id: "D", text: "讓業務自己挑 Lead", explanation: "會造成「搶好 Lead」的內部競爭，小客戶被忽視。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "自動化的關鍵是規則設計，不只是技術",
                                "回覆速度是 Lead 轉換的關鍵因素",
                            ],
                            explanation: "CRM 自動化三層設計：(1) Lead Scoring 自動評分 (2) Assignment Rules 自動分配 (3) SLA + Escalation 確保時效。研究顯示：5 分鐘內回覆的 Lead 轉換率是 30 分鐘後的 21 倍。",
                            frameworkTip: "CRM 自動化：Lead Scoring（分級）→ Assignment Rules（分配）→ SLA Alert（時效）→ Escalation（兜底）"
                        ),
                    ]
                ),
                Quest(
                    id: "42-3",
                    name: "Workflow & Approval Systems",
                    description: "設計企業審批和自動化流程",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Approval Flow 設計",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最佳的審批流程設計原則是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "採購審批流程",
                                narrative: "你要為一家 500 人的公司設計採購審批流程。目前的問題：\n• 所有採購都要 CFO 簽，CFO 每天花 2 小時簽核\n• 小額採購（文具、軟體）也要等 3 天\n• 緊急採購時找不到人簽",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "所有採購都走同一流程", explanation: "一刀切的流程會造成瓶頸。不同金額應有不同審批層級。"),
                                Challenge.Option(id: "B", text: "按金額分級審批 + 代理人機制 + 緊急通道", explanation: "正確！三層設計：(1) 金額分級：<$1K 主管直接核准 / $1K-$10K 部門主管 / >$10K CFO (2) 代理人：主管不在時自動轉給代理人 (3) 緊急通道：可先執行、事後補簽。這樣 CFO 只需簽大額採購，效率提升 80%。"),
                                Challenge.Option(id: "C", text: "全面取消審批，信任員工", explanation: "完全沒有審批會有財務風險和合規問題。"),
                                Challenge.Option(id: "D", text: "加更多審批人確保安全", explanation: "更多審批人 = 更慢 = 更多瓶頸。應該是「該嚴則嚴、該松則松」。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "審批流程的目標是「控制風險」和「效率」的平衡",
                                "不同風險等級需要不同控制",
                            ],
                            explanation: "Approval Flow 設計核心原則：風險相稱（Risk-Proportional）。金額越大、風險越高→審批層級越高。小額快速通過、大額嚴格把關。加上代理人和緊急機制處理例外。",
                            frameworkTip: "Approval 設計三要素：金額分級（Risk-Based）+ 代理人（Delegation）+ 緊急通道（Exception Path）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Workflow 自動化",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "哪些步驟最適合自動化？",
                            scenario: 
                            Challenge.Scenario(
                                title: "客戶 Onboarding 自動化",
                                narrative: "你在一家 Fintech 公司。新客戶開戶流程：\n1. 填寫申請表\n2. 上傳身份證件\n3. KYC（身份驗證）\n4. 風險評估\n5. 帳戶開通\n6. Welcome Email\n\n目前全部手動處理，平均需要 5 個工作天。CEO 要求縮短到 1 天。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部自動化，不需要人工介入", explanation: "KYC 和風險評估可能涉及法規要求，某些情況需要人工審核（如：高風險客戶、文件不清）。"),
                                Challenge.Option(id: "B", text: "步驟 1、2、6 自動化 + 步驟 3、4 半自動（AI 輔助 + 人工覆核高風險案例）+ 步驟 5 自動", explanation: "正確！自動化策略：(1) 表單驗證→即時檢查格式 (2) 文件上傳→OCR 自動辨識 (3) KYC→API 串接身份驗證服務，低風險自動通過、高風險人工覆核 (4) 風險評估→規則引擎自動分級 (5) 開通→自動 (6) Welcome→自動觸發。目標：80% 案例全自動、20% 高風險人工介入。"),
                                Challenge.Option(id: "C", text: "只自動化 Welcome Email", explanation: "只自動化最後一步幾乎不影響整體時效。瓶頸在 KYC 和審核。"),
                                Challenge.Option(id: "D", text: "加更多人力來加速", explanation: "增加人力成本高且不可規模化。自動化才是長期解決方案。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "自動化不是 0 或 100%，是找到適合的「自動化比例」",
                                "法規合規的步驟需要人工兜底",
                            ],
                            explanation: "Workflow 自動化策略：(1) 識別可完全自動化的步驟 (2) 法規相關步驟用「AI + 人工覆核」(3) 設定 SLA 和 Escalation (4) 目標是 80/20：80% 全自動、20% 人工介入。",
                            frameworkTip: "Workflow 自動化：全自動（低風險）+ 半自動 AI+人工（高風險/法規）+ SLA + Escalation"
                        ),
                    ]
                ),
                Quest(
                    id: "42-4",
                    name: "Internal Tools Design",
                    description: "設計高效的內部管理工具",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Build vs Buy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "你如何評估 Build vs Buy？",
                            scenario: 
                            Challenge.Scenario(
                                title: "內部工具決策",
                                narrative: "你在一家電商公司（100 人）。營運團隊需要一個「退款管理系統」：\n• 搜尋訂單\n• 申請退款（填原因、金額）\n• 主管審批\n• 執行退款（串接支付系統）\n• 報表（退款趨勢、處理時效）\n\n技術主管說：「我們自己做，2 個月就好。」\n營運主管說：「買 Zendesk 加模組就好。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "聽技術主管的，自己做最彈性", explanation: "自己做要考慮：開發 2 個月 + 後續維護 + 開發者離職風險。不是只看開發時間。"),
                                Challenge.Option(id: "B", text: "評估四個維度：(1) 是否核心競爭力 (2) 市場有方案嗎 (3) 客製化需求比例 (4) 維護能力，再決定", explanation: "正確！評估結果：(1) 退款管理不是核心競爭力→偏 Buy (2) 市場有方案（Zendesk、Freshdesk）→有 (3) 需要串接自家支付系統→客製化約 20%→可接受 (4) 100 人公司、開發資源有限→維護壓力大。結論：Buy + 輕度客製化可能是最佳方案。"),
                                Challenge.Option(id: "C", text: "買最貴的企業方案確保品質", explanation: "最貴不代表最適合。100 人公司不需要企業級方案。"),
                                Challenge.Option(id: "D", text: "先用 Excel 管理，等到必須換再說", explanation: "問題已經存在了。等的成本（效率低、出錯率高）可能比解決方案更貴。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "Build vs Buy 不是感覺題，要有評估框架",
                                "考慮 TCO（Total Cost of Ownership）不只是購買成本",
                            ],
                            explanation: "Build vs Buy 決策框架：(1) 核心競爭力？(2) 市場有方案？(3) 客製化 < 30%？(4) 有維護能力？如果 (1)=No (2)=Yes (3)=Yes (4)=No → 強烈建議 Buy。",
                            frameworkTip: "Build vs Buy 決策：核心競爭力→Build / 通用需求+市場有方案+客製<30%→Buy"
                        ),
                        Challenge(
                            id: 2,
                            name: "Admin Panel 設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "改善 Admin Panel 效率的最佳方法？",
                            scenario: 
                            Challenge.Scenario(
                                title: "後台設計",
                                narrative: "你要設計電商平台的 Admin Panel。目標用戶是營運團隊（10 人），他們每天要：\n• 處理 200 筆訂單（改狀態、處理問題）\n• 管理 5,000 個 SKU（上下架、改價格）\n• 回覆 50 個客訴\n\n營運主管抱怨：「現有後台太難用，每筆訂單要點 8 次才能處理完，找一筆訂單要 30 秒。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "加更多功能選項", explanation: "功能越多不代表越好用。問題是效率（點擊次數、搜尋速度），不是功能不夠。"),
                                Challenge.Option(id: "B", text: "重新設計資訊架構：(1) 減少點擊數（Batch操作）(2) 強化搜尋（即時搜尋+篩選）(3) 把相關資訊放同一畫面（Context-Rich）", explanation: "正確！內部工具效率 = 減少操作步驟 + 加快資訊取得。(1) Batch Operations：一次選多筆訂單改狀態 (2) 即時搜尋：打字即搜、支援訂單號/客戶名/手機 (3) Context-Rich：訂單頁同時顯示客戶資訊+歷史訂單+客訴紀錄。從 8 clicks 降到 3 clicks。"),
                                Challenge.Option(id: "C", text: "換一套新的後台系統", explanation: "不一定需要換系統。問題可能是 UX 設計而非系統本身。先改 UX 比換系統成本低。"),
                                Challenge.Option(id: "D", text: "讓營運團隊自己適應", explanation: "工具應該適應使用者，不是使用者適應工具。低效的工具會降低團隊產出。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "內部工具的設計目標是效率（Efficiency）",
                                "想想每天 200 筆 × 8 clicks = 1,600 次點擊",
                            ],
                            explanation: "內部工具設計三原則：(1) Efficiency First — 減少 clicks、支援 Batch (2) Context-Rich — 相關資訊同一畫面 (3) Searchability — 即時搜尋+多條件篩選。每減少 1 click × 200 筆/天 = 每天省 200 次操作。",
                            frameworkTip: "內部工具效率：減少 Clicks（Batch）+ Context-Rich（同一畫面）+ 強化搜尋（即時+篩選）"
                        ),
                    ]
                ),
                Quest(
                    id: "42-5",
                    name: "System Adoption & Change Management",
                    description: "推動系統導入與變革管理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ADKAR 模型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據 ADKAR 模型，問題出在哪裡？",
                            scenario: 
                            Challenge.Scenario(
                                title: "新系統導入抗拒",
                                narrative: "你的公司導入了新的 CRM 系統（Salesforce），取代原本的 Excel。上線 2 個月後：\n• 只有 40% 的業務在使用\n• 30% 的人偷偷用回 Excel\n• 業務抱怨：「我不知道為什麼要改」「太複雜了」「我的資料在哪？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "系統太爛，需要換一套", explanation: "Salesforce 是市場領導者。問題不在系統本身，在於導入方式。"),
                                Challenge.Option(id: "B", text: "Awareness 和 Knowledge 階段做不夠：沒讓用戶理解「為什麼要改」+培訓不足", explanation: "正確！「我不知道為什麼要改」= Awareness 不足（沒解釋改變的原因和好處）。「太複雜了」= Knowledge 不足（培訓不夠）。「我的資料在哪」= Ability 不足（沒有足夠的練習和支援）。30% 用回 Excel = 沒有 Reinforcement（舊系統沒下線）。"),
                                Challenge.Option(id: "C", text: "強制要求使用，不用就扣績效", explanation: "強制手段會增加抗拒。應該讓用戶「想用」（Desire）而不是「被迫用」。"),
                                Challenge.Option(id: "D", text: "再等幾個月，自然會習慣", explanation: "不會自然習慣。沒有主動管理的變革只會越來越差。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "ADKAR 每個階段都是必要的",
                                "診斷問題要找到缺失的階段",
                            ],
                            explanation: "ADKAR 診斷：(1) 不知道為何改→缺 Awareness (2) 不想用→缺 Desire (3) 不會用→缺 Knowledge (4) 用不好→缺 Ability (5) 用回舊系統→缺 Reinforcement。對症下藥才有效。",
                            frameworkTip: "ADKAR 診斷：問三個問題→「知道為什麼嗎？」「會用嗎？」「有支援嗎？」"
                        ),
                        Challenge(
                            id: 2,
                            name: "Rollout 策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最適合的 Rollout 策略是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "全球部署策略",
                                narrative: "你在一家跨國公司（1,000 人、5 個國家）。公司要將所有辦公室從舊 ERP 遷移到新的雲端 ERP。\n\n挑戰：\n• 各國有不同法規（稅務、會計準則）\n• 時區不同，無法同時培訓\n• 有些辦公室 IT 基礎設施較弱\n• 業務不能停（24/7 運營）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Big Bang：所有國家同時切換", explanation: "跨國同時切換風險極高。不同法規、時區、IT 能力都增加失敗機率。"),
                                Challenge.Option(id: "B", text: "Pilot + Phased：先在一個國家 Pilot → 修正問題 → 按區域分批 Rollout", explanation: "正確！(1) 選一個「風險低、配合度高」的辦公室做 Pilot（如：IT 最好的國家）(2) Pilot 收集 lessons learned、建立 playbook (3) 分批 Rollout：考慮法規複雜度、IT 準備度排序 (4) 每批之間留緩衝時間修正問題。24/7 運營→用 Feature Flag 逐步切換。"),
                                Challenge.Option(id: "C", text: "每個國家各自選系統", explanation: "違背統一 ERP 的目的。會回到資訊孤島的問題。"),
                                Challenge.Option(id: "D", text: "外包給顧問公司處理", explanation: "顧問可以幫忙，但策略需要由內部 BA 根據公司情況設計。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "跨國部署 = 高風險 → 需要漸進策略",
                                "Pilot 的目的是在「低風險環境」驗證",
                            ],
                            explanation: "Pilot + Phased 是跨國部署的黃金策略：(1) Pilot 在最佳條件下驗證 (2) 建立 Playbook（培訓材料、問題清單、解決方案）(3) 分批 Rollout，每批都用 Playbook (4) 每批之間留時間改進。",
                            frameworkTip: "跨國 Rollout：Pilot（驗證）→ Playbook（標準化）→ Phased Rollout（分批）→ 持續改進"
                        ),
                        Challenge(
                            id: 3,
                            name: "培訓計畫設計",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最有效的培訓策略是什麼？",
                            scenario: 
                            Challenge.Scenario(
                                title: "培訓策略",
                                narrative: "新 ERP 上線前 1 個月，你需要培訓 200 個員工。\n\n員工組成：\n• 財務部 30 人（每天高頻使用）\n• 業務部 80 人（每天中頻使用）\n• 管理層 20 人（只看報表）\n• 其他部門 70 人（偶爾使用）\n\n挑戰：員工日常工作忙，不可能全部拉去上一整天的課。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全員參加同一場 8 小時培訓", explanation: "管理層不需要學操作細節、財務部需要更深入。一刀切培訓效率低且浪費時間。"),
                                Challenge.Option(id: "B", text: "分級培訓 + Super User + 多元管道", explanation: "正確！(1) 分級：財務部 4 小時深度培訓 / 業務部 2 小時核心操作 / 管理層 1 小時報表 / 其他 30 分鐘影片 (2) Super User：每部門培養 1-2 人成為「內部專家」，負責日常支援 (3) 多元管道：現場課程+錄影+Quick Reference Card+Sandbox練習。這樣不用全部拉去上課，而且有持續的支援。"),
                                Challenge.Option(id: "C", text: "只培訓 Super User，讓他們教其他人", explanation: "Super User 是重要的支援角色，但不能完全取代正式培訓。基礎操作每個人都需要學。"),
                                Challenge.Option(id: "D", text: "寄操作手冊給所有人", explanation: "很少人會主動讀完操作手冊。需要動手練習才能真正學會。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "不同角色需要不同深度的培訓",
                                "Super User 是 Change Management 的關鍵角色",
                            ],
                            explanation: "培訓策略三要素：(1) Tiered Training 分級培訓（按角色和使用頻率）(2) Super Users 內部專家（持續支援）(3) Multi-channel 多元管道（課程+影片+手冊+練習環境）。",
                            frameworkTip: "培訓三層：分級培訓（按角色）+ Super User（每部門內部專家）+ 多元管道（課程/影片/手冊/Sandbox）"
                        ),
                    ]
                ),
                Quest(
                    id: "42-6",
                    name: "System Selection Case",
                    description: "端到端系統選型綜合挑戰",
                    xp: 100,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Boss：系統選型全案",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: 
                            Challenge.Scenario(
                                title: "電商 ERP 選型",
                                narrative: "你是一家快速成長的 D2C 電商公司（年營收 $20M、150 人、年成長率 60%）的 BA。公司目前的系統架構：\n\n• 財務：QuickBooks（已不堪負荷）\n• 訂單管理：自建系統（功能不足）\n• 庫存：Excel（經常對不起來）\n• CRM：無（客戶資料散落各處）\n\nCEO 決定：「我們需要一套整合的企業系統，預算 $300K（首年），6 個月內上線核心功能。」\n\nVendor 候選：\n• Vendor A：NetSuite（雲端 ERP + CRM，$80K/年，實施 4 個月）\n• Vendor B：SAP Business One（ERP，$120K/年，實施 6 個月）+ Salesforce（CRM，$40K/年）\n• Vendor C：Odoo（開源 ERP + CRM，$30K/年，需 2 個開發者客製，$50K 實施費）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: nil,
                            hints: [
                                "TCO 不只是授權費，還有實施、客製、人力、維護",
                                "60% 年成長率意味著系統必須能 scale",
                            ],
                            explanation: "系統選型是 BA 的綜合能力展現：需求分析 + Vendor 評估 + 財務分析 + 風險管理 + 變革管理。關鍵是用「結構化的框架」而不是「感覺」做決策。",
                            frameworkTip: "系統選型全流程：需求定義 → Scoring Matrix → TCO 分析 → 風險評估 → 決策 → 導入策略（含 Change Management）"
                        ),
                    ]
                ),
            ]
        ),

    ]
}
