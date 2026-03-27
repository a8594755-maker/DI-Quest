import Foundation

struct Quest: Identifiable {
    let id: String
    let name: String
    let description: String
    let xp: Int
    let isBoss: Bool
    let challenges: [Challenge]
}
