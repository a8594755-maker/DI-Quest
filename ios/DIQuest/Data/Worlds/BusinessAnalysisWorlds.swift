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
                            scenario: Challenge.Scenario(
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
                            scenario: Challenge.Scenario(
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
                            scenario: Challenge.Scenario(
                                title: "內部工具的困境",
                                narrative: "你加入了一家科技公司的 Business Systems 團隊。主管說：\n\n「我們去年花了半年開發了一套內部 CRM 工具，但現在業務團隊抱怨很多，說不好用。老闆問我們到底有沒有成功，我不知道怎麼回答。」\n\n你需要幫團隊定義「成功」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "看有多少人在用（DAU）", explanation: "使用人數是一個指標，但不是第一步。如果公司只有 50 個業務，DAU 高不代表滿意，低可能是被強迫用。要先搞清楚「成功」對誰來說是什麼。"),
                                Challenge.Option(id: "B", text: "做一份滿意度調查", explanation: "調查很有用，但在做調查之前，你需要先知道要問什麼。先定義成功的維度，再設計調查。"),
                                Challenge.Option(id: "C", text: "回到當初開發這個工具要解決的問題，定義成功的維度", explanation: "正確！先問：這個工具要解決什麼問題？對誰？然後才能定義衡量指標。"),
                                Challenge.Option(id: "D", text: "比較跟市面上 Salesforce 等工具的功能差異", explanation: "功能比較可以做，但不是定義成功的方式。自建工具和買現成工具的價值衡量方式不同。"),
                            ],
                            correctAnswer: "C",
                            hints: [
                                "「成功」不是一個固定的東西，要看當初為什麼做。",
                                "想想看：如果你不知道這個工具要解決什麼問題，你怎麼知道它有沒有解決？",
                            ],
                            explanation: "定義成功永遠要回到「為什麼做這件事」。Success metric 必須跟原始目標對齊。",
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
                            scenario: Challenge.Scenario(
                                title: "SaaS 產品 Activation 下降",
                                narrative: "你是一家 B2B SaaS 公司的 Product Analyst。Growth PM 告訴你：\n\n「新用戶的 7-day activation rate 從上個月的 45% 掉到 32%。」",
                                data: [
                                    ["step": "註冊完成", "last_month": "100%", "this_month": "100%", "drop": "—"],
                                    ["step": "完成 onboarding", "last_month": "78%", "this_month": "61%", "drop": "-17pp"],
                                    ["step": "建立第一個 project", "last_month": "45%", "this_month": "32%", "drop": "-13pp"],
                                ],
                                dataCaption: "Activation Funnel（註冊後 7 天）"
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "註冊 → 完成 onboarding（-17pp）", explanation: "正確！從 78% 掉到 61%，差了 17 個百分點，是最大的 drop-off。"),
                                Challenge.Option(id: "B", text: "完成 onboarding → 建立 project（-13pp）", explanation: "這步確實也有下降，但 -13pp 小於 -17pp。"),
                                Challenge.Option(id: "C", text: "兩步的下降差不多，都要一起處理", explanation: "Prioritization 的原則是先解決影響最大的。"),
                                Challenge.Option(id: "D", text: "數據不夠，無法判斷", explanation: "這個 funnel 已經清楚顯示了每一步的 drop-off。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "看每一步的下降幅度（pp = percentage points）",
                                "哪一步的下降最大，通常就是最值得先調查的",
                            ],
                            explanation: "Funnel analysis 的核心：找到最大的 drop-off → 那就是最值得調查和改善的地方。",
                            frameworkTip: "拆解問題：整體指標 → funnel 各步驟 → 找最大 drop-off → 深入調查"
                        ),
                        Challenge(
                            id: 2,
                            name: "提出假設",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個假設最應該優先驗證？",
                            scenario: Challenge.Scenario(
                                title: "繼續分析 Onboarding Drop-off",
                                narrative: "你發現 onboarding 完成率從 78% 掉到 61%。\n\n你查了一下最近的產品變更紀錄：\n• 3 週前：onboarding 流程從 3 步改成 5 步\n• 2 週前：marketing 開始投放新的 Google Ads 廣告\n• 1 週前：伺服器有一次 2 小時的 outage",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "伺服器 outage 導致用戶流失", explanation: "Outage 只有 2 小時，而且是 1 週前才發生。影響範圍有限。"),
                                Challenge.Option(id: "B", text: "Onboarding 從 3 步變 5 步，新增步驟造成 friction", explanation: "正確！時間點吻合，邏輯合理：步驟越多、摩擦越大、完成率越低。"),
                                Challenge.Option(id: "C", text: "新的 Google Ads 帶來了品質較低的流量", explanation: "也是合理假設，但 onboarding 改版的時間點更吻合。"),
                                Challenge.Option(id: "D", text: "競爭對手推出了更好的產品", explanation: "沒有任何資料支持這個假設。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "看看各個變更的時間點，哪個跟問題出現的時間最吻合？",
                                "假設要基於已知事實，而且要可驗證。",
                            ],
                            explanation: "好的假設有三個特點：(1) 時間點吻合、(2) 邏輯合理、(3) 可以驗證。",
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
                            scenario: Challenge.Scenario(
                                title: "模糊的需求",
                                narrative: "面試官問你：\n\n「我們的 app 使用者活躍度不夠好，你會怎麼分析？」\n\n你的第一反應不應該是直接回答，而是先問清楚。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "「活躍度的定義是什麼？」「跟什麼時期比？」「是所有用戶都下降還是特定 segment？」", explanation: "正確！這三個問題分別釐清了：指標定義、比較基準、影響範圍。"),
                                Challenge.Option(id: "B", text: "「你們有做 A/B test 嗎？」「你們的 tech stack 是什麼？」", explanation: "這些問題太具體了，跳過了最基本的問題定義。"),
                                Challenge.Option(id: "C", text: "「你們 DAU 多少？」「MAU 多少？」", explanation: "直接問數字之前，你應該先確認「活躍度不夠好」是什麼意思。"),
                                Challenge.Option(id: "D", text: "「你們有哪些 feature？」「競爭對手是誰？」", explanation: "這些是有用的背景資訊，但不是第一步該問的。"),
                            ],
                            correctAnswer: "A",
                            hints: [
                                "面對模糊問題，先問三件事：定義、比較基準、範圍。",
                            ],
                            explanation: "在面試中，遇到模糊問題時主動釐清是加分的行為。",
                            frameworkTip: "模糊問題處理：定義 → 比較基準 → 影響範圍 → 時間軸 → 再開始分析"
                        ),
                        Challenge(
                            id: 2,
                            name: "缺少數據時的推理",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "在沒有數據工具的情況下，以下哪個方法最務實？",
                            scenario: Challenge.Scenario(
                                title: "沒有數據的情況",
                                narrative: "面試官接著問：\n\n「假設你沒有任何數據工具，也沒有 analytics dashboard，但老闆明天就要一個初步判斷。你會怎麼做？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "等拿到數據再分析", explanation: "在現實中，老闆經常需要快速判斷。"),
                                Challenge.Option(id: "B", text: "看客服 ticket 和用戶回饋，找 qualitative signals", explanation: "正確！客服 ticket、app store reviews、sales team 回饋都是 qualitative data。"),
                                Challenge.Option(id: "C", text: "自己用一次產品，親自體驗 onboarding", explanation: "這是有用的方法，但只代表一個人的體驗。"),
                                Challenge.Option(id: "D", text: "做一份問卷發給所有用戶", explanation: "問卷需要時間設計和收集，明天要答案的話來不及。"),
                            ],
                            correctAnswer: "B",
                            hints: [
                                "沒有量化數據的時候，還有什麼資訊來源？",
                                "想想看公司裡誰最常直接跟用戶互動？",
                            ],
                            explanation: "在沒有完美數據的情況下做判斷，是 BA/PA 的核心能力之一。",
                            frameworkTip: "沒有數據時：qualitative signals（客服、回饋、reviews）→ 歸類問題模式 → 形成假設"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 2: 數據思維
        World(
            id: 2,
            name: "數據思維入門",
            emoji: "📊",
            description: "培養用數據思考問題的直覺",
            quests: [
                Quest(
                    id: "2-1",
                    name: "數據驅動 vs 直覺驅動",
                    description: "了解什麼時候該用數據、什麼時候可以靠經驗判斷。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "何時需要數據",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個情境最需要用數據來做決策？",
                            scenario: Challenge.Scenario(
                                title: "數據 vs 直覺",
                                narrative: "你的主管提出了四個待辦事項，但團隊資源有限，只能選兩個來做。你需要判斷哪些決策最需要數據支撐。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "要不要修復一個影響 0.1% 用戶的 bug", explanation: "這個影響範圍已經很清楚（0.1%），需要考慮的是 severity 和修復成本，不一定需要更多數據。"),
                                Challenge.Option(id: "B", text: "選擇 A 方案還是 B 方案來提升用戶留存", explanation: "正確！當有多個方案且不確定哪個更好時，A/B test 或數據分析最有價值。直覺在這裡容易有偏見。"),
                                Challenge.Option(id: "C", text: "要不要在週五下午部署新版本", explanation: "這是風險管理問題，大多數公司的 best practice 是不在週五部署。經驗法則就夠了。"),
                                Challenge.Option(id: "D", text: "新員工的 onboarding 文件要放在哪", explanation: "這是流程問題，問問團隊偏好就好。"),
                            ],
                            correctAnswer: "B",
                            hints: ["哪個決策的結果最不確定？"],
                            explanation: "數據最有價值的時候是：有多個選項、不確定哪個更好、而且決策影響大。",
                            frameworkTip: "用數據的時機：不確定性高 + 影響大 + 有可比較的選項"
                        ),
                    ]
                ),
            ]
        ),

        // MARK: - World 3: 商業指標
        World(
            id: 3,
            name: "商業指標基礎",
            emoji: "📈",
            description: "認識最常見的商業和產品指標",
            quests: [
                Quest(
                    id: "3-1",
                    name: "常見指標認識",
                    description: "了解 DAU、MAU、Conversion Rate、ARPU 等常用指標。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "指標配對",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "一家訂閱制 SaaS 公司最應該關注哪個指標來衡量長期健康度？",
                            scenario: Challenge.Scenario(
                                title: "選對北極星指標",
                                narrative: "你剛加入一家 B2B SaaS 公司，CEO 問你：「如果只能看一個數字來判斷我們公司健不健康，你會看什麼？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "月營收（MRR）", explanation: "MRR 反映的是現在的收入，但如果客戶正在大量流失，MRR 可能暫時看起來還好。"),
                                Challenge.Option(id: "B", text: "Net Revenue Retention（NRR）", explanation: "正確！NRR 包含了流失、降級和升級的綜合效果。NRR > 100% 代表即使不獲取新客戶，營收也在成長。"),
                                Challenge.Option(id: "C", text: "新客戶獲取數", explanation: "獲取新客戶很重要，但如果留不住，就像漏水的桶子。"),
                                Challenge.Option(id: "D", text: "DAU / MAU 比率", explanation: "DAU/MAU 更適合 consumer 產品。B2B SaaS 不一定需要每天使用。"),
                            ],
                            correctAnswer: "B",
                            hints: ["想想什麼指標能同時反映客戶留存和成長？"],
                            explanation: "NRR 是 SaaS 最重要的健康指標之一。NRR > 100% 意味著即使停止獲取新客戶，現有客戶帶來的收入也在增長。",
                            frameworkTip: "北極星指標：能反映長期價值 + 涵蓋多個面向 + 可行動"
                        ),
                    ]
                ),
            ]
        ),
    ]
}
