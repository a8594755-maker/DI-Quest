import Foundation

struct ChatMessage: Identifiable, Codable {
    let id: UUID
    let role: Role
    let content: String
    let timestamp: Date

    enum Role: String, Codable {
        case user
        case assistant
    }

    init(role: Role, content: String) {
        self.id = UUID()
        self.role = role
        self.content = content
        self.timestamp = Date()
    }
}

struct ChatSession: Identifiable, Codable {
    let id: UUID
    var title: String
    var messages: [ChatMessage]
    let createdAt: Date
    var updatedAt: Date

    init(title: String = "", messages: [ChatMessage] = []) {
        self.id = UUID()
        self.title = title
        self.messages = messages
        self.createdAt = Date()
        self.updatedAt = Date()
    }

    mutating func updateTitle() {
        if let firstUserMsg = messages.first(where: { $0.role == .user }) {
            title = String(firstUserMsg.content.prefix(40))
        }
    }
}
