import Foundation

enum SpacedRepetition {
    struct ReviewResult {
        let nextInterval: Int
        let nextRepetition: Int
        let nextEaseFactor: Double
    }

    static func calculateNextReview(quality: Int, repetition: Int, easeFactor: Double, interval: Int) -> ReviewResult {
        var nextEaseFactor = easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
        nextEaseFactor = max(1.3, nextEaseFactor)

        let nextInterval: Int
        let nextRepetition: Int

        if quality < 3 {
            // Poor answer — reset
            nextRepetition = 0
            nextInterval = 1
        } else {
            nextRepetition = repetition + 1
            if repetition == 0 {
                nextInterval = 1
            } else if repetition == 1 {
                nextInterval = 6
            } else {
                nextInterval = Int((Double(interval) * nextEaseFactor).rounded())
            }
        }

        return ReviewResult(
            nextInterval: nextInterval,
            nextRepetition: nextRepetition,
            nextEaseFactor: nextEaseFactor
        )
    }

    static func performanceToQuality(score: Int, usedHints: Int, attempts: Int) -> Int {
        if score < 50 { return 1 }
        if attempts > 3 { return 2 }
        if usedHints >= 3 { return 2 }
        if usedHints >= 2 { return 3 }
        if usedHints >= 1 || attempts > 1 { return 3 }
        if score >= 100 && usedHints == 0 && attempts <= 1 { return 5 }
        return 4
    }

    static func isDueForReview(_ schedule: ReviewSchedule, today: String) -> Bool {
        return schedule.nextReviewDate <= today
    }

    static func getDueReviews(from reviewSchedule: [String: ReviewSchedule], today: String) -> [(key: String, worldId: String, questId: String, challengeId: String, schedule: ReviewSchedule)] {
        return reviewSchedule.compactMap { key, data in
            guard isDueForReview(data, today: today) else { return nil }
            let parts = key.split(separator: "-")
            guard parts.count >= 3 else { return nil }
            return (
                key: key,
                worldId: String(parts[0]),
                questId: "\(parts[0])-\(parts[1])",
                challengeId: String(parts[2]),
                schedule: data
            )
        }
    }
}
