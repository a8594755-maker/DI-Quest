import Foundation

struct Friendship: Identifiable, Codable {
    let id: String
    let userId: String
    let friendId: String
    let status: FriendStatus
    let createdAt: String?

    enum FriendStatus: String, Codable {
        case pending
        case accepted
        case declined
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case friendId = "friend_id"
        case status
        case createdAt = "created_at"
    }
}
