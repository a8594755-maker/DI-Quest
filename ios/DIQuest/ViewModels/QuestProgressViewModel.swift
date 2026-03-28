import Foundation

@MainActor
final class QuestProgressViewModel: ObservableObject {
    @Published var progress: UserProgress = .empty
    @Published var levelInfo: LevelInfo = XPCalculator.getLevelInfo(totalXp: 0)
    @Published var isSyncing = false

    private var dataService: SupabaseDataService?

    func configure(dataService: SupabaseDataService) {
        self.dataService = dataService
    }

    // MARK: - Load / Sync

    func loadProgress() async {
        isSyncing = true
        defer { isSyncing = false }

        // Try cloud first
        if let cloudProgress = try? await dataService?.fetchProgress() {
            self.progress = cloudProgress
        } else {
            // Fall back to local
            loadLocal()
        }
        recalculateLevel()
    }

    func saveProgress() async {
        saveLocal()
        try? await dataService?.saveProgress(progress)
        try? await dataService?.syncProfile(
            totalXp: progress.totalXp,
            streakDays: progress.streakDays,
            longestStreak: progress.longestStreak,
            lastActiveDate: progress.lastActiveDate
        )
    }

    // MARK: - Actions

    func completeChallenge(
        questId: String,
        challengeId: Int,
        score: Int,
        baseXp: Int,
        usedHints: Int,
        attempts: Int,
        code: String? = nil,
        isReview: Bool = false
    ) {
        let key = "\(questId)-\(challengeId)"
        let prev = progress.challengeStatus[key]
        if prev?.completed == true && !isReview { return }

        // Only award XP for correct answers (score > 0)
        let earnedXp: Int
        if isReview || score == 0 {
            earnedXp = 0
        } else {
            earnedXp = XPCalculator.calculateChallengeXp(
                baseXp: baseXp, usedHints: usedHints, attempts: attempts
            )
        }

        // Spaced repetition
        let quality = SpacedRepetition.performanceToQuality(
            score: score, usedHints: usedHints, attempts: attempts
        )
        let prevReview = progress.reviewSchedule[key] ?? ReviewSchedule(
            nextReviewDate: "", interval: 0, repetition: 0, easeFactor: 2.5, lastQuality: 0
        )
        let result = SpacedRepetition.calculateNextReview(
            quality: quality,
            repetition: prevReview.repetition,
            easeFactor: prevReview.easeFactor,
            interval: prevReview.interval
        )
        let nextDate = Calendar.current.date(byAdding: .day, value: result.nextInterval, to: Date())!
        let nextReviewDate = ISO8601DateFormatter().string(from: nextDate).prefix(10)

        if !isReview {
            // Only mark as completed and award XP for correct answers
            if score > 0 {
                progress.totalXp += earnedXp
                progress.challengeStatus[key] = UserProgress.ChallengeStatus(
                    completed: true, score: score, usedHints: usedHints, attempts: attempts, earnedXp: earnedXp
                )
            }
            // Wrong answers: do NOT mark as completed, so user must retry
        }

        progress.reviewSchedule[key] = ReviewSchedule(
            nextReviewDate: String(nextReviewDate),
            interval: result.nextInterval,
            repetition: result.nextRepetition,
            easeFactor: result.nextEaseFactor,
            lastQuality: quality
        )

        // Daily stats
        let today = todayString()
        var stats = progress.analytics.dailyStats[today] ?? UserProgress.DailyStats(
            challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0
        )
        if !isReview && score > 0 { stats.challengesCompleted += 1 }
        stats.xpEarned += earnedXp
        progress.analytics.dailyStats[today] = stats

        recalculateLevel()
        Task { await saveProgress() }
    }

    func completeQuest(questId: String, score: Int, bonusXp: Int = 0) {
        guard progress.questStatus[questId]?.completed != true else { return }
        progress.totalXp += bonusXp
        progress.questStatus[questId] = UserProgress.QuestStatus(
            completed: true, score: score, completedAt: Date().ISO8601Format()
        )
        recalculateLevel()
        Task { await saveProgress() }
    }

    func updateStreak() {
        let today = todayString()
        guard progress.lastActiveDate != today else { return }

        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let yesterdayStr = dateString(yesterday)

        if progress.lastActiveDate == yesterdayStr {
            progress.streakDays += 1
        } else if progress.lastActiveDate != nil {
            if progress.streakFreezes > 0 {
                progress.streakFreezes -= 1
            } else {
                progress.streakDays = 1
            }
        } else {
            progress.streakDays = 1
        }

        progress.longestStreak = max(progress.longestStreak, progress.streakDays)
        progress.lastActiveDate = today
        progress.checkedInToday = false
        Task { await saveProgress() }
    }

    func dailyCheckin(bonusXp: Int) {
        guard !progress.checkedInToday else { return }
        progress.totalXp += bonusXp
        progress.checkedInToday = true

        let today = todayString()
        var stats = progress.analytics.dailyStats[today] ?? UserProgress.DailyStats(
            challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0
        )
        stats.xpEarned += bonusXp
        progress.analytics.dailyStats[today] = stats

        recalculateLevel()
        Task { await saveProgress() }
    }

    // MARK: - Challenge Timing (matches web RECORD_CHALLENGE_TIMING)

