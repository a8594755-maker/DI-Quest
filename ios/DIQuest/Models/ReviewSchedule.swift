import Foundation

struct ReviewSchedule: Codable {
    var nextReviewDate: String
    var interval: Int
    var repetition: Int
    var easeFactor: Double
    var lastQuality: Int
}
