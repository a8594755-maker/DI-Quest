import Foundation

struct Achievement: Identifiable {
    let id: String
    let name: String
    let description: String
    let icon: String
    var isUnlocked: Bool
}