    func recordChallengeTiming(questId: String, challengeId: Int, durationMs: Int) {
        let key = "\(questId)-\(challengeId)"
        let today = todayString()
        let prev = progress.analytics.challengeTimings[key] ?? UserProgress.ChallengeTiming(
            lastDurationMs: nil, bestTimeMs: nil, attemptDates: []
        )

        let prevBest = prev.bestTimeMs ?? durationMs
        var dates = prev.attemptDates
        if dates.count > 19 { dates = Array(dates.suffix(19)) }
        dates.append(today)

        progress.analytics.challengeTimings[key] = UserProgress.ChallengeTiming(
            lastDurationMs: durationMs,
            bestTimeMs: min(prevBest, durationMs),
            attemptDates: dates
        )

        // Update daily timeSpentMs
        var stats = progress.analytics.dailyStats[today] ?? UserProgress.DailyStats(
            challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0
        )
        stats.timeSpentMs += durationMs
        progress.analytics.dailyStats[today] = stats

        Task { await saveProgress() }
    }

    // MARK: - Analytics Summary (matches web getAnalyticsSummary)

    struct AnalyticsSummary {
        let weeklyTimeMs: Int
        let weeklyChallenges: Int
        let avgChallengeTimeMs: Int
        let velocityPerDay: String
    }

    var analyticsSummary: AnalyticsSummary {
        let dailyStats = progress.analytics.dailyStats
        let challengeTimings = progress.analytics.challengeTimings

        let now = Date()
        let last7 = dailyStats.filter { entry in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            guard let date = formatter.date(from: entry.key) else { return false }
            let diff = now.timeIntervalSince(date) / 86400
            return diff <= 7
        }

        let totalTimeMs = last7.values.reduce(0) { $0 + $1.timeSpentMs }
        let totalChallenges = last7.values.reduce(0) { $0 + $1.challengesCompleted }

        let timingEntries = Array(challengeTimings.values)
        let avgTimeMs: Int
        if timingEntries.isEmpty {
            avgTimeMs = 0
        } else {
            let total = timingEntries.reduce(0) { $0 + ($1.lastDurationMs ?? 0) }
            avgTimeMs = total / timingEntries.count
        }

        let daysCount = max(last7.count, 1)
        let velocity = String(format: "%.1f", Double(totalChallenges) / Double(daysCount))

        return AnalyticsSummary(
            weeklyTimeMs: totalTimeMs,
            weeklyChallenges: totalChallenges,
            avgChallengeTimeMs: avgTimeMs,
            velocityPerDay: last7.isEmpty ? "0" : velocity
        )
    }

    // MARK: - Due Review Count (matches web getDueReviewCount)

    var dueReviewCount: Int {
        let today = todayString()
        return progress.reviewSchedule.values.filter { $0.nextReviewDate <= today }.count
    }

    // MARK: - Query Helpers

    func isQuestCompleted(_ questId: String) -> Bool {
        progress.questStatus[questId]?.completed ?? false
    }

    func isChallengeCompleted(questId: String, challengeId: Int) -> Bool {
        progress.challengeStatus["\(questId)-\(challengeId)"]?.completed ?? false
    }

    /// Count completed challenges within a quest (matches web getQuestProgress)
    func getQuestProgress(questId: String, totalChallenges: Int) -> Int {
        var completed = 0
        for i in 1...totalChallenges {
            if progress.challengeStatus["\(questId)-\(i)"]?.completed == true {
                completed += 1
            }
        }
        return completed
    }

    func questCompletionCount(for world: World) -> Int {
        world.quests.filter { isQuestCompleted($0.id) }.count
    }

    func worldProgress(for world: World) -> Double {
        guard !world.quests.isEmpty else { return 0 }
        return Double(questCompletionCount(for: world)) / Double(world.quests.count)
    }

    // MARK: - Dev Mode (matches web TOGGLE_DEV_MODE)

    func toggleDevMode() {
        progress.devMode.toggle()
        Task { await saveProgress() }
    }

    // MARK: - Daily Check-in XP Calculator (matches web formula)

    static func checkinBonusXp(streakDays: Int) -> Int {
        min(10 + streakDays * 5, 50)
    }

    // MARK: - Unlock Logic (Premium/DevMode = all unlocked, Free = sequential)

    func isWorldUnlocked(_ worldId: Int, isPremium: Bool) -> Bool {
        if isPremium || progress.devMode { return true }
        guard let branch = BranchData.branchForWorld(worldId) else { return true }
        guard let idx = branch.worldIds.firstIndex(of: worldId) else { return true }
        if idx == 0 { return true } // First world in branch always unlocked

        // Previous world's last quest must be completed
        let prevWorldId = branch.worldIds[idx - 1]
        guard let prevWorld = WorldDataRegistry.world(id: prevWorldId),
              let lastQuest = prevWorld.quests.last else { return true }
        return isQuestCompleted(lastQuest.id)
    }

    func isQuestUnlocked(_ questId: String, in world: World, isPremium: Bool) -> Bool {
        if isPremium || progress.devMode { return true }
        let parts = questId.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 2 else { return true }
        let questNum = parts[1]

        // First quest in world: check world unlock
        if questNum == 1 { return isWorldUnlocked(world.id, isPremium: isPremium) }

        // Otherwise, previous quest in same world must be completed
        let prevQuestId = "\(parts[0])-\(questNum - 1)"
        return isQuestCompleted(prevQuestId)
    }

    // MARK: - Private

    private func recalculateLevel() {
        levelInfo = XPCalculator.getLevelInfo(totalXp: progress.totalXp)
    }

    private func todayString() -> String {
        dateString(Date())
    }

    private func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    // MARK: - Local Storage

    private static let storageKey = "di-quest-progress"

    private func saveLocal() {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: Self.storageKey)
        }
    }

    private func loadLocal() {
        if let data = UserDefaults.standard.data(forKey: Self.storageKey),
           let saved = try? JSONDecoder().decode(UserProgress.self, from: data) {
            self.progress = saved
        }
    }
}
