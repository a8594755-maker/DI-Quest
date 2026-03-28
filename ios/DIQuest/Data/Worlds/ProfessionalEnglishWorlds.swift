import Foundation

enum ProfessionalEnglishWorlds {
    static let worlds: [World] = [
        World(
            id: 48,
            name: "專案介紹英文",
            emoji: "🎤",
            description: "用英文介紹專案成果、技術架構與商業影響",
            quests: [
                Quest(
                    id: "48-1",
                    name: "Project Overview 句型",
                    description: "學會用精準的英文句型介紹專案目標、範圍與核心價值。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "描述專案目標",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個英文表達最精準且專業？",
                            scenario: Challenge.Scenario(
                                title: "新人報告第一天",
                                narrative: "你剛加入一間電商公司的 Data Team，主管請你在下週的 all-hands meeting 上用英文介紹你之前實習時做的推薦系統專案。你需要先講清楚這個專案的目標——提升首頁商品點擊率。\n\n你想說：「這個專案的目標是透過個人化推薦提升首頁商品的點擊率。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This project's target is to make homepage products get more clicks by personalized recommendation.", explanation: "「target」通常指具體數值目標（如 target: 20%），「make ... get more clicks」口語化且不精準，缺少量化感。"),
                                Challenge.Option(id: "B", text: "The goal of this project is to improve homepage click-through rate through personalized recommendations.", explanation: "正確！「The goal of this project is to...」是標準專案介紹開場句型，「click-through rate」是正確的指標術語，「through」連接方法與目標很自然。"),
                                Challenge.Option(id: "C", text: "We want to use personalized recommendation to let users click more on homepage.", explanation: "「We want to」太口語，「let users click more」不夠專業，缺乏指標名稱。"),
                                Challenge.Option(id: "D", text: "The purpose of this project is increasing the click rate of homepage by using personalized recommendations.", explanation: "「purpose」較適合描述存在意義而非工作目標，「increasing」應改為 to increase（不定式），「click rate」不如 click-through rate 精準。"),
                            ],
                            correctAnswer: "B",
                            hints: ["介紹專案目標最常見的開頭句型是 \"The goal of this project is to...\"", "點擊率的標準英文術語是 click-through rate (CTR)，不是 click rate。"],
                            explanation: "專案介紹的開場要素：目標 + 方法 + 指標。「The goal of this project is to [動詞] [指標] through [方法]」是萬用句型。注意使用正確的業界術語（click-through rate 而非 click rate），這是展現專業度的關鍵。",
                            frameworkTip: "專案目標公式：The goal of this project is to [improve/reduce/build] + [metric/system] + through [method]"
                        ),
                        Challenge(
                            id: 2,
                            name: "描述專案範圍",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個英文表達最自然且完整？",
                            scenario: Challenge.Scenario(
                                title: "釐清專案邊界",
                                narrative: "主管聽完你的專案目標後問：「So what exactly did you build?」你需要說明這個推薦系統的核心功能——你們開發了一套基於用戶行為的即時推薦引擎，整合進現有的電商平台。\n\n你想說：「我們開發了一個即時推薦引擎，根據用戶的瀏覽和購買行為，提供個人化的商品推薦。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "We developed a real-time recommendation engine that delivers personalized product suggestions based on users' browsing and purchase behavior.", explanation: "正確！「developed」精準描述開發工作，「that delivers」用關係子句清楚說明功能，「based on」連接數據來源，整體結構完整流暢。"),
                                Challenge.Option(id: "B", text: "We made a recommendation system which can give users personalized products by their behavior.", explanation: "「made」太口語（應用 developed/built），「which can give」囉嗦，「by their behavior」太模糊，沒有具體說明是什麼行為數據。"),
                                Challenge.Option(id: "C", text: "We built a system for recommending products to users in real-time, the system uses browsing and purchase data.", explanation: "逗號接句（comma splice）是文法錯誤，應該用句號或分號。另外 「for recommending」不如 「that recommends」簡潔。"),
                                Challenge.Option(id: "D", text: "Our project is a real-time engine to recommend products, it is based on user browsing and purchase behavior.", explanation: "同樣有 comma splice 問題。「Our project is a... engine」結構不自然，「to recommend」不如 「that recommends」專業。"),
                            ],
                            correctAnswer: "A",
                            hints: ["描述「我們做了什麼」時，用 \"We developed/built + [noun] + that [verb]\" 是最清楚的結構。", "注意英文的 comma splice 問題——兩個完整句子不能只用逗號連接。"],
                            explanation: "描述專案交付物時，用 \"We developed/built [thing] that [does what]\" 的結構最清楚。「that」引導的關係子句可以緊接著說明功能，「based on」則連接數據來源。避免用 made（太口語）和 comma splice（文法錯誤）。",
                            frameworkTip: "交付物描述公式：We developed/built [a system/tool/model] that [verb: delivers/automates/predicts] + [what] + based on [data source]"
                        ),
                        Challenge(
                            id: 3,
                            name: "總結專案價值",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個英文表達最能為專案介紹畫下有力的句點？",
                            scenario: Challenge.Scenario(
                                title: "收尾要有力",
                                narrative: "你介紹完專案的目標和功能後，需要一句話總結這個專案的商業價值。你的推薦系統上線後，首頁點擊率提升了 35%，帶動整體營收增加 12%。\n\n你想說：「總結來說，這個專案為公司帶來了可衡量的商業價值，包括點擊率提升 35% 和營收增長 12%。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "In conclusion, this project brought measurable value, the CTR increased 35% and revenue grew 12%.", explanation: "Comma splice 錯誤，且「brought measurable value」後面直接列數字有些突兀。"),
                                Challenge.Option(id: "B", text: "Finally, our project is very successful because CTR went up 35% and revenue went up 12%.", explanation: "「very successful」太主觀且口語，「went up」不夠精準，專業場合應用 increased/improved。"),
                                Challenge.Option(id: "C", text: "Overall, this project delivered measurable business impact, including a 35% increase in CTR and a 12% lift in revenue.", explanation: "正確！「Overall」適合總結，「delivered measurable business impact」專業有力，「including」自然帶出具體數據，「a 35% increase in」和「a 12% lift in」是標準的數據描述格式。"),
                                Challenge.Option(id: "D", text: "As a result, we successfully improved CTR by 35% and also made revenue increase by 12%.", explanation: "「As a result」適合描述因果，不適合用來總結。「made revenue increase」不自然，應直接說 increased revenue 或 drove a 12% lift in revenue。"),
                            ],
                            correctAnswer: "C",
                            hints: ["總結專案價值時，用 \"Overall\" 或 \"In summary\" 開頭比 \"Finally\" 更專業。", "描述數據成果時，「a X% increase in [metric]」是標準格式。"],
                            explanation: "專案總結要做到三件事：（1）用過渡詞收尾（Overall/In summary），（2）概括影響層級（measurable business impact），（3）用數據佐證（a X% increase in...）。「lift」和「increase」都是描述指標提升的專業用詞。",
                            frameworkTip: "總結公式：Overall, this project delivered [impact level] + including [a X% increase/reduction in metric] and [another metric result]"
                        ),
                    ]
                ),
                Quest(
                    id: "48-2",
                    name: "技術架構描述",
                    description: "學會用英文清楚說明系統的技術架構、工具選擇與設計決策。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "描述整體架構",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文表達最能清楚傳達架構全貌？",
                            scenario: Challenge.Scenario(
                                title: "架構圖講解",
                                narrative: "你在面試一間 FinTech 公司的 Data Engineer 職位，面試官看完你的履歷後問：「Can you walk me through the architecture of your data pipeline project?」\n\n你的專案是一個即時數據管線，由三個主要元件組成：Kafka 做 event streaming、Spark 做 data processing、PostgreSQL 做 data storage。\n\n你想說：「這個架構由三個核心元件組成：Kafka 負責事件串流、Spark 負責資料處理、PostgreSQL 負責資料儲存。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The architecture has three parts. We use Kafka, Spark, and PostgreSQL.", explanation: "太簡略，沒有說明每個元件的角色。面試官會追問 \"What does each one do?\""),
                                Challenge.Option(id: "B", text: "The architecture consists of three core components: Kafka for event streaming, Spark for data processing, and PostgreSQL for data storage.", explanation: "正確！「consists of」是描述架構組成的標準用法，冒號後用 「X for Y」 的平行結構清楚列出每個元件和職責，簡潔有力。"),
                                Challenge.Option(id: "C", text: "Our architecture is composed by three core components, which are Kafka that does event streaming, Spark that does data processing, and PostgreSQL that does data storage.", explanation: "「is composed by」文法錯誤（應為 is composed of 或 consists of），「that does」重複三次顯得冗贅，不如用 for 簡潔。"),
                                Challenge.Option(id: "D", text: "In our architecture, there are Kafka, Spark, and PostgreSQL. Kafka is for event streaming. Spark is for data processing. PostgreSQL is for data storage.", explanation: "文法正確但太碎片化，四句短句聽起來像在念清單而非介紹架構。專業場合應該用一句話帶出完整結構。"),
                            ],
                            correctAnswer: "B",
                            hints: ["「由...組成」的標準英文是 consists of，不是 composed by。", "列出元件時，用「X for Y」的平行結構最簡潔有力。"],
                            explanation: "描述架構時，用 \"consists of\" 帶出組成元件，再用 \"X for Y\" 的平行結構一次列完。這種結構讓聽眾快速建立心理模型。注意「is composed of」也正確但較書面，「is composed by」則是常見錯誤。",
                            frameworkTip: "架構描述公式：The architecture consists of [N] core components: [X] for [role], [Y] for [role], and [Z] for [role]"
                        ),
                        Challenge(
                            id: 2,
                            name: "解釋技術選擇",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回答最能展現技術決策的專業思維？",
                            scenario: Challenge.Scenario(
                                title: "為什麼選 Kafka？",
                                narrative: "面試官接著問：「Why did you choose Kafka over other messaging systems?」\n\n你選 Kafka 的原因是：它能處理高吞吐量的即時事件，而且公司已經有 Kafka 的基礎設施和團隊經驗。\n\n你想說：「我們選擇 Kafka 是因為它能夠處理大量即時事件，而且我們團隊已經有使用 Kafka 的經驗和現有基礎設施。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "We chose Kafka because it is very popular and many companies use it for streaming.", explanation: "「because it is popular」不是技術決策理由。面試官想聽的是你根據需求做的理性判斷，不是從眾心理。"),
                                Challenge.Option(id: "B", text: "We leveraged Kafka for its high-throughput event processing capabilities, and it aligned well with our existing infrastructure and team expertise.", explanation: "正確！「leveraged」表示善用工具特性，「high-throughput event processing capabilities」點出技術優勢，「aligned with existing infrastructure and team expertise」展現務實的工程思維——不只看技術，也考慮團隊現況。"),
                                Challenge.Option(id: "C", text: "Kafka was selected because it can handle lots of data quickly and our team already knows how to use it.", explanation: "被動語態「was selected」略顯生硬，「lots of data quickly」太口語，「knows how to use it」不如 team expertise 精準。整體表達像日常對話而非技術討論。"),
                                Challenge.Option(id: "D", text: "The reason we used Kafka is that Kafka has good performance for streaming and we have Kafka infrastructure already.", explanation: "「The reason... is that...」結構冗長，三次重複 Kafka 聽感差，「good performance」太籠統，沒有點出具體優勢。"),
                            ],
                            correctAnswer: "B",
                            hints: ["「leveraged」在技術脈絡中表示「善用某工具的特性」，比 used 或 chose 更專業。", "技術選擇的理由通常包含兩面：技術能力（capability）和團隊/組織適配（alignment）。"],
                            explanation: "解釋技術選擇時，最佳結構是：（1）用 leveraged 或 adopted 表示主動選用，（2）點出具體技術優勢（如 high-throughput），（3）加上組織層面的考量（infrastructure、team expertise）。這展現了你不只懂技術，更懂工程決策。",
                            frameworkTip: "技術選擇公式：We leveraged [tool] for its [specific capability], and it aligned well with [team/org context]"
                        ),
                        Challenge(
                            id: 3,
                            name: "描述系統運作流程",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個描述最清楚地傳達了 data flow？",
                            scenario: Challenge.Scenario(
                                title: "資料怎麼流動的？",
                                narrative: "面試官對你的架構很感興趣，追問：「Can you describe how data flows through the system?」\n\n你的管線流程是：用戶行為事件從 app 發送到 Kafka，Spark 消費 Kafka 的事件並進行即時運算，結果寫入 PostgreSQL，最後 API 從 PostgreSQL 讀取資料回傳給前端。\n\n你想說：「用戶事件先送到 Kafka，然後 Spark 消費這些事件進行即時處理，處理完的結果存到 PostgreSQL，最後由 API 讀取並回傳給前端。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "First, user events go to Kafka. Then Spark eats Kafka events and does processing. After that, results are saved to PostgreSQL. Finally, API reads data and sends to frontend.", explanation: "「eats」是嚴重錯誤——Kafka 的術語是 consume，不是 eat。「does processing」太模糊，「sends to frontend」缺少介系詞 back。"),
                                Challenge.Option(id: "B", text: "The system is built on a streaming pipeline where user events are ingested into Kafka, consumed and processed in real-time by Spark, persisted to PostgreSQL, and served to the frontend via a REST API.", explanation: "正確！「is built on a streaming pipeline where」設定了大框架，接著用四個被動動詞（ingested → consumed → persisted → served）構成流暢的流程敘述。每個動詞都是該領域的精準術語。"),
                                Challenge.Option(id: "C", text: "Data flows from Kafka to Spark to PostgreSQL to API. Kafka receives events, Spark processes them, PostgreSQL stores them, and API serves them.", explanation: "結構清楚但兩句話在重複同樣的資訊。第一句列了順序，第二句又重述了每個元件的職責，顯得冗餘。"),
                                Challenge.Option(id: "D", text: "User behavior events will be sent to Kafka first, and then Spark will consume and process the events, then store the results into PostgreSQL, and finally the API will serve the data to the frontend.", explanation: "用 will 表示未來式不恰當（系統已經在運作），應該用現在式或被動式。另外整句太長，缺乏節奏感。"),
                            ],
                            correctAnswer: "B",
                            hints: ["Data pipeline 的標準動詞：ingest（攝入）→ consume（消費）→ process（處理）→ persist（持久化）→ serve（提供服務）。", "描述已在運行的系統時，用現在式或被動式，不要用 will。"],
                            explanation: "描述 data flow 時，用「where + 一連串被動動詞」可以在一句話內完整呈現流程。關鍵是使用正確的領域術語：ingest（資料攝入）、consume（從 queue 消費）、persist（持久化儲存）、serve（對外提供服務）。這些動詞是業界通用語言。",
                            frameworkTip: "Data flow 描述公式：The system is built on [pipeline type] where [data] is ingested into [A], processed by [B], persisted to [C], and served via [D]"
                        ),
                    ]
                ),
                Quest(
                    id: "48-3",
                    name: "數據與成果描述",
                    description: "學會用英文精準描述量化成果、數據變化和業務影響。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "描述指標改善",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文表達最精準地呈現了這些數據成果？",
                            scenario: Challenge.Scenario(
                                title: "報告上線成果",
                                narrative: "你負責的 A/B testing 平台優化專案上線後，有幾個關鍵成果：實驗啟動時間從平均 3 天縮短到 4 小時，同時進行的實驗數量從 5 個提升到 20 個。你要在 quarterly review 上報告這些成果。\n\n你想說：「這個優化讓實驗啟動時間縮短了 95%，從 3 天降到 4 小時，也讓同時運行的實驗數量增加了四倍。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This optimization resulted in a 95% reduction in experiment launch time — from 3 days to just 4 hours — and enabled a 4x increase in concurrent experiments.", explanation: "正確！「resulted in」明確表示因果關係，「a 95% reduction in」是標準的指標變化格式，破折號補充具體數字增加說服力，「enabled a 4x increase」展現不只是數字變化，更是能力的提升。"),
                                Challenge.Option(id: "B", text: "After our optimization, the experiment launch time decreased from 3 days to 4 hours (95% less), and we can now run 20 experiments at the same time instead of 5.", explanation: "文法正確但不夠精煉。「95% less」不如「a 95% reduction」專業，「we can now run 20 instead of 5」太口語，缺乏 \"4x increase\" 的衝擊力。"),
                                Challenge.Option(id: "C", text: "The experiment launch time was greatly reduced and we significantly increased the number of concurrent experiments.", explanation: "「greatly」和「significantly」是最常見的偷懶用詞——沒有具體數字，聽眾無法判斷影響大小。數據報告一定要有數字。"),
                                Challenge.Option(id: "D", text: "We improved the launch time by 95% which is from 3 days to 4 hours, and also the concurrent experiments were increased 4 times.", explanation: "「improved by 95%」模糊（improved 可以是增加也可以是減少），「which is from」連接不自然，「increased 4 times」應為 increased 4x 或 quadrupled。"),
                            ],
                            correctAnswer: "A",
                            hints: ["描述指標變化時，「a X% reduction/increase in [metric]」比「reduced/increased by X%」更正式。", "用破折號（em dash）補充具體數字是常見的簡報技巧。"],
                            explanation: "數據成果描述的黃金結構：（1）因果連接詞（resulted in/led to），（2）百分比變化（a X% reduction in），（3）具體數字佐證（from A to B），（4）倍數表達（4x increase）。避免用 greatly/significantly 這類空泛的形容詞。",
                            frameworkTip: "成果描述公式：This [action] resulted in a [X%] [reduction/increase] in [metric] — from [before] to [after]"
                        ),
                        Challenge(
                            id: 2,
                            name: "列舉關鍵指標",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文表達能最有效地同時呈現多個指標？",
                            scenario: Challenge.Scenario(
                                title: "指標全覽",
                                narrative: "你在做 product review 簡報，需要同時呈現多個關鍵指標的變化。你的 CRM 優化專案影響了三個面向：客戶回應時間、客戶滿意度、每月處理案件數。\n\n你想說：「關鍵指標包括：回應時間減少 40%、客戶滿意度提升到 4.5 分（滿分 5 分）、以及每月處理案件數增加到 1,200 件。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Key metrics include a 40% reduction in response time, a customer satisfaction score of 4.5 out of 5, and a monthly case volume of 1,200.", explanation: "正確！「Key metrics include」是列舉指標的標準開頭，三個名詞片語用逗號和 and 平行排列，每個指標都自帶數字和單位，格式統一且專業。"),
                                Challenge.Option(id: "B", text: "The key metrics are: response time was reduced by 40%, customer satisfaction improved to 4.5/5, and monthly cases increased to 1,200.", explanation: "動詞時態混用（are 現在式 + was reduced 過去式），且冒號後接完整句子在文法上略顯笨拙。建議統一用名詞片語。"),
                                Challenge.Option(id: "C", text: "We have three key results. First, response time decreased 40%. Second, satisfaction score is 4.5. Third, we handle 1,200 cases monthly.", explanation: "「First, Second, Third」結構在口語可接受，但書面和簡報場合顯得冗長。三句短句不如一句平行列舉有力。"),
                                Challenge.Option(id: "D", text: "Our key metrics showed that response time reduced 40%, CSAT reached 4.5 out of 5, and monthly case volume grew to 1,200.", explanation: "「showed that」後面接的是結果而非指標本身，邏輯上不太通。「response time reduced」缺少 was（應為 was reduced 或用名詞 a 40% reduction）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["同時列舉多個指標時，用「Key metrics include + 名詞片語, 名詞片語, and 名詞片語」最整齊。", "用名詞片語（a 40% reduction）比動詞句（was reduced by 40%）更適合列舉。"],
                            explanation: "列舉指標的最佳做法是用名詞片語的平行結構：「Key metrics include [noun phrase], [noun phrase], and [noun phrase]」。名詞片語比完整句子更簡潔，也更容易對應到簡報上的 bullet points。",
                            frameworkTip: "指標列舉公式：Key metrics include [a X% change in metric A], [metric B of value], and [metric C of value]"
                        ),
                        Challenge(
                            id: 3,
                            name: "描述因果與貢獻",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文表達最能展現你的專案與團隊目標之間的因果關係？",
                            scenario: Challenge.Scenario(
                                title: "你的專案貢獻了什麼？",
                                narrative: "年終績效面談，主管問你：「How did your project contribute to the team's OKR?」\n\n你的搜尋功能優化專案讓站內搜尋轉換率提升了 25%，這直接幫助團隊達成了 Q3 的「提升用戶購買體驗」的 OKR。\n\n你想說：「我的搜尋功能優化直接促成了搜尋轉換率 25% 的提升，這讓我們的團隊 OKR『提升用戶購買體驗』順利達標。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "My search optimization project made a 25% increase in search conversion rate, so our team OKR was achieved.", explanation: "「made a 25% increase」文法不自然（make 不搭配 increase 名詞），「so」太口語，因果關係不夠精確。"),
                                Challenge.Option(id: "B", text: "The search optimization directly drove a 25% improvement in search conversion rate, which contributed to achieving our team's Q3 OKR of enhancing the purchase experience.", explanation: "正確！「directly drove」展現明確因果，「a 25% improvement in」是標準格式，「which contributed to achieving」用關係子句自然連接到團隊目標，「OKR of [objective]」清楚標示目標內容。"),
                                Challenge.Option(id: "C", text: "Because of my search optimization, the search conversion rate increased 25% and it helped our team to achieve the Q3 OKR.", explanation: "「Because of」放開頭讓句子結構散亂，「it helped to achieve」比 contributed to achieving 弱，整體缺乏專業感。"),
                                Challenge.Option(id: "D", text: "I improved search conversion rate by 25% through the search optimization project, leading to the success of our team OKR in Q3.", explanation: "「I improved」有搶功勞的語氣（團隊專案通常不用 I），「leading to the success of our team OKR」不自然——OKR 是被達成（achieved），不是成功。"),
                            ],
                            correctAnswer: "B",
                            hints: ["表達因果關係時，「drove」比「made」或「caused」更適合商業脈絡。", "用 \"which contributed to\" 的關係子句來連接個人貢獻和團隊目標。"],
                            explanation: "描述貢獻要建立清晰的因果鏈：[你的行動] → drove [直接成果] → which contributed to [大目標]。「drove」是商業場合最常用的因果動詞，比 made/caused 更精準。注意用 \"contributed to\" 而非直接說 \"achieved the OKR\"，展現團隊協作意識。",
                            frameworkTip: "貢獻描述公式：[Project/Action] directly drove [a X% improvement in metric], which contributed to [team/company goal]"
                        ),
                    ]
                ),
                Quest(
                    id: "48-4",
                    name: "挑戰與 Trade-off",
                    description: "學會用英文描述專案中遇到的挑戰、如何做取捨，以及從中學到的教訓。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "描述技術挑戰",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回答最能展現你面對挑戰的能力？",
                            scenario: Challenge.Scenario(
                                title: "面試追問",
                                narrative: "面試到了深水區，面試官問：「What was the most challenging part of this project?」\n\n你最大的挑戰是處理即時資料的延遲問題——原本系統的 latency 高達 5 秒，用戶幾乎感覺不到推薦是即時的。你花了兩週重構 data pipeline 才把延遲壓到 200 毫秒以內。\n\n你想說：「最大的挑戰是解決即時推薦的延遲問題。原本系統的延遲高達 5 秒，我們花了兩週重構管線，最終把延遲降到 200 毫秒以內。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The main challenge was reducing real-time recommendation latency. The system initially had a 5-second delay, which effectively negated the \"real-time\" experience. We re-architected the data pipeline over two weeks and brought latency down to under 200 milliseconds.", explanation: "正確！「The main challenge was [V-ing]」是回答挑戰問題的標準開頭，「negated the real-time experience」解釋了為什麼這是個問題，「re-architected」展現深度工程能力，最後用具體數字（5s → 200ms）證明解決成效。"),
                                Challenge.Option(id: "B", text: "The hardest thing was that the system was very slow, about 5 seconds. We spent two weeks fixing it and made it 200 milliseconds.", explanation: "「The hardest thing」太口語，「very slow」沒有說明是什麼慢（latency? throughput?），「fixing it」太模糊——你做了什麼才修好的？面試官要聽的是具體行動。"),
                                Challenge.Option(id: "C", text: "We faced a significant challenge regarding real-time latency issues in the recommendation system. The latency was 5 seconds. After 2 weeks of work, we reduced it to 200 milliseconds.", explanation: "「We faced a significant challenge regarding」太冗長（6 個字才到重點），三句短句缺乏連貫性。"),
                                Challenge.Option(id: "D", text: "Real-time latency was our biggest challenge. Because the delay was 5 seconds, users cannot feel it is real-time. So we re-architected the pipeline and finally the latency became 200 milliseconds.", explanation: "「users cannot feel」應為 couldn't（過去式），「So we...」口語化，「became 200 milliseconds」不自然（latency 應該用 dropped to 或 came down to）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["回答「最大挑戰」時，結構是：挑戰是什麼 → 為什麼是個問題 → 你怎麼解決 → 結果。", "「re-architected」比 \"fixed\" 更能展現工程深度。"],
                            explanation: "面試中回答挑戰問題的四步結構：（1）點出挑戰（The main challenge was...），（2）解釋影響（which effectively...），（3）描述行動（We re-architected...），（4）量化結果（brought latency down to...）。這個結構讓面試官看到你的問題分析能力和解決問題的深度。",
                            frameworkTip: "挑戰回答公式：The main challenge was [V-ing]. [Context/impact]. We [specific action] and [quantified result]."
                        ),
                        Challenge(
                            id: 2,
                            name: "說明取捨決策",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文表達最能清楚呈現 trade-off 的分析過程？",
                            scenario: Challenge.Scenario(
                                title: "設計取捨",
                                narrative: "面試官又問：「Were there any trade-offs you had to make?」\n\n你在做推薦系統時面臨一個取捨：用更複雜的深度學習模型可以提升推薦精準度 5%，但會讓推論延遲增加 3 倍。你們最後選擇了較簡單的模型，優先保證低延遲。\n\n你想說：「最主要的取捨是推薦精準度和系統延遲之間。更複雜的模型可以提升 5% 精準度，但會讓延遲增加三倍。我們最終優先選擇低延遲，因為用戶體驗更重要。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The key trade-off was between recommendation accuracy and system latency. A more complex model would have improved accuracy by 5%, but at the cost of tripling inference latency. We prioritized low latency, as user experience was the primary concern.", explanation: "正確！「The key trade-off was between A and B」清楚框定取捨的兩端，「would have improved... but at the cost of」用假設語氣呈現未選方案的代價，「We prioritized X, as Y was the primary concern」說明決策邏輯。完整展現了分析思維。"),
                                Challenge.Option(id: "B", text: "We had to choose between a better model and a faster system. The better model gives 5% more accuracy but makes the system 3 times slower. We chose the faster one because users care more about speed.", explanation: "文法正確但太簡化。「better model」「faster system」這些措辭不精準，「gives 5% more accuracy」的 gives 也太口語，缺乏技術決策的嚴謹感。"),
                                Challenge.Option(id: "C", text: "There was a trade-off between accuracy and latency. We decided not to use the complex model because although it improved accuracy by 5%, the latency would increase 3 times, which is not acceptable.", explanation: "「which is not acceptable」太絕對。其實那個方案「可以被接受」，只是在你的判斷中延遲更重要。Trade-off 的本質是兩邊都有價值，而非一邊不可接受。"),
                                Challenge.Option(id: "D", text: "The trade-off is accuracy versus latency. Complex model can improve 5% accuracy but triple latency. So we chose simple model for low latency since UX is more important.", explanation: "缺少冠詞（the complex model, the simple model），句子過於電報式。「So we chose」口語化，「since UX is more important」沒有說明比什麼更重要。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Trade-off 的標準句型是 \"The trade-off was between A and B\"。", "描述「沒有選的方案」時，用「would have + 過去分詞」的假設語氣。"],
                            explanation: "描述 trade-off 的專業結構：（1）框定兩端（between A and B），（2）量化代價（would have improved X, but at the cost of Y），（3）說明決策依據（We prioritized X, as Y was the primary concern）。「at the cost of」是表達代價的精準用語，「as」引導原因比「because」更書面。",
                            frameworkTip: "Trade-off 公式：The key trade-off was between [A] and [B]. [Option] would have [benefit], but at the cost of [downside]. We prioritized [choice], as [reasoning]."
                        ),
                        Challenge(
                            id: 3,
                            name: "反思與學習",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回答最能展現成長型思維？",
                            scenario: Challenge.Scenario(
                                title: "如果重來一次",
                                narrative: "面試最後，面試官問了經典問題：「If you could do this project again, what would you do differently?」\n\n你回想這個專案，覺得最大的教訓是太晚做 load testing。你們在上線前一週才跑壓力測試，結果發現系統在高流量下會 crash，緊急修了三天。如果一開始就做，就不用這麼趕。\n\n你想說：「如果重來，我會更早導入壓力測試。我們太晚才發現系統在高流量下的問題，導致上線前緊急修復。我學到的教訓是，測試策略應該從開發初期就規劃好。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "If I were to do it again, I would incorporate load testing much earlier in the development cycle. We discovered performance issues under high traffic only a week before launch, which led to a last-minute scramble. The key takeaway is that testing strategy should be planned from the outset, not treated as an afterthought.", explanation: "正確！「If I were to do it again」是假設語氣的正確用法，「incorporate... earlier」具體且有建設性，「last-minute scramble」生動描述了後果，「key takeaway」轉化為可重複使用的教訓。結構完整且展現反思能力。"),
                                Challenge.Option(id: "B", text: "I would do load testing earlier. We found the system crashed under heavy traffic one week before launch, and we had to fix it urgently for 3 days.", explanation: "內容正確但太短。面試官問 \"what would you do differently\" 時，希望聽到的不只是「做什麼」，還有「為什麼」和「學到什麼」。"),
                                Challenge.Option(id: "C", text: "The biggest mistake was that we didn't do load testing early enough. This caused the system to crash before launch and we had to work overtime to fix it. Next time I will definitely do testing from the beginning.", explanation: "「biggest mistake」太自我批判，「work overtime to fix」偏離重點（時間管理而非技術決策），「Next time I will definitely」太口語。面試中分享學習點時，要正面且建設性。"),
                                Challenge.Option(id: "D", text: "Looking back, I think we should have done load testing earlier in the project. Because we only tested one week before launch, we found performance problems and had to fix them quickly. I learned that testing is very important.", explanation: "「I think we should have」語氣猶豫，「testing is very important」是空泛的結論，沒有具體的行動方案。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「If I were to do it again, I would...」是回答假設問題的標準句型。", "反思的結尾用 \"The key takeaway is that...\" 把經驗轉化為通用教訓。"],
                            explanation: "面試中談失誤和反思的三步結構：（1）明確說你會改變什麼（I would incorporate X earlier），（2）描述當時發生的後果（which led to...），（3）提煉通用教訓（The key takeaway is...）。注意用正面語言（incorporate earlier）而非負面語言（the mistake was），展現成長型思維。",
                            frameworkTip: "反思公式：If I were to do it again, I would [specific change]. [What happened]. The key takeaway is that [generalizable lesson]."
                        ),
                    ]
                ),
                Quest(
                    id: "48-5",
                    name: "Boss: 完整專案英文簡報",
                    description: "整合所有學到的句型，完成一份完整的英文專案介紹。",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "完整專案英文簡報",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文寫一份 200-300 字的專案簡報，涵蓋以下四個段落：\n\n1. **Project Overview**：用 \"The goal of this project is to...\" 開頭，說明專案目標和範圍\n2. **Technical Approach**：用 \"The architecture consists of...\" 描述你的技術方案\n3. **Results & Impact**：用 \"This resulted in...\" 呈現量化成果\n4. **Challenges & Learnings**：用 \"The main challenge was...\" 分享挑戰和學到的教訓\n\n你可以選擇自己做過的專案，或虛構一個合理的 data/product 專案。重點是句型的正確運用和整體的流暢度。",
                            scenario: Challenge.Scenario(
                                title: "面試壓軸關",
                                narrative: "你正在面試一間頂尖科技公司的 Product Analyst 職位。面試官說：\n\n「You have 3 minutes. Please walk me through your most impactful project — the problem, your approach, the results, and what you learned.」\n\n這是你展現所有英文表達能力的時刻。請用你在這個 World 學到的所有句型，完成一份完整的專案簡報。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["按照四個段落的順序寫，每個段落 2-3 句話即可。"],
                            explanation: "一份好的英文專案簡報要做到：開頭快速定位問題和目標、中間展現技術深度和量化成果、結尾用挑戰和反思展現成長型思維。注意使用本 World 學到的所有句型公式，並確保段落之間有邏輯過渡。",
                            frameworkTip: "完整專案簡報框架：Goal → Approach/Architecture → Results/Impact → Challenge/Learning。每個段落 2-3 句，整體控制在 3 分鐘口述時間。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 49,
            name: "面試英文",
            emoji: "💼",
            description: "掌握英文面試的關鍵句型，從自我介紹到提問環節",
            quests: [
                Quest(
                    id: "49-1",
                    name: "Self Introduction",
                    description: "學會用英文做出簡潔有力的自我介紹，讓面試官快速了解你的背景和亮點。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "開場：現在的身份",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個開場最簡潔有力？",
                            scenario: Challenge.Scenario(
                                title: "面試第一句話",
                                narrative: "你正在面試一間外商科技公司的 Business Analyst 職位。面試官微笑著說：「Please tell me about yourself.」\n\n你需要先介紹自己目前的身份——你是台大資管系大四學生，預計明年畢業。\n\n你想說：「我目前是台灣大學資訊管理學系的大四學生，預計 2026 年畢業。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Hello, my name is [Name]. I am studying Information Management at National Taiwan University and I will graduate in 2026.", explanation: "「I am studying」進行式暗示「還在讀」，但自我介紹的重點是你的身份，不是正在做的動作。「I will graduate」也稍嫌被動。"),
                                Challenge.Option(id: "B", text: "I'm currently a senior at National Taiwan University, majoring in Information Management, and I'm expected to graduate in 2026.", explanation: "正確！「I'm currently a senior at [school]」簡潔定位身份，「majoring in」用分詞片語附加資訊不佔主句空間，「expected to graduate」是標準的畢業預期表達。"),
                                Challenge.Option(id: "C", text: "I am a fourth-year student in the Department of Information Management at National Taiwan University. My expected graduation year is 2026.", explanation: "「fourth-year student」不如 senior 簡潔，「in the Department of」太冗長，「My expected graduation year is」像在填表格。"),
                                Challenge.Option(id: "D", text: "Currently I'm in my last year of college at NTU, studying Information Management, and I'm going to graduate next year.", explanation: "「last year of college」聽起來像在聊天，「I'm going to graduate next year」太口語。面試場合應該更精確（2026 比 next year 好）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["大四的英文是 senior，比 fourth-year student 更道地簡潔。", "用分詞片語（majoring in...）附加資訊，可以讓主句更精簡。"],
                            explanation: "自我介紹開頭的黃金公式：「I'm currently [a role] at [place], [分詞片語補充]」。用 currently 表示現在身份，用 senior/junior 而非 fourth-year/third-year（美式英文慣例），用分詞片語（majoring in, focusing on）附加細節。",
                            frameworkTip: "身份介紹公式：I'm currently a [role: senior/analyst/engineer] at [place], [majoring in / focusing on + detail]"
                        ),
                        Challenge(
                            id: 2,
                            name: "描述背景與專長",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個表達最能有效傳達你的跨領域背景？",
                            scenario: Challenge.Scenario(
                                title: "展現你的獨特性",
                                narrative: "面試官聽完你的身份後，等你繼續。你想快速帶出你的背景特色——你同時有商業分析和技術實作的經驗，之前在一間 FinTech 新創實習過。\n\n你想說：「我的背景結合了商業分析和技術實作，我之前在一間金融科技新創做了六個月的數據分析實習。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "My background is in both business analysis and technical implementation. I previously completed a six-month data analytics internship at a FinTech startup.", explanation: "正確！「My background is in」是介紹背景的標準句型，「both A and B」清楚標示雙重能力，「previously completed」比 did 正式，「six-month data analytics internship」資訊密集且精確。"),
                                Challenge.Option(id: "B", text: "I have experience in business and technology. Before, I did internship at a FinTech startup for 6 months doing data analysis.", explanation: "「I have experience in」太籠統（什麼 experience?），「did internship」缺少冠詞 an，「Before」不如 previously 正式，整體結構鬆散。"),
                                Challenge.Option(id: "C", text: "My background combines business analysis with hands-on technical skills, which I've developed through various experiences including a FinTech internship.", explanation: "「combines... with」不錯，但「various experiences including」太模糊且佔空間。面試時間有限，應該直接講最重要的經歷。"),
                                Challenge.Option(id: "D", text: "I know both business analysis and technical things because I interned at a FinTech startup and learned a lot about data.", explanation: "「I know both」太口語，「technical things」不專業，「learned a lot about data」空泛無力。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「My background is in...」是介紹專業背景的經典開頭。", "描述實習時，「completed a [duration] internship at [company]」比 「interned at」更完整。"],
                            explanation: "介紹背景時，先用一句概括定位（My background is in...），再用一句具體經歷佐證。注意：面試官的注意力只有前 30 秒最集中，所以每一句都要資訊密集，不要有廢話。",
                            frameworkTip: "背景介紹公式：My background is in [area A] and [area B]. I previously [completed/led] [specific experience] at [place]."
                        ),
                        Challenge(
                            id: 3,
                            name: "收尾：連結到這份職位",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個收尾最能讓面試官留下深刻印象？",
                            scenario: Challenge.Scenario(
                                title: "為什麼是這份工作？",
                                narrative: "你的自我介紹接近尾聲，需要把你的背景和眼前這個 Business Analyst 職位連結起來。你想傳達的是：你對用數據驅動商業決策很有熱情，而這份工作正好能讓你結合商業和技術的能力。\n\n你想說：「我對用數據驅動商業決策非常有熱情，這也是為什麼我對這個職位特別感興趣——它讓我能結合我在分析和技術方面的強項。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "I'm passionate about leveraging data to drive business decisions, which is why I'm particularly excited about this role — it sits at the intersection of analytics and technology, which is exactly where my strengths lie.", explanation: "正確！「I'm passionate about [V-ing]」表達熱情，「which is why」自然過渡到動機，「sits at the intersection of」精準描述跨域職位特質，「where my strengths lie」優雅收尾。這句話同時展現了熱情、自我認知和職位理解。"),
                                Challenge.Option(id: "B", text: "I really like using data to make business decisions. That's why I want this job, because it combines analysis and technology which I'm good at.", explanation: "「really like」太口語（面試用 passionate about），「want this job」太直白（用 excited about this role），「which I'm good at」收尾太弱。"),
                                Challenge.Option(id: "C", text: "Data-driven decision making is what I'm passionate about, and I believe this position offers the perfect opportunity for me to apply my analytical and technical skills.", explanation: "文法正確且內容合理，但「I believe this position offers the perfect opportunity for me」有些一廂情願——面試中更好的策略是展現 mutual fit，而不是「這份工作適合我」。"),
                                Challenge.Option(id: "D", text: "I'm very interested in this role because I want to use my data skills to help the company make better decisions, and I think my background makes me a good fit.", explanation: "「I think my background makes me a good fit」太自說自話。面試官不需要你下結論，他們會自己判斷。更好的做法是展現契合點，讓面試官自己得出結論。"),
                            ],
                            correctAnswer: "A",
                            hints: ["自我介紹的收尾要把你的熱情和這份工作的特質連結起來。", "「at the intersection of A and B」是描述跨域職位的精準用語。"],
                            explanation: "自我介紹的收尾是最重要的——這是面試官記憶最深的部分。最佳結構是：[你的熱情] + [為什麼這份工作] + [你的能力如何契合]。用 \"sits at the intersection of\" 描述跨域特質，用 \"where my strengths lie\" 優雅收尾，比直接說 \"I'm a good fit\" 更有說服力。",
                            frameworkTip: "收尾公式：I'm passionate about [what you love], which is why I'm particularly excited about this role — it [what makes this role special], which is [how your strengths fit]."
                        ),
                    ]
                ),
                Quest(
                    id: "49-2",
                    name: "Behavioral Questions / STAR",
                    description: "用 STAR 方法回答行為面試題，展現你的思考和行動力。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Situation & Task",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個英文開頭最能有效設定 STAR 的情境和任務？",
                            scenario: Challenge.Scenario(
                                title: "團隊衝突的故事",
                                narrative: "面試官問：「Tell me about a time when you had to deal with a conflict in your team.」\n\n你需要先用 STAR 的 S（Situation）和 T（Task）開頭，設定故事背景。你的經歷是：在一次課堂小組專案中，兩位組員對技術方案有嚴重分歧——一位堅持用 SQL 做分析，另一位堅持用 Python，這讓專案進度停滯。你的任務是作為組長協調他們的意見。\n\n你想說：「在一門資料分析課的小組專案中，兩位組員對技術方案產生嚴重分歧，一位堅持用 SQL，另一位堅持用 Python，導致專案停擺。身為組長，我的任務是找到一個雙方都能接受的方案。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "During a data analytics group project, two team members reached a deadlock over the technical approach — one insisted on SQL while the other pushed for Python, which stalled our progress. As the team lead, my task was to find a resolution that both parties could align on.", explanation: "正確！「reached a deadlock」精準描述衝突狀態，「insisted on... while the other pushed for」呈現雙方立場，「stalled our progress」點出影響，「find a resolution that both parties could align on」展現成熟的協調思維。Situation 和 Task 劃分清晰。"),
                                Challenge.Option(id: "B", text: "In my school project, my two teammates had a fight about using SQL or Python. The project was stuck because of them. I needed to solve this problem as the leader.", explanation: "「had a fight」太口語且帶有負面判斷（不是 fight，是 disagreement），「because of them」有指責意味，「solve this problem」太簡單。"),
                                Challenge.Option(id: "C", text: "There was a situation in my data analytics class where two team members disagreed about whether to use SQL or Python for the project analysis, and I was the team lead so I had to help them reach an agreement.", explanation: "「There was a situation where」太冗長（5 個字才到重點），「I was the team lead so I had to」因果邏輯正確但缺乏力量，Situation 和 Task 混在一起。"),
                                Challenge.Option(id: "D", text: "Once when I was doing a group project in college, two of my teammates could not agree on the technical solution. One wanted SQL and the other wanted Python. My job was to make them agree.", explanation: "「Once when I was doing」太日常敘事風格，「could not agree」不如 reached a deadlock 精準，「make them agree」暗示強迫而非協調。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 Situation 描述要在 2-3 句話內建立完整的衝突場景：誰、什麼衝突、什麼影響。", "「deadlock」比 disagreement 更強烈，適合描述嚴重分歧。"],
                            explanation: "STAR 的 S 和 T 是故事的地基。Situation 要包含：場景（group project）、衝突（deadlock over approach）、影響（stalled progress）。Task 要用一句話說明你的角色和目標。注意用中性語言描述衝突（reached a deadlock 而非 had a fight），展現專業態度。",
                            frameworkTip: "STAR S+T 公式：During [context], [conflict/challenge happened], which [impact]. As [your role], my task was to [objective]."
                        ),
                        Challenge(
                            id: 2,
                            name: "Action",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 Action 描述最有說服力？",
                            scenario: Challenge.Scenario(
                                title: "你做了什麼？",
                                narrative: "面試官聽完你的 Situation 和 Task 後，期待你描述具體行動。\n\n你做了三件事：（1）先分別跟兩位組員一對一聊，了解他們各自的考量，（2）發現其實兩人的核心需求可以共存——SQL 做資料前處理、Python 做視覺化分析，（3）提出一個整合方案並獲得雙方同意。\n\n你想說：「我先分別跟兩位組員一對一溝通，了解各自的考量。我發現其實兩邊的需求可以整合——SQL 處理資料提取、Python 負責視覺化。於是我提出了一個結合兩者的分工方案，雙方都表示認同。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "I started by having one-on-one conversations with each team member to understand their underlying concerns. I discovered that their needs were actually complementary — SQL was ideal for data extraction and preprocessing, while Python excelled at visualization and analysis. I then proposed a hybrid approach that leveraged the strengths of both tools, and both members agreed to move forward with it.", explanation: "正確！「started by having one-on-one conversations」展現溝通能力，「underlying concerns」表示你深入了解而非表面處理，「complementary」精準描述互補性，「hybrid approach that leveraged the strengths of both」展現整合思維。三個步驟有清晰的邏輯遞進。"),
                                Challenge.Option(id: "B", text: "I talked to them separately and found out that we can use SQL for data part and Python for visualization part. Then I told them my idea and they agreed.", explanation: "「talked to them」太簡單（做了什麼樣的對話？），「found out that we can use」被動發現而非主動分析，「told them my idea and they agreed」缺乏提案過程的描述。"),
                                Challenge.Option(id: "C", text: "First, I listened to both sides. Second, I analyzed their requirements. Third, I came up with a solution that uses SQL for extraction and Python for visualization. Fourth, I presented it and got their buy-in.", explanation: "「First, Second, Third, Fourth」太機械化，像在念步驟而非講故事。面試中的 Action 應該有敘事感和思考邏輯，不是清單。"),
                                Challenge.Option(id: "D", text: "What I did was I met with each person individually to hear their side. It turned out that SQL and Python could actually be used together, so I suggested this idea and everyone was happy.", explanation: "「What I did was」冗餘開頭，「hear their side」不如 understand their concerns 深入，「everyone was happy」太天真，「suggested this idea」太模糊。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Action 的描述要有三個層次：蒐集資訊 → 分析洞察 → 提出方案。", "用「underlying concerns」表示你不只聽表面意見，更深入了解根本需求。"],
                            explanation: "STAR 的 Action 是面試官最關注的部分。好的 Action 描述要展現：（1）主動性（I started by...），（2）深度思考（understand underlying concerns），（3）洞察力（discovered... complementary），（4）解決方案（proposed a hybrid approach）。用 \"leveraged the strengths of both\" 展現整合思維。",
                            frameworkTip: "STAR Action 公式：I started by [information gathering]. I discovered that [insight]. I then proposed [solution that addresses root cause]."
                        ),
                        Challenge(
                            id: 3,
                            name: "Result",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 Result 描述最能為你的 STAR 故事畫上完美句點？",
                            scenario: Challenge.Scenario(
                                title: "成果是什麼？",
                                narrative: "現在你需要用 STAR 的 R（Result）來收尾。你的整合方案的成果是：專案在期限內完成，最終獲得全班最高分（95 分），教授特別稱讚了你們結合兩種工具的做法。\n\n你想說：「最終我們在期限內完成了專案，拿到全班最高的 95 分。教授還特別在評語中提到，我們結合 SQL 和 Python 的做法非常有效。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "As a result, we delivered the project on time and received the highest score in the class — 95 out of 100. The professor specifically highlighted our integrated use of SQL and Python as a best practice in the feedback.", explanation: "正確！「As a result」明確標示成果，「delivered on time」展現執行力，「highest score — 95 out of 100」具體有力，「specifically highlighted... as a best practice」展現外部認可，且「best practice」是商業場合的高評價用語。"),
                                Challenge.Option(id: "B", text: "In the end, we finished the project on time and got 95 points, the highest in the class. The professor said our method of using both SQL and Python was very good.", explanation: "「In the end」不如 As a result 正式，「got 95 points」太口語（應用 received/achieved），「said... was very good」太簡單——教授說了什麼具體的話？"),
                                Challenge.Option(id: "C", text: "The result was that we completed the project before the deadline with a score of 95, ranking first in the class, and our approach was praised by the professor.", explanation: "「The result was that」冗長，「completed before the deadline」（你說的是 on time 不是 before），被動語態「was praised」不如主動語態「the professor highlighted」有力。"),
                                Challenge.Option(id: "D", text: "Finally, everything worked out well. We got 95 and the professor liked our SQL and Python approach.", explanation: "「everything worked out well」是最典型的弱收尾——沒有具體成果。「liked our approach」太日常，面試中需要更有力的結尾。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Result 要包含兩類成果：量化成績（分數、排名）和質化認可（教授的評價）。", "用 \"As a result\" 或 \"The outcome was\" 明確標示你在講 Result 部分。"],
                            explanation: "STAR 的 Result 需要用具體證據來證明你的行動有效。最佳結構是：量化成果（highest score, 95/100）+ 質化認可（professor highlighted as best practice）。注意用「delivered on time」而非 finished，用「highlighted as a best practice」而非 said it was good。強動詞讓結果更有力。",
                            frameworkTip: "STAR Result 公式：As a result, we [quantified achievement]. [Stakeholder] specifically [verb: highlighted/recognized/praised] [what was valued]."
                        ),
                    ]
                ),
                Quest(
                    id: "49-3",
                    name: "Case Study 回答句型",
                    description: "學會用英文有條理地分析 case study，展現結構化思維。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "拆解問題的開場",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個開場最能展現結構化思維？",
                            scenario: Challenge.Scenario(
                                title: "Case Interview 第一步",
                                narrative: "你正在面試 Google 的 Product Analyst 職位。面試官給你一個 case：\n\n「YouTube Shorts 的日均觀看次數在過去一個月下降了 15%，你會怎麼分析？」\n\n你需要先表明你的分析思路——你打算從供給面（內容量）、需求面（用戶行為）和平台面（演算法、推薦系統）三個方向來拆解。\n\n你想說：「好的，讓我把這個問題拆解一下。我的分析思路是從三個面向來看：供給面——是否有內容量的變化；需求面——用戶行為是否改變；以及平台面——推薦演算法是否有更動。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Let me break this down into three dimensions. I'd approach this by examining the supply side — whether content volume has changed, the demand side — whether user behavior has shifted, and the platform side — whether any algorithm or recommendation changes were made.", explanation: "正確！「Let me break this down」展現主動拆解問題的能力，「three dimensions」設定清晰框架，三個平行的「whether」子句結構一致，每個面向都有具體的分析方向。面試官會知道你有清晰的 roadmap。"),
                                Challenge.Option(id: "B", text: "I think there are many possible reasons. Maybe the content is less, or users don't watch anymore, or the algorithm changed. Let me think about each one.", explanation: "「I think there are many possible reasons」太模糊且不自信，「Maybe」重複三次顯得猶豫。Case interview 的開場要展現確定性和結構感，不是列舉「可能」。"),
                                Challenge.Option(id: "C", text: "My approach would be to look at this from supply, demand, and platform perspectives. On the supply side, we need to check content creation metrics. On the demand side, we need to analyze user engagement. On the platform side, we should review recent algorithm changes.", explanation: "結構正確但太冗長。三次「On the... side, we need to...」的重複結構佔用太多時間，在 case interview 的開場應該更精煉。留下細節在後續分析時展開。"),
                                Challenge.Option(id: "D", text: "First I want to understand the problem better. Is the 15% decline across all regions? All content types? All user segments? Before I analyze, I need more data.", explanation: "釐清假設很好，但在開場就問大量問題會讓面試官覺得你還沒有分析方向。更好的做法是先展示框架，再在框架內提出釐清問題。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「Let me break this down」是 case interview 最經典的開場白。", "三個面向用相同結構（whether + 子句）呈現，展現平行思維。"],
                            explanation: "Case interview 的第一步是展現你有結構化的分析框架。「Let me break this down into [N] dimensions」告訴面試官你的腦中有 roadmap。注意三個面向要有邏輯關係（供給 vs 需求 vs 平台是 MECE 的拆解），每個面向用簡短的 \"whether\" 子句點出方向即可。",
                            frameworkTip: "Case 開場公式：Let me break this down into [N] dimensions: [dim 1] — whether [question], [dim 2] — whether [question], and [dim 3] — whether [question]."
                        ),
                        Challenge(
                            id: 2,
                            name: "提出假設",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個假設表達最專業？",
                            scenario: Challenge.Scenario(
                                title: "深入分析",
                                narrative: "你列出三個面向後，面試官說：「Great framework. Let's dive into the demand side first.」\n\n你開始分析需求面。你的假設是：這個下降可能跟 TikTok 最近推出的新功能有關——TikTok 上個月推出了 AI 生成短片功能，可能吸走了部分用戶的注意力。\n\n你想說：「我在需求面的第一個假設是：用戶流失到了競爭對手。具體來說，TikTok 上個月推出了 AI 生成短片功能，這可能吸引了部分 Shorts 的用戶。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "My primary hypothesis on the demand side is user attrition to competitors. Specifically, TikTok launched an AI-generated video feature last month, which may have drawn a portion of Shorts users to their platform.", explanation: "正確！「My primary hypothesis」清楚標示這是假設，「user attrition to competitors」用精準術語，「Specifically」帶出具體例子，「may have drawn」用完成式表示已經發生的可能影響，「a portion of」比 some 更精確。"),
                                Challenge.Option(id: "B", text: "I think users are leaving because TikTok has a new AI video feature. Users probably went to TikTok instead of watching YouTube Shorts.", explanation: "「I think users are leaving」太斷言（你還在假設階段），「probably went to」太口語且太確定——在 case interview 中要用 may have / could have 保持假設語氣。"),
                                Challenge.Option(id: "C", text: "One possible reason on the demand side could be that some users might have shifted to competitors like TikTok because of their new AI-generated video feature that was released last month.", explanation: "「One possible reason... could be that some users might have」一句話中有四個不確定詞（possible, could, some, might），顯得極度不自信。假設要有根據地提出，不是堆砌不確定性。"),
                                Challenge.Option(id: "D", text: "For the demand side, my hypothesis is about competition. TikTok launched AI videos recently, so users switched to TikTok, causing the Shorts decline.", explanation: "「my hypothesis is about competition」太模糊，「so users switched」太斷言（這是假設不是事實），缺乏 may/could 的假設語氣。"),
                            ],
                            correctAnswer: "A",
                            hints: ["提出假設時，用 \"My hypothesis is...\" 而非 \"I think...\"。", "「Specifically」是從抽象概念過渡到具體例子的最佳連接詞。"],
                            explanation: "提出假設的專業結構：（1）明確標示假設（My primary hypothesis is...），（2）用術語概括（user attrition to competitors），（3）具體佐證（Specifically, TikTok launched...），（4）保持假設語氣（may have drawn）。注意在 case interview 中，要在自信和謹慎之間取得平衡。",
                            frameworkTip: "假設提出公式：My primary hypothesis is [abstract concept]. Specifically, [concrete evidence/example], which may have [potential impact]."
                        ),
                        Challenge(
                            id: 3,
                            name: "總結建議",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個建議表達最能展現你的策略思維？",
                            scenario: Challenge.Scenario(
                                title: "給出你的建議",
                                narrative: "分析完所有面向後，面試官問：「So what would you recommend?」\n\n經過分析，你發現最關鍵的問題是推薦演算法在上個月的更新中過度優化了觀看時長，犧牲了短影片的曝光量。你的建議是回調演算法權重，並 A/B test 不同的推薦策略。\n\n你想說：「根據我的分析，我建議分兩步走：短期先回調演算法中觀看時長的權重，恢復短影片的曝光量；長期則 A/B test 不同的推薦策略，找到觀看時長和內容多樣性之間的最佳平衡點。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Based on my analysis, I'd recommend a two-pronged approach. In the short term, we should rebalance the algorithm weights to restore exposure for short-form content. In the longer term, I'd suggest running A/B tests on different recommendation strategies to find the optimal balance between watch time and content diversity.", explanation: "正確！「Based on my analysis」連結前面的分析，「two-pronged approach」展現結構化建議，「short term / longer term」區分優先級，「rebalance」精準描述行動，「optimal balance between A and B」展現 trade-off 意識。"),
                                Challenge.Option(id: "B", text: "I recommend changing the algorithm back and doing A/B tests. The algorithm update caused the problem, so we should fix it first, and then test different approaches.", explanation: "太簡略。「changing back」不如 rebalance 精準，「doing A/B tests」缺乏目標（test 什麼？），沒有區分短期和長期優先級。"),
                                Challenge.Option(id: "C", text: "My recommendation is that the team should immediately roll back the algorithm changes to the previous version, and then conduct extensive A/B testing over the next quarter to determine the best recommendation strategy going forward.", explanation: "「immediately roll back」太激進——面試中不建議建議「全部回滾」，而是調整。「extensive A/B testing」太模糊——測什麼？衡量什麼？"),
                                Challenge.Option(id: "D", text: "I would suggest two things. First, fix the algorithm problem by adjusting the weights. Second, do some tests to see what works better. This way we can solve both the short-term and long-term issues.", explanation: "「fix the algorithm problem」和「do some tests」太口語且模糊，「see what works better」沒有指出要衡量的面向。"),
                            ],
                            correctAnswer: "A",
                            hints: ["建議要區分短期和長期，展現你有優先級意識。", "用 \"two-pronged approach\" 表示你的建議有多個面向。"],
                            explanation: "給建議的專業結構：（1）連結分析（Based on my analysis），（2）設定框架（two-pronged approach），（3）短期行動（rebalance weights），（4）長期策略（A/B test for optimal balance）。注意用「rebalance」而非「change back」——前者暗示精細調整，後者暗示否定之前的決策。",
                            frameworkTip: "建議公式：Based on my analysis, I'd recommend a [two-pronged/phased] approach. Short term: [immediate action]. Longer term: [strategic initiative to optimize for balance between A and B]."
                        ),
                    ]
                ),
                Quest(
                    id: "49-4",
                    name: "提問環節",
                    description: "學會在面試最後用英文提出高品質的問題，展現你對公司和職位的深度興趣。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "問團隊文化",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個提問最能展現你的思考深度？",
                            scenario: Challenge.Scenario(
                                title: "輪到你問了",
                                narrative: "面試進入尾聲，面試官說：「Do you have any questions for me?」\n\n你想了解這個團隊的工作方式和文化——具體來說，團隊怎麼做決策的？是資料驅動還是直覺驅動？\n\n你想問：「能否跟我分享一下，你們團隊平常是怎麼做產品決策的？是偏資料驅動還是更依賴經驗和直覺？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Could you tell me more about how the team makes product decisions? Is it more data-driven or intuition-based?", explanation: "問題合理但太像是非題——面試官只需要回答 \"data-driven\" 就結束了，無法帶出深度對話。"),
                                Challenge.Option(id: "B", text: "How does the team approach product decision-making? I'm curious about the balance between data-driven insights and qualitative judgment, especially for high-stakes decisions.", explanation: "正確！「How does the team approach...」是開放式問法，「I'm curious about the balance between」展現你理解現實中不是非黑即白，「especially for high-stakes decisions」進一步聚焦，讓面試官可以分享具體案例。"),
                                Challenge.Option(id: "C", text: "Do you use data to make decisions?", explanation: "太簡單且答案顯而易見（科技公司當然用 data）。這個問題不會帶來任何有價值的資訊。"),
                                Challenge.Option(id: "D", text: "What is the decision-making process in the team? Is it collaborative or top-down? And how important is data?", explanation: "一次問三個問題，面試官不知道回答哪一個。提問環節每次問一個精準問題更有效。"),
                            ],
                            correctAnswer: "B",
                            hints: ["好的面試提問是開放式的，能引導面試官分享具體經驗和案例。", "用 \"I'm curious about...\" 表示你的提問有思考脈絡，不是隨便問的。"],
                            explanation: "面試提問的三個層次：（1）基本問題（Do you use data? → 太簡單），（2）開放式問題（How do you approach...? → 好），（3）有深度的開放式問題（How... especially for [specific situation]? → 最好）。加上 \"I'm curious about\" 展現你的思考脈絡，加上 \"especially for\" 聚焦到有趣的面向。",
                            frameworkTip: "團隊文化提問公式：How does the team approach [topic]? I'm curious about [specific aspect], especially [in what context/situation]."
                        ),
                        Challenge(
                            id: 2,
                            name: "問個人成長",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個提問最能展現你對成長的主動性？",
                            scenario: Challenge.Scenario(
                                title: "了解成長空間",
                                narrative: "你還想了解在這個職位上能學到什麼。你特別在意的是：作為新人，有沒有 mentoring 機制？前六個月通常會負責什麼樣的專案？\n\n你想問：「對於這個職位的新人，前六個月通常會被安排什麼樣的專案？有沒有導師制度或 onboarding 計畫？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "What does the onboarding process look like for someone in this role? I'd love to understand what the first six months typically involve and whether there's a mentorship structure in place.", explanation: "正確！「What does the onboarding process look like」具體且務實，「I'd love to understand」展現真誠興趣，「first six months typically involve」聚焦到具體時期，「mentorship structure in place」用 structure 而非 system 更自然。"),
                                Challenge.Option(id: "B", text: "Is there training for new employees? And will I have a mentor?", explanation: "「Is there training」太籠統，「Will I have a mentor」太直接且假設你已拿到 offer。提問環節的問題應該更開放。"),
                                Challenge.Option(id: "C", text: "What kind of projects will I work on in the first few months? How will I learn things I don't know?", explanation: "「Will I work on」假設你已被錄取，「How will I learn things I don't know」暴露了你覺得自己有很多不會的，語氣不夠自信。"),
                                Challenge.Option(id: "D", text: "Could you describe the growth trajectory for this position? What does success look like in the first year, and how does the company support professional development?", explanation: "這是一個很好的問題，但它問的是「第一年成功標準」和「職涯發展」，而非題目要求的「前六個月的專案」和「mentoring 制度」。問題本身沒錯，只是沒有對到你真正想了解的面向。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「What does [X] look like for...」是問流程的萬用句型。", "用 \"I'd love to understand\" 比 \"I want to know\" 更禮貌且展現興趣。"],
                            explanation: "問成長相關問題時，用「What does [process] look like for someone in this role?」開頭最自然。後面用「I'd love to understand」展現真誠興趣，再用具體的時間範圍（first six months）和制度名稱（mentorship structure）讓問題有焦點。",
                            frameworkTip: "成長提問公式：What does [process: onboarding/career path] look like for [this role]? I'd love to understand [specific aspect] and whether [specific support structure]."
                        ),
                        Challenge(
                            id: 3,
                            name: "問成功標準",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個問法最能讓面試官給出有價值的回答？",
                            scenario: Challenge.Scenario(
                                title: "什麼算做得好？",
                                narrative: "你最後還想問一個關鍵問題：怎樣算是在這個職位上做得好？你想了解面試官心中的理想人選在前六個月應該達到什麼樣的成果。\n\n你想問：「在你看來，這個職位的人如果做得很好，前六個月應該會有什麼樣的成果或表現？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "What does success look like for this role in the first six months? What outcomes or milestones would indicate that someone is performing well?", explanation: "正確！「What does success look like」是面試提問的黃金句型，「in the first six months」具體化時間，第二句用「What outcomes or milestones would indicate」進一步引導面試官給出具體標準。"),
                                Challenge.Option(id: "B", text: "How will you evaluate my performance? What are the KPIs for this position?", explanation: "「How will you evaluate my performance」假設你已被錄取且語氣太直接，「What are the KPIs」太冷冰冰，面試不是在談合約。"),
                                Challenge.Option(id: "C", text: "What do I need to do to be successful in this role?", explanation: "太籠統，面試官可能只回答「work hard and learn fast」。問題要給面試官足夠的框架（時間範圍、具體標準）來回答。"),
                                Challenge.Option(id: "D", text: "Can you tell me what a good employee looks like in this team? What should they achieve?", explanation: "「a good employee」用詞太一般，「what should they achieve」太模糊。面試官無法從這麼開放的問題中給出有意義的答案。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「What does success look like for...」是面試中最經典且最有用的反問句型之一。", "加上時間範圍（in the first six months）讓問題更具體、更容易回答。"],
                            explanation: "「What does success look like for [role] in [timeframe]?」是面試提問的終極武器。它展現了三件事：（1）你在意表現標準（成就導向），（2）你思考有時間框架（務實），（3）你願意對齊期待（團隊合作意識）。面試官的回答還能幫你判斷這份工作是否適合你。",
                            frameworkTip: "成功標準提問公式：What does success look like for this role in [timeframe]? What [outcomes/milestones] would indicate [strong performance]?"
                        ),
                    ]
                ),
                Quest(
                    id: "49-5",
                    name: "Boss: 模擬面試全流程",
                    description: "整合所有面試英文句型，完成一場完整的英文面試回答。",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "模擬面試全流程",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文完成以下四段面試回答（每段 3-5 句，總共約 300-400 字）：\n\n**Part 1 — Self Introduction**\n用 \"I'm currently...\" 開頭，包含身份、背景亮點、和為什麼對這個職位感興趣。\n\n**Part 2 — STAR Behavioral Answer**\n用完整的 STAR 結構回答。可以虛構一個合理的數據分析經驗。\n\n**Part 3 — Case Analysis**\n用 \"Let me break this down...\" 開頭，提出 2-3 個分析面向，並給出一個假設和建議。\n\n**Part 4 — Your Question**\n用 \"What does success look like...\" 或其他學過的提問句型，問一個有深度的問題。",
                            scenario: Challenge.Scenario(
                                title: "最終模擬面試",
                                narrative: "你正在面試 Shopee 的 Business Analyst 職位。面試官依序問了以下四個問題，請你依序用英文回答所有問題。\n\n1. \"Tell me about yourself.\"\n2. \"Tell me about a time when you used data to influence a decision.\"\n3. \"Our seller conversion rate has dropped by 10% this quarter. How would you approach this problem?\"\n4. \"Do you have any questions for me?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["每一段都有對應的核心句型，先把句型寫出來，再填入內容。"],
                            explanation: "完整的面試回答需要：Self Introduction 精簡有力（30 秒）、STAR 有完整四元素且有數據（1-2 分鐘）、Case Analysis 展現框架思維（2-3 分鐘）、提問展現深度思考。注意整體的語氣應該自信但不自大，用 \"I'd recommend\" 而非 \"You should\"。",
                            frameworkTip: "面試全流程框架：Intro（30s, identity + passion + fit）→ STAR（1-2min, S→T→A→R with data）→ Case（2-3min, framework → hypothesis → recommendation）→ Question（depth + curiosity）"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 50,
            name: "Business/Product/Data 字彙",
            emoji: "📊",
            description: "掌握商業、產品和數據分析領域的核心英文字彙與搭配",
            quests: [
                Quest(
                    id: "50-1",
                    name: "Business 核心字彙",
                    description: "學會商業分析常用的核心英文術語，從 revenue 到 unit economics。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Revenue 相關字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個選項正確解釋了這段話中所有術語的意思？",
                            scenario: Challenge.Scenario(
                                title: "看懂財務報告",
                                narrative: "你剛加入一間 SaaS 公司的 Business Operations 團隊，主管丟了一份 quarterly report 給你看。報告中提到：\n\n\"Our MRR grew 12% QoQ, but net revenue retention dropped to 95%, primarily driven by increased churn in the SMB segment.\"\n\n你需要搞懂這段話的每個術語。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "MRR = Monthly Recurring Revenue（月經常性收入）; QoQ = Quarter over Quarter（季度環比）; Net Revenue Retention = 既有客戶的營收留存率; Churn = 客戶流失; SMB = Small and Medium Business（中小企業）", explanation: "正確！每個術語都解釋準確。MRR 是訂閱制公司最重要的營收指標，QoQ 表示和上一季比較，Net Revenue Retention 衡量既有客戶（不含新客）的營收變化，Churn 指客戶取消或降級，SMB 是中小企業客群。"),
                                Challenge.Option(id: "B", text: "MRR = Monthly Revenue Report; QoQ = Quarter on Quarter; Net Revenue Retention = 總營收成長率; Churn = 客戶投訴; SMB = Small and Mid-size Business", explanation: "MRR 不是 Monthly Revenue Report 而是 Monthly Recurring Revenue，Churn 是「流失」不是「投訴」，Net Revenue Retention 是「既有客戶營收留存率」不是「總營收成長率」。"),
                                Challenge.Option(id: "C", text: "MRR = Monthly Recurring Revenue; QoQ = Quarterly over Quarterly; Net Revenue Retention = 淨利潤留存率; Churn = 員工離職; SMB = Small Medium Business", explanation: "多處錯誤：QoQ 是 Quarter over Quarter 不是 Quarterly over Quarterly，Net Revenue Retention 和「淨利潤」無關，Churn 在商業脈絡中指的是「客戶流失」不是「員工離職」。"),
                                Challenge.Option(id: "D", text: "MRR = Monthly Recurring Revenue; QoQ = Quarter over Quarter; Net Revenue Retention = 新客戶營收佔比; Churn = 客戶流失; SMB = Startup and Medium Business", explanation: "Net Revenue Retention 衡量的是「既有客戶」的營收變化，不是「新客戶營收佔比」。SMB 的 S 是 Small 不是 Startup。"),
                            ],
                            correctAnswer: "A",
                            hints: ["MRR 的 R 是 Recurring（經常性），不是 Report 或 Revenue 單獨。", "Churn 在商業場合幾乎永遠指「客戶流失」。"],
                            explanation: "這些是 SaaS / 訂閱制商業模式的核心術語。MRR（月經常性收入）是衡量訂閱營收的基本指標；Net Revenue Retention 是投資人最愛問的指標之一，>100% 表示既有客戶在擴張（upsell），<100% 表示有流失；Churn 是所有訂閱制公司的天敵。",
                            frameworkTip: "SaaS 核心指標架構：Growth（MRR, ARR）→ Retention（NRR, Gross Retention）→ Loss（Churn Rate, Revenue Churn）→ Unit Economics（CAC, LTV）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Unit Economics 字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪組定義最精準？",
                            scenario: Challenge.Scenario(
                                title: "單位經濟學入門",
                                narrative: "在 weekly meeting 上，CFO 提到：\n\n\"Our CAC has increased to $150, but LTV remains at $900, giving us a healthy LTV/CAC ratio of 6:1. However, the payback period has extended to 8 months.\"\n\n你的同事偷偷問你：「CAC 和 LTV 到底是什麼？」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "CAC (Customer Acquisition Cost) = 獲取一個新客戶的平均成本; LTV (Lifetime Value) = 一個客戶在整個生命週期內為公司帶來的總營收; Payback Period = 收回 CAC 所需的時間", explanation: "正確！CAC 是獲客成本（行銷 + 銷售費用 / 新客數），LTV 是客戶終身價值（估算一個客戶從註冊到流失的總營收貢獻），Payback Period 是回本期——從獲客到賺回 CAC 的時間。LTV/CAC > 3 通常被認為是健康的。"),
                                Challenge.Option(id: "B", text: "CAC = 客戶年度消費金額; LTV = 公司長期估值; Payback Period = 投資人回本時間", explanation: "全部錯誤。CAC 是獲客「成本」不是消費金額，LTV 是「客戶」終身價值不是公司估值，Payback Period 這裡指的是客戶層面不是投資人。"),
                                Challenge.Option(id: "C", text: "CAC = 每次點擊廣告的成本; LTV = 客戶最後一次消費的金額; Payback Period = 還款期限", explanation: "每次點擊成本是 CPC (Cost Per Click)，不是 CAC。LTV 是「終身」價值不是「最後一次」。Payback Period 在這裡不是貸款還款期。"),
                                Challenge.Option(id: "D", text: "CAC = 獲取客戶的總成本（包含所有行銷費用的總和）; LTV = 利潤（不是營收）; Payback Period = 收回 CAC 所需的時間", explanation: "CAC 是「平均」每個客戶的獲取成本，不是「總」行銷費用。LTV 在不同公司的定義可能用營收或利潤，但最常見的定義是基於「營收」（revenue-based LTV），而非淨利潤。"),
                            ],
                            correctAnswer: "A",
                            hints: ["CAC 的 A 是 Acquisition（獲取），衡量的是「獲取一個客戶」要花多少錢。", "LTV 的 L 是 Lifetime（終身），衡量的是「一個客戶一輩子」帶來多少營收。"],
                            explanation: "Unit Economics 是判斷商業模式是否健康的基礎。CAC（獲客成本）和 LTV（客戶終身價值）是最重要的兩個指標。LTV/CAC ratio 越高越好（>3 算健康），Payback Period 越短越好（表示回本快，現金流壓力小）。這些術語在面試中經常被考到。",
                            frameworkTip: "Unit Economics 三指標：CAC（花多少錢獲客）→ LTV（客戶貢獻多少營收）→ Payback Period（多久回本）。健康標準：LTV/CAC > 3，Payback Period < 12 個月。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Growth 相關字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個解讀最正確？",
                            scenario: Challenge.Scenario(
                                title: "成長團隊週報",
                                narrative: "你加入了 Growth 團隊，每週的週報都充滿了英文術語。這週的報告摘要：\n\n\"Top of funnel traffic is up 20%, but our activation rate remains flat at 15%. We need to focus on reducing friction in the onboarding flow to improve conversion from sign-up to first value moment.\"\n\n你需要完全理解這段話才能做出正確的分析。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "網站流量增加了 20%，但只有 15% 的新用戶完成了初次重要操作。團隊需要優化新用戶引導流程，減少摩擦點，讓更多人從註冊到第一次感受到產品價值。", explanation: "正確！Top of funnel = 漏斗頂部（最初的流量/觸達），Activation rate = 新用戶啟用率（完成關鍵動作的比例），Friction = 使用障礙/摩擦點，Onboarding flow = 新用戶引導流程，First value moment = 用戶第一次感受到產品價值的時刻。"),
                                Challenge.Option(id: "B", text: "銷售漏斗的頂部客戶增加 20%，但整體客戶啟動率只有 15%。團隊要減少產品的摩擦設計來提升轉換率。", explanation: "「銷售漏斗的頂部客戶」描述不太精準——Top of funnel 指的是流量或觸達，不一定是「客戶」。「產品的摩擦設計」措辭有誤，原文指的是 onboarding flow 中的 friction（摩擦點），不是刻意的「摩擦設計」。"),
                                Challenge.Option(id: "C", text: "廣告投放量增加 20%，但轉換率只有 15%。需要改善著陸頁設計。", explanation: "Top of funnel traffic 不一定是廣告（也可以是 SEO、口碑等），15% 是 activation rate 不是轉換率，原文建議改善的是 onboarding flow 不是著陸頁。"),
                                Challenge.Option(id: "D", text: "前 20% 的用戶流量提升了，但活躍率只有 15%。需要減少用戶操作步驟。", explanation: "「前 20% 的用戶」完全誤解了 \"up 20%\"（是「增加了 20%」不是「前 20% 的用戶」）。Activation rate 是啟用率不是活躍率（活躍率是 engagement rate 或 DAU/MAU）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Top of funnel 指的是用戶旅程漏斗的最上面——最初接觸到產品的階段。", "Activation rate 指的是新用戶完成「關鍵動作」（如第一次下單、第一次發文）的比例。"],
                            explanation: "Growth 團隊的核心字彙圍繞著 AARRR 漏斗：Acquisition（獲取）→ Activation（啟用）→ Retention（留存）→ Revenue（營收）→ Referral（推薦）。Top of funnel 是 Acquisition 階段，Activation rate 衡量新用戶是否真正開始用產品，First value moment 是用戶「啊哈！」的瞬間——產品之所以存在的核心理由。",
                            frameworkTip: "Growth 漏斗字彙：Top of funnel (Acquisition) → Activation (First value moment) → Retention (DAU/MAU) → Monetization (Revenue) → Referral (Virality)。Friction = 漏斗中讓用戶卡住或離開的障礙。"
                        ),
                    ]
                ),
                Quest(
                    id: "50-2",
                    name: "Product 字彙",
                    description: "學會產品開發流程中常用的英文術語，從敏捷開發到利害關係人管理。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Agile 開發字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個選項完全正確地解釋了所有術語？",
                            scenario: Challenge.Scenario(
                                title: "第一次參加 Sprint Planning",
                                narrative: "你加入一間科技公司的 Product 團隊。第一天就被拉進 Sprint Planning 會議。PM 說：\n\n\"Let's review the backlog and prioritize stories for this sprint. We have 40 story points of capacity. The MVP for the search feature needs to ship by end of sprint, and we should timebox the exploration on the recommendation engine to 3 story points.\"\n\n你聽到一堆術語，需要搞清楚每個詞的意思。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Sprint = 固定時間的開發週期（通常 1-2 週）; Backlog = 待辦需求清單; Story Points = 衡量工作量的單位; MVP = Minimum Viable Product（最小可行產品）; Timebox = 設定時間上限", explanation: "正確！Sprint 是 Scrum 的核心概念——固定長度的開發迭代。Backlog 是所有待做事項的優先順序列表。Story Points 估算相對工作量（不是時間！）。MVP 是能驗證核心假設的最簡版本。Timebox 是設定時間上限，到期就停。"),
                                Challenge.Option(id: "B", text: "Sprint = 快速開發; Backlog = 技術債; Story Points = 故事數量; MVP = 最小版本產品; Timebox = 時間盒裝", explanation: "多處嚴重錯誤。Backlog 不是技術債（Tech Debt 才是），Story Points 衡量的是「工作量」不是「故事數量」，「時間盒裝」的直譯不傳達 timebox 的意思。"),
                                Challenge.Option(id: "C", text: "Sprint = 2 週的開發週期; Backlog = 排好優先順序的需求清單; Story Points = 用天數估算的工作量; MVP = 客戶能使用的第一版產品; Timebox = 限制探索時間", explanation: "Sprint 不一定是 2 週（也可以是 1 週或 3 週），Story Points 不是用天數估算（是相對難度估算，刻意不用時間），MVP 不只是「第一版」——它是能驗證核心假設的「最小」版本。"),
                                Challenge.Option(id: "D", text: "Sprint = 一個迭代; Backlog = 所有 bug 的清單; Story Points = 工作優先順序分數; MVP = 簡化版產品; Timebox = 截止日期", explanation: "Backlog 不只是 bug（也包含 feature、improvement 等），Story Points 不是優先順序（是工作量），Timebox 和 Deadline 不同——timebox 是「到時間就停」，deadline 是「到時間要完成」。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Story Points 故意不用「天數」或「小時」估算，因為重點是相對難度而非絕對時間。", "Timebox ≠ Deadline。Timebox 的精神是「到了就停，不管做完沒」。"],
                            explanation: "Agile 開發有一套專屬詞彙。Sprint 是固定迭代、Backlog 是優先順序清單、Story Points 衡量相對工作量、MVP 是最小可驗證版本、Timebox 是時間限制。理解這些術語是與工程團隊溝通的基礎，面試中也常被考到（「你怎麼和工程團隊協作？」）。",
                            frameworkTip: "Agile 核心循環：Backlog (需求池) → Sprint Planning (選什麼做) → Sprint (執行) → Review (檢視成果) → Retro (回顧改善)。MVP 是產品階段概念，Story Points 是工作量單位。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Product Strategy 字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個對 \"vanity metrics\" 和 \"north star metric\" 的解釋最準確？",
                            scenario: Challenge.Scenario(
                                title: "產品策略會議",
                                narrative: "你旁聽了一場產品策略會議，VP of Product 說：\n\n\"We need to validate our value proposition before scaling. Let's run a pilot with our early adopters, gather qualitative feedback, and iterate on the core user journey. Our north star metric should be weekly active usage, not just sign-ups — vanity metrics won't help us find product-market fit.\"\n\n你需要理解每一個關鍵術語。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Vanity metrics = 看起來好看但不影響商業決策的指標（如總註冊數）; North star metric = 最能反映產品核心價值的單一指標（如週活躍使用率）", explanation: "正確！Vanity metrics 如總下載量、總註冊數——數字只會往上漲，但不代表產品健康。North star metric 是整個團隊對齊的唯一核心指標，應該直接反映用戶是否從產品中獲得價值。"),
                                Challenge.Option(id: "B", text: "Vanity metrics = 不重要的指標; North star metric = 最重要的 KPI", explanation: "不夠精準。Vanity metrics 不是「不重要」——它可能有參考價值，關鍵是它「不驅動決策」。North star metric 不只是「最重要的 KPI」——它必須反映「產品核心價值」，而非任何業績指標。"),
                                Challenge.Option(id: "C", text: "Vanity metrics = 虛假的數據; North star metric = 北極星指標（公司方向）", explanation: "Vanity metrics 不是「虛假」的——它是真實數據，只是不反映產品健康度。North star metric 的直譯「北極星指標」正確，但「公司方向」太籠統，應該更具體地說明是「反映產品核心價值的單一指標」。"),
                                Challenge.Option(id: "D", text: "Vanity metrics = 競爭對手的指標; North star metric = 內部使用的核心指標", explanation: "完全錯誤。Vanity metrics 是自家公司的指標（只是不有效的那些），和競爭對手無關。"),
                            ],
                            correctAnswer: "A",
                            hints: ["想想為什麼 VP 說 \"not just sign-ups\"——sign-ups 就是典型的 vanity metric，因為有人註冊不代表有人真的在用。", "North star metric 的關鍵是和「產品核心價值」直接相關。"],
                            explanation: "Vanity metrics 和 North star metric 是產品策略中的核心概念。Vanity metrics（虛榮指標）如總下載量、頁面瀏覽量——看起來漂亮但無法指導決策。North star metric（北極星指標）是整個團隊對齊的唯一核心指標，必須直接反映用戶是否獲得核心價值。例如 Airbnb 的北極星是 \"nights booked\"，Slack 的是 \"messages sent in first week\"。",
                            frameworkTip: "好的 North Star Metric 具備三個特質：(1) 反映用戶獲得的核心價值，(2) 是 leading indicator（領先指標），(3) 整個團隊能對齊行動。"
                        ),
                        Challenge(
                            id: 3,
                            name: "Stakeholder 溝通字彙",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個選項正確解釋了 \"buy-in\"、\"scope\"、\"one-pager\"、\"loop in\" 的意思？",
                            scenario: Challenge.Scenario(
                                title: "跨部門會議",
                                narrative: "你的 PM 在會後跟你說：\n\n\"I need to get buy-in from the engineering lead before we can scope this feature. Can you put together a one-pager with the user pain points, proposed solution, and success criteria? We should also loop in the design team for a feasibility check.\"\n\n你需要理解這段話的每個關鍵術語才能開始行動。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Buy-in = 獲得認同和支持; Scope = 定義功能的範圍和邊界; One-pager = 一頁摘要文件; Loop in = 把某人加入討論", explanation: "正確！Buy-in 是取得利害關係人的認同和支持（不是「購買」），Scope 當動詞用是「定義範圍」（如 scope the feature = 確定這個功能要做到什麼程度），One-pager 是業界常見的一頁式提案摘要，Loop in 是邀請某人加入溝通圈。"),
                                Challenge.Option(id: "B", text: "Buy-in = 購買服務; Scope = 功能範疇; One-pager = 單頁網站; Loop in = 循環反饋", explanation: "嚴重誤解。Buy-in 在商業場合是「認同/支持」不是「購買」，One-pager 是文件格式不是網站，Loop in 是「拉進來」不是「循環」。"),
                                Challenge.Option(id: "C", text: "Buy-in = 同意預算; Scope = 估算工時; One-pager = 一頁報告; Loop in = 安排會議", explanation: "Buy-in 不限於預算同意，也包括對方向和優先級的認同。Scope 是定義「範圍」不是「估算工時」（estimation 才是估算工時）。Loop in 是把人拉進來，不一定要開會。"),
                                Challenge.Option(id: "D", text: "Buy-in = 提前投入資源; Scope = 定義範圍; One-pager = 一頁摘要; Loop in = 通知", explanation: "Buy-in 不是「提前投入資源」而是「獲得對方的認同和支持」。Loop in 比「通知」更積極——是邀請參與，不只是告知。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Buy-in 的 \"buy\" 不是指花錢，而是比喻「買帳」——對方是否認同你的想法。", "Loop in = 把某人拉進訊息圈（想像一個溝通的圓環，你把人加進來）。"],
                            explanation: "這些是跨部門協作的日常用語。Buy-in（獲得認同）是推動任何專案的第一步，Scope（定義範圍）是工程協作的基礎，One-pager（一頁摘要）是最高效的提案格式，Loop in（拉進討論）是團隊溝通的基本動作。在科技公司工作，這些詞每天都會用到。",
                            frameworkTip: "跨部門協作流程用語：Get buy-in（取得認同）→ Scope the feature（定義範圍）→ Write a one-pager（寫提案）→ Loop in stakeholders（拉進相關人）→ Kick off（正式啟動）"
                        ),
                    ]
                ),
                Quest(
                    id: "50-3",
                    name: "Data/Analytics 字彙",
                    description: "掌握數據分析和實驗設計中常見的英文專業術語。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Funnel 與 Cohort",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組解釋最精確？",
                            scenario: Challenge.Scenario(
                                title: "分析日常",
                                narrative: "資深 analyst 同事在 code review 中給你的 SQL query 留言：\n\n\"Nice funnel analysis, but I think we should also look at this through a cohort lens. Can you break down the conversion funnel by monthly signup cohorts? This will help us see if the drop-off is specific to recent cohorts or a platform-wide trend.\"\n\n你需要完全理解這段回饋才能改善分析。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Funnel analysis = 分析用戶在各步驟的轉換率（如註冊→啟用→付費）; Cohort = 依某個共同特徵（如註冊月份）分組的用戶群體; Drop-off = 在漏斗某一步離開/流失; Platform-wide = 全平台範圍的", explanation: "正確！Funnel（漏斗）分析追蹤用戶通過各步驟的比例，Cohort（世代/群組）是按共同特徵分組的用戶，Drop-off 是在某步驟離開的行為，Platform-wide 表示影響整個平台而非特定群組。同事要你用 cohort 視角重新看 funnel，就是要分辨是「某批用戶」的問題還是「所有人」的問題。"),
                                Challenge.Option(id: "B", text: "Funnel analysis = 銷售漏斗分析; Cohort = 實驗組; Drop-off = 取消訂閱; Platform-wide = 跨平台", explanation: "Funnel 不限於銷售（也可以是產品使用漏斗），Cohort 不是實驗組（A/B test 的分組叫 treatment/control），Drop-off 是在漏斗中離開（不一定是取消訂閱），Platform-wide 是「全平台」不是「跨平台」。"),
                                Challenge.Option(id: "C", text: "Funnel analysis = 用戶路徑分析; Cohort = 按時間劃分的群組; Drop-off = 轉換率下降; Platform-wide = 平台級別的問題", explanation: "Cohort 不一定是按時間劃分（也可以按行為、地區等分組，只是按時間最常見），Drop-off 是「在某步離開」的行為本身，不是「轉換率下降」——轉換率下降可能有很多原因。"),
                                Challenge.Option(id: "D", text: "Funnel analysis = 漏斗圖分析; Cohort = 用戶分群; Drop-off = 跳出; Platform-wide = 平台通用", explanation: "Funnel analysis 是分析方法不只是圖表，Drop-off 和「跳出」（Bounce）不同——Bounce 通常指進入頁面後立刻離開，Drop-off 是在漏斗某步驟流失。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Cohort 的核心概念是「一群有共同特徵的人」，最常見的是按「註冊時間」分組。", "Drop-off 和 Bounce 不同——Bounce 是「立刻離開」，Drop-off 是「在漏斗某步流失」。"],
                            explanation: "Funnel + Cohort 是數據分析的兩大基礎視角。Funnel 讓你看到「哪一步流失最多人」，Cohort 讓你看到「哪一批人流失最多」。兩者結合（Cohort × Funnel）是最強大的分析方法——可以區分是「新功能導致新用戶流失」還是「整個平台都在流失」。",
                            frameworkTip: "Funnel 回答「在哪裡流失」，Cohort 回答「誰在流失」。兩者交叉分析（cohort × funnel）可以區分 platform-wide trend vs cohort-specific issue。"
                        ),
                        Challenge(
                            id: 2,
                            name: "A/B Test 字彙",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個選項對 \"statistical significance\"、\"p < 0.05\" 和 \"false positive rate\" 的解釋最正確？",
                            scenario: Challenge.Scenario(
                                title: "實驗設計審查",
                                narrative: "你設計了一個 A/B test，在實驗審查會議上，資深 Data Scientist 給了這段回饋：\n\n\"Your hypothesis is clear, but I have concerns about the sample size. With the current traffic allocation, you'll need at least 2 weeks to reach statistical significance at p < 0.05. Also, make sure you're not peeking at results before the experiment concludes — that inflates your false positive rate.\"\n\n你需要理解每個術語的意思才能回應。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Statistical significance = 實驗結果不太可能是隨機造成的; p < 0.05 = 觀察到的差異由隨機產生的機率低於 5%; False positive rate = 判定有效果但其實沒有的機率", explanation: "正確！Statistical significance 表示結果「統計上顯著」——不太可能是隨機波動。p-value < 0.05 是最常用的門檻，意思是「如果實際上沒有效果，看到這個（或更極端的）結果的機率低於 5%」。False positive 是「假陽性」——判定有效但實際無效。偷看結果（peeking）會增加 false positive rate。"),
                                Challenge.Option(id: "B", text: "Statistical significance = 結果很重要; p < 0.05 = 成功率 95%; False positive rate = 實驗失敗的機率", explanation: "全部錯誤。Statistical significance 是統計概念不是「重要」，p < 0.05 不是「95% 成功率」，False positive rate 不是「實驗失敗率」。這些是非常常見的誤解。"),
                                Challenge.Option(id: "C", text: "Statistical significance = 數據有統計學意義; p < 0.05 = 誤差小於 5%; False positive rate = 誤判為正面的比率", explanation: "「誤差小於 5%」不精確——p-value 不是「誤差率」，而是「在沒有效果的前提下，看到當前結果的機率」。「誤判為正面」的說法太籠統，在 A/B test 的脈絡中應具體指「判定 treatment 有效但實際上沒有效果」。"),
                                Challenge.Option(id: "D", text: "Statistical significance = 樣本量足夠; p < 0.05 = 隨機誤差小於 5%; False positive rate = 控制組表現異常的機率", explanation: "Statistical significance 和樣本量有關但不等同，p-value 不是「隨機誤差」，False positive 和控制組是否異常無關。"),
                            ],
                            correctAnswer: "A",
                            hints: ["p-value 的定義：「如果零假設為真（沒有效果），觀察到當前結果的機率。」", "Peeking（偷看）之所以危險，是因為每次看結果都相當於做了一次假設檢驗，增加了 false positive 的累積風險。"],
                            explanation: "A/B test 的核心統計概念：Statistical significance（統計顯著性）判定結果是否可信，p-value 是門檻（業界標準 < 0.05），False positive（假陽性）是最大風險。常見錯誤：(1) 認為 p < 0.05 = 95% 確定有效果（錯！），(2) 提早偷看結果就下結論（會膨脹 false positive rate）。",
                            frameworkTip: "A/B Test 關鍵術語：Hypothesis（假設）→ Sample size（樣本量）→ Traffic allocation（流量分配）→ Statistical significance（統計顯著性, p < 0.05）→ False positive/negative（假陽性/假陰性）→ Peeking（偷看結果，要避免！）"
                        ),
                        Challenge(
                            id: 3,
                            name: "Data Quality 字彙",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個選項最正確地解釋了 \"stale data\"、\"ETL\"、\"backfill\"、\"deduplication\" 和 \"sanity check\"？",
                            scenario: Challenge.Scenario(
                                title: "資料品質問題",
                                narrative: "你在做分析時發現數字怪怪的，跑去問 Data Engineer 同事。她看了一下說：\n\n\"Ah, this looks like a data quality issue. The upstream table has stale data — the ETL job failed silently last night and hasn't backfilled yet. Also, watch out for duplicates in the events table — there's a known issue with the deduplication logic. I'd suggest adding some sanity checks to your query before drawing any conclusions.\"\n\n你需要理解這些術語才能判斷你的分析是否可靠。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Stale data = 過期/未更新的資料; ETL = Extract-Transform-Load（資料擷取-轉換-載入的流程）; Backfill = 回填缺失的歷史資料; Deduplication = 去除重複資料; Sanity check = 基本合理性檢查", explanation: "正確！Stale data 指的是應該更新但沒有更新的陳舊資料。ETL 是資料工程的核心流程。Backfill 是補回缺失的資料。Deduplication 是去除重複記錄。Sanity check 是在做正式分析前，先做一些基本的合理性驗證（如 row count、null 比例、日期範圍等）。"),
                                Challenge.Option(id: "B", text: "Stale data = 被刪除的舊資料; ETL = 資料庫類型; Backfill = 資料備份; Deduplication = 資料壓縮; Sanity check = 安全性檢查", explanation: "全部錯誤。Stale data 不是「被刪除」而是「未更新」，ETL 是流程不是資料庫類型，Backfill 是「回填」不是「備份」，Deduplication 和壓縮無關，Sanity check 和安全無關。"),
                                Challenge.Option(id: "C", text: "Stale data = 無效資料; ETL = Extract-Transform-Load; Backfill = 重新處理所有歷史資料; Deduplication = 移除重複記錄; Sanity check = 品質檢查", explanation: "Stale data 是「未更新」不是「無效」——資料本身可能是對的，只是太舊。Backfill 是補回「缺失的」歷史資料，不是「重新處理所有」歷史資料。"),
                                Challenge.Option(id: "D", text: "Stale data = 過期資料; ETL = 資料管線的三個步驟; Backfill = 補齊遺漏的資料; Deduplication = 去重; Sanity check = 快速驗證資料是否合理", explanation: "這個選項大部分正確，但 ETL 不只是「資料管線的三個步驟」——它是一個特定的資料處理模式（Extract → Transform → Load），有些公司改用 ELT（先 Load 再 Transform）。不過整體來說這是第二好的答案。A 選項的定義更精準。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Stale 這個詞想像成「不新鮮的食物」——食物沒壞，但已經放太久不新鮮了。", "ETL 的三個字母分別代表三個步驟：Extract（擷取）→ Transform（轉換）→ Load（載入）。"],
                            explanation: "資料品質（Data Quality）是分析師的基本功。Stale data 是最常見的問題——ETL job 失敗導致資料沒更新。Backfill 是修復手段。Deduplication 避免重複計算。Sanity check（如 row count、null rate、date range check）應該成為每次分析的第一步，在發現問題後再深入挖掘。",
                            frameworkTip: "資料品質檢查清單（Sanity Checks）：(1) Row count 是否合理？(2) Date range 是否完整？(3) Null 比例是否異常？(4) 是否有 duplicates？(5) Key metrics 和已知值是否一致？"
                        ),
                    ]
                ),
                Quest(
                    id: "50-4",
                    name: "常見搭配與易混淆",
                    description: "搞清楚容易混淆的英文字彙和搭配用法，避免在專業場合出糗。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Affect vs Effect",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組填空最正確？",
                            scenario: Challenge.Scenario(
                                title: "寫分析報告",
                                narrative: "你正在寫一份分析報告，需要描述新功能上線對用戶行為的影響。你寫了這句話，但不確定用 affect 還是 effect：\n\n\"The new recommendation algorithm _____ user engagement significantly. The _____ was a 30% increase in average session duration.\"\n\n第一格和第二格分別應該填什麼？",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "第一格：affected（動詞：影響了）; 第二格：effect（名詞：影響/效果）", explanation: "正確！Affect 是動詞（to affect = 影響），Effect 是名詞（the effect = 影響/效果）。「The algorithm affected engagement」= 演算法影響了參與度。「The effect was a 30% increase」= 效果是 30% 的增長。記憶口訣：A for Action（Affect 是動作），E for End result（Effect 是結果）。"),
                                Challenge.Option(id: "B", text: "第一格：effected; 第二格：affect", explanation: "「Effected」作為動詞意思是「使之發生/實現」（如 effected change = 促成改變），不是「影響了」。「The affect」不自然——affect 很少當名詞用（只在心理學術語中偶爾出現）。"),
                                Challenge.Option(id: "C", text: "第一格：affected; 第二格：affect", explanation: "第一格正確（affected 動詞過去式），但第二格錯誤——「The affect was」不正確，affect 幾乎不當名詞用。應該用 effect。"),
                                Challenge.Option(id: "D", text: "第一格：had effect on; 第二格：effect", explanation: "第一格文法上應該是 \"had an effect on\"（缺少 an），而且原句的結構是「算法 _____ engagement」，直接用 affected 更簡潔精確。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Affect 通常是「動詞」（to affect = 去影響），Effect 通常是「名詞」（the effect = 那個影響）。", "記憶口訣：RAVEN — Remember: Affect is a Verb, Effect is a Noun。"],
                            explanation: "Affect vs Effect 是最常見的英文混淆之一。90% 的情況下：Affect = 動詞（影響），Effect = 名詞（效果/結果）。例外：Effect 偶爾當動詞用（to effect change = 促成改變），Affect 偶爾當名詞用（心理學：flat affect = 情感淡漠）。在商業寫作中，用 RAVEN 口訣就夠了。",
                            frameworkTip: "Affect vs Effect 速查：需要動詞 → affect（The change affected users）; 需要名詞 → effect（The effect was significant）。RAVEN: Remember, Affect = Verb, Effect = Noun。"
                        ),
                        Challenge(
                            id: 2,
                            name: "Insight vs Finding vs Observation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個配對是正確的？",
                            scenario: Challenge.Scenario(
                                title: "寫分析結論",
                                narrative: "你做完用戶行為分析後，要在報告中寫結論。你發現了三個不同層次的資訊：\n\n(1) 40% 的用戶在第三步離開了（這是你在數據中看到的事實）\n(2) 第三步的表單太長，導致用戶放棄填寫（這是你對原因的判斷）\n(3) 這表示我們應該用漸進式表單來降低用戶的心理負擔（這是你的策略建議）\n\n你想用 observation、insight 和 recommendation 來分別標示這三個層次。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Observation = 40% 的用戶在第三步離開（數據事實）; Insight = 表單太長導致放棄（原因判斷）; Recommendation = 用漸進式表單降低心理負擔（策略建議）", explanation: "正確！Observation 是你在數據中直接觀察到的事實（what happened），Insight 是你從 observation 中推導出的深層理解（why it happened），Recommendation 是基於 insight 提出的行動建議（what to do about it）。三者有清晰的邏輯層次。"),
                                Challenge.Option(id: "B", text: "Finding = 40% 在第三步離開; Insight = 表單太長; Observation = 應該用漸進式表單", explanation: "層次完全混亂。Observation（觀察）不會是策略建議。而且 Finding 和 Observation 在這個脈絡中含義接近，都指數據事實。"),
                                Challenge.Option(id: "C", text: "Insight = 40% 在第三步離開; Finding = 表單太長; Recommendation = 漸進式表單", explanation: "Insight 不應該只是一個數據事實。Insight 的核心是「深層理解」——你不只看到了什麼，更理解了為什麼。一個數字（40%）本身不是 insight，「為什麼是 40%」才是 insight。"),
                                Challenge.Option(id: "D", text: "Data point = 40% 在第三步離開; Insight = 表單太長且應用漸進式表單; Finding = 這是一個有效的改善方向", explanation: "Insight 不應該混入 recommendation（表單太長是 insight，漸進式表單是 recommendation）。Finding 用來描述「分析發現」不是「評估改善方向是否有效」。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Observation = What happened（看到了什麼），Insight = Why it happened（為什麼發生），Recommendation = What to do（怎麼做）。", "好的分析報告會清楚區分這三個層次，不會把「事實」和「判斷」混在一起。"],
                            explanation: "分析報告中最重要的區分：Observation/Finding（數據事實）→ Insight（深層理解/原因推斷）→ Recommendation（行動建議）。很多初級分析師會把 observation 當 insight 寫——列了一堆數字但沒有解釋「so what」。真正的 insight 要回答「為什麼」和「代表什麼」。",
                            frameworkTip: "分析結論三層次：Observation（What: 40% drop-off at step 3）→ Insight（Why: Form length creates friction）→ Recommendation（So what: Implement progressive disclosure form）"
                        ),
                        Challenge(
                            id: 3,
                            name: "Leverage vs Utilize vs Use",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組填空最精確地體現了三個詞的語意差異？",
                            scenario: Challenge.Scenario(
                                title: "用字精準度",
                                narrative: "你在寫英文履歷和面試中經常遇到一個困惑：什麼時候用 use、什麼時候用 utilize、什麼時候用 leverage？這三個詞看起來都是「使用」的意思，但其實有微妙的差異。\n\n看以下三個句子：\n(1) \"We _____ Python to build the data pipeline.\"\n(2) \"We _____ the existing infrastructure to reduce development time.\"\n(3) \"We _____ the free API tier to minimize costs during the pilot phase.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "(1) used (2) leveraged (3) utilized — Use = 一般使用; Leverage = 善用某物的優勢; Utilize = 有效利用（原本可能被忽略的資源）", explanation: "正確！Use 是最通用的「使用」。Leverage 暗示「借力使力」——善用某物的特定優勢來達成目標（如善用既有基礎設施的優勢）。Utilize 暗示「有效率地利用」——通常指把原本可能被浪費或忽略的資源善加利用（如利用免費方案來省錢）。"),
                                Challenge.Option(id: "B", text: "三個都用 used 就好，意思一樣", explanation: "文法上都可以用 used，但語意精確度不同。在面試和專業寫作中，用 leverage 和 utilize 可以更精準地傳達你的思考方式。"),
                                Challenge.Option(id: "C", text: "(1) utilized (2) used (3) leveraged", explanation: "(1) 用 Python 寫管線是很普通的「使用工具」，不需要用 utilized。(2) 善用既有基礎設施的優勢是 leverage 的精確場景。(3) 利用免費方案這種「可能被忽略的資源」更適合 utilize。"),
                                Challenge.Option(id: "D", text: "(1) leveraged (2) utilized (3) used", explanation: "(1) 用 Python 寫東西不需要 leverage（你沒有在「借力使力」）。(2) 既有基礎設施的情境更適合 leverage（善用已有的優勢）。(3) 利用免費方案更適合 utilize（把可能被忽略的資源有效利用）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Leverage 的原意是「槓桿」——用小力量撬動大效果。商業場合指「善用某物的優勢來達成目標」。", "Utilize 比 use 多了「有效率地利用（原本可能被浪費的資源）」的含義。"],
                            explanation: "三個「使用」的精確度差異：Use（通用）→ Utilize（有效利用，暗示資源原本可能被忽略）→ Leverage（善用優勢，暗示借力使力）。在履歷和面試中，精準選用這三個詞可以展現語言素養。但不要為了看起來高級就到處用 utilize 和 leverage——只在語意真正需要時使用。",
                            frameworkTip: "用字精準度：Use = 一般使用（最安全的選擇）; Utilize = 有效利用被忽略的資源; Leverage = 善用某物的優勢來達成更大目標。原則：能用 use 的地方就用 use，只在有明確「善用/借力」的語意時才升級。"
                        ),
                    ]
                ),
                Quest(
                    id: "50-5",
                    name: "字彙情境應用",
                    description: "在真實的商業情境中運用學過的字彙，確認你真的會用，而非只是「認得」。",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "寫週報",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪段週報用字最專業且精準？",
                            scenario: Challenge.Scenario(
                                title: "第一次寫英文週報",
                                narrative: "你的外商公司要求每週用英文寫 weekly update。你這週做了三件事：（1）完成了用戶流失的 cohort 分析，（2）和 PM 討論了新功能的 scope，（3）在 A/B test 結果達到 statistical significance 後和團隊分享了 insights。\n\n你需要用學過的字彙寫出專業的週報。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This week, I completed a cohort-based churn analysis, identifying that recent sign-up cohorts exhibit a 15% higher drop-off rate in the onboarding funnel. I also collaborated with the PM to scope the upcoming recommendation feature. Additionally, our search optimization A/B test reached statistical significance (p < 0.03), and I shared the key insights with the team — the treatment group showed a 12% lift in conversion rate.", explanation: "正確！完美運用了多個專業術語：cohort-based（基於世代分析的）、churn（流失）、drop-off rate（流失率）、onboarding funnel（引導漏斗）、scope（定義範圍）、statistical significance（統計顯著性）、treatment group（實驗組）、lift（提升）。每個術語都用在正確的語境中。"),
                                Challenge.Option(id: "B", text: "This week I did churn analysis for different user groups and found that new users leave more. I talked to the PM about the new feature plan. Also, the A/B test showed good results — conversion went up 12%.", explanation: "內容正確但用字太口語。「did churn analysis」不如 completed a cohort-based churn analysis 精準，「new users leave more」不如 exhibit higher drop-off rate 專業，「good results」太模糊，缺少 statistical significance 的提及。"),
                                Challenge.Option(id: "C", text: "I analyzed user churn by cohorts this week. Recent cohorts have higher attrition in onboarding. PM and I scoped the recommendation feature. The A/B test is statistically significant with 12% conversion improvement in the experiment group.", explanation: "內容大致正確但有幾個問題：「The A/B test is statistically significant」用現在式不如 reached statistical significance 精確（表示達到顯著性的時刻），「experiment group」應為 treatment group。整體較碎片化。"),
                                Challenge.Option(id: "D", text: "Weekly update: 1) Finished cohort analysis — churn is high for recent users. 2) Scoped new feature with PM. 3) A/B test results: conversion up 12%, p-value less than 0.05.", explanation: "格式像 bullet points 可接受，但「churn is high for recent users」太模糊（high 是多少？和什麼比？），「conversion up 12%」缺少 treatment group 的標示。週報的重點是讓讀者快速了解「你發現了什麼」和「所以呢」。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的週報不只列出你「做了什麼」，更要展現你「發現了什麼」——加入具體的 insights。", "「treatment group」是 A/B test 中「實驗組」的標準稱呼，不要用 experiment group。"],
                            explanation: "寫英文週報時，用字的精準度直接影響別人對你專業度的判斷。好的週報結構：[What I did] + [What I found/Key insight] + [Next steps/So what]。使用正確的領域術語（cohort-based、statistical significance、treatment group）會讓主管和同事更信任你的分析品質。",
                            frameworkTip: "英文週報公式：[Action: completed/delivered/collaborated on] + [Object: cohort analysis/feature scoping/A/B test] + [Key finding: identifying that.../revealing.../showing...] + [Quantified result: X% lift/reduction in metric]"
                        ),
                        Challenge(
                            id: 2,
                            name: "寫 Slack 訊息",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪段 Slack 訊息最專業且有效？",
                            scenario: Challenge.Scenario(
                                title: "即時溝通",
                                narrative: "你在分析過程中發現 dashboard 上的數字有問題——日活躍用戶（DAU）突然掉了 30%，但你懷疑是資料問題而非真實下降。你需要在 Slack 上通知 Data Engineering 團隊。\n\n你想傳達：（1）你發現了異常，（2）你初步判斷是資料問題，（3）請他們幫忙確認。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Hey Data Eng team 👋 Flagging a potential data quality issue — DAU on the main dashboard dropped 30% overnight, but I'm seeing normal traffic in the raw event logs. My guess is the ETL job may have failed or produced stale data. Could someone take a look and confirm? Happy to share the query I used for cross-referencing. Thanks!", explanation: "正確！「Flagging a potential issue」清楚表明目的，具體描述異常（DAU dropped 30% overnight）和你的初步調查（normal traffic in raw logs），用 ETL 和 stale data 展現你對資料架構的理解，禮貌地請求確認，並主動提供你的 query——展現協作精神。"),
                                Challenge.Option(id: "B", text: "Hi, the DAU number on the dashboard seems wrong. It dropped a lot. I think it's a data problem. Can you check?", explanation: "太簡略。沒有具體數字（「a lot」是多少？），沒有說明你做了什麼初步調查，也沒有提供任何線索幫助 Data Eng 團隊排查。"),
                                Challenge.Option(id: "C", text: "URGENT: DAU dropped 30% on the dashboard. This is likely a data pipeline issue. The ETL job probably failed. Please fix ASAP.", explanation: "語氣太命令式。你還不確定原因就說 \"likely\" 和 \"probably\"，然後要求 \"fix ASAP\" 既不禮貌也沒提供足夠資訊。Slack 溝通要尊重對方的判斷和時間。"),
                                Challenge.Option(id: "D", text: "I noticed something weird with the DAU numbers. They went down by 30% since yesterday. I checked the raw event data and it looks fine, so maybe the problem is between the raw data and the dashboard. What do you think?", explanation: "「something weird」太口語，「went down by 30% since yesterday」不如 dropped 30% overnight 精確。缺少技術術語（ETL、stale data）來幫助 Data Eng 團隊快速定位問題。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 bug report / data issue 報告包含：(1) 現象是什麼，(2) 你已經做了什麼初步調查，(3) 你的假設是什麼。", "在 Slack 上報告問題時，「Flagging a potential issue」比「Something seems wrong」更專業。"],
                            explanation: "在 Slack 上報告技術問題的黃金結構：（1）開場標示目的（Flagging a potential issue），（2）描述異常（DAU dropped 30% overnight），（3）你的初步調查（normal traffic in raw logs），（4）你的假設（ETL may have failed），（5）請求行動（Could someone take a look），（6）主動提供資源（Happy to share the query）。",
                            frameworkTip: "Slack 問題報告公式：[Flagging/Heads up on] [issue type] — [specific anomaly] + [what I've checked] + [my hypothesis: ETL/stale data/dedup] + [ask: could someone confirm?] + [offer to help]"
                        ),
                        Challenge(
                            id: 3,
                            name: "簡報口語表達",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪段口語表達最簡潔有力？",
                            scenario: Challenge.Scenario(
                                title: "在會議上報告分析結果",
                                narrative: "你需要在 product review 會議上報告你的用戶留存分析結果。你的主要發現是：完成 onboarding 的用戶，30 天留存率比未完成的高出 2.5 倍。你建議團隊投入資源優化 onboarding 體驗。\n\n你需要在 30 秒內清楚傳達這個 insight 和建議。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The key insight from the retention analysis is this: users who complete onboarding have a 30-day retention rate 2.5 times higher than those who don't. This tells us that onboarding completion is a strong leading indicator of long-term retention. My recommendation is to prioritize onboarding optimization as our next initiative.", explanation: "正確！「The key insight is this:」快速聚焦注意力，數據對比（2.5x higher）清晰有力，「This tells us that」橋接數據到意義，「leading indicator」展現分析深度，「My recommendation is to prioritize」給出明確行動建議。結構：Insight → Interpretation → Recommendation。"),
                                Challenge.Option(id: "B", text: "So I looked at our retention data and found that onboarding matters a lot. Users who finished onboarding stayed longer. Specifically, their 30-day retention was 2.5 times higher. So I think we should work on making onboarding better.", explanation: "「onboarding matters a lot」太空泛（什麼叫 matters?），「stayed longer」不精確（longer 是多久？），「work on making onboarding better」不夠具體。簡報中每個字都要有資訊量。"),
                                Challenge.Option(id: "C", text: "Based on my analysis of 30-day retention rates across different user segments, stratified by onboarding completion status, I found a statistically significant difference of approximately 2.5x between the two groups, suggesting a causal relationship between onboarding completion and long-term user retention, which I would recommend the team explore further through targeted optimization initiatives.", explanation: "太學術化且太長。一句話跑了 50 幾個字，聽眾到中間就迷路了。簡報的口語表達要短句、有節奏、有停頓。另外「suggesting a causal relationship」不精確——相關性不等於因果。"),
                                Challenge.Option(id: "D", text: "Users who complete onboarding are 2.5 times more likely to stay after 30 days. We should improve onboarding.", explanation: "數據清楚但太短——沒有解釋這個數據代表什麼（leading indicator），也沒有說明你的建議背後的邏輯。簡報的 sweet spot 是 3-4 句話。"),
                            ],
                            correctAnswer: "A",
                            hints: ["簡報口語的三步結構：Insight（數據發現）→ Interpretation（這代表什麼）→ Recommendation（所以該做什麼）。", "「leading indicator」是分析師展現深度的關鍵字——它表示你理解指標之間的因果鏈。"],
                            explanation: "在會議上報告分析結果，最佳結構是三句話：（1）核心發現 + 數據（The key insight is: 2.5x retention），（2）這代表什麼（leading indicator of long-term retention），（3）建議行動（prioritize onboarding optimization）。用 \"This tells us that\" 連接數據和意義，用 \"My recommendation is to\" 給出行動方向。",
                            frameworkTip: "簡報三句話公式：(1) The key insight is [data finding]. (2) This tells us that [interpretation/meaning]. (3) My recommendation is to [specific action]."
                        ),
                    ]
                ),
                Quest(
                    id: "50-6",
                    name: "Boss: 字彙綜合測驗",
                    description: "綜合測驗所有學過的 Business/Product/Data 字彙，確認你能在真實情境中正確運用。",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "情境綜合選擇",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "以下哪個分析和建議最全面且用字最精準？",
                            scenario: Challenge.Scenario(
                                title: "面試情境綜合題",
                                narrative: "你在面試某知名電商平台的 Product Analyst 職位。面試官給你看一段公司內部的數據摘要：\n\n\"In Q3, our top-of-funnel acquisition grew 25% YoY, driven primarily by paid channels. However, activation rate declined from 22% to 18%, and 30-day retention for the Oct cohort hit an all-time low of 28%. Meanwhile, our CAC increased by 40% due to rising ad costs, pushing the LTV/CAC ratio below 3:1. The product team hypothesizes that a recent onboarding redesign may have introduced friction that negatively affected the first value moment. An A/B test comparing the old and new onboarding flows reached statistical significance last week (p = 0.02), confirming that the new flow has a 15% lower activation rate.\"\n\n面試官問你：「Based on this data, what's happening and what would you recommend?」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "流量成長 25% 但激活率下降、留存率創新低、獲客成本上升——這代表公司在「花更多錢獲取更多用戶，但用戶品質和產品體驗在惡化」。A/B test 已經證實新的 onboarding flow 導致激活率下降 15%。建議：(1) 立即回滾 onboarding 設計，(2) 調查 paid channel 帶來的用戶品質是否下降，(3) 重新評估 CAC/LTV 結構是否可持續。", explanation: "正確！分析準確識別了核心矛盾（growth ≠ health），正確解讀了 A/B test 結果，三個建議分別對應 product（回滾）、acquisition quality（用戶品質）和 unit economics（CAC/LTV）。用字精準且邏輯完整。"),
                                Challenge.Option(id: "B", text: "公司成長很快但指標在下降。新的 onboarding 有問題，A/B test 證實了。建議修改 onboarding 設計並降低廣告支出。", explanation: "分析太表面——「成長很快但指標下降」沒有解釋核心矛盾是什麼。「降低廣告支出」可能不是對的建議（問題可能出在 channel mix 而非總支出）。"),
                                Challenge.Option(id: "C", text: "激活率從 22% 降到 18%，留存率只有 28%，CAC 漲了 40%。這些數字都在惡化。A/B test 的 p = 0.02 < 0.05 所以顯著。建議改回舊的 onboarding。", explanation: "只是重述了數字，沒有分析這些數字之間的關係和背後的含義。只建議「改回舊的」太單一——面試官期待你看到更大的圖景（acquisition quality、unit economics 等）。"),
                                Challenge.Option(id: "D", text: "問題很明確：新 onboarding 影響了激活率，連帶影響留存和 LTV。因為 CAC 也在上升，LTV/CAC 惡化。這是一個 product-led growth 的危機。建議做更多 A/B test 來找到最佳 onboarding 設計，同時優化付費渠道的 targeting 來降低 CAC。", explanation: "分析因果鏈正確，但「做更多 A/B test」太模糊（test 什麼？目標是什麼？），且已經有一個 A/B test 結果了，當務之急是根據結果行動而非再測試。"),
                            ],
                            correctAnswer: "A",
                            hints: ["面試官想聽的不只是「數字在下降」，而是「這些數字之間的關係是什麼，代表什麼系統性問題」。", "建議要分層次：短期（止血：回滾 onboarding）、中期（診斷：用戶品質）、長期（結構：unit economics）。"],
                            explanation: "這道題測試的是你能否在真實情境中正確理解和運用所有學過的術語：top-of-funnel、activation rate、cohort retention、CAC、LTV/CAC ratio、onboarding friction、first value moment、A/B test、statistical significance。更重要的是，你能否把這些散落的指標串成一個完整的故事，並給出分層的行動建議。",
                            frameworkTip: "面試分析框架：(1) 識別核心矛盾（growth vs health），(2) 串連指標之間的因果鏈（onboarding friction → activation ↓ → retention ↓ → LTV ↓），(3) 分層建議（短期止血 → 中期診斷 → 長期結構）。"
                        ),
                        Challenge(
                            id: 2,
                            name: "字彙應用寫作",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文寫一封 150-200 字的分析摘要 email，必須包含以下要素：\n\n1. **Subject line**：簡潔的信件主旨\n2. **Key finding**：用 observation → insight 的結構呈現發現\n3. **Data evidence**：包含至少 3 個本 World 學過的專業術語\n4. **Recommendation**：具體的行動建議和驗證方法\n5. **Next steps**：你打算做什麼\n\n請盡量使用這三個 World 學過的所有字彙：cohort、funnel、retention、churn、first value moment、A/B test、statistical significance、paywall、stakeholder 等。",
                            scenario: Challenge.Scenario(
                                title: "寫一封分析摘要 email",
                                narrative: "你剛完成一份重要的分析，需要寫一封英文 email 給你的主管和相關 stakeholders，摘要你的分析發現和建議。\n\n背景：你分析了公司的用戶留存問題，發現 Q3 的 30-day retention 從 42% 降到 33%。經過 cohort 分析和 funnel 分析，你找到了根本原因：新的付費牆（paywall）設計在用戶第一次使用產品的第二天就出現，嚴重影響了 first value moment。你建議將 paywall 延後到第七天出現，並用 A/B test 驗證。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["專業 email 的結構：Finding → Insight → Recommendation → Next Steps。和分析報告的結構一樣。"],
                            explanation: "這封 email 測試的是你能否在真實商業溝通中正確運用所有學過的字彙。關鍵不只是「用了多少術語」，而是每個術語是否用在正確的脈絡中。email 的結構（Observation → Insight → Recommendation → Next Steps）也對應了分析師最核心的溝通框架。",
                            frameworkTip: "分析摘要 email 框架：Subject（一句話點出主題和重點）→ Observation（數據事實）→ Insight（深層原因）→ Recommendation（具體行動 + 驗證方法）→ Next Steps（你會做什麼）。用字精準、數據具體、建議可執行。"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 51,
            name: "口說句型練習",
            emoji: "🗣️",
            description: "掌握職場英文口說的關鍵句型，讓你在面試與會議中自信表達",
            quests: [
                Quest(
                    id: "51-1",
                    name: "解釋 Explain",
                    description: "學會用英文清楚解釋原因、邏輯與機制",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "解釋原因",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個英文表達最自然且專業？",
                            scenario: Challenge.Scenario(
                                title: "面試解釋離職原因",
                                narrative: "你正在面試一家科技公司的 Product Analyst 職位。面試官問你為什麼離開上一份工作。你想表達「因為我想要更多跨部門合作的機會」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Because I want more chance to cooperate with other departments.", explanation: "文法尚可但 \"cooperate\" 偏正式且不常用於此情境；\"chance\" 應為 \"opportunities\"。"),
                                Challenge.Option(id: "B", text: "The reason is that I was looking for more cross-functional collaboration opportunities.", explanation: "正確！\"The reason is that...\" 是經典的解釋句型，\"cross-functional collaboration\" 是業界標準用語。"),
                                Challenge.Option(id: "C", text: "I leave because I don't like working alone in my team.", explanation: "語氣負面（\"don't like\"），且時態錯誤（應用過去式 \"left\"）。面試避免批評前公司。"),
                                Challenge.Option(id: "D", text: "The reason why is I need to have more teamwork with other team.", explanation: "\"The reason why is\" 文法冗贅；\"more teamwork with other team\" 表達不精確。"),
                            ],
                            correctAnswer: "B",
                            hints: ["面試中解釋動機要正面積極", "\"cross-functional\" 是職場常用詞彙"],
                            explanation: "\"The reason is that...\" 後接完整子句，是英文中解釋原因最清楚的句型之一。搭配 \"cross-functional collaboration\" 而非 \"cooperate with other departments\"，展現你熟悉業界用語。",
                            frameworkTip: "解釋句型公式：The reason is that + [正面動機]. 永遠用正面框架，不說「離開因為不喜歡」而說「追求更好的機會」。"
                        ),
                        Challenge(
                            id: 2,
                            name: "解釋因果關係",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪句最能清楚解釋因果關係？",
                            scenario: Challenge.Scenario(
                                title: "向主管解釋 DAU 下降",
                                narrative: "你是 Data Analyst，在週會上需要解釋為什麼產品的 DAU（日活躍用戶數）上週下降了 12%。你已經分析過資料，發現是因為 app 更新後的 bug 導致部分用戶無法登入。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "DAU dropped because there was a bug.", explanation: "太簡略，沒有說明 bug 的影響路徑。在工作報告中需要更具體。"),
                                Challenge.Option(id: "B", text: "This is because the latest app update introduced a login bug, which prevented approximately 15% of users from accessing the app.", explanation: "正確！\"This is because...\" 連接因果，具體說明了 bug 的類型（login bug）和影響範圍（15% of users）。"),
                                Challenge.Option(id: "C", text: "The reason of DAU drop is the bug problem after update.", explanation: "\"reason of\" 文法錯誤（應為 \"reason for\"）；\"bug problem\" 冗贅；語句不完整。"),
                                Challenge.Option(id: "D", text: "I think maybe it's because of the update thing.", explanation: "\"I think maybe\" 太不確定；\"update thing\" 不夠專業。資料分析師應該用數據說話。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"This is because...\" 是職場報告中常用的因果連接句型", "好的解釋要包含具體細節和量化影響"],
                            explanation: "\"This is because...\" 後面接具體原因，是最直接的因果解釋方式。在數據報告中，要附上具體影響（\"prevented approximately 15% of users\"），讓聽眾理解嚴重程度。",
                            frameworkTip: "因果解釋公式：[現象描述] + This is because + [具體原因] + which [量化影響]"
                        ),
                        Challenge(
                            id: 3,
                            name: "解釋概念",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個解釋最清楚且適合對非技術聽眾說？",
                            scenario: Challenge.Scenario(
                                title: "向非技術同事解釋 A/B Testing",
                                narrative: "行銷部門的同事問你：「你們 PM 一直說 A/B testing，那到底是什麼？」你需要用簡單的英文解釋這個概念。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "What this means is we show two different versions of a page to two groups of users, and then measure which one performs better based on a specific metric.", explanation: "正確！\"What this means is...\" 開頭自然帶入解釋，用簡單語言拆解概念，不用術語。"),
                                Challenge.Option(id: "B", text: "A/B testing is a statistical hypothesis testing methodology that uses randomized controlled experiments.", explanation: "對非技術同事來說太學術了，充滿專業術語，無法達到溝通目的。"),
                                Challenge.Option(id: "C", text: "It means we test A and B to see which is good.", explanation: "太簡略，沒說明「A 和 B 是什麼」以及「怎麼判斷好壞」。"),
                                Challenge.Option(id: "D", text: "So basically what it is, is like, we just try two things and see what happens.", explanation: "口語化到不專業的程度，\"like\" 和 \"just\" 削弱了可信度。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"What this means is...\" 是解釋概念的萬用句型", "對非技術聽眾要避免術語，用具體動作描述"],
                            explanation: "\"What this means is...\" 是職場中解釋概念的黃金句型。它暗示「讓我幫你翻譯成好懂的說法」，後面接簡單具體的描述。注意要包含：做什麼（show two versions）、對象（two groups）、目的（measure which performs better）。",
                            frameworkTip: "概念解釋公式：What this means is + [簡單動作] + [對象] + [目的/結果]"
                        ),
                    ]
                ),
                Quest(
                    id: "51-2",
                    name: "比較 Compare",
                    description: "用英文精準表達事物之間的差異與取捨",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "產品比較",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個表達方式最精準且專業？",
                            scenario: Challenge.Scenario(
                                title: "比較兩個 BI 工具",
                                narrative: "你的團隊在評估要用 Tableau 還是 Looker 作為公司的 BI 工具。主管請你在會議上簡要比較兩者。你想表達「跟 Tableau 比起來，Looker 更適合需要即時數據的團隊」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Compared to Tableau, Looker is better for teams that need real-time data, since it connects directly to the database rather than relying on extracts.", explanation: "正確！\"Compared to X, Y is...\" 搭配具體原因（connects directly vs. extracts），有理有據。"),
                                Challenge.Option(id: "B", text: "Looker is more better than Tableau for real-time data.", explanation: "\"more better\" 是經典文法錯誤（應為 \"better\"），且缺乏解釋原因。"),
                                Challenge.Option(id: "C", text: "Tableau is not as good as Looker because Looker is newer.", explanation: "\"newer\" 不是有效的技術比較依據；\"not as good as\" 語氣偏主觀。"),
                                Challenge.Option(id: "D", text: "Between Tableau with Looker, I think Looker is good for real-time.", explanation: "\"Between X with Y\" 介系詞錯誤（應為 \"and\"）；\"I think... is good\" 不夠精確。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"Compared to X, Y is...\" 是最正式的比較句型", "好的比較要說明「為什麼」而不只是「哪個好」"],
                            explanation: "\"Compared to X, Y is [adj] for [use case], since [reason]\" 是完整的專業比較句型。關鍵是不只說結論，還要給出技術原因（connects directly to database vs. relying on extracts）。",
                            frameworkTip: "比較句型公式：Compared to [A], [B] is [更適合的描述] for [情境], since [具體原因]"
                        ),
                        Challenge(
                            id: 2,
                            name: "方案差異比較",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪句最能呈現「客觀差異」而非「主觀偏好」？",
                            scenario: Challenge.Scenario(
                                title: "討論 Agile vs Waterfall",
                                narrative: "在面試中，面試官問你 Agile 和 Waterfall 的差異。你想清楚表達兩者的核心差異，而不是說一個「比較好」。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Agile is good and Waterfall is bad because Agile is more flexible.", explanation: "太主觀且二元化。面試中這種回答會讓人覺得你缺乏深度。"),
                                Challenge.Option(id: "B", text: "The key difference is that Agile delivers in short iterations and embraces changing requirements, while Waterfall follows a sequential process with fixed scope upfront.", explanation: "正確！\"The key difference is that...\" 引導客觀對比，用 \"while\" 連接兩邊，描述具體差異而非好壞。"),
                                Challenge.Option(id: "C", text: "Agile and Waterfall are different project management ways. Agile is faster.", explanation: "\"different ways\" 太籠統；\"faster\" 不準確，Agile 不一定更快，而是更頻繁交付。"),
                                Challenge.Option(id: "D", text: "I prefer Agile more than Waterfall because it is more modern.", explanation: "面試問差異時不應只談個人偏好。\"more modern\" 不是技術分析。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"The key difference is that...\" 適合客觀分析", "\"while\" 可以優雅地對比兩個事物"],
                            explanation: "\"The key difference is that A [特點], while B [特點]\" 是呈現客觀差異的黃金句型。用 \"while\" 而非 \"but\"，語氣更平衡，不暗示哪個較好。描述具體行為差異（iterations vs. sequential）而非主觀評價。",
                            frameworkTip: "客觀比較公式：The key difference is that [A 特點描述], while [B 特點描述]. 避免 good/bad，聚焦行為差異。"
                        ),
                        Challenge(
                            id: 3,
                            name: "取捨比較",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回答最能展現你的分析思維？",
                            scenario: Challenge.Scenario(
                                title: "討論 Build vs Buy 決策",
                                narrative: "你在 PM 面試中被問到：「你的團隊要加一個推薦系統功能，你會建議自建還是買第三方服務？」你想表達兩者的 trade-off。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "While building in-house gives us full control over customization and data, it requires significant engineering resources. On the other hand, a third-party solution gets us to market faster but may limit our ability to differentiate.", explanation: "正確！用 \"While A gives us [優點], it [缺點]. On the other hand, B [優點] but [缺點]\" 展現了完整的 trade-off 分析。"),
                                Challenge.Option(id: "B", text: "I think we should build it ourselves because it's better.", explanation: "沒有分析 trade-off，直接下結論且沒有理由。"),
                                Challenge.Option(id: "C", text: "Building is hard and buying is easy, so we should buy.", explanation: "\"hard\" 和 \"easy\" 過於簡化，真實決策需考慮更多面向。"),
                                Challenge.Option(id: "D", text: "Both have pros and cons, it depends on the situation.", explanation: "雖然方向對，但太空泛。面試官期待你展開具體分析。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"While A... , ... On the other hand, B...\" 可以組織 trade-off 分析", "好的分析要同時提到兩邊的優缺點"],
                            explanation: "這個句型結合了讓步（While）和轉折（On the other hand），完美呈現 trade-off。每一邊都有優點和缺點，展現了成熟的分析能力。注意用具體詞彙：customization、engineering resources、time-to-market、differentiate。",
                            frameworkTip: "Trade-off 句型：While [A 優點], it [A 缺點]. On the other hand, [B 優點] but [B 缺點]. 最後可加：My recommendation would depend on [決策因素]."
                        ),
                    ]
                ),
                Quest(
                    id: "51-3",
                    name: "推薦 Recommend",
                    description: "學會用英文提出專業建議與推薦方案",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "數據驅動推薦",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個推薦最專業且有說服力？",
                            scenario: Challenge.Scenario(
                                title: "推薦行銷預算分配",
                                narrative: "你是 Data Analyst，分析完各管道的 ROAS（Return on Ad Spend）後，需要向行銷主管推薦下季的預算分配方式。數據顯示 Google Ads 的 ROAS 是 4.2x，而 Facebook Ads 只有 1.8x。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Based on the data, I'd recommend shifting 30% of our Facebook budget to Google Ads, where we're seeing a 4.2x return compared to 1.8x on Facebook.", explanation: "正確！\"Based on the data, I'd recommend...\" 加上具體數字與比較，既有禮貌又有數據支撐。"),
                                Challenge.Option(id: "B", text: "We must move all money from Facebook to Google because Google is better.", explanation: "\"must\" 太強硬；\"all money\" 太極端；\"better\" 不夠具體。"),
                                Challenge.Option(id: "C", text: "I think maybe we could try to use more Google Ads if that's okay.", explanation: "\"I think maybe... if that's okay\" 太過猶豫不決，削弱了數據分析師的專業可信度。"),
                                Challenge.Option(id: "D", text: "My suggest is that Google Ads is more good than Facebook Ads.", explanation: "\"suggest\" 此處應用 \"suggestion\"（名詞）；\"more good\" 文法錯誤（應為 \"better\"）。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"Based on the data\" 建立推薦的可信度", "好的推薦要有具體的行動建議和數據支撐"],
                            explanation: "\"Based on the data, I'd recommend [具體行動]\" 是最強的數據驅動推薦句型。\"I'd recommend\" 比 \"I think\" 更有信心，同時 \"I'd\"（would）保持禮貌。附上具體數字（30%、4.2x vs 1.8x）讓推薦有根據。",
                            frameworkTip: "數據推薦公式：Based on [數據/分析], I'd recommend [具體行動], where/since [數據支撐]"
                        ),
                        Challenge(
                            id: 2,
                            name: "工具推薦",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個表達方式最適合在團隊會議上使用？",
                            scenario: Challenge.Scenario(
                                title: "向團隊推薦專案管理工具",
                                narrative: "你的團隊目前用 spreadsheet 追蹤專案進度，經常漏掉任務。主管請你評估後推薦一個專案管理工具。你認為 Linear 最適合你們這種 10 人工程團隊。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "I'd suggest we adopt Linear for our project tracking. It's designed specifically for engineering teams, supports sprint planning out of the box, and integrates with our existing GitHub workflow.", explanation: "正確！\"I'd suggest...\" 語氣適中，三個理由層次分明（定位、功能、整合），有說服力。"),
                                Challenge.Option(id: "B", text: "We should definitely use Linear because everyone uses it.", explanation: "\"everyone uses it\" 是訴諸群眾的錯誤論證，且 \"definitely\" 語氣太強硬。"),
                                Challenge.Option(id: "C", text: "My recommendation would be that we don't use spreadsheet anymore because it is very bad.", explanation: "只批評現狀但沒有正面推薦替代方案，語氣也太負面。"),
                                Challenge.Option(id: "D", text: "How about if we can maybe use Linear or something like that?", explanation: "太過猶豫，\"or something like that\" 顯得你自己都不確定。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"I'd suggest...\" 是禮貌但有信心的推薦句型", "列出 2-3 個具體理由能增加說服力"],
                            explanation: "\"I'd suggest we [行動]\" 比 \"I think we should\" 更專業。推薦工具時，列出三個面向：它是什麼（designed for engineering teams）、它能做什麼（supports sprint planning）、它怎麼融入現有流程（integrates with GitHub）。",
                            frameworkTip: "工具推薦三層結構：I'd suggest [工具] + ① 定位（designed for...）② 功能（supports...）③ 整合（integrates with...）"
                        ),
                        Challenge(
                            id: 3,
                            name: "策略推薦",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回答結構最好？",
                            scenario: Challenge.Scenario(
                                title: "推薦用戶留存策略",
                                narrative: "你在 PM 面試中被問到：「如果你發現 Day-7 retention 從 40% 下降到 28%，你會推薦什麼策略？」你想展現結構化的推薦能力。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Based on the 12-point drop in D7 retention, my recommendation would be a three-pronged approach: first, analyze the user journey to identify where drop-off occurs; second, implement targeted push notifications for users who haven't returned after Day 3; and third, A/B test an improved onboarding flow.", explanation: "正確！\"My recommendation would be...\" 開頭，用 \"three-pronged approach\" + \"first... second... third...\" 結構清晰，每步都是具體可執行的。"),
                                Challenge.Option(id: "B", text: "We need to fix the retention problem quickly by adding more features.", explanation: "\"add more features\" 太籠統，沒有分析原因就急著給解法。"),
                                Challenge.Option(id: "C", text: "I recommend to send more notifications to users.", explanation: "\"recommend to send\" 文法錯誤（應為 \"recommend sending\" 或 \"recommend that we send\"）；只有一個策略太單薄。"),
                                Challenge.Option(id: "D", text: "In my opinion, retention is very important so we should work on it more.", explanation: "完全沒有具體策略，只是重述問題的重要性。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"My recommendation would be...\" 適合正式的策略推薦", "結構化回答：先量化問題，再分步驟給建議"],
                            explanation: "\"My recommendation would be a [形容詞]-pronged approach\" 是高階的推薦句型，暗示你的建議經過深思熟慮。搭配 \"first... second... third...\" 讓聽眾容易跟上。注意每步都要是 actionable 的（analyze、implement、A/B test），不只是概念。",
                            frameworkTip: "策略推薦公式：My recommendation would be a [N]-pronged approach: first, [分析]... second, [行動]... third, [驗證]..."
                        ),
                    ]
                ),
                Quest(
                    id: "51-4",
                    name: "描述 Describe",
                    description: "用英文精確描述產品、流程與功能",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "描述產品",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個描述最清楚且專業？",
                            scenario: Challenge.Scenario(
                                title: "面試中描述你做過的產品",
                                narrative: "面試官問你：「Can you describe a product you've worked on?」你之前做過一個內部的資料視覺化平台，幫助業務團隊自助產出報表。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "It's a platform that enables the sales team to build self-service dashboards by connecting to our data warehouse, reducing their dependency on the analytics team by about 60%.", explanation: "正確！\"It's a platform that enables [誰] to [做什麼] by [怎麼做], [量化成果]\" 結構完整。"),
                                Challenge.Option(id: "B", text: "It's a data thing that our sales people use to see data.", explanation: "\"data thing\" 和 \"see data\" 太模糊，完全沒展現你的專業度。"),
                                Challenge.Option(id: "C", text: "I made a dashboard system using React and D3.js with PostgreSQL database backend.", explanation: "面試中描述產品應該從用戶價值出發，不是技術架構。除非面試官問技術細節。"),
                                Challenge.Option(id: "D", text: "It's a very useful tool that many people like to use in our company.", explanation: "\"very useful\" 和 \"many people like\" 完全沒有具體資訊。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"It's a [type] that enables [users] to [action]\" 是描述產品的經典句型", "好的產品描述要包含：對象、功能、價值"],
                            explanation: "\"It's a [產品類型] that enables [用戶] to [核心動作] by [實現方式]\" 是矽谷產品描述的標準句型。最後加上量化成果（reducing dependency by 60%），讓描述更有力。",
                            frameworkTip: "產品描述公式：It's a [type] that enables [users] to [action] by [method], resulting in [quantified impact]"
                        ),
                        Challenge(
                            id: 2,
                            name: "描述流程",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個描述方式最清楚？",
                            scenario: Challenge.Scenario(
                                title: "描述資料分析流程",
                                narrative: "在面試中，面試官問你：「Walk me through your typical data analysis workflow.」你需要描述從拿到問題到交付 insight 的流程。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "The workflow involves four main steps: first, I clarify the business question with stakeholders; then, I pull and clean the relevant data using SQL; next, I explore patterns and test hypotheses in Python; and finally, I present findings with actionable recommendations.", explanation: "正確！\"The workflow involves [N] main steps: first... then... next... finally...\" 結構清晰，每步都有具體動作。"),
                                Challenge.Option(id: "B", text: "I just use SQL and Python to analyze data and then make some charts.", explanation: "\"just\" 削弱專業度；跳過了最重要的 business understanding 和 communication 步驟。"),
                                Challenge.Option(id: "C", text: "My workflow is that I get data, analyze it, and report findings.", explanation: "太概略，每個分析師都可以這樣說，沒有展現你的方法論。"),
                                Challenge.Option(id: "D", text: "First of all, I will collect the data. Second of all, I will process it. Third of all, I will analyze.", explanation: "\"Second of all\" 和 \"Third of all\" 不是正確用法（英文沒有這種說法）；只列動作沒有細節。"),
                            ],
                            correctAnswer: "A",
                            hints: ["\"The workflow involves...\" 是描述流程的專業開頭", "用 first... then... next... finally... 串連步驟"],
                            explanation: "\"The workflow involves [N] main steps\" 先告訴聽眾會有幾個步驟，降低認知負荷。接著用 first → then → next → finally 的連接詞串連，每步都用 \"I + 動詞 + 具體內容\" 展現專業度。",
                            frameworkTip: "流程描述公式：The workflow involves [N] main steps: first, I [動作+細節]; then, I [動作+細節]; next... finally..."
                        ),
                        Challenge(
                            id: 3,
                            name: "描述功能",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個描述最適合對非技術利害關係人說？",
                            scenario: Challenge.Scenario(
                                title: "向利害關係人描述新功能",
                                narrative: "你是 PM，在 sprint review 上向利害關係人展示新開發的「智慧搜尋」功能。這個功能讓用戶可以用自然語言搜尋產品目錄，背後用了語意搜尋技術。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "This feature uses NLP-based semantic search with vector embeddings to match user queries against product descriptions in our Elasticsearch cluster.", explanation: "對非技術聽眾來說太技術了，充滿術語。Sprint review 通常有多種背景的人。"),
                                Challenge.Option(id: "B", text: "This feature enables users to search for products using natural language — for example, instead of typing exact keywords like \"red running shoes size 10,\" they can simply type \"comfortable shoes for morning jogs\" and get relevant results.", explanation: "正確！\"This feature enables users to [動作]\" + 具體例子，讓非技術聽眾立刻理解價值。"),
                                Challenge.Option(id: "C", text: "This feature makes search better.", explanation: "完全沒有說明「怎麼 better」，聽眾無法理解改進在哪。"),
                                Challenge.Option(id: "D", text: "We builded a new search that is very smart and can understand what users want.", explanation: "\"builded\" 文法錯誤（應為 \"built\"）；\"very smart\" 不是專業用語。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"This feature enables users to...\" 是描述功能的標準句型", "用具體例子（before/after）幫助聽眾理解"],
                            explanation: "\"This feature enables users to [動作]\" 是功能描述的核心句型。對非技術聽眾的關鍵技巧是用 \"for example\" 接一個具體的 before/after 對比，讓抽象功能變成可感知的體驗改善。",
                            frameworkTip: "功能描述公式：This feature enables users to [動作] — for example, instead of [舊方式], they can [新方式]."
                        ),
                    ]
                ),
                Quest(
                    id: "51-5",
                    name: "Boss: 情境口說綜合",
                    description: "綜合運用解釋、比較、推薦、描述四大口說句型",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "產品提案口說",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文寫一段 200-300 字的提案，需包含以下四個部分：\n1. 用 \"This is because...\" 或 \"The reason is...\" 解釋續約率下降的原因\n2. 用 \"It's a feature that enables...\" 描述你的提案\n3. 用 \"Compared to...\" 或 \"The key difference is...\" 和替代方案比較\n4. 用 \"Based on the data, I'd recommend...\" 做出推薦",
                            scenario: Challenge.Scenario(
                                title: "向 VP 提案新功能",
                                narrative: "你是一家 B2B SaaS 公司的 Product Analyst。VP of Product 給你 3 分鐘，讓你提案一個可以提升企業客戶續約率（目前 82%，目標 90%）的新功能。你需要：\n\n1. 解釋為什麼續約率下降（用數據）\n2. 描述你提案的功能\n3. 和替代方案做比較\n4. 給出你的推薦\n\n請用英文撰寫你的 3 分鐘提案講稿。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先用數據點出問題，再層層推進到解法", "記得四個句型都要用到：explain → describe → compare → recommend"],
                            explanation: "這道題考驗你能否在限定時間內，用結構化的英文句型組織一個完整的提案。優秀的提案遵循「問題→原因→方案→比較→推薦」的邏輯鏈，每一段都有對應的口說句型支撐。",
                            frameworkTip: "3 分鐘提案結構：Problem（30s, explain）→ Solution（60s, describe）→ Why This Over Alternatives（45s, compare）→ Recommendation（45s, recommend）"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 52,
            name: "專業閱讀",
            emoji: "📖",
            description: "讀懂 JD、技術文件、PRD 和資料報告，提升職場英文閱讀力",
            quests: [
                Quest(
                    id: "52-1",
                    name: "Job Description 閱讀",
                    description: "學會解讀 JD 中的必備條件、加分項與隱藏訊息",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "必備 vs 加分",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "根據這段 JD，以下哪項是「必備條件」（Requirements）而非「加分條件」（Nice to Have）？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 Data Analyst JD",
                                narrative: "你在 LinkedIn 上看到一個 Data Analyst 職位，以下是 JD 的部分內容：\n\n\"Requirements:\n- 2+ years of experience in data analysis or a related quantitative field\n- Strong proficiency in SQL; ability to write complex queries involving window functions, CTEs, and subqueries\n- Experience with Python or R for statistical analysis\n- Excellent communication skills with the ability to translate data findings into business recommendations\n\nNice to Have:\n- Experience with dbt or similar data transformation tools\n- Familiarity with Looker, Tableau, or similar BI platforms\n- Background in e-commerce or marketplace businesses\n- Experience with A/B testing frameworks and experimental design\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "有 dbt 使用經驗", explanation: "dbt 明確列在 \"Nice to Have\" 區塊中，是加分項不是必備。"),
                                Challenge.Option(id: "B", text: "能把數據發現轉化為商業建議", explanation: "正確！\"translate data findings into business recommendations\" 列在 Requirements 中，是必備溝通能力。許多人忽略 soft skill 也是 requirement。"),
                                Challenge.Option(id: "C", text: "有電商或 marketplace 相關背景", explanation: "這列在 \"Nice to Have\"，是加分的產業經驗。"),
                                Challenge.Option(id: "D", text: "有 A/B testing 經驗", explanation: "A/B testing 列在 \"Nice to Have\"，不是必備條件。"),
                            ],
                            correctAnswer: "B",
                            hints: ["仔細看 Requirements 和 Nice to Have 的分界", "溝通能力（communication skills）也可以是 Requirement"],
                            explanation: "JD 的 Requirements 和 Nice to Have 是明確的分界。\"Excellent communication skills with the ability to translate data findings into business recommendations\" 在 Requirements 下，代表這是面試必考的能力。很多求職者只關注技術 requirements 而忽略 soft skills。",
                            frameworkTip: "JD 解讀規則：Requirements = 面試會考 / Nice to Have = 有的話加分。注意 soft skill requirements 往往被低估但面試必問。"
                        ),
                        Challenge(
                            id: 2,
                            name: "解碼企業語言",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "這段 JD 暗示的公司文化最可能是什麼？",
                            scenario: Challenge.Scenario(
                                title: "解讀 JD 中的隱藏訊息",
                                narrative: "你看到一個 Product Manager 職位的 JD，裡面寫著：\n\n\"About the Role:\n- You will wear many hats and thrive in ambiguity\n- We're looking for someone who is comfortable with a fast-paced, rapidly changing environment\n- You'll work closely with engineering, design, and data teams to ship features end-to-end\n- Strong bias for action — we value speed over perfection\n- This is an individual contributor role reporting directly to the CPO\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "大企業，有完善的流程和明確的分工", explanation: "\"wear many hats\"（身兼多職）和 \"thrive in ambiguity\" 正好相反，這些暗示不會有很明確的分工。"),
                                Challenge.Option(id: "B", text: "早期新創，節奏快、資源少、需要多功能型人才", explanation: "正確！\"wear many hats\"= 一人多職；\"thrive in ambiguity\"= 事情常不確定；\"speed over perfection\"= 快速迭代；\"IC reporting to CPO\"= 團隊很小。這些都是典型早期新創的訊號。"),
                                Challenge.Option(id: "C", text: "成熟公司正在進行數位轉型", explanation: "JD 沒有提到轉型、legacy system 或 modernization 等關鍵字。"),
                                Challenge.Option(id: "D", text: "外商在台灣的分支辦公室", explanation: "JD 內容與是否為外商分支無關，這些特徵更指向組織規模和文化。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"wear many hats\" 和 \"thrive in ambiguity\" 是什麼類型公司的常見用語？", "\"reporting directly to CPO\" 暗示團隊結構如何？"],
                            explanation: "學會解碼 JD 的企業語言：\n• \"wear many hats\" = 你會做很多不同的事（團隊小）\n• \"thrive in ambiguity\" = 很多事情沒有 SOP\n• \"bias for action\" = 先做再說\n• \"IC reporting to CPO\" = 中間沒有管理層 = 早期團隊\n這些不是壞事，但你要知道自己在申請什麼。",
                            frameworkTip: "JD 暗語對照表：wear many hats = 一人多職 / thrive in ambiguity = 沒有 SOP / fast-paced = 工作量大 / bias for action = 先做再改 / IC to C-level = 團隊很小"
                        ),
                        Challenge(
                            id: 3,
                            name: "年資要求判讀",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪個理解最正確？",
                            scenario: Challenge.Scenario(
                                title: "判斷是否該投這個職位",
                                narrative: "你是即將畢業的碩士生，看到以下 JD：\n\n\"Business Analyst — Growth Team\n\nRequirements:\n- Bachelor's degree in business, economics, computer science, or related field; Master's degree preferred\n- 1-3 years of experience in business analysis, consulting, or related field (internship experience counts)\n- Proficiency in SQL and Excel; experience with Python is a plus\n- Strong analytical thinking and problem-solving skills\n- Ability to work independently and manage multiple projects simultaneously\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "需要 3 年正式工作經驗，碩士應屆生不該投", explanation: "\"1-3 years\" 是範圍，而且明確寫了 \"internship experience counts\"，碩士生是完全可以投的。"),
                                Challenge.Option(id: "B", text: "碩士優先，1-3 年經驗含實習，應屆碩士如有實習經驗很適合投遞", explanation: "正確！\"Master's degree preferred\" 代表碩士加分；\"internship experience counts\" 明確表示實習經驗算數。如果你有 1-2 段實習，完全在目標範圍內。"),
                                Challenge.Option(id: "C", text: "Python 是必備條件，不會 Python 不該投", explanation: "\"experience with Python is a plus\" 代表加分不是必備。SQL 和 Excel 才是 required。"),
                                Challenge.Option(id: "D", text: "只要有碩士學位就一定會被錄取", explanation: "\"preferred\" 只是偏好，不保證錄取。還需要滿足其他要求。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"preferred\" 和 \"required\" 的差別是什麼？", "\"internship experience counts\" 這句話對應屆生很關鍵"],
                            explanation: "JD 中的關鍵詞解讀：\n• \"preferred\" = 偏好但非必要\n• \"X is a plus\" = 加分項\n• \"internship experience counts\" = 實習算在年資內\n• \"1-3 years\" = 1 年也行\n很多同學因為看到年資要求就不投，其實仔細讀 JD 會發現門檻比想像中低。",
                            frameworkTip: "JD 年資解讀：required = 必要 / preferred = 加分 / is a plus = 加分 / equivalent experience = 非本科也行 / internship counts = 實習算年資"
                        ),
                    ]
                ),
                Quest(
                    id: "52-2",
                    name: "README / 技術文件",
                    description: "讀懂 README 和技術文件中的常見模式與指令",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "README 架構",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據這段 README，以下哪個操作順序是正確的？",
                            scenario: Challenge.Scenario(
                                title: "閱讀開源工具 README",
                                narrative: "你要使用一個資料 pipeline 工具，以下是 README 的 Getting Started 部分：\n\n\"## Getting Started\n\n### Prerequisites\n- Python 3.9+\n- pip or conda package manager\n- Access to a PostgreSQL database (v12 or higher)\n\n### Installation\n```bash\npip install dataflow-cli\n```\n\n### Quick Start\n1. Initialize a new project:\n```bash\ndataflow init my-project\n```\n2. Configure your database connection in `config.yml`:\n```yaml\ndatabase:\n  host: localhost\n  port: 5432\n  name: your_database\n```\n3. Run your first pipeline:\n```bash\ndataflow run\n```\n\n> **Note:** Make sure your database is running before executing `dataflow run`. If you encounter connection errors, check our [Troubleshooting Guide](./docs/troubleshooting.md).\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "先 dataflow run → 再設定 config.yml → 最後 dataflow init", explanation: "完全反了。必須先 init（建專案）、再設定（config）、最後 run（執行）。"),
                                Challenge.Option(id: "B", text: "先安裝 pip → 再安裝 Python → 再 dataflow init", explanation: "pip 和 Python 是 prerequisites（前置條件），應該在安裝之前就已經有了，不是流程步驟。"),
                                Challenge.Option(id: "C", text: "先確認 Python 3.9+ 和 PostgreSQL → pip install → dataflow init → 設定 config.yml → dataflow run", explanation: "正確！Prerequisites → Installation → Quick Start 步驟 1-3，這是 README 的標準閱讀順序。"),
                                Challenge.Option(id: "D", text: "先 pip install → 再 dataflow run → 如果出錯再設定 config.yml", explanation: "跳過 init 和設定，直接 run 一定會失敗。README 的步驟順序是有意義的。"),
                            ],
                            correctAnswer: "C",
                            hints: ["README 通常按照 Prerequisites → Installation → Usage 的順序編排", "Prerequisites 是「你已經需要有的東西」不是「要安裝的步驟」"],
                            explanation: "README 的標準結構是：Prerequisites（先決條件，已經要有的）→ Installation（安裝工具本身）→ Getting Started / Quick Start（使用步驟）。理解這個結構能讓你快速上手任何工具。",
                            frameworkTip: "README 閱讀順序：Prerequisites（確認環境）→ Installation（安裝）→ Configuration（設定）→ Usage（使用）→ Troubleshooting（除錯）"
                        ),
                        Challenge(
                            id: 2,
                            name: "理解 API 文件",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個敘述是正確的？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 API Reference",
                                narrative: "你在串接一個分析 API，文件如下：\n\n\"## POST /api/v2/events/query\n\nQuery events within a specified time range.\n\n### Request Headers\n| Header | Required | Description |\n|--------|----------|-------------|\n| Authorization | Yes | Bearer token for authentication |\n| Content-Type | Yes | Must be `application/json` |\n\n### Request Body\n```json\n{\n  \"start_date\": \"2024-01-01\",  // Required. ISO 8601 format\n  \"end_date\": \"2024-01-31\",    // Required. ISO 8601 format\n  \"event_type\": \"page_view\",   // Optional. Filter by event type\n  \"limit\": 1000,               // Optional. Default: 100, Max: 10000\n  \"offset\": 0                  // Optional. For pagination\n}\n```\n\n### Response\n- `200 OK` — Returns array of events\n- `401 Unauthorized` — Invalid or expired token\n- `422 Unprocessable Entity` — Invalid date format or limit exceeds 10000\n- `429 Too Many Requests` — Rate limit exceeded. Retry after the time specified in `Retry-After` header\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "event_type 是必填欄位，不填會回 422 錯誤", explanation: "event_type 標註為 \"Optional\"，不是必填的。"),
                                Challenge.Option(id: "B", text: "如果收到 429 錯誤，表示你的 token 過期了，需要重新登入", explanation: "429 是 \"Too Many Requests\"（請求太頻繁），不是認證問題。token 過期是 401。"),
                                Challenge.Option(id: "C", text: "不帶 limit 參數時，預設回傳 100 筆資料；最多可以設到 10,000 筆", explanation: "正確！\"Default: 100, Max: 10000\" 代表不設定時回 100 筆，最大值 10,000。超過 10,000 會收到 422。"),
                                Challenge.Option(id: "D", text: "這是一個 GET 請求，參數要放在 URL query string 裡", explanation: "文件明確標示 \"POST\"，參數在 Request Body 中，不是 query string。"),
                            ],
                            correctAnswer: "C",
                            hints: ["注意 \"Optional\" 和 \"Required\" 的標註", "注意 \"Default\" 和 \"Max\" 的數值"],
                            explanation: "閱讀 API 文件的關鍵：\n• HTTP Method（GET/POST）決定參數位置\n• Required vs Optional 決定哪些一定要傳\n• Default 值是你不設定時系統自動用的\n• Response codes 告訴你各種錯誤的原因\n• 429 是 rate limiting（頻率限制），401 才是認證問題",
                            frameworkTip: "API 文件關鍵字：Required = 必填 / Optional = 選填 / Default = 預設值 / 4xx = 你的問題 / 5xx = 伺服器問題"
                        ),
                        Challenge(
                            id: 3,
                            name: "理解版本與相容性",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "升級到 v3.0 後，以下哪件事你「必須立刻處理」？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 Migration Guide",
                                narrative: "你正在升級一個工具，官方的 migration guide 寫著：\n\n\"## Migrating from v2.x to v3.0\n\n### Breaking Changes\n- `config.database_url` has been renamed to `config.connection_string`\n- The `--legacy` flag has been removed. All legacy format support has been dropped.\n- Minimum supported Python version is now 3.10 (previously 3.8)\n\n### Deprecation Notices\n- `query()` method will be removed in v4.0. Use `execute_query()` instead.\n- The `sync` command is deprecated. Use `push` and `pull` commands for bi-directional sync.\n\n### New Features\n- Added support for connection pooling via `pool_size` parameter\n- New `--dry-run` flag for all write operations\n- Built-in retry logic with exponential backoff\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "把 query() 改成 execute_query()", explanation: "query() 是 \"Deprecation Notice\"（棄用通知），到 v4.0 才會移除。v3.0 還能用，但應該排進計劃。"),
                                Challenge.Option(id: "B", text: "把 config.database_url 改成 config.connection_string", explanation: "正確！這是 \"Breaking Change\"，代表 v3.0 已經不支援舊名稱，不改就會壞掉。"),
                                Challenge.Option(id: "C", text: "開始使用 connection pooling 功能", explanation: "這是 \"New Feature\"，是新增功能不是必要變更，可以選擇性使用。"),
                                Challenge.Option(id: "D", text: "把 sync 指令改成 push 和 pull", explanation: "sync 是 \"deprecated\"（棄用），v3.0 還能用，但未來會移除。不是「立刻」要處理的。"),
                            ],
                            correctAnswer: "B",
                            hints: ["\"Breaking Change\" 和 \"Deprecation\" 的差異是什麼？", "Breaking = 現在就壞 / Deprecated = 未來會移除"],
                            explanation: "軟體文件中的三個重要層級：\n• Breaking Change = 立刻影響，不改就壞\n• Deprecation = 還能用但未來會移除，應排進計劃\n• New Feature = 新功能，選擇性使用\n讀 migration guide 時，先處理所有 breaking changes，再規劃 deprecation 的替代方案。",
                            frameworkTip: "升級優先級：Breaking Changes（必須立刻改）> Deprecations（計劃在下個版本前改）> New Features（評估是否採用）"
                        ),
                    ]
                ),
                Quest(
                    id: "52-3",
                    name: "PRD / Spec 閱讀",
                    description: "讀懂產品需求文件、User Story 和 Acceptance Criteria",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "解讀 User Story",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據這個 User Story，以下哪個理解是正確的？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 User Story",
                                narrative: "你加入一個新團隊，PM 請你閱讀目前 sprint 的 User Stories：\n\n\"US-142: Dashboard Export\nAs a marketing manager,\nI want to export my dashboard as a PDF report,\nSo that I can share performance metrics with stakeholders who don't have platform access.\n\nAcceptance Criteria:\n- [ ] User can click 'Export' button on any dashboard\n- [ ] PDF includes all visible charts and tables in the current view\n- [ ] Export respects the current date filter selection\n- [ ] PDF includes a timestamp and the exporter's name in the footer\n- [ ] Export completes within 30 seconds for dashboards with up to 20 widgets\n- [ ] User receives a toast notification when export is ready for download\n\nOut of Scope:\n- Scheduled/automated exports\n- Export to formats other than PDF (CSV, PNG)\n- Custom PDF templates or branding\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用戶可以排程自動匯出 PDF 報告", explanation: "\"Scheduled/automated exports\" 明確列在 Out of Scope，這個 sprint 不做。"),
                                Challenge.Option(id: "B", text: "PDF 應包含 dashboard 上所有曾經建立過的圖表", explanation: "\"all visible charts\" 指的是目前可見的，不是所有曾建立的。如果有些圖表被隱藏或篩選掉，不需要包含。"),
                                Challenge.Option(id: "C", text: "如果 dashboard 有 20 個 widget，匯出必須在 30 秒內完成；這同時也是一個效能的 Acceptance Criteria", explanation: "正確！\"Export completes within 30 seconds for dashboards with up to 20 widgets\" 是具體可測試的效能標準。AC 不只有功能需求，也包含 NFR。"),
                                Challenge.Option(id: "D", text: "用戶可以選擇匯出為 CSV 或 PNG 格式", explanation: "\"Export to formats other than PDF\" 在 Out of Scope 中，只支援 PDF。"),
                            ],
                            correctAnswer: "C",
                            hints: ["Acceptance Criteria 包含功能和非功能需求", "仔細看 Out of Scope 區塊"],
                            explanation: "User Story 三部分解讀：\n• As a [角色] = 這功能是給誰用的\n• I want to [動作] = 要做什麼\n• So that [目的] = 為什麼需要\nAcceptance Criteria 定義了「做到什麼程度算完成」，包含功能和效能標準。Out of Scope 則清楚劃定「這次不做什麼」，避免 scope creep。",
                            frameworkTip: "User Story 閱讀法：Who（As a）→ What（I want to）→ Why（So that）→ Done when（AC）→ Not this time（Out of Scope）"
                        ),
                        Challenge(
                            id: 2,
                            name: "理解 PRD 優先級",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "如果團隊時間不夠，哪些需求「一定要做完」才能上線？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 PRD 的 Requirements Table",
                                narrative: "你在閱讀一份 PRD（Product Requirements Document），其中有一張需求優先級表：\n\n\"## Requirements\n\n| ID | Requirement | Priority | Status |\n|----|------------|----------|--------|\n| R1 | User authentication via SSO | P0 — Must Have | In Progress |\n| R2 | Role-based access control (Admin, Editor, Viewer) | P0 — Must Have | Not Started |\n| R3 | Audit log for all data modifications | P1 — Should Have | Not Started |\n| R4 | Two-factor authentication | P1 — Should Have | Not Started |\n| R5 | Custom branding (logo, colors) | P2 — Nice to Have | Not Started |\n| R6 | SAML integration for enterprise clients | P2 — Nice to Have | Backlog |\n\nNote: P0 items are launch blockers. P1 items should be completed before GA but can be deferred to a fast-follow release if needed. P2 items are planned for future iterations.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "R1 到 R4（所有 P0 和 P1）", explanation: "P1 是 \"Should Have\"，可以延到 \"fast-follow release\"。P1 不是 launch blocker。"),
                                Challenge.Option(id: "B", text: "只有 R1（目前 In Progress 的）", explanation: "Status 是目前進度，不代表優先級。R2 也是 P0 但還沒開始。"),
                                Challenge.Option(id: "C", text: "R1 和 R2（所有 P0 — Must Have）", explanation: "正確！PRD 明確寫 \"P0 items are launch blockers\"，代表 R1 和 R2 是上線的最低門檻。P1 可以延後到 fast-follow。"),
                                Challenge.Option(id: "D", text: "全部都要做完才能上線", explanation: "P2 是 \"Nice to Have\"，planned for future iterations，不影響上線。"),
                            ],
                            correctAnswer: "C",
                            hints: ["\"launch blocker\" 是什麼意思？", "注意 P0、P1、P2 各自的定義"],
                            explanation: "PRD 的優先級系統（MoSCoW 變體）：\n• P0 / Must Have = launch blocker，不做就不能上線\n• P1 / Should Have = 正式版前應完成，但急的話可以 fast-follow\n• P2 / Nice to Have = 未來迭代\n關鍵字 \"launch blocker\" 代表這是上線的絕對門檻。",
                            frameworkTip: "PRD 優先級解讀：P0 = 不做不上線 / P1 = 上線後緊接著補 / P2 = 未來規劃。時間不夠時砍 P2 → P1，P0 絕不妥協。"
                        ),
                        Challenge(
                            id: 3,
                            name: "理解 Acceptance Criteria 細節",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據測試結果，這個功能的 AC 通過狀況如何？",
                            scenario: Challenge.Scenario(
                                title: "判斷 AC 是否通過",
                                narrative: "你是 QA，需要根據 Acceptance Criteria 判斷功能是否通過。以下是搜尋功能的 AC：\n\n\"Feature: Product Search\n\nAcceptance Criteria:\n1. Search results must be returned within 2 seconds for queries up to 100 characters\n2. Search should support partial matching (e.g., searching 'lap' returns 'laptop')\n3. Search results should be ranked by relevance, with exact matches appearing first\n4. If no results are found, the system should display 'No results found for [query]. Try different keywords.'\n5. Search input should be sanitized to prevent SQL injection\n6. The search bar must be accessible via keyboard shortcut (Ctrl/Cmd + K)\"\n\n測試結果：搜尋 \"lap\" 回傳了 laptop 和 laptop stand，耗時 1.8 秒。但搜尋 \"xyz123\"（無結果）時只顯示空白頁面。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "全部通過，因為搜尋功能正常運作", explanation: "搜尋無結果時顯示空白頁面，違反 AC #4 要求顯示特定訊息。"),
                                Challenge.Option(id: "B", text: "AC #1（效能）和 #2（部分匹配）通過，但 AC #4（無結果處理）失敗", explanation: "正確！1.8s < 2s 通過 AC#1；\"lap\" 找到 laptop 通過 AC#2；但無結果時應顯示特定訊息而非空白，AC#4 失敗。"),
                                Challenge.Option(id: "C", text: "因為 AC #4 失敗，所以整個功能不通過，其他 AC 不用看", explanation: "雖然有失敗的 AC，但仍需記錄所有 AC 的通過狀況，方便開發修復。不是一個失敗就全部不看。"),
                                Challenge.Option(id: "D", text: "只有 AC #1 可以確認通過，其他都無法從測試結果判斷", explanation: "AC #2 也可以從測試結果確認（搜尋 \"lap\" 回傳 \"laptop\" = 部分匹配成功）。"),
                            ],
                            correctAnswer: "B",
                            hints: ["逐條比對 AC 和測試結果", "注意 AC #4 對「無結果」情境的要求"],
                            explanation: "QA 測試的核心是逐條比對 AC：\n• AC #1：1.8s < 2s ✅\n• AC #2：\"lap\" → \"laptop\" ✅\n• AC #4：無結果應顯示特定訊息，但顯示空白 ❌\n• AC #3, #5, #6：測試結果未提到，需額外測試\n每條 AC 都是獨立可測試的標準，要逐一驗證。",
                            frameworkTip: "AC 測試法：每條 AC 獨立測試，標記 Pass/Fail/Not Tested。Fail 的要附上實際行為 vs 預期行為。"
                        ),
                    ]
                ),
                Quest(
                    id: "52-4",
                    name: "資料報告 / Dashboard",
                    description: "讀懂英文的指標報告、Executive Summary 和 Dashboard 描述",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "理解 Executive Summary",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據這份 Executive Summary，以下哪個判斷最準確？",
                            scenario: Challenge.Scenario(
                                title: "閱讀季度報告摘要",
                                narrative: "你收到 VP 轉寄的 Q4 報告摘要：\n\n\"Executive Summary — Q4 FY2024\n\nRevenue came in at $12.3M, representing a 15% YoY growth but falling short of our $13.5M target by 9%. The miss was primarily driven by delayed enterprise deals that slipped into Q1, accounting for approximately $1.8M in deferred revenue.\n\nGross margin improved to 72% (up from 68% in Q3), largely attributed to infrastructure cost optimization and the migration to a more efficient cloud architecture.\n\nCustomer acquisition cost (CAC) increased 22% QoQ to $1,850, raising concerns about the sustainability of our current growth strategy. However, LTV:CAC ratio remains healthy at 4.2x, above our 3x threshold.\n\nKey action items for Q1:\n1. Close the $1.8M in slipped enterprise deals within the first 45 days\n2. Investigate CAC increase — is it seasonal or structural?\n3. Continue cloud migration to sustain margin improvements\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "公司營收成長 15% 且達到目標，表現非常好", explanation: "雖然 YoY 成長 15%，但 \"falling short of our $13.5M target by 9%\"，並沒有達標。"),
                                Challenge.Option(id: "B", text: "CAC 上升 22% 代表公司財務狀況很危險", explanation: "CAC 上升確實 \"raising concerns\"，但 LTV:CAC 仍為 4.2x > 3x threshold，尚屬健康。報告用了 \"however\" 轉折來平衡觀點。"),
                                Challenge.Option(id: "C", text: "營收未達標主要是因為企業客戶的交易延後到 Q1，不是需求消失", explanation: "正確！\"delayed enterprise deals that slipped into Q1\" = 交易延後不是流失，而且有具體金額 $1.8M = \"deferred revenue\"（遞延收入）。Q1 action item 也是要在 45 天內 close 這些 deals。"),
                                Challenge.Option(id: "D", text: "毛利率下降是因為雲端遷移的成本太高", explanation: "恰好相反，毛利率改善（improved to 72%）是因為雲端遷移帶來的成本優化。"),
                            ],
                            correctAnswer: "C",
                            hints: ["\"slipped into Q1\" 是什麼意思？", "\"deferred revenue\" 是延後不是消失"],
                            explanation: "商業報告關鍵字：\n• \"fell short of target\" = 未達標\n• \"slipped into Q1\" = 延後到下季（不是取消）\n• \"deferred revenue\" = 遞延收入（錢晚點才進來）\n• \"raising concerns\" = 值得關注但還沒到危機\n• \"however... remains healthy\" = 有隱憂但整體還好\n理解這些語氣詞能幫你準確判斷報告的樂觀/悲觀程度。",
                            frameworkTip: "報告語氣判讀：exceeded = 超標 / met = 達標 / fell short = 未達標 / slipped = 延後 / raising concerns = 需關注 / remains healthy = 還行"
                        ),
                        Challenge(
                            id: 2,
                            name: "理解 Dashboard 指標",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "根據這份 Dashboard 指標說明，目前最需要關注的問題是什麼？",
                            scenario: Challenge.Scenario(
                                title: "閱讀產品 Dashboard 描述",
                                narrative: "主管請你看產品 dashboard 的指標說明文件：\n\n\"## Product Health Metrics — Dashboard Guide\n\n**DAU/MAU Ratio (Stickiness)**\nDefinition: Daily Active Users divided by Monthly Active Users.\nBenchmark: >25% is considered strong for B2B SaaS.\nCurrent: 31% (↑ 3pp from last month)\nInterpretation: Higher ratio means users return more frequently. A declining ratio may indicate engagement issues even if MAU is growing.\n\n**Activation Rate**\nDefinition: Percentage of new sign-ups who complete the 'aha moment' action within 7 days.\nOur aha moment: Creating their first dashboard with at least one data source connected.\nBenchmark: >40% for self-serve products.\nCurrent: 28% (↓ 5pp from last month)\nInterpretation: Low activation suggests onboarding friction. Users sign up but fail to experience core value.\n\n**Net Revenue Retention (NRR)**\nDefinition: Revenue from existing customers this period / Revenue from same customers last period. Includes expansion, contraction, and churn.\nBenchmark: >110% indicates strong expansion.\nCurrent: 118%\nInterpretation: >100% means existing customers are spending more over time, even accounting for churn.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "用戶黏著度太低，DAU/MAU 不達標", explanation: "DAU/MAU 是 31%，高於 25% 的 benchmark，而且還在上升（↑ 3pp），這是好的。"),
                                Challenge.Option(id: "B", text: "新用戶的 Activation Rate 偏低（28% < 40% benchmark），代表 onboarding 可能有摩擦", explanation: "正確！28% 低於 40% benchmark 且在下降（↓ 5pp）。文件解釋 \"Low activation suggests onboarding friction\"，代表新用戶註冊了但沒能體驗到核心價值。"),
                                Challenge.Option(id: "C", text: "既有客戶的收入在流失，NRR 太低", explanation: "NRR 118% > 110% benchmark，>100% 代表客戶在花更多錢，這是很健康的。"),
                                Challenge.Option(id: "D", text: "所有指標都很健康，不需要特別關注", explanation: "Activation Rate 明顯低於 benchmark 且在下降，需要關注。"),
                            ],
                            correctAnswer: "B",
                            hints: ["比較每個指標的 Current 值和 Benchmark", "注意箭頭方向（↑ 上升 / ↓ 下降）和 \"pp\"（percentage points）"],
                            explanation: "讀 dashboard 的方法：\n1. 看 Current vs Benchmark 判斷好壞\n2. 看趨勢方向（↑/↓）判斷是在改善還是惡化\n3. \"pp\" = percentage points（百分點），不是百分比\n本題：DAU/MAU 31% > 25% ✅｜Activation 28% < 40% ❌ 且↓｜NRR 118% > 110% ✅\n明顯 Activation Rate 最需要關注。",
                            frameworkTip: "指標健檢法：Current vs Benchmark（好壞）+ Trend（方向）+ Interpretation（意義）。先找紅燈（低於 benchmark 且下降），那就是最優先的問題。"
                        ),
                        Challenge(
                            id: 3,
                            name: "理解資料報告中的因果分析",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "這份報告認為轉換率下降的「主要」原因是什麼？",
                            scenario: Challenge.Scenario(
                                title: "閱讀 Weekly Metrics Report",
                                narrative: "你收到 Data Team 寄的每週報告：\n\n\"## Weekly Metrics Report — W12 (Mar 17-23)\n\n### Conversion Rate: 3.2% → 2.1% (↓ 1.1pp WoW)\n\nRoot Cause Analysis:\nWe identified two contributing factors:\n\n1. **Checkout page load time increased from 1.2s to 3.8s** (Primary factor, est. 70% impact)\n   - Correlated with the deployment of v2.14 on Tuesday\n   - Rollback was initiated on Thursday; load time recovered to 1.4s by Friday\n   - Conversion rate on Friday/Saturday showed early signs of recovery (2.6%)\n\n2. **Seasonal dip in purchase intent** (Secondary factor, est. 30% impact)\n   - Consistent with the same period in 2023 (W12 2023 also saw a 0.3pp dip)\n   - Marketing is planning a spring promotion campaign starting W14\n\n### Recommendation\nMonitor conversion rate through W13. If recovery to 3.0%+ is not observed by Wednesday, escalate to the engineering team for further investigation of checkout performance.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "季節性因素導致消費者購買意願下降", explanation: "季節性因素是 \"Secondary factor\"（次要因素），估計只貢獻 30% 的影響。"),
                                Challenge.Option(id: "B", text: "v2.14 版本部署導致結帳頁面載入時間從 1.2 秒增加到 3.8 秒", explanation: "正確！報告標明 \"Primary factor, est. 70% impact\"，且有因果證據：部署時間（Tuesday）與問題出現相關，rollback 後開始恢復。"),
                                Challenge.Option(id: "C", text: "行銷團隊沒有推出春季促銷活動", explanation: "春季促銷是 W14 才計劃推出的，不是這週下降的原因。"),
                                Challenge.Option(id: "D", text: "報告無法確定原因，建議繼續觀察", explanation: "報告已明確做了 Root Cause Analysis 並區分了主要和次要因素。建議觀察是 next step，不是因為不確定原因。"),
                            ],
                            correctAnswer: "B",
                            hints: ["找 \"Primary factor\" 標記", "注意 \"correlated with\" 表示時間上的關聯性"],
                            explanation: "資料報告中的因果分析常見結構：\n• \"Root Cause Analysis\" = 根因分析\n• \"Primary factor\" vs \"Secondary factor\" = 主因 vs 次因\n• \"est. 70% impact\" = 估計影響佔比\n• \"Correlated with\" = 時間相關性\n• \"Rollback → recovery\" = 因果驗證（移除原因後結果改善）\n好的分析不只找到原因，還要區分影響程度。",
                            frameworkTip: "因果報告結構：Problem（數字下降）→ Root Cause（主因 + 次因 + 佔比）→ Evidence（相關性 + 驗證）→ Recommendation（下一步）"
                        ),
                    ]
                ),
                Quest(
                    id: "52-5",
                    name: "Boss: 閱讀理解綜合",
                    description: "綜合運用 JD、技術文件、PRD、報告的閱讀能力",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "產品分析報告閱讀",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文撰寫一份 200-250 字的分析摘要（Executive Summary），需要包含：\n1. 整體表現評估（達標 vs 未達標）\n2. 最大的問題是什麼，以及根據數據的根因分析\n3. 三個具體的改善建議（prioritized）\n\n格式要求：使用清楚的段落結構，專業的商業英文。",
                            scenario: Challenge.Scenario(
                                title: "閱讀並分析完整的產品報告",
                                narrative: "你剛加入一家 B2B SaaS 公司擔任 Product Analyst。主管給你以下產品報告，請你閱讀後寫出分析摘要：\n\n\"## Product Analytics Report — Feature: Smart Notifications\n\nLaunch Date: Feb 15, 2025\nReport Period: Feb 15 — Mar 15 (30 days post-launch)\n\n### Adoption Metrics\n- Feature adoption rate: 34% of MAU (target was 50%)\n- Adoption by segment: Enterprise 52%, Mid-market 38%, SMB 18%\n- Average time to first use: 4.2 days after login (target: <2 days)\n\n### Engagement Metrics\n- DAU of feature users: 68% (vs 45% for non-feature users)\n- Average notifications configured per user: 3.7\n- Most popular notification type: 'Revenue threshold alert' (67% of users)\n- Least popular: 'Custom webhook integration' (4% of users)\n\n### Impact Metrics\n- Feature users show 23% higher 30-day retention vs control group\n- NPS among feature users: 62 (vs company average of 45)\n- Support tickets related to notifications: 127 (18% of total tickets this period)\n\n### Qualitative Feedback (from user interviews, n=15)\n- 'Setup was confusing — I didn't know where to find it' (mentioned by 8/15)\n- 'Once configured, it's incredibly useful' (mentioned by 12/15)\n- 'Too many notification options overwhelmed me' (mentioned by 6/15)\n- 'Would love Slack integration' (mentioned by 9/15)\n\n### Technical Notes\n- P95 notification delivery latency: 2.3s (SLA: <5s) ✅\n- False positive rate: 3.2% (target: <5%) ✅\n- System uptime: 99.97% ✅\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["先區分哪些指標達標、哪些未達標", "把 quantitative data 和 qualitative feedback 結合分析"],
                            explanation: "分析產品報告的核心能力：\n1. 區分達標 vs 未達標指標（adoption 未達標，但 engagement 和 technical metrics 達標）\n2. 識別矛盾訊號（用了的人很滿意，但很多人沒用 → 問題在 discoverability 不是 product-market fit）\n3. 用 qualitative data 解釋 quantitative data（為什麼 adoption 低？因為找不到、設定太複雜）\n4. 建議要具體、有優先級、基於數據",
                            frameworkTip: "產品報告分析框架：① 紅綠燈（哪些達標哪些沒有）② 根因（量化+質化交叉分析）③ 建議（優先級+具體行動+預期效果）"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 53,
            name: "短寫作",
            emoji: "✍️",
            description: "學會撰寫專業 Email、會議紀錄、履歷和工作溝通訊息",
            quests: [
                Quest(
                    id: "53-1",
                    name: "Professional Email",
                    description: "撰寫清楚專業的工作 Email",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "請求協助的 Email",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪封 Email 最專業且有效？",
                            scenario: Challenge.Scenario(
                                title: "跨部門請求資料",
                                narrative: "你是 Product Analyst，需要向 Data Engineering 團隊的 Sarah 請求一組新的資料表權限，以完成下週的季度報告。你們之前沒有直接合作過。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Subject: Data Access Request — Q1 Report\n\nHi Sarah,\n\nI'm [Name] from the Product Analytics team. I'm reaching out because I need read access to the `user_events` and `transactions` tables in the analytics warehouse to complete our Q1 quarterly report, which is due next Friday.\n\nCould you help me get access, or point me to the right person if this isn't within your scope? Happy to jump on a quick call if you need more context.\n\nThanks in advance,\n[Name]", explanation: "正確！有清楚的 Subject、自我介紹、具體需求（哪些表）、deadline（next Friday）、備案（or point me to the right person）、禮貌結尾。"),
                                Challenge.Option(id: "B", text: "Subject: URGENT!! Need data ASAP\n\nHey Sarah,\n\nI need access to some data tables right now. Can you do it today?\n\nThanks", explanation: "Subject 用大寫和驚嘆號不專業；沒說明哪些表；語氣太急迫且不禮貌；沒有自我介紹。"),
                                Challenge.Option(id: "C", text: "Subject: Hello\n\nDear Ms. Sarah,\n\nI hope this email finds you well. I am writing to formally request your esteemed assistance in the matter of data access provisioning for certain database tables that may be necessary for the completion of a quarterly analytical report.\n\nYours sincerely,\n[Name]", explanation: "過度正式到不自然（\"esteemed assistance\"、\"in the matter of\"），在科技公司會顯得很奇怪。而且沒有具體說明要哪些表。"),
                                Challenge.Option(id: "D", text: "Subject: (no subject)\n\nSarah can you give me access to the data? I need it for work.", explanation: "沒有 Subject、沒有問候語、沒有具體說明、語氣太隨便。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 email 要有：清楚的 Subject、具體需求、deadline、禮貌語氣", "科技公司的 email 不需要太正式，但要專業"],
                            explanation: "專業 email 五要素：\n1. Subject line：清楚說明目的（Data Access Request — Q1 Report）\n2. Context：簡短自我介紹 + 為什麼寫這封信\n3. Specific ask：具體需求（哪些表、什麼權限）\n4. Timeline：何時需要（due next Friday）\n5. Easy out：讓對方容易回覆（\"or point me to the right person\"）",
                            frameworkTip: "請求 email 公式：Subject [目的] → Hi [Name], → Context（我是誰、為什麼聯繫）→ Specific ask（具體需求）→ Timeline → Easy out → Thanks"
                        ),
                        Challenge(
                            id: 2,
                            name: "進度更新 Email",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪封 Email 的結構和語氣最好？",
                            scenario: Challenge.Scenario(
                                title: "向主管回報專案進度",
                                narrative: "你負責的資料遷移專案原定週五完成，但因為資料格式問題需要延後兩天。你需要寫 email 告知主管 David 目前狀況。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Subject: Data Migration Update — Revised Timeline\n\nHi David,\n\nQuick update on the data migration project:\n\n**Status:** We've completed 85% of the migration. However, we discovered formatting inconsistencies in the legacy transaction records that need to be cleaned before loading.\n\n**Impact:** This will push our completion date from Friday to Sunday evening.\n\n**Mitigation:** I've already written a cleaning script that handles the most common issues. The remaining edge cases will be addressed by Saturday.\n\n**No action needed from you** — just wanted to keep you in the loop. I'll send another update on Saturday.\n\nBest,\n[Name]", explanation: "正確！用 Status → Impact → Mitigation 結構清晰報告。\"No action needed\" 讓主管知道不用擔心。語氣專業但不過度正式。"),
                                Challenge.Option(id: "B", text: "Subject: Bad news\n\nHi David,\n\nSorry, the project is going to be late. The data has problems. I'll try to fix it.\n\n[Name]", explanation: "Subject 太負面；沒有具體說明延後多久、什麼問題、什麼解法。"),
                                Challenge.Option(id: "C", text: "Subject: Data Migration\n\nHi David,\n\nI want to explain that the data has formatting issues which were not expected and this is causing some delays but I am working on it and it should be done soon hopefully.\n\n[Name]", explanation: "一長句沒有結構；\"hopefully\" 不夠確定；沒有具體日期和進度百分比。"),
                                Challenge.Option(id: "D", text: "Subject: ⚠️ DELAY ALERT ⚠️\n\nDavid — project delayed. New ETA Sunday. Will explain in standup.\n\n[Name]", explanation: "emoji 在正式更新中不適當；太簡短沒有 context；\"will explain in standup\" 浪費了書面溝通的機會。"),
                            ],
                            correctAnswer: "A",
                            hints: ["進度更新要包含：現況、影響、因應措施", "\"No action needed\" 是一句很有用的話"],
                            explanation: "進度更新 email 的 SIM 結構：\n• Status：目前進度和發現的問題\n• Impact：對 timeline 的影響（具體日期）\n• Mitigation：你已經在做什麼來解決\n最後加 \"No action needed\" 或 \"Action needed: [具體]\"，讓收件者清楚知道要不要做什麼。",
                            frameworkTip: "進度更新公式：Status（進度+問題）→ Impact（延後多久）→ Mitigation（解法）→ Action needed / No action needed"
                        ),
                        Challenge(
                            id: 3,
                            name: "Follow-up Email",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "以下哪封 follow-up email 最能留下好印象？",
                            scenario: Challenge.Scenario(
                                title: "面試後的 Follow-up",
                                narrative: "你昨天面試了一家科技公司的 Business Analyst 職位，面試官是 Product Director Lisa。面試中你們聊到了他們正在做的 pricing strategy 改版。你想寫一封 follow-up email。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Subject: Thank You — BA Interview Follow-up\n\nHi Lisa,\n\nThank you for taking the time to speak with me yesterday about the Business Analyst role. I especially enjoyed our discussion about the pricing strategy redesign — it's exactly the type of cross-functional, data-driven challenge that excites me.\n\nOur conversation reinforced my interest in the role. I believe my experience with cohort analysis and A/B testing at [Company] would allow me to contribute meaningfully to the pricing optimization work you described.\n\nPlease don't hesitate to reach out if you need any additional information. I look forward to hearing about next steps.\n\nBest regards,\n[Name]", explanation: "正確！提到具體的面試內容（pricing strategy redesign）、連結到自己的技能（cohort analysis, A/B testing）、語氣積極但不卑微。"),
                                Challenge.Option(id: "B", text: "Subject: Thanks!!\n\nHi Lisa!\n\nThanks so much for the interview!!! It was really really great and I really want this job. Please let me know ASAP if I got it!\n\nThanks!!!!\n[Name]", explanation: "過多驚嘆號不專業；\"really really great\" 空洞；\"please let me know ASAP if I got it\" 太急迫。"),
                                Challenge.Option(id: "C", text: "Subject: Interview\n\nDear Ms. Lisa,\n\nThank you for the interview. I hope I answered your questions well. I look forward to hearing from you.\n\nSincerely,\n[Name]", explanation: "太制式，沒有提到任何面試中的具體內容，無法和其他候選人區分。"),
                                Challenge.Option(id: "D", text: "（不寫 follow-up email，等對方通知）", explanation: "不寫 follow-up 會錯失展現積極態度和加深印象的機會。大多數面試禮儀都建議在 24 小時內寫。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 follow-up 要提到面試中的具體話題", "連結你的技能和他們的需求"],
                            explanation: "Follow-up email 三步驟：\n1. Thank + 具體內容（提到你們聊的某個話題，展現你有在聽）\n2. Reinforce fit（連結你的技能和他們的需求）\n3. Open door（邀請他們聯繫你）\n在 24 小時內寄出，Subject line 清楚標示是 follow-up。",
                            frameworkTip: "Follow-up 公式：Thank you for [具體話題] → My [技能/經驗] can help with [他們的需求] → Looking forward to next steps"
                        ),
                    ]
                ),
                Quest(
                    id: "53-2",
                    name: "會議摘要",
                    description: "用英文撰寫清楚的 Meeting Notes 和 Action Items",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "會議紀錄格式",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個會議紀錄的格式和內容最好？",
                            scenario: Challenge.Scenario(
                                title: "撰寫 Sprint Planning 會議紀錄",
                                narrative: "你剛參加完一場 sprint planning 會議。會議重點：\n\n• PM Lisa 說這個 sprint 要專注在搜尋功能改善\n• 工程師 Tom 估計搜尋重構需要 8 story points\n• Design Lead Amy 說新的搜尋 UI mockup 下週一完成\n• 大家同意先做效能優化，UI 改版放下個 sprint\n• Lisa 要在週三前寫完 PRD\n• Tom 要在 Amy 交 mockup 後開始 spike",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "## Sprint Planning — Mar 24\n**Attendees:** Lisa (PM), Tom (Eng), Amy (Design), [You]\n\n### Decisions\n- Sprint focus: Search performance optimization\n- UI redesign deferred to next sprint\n- Search refactor estimated at 8 story points\n\n### Action Items\n| Owner | Task | Due Date |\n|-------|------|----------|\n| Lisa | Complete search PRD | Wed Mar 26 |\n| Amy | Deliver search UI mockup | Mon Mar 31 |\n| Tom | Begin search spike after mockup delivery | After Mar 31 |\n\n### Notes\n- Team aligned on prioritizing performance over UI this sprint\n- Tom flagged that refactor estimate may increase after spike", explanation: "正確！結構清晰：Decisions（決定了什麼）→ Action Items（誰做什麼、何時完成）→ Notes（補充）。有 table 格式的 Action Items 很容易追蹤。"),
                                Challenge.Option(id: "B", text: "Meeting was about search. Lisa talked about PRD. Tom talked about coding. Amy talked about design. We decided some things.", explanation: "太模糊，沒有具體的 decisions 和 action items。這種紀錄對沒參加會議的人毫無用處。"),
                                Challenge.Option(id: "C", text: "Lisa 說要做搜尋，Tom 說需要 8 points，Amy 說下週一給 mockup，大家同意先做效能。", explanation: "雖然有內容，但沒有結構、沒有 action items 的 owner 和 deadline，也沒有英文（題目要求用英文寫）。"),
                                Challenge.Option(id: "D", text: "10:00 - Meeting started\n10:05 - Lisa presented search priorities\n10:12 - Tom estimated story points\n10:20 - Amy shared design timeline\n10:30 - Discussion about priorities\n10:45 - Meeting ended", explanation: "時間軸流水帳式的紀錄對後續追蹤沒用。會議紀錄應該按主題組織，不是按時間。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的會議紀錄分三塊：Decisions、Action Items、Notes", "Action Items 一定要有 Owner 和 Due Date"],
                            explanation: "專業會議紀錄的 DAN 結構：\n• Decisions：會議中做了哪些決定（讓沒參加的人也知道結論）\n• Action Items：誰要做什麼、何時完成（用 table 格式最好追蹤）\n• Notes：補充說明、風險、下次要討論的事\n不要寫流水帳，要寫結論和行動。",
                            frameworkTip: "會議紀錄公式：Header（日期+出席者）→ Decisions（結論）→ Action Items（Owner | Task | Due）→ Notes（補充）"
                        ),
                        Challenge(
                            id: 2,
                            name: "Action Items 寫法",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪組改寫最符合專業 Action Item 的標準？",
                            scenario: Challenge.Scenario(
                                title: "改善模糊的 Action Items",
                                narrative: "你的同事寫了一份會議紀錄，其中 Action Items 如下：\n\n\"Action Items:\n- Look into the data issue\n- Fix the thing Sarah mentioned\n- Someone should update the docs\n- Think about the new feature\"\n\n主管請你重寫這些 Action Items 讓它們更 actionable。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "- [Tom] Investigate the 15% discrepancy in Q4 revenue data and report findings by Thursday\n- [Lisa] Fix the broken date filter on the analytics dashboard by Wednesday\n- [Amy] Update the API documentation to reflect the new authentication flow by Friday\n- [You] Draft a one-page proposal for the recommendation engine feature by next Monday", explanation: "正確！每條都有 Owner（[Name]）、具體動作（investigate、fix、update、draft）、具體內容、deadline。把模糊的描述翻譯成可執行的任務。"),
                                Challenge.Option(id: "B", text: "- Investigate data issue (important)\n- Fix dashboard bug (urgent)\n- Update documentation (when possible)\n- Think about recommendation engine (low priority)", explanation: "加了優先級但沒有 owner 和 deadline，仍然不夠 actionable。"),
                                Challenge.Option(id: "C", text: "- Tom should look into data stuff ASAP\n- Lisa should probably fix the filter soon\n- Someone needs to do the docs at some point\n- We need to think about the feature eventually", explanation: "語氣太模糊（\"stuff\"、\"probably\"、\"at some point\"、\"eventually\"），deadline 不明確。"),
                                Challenge.Option(id: "D", text: "- Data: needs investigation\n- Dashboard: needs fix\n- Docs: needs update\n- Feature: needs proposal", explanation: "缺少 owner、deadline 和具體描述，這只是問題清單不是 action items。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 Action Item 有三要素：Owner、Task、Deadline", "用動詞開頭（Investigate、Fix、Update、Draft）"],
                            explanation: "Action Item 的 OTD 標準：\n• Owner：[Name] 明確指定負責人，不是 \"someone\"\n• Task：用具體動詞 + 具體內容，不是 \"look into\" 或 \"think about\"\n• Deadline：具體日期，不是 \"ASAP\" 或 \"when possible\"\n動詞選擇：investigate（調查）、fix（修復）、update（更新）、draft（起草）、review（審閱）",
                            frameworkTip: "Action Item 公式：[Owner] + [動詞] + [具體內容] + by [日期]。常用動詞：Investigate / Draft / Review / Update / Schedule / Follow up with"
                        ),
                        Challenge(
                            id: 3,
                            name: "Decision Log 寫法",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 Decision Log 條目最完整？",
                            scenario: Challenge.Scenario(
                                title: "記錄重要決策",
                                narrative: "在架構會議中，團隊討論了很久要用 REST API 還是 GraphQL。最後決定用 REST，因為團隊更熟悉、時程更緊。你需要在會議紀錄的 Decision Log 中記錄這個決定。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "**Decision:** Adopt REST API for the new service\n**Context:** Team evaluated REST vs GraphQL for the notification service API\n**Rationale:** (1) Team has stronger REST expertise — reduces ramp-up time by ~2 weeks; (2) Current timeline is aggressive (6-week deadline); (3) GraphQL benefits (flexible queries) are less critical for this use case since consumers are internal\n**Trade-offs acknowledged:** We lose query flexibility and may need to build additional endpoints as requirements evolve\n**Decided by:** Engineering team + Tech Lead approval\n**Date:** Mar 24, 2025", explanation: "正確！包含 Decision（決定）、Context（背景）、Rationale（原因）、Trade-offs（取捨）、Decided by（誰決定的）、Date（日期）。未來回頭查都能理解為什麼這樣決定。"),
                                Challenge.Option(id: "B", text: "We decided to use REST.", explanation: "太簡短，沒有記錄為什麼、考慮了什麼替代方案、有什麼 trade-off。"),
                                Challenge.Option(id: "C", text: "After a long discussion, everyone agreed REST is better than GraphQL because GraphQL is too complicated and nobody likes it.", explanation: "語氣不客觀（\"nobody likes it\"），沒有具體原因，也沒有記錄 trade-off。"),
                                Challenge.Option(id: "D", text: "Decision: Use REST\nReason: It's easier", explanation: "\"easier\" 不夠具體。Easier for whom? In what way? 缺乏 context 和 trade-off。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的 Decision Log 要記錄「為什麼」不只是「決定什麼」", "記錄 trade-off 能幫助未來重新評估"],
                            explanation: "Decision Log 的價值在於未來回頭查時，能理解「為什麼做這個決定」。完整的 Decision Log 包含：\n• Decision：決定了什麼\n• Context：在討論什麼問題\n• Rationale：為什麼選這個（具體原因）\n• Trade-offs：放棄了什麼\n• Decided by + Date：誰在什麼時候決定的",
                            frameworkTip: "Decision Log 模板：Decision → Context → Rationale (numbered) → Trade-offs acknowledged → Decided by → Date"
                        ),
                    ]
                ),
                Quest(
                    id: "53-3",
                    name: "履歷子彈點",
                    description: "用 Action Verb + 量化成果寫出強力的履歷子彈點",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Action Verb 選擇",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個履歷子彈點最強？",
                            scenario: Challenge.Scenario(
                                title: "改善履歷子彈點",
                                narrative: "你在修改履歷，想描述你實習時做的事：「幫公司建了一個 dashboard，讓主管可以看銷售數據，結果發現了一些 insight，業績提升了。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Built an interactive sales dashboard in Tableau that surfaced regional performance gaps, leading to a targeted campaign that increased Q3 revenue by 12%", explanation: "正確！強動詞（Built）→ 具體做了什麼（interactive sales dashboard in Tableau）→ 產出的 insight（regional performance gaps）→ 量化影響（12% revenue increase）。完整的 Impact Chain。"),
                                Challenge.Option(id: "B", text: "Helped build a dashboard for the manager to see sales data", explanation: "\"Helped\" 是弱動詞，不確定你的貢獻；\"see sales data\" 太模糊；沒有量化成果。"),
                                Challenge.Option(id: "C", text: "Responsible for dashboard creation and data analysis", explanation: "\"Responsible for\" 是最弱的履歷寫法，只說了職責不說成果。"),
                                Challenge.Option(id: "D", text: "Made a Tableau dashboard. Found some insights about sales. Revenue went up.", explanation: "三個短句缺乏因果連接；\"some insights\" 太模糊；\"went up\" 沒有量化。"),
                            ],
                            correctAnswer: "A",
                            hints: ["用強動詞（Built, Led, Designed）而非弱動詞（Helped, Responsible for, Assisted）", "好的子彈點要有因果鏈：做了什麼 → 產出什麼 → 帶來什麼影響"],
                            explanation: "履歷子彈點的 ACR 公式：\n• Action：用強動詞開頭（Built, Developed, Led, Analyzed, Designed）\n• Context：具體做了什麼、用什麼工具\n• Result：量化的成果（百分比、金額、時間節省）\n避免：Helped, Responsible for, Assisted, Participated in — 這些都不展現主動性。",
                            frameworkTip: "履歷公式：[強動詞] + [具體工作 + 工具] + that/which [產出] + leading to/resulting in [量化影響]"
                        ),
                        Challenge(
                            id: 2,
                            name: "量化成果",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個量化方式最有說服力？",
                            scenario: Challenge.Scenario(
                                title: "為履歷加上數字",
                                narrative: "你想在履歷上描述你做的一個資料自動化專案：「我寫了一個 Python script，把原本手動整理資料的流程自動化了，團隊不用再花很多時間做這件事。」",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Automated the weekly data consolidation pipeline using Python and Airflow, reducing manual processing time from 6 hours to 15 minutes — saving the team approximately 290 hours annually", explanation: "正確！三層量化：工具（Python + Airflow）、Before/After（6h → 15min）、年化影響（290 hrs/year）。讓讀者立刻感受到規模。"),
                                Challenge.Option(id: "B", text: "Wrote a Python script to automate data processing, saving a lot of time", explanation: "\"a lot of time\" 不是量化。沒有說明原本多久、現在多久。"),
                                Challenge.Option(id: "C", text: "Automated data processing using Python (reduced time by approximately 97.5%)", explanation: "百分比雖然正確但缺乏直覺感。\"6 hours to 15 minutes\" 比 \"97.5%\" 更有感。兩種可以並用但後者更好理解。"),
                                Challenge.Option(id: "D", text: "Used Python for data automation", explanation: "完全沒有成果，只描述了你做了什麼，不是你的影響。"),
                            ],
                            correctAnswer: "A",
                            hints: ["量化最好用 Before → After 的對比", "年化數字（annually）能放大影響力"],
                            explanation: "量化成果的三種方式：\n1. Before/After：6 hours → 15 minutes（最直覺）\n2. 百分比：reduced by 95%（適合大幅改善）\n3. 年化影響：saving 290 hours annually（放大規模感）\n最強的寫法是結合 Before/After + 年化影響。讓面試官腦中自動產生「哇，一年省 290 小時」的畫面。",
                            frameworkTip: "量化技巧：Before/After 對比 + 年化影響。沒有數字？估計一個合理範圍也比不寫好（\"approximately\" 是你的好朋友）。"
                        ),
                        Challenge(
                            id: 3,
                            name: "針對 JD 客製化",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個子彈點最能對應到這個 JD 的關鍵字？",
                            scenario: Challenge.Scenario(
                                title: "根據 JD 調整子彈點",
                                narrative: "你要投遞一個 Product Analyst 職位，JD 強調 \"cross-functional collaboration\" 和 \"stakeholder communication\"。你有一段經驗是：跟工程師和設計師一起做了用戶分群分析，然後報告給行銷團隊。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Did user segmentation analysis and sent results to marketing", explanation: "動詞太弱（\"Did\"、\"sent\"），沒有強調 cross-functional 和 communication。"),
                                Challenge.Option(id: "B", text: "Collaborated with engineering and design teams to develop a user segmentation model, then translated findings into actionable recommendations for the marketing team — resulting in a 25% improvement in campaign targeting accuracy", explanation: "正確！\"Collaborated with... teams\"（對應 cross-functional collaboration）→ \"translated findings into actionable recommendations\"（對應 stakeholder communication）→ 量化成果。每個 JD 關鍵字都被覆蓋了。"),
                                Challenge.Option(id: "C", text: "Performed advanced clustering analysis using K-means algorithm in Python with scikit-learn on user behavioral data", explanation: "只強調技術細節，完全沒有展現 collaboration 和 communication，跟 JD 要求不匹配。"),
                                Challenge.Option(id: "D", text: "Worked on user segmentation with various teams and reported findings", explanation: "\"Worked on\" 是弱動詞；\"various teams\" 太模糊；\"reported findings\" 沒有展現 communication skill。"),
                            ],
                            correctAnswer: "B",
                            hints: ["從 JD 抓關鍵字，在子彈點中用近義詞呼應", "\"Collaborated with\" 對應 \"cross-functional\"；\"translated findings\" 對應 \"stakeholder communication\""],
                            explanation: "客製化履歷的方法：\n1. 從 JD 抓 2-3 個核心關鍵字（cross-functional, stakeholder communication）\n2. 在子彈點中用近義詞或同樣的詞呼應\n3. 用具體行為展現（不是說 \"I have good communication skills\"，而是 \"translated findings into actionable recommendations\"）\n這讓 ATS 和面試官都能快速看到 match。",
                            frameworkTip: "客製化履歷法：JD 關鍵字 → 在子彈點中用近義詞呼應。Show, don't tell：不說 \"good at X\"，用具體行為證明 X。"
                        ),
                    ]
                ),
                Quest(
                    id: "53-4",
                    name: "Slack / 工作溝通",
                    description: "在即時通訊中用專業但不失效率的方式溝通",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "請求協助",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 Slack 訊息最可能得到快速且有效的回覆？",
                            scenario: Challenge.Scenario(
                                title: "在 Slack 上問同事技術問題",
                                narrative: "你在跑 SQL query 時遇到 error，想在 Slack 上問資深 Data Engineer 同事 Kevin 求助。你的 query 是 JOIN 兩個大表時 timeout 了。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Hey Kevin, quick question about query performance. I'm joining `user_events` (50M rows) with `transactions` (20M rows) on `user_id`, and the query is timing out after 300s. I've already tried:\n- Adding a WHERE clause to filter by date range\n- Using EXPLAIN to check — it's doing a full table scan on `user_events`\n\nDo you think an index on `user_events.user_id` would help, or is there a better approach?\n\n(Full query in thread 🧵)", explanation: "正確！提供了具體的 context（表名、大小）、已嘗試的方法、具體問題、且把長 query 放在 thread 保持頻道整潔。"),
                                Challenge.Option(id: "B", text: "Hey Kevin, my query doesn't work. Can you help?", explanation: "太模糊。Kevin 會需要問一堆後續問題才能幫忙，浪費雙方時間。"),
                                Challenge.Option(id: "C", text: "@Kevin URGENT!!! My query is broken and I need it for a meeting in 1 hour!! Please help immediately!!", explanation: "語氣太急迫且不專業。沒有提供任何技術細節。"),
                                Challenge.Option(id: "D", text: "Kevin I have a question. [貼了 50 行 SQL query + 完整 error log]", explanation: "一次貼太多內容會嚇到人。應該先簡述問題，詳細內容放在 thread 裡。"),
                            ],
                            correctAnswer: "A",
                            hints: ["好的技術問題要包含：你做了什麼、什麼結果、已經試了什麼", "長內容放 thread 是 Slack 禮儀"],
                            explanation: "Slack 上問技術問題的 CARE 結構：\n• Context：你在做什麼（joining two tables）\n• Actual result：發生了什麼（timeout after 300s）\n• Research done：你已經試了什麼（date filter, EXPLAIN）\n• Exact question：你想知道什麼（index or better approach?）\n這樣對方可以直接給建議，不需要來回問 context。",
                            frameworkTip: "Slack 提問公式：Context（做什麼）→ Problem（什麼問題）→ Already tried（試了什麼）→ Specific question（具體想問什麼）。長內容放 thread。"
                        ),
                        Challenge(
                            id: 2,
                            name: "給進度更新",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個 async standup 格式最清楚？",
                            scenario: Challenge.Scenario(
                                title: "在 Slack 上回報 Standup 進度",
                                narrative: "你的團隊用 async standup（在 Slack 上打文字代替站會）。你需要回報昨天做了什麼、今天要做什麼、有沒有 blocker。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "**Yesterday:**\n- Completed data validation for the migration script (PR #342 ready for review)\n- Met with Lisa to align on Q1 metrics definitions\n\n**Today:**\n- Start building the retention cohort dashboard\n- Review Amy's PR #338 (search feature)\n\n**Blockers:**\n- None currently, but waiting on data engineering to grant access to the `events_v2` table (ETA: today per Kevin)", explanation: "正確！三段式結構清晰，用動詞開頭，有具體的 PR 編號和人名，blocker 有追蹤資訊（ETA + 誰在處理）。"),
                                Challenge.Option(id: "B", text: "Did some work on the migration thing yesterday. Today I'll keep working on stuff. No blockers.", explanation: "\"some work on the thing\" 和 \"keep working on stuff\" 完全沒有資訊量。團隊無法判斷你的進度。"),
                                Challenge.Option(id: "C", text: "Worked on a lot of things. Very busy. Will continue tomorrow.", explanation: "零具體資訊。Standup 的目的是讓團隊知道你的具體進度和是否需要幫助。"),
                                Challenge.Option(id: "D", text: "Yesterday I started the day by checking my emails at 9am, then I had coffee and opened my laptop. I joined the meeting at 10am where we discussed several items including...", explanation: "流水帳式敘述。Standup 要的是成果和計劃，不是行程表。"),
                            ],
                            correctAnswer: "A",
                            hints: ["Standup 標準格式：Yesterday / Today / Blockers", "用動詞開頭、附具體的 PR 編號或人名"],
                            explanation: "Async standup 的黃金格式：\n• Yesterday：完成了什麼（用過去式 + 具體成果）\n• Today：計劃做什麼（用動詞原形 + 具體任務）\n• Blockers：有什麼卡住你的（附上誰在處理、ETA）\n每條用 bullet point，動詞開頭，附 PR 編號或人名讓團隊可以追蹤。",
                            frameworkTip: "Async standup 公式：Yesterday（Completed/Finished + 具體成果）→ Today（Start/Continue + 具體計劃）→ Blockers（None 或具體問題 + ETA）"
                        ),
                        Challenge(
                            id: 3,
                            name: "禮貌地說不",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "以下哪個回覆最能平衡「專業禮貌」和「設定合理期望」？",
                            scenario: Challenge.Scenario(
                                title: "拒絕不合理的 deadline",
                                narrative: "行銷主管 in Slack 上 DM 你：「Hey, can you pull a report on user acquisition by channel for the past 12 months? I need it by end of day today.」但你今天已經排滿了 sprint 工作，這個 request 正常需要 2 天。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "A", text: "Hi! I'd be happy to help with that. Just to set expectations — a thorough 12-month acquisition report typically takes about 2 days since I need to reconcile data across multiple sources. I can have it ready by Wednesday EOD.\n\nIf you need something sooner, I could pull a high-level summary (top-line numbers by channel) by tomorrow morning. Would that work as an interim solution?", explanation: "正確！先表示願意幫忙（\"happy to help\"）→ 解釋原因（\"reconcile data across multiple sources\"）→ 給合理 timeline → 提供替代方案（interim solution）。專業且不失禮貌。"),
                                Challenge.Option(id: "B", text: "Sorry, I can't do it today. I'm too busy.", explanation: "太直接且沒有提供替代方案。不解釋原因、不給新 timeline，對方會覺得你不合作。"),
                                Challenge.Option(id: "C", text: "Sure, I'll get it done by EOD!", explanation: "不切實際的承諾。如果做不到反而損害信任。設定不合理的期望比誠實說需要更多時間更糟糕。"),
                                Challenge.Option(id: "D", text: "That's not my responsibility. Please submit a request through the formal ticket system.", explanation: "語氣太冷漠。即使有正式流程，直接把人推走不是好的跨部門溝通方式。"),
                            ],
                            correctAnswer: "A",
                            hints: ["「說不」的關鍵是提供替代方案", "先 \"happy to help\"，再 \"set expectations\"，最後 \"alternative\""],
                            explanation: "職場中說不的 HEA 結構：\n• Happy to help：先表示善意（不是直接拒絕）\n• Explain + realistic timeline：解釋為什麼需要更多時間 + 給合理 deadline\n• Alternative：提供快速替代方案（\"interim solution\"、\"quick version\"）\n這樣對方感覺被重視，同時你也設定了合理的期望。",
                            frameworkTip: "說不的公式：Happy to help → Set expectations（原因 + 合理 timeline）→ Alternative（如果急的話我可以先...）。永遠不要只說「不行」而不給替代方案。"
                        ),
                    ]
                ),
                Quest(
                    id: "53-5",
                    name: "Boss: 寫作綜合",
                    description: "綜合運用 Email、會議紀錄、履歷和工作溝通的寫作能力",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "專案啟動溝通組合",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "請用英文撰寫以下三份文件（每份約 80-120 字）：\n\n1. **Kick-off meeting notes** — 包含 Decisions、Action Items（with owners and deadlines）、Notes\n2. **Slack message to the team channel** — 宣布專案啟動，簡要說明目標和時程\n3. **Email to your VP** — 報告專案規劃，請求 data warehouse access 的 approval\n\n注意每份文件的語氣和格式應該不同（meeting notes 結構化、Slack 簡潔友善、Email 正式專業）。",
                            scenario: Challenge.Scenario(
                                title: "新專案的溝通文件撰寫",
                                narrative: "你剛被指派為一個新專案的 lead：公司要建一個「客戶健康度評分系統」（Customer Health Score），用來預測哪些客戶可能流失。專案團隊有 Data Engineer（Kevin）、後端工程師（Tom）、PM（Lisa）、和你（Product Analyst）。專案期限是 8 週。\n\n你剛跟 Lisa 開完 kick-off meeting，決定了以下事項：\n• 第 1-2 週：資料探索和特徵工程（你 + Kevin）\n• 第 3-5 週：模型建置和 API 開發（你 + Tom）\n• 第 6-7 週：Dashboard 建置和 UAT（全團隊）\n• 第 8 週：上線和文件化\n• 健康分數包含：產品使用頻率、支援 ticket 數量、合約到期天數、NPS 分數\n• MVP 先做計算引擎和基礎 Dashboard，進階的 alert 系統放 Phase 2\n\n你需要寫三份文件。",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["三份文件的「讀者」不同：團隊成員 vs Slack 頻道 vs VP", "注意語氣調整：Notes 中性 → Slack 友善 → Email 專業"],
                            explanation: "這道題考驗你能否根據不同的溝通情境調整寫作風格：\n\n1. Meeting Notes：結構化、中性語氣、重點是可追蹤的 action items\n2. Slack：簡潔友善、用 emoji 和粗體提高可讀性、激發團隊動力\n3. Email to VP：正式專業、有明確的 ask（access request）、提供 context 但不過度冗長\n\n同樣的資訊，用三種不同的方式呈現，這是職場溝通的核心能力。",
                            frameworkTip: "溝通風格調整：Meeting Notes = 結構化+中性 / Slack = 簡潔+友善+emoji / Email to VP = 正式+有明確 ask。同樣的內容，根據讀者和管道調整格式與語氣。"
                        ),
                    ]
                ),
            ]
        ),
    ]
}
