import Foundation

struct Branch: Identifiable {
    let id: String
    let name: String
    let nameEn: String
    let emoji: String
    let description: String
    let descriptionEn: String
    let worldIds: [Int]
    let zhOnly: Bool

    init(id: String, name: String, nameEn: String = "", emoji: String, description: String, descriptionEn: String = "", worldIds: [Int], zhOnly: Bool = false) {
        self.id = id
        self.name = name
        self.nameEn = nameEn.isEmpty ? name : nameEn
        self.emoji = emoji
        self.description = description
        self.descriptionEn = descriptionEn.isEmpty ? description : descriptionEn
        self.worldIds = worldIds
        self.zhOnly = zhOnly
    }

    @MainActor var localizedName: String {
        LanguageManager.shared.isEnglish ? nameEn : name
    }

    @MainActor var localizedDescription: String {
        LanguageManager.shared.isEnglish ? descriptionEn : description
    }
}
