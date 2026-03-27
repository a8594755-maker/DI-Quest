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
        reviewSchedule: [:]
    )
}
