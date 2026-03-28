import Foundation

struct Achievement: Identifiable {
    let id: String
    let name: String
    let nameEn: String
    let description: String
    let descriptionEn: String
    let icon: String
    var isUnlocked: Bool

    @MainActor func localizedName(_ lang: LanguageManager) -> String {
        lang.isEnglish ? nameEn : name
    }

    @MainActor func localizedDescription(_ lang: LanguageManager) -> String {
        lang.isEnglish ? descriptionEn : description
    }
}

enum AchievementDefinitions {
    static func all(progress: UserProgress) -> [Achievement] {
        let completedChallenges = progress.challengeStatus.values.filter { $0.completed }.count
        let completedQuests = progress.questStatus.values.filter { $0.completed }.count

        return [
            Achievement(
                id: "first_challenge",
                name: "初試身手",
                nameEn: "First Steps",
                description: "完成第一個挑戰",
                descriptionEn: "Complete your first challenge",
                icon: "star.fill",
                isUnlocked: completedChallenges >= 1
            ),
            Achievement(
                id: "challenge_10",
                name: "小有成就",
                nameEn: "Getting Started",
                description: "完成 10 個挑戰",
                descriptionEn: "Complete 10 challenges",
                icon: "flame.fill",
                isUnlocked: completedChallenges >= 10
            ),
            Achievement(
                id: "challenge_50",
                name: "挑戰達人",
                nameEn: "Challenge Master",
                description: "完成 50 個挑戰",
                descriptionEn: "Complete 50 challenges",
                icon: "bolt.fill",
                isUnlocked: completedChallenges >= 50
            ),
            Achievement(
                id: "challenge_100",
                name: "百戰百勝",
                nameEn: "Centurion",
                description: "完成 100 個挑戰",
                descriptionEn: "Complete 100 challenges",
                icon: "crown.fill",
                isUnlocked: completedChallenges >= 100
            ),
            Achievement(
                id: "quest_1",
                name: "任務起步",
                nameEn: "Quest Beginner",
                description: "完成第一個任務",
                descriptionEn: "Complete your first quest",
                icon: "flag.fill",
                isUnlocked: completedQuests >= 1
            ),
            Achievement(
                id: "quest_10",
                name: "任務征服者",
                nameEn: "Quest Conqueror",
                description: "完成 10 個任務",
                descriptionEn: "Complete 10 quests",
                icon: "trophy.fill",
                isUnlocked: completedQuests >= 10
            ),
            Achievement(
                id: "streak_3",
                name: "三日連勝",
                nameEn: "3-Day Streak",
                description: "連續學習 3 天",
                descriptionEn: "Study for 3 days in a row",
                icon: "calendar.badge.checkmark",
                isUnlocked: progress.longestStreak >= 3
            ),
            Achievement(
                id: "streak_7",
                name: "一週不懈",
                nameEn: "Week Warrior",
                description: "連續學習 7 天",
                descriptionEn: "Study for 7 days in a row",
                icon: "medal.fill",
                isUnlocked: progress.longestStreak >= 7
            ),
            Achievement(
                id: "streak_30",
                name: "月度達人",
                nameEn: "Monthly Master",
                description: "連續學習 30 天",
                descriptionEn: "Study for 30 days in a row",
                icon: "sparkles",
                isUnlocked: progress.longestStreak >= 30
            ),
            Achievement(
                id: "xp_500",
                name: "經驗新手",
                nameEn: "XP Rookie",
                description: "累計獲得 500 XP",
                descriptionEn: "Earn 500 total XP",
                icon: "bolt.circle.fill",
                isUnlocked: progress.totalXp >= 500
            ),
            Achievement(
                id: "xp_2000",
                name: "經驗行家",
                nameEn: "XP Expert",
                description: "累計獲得 2000 XP",
                descriptionEn: "Earn 2000 total XP",
                icon: "star.circle.fill",
                isUnlocked: progress.totalXp >= 2000
            ),
            Achievement(
                id: "xp_5000",
                name: "經驗大師",
                nameEn: "XP Master",
                description: "累計獲得 5000 XP",
                descriptionEn: "Earn 5000 total XP",
                icon: "diamond.fill",
                isUnlocked: progress.totalXp >= 5000
            ),
        ]
    }
}
