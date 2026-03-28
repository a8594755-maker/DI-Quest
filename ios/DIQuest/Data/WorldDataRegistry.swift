import Foundation

@MainActor
enum WorldDataRegistry {
    /// All worlds for the current language, sorted by ID.
    static var allWorlds: [World] {
        worlds(language: LanguageManager.shared.currentLanguage)
    }

    /// All worlds for a specific language.
    static func worlds(language: LanguageManager.Language) -> [World] {
        var all: [World] = []

        // Business Analysis (20 worlds)
        all += language == .en ? BusinessAnalysisWorldsEn.worlds : BusinessAnalysisWorlds.worlds

        // SQL (5 worlds)
        all += language == .en ? SqlWorldsEn.worlds : SqlWorlds.worlds

        // Python (8 worlds)
        all += language == .en ? PythonWorldsEn.worlds : PythonWorlds.worlds

        // DI Product (9 worlds)
        all += language == .en ? DiProductWorldsEn.worlds : DiProductWorlds.worlds

        // Professional English (6 worlds, zh only)
        all += ProfessionalEnglishWorlds.worlds

        // Supply Chain (8 worlds)
        all += language == .en ? SupplyChainWorldsEn.worlds : SupplyChainWorlds.worlds

        return all.sorted { $0.id < $1.id }
    }

    /// Worlds belonging to a specific branch.
    static func worlds(for branch: Branch) -> [World] {
        let idSet = Set(branch.worldIds)
        return allWorlds.filter { idSet.contains($0.id) }
    }

    /// Single world by ID.
    static func world(id: Int) -> World? {
        allWorlds.first { $0.id == id }
    }

    /// Get lesson content for a world.
    static func lesson(for worldId: Int) -> String? {
        let lang = LanguageManager.shared.currentLanguage
        // Try main LessonData first (BA worlds), then extra lessons
        return LessonData.lesson(for: worldId, language: lang)
            ?? LessonData.additionalLesson(for: worldId, language: lang)
    }
}
