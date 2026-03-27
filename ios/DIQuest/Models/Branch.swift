import Foundation

struct Branch: Identifiable {
    let id: String
    let name: String
    let emoji: String
    let description: String
    let worldIds: [Int]
    let zhOnly: Bool

    init(id: String, name: String, emoji: String, description: String, worldIds: [Int], zhOnly: Bool = false) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.description = description
        self.worldIds = worldIds
        self.zhOnly = zhOnly
    }
}
