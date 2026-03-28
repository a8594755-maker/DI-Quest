import Foundation

struct UserProgress: Codable {
    var totalXp: Int
    var questStatus: [String: QuestStatus]
    var challengeStatus: [String: ChallengeStatus]
    var achievements: [String]
    var streakDays: Int
    var longestStreak: Int
    var streakFreezes: Int
    var lastActiveDate: String?
    var checkedInToday: Bool
    var analytics: Analytics
    var reviewSchedule: [String: ReviewSchedule]
    var devMode: Bool

    struct QuestStatus: Codable {
        var completed: Bool
        var score: Int?
        var completedAt: String?
    }

    struct ChallengeStatus: Codable {
        var completed: Bool
        var score: Int?
        var usedHints: Int?
        var attempts: Int?
        var earnedXp: Int?
    }

    struct Analytics: Codable {
        var challengeTimings: [String: ChallengeTiming]
        var dailyStats: [String: DailyStats]
    }

    struct ChallengeTiming: Codable {
        var lastDurationMs: Int?
        var bestTimeMs: Int?
        var attemptDates: [String]
    }

    struct DailyStats: Codable {
        var challengesCompleted: Int
        var xpEarned: Int
        var timeSpentMs: Int
    }

    // Custom coding to handle devMode being absent in older data
    enum CodingKeys: String, CodingKey {
        case totalXp, questStatus, challengeStatus, achievements
        case streakDays, longestStreak, streakFreezes
        case lastActiveDate, checkedInToday, analytics, reviewSchedule, devMode
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        totalXp = try c.decodeIfPresent(Int.self, forKey: .totalXp) ?? 0
        questStatus = try c.decodeIfPresent([String: QuestStatus].self, forKey: .questStatus) ?? [:]
        challengeStatus = try c.decodeIfPresent([String: ChallengeStatus].self, forKey: .challengeStatus) ?? [:]
        achievements = try c.decodeIfPresent([String].self, forKey: .achievements) ?? []
        streakDays = try c.decodeIfPresent(Int.self, forKey: .streakDays) ?? 0
        longestStreak = try c.decodeIfPresent(Int.self, forKey: .longestStreak) ?? 0
        streakFreezes = try c.decodeIfPresent(Int.self, forKey: .streakFreezes) ?? 1
        lastActiveDate = try c.decodeIfPresent(String.self, forKey: .lastActiveDate)
        checkedInToday = try c.decodeIfPresent(Bool.self, forKey: .checkedInToday) ?? false
        analytics = try c.decodeIfPresent(Analytics.self, forKey: .analytics) ?? Analytics(challengeTimings: [:], dailyStats: [:])
        reviewSchedule = try c.decodeIfPresent([String: ReviewSchedule].self, forKey: .reviewSchedule) ?? [:]
        devMode = try c.decodeIfPresent(Bool.self, forKey: .devMode) ?? false
    }

    init(totalXp: Int, questStatus: [String: QuestStatus], challengeStatus: [String: ChallengeStatus],
         achievements: [String], streakDays: Int, longestStreak: Int, streakFreezes: Int,
         lastActiveDate: String?, checkedInToday: Bool, analytics: Analytics,
         reviewSchedule: [String: ReviewSchedule], devMode: Bool = false) {
        self.totalXp = totalXp
        self.questStatus = questStatus
        self.challengeStatus = challengeStatus
        self.achievements = achievements
        self.streakDays = streakDays
        self.longestStreak = longestStreak
        self.streakFreezes = streakFreezes
        self.lastActiveDate = lastActiveDate
        self.checkedInToday = checkedInToday
        self.analytics = analytics
        self.reviewSchedule = reviewSchedule
        self.devMode = devMode
    }

    static let empty = UserProgress(
        totalXp: 0,
        questStatus: [:],
        challengeStatus: [:],
        achievements: [],
        streakDays: 0,
        longestStreak: 0,
        streakFreezes: 1,
        lastActiveDate: nil,
        checkedInToday: false,
        analytics: Analytics(challengeTimings: [:], dailyStats: [:]),
        reviewSchedule: [:],
        devMode: false
    )
}
