import Foundation

enum DiProductWorlds {
    static let worlds: [World] = [
        World(
            id: 9,
            name: "Digital Worker 產品理解",
            emoji: "🤖",
            description: "理解 Decision Intelligence 的產品定位、核心工作流程與功能模組",
            quests: [
                Quest(
                    id: "9-1",
                    name: "產品定位：不是 Chatbot",
                    description: "理解 Digital Worker Platform 與聊天機器人的本質差異",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "平台 vs 聊天機器人",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Decision Intelligence 最準確的產品定位是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Decision Intelligence 的核心定位",
                                narrative: "你的主管問你：「Decision Intelligence 跟 ChatGPT 有什麼不同？」你需要用一句話精準回答。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想想 Chatbot 是「回答問題」，Digital Worker 是「執行工作流程」"],
                            explanation: "Decision Intelligence 是 Digital Worker Platform。用白話講：ChatGPT 是你問它問題、它回答你的顧問；DI 是你派任務給它、它做完交報告的數位員工。核心差異在於 DI 會自主執行完整的工作流程（上傳數據 → 驗證 → 預測 → 規劃 → 審核 → 執行），而且有角色定義、權限邊界、審計追蹤。",
                            frameworkTip: "產品定位三問：它幫誰？做什麼？跟現有方案差在哪？"
                        ),
                        Challenge(
                            id: 2,
                            name: "Digital Worker 的產出",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Digital Worker 完成一次工作流的最終產出是什麼？",
                            scenario: Challenge.Scenario(
                                title: "定義 Digital Worker 的產出",
                                narrative: "一個 Digital Worker 完成一次完整的工作，最終交付的是什麼？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Golden Path 的最後兩步是 Approve 和 Export"],
                            explanation: "Digital Worker 的產出不是一段文字回覆，而是三份結構化的交付物：(1) Decision Brief — 給主管看的決策摘要，包含建議、成本影響、風險警告；(2) Evidence Pack — 給審計用的完整計算紀錄；(3) Writeback Payload — 給 ERP 系統的寫入指令。這三份東西加起來就是一個可執行的決策計畫。",
                            frameworkTip: "評估 AI 產品時，看它的產出是「資訊」還是「可執行的決策」。"
                        ),
                    ]
                ),
                Quest(
                    id: "9-2",
                    name: "Golden Path 六步工作流",
                    description: "掌握 Upload→Validate→Forecast→Plan→Approve→Export",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Golden Path 步驟排序",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Golden Path 的正確順序是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Golden Path 工作流程",
                                narrative: "Decision Intelligence 的核心工作流程稱為 Golden Path，共六個步驟。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["先上傳資料，驗證後才能預測；有計畫後需要人類審批才能輸出"],
                            explanation: "正確順序：Upload → Validate → Forecast → Plan → Approve → Export。驗證在預測之前（確保資料品質），審批在輸出之前（人類把關）。",
                            frameworkTip: "Golden Path 的設計邏輯：資料品質 → AI 推論 → 人類決策 → 執行。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Validate 步驟的意義",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "跳過 Validate 步驟最大的風險是什麼？",
                            scenario: Challenge.Scenario(
                                title: "為什麼需要 Validate",
                                narrative: "團隊討論是否可以跳過 Validate 直接 Forecast。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["資料品質是所有分析的基礎"],
                            explanation: "Validate 確保資料品質，防止 GIGO。沒有驗證的預測可能基於錯誤資料，導致決策失誤。",
                            frameworkTip: "資料工作流永遠是：收集 → 清洗/驗證 → 分析 → 行動。"
                        ),
                    ]
                ),
                Quest(
                    id: "9-3",
                    name: "功能模組總覽",
                    description: "認識 27 個頁面與主要功能模組",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "核心工作區路由",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個是 Decision Intelligence 的核心工作區路由？",
                            scenario: Challenge.Scenario(
                                title: "功能模組地圖",
                                narrative: "Decision Intelligence 有 27 個頁面，你需要辨別核心工作區。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["/workspace 是路由收斂的核心"],
                            explanation: "/workspace 是統一工作畫布（Unified Canvas），所有 Golden Path 步驟都在同一個介面中完成。",
                            frameworkTip: "好的 SaaS 產品追求「路由收斂」— 減少頁面切換，提高效率。"
                        ),
                        Challenge(
                            id: 2,
                            name: "前端服務規模",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Decision Intelligence 前端大約有多少個 service 目錄？",
                            scenario: Challenge.Scenario(
                                title: "前端服務架構",
                                narrative: "你在閱讀前端程式碼，發現 services 目錄下有大量子目錄。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["這是企業級平台，服務模組數量反映其複雜度"],
                            explanation: "前端有約 31 個 service 目錄，涵蓋 auth、workspace、forecast、plan 等模組。",
                            frameworkTip: "評估專案規模時，service 目錄數量是一個快速指標。"
                        ),
                    ]
                ),
                Quest(
                    id: "9-4",
                    name: "Digital Worker 自主等級",
                    description: "理解 A1-A4 自主等級與信任漸進機制",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "自主等級定義",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "A1 等級的 Digital Worker 行為最接近哪種描述？",
                            scenario: Challenge.Scenario(
                                title: "Autonomy Levels A1-A4",
                                narrative: "Decision Intelligence 定義了四個自主等級。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A1 是最低自主等級"],
                            explanation: "A1（Assisted）就像實習生：AI 提出建議，但所有決定都是人做的。用白話講：你問它「你覺得該買多少？」它告訴你「我建議買 500 個」，但你自己決定要不要買。系統會根據 first_pass_acceptance_rate（第一次提交被核准的比例）來建議升級：做了 20+ 個任務且 85%+ 一次通過 → 建議升 A4。",
                            frameworkTip: "Trust Progression: 先讓人類掌控 → 逐步放手 → 最終 AI 自主。"
                        ),
                        Challenge(
                            id: 2,
                            name: "信任漸進機制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "信任漸進（Trust Progression）的核心理由是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Trust Progression",
                                narrative: "客戶問：「為什麼不能一開始就全自動？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["你會第一天就把財務決策交給新員工嗎？"],
                            explanation: "信任漸進是風險管理策略，跟帶新人一模一樣：第一天你盯著他每一步（A1），三個月後讓他自己處理日常（A3），一年後完全信任（A4）。不是技術限制，也不是法規強制，而是企業不願意把決策權一開始就交給未經驗證的 AI。",
                            frameworkTip: "AI 產品設計原則：使用者必須能控制自動化程度，且能隨時回退。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Writeback 審批設計",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "DI v1 中，Writeback（寫回 ERP）的審批政策是什麼？為什麼這樣設計？",
                            scenario: Challenge.Scenario(
                                title: "設計決策：為什麼 Writeback 永遠需要人批准",
                                narrative: "團隊在討論 v2 是否要開放 Writeback 的自動審批。你是 Product Owner，需要權衡風險和效率。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想想如果 AI 自動下了一筆錯誤的採購單，後果是什麼？", "v1 是保守的設計，先確保安全再談效率"],
                            explanation: "在 reviewContract.js 裡，Writeback 的 auto_approve_at 陣列是空的 — v1 不允許任何自主等級自動執行 ERP 寫入。因為一筆錯誤的採購單可能造成幾十萬的損失。Export（匯出報表）和 Notify（發通知）則比較寬鬆，A2+ 和 A3+ 可以自動。這是按「動作的危險程度」來分級的設計。",
                            frameworkTip: "設計審批政策時，問三個問題：1. 錯了的代價多大？2. 能不能撤回？3. 影響範圍多廣？"
                        ),
                    ]
                ),
                Quest(
                    id: "9-5",
                    name: "使用者旅程與路由收斂",
                    description: "理解 /workspace 統一畫布的設計理念",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "路由收斂策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "路由收斂到 /workspace 的主要好處是什麼？",
                            scenario: Challenge.Scenario(
                                title: "為什麼用統一畫布",
                                narrative: "設計團隊決定將所有工作流收斂到 /workspace。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想想在 Excel 裡工作 vs 每個步驟要開一個新軟體"],
                            explanation: "統一畫布消除了步驟間的上下文切換，所有 Golden Path 步驟在同一個畫面完成。",
                            frameworkTip: "UX 原則：減少上下文切換 = 減少認知負擔 = 提高效率。"
                        ),
                        Challenge(
                            id: 2,
                            name: "統一畫布的取捨",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "統一畫布（Unified Canvas）最大的工程挑戰是什麼？",
                            scenario: Challenge.Scenario(
                                title: "架構取捨",
                                narrative: "工程師在討論統一畫布的代價。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["所有功能在同一頁面，狀態管理會變得很複雜"],
                            explanation: "統一畫布將多步驟流程集中在一個路由，導致狀態管理複雜度顯著增加。",
                            frameworkTip: "架構決策永遠有取捨。統一畫布用工程複雜度換取使用者體驗。"
                        ),
                    ]
                ),
                Quest(
                    id: "9-6",
                    name: "產品 Pitch（Boss）",
                    description: "向非技術主管用 60 秒解釋 Decision Intelligence",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "電梯簡報：Decision Intelligence",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "60 秒產品 Pitch",
                                narrative: "你在電梯裡遇到公司 CEO：「Decision Intelligence 是什麼？為什麼我們需要它？」你有 60 秒。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["CEO 關心：成本、效率、風險、競爭優勢", "用類比：「像雇用一個永遠不休息的分析師」"],
                            explanation: "好的 Pitch 結構：問題 → 解決方案 → 差異化 → 價值。",
                            frameworkTip: "Elevator Pitch 框架：Pain → Solution → Differentiation → Value → Call to Action"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 10,
            name: "系統架構拓撲",
            emoji: "🏗️",
            description: "理解 Decision Intelligence 的四層架構與請求流向",
            quests: [
                Quest(
                    id: "10-1",
                    name: "四層架構概覽",
                    description: "認識 Frontend / Supabase / Edge Functions / ML API",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "四層架構識別",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Decision Intelligence 的四層架構正確組合是？",
                            scenario: Challenge.Scenario(
                                title: "架構分層",
                                narrative: "Decision Intelligence 採用四層架構，你需要正確辨識。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Supabase 提供 Auth + DB + Storage"],
                            explanation: "用餐廳比喻：前端是座位和菜單（使用者看到和操作的介面）、Supabase 是冰箱和帳本（資料庫和認證）、Edge Functions 是服務生（幫你轉達請求給廚房，保管 API key 不讓客人看到）、ML API 是主廚（用 Python 的 Prophet 和 OR-Tools 做預測和最佳化，這些工具瀏覽器跑不了）。",
                            frameworkTip: "架構閱讀法：先畫出分層圖，再追蹤請求如何在層間流動。"
                        ),
                        Challenge(
                            id: 2,
                            name: "ML API 層職責",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "ML API 層的主要職責是什麼？",
                            scenario: Challenge.Scenario(
                                title: "層級職責",
                                narrative: "你需要知道每層負責什麼。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["ML = Machine Learning，處理計算密集型工作"],
                            explanation: "ML API 用 FastAPI（Python）寫的，負責三件事：(1) 預測 — 用 Prophet、LightGBM 等模型做需求預測；(2) 求解 — 用 OR-Tools 算出最佳的採購計畫；(3) 非同步作業 — 管理跑很久的計算任務。為什麼要獨立？因為這些 Python 工具在瀏覽器跑不了，而且計算量大，需要獨立擴展。",
                            frameworkTip: "分層架構核心原則：每層只做一件事，做好一件事。"
                        ),
                        Challenge(
                            id: 3,
                            name: "為什麼不能一個 server 搞定",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪個理由最能解釋為什麼 DI 需要獨立的 ML API，而不是把 ML 邏輯放在 Edge Function 裡？",
                            scenario: Challenge.Scenario(
                                title: "架構 Trade-off",
                                narrative: "新來的實習生問你：「為什麼要搞四層這麼複雜？一個 Node.js server 不就好了嗎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Prophet 是 Python 寫的，OR-Tools 也需要 Python 環境", "想想語言限制 — 不同工具需要不同的執行環境"],
                            explanation: "Edge Function 跑在 Deno（TypeScript）環境。Prophet、LightGBM、OR-Tools 都是 Python 套件，必須在 Python 環境裡執行。就像你不能在微波爐裡烤蛋糕 — 不同工作需要不同工具。此外，ML 計算非常耗 CPU 和記憶體，獨立部署可以單獨擴展，不會影響其他服務。",
                            frameworkTip: "分層的決策問三個問題：(1) 技術上能合嗎？(2) 合了會有什麼壞處？(3) 分開的運維成本值得嗎？"
                        ),
                    ]
                ),
                Quest(
                    id: "10-2",
                    name: "Frontend 服務層",
                    description: "理解 31 個 service 目錄的組織方式",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "服務目錄組織",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "前端服務目錄最可能按什麼原則組織？",
                            scenario: Challenge.Scenario(
                                title: "前端服務架構",
                                narrative: "你打開 src/services 目錄，看到 31 個子目錄。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["企業級應用通常按業務領域組織代碼"],
                            explanation: "前端服務按業務領域組織（Domain-driven），每個目錄對應一個業務能力。",
                            frameworkTip: "代碼組織原則：按業務領域分，而非按技術分。"
                        ),
                        Challenge(
                            id: 2,
                            name: "前端框架選型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Decision Intelligence 使用哪個前端框架？",
                            scenario: Challenge.Scenario(
                                title: "技術選型",
                                narrative: "Decision Intelligence 的前端技術棧。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["React 19 是最新主要版本"],
                            explanation: "使用 React 19 SPA，搭配 Vite 建構，不使用 SSR 框架。",
                            frameworkTip: "技術選型要考慮：團隊熟悉度、生態系成熟度、產品需求。"
                        ),
                    ]
                ),
                Quest(
                    id: "10-3",
                    name: "Supabase 層",
                    description: "認識 Auth、Postgres、Storage、Edge Functions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Supabase 服務範圍",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪項不是 Supabase 在此專案中提供的服務？",
                            scenario: Challenge.Scenario(
                                title: "Supabase 作為 BaaS",
                                narrative: "Decision Intelligence 使用 Supabase 而非自建後端。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["ML 相關工作由另一層負責"],
                            explanation: "Supabase 提供 Auth、Postgres、Storage 和 Edge Functions。ML 由獨立的 FastAPI 層處理。",
                            frameworkTip: "BaaS 的價值：減少自建基礎設施負擔，專注業務邏輯。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Edge Functions 角色",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Edge Functions 最主要的用途是？",
                            scenario: Challenge.Scenario(
                                title: "Edge Functions 用途",
                                narrative: "Edge Functions 在架構中扮演什麼角色？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["輕量級伺服器端函數，處理不適合放在前端的邏輯"],
                            explanation: "Edge Functions 處理需要伺服器端執行的邏輯，如 webhook、第三方 API 整合、敏感操作。",
                            frameworkTip: "判斷邏輯放哪層：需要秘密金鑰？伺服器端。需要 GPU？ML API。都不需要？前端。"
                        ),
                    ]
                ),
                Quest(
                    id: "10-4",
                    name: "ML API 入口",
                    description: "理解 FastAPI、solver、registry 與非同步作業",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ML API 技術棧",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "ML API 使用的 Python Web 框架是？",
                            scenario: Challenge.Scenario(
                                title: "ML API 技術選型",
                                narrative: "ML API 是獨立部署的 Python 服務。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["以高效能和自動 API 文件著稱"],
                            explanation: "ML API 使用 FastAPI — 高效能、自動 OpenAPI 文件、原生 async/await。",
                            frameworkTip: "ML 服務常選 FastAPI：型別提示 → 自動驗證 → 自動文件。"
                        ),
                        Challenge(
                            id: 2,
                            name: "非同步作業模式",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "長時間 ML 推論任務使用什麼模式？",
                            scenario: Challenge.Scenario(
                                title: "為什麼需要非同步",
                                narrative: "ML 推論可能需要數分鐘，前端不能一直等待。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["AsyncRunService 管理狀態：pending → running → completed/failed"],
                            explanation: "長時間任務採用非同步模式：提交任務 → 拿到 job ID → 輪詢狀態。避免 HTTP timeout。",
                            frameworkTip: "非同步作業三要素：提交（POST）、查詢（GET /status）、取消（DELETE）。"
                        ),
                    ]
                ),
                Quest(
                    id: "10-5",
                    name: "請求流向追蹤",
                    description: "追蹤三條主要請求路徑",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "認證流向",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "使用者登入的請求流向是？",
                            scenario: Challenge.Scenario(
                                title: "使用者登入流程",
                                narrative: "追蹤登入請求在四層架構中的流向。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Supabase Auth 直接處理認證，不經過 Edge Function"],
                            explanation: "登入流向：Frontend → Supabase Auth → 驗證成功返回 JWT → Frontend 存儲 JWT。",
                            frameworkTip: "追蹤請求流向時，畫出每個箭頭，標註傳遞的資料。"
                        ),
                        Challenge(
                            id: 2,
                            name: "預測請求流向",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "預測請求的完整流向最可能是？",
                            scenario: Challenge.Scenario(
                                title: "完整預測流程",
                                narrative: "使用者點擊「執行預測」，追蹤請求經過的所有層。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Frontend 直接呼叫 ML API，JWT 用於認證"],
                            explanation: "Frontend 帶 JWT → ML API 驗證 → 建立非同步作業 → 完成後結果寫回 DB → Frontend 輪詢獲取。前端不直接操作資料庫做預測，也不走 Edge Function（因為 ML 計算需要 Python）。前端直接呼叫 ML API 的 REST endpoint。",
                            frameworkTip: "複雜請求追蹤法：畫序列圖，標註每步的觸發條件和回傳資料。"
                        ),
                        Challenge(
                            id: 3,
                            name: "故障排除：系統變慢",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "你會從哪一層開始調查？",
                            scenario: Challenge.Scenario(
                                title: "情境診斷",
                                narrative: "使用者反映「系統變慢了，跑預測要等 3 分鐘，以前只要 30 秒」。你是 on-call 工程師，需要快速定位問題。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["問題出在「跑預測」，預測是 ML API 的工作", "遙測數據（telemetry）會記錄每次求解的時間和引擎"],
                            explanation: "「跑預測變慢」直接指向 ML API 層。第一步查 solver_telemetry_events，看平均求解時間的趨勢。可能的原因：(1) 數據量變大了（SKU 從 1,000 變 4,000）；(2) solver 引擎設定被改了；(3) 伺服器記憶體不足導致 swap。前端和 Supabase 不負責預測計算，ai-proxy 只負責 AI 聊天不負責預測，所以排除 A/C/D。",
                            frameworkTip: "故障排除的第一步：先確認問題出在哪一層。問「這個功能是哪一層負責的？」然後從那一層的監控數據開始查。"
                        ),
                    ]
                ),
                Quest(
                    id: "10-6",
                    name: "架構白板題（Boss）",
                    description: "畫出四層架構並說明每層的具體檔案",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "架構圖說明",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "面試白板題：系統架構",
                                narrative: "面試官：「請畫出 Decision Intelligence 的系統架構，每一層至少舉兩個具體模組。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["從上到下：UI → BaaS → Serverless → ML", "想想每層有哪些目錄或檔案"],
                            explanation: "架構白板題考：(1) 全貌理解 (2) 具體細節 (3) 層間關係。",
                            frameworkTip: "架構圖三要素：Components + Connections + Contracts。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 11,
            name: "部署與執行環境",
            emoji: "🚀",
            description: "理解 Decision Intelligence 的部署拓撲、Docker 設定與啟動流程",
            quests: [
                Quest(
                    id: "11-1",
                    name: "部署拓撲",
                    description: "理解 Static Hosting + Supabase + ML Container 的部署方式",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "三區部署模型",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個是正確的部署拓撲？",
                            scenario: Challenge.Scenario(
                                title: "部署拓撲圖",
                                narrative: "Decision Intelligence 的三個組件分別部署在不同環境。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["前端是靜態檔案，Supabase 是託管服務，ML API 需要容器化"],
                            explanation: "三區部署：靜態前端（CDN）、Supabase 託管服務、ML API Docker 容器。各自獨立擴展。",
                            frameworkTip: "現代部署原則：不同工作負載用不同部署策略。靜態 → CDN，服務 → 容器。"
                        ),
                        Challenge(
                            id: 2,
                            name: "為什麼 ML API 要容器化",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "ML API 需要容器化的主要原因是？",
                            scenario: Challenge.Scenario(
                                title: "容器化決策",
                                narrative: "團隊討論為什麼 ML API 需要 Docker 而前端不用。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Python ML 依賴複雜，不同環境容易出問題"],
                            explanation: "ML API 有複雜的 Python 依賴（numpy、pandas、sklearn 等），容器化確保在開發、測試、生產環境中完全一致。",
                            frameworkTip: "容器化的核心價值：環境一致性。「在我機器上能跑」→「在哪都能跑」。"
                        ),
                    ]
                ),
                Quest(
                    id: "11-2",
                    name: "Dockerfile 解析",
                    description: "理解多階段建構、Chronos 排除與映像大小",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "多階段建構",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "多階段建構的主要好處是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Multi-stage Docker Build",
                                narrative: "ML API 的 Dockerfile 使用多階段建構（multi-stage build）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["建構階段的工具（編譯器、dev dependencies）不需要出現在最終映像"],
                            explanation: "多階段建構：第一階段安裝建構工具和依賴，第二階段只複製需要的產出。生產映像不含編譯器和開發工具，顯著縮小。",
                            frameworkTip: "Docker 映像瘦身三板斧：多階段建構、.dockerignore、最小化基礎映像。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Chronos 排除",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "排除 Chronos 的主要考量是什麼？",
                            scenario: Challenge.Scenario(
                                title: "可選依賴管理",
                                narrative: "Dockerfile 中可以選擇排除 Chronos（時序預測模型），產生 lean 版本。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos 依賴 PyTorch，而 PyTorch 非常大"],
                            explanation: "Chronos 需要 PyTorch（~700MB），排除後映像從 ~1.5GB 降至 ~800MB。不需要時序預測的部署可以用 lean 版本。",
                            frameworkTip: "映像大小直接影響：部署速度、儲存成本、啟動時間。能選就選 lean。"
                        ),
                    ]
                ),
                Quest(
                    id: "11-3",
                    name: "環境變數與 Secrets",
                    description: "理解三類環境變數的管理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "環境變數分類",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個環境變數最不應該出現在前端程式碼中？",
                            scenario: Challenge.Scenario(
                                title: "三類環境變數",
                                narrative: "Decision Intelligence 的環境變數分為三大類。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["SERVICE_ROLE_KEY 有完整的資料庫存取權限"],
                            explanation: "VITE_ 開頭的變數會被 Vite 直接替換進前端 JavaScript 裡，任何人打開 DevTools 就看得到。SUPABASE_SERVICE_ROLE_KEY 有完整的資料庫存取權限（跳過 RLS），如果暴露等於把資料庫的大門鑰匙貼在門上。它應該透過 supabase secrets set 存在伺服器端。",
                            frameworkTip: "環境變數安全規則：前端只能用公開金鑰（anon key），私密金鑰只能在伺服器端。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Secret 管理",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪種 secret 管理方式最安全？",
                            scenario: Challenge.Scenario(
                                title: "Secret 管理方式",
                                narrative: "團隊討論如何管理 API keys 和資料庫密碼。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Secrets 絕對不能進入版本控制"],
                            explanation: "Secrets 應透過 CI/CD pipeline 或 secret manager 注入，永遠不應出現在 Git 歷史中。",
                            frameworkTip: "一旦 secret 進了 Git，即使刪除也留在歷史中。預防 > 補救。"
                        ),
                    ]
                ),
                Quest(
                    id: "11-4",
                    name: "健康檢查機制",
                    description: "理解 healthcheck.sh、/healthz、liveness vs readiness",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Liveness vs Readiness",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Liveness probe 失敗時，系統會怎麼做？",
                            scenario: Challenge.Scenario(
                                title: "兩種健康檢查",
                                narrative: "容器編排系統使用兩種健康檢查：liveness 和 readiness。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Liveness = 還活著嗎？不活了就重啟"],
                            explanation: "用醫院比喻：Liveness 就像護士確認病人還有呼吸 — 沒有就急救（重啟容器）。Readiness 就像確認病人可以出院了 — 還沒好就繼續住院（暫停流量但不重啟）。DI 的 ML API 有 60 秒的啟動寬限期（start-period），因為載入 ML 模型需要時間。在寬限期內 readiness 失敗不算異常。",
                            frameworkTip: "Liveness = 需要重啟嗎？ Readiness = 可以接客嗎？兩者目的不同。"
                        ),
                        Challenge(
                            id: 2,
                            name: "健康端點設計",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "/healthz 端點應該檢查什麼？",
                            scenario: Challenge.Scenario(
                                title: "/healthz 端點",
                                narrative: "ML API 暴露 /healthz 端點供監控系統檢查。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["太簡單（只回 200）偵測不到問題，太複雜會影響效能"],
                            explanation: "/healthz 應檢查：(1) 服務本身存活 (2) 關鍵依賴可連線。不應執行重量級操作。",
                            frameworkTip: "健康檢查原則：輕量、快速、能偵測真正的問題。"
                        ),
                    ]
                ),
                Quest(
                    id: "11-5",
                    name: "啟動與驗證流程",
                    description: "理解 migration 順序與 preflight checks",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "啟動順序",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的啟動順序是？",
                            scenario: Challenge.Scenario(
                                title: "服務啟動順序",
                                narrative: "部署時，三個組件需要按特定順序啟動。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["資料庫必須先準備好，因為其他服務依賴它"],
                            explanation: "先跑 DB migration（Supabase）確保 schema 就緒 → 啟動 ML API → 最後部署前端。依賴方向決定啟動順序。",
                            frameworkTip: "啟動順序遵循依賴方向：被依賴者先啟動。畫出依賴圖就知道順序。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Preflight Check",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Preflight check 最重要的檢查項目是？",
                            scenario: Challenge.Scenario(
                                title: "部署前檢查",
                                narrative: "部署前需要確認環境是否就緒。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["缺少環境變數是部署失敗最常見的原因之一"],
                            explanation: "缺少環境變數會導致啟動失敗或執行異常。Preflight check 應驗證所有必要的 env vars 和 secrets 已設定。",
                            frameworkTip: "部署 Checklist：環境變數 ✓ → DB migration ✓ → 健康檢查 ✓ → 流量切換 ✓"
                        ),
                    ]
                ),
                Quest(
                    id: "11-6",
                    name: "Staging 部署計畫（Boss）",
                    description: "撰寫一份完整的 staging 環境部署計畫",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "撰寫 Staging 部署計畫",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "部署計畫文件",
                                narrative: "你被要求撰寫 Decision Intelligence 在 staging 環境的部署計畫，團隊第一次部署這個系統。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["想想如果部署失敗，你需要什麼資訊來排錯", "回滾方案要具體：回到哪個版本、怎麼回"],
                            explanation: "好的部署計畫是可執行的文件，任何團隊成員都能照著做。",
                            frameworkTip: "部署計畫公式：Prerequisites → Steps → Verification → Rollback → Communication"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 12,
            name: "工程品質信號",
            emoji: "🛡️",
            description: "理解 Decision Intelligence 的測試策略、回歸測試與品質關卡",
            quests: [
                Quest(
                    id: "12-1",
                    name: "測試金字塔",
                    description: "理解 Unit / Component / E2E / Regression 各層",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "金字塔層級",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "測試金字塔由下到上的正確順序是？",
                            scenario: Challenge.Scenario(
                                title: "測試金字塔",
                                narrative: "測試金字塔是軟體品質的基礎模型。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["底層數量最多、速度最快；頂層數量最少、涵蓋最廣"],
                            explanation: "用白話講，測試金字塔就像餐廳的品質管理三層。Unit Test 是檢查每顆番茄新不新鮮 — 數量最多、速度最快，幾秒鐘掃幾百個，一顆壞的立刻丟掉。Component Test 是試做一道菜看味道對不對 — 把幾個食材（元件）組合起來測行為。E2E Test 是請神秘客來吃一頓完整的晚餐 — 從進門、點餐、上菜到結帳走完全程，最貼近真實體驗但成本最高。為什麼要金字塔形？因為如果每次都派神秘客（E2E），一天只能測一兩次；但檢查番茄（Unit）一天能測幾千次。所以投資比例是底層大量 Unit、中間適量 Component、頂層少量 E2E，這樣 ROI 最高。",
                            frameworkTip: "測試投資比例：大量 Unit + 適量 Component + 少量 E2E = 最佳 ROI。"
                        ),
                        Challenge(
                            id: 2,
                            name: "各層的目的",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "測試完整 Golden Path 流程應該用哪一層？",
                            scenario: Challenge.Scenario(
                                title: "選擇正確的測試層級",
                                narrative: "你要測試「使用者能完成整個 Golden Path 流程」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["「完整流程」需要跨多個元件和頁面"],
                            explanation: "這題的關鍵是「完整流程」三個字。Golden Path 是從上傳 → 驗證 → 預測 → 規劃 → 審批 → 輸出一路走到底，中間跨了六七個頁面和幾十個元件。用 Unit Test 測這個？那就像用放大鏡一格一格檢查拼圖，永遠看不到全景。你需要的是 E2E Test — 讓 Playwright 扮演一個真人使用者，打開瀏覽器、點按鈕、填表單、等頁面載入、檢查結果。為什麼不用人工測？因為 Golden Path 每次發版都要測，人工測一次要 30 分鐘，Playwright 跑 3 分鐘搞定，而且不會漏步驟。So what：選錯測試層級 = 花了力氣卻測不到該測的東西。",
                            frameworkTip: "選測試層級的依據：測試範圍越廣 → 層級越高。單一函數 → Unit。完整流程 → E2E。"
                        ),
                    ]
                ),
                Quest(
                    id: "12-2",
                    name: "回歸測試套件",
                    description: "理解 deterministic fixtures 與 regression_result.json",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "回歸測試的目的",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "回歸測試的主要目的是什麼？",
                            scenario: Challenge.Scenario(
                                title: "什麼是回歸測試",
                                narrative: "團隊每次發布前都要跑回歸測試套件。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Regression = 退步。回歸測試防止退步。"],
                            explanation: "Regression 這個字翻成白話就是「開倒車」。回歸測試就是防止你開倒車的行車紀錄器。舉個真實場景：工程師改了 solver 的一個小參數想提升效能，結果不小心讓所有預測結果偏移 3% — 如果沒有回歸測試，這個問題上線後客戶才發現，那時候採購單都下了。有回歸測試的話，它會拿 regression_result.json（之前跑過的正確結果）跟新版本的輸出比對，一有差異就告警：「欸，同樣的輸入怎麼結果不一樣了？」。So what：回歸測試不是測新功能好不好用，是確保你加新東西的時候沒有把舊東西弄壞。",
                            frameworkTip: "回歸測試是安全網：改動越大，安全網越重要。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Deterministic Fixtures",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "為什麼回歸測試使用 deterministic fixtures？",
                            scenario: Challenge.Scenario(
                                title: "固定測試資料",
                                narrative: "ML 模型的回歸測試使用固定的 fixtures 而非隨機資料。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["如果每次輸入不同，怎麼知道輸出改變是因為 bug 還是因為輸入不同？"],
                            explanation: "想像你在校準體重計。如果每次拿不同的東西上去量，體重計顯示不一樣的數字，你怎麼知道是東西重量不同還是體重計壞了？所以你固定拿同一個 10kg 的啞鈴去量 — 顯示 10kg 就是對的，顯示 9.5kg 就是壞了。Deterministic fixtures 就是那個「永遠 10kg 的啞鈴」。在 DI 裡，fixture 是一組固定的輸入資料（比如某個特定的需求預測場景），跑出來的結果應該永遠一致。為什麼不能用隨機資料？因為 ML 模型對不同輸入本來就會產生不同輸出，隨機輸入 → 結果變了 → 你根本分不清是 bug 還是正常變化。這就是為什麼 flaky test（時好時壞的測試）是測試團隊的噩夢 — 你再也不知道哪些失敗是真的。",
                            frameworkTip: "可重複性是測試的生命線。Flaky test（時好時壞）= 沒有價值的測試。"
                        ),
                    ]
                ),
                Quest(
                    id: "12-3",
                    name: "Release Gate 機制",
                    description: "理解 MAPE 門檻、覆蓋率要求與 canary 部署",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "MAPE 門檻",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "MAPE（Mean Absolute Percentage Error）門檻的作用是什麼？",
                            scenario: Challenge.Scenario(
                                title: "預測精度門檻",
                                narrative: "Release gate 要求預測模型的 MAPE 不能超過門檻值。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["MAPE 是預測誤差指標，越低越好"],
                            explanation: "MAPE 用白話講就是「你的預測平均偏離實際多少百分比」。MAPE 0.05 代表平均偏差 5% — 預測這個月要進 100 箱牛奶，實際需求可能是 95-105 箱，還算靠譜。但如果 MAPE 飆到 23%？預測 100 箱，實際可能是 77-123 箱 — 就像天氣預報說 30°C，結果實際溫度可能是 23°C 或 37°C，參考價值大打折扣。Release Gate 設門檻的道理就像駕照考試的及格線：MAPE 超過門檻 = 預測品質不合格 = 不准上線。為什麼這麼嚴格？因為在 DI 裡模型預測直接接到採購決策，MAPE 從 5% 退步到 10% 不只是數字不好看，可能代表幾十萬甚至上百萬的庫存成本差異。",
                            frameworkTip: "ML Release Gate：精度門檻 + 回歸測試 + A/B 測試 = 安全上線。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Canary 部署",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Canary 部署的核心策略是什麼？",
                            scenario: Challenge.Scenario(
                                title: "漸進式部署",
                                narrative: "新版本不會立刻推給所有使用者。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Canary = 金絲雀。礦坑裡的金絲雀先探路。"],
                            explanation: "Canary（金絲雀）部署的典故超好記：以前礦工不知道礦坑裡有沒有毒氣，就帶一隻金絲雀進去 — 金絲雀比人敏感，如果牠倒了代表有毒氣，人趕快撤退。軟體部署也是一樣的邏輯：你不確定新版本有沒有 bug，就先推給 5% 的使用者當「金絲雀」。如果這 5% 的錯誤率、延遲、業務指標都正常，就慢慢開放（10% → 30% → 100%）。如果金絲雀倒了（錯誤率飆升），立刻回滾，只有 5% 的人受影響。反過來想：如果直接 100% 推出然後出 bug？所有使用者同時炸鍋，客服電話接到手軟，回滾的壓力也大十倍。這就是為什麼成熟的團隊都用漸進式部署 — 用小風險換大安心。",
                            frameworkTip: "部署風險控制：Canary（小流量）→ 監控 → 全量。出問題時只影響少數使用者。"
                        ),
                    ]
                ),
                Quest(
                    id: "12-4",
                    name: "E2E 與 Smoke Tests",
                    description: "理解 Playwright 測試與冒煙測試",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Smoke Test 定義",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Smoke test 的目的是什麼？",
                            scenario: Challenge.Scenario(
                                title: "冒煙測試",
                                narrative: "部署後第一個跑的測試是 smoke test。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Smoke = 煙。通電後冒煙 = 有問題。"],
                            explanation: "Smoke test 的由來很直覺：硬體工程師做好一塊電路板，通電看有沒有冒煙 — 冒煙就代表有大問題，不用往下測了。軟體的 smoke test 精神一模一樣：部署完花個 1-2 分鐘跑最基本的幾個檢查 — 首頁打得開嗎？登入能用嗎？API 有回應嗎？注意，它不是要測所有功能，只是快速確認「房子沒有著火」。為什麼這個這麼重要？因為如果 smoke test 就失敗了（系統根本跑不起來），後面的回歸測試、E2E 測試全都不用浪費時間跑了，直接回滾到上一個版本。用白話講：smoke test 是部署後的第一道防線，像急診室的 triage — 先確認病人有沒有呼吸心跳，再談治療方案。",
                            frameworkTip: "部署後驗證層級：Smoke test（分鐘級）→ 回歸測試（小時級）→ 完整 E2E（更長）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Playwright E2E",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Playwright 相比 Selenium 的主要優勢是？",
                            scenario: Challenge.Scenario(
                                title: "E2E 測試框架",
                                narrative: "Decision Intelligence 使用 Playwright 做 E2E 測試。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Playwright 的 auto-wait 機制大幅減少 flaky tests"],
                            explanation: "寫過 E2E 測試的人都有這個痛：你的測試在按鈕出現之前就去點它，結果失敗 — 但重跑一次又過了。這種叫 flaky test（時好時壞的測試），是測試團隊的頭號公敵。Playwright 解決這個問題的殺手鐧是 auto-wait：它會自動等元素出現、可以點了才去點，不用你寫一堆 sleep(2000) 祈禱網路夠快。就像一個有耐心的使用者 — 頁面還沒載完他就等，載完了才操作。Selenium（老牌框架）沒有這個機制，所以 flaky rate 高很多。DI 選 Playwright 的原因很實際：Golden Path 流程跨好幾個頁面，每個頁面載入時間不同，沒有 auto-wait 的話測試動不動就失敗，CI 永遠是紅的，大家就不信任測試了。",
                            frameworkTip: "E2E 框架選擇考量：穩定性 > 速度 > 功能豐富度。Flaky test 是最大成本。"
                        ),
                    ]
                ),
                Quest(
                    id: "12-5",
                    name: "Guardrail 檢查",
                    description: "理解 AI Worker 的治理控制與行動護欄",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Guardrail 的必要性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "AI Worker 的 guardrail 最主要防止什麼？",
                            scenario: Challenge.Scenario(
                                title: "AI 行動護欄",
                                narrative: "Digital Worker 可以自主執行決策，但需要 guardrails 限制其行為範圍。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Autonomy 需要 boundaries。自主權越大，護欄越重要。"],
                            explanation: "用白話講：AI Worker 的 guardrail 就像給實習生設定的權限範圍。你不會讓第一天上班的實習生直接簽核百萬採購單吧？同樣的道理，AI Worker 有自主權但必須有邊界。DI 的三道護欄分別是：toolPermissionGate（你能用哪些工具 — 比如只能讀資料不能刪資料）、governanceRulesGate（業務規則 — 金額超過 50 萬自動轉人工審批）、capabilityPolicyGate（任務複雜度要配對應的模型等級）。為什麼不能沒有 guardrails？因為 AI 不會「怕」— 人類看到危險操作會猶豫，AI 不會。它會很有自信地執行一個錯誤的決策，而且速度比人快十倍。所以護欄不是因為 AI 笨，是因為 AI 太有行動力了，犯錯的速度也快。",
                            frameworkTip: "AI 治理三層：認證（你是誰）→ 授權（你能做什麼）→ 護欄（你不能做什麼）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "GovernanceAction",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "GovernanceAction 機制的設計原則是什麼？",
                            scenario: Challenge.Scenario(
                                title: "治理行動類型",
                                narrative: "Decision Intelligence 使用 GovernanceAction 定義允許的操作。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Least Privilege — 最小權限原則"],
                            explanation: "最小權限原則的白話翻譯：「除非我明確說你可以，否則你什麼都不能做。」很多人直覺會覺得：列出不能做的事（黑名單）比較簡單吧？但想想看 — 你能列出世界上所有危險的事嗎？不能，因為你想不到的危險操作才是最危險的。反過來，列出「能做的事」（白名單）就容易多了，因為安全的操作是有限的。舉個例子：你不會跟保姆說「不能放火、不能偷東西、不能...（列一萬條）」，你會說「你可以餵飯、換尿布、陪玩（列五條）」。DI 的 GovernanceAction 就是這樣設計的 — 每個 Worker 只能執行白名單上的動作。一個新動作沒在白名單上？預設拒絕。這樣即使有人發現了新的攻擊方式，系統也不會被利用。",
                            frameworkTip: "安全設計原則：Deny by default, Allow by exception。"
                        ),
                    ]
                ),
                Quest(
                    id: "12-6",
                    name: "品質報告（Boss）",
                    description: "判斷是否可以將新版本推上 Production",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Go/No-Go 決策",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "版本上線審查",
                                narrative: "你是 Release Manager。新版本的測試報告如下：\n- Unit tests: 98% pass (2 flaky)\n- Regression MAPE: 4.2% (門檻 5%)\n- E2E: 95% pass (1 failed: PDF export)\n- Coverage: 78% (要求 80%)\n- Canary (5% traffic): 無錯誤, latency +3%",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Coverage 78% < 80% 門檻 — 這是硬性要求嗎？", "一個 E2E 失敗可能是 flaky 也可能是真的 bug"],
                            explanation: "這題就像主管問你「明天可以上線嗎？」— 你不能只說「可以」或「不行」，你要有理有據地分析。好的 Go/No-Go 決策要做三件事：(1) 把問題分類成 blocking（必須修才能上線）和 non-blocking（可以先上線再修），Coverage 78% < 80% 門檻算 blocking 嗎？要看這個門檻是硬性規定還是指導方針；(2) 評估風險 — PDF export 失敗影響多少使用者？如果 90% 的人根本不用 PDF export 那就不是 blocking；(3) 提出具體方案而不是「修好就好」— 比如「Coverage 差 2%，我們補 3 個 unit test 預計 2 小時，今天下午可以達標」。So what：Release Manager 的價值不是說 Yes/No，是讓團隊知道具體要做什麼才能安全上線。",
                            frameworkTip: "Release 決策框架：Must-have gates（必過）vs Nice-to-have（建議）vs Known issues（已知問題，可接受）。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 13,
            name: "ML API 後端深度",
            emoji: "🧠",
            description: "理解 ML API 的認證、多租戶、速率限制與非同步作業機制",
            quests: [
                Quest(
                    id: "13-1",
                    name: "JWT 認證機制",
                    description: "理解 HS256、JWTClaims、stateless auth",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "JWT 基礎",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "JWT 認證為什麼稱為「無狀態」（stateless）？",
                            scenario: Challenge.Scenario(
                                title: "JWT 認證",
                                narrative: "ML API 使用 JWT（JSON Web Token）進行無狀態認證。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Session-based 需要伺服器記住每個使用者的狀態"],
                            explanation: "JWT 將使用者資訊編碼在 token 中（自包含），伺服器驗證簽名即可，不需要查詢 session store。",
                            frameworkTip: "Stateless auth 的好處：水平擴展容易，任何一台伺服器都能驗證 token。"
                        ),
                        Challenge(
                            id: 2,
                            name: "HS256 簽名",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "HS256（HMAC-SHA256）簽名的特性是？",
                            scenario: Challenge.Scenario(
                                title: "JWT 簽名演算法",
                                narrative: "ML API 使用 HS256 簽名 JWT。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["HMAC = Hash-based Message Authentication Code，使用 shared secret"],
                            explanation: "HS256 是對稱簽名：簽名和驗證用同一個 secret。適合單一服務或信任的服務群。若需跨組織驗證，應用 RS256（非對稱）。",
                            frameworkTip: "HS256 vs RS256：內部服務 → HS256（簡單）。跨組織 → RS256（公鑰可安全分享）。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Public Paths",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "為什麼健康檢查端點 /healthz 不需要 JWT 認證？",
                            scenario: Challenge.Scenario(
                                title: "不需認證的路徑",
                                narrative: "某些 API 路徑不需要 JWT，例如 /healthz。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["負載均衡器需要定期檢查後端服務是否存活"],
                            explanation: "健康檢查端點必須公開，讓基礎設施（LB、K8s）能無障礙地監控服務狀態。",
                            frameworkTip: "Public paths 原則：只有基礎設施端點和公開資訊。任何含使用者資料的端點都需認證。"
                        ),
                    ]
                ),
                Quest(
                    id: "13-2",
                    name: "多租戶與角色控制",
                    description: "理解 GovernanceAction、role enforcement、least privilege",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "多租戶隔離",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "多租戶架構中，最關鍵的安全需求是？",
                            scenario: Challenge.Scenario(
                                title: "Multi-tenant Architecture",
                                narrative: "多家企業共用同一個 ML API 實例。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想像 A 公司的預測資料被 B 公司看到的後果"],
                            explanation: "多租戶最關鍵的是資料隔離。每個 API 請求必須驗證 tenant_id，確保只存取該租戶的資料。",
                            frameworkTip: "多租戶安全三層：認證（誰）→ 租戶識別（哪家公司）→ 資料隔離（只看自己的）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "最小權限原則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "最小權限原則（Least Privilege）的正確應用是？",
                            scenario: Challenge.Scenario(
                                title: "Least Privilege",
                                narrative: "角色系統設計遵循最小權限原則。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["「剛好夠用」而非「方便好用」"],
                            explanation: "最小權限原則：只授予完成特定任務所需的最小權限。減少權限濫用和意外操作的風險。",
                            frameworkTip: "權限設計：先列出角色的具體任務，再逐一授權。多一個權限就多一分風險。"
                        ),
                    ]
                ),
                Quest(
                    id: "13-3",
                    name: "Rate Limiting",
                    description: "理解 InProcess vs Redis、sliding window、graceful degradation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "為什麼需要 Rate Limiting",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Rate limiting 最主要防止什麼？",
                            scenario: Challenge.Scenario(
                                title: "速率限制",
                                narrative: "ML API 對每個租戶設定了請求頻率上限。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Noisy neighbor = 吵鄰居。一個租戶用太多資源，其他人都受影響。"],
                            explanation: "Rate limiting 防止 noisy neighbor 問題：一個租戶的過度使用不會拖慢其他租戶。也防止 DDoS 攻擊。",
                            frameworkTip: "Rate limiting 保護三層：系統穩定性、公平性、安全性。"
                        ),
                        Challenge(
                            id: 2,
                            name: "InProcess vs Redis",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "什麼時候應該選擇 Redis rate limiter 而非 InProcess？",
                            scenario: Challenge.Scenario(
                                title: "兩種 Rate Limiter 實作",
                                narrative: "ML API 支援 InProcess（記憶體）和 Redis 兩種 rate limiter。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["InProcess 計數器只存在於單一進程的記憶體中"],
                            explanation: "用白話講：你開了 3 家分店（3 個 ML API 實例），每家各有一個計數器。如果限制每人每分鐘 10 次，用 InProcess 的話，同一個人去 3 家分店各買 10 次 = 總共 30 次。用 Redis 的話，3 家分店共用一個計數器，真的限制在 10 次。",
                            frameworkTip: "分散式系統需要集中式狀態（如 Redis）來協調。單機可以用 in-memory。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Graceful Degradation",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Redis 不可用時，以下哪種做法最合理？",
                            scenario: Challenge.Scenario(
                                title: "設計決策：Redis 掛了怎麼辦",
                                narrative: "DI 的 Rate Limiter 在 Redis 不可用時會自動降級到 InProcess 版本。你的同事問：「為什麼不直接放行所有請求？反正 Redis 只是暫時掛了。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["想想「完全不保護」和「完全擋住」哪個風險更大", "Graceful degradation = 優雅降級 = 用次佳方案繼續運作"],
                            explanation: "DI 的做法是 C — 降級到 InProcess。完全放行（A）有安全風險，完全阻擋（B）等於自己把自己搞掛。降級到單機限流雖然不夠精確（多實例時每台各算各的），但至少每台機器有基本保護。這就是 graceful degradation 的精神：依賴出問題時，用次佳方案繼續運作，而不是崩潰。",
                            frameworkTip: "設計依賴外部服務的功能時，永遠問：「它掛了怎麼辦？」三個選項：降級、重試、失敗。不要選「假裝沒事」。"
                        ),
                    ]
                ),
                Quest(
                    id: "13-4",
                    name: "非同步作業系統",
                    description: "理解 AsyncRunService 與 job 狀態流轉",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Job 狀態流轉",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "正確的 job 狀態流轉是？",
                            scenario: Challenge.Scenario(
                                title: "AsyncRunService 狀態機",
                                narrative: "非同步作業有明確的狀態流轉。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["任務提交後先等待（pending），開始後執行（running），最後有三種結局"],
                            explanation: "狀態流轉：pending（等待）→ running（執行中）→ completed（成功）/ failed（失敗）/ cancelled（取消）。",
                            frameworkTip: "狀態機設計：每個狀態的轉換條件要明確，不能有不合法的跳轉。"
                        ),
                        Challenge(
                            id: 2,
                            name: "作業取消機制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "取消一個 running 狀態的作業，系統應該怎麼做？",
                            scenario: Challenge.Scenario(
                                title: "取消長時間作業",
                                narrative: "使用者想取消一個已經跑了 5 分鐘的預測任務。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["優雅停止（Graceful shutdown）讓資源能正確釋放"],
                            explanation: "正確做法：標記 cancelled → 通知 worker → worker 檢查標記後優雅停止 → 釋放資源。不能直接殺進程，會導致資源洩漏。",
                            frameworkTip: "取消模式：cooperative cancellation。不是「殺」，而是「請」。Worker 自己決定何時停。"
                        ),
                    ]
                ),
                Quest(
                    id: "13-5",
                    name: "Telemetry 與 SSE",
                    description: "理解 solver telemetry、Prometheus metrics、SSE streaming",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SSE vs WebSocket",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "選擇 SSE 而非 WebSocket 的主要原因是？",
                            scenario: Challenge.Scenario(
                                title: "即時串流選擇",
                                narrative: "ML API 使用 SSE（Server-Sent Events）推送 solver 的即時進度。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Solver 進度是伺服器 → 客戶端的單向資料流"],
                            explanation: "SSE 是單向（伺服器→客戶端）串流，用 HTTP 實現，簡單輕量。WebSocket 是雙向通訊，適合聊天等需要雙向互動的場景。",
                            frameworkTip: "選擇通訊協議：單向推送 → SSE。雙向互動 → WebSocket。簡單勝過複雜。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Prometheus Metrics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個不是典型的 ML API 監控指標？",
                            scenario: Challenge.Scenario(
                                title: "監控指標",
                                narrative: "ML API 暴露 Prometheus 格式的 metrics。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["監控指標關注運行時行為，不是開發過程"],
                            explanation: "運行時監控指標：延遲、吞吐量、錯誤率、資源使用率。程式碼行數是開發指標，不屬於 runtime metrics。",
                            frameworkTip: "RED Method：Rate（吞吐）、Errors（錯誤）、Duration（延遲）— 服務監控三指標。"
                        ),
                    ]
                ),
                Quest(
                    id: "13-6",
                    name: "API 安全架構審查（Boss）",
                    description: "審查 ML API 的安全設計",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "安全架構審查報告",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "安全審查",
                                narrative: "你被要求對 ML API 的安全架構進行審查，向安全團隊報告發現。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["HS256 的 secret 如果洩漏，所有 token 都能被偽造", "多租戶隔離需要在每個查詢層面強制執行"],
                            explanation: "安全審查不是找茬，是系統性地評估防禦層是否完整。",
                            frameworkTip: "安全審查框架：Authentication → Authorization → Data Protection → Monitoring → Incident Response"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 14,
            name: "邊界與限制",
            emoji: "🚧",
            description: "理解 Decision Intelligence 的操作邊界與已知限制",
            quests: [
                Quest(
                    id: "14-1",
                    name: "Frontend-Only 部分啟動",
                    description: "理解沒有後端時前端能做什麼",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "部分啟動能力",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Frontend-only 模式下，以下哪個功能仍然可用？",
                            scenario: Challenge.Scenario(
                                title: "Frontend-Only 模式",
                                narrative: "ML API 和 Supabase 都無法連線時，前端仍然可以啟動。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["沒有後端 = 沒有認證、沒有資料、沒有計算"],
                            explanation: "想像你走進一家展示屋 — 門開著、燈亮著、家具都擺好了，你可以四處看看（靜態頁面和 UI 元件）。但水管沒接（Supabase 連不上 = 沒有資料可讀寫）、瓦斯沒接（ML API 連不上 = 沒有預測功能）、門鎖還沒裝（認證服務連不上 = 沒辦法登入）。所以你能做的就是「看」— 看頁面長什麼樣、按鈕在哪裡、流程怎麼走。為什麼要了解這個？因為面試可能會問「後端掛了使用者會看到什麼？」如果你回答「整個網站壞掉」就太粗糙了；正確的理解是：前端骨架還在，但所有需要後端的功能（登入、資料、預測）都不能用。這也是為什麼好的前端要設計 graceful degradation — 後端掛了不是白屏，而是告訴使用者「這個功能暫時不可用」。",
                            frameworkTip: "理解系統的 degraded mode：哪些功能是核心（必須有後端），哪些可以降級運作。"
                        ),
                        Challenge(
                            id: 2,
                            name: "降級策略",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "後端不可用時，前端最佳的處理方式是？",
                            scenario: Challenge.Scenario(
                                title: "優雅降級",
                                narrative: "設計團隊討論當後端不可用時，前端應該如何處理。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["使用者體驗第一：告訴使用者發生了什麼，以及該怎麼辦"],
                            explanation: "這題考的是 UX 的基本功：出問題時你怎麼對待使用者。想像高鐵故障停在半路：最好的處理是廣播告訴你發生什麼事、預計多久恢復、可以做什麼（「故障排除中，預計 20 分鐘，車上提供免費飲料」）。最糟的處理？什麼都不說讓你乾等，或者裝沒事繼續開結果翻車。軟體也一樣 — 選項 C「用假資料填充」是最危險的，因為 DI 是做採購決策的系統，使用者看到假數據以為是真的然後下單 = 商業災難。選項 D 無限重新整理會卡死瀏覽器。正確做法（選項 B）三步走：Inform（告訴使用者怎麼了）→ Guide（說明哪些功能受影響）→ Fallback（提供聯繫方式或預計恢復時間）。So what：降級設計不是工程問題，是使用者信任問題。處理得好，使用者會覺得「這團隊很專業」；處理得差，使用者會覺得「這系統不可靠」。",
                            frameworkTip: "降級設計原則：Inform → Guide → Fallback。使用者永遠要知道發生了什麼。"
                        ),
                    ]
                ),
                Quest(
                    id: "14-2",
                    name: "SAP Adapter 邊界",
                    description: "理解 adapter ≠ turnkey connector 的限制",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Adapter vs Connector",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "SAP adapter 的正確描述是？",
                            scenario: Challenge.Scenario(
                                title: "SAP 整合邊界",
                                narrative: "Decision Intelligence 有 SAP adapter，但客戶期望的是一鍵整合。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Adapter ≠ Turnkey。每個企業的 SAP 配置都不同。"],
                            explanation: "用白話講，Adapter 是「轉接頭」，Connector 是「萬能插座」— 聽起來差不多，但差很多。SAP adapter 給你的是一個框架：schema mapping（讓 DI 的欄位和 SAP 的欄位對得上）和 API 橋接（讓兩邊能互傳資料）。但你得自己配線 — 因為世界上沒有兩家公司的 SAP 是一模一樣的。公司 A 用 S/4HANA 新版、公司 B 還在用 ECC 老版；公司 A 用了 MM（物料管理）+ PP（生產計劃），公司 B 只用 MM；更別說每家公司都加了一堆客製欄位。這就像你不可能做一條 USB 線同時接所有牌子的手機 — 介面長得不一樣啊。所以面試或客戶溝通時要注意：說「我們有 SAP adapter」是對的，說「一鍵整合 SAP」就是過度承諾了。",
                            frameworkTip: "向客戶溝通整合時：明確說明「提供什麼」和「需要客戶做什麼」。管理期望。"
                        ),
                        Challenge(
                            id: 2,
                            name: "鎖定的合約",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "鎖定資料合約的主要原因是？",
                            scenario: Challenge.Scenario(
                                title: "Locked Contracts",
                                narrative: "SAP adapter 的資料合約（data contract）被鎖定，不能隨意修改。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["多租戶環境中，一個客戶的改動可能影響其他客戶"],
                            explanation: "這題考的是「平台穩定性 vs 客戶客製化」的經典拉扯。想像一棟公寓的水管系統 — 如果每戶都可以自己改水管口徑，有人用 1 吋有人用 2 吋，整棟樓的水壓系統就亂掉了，某戶改了之後隔壁戶水壓不夠。鎖定 data contract 就是這個道理：DI 定義了固定的 schema（欄位名稱、格式、型別），所有客戶共用同一個合約。為什麼不讓客戶改？第一，測試矩陣會爆炸 — 10 個客戶各有自己的 schema 版本，你要測 10 種組合，QA 團隊會崩潰。第二，多租戶環境下，客戶 A 改了一個欄位型別，可能在共用的 pipeline 裡影響客戶 B 的資料解析。So what：這是產品經理常遇到的決策 — 客戶說「我只要改一個小欄位」，但你要看到後面的系統性風險。正確做法是用「配置」而非「修改程式碼」來滿足差異。",
                            frameworkTip: "平台 vs 客製化的張力：平台穩定性 > 個別客戶的客製化需求。用配置而非修改程式碼來滿足差異。"
                        ),
                    ]
                ),
                Quest(
                    id: "14-3",
                    name: "Optional ML 足跡",
                    description: "理解 Chronos 排除與 lean/full runtime",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Lean vs Full Runtime",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Lean runtime 與 Full runtime 的差異是？",
                            scenario: Challenge.Scenario(
                                title: "兩種部署版本",
                                narrative: "ML API 有 lean 和 full 兩種 runtime 版本。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos 帶來 ~700MB 的 PyTorch 依賴"],
                            explanation: "用白話講，Lean vs Full 就像你訂咖啡選「黑咖啡」還是「全套早午餐」。Lean runtime 是黑咖啡 — 只有核心功能（solver、validation、async runs），映像 ~800MB，啟動快、佔資源少。Full runtime 是全套早午餐 — 多了 Chronos 時間序列預測引擎，但 Chronos 底層用 PyTorch，光這個依賴就多吃 ~700MB，映像膨脹到 ~1.5GB。為什麼要分兩版？因為不是每個客戶都需要預測功能。有些客戶只用 solver 做最佳化排程，從來不碰時序預測 — 讓他們背著 700MB 的 PyTorch 包袱幹嘛？省記憶體、省部署時間、省雲端帳單。這也是好的產品設計原則：核心功能 always-on，重量級功能 opt-in。",
                            frameworkTip: "可選功能設計：核心功能 always-on + 重量級功能 opt-in。減少最小部署的負擔。"
                        ),
                        Challenge(
                            id: 2,
                            name: "什麼時候用 Full",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個場景必須使用 Full runtime？",
                            scenario: Challenge.Scenario(
                                title: "版本選擇決策",
                                narrative: "客戶需要決定部署 lean 還是 full 版本。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos 是時間序列預測引擎，只存在於 full 版本"],
                            explanation: "這題的判斷邏輯很簡單：看到「時間序列預測」或「Chronos forecast」= 必須 Full，其他都用 Lean 就好。Chronos 是 DI 裡唯一被「隔離」到 Full 版的功能，因為它的 PyTorch 依賴太重了。實務上的決策流程長這樣：客戶說「我要最佳化採購計畫」→ Lean（solver 就夠了）。客戶說「我要預測下個月各品項的需求量」→ Full（需要 Chronos）。客戶說「我只要驗證資料格式」→ Lean。原則是從最小可用版本開始，不要一開始就給客戶 Full — 因為 Full 版不只映像大，記憶體需求也高，雲端帳單也貴。等客戶明確說「我需要預測」再升級，這叫 right-sizing，面試被問到部署策略時很加分。",
                            frameworkTip: "部署決策：從最小可用版本開始（lean），有明確需求再升級（full）。"
                        ),
                    ]
                ),
                Quest(
                    id: "14-4",
                    name: "文件閱讀路線",
                    description: "理解推薦的文件閱讀順序",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "閱讀順序建議",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "最合理的文件閱讀順序是？",
                            scenario: Challenge.Scenario(
                                title: "新人 Onboarding",
                                narrative: "新加入的工程師問你：「這麼多文件，我應該從哪裡開始讀？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["先理解「做什麼」，再理解「怎麼做」，最後理解「怎麼跑」"],
                            explanation: "這題其實在考「學習策略」。想像你第一天到一家新公司 — 你不會一進門就打開程式碼開始看對吧？你會先問「我們公司做什麼的」（Product Spec），再問「系統長什麼樣」（Architecture），然後「API 怎麼串」（API Docs），最後「怎麼把環境跑起來」（Deployment Guide）。這就是 Why → What → How → Where 的順序。為什麼不能反過來？因為如果你先看 Deployment Guide，你會看到一堆 env var 和 docker command 但完全不知道為什麼要跑這些；如果你先看 Architecture 但不懂產品在幹嘛，那些方塊和箭頭對你來說就是抽象符號。先懂目的再看細節，學習效率差十倍。面試時如果被問「你怎麼 onboard 到一個新專案」，這個框架直接套用。",
                            frameworkTip: "學習新專案的順序：Why → What → How → Where。先理解目的再看細節。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Spec vs Status",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Spec 文件和 Status 文件的主要區別是？",
                            scenario: Challenge.Scenario(
                                title: "文件類型區分",
                                narrative: "專案中有 Spec 文件和 Status 文件，它們的用途不同。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Spec = 規格（目標），Status = 狀態（現實）。兩者可能有差距。"],
                            explanation: "用白話講，Spec 是「夢想」，Status 是「現實」— 而最有價值的資訊藏在夢想和現實之間的差距裡。Spec 文件說：「系統應該支援 5 種資料來源整合」。Status 文件說：「目前完成 3 種，SAP 和 Oracle 還在開發中」。這個差距（gap）= 2 種資料來源 = 還有多少技術債 = 下一季的工作重點 = 面試時你可以問的好問題。為什麼要分兩種文件而不是一份？因為 Spec 很少改（設計意圖不常變），但 Status 每週都在更新（進度一直在推進）。如果混在一起，你分不清哪些是「目標」哪些是「現況」。So what：讀專案文件時，養成習慣同時打開 Spec 和 Status 對照看 — gap 越大的地方風險越高，也越可能是你做出貢獻的機會。",
                            frameworkTip: "閱讀文件時注意 Spec 和 Status 的差距 — 那就是風險和機會所在。"
                        ),
                    ]
                ),
                Quest(
                    id: "14-5",
                    name: "操作邊界總覽",
                    description: "理解 env var guardrails 與執行限制",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "執行限制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "設定操作邊界（如最大請求大小、超時時間）的主要原因是？",
                            scenario: Challenge.Scenario(
                                title: "操作邊界",
                                narrative: "ML API 有各種執行限制，例如請求大小、超時時間等。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["一個超大的請求或超長的計算可以拖垮整個系統"],
                            explanation: "操作邊界的白話翻譯：「系統不是什麼都能吃，要限制份量。」想像一台果汁機 — 你不會把一整顆西瓜丟進去吧？它會爆的。DI 的操作邊界就是在說「這台果汁機最多放 500ml 的水果」。具體來說：DI_MAX_ROWS_PER_SHEET=2,000,000（一張表最多 200 萬筆，再多記憶體會爆）、DI_SOLVER_MAX_SECONDS=90（求解最多跑 90 秒，超過就是算不出來不要卡住 CPU）、DI_SOLVER_MAX_CONCURRENT=3（同時最多跑 3 個求解，不然伺服器全部的資源都被吃光）。為什麼這很重要？因為在多租戶環境中，一個客戶丟了一個超大的請求把伺服器搞掛，影響的是所有客戶。沒有邊界限制的系統就像一條沒有限速的高速公路 — 一台失速的車可以害全部的車出事。",
                            frameworkTip: "防禦性設計：預設所有輸入都可能是惡意的或異常的。設定合理的邊界。"
                        ),
                        Challenge(
                            id: 2,
                            name: "環境變數護欄",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "用環境變數控制操作邊界的好處是？",
                            scenario: Challenge.Scenario(
                                title: "Env Var Guardrails",
                                narrative: "透過環境變數控制系統的操作邊界。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["修改環境變數只需要重啟服務，不需要重新建構和部署"],
                            explanation: "用白話講，環境變數就是系統的「旋鈕」— 不用拆開機器就能調整行為。想像冷氣的溫度控制器：你要從 26°C 改成 24°C，轉個旋鈕就好，不用把冷氣拆開改電路板。環境變數也是一樣：dev 環境設 DI_SOLVER_MAX_SECONDS=30（開發時求快），prod 設 90（正式環境求穩）。為什麼不寫死在程式碼裡？想像這個場景：凌晨三點運維發現 solver 一直超時，如果限制寫在程式碼裡 → 要叫工程師起床改 code → PR review → CI/CD → 部署 → 至少半天。如果是環境變數 → 運維自己把 MAX_SECONDS 從 90 改成 120 → 重啟服務 → 5 分鐘搞定。這就是 12-Factor App 的核心原則之一：配置和程式碼分離。同一份程式碼在不同環境（dev/staging/prod）有不同行為，全靠環境變數控制。",
                            frameworkTip: "12-Factor App 原則：配置存環境變數。讓同一份程式碼在不同環境有不同行為。"
                        ),
                    ]
                ),
                Quest(
                    id: "14-6",
                    name: "限制溝通（Boss）",
                    description: "專業地回覆客戶的 SAP 整合問題",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "客戶溝通：SAP 整合限制",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "客戶信件回覆",
                                narrative: "客戶寫信問：「我們用 SAP S/4HANA，想要一鍵把所有資料同步到 Decision Intelligence。你們的 SAP adapter 可以做到嗎？我們希望下個月就上線。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["不要直接說「做不到」，而是說「需要以下步驟」", "提供一個評估流程，而不是一個模糊的承諾"],
                            explanation: "這題考的是業務工程師最重要的軟實力：怎麼說「做不到」又不得罪客戶。用白話講，你不能直接說「我們的 adapter 做不到一鍵整合」，但也不能為了讓客戶開心就說「沒問題下個月搞定」。正確做法是 ACON 公式：Acknowledge（肯定需求：「SAP S/4HANA 整合是很好的目標」）→ Clarify（說明現況：「我們的 adapter 提供 schema mapping 和 API 橋接框架，但每個客戶的 SAP 環境不同，需要客製化配置」）→ Offer（提供方案：「建議先做技術評估會議，盤點你們的模組和欄位」）→ Next Step（給時程：「評估大約 1-2 週，客製化配置大約 4-6 週，下個月上線可能偏緊但兩個月內可完成」）。So what：過度承諾短期讓客戶開心，但交付不了的時候信任崩盤。誠實管理期望才是長期合作的基礎。",
                            frameworkTip: "限制溝通公式：Acknowledge（理解需求）→ Clarify（說明現況）→ Offer（提供方案）→ Next Step（下一步）"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 39,
            name: "談判引擎與模擬系統",
            emoji: "🎯",
            description: "理解 CFR 博弈論談判、Digital Twin 供應鏈模擬",
            quests: [
                Quest(
                    id: "39-1",
                    name: "CFR 基礎概念",
                    description: "理解 CFR+ 演算法的核心原理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "CFR+ 是什麼",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "CFR+（Counterfactual Regret Minimization Plus）最準確的描述是什麼？",
                            scenario: Challenge.Scenario(
                                title: "CFR+ 演算法定位",
                                narrative: "你的同事問：「DI 的談判引擎用的是什麼技術？」你需要用一句話解釋 CFR+ 的本質。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想想 CFR 名字裡的 Counterfactual（反事實）和 Regret（後悔）分別代表什麼"],
                            explanation: "CFR+ 是博弈論裡的均衡求解演算法。白話講：它模擬 50,000 次談判，每次結束後算「後悔值」（如果我當初選另一個動作會多賺多少？），然後調整策略讓後悔值越來越小。跑夠多次後，策略會收斂到 Nash Equilibrium — 不管對方怎麼變招，你的策略都不會吃虧。這是有數學證明的，不是「聽起來有道理」的建議。",
                            frameworkTip: "區分 AI 方法：LLM 擅長語言任務，CFR 擅長策略博弈。選工具要看問題本質。"
                        ),
                        Challenge(
                            id: 2,
                            name: "為什麼不用 ChatGPT 談判",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "CFR+ 相比 ChatGPT 在談判場景中最關鍵的優勢是什麼？",
                            scenario: Challenge.Scenario(
                                title: "ChatGPT vs CFR+",
                                narrative: "老闆問：「我們已經有 ChatGPT 了，為什麼還要開發 CFR 談判引擎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["談判是零和博弈，需要的是最優策略，不是最好聽的話"],
                            explanation: "談判的核心是策略而非話術。ChatGPT 可以幫你想怎麼說（話術），但它無法保證這個策略在數學上是最優的。CFR+ 經過 50,000 次模擬和收斂，找到的是 Nash Equilibrium — 這就像打德州撲克時的 GTO（Game Theory Optimal）策略，是用數學證明的最優解，不是憑感覺猜的。",
                            frameworkTip: "技術選型原則：需要「最優策略」用最佳化演算法，需要「自然語言」用 LLM。不是什麼都要用 GPT。"
                        ),
                    ]
                ),
                Quest(
                    id: "39-2",
                    name: "博弈樹與 Position Buckets",
                    description: "理解談判怎麼建模成決策樹",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Position Bucket 分級",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Position Bucket 的 5 級怎麼分？",
                            scenario: Challenge.Scenario(
                                title: "買家議價能力分級",
                                narrative: "DI 的談判引擎用 Position Buckets 把買家的議價能力分成 5 個等級，根據風險分數（risk_score）決定。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["risk_score 低代表供應鏈風險低，買家替代選項多，議價力自然強"],
                            explanation: "公式是 bucket = max(0, floor((199 - risk_score) / 40))，分成 5 級：VERY_STRONG（risk 0-39）→ STRONG（40-79）→ NEUTRAL（80-119）→ WEAK（120-159）→ VERY_WEAK（160+）。邏輯很直覺：你的供應鏈風險越低（替代供應商多、品項好找），你談判時就越硬氣；反過來，如果這個供應商是唯一來源、品項稀缺，你就沒什麼籌碼。",
                            frameworkTip: "量化議價能力的好處：避免「我覺得我們很有優勢」的主觀判斷，用數據說話。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Bucket vs 連續分數",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "用離散 bucket 而非連續分數的主要原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "離散 vs 連續",
                                narrative: "有人問：「為什麼不直接用 risk_score（0-200）當連續值輸入 CFR，而要先分成 5 個 bucket？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["CFR 的計算複雜度跟 information set 的數量成正比"],
                            explanation: "這是精度和效率的取捨（trade-off）。CFR 的博弈樹每個節點都要存「累積後悔值」和「平均策略」，information set 越多，記憶體和計算量越大。200 個分數 × 3 種供應商 × 3 輪 × 3 動作 = 爆炸。5 個 bucket 把狀態空間壓縮到可管理的大小，而且實務上 risk_score 差 5 分的情況談判策略其實沒差別。",
                            frameworkTip: "系統設計的常見 trade-off：精度 vs 效率。很多時候「夠好」比「完美」更實用。"
                        ),
                    ]
                ),
                Quest(
                    id: "39-3",
                    name: "談判引擎流程",
                    description: "理解觸發條件、標準選項與 fallback",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "觸發條件",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "觸發談判引擎的條件是什麼？",
                            scenario: Challenge.Scenario(
                                title: "什麼時候啟動談判",
                                narrative: "不是每次採購都需要談判。DI 只在特定條件下才啟動談判引擎。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["如果 solver 本身就能找到好方案，何必多此一舉談判？"],
                            explanation: "談判引擎在兩種情況觸發：(1) Solver 不可行 — 在現有條件下找不到滿足所有約束的方案（比如預算不夠買最少訂購量）；(2) KPI 不達標 — 方案找到了但指標不好看。這時系統會嘗試「跟供應商談條件」來放寬約束，讓 solver 能找到更好的解。",
                            frameworkTip: "自動化的觸發設計：不是「永遠開著」，而是「需要時才啟動」。節省資源，也避免不必要的談判。"
                        ),
                        Challenge(
                            id: 2,
                            name: "6 個標準選項",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個不是 DI 談判引擎的 6 個標準選項之一？",
                            scenario: Challenge.Scenario(
                                title: "談判能談什麼",
                                narrative: "DI 的談判引擎有 6 個標準談判選項，每個選項代表一種可以談判的條件。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["6 個選項都是在同一個供應商框架內調整條件，不是換供應商"],
                            explanation: "6 個標準選項是：(1) Budget +10%（多給預算）、(2) MOQ relax（放寬最小訂購量）、(3) Pack rounding（包裝量取整寬鬆）、(4) Expedite（加急）、(5) Safety stock（調整安全庫存）、(6) Target -5%（降低目標）。這些都是可以跟供應商談或內部調整的具體條件。「更換供應商」不在這裡面，因為那是完全不同的決策流程。",
                            frameworkTip: "談判選項的設計：每個選項都是可量化的、有明確邊界的。不是「盡量便宜一點」這種模糊指令。"
                        ),
                        Challenge(
                            id: 3,
                            name: "CFR 查詢表不可用時",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "CFR 查詢表不可用時，系統應該怎麼做？",
                            scenario: Challenge.Scenario(
                                title: "Graceful Fallback",
                                narrative: "CFR 的查詢表是預先計算好的。但如果遇到訓練時沒覆蓋到的 bucket/supplier 組合，查不到策略怎麼辦？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["好的系統永遠有 Plan B。CFR 是加分項，不是必要條件。"],
                            explanation: "這是 DI 裡的 DEFAULT_CFR_INFLUENCE = 0.30 設計。CFR 的策略和 lexicographic ranking（按業務優先順序排序的方案）會以 70:30 的權重混合。如果 CFR 查不到策略，influence 歸零，完全用 lexicographic ranking。這就是 graceful fallback — 系統不會因為 CFR 失敗就癱瘓，而是退回到「合理但非最優」的備用方案。就像導航軟體沒網路時退回離線地圖一樣。",
                            frameworkTip: "Graceful degradation 原則：進階功能（CFR）壞了，基礎功能（排序邏輯）要還能用。"
                        ),
                    ]
                ),
                Quest(
                    id: "39-4",
                    name: "Digital Twin 模擬",
                    description: "理解 ChaosEngine 怎麼模擬供應鏈災難",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ChaosEngine 做什麼",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "ChaosEngine 的主要用途是什麼？",
                            scenario: Challenge.Scenario(
                                title: "供應鏈壓力測試",
                                narrative: "在真實世界中，你不可能「重來」一次供應鏈災難。但 DI 的 ChaosEngine 可以在模擬環境中製造各種麻煩。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chaos = 混亂。Chaos Engineering 的核心思想：主動製造混亂來發現弱點。"],
                            explanation: "ChaosEngine 模擬 5 種麻煩：(1) supplier_delay（供應商延遲，基礎機率 8%）、(2) port_strike（港口罷工，0.5%）、(3) quality_issue（品質問題，3%）、(4) demand_spike（需求暴增，2%）、(5) raw_material_shortage（原料短缺，1%）。每種事件有 4 個嚴重等級（low → critical），影響程度不同。目的是在下單前先「演練」一遍，看你的方案能不能扛住意外。",
                            frameworkTip: "Netflix 發明了 Chaos Monkey 來隨機關掉伺服器。DI 的 ChaosEngine 把同樣的思路用在供應鏈上。"
                        ),
                        Challenge(
                            id: 2,
                            name: "墨菲定律設定",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "ChaosEngine 的墨菲定律設定做了什麼？",
                            scenario: Challenge.Scenario(
                                title: "越危險的時候壞事機率越高",
                                narrative: "ChaosEngine 有一個「墨菲定律」設定。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["墨菲定律：如果壞事可能發生，它就一定會在最糟的時候發生"],
                            explanation: "墨菲定律設定的邏輯是：inventory / daily_demand < 7 天時，事件機率 × 1.5。白話講：當你的庫存已經很緊張的時候，壞事發生的機率會更高。這很符合現實 — 你最缺貨的時候偏偏供應商延遲了；你最忙的時候偏偏品質出問題。這個設定讓模擬更貼近真實世界的「不幸的巧合」。",
                            frameworkTip: "好的模擬要考慮「相關性」— 壞事不是獨立發生的，它們在最糟糕的時候更容易同時出現。"
                        ),
                    ]
                ),
                Quest(
                    id: "39-5",
                    name: "模擬場景與反饋",
                    description: "理解四種場景用途與 FeedbackLoop",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "四種場景用途",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個對場景用途的描述最正確？",
                            scenario: Challenge.Scenario(
                                title: "模擬場景選擇",
                                narrative: "ChaosEngine 有強度調節器（intensity multiplier），可以模擬不同壓力等級的場景。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["不同強度的測試回答不同問題：正常情況撐得住嗎？壓力大了呢？極端情況呢？"],
                            explanation: "強度乘數決定異常事件機率的倍率：calm=0.3x（幾乎沒事，拿來建立正常情況的基準線）、low=0.6x（輕微壓力）、medium=1.0x（標準壓力測試）、high=1.8x（嚴重壓力）、extreme=3.0x（災難等級）。就像地震模擬會測 3 級、5 級、7 級一樣，你要知道你的方案在不同壓力下的表現。",
                            frameworkTip: "壓力測試的最佳實踐：從正常 → 壓力 → 極端，逐步加壓，找到方案的「斷裂點」。"
                        ),
                        Challenge(
                            id: 2,
                            name: "FeedbackLoop 建議",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "fill_rate 92%（低於目標 95%）時，FeedbackLoop 最可能的建議是什麼？",
                            scenario: Challenge.Scenario(
                                title: "fill_rate 不達標",
                                narrative: "模擬結果出來了：fill_rate = 92%（目標 95%）。FeedbackLoop 會怎麼建議？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["fill_rate 不夠通常是因為庫存不夠，最直接的解法是增加安全庫存"],
                            explanation: "FeedbackLoop 的配置是：min_fill_rate_pct=95、safety_stock_uplift_pct=20、max_iterations=3。當 fill_rate < 95% 時，系統會建議把安全庫存上調 20%。為什麼是 20%？這是經驗值，太少沒效果，太多浪費資金。而且最多迭代 3 次（上調 → 再模擬 → 還不夠就再上調 → 最多三輪），防止無限調整。如果 3 輪後還不達標，就交給人類決策。",
                            frameworkTip: "自動調整要有上限（max_iterations=3）。無限循環的自動調整比不調整更危險。"
                        ),
                    ]
                ),
                Quest(
                    id: "39-6",
                    name: "談判策略設計（Boss）",
                    description: "綜合 CFR 和模擬知識設計談判策略",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "談判策略設計",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "完整談判情境",
                                narrative: "你拿到以下資訊：\n- risk_score = 45（Position Bucket = STRONG）\n- 供應商類型推測：60% 合作型、30% 激進型、10% 急售型\n- CFR 策略建議：第一輪「還價」、第二輪「讓步」、第三輪「接受」\n- 談判選項可用：Budget +10%、MOQ relax、Expedite\n- 模擬結果：current fill_rate = 91%（目標 95%）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["STRONG bucket 代表你有優勢，可以先強勢再讓步", "fill_rate 問題可以透過 Expedite 或 Safety stock 選項解決"],
                            explanation: "好的談判策略需要：(1) 知道自己的優勢在哪（STRONG bucket = 有替代供應商）(2) 有清晰的讓步順序（先讓低成本的）(3) 把業務問題（fill_rate）融入談判條件 (4) 永遠有 Plan B。",
                            frameworkTip: "談判框架：知己（bucket）→ 知彼（supplier type）→ 策略（CFR）→ 備案（fallback）。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 40,
            name: "閉環學習系統",
            emoji: "🔄",
            description: "理解 Drift Detection、Style Learning、閉環編排",
            quests: [
                Quest(
                    id: "40-1",
                    name: "模型退化原因",
                    description: "理解 Data Drift 與 Concept Drift",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Data Drift vs Concept Drift",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Data Drift 和 Concept Drift 的核心差別是什麼？",
                            scenario: Challenge.Scenario(
                                title: "兩種 drift",
                                narrative: "你的預測模型上個月準確率 95%，這個月掉到 80%。你需要判斷是哪種 drift。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想像你在預測冰淇淋銷量：Data Drift = 突然出現以前沒見過的高溫；Concept Drift = 高溫對銷量的影響變了"],
                            explanation: "Data Drift 是輸入的「長相」變了 — 以前訂單量在 100-500，現在突然出現 2,000+。模型沒見過這種數據，不知道怎麼預測。Concept Drift 是「規則」變了 — 以前「促銷 → 銷量漲 50%」，現在市場飽和了，「促銷 → 只漲 10%」。輸入一樣但結果的模式不同了。",
                            frameworkTip: "診斷 drift 的第一步：看 PSI（輸入分佈）。PSI 高 = Data Drift。PSI 正常但 MAPE 高 = 可能是 Concept Drift。"
                        ),
                        Challenge(
                            id: 2,
                            name: "哪個更難處理",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "為什麼 Concept Drift 通常比 Data Drift 更難處理？",
                            scenario: Challenge.Scenario(
                                title: "Drift 嚴重程度比較",
                                narrative: "面試官問你：「Data Drift 和 Concept Drift 哪個更難處理？為什麼？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Data Drift 用新數據重新訓練就好（數據反映新現實），但 Concept Drift 代表舊的模型假設本身就錯了"],
                            explanation: "Data Drift 的解法相對直接：用新數據重新訓練，讓模型「見識」新的分佈。但 Concept Drift 代表輸入-輸出之間的「規則」變了，可能需要：(1) 新增特徵來捕捉變化的原因、(2) 改模型架構、(3) 縮短訓練窗口只用最近的數據。重新訓練未必有用，因為問題不在數據量而在模型的假設。",
                            frameworkTip: "ML 除錯順序：Data Drift → 重新訓練。Concept Drift → 檢查特徵、檢查模型假設。"
                        ),
                    ]
                ),
                Quest(
                    id: "40-2",
                    name: "Drift Detection 三指標",
                    description: "理解 PSI、MAPE 變化、Coverage 的意義",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "PSI > 0.2 代表什麼",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "PSI（Population Stability Index）> 0.2 代表什麼？",
                            scenario: Challenge.Scenario(
                                title: "PSI 指標",
                                narrative: "DI 的 drift_monitor.py 設定 PSI 門檻為 0.2。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["PSI 比較的是「訓練時的數據長什麼樣」vs「現在的數據長什麼樣」"],
                            explanation: "PSI 是比較兩個分佈差異的指標。< 0.1 = 穩定（數據跟以前差不多）、0.1-0.2 = 有點偏移（要注意）、> 0.2 = 顯著偏移（觸發告警）。白話講就是體溫計 — PSI > 0.2 代表「數據發燒了」，跟模型訓練時看到的數據差太多。",
                            frameworkTip: "記住 PSI 三個門檻：< 0.1 正常、0.1-0.2 觀察、> 0.2 告警。"
                        ),
                        Challenge(
                            id: 2,
                            name: "情境診斷：MAPE 升但 PSI 正常",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "MAPE 上升但 PSI 正常，最可能的原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "矛盾的指標",
                                narrative: "監控儀表板顯示：MAPE 增加了 15%（門檻 10%），但 PSI = 0.08（正常）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["PSI 正常 = 輸入長得跟以前一樣。MAPE 高 = 預測變差了。輸入沒變但預測變差 → 什麼變了？"],
                            explanation: "這是 Concept Drift 的典型症狀。PSI 正常代表輸入數據的分佈沒變（訂單量、品類比例都跟以前差不多）。但 MAPE 飆升代表預測越來越不準。合起來看：同樣的輸入，模型給出的預測越來越偏 → 因為輸入和輸出之間的「規則」變了。比如以前「促銷 → 銷量漲 50%」現在只漲 10% — 輸入（促銷事件）沒變，但效果變了。",
                            frameworkTip: "指標交叉診斷：PSI 高 + MAPE 高 = Data Drift。PSI 正常 + MAPE 高 = Concept Drift。兩個都正常 = 模型健康。"
                        ),
                    ]
                ),
                Quest(
                    id: "40-3",
                    name: "重新訓練觸發",
                    description: "理解 Cooldown、四條規則、主動 vs 被動",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Cooldown 機制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "重訓 Cooldown（冷卻期 24 小時）的主要目的是什麼？",
                            scenario: Challenge.Scenario(
                                title: "為什麼不馬上重訓",
                                narrative: "Drift 偵測到了，但系統不會馬上重新訓練。有一個 24 小時的 Cooldown。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["如果每偵測到一點 drift 就重訓，一天可能訓練 10 次，每次結果都不一樣"],
                            explanation: "配置是 cooldown_hours=24、max_retrain_per_day=3。沒有 Cooldown 的話，一個波動可能觸發連續重訓：訓練中的數據本身又觸發 drift 偵測 → 又重訓 → 無限循環。Cooldown 確保每次重訓之間有足夠的「觀察期」來確認重訓有沒有改善。就像發燒不會每 5 分鐘吃一次退燒藥，你要等藥效發揮再看需不需要加藥。",
                            frameworkTip: "自動化系統的安全閥：Cooldown 防過度反應、Rate limit 防資源耗盡、Circuit breaker 防雪崩。"
                        ),
                        Challenge(
                            id: 2,
                            name: "被動規則",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以上四條規則中，哪一條的性質跟其他三條最不同？",
                            scenario: Challenge.Scenario(
                                title: "四條觸發規則",
                                narrative: "重訓有四條觸發規則：coverage 連續不達標、MAPE 退化 > 15%、residual drift > 0.6、data drift > 0.6。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["前面四條都是「發現問題才觸發」，但定期健檢是...？"],
                            explanation: "前面四條都是被動的 — 等到指標超標才觸發。定期健檢是主動的 — 不管指標好不好，每隔一段時間都會跑一次全面評估。為什麼需要？因為有些退化是漸進式的，每天只差一點點，每個指標都沒超標，但累積一個月後已經很嚴重了。定期健檢就是定期體檢 — 不是等到生病才看醫生。",
                            frameworkTip: "監控策略：主動（定期檢查）+ 被動（異常觸發）= 完整的監控覆蓋。"
                        ),
                    ]
                ),
                Quest(
                    id: "40-4",
                    name: "Style Learning",
                    description: "理解風格規則的信心機制與衝突處理",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "風格規則信心",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "風格規則的信心分數起始值是多少？需要達到多少才能升級為公司政策？",
                            scenario: Challenge.Scenario(
                                title: "學習主管的偏好",
                                narrative: "Style Learning 系統從主管的修改和回饋中學習報告偏好（如：表頭顏色、KPI 排列方式）。每個規則有一個信心分數。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["信心太低就套用 = 魯莽；信心太高才升級 = 效率低。要找平衡點。"],
                            explanation: "新規則從信心 0.40 開始（「看到了一次，不太確定」）。每次主管的行為與規則一致，信心就上升。到 0.75 以上時，系統會建議升級為公司政策，但需要主管明確確認（不是自動升級）。這個設計的邏輯是：自動化要循序漸進 — 先觀察、再建議、最後由人確認。",
                            frameworkTip: "自動化信任階梯：觀察 → 建議 → 半自動 → 全自動。每一步都需要更高的信心。"
                        ),
                        Challenge(
                            id: 2,
                            name: "信任指標與晉升",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "要從 A3 晉升到 A4（最高自主權），需要滿足哪些條件？",
                            scenario: Challenge.Scenario(
                                title: "自主權晉升",
                                narrative: "DI 的 AI Worker 有 4 個自主權等級（A1-A4），晉升需要滿足信任指標。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A4 是最高自主權，門檻自然最嚴：量（100 個任務）+ 質（85% 一次過關）+ 安全（違規 ≤ 2%）"],
                            explanation: "A4 晉升的四個門檻：(1) first_pass_rate ≥ 0.85（85% 的任務主管一次就通過，不用修改）、(2) min_tasks ≥ 100（做夠多才有統計意義）、(3) max_revision_rate ≤ 0.10（修改率不超過 10%）、(4) max_policy_violations ≤ 0.02（違規率不超過 2%）。這跟職場晉升一樣 — 不是做得久就升，是做得多、做得好、不犯錯才升。",
                            frameworkTip: "信任系統設計：量化指標 + 門檻值 + 最低樣本量 = 可靠的自動晉升機制。"
                        ),
                        Challenge(
                            id: 3,
                            name: "風格衝突處理",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "兩個主管的風格偏好衝突時，系統應該怎麼處理？",
                            scenario: Challenge.Scenario(
                                title: "兩個主管的風格不同",
                                narrative: "張主管喜歡報告用紅色表頭，李主管喜歡藍色表頭。兩人都在系統中留下了修改紀錄。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Style Learning 是 per-Worker 的，不是全公司共用的。除非...？"],
                            explanation: "風格規則是綁定在每個 Worker 上的（per-Worker scope）。張主管的 Worker 學紅色表頭，李主管的 Worker 學藍色表頭，互不干擾。只有當一個規則的信心到 0.75 以上且主管確認升級為「公司政策」時，它才會跨 Worker 通用。這樣設計的好處：個人偏好不會互相干擾，但真正重要的標準（如：KPI 必須包含 fill_rate）可以推廣到全公司。",
                            frameworkTip: "Scope 設計原則：個人偏好 = local scope。公司標準 = global scope。用信心門檻 + 人工確認控制升級。"
                        ),
                    ]
                ),
                Quest(
                    id: "40-5",
                    name: "閉環編排",
                    description: "理解三種執行模式的安全性差異",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "三種執行模式",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "三種模式中最安全的是哪一個？",
                            scenario: Challenge.Scenario(
                                title: "重訓執行模式",
                                narrative: "DI 的閉環編排系統有三種模式來執行重新訓練。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["dry_run = 演習。只看報告不動手。"],
                            explanation: "dry_run 最安全因為它完全不改變任何東西，只是「預演」一次重訓並報告結果（新模型的 MAPE 會是多少、訓練需要多少資源等）。approval_required 次之（有人把關）。auto_run 最激進（全自動）。實務上通常先用 dry_run 觀察幾週，確認判斷合理後再切到 approval_required，最後才考慮 auto_run。",
                            frameworkTip: "自動化上線三步驟：dry_run（觀察）→ approval_required（半自動）→ auto_run（全自動）。循序漸進。"
                        ),
                        Challenge(
                            id: 2,
                            name: "為什麼不直接 auto_run",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "不建議一開始就用 auto_run 的主要原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "全自動的風險",
                                narrative: "工程師建議：「反正 drift detection 都自動化了，重訓也直接自動跑不是更有效率嗎？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["自動化系統的第一個版本永遠有 bug。你要先跑 dry_run 來抓 bug。"],
                            explanation: "Drift detection 不是完美的 — 可能有誤判（false positive）。如果一開始就 auto_run：PSI 因為季節因素短暫上升 → 系統誤判為 drift → 自動重訓 → 新模型可能更差（因為數據還不夠穩定）。先用 dry_run 跑幾週，統計「它建議重訓的 10 次中，有幾次真的有必要？」如果準確率夠高再升級。",
                            frameworkTip: "先手動 → 再半自動 → 最後全自動。每一步升級前都要有足夠的觀察數據支撐。"
                        ),
                    ]
                ),
                Quest(
                    id: "40-6",
                    name: "模型退化診斷（Boss）",
                    description: "綜合判斷嚴重程度並排定處理順序",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "模型退化診斷",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "三個告警同時響起",
                                narrative: "監控儀表板同時顯示三個告警：\n- MAPE = 0.25（上月 0.12，門檻 mape_degradation_pct = 15%）\n- PSI = 0.35（門檻 0.2）\n- Coverage = 65%（門檻 coverage_min = 65%，剛好踩線）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["PSI 高 + MAPE 高 = Data Drift 為主。但 MAPE 漲幅（12% → 25%）遠超過單純 Data Drift 能解釋的程度，可能還有 Concept Drift", "Coverage 65% 剛好在底線，可能代表模型對某些新出現的品類完全沒有覆蓋"],
                            explanation: "這題考的是綜合判斷能力。三個指標一起看，比單獨看更有意義。PSI 0.35 + MAPE 0.25 = 明確的 Data Drift，但 MAPE 漲幅太大可能暗示還有 Concept Drift。",
                            frameworkTip: "診斷框架：嚴重程度 → 問題類型 → 處理順序 → 執行方式。像醫生看病：量體溫 → 判斷病因 → 治療方案 → 追蹤。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 41,
            name: "進階執行與智慧路由",
            emoji: "⚡",
            description: "理解 Ralph Loop、Model Routing、Signal Radar",
            quests: [
                Quest(
                    id: "41-1",
                    name: "Ralph Loop",
                    description: "理解自我修正的 AI 員工",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "跟單次 AI 呼叫的差異",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Ralph Loop 跟單次 AI 呼叫最關鍵的差異是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Ralph Loop vs 單次呼叫",
                                narrative: "一般的 AI 呼叫像叫外送：下單、等結果、接受。Ralph Loop 像辦公室裡的員工：做完一步、看結果、不夠好就自己修。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Loop = 循環。循環的意義在於「做完 → 評估 → 修正 → 再做」"],
                            explanation: "單次 AI 呼叫 = 一次機會，結果好壞都得接受。Ralph Loop = 多次機會：executeTick（推進一步）→ getTaskStatus（看結果）→ 不滿意就調整策略再來 → markComplete（滿意了才停）。就像寫報告：第一版寫完 → 自己檢查 → 發現數據有誤 → 修正 → 再檢查 → OK → 提交。",
                            frameworkTip: "AI 任務設計：簡單查詢 → 單次呼叫。複雜多步驟任務 → Loop with self-correction。"
                        ),
                        Challenge(
                            id: 2,
                            name: "三道安全繩",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個不是 Ralph Loop 的三道安全繩之一？",
                            scenario: Challenge.Scenario(
                                title: "防止無限循環",
                                narrative: "Ralph Loop 如果一直覺得「不夠好」會無限循環。所以有三道安全繩。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["三道安全繩是防止「失控」的，不是衡量「品質」的"],
                            explanation: "三道安全繩：(1) VITE_RALPH_MAX_ITERATIONS=30 — 跑 30 次還沒完成就強制停止，防止無限循環；(2) VITE_RALPH_MAX_COST=5.00 — 一個任務最多花 $5 的 AI 呼叫費用，防止帳單爆炸；(3) AbortController — 使用者或系統可以隨時拉停（abortRalphLoop(taskId) 停一個、abortAllRalphLoops() 停全部）。MAPE 門檻是 Release Gate 的東西，不是 Ralph Loop 的安全繩。",
                            frameworkTip: "安全設計三層：資源限制（次數/成本）→ 超時限制 → 人工中止。缺一不可。"
                        ),
                    ]
                ),
                Quest(
                    id: "41-2",
                    name: "Model Routing",
                    description: "理解 Tier A/B/C 的分工與成本考量",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Tier A/B/C 分工",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Tier A、B、C 各適合什麼任務？",
                            scenario: Challenge.Scenario(
                                title: "智慧模型路由",
                                narrative: "DI 不是每個任務都用最貴的 AI 模型。Model Router 會根據任務類型選擇合適的 tier。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["想像廚房：A=主廚（做關鍵菜色）、B=二廚（做專業料理）、C=助手（切菜備料）"],
                            explanation: "Tier A 是高推理型：planner（任務拆解）、executor（執行決策）、challenger（挑戰驗證）、judge（判斷品質）— 這些需要最強的推理能力。Tier B 是專家型：renderer（生成報告）等分析任務。Tier C 是低成本型：report、export、dashboard_summary — 只需要格式化和摘要，不需要深度思考。",
                            frameworkTip: "成本最佳化原則：不是用最好的，而是用最適合的。切蔬菜不需要主廚。"
                        ),
                        Challenge(
                            id: 2,
                            name: "為什麼不全用 Tier A",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "不全用 Tier A 的最主要原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "成本 vs 品質",
                                narrative: "有人建議：「反正 Tier A 最強，全部任務都用 Tier A 不就好了？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["模型價格差異可以到 10-50 倍。100 個摘要任務 × 50 倍價差 = 巨大的成本差異"],
                            explanation: "假設 Tier A 模型價格是 Tier C 的 20 倍。一個 Worker 每天跑 200 個任務，其中 160 個是格式化和摘要。全用 Tier A：160 × $0.10 = $16/天。用 Tier C：160 × $0.005 = $0.80/天。一個月差 $456。100 個 Worker 就是 $45,600 的差異。而且 Tier C 做摘要的品質跟 Tier A 差不多 — 這種任務不需要深度推理。",
                            frameworkTip: "系統設計的 80/20 法則：80% 的任務用 20% 的成本就能搞定。把預算留給真正需要的 20%。"
                        ),
                    ]
                ),
                Quest(
                    id: "41-3",
                    name: "Signal Radar",
                    description: "理解四種異常偵測與零成本設計",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "四種異常",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個不是 Signal Radar 偵測的四種異常之一？",
                            scenario: Challenge.Scenario(
                                title: "Signal Radar 異常偵測",
                                narrative: "Signal Radar 是 DI 的異常偵測引擎，能偵測四種異常。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Model Drift 是 Drift Monitor 的工作，不是 Signal Radar 的"],
                            explanation: "Signal Radar 的四種異常：(1) Metric Anomalies — 指標值偏離 2σ 或變化 > 30%；(2) Contradictions — 指標之間不合理（如營收漲但利潤跌、訂單漲但完成率跌）；(3) Concentration Risk — 前幾大佔比 ≥ 60%（≥80% 是 critical）；(4) Stale Insights — 分析報告超過 30 天沒更新。Model Drift 是 drift_monitor.py 負責的，不歸 Signal Radar 管。",
                            frameworkTip: "職責分離：Signal Radar 看「業務指標」異常，Drift Monitor 看「模型」異常。各司其職。"
                        ),
                        Challenge(
                            id: 2,
                            name: "為什麼零成本",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Signal Radar 為什麼是零 AI 成本？",
                            scenario: Challenge.Scenario(
                                title: "零 AI 成本",
                                narrative: "Signal Radar 號稱「零 AI 成本」，不需要呼叫任何 LLM。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["2σ 判斷、百分比計算、佔比統計 — 這些都是數學公式，不需要 AI"],
                            explanation: "Signal Radar 是純規則引擎：delta > 2σ？→ 異常。變化 > 30%？→ 異常。佔比 > 60%？→ 集中風險。更新時間 > 30 天？→ 過期。這些都是 if-else 判斷加基本統計，不需要呼叫 LLM。好處：(1) 零額外成本（2) 延遲極低（毫秒級）(3) 結果可解釋（不是黑箱）。",
                            frameworkTip: "不是所有問題都需要 AI。簡單的規則引擎往往更快、更便宜、更可解釋。"
                        ),
                    ]
                ),
                Quest(
                    id: "41-4",
                    name: "瀏覽器 vs 伺服器",
                    description: "理解兩種執行模式的差異",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "關掉瀏覽器會怎樣",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "瀏覽器模式和伺服器模式最關鍵的差異是什麼？",
                            scenario: Challenge.Scenario(
                                title: "執行模式差異",
                                narrative: "DI 有兩種執行模式：在瀏覽器中跑、在伺服器上跑。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["瀏覽器 = 本地。關掉 = 沒了。伺服器 = 遠端。你關電腦它還在跑。"],
                            explanation: "瀏覽器模式：任務跑在你的瀏覽器裡，關掉分頁或瀏覽器 = 任務終止。適合快速互動。伺服器模式：任務跑在遠端伺服器上，你關掉瀏覽器它繼續跑，下次打開還能看到結果。適合長時間運算。",
                            frameworkTip: "前端 vs 後端執行的取捨：前端 = 即時互動但依賴瀏覽器；後端 = 持久運行但需要額外基礎設施。"
                        ),
                        Challenge(
                            id: 2,
                            name: "taskWorker 並行限制",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "為什麼 solver 最多同時跑 3 個任務而不是 10 個？",
                            scenario: Challenge.Scenario(
                                title: "為什麼限制同時 3 個任務",
                                narrative: "DI 的 solver 最多同時跑 3 個任務（DI_SOLVER_MAX_CONCURRENT=3）。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["solver 是做最佳化計算，吃 CPU 和記憶體。同時太多 = 伺服器掛掉"],
                            explanation: "Solver 做的是最佳化計算（線性規劃、混整數規劃），每個任務可能處理上百萬行數據（DI_MAX_ROWS_PER_SHEET=2,000,000），最多跑 90 秒（DI_SOLVER_MAX_SECONDS=90）。一個任務可能吃掉幾 GB 記憶體和大量 CPU。同時跑 3 個已經很吃力了，再多伺服器會 OOM（記憶體不足）或者所有任務都變慢到超時。",
                            frameworkTip: "並行限制 = 保護系統穩定性。寧可讓任務排隊等，也不要讓系統全部掛掉。"
                        ),
                    ]
                ),
                Quest(
                    id: "41-5",
                    name: "DB Schema 與 RLS",
                    description: "理解多租戶資料隔離",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "RLS 的作用",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "RLS（Row-Level Security）的作用是什麼？",
                            scenario: Challenge.Scenario(
                                title: "Row-Level Security",
                                narrative: "DI 是多租戶（multi-tenant）架構，多家公司的資料存在同一個資料庫。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Row-Level = 行級別。Security = 安全。每一行都檢查：這行資料屬於你嗎？"],
                            explanation: "RLS 是 Supabase/PostgreSQL 的功能，讓資料庫自動幫你過濾。設定 RLS policy 後，不管你的 SQL 怎麼寫，資料庫都會自動加上 WHERE tenant_id = 當前使用者的 tenant_id。就像大樓的門禁卡 — 不管你走哪個門，系統都只讓你進你自己的樓層。",
                            frameworkTip: "多租戶資料隔離：應用層過濾（程式碼加 WHERE）是第一道防線，RLS 是最後一道。兩層防護。"
                        ),
                        Challenge(
                            id: 2,
                            name: "RLS 是最後防線",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "程式碼忘了加 tenant_id 過濾，資料會洩漏到其他租戶嗎？",
                            scenario: Challenge.Scenario(
                                title: "程式碼漏洞 vs RLS",
                                narrative: "一個新來的工程師寫了一段查詢，忘了加 tenant_id 過濾條件。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["RLS 的價值就在這裡 — 它是獨立於應用程式碼的安全層"],
                            explanation: "這就是 RLS 的核心價值：就算程式碼有 bug（忘了加 WHERE tenant_id = ?），資料庫的 RLS policy 會在底層自動過濾，確保你只能看到自己公司的資料。這就是「縱深防禦」（defense in depth）— 應用層的過濾是第一道門，RLS 是最後一道鐵門。工程師可能犯錯，但 RLS 不會忘記。",
                            frameworkTip: "安全設計原則：不要只靠一層防護。RLS = 即使所有程式碼的防護都失敗了，資料庫層面還是安全的。"
                        ),
                    ]
                ),
                Quest(
                    id: "41-6",
                    name: "整合情境題（Boss）",
                    description: "串連多個系統的因果關係",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "四個信號同時發生",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "同時四個告警",
                                narrative: "凌晨 3 點，監控系統同時發出四個告警：\n1. MAPE 從 0.12 飆升到 0.28\n2. PSI = 0.42（門檻 0.2）\n3. Signal Radar 偵測到「矛盾」：訂單量漲 40% 但完成率跌 15%\n4. Model Router 把 planner 從 Tier A 降級到 Tier B（因為 Tier A 模型 API 回應超時）",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先想：哪個信號可能是其他信號的原因？", "Model Router 降級意味著所有需要 Tier A 的關鍵任務（planner、executor）都在用次優模型", "Ralph Loop 用降級模型時，每次修正的品質都打折扣，可能在 30 次上限內都達不到滿意結果"],
                            explanation: "這題考的是系統思維 — 看到多個告警時不是逐一處理，而是找出因果鏈。",
                            frameworkTip: "多系統故障分析：先找 root cause → 再看連鎖反應 → 優先修 root cause → 同時止血最嚴重的症狀。"
                        ),
                    ]
                ),
            ]
        ),
    ]
}
