import Foundation

struct LeaderboardEntry: Identifiable, Codable {
    let id: String
    let username: String?
    let displayName: String?
    let avatarUrl: String?
    let weeklyXp: Int
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case displayName = "display_name"
        case avatarUrl = "avatar_url"
        case weeklyXp = "weekly_xp"
        case rank
    }
}
