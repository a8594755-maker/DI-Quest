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

        let earnedXp = isReview ? 0 : XPCalculator.calculateChallengeXp(
            baseXp: baseXp, usedHints: usedHints, attempts: attempts
        )

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
            progress.totalXp += earnedXp
            progress.challengeStatus[key] = UserProgress.ChallengeStatus(
                completed: true, score: score, usedHints: usedHints, attempts: attempts, earnedXp: earnedXp
            )
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
        if !isReview { stats.challengesCompleted += 1 }
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

    // MARK: - Query Helpers

    func isQuestCompleted(_ questId: String) -> Bool {
        progress.questStatus[questId]?.completed ?? false
    }

    func isChallengeCompleted(questId: String, challengeId: Int) -> Bool {
        progress.challengeStatus["\(questId)-\(challengeId)"]?.completed ?? false
    }

    func questCompletionCount(for world: World) -> Int {
        world.quests.filter { isQuestCompleted($0.id) }.count
    }

    func worldProgress(for world: World) -> Double {
        guard !world.quests.isEmpty else { return 0 }
        return Double(questCompletionCount(for: world)) / Double(world.quests.count)
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
