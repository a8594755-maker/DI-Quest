import Foundation

struct World: Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let description: String
    let quests: [Quest]
}
