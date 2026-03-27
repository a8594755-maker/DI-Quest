import Foundation

enum XPCalculator {
    static let levels: [LevelTier] = [
        LevelTier(level: 1, title: "Trainee Analyst", minXp: 0),
        LevelTier(level: 2, title: "Trainee Analyst", minXp: 100),
        LevelTier(level: 3, title: "Trainee Analyst", minXp: 200),
        LevelTier(level: 4, title: "Trainee Analyst", minXp: 350),
        LevelTier(level: 5, title: "Junior Analyst", minXp: 500),
        LevelTier(level: 6, title: "Junior Analyst", minXp: 700),
        LevelTier(level: 7, title: "Junior Analyst", minXp: 900),
        LevelTier(level: 8, title: "Junior Analyst", minXp: 1100),
        LevelTier(level: 10, title: "Data Interpreter", minXp: 1200),
        LevelTier(level: 12, title: "Data Interpreter", minXp: 1600),
        LevelTier(level: 15, title: "Business Analyst", minXp: 2000),
        LevelTier(level: 18, title: "Business Analyst", minXp: 2500),
        LevelTier(level: 20, title: "Product Analyst", minXp: 3000),
        LevelTier(level: 22, title: "Product Analyst", minXp: 3500),
        LevelTier(level: 25, title: "Senior Analyst", minXp: 4500),
        LevelTier(level: 28, title: "Senior Analyst", minXp: 5200),
        LevelTier(level: 30, title: "Chief Analytics Officer", minXp: 6000),
    ]

    static func getLevelInfo(totalXp: Int) -> LevelInfo {
        var current = levels[0]
        var nextTier: LevelTier? = levels.count > 1 ? levels[1] : nil

        for i in stride(from: levels.count - 1, through: 0, by: -1) {
            if totalXp >= levels[i].minXp {
                current = levels[i]
                nextTier = i + 1 < levels.count ? levels[i + 1] : nil
                break
            }
        }

        let progress: Double
        if let next = nextTier {
            let range = next.minXp - current.minXp
            progress = range > 0 ? Double(totalXp - current.minXp) / Double(range) : 1.0
        } else {
            progress = 1.0
        }

        return LevelInfo(
            level: current.level,
            title: current.title,
            currentXp: totalXp,
            xpForNext: nextTier?.minXp ?? current.minXp,
            progress: progress
        )
    }

    static func calculateChallengeXp(baseXp: Int, usedHints: Int = 0, attempts: Int = 1) -> Int {
        var xp = baseXp
        if usedHints == 0 && attempts == 1 {
            xp = Int(Double(xp) * 1.5)
        } else if usedHints > 0 {
            xp = max(10, xp - usedHints * 20)
        }
        return xp
    }
}
