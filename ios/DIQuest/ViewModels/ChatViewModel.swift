import Foundation

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText = ""
    @Published var isLoading = false
    @Published var sessions: [ChatSession] = []
    @Published var currentSessionId: UUID?
    @Published var todayApiCalls = 0

    private weak var authManager: AuthManager?
    private weak var progressVM: QuestProgressViewModel?
    private static let storageKey = "di-quest-chat-sessions"
    private static let maxSessions = 30
    static let dailyLimit = 20

    var isPremium: Bool { authManager?.isPremium ?? false }
    var remainingCalls: Int { isPremium ? .max : max(0, Self.dailyLimit - todayApiCalls) }
    var canCallApi: Bool { isPremium || todayApiCalls < Self.dailyLimit }

    func configure(authManager: AuthManager, progressVM: QuestProgressViewModel) {
        self.authManager = authManager
        self.progressVM = progressVM
        loadSessions()
        Task { await fetchTodayUsage() }
    }

    private func fetchTodayUsage() async {
        guard let userId = authManager?.currentUserId, let token = authManager?.accessToken else { return }
        let today = todayString()
        guard let url = URL(string: "\(AppConfig.supabaseURL)/rest/v1/api_usage?user_id=eq.\(userId)&usage_date=eq.\(today)&select=call_count") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        if let (data, _) = try? await URLSession.shared.data(for: request),
           let rows = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]],
           let row = rows.first,
           let count = row["call_count"] as? Int {
            todayApiCalls = count
        }
    }

    private func incrementUsage() async {
        guard let userId = authManager?.currentUserId, let token = authManager?.accessToken else { return }
        if isPremium { return }
        let today = todayString()

        if todayApiCalls == 0 {
            // Insert
            guard let url = URL(string: "\(AppConfig.supabaseURL)/rest/v1/api_usage") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("resolution=merge-duplicates", forHTTPHeaderField: "Prefer")
            request.httpBody = try? JSONSerialization.data(withJSONObject: [
                "user_id": userId, "usage_date": today, "call_count": 1
            ])
            _ = try? await URLSession.shared.data(for: request)
        } else {
            // Update
            guard let url = URL(string: "\(AppConfig.supabaseURL)/rest/v1/api_usage?user_id=eq.\(userId)&usage_date=eq.\(today)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("return=minimal", forHTTPHeaderField: "Prefer")
            request.httpBody = try? JSONSerialization.data(withJSONObject: ["call_count": todayApiCalls + 1])
            _ = try? await URLSession.shared.data(for: request)
        }
        todayApiCalls += 1
    }

    private func todayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }

    // MARK: - Session Management

    func startNewSession(lang: LanguageManager) {
        saveCurrentSession()
        let session = ChatSession()
        sessions.insert(session, at: 0)
        currentSessionId = session.id
        messages = []
        addGreeting(lang: lang)
        saveSessions()
    }

    func loadSession(_ session: ChatSession) {
        saveCurrentSession()
        currentSessionId = session.id
        messages = session.messages
    }

    func deleteSession(_ session: ChatSession) {
        sessions.removeAll { $0.id == session.id }
        if currentSessionId == session.id {
            currentSessionId = sessions.first?.id
            messages = sessions.first?.messages ?? []
        }
        saveSessions()
    }

    func addGreeting(lang: LanguageManager) {
        messages.append(ChatMessage(role: .assistant, content: lang.string("chat.greeting")))
    }

    func sendMessage(_ text: String, lang: LanguageManager) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        inputText = ""
        messages.append(ChatMessage(role: .user, content: trimmed))

        // Auto-create session if none exists
        if currentSessionId == nil {
            let session = ChatSession()
            sessions.insert(session, at: 0)
            currentSessionId = session.id
        }

        // Try local knowledge base first
        if let localResponse = checkKnowledgeBase(trimmed, lang: lang) {
            messages.append(ChatMessage(role: .assistant, content: localResponse))
            saveCurrentSession()
            return
        }

        // Check rate limit for non-premium users
        if !canCallApi {
            let limitMsg = lang.isEnglish
                ? "You've reached today's limit (\(Self.dailyLimit) calls/day). Upgrade to Premium for unlimited access!"
                : "你已達到今日上限（每天 \(Self.dailyLimit) 次）。升級進階版享受無限使用！"
            messages.append(ChatMessage(role: .assistant, content: limitMsg))
            saveCurrentSession()
            return
        }

        callAI(userMessage: trimmed, lang: lang)
    }

    // MARK: - Persistence

    private func saveCurrentSession() {
        guard let id = currentSessionId,
              let idx = sessions.firstIndex(where: { $0.id == id }) else { return }
        sessions[idx].messages = messages
        sessions[idx].updatedAt = Date()
        sessions[idx].updateTitle()
        saveSessions()
    }

    private func saveSessions() {
        // Keep max sessions
        if sessions.count > Self.maxSessions {
            sessions = Array(sessions.prefix(Self.maxSessions))
        }
        if let data = try? JSONEncoder().encode(sessions) {
            UserDefaults.standard.set(data, forKey: Self.storageKey)
        }
    }

    private func loadSessions() {
        guard let data = UserDefaults.standard.data(forKey: Self.storageKey),
              let saved = try? JSONDecoder().decode([ChatSession].self, from: data) else { return }
        sessions = saved
        // Load most recent session
        if let first = sessions.first {
            currentSessionId = first.id
            messages = first.messages
        }
    }

    // MARK: - Knowledge Base (local responses)

    private func checkKnowledgeBase(_ text: String, lang: LanguageManager) -> String? {
        let lower = text.lowercased()

        if lower.contains("進度") || lower.contains("progress") || lower.contains("level") || lower.contains("等級") {
            guard let vm = progressVM else { return nil }
            let info = vm.levelInfo
            let quests = vm.progress.questStatus.values.filter { $0.completed }.count
            let challenges = vm.progress.challengeStatus.values.filter { $0.completed }.count
            if lang.isEnglish {
                return "Here's your progress:\n\n• **Level**: Lv.\(info.level) \(info.title)\n• **XP**: \(info.currentXp)\n• **Quests completed**: \(quests)\n• **Challenges completed**: \(challenges)\n• **Streak**: \(vm.progress.streakDays) days\n\nKeep going!"
            } else {
                return "你的進度：\n\n• **等級**：Lv.\(info.level) \(info.title)\n• **經驗值**：\(info.currentXp) XP\n• **已完成任務**：\(quests) 個\n• **已完成挑戰**：\(challenges) 個\n• **連續天數**：\(vm.progress.streakDays) 天\n\n繼續加油！"
            }
        }

        if lower.contains("kpi") || lower.contains("指標") {
            if lang.isEnglish {
                return "**KPI (Key Performance Indicator)** is a measurable metric that evaluates whether a team or project is achieving its goals.\n\n**Key Types:**\n• **Leading Indicators** — predict future results (e.g., pipeline, demo bookings)\n• **Lagging Indicators** — measure past results (e.g., revenue, churn rate)\n• **Guardrail Metrics** — ensure you're not sacrificing other areas\n\n**Common KPIs:**\n• SaaS: MRR, NRR, CAC, LTV\n• Product: DAU/MAU, Retention, Activation Rate\n• E-commerce: Conversion Rate, AOV, Cart Abandonment\n\nWant to explore a specific KPI deeper?"
            } else {
                return "**KPI（關鍵績效指標）** 是用來衡量團隊或專案是否達成目標的可量化指標。\n\n**主要分類：**\n• **Leading Indicators** — 預測未來結果（如 pipeline、demo 數量）\n• **Lagging Indicators** — 衡量過去結果（如營收、流失率）\n• **Guardrail Metrics** — 確保不犧牲其他面向\n\n**常見 KPI：**\n• SaaS：MRR、NRR、CAC、LTV\n• 產品：DAU/MAU、Retention、Activation Rate\n• 電商：Conversion Rate、AOV、購物車放棄率\n\n想深入了解某個 KPI 嗎？"
            }
        }

        if lower.contains("funnel") || lower.contains("漏斗") {
            if lang.isEnglish {
                return "**Funnel Analysis** tracks users through sequential steps to find where they drop off.\n\n**Steps:**\n1. Define the funnel stages (e.g., Visit → Sign Up → Activate → Purchase)\n2. Measure conversion rate at each step\n3. Find the biggest drop-off\n4. Investigate root cause\n\n**Tips:**\n• Always look at the **absolute numbers**, not just percentages\n• Segment by user type, device, or acquisition channel\n• Compare time periods to spot trends\n\nThe biggest drop-off = your highest-impact optimization opportunity!"
            } else {
                return "**Funnel Analysis（漏斗分析）** 追蹤用戶經過每個步驟的轉換率，找出流失最嚴重的環節。\n\n**步驟：**\n1. 定義漏斗階段（如：訪問 → 註冊 → 啟動 → 付費）\n2. 計算每一步的轉換率\n3. 找到最大的 drop-off\n4. 調查根因\n\n**技巧：**\n• 同時看**絕對數字**和百分比\n• 按用戶類型、裝置、獲客管道切分\n• 比較不同時間段找趨勢\n\n最大的 drop-off = 最值得優化的地方！"
            }
        }

        if lower.contains("cohort") || lower.contains("世代") {
            if lang.isEnglish {
                return "**Cohort Analysis** groups users by a shared characteristic (usually signup date) and tracks their behavior over time.\n\n**Why it matters:**\n• Reveals if newer users behave differently than older ones\n• Shows true retention trends (not masked by growth)\n• Helps evaluate feature impact\n\n**How to read a cohort table:**\n• Rows = cohorts (e.g., Jan signups, Feb signups)\n• Columns = time periods (Week 1, Week 2...)\n• Cells = % still active\n\nA healthy product shows improving cohort curves over time!"
            } else {
                return "**Cohort Analysis（世代分析）** 把用戶按某個特徵（通常是註冊時間）分組，追蹤他們隨時間的行為變化。\n\n**為什麼重要：**\n• 揭示新舊用戶的行為差異\n• 顯示真實留存趨勢（不被增長數據掩蓋）\n• 幫助評估功能改版效果\n\n**怎麼讀 cohort 表：**\n• 行 = 世代（如一月註冊、二月註冊）\n• 列 = 時間段（第1週、第2週...）\n• 格子 = 仍活躍的百分比\n\n健康的產品會顯示 cohort 曲線逐漸改善！"
            }
        }

        if lower.contains("a/b test") || lower.contains("ab test") || lower.contains("實驗") {
            if lang.isEnglish {
                return "**A/B Testing** is a controlled experiment to compare two versions.\n\n**Key Steps:**\n1. **Hypothesis**: What do you expect to change?\n2. **Metric**: What's your primary success metric?\n3. **Sample Size**: Use a calculator to determine minimum size\n4. **Duration**: Run long enough for statistical significance (usually p < 0.05)\n5. **Analysis**: Compare treatment vs control\n\n**Common Pitfalls:**\n• Peeking at results too early\n• Testing too many variables at once\n• Not considering novelty effect\n• Ignoring segment-level results"
            } else {
                return "**A/B Testing（A/B 測試）** 是一種對照實驗，比較兩個版本的表現。\n\n**關鍵步驟：**\n1. **假設**：你預期什麼會改變？\n2. **指標**：主要成功指標是什麼？\n3. **樣本量**：用計算器確定最小樣本數\n4. **持續時間**：跑到統計顯著（通常 p < 0.05）\n5. **分析**：比較實驗組和對照組\n\n**常見錯誤：**\n• 太早偷看結果\n• 同時測試太多變數\n• 忽略新鮮感效應\n• 沒有看分群結果"
            }
        }

        if lower.contains("segment") || lower.contains("分群") || lower.contains("切分") {
            if lang.isEnglish {
                return "**Segmentation** divides users into meaningful groups to uncover hidden patterns.\n\n**Common Dimensions:**\n• **Demographics**: age, location, industry\n• **Behavior**: power users vs casual, feature usage\n• **Lifecycle**: new vs returning, trial vs paid\n• **Acquisition**: organic vs paid, channel\n\n**Framework for interviews:**\n1. Start with the aggregate metric\n2. Ask \"Is this metric the same across all segments?\"\n3. Cut by 2-3 dimensions\n4. Find the outlier segment\n5. Deep-dive into root cause"
            } else {
                return "**Segmentation（分群分析）** 把用戶分成有意義的群組，挖掘隱藏的模式。\n\n**常見切分維度：**\n• **人口統計**：年齡、地區、產業\n• **行為**：重度用戶 vs 輕度用戶、功能使用\n• **生命週期**：新用戶 vs 回訪、試用 vs 付費\n• **獲客管道**：自然流量 vs 付費、來源渠道\n\n**面試框架：**\n1. 先看整體指標\n2. 問「這個指標在所有分群都一樣嗎？」\n3. 用 2-3 個維度切分\n4. 找到異常分群\n5. 深入分析根因"
            }
        }

        return nil
    }

    // MARK: - DeepSeek API

    private func callAI(userMessage: String, lang: LanguageManager) {
        isLoading = true

        let levelInfo = progressVM?.levelInfo
        let langStr = lang.isEnglish ? "English" : "Traditional Chinese"

        let systemPrompt = """
        You are "\(lang.string("chat.botName"))", a friendly interview practice coach (NPC of the DI Quest learning platform).
        Your job is to help users prepare for business Case Study interviews, covering topics like:
        - Problem decomposition, KPI analysis, Funnel, Segmentation, Cohort, A/B Testing, Process optimization, Product Thinking
        Reply in \(langStr). Keep answers concise, structured, and encouraging. Use real business examples. Stay under 300 words.
        Use markdown formatting for structure (bold, lists, headings).
        User's current level: Lv.\(levelInfo?.level ?? 1) \(levelInfo?.title ?? "Trainee"), \(levelInfo?.currentXp ?? 0) XP total.
        """

        let apiMessages: [[String: String]] = [
            ["role": "system", "content": systemPrompt]
        ] + messages.suffix(10).map { msg in
            ["role": msg.role == .user ? "user" : "assistant", "content": msg.content]
        }

        Task {
            defer {
                isLoading = false
                saveCurrentSession()
            }
            do {
                let reply = try await callDeepSeek(messages: apiMessages)
                messages.append(ChatMessage(role: .assistant, content: reply))
                await incrementUsage()
            } catch {
                messages.append(ChatMessage(role: .assistant, content: lang.string("chat.error")))
            }
        }
    }

    private func callDeepSeek(messages: [[String: String]]) async throws -> String {
        guard let url = URL(string: "\(AppConfig.supabaseURL)/functions/v1/deepseek-chat") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")

        if let token = authManager?.accessToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        let body: [String: Any] = [
            "messages": messages,
            "model": "deepseek-chat"
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let choices = json["choices"] as? [[String: Any]],
              let firstChoice = choices.first,
              let message = firstChoice["message"] as? [String: Any],
              let content = message["content"] as? String else {
            throw URLError(.cannotParseResponse)
        }

        return content
    }
}
