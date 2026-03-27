import Foundation

enum WorldDataRegistry {
    /// All worlds across all branches, sorted by ID.
    static var allWorlds: [World] {
        (BusinessAnalysisWorlds.worlds)
            .sorted { $0.id < $1.id }
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
}
