import Foundation

struct UserProfile: Codable {
    let id: String
    var username: String?
    var displayName: String?
    var avatarUrl: String?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case displayName = "display_name"
        case avatarUrl = "avatar_url"
        case createdAt = "created_at"
    }
}
